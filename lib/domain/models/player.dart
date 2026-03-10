import 'character_stats.dart';

class Player {
  final String id;
  final String name;
  final CharacterStats stats;
  final int level;
  final int experience;
  final int currentHealth;
  final int currentActionPoints;

  Player({
    required this.id,
    required this.name,
    required this.stats,
    this.level = 1,
    this.experience = 0,
    int? currentHealth,
    int? currentActionPoints,
  })  : currentHealth = currentHealth ?? stats.maxHealth,
        currentActionPoints = currentActionPoints ?? stats.maxActionPoints;

  // Convenience getters
  int get maxHealth => stats.maxHealth;
  int get maxActionPoints => stats.maxActionPoints;
  bool get isAlive => currentHealth > 0;
  bool get isBloodied => currentHealth <= (maxHealth / 2);

  // Experience needed to reach next level — simple scaling curve for now
  int get experienceToNextLevel => level * 100;
  bool get canLevelUp => experience >= experienceToNextLevel;

  Player copyWith({
    String? id,
    String? name,
    CharacterStats? stats,
    int? level,
    int? experience,
    int? currentHealth,
    int? currentActionPoints,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      stats: stats ?? this.stats,
      level: level ?? this.level,
      experience: experience ?? this.experience,
      currentHealth: currentHealth ?? this.currentHealth,
      currentActionPoints: currentActionPoints ?? this.currentActionPoints,
    );
  }

  // Apply damage — clamps to 0, never goes negative
  Player takeDamage(int amount) {
    final newHealth = (currentHealth - amount).clamp(0, maxHealth);
    return copyWith(currentHealth: newHealth);
  }

  // Restore health — clamps to maxHealth
  Player heal(int amount) {
    final newHealth = (currentHealth + amount).clamp(0, maxHealth);
    return copyWith(currentHealth: newHealth);
  }

  // Spend action points
  Player spendActionPoints(int amount) {
    final newAp = (currentActionPoints - amount).clamp(0, maxActionPoints);
    return copyWith(currentActionPoints: newAp);
  }

  // Restore action points to full at start of combat round
  Player refreshActionPoints() {
    return copyWith(currentActionPoints: maxActionPoints);
  }

  // Add experience and handle level up
  Player gainExperience(int amount) {
    return copyWith(experience: experience + amount);
  }
}