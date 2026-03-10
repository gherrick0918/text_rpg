import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// --- Tables ---

class EnemyTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get strength => integer()();
  IntColumn get stamina => integer()();
  IntColumn get agility => integer()();
  IntColumn get luck => integer()();
  IntColumn get charisma => integer()();
  IntColumn get wisdom => integer()();
  IntColumn get intelligence => integer()();
  TextColumn get damageDice => text()();
  IntColumn get armorValue => integer()();
  IntColumn get tier => integer()();
  TextColumn get behavior => text()();
  TextColumn get specialAbility => text().nullable()();
  TextColumn get lootTable => text()(); // JSON encoded list
  TextColumn get conflictTags => text()(); // JSON encoded list
  TextColumn get regionTags => text()(); // JSON encoded list
  IntColumn get xpValue => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class RoomTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get region => text()();
  TextColumn get description => text()();
  TextColumn get atmosphere => text()();
  TextColumn get conflictTags => text()(); // JSON encoded list
  BoolColumn get encounterEligible => boolean()();
  BoolColumn get lootEligible => boolean()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class WeaponTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get weaponType => text()();
  IntColumn get tier => integer()();
  TextColumn get description => text()();
  TextColumn get damageDice => text()();
  TextColumn get statRequirement => text()();
  IntColumn get requirementThreshold => integer()();
  TextColumn get specialEffect => text().nullable()();
  TextColumn get conflictTags => text()(); // JSON encoded list
  TextColumn get regionTags => text()(); // JSON encoded list

  @override
  Set<Column> get primaryKey => {id};
}

class ArmorTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get armorType => text()();
  IntColumn get tier => integer()();
  TextColumn get description => text()();
  IntColumn get defenseValue => integer()();
  TextColumn get statRequirement => text()();
  IntColumn get requirementThreshold => integer()();
  IntColumn get agilityPenalty => integer()();
  TextColumn get specialEffect => text().nullable()();
  TextColumn get conflictTags => text()(); // JSON encoded list
  TextColumn get regionTags => text()(); // JSON encoded list

  @override
  Set<Column> get primaryKey => {id};
}

class ConsumableTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get tier => integer()();
  TextColumn get description => text()();
  TextColumn get effectType => text()();
  TextColumn get effectValue => text()();
  TextColumn get duration => text()();
  TextColumn get conflictTags => text()(); // JSON encoded list
  TextColumn get regionTags => text()(); // JSON encoded list

  @override
  Set<Column> get primaryKey => {id};
}

class NpcTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get role => text()();
  TextColumn get description => text()();
  TextColumn get personality => text()();
  TextColumn get dialogueHooks => text()(); // JSON encoded list
  TextColumn get factionAlignment => text().nullable()();
  TextColumn get conflictTags => text()(); // JSON encoded list
  TextColumn get regionTags => text()(); // JSON encoded list
  TextColumn get services => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class FactionTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get archetype => text()();
  TextColumn get description => text()();
  TextColumn get agenda => text()();
  TextColumn get methods => text()();
  TextColumn get leaderNpcId => text().nullable()();
  TextColumn get keyMembers => text()(); // JSON encoded list
  TextColumn get homeRegion => text()();
  TextColumn get alliedFactions => text()(); // JSON encoded list
  TextColumn get rivalFactions => text()(); // JSON encoded list
  IntColumn get playerReputationStart => integer()();
  TextColumn get conflictTags => text()(); // JSON encoded list
  TextColumn get campaignLengthMinimum => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class StoryArcTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get conflictType => text()();
  TextColumn get arcType => text()();
  TextColumn get description => text()();
  TextColumn get prerequisites => text()(); // JSON encoded list
  TextColumn get triggers => text()();
  TextColumn get resolutionOptions => text()(); // JSON encoded list of objects
  TextColumn get campaignLengthMinimum => text()();
  TextColumn get factionsInvolved => text()(); // JSON encoded list

  @override
  Set<Column> get primaryKey => {id};
}

class QuestTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get parentArc => text().nullable()();
  TextColumn get questType => text()();
  TextColumn get description => text()();
  TextColumn get giverNpcId => text().nullable()();
  TextColumn get objectives => text()(); // JSON encoded list
  TextColumn get rewards => text()(); // JSON encoded object
  TextColumn get conflictWeight => text()(); // JSON encoded object
  TextColumn get conflictTags => text()(); // JSON encoded list
  TextColumn get campaignLengthMinimum => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// --- Database ---

@DriftDatabase(tables: [
  EnemyTable,
  RoomTable,
  WeaponTable,
  ArmorTable,
  ConsumableTable,
  NpcTable,
  FactionTable,
  StoryArcTable,
  QuestTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'text_rpg.db'));
    return NativeDatabase.createInBackground(file);
  });
}