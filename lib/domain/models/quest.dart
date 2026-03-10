class QuestObjective {
  final String description;
  final String type; // kill | retrieve | escort | discover | persuade | reach

  const QuestObjective({
    required this.description,
    required this.type,
  });
}

class QuestRewards {
  final int xp;
  final int gold;
  final List<String> itemIds;
  final Map<String, int> reputationChanges; // factionId -> amount

  const QuestRewards({
    this.xp = 0,
    this.gold = 0,
    this.itemIds = const [],
    this.reputationChanges = const {},
  });
}

enum QuestType { main, side, faction, dynamic }

class Quest {
  final String id;
  final String title;
  final String? parentArc;
  final QuestType questType;
  final String description;
  final String? giverNpcId;
  final List<QuestObjective> objectives;
  final QuestRewards rewards;
  final Map<String, int> conflictWeight; // epic/political/social -> int
  final List<String> conflictTags;
  final String campaignLengthMinimum;

  const Quest({
    required this.id,
    required this.title,
    this.parentArc,
    required this.questType,
    required this.description,
    this.giverNpcId,
    required this.objectives,
    required this.rewards,
    this.conflictWeight = const {},
    this.conflictTags = const [],
    this.campaignLengthMinimum = 'short',
  });

  String get questTypeLabel {
    switch (questType) {
      case QuestType.main:
        return 'MAIN';
      case QuestType.side:
        return 'SIDE';
      case QuestType.faction:
        return 'FACTION';
      case QuestType.dynamic:
        return 'DYNAMIC';
    }
  }
}
