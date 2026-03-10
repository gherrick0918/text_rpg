class CharacterStats {
  final int strength;
  final int stamina;
  final int agility;
  final int luck;
  final int charisma;
  final int wisdom;
  final int intelligence;

  const CharacterStats({
    required this.strength,
    required this.stamina,
    required this.agility,
    required this.luck,
    required this.charisma,
    required this.wisdom,
    required this.intelligence,
  });

  // Derived stats
  int get maxHealth => stamina * 5;
  int get maxActionPoints => (stamina / 4).ceil();

  // Stat bonus for checks — every 2 points above 10 gives +1, below 10 gives -1
  int get strengthBonus => (strength - 10) ~/ 2;
  int get staminaBonus => (stamina - 10) ~/ 2;
  int get agilityBonus => (agility - 10) ~/ 2;
  int get luckBonus => (luck - 10) ~/ 2;
  int get charismaBonus => (charisma - 10) ~/ 2;
  int get wisdomBonus => (wisdom - 10) ~/ 2;
  int get intelligenceBonus => (intelligence - 10) ~/ 2;

  // Validate all stats are within 1-20 range
  bool get isValid =>
      _inRange(strength) &&
      _inRange(stamina) &&
      _inRange(agility) &&
      _inRange(luck) &&
      _inRange(charisma) &&
      _inRange(wisdom) &&
      _inRange(intelligence);

  bool _inRange(int value) => value >= 1 && value <= 20;

  CharacterStats copyWith({
    int? strength,
    int? stamina,
    int? agility,
    int? luck,
    int? charisma,
    int? wisdom,
    int? intelligence,
  }) {
    return CharacterStats(
      strength: strength ?? this.strength,
      stamina: stamina ?? this.stamina,
      agility: agility ?? this.agility,
      luck: luck ?? this.luck,
      charisma: charisma ?? this.charisma,
      wisdom: wisdom ?? this.wisdom,
      intelligence: intelligence ?? this.intelligence,
    );
  }
}