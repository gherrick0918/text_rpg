import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_rpg/data/database/app_database.dart';
import 'package:text_rpg/data/repositories/drift_enemy_repository.dart';
import 'package:text_rpg/data/repositories/drift_room_repository.dart';

// Creates an in-memory database for testing — nothing written to disk
AppDatabase _testDatabase() {
  return AppDatabase.forTesting(NativeDatabase.memory());
}

void main() {
  late AppDatabase db;
  late DriftEnemyRepository enemyRepo;
  late DriftRoomRepository roomRepo;

  setUp(() {
    db = _testDatabase();
    enemyRepo = DriftEnemyRepository(db);
    roomRepo = DriftRoomRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  // --- Seed helpers ---

  Future<void> seedEnemy(AppDatabase db) async {
    await db.into(db.enemyTable).insert(EnemyTableCompanion.insert(
      id: 'enemy_001',
      name: 'Rotting Tomb Guard',
      description: 'A shambling undead warrior.',
      strength: 12,
      stamina: 10,
      agility: 6,
      luck: 4,
      charisma: 2,
      wisdom: 4,
      intelligence: 3,
      damageDice: '1d6',
      armorValue: 2,
      tier: 1,
      behavior: 'aggressive',
      lootTable: '["item_001"]',
      conflictTags: '["epic"]',
      regionTags: '["dungeon"]',
      xpValue: 50,
    ));
  }

  Future<void> seedRoom(AppDatabase db) async {
    await db.into(db.roomTable).insert(RoomTableCompanion.insert(
      id: 'room_001',
      name: 'The Crumbling Watchtower',
      region: 'wilderness',
      description: 'A moss-covered tower leaning against the wind.',
      atmosphere: 'tense',
      conflictTags: '["epic","political"]',
      encounterEligible: true,
      lootEligible: true,
    ));
  }

  // --- Enemy tests ---

  group('EnemyRepository', () {
    test('can insert and retrieve enemy by id', () async {
      await seedEnemy(db);
      final enemy = await enemyRepo.getEnemyById('enemy_001');
      expect(enemy, isNotNull);
      expect(enemy!.name, equals('Rotting Tomb Guard'));
      expect(enemy.stats.strength, equals(12));
      expect(enemy.stats.maxHealth, equals(50)); // stamina 10 * 5
    });

    test('getEnemiesByRegion returns correct enemies', () async {
      await seedEnemy(db);
      final enemies = await enemyRepo.getEnemiesByRegion('dungeon');
      expect(enemies.length, equals(1));
      expect(enemies.first.id, equals('enemy_001'));
    });

    test('getEnemiesByRegion returns empty for wrong region', () async {
      await seedEnemy(db);
      final enemies = await enemyRepo.getEnemiesByRegion('town');
      expect(enemies, isEmpty);
    });

    test('getEnemiesByTier returns correct enemies', () async {
      await seedEnemy(db);
      final enemies = await enemyRepo.getEnemiesByTier(1);
      expect(enemies.length, equals(1));
    });

    test('getEnemiesByConflictTag returns correct enemies', () async {
      await seedEnemy(db);
      final enemies = await enemyRepo.getEnemiesByConflictTag('epic');
      expect(enemies.length, equals(1));
    });

    test('getEnemiesForEncounter filters correctly', () async {
      await seedEnemy(db);
      final enemies = await enemyRepo.getEnemiesForEncounter(
        region: 'dungeon',
        conflictTag: 'epic',
        tier: 1,
      );
      expect(enemies.length, equals(1));
    });

    test('getEnemiesForEncounter returns empty for wrong combination', () async {
      await seedEnemy(db);
      final enemies = await enemyRepo.getEnemiesForEncounter(
        region: 'town',
        conflictTag: 'epic',
        tier: 1,
      );
      expect(enemies, isEmpty);
    });

    test('enemy behavior deserializes correctly', () async {
      await seedEnemy(db);
      final enemy = await enemyRepo.getEnemyById('enemy_001');
      expect(enemy!.behavior.name, equals('aggressive'));
    });
  });

  // --- Room tests ---

  group('RoomRepository', () {
    test('can insert and retrieve room by id', () async {
      await seedRoom(db);
      final room = await roomRepo.getRoomById('room_001');
      expect(room, isNotNull);
      expect(room!.name, equals('The Crumbling Watchtower'));
      expect(room.region, equals('wilderness'));
    });

    test('getRoomsByRegion returns correct rooms', () async {
      await seedRoom(db);
      final rooms = await roomRepo.getRoomsByRegion('wilderness');
      expect(rooms.length, equals(1));
    });

    test('getRoomsByRegion returns empty for wrong region', () async {
      await seedRoom(db);
      final rooms = await roomRepo.getRoomsByRegion('dungeon');
      expect(rooms, isEmpty);
    });

    test('getRoomsByConflictTag returns correct rooms', () async {
      await seedRoom(db);
      final rooms = await roomRepo.getRoomsByConflictTag('epic');
      expect(rooms.length, equals(1));
    });

    test('getRoomsByConflictTag matches multiple tags', () async {
      await seedRoom(db);
      final rooms = await roomRepo.getRoomsByConflictTag('political');
      expect(rooms.length, equals(1));
    });

    test('getEncounterEligibleRooms returns eligible rooms', () async {
      await seedRoom(db);
      final rooms = await roomRepo.getEncounterEligibleRooms('wilderness');
      expect(rooms.length, equals(1));
    });

    test('conflictTags deserialize correctly', () async {
      await seedRoom(db);
      final room = await roomRepo.getRoomById('room_001');
      expect(room!.conflictTags, containsAll(['epic', 'political']));
    });
  });
}