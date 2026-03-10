import '../../domain/models/quest.dart';

abstract class QuestRepository {
  Future<Quest?> getQuestById(String id);
  Future<List<Quest>> getQuestsByIds(List<String> ids);
  Future<List<Quest>> getQuestsByConflictTag(String conflictTag);
  Future<List<Quest>> getQuestsByType(QuestType type);
  Future<List<Quest>> getAvailableQuests({
    String? campaignLength,
    List<String>? conflictTags,
  });
}
