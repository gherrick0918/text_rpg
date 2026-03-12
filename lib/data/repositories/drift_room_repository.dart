import 'dart:convert';
import 'dart:math';
import '../../domain/models/room.dart';
import 'room_repository.dart';
import '../database/app_database.dart';
import '../../core/logger/run_logger.dart';

class DriftRoomRepository implements RoomRepository {
  final AppDatabase _db;
  final _random = Random();

  DriftRoomRepository(this._db);

  @override
  Future<Room?> getRoomById(String id) async {
    RunLogger.info('RoomRepository', 'Querying room by ID: $id');
    
    final row = await (_db.select(_db.roomTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    
    if (row == null) {
      RunLogger.warn('RoomRepository', 'Room not found with ID: $id');
      return null;
    }
    
    final room = _fromRow(row);
    RunLogger.info('RoomRepository', 'Room found: "${room.name}" (${room.region})');
    return room;
  }

  @override
  Future<Room?> getRandomRoom({
    List<String>? regionTags,
    List<String>? conflictTags,
    List<String> excludeIds = const [],
  }) async {
    RunLogger.info('RoomRepository', 
      'Querying random room: regions=${regionTags ?? "any"}, '
      'conflicts=${conflictTags ?? "any"}, excluding ${excludeIds.length} rooms');
    
    final all = await (_db.select(_db.roomTable)).get();
    RunLogger.info('RoomRepository', 'Total rooms in database: ${all.length}');

    var candidates = all.where((row) {
      if (excludeIds.contains(row.id)) return false;

      // ── REGION FILTER ───────────────────────────────────────────────────
      // RoomTable stores region as a plain string column (not a JSON array),
      // so we compare directly against row.region.
      // FIXED: removed the dead jsonDecode(row.conflictTags) that was here
      // previously — 'tags' was decoded from the wrong column and never used.
      if (regionTags != null && regionTags.isNotEmpty) {
        if (!regionTags.any((t) => row.region == t)) return false;
      }

      // ── CONFLICT TAG FILTER ─────────────────────────────────────────────
      if (conflictTags != null && conflictTags.isNotEmpty) {
        final tags = List<String>.from(jsonDecode(row.conflictTags));
        if (!conflictTags.any((t) => tags.contains(t))) return false;
      }

      return true;
    }).toList();

    RunLogger.info('RoomRepository', 'Rooms after filtering: ${candidates.length}');

    // Fall back to any unvisited room if filters yield nothing
    if (candidates.isEmpty) {
      RunLogger.warn('RoomRepository', 'No rooms matched filters - trying unvisited rooms');
      candidates = all.where((row) => !excludeIds.contains(row.id)).toList();
      RunLogger.info('RoomRepository', 'Unvisited rooms available: ${candidates.length}');
    }
    // Fall back to any room at all
    if (candidates.isEmpty && all.isNotEmpty) {
      RunLogger.warn('RoomRepository', 'All rooms visited - using any available room');
      candidates = all;
    }
    if (candidates.isEmpty) {
      RunLogger.error('RoomRepository', 'No rooms available in database!');
      return null;
    }

    candidates.shuffle(_random);
    final selected = _fromRow(candidates.first);
    
    RunLogger.info('RoomRepository', 
      'Room selected: "${selected.name}" (${selected.region}) - '
      'encounter=${selected.encounterEligible}, loot=${selected.lootEligible}');
    
    return selected;
  }

  @override
  Future<List<Room>> getRoomsByRegion(String region) async {
    final rows = await (_db.select(_db.roomTable)
          ..where((t) => t.region.equals(region)))
        .get();
    return rows.map(_fromRow).toList();
  }

  @override
  Future<List<Room>> getRoomsByConflictTag(String conflictTag) async {
    final all = await (_db.select(_db.roomTable)).get();
    return all.where((row) {
      final tags = List<String>.from(jsonDecode(row.conflictTags));
      return tags.contains(conflictTag);
    }).map(_fromRow).toList();
  }

  @override
  Future<List<Room>> getEncounterEligibleRooms(String region) async {
    final rows = await (_db.select(_db.roomTable)
          ..where((t) => t.region.equals(region))
          ..where((t) => t.encounterEligible.equals(true)))
        .get();
    return rows.map(_fromRow).toList();
  }

  Room _fromRow(RoomTableData row) {
    return Room(
      id: row.id,
      name: row.name,
      region: row.region,
      description: row.description,
      atmosphere: row.atmosphere,
      conflictTags: List<String>.from(jsonDecode(row.conflictTags)),
      encounterEligible: row.encounterEligible,
      lootEligible: row.lootEligible,
      notes: row.notes ?? '',
    );
  }
}
