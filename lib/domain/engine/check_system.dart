import '../models/character_stats.dart';
import 'dice.dart';
import 'luck_system.dart';
import '../../core/logger/run_logger.dart';

enum CheckAttribute {
  strength,
  stamina,
  agility,
  luck,
  charisma,
  wisdom,
  intelligence,
}

enum CheckOutcome { criticalSuccess, success, failure, criticalFailure }

class CheckResult {
  final int rawRoll;
  final int statBonus;
  final LuckResult luckResult;
  final int finalTotal;
  final int targetNumber;
  final CheckOutcome outcome;
  final CheckAttribute attribute;

  const CheckResult({
    required this.rawRoll,
    required this.statBonus,
    required this.luckResult,
    required this.finalTotal,
    required this.targetNumber,
    required this.outcome,
    required this.attribute,
  });

  bool get isSuccess =>
      outcome == CheckOutcome.success ||
      outcome == CheckOutcome.criticalSuccess;

  bool get isCritical =>
      outcome == CheckOutcome.criticalSuccess ||
      outcome == CheckOutcome.criticalFailure;
}

class CheckSystem {
  // Target numbers for difficulty levels
  static const int trivial = 5;
  static const int easy = 8;
  static const int moderate = 12;
  static const int hard = 16;
  static const int formidable = 19;
  static const int legendary = 22;

  // Core check — roll d20, add stat bonus, apply luck, compare to target
  static CheckResult resolve({
    required CheckAttribute attribute,
    required CharacterStats stats,
    required int targetNumber,
  }) {
    final rawRoll = Dice.d20();
    final statBonus = _getBonusForAttribute(attribute, stats);
    final luckResult = LuckSystem.resolve(stats.luck);

    final finalTotal = rawRoll + statBonus + luckResult.modifier;

    final outcome = _determineOutcome(rawRoll, finalTotal, targetNumber);

    RunLogger.info('CheckSystem', 
      '${attribute.name} check: d20=$rawRoll + stat=$statBonus + luck=${luckResult.modifier} '
      '= $finalTotal vs $targetNumber → ${outcome.name}');

    return CheckResult(
      rawRoll: rawRoll,
      statBonus: statBonus,
      luckResult: luckResult,
      finalTotal: finalTotal,
      targetNumber: targetNumber,
      outcome: outcome,
      attribute: attribute,
    );
  }

  // Opposed check — two characters rolling against each other
  static CheckResult resolveOpposed({
    required CheckAttribute attribute,
    required CharacterStats actorStats,
    required CharacterStats opposingStats,
  }) {
    // Opposing stats generate a target number from their own roll
    final opposingRoll = Dice.d20();
    final opposingBonus = _getBonusForAttribute(attribute, opposingStats);
    final targetNumber = opposingRoll + opposingBonus;
    
    RunLogger.info('CheckSystem', 
      'Opposed ${attribute.name} check: opponent rolled d20=$opposingRoll + $opposingBonus = $targetNumber');

    return resolve(
      attribute: attribute,
      stats: actorStats,
      targetNumber: targetNumber,
    );
  }

  static int _getBonusForAttribute(
      CheckAttribute attribute, CharacterStats stats) {
    switch (attribute) {
      case CheckAttribute.strength:
        return stats.strengthBonus;
      case CheckAttribute.stamina:
        return stats.staminaBonus;
      case CheckAttribute.agility:
        return stats.agilityBonus;
      case CheckAttribute.luck:
        return stats.luckBonus;
      case CheckAttribute.charisma:
        return stats.charismaBonus;
      case CheckAttribute.wisdom:
        return stats.wisdomBonus;
      case CheckAttribute.intelligence:
        return stats.intelligenceBonus;
    }
  }

  static CheckOutcome _determineOutcome(
      int rawRoll, int finalTotal, int targetNumber) {
    // Natural 20 is always a critical success regardless of total
    if (rawRoll == 20) return CheckOutcome.criticalSuccess;
    // Natural 1 is always a critical failure regardless of total
    if (rawRoll == 1) return CheckOutcome.criticalFailure;
    // Otherwise compare final total to target
    if (finalTotal >= targetNumber + 5) return CheckOutcome.criticalSuccess;
    if (finalTotal >= targetNumber) return CheckOutcome.success;
    return CheckOutcome.failure;
  }
}