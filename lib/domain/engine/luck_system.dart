import 'dice.dart';
import '../../core/logger/run_logger.dart';

enum LuckModifierType { positive, negative, none }

class LuckResult {
  final LuckModifierType type;
  final int modifier;

  const LuckResult({required this.type, required this.modifier});

  static const LuckResult none = LuckResult(
    type: LuckModifierType.none,
    modifier: 0,
  );
}

class LuckSystem {
  // Tuning constants — adjust these post-playtesting without touching logic
  static const double _triggerMultiplier = 2.5;
  static const double _magnitudeMultiplier = 0.4;

  // Core method — call this on any stat roll to get a luck modifier
  static LuckResult resolve(int luckScore) {
    final triggerChance = (luckScore * _triggerMultiplier).round().clamp(5, 95);

    if (!Dice.percentageCheck(triggerChance)) {
      RunLogger.info('LuckSystem', 
        'Luck $luckScore: ${triggerChance}% trigger chance failed → no modifier');
      return LuckResult.none;
    }

    // Luck triggered — determine direction and magnitude
    final magnitude = _calculateMagnitude(luckScore);
    final type = _determineDirection(luckScore);
    final modifier = type == LuckModifierType.positive ? magnitude : -magnitude;

    RunLogger.info('LuckSystem', 
      'Luck $luckScore: triggered (${triggerChance}%) → ${type.name} ${modifier.abs()} '
      '(=${modifier > 0 ? "+" : ""}$modifier)');

    return LuckResult(
      type: type,
      modifier: modifier,
    );
  }

  // Higher luck = bigger potential bonus when it triggers
  static int _calculateMagnitude(int luckScore) {
    final raw = (luckScore * _magnitudeMultiplier).round();
    return raw.clamp(1, 5);
  }

  // High luck biases positive, low luck biases negative
  // Luck 10 is roughly 50/50, luck 20 is heavily positive, luck 1 is heavily negative
  static LuckModifierType _determineDirection(int luckScore) {
    // Positive chance scales from ~5% at luck 1 to ~95% at luck 20
    final positiveChance = ((luckScore / 20) * 90 + 5).round();
    return Dice.percentageCheck(positiveChance)
        ? LuckModifierType.positive
        : LuckModifierType.negative;
  }

  // Convenience method — apply luck to an existing roll result
  static int applyToRoll(int rollResult, int luckScore) {
    final result = resolve(luckScore);
    return rollResult + result.modifier;
  }
}