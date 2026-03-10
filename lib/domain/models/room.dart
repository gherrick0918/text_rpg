class Room {
  final String id;
  final String name;
  final String region;
  final String description;
  final String atmosphere;
  final List<String> conflictTags;
  final bool encounterEligible;
  final bool lootEligible;
  final String? notes;

  const Room({
    required this.id,
    required this.name,
    required this.region,
    required this.description,
    required this.atmosphere,
    required this.conflictTags,
    required this.encounterEligible,
    required this.lootEligible,
    this.notes,
  });
}