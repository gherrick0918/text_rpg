import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/player.dart';
import '../../domain/models/character_stats.dart';
import '../../domain/models/room.dart';
import '../../domain/models/enemy.dart';
import '../../domain/engine/combat_engine.dart';
import '../../data/repositories/enemy_repository.dart';
import '../../data/repositories/room_repository.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/drift_enemy_repository.dart';
import '../../data/repositories/drift_room_repository.dart';
import '../state/campaign_state.dart';

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

// --- Campaign notifier ---

class CampaignNotifier extends Notifier<CampaignState?> {
  @override
  CampaignState? build() => null; // null = no active campaign

  // Start a new campaign
  void startCampaign({
    required String playerName,
    required CharacterStats stats,
    required CampaignLength campaignLength,
    ConflictType? selectedConflictType,
  }) {
    final player = Player(id: 'player_1', name: playerName, stats: stats);

    state = CampaignState(
      player: player,
      campaignLength: campaignLength,
      selectedConflictType: selectedConflictType,
      phase: CampaignPhase.exploration,
      gold: 10,
    );
  }

  // Enter a room
  void enterRoom(Room room) {
    final current = state;
    if (current == null) return;
    state = current.enterRoom(room);
  }

  // Begin a combat encounter
  void beginCombat(Enemy enemy) {
    final current = state;
    if (current == null) return;
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

    // Resolve player action
    var combat = action(current.activeCombat!);

    // If combat not over, resolve enemy turn
    if (!combat.combatOver) {
      combat = CombatEngine.resolveEnemyTurn(combat);
    }

    // If combat not over, begin next round
    if (!combat.combatOver) {
      combat = CombatEngine.beginNextRound(combat);
    }

    // Update campaign state with combat result
    var updated = current.updateCombat(combat);

    // Handle combat resolution
    if (combat.combatOver) {
      if (combat.playerWon) {
        // Award XP
        final xp = current.activeCombat!.enemy.xpValue;
        final updatedPlayer = current.player.gainExperience(xp);
        updated = updated
            .updatePlayer(updatedPlayer)
            .endCombat()
            .copyWith(phase: CampaignPhase.exploration);

        // Check for level up
        if (updatedPlayer.canLevelUp) {
          updated = updated.copyWith(phase: CampaignPhase.levelUp);
        }
      } else if (!combat.playerWon &&
          !current.activeCombat!.log.last.resultType.toString().contains(
            'fled',
          )) {
        // Player died
        updated = updated.copyWith(phase: CampaignPhase.gameOver);
      } else {
        // Player fled
        updated = updated.endCombat();
      }
    }

    state = updated;
  }

  // Level up — apply stat increase
  void levelUp(String statToIncrease) {
    final current = state;
    if (current == null) return;

    final stats = current.player.stats;
    final updatedStats = _incrementStat(stats, statToIncrease);
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

  // Faction and conflict
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
    if (current == null) return;

    final roomRepo = ref.read(roomRepositoryProvider);
    final room = await roomRepo.getRandomRoom(
      conflictTags: [current.activeConflictType.name],
      excludeIds: current.visitedRoomIds,
    );

    if (room == null) return;

    state = current.copyWith(
      currentRoom: room,
      visitedRoomIds: [...current.visitedRoomIds, room.id],
      sessionTurn: current.sessionTurn + 1,
    );
  }

  Future<Enemy?> spawnEnemy() async {
    final current = state;
    if (current == null) return null;

    final enemyRepo = ref.read(enemyRepositoryProvider);
    final tier = _tierForLevel(current.player.level);
    final regionTag = current.currentRoom?.region ?? 'wilderness';

    return enemyRepo.getRandomEnemy(
      tier: tier,
      regionTags: [regionTag],
      conflictTags: [current.activeConflictType.name],
    );
  }

  int _tierForLevel(int level) {
    if (level <= 3) return 1;
    if (level <= 6) return 2;
    return 3;
  }
}

// --- Campaign provider ---

final campaignProvider = NotifierProvider<CampaignNotifier, CampaignState?>(() {
  return CampaignNotifier();
});

// --- Derived providers for UI convenience ---

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
