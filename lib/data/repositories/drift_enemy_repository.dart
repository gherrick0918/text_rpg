import 'dart:convert';
import 'dart:math';
import '../../domain/models/enemy.dart';
import '../../domain/models/character_stats.dart';
import 'enemy_repository.dart';
import '../database/app_database.dart';
import '../../core/logger/run_logger.dart';

class DriftEnemyRepository implements EnemyRepository {
  final AppDatabase _db;
  final _random = Random();

  DriftEnemyRepository(this._db);

  @override
  Future<Enemy?> getEnemyById(String id) async {
    final row = await (_db.select(_db.enemyTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<Enemy?> getRandomEnemy({
    int? tier,
    List<String>? regionTags,
    List<String>? conflictTags,
  }) async {
    RunLogger.info('EnemyRepository', 
      'Querying random enemy: tier=${tier ?? "any"}, '
      'regions=${regionTags ?? "any"}, conflicts=${conflictTags ?? "any"}');
    
    final all = await (_db.select(_db.enemyTable)).get();
    RunLogger.info('EnemyRepository', 'Total enemies in database: ${all.length}');

    var candidates = all.where((row) {
      if (tier != null && row.tier != tier) return false;
      if (regionTags != null && regionTags.isNotEmpty) {
        final tags = List<String>.from(jsonDecode(row.regionTags));
        if (!regionTags.any((t) => tags.contains(t))) return false;
      }
      if (conflictTags != null && conflictTags.isNotEmpty) {
        final tags = List<String>.from(jsonDecode(row.conflictTags));
        if (!conflictTags.any((t) => tags.contains(t))) return false;
      }
      return true;
    }).toList();

    RunLogger.info('EnemyRepository', 'Enemies after filtering: ${candidates.length}');

    // Relax tier constraint if needed
    if (candidates.isEmpty && tier != null) {
      RunLogger.warn('EnemyRepository', 'No tier $tier enemies found - relaxing tier constraint');
      candidates = all.where((row) {
        if (regionTags != null && regionTags.isNotEmpty) {
          final tags = List<String>.from(jsonDecode(row.regionTags));
          if (!regionTags.any((t) => tags.contains(t))) return false;
        }
        return true;
      }).toList();
      RunLogger.info('EnemyRepository', 'Enemies after relaxing tier: ${candidates.length}');
    }

    if (candidates.isEmpty) {
      RunLogger.warn('EnemyRepository', 'No matching enemies - using any available enemy');
      candidates = all;
    }
    if (candidates.isEmpty) {
      RunLogger.error('EnemyRepository', 'No enemies available in database!');
      return null;
    }

    candidates.shuffle(_random);
    final selected = _fromRow(candidates.first);
    
    RunLogger.info('EnemyRepository', 
      'Enemy selected: "${selected.name}" (T${selected.tier} ${selected.currentHealth}HP '
      '${selected.armorValue}AC ${selected.behavior.name})');
    
    return selected;
  }

  @override
  Future<List<Enemy>> getEnemiesByTier(int tier) async {
    final all = await (_db.select(_db.enemyTable)).get();
    return all.where((r) => r.tier == tier).map(_fromRow).toList();
  }

  @override
  Future<List<Enemy>> getEnemiesByRegion(String region) async {
    final all = await (_db.select(_db.enemyTable)).get();
    return all.where((row) {
      final tags = List<String>.from(jsonDecode(row.regionTags));
      return tags.contains(region);
    }).map(_fromRow).toList();
  }

  @override
  Future<List<Enemy>> getEnemiesByConflictTag(String conflictTag) async {
    final all = await (_db.select(_db.enemyTable)).get();
    return all.where((row) {
      final tags = List<String>.from(jsonDecode(row.conflictTags));
      return tags.contains(conflictTag);
    }).map(_fromRow).toList();
  }

  @override
  Future<List<Enemy>> getEnemiesForEncounter({
    String? region,
    String? conflictTag,
    int? tier,
  }) async {
    final all = await (_db.select(_db.enemyTable)).get();
    return all.where((row) {
      if (tier != null && row.tier != tier) return false;
      if (region != null) {
        final regionTags = List<String>.from(jsonDecode(row.regionTags));
        if (!regionTags.contains(region)) return false;
      }
      if (conflictTag != null) {
        final conflictTags = List<String>.from(jsonDecode(row.conflictTags));
        if (!conflictTags.contains(conflictTag)) return false;
      }
      return true;
    }).map(_fromRow).toList();
  }

  Enemy _fromRow(EnemyTableData row) {
    return Enemy(
      id: row.id,
      name: row.name,
      description: row.description,
      stats: CharacterStats(
        strength: row.strength,
        stamina: row.stamina,
        agility: row.agility,
        luck: row.luck,
        charisma: row.charisma,
        wisdom: row.wisdom,
        intelligence: row.intelligence,
      ),
      damageDice: row.damageDice,
      armorValue: row.armorValue,
      tier: row.tier,
      behavior: EnemyBehavior.values.firstWhere(
        (b) => b.name == row.behavior,
        orElse: () => EnemyBehavior.aggressive,
      ),
      specialAbility: row.specialAbility,
      lootTable: List<String>.from(jsonDecode(row.lootTable)),
      conflictTags: List<String>.from(jsonDecode(row.conflictTags)),
      regionTags: List<String>.from(jsonDecode(row.regionTags)),
      xpValue: row.xpValue,
    );
  }
}