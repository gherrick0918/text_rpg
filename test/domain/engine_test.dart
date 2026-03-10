import 'package:flutter_test/flutter_test.dart';
import 'package:text_rpg/domain/models/character_stats.dart';
import 'package:text_rpg/domain/models/player.dart';
import 'package:text_rpg/domain/models/enemy.dart';
import 'package:text_rpg/domain/engine/dice.dart';
import 'package:text_rpg/domain/engine/luck_system.dart';
import 'package:text_rpg/domain/engine/check_system.dart';
import 'package:text_rpg/domain/engine/combat_engine.dart';

// Reusable test fixtures
CharacterStats testStats({
  int strength = 10,
  int stamina = 10,
  int agility = 10,
  int luck = 10,
  int charisma = 10,
  int wisdom = 10,
  int intelligence = 10,
}) {
  return CharacterStats(
    strength: strength,
    stamina: stamina,
    agility: agility,
    luck: luck,
    charisma: charisma,
    wisdom: wisdom,
    intelligence: intelligence,
  );
}

Player testPlayer({CharacterStats? stats}) {
  return Player(id: 'player_1', name: 'Test Hero', stats: stats ?? testStats());
}

Enemy testEnemy({
  CharacterStats? stats,
  EnemyBehavior behavior = EnemyBehavior.aggressive,
}) {
  return Enemy(
    id: 'enemy_1',
    name: 'Test Goblin',
    description: 'A test enemy.',
    stats: stats ?? testStats(strength: 8, stamina: 8, agility: 8, luck: 5),
    damageDice: '1d4',
    armorValue: 1,
    tier: 1,
    behavior: behavior,
    lootTable: [],
    conflictTags: ['epic'],
    regionTags: ['dungeon'],
    xpValue: 25,
  );
}

void main() {
  // -------------------------------------------------------
  // CharacterStats
  // -------------------------------------------------------
  group('CharacterStats', () {
    test('derived stats calculate correctly from stamina', () {
      final stats = testStats(stamina: 10);
      expect(stats.maxHealth, equals(50));
      expect(stats.maxActionPoints, equals(3));
    });

    test('maxActionPoints rounds up for odd stamina values', () {
      final stats = testStats(stamina: 9);
      expect(stats.maxActionPoints, equals(3));
      final stats2 = testStats(stamina: 5);
      expect(stats2.maxActionPoints, equals(2));
    });

    test('stat bonuses calculate correctly', () {
      final stats = testStats(strength: 10, agility: 20, wisdom: 1);
      expect(stats.strengthBonus, equals(0)); // 10 is neutral
      expect(stats.agilityBonus, equals(5)); // 20 = +5
      expect(
        stats.wisdomBonus,
        equals(-4),
      ); // 1 = -4 (Dart truncates toward zero)
    });

    test('validation rejects out of range stats', () {
      final invalid = CharacterStats(
        strength: 21,
        stamina: 10,
        agility: 10,
        luck: 10,
        charisma: 10,
        wisdom: 10,
        intelligence: 10,
      );
      expect(invalid.isValid, isFalse);
    });

    test('validation accepts valid stats', () {
      expect(testStats().isValid, isTrue);
    });

    test('copyWith produces updated instance', () {
      final stats = testStats(strength: 10);
      final updated = stats.copyWith(strength: 15);
      expect(updated.strength, equals(15));
      expect(updated.stamina, equals(stats.stamina));
    });
  });

  // -------------------------------------------------------
  // Player
  // -------------------------------------------------------
  group('Player', () {
    test('initialises at full health and action points', () {
      final player = testPlayer();
      expect(player.currentHealth, equals(player.maxHealth));
      expect(player.currentActionPoints, equals(player.maxActionPoints));
    });

    test('takeDamage reduces health correctly', () {
      final player = testPlayer();
      final damaged = player.takeDamage(10);
      expect(damaged.currentHealth, equals(player.maxHealth - 10));
    });

    test('takeDamage does not go below zero', () {
      final player = testPlayer();
      final damaged = player.takeDamage(9999);
      expect(damaged.currentHealth, equals(0));
      expect(damaged.isAlive, isFalse);
    });

    test('heal restores health correctly', () {
      final player = testPlayer();
      final damaged = player.takeDamage(20);
      final healed = damaged.heal(10);
      expect(healed.currentHealth, equals(damaged.currentHealth + 10));
    });

    test('heal does not exceed maxHealth', () {
      final player = testPlayer();
      final overhealed = player.heal(9999);
      expect(overhealed.currentHealth, equals(player.maxHealth));
    });

    test('isBloodied triggers at or below half health', () {
      final player = testPlayer();
      final halfDamage = (player.maxHealth / 2).round();
      final bloodied = player.takeDamage(halfDamage);
      expect(bloodied.isBloodied, isTrue);
    });

    test('spendActionPoints reduces AP correctly', () {
      final player = testPlayer();
      final spent = player.spendActionPoints(1);
      expect(spent.currentActionPoints, equals(player.maxActionPoints - 1));
    });

    test('spendActionPoints does not go below zero', () {
      final player = testPlayer();
      final spent = player.spendActionPoints(9999);
      expect(spent.currentActionPoints, equals(0));
    });

    test('refreshActionPoints restores to max', () {
      final player = testPlayer();
      final spent = player.spendActionPoints(9999);
      final refreshed = spent.refreshActionPoints();
      expect(refreshed.currentActionPoints, equals(player.maxActionPoints));
    });

    test('gainExperience accumulates correctly', () {
      final player = testPlayer();
      final withXp = player.gainExperience(50).gainExperience(50);
      expect(withXp.experience, equals(100));
    });

    test('canLevelUp triggers at correct threshold', () {
      final player = testPlayer();
      final ready = player.gainExperience(100); // Level 1 threshold = 100
      expect(ready.canLevelUp, isTrue);
    });
  });

  // -------------------------------------------------------
  // Dice
  // -------------------------------------------------------
  group('Dice', () {
    test('roll stays within bounds over many rolls', () {
      for (int i = 0; i < 1000; i++) {
        final result = Dice.roll(6);
        expect(result, greaterThanOrEqualTo(1));
        expect(result, lessThanOrEqualTo(6));
      }
    });

    test('rollMultiple sums correctly within bounds', () {
      for (int i = 0; i < 500; i++) {
        final result = Dice.rollMultiple(3, 6);
        expect(result, greaterThanOrEqualTo(3));
        expect(result, lessThanOrEqualTo(18));
      }
    });

    test('rollFromString parses and rolls correctly', () {
      for (int i = 0; i < 500; i++) {
        final result = Dice.rollFromString('2d8');
        expect(result, greaterThanOrEqualTo(2));
        expect(result, lessThanOrEqualTo(16));
      }
    });

    test('d20 stays within 1-20', () {
      for (int i = 0; i < 1000; i++) {
        final result = Dice.d20();
        expect(result, greaterThanOrEqualTo(1));
        expect(result, lessThanOrEqualTo(20));
      }
    });

    test('rollWithAdvantage is always >= rollWithDisadvantage on average', () {
      int advantageTotal = 0;
      int disadvantageTotal = 0;
      const iterations = 1000;
      for (int i = 0; i < iterations; i++) {
        advantageTotal += Dice.rollWithAdvantage(20);
        disadvantageTotal += Dice.rollWithDisadvantage(20);
      }
      expect(advantageTotal, greaterThan(disadvantageTotal));
    });
  });

  // -------------------------------------------------------
  // LuckSystem
  // -------------------------------------------------------
  group('LuckSystem', () {
    test('resolve returns a LuckResult for any valid luck score', () {
      for (int luck = 1; luck <= 20; luck++) {
        final result = LuckSystem.resolve(luck);
        expect(result, isNotNull);
      }
    });

    test('high luck biases positive over many trials', () {
      int positiveCount = 0;
      int negativeCount = 0;
      const iterations = 2000;

      for (int i = 0; i < iterations; i++) {
        final result = LuckSystem.resolve(20);
        if (result.type == LuckModifierType.positive) positiveCount++;
        if (result.type == LuckModifierType.negative) negativeCount++;
      }
      expect(positiveCount, greaterThan(negativeCount));
    });

    test('low luck biases negative over many trials', () {
      int positiveCount = 0;
      int negativeCount = 0;
      const iterations = 2000;

      for (int i = 0; i < iterations; i++) {
        final result = LuckSystem.resolve(1);
        if (result.type == LuckModifierType.positive) positiveCount++;
        if (result.type == LuckModifierType.negative) negativeCount++;
      }
      expect(negativeCount, greaterThan(positiveCount));
    });

    test('modifier magnitude stays within expected bounds', () {
      for (int i = 0; i < 1000; i++) {
        final result = LuckSystem.resolve(10);
        expect(result.modifier, greaterThanOrEqualTo(-5));
        expect(result.modifier, lessThanOrEqualTo(5));
      }
    });
  });

  // -------------------------------------------------------
  // CheckSystem
  // -------------------------------------------------------
  group('CheckSystem', () {
    test('resolve returns a CheckResult', () {
      final stats = testStats();
      final result = CheckSystem.resolve(
        attribute: CheckAttribute.strength,
        stats: stats,
        targetNumber: CheckSystem.moderate,
      );
      expect(result, isNotNull);
    });

    test('isSuccess reflects outcome correctly', () {
      final stats = testStats();
      final result = CheckSystem.resolve(
        attribute: CheckAttribute.strength,
        stats: stats,
        targetNumber: CheckSystem.moderate,
      );
      final shouldSucceed =
          result.outcome == CheckOutcome.success ||
          result.outcome == CheckOutcome.criticalSuccess;
      expect(result.isSuccess, equals(shouldSucceed));
    });

    test('very high stat succeeds against easy target most of the time', () {
      final stats = testStats(strength: 20);
      int successes = 0;
      const iterations = 200;
      for (int i = 0; i < iterations; i++) {
        final result = CheckSystem.resolve(
          attribute: CheckAttribute.strength,
          stats: stats,
          targetNumber: CheckSystem.easy,
        );
        if (result.isSuccess) successes++;
      }
      // With strength 20 (+5 bonus) against easy (8), should succeed well over half
      expect(successes, greaterThan(iterations * 0.7));
    });

    test('very low stat fails against hard target most of the time', () {
      final stats = testStats(strength: 1);
      int failures = 0;
      const iterations = 200;
      for (int i = 0; i < iterations; i++) {
        final result = CheckSystem.resolve(
          attribute: CheckAttribute.strength,
          stats: stats,
          targetNumber: CheckSystem.hard,
        );
        if (!result.isSuccess) failures++;
      }
      expect(failures, greaterThan(iterations * 0.7));
    });
  });

  // -------------------------------------------------------
  // CombatEngine
  // -------------------------------------------------------
  group('CombatEngine', () {
    test('beginCombat initialises state correctly', () {
      final player = testPlayer();
      final enemy = testEnemy();
      final state = CombatEngine.beginCombat(player: player, enemy: enemy);

      expect(state.round, equals(1));
      expect(state.combatOver, isFalse);
      expect(state.player.currentActionPoints, equals(player.maxActionPoints));
      expect(state.enemy.currentActionPoints, equals(enemy.maxActionPoints));
    });

    test('playerAttacks reduces enemy health on hit over many trials', () {
      int enemyTookDamage = 0;
      const iterations = 100;

      for (int i = 0; i < iterations; i++) {
        // High strength player vs low agility enemy — should hit often
        final player = testPlayer(stats: testStats(strength: 20));
        final enemy = testEnemy(stats: testStats(agility: 1));
        final state = CombatEngine.beginCombat(player: player, enemy: enemy);
        final result = CombatEngine.playerAttacks(state);
        if (result.enemy.currentHealth < enemy.maxHealth) enemyTookDamage++;
      }
      expect(enemyTookDamage, greaterThan(iterations * 0.7));
    });

    test('playerDefends sets defending flag', () {
      final state = CombatEngine.beginCombat(
        player: testPlayer(),
        enemy: testEnemy(),
      );
      final result = CombatEngine.playerDefends(state);
      expect(result.playerDefending, isTrue);
    });

    test('playerFlees succeeds for high agility player over many trials', () {
      int fleeSuccesses = 0;
      const iterations = 500; // More iterations = less variance

      for (int i = 0; i < iterations; i++) {
        final player = testPlayer(stats: testStats(agility: 20));
        final state = CombatEngine.beginCombat(
          player: player,
          enemy: testEnemy(),
        );
        final result = CombatEngine.playerFlees(state);
        if (result.combatOver && !result.playerWon) fleeSuccesses++;
      }
      // Agility 20 = +5 bonus vs target 14, needs 9+ on d20 = ~60% base rate
      expect(fleeSuccesses, greaterThan(iterations * 0.50));
    });

    test('combat ends when enemy reaches zero health', () {
      // Artificially weak enemy
      final weakEnemy = testEnemy(stats: testStats(stamina: 1, agility: 1));
      final strongPlayer = testPlayer(
        stats: testStats(strength: 20, stamina: 20),
      );

      var state = CombatEngine.beginCombat(
        player: strongPlayer,
        enemy: weakEnemy,
      );

      // Keep attacking until combat ends or round limit hit
      int safetyLimit = 50;
      while (!state.combatOver && safetyLimit > 0) {
        state = CombatEngine.playerAttacks(state);
        if (!state.combatOver) {
          state = CombatEngine.beginNextRound(state);
        }
        safetyLimit--;
      }

      expect(state.combatOver, isTrue);
      expect(state.playerWon, isTrue);
    });

    test('combat ends when player reaches zero health', () {
      final weakPlayer = testPlayer(stats: testStats(stamina: 1, agility: 1));
      final strongEnemy = testEnemy(
        stats: testStats(strength: 20, stamina: 20),
      );

      var state = CombatEngine.beginCombat(
        player: weakPlayer,
        enemy: strongEnemy,
      );

      int safetyLimit = 50;
      while (!state.combatOver && safetyLimit > 0) {
        state = CombatEngine.resolveEnemyTurn(state);
        if (!state.combatOver) {
          state = CombatEngine.beginNextRound(state);
        }
        safetyLimit--;
      }

      expect(state.combatOver, isTrue);
      expect(state.playerWon, isFalse);
    });

    test(
      'beginNextRound refreshes action points and clears defending flags',
      () {
        var state = CombatEngine.beginCombat(
          player: testPlayer(),
          enemy: testEnemy(),
        );
        state = CombatEngine.playerDefends(state);
        expect(state.playerDefending, isTrue);

        state = CombatEngine.beginNextRound(state);
        expect(state.playerDefending, isFalse);
        expect(
          state.player.currentActionPoints,
          equals(state.player.maxActionPoints),
        );
        expect(state.round, equals(2));
      },
    );

    test('combat log records actions', () {
      var state = CombatEngine.beginCombat(
        player: testPlayer(),
        enemy: testEnemy(),
      );
      state = CombatEngine.playerAttacks(state);
      expect(state.log.isNotEmpty, isTrue);
    });
  });
}
