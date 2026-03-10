import 'dart:convert';
import '../../domain/models/quest.dart';
import 'quest_repository.dart';
import '../database/app_database.dart';

class DriftQuestRepository implements QuestRepository {
  final AppDatabase _db;

  DriftQuestRepository(this._db);

  @override
  Future<Quest?> getQuestById(String id) async {
    final row = await (_db.select(_db.questTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<List<Quest>> getQuestsByIds(List<String> ids) async {
    if (ids.isEmpty) return [];
    final all = await (_db.select(_db.questTable)).get();
    return all
        .where((row) => ids.contains(row.id))
        .map(_fromRow)
        .toList();
  }

  @override
  Future<List<Quest>> getQuestsByConflictTag(String conflictTag) async {
    final all = await (_db.select(_db.questTable)).get();
    return all.where((row) {
      final tags = List<String>.from(jsonDecode(row.conflictTags));
      return tags.contains(conflictTag);
    }).map(_fromRow).toList();
  }

  @override
  Future<List<Quest>> getQuestsByType(QuestType type) async {
    final all = await (_db.select(_db.questTable)).get();
    return all
        .where((row) => row.questType == type.name)
        .map(_fromRow)
        .toList();
  }

  @override
  Future<List<Quest>> getAvailableQuests({
    String? campaignLength,
    List<String>? conflictTags,
  }) async {
    final all = await (_db.select(_db.questTable)).get();
    return all.where((row) {
      if (campaignLength != null) {
        const order = ['short', 'medium', 'long'];
        final rowMin = order.indexOf(row.campaignLengthMinimum);
        final reqMin = order.indexOf(campaignLength);
        if (rowMin > reqMin) return false;
      }
      if (conflictTags != null && conflictTags.isNotEmpty) {
        final tags = List<String>.from(jsonDecode(row.conflictTags));
        if (!conflictTags.any((t) => tags.contains(t))) return false;
      }
      return true;
    }).map(_fromRow).toList();
  }

  // ── PRIVATE MAPPER ────────────────────────────────────────────────────────

  Quest _fromRow(QuestTableData row) {
    final objectivesJson =
        List<Map<String, dynamic>>.from(jsonDecode(row.objectives));
    final objectives = objectivesJson
        .map((o) => QuestObjective(
              description: o['description'] as String,
              type: o['type'] as String,
            ))
        .toList();

    final rewardsJson =
        Map<String, dynamic>.from(jsonDecode(row.rewards));
    final reputationRaw =
        rewardsJson['reputation'] as Map<String, dynamic>? ?? {};
    final rewards = QuestRewards(
      xp: (rewardsJson['xp'] as int?) ?? 0,
      gold: (rewardsJson['gold'] as int?) ?? 0,
      itemIds: List<String>.from(rewardsJson['items'] ?? []),
      reputationChanges:
          reputationRaw.map((k, v) => MapEntry(k, v as int)),
    );

    final conflictWeightJson =
        Map<String, dynamic>.from(jsonDecode(row.conflictWeight));

    return Quest(
      id: row.id,
      title: row.title,
      parentArc: row.parentArc,
      questType: QuestType.values.firstWhere(
        (t) => t.name == row.questType,
        orElse: () => QuestType.side,
      ),
      description: row.description,
      giverNpcId: row.giverNpcId,
      objectives: objectives,
      rewards: rewards,
      conflictWeight:
          conflictWeightJson.map((k, v) => MapEntry(k, v as int)),
      conflictTags: List<String>.from(jsonDecode(row.conflictTags)),
      campaignLengthMinimum: row.campaignLengthMinimum,
    );
  }
}
