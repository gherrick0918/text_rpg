import 'dart:math';

class Dice {
  static final Random _random = Random();

  // Roll a single die with the given number of sides
  static int roll(int sides) {
    assert(sides > 0, 'Dice must have at least 1 side');
    return _random.nextInt(sides) + 1;
  }

  // Roll multiple dice and sum the results — e.g. rollMultiple(3, 6) = 3d6
  static int rollMultiple(int count, int sides) {
    assert(count > 0, 'Must roll at least 1 die');
    int total = 0;
    for (int i = 0; i < count; i++) {
      total += roll(sides);
    }
    return total;
  }

  // Parse and roll a dice string like "2d6", "1d8", "3d4"
  static int rollFromString(String diceString) {
    final parts = diceString.toLowerCase().split('d');
    assert(parts.length == 2, 'Invalid dice string format: $diceString');
    final count = int.parse(parts[0]);
    final sides = int.parse(parts[1]);
    return rollMultiple(count, sides);
  }

  // Roll with advantage — roll twice, take the higher result
  static int rollWithAdvantage(int sides) {
    final a = roll(sides);
    final b = roll(sides);
    return max(a, b);
  }

  // Roll with disadvantage — roll twice, take the lower result
  static int rollWithDisadvantage(int sides) {
    final a = roll(sides);
    final b = roll(sides);
    return min(a, b);
  }

  // Roll a d20 — used so frequently it gets its own method
  static int d20() => roll(20);

  // Roll a percentage check — returns true if roll is under threshold
  static bool percentageCheck(int threshold) {
    return _random.nextInt(100) + 1 <= threshold;
  }
}