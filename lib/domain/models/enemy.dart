import 'character_stats.dart';

enum EnemyBehavior { aggressive, defensive, tactical, erratic }

class Enemy {
  final String id;
  final String name;
  final String description;
  final CharacterStats stats;
  final String damageDice;
  final int armorValue;
  final int tier;
  final EnemyBehavior behavior;
  final String? specialAbility;
  final List<String> lootTable;
  final List<String> conflictTags;
  final List<String> regionTags;
  final int xpValue;
  final int currentHealth;
  final int currentActionPoints;

  Enemy({
    required this.id,
    required this.name,
    required this.description,
    required this.stats,
    required this.damageDice,
    required this.armorValue,
    required this.tier,
    required this.behavior,
    required this.lootTable,
    required this.conflictTags,
    required this.regionTags,
    required this.xpValue,
    this.specialAbility,
    int? currentHealth,
    int? currentActionPoints,
  })  : currentHealth = currentHealth ?? stats.maxHealth,
        currentActionPoints = currentActionPoints ?? stats.maxActionPoints;

  // Convenience getters
  int get maxHealth => stats.maxHealth;
  int get maxActionPoints => stats.maxActionPoints;
  bool get isAlive => currentHealth > 0;
  bool get isBloodied => currentHealth <= (maxHealth / 2);

  Enemy copyWith({
    String? id,
    String? name,
    String? description,
    CharacterStats? stats,
    String? damageDice,
    int? armorValue,
    int? tier,
    EnemyBehavior? behavior,
    String? specialAbility,
    List<String>? lootTable,
    List<String>? conflictTags,
    List<String>? regionTags,
    int? xpValue,
    int? currentHealth,
    int? currentActionPoints,
  }) {
    return Enemy(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      stats: stats ?? this.stats,
      damageDice: damageDice ?? this.damageDice,
      armorValue: armorValue ?? this.armorValue,
      tier: tier ?? this.tier,
      behavior: behavior ?? this.behavior,
      specialAbility: specialAbility ?? this.specialAbility,
      lootTable: lootTable ?? this.lootTable,
      conflictTags: conflictTags ?? this.conflictTags,
      regionTags: regionTags ?? this.regionTags,
      xpValue: xpValue ?? this.xpValue,
      currentHealth: currentHealth ?? this.currentHealth,
      currentActionPoints: currentActionPoints ?? this.currentActionPoints,
    );
  }

  Enemy takeDamage(int amount) {
    final newHealth = (currentHealth - amount).clamp(0, maxHealth);
    return copyWith(currentHealth: newHealth);
  }

  Enemy heal(int amount) {
    final newHealth = (currentHealth + amount).clamp(0, maxHealth);
    return copyWith(currentHealth: newHealth);
  }

  Enemy spendActionPoints(int amount) {
    final newAp = (currentActionPoints - amount).clamp(0, maxActionPoints);
    return copyWith(currentActionPoints: newAp);
  }

  Enemy refreshActionPoints() {
    return copyWith(currentActionPoints: maxActionPoints);
  }
}