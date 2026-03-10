import '../../domain/models/room.dart';

abstract class RoomRepository {
  Future<Room?> getRoomById(String id);
  Future<Room?> getRandomRoom({
    List<String>? regionTags,
    List<String>? conflictTags,
    List<String> excludeIds = const [],
  });
  Future<List<Room>> getRoomsByRegion(String region);
  Future<List<Room>> getRoomsByConflictTag(String conflictTag);
  Future<List<Room>> getEncounterEligibleRooms(String region);
}