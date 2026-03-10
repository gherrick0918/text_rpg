import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_rpg/application/providers/campaign_provider.dart';
import 'package:text_rpg/application/state/campaign_state.dart';
import 'package:text_rpg/data/database/app_database.dart';
import 'package:text_rpg/domain/models/character_stats.dart';
import 'package:text_rpg/domain/models/enemy.dart';
import 'package:text_rpg/domain/models/room.dart';

ProviderContainer buildTestContainer() {
  return ProviderContainer(
    overrides: [
      databaseProvider.overrideWith((ref) {
        final db = AppDatabase.forTesting(NativeDatabase.memory());
        ref.onDispose(() => db.close());
        return db;
      }),
    ],
  );
}

// Test fixtures
CharacterStats balancedStats() => const CharacterStats(
      strength: 12,
      stamina: 12,
      agility: 10,
      luck: 10,
      charisma: 8,
      wisdom: 8,
      intelligence: 8,
    );

CharacterStats strongStats() => const CharacterStats(
      strength: 20,
      stamina: 20,
      agility: 10,
      luck: 10,
      charisma: 8,
      wisdom: 8,
      intelligence: 8,
    );

Room testRoom() => const Room(
      id: 'room_001',
      name: 'The Crumbling Watchtower',
      region: 'wilderness',
      description: 'A moss-covered tower leaning against the wind.',
      atmosphere: 'tense',
      conflictTags: ['epic'],
      encounterEligible: true,
      lootEligible: true,
    );

Enemy weakEnemy() => Enemy(
      id: 'enemy_001',
      name: 'Cave Rat',
      description: 'A large aggressive rat.',
      stats: const CharacterStats(
        strength: 4,
        stamina: 4,
        agility: 4,
        luck: 2,
        charisma: 1,
        wisdom: 2,
        intelligence: 1,
      ),
      damageDice: '1d2',
      armorValue: 0,
      tier: 1,
      behavior: EnemyBehavior.aggressive,
      lootTable: const [],
      conflictTags: const ['epic'],
      regionTags: const ['dungeon'],
      xpValue: 25,
    );

void main() {
  group('CampaignNotifier', () {
    test('initial state is null', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      final state = container.read(campaignProvider);
      expect(state, isNull);
    });

    test('startCampaign creates a valid campaign state', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: balancedStats(),
            campaignLength: CampaignLength.short,
          );

      final state = container.read(campaignProvider);
      expect(state, isNotNull);
      expect(state!.player.name, equals('Aldric'));
      expect(state.campaignLength, equals(CampaignLength.short));
      expect(state.phase, equals(CampaignPhase.exploration));
      expect(state.gold, equals(10));
    });

    test('startCampaign with selected conflict type stores it', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: balancedStats(),
            campaignLength: CampaignLength.medium,
            selectedConflictType: ConflictType.political,
          );

      final state = container.read(campaignProvider);
      expect(state!.selectedConflictType, equals(ConflictType.political));
      expect(state.activeConflictType, equals(ConflictType.political));
    });

    test('enterRoom updates current room and visited list', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: balancedStats(),
            campaignLength: CampaignLength.short,
          );

      container.read(campaignProvider.notifier).enterRoom(testRoom());

      final state = container.read(campaignProvider);
      expect(state!.currentRoom, isNotNull);
      expect(state.currentRoom!.id, equals('room_001'));
      expect(state.visitedRoomIds, contains('room_001'));
      expect(state.sessionTurn, equals(1));
    });

    test('visiting same room twice does not duplicate visited list', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: balancedStats(),
            campaignLength: CampaignLength.short,
          );

      container.read(campaignProvider.notifier).enterRoom(testRoom());
      container.read(campaignProvider.notifier).enterRoom(testRoom());

      final state = container.read(campaignProvider);
      expect(state!.visitedRoomIds.where((id) => id == 'room_001').length, equals(1));
    });

    test('beginCombat sets combat phase and active combat', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: balancedStats(),
            campaignLength: CampaignLength.short,
          );

      container.read(campaignProvider.notifier).beginCombat(weakEnemy());

      final state = container.read(campaignProvider);
      expect(state!.phase, equals(CampaignPhase.combat));
      expect(state.activeCombat, isNotNull);
      expect(state.isInCombat, isTrue);
    });

    test('full combat loop — strong player defeats weak enemy', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: strongStats(),
            campaignLength: CampaignLength.short,
          );

      container.read(campaignProvider.notifier).beginCombat(weakEnemy());

      // Attack until combat ends
      int safetyLimit = 50;
      while (container.read(campaignProvider)!.isInCombat &&
          safetyLimit > 0) {
        container.read(campaignProvider.notifier).playerAttacks();
        safetyLimit--;
      }

      final state = container.read(campaignProvider);
      expect(state!.phase, isNot(equals(CampaignPhase.combat)));
      expect(state.player.experience, greaterThan(0));
    });

    test('defeating enemy awards correct XP', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: strongStats(),
            campaignLength: CampaignLength.short,
          );

      container.read(campaignProvider.notifier).beginCombat(weakEnemy());

      int safetyLimit = 50;
      while (container.read(campaignProvider)!.isInCombat &&
          safetyLimit > 0) {
        container.read(campaignProvider.notifier).playerAttacks();
        safetyLimit--;
      }

      final state = container.read(campaignProvider);
      // Should have gained exactly the enemy's xpValue
      expect(state!.player.experience, equals(weakEnemy().xpValue));
    });

    test('conflict weights update correctly', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: balancedStats(),
            campaignLength: CampaignLength.short,
          );

      container.read(campaignProvider.notifier)
          .nudgeConflictWeight(ConflictType.political, 5);
      container.read(campaignProvider.notifier)
          .nudgeConflictWeight(ConflictType.political, 3);

      final state = container.read(campaignProvider);
      expect(state!.conflictWeights.political, equals(8));
      expect(state.activeConflictType, equals(ConflictType.political));
    });

    test('faction reputation adjusts correctly', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: balancedStats(),
            campaignLength: CampaignLength.short,
          );

      container.read(campaignProvider.notifier)
          .adjustFactionReputation('faction_001', 15);

      final state = container.read(campaignProvider);
      final rep = state!.factionReputations['faction_001'];
      expect(rep, isNotNull);
      expect(rep!.reputation, equals(15));
      expect(rep.standing, equals('friendly'));
    });

    test('quest completion moves quest from active to completed', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: balancedStats(),
            campaignLength: CampaignLength.short,
          );

      // Manually add active quest then complete it
      final notifier = container.read(campaignProvider.notifier);
      notifier.completeQuest('quest_001');

      final state = container.read(campaignProvider);
      expect(state!.completedQuestIds, contains('quest_001'));
      expect(state.activeQuestIds, isNot(contains('quest_001')));
    });

    test('level up increments stat and level', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: strongStats(),
            campaignLength: CampaignLength.short,
          );

      // Defeat enough enemies to level up (need 100 XP at level 1)
      // weakEnemy gives 25 XP so defeat 4
      for (int i = 0; i < 4; i++) {
        container.read(campaignProvider.notifier).beginCombat(weakEnemy());
        int safety = 50;
        while (container.read(campaignProvider)!.isInCombat && safety > 0) {
          container.read(campaignProvider.notifier).playerAttacks();
          safety--;
        }
      }

      final preState = container.read(campaignProvider);
      expect(preState!.phase, equals(CampaignPhase.levelUp));

      container.read(campaignProvider.notifier).levelUp('strength');

      final postState = container.read(campaignProvider);
      expect(postState!.player.level, equals(2));
      expect(postState.phase, equals(CampaignPhase.exploration));
    });

    test('endCampaign resets state to null', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: balancedStats(),
            campaignLength: CampaignLength.short,
          );

      container.read(campaignProvider.notifier).endCampaign();

      expect(container.read(campaignProvider), isNull);
    });

    test('derived playerProvider reflects current player', () {
      final container = buildTestContainer();
      addTearDown(container.dispose);

      expect(container.read(playerProvider), isNull);

      container.read(campaignProvider.notifier).startCampaign(
            playerName: 'Aldric',
            stats: balancedStats(),
            campaignLength: CampaignLength.short,
          );

      expect(container.read(playerProvider), isNotNull);
      expect(container.read(playerProvider)!.name, equals('Aldric'));
    });
  });
}