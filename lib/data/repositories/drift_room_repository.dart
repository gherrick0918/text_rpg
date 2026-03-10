import 'dart:convert';
import 'dart:math';
import '../../domain/models/room.dart';
import 'room_repository.dart';
import '../database/app_database.dart';

class DriftRoomRepository implements RoomRepository {
  final AppDatabase _db;
  final _random = Random();

  DriftRoomRepository(this._db);

  @override
  Future<Room?> getRoomById(String id) async {
    final row = await (_db.select(_db.roomTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<Room?> getRandomRoom({
    List<String>? regionTags,
    List<String>? conflictTags,
    List<String> excludeIds = const [],
  }) async {
    final all = await (_db.select(_db.roomTable)).get();

    var candidates = all.where((row) {
      if (excludeIds.contains(row.id)) return false;
      if (regionTags != null && regionTags.isNotEmpty) {
        final tags = List<String>.from(jsonDecode(row.conflictTags));
        if (!regionTags.any((t) => row.region == t)) return false;
      }
      if (conflictTags != null && conflictTags.isNotEmpty) {
        final tags = List<String>.from(jsonDecode(row.conflictTags));
        if (!conflictTags.any((t) => tags.contains(t))) return false;
      }
      return true;
    }).toList();

    // Fall back to any unvisited room if filters yield nothing
    if (candidates.isEmpty) {
      candidates = all.where((row) => !excludeIds.contains(row.id)).toList();
    }
    // Fall back to any room at all
    if (candidates.isEmpty && all.isNotEmpty) {
      candidates = all;
    }
    if (candidates.isEmpty) return null;

    candidates.shuffle(_random);
    return _fromRow(candidates.first);
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