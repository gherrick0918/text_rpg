import '../../domain/models/enemy.dart';

abstract class EnemyRepository {
  Future<Enemy?> getEnemyById(String id);
  Future<Enemy?> getRandomEnemy({
    int? tier,
    List<String>? regionTags,
    List<String>? conflictTags,
  });
  Future<List<Enemy>> getEnemiesByTier(int tier);
  Future<List<Enemy>> getEnemiesByRegion(String region);
  Future<List<Enemy>> getEnemiesByConflictTag(String conflictTag);
  Future<List<Enemy>> getEnemiesForEncounter({
    String? region,
    String? conflictTag,
    int? tier,
  });
}