import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/player.dart';
import '../../domain/models/character_stats.dart';
import '../../domain/models/room.dart';
import '../../domain/models/enemy.dart';
import '../../domain/engine/combat_engine.dart';
import '../../data/repositories/enemy_repository.dart';
import '../../data/repositories/room_repository.dart';
import '../../data/repositories/quest_repository.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/drift_enemy_repository.dart';
import '../../data/repositories/drift_room_repository.dart';
import '../../data/repositories/drift_quest_repository.dart';
import '../state/campaign_state.dart';
import '../../core/logger/run_logger.dart';

// --- Database provider ---

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

// --- Repository providers ---

final roomRepositoryProvider = Provider<RoomRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DriftRoomRepository(db);
});

final enemyRepositoryProvider = Provider<EnemyRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DriftEnemyRepository(db);
});

final questRepositoryProvider = Provider<QuestRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DriftQuestRepository(db);
});

// --- Campaign notifier ---

class CampaignNotifier extends Notifier<CampaignState?> {
  @override
  CampaignState? build() => null;

  void startCampaign({
    required String playerName,
    required CharacterStats stats,
    required CampaignLength campaignLength,
    ConflictType? selectedConflictType,
  }) {
    RunLogger.info('CampaignProvider', 
      'Starting new campaign: player="$playerName", campaign=${campaignLength.name}, '
      'conflict=${selectedConflictType?.name ?? "none"}, stats=[Str:${stats.strength} '
      'Sta:${stats.stamina} Agi:${stats.agility} Luk:${stats.luck} Cha:${stats.charisma} '
      'Wis:${stats.wisdom} Int:${stats.intelligence}]');
    
    final player = Player(id: 'player_1', name: playerName, stats: stats);
    state = CampaignState(
      player: player,
      campaignLength: campaignLength,
      selectedConflictType: selectedConflictType,
      phase: CampaignPhase.exploration,
      gold: 10,
    );
    
    RunLogger.info('CampaignProvider', 'Campaign initialized → exploration phase');
  }

  void enterRoom(Room room) {
    final current = state;
    if (current == null) {
      RunLogger.warn('CampaignProvider', 'enterRoom called with no active campaign');
      return;
    }
    
    RunLogger.info('CampaignProvider', 
      'Entering room: "${room.name}" (${room.region}) - Turn ${current.sessionTurn + 1}');
    
    state = current.enterRoom(room);
  }

  void beginCombat(Enemy enemy) {
    final current = state;
    if (current == null) {
      RunLogger.warn('CampaignProvider', 'beginCombat called with no active campaign');
      return;
    }
    
    RunLogger.info('CampaignProvider', 
      'Combat initiated: Player(L${current.player.level} ${current.player.currentHealth}HP '
      '${current.player.currentActionPoints}AP) vs "${enemy.name}" '
      '(T${enemy.tier} ${enemy.currentHealth}HP ${enemy.armorValue}AC)');
    
    final combatState = CombatEngine.beginCombat(
      player: current.player,
      enemy: enemy,
    );
    state = current.beginCombat(combatState);
  }

  // Player combat actions
  void playerAttacks() => _resolveCombatAction(CombatEngine.playerAttacks);
  void playerDefends() => _resolveCombatAction(CombatEngine.playerDefends);
  void playerFlees() => _resolveCombatAction(CombatEngine.playerFlees);
  void playerMoves() => _resolveCombatAction(CombatEngine.playerMoves);

  void _resolveCombatAction(CombatState Function(CombatState) action) {
    final current = state;
    if (current == null || !current.isInCombat) return;

    var combat = action(current.activeCombat!);

    if (!combat.combatOver) {
      combat = CombatEngine.resolveEnemyTurn(combat);
    }

    if (!combat.combatOver) {
      combat = CombatEngine.beginNextRound(combat);
    }

    var updated = current.updateCombat(combat);

    if (combat.combatOver) {
      if (combat.playerWon) {
        RunLogger.info('CampaignProvider', 
          'Combat victory: Player defeated "${combat.enemy.name}" '
          '(${combat.enemy.xpValue} XP pending) after ${combat.round} round(s)');
        // Park on combatVictory — keep activeCombat alive so the victory screen
        // can read the enemy name, XP value, and final log entries.
        // XP award and AP restore happen in acknowledgeVictory() when the
        // player taps Continue, not here.
        updated = updated.copyWith(phase: CampaignPhase.combatVictory);
      } else {
        final lastEntry = combat.log.isNotEmpty ? combat.log.last : null;
        final playerFled = lastEntry?.resultType == CombatResultType.fled;

        if (playerFled) {
          RunLogger.info('CampaignProvider', 
            'Player fled from "${combat.enemy.name}" - AP restored');
          // Restore AP after fleeing so the player isn't punished on return
          final restoredPlayer = current.player.refreshActionPoints();
          updated = updated.updatePlayer(restoredPlayer).endCombat();
        } else {
          RunLogger.info('CampaignProvider', 
            'Player defeated by "${combat.enemy.name}" after ${combat.round} round(s) → game over');
          updated = updated.copyWith(phase: CampaignPhase.gameOver);
        }
      }
    }

    state = updated;
  }

  /// Called by the victory screen's Continue button.
  /// Awards XP, restores AP, clears combat, and advances to exploration
  /// (or levelUp if the player earned enough XP).
  void acknowledgeVictory() {
    final current = state;
    if (current == null || current.activeCombat == null) {
      RunLogger.warn('CampaignProvider', 'acknowledgeVictory called with no active combat');
      return;
    }

    final xp = current.activeCombat!.enemy.xpValue;
    final oldXP = current.player.experience;
    final oldLevel = current.player.level;
    
    RunLogger.info('CampaignProvider', 
      'Victory acknowledged: Awarding ${xp} XP (${oldXP} → ${oldXP + xp})');
    
    final updatedPlayer = current.player
        .gainExperience(xp)
        .refreshActionPoints();

    var updated = current
        .updatePlayer(updatedPlayer)
        .endCombat()
        .copyWith(phase: CampaignPhase.exploration);

    if (updatedPlayer.canLevelUp) {
      RunLogger.info('CampaignProvider', 
        'Level up available: L${oldLevel} → L${updatedPlayer.level + 1}');
      updated = updated.copyWith(phase: CampaignPhase.levelUp);
    }

    state = updated;
  }

  // Level up
  void levelUp(String statToIncrease) {
    final current = state;
    if (current == null) {
      RunLogger.warn('CampaignProvider', 'levelUp called with no active campaign');
      return;
    }

    final oldLevel = current.player.level;
    final stats = current.player.stats;
    final updatedStats = _incrementStat(stats, statToIncrease);
    
    RunLogger.info('CampaignProvider', 
      'Level up: L${oldLevel} → L${oldLevel + 1}, increased $statToIncrease '
      '(${_getStatValue(stats, statToIncrease)} → ${_getStatValue(updatedStats, statToIncrease)})');
    
    final updatedPlayer = current.player.copyWith(
      stats: updatedStats,
      level: current.player.level + 1,
      experience:
          current.player.experience - current.player.experienceToNextLevel,
    );

    state = current
        .updatePlayer(updatedPlayer)
        .copyWith(phase: CampaignPhase.exploration);
  }

  CharacterStats _incrementStat(CharacterStats stats, String stat) {
    switch (stat) {
      case 'strength':
        return stats.copyWith(strength: (stats.strength + 1).clamp(1, 20));
      case 'stamina':
        return stats.copyWith(stamina: (stats.stamina + 1).clamp(1, 20));
      case 'agility':
        return stats.copyWith(agility: (stats.agility + 1).clamp(1, 20));
      case 'luck':
        return stats.copyWith(luck: (stats.luck + 1).clamp(1, 20));
      case 'charisma':
        return stats.copyWith(charisma: (stats.charisma + 1).clamp(1, 20));
      case 'wisdom':
        return stats.copyWith(wisdom: (stats.wisdom + 1).clamp(1, 20));
      case 'intelligence':
        return stats.copyWith(
          intelligence: (stats.intelligence + 1).clamp(1, 20),
        );
      default:
        return stats;
    }
  }
  
  int _getStatValue(CharacterStats stats, String stat) {
    switch (stat) {
      case 'strength': return stats.strength;
      case 'stamina': return stats.stamina;
      case 'agility': return stats.agility;
      case 'luck': return stats.luck;
      case 'charisma': return stats.charisma;
      case 'wisdom': return stats.wisdom;
      case 'intelligence': return stats.intelligence;
      default: return 0;
    }
  }

  void adjustFactionReputation(String factionId, int amount) {
    final current = state;
    if (current == null) return;
    state = current.adjustFactionReputation(factionId, amount);
  }

  void nudgeConflictWeight(ConflictType type, int amount) {
    final current = state;
    if (current == null) return;
    state = current.nudgeConflictWeight(type, amount);
  }

  void completeQuest(String questId) {
    final current = state;
    if (current == null) return;
    state = current.completeQuest(questId);
  }

  void addGold(int amount) {
    final current = state;
    if (current == null) return;
    state = current.copyWith(gold: current.gold + amount);
  }

  void endCampaign() {
    state = null;
  }

  Future<void> exploreRoom() async {
    final current = state;
    if (current == null) {
      RunLogger.warn('CampaignProvider', 'exploreRoom called with no active campaign');
      return;
    }

    RunLogger.info('CampaignProvider', 
      'Exploring room: conflict=${current.activeConflictType.name}, '
      'visited=${current.visitedRoomIds.length} rooms');

    final roomRepo = ref.read(roomRepositoryProvider);
    final room = await roomRepo.getRandomRoom(
      conflictTags: [current.activeConflictType.name],
      excludeIds: current.visitedRoomIds,
    );

    if (room == null) {
      RunLogger.warn('CampaignProvider', 'No room found matching exploration criteria');
      return;
    }

    RunLogger.info('CampaignProvider', 
      'Room selected: "${room.name}" (${room.region}) - '
      'eligible: encounter=${room.encounterEligible}, loot=${room.lootEligible}');

    state = current.copyWith(
      currentRoom: room,
      visitedRoomIds: [...current.visitedRoomIds, room.id],
      sessionTurn: current.sessionTurn + 1,
    );
  }

  Future<Enemy?> spawnEnemy() async {
    final current = state;
    if (current == null) {
      RunLogger.warn('CampaignProvider', 'spawnEnemy called with no active campaign');
      return null;
    }

    final enemyRepo = ref.read(enemyRepositoryProvider);
    final tier = _tierForLevel(current.player.level);
    final regionTag = current.currentRoom?.region ?? 'wilderness';

    RunLogger.info('CampaignProvider', 
      'Spawning enemy: player_level=${current.player.level} → tier=$tier, '
      'region=$regionTag, conflict=${current.activeConflictType.name}');

    final enemy = await enemyRepo.getRandomEnemy(
      tier: tier,
      regionTags: [regionTag],
      conflictTags: [current.activeConflictType.name],
    );
    
    if (enemy == null) {
      RunLogger.warn('CampaignProvider', 
        'No enemy found matching spawn criteria (tier=$tier, region=$regionTag)');
    } else {
      RunLogger.info('CampaignProvider', 
        'Enemy spawned: "${enemy.name}" (T${enemy.tier} ${enemy.currentHealth}HP '
        '${enemy.armorValue}AC ${enemy.behavior.name})');
    }

    return enemy;
  }

  int _tierForLevel(int level) {
    if (level <= 3) return 1;
    if (level <= 6) return 2;
    return 3;
  }
}

// --- Providers ---

final campaignProvider = NotifierProvider<CampaignNotifier, CampaignState?>(() {
  return CampaignNotifier();
});

final playerProvider = Provider<Player?>((ref) {
  return ref.watch(campaignProvider)?.player;
});

final currentPhaseProvider = Provider<CampaignPhase?>((ref) {
  return ref.watch(campaignProvider)?.phase;
});

final activeCombatProvider = Provider<CombatState?>((ref) {
  return ref.watch(campaignProvider)?.activeCombat;
});

final conflictTypeProvider = Provider<ConflictType?>((ref) {
  return ref.watch(campaignProvider)?.activeConflictType;
});
