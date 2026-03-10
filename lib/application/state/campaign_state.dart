import '../../domain/models/player.dart';
import '../../domain/models/room.dart';
import '../../domain/models/enemy.dart';
import '../../domain/engine/combat_engine.dart';

enum CampaignLength { short, medium, long }

enum ConflictType { epic, political, social }

enum CampaignPhase {
  setup,       // Character creation, campaign selection
  exploration, // Moving through rooms, triggering events
  combat,      // Active combat encounter
  dialogue,    // NPC interaction
  levelUp,     // Player levelling up
  gameOver,    // Combat loss
  victory,     // Campaign complete
}

class ConflictWeights {
  final int epic;
  final int political;
  final int social;

  const ConflictWeights({
    this.epic = 0,
    this.political = 0,
    this.social = 0,
  });

  ConflictWeights addWeight(ConflictType type, int amount) {
    return ConflictWeights(
      epic: epic + (type == ConflictType.epic ? amount : 0),
      political: political + (type == ConflictType.political ? amount : 0),
      social: social + (type == ConflictType.social ? amount : 0),
    );
  }

  // Returns the dominant conflict type based on current weights
  ConflictType get dominant {
    if (epic >= political && epic >= social) return ConflictType.epic;
    if (political >= epic && political >= social) return ConflictType.political;
    return ConflictType.social;
  }

  ConflictWeights copyWith({int? epic, int? political, int? social}) {
    return ConflictWeights(
      epic: epic ?? this.epic,
      political: political ?? this.political,
      social: social ?? this.social,
    );
  }
}

class FactionReputation {
  final String factionId;
  final int reputation;

  const FactionReputation({
    required this.factionId,
    required this.reputation,
  });

  String get standing {
    if (reputation <= -20) return 'hostile';
    if (reputation <= -10) return 'unfriendly';
    if (reputation < 10) return 'neutral';
    if (reputation < 20) return 'friendly';
    return 'allied';
  }

  FactionReputation adjust(int amount) {
    return FactionReputation(
      factionId: factionId,
      reputation: (reputation + amount).clamp(-30, 30),
    );
  }
}

class CampaignState {
  final Player player;
  final CampaignLength campaignLength;
  final ConflictType? selectedConflictType; // null = emergent
  final ConflictWeights conflictWeights;
  final CampaignPhase phase;
  final Room? currentRoom;
  final CombatState? activeCombat;
  final Map<String, FactionReputation> factionReputations;
  final List<String> completedQuestIds;
  final List<String> activeQuestIds;
  final List<String> visitedRoomIds;
  final int gold;
  final List<String> inventoryItemIds;
  final int sessionTurn;

  const CampaignState({
    required this.player,
    required this.campaignLength,
    this.selectedConflictType,
    this.conflictWeights = const ConflictWeights(),
    this.phase = CampaignPhase.exploration,
    this.currentRoom,
    this.activeCombat,
    this.factionReputations = const {},
    this.completedQuestIds = const [],
    this.activeQuestIds = const [],
    this.visitedRoomIds = const [],
    this.gold = 0,
    this.inventoryItemIds = const [],
    this.sessionTurn = 0,
  });

  // The active conflict type — selected or emergent
  ConflictType get activeConflictType =>
      selectedConflictType ?? conflictWeights.dominant;

  bool get isInCombat => phase == CampaignPhase.combat && activeCombat != null;

  CampaignState copyWith({
    Player? player,
    CampaignLength? campaignLength,
    ConflictType? selectedConflictType,
    ConflictWeights? conflictWeights,
    CampaignPhase? phase,
    Room? currentRoom,
    CombatState? activeCombat,
    Map<String, FactionReputation>? factionReputations,
    List<String>? completedQuestIds,
    List<String>? activeQuestIds,
    List<String>? visitedRoomIds,
    int? gold,
    List<String>? inventoryItemIds,
    int? sessionTurn,
    bool clearActiveCombat = false,
    bool clearSelectedConflictType = false,
  }) {
    return CampaignState(
      player: player ?? this.player,
      campaignLength: campaignLength ?? this.campaignLength,
      selectedConflictType: clearSelectedConflictType
          ? null
          : selectedConflictType ?? this.selectedConflictType,
      conflictWeights: conflictWeights ?? this.conflictWeights,
      phase: phase ?? this.phase,
      currentRoom: currentRoom ?? this.currentRoom,
      activeCombat: clearActiveCombat ? null : activeCombat ?? this.activeCombat,
      factionReputations: factionReputations ?? this.factionReputations,
      completedQuestIds: completedQuestIds ?? this.completedQuestIds,
      activeQuestIds: activeQuestIds ?? this.activeQuestIds,
      visitedRoomIds: visitedRoomIds ?? this.visitedRoomIds,
      gold: gold ?? this.gold,
      inventoryItemIds: inventoryItemIds ?? this.inventoryItemIds,
      sessionTurn: sessionTurn ?? this.sessionTurn,
    );
  }

  // Convenience state transitions
  CampaignState enterRoom(Room room) {
    final visited = visitedRoomIds.contains(room.id)
        ? visitedRoomIds
        : [...visitedRoomIds, room.id];
    return copyWith(
      currentRoom: room,
      phase: CampaignPhase.exploration,
      sessionTurn: sessionTurn + 1,
      visitedRoomIds: visited,
    );
  }

  CampaignState beginCombat(CombatState combat) {
    return copyWith(
      phase: CampaignPhase.combat,
      activeCombat: combat,
    );
  }

  CampaignState updateCombat(CombatState combat) {
    return copyWith(activeCombat: combat);
  }

  CampaignState endCombat() {
    return copyWith(
      phase: CampaignPhase.exploration,
      clearActiveCombat: true,
    );
  }

  CampaignState adjustFactionReputation(String factionId, int amount) {
    final updated = Map<String, FactionReputation>.from(factionReputations);
    final current = updated[factionId] ??
        FactionReputation(factionId: factionId, reputation: 0);
    updated[factionId] = current.adjust(amount);
    return copyWith(factionReputations: updated);
  }

  CampaignState nudgeConflictWeight(ConflictType type, int amount) {
    return copyWith(
      conflictWeights: conflictWeights.addWeight(type, amount),
    );
  }

  CampaignState completeQuest(String questId) {
    return copyWith(
      completedQuestIds: [...completedQuestIds, questId],
      activeQuestIds: activeQuestIds.where((id) => id != questId).toList(),
    );
  }

  CampaignState updatePlayer(Player updatedPlayer) {
    return copyWith(player: updatedPlayer);
  }
}