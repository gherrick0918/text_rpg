// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EnemyTableTable extends EnemyTable
    with TableInfo<$EnemyTableTable, EnemyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnemyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strengthMeta = const VerificationMeta(
    'strength',
  );
  @override
  late final GeneratedColumn<int> strength = GeneratedColumn<int>(
    'strength',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _staminaMeta = const VerificationMeta(
    'stamina',
  );
  @override
  late final GeneratedColumn<int> stamina = GeneratedColumn<int>(
    'stamina',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agilityMeta = const VerificationMeta(
    'agility',
  );
  @override
  late final GeneratedColumn<int> agility = GeneratedColumn<int>(
    'agility',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _luckMeta = const VerificationMeta('luck');
  @override
  late final GeneratedColumn<int> luck = GeneratedColumn<int>(
    'luck',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _charismaMeta = const VerificationMeta(
    'charisma',
  );
  @override
  late final GeneratedColumn<int> charisma = GeneratedColumn<int>(
    'charisma',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wisdomMeta = const VerificationMeta('wisdom');
  @override
  late final GeneratedColumn<int> wisdom = GeneratedColumn<int>(
    'wisdom',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _intelligenceMeta = const VerificationMeta(
    'intelligence',
  );
  @override
  late final GeneratedColumn<int> intelligence = GeneratedColumn<int>(
    'intelligence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _damageDiceMeta = const VerificationMeta(
    'damageDice',
  );
  @override
  late final GeneratedColumn<String> damageDice = GeneratedColumn<String>(
    'damage_dice',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _armorValueMeta = const VerificationMeta(
    'armorValue',
  );
  @override
  late final GeneratedColumn<int> armorValue = GeneratedColumn<int>(
    'armor_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tierMeta = const VerificationMeta('tier');
  @override
  late final GeneratedColumn<int> tier = GeneratedColumn<int>(
    'tier',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _behaviorMeta = const VerificationMeta(
    'behavior',
  );
  @override
  late final GeneratedColumn<String> behavior = GeneratedColumn<String>(
    'behavior',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _specialAbilityMeta = const VerificationMeta(
    'specialAbility',
  );
  @override
  late final GeneratedColumn<String> specialAbility = GeneratedColumn<String>(
    'special_ability',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lootTableMeta = const VerificationMeta(
    'lootTable',
  );
  @override
  late final GeneratedColumn<String> lootTable = GeneratedColumn<String>(
    'loot_table',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conflictTagsMeta = const VerificationMeta(
    'conflictTags',
  );
  @override
  late final GeneratedColumn<String> conflictTags = GeneratedColumn<String>(
    'conflict_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regionTagsMeta = const VerificationMeta(
    'regionTags',
  );
  @override
  late final GeneratedColumn<String> regionTags = GeneratedColumn<String>(
    'region_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _xpValueMeta = const VerificationMeta(
    'xpValue',
  );
  @override
  late final GeneratedColumn<int> xpValue = GeneratedColumn<int>(
    'xp_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    strength,
    stamina,
    agility,
    luck,
    charisma,
    wisdom,
    intelligence,
    damageDice,
    armorValue,
    tier,
    behavior,
    specialAbility,
    lootTable,
    conflictTags,
    regionTags,
    xpValue,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'enemy_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<EnemyTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('strength')) {
      context.handle(
        _strengthMeta,
        strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta),
      );
    } else if (isInserting) {
      context.missing(_strengthMeta);
    }
    if (data.containsKey('stamina')) {
      context.handle(
        _staminaMeta,
        stamina.isAcceptableOrUnknown(data['stamina']!, _staminaMeta),
      );
    } else if (isInserting) {
      context.missing(_staminaMeta);
    }
    if (data.containsKey('agility')) {
      context.handle(
        _agilityMeta,
        agility.isAcceptableOrUnknown(data['agility']!, _agilityMeta),
      );
    } else if (isInserting) {
      context.missing(_agilityMeta);
    }
    if (data.containsKey('luck')) {
      context.handle(
        _luckMeta,
        luck.isAcceptableOrUnknown(data['luck']!, _luckMeta),
      );
    } else if (isInserting) {
      context.missing(_luckMeta);
    }
    if (data.containsKey('charisma')) {
      context.handle(
        _charismaMeta,
        charisma.isAcceptableOrUnknown(data['charisma']!, _charismaMeta),
      );
    } else if (isInserting) {
      context.missing(_charismaMeta);
    }
    if (data.containsKey('wisdom')) {
      context.handle(
        _wisdomMeta,
        wisdom.isAcceptableOrUnknown(data['wisdom']!, _wisdomMeta),
      );
    } else if (isInserting) {
      context.missing(_wisdomMeta);
    }
    if (data.containsKey('intelligence')) {
      context.handle(
        _intelligenceMeta,
        intelligence.isAcceptableOrUnknown(
          data['intelligence']!,
          _intelligenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_intelligenceMeta);
    }
    if (data.containsKey('damage_dice')) {
      context.handle(
        _damageDiceMeta,
        damageDice.isAcceptableOrUnknown(data['damage_dice']!, _damageDiceMeta),
      );
    } else if (isInserting) {
      context.missing(_damageDiceMeta);
    }
    if (data.containsKey('armor_value')) {
      context.handle(
        _armorValueMeta,
        armorValue.isAcceptableOrUnknown(data['armor_value']!, _armorValueMeta),
      );
    } else if (isInserting) {
      context.missing(_armorValueMeta);
    }
    if (data.containsKey('tier')) {
      context.handle(
        _tierMeta,
        tier.isAcceptableOrUnknown(data['tier']!, _tierMeta),
      );
    } else if (isInserting) {
      context.missing(_tierMeta);
    }
    if (data.containsKey('behavior')) {
      context.handle(
        _behaviorMeta,
        behavior.isAcceptableOrUnknown(data['behavior']!, _behaviorMeta),
      );
    } else if (isInserting) {
      context.missing(_behaviorMeta);
    }
    if (data.containsKey('special_ability')) {
      context.handle(
        _specialAbilityMeta,
        specialAbility.isAcceptableOrUnknown(
          data['special_ability']!,
          _specialAbilityMeta,
        ),
      );
    }
    if (data.containsKey('loot_table')) {
      context.handle(
        _lootTableMeta,
        lootTable.isAcceptableOrUnknown(data['loot_table']!, _lootTableMeta),
      );
    } else if (isInserting) {
      context.missing(_lootTableMeta);
    }
    if (data.containsKey('conflict_tags')) {
      context.handle(
        _conflictTagsMeta,
        conflictTags.isAcceptableOrUnknown(
          data['conflict_tags']!,
          _conflictTagsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conflictTagsMeta);
    }
    if (data.containsKey('region_tags')) {
      context.handle(
        _regionTagsMeta,
        regionTags.isAcceptableOrUnknown(data['region_tags']!, _regionTagsMeta),
      );
    } else if (isInserting) {
      context.missing(_regionTagsMeta);
    }
    if (data.containsKey('xp_value')) {
      context.handle(
        _xpValueMeta,
        xpValue.isAcceptableOrUnknown(data['xp_value']!, _xpValueMeta),
      );
    } else if (isInserting) {
      context.missing(_xpValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EnemyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EnemyTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      strength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}strength'],
      )!,
      stamina: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stamina'],
      )!,
      agility: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}agility'],
      )!,
      luck: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}luck'],
      )!,
      charisma: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}charisma'],
      )!,
      wisdom: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wisdom'],
      )!,
      intelligence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}intelligence'],
      )!,
      damageDice: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}damage_dice'],
      )!,
      armorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}armor_value'],
      )!,
      tier: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tier'],
      )!,
      behavior: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}behavior'],
      )!,
      specialAbility: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}special_ability'],
      ),
      lootTable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}loot_table'],
      )!,
      conflictTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_tags'],
      )!,
      regionTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region_tags'],
      )!,
      xpValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp_value'],
      )!,
    );
  }

  @override
  $EnemyTableTable createAlias(String alias) {
    return $EnemyTableTable(attachedDatabase, alias);
  }
}

class EnemyTableData extends DataClass implements Insertable<EnemyTableData> {
  final String id;
  final String name;
  final String description;
  final int strength;
  final int stamina;
  final int agility;
  final int luck;
  final int charisma;
  final int wisdom;
  final int intelligence;
  final String damageDice;
  final int armorValue;
  final int tier;
  final String behavior;
  final String? specialAbility;
  final String lootTable;
  final String conflictTags;
  final String regionTags;
  final int xpValue;
  const EnemyTableData({
    required this.id,
    required this.name,
    required this.description,
    required this.strength,
    required this.stamina,
    required this.agility,
    required this.luck,
    required this.charisma,
    required this.wisdom,
    required this.intelligence,
    required this.damageDice,
    required this.armorValue,
    required this.tier,
    required this.behavior,
    this.specialAbility,
    required this.lootTable,
    required this.conflictTags,
    required this.regionTags,
    required this.xpValue,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['strength'] = Variable<int>(strength);
    map['stamina'] = Variable<int>(stamina);
    map['agility'] = Variable<int>(agility);
    map['luck'] = Variable<int>(luck);
    map['charisma'] = Variable<int>(charisma);
    map['wisdom'] = Variable<int>(wisdom);
    map['intelligence'] = Variable<int>(intelligence);
    map['damage_dice'] = Variable<String>(damageDice);
    map['armor_value'] = Variable<int>(armorValue);
    map['tier'] = Variable<int>(tier);
    map['behavior'] = Variable<String>(behavior);
    if (!nullToAbsent || specialAbility != null) {
      map['special_ability'] = Variable<String>(specialAbility);
    }
    map['loot_table'] = Variable<String>(lootTable);
    map['conflict_tags'] = Variable<String>(conflictTags);
    map['region_tags'] = Variable<String>(regionTags);
    map['xp_value'] = Variable<int>(xpValue);
    return map;
  }

  EnemyTableCompanion toCompanion(bool nullToAbsent) {
    return EnemyTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      strength: Value(strength),
      stamina: Value(stamina),
      agility: Value(agility),
      luck: Value(luck),
      charisma: Value(charisma),
      wisdom: Value(wisdom),
      intelligence: Value(intelligence),
      damageDice: Value(damageDice),
      armorValue: Value(armorValue),
      tier: Value(tier),
      behavior: Value(behavior),
      specialAbility: specialAbility == null && nullToAbsent
          ? const Value.absent()
          : Value(specialAbility),
      lootTable: Value(lootTable),
      conflictTags: Value(conflictTags),
      regionTags: Value(regionTags),
      xpValue: Value(xpValue),
    );
  }

  factory EnemyTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EnemyTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      strength: serializer.fromJson<int>(json['strength']),
      stamina: serializer.fromJson<int>(json['stamina']),
      agility: serializer.fromJson<int>(json['agility']),
      luck: serializer.fromJson<int>(json['luck']),
      charisma: serializer.fromJson<int>(json['charisma']),
      wisdom: serializer.fromJson<int>(json['wisdom']),
      intelligence: serializer.fromJson<int>(json['intelligence']),
      damageDice: serializer.fromJson<String>(json['damageDice']),
      armorValue: serializer.fromJson<int>(json['armorValue']),
      tier: serializer.fromJson<int>(json['tier']),
      behavior: serializer.fromJson<String>(json['behavior']),
      specialAbility: serializer.fromJson<String?>(json['specialAbility']),
      lootTable: serializer.fromJson<String>(json['lootTable']),
      conflictTags: serializer.fromJson<String>(json['conflictTags']),
      regionTags: serializer.fromJson<String>(json['regionTags']),
      xpValue: serializer.fromJson<int>(json['xpValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'strength': serializer.toJson<int>(strength),
      'stamina': serializer.toJson<int>(stamina),
      'agility': serializer.toJson<int>(agility),
      'luck': serializer.toJson<int>(luck),
      'charisma': serializer.toJson<int>(charisma),
      'wisdom': serializer.toJson<int>(wisdom),
      'intelligence': serializer.toJson<int>(intelligence),
      'damageDice': serializer.toJson<String>(damageDice),
      'armorValue': serializer.toJson<int>(armorValue),
      'tier': serializer.toJson<int>(tier),
      'behavior': serializer.toJson<String>(behavior),
      'specialAbility': serializer.toJson<String?>(specialAbility),
      'lootTable': serializer.toJson<String>(lootTable),
      'conflictTags': serializer.toJson<String>(conflictTags),
      'regionTags': serializer.toJson<String>(regionTags),
      'xpValue': serializer.toJson<int>(xpValue),
    };
  }

  EnemyTableData copyWith({
    String? id,
    String? name,
    String? description,
    int? strength,
    int? stamina,
    int? agility,
    int? luck,
    int? charisma,
    int? wisdom,
    int? intelligence,
    String? damageDice,
    int? armorValue,
    int? tier,
    String? behavior,
    Value<String?> specialAbility = const Value.absent(),
    String? lootTable,
    String? conflictTags,
    String? regionTags,
    int? xpValue,
  }) => EnemyTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    strength: strength ?? this.strength,
    stamina: stamina ?? this.stamina,
    agility: agility ?? this.agility,
    luck: luck ?? this.luck,
    charisma: charisma ?? this.charisma,
    wisdom: wisdom ?? this.wisdom,
    intelligence: intelligence ?? this.intelligence,
    damageDice: damageDice ?? this.damageDice,
    armorValue: armorValue ?? this.armorValue,
    tier: tier ?? this.tier,
    behavior: behavior ?? this.behavior,
    specialAbility: specialAbility.present
        ? specialAbility.value
        : this.specialAbility,
    lootTable: lootTable ?? this.lootTable,
    conflictTags: conflictTags ?? this.conflictTags,
    regionTags: regionTags ?? this.regionTags,
    xpValue: xpValue ?? this.xpValue,
  );
  EnemyTableData copyWithCompanion(EnemyTableCompanion data) {
    return EnemyTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      strength: data.strength.present ? data.strength.value : this.strength,
      stamina: data.stamina.present ? data.stamina.value : this.stamina,
      agility: data.agility.present ? data.agility.value : this.agility,
      luck: data.luck.present ? data.luck.value : this.luck,
      charisma: data.charisma.present ? data.charisma.value : this.charisma,
      wisdom: data.wisdom.present ? data.wisdom.value : this.wisdom,
      intelligence: data.intelligence.present
          ? data.intelligence.value
          : this.intelligence,
      damageDice: data.damageDice.present
          ? data.damageDice.value
          : this.damageDice,
      armorValue: data.armorValue.present
          ? data.armorValue.value
          : this.armorValue,
      tier: data.tier.present ? data.tier.value : this.tier,
      behavior: data.behavior.present ? data.behavior.value : this.behavior,
      specialAbility: data.specialAbility.present
          ? data.specialAbility.value
          : this.specialAbility,
      lootTable: data.lootTable.present ? data.lootTable.value : this.lootTable,
      conflictTags: data.conflictTags.present
          ? data.conflictTags.value
          : this.conflictTags,
      regionTags: data.regionTags.present
          ? data.regionTags.value
          : this.regionTags,
      xpValue: data.xpValue.present ? data.xpValue.value : this.xpValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EnemyTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('strength: $strength, ')
          ..write('stamina: $stamina, ')
          ..write('agility: $agility, ')
          ..write('luck: $luck, ')
          ..write('charisma: $charisma, ')
          ..write('wisdom: $wisdom, ')
          ..write('intelligence: $intelligence, ')
          ..write('damageDice: $damageDice, ')
          ..write('armorValue: $armorValue, ')
          ..write('tier: $tier, ')
          ..write('behavior: $behavior, ')
          ..write('specialAbility: $specialAbility, ')
          ..write('lootTable: $lootTable, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('regionTags: $regionTags, ')
          ..write('xpValue: $xpValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    strength,
    stamina,
    agility,
    luck,
    charisma,
    wisdom,
    intelligence,
    damageDice,
    armorValue,
    tier,
    behavior,
    specialAbility,
    lootTable,
    conflictTags,
    regionTags,
    xpValue,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EnemyTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.strength == this.strength &&
          other.stamina == this.stamina &&
          other.agility == this.agility &&
          other.luck == this.luck &&
          other.charisma == this.charisma &&
          other.wisdom == this.wisdom &&
          other.intelligence == this.intelligence &&
          other.damageDice == this.damageDice &&
          other.armorValue == this.armorValue &&
          other.tier == this.tier &&
          other.behavior == this.behavior &&
          other.specialAbility == this.specialAbility &&
          other.lootTable == this.lootTable &&
          other.conflictTags == this.conflictTags &&
          other.regionTags == this.regionTags &&
          other.xpValue == this.xpValue);
}

class EnemyTableCompanion extends UpdateCompanion<EnemyTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> strength;
  final Value<int> stamina;
  final Value<int> agility;
  final Value<int> luck;
  final Value<int> charisma;
  final Value<int> wisdom;
  final Value<int> intelligence;
  final Value<String> damageDice;
  final Value<int> armorValue;
  final Value<int> tier;
  final Value<String> behavior;
  final Value<String?> specialAbility;
  final Value<String> lootTable;
  final Value<String> conflictTags;
  final Value<String> regionTags;
  final Value<int> xpValue;
  final Value<int> rowid;
  const EnemyTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.strength = const Value.absent(),
    this.stamina = const Value.absent(),
    this.agility = const Value.absent(),
    this.luck = const Value.absent(),
    this.charisma = const Value.absent(),
    this.wisdom = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.damageDice = const Value.absent(),
    this.armorValue = const Value.absent(),
    this.tier = const Value.absent(),
    this.behavior = const Value.absent(),
    this.specialAbility = const Value.absent(),
    this.lootTable = const Value.absent(),
    this.conflictTags = const Value.absent(),
    this.regionTags = const Value.absent(),
    this.xpValue = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnemyTableCompanion.insert({
    required String id,
    required String name,
    required String description,
    required int strength,
    required int stamina,
    required int agility,
    required int luck,
    required int charisma,
    required int wisdom,
    required int intelligence,
    required String damageDice,
    required int armorValue,
    required int tier,
    required String behavior,
    this.specialAbility = const Value.absent(),
    required String lootTable,
    required String conflictTags,
    required String regionTags,
    required int xpValue,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       description = Value(description),
       strength = Value(strength),
       stamina = Value(stamina),
       agility = Value(agility),
       luck = Value(luck),
       charisma = Value(charisma),
       wisdom = Value(wisdom),
       intelligence = Value(intelligence),
       damageDice = Value(damageDice),
       armorValue = Value(armorValue),
       tier = Value(tier),
       behavior = Value(behavior),
       lootTable = Value(lootTable),
       conflictTags = Value(conflictTags),
       regionTags = Value(regionTags),
       xpValue = Value(xpValue);
  static Insertable<EnemyTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? strength,
    Expression<int>? stamina,
    Expression<int>? agility,
    Expression<int>? luck,
    Expression<int>? charisma,
    Expression<int>? wisdom,
    Expression<int>? intelligence,
    Expression<String>? damageDice,
    Expression<int>? armorValue,
    Expression<int>? tier,
    Expression<String>? behavior,
    Expression<String>? specialAbility,
    Expression<String>? lootTable,
    Expression<String>? conflictTags,
    Expression<String>? regionTags,
    Expression<int>? xpValue,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (strength != null) 'strength': strength,
      if (stamina != null) 'stamina': stamina,
      if (agility != null) 'agility': agility,
      if (luck != null) 'luck': luck,
      if (charisma != null) 'charisma': charisma,
      if (wisdom != null) 'wisdom': wisdom,
      if (intelligence != null) 'intelligence': intelligence,
      if (damageDice != null) 'damage_dice': damageDice,
      if (armorValue != null) 'armor_value': armorValue,
      if (tier != null) 'tier': tier,
      if (behavior != null) 'behavior': behavior,
      if (specialAbility != null) 'special_ability': specialAbility,
      if (lootTable != null) 'loot_table': lootTable,
      if (conflictTags != null) 'conflict_tags': conflictTags,
      if (regionTags != null) 'region_tags': regionTags,
      if (xpValue != null) 'xp_value': xpValue,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnemyTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? description,
    Value<int>? strength,
    Value<int>? stamina,
    Value<int>? agility,
    Value<int>? luck,
    Value<int>? charisma,
    Value<int>? wisdom,
    Value<int>? intelligence,
    Value<String>? damageDice,
    Value<int>? armorValue,
    Value<int>? tier,
    Value<String>? behavior,
    Value<String?>? specialAbility,
    Value<String>? lootTable,
    Value<String>? conflictTags,
    Value<String>? regionTags,
    Value<int>? xpValue,
    Value<int>? rowid,
  }) {
    return EnemyTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      strength: strength ?? this.strength,
      stamina: stamina ?? this.stamina,
      agility: agility ?? this.agility,
      luck: luck ?? this.luck,
      charisma: charisma ?? this.charisma,
      wisdom: wisdom ?? this.wisdom,
      intelligence: intelligence ?? this.intelligence,
      damageDice: damageDice ?? this.damageDice,
      armorValue: armorValue ?? this.armorValue,
      tier: tier ?? this.tier,
      behavior: behavior ?? this.behavior,
      specialAbility: specialAbility ?? this.specialAbility,
      lootTable: lootTable ?? this.lootTable,
      conflictTags: conflictTags ?? this.conflictTags,
      regionTags: regionTags ?? this.regionTags,
      xpValue: xpValue ?? this.xpValue,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (strength.present) {
      map['strength'] = Variable<int>(strength.value);
    }
    if (stamina.present) {
      map['stamina'] = Variable<int>(stamina.value);
    }
    if (agility.present) {
      map['agility'] = Variable<int>(agility.value);
    }
    if (luck.present) {
      map['luck'] = Variable<int>(luck.value);
    }
    if (charisma.present) {
      map['charisma'] = Variable<int>(charisma.value);
    }
    if (wisdom.present) {
      map['wisdom'] = Variable<int>(wisdom.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<int>(intelligence.value);
    }
    if (damageDice.present) {
      map['damage_dice'] = Variable<String>(damageDice.value);
    }
    if (armorValue.present) {
      map['armor_value'] = Variable<int>(armorValue.value);
    }
    if (tier.present) {
      map['tier'] = Variable<int>(tier.value);
    }
    if (behavior.present) {
      map['behavior'] = Variable<String>(behavior.value);
    }
    if (specialAbility.present) {
      map['special_ability'] = Variable<String>(specialAbility.value);
    }
    if (lootTable.present) {
      map['loot_table'] = Variable<String>(lootTable.value);
    }
    if (conflictTags.present) {
      map['conflict_tags'] = Variable<String>(conflictTags.value);
    }
    if (regionTags.present) {
      map['region_tags'] = Variable<String>(regionTags.value);
    }
    if (xpValue.present) {
      map['xp_value'] = Variable<int>(xpValue.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnemyTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('strength: $strength, ')
          ..write('stamina: $stamina, ')
          ..write('agility: $agility, ')
          ..write('luck: $luck, ')
          ..write('charisma: $charisma, ')
          ..write('wisdom: $wisdom, ')
          ..write('intelligence: $intelligence, ')
          ..write('damageDice: $damageDice, ')
          ..write('armorValue: $armorValue, ')
          ..write('tier: $tier, ')
          ..write('behavior: $behavior, ')
          ..write('specialAbility: $specialAbility, ')
          ..write('lootTable: $lootTable, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('regionTags: $regionTags, ')
          ..write('xpValue: $xpValue, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomTableTable extends RoomTable
    with TableInfo<$RoomTableTable, RoomTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
    'region',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _atmosphereMeta = const VerificationMeta(
    'atmosphere',
  );
  @override
  late final GeneratedColumn<String> atmosphere = GeneratedColumn<String>(
    'atmosphere',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conflictTagsMeta = const VerificationMeta(
    'conflictTags',
  );
  @override
  late final GeneratedColumn<String> conflictTags = GeneratedColumn<String>(
    'conflict_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _encounterEligibleMeta = const VerificationMeta(
    'encounterEligible',
  );
  @override
  late final GeneratedColumn<bool> encounterEligible = GeneratedColumn<bool>(
    'encounter_eligible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("encounter_eligible" IN (0, 1))',
    ),
  );
  static const VerificationMeta _lootEligibleMeta = const VerificationMeta(
    'lootEligible',
  );
  @override
  late final GeneratedColumn<bool> lootEligible = GeneratedColumn<bool>(
    'loot_eligible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("loot_eligible" IN (0, 1))',
    ),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    region,
    description,
    atmosphere,
    conflictTags,
    encounterEligible,
    lootEligible,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoomTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('region')) {
      context.handle(
        _regionMeta,
        region.isAcceptableOrUnknown(data['region']!, _regionMeta),
      );
    } else if (isInserting) {
      context.missing(_regionMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('atmosphere')) {
      context.handle(
        _atmosphereMeta,
        atmosphere.isAcceptableOrUnknown(data['atmosphere']!, _atmosphereMeta),
      );
    } else if (isInserting) {
      context.missing(_atmosphereMeta);
    }
    if (data.containsKey('conflict_tags')) {
      context.handle(
        _conflictTagsMeta,
        conflictTags.isAcceptableOrUnknown(
          data['conflict_tags']!,
          _conflictTagsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conflictTagsMeta);
    }
    if (data.containsKey('encounter_eligible')) {
      context.handle(
        _encounterEligibleMeta,
        encounterEligible.isAcceptableOrUnknown(
          data['encounter_eligible']!,
          _encounterEligibleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_encounterEligibleMeta);
    }
    if (data.containsKey('loot_eligible')) {
      context.handle(
        _lootEligibleMeta,
        lootEligible.isAcceptableOrUnknown(
          data['loot_eligible']!,
          _lootEligibleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lootEligibleMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      region: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      atmosphere: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}atmosphere'],
      )!,
      conflictTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_tags'],
      )!,
      encounterEligible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}encounter_eligible'],
      )!,
      lootEligible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}loot_eligible'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $RoomTableTable createAlias(String alias) {
    return $RoomTableTable(attachedDatabase, alias);
  }
}

class RoomTableData extends DataClass implements Insertable<RoomTableData> {
  final String id;
  final String name;
  final String region;
  final String description;
  final String atmosphere;
  final String conflictTags;
  final bool encounterEligible;
  final bool lootEligible;
  final String? notes;
  const RoomTableData({
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['region'] = Variable<String>(region);
    map['description'] = Variable<String>(description);
    map['atmosphere'] = Variable<String>(atmosphere);
    map['conflict_tags'] = Variable<String>(conflictTags);
    map['encounter_eligible'] = Variable<bool>(encounterEligible);
    map['loot_eligible'] = Variable<bool>(lootEligible);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  RoomTableCompanion toCompanion(bool nullToAbsent) {
    return RoomTableCompanion(
      id: Value(id),
      name: Value(name),
      region: Value(region),
      description: Value(description),
      atmosphere: Value(atmosphere),
      conflictTags: Value(conflictTags),
      encounterEligible: Value(encounterEligible),
      lootEligible: Value(lootEligible),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory RoomTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      region: serializer.fromJson<String>(json['region']),
      description: serializer.fromJson<String>(json['description']),
      atmosphere: serializer.fromJson<String>(json['atmosphere']),
      conflictTags: serializer.fromJson<String>(json['conflictTags']),
      encounterEligible: serializer.fromJson<bool>(json['encounterEligible']),
      lootEligible: serializer.fromJson<bool>(json['lootEligible']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'region': serializer.toJson<String>(region),
      'description': serializer.toJson<String>(description),
      'atmosphere': serializer.toJson<String>(atmosphere),
      'conflictTags': serializer.toJson<String>(conflictTags),
      'encounterEligible': serializer.toJson<bool>(encounterEligible),
      'lootEligible': serializer.toJson<bool>(lootEligible),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  RoomTableData copyWith({
    String? id,
    String? name,
    String? region,
    String? description,
    String? atmosphere,
    String? conflictTags,
    bool? encounterEligible,
    bool? lootEligible,
    Value<String?> notes = const Value.absent(),
  }) => RoomTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    region: region ?? this.region,
    description: description ?? this.description,
    atmosphere: atmosphere ?? this.atmosphere,
    conflictTags: conflictTags ?? this.conflictTags,
    encounterEligible: encounterEligible ?? this.encounterEligible,
    lootEligible: lootEligible ?? this.lootEligible,
    notes: notes.present ? notes.value : this.notes,
  );
  RoomTableData copyWithCompanion(RoomTableCompanion data) {
    return RoomTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      region: data.region.present ? data.region.value : this.region,
      description: data.description.present
          ? data.description.value
          : this.description,
      atmosphere: data.atmosphere.present
          ? data.atmosphere.value
          : this.atmosphere,
      conflictTags: data.conflictTags.present
          ? data.conflictTags.value
          : this.conflictTags,
      encounterEligible: data.encounterEligible.present
          ? data.encounterEligible.value
          : this.encounterEligible,
      lootEligible: data.lootEligible.present
          ? data.lootEligible.value
          : this.lootEligible,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('region: $region, ')
          ..write('description: $description, ')
          ..write('atmosphere: $atmosphere, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('encounterEligible: $encounterEligible, ')
          ..write('lootEligible: $lootEligible, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    region,
    description,
    atmosphere,
    conflictTags,
    encounterEligible,
    lootEligible,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.region == this.region &&
          other.description == this.description &&
          other.atmosphere == this.atmosphere &&
          other.conflictTags == this.conflictTags &&
          other.encounterEligible == this.encounterEligible &&
          other.lootEligible == this.lootEligible &&
          other.notes == this.notes);
}

class RoomTableCompanion extends UpdateCompanion<RoomTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> region;
  final Value<String> description;
  final Value<String> atmosphere;
  final Value<String> conflictTags;
  final Value<bool> encounterEligible;
  final Value<bool> lootEligible;
  final Value<String?> notes;
  final Value<int> rowid;
  const RoomTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.region = const Value.absent(),
    this.description = const Value.absent(),
    this.atmosphere = const Value.absent(),
    this.conflictTags = const Value.absent(),
    this.encounterEligible = const Value.absent(),
    this.lootEligible = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomTableCompanion.insert({
    required String id,
    required String name,
    required String region,
    required String description,
    required String atmosphere,
    required String conflictTags,
    required bool encounterEligible,
    required bool lootEligible,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       region = Value(region),
       description = Value(description),
       atmosphere = Value(atmosphere),
       conflictTags = Value(conflictTags),
       encounterEligible = Value(encounterEligible),
       lootEligible = Value(lootEligible);
  static Insertable<RoomTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? region,
    Expression<String>? description,
    Expression<String>? atmosphere,
    Expression<String>? conflictTags,
    Expression<bool>? encounterEligible,
    Expression<bool>? lootEligible,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (region != null) 'region': region,
      if (description != null) 'description': description,
      if (atmosphere != null) 'atmosphere': atmosphere,
      if (conflictTags != null) 'conflict_tags': conflictTags,
      if (encounterEligible != null) 'encounter_eligible': encounterEligible,
      if (lootEligible != null) 'loot_eligible': lootEligible,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? region,
    Value<String>? description,
    Value<String>? atmosphere,
    Value<String>? conflictTags,
    Value<bool>? encounterEligible,
    Value<bool>? lootEligible,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return RoomTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      region: region ?? this.region,
      description: description ?? this.description,
      atmosphere: atmosphere ?? this.atmosphere,
      conflictTags: conflictTags ?? this.conflictTags,
      encounterEligible: encounterEligible ?? this.encounterEligible,
      lootEligible: lootEligible ?? this.lootEligible,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (atmosphere.present) {
      map['atmosphere'] = Variable<String>(atmosphere.value);
    }
    if (conflictTags.present) {
      map['conflict_tags'] = Variable<String>(conflictTags.value);
    }
    if (encounterEligible.present) {
      map['encounter_eligible'] = Variable<bool>(encounterEligible.value);
    }
    if (lootEligible.present) {
      map['loot_eligible'] = Variable<bool>(lootEligible.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('region: $region, ')
          ..write('description: $description, ')
          ..write('atmosphere: $atmosphere, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('encounterEligible: $encounterEligible, ')
          ..write('lootEligible: $lootEligible, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeaponTableTable extends WeaponTable
    with TableInfo<$WeaponTableTable, WeaponTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeaponTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weaponTypeMeta = const VerificationMeta(
    'weaponType',
  );
  @override
  late final GeneratedColumn<String> weaponType = GeneratedColumn<String>(
    'weapon_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tierMeta = const VerificationMeta('tier');
  @override
  late final GeneratedColumn<int> tier = GeneratedColumn<int>(
    'tier',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _damageDiceMeta = const VerificationMeta(
    'damageDice',
  );
  @override
  late final GeneratedColumn<String> damageDice = GeneratedColumn<String>(
    'damage_dice',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statRequirementMeta = const VerificationMeta(
    'statRequirement',
  );
  @override
  late final GeneratedColumn<String> statRequirement = GeneratedColumn<String>(
    'stat_requirement',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requirementThresholdMeta =
      const VerificationMeta('requirementThreshold');
  @override
  late final GeneratedColumn<int> requirementThreshold = GeneratedColumn<int>(
    'requirement_threshold',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _specialEffectMeta = const VerificationMeta(
    'specialEffect',
  );
  @override
  late final GeneratedColumn<String> specialEffect = GeneratedColumn<String>(
    'special_effect',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conflictTagsMeta = const VerificationMeta(
    'conflictTags',
  );
  @override
  late final GeneratedColumn<String> conflictTags = GeneratedColumn<String>(
    'conflict_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regionTagsMeta = const VerificationMeta(
    'regionTags',
  );
  @override
  late final GeneratedColumn<String> regionTags = GeneratedColumn<String>(
    'region_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    weaponType,
    tier,
    description,
    damageDice,
    statRequirement,
    requirementThreshold,
    specialEffect,
    conflictTags,
    regionTags,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weapon_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeaponTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('weapon_type')) {
      context.handle(
        _weaponTypeMeta,
        weaponType.isAcceptableOrUnknown(data['weapon_type']!, _weaponTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_weaponTypeMeta);
    }
    if (data.containsKey('tier')) {
      context.handle(
        _tierMeta,
        tier.isAcceptableOrUnknown(data['tier']!, _tierMeta),
      );
    } else if (isInserting) {
      context.missing(_tierMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('damage_dice')) {
      context.handle(
        _damageDiceMeta,
        damageDice.isAcceptableOrUnknown(data['damage_dice']!, _damageDiceMeta),
      );
    } else if (isInserting) {
      context.missing(_damageDiceMeta);
    }
    if (data.containsKey('stat_requirement')) {
      context.handle(
        _statRequirementMeta,
        statRequirement.isAcceptableOrUnknown(
          data['stat_requirement']!,
          _statRequirementMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_statRequirementMeta);
    }
    if (data.containsKey('requirement_threshold')) {
      context.handle(
        _requirementThresholdMeta,
        requirementThreshold.isAcceptableOrUnknown(
          data['requirement_threshold']!,
          _requirementThresholdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requirementThresholdMeta);
    }
    if (data.containsKey('special_effect')) {
      context.handle(
        _specialEffectMeta,
        specialEffect.isAcceptableOrUnknown(
          data['special_effect']!,
          _specialEffectMeta,
        ),
      );
    }
    if (data.containsKey('conflict_tags')) {
      context.handle(
        _conflictTagsMeta,
        conflictTags.isAcceptableOrUnknown(
          data['conflict_tags']!,
          _conflictTagsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conflictTagsMeta);
    }
    if (data.containsKey('region_tags')) {
      context.handle(
        _regionTagsMeta,
        regionTags.isAcceptableOrUnknown(data['region_tags']!, _regionTagsMeta),
      );
    } else if (isInserting) {
      context.missing(_regionTagsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeaponTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeaponTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      weaponType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weapon_type'],
      )!,
      tier: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tier'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      damageDice: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}damage_dice'],
      )!,
      statRequirement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stat_requirement'],
      )!,
      requirementThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}requirement_threshold'],
      )!,
      specialEffect: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}special_effect'],
      ),
      conflictTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_tags'],
      )!,
      regionTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region_tags'],
      )!,
    );
  }

  @override
  $WeaponTableTable createAlias(String alias) {
    return $WeaponTableTable(attachedDatabase, alias);
  }
}

class WeaponTableData extends DataClass implements Insertable<WeaponTableData> {
  final String id;
  final String name;
  final String weaponType;
  final int tier;
  final String description;
  final String damageDice;
  final String statRequirement;
  final int requirementThreshold;
  final String? specialEffect;
  final String conflictTags;
  final String regionTags;
  const WeaponTableData({
    required this.id,
    required this.name,
    required this.weaponType,
    required this.tier,
    required this.description,
    required this.damageDice,
    required this.statRequirement,
    required this.requirementThreshold,
    this.specialEffect,
    required this.conflictTags,
    required this.regionTags,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['weapon_type'] = Variable<String>(weaponType);
    map['tier'] = Variable<int>(tier);
    map['description'] = Variable<String>(description);
    map['damage_dice'] = Variable<String>(damageDice);
    map['stat_requirement'] = Variable<String>(statRequirement);
    map['requirement_threshold'] = Variable<int>(requirementThreshold);
    if (!nullToAbsent || specialEffect != null) {
      map['special_effect'] = Variable<String>(specialEffect);
    }
    map['conflict_tags'] = Variable<String>(conflictTags);
    map['region_tags'] = Variable<String>(regionTags);
    return map;
  }

  WeaponTableCompanion toCompanion(bool nullToAbsent) {
    return WeaponTableCompanion(
      id: Value(id),
      name: Value(name),
      weaponType: Value(weaponType),
      tier: Value(tier),
      description: Value(description),
      damageDice: Value(damageDice),
      statRequirement: Value(statRequirement),
      requirementThreshold: Value(requirementThreshold),
      specialEffect: specialEffect == null && nullToAbsent
          ? const Value.absent()
          : Value(specialEffect),
      conflictTags: Value(conflictTags),
      regionTags: Value(regionTags),
    );
  }

  factory WeaponTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeaponTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      weaponType: serializer.fromJson<String>(json['weaponType']),
      tier: serializer.fromJson<int>(json['tier']),
      description: serializer.fromJson<String>(json['description']),
      damageDice: serializer.fromJson<String>(json['damageDice']),
      statRequirement: serializer.fromJson<String>(json['statRequirement']),
      requirementThreshold: serializer.fromJson<int>(
        json['requirementThreshold'],
      ),
      specialEffect: serializer.fromJson<String?>(json['specialEffect']),
      conflictTags: serializer.fromJson<String>(json['conflictTags']),
      regionTags: serializer.fromJson<String>(json['regionTags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'weaponType': serializer.toJson<String>(weaponType),
      'tier': serializer.toJson<int>(tier),
      'description': serializer.toJson<String>(description),
      'damageDice': serializer.toJson<String>(damageDice),
      'statRequirement': serializer.toJson<String>(statRequirement),
      'requirementThreshold': serializer.toJson<int>(requirementThreshold),
      'specialEffect': serializer.toJson<String?>(specialEffect),
      'conflictTags': serializer.toJson<String>(conflictTags),
      'regionTags': serializer.toJson<String>(regionTags),
    };
  }

  WeaponTableData copyWith({
    String? id,
    String? name,
    String? weaponType,
    int? tier,
    String? description,
    String? damageDice,
    String? statRequirement,
    int? requirementThreshold,
    Value<String?> specialEffect = const Value.absent(),
    String? conflictTags,
    String? regionTags,
  }) => WeaponTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    weaponType: weaponType ?? this.weaponType,
    tier: tier ?? this.tier,
    description: description ?? this.description,
    damageDice: damageDice ?? this.damageDice,
    statRequirement: statRequirement ?? this.statRequirement,
    requirementThreshold: requirementThreshold ?? this.requirementThreshold,
    specialEffect: specialEffect.present
        ? specialEffect.value
        : this.specialEffect,
    conflictTags: conflictTags ?? this.conflictTags,
    regionTags: regionTags ?? this.regionTags,
  );
  WeaponTableData copyWithCompanion(WeaponTableCompanion data) {
    return WeaponTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      weaponType: data.weaponType.present
          ? data.weaponType.value
          : this.weaponType,
      tier: data.tier.present ? data.tier.value : this.tier,
      description: data.description.present
          ? data.description.value
          : this.description,
      damageDice: data.damageDice.present
          ? data.damageDice.value
          : this.damageDice,
      statRequirement: data.statRequirement.present
          ? data.statRequirement.value
          : this.statRequirement,
      requirementThreshold: data.requirementThreshold.present
          ? data.requirementThreshold.value
          : this.requirementThreshold,
      specialEffect: data.specialEffect.present
          ? data.specialEffect.value
          : this.specialEffect,
      conflictTags: data.conflictTags.present
          ? data.conflictTags.value
          : this.conflictTags,
      regionTags: data.regionTags.present
          ? data.regionTags.value
          : this.regionTags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeaponTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weaponType: $weaponType, ')
          ..write('tier: $tier, ')
          ..write('description: $description, ')
          ..write('damageDice: $damageDice, ')
          ..write('statRequirement: $statRequirement, ')
          ..write('requirementThreshold: $requirementThreshold, ')
          ..write('specialEffect: $specialEffect, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('regionTags: $regionTags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    weaponType,
    tier,
    description,
    damageDice,
    statRequirement,
    requirementThreshold,
    specialEffect,
    conflictTags,
    regionTags,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeaponTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.weaponType == this.weaponType &&
          other.tier == this.tier &&
          other.description == this.description &&
          other.damageDice == this.damageDice &&
          other.statRequirement == this.statRequirement &&
          other.requirementThreshold == this.requirementThreshold &&
          other.specialEffect == this.specialEffect &&
          other.conflictTags == this.conflictTags &&
          other.regionTags == this.regionTags);
}

class WeaponTableCompanion extends UpdateCompanion<WeaponTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> weaponType;
  final Value<int> tier;
  final Value<String> description;
  final Value<String> damageDice;
  final Value<String> statRequirement;
  final Value<int> requirementThreshold;
  final Value<String?> specialEffect;
  final Value<String> conflictTags;
  final Value<String> regionTags;
  final Value<int> rowid;
  const WeaponTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.weaponType = const Value.absent(),
    this.tier = const Value.absent(),
    this.description = const Value.absent(),
    this.damageDice = const Value.absent(),
    this.statRequirement = const Value.absent(),
    this.requirementThreshold = const Value.absent(),
    this.specialEffect = const Value.absent(),
    this.conflictTags = const Value.absent(),
    this.regionTags = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeaponTableCompanion.insert({
    required String id,
    required String name,
    required String weaponType,
    required int tier,
    required String description,
    required String damageDice,
    required String statRequirement,
    required int requirementThreshold,
    this.specialEffect = const Value.absent(),
    required String conflictTags,
    required String regionTags,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       weaponType = Value(weaponType),
       tier = Value(tier),
       description = Value(description),
       damageDice = Value(damageDice),
       statRequirement = Value(statRequirement),
       requirementThreshold = Value(requirementThreshold),
       conflictTags = Value(conflictTags),
       regionTags = Value(regionTags);
  static Insertable<WeaponTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? weaponType,
    Expression<int>? tier,
    Expression<String>? description,
    Expression<String>? damageDice,
    Expression<String>? statRequirement,
    Expression<int>? requirementThreshold,
    Expression<String>? specialEffect,
    Expression<String>? conflictTags,
    Expression<String>? regionTags,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (weaponType != null) 'weapon_type': weaponType,
      if (tier != null) 'tier': tier,
      if (description != null) 'description': description,
      if (damageDice != null) 'damage_dice': damageDice,
      if (statRequirement != null) 'stat_requirement': statRequirement,
      if (requirementThreshold != null)
        'requirement_threshold': requirementThreshold,
      if (specialEffect != null) 'special_effect': specialEffect,
      if (conflictTags != null) 'conflict_tags': conflictTags,
      if (regionTags != null) 'region_tags': regionTags,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeaponTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? weaponType,
    Value<int>? tier,
    Value<String>? description,
    Value<String>? damageDice,
    Value<String>? statRequirement,
    Value<int>? requirementThreshold,
    Value<String?>? specialEffect,
    Value<String>? conflictTags,
    Value<String>? regionTags,
    Value<int>? rowid,
  }) {
    return WeaponTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      weaponType: weaponType ?? this.weaponType,
      tier: tier ?? this.tier,
      description: description ?? this.description,
      damageDice: damageDice ?? this.damageDice,
      statRequirement: statRequirement ?? this.statRequirement,
      requirementThreshold: requirementThreshold ?? this.requirementThreshold,
      specialEffect: specialEffect ?? this.specialEffect,
      conflictTags: conflictTags ?? this.conflictTags,
      regionTags: regionTags ?? this.regionTags,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weaponType.present) {
      map['weapon_type'] = Variable<String>(weaponType.value);
    }
    if (tier.present) {
      map['tier'] = Variable<int>(tier.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (damageDice.present) {
      map['damage_dice'] = Variable<String>(damageDice.value);
    }
    if (statRequirement.present) {
      map['stat_requirement'] = Variable<String>(statRequirement.value);
    }
    if (requirementThreshold.present) {
      map['requirement_threshold'] = Variable<int>(requirementThreshold.value);
    }
    if (specialEffect.present) {
      map['special_effect'] = Variable<String>(specialEffect.value);
    }
    if (conflictTags.present) {
      map['conflict_tags'] = Variable<String>(conflictTags.value);
    }
    if (regionTags.present) {
      map['region_tags'] = Variable<String>(regionTags.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeaponTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weaponType: $weaponType, ')
          ..write('tier: $tier, ')
          ..write('description: $description, ')
          ..write('damageDice: $damageDice, ')
          ..write('statRequirement: $statRequirement, ')
          ..write('requirementThreshold: $requirementThreshold, ')
          ..write('specialEffect: $specialEffect, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('regionTags: $regionTags, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArmorTableTable extends ArmorTable
    with TableInfo<$ArmorTableTable, ArmorTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArmorTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _armorTypeMeta = const VerificationMeta(
    'armorType',
  );
  @override
  late final GeneratedColumn<String> armorType = GeneratedColumn<String>(
    'armor_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tierMeta = const VerificationMeta('tier');
  @override
  late final GeneratedColumn<int> tier = GeneratedColumn<int>(
    'tier',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defenseValueMeta = const VerificationMeta(
    'defenseValue',
  );
  @override
  late final GeneratedColumn<int> defenseValue = GeneratedColumn<int>(
    'defense_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statRequirementMeta = const VerificationMeta(
    'statRequirement',
  );
  @override
  late final GeneratedColumn<String> statRequirement = GeneratedColumn<String>(
    'stat_requirement',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requirementThresholdMeta =
      const VerificationMeta('requirementThreshold');
  @override
  late final GeneratedColumn<int> requirementThreshold = GeneratedColumn<int>(
    'requirement_threshold',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agilityPenaltyMeta = const VerificationMeta(
    'agilityPenalty',
  );
  @override
  late final GeneratedColumn<int> agilityPenalty = GeneratedColumn<int>(
    'agility_penalty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _specialEffectMeta = const VerificationMeta(
    'specialEffect',
  );
  @override
  late final GeneratedColumn<String> specialEffect = GeneratedColumn<String>(
    'special_effect',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conflictTagsMeta = const VerificationMeta(
    'conflictTags',
  );
  @override
  late final GeneratedColumn<String> conflictTags = GeneratedColumn<String>(
    'conflict_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regionTagsMeta = const VerificationMeta(
    'regionTags',
  );
  @override
  late final GeneratedColumn<String> regionTags = GeneratedColumn<String>(
    'region_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    armorType,
    tier,
    description,
    defenseValue,
    statRequirement,
    requirementThreshold,
    agilityPenalty,
    specialEffect,
    conflictTags,
    regionTags,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'armor_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ArmorTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('armor_type')) {
      context.handle(
        _armorTypeMeta,
        armorType.isAcceptableOrUnknown(data['armor_type']!, _armorTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_armorTypeMeta);
    }
    if (data.containsKey('tier')) {
      context.handle(
        _tierMeta,
        tier.isAcceptableOrUnknown(data['tier']!, _tierMeta),
      );
    } else if (isInserting) {
      context.missing(_tierMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('defense_value')) {
      context.handle(
        _defenseValueMeta,
        defenseValue.isAcceptableOrUnknown(
          data['defense_value']!,
          _defenseValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defenseValueMeta);
    }
    if (data.containsKey('stat_requirement')) {
      context.handle(
        _statRequirementMeta,
        statRequirement.isAcceptableOrUnknown(
          data['stat_requirement']!,
          _statRequirementMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_statRequirementMeta);
    }
    if (data.containsKey('requirement_threshold')) {
      context.handle(
        _requirementThresholdMeta,
        requirementThreshold.isAcceptableOrUnknown(
          data['requirement_threshold']!,
          _requirementThresholdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requirementThresholdMeta);
    }
    if (data.containsKey('agility_penalty')) {
      context.handle(
        _agilityPenaltyMeta,
        agilityPenalty.isAcceptableOrUnknown(
          data['agility_penalty']!,
          _agilityPenaltyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_agilityPenaltyMeta);
    }
    if (data.containsKey('special_effect')) {
      context.handle(
        _specialEffectMeta,
        specialEffect.isAcceptableOrUnknown(
          data['special_effect']!,
          _specialEffectMeta,
        ),
      );
    }
    if (data.containsKey('conflict_tags')) {
      context.handle(
        _conflictTagsMeta,
        conflictTags.isAcceptableOrUnknown(
          data['conflict_tags']!,
          _conflictTagsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conflictTagsMeta);
    }
    if (data.containsKey('region_tags')) {
      context.handle(
        _regionTagsMeta,
        regionTags.isAcceptableOrUnknown(data['region_tags']!, _regionTagsMeta),
      );
    } else if (isInserting) {
      context.missing(_regionTagsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArmorTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArmorTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      armorType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}armor_type'],
      )!,
      tier: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tier'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      defenseValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}defense_value'],
      )!,
      statRequirement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stat_requirement'],
      )!,
      requirementThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}requirement_threshold'],
      )!,
      agilityPenalty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}agility_penalty'],
      )!,
      specialEffect: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}special_effect'],
      ),
      conflictTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_tags'],
      )!,
      regionTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region_tags'],
      )!,
    );
  }

  @override
  $ArmorTableTable createAlias(String alias) {
    return $ArmorTableTable(attachedDatabase, alias);
  }
}

class ArmorTableData extends DataClass implements Insertable<ArmorTableData> {
  final String id;
  final String name;
  final String armorType;
  final int tier;
  final String description;
  final int defenseValue;
  final String statRequirement;
  final int requirementThreshold;
  final int agilityPenalty;
  final String? specialEffect;
  final String conflictTags;
  final String regionTags;
  const ArmorTableData({
    required this.id,
    required this.name,
    required this.armorType,
    required this.tier,
    required this.description,
    required this.defenseValue,
    required this.statRequirement,
    required this.requirementThreshold,
    required this.agilityPenalty,
    this.specialEffect,
    required this.conflictTags,
    required this.regionTags,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['armor_type'] = Variable<String>(armorType);
    map['tier'] = Variable<int>(tier);
    map['description'] = Variable<String>(description);
    map['defense_value'] = Variable<int>(defenseValue);
    map['stat_requirement'] = Variable<String>(statRequirement);
    map['requirement_threshold'] = Variable<int>(requirementThreshold);
    map['agility_penalty'] = Variable<int>(agilityPenalty);
    if (!nullToAbsent || specialEffect != null) {
      map['special_effect'] = Variable<String>(specialEffect);
    }
    map['conflict_tags'] = Variable<String>(conflictTags);
    map['region_tags'] = Variable<String>(regionTags);
    return map;
  }

  ArmorTableCompanion toCompanion(bool nullToAbsent) {
    return ArmorTableCompanion(
      id: Value(id),
      name: Value(name),
      armorType: Value(armorType),
      tier: Value(tier),
      description: Value(description),
      defenseValue: Value(defenseValue),
      statRequirement: Value(statRequirement),
      requirementThreshold: Value(requirementThreshold),
      agilityPenalty: Value(agilityPenalty),
      specialEffect: specialEffect == null && nullToAbsent
          ? const Value.absent()
          : Value(specialEffect),
      conflictTags: Value(conflictTags),
      regionTags: Value(regionTags),
    );
  }

  factory ArmorTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArmorTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      armorType: serializer.fromJson<String>(json['armorType']),
      tier: serializer.fromJson<int>(json['tier']),
      description: serializer.fromJson<String>(json['description']),
      defenseValue: serializer.fromJson<int>(json['defenseValue']),
      statRequirement: serializer.fromJson<String>(json['statRequirement']),
      requirementThreshold: serializer.fromJson<int>(
        json['requirementThreshold'],
      ),
      agilityPenalty: serializer.fromJson<int>(json['agilityPenalty']),
      specialEffect: serializer.fromJson<String?>(json['specialEffect']),
      conflictTags: serializer.fromJson<String>(json['conflictTags']),
      regionTags: serializer.fromJson<String>(json['regionTags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'armorType': serializer.toJson<String>(armorType),
      'tier': serializer.toJson<int>(tier),
      'description': serializer.toJson<String>(description),
      'defenseValue': serializer.toJson<int>(defenseValue),
      'statRequirement': serializer.toJson<String>(statRequirement),
      'requirementThreshold': serializer.toJson<int>(requirementThreshold),
      'agilityPenalty': serializer.toJson<int>(agilityPenalty),
      'specialEffect': serializer.toJson<String?>(specialEffect),
      'conflictTags': serializer.toJson<String>(conflictTags),
      'regionTags': serializer.toJson<String>(regionTags),
    };
  }

  ArmorTableData copyWith({
    String? id,
    String? name,
    String? armorType,
    int? tier,
    String? description,
    int? defenseValue,
    String? statRequirement,
    int? requirementThreshold,
    int? agilityPenalty,
    Value<String?> specialEffect = const Value.absent(),
    String? conflictTags,
    String? regionTags,
  }) => ArmorTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    armorType: armorType ?? this.armorType,
    tier: tier ?? this.tier,
    description: description ?? this.description,
    defenseValue: defenseValue ?? this.defenseValue,
    statRequirement: statRequirement ?? this.statRequirement,
    requirementThreshold: requirementThreshold ?? this.requirementThreshold,
    agilityPenalty: agilityPenalty ?? this.agilityPenalty,
    specialEffect: specialEffect.present
        ? specialEffect.value
        : this.specialEffect,
    conflictTags: conflictTags ?? this.conflictTags,
    regionTags: regionTags ?? this.regionTags,
  );
  ArmorTableData copyWithCompanion(ArmorTableCompanion data) {
    return ArmorTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      armorType: data.armorType.present ? data.armorType.value : this.armorType,
      tier: data.tier.present ? data.tier.value : this.tier,
      description: data.description.present
          ? data.description.value
          : this.description,
      defenseValue: data.defenseValue.present
          ? data.defenseValue.value
          : this.defenseValue,
      statRequirement: data.statRequirement.present
          ? data.statRequirement.value
          : this.statRequirement,
      requirementThreshold: data.requirementThreshold.present
          ? data.requirementThreshold.value
          : this.requirementThreshold,
      agilityPenalty: data.agilityPenalty.present
          ? data.agilityPenalty.value
          : this.agilityPenalty,
      specialEffect: data.specialEffect.present
          ? data.specialEffect.value
          : this.specialEffect,
      conflictTags: data.conflictTags.present
          ? data.conflictTags.value
          : this.conflictTags,
      regionTags: data.regionTags.present
          ? data.regionTags.value
          : this.regionTags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArmorTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('armorType: $armorType, ')
          ..write('tier: $tier, ')
          ..write('description: $description, ')
          ..write('defenseValue: $defenseValue, ')
          ..write('statRequirement: $statRequirement, ')
          ..write('requirementThreshold: $requirementThreshold, ')
          ..write('agilityPenalty: $agilityPenalty, ')
          ..write('specialEffect: $specialEffect, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('regionTags: $regionTags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    armorType,
    tier,
    description,
    defenseValue,
    statRequirement,
    requirementThreshold,
    agilityPenalty,
    specialEffect,
    conflictTags,
    regionTags,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArmorTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.armorType == this.armorType &&
          other.tier == this.tier &&
          other.description == this.description &&
          other.defenseValue == this.defenseValue &&
          other.statRequirement == this.statRequirement &&
          other.requirementThreshold == this.requirementThreshold &&
          other.agilityPenalty == this.agilityPenalty &&
          other.specialEffect == this.specialEffect &&
          other.conflictTags == this.conflictTags &&
          other.regionTags == this.regionTags);
}

class ArmorTableCompanion extends UpdateCompanion<ArmorTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> armorType;
  final Value<int> tier;
  final Value<String> description;
  final Value<int> defenseValue;
  final Value<String> statRequirement;
  final Value<int> requirementThreshold;
  final Value<int> agilityPenalty;
  final Value<String?> specialEffect;
  final Value<String> conflictTags;
  final Value<String> regionTags;
  final Value<int> rowid;
  const ArmorTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.armorType = const Value.absent(),
    this.tier = const Value.absent(),
    this.description = const Value.absent(),
    this.defenseValue = const Value.absent(),
    this.statRequirement = const Value.absent(),
    this.requirementThreshold = const Value.absent(),
    this.agilityPenalty = const Value.absent(),
    this.specialEffect = const Value.absent(),
    this.conflictTags = const Value.absent(),
    this.regionTags = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArmorTableCompanion.insert({
    required String id,
    required String name,
    required String armorType,
    required int tier,
    required String description,
    required int defenseValue,
    required String statRequirement,
    required int requirementThreshold,
    required int agilityPenalty,
    this.specialEffect = const Value.absent(),
    required String conflictTags,
    required String regionTags,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       armorType = Value(armorType),
       tier = Value(tier),
       description = Value(description),
       defenseValue = Value(defenseValue),
       statRequirement = Value(statRequirement),
       requirementThreshold = Value(requirementThreshold),
       agilityPenalty = Value(agilityPenalty),
       conflictTags = Value(conflictTags),
       regionTags = Value(regionTags);
  static Insertable<ArmorTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? armorType,
    Expression<int>? tier,
    Expression<String>? description,
    Expression<int>? defenseValue,
    Expression<String>? statRequirement,
    Expression<int>? requirementThreshold,
    Expression<int>? agilityPenalty,
    Expression<String>? specialEffect,
    Expression<String>? conflictTags,
    Expression<String>? regionTags,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (armorType != null) 'armor_type': armorType,
      if (tier != null) 'tier': tier,
      if (description != null) 'description': description,
      if (defenseValue != null) 'defense_value': defenseValue,
      if (statRequirement != null) 'stat_requirement': statRequirement,
      if (requirementThreshold != null)
        'requirement_threshold': requirementThreshold,
      if (agilityPenalty != null) 'agility_penalty': agilityPenalty,
      if (specialEffect != null) 'special_effect': specialEffect,
      if (conflictTags != null) 'conflict_tags': conflictTags,
      if (regionTags != null) 'region_tags': regionTags,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArmorTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? armorType,
    Value<int>? tier,
    Value<String>? description,
    Value<int>? defenseValue,
    Value<String>? statRequirement,
    Value<int>? requirementThreshold,
    Value<int>? agilityPenalty,
    Value<String?>? specialEffect,
    Value<String>? conflictTags,
    Value<String>? regionTags,
    Value<int>? rowid,
  }) {
    return ArmorTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      armorType: armorType ?? this.armorType,
      tier: tier ?? this.tier,
      description: description ?? this.description,
      defenseValue: defenseValue ?? this.defenseValue,
      statRequirement: statRequirement ?? this.statRequirement,
      requirementThreshold: requirementThreshold ?? this.requirementThreshold,
      agilityPenalty: agilityPenalty ?? this.agilityPenalty,
      specialEffect: specialEffect ?? this.specialEffect,
      conflictTags: conflictTags ?? this.conflictTags,
      regionTags: regionTags ?? this.regionTags,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (armorType.present) {
      map['armor_type'] = Variable<String>(armorType.value);
    }
    if (tier.present) {
      map['tier'] = Variable<int>(tier.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (defenseValue.present) {
      map['defense_value'] = Variable<int>(defenseValue.value);
    }
    if (statRequirement.present) {
      map['stat_requirement'] = Variable<String>(statRequirement.value);
    }
    if (requirementThreshold.present) {
      map['requirement_threshold'] = Variable<int>(requirementThreshold.value);
    }
    if (agilityPenalty.present) {
      map['agility_penalty'] = Variable<int>(agilityPenalty.value);
    }
    if (specialEffect.present) {
      map['special_effect'] = Variable<String>(specialEffect.value);
    }
    if (conflictTags.present) {
      map['conflict_tags'] = Variable<String>(conflictTags.value);
    }
    if (regionTags.present) {
      map['region_tags'] = Variable<String>(regionTags.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArmorTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('armorType: $armorType, ')
          ..write('tier: $tier, ')
          ..write('description: $description, ')
          ..write('defenseValue: $defenseValue, ')
          ..write('statRequirement: $statRequirement, ')
          ..write('requirementThreshold: $requirementThreshold, ')
          ..write('agilityPenalty: $agilityPenalty, ')
          ..write('specialEffect: $specialEffect, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('regionTags: $regionTags, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConsumableTableTable extends ConsumableTable
    with TableInfo<$ConsumableTableTable, ConsumableTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConsumableTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tierMeta = const VerificationMeta('tier');
  @override
  late final GeneratedColumn<int> tier = GeneratedColumn<int>(
    'tier',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _effectTypeMeta = const VerificationMeta(
    'effectType',
  );
  @override
  late final GeneratedColumn<String> effectType = GeneratedColumn<String>(
    'effect_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _effectValueMeta = const VerificationMeta(
    'effectValue',
  );
  @override
  late final GeneratedColumn<String> effectValue = GeneratedColumn<String>(
    'effect_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<String> duration = GeneratedColumn<String>(
    'duration',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conflictTagsMeta = const VerificationMeta(
    'conflictTags',
  );
  @override
  late final GeneratedColumn<String> conflictTags = GeneratedColumn<String>(
    'conflict_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regionTagsMeta = const VerificationMeta(
    'regionTags',
  );
  @override
  late final GeneratedColumn<String> regionTags = GeneratedColumn<String>(
    'region_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    tier,
    description,
    effectType,
    effectValue,
    duration,
    conflictTags,
    regionTags,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'consumable_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConsumableTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('tier')) {
      context.handle(
        _tierMeta,
        tier.isAcceptableOrUnknown(data['tier']!, _tierMeta),
      );
    } else if (isInserting) {
      context.missing(_tierMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('effect_type')) {
      context.handle(
        _effectTypeMeta,
        effectType.isAcceptableOrUnknown(data['effect_type']!, _effectTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_effectTypeMeta);
    }
    if (data.containsKey('effect_value')) {
      context.handle(
        _effectValueMeta,
        effectValue.isAcceptableOrUnknown(
          data['effect_value']!,
          _effectValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_effectValueMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('conflict_tags')) {
      context.handle(
        _conflictTagsMeta,
        conflictTags.isAcceptableOrUnknown(
          data['conflict_tags']!,
          _conflictTagsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conflictTagsMeta);
    }
    if (data.containsKey('region_tags')) {
      context.handle(
        _regionTagsMeta,
        regionTags.isAcceptableOrUnknown(data['region_tags']!, _regionTagsMeta),
      );
    } else if (isInserting) {
      context.missing(_regionTagsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConsumableTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConsumableTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      tier: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tier'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      effectType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}effect_type'],
      )!,
      effectValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}effect_value'],
      )!,
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}duration'],
      )!,
      conflictTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_tags'],
      )!,
      regionTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region_tags'],
      )!,
    );
  }

  @override
  $ConsumableTableTable createAlias(String alias) {
    return $ConsumableTableTable(attachedDatabase, alias);
  }
}

class ConsumableTableData extends DataClass
    implements Insertable<ConsumableTableData> {
  final String id;
  final String name;
  final int tier;
  final String description;
  final String effectType;
  final String effectValue;
  final String duration;
  final String conflictTags;
  final String regionTags;
  const ConsumableTableData({
    required this.id,
    required this.name,
    required this.tier,
    required this.description,
    required this.effectType,
    required this.effectValue,
    required this.duration,
    required this.conflictTags,
    required this.regionTags,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['tier'] = Variable<int>(tier);
    map['description'] = Variable<String>(description);
    map['effect_type'] = Variable<String>(effectType);
    map['effect_value'] = Variable<String>(effectValue);
    map['duration'] = Variable<String>(duration);
    map['conflict_tags'] = Variable<String>(conflictTags);
    map['region_tags'] = Variable<String>(regionTags);
    return map;
  }

  ConsumableTableCompanion toCompanion(bool nullToAbsent) {
    return ConsumableTableCompanion(
      id: Value(id),
      name: Value(name),
      tier: Value(tier),
      description: Value(description),
      effectType: Value(effectType),
      effectValue: Value(effectValue),
      duration: Value(duration),
      conflictTags: Value(conflictTags),
      regionTags: Value(regionTags),
    );
  }

  factory ConsumableTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConsumableTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      tier: serializer.fromJson<int>(json['tier']),
      description: serializer.fromJson<String>(json['description']),
      effectType: serializer.fromJson<String>(json['effectType']),
      effectValue: serializer.fromJson<String>(json['effectValue']),
      duration: serializer.fromJson<String>(json['duration']),
      conflictTags: serializer.fromJson<String>(json['conflictTags']),
      regionTags: serializer.fromJson<String>(json['regionTags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'tier': serializer.toJson<int>(tier),
      'description': serializer.toJson<String>(description),
      'effectType': serializer.toJson<String>(effectType),
      'effectValue': serializer.toJson<String>(effectValue),
      'duration': serializer.toJson<String>(duration),
      'conflictTags': serializer.toJson<String>(conflictTags),
      'regionTags': serializer.toJson<String>(regionTags),
    };
  }

  ConsumableTableData copyWith({
    String? id,
    String? name,
    int? tier,
    String? description,
    String? effectType,
    String? effectValue,
    String? duration,
    String? conflictTags,
    String? regionTags,
  }) => ConsumableTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    tier: tier ?? this.tier,
    description: description ?? this.description,
    effectType: effectType ?? this.effectType,
    effectValue: effectValue ?? this.effectValue,
    duration: duration ?? this.duration,
    conflictTags: conflictTags ?? this.conflictTags,
    regionTags: regionTags ?? this.regionTags,
  );
  ConsumableTableData copyWithCompanion(ConsumableTableCompanion data) {
    return ConsumableTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      tier: data.tier.present ? data.tier.value : this.tier,
      description: data.description.present
          ? data.description.value
          : this.description,
      effectType: data.effectType.present
          ? data.effectType.value
          : this.effectType,
      effectValue: data.effectValue.present
          ? data.effectValue.value
          : this.effectValue,
      duration: data.duration.present ? data.duration.value : this.duration,
      conflictTags: data.conflictTags.present
          ? data.conflictTags.value
          : this.conflictTags,
      regionTags: data.regionTags.present
          ? data.regionTags.value
          : this.regionTags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConsumableTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tier: $tier, ')
          ..write('description: $description, ')
          ..write('effectType: $effectType, ')
          ..write('effectValue: $effectValue, ')
          ..write('duration: $duration, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('regionTags: $regionTags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    tier,
    description,
    effectType,
    effectValue,
    duration,
    conflictTags,
    regionTags,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConsumableTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.tier == this.tier &&
          other.description == this.description &&
          other.effectType == this.effectType &&
          other.effectValue == this.effectValue &&
          other.duration == this.duration &&
          other.conflictTags == this.conflictTags &&
          other.regionTags == this.regionTags);
}

class ConsumableTableCompanion extends UpdateCompanion<ConsumableTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> tier;
  final Value<String> description;
  final Value<String> effectType;
  final Value<String> effectValue;
  final Value<String> duration;
  final Value<String> conflictTags;
  final Value<String> regionTags;
  final Value<int> rowid;
  const ConsumableTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.tier = const Value.absent(),
    this.description = const Value.absent(),
    this.effectType = const Value.absent(),
    this.effectValue = const Value.absent(),
    this.duration = const Value.absent(),
    this.conflictTags = const Value.absent(),
    this.regionTags = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConsumableTableCompanion.insert({
    required String id,
    required String name,
    required int tier,
    required String description,
    required String effectType,
    required String effectValue,
    required String duration,
    required String conflictTags,
    required String regionTags,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       tier = Value(tier),
       description = Value(description),
       effectType = Value(effectType),
       effectValue = Value(effectValue),
       duration = Value(duration),
       conflictTags = Value(conflictTags),
       regionTags = Value(regionTags);
  static Insertable<ConsumableTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? tier,
    Expression<String>? description,
    Expression<String>? effectType,
    Expression<String>? effectValue,
    Expression<String>? duration,
    Expression<String>? conflictTags,
    Expression<String>? regionTags,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (tier != null) 'tier': tier,
      if (description != null) 'description': description,
      if (effectType != null) 'effect_type': effectType,
      if (effectValue != null) 'effect_value': effectValue,
      if (duration != null) 'duration': duration,
      if (conflictTags != null) 'conflict_tags': conflictTags,
      if (regionTags != null) 'region_tags': regionTags,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConsumableTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? tier,
    Value<String>? description,
    Value<String>? effectType,
    Value<String>? effectValue,
    Value<String>? duration,
    Value<String>? conflictTags,
    Value<String>? regionTags,
    Value<int>? rowid,
  }) {
    return ConsumableTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      tier: tier ?? this.tier,
      description: description ?? this.description,
      effectType: effectType ?? this.effectType,
      effectValue: effectValue ?? this.effectValue,
      duration: duration ?? this.duration,
      conflictTags: conflictTags ?? this.conflictTags,
      regionTags: regionTags ?? this.regionTags,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (tier.present) {
      map['tier'] = Variable<int>(tier.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (effectType.present) {
      map['effect_type'] = Variable<String>(effectType.value);
    }
    if (effectValue.present) {
      map['effect_value'] = Variable<String>(effectValue.value);
    }
    if (duration.present) {
      map['duration'] = Variable<String>(duration.value);
    }
    if (conflictTags.present) {
      map['conflict_tags'] = Variable<String>(conflictTags.value);
    }
    if (regionTags.present) {
      map['region_tags'] = Variable<String>(regionTags.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConsumableTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tier: $tier, ')
          ..write('description: $description, ')
          ..write('effectType: $effectType, ')
          ..write('effectValue: $effectValue, ')
          ..write('duration: $duration, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('regionTags: $regionTags, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NpcTableTable extends NpcTable
    with TableInfo<$NpcTableTable, NpcTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NpcTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _personalityMeta = const VerificationMeta(
    'personality',
  );
  @override
  late final GeneratedColumn<String> personality = GeneratedColumn<String>(
    'personality',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dialogueHooksMeta = const VerificationMeta(
    'dialogueHooks',
  );
  @override
  late final GeneratedColumn<String> dialogueHooks = GeneratedColumn<String>(
    'dialogue_hooks',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _factionAlignmentMeta = const VerificationMeta(
    'factionAlignment',
  );
  @override
  late final GeneratedColumn<String> factionAlignment = GeneratedColumn<String>(
    'faction_alignment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conflictTagsMeta = const VerificationMeta(
    'conflictTags',
  );
  @override
  late final GeneratedColumn<String> conflictTags = GeneratedColumn<String>(
    'conflict_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regionTagsMeta = const VerificationMeta(
    'regionTags',
  );
  @override
  late final GeneratedColumn<String> regionTags = GeneratedColumn<String>(
    'region_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _servicesMeta = const VerificationMeta(
    'services',
  );
  @override
  late final GeneratedColumn<String> services = GeneratedColumn<String>(
    'services',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    role,
    description,
    personality,
    dialogueHooks,
    factionAlignment,
    conflictTags,
    regionTags,
    services,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'npc_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<NpcTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('personality')) {
      context.handle(
        _personalityMeta,
        personality.isAcceptableOrUnknown(
          data['personality']!,
          _personalityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_personalityMeta);
    }
    if (data.containsKey('dialogue_hooks')) {
      context.handle(
        _dialogueHooksMeta,
        dialogueHooks.isAcceptableOrUnknown(
          data['dialogue_hooks']!,
          _dialogueHooksMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dialogueHooksMeta);
    }
    if (data.containsKey('faction_alignment')) {
      context.handle(
        _factionAlignmentMeta,
        factionAlignment.isAcceptableOrUnknown(
          data['faction_alignment']!,
          _factionAlignmentMeta,
        ),
      );
    }
    if (data.containsKey('conflict_tags')) {
      context.handle(
        _conflictTagsMeta,
        conflictTags.isAcceptableOrUnknown(
          data['conflict_tags']!,
          _conflictTagsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conflictTagsMeta);
    }
    if (data.containsKey('region_tags')) {
      context.handle(
        _regionTagsMeta,
        regionTags.isAcceptableOrUnknown(data['region_tags']!, _regionTagsMeta),
      );
    } else if (isInserting) {
      context.missing(_regionTagsMeta);
    }
    if (data.containsKey('services')) {
      context.handle(
        _servicesMeta,
        services.isAcceptableOrUnknown(data['services']!, _servicesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NpcTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NpcTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      personality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}personality'],
      )!,
      dialogueHooks: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dialogue_hooks'],
      )!,
      factionAlignment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}faction_alignment'],
      ),
      conflictTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_tags'],
      )!,
      regionTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region_tags'],
      )!,
      services: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}services'],
      ),
    );
  }

  @override
  $NpcTableTable createAlias(String alias) {
    return $NpcTableTable(attachedDatabase, alias);
  }
}

class NpcTableData extends DataClass implements Insertable<NpcTableData> {
  final String id;
  final String name;
  final String role;
  final String description;
  final String personality;
  final String dialogueHooks;
  final String? factionAlignment;
  final String conflictTags;
  final String regionTags;
  final String? services;
  const NpcTableData({
    required this.id,
    required this.name,
    required this.role,
    required this.description,
    required this.personality,
    required this.dialogueHooks,
    this.factionAlignment,
    required this.conflictTags,
    required this.regionTags,
    this.services,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['role'] = Variable<String>(role);
    map['description'] = Variable<String>(description);
    map['personality'] = Variable<String>(personality);
    map['dialogue_hooks'] = Variable<String>(dialogueHooks);
    if (!nullToAbsent || factionAlignment != null) {
      map['faction_alignment'] = Variable<String>(factionAlignment);
    }
    map['conflict_tags'] = Variable<String>(conflictTags);
    map['region_tags'] = Variable<String>(regionTags);
    if (!nullToAbsent || services != null) {
      map['services'] = Variable<String>(services);
    }
    return map;
  }

  NpcTableCompanion toCompanion(bool nullToAbsent) {
    return NpcTableCompanion(
      id: Value(id),
      name: Value(name),
      role: Value(role),
      description: Value(description),
      personality: Value(personality),
      dialogueHooks: Value(dialogueHooks),
      factionAlignment: factionAlignment == null && nullToAbsent
          ? const Value.absent()
          : Value(factionAlignment),
      conflictTags: Value(conflictTags),
      regionTags: Value(regionTags),
      services: services == null && nullToAbsent
          ? const Value.absent()
          : Value(services),
    );
  }

  factory NpcTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NpcTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      role: serializer.fromJson<String>(json['role']),
      description: serializer.fromJson<String>(json['description']),
      personality: serializer.fromJson<String>(json['personality']),
      dialogueHooks: serializer.fromJson<String>(json['dialogueHooks']),
      factionAlignment: serializer.fromJson<String?>(json['factionAlignment']),
      conflictTags: serializer.fromJson<String>(json['conflictTags']),
      regionTags: serializer.fromJson<String>(json['regionTags']),
      services: serializer.fromJson<String?>(json['services']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'role': serializer.toJson<String>(role),
      'description': serializer.toJson<String>(description),
      'personality': serializer.toJson<String>(personality),
      'dialogueHooks': serializer.toJson<String>(dialogueHooks),
      'factionAlignment': serializer.toJson<String?>(factionAlignment),
      'conflictTags': serializer.toJson<String>(conflictTags),
      'regionTags': serializer.toJson<String>(regionTags),
      'services': serializer.toJson<String?>(services),
    };
  }

  NpcTableData copyWith({
    String? id,
    String? name,
    String? role,
    String? description,
    String? personality,
    String? dialogueHooks,
    Value<String?> factionAlignment = const Value.absent(),
    String? conflictTags,
    String? regionTags,
    Value<String?> services = const Value.absent(),
  }) => NpcTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    role: role ?? this.role,
    description: description ?? this.description,
    personality: personality ?? this.personality,
    dialogueHooks: dialogueHooks ?? this.dialogueHooks,
    factionAlignment: factionAlignment.present
        ? factionAlignment.value
        : this.factionAlignment,
    conflictTags: conflictTags ?? this.conflictTags,
    regionTags: regionTags ?? this.regionTags,
    services: services.present ? services.value : this.services,
  );
  NpcTableData copyWithCompanion(NpcTableCompanion data) {
    return NpcTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      role: data.role.present ? data.role.value : this.role,
      description: data.description.present
          ? data.description.value
          : this.description,
      personality: data.personality.present
          ? data.personality.value
          : this.personality,
      dialogueHooks: data.dialogueHooks.present
          ? data.dialogueHooks.value
          : this.dialogueHooks,
      factionAlignment: data.factionAlignment.present
          ? data.factionAlignment.value
          : this.factionAlignment,
      conflictTags: data.conflictTags.present
          ? data.conflictTags.value
          : this.conflictTags,
      regionTags: data.regionTags.present
          ? data.regionTags.value
          : this.regionTags,
      services: data.services.present ? data.services.value : this.services,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NpcTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('description: $description, ')
          ..write('personality: $personality, ')
          ..write('dialogueHooks: $dialogueHooks, ')
          ..write('factionAlignment: $factionAlignment, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('regionTags: $regionTags, ')
          ..write('services: $services')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    role,
    description,
    personality,
    dialogueHooks,
    factionAlignment,
    conflictTags,
    regionTags,
    services,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NpcTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.role == this.role &&
          other.description == this.description &&
          other.personality == this.personality &&
          other.dialogueHooks == this.dialogueHooks &&
          other.factionAlignment == this.factionAlignment &&
          other.conflictTags == this.conflictTags &&
          other.regionTags == this.regionTags &&
          other.services == this.services);
}

class NpcTableCompanion extends UpdateCompanion<NpcTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> role;
  final Value<String> description;
  final Value<String> personality;
  final Value<String> dialogueHooks;
  final Value<String?> factionAlignment;
  final Value<String> conflictTags;
  final Value<String> regionTags;
  final Value<String?> services;
  final Value<int> rowid;
  const NpcTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.description = const Value.absent(),
    this.personality = const Value.absent(),
    this.dialogueHooks = const Value.absent(),
    this.factionAlignment = const Value.absent(),
    this.conflictTags = const Value.absent(),
    this.regionTags = const Value.absent(),
    this.services = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NpcTableCompanion.insert({
    required String id,
    required String name,
    required String role,
    required String description,
    required String personality,
    required String dialogueHooks,
    this.factionAlignment = const Value.absent(),
    required String conflictTags,
    required String regionTags,
    this.services = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       role = Value(role),
       description = Value(description),
       personality = Value(personality),
       dialogueHooks = Value(dialogueHooks),
       conflictTags = Value(conflictTags),
       regionTags = Value(regionTags);
  static Insertable<NpcTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? role,
    Expression<String>? description,
    Expression<String>? personality,
    Expression<String>? dialogueHooks,
    Expression<String>? factionAlignment,
    Expression<String>? conflictTags,
    Expression<String>? regionTags,
    Expression<String>? services,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (description != null) 'description': description,
      if (personality != null) 'personality': personality,
      if (dialogueHooks != null) 'dialogue_hooks': dialogueHooks,
      if (factionAlignment != null) 'faction_alignment': factionAlignment,
      if (conflictTags != null) 'conflict_tags': conflictTags,
      if (regionTags != null) 'region_tags': regionTags,
      if (services != null) 'services': services,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NpcTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? role,
    Value<String>? description,
    Value<String>? personality,
    Value<String>? dialogueHooks,
    Value<String?>? factionAlignment,
    Value<String>? conflictTags,
    Value<String>? regionTags,
    Value<String?>? services,
    Value<int>? rowid,
  }) {
    return NpcTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      description: description ?? this.description,
      personality: personality ?? this.personality,
      dialogueHooks: dialogueHooks ?? this.dialogueHooks,
      factionAlignment: factionAlignment ?? this.factionAlignment,
      conflictTags: conflictTags ?? this.conflictTags,
      regionTags: regionTags ?? this.regionTags,
      services: services ?? this.services,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (personality.present) {
      map['personality'] = Variable<String>(personality.value);
    }
    if (dialogueHooks.present) {
      map['dialogue_hooks'] = Variable<String>(dialogueHooks.value);
    }
    if (factionAlignment.present) {
      map['faction_alignment'] = Variable<String>(factionAlignment.value);
    }
    if (conflictTags.present) {
      map['conflict_tags'] = Variable<String>(conflictTags.value);
    }
    if (regionTags.present) {
      map['region_tags'] = Variable<String>(regionTags.value);
    }
    if (services.present) {
      map['services'] = Variable<String>(services.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NpcTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('description: $description, ')
          ..write('personality: $personality, ')
          ..write('dialogueHooks: $dialogueHooks, ')
          ..write('factionAlignment: $factionAlignment, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('regionTags: $regionTags, ')
          ..write('services: $services, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FactionTableTable extends FactionTable
    with TableInfo<$FactionTableTable, FactionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FactionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _archetypeMeta = const VerificationMeta(
    'archetype',
  );
  @override
  late final GeneratedColumn<String> archetype = GeneratedColumn<String>(
    'archetype',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _agendaMeta = const VerificationMeta('agenda');
  @override
  late final GeneratedColumn<String> agenda = GeneratedColumn<String>(
    'agenda',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodsMeta = const VerificationMeta(
    'methods',
  );
  @override
  late final GeneratedColumn<String> methods = GeneratedColumn<String>(
    'methods',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _leaderNpcIdMeta = const VerificationMeta(
    'leaderNpcId',
  );
  @override
  late final GeneratedColumn<String> leaderNpcId = GeneratedColumn<String>(
    'leader_npc_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _keyMembersMeta = const VerificationMeta(
    'keyMembers',
  );
  @override
  late final GeneratedColumn<String> keyMembers = GeneratedColumn<String>(
    'key_members',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeRegionMeta = const VerificationMeta(
    'homeRegion',
  );
  @override
  late final GeneratedColumn<String> homeRegion = GeneratedColumn<String>(
    'home_region',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _alliedFactionsMeta = const VerificationMeta(
    'alliedFactions',
  );
  @override
  late final GeneratedColumn<String> alliedFactions = GeneratedColumn<String>(
    'allied_factions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rivalFactionsMeta = const VerificationMeta(
    'rivalFactions',
  );
  @override
  late final GeneratedColumn<String> rivalFactions = GeneratedColumn<String>(
    'rival_factions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playerReputationStartMeta =
      const VerificationMeta('playerReputationStart');
  @override
  late final GeneratedColumn<int> playerReputationStart = GeneratedColumn<int>(
    'player_reputation_start',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conflictTagsMeta = const VerificationMeta(
    'conflictTags',
  );
  @override
  late final GeneratedColumn<String> conflictTags = GeneratedColumn<String>(
    'conflict_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _campaignLengthMinimumMeta =
      const VerificationMeta('campaignLengthMinimum');
  @override
  late final GeneratedColumn<String> campaignLengthMinimum =
      GeneratedColumn<String>(
        'campaign_length_minimum',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    archetype,
    description,
    agenda,
    methods,
    leaderNpcId,
    keyMembers,
    homeRegion,
    alliedFactions,
    rivalFactions,
    playerReputationStart,
    conflictTags,
    campaignLengthMinimum,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'faction_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FactionTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('archetype')) {
      context.handle(
        _archetypeMeta,
        archetype.isAcceptableOrUnknown(data['archetype']!, _archetypeMeta),
      );
    } else if (isInserting) {
      context.missing(_archetypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('agenda')) {
      context.handle(
        _agendaMeta,
        agenda.isAcceptableOrUnknown(data['agenda']!, _agendaMeta),
      );
    } else if (isInserting) {
      context.missing(_agendaMeta);
    }
    if (data.containsKey('methods')) {
      context.handle(
        _methodsMeta,
        methods.isAcceptableOrUnknown(data['methods']!, _methodsMeta),
      );
    } else if (isInserting) {
      context.missing(_methodsMeta);
    }
    if (data.containsKey('leader_npc_id')) {
      context.handle(
        _leaderNpcIdMeta,
        leaderNpcId.isAcceptableOrUnknown(
          data['leader_npc_id']!,
          _leaderNpcIdMeta,
        ),
      );
    }
    if (data.containsKey('key_members')) {
      context.handle(
        _keyMembersMeta,
        keyMembers.isAcceptableOrUnknown(data['key_members']!, _keyMembersMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMembersMeta);
    }
    if (data.containsKey('home_region')) {
      context.handle(
        _homeRegionMeta,
        homeRegion.isAcceptableOrUnknown(data['home_region']!, _homeRegionMeta),
      );
    } else if (isInserting) {
      context.missing(_homeRegionMeta);
    }
    if (data.containsKey('allied_factions')) {
      context.handle(
        _alliedFactionsMeta,
        alliedFactions.isAcceptableOrUnknown(
          data['allied_factions']!,
          _alliedFactionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_alliedFactionsMeta);
    }
    if (data.containsKey('rival_factions')) {
      context.handle(
        _rivalFactionsMeta,
        rivalFactions.isAcceptableOrUnknown(
          data['rival_factions']!,
          _rivalFactionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rivalFactionsMeta);
    }
    if (data.containsKey('player_reputation_start')) {
      context.handle(
        _playerReputationStartMeta,
        playerReputationStart.isAcceptableOrUnknown(
          data['player_reputation_start']!,
          _playerReputationStartMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_playerReputationStartMeta);
    }
    if (data.containsKey('conflict_tags')) {
      context.handle(
        _conflictTagsMeta,
        conflictTags.isAcceptableOrUnknown(
          data['conflict_tags']!,
          _conflictTagsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conflictTagsMeta);
    }
    if (data.containsKey('campaign_length_minimum')) {
      context.handle(
        _campaignLengthMinimumMeta,
        campaignLengthMinimum.isAcceptableOrUnknown(
          data['campaign_length_minimum']!,
          _campaignLengthMinimumMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_campaignLengthMinimumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FactionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FactionTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      archetype: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archetype'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      agenda: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}agenda'],
      )!,
      methods: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}methods'],
      )!,
      leaderNpcId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}leader_npc_id'],
      ),
      keyMembers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key_members'],
      )!,
      homeRegion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_region'],
      )!,
      alliedFactions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allied_factions'],
      )!,
      rivalFactions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rival_factions'],
      )!,
      playerReputationStart: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player_reputation_start'],
      )!,
      conflictTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_tags'],
      )!,
      campaignLengthMinimum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}campaign_length_minimum'],
      )!,
    );
  }

  @override
  $FactionTableTable createAlias(String alias) {
    return $FactionTableTable(attachedDatabase, alias);
  }
}

class FactionTableData extends DataClass
    implements Insertable<FactionTableData> {
  final String id;
  final String name;
  final String archetype;
  final String description;
  final String agenda;
  final String methods;
  final String? leaderNpcId;
  final String keyMembers;
  final String homeRegion;
  final String alliedFactions;
  final String rivalFactions;
  final int playerReputationStart;
  final String conflictTags;
  final String campaignLengthMinimum;
  const FactionTableData({
    required this.id,
    required this.name,
    required this.archetype,
    required this.description,
    required this.agenda,
    required this.methods,
    this.leaderNpcId,
    required this.keyMembers,
    required this.homeRegion,
    required this.alliedFactions,
    required this.rivalFactions,
    required this.playerReputationStart,
    required this.conflictTags,
    required this.campaignLengthMinimum,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['archetype'] = Variable<String>(archetype);
    map['description'] = Variable<String>(description);
    map['agenda'] = Variable<String>(agenda);
    map['methods'] = Variable<String>(methods);
    if (!nullToAbsent || leaderNpcId != null) {
      map['leader_npc_id'] = Variable<String>(leaderNpcId);
    }
    map['key_members'] = Variable<String>(keyMembers);
    map['home_region'] = Variable<String>(homeRegion);
    map['allied_factions'] = Variable<String>(alliedFactions);
    map['rival_factions'] = Variable<String>(rivalFactions);
    map['player_reputation_start'] = Variable<int>(playerReputationStart);
    map['conflict_tags'] = Variable<String>(conflictTags);
    map['campaign_length_minimum'] = Variable<String>(campaignLengthMinimum);
    return map;
  }

  FactionTableCompanion toCompanion(bool nullToAbsent) {
    return FactionTableCompanion(
      id: Value(id),
      name: Value(name),
      archetype: Value(archetype),
      description: Value(description),
      agenda: Value(agenda),
      methods: Value(methods),
      leaderNpcId: leaderNpcId == null && nullToAbsent
          ? const Value.absent()
          : Value(leaderNpcId),
      keyMembers: Value(keyMembers),
      homeRegion: Value(homeRegion),
      alliedFactions: Value(alliedFactions),
      rivalFactions: Value(rivalFactions),
      playerReputationStart: Value(playerReputationStart),
      conflictTags: Value(conflictTags),
      campaignLengthMinimum: Value(campaignLengthMinimum),
    );
  }

  factory FactionTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FactionTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      archetype: serializer.fromJson<String>(json['archetype']),
      description: serializer.fromJson<String>(json['description']),
      agenda: serializer.fromJson<String>(json['agenda']),
      methods: serializer.fromJson<String>(json['methods']),
      leaderNpcId: serializer.fromJson<String?>(json['leaderNpcId']),
      keyMembers: serializer.fromJson<String>(json['keyMembers']),
      homeRegion: serializer.fromJson<String>(json['homeRegion']),
      alliedFactions: serializer.fromJson<String>(json['alliedFactions']),
      rivalFactions: serializer.fromJson<String>(json['rivalFactions']),
      playerReputationStart: serializer.fromJson<int>(
        json['playerReputationStart'],
      ),
      conflictTags: serializer.fromJson<String>(json['conflictTags']),
      campaignLengthMinimum: serializer.fromJson<String>(
        json['campaignLengthMinimum'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'archetype': serializer.toJson<String>(archetype),
      'description': serializer.toJson<String>(description),
      'agenda': serializer.toJson<String>(agenda),
      'methods': serializer.toJson<String>(methods),
      'leaderNpcId': serializer.toJson<String?>(leaderNpcId),
      'keyMembers': serializer.toJson<String>(keyMembers),
      'homeRegion': serializer.toJson<String>(homeRegion),
      'alliedFactions': serializer.toJson<String>(alliedFactions),
      'rivalFactions': serializer.toJson<String>(rivalFactions),
      'playerReputationStart': serializer.toJson<int>(playerReputationStart),
      'conflictTags': serializer.toJson<String>(conflictTags),
      'campaignLengthMinimum': serializer.toJson<String>(campaignLengthMinimum),
    };
  }

  FactionTableData copyWith({
    String? id,
    String? name,
    String? archetype,
    String? description,
    String? agenda,
    String? methods,
    Value<String?> leaderNpcId = const Value.absent(),
    String? keyMembers,
    String? homeRegion,
    String? alliedFactions,
    String? rivalFactions,
    int? playerReputationStart,
    String? conflictTags,
    String? campaignLengthMinimum,
  }) => FactionTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    archetype: archetype ?? this.archetype,
    description: description ?? this.description,
    agenda: agenda ?? this.agenda,
    methods: methods ?? this.methods,
    leaderNpcId: leaderNpcId.present ? leaderNpcId.value : this.leaderNpcId,
    keyMembers: keyMembers ?? this.keyMembers,
    homeRegion: homeRegion ?? this.homeRegion,
    alliedFactions: alliedFactions ?? this.alliedFactions,
    rivalFactions: rivalFactions ?? this.rivalFactions,
    playerReputationStart: playerReputationStart ?? this.playerReputationStart,
    conflictTags: conflictTags ?? this.conflictTags,
    campaignLengthMinimum: campaignLengthMinimum ?? this.campaignLengthMinimum,
  );
  FactionTableData copyWithCompanion(FactionTableCompanion data) {
    return FactionTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      archetype: data.archetype.present ? data.archetype.value : this.archetype,
      description: data.description.present
          ? data.description.value
          : this.description,
      agenda: data.agenda.present ? data.agenda.value : this.agenda,
      methods: data.methods.present ? data.methods.value : this.methods,
      leaderNpcId: data.leaderNpcId.present
          ? data.leaderNpcId.value
          : this.leaderNpcId,
      keyMembers: data.keyMembers.present
          ? data.keyMembers.value
          : this.keyMembers,
      homeRegion: data.homeRegion.present
          ? data.homeRegion.value
          : this.homeRegion,
      alliedFactions: data.alliedFactions.present
          ? data.alliedFactions.value
          : this.alliedFactions,
      rivalFactions: data.rivalFactions.present
          ? data.rivalFactions.value
          : this.rivalFactions,
      playerReputationStart: data.playerReputationStart.present
          ? data.playerReputationStart.value
          : this.playerReputationStart,
      conflictTags: data.conflictTags.present
          ? data.conflictTags.value
          : this.conflictTags,
      campaignLengthMinimum: data.campaignLengthMinimum.present
          ? data.campaignLengthMinimum.value
          : this.campaignLengthMinimum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FactionTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('archetype: $archetype, ')
          ..write('description: $description, ')
          ..write('agenda: $agenda, ')
          ..write('methods: $methods, ')
          ..write('leaderNpcId: $leaderNpcId, ')
          ..write('keyMembers: $keyMembers, ')
          ..write('homeRegion: $homeRegion, ')
          ..write('alliedFactions: $alliedFactions, ')
          ..write('rivalFactions: $rivalFactions, ')
          ..write('playerReputationStart: $playerReputationStart, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('campaignLengthMinimum: $campaignLengthMinimum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    archetype,
    description,
    agenda,
    methods,
    leaderNpcId,
    keyMembers,
    homeRegion,
    alliedFactions,
    rivalFactions,
    playerReputationStart,
    conflictTags,
    campaignLengthMinimum,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FactionTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.archetype == this.archetype &&
          other.description == this.description &&
          other.agenda == this.agenda &&
          other.methods == this.methods &&
          other.leaderNpcId == this.leaderNpcId &&
          other.keyMembers == this.keyMembers &&
          other.homeRegion == this.homeRegion &&
          other.alliedFactions == this.alliedFactions &&
          other.rivalFactions == this.rivalFactions &&
          other.playerReputationStart == this.playerReputationStart &&
          other.conflictTags == this.conflictTags &&
          other.campaignLengthMinimum == this.campaignLengthMinimum);
}

class FactionTableCompanion extends UpdateCompanion<FactionTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> archetype;
  final Value<String> description;
  final Value<String> agenda;
  final Value<String> methods;
  final Value<String?> leaderNpcId;
  final Value<String> keyMembers;
  final Value<String> homeRegion;
  final Value<String> alliedFactions;
  final Value<String> rivalFactions;
  final Value<int> playerReputationStart;
  final Value<String> conflictTags;
  final Value<String> campaignLengthMinimum;
  final Value<int> rowid;
  const FactionTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.archetype = const Value.absent(),
    this.description = const Value.absent(),
    this.agenda = const Value.absent(),
    this.methods = const Value.absent(),
    this.leaderNpcId = const Value.absent(),
    this.keyMembers = const Value.absent(),
    this.homeRegion = const Value.absent(),
    this.alliedFactions = const Value.absent(),
    this.rivalFactions = const Value.absent(),
    this.playerReputationStart = const Value.absent(),
    this.conflictTags = const Value.absent(),
    this.campaignLengthMinimum = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FactionTableCompanion.insert({
    required String id,
    required String name,
    required String archetype,
    required String description,
    required String agenda,
    required String methods,
    this.leaderNpcId = const Value.absent(),
    required String keyMembers,
    required String homeRegion,
    required String alliedFactions,
    required String rivalFactions,
    required int playerReputationStart,
    required String conflictTags,
    required String campaignLengthMinimum,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       archetype = Value(archetype),
       description = Value(description),
       agenda = Value(agenda),
       methods = Value(methods),
       keyMembers = Value(keyMembers),
       homeRegion = Value(homeRegion),
       alliedFactions = Value(alliedFactions),
       rivalFactions = Value(rivalFactions),
       playerReputationStart = Value(playerReputationStart),
       conflictTags = Value(conflictTags),
       campaignLengthMinimum = Value(campaignLengthMinimum);
  static Insertable<FactionTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? archetype,
    Expression<String>? description,
    Expression<String>? agenda,
    Expression<String>? methods,
    Expression<String>? leaderNpcId,
    Expression<String>? keyMembers,
    Expression<String>? homeRegion,
    Expression<String>? alliedFactions,
    Expression<String>? rivalFactions,
    Expression<int>? playerReputationStart,
    Expression<String>? conflictTags,
    Expression<String>? campaignLengthMinimum,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (archetype != null) 'archetype': archetype,
      if (description != null) 'description': description,
      if (agenda != null) 'agenda': agenda,
      if (methods != null) 'methods': methods,
      if (leaderNpcId != null) 'leader_npc_id': leaderNpcId,
      if (keyMembers != null) 'key_members': keyMembers,
      if (homeRegion != null) 'home_region': homeRegion,
      if (alliedFactions != null) 'allied_factions': alliedFactions,
      if (rivalFactions != null) 'rival_factions': rivalFactions,
      if (playerReputationStart != null)
        'player_reputation_start': playerReputationStart,
      if (conflictTags != null) 'conflict_tags': conflictTags,
      if (campaignLengthMinimum != null)
        'campaign_length_minimum': campaignLengthMinimum,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FactionTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? archetype,
    Value<String>? description,
    Value<String>? agenda,
    Value<String>? methods,
    Value<String?>? leaderNpcId,
    Value<String>? keyMembers,
    Value<String>? homeRegion,
    Value<String>? alliedFactions,
    Value<String>? rivalFactions,
    Value<int>? playerReputationStart,
    Value<String>? conflictTags,
    Value<String>? campaignLengthMinimum,
    Value<int>? rowid,
  }) {
    return FactionTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      archetype: archetype ?? this.archetype,
      description: description ?? this.description,
      agenda: agenda ?? this.agenda,
      methods: methods ?? this.methods,
      leaderNpcId: leaderNpcId ?? this.leaderNpcId,
      keyMembers: keyMembers ?? this.keyMembers,
      homeRegion: homeRegion ?? this.homeRegion,
      alliedFactions: alliedFactions ?? this.alliedFactions,
      rivalFactions: rivalFactions ?? this.rivalFactions,
      playerReputationStart:
          playerReputationStart ?? this.playerReputationStart,
      conflictTags: conflictTags ?? this.conflictTags,
      campaignLengthMinimum:
          campaignLengthMinimum ?? this.campaignLengthMinimum,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (archetype.present) {
      map['archetype'] = Variable<String>(archetype.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (agenda.present) {
      map['agenda'] = Variable<String>(agenda.value);
    }
    if (methods.present) {
      map['methods'] = Variable<String>(methods.value);
    }
    if (leaderNpcId.present) {
      map['leader_npc_id'] = Variable<String>(leaderNpcId.value);
    }
    if (keyMembers.present) {
      map['key_members'] = Variable<String>(keyMembers.value);
    }
    if (homeRegion.present) {
      map['home_region'] = Variable<String>(homeRegion.value);
    }
    if (alliedFactions.present) {
      map['allied_factions'] = Variable<String>(alliedFactions.value);
    }
    if (rivalFactions.present) {
      map['rival_factions'] = Variable<String>(rivalFactions.value);
    }
    if (playerReputationStart.present) {
      map['player_reputation_start'] = Variable<int>(
        playerReputationStart.value,
      );
    }
    if (conflictTags.present) {
      map['conflict_tags'] = Variable<String>(conflictTags.value);
    }
    if (campaignLengthMinimum.present) {
      map['campaign_length_minimum'] = Variable<String>(
        campaignLengthMinimum.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FactionTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('archetype: $archetype, ')
          ..write('description: $description, ')
          ..write('agenda: $agenda, ')
          ..write('methods: $methods, ')
          ..write('leaderNpcId: $leaderNpcId, ')
          ..write('keyMembers: $keyMembers, ')
          ..write('homeRegion: $homeRegion, ')
          ..write('alliedFactions: $alliedFactions, ')
          ..write('rivalFactions: $rivalFactions, ')
          ..write('playerReputationStart: $playerReputationStart, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('campaignLengthMinimum: $campaignLengthMinimum, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StoryArcTableTable extends StoryArcTable
    with TableInfo<$StoryArcTableTable, StoryArcTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoryArcTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conflictTypeMeta = const VerificationMeta(
    'conflictType',
  );
  @override
  late final GeneratedColumn<String> conflictType = GeneratedColumn<String>(
    'conflict_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _arcTypeMeta = const VerificationMeta(
    'arcType',
  );
  @override
  late final GeneratedColumn<String> arcType = GeneratedColumn<String>(
    'arc_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prerequisitesMeta = const VerificationMeta(
    'prerequisites',
  );
  @override
  late final GeneratedColumn<String> prerequisites = GeneratedColumn<String>(
    'prerequisites',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _triggersMeta = const VerificationMeta(
    'triggers',
  );
  @override
  late final GeneratedColumn<String> triggers = GeneratedColumn<String>(
    'triggers',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resolutionOptionsMeta = const VerificationMeta(
    'resolutionOptions',
  );
  @override
  late final GeneratedColumn<String> resolutionOptions =
      GeneratedColumn<String>(
        'resolution_options',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _campaignLengthMinimumMeta =
      const VerificationMeta('campaignLengthMinimum');
  @override
  late final GeneratedColumn<String> campaignLengthMinimum =
      GeneratedColumn<String>(
        'campaign_length_minimum',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _factionsInvolvedMeta = const VerificationMeta(
    'factionsInvolved',
  );
  @override
  late final GeneratedColumn<String> factionsInvolved = GeneratedColumn<String>(
    'factions_involved',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    conflictType,
    arcType,
    description,
    prerequisites,
    triggers,
    resolutionOptions,
    campaignLengthMinimum,
    factionsInvolved,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'story_arc_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoryArcTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('conflict_type')) {
      context.handle(
        _conflictTypeMeta,
        conflictType.isAcceptableOrUnknown(
          data['conflict_type']!,
          _conflictTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conflictTypeMeta);
    }
    if (data.containsKey('arc_type')) {
      context.handle(
        _arcTypeMeta,
        arcType.isAcceptableOrUnknown(data['arc_type']!, _arcTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_arcTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('prerequisites')) {
      context.handle(
        _prerequisitesMeta,
        prerequisites.isAcceptableOrUnknown(
          data['prerequisites']!,
          _prerequisitesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_prerequisitesMeta);
    }
    if (data.containsKey('triggers')) {
      context.handle(
        _triggersMeta,
        triggers.isAcceptableOrUnknown(data['triggers']!, _triggersMeta),
      );
    } else if (isInserting) {
      context.missing(_triggersMeta);
    }
    if (data.containsKey('resolution_options')) {
      context.handle(
        _resolutionOptionsMeta,
        resolutionOptions.isAcceptableOrUnknown(
          data['resolution_options']!,
          _resolutionOptionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_resolutionOptionsMeta);
    }
    if (data.containsKey('campaign_length_minimum')) {
      context.handle(
        _campaignLengthMinimumMeta,
        campaignLengthMinimum.isAcceptableOrUnknown(
          data['campaign_length_minimum']!,
          _campaignLengthMinimumMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_campaignLengthMinimumMeta);
    }
    if (data.containsKey('factions_involved')) {
      context.handle(
        _factionsInvolvedMeta,
        factionsInvolved.isAcceptableOrUnknown(
          data['factions_involved']!,
          _factionsInvolvedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_factionsInvolvedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoryArcTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoryArcTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      conflictType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_type'],
      )!,
      arcType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arc_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      prerequisites: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prerequisites'],
      )!,
      triggers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}triggers'],
      )!,
      resolutionOptions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resolution_options'],
      )!,
      campaignLengthMinimum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}campaign_length_minimum'],
      )!,
      factionsInvolved: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}factions_involved'],
      )!,
    );
  }

  @override
  $StoryArcTableTable createAlias(String alias) {
    return $StoryArcTableTable(attachedDatabase, alias);
  }
}

class StoryArcTableData extends DataClass
    implements Insertable<StoryArcTableData> {
  final String id;
  final String title;
  final String conflictType;
  final String arcType;
  final String description;
  final String prerequisites;
  final String triggers;
  final String resolutionOptions;
  final String campaignLengthMinimum;
  final String factionsInvolved;
  const StoryArcTableData({
    required this.id,
    required this.title,
    required this.conflictType,
    required this.arcType,
    required this.description,
    required this.prerequisites,
    required this.triggers,
    required this.resolutionOptions,
    required this.campaignLengthMinimum,
    required this.factionsInvolved,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['conflict_type'] = Variable<String>(conflictType);
    map['arc_type'] = Variable<String>(arcType);
    map['description'] = Variable<String>(description);
    map['prerequisites'] = Variable<String>(prerequisites);
    map['triggers'] = Variable<String>(triggers);
    map['resolution_options'] = Variable<String>(resolutionOptions);
    map['campaign_length_minimum'] = Variable<String>(campaignLengthMinimum);
    map['factions_involved'] = Variable<String>(factionsInvolved);
    return map;
  }

  StoryArcTableCompanion toCompanion(bool nullToAbsent) {
    return StoryArcTableCompanion(
      id: Value(id),
      title: Value(title),
      conflictType: Value(conflictType),
      arcType: Value(arcType),
      description: Value(description),
      prerequisites: Value(prerequisites),
      triggers: Value(triggers),
      resolutionOptions: Value(resolutionOptions),
      campaignLengthMinimum: Value(campaignLengthMinimum),
      factionsInvolved: Value(factionsInvolved),
    );
  }

  factory StoryArcTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoryArcTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      conflictType: serializer.fromJson<String>(json['conflictType']),
      arcType: serializer.fromJson<String>(json['arcType']),
      description: serializer.fromJson<String>(json['description']),
      prerequisites: serializer.fromJson<String>(json['prerequisites']),
      triggers: serializer.fromJson<String>(json['triggers']),
      resolutionOptions: serializer.fromJson<String>(json['resolutionOptions']),
      campaignLengthMinimum: serializer.fromJson<String>(
        json['campaignLengthMinimum'],
      ),
      factionsInvolved: serializer.fromJson<String>(json['factionsInvolved']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'conflictType': serializer.toJson<String>(conflictType),
      'arcType': serializer.toJson<String>(arcType),
      'description': serializer.toJson<String>(description),
      'prerequisites': serializer.toJson<String>(prerequisites),
      'triggers': serializer.toJson<String>(triggers),
      'resolutionOptions': serializer.toJson<String>(resolutionOptions),
      'campaignLengthMinimum': serializer.toJson<String>(campaignLengthMinimum),
      'factionsInvolved': serializer.toJson<String>(factionsInvolved),
    };
  }

  StoryArcTableData copyWith({
    String? id,
    String? title,
    String? conflictType,
    String? arcType,
    String? description,
    String? prerequisites,
    String? triggers,
    String? resolutionOptions,
    String? campaignLengthMinimum,
    String? factionsInvolved,
  }) => StoryArcTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    conflictType: conflictType ?? this.conflictType,
    arcType: arcType ?? this.arcType,
    description: description ?? this.description,
    prerequisites: prerequisites ?? this.prerequisites,
    triggers: triggers ?? this.triggers,
    resolutionOptions: resolutionOptions ?? this.resolutionOptions,
    campaignLengthMinimum: campaignLengthMinimum ?? this.campaignLengthMinimum,
    factionsInvolved: factionsInvolved ?? this.factionsInvolved,
  );
  StoryArcTableData copyWithCompanion(StoryArcTableCompanion data) {
    return StoryArcTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      conflictType: data.conflictType.present
          ? data.conflictType.value
          : this.conflictType,
      arcType: data.arcType.present ? data.arcType.value : this.arcType,
      description: data.description.present
          ? data.description.value
          : this.description,
      prerequisites: data.prerequisites.present
          ? data.prerequisites.value
          : this.prerequisites,
      triggers: data.triggers.present ? data.triggers.value : this.triggers,
      resolutionOptions: data.resolutionOptions.present
          ? data.resolutionOptions.value
          : this.resolutionOptions,
      campaignLengthMinimum: data.campaignLengthMinimum.present
          ? data.campaignLengthMinimum.value
          : this.campaignLengthMinimum,
      factionsInvolved: data.factionsInvolved.present
          ? data.factionsInvolved.value
          : this.factionsInvolved,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoryArcTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('conflictType: $conflictType, ')
          ..write('arcType: $arcType, ')
          ..write('description: $description, ')
          ..write('prerequisites: $prerequisites, ')
          ..write('triggers: $triggers, ')
          ..write('resolutionOptions: $resolutionOptions, ')
          ..write('campaignLengthMinimum: $campaignLengthMinimum, ')
          ..write('factionsInvolved: $factionsInvolved')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    conflictType,
    arcType,
    description,
    prerequisites,
    triggers,
    resolutionOptions,
    campaignLengthMinimum,
    factionsInvolved,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoryArcTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.conflictType == this.conflictType &&
          other.arcType == this.arcType &&
          other.description == this.description &&
          other.prerequisites == this.prerequisites &&
          other.triggers == this.triggers &&
          other.resolutionOptions == this.resolutionOptions &&
          other.campaignLengthMinimum == this.campaignLengthMinimum &&
          other.factionsInvolved == this.factionsInvolved);
}

class StoryArcTableCompanion extends UpdateCompanion<StoryArcTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> conflictType;
  final Value<String> arcType;
  final Value<String> description;
  final Value<String> prerequisites;
  final Value<String> triggers;
  final Value<String> resolutionOptions;
  final Value<String> campaignLengthMinimum;
  final Value<String> factionsInvolved;
  final Value<int> rowid;
  const StoryArcTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.conflictType = const Value.absent(),
    this.arcType = const Value.absent(),
    this.description = const Value.absent(),
    this.prerequisites = const Value.absent(),
    this.triggers = const Value.absent(),
    this.resolutionOptions = const Value.absent(),
    this.campaignLengthMinimum = const Value.absent(),
    this.factionsInvolved = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StoryArcTableCompanion.insert({
    required String id,
    required String title,
    required String conflictType,
    required String arcType,
    required String description,
    required String prerequisites,
    required String triggers,
    required String resolutionOptions,
    required String campaignLengthMinimum,
    required String factionsInvolved,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       conflictType = Value(conflictType),
       arcType = Value(arcType),
       description = Value(description),
       prerequisites = Value(prerequisites),
       triggers = Value(triggers),
       resolutionOptions = Value(resolutionOptions),
       campaignLengthMinimum = Value(campaignLengthMinimum),
       factionsInvolved = Value(factionsInvolved);
  static Insertable<StoryArcTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? conflictType,
    Expression<String>? arcType,
    Expression<String>? description,
    Expression<String>? prerequisites,
    Expression<String>? triggers,
    Expression<String>? resolutionOptions,
    Expression<String>? campaignLengthMinimum,
    Expression<String>? factionsInvolved,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (conflictType != null) 'conflict_type': conflictType,
      if (arcType != null) 'arc_type': arcType,
      if (description != null) 'description': description,
      if (prerequisites != null) 'prerequisites': prerequisites,
      if (triggers != null) 'triggers': triggers,
      if (resolutionOptions != null) 'resolution_options': resolutionOptions,
      if (campaignLengthMinimum != null)
        'campaign_length_minimum': campaignLengthMinimum,
      if (factionsInvolved != null) 'factions_involved': factionsInvolved,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StoryArcTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? conflictType,
    Value<String>? arcType,
    Value<String>? description,
    Value<String>? prerequisites,
    Value<String>? triggers,
    Value<String>? resolutionOptions,
    Value<String>? campaignLengthMinimum,
    Value<String>? factionsInvolved,
    Value<int>? rowid,
  }) {
    return StoryArcTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      conflictType: conflictType ?? this.conflictType,
      arcType: arcType ?? this.arcType,
      description: description ?? this.description,
      prerequisites: prerequisites ?? this.prerequisites,
      triggers: triggers ?? this.triggers,
      resolutionOptions: resolutionOptions ?? this.resolutionOptions,
      campaignLengthMinimum:
          campaignLengthMinimum ?? this.campaignLengthMinimum,
      factionsInvolved: factionsInvolved ?? this.factionsInvolved,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (conflictType.present) {
      map['conflict_type'] = Variable<String>(conflictType.value);
    }
    if (arcType.present) {
      map['arc_type'] = Variable<String>(arcType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (prerequisites.present) {
      map['prerequisites'] = Variable<String>(prerequisites.value);
    }
    if (triggers.present) {
      map['triggers'] = Variable<String>(triggers.value);
    }
    if (resolutionOptions.present) {
      map['resolution_options'] = Variable<String>(resolutionOptions.value);
    }
    if (campaignLengthMinimum.present) {
      map['campaign_length_minimum'] = Variable<String>(
        campaignLengthMinimum.value,
      );
    }
    if (factionsInvolved.present) {
      map['factions_involved'] = Variable<String>(factionsInvolved.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoryArcTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('conflictType: $conflictType, ')
          ..write('arcType: $arcType, ')
          ..write('description: $description, ')
          ..write('prerequisites: $prerequisites, ')
          ..write('triggers: $triggers, ')
          ..write('resolutionOptions: $resolutionOptions, ')
          ..write('campaignLengthMinimum: $campaignLengthMinimum, ')
          ..write('factionsInvolved: $factionsInvolved, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestTableTable extends QuestTable
    with TableInfo<$QuestTableTable, QuestTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentArcMeta = const VerificationMeta(
    'parentArc',
  );
  @override
  late final GeneratedColumn<String> parentArc = GeneratedColumn<String>(
    'parent_arc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _questTypeMeta = const VerificationMeta(
    'questType',
  );
  @override
  late final GeneratedColumn<String> questType = GeneratedColumn<String>(
    'quest_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _giverNpcIdMeta = const VerificationMeta(
    'giverNpcId',
  );
  @override
  late final GeneratedColumn<String> giverNpcId = GeneratedColumn<String>(
    'giver_npc_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _objectivesMeta = const VerificationMeta(
    'objectives',
  );
  @override
  late final GeneratedColumn<String> objectives = GeneratedColumn<String>(
    'objectives',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardsMeta = const VerificationMeta(
    'rewards',
  );
  @override
  late final GeneratedColumn<String> rewards = GeneratedColumn<String>(
    'rewards',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conflictWeightMeta = const VerificationMeta(
    'conflictWeight',
  );
  @override
  late final GeneratedColumn<String> conflictWeight = GeneratedColumn<String>(
    'conflict_weight',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conflictTagsMeta = const VerificationMeta(
    'conflictTags',
  );
  @override
  late final GeneratedColumn<String> conflictTags = GeneratedColumn<String>(
    'conflict_tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _campaignLengthMinimumMeta =
      const VerificationMeta('campaignLengthMinimum');
  @override
  late final GeneratedColumn<String> campaignLengthMinimum =
      GeneratedColumn<String>(
        'campaign_length_minimum',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    parentArc,
    questType,
    description,
    giverNpcId,
    objectives,
    rewards,
    conflictWeight,
    conflictTags,
    campaignLengthMinimum,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quest_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('parent_arc')) {
      context.handle(
        _parentArcMeta,
        parentArc.isAcceptableOrUnknown(data['parent_arc']!, _parentArcMeta),
      );
    }
    if (data.containsKey('quest_type')) {
      context.handle(
        _questTypeMeta,
        questType.isAcceptableOrUnknown(data['quest_type']!, _questTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_questTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('giver_npc_id')) {
      context.handle(
        _giverNpcIdMeta,
        giverNpcId.isAcceptableOrUnknown(
          data['giver_npc_id']!,
          _giverNpcIdMeta,
        ),
      );
    }
    if (data.containsKey('objectives')) {
      context.handle(
        _objectivesMeta,
        objectives.isAcceptableOrUnknown(data['objectives']!, _objectivesMeta),
      );
    } else if (isInserting) {
      context.missing(_objectivesMeta);
    }
    if (data.containsKey('rewards')) {
      context.handle(
        _rewardsMeta,
        rewards.isAcceptableOrUnknown(data['rewards']!, _rewardsMeta),
      );
    } else if (isInserting) {
      context.missing(_rewardsMeta);
    }
    if (data.containsKey('conflict_weight')) {
      context.handle(
        _conflictWeightMeta,
        conflictWeight.isAcceptableOrUnknown(
          data['conflict_weight']!,
          _conflictWeightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conflictWeightMeta);
    }
    if (data.containsKey('conflict_tags')) {
      context.handle(
        _conflictTagsMeta,
        conflictTags.isAcceptableOrUnknown(
          data['conflict_tags']!,
          _conflictTagsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conflictTagsMeta);
    }
    if (data.containsKey('campaign_length_minimum')) {
      context.handle(
        _campaignLengthMinimumMeta,
        campaignLengthMinimum.isAcceptableOrUnknown(
          data['campaign_length_minimum']!,
          _campaignLengthMinimumMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_campaignLengthMinimumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      parentArc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_arc'],
      ),
      questType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quest_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      giverNpcId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}giver_npc_id'],
      ),
      objectives: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}objectives'],
      )!,
      rewards: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rewards'],
      )!,
      conflictWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_weight'],
      )!,
      conflictTags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conflict_tags'],
      )!,
      campaignLengthMinimum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}campaign_length_minimum'],
      )!,
    );
  }

  @override
  $QuestTableTable createAlias(String alias) {
    return $QuestTableTable(attachedDatabase, alias);
  }
}

class QuestTableData extends DataClass implements Insertable<QuestTableData> {
  final String id;
  final String title;
  final String? parentArc;
  final String questType;
  final String description;
  final String? giverNpcId;
  final String objectives;
  final String rewards;
  final String conflictWeight;
  final String conflictTags;
  final String campaignLengthMinimum;
  const QuestTableData({
    required this.id,
    required this.title,
    this.parentArc,
    required this.questType,
    required this.description,
    this.giverNpcId,
    required this.objectives,
    required this.rewards,
    required this.conflictWeight,
    required this.conflictTags,
    required this.campaignLengthMinimum,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || parentArc != null) {
      map['parent_arc'] = Variable<String>(parentArc);
    }
    map['quest_type'] = Variable<String>(questType);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || giverNpcId != null) {
      map['giver_npc_id'] = Variable<String>(giverNpcId);
    }
    map['objectives'] = Variable<String>(objectives);
    map['rewards'] = Variable<String>(rewards);
    map['conflict_weight'] = Variable<String>(conflictWeight);
    map['conflict_tags'] = Variable<String>(conflictTags);
    map['campaign_length_minimum'] = Variable<String>(campaignLengthMinimum);
    return map;
  }

  QuestTableCompanion toCompanion(bool nullToAbsent) {
    return QuestTableCompanion(
      id: Value(id),
      title: Value(title),
      parentArc: parentArc == null && nullToAbsent
          ? const Value.absent()
          : Value(parentArc),
      questType: Value(questType),
      description: Value(description),
      giverNpcId: giverNpcId == null && nullToAbsent
          ? const Value.absent()
          : Value(giverNpcId),
      objectives: Value(objectives),
      rewards: Value(rewards),
      conflictWeight: Value(conflictWeight),
      conflictTags: Value(conflictTags),
      campaignLengthMinimum: Value(campaignLengthMinimum),
    );
  }

  factory QuestTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      parentArc: serializer.fromJson<String?>(json['parentArc']),
      questType: serializer.fromJson<String>(json['questType']),
      description: serializer.fromJson<String>(json['description']),
      giverNpcId: serializer.fromJson<String?>(json['giverNpcId']),
      objectives: serializer.fromJson<String>(json['objectives']),
      rewards: serializer.fromJson<String>(json['rewards']),
      conflictWeight: serializer.fromJson<String>(json['conflictWeight']),
      conflictTags: serializer.fromJson<String>(json['conflictTags']),
      campaignLengthMinimum: serializer.fromJson<String>(
        json['campaignLengthMinimum'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'parentArc': serializer.toJson<String?>(parentArc),
      'questType': serializer.toJson<String>(questType),
      'description': serializer.toJson<String>(description),
      'giverNpcId': serializer.toJson<String?>(giverNpcId),
      'objectives': serializer.toJson<String>(objectives),
      'rewards': serializer.toJson<String>(rewards),
      'conflictWeight': serializer.toJson<String>(conflictWeight),
      'conflictTags': serializer.toJson<String>(conflictTags),
      'campaignLengthMinimum': serializer.toJson<String>(campaignLengthMinimum),
    };
  }

  QuestTableData copyWith({
    String? id,
    String? title,
    Value<String?> parentArc = const Value.absent(),
    String? questType,
    String? description,
    Value<String?> giverNpcId = const Value.absent(),
    String? objectives,
    String? rewards,
    String? conflictWeight,
    String? conflictTags,
    String? campaignLengthMinimum,
  }) => QuestTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    parentArc: parentArc.present ? parentArc.value : this.parentArc,
    questType: questType ?? this.questType,
    description: description ?? this.description,
    giverNpcId: giverNpcId.present ? giverNpcId.value : this.giverNpcId,
    objectives: objectives ?? this.objectives,
    rewards: rewards ?? this.rewards,
    conflictWeight: conflictWeight ?? this.conflictWeight,
    conflictTags: conflictTags ?? this.conflictTags,
    campaignLengthMinimum: campaignLengthMinimum ?? this.campaignLengthMinimum,
  );
  QuestTableData copyWithCompanion(QuestTableCompanion data) {
    return QuestTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      parentArc: data.parentArc.present ? data.parentArc.value : this.parentArc,
      questType: data.questType.present ? data.questType.value : this.questType,
      description: data.description.present
          ? data.description.value
          : this.description,
      giverNpcId: data.giverNpcId.present
          ? data.giverNpcId.value
          : this.giverNpcId,
      objectives: data.objectives.present
          ? data.objectives.value
          : this.objectives,
      rewards: data.rewards.present ? data.rewards.value : this.rewards,
      conflictWeight: data.conflictWeight.present
          ? data.conflictWeight.value
          : this.conflictWeight,
      conflictTags: data.conflictTags.present
          ? data.conflictTags.value
          : this.conflictTags,
      campaignLengthMinimum: data.campaignLengthMinimum.present
          ? data.campaignLengthMinimum.value
          : this.campaignLengthMinimum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('parentArc: $parentArc, ')
          ..write('questType: $questType, ')
          ..write('description: $description, ')
          ..write('giverNpcId: $giverNpcId, ')
          ..write('objectives: $objectives, ')
          ..write('rewards: $rewards, ')
          ..write('conflictWeight: $conflictWeight, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('campaignLengthMinimum: $campaignLengthMinimum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    parentArc,
    questType,
    description,
    giverNpcId,
    objectives,
    rewards,
    conflictWeight,
    conflictTags,
    campaignLengthMinimum,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.parentArc == this.parentArc &&
          other.questType == this.questType &&
          other.description == this.description &&
          other.giverNpcId == this.giverNpcId &&
          other.objectives == this.objectives &&
          other.rewards == this.rewards &&
          other.conflictWeight == this.conflictWeight &&
          other.conflictTags == this.conflictTags &&
          other.campaignLengthMinimum == this.campaignLengthMinimum);
}

class QuestTableCompanion extends UpdateCompanion<QuestTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> parentArc;
  final Value<String> questType;
  final Value<String> description;
  final Value<String?> giverNpcId;
  final Value<String> objectives;
  final Value<String> rewards;
  final Value<String> conflictWeight;
  final Value<String> conflictTags;
  final Value<String> campaignLengthMinimum;
  final Value<int> rowid;
  const QuestTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.parentArc = const Value.absent(),
    this.questType = const Value.absent(),
    this.description = const Value.absent(),
    this.giverNpcId = const Value.absent(),
    this.objectives = const Value.absent(),
    this.rewards = const Value.absent(),
    this.conflictWeight = const Value.absent(),
    this.conflictTags = const Value.absent(),
    this.campaignLengthMinimum = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestTableCompanion.insert({
    required String id,
    required String title,
    this.parentArc = const Value.absent(),
    required String questType,
    required String description,
    this.giverNpcId = const Value.absent(),
    required String objectives,
    required String rewards,
    required String conflictWeight,
    required String conflictTags,
    required String campaignLengthMinimum,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       questType = Value(questType),
       description = Value(description),
       objectives = Value(objectives),
       rewards = Value(rewards),
       conflictWeight = Value(conflictWeight),
       conflictTags = Value(conflictTags),
       campaignLengthMinimum = Value(campaignLengthMinimum);
  static Insertable<QuestTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? parentArc,
    Expression<String>? questType,
    Expression<String>? description,
    Expression<String>? giverNpcId,
    Expression<String>? objectives,
    Expression<String>? rewards,
    Expression<String>? conflictWeight,
    Expression<String>? conflictTags,
    Expression<String>? campaignLengthMinimum,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (parentArc != null) 'parent_arc': parentArc,
      if (questType != null) 'quest_type': questType,
      if (description != null) 'description': description,
      if (giverNpcId != null) 'giver_npc_id': giverNpcId,
      if (objectives != null) 'objectives': objectives,
      if (rewards != null) 'rewards': rewards,
      if (conflictWeight != null) 'conflict_weight': conflictWeight,
      if (conflictTags != null) 'conflict_tags': conflictTags,
      if (campaignLengthMinimum != null)
        'campaign_length_minimum': campaignLengthMinimum,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? parentArc,
    Value<String>? questType,
    Value<String>? description,
    Value<String?>? giverNpcId,
    Value<String>? objectives,
    Value<String>? rewards,
    Value<String>? conflictWeight,
    Value<String>? conflictTags,
    Value<String>? campaignLengthMinimum,
    Value<int>? rowid,
  }) {
    return QuestTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      parentArc: parentArc ?? this.parentArc,
      questType: questType ?? this.questType,
      description: description ?? this.description,
      giverNpcId: giverNpcId ?? this.giverNpcId,
      objectives: objectives ?? this.objectives,
      rewards: rewards ?? this.rewards,
      conflictWeight: conflictWeight ?? this.conflictWeight,
      conflictTags: conflictTags ?? this.conflictTags,
      campaignLengthMinimum:
          campaignLengthMinimum ?? this.campaignLengthMinimum,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (parentArc.present) {
      map['parent_arc'] = Variable<String>(parentArc.value);
    }
    if (questType.present) {
      map['quest_type'] = Variable<String>(questType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (giverNpcId.present) {
      map['giver_npc_id'] = Variable<String>(giverNpcId.value);
    }
    if (objectives.present) {
      map['objectives'] = Variable<String>(objectives.value);
    }
    if (rewards.present) {
      map['rewards'] = Variable<String>(rewards.value);
    }
    if (conflictWeight.present) {
      map['conflict_weight'] = Variable<String>(conflictWeight.value);
    }
    if (conflictTags.present) {
      map['conflict_tags'] = Variable<String>(conflictTags.value);
    }
    if (campaignLengthMinimum.present) {
      map['campaign_length_minimum'] = Variable<String>(
        campaignLengthMinimum.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('parentArc: $parentArc, ')
          ..write('questType: $questType, ')
          ..write('description: $description, ')
          ..write('giverNpcId: $giverNpcId, ')
          ..write('objectives: $objectives, ')
          ..write('rewards: $rewards, ')
          ..write('conflictWeight: $conflictWeight, ')
          ..write('conflictTags: $conflictTags, ')
          ..write('campaignLengthMinimum: $campaignLengthMinimum, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EnemyTableTable enemyTable = $EnemyTableTable(this);
  late final $RoomTableTable roomTable = $RoomTableTable(this);
  late final $WeaponTableTable weaponTable = $WeaponTableTable(this);
  late final $ArmorTableTable armorTable = $ArmorTableTable(this);
  late final $ConsumableTableTable consumableTable = $ConsumableTableTable(
    this,
  );
  late final $NpcTableTable npcTable = $NpcTableTable(this);
  late final $FactionTableTable factionTable = $FactionTableTable(this);
  late final $StoryArcTableTable storyArcTable = $StoryArcTableTable(this);
  late final $QuestTableTable questTable = $QuestTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    enemyTable,
    roomTable,
    weaponTable,
    armorTable,
    consumableTable,
    npcTable,
    factionTable,
    storyArcTable,
    questTable,
  ];
}

typedef $$EnemyTableTableCreateCompanionBuilder =
    EnemyTableCompanion Function({
      required String id,
      required String name,
      required String description,
      required int strength,
      required int stamina,
      required int agility,
      required int luck,
      required int charisma,
      required int wisdom,
      required int intelligence,
      required String damageDice,
      required int armorValue,
      required int tier,
      required String behavior,
      Value<String?> specialAbility,
      required String lootTable,
      required String conflictTags,
      required String regionTags,
      required int xpValue,
      Value<int> rowid,
    });
typedef $$EnemyTableTableUpdateCompanionBuilder =
    EnemyTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> description,
      Value<int> strength,
      Value<int> stamina,
      Value<int> agility,
      Value<int> luck,
      Value<int> charisma,
      Value<int> wisdom,
      Value<int> intelligence,
      Value<String> damageDice,
      Value<int> armorValue,
      Value<int> tier,
      Value<String> behavior,
      Value<String?> specialAbility,
      Value<String> lootTable,
      Value<String> conflictTags,
      Value<String> regionTags,
      Value<int> xpValue,
      Value<int> rowid,
    });

class $$EnemyTableTableFilterComposer
    extends Composer<_$AppDatabase, $EnemyTableTable> {
  $$EnemyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stamina => $composableBuilder(
    column: $table.stamina,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get agility => $composableBuilder(
    column: $table.agility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get luck => $composableBuilder(
    column: $table.luck,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get charisma => $composableBuilder(
    column: $table.charisma,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wisdom => $composableBuilder(
    column: $table.wisdom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get damageDice => $composableBuilder(
    column: $table.damageDice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get armorValue => $composableBuilder(
    column: $table.armorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get behavior => $composableBuilder(
    column: $table.behavior,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialAbility => $composableBuilder(
    column: $table.specialAbility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lootTable => $composableBuilder(
    column: $table.lootTable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xpValue => $composableBuilder(
    column: $table.xpValue,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EnemyTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EnemyTableTable> {
  $$EnemyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stamina => $composableBuilder(
    column: $table.stamina,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agility => $composableBuilder(
    column: $table.agility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get luck => $composableBuilder(
    column: $table.luck,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get charisma => $composableBuilder(
    column: $table.charisma,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wisdom => $composableBuilder(
    column: $table.wisdom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get damageDice => $composableBuilder(
    column: $table.damageDice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get armorValue => $composableBuilder(
    column: $table.armorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get behavior => $composableBuilder(
    column: $table.behavior,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialAbility => $composableBuilder(
    column: $table.specialAbility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lootTable => $composableBuilder(
    column: $table.lootTable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xpValue => $composableBuilder(
    column: $table.xpValue,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EnemyTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EnemyTableTable> {
  $$EnemyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumn<int> get stamina =>
      $composableBuilder(column: $table.stamina, builder: (column) => column);

  GeneratedColumn<int> get agility =>
      $composableBuilder(column: $table.agility, builder: (column) => column);

  GeneratedColumn<int> get luck =>
      $composableBuilder(column: $table.luck, builder: (column) => column);

  GeneratedColumn<int> get charisma =>
      $composableBuilder(column: $table.charisma, builder: (column) => column);

  GeneratedColumn<int> get wisdom =>
      $composableBuilder(column: $table.wisdom, builder: (column) => column);

  GeneratedColumn<int> get intelligence => $composableBuilder(
    column: $table.intelligence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get damageDice => $composableBuilder(
    column: $table.damageDice,
    builder: (column) => column,
  );

  GeneratedColumn<int> get armorValue => $composableBuilder(
    column: $table.armorValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tier =>
      $composableBuilder(column: $table.tier, builder: (column) => column);

  GeneratedColumn<String> get behavior =>
      $composableBuilder(column: $table.behavior, builder: (column) => column);

  GeneratedColumn<String> get specialAbility => $composableBuilder(
    column: $table.specialAbility,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lootTable =>
      $composableBuilder(column: $table.lootTable, builder: (column) => column);

  GeneratedColumn<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => column,
  );

  GeneratedColumn<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => column,
  );

  GeneratedColumn<int> get xpValue =>
      $composableBuilder(column: $table.xpValue, builder: (column) => column);
}

class $$EnemyTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EnemyTableTable,
          EnemyTableData,
          $$EnemyTableTableFilterComposer,
          $$EnemyTableTableOrderingComposer,
          $$EnemyTableTableAnnotationComposer,
          $$EnemyTableTableCreateCompanionBuilder,
          $$EnemyTableTableUpdateCompanionBuilder,
          (
            EnemyTableData,
            BaseReferences<_$AppDatabase, $EnemyTableTable, EnemyTableData>,
          ),
          EnemyTableData,
          PrefetchHooks Function()
        > {
  $$EnemyTableTableTableManager(_$AppDatabase db, $EnemyTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnemyTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnemyTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnemyTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> strength = const Value.absent(),
                Value<int> stamina = const Value.absent(),
                Value<int> agility = const Value.absent(),
                Value<int> luck = const Value.absent(),
                Value<int> charisma = const Value.absent(),
                Value<int> wisdom = const Value.absent(),
                Value<int> intelligence = const Value.absent(),
                Value<String> damageDice = const Value.absent(),
                Value<int> armorValue = const Value.absent(),
                Value<int> tier = const Value.absent(),
                Value<String> behavior = const Value.absent(),
                Value<String?> specialAbility = const Value.absent(),
                Value<String> lootTable = const Value.absent(),
                Value<String> conflictTags = const Value.absent(),
                Value<String> regionTags = const Value.absent(),
                Value<int> xpValue = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnemyTableCompanion(
                id: id,
                name: name,
                description: description,
                strength: strength,
                stamina: stamina,
                agility: agility,
                luck: luck,
                charisma: charisma,
                wisdom: wisdom,
                intelligence: intelligence,
                damageDice: damageDice,
                armorValue: armorValue,
                tier: tier,
                behavior: behavior,
                specialAbility: specialAbility,
                lootTable: lootTable,
                conflictTags: conflictTags,
                regionTags: regionTags,
                xpValue: xpValue,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String description,
                required int strength,
                required int stamina,
                required int agility,
                required int luck,
                required int charisma,
                required int wisdom,
                required int intelligence,
                required String damageDice,
                required int armorValue,
                required int tier,
                required String behavior,
                Value<String?> specialAbility = const Value.absent(),
                required String lootTable,
                required String conflictTags,
                required String regionTags,
                required int xpValue,
                Value<int> rowid = const Value.absent(),
              }) => EnemyTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                strength: strength,
                stamina: stamina,
                agility: agility,
                luck: luck,
                charisma: charisma,
                wisdom: wisdom,
                intelligence: intelligence,
                damageDice: damageDice,
                armorValue: armorValue,
                tier: tier,
                behavior: behavior,
                specialAbility: specialAbility,
                lootTable: lootTable,
                conflictTags: conflictTags,
                regionTags: regionTags,
                xpValue: xpValue,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EnemyTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EnemyTableTable,
      EnemyTableData,
      $$EnemyTableTableFilterComposer,
      $$EnemyTableTableOrderingComposer,
      $$EnemyTableTableAnnotationComposer,
      $$EnemyTableTableCreateCompanionBuilder,
      $$EnemyTableTableUpdateCompanionBuilder,
      (
        EnemyTableData,
        BaseReferences<_$AppDatabase, $EnemyTableTable, EnemyTableData>,
      ),
      EnemyTableData,
      PrefetchHooks Function()
    >;
typedef $$RoomTableTableCreateCompanionBuilder =
    RoomTableCompanion Function({
      required String id,
      required String name,
      required String region,
      required String description,
      required String atmosphere,
      required String conflictTags,
      required bool encounterEligible,
      required bool lootEligible,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$RoomTableTableUpdateCompanionBuilder =
    RoomTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> region,
      Value<String> description,
      Value<String> atmosphere,
      Value<String> conflictTags,
      Value<bool> encounterEligible,
      Value<bool> lootEligible,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$RoomTableTableFilterComposer
    extends Composer<_$AppDatabase, $RoomTableTable> {
  $$RoomTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get atmosphere => $composableBuilder(
    column: $table.atmosphere,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get encounterEligible => $composableBuilder(
    column: $table.encounterEligible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get lootEligible => $composableBuilder(
    column: $table.lootEligible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoomTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomTableTable> {
  $$RoomTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get atmosphere => $composableBuilder(
    column: $table.atmosphere,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get encounterEligible => $composableBuilder(
    column: $table.encounterEligible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get lootEligible => $composableBuilder(
    column: $table.lootEligible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoomTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomTableTable> {
  $$RoomTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get atmosphere => $composableBuilder(
    column: $table.atmosphere,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get encounterEligible => $composableBuilder(
    column: $table.encounterEligible,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get lootEligible => $composableBuilder(
    column: $table.lootEligible,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$RoomTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoomTableTable,
          RoomTableData,
          $$RoomTableTableFilterComposer,
          $$RoomTableTableOrderingComposer,
          $$RoomTableTableAnnotationComposer,
          $$RoomTableTableCreateCompanionBuilder,
          $$RoomTableTableUpdateCompanionBuilder,
          (
            RoomTableData,
            BaseReferences<_$AppDatabase, $RoomTableTable, RoomTableData>,
          ),
          RoomTableData,
          PrefetchHooks Function()
        > {
  $$RoomTableTableTableManager(_$AppDatabase db, $RoomTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> region = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> atmosphere = const Value.absent(),
                Value<String> conflictTags = const Value.absent(),
                Value<bool> encounterEligible = const Value.absent(),
                Value<bool> lootEligible = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomTableCompanion(
                id: id,
                name: name,
                region: region,
                description: description,
                atmosphere: atmosphere,
                conflictTags: conflictTags,
                encounterEligible: encounterEligible,
                lootEligible: lootEligible,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String region,
                required String description,
                required String atmosphere,
                required String conflictTags,
                required bool encounterEligible,
                required bool lootEligible,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomTableCompanion.insert(
                id: id,
                name: name,
                region: region,
                description: description,
                atmosphere: atmosphere,
                conflictTags: conflictTags,
                encounterEligible: encounterEligible,
                lootEligible: lootEligible,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoomTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoomTableTable,
      RoomTableData,
      $$RoomTableTableFilterComposer,
      $$RoomTableTableOrderingComposer,
      $$RoomTableTableAnnotationComposer,
      $$RoomTableTableCreateCompanionBuilder,
      $$RoomTableTableUpdateCompanionBuilder,
      (
        RoomTableData,
        BaseReferences<_$AppDatabase, $RoomTableTable, RoomTableData>,
      ),
      RoomTableData,
      PrefetchHooks Function()
    >;
typedef $$WeaponTableTableCreateCompanionBuilder =
    WeaponTableCompanion Function({
      required String id,
      required String name,
      required String weaponType,
      required int tier,
      required String description,
      required String damageDice,
      required String statRequirement,
      required int requirementThreshold,
      Value<String?> specialEffect,
      required String conflictTags,
      required String regionTags,
      Value<int> rowid,
    });
typedef $$WeaponTableTableUpdateCompanionBuilder =
    WeaponTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> weaponType,
      Value<int> tier,
      Value<String> description,
      Value<String> damageDice,
      Value<String> statRequirement,
      Value<int> requirementThreshold,
      Value<String?> specialEffect,
      Value<String> conflictTags,
      Value<String> regionTags,
      Value<int> rowid,
    });

class $$WeaponTableTableFilterComposer
    extends Composer<_$AppDatabase, $WeaponTableTable> {
  $$WeaponTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weaponType => $composableBuilder(
    column: $table.weaponType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get damageDice => $composableBuilder(
    column: $table.damageDice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statRequirement => $composableBuilder(
    column: $table.statRequirement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get requirementThreshold => $composableBuilder(
    column: $table.requirementThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialEffect => $composableBuilder(
    column: $table.specialEffect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeaponTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WeaponTableTable> {
  $$WeaponTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weaponType => $composableBuilder(
    column: $table.weaponType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get damageDice => $composableBuilder(
    column: $table.damageDice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statRequirement => $composableBuilder(
    column: $table.statRequirement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get requirementThreshold => $composableBuilder(
    column: $table.requirementThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialEffect => $composableBuilder(
    column: $table.specialEffect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeaponTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeaponTableTable> {
  $$WeaponTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get weaponType => $composableBuilder(
    column: $table.weaponType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tier =>
      $composableBuilder(column: $table.tier, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get damageDice => $composableBuilder(
    column: $table.damageDice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statRequirement => $composableBuilder(
    column: $table.statRequirement,
    builder: (column) => column,
  );

  GeneratedColumn<int> get requirementThreshold => $composableBuilder(
    column: $table.requirementThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specialEffect => $composableBuilder(
    column: $table.specialEffect,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => column,
  );

  GeneratedColumn<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => column,
  );
}

class $$WeaponTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeaponTableTable,
          WeaponTableData,
          $$WeaponTableTableFilterComposer,
          $$WeaponTableTableOrderingComposer,
          $$WeaponTableTableAnnotationComposer,
          $$WeaponTableTableCreateCompanionBuilder,
          $$WeaponTableTableUpdateCompanionBuilder,
          (
            WeaponTableData,
            BaseReferences<_$AppDatabase, $WeaponTableTable, WeaponTableData>,
          ),
          WeaponTableData,
          PrefetchHooks Function()
        > {
  $$WeaponTableTableTableManager(_$AppDatabase db, $WeaponTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeaponTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeaponTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeaponTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> weaponType = const Value.absent(),
                Value<int> tier = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> damageDice = const Value.absent(),
                Value<String> statRequirement = const Value.absent(),
                Value<int> requirementThreshold = const Value.absent(),
                Value<String?> specialEffect = const Value.absent(),
                Value<String> conflictTags = const Value.absent(),
                Value<String> regionTags = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeaponTableCompanion(
                id: id,
                name: name,
                weaponType: weaponType,
                tier: tier,
                description: description,
                damageDice: damageDice,
                statRequirement: statRequirement,
                requirementThreshold: requirementThreshold,
                specialEffect: specialEffect,
                conflictTags: conflictTags,
                regionTags: regionTags,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String weaponType,
                required int tier,
                required String description,
                required String damageDice,
                required String statRequirement,
                required int requirementThreshold,
                Value<String?> specialEffect = const Value.absent(),
                required String conflictTags,
                required String regionTags,
                Value<int> rowid = const Value.absent(),
              }) => WeaponTableCompanion.insert(
                id: id,
                name: name,
                weaponType: weaponType,
                tier: tier,
                description: description,
                damageDice: damageDice,
                statRequirement: statRequirement,
                requirementThreshold: requirementThreshold,
                specialEffect: specialEffect,
                conflictTags: conflictTags,
                regionTags: regionTags,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeaponTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeaponTableTable,
      WeaponTableData,
      $$WeaponTableTableFilterComposer,
      $$WeaponTableTableOrderingComposer,
      $$WeaponTableTableAnnotationComposer,
      $$WeaponTableTableCreateCompanionBuilder,
      $$WeaponTableTableUpdateCompanionBuilder,
      (
        WeaponTableData,
        BaseReferences<_$AppDatabase, $WeaponTableTable, WeaponTableData>,
      ),
      WeaponTableData,
      PrefetchHooks Function()
    >;
typedef $$ArmorTableTableCreateCompanionBuilder =
    ArmorTableCompanion Function({
      required String id,
      required String name,
      required String armorType,
      required int tier,
      required String description,
      required int defenseValue,
      required String statRequirement,
      required int requirementThreshold,
      required int agilityPenalty,
      Value<String?> specialEffect,
      required String conflictTags,
      required String regionTags,
      Value<int> rowid,
    });
typedef $$ArmorTableTableUpdateCompanionBuilder =
    ArmorTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> armorType,
      Value<int> tier,
      Value<String> description,
      Value<int> defenseValue,
      Value<String> statRequirement,
      Value<int> requirementThreshold,
      Value<int> agilityPenalty,
      Value<String?> specialEffect,
      Value<String> conflictTags,
      Value<String> regionTags,
      Value<int> rowid,
    });

class $$ArmorTableTableFilterComposer
    extends Composer<_$AppDatabase, $ArmorTableTable> {
  $$ArmorTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get armorType => $composableBuilder(
    column: $table.armorType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defenseValue => $composableBuilder(
    column: $table.defenseValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statRequirement => $composableBuilder(
    column: $table.statRequirement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get requirementThreshold => $composableBuilder(
    column: $table.requirementThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get agilityPenalty => $composableBuilder(
    column: $table.agilityPenalty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialEffect => $composableBuilder(
    column: $table.specialEffect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ArmorTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ArmorTableTable> {
  $$ArmorTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get armorType => $composableBuilder(
    column: $table.armorType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defenseValue => $composableBuilder(
    column: $table.defenseValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statRequirement => $composableBuilder(
    column: $table.statRequirement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get requirementThreshold => $composableBuilder(
    column: $table.requirementThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agilityPenalty => $composableBuilder(
    column: $table.agilityPenalty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialEffect => $composableBuilder(
    column: $table.specialEffect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ArmorTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArmorTableTable> {
  $$ArmorTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get armorType =>
      $composableBuilder(column: $table.armorType, builder: (column) => column);

  GeneratedColumn<int> get tier =>
      $composableBuilder(column: $table.tier, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get defenseValue => $composableBuilder(
    column: $table.defenseValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statRequirement => $composableBuilder(
    column: $table.statRequirement,
    builder: (column) => column,
  );

  GeneratedColumn<int> get requirementThreshold => $composableBuilder(
    column: $table.requirementThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<int> get agilityPenalty => $composableBuilder(
    column: $table.agilityPenalty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specialEffect => $composableBuilder(
    column: $table.specialEffect,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => column,
  );

  GeneratedColumn<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => column,
  );
}

class $$ArmorTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArmorTableTable,
          ArmorTableData,
          $$ArmorTableTableFilterComposer,
          $$ArmorTableTableOrderingComposer,
          $$ArmorTableTableAnnotationComposer,
          $$ArmorTableTableCreateCompanionBuilder,
          $$ArmorTableTableUpdateCompanionBuilder,
          (
            ArmorTableData,
            BaseReferences<_$AppDatabase, $ArmorTableTable, ArmorTableData>,
          ),
          ArmorTableData,
          PrefetchHooks Function()
        > {
  $$ArmorTableTableTableManager(_$AppDatabase db, $ArmorTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArmorTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArmorTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArmorTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> armorType = const Value.absent(),
                Value<int> tier = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> defenseValue = const Value.absent(),
                Value<String> statRequirement = const Value.absent(),
                Value<int> requirementThreshold = const Value.absent(),
                Value<int> agilityPenalty = const Value.absent(),
                Value<String?> specialEffect = const Value.absent(),
                Value<String> conflictTags = const Value.absent(),
                Value<String> regionTags = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArmorTableCompanion(
                id: id,
                name: name,
                armorType: armorType,
                tier: tier,
                description: description,
                defenseValue: defenseValue,
                statRequirement: statRequirement,
                requirementThreshold: requirementThreshold,
                agilityPenalty: agilityPenalty,
                specialEffect: specialEffect,
                conflictTags: conflictTags,
                regionTags: regionTags,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String armorType,
                required int tier,
                required String description,
                required int defenseValue,
                required String statRequirement,
                required int requirementThreshold,
                required int agilityPenalty,
                Value<String?> specialEffect = const Value.absent(),
                required String conflictTags,
                required String regionTags,
                Value<int> rowid = const Value.absent(),
              }) => ArmorTableCompanion.insert(
                id: id,
                name: name,
                armorType: armorType,
                tier: tier,
                description: description,
                defenseValue: defenseValue,
                statRequirement: statRequirement,
                requirementThreshold: requirementThreshold,
                agilityPenalty: agilityPenalty,
                specialEffect: specialEffect,
                conflictTags: conflictTags,
                regionTags: regionTags,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ArmorTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArmorTableTable,
      ArmorTableData,
      $$ArmorTableTableFilterComposer,
      $$ArmorTableTableOrderingComposer,
      $$ArmorTableTableAnnotationComposer,
      $$ArmorTableTableCreateCompanionBuilder,
      $$ArmorTableTableUpdateCompanionBuilder,
      (
        ArmorTableData,
        BaseReferences<_$AppDatabase, $ArmorTableTable, ArmorTableData>,
      ),
      ArmorTableData,
      PrefetchHooks Function()
    >;
typedef $$ConsumableTableTableCreateCompanionBuilder =
    ConsumableTableCompanion Function({
      required String id,
      required String name,
      required int tier,
      required String description,
      required String effectType,
      required String effectValue,
      required String duration,
      required String conflictTags,
      required String regionTags,
      Value<int> rowid,
    });
typedef $$ConsumableTableTableUpdateCompanionBuilder =
    ConsumableTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> tier,
      Value<String> description,
      Value<String> effectType,
      Value<String> effectValue,
      Value<String> duration,
      Value<String> conflictTags,
      Value<String> regionTags,
      Value<int> rowid,
    });

class $$ConsumableTableTableFilterComposer
    extends Composer<_$AppDatabase, $ConsumableTableTable> {
  $$ConsumableTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get effectType => $composableBuilder(
    column: $table.effectType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get effectValue => $composableBuilder(
    column: $table.effectValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConsumableTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ConsumableTableTable> {
  $$ConsumableTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tier => $composableBuilder(
    column: $table.tier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get effectType => $composableBuilder(
    column: $table.effectType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get effectValue => $composableBuilder(
    column: $table.effectValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConsumableTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConsumableTableTable> {
  $$ConsumableTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get tier =>
      $composableBuilder(column: $table.tier, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get effectType => $composableBuilder(
    column: $table.effectType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get effectValue => $composableBuilder(
    column: $table.effectValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => column,
  );

  GeneratedColumn<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => column,
  );
}

class $$ConsumableTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConsumableTableTable,
          ConsumableTableData,
          $$ConsumableTableTableFilterComposer,
          $$ConsumableTableTableOrderingComposer,
          $$ConsumableTableTableAnnotationComposer,
          $$ConsumableTableTableCreateCompanionBuilder,
          $$ConsumableTableTableUpdateCompanionBuilder,
          (
            ConsumableTableData,
            BaseReferences<
              _$AppDatabase,
              $ConsumableTableTable,
              ConsumableTableData
            >,
          ),
          ConsumableTableData,
          PrefetchHooks Function()
        > {
  $$ConsumableTableTableTableManager(
    _$AppDatabase db,
    $ConsumableTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConsumableTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConsumableTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConsumableTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> tier = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> effectType = const Value.absent(),
                Value<String> effectValue = const Value.absent(),
                Value<String> duration = const Value.absent(),
                Value<String> conflictTags = const Value.absent(),
                Value<String> regionTags = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConsumableTableCompanion(
                id: id,
                name: name,
                tier: tier,
                description: description,
                effectType: effectType,
                effectValue: effectValue,
                duration: duration,
                conflictTags: conflictTags,
                regionTags: regionTags,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int tier,
                required String description,
                required String effectType,
                required String effectValue,
                required String duration,
                required String conflictTags,
                required String regionTags,
                Value<int> rowid = const Value.absent(),
              }) => ConsumableTableCompanion.insert(
                id: id,
                name: name,
                tier: tier,
                description: description,
                effectType: effectType,
                effectValue: effectValue,
                duration: duration,
                conflictTags: conflictTags,
                regionTags: regionTags,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConsumableTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConsumableTableTable,
      ConsumableTableData,
      $$ConsumableTableTableFilterComposer,
      $$ConsumableTableTableOrderingComposer,
      $$ConsumableTableTableAnnotationComposer,
      $$ConsumableTableTableCreateCompanionBuilder,
      $$ConsumableTableTableUpdateCompanionBuilder,
      (
        ConsumableTableData,
        BaseReferences<
          _$AppDatabase,
          $ConsumableTableTable,
          ConsumableTableData
        >,
      ),
      ConsumableTableData,
      PrefetchHooks Function()
    >;
typedef $$NpcTableTableCreateCompanionBuilder =
    NpcTableCompanion Function({
      required String id,
      required String name,
      required String role,
      required String description,
      required String personality,
      required String dialogueHooks,
      Value<String?> factionAlignment,
      required String conflictTags,
      required String regionTags,
      Value<String?> services,
      Value<int> rowid,
    });
typedef $$NpcTableTableUpdateCompanionBuilder =
    NpcTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> role,
      Value<String> description,
      Value<String> personality,
      Value<String> dialogueHooks,
      Value<String?> factionAlignment,
      Value<String> conflictTags,
      Value<String> regionTags,
      Value<String?> services,
      Value<int> rowid,
    });

class $$NpcTableTableFilterComposer
    extends Composer<_$AppDatabase, $NpcTableTable> {
  $$NpcTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personality => $composableBuilder(
    column: $table.personality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dialogueHooks => $composableBuilder(
    column: $table.dialogueHooks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get factionAlignment => $composableBuilder(
    column: $table.factionAlignment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get services => $composableBuilder(
    column: $table.services,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NpcTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NpcTableTable> {
  $$NpcTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personality => $composableBuilder(
    column: $table.personality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dialogueHooks => $composableBuilder(
    column: $table.dialogueHooks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get factionAlignment => $composableBuilder(
    column: $table.factionAlignment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get services => $composableBuilder(
    column: $table.services,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NpcTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NpcTableTable> {
  $$NpcTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get personality => $composableBuilder(
    column: $table.personality,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dialogueHooks => $composableBuilder(
    column: $table.dialogueHooks,
    builder: (column) => column,
  );

  GeneratedColumn<String> get factionAlignment => $composableBuilder(
    column: $table.factionAlignment,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => column,
  );

  GeneratedColumn<String> get regionTags => $composableBuilder(
    column: $table.regionTags,
    builder: (column) => column,
  );

  GeneratedColumn<String> get services =>
      $composableBuilder(column: $table.services, builder: (column) => column);
}

class $$NpcTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NpcTableTable,
          NpcTableData,
          $$NpcTableTableFilterComposer,
          $$NpcTableTableOrderingComposer,
          $$NpcTableTableAnnotationComposer,
          $$NpcTableTableCreateCompanionBuilder,
          $$NpcTableTableUpdateCompanionBuilder,
          (
            NpcTableData,
            BaseReferences<_$AppDatabase, $NpcTableTable, NpcTableData>,
          ),
          NpcTableData,
          PrefetchHooks Function()
        > {
  $$NpcTableTableTableManager(_$AppDatabase db, $NpcTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NpcTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NpcTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NpcTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> personality = const Value.absent(),
                Value<String> dialogueHooks = const Value.absent(),
                Value<String?> factionAlignment = const Value.absent(),
                Value<String> conflictTags = const Value.absent(),
                Value<String> regionTags = const Value.absent(),
                Value<String?> services = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NpcTableCompanion(
                id: id,
                name: name,
                role: role,
                description: description,
                personality: personality,
                dialogueHooks: dialogueHooks,
                factionAlignment: factionAlignment,
                conflictTags: conflictTags,
                regionTags: regionTags,
                services: services,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String role,
                required String description,
                required String personality,
                required String dialogueHooks,
                Value<String?> factionAlignment = const Value.absent(),
                required String conflictTags,
                required String regionTags,
                Value<String?> services = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NpcTableCompanion.insert(
                id: id,
                name: name,
                role: role,
                description: description,
                personality: personality,
                dialogueHooks: dialogueHooks,
                factionAlignment: factionAlignment,
                conflictTags: conflictTags,
                regionTags: regionTags,
                services: services,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NpcTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NpcTableTable,
      NpcTableData,
      $$NpcTableTableFilterComposer,
      $$NpcTableTableOrderingComposer,
      $$NpcTableTableAnnotationComposer,
      $$NpcTableTableCreateCompanionBuilder,
      $$NpcTableTableUpdateCompanionBuilder,
      (
        NpcTableData,
        BaseReferences<_$AppDatabase, $NpcTableTable, NpcTableData>,
      ),
      NpcTableData,
      PrefetchHooks Function()
    >;
typedef $$FactionTableTableCreateCompanionBuilder =
    FactionTableCompanion Function({
      required String id,
      required String name,
      required String archetype,
      required String description,
      required String agenda,
      required String methods,
      Value<String?> leaderNpcId,
      required String keyMembers,
      required String homeRegion,
      required String alliedFactions,
      required String rivalFactions,
      required int playerReputationStart,
      required String conflictTags,
      required String campaignLengthMinimum,
      Value<int> rowid,
    });
typedef $$FactionTableTableUpdateCompanionBuilder =
    FactionTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> archetype,
      Value<String> description,
      Value<String> agenda,
      Value<String> methods,
      Value<String?> leaderNpcId,
      Value<String> keyMembers,
      Value<String> homeRegion,
      Value<String> alliedFactions,
      Value<String> rivalFactions,
      Value<int> playerReputationStart,
      Value<String> conflictTags,
      Value<String> campaignLengthMinimum,
      Value<int> rowid,
    });

class $$FactionTableTableFilterComposer
    extends Composer<_$AppDatabase, $FactionTableTable> {
  $$FactionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archetype => $composableBuilder(
    column: $table.archetype,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get agenda => $composableBuilder(
    column: $table.agenda,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get methods => $composableBuilder(
    column: $table.methods,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get leaderNpcId => $composableBuilder(
    column: $table.leaderNpcId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keyMembers => $composableBuilder(
    column: $table.keyMembers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeRegion => $composableBuilder(
    column: $table.homeRegion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alliedFactions => $composableBuilder(
    column: $table.alliedFactions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rivalFactions => $composableBuilder(
    column: $table.rivalFactions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get playerReputationStart => $composableBuilder(
    column: $table.playerReputationStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get campaignLengthMinimum => $composableBuilder(
    column: $table.campaignLengthMinimum,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FactionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FactionTableTable> {
  $$FactionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archetype => $composableBuilder(
    column: $table.archetype,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get agenda => $composableBuilder(
    column: $table.agenda,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get methods => $composableBuilder(
    column: $table.methods,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get leaderNpcId => $composableBuilder(
    column: $table.leaderNpcId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keyMembers => $composableBuilder(
    column: $table.keyMembers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeRegion => $composableBuilder(
    column: $table.homeRegion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alliedFactions => $composableBuilder(
    column: $table.alliedFactions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rivalFactions => $composableBuilder(
    column: $table.rivalFactions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get playerReputationStart => $composableBuilder(
    column: $table.playerReputationStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get campaignLengthMinimum => $composableBuilder(
    column: $table.campaignLengthMinimum,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FactionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FactionTableTable> {
  $$FactionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get archetype =>
      $composableBuilder(column: $table.archetype, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get agenda =>
      $composableBuilder(column: $table.agenda, builder: (column) => column);

  GeneratedColumn<String> get methods =>
      $composableBuilder(column: $table.methods, builder: (column) => column);

  GeneratedColumn<String> get leaderNpcId => $composableBuilder(
    column: $table.leaderNpcId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get keyMembers => $composableBuilder(
    column: $table.keyMembers,
    builder: (column) => column,
  );

  GeneratedColumn<String> get homeRegion => $composableBuilder(
    column: $table.homeRegion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get alliedFactions => $composableBuilder(
    column: $table.alliedFactions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rivalFactions => $composableBuilder(
    column: $table.rivalFactions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get playerReputationStart => $composableBuilder(
    column: $table.playerReputationStart,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => column,
  );

  GeneratedColumn<String> get campaignLengthMinimum => $composableBuilder(
    column: $table.campaignLengthMinimum,
    builder: (column) => column,
  );
}

class $$FactionTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FactionTableTable,
          FactionTableData,
          $$FactionTableTableFilterComposer,
          $$FactionTableTableOrderingComposer,
          $$FactionTableTableAnnotationComposer,
          $$FactionTableTableCreateCompanionBuilder,
          $$FactionTableTableUpdateCompanionBuilder,
          (
            FactionTableData,
            BaseReferences<_$AppDatabase, $FactionTableTable, FactionTableData>,
          ),
          FactionTableData,
          PrefetchHooks Function()
        > {
  $$FactionTableTableTableManager(_$AppDatabase db, $FactionTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FactionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FactionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FactionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> archetype = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> agenda = const Value.absent(),
                Value<String> methods = const Value.absent(),
                Value<String?> leaderNpcId = const Value.absent(),
                Value<String> keyMembers = const Value.absent(),
                Value<String> homeRegion = const Value.absent(),
                Value<String> alliedFactions = const Value.absent(),
                Value<String> rivalFactions = const Value.absent(),
                Value<int> playerReputationStart = const Value.absent(),
                Value<String> conflictTags = const Value.absent(),
                Value<String> campaignLengthMinimum = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FactionTableCompanion(
                id: id,
                name: name,
                archetype: archetype,
                description: description,
                agenda: agenda,
                methods: methods,
                leaderNpcId: leaderNpcId,
                keyMembers: keyMembers,
                homeRegion: homeRegion,
                alliedFactions: alliedFactions,
                rivalFactions: rivalFactions,
                playerReputationStart: playerReputationStart,
                conflictTags: conflictTags,
                campaignLengthMinimum: campaignLengthMinimum,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String archetype,
                required String description,
                required String agenda,
                required String methods,
                Value<String?> leaderNpcId = const Value.absent(),
                required String keyMembers,
                required String homeRegion,
                required String alliedFactions,
                required String rivalFactions,
                required int playerReputationStart,
                required String conflictTags,
                required String campaignLengthMinimum,
                Value<int> rowid = const Value.absent(),
              }) => FactionTableCompanion.insert(
                id: id,
                name: name,
                archetype: archetype,
                description: description,
                agenda: agenda,
                methods: methods,
                leaderNpcId: leaderNpcId,
                keyMembers: keyMembers,
                homeRegion: homeRegion,
                alliedFactions: alliedFactions,
                rivalFactions: rivalFactions,
                playerReputationStart: playerReputationStart,
                conflictTags: conflictTags,
                campaignLengthMinimum: campaignLengthMinimum,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FactionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FactionTableTable,
      FactionTableData,
      $$FactionTableTableFilterComposer,
      $$FactionTableTableOrderingComposer,
      $$FactionTableTableAnnotationComposer,
      $$FactionTableTableCreateCompanionBuilder,
      $$FactionTableTableUpdateCompanionBuilder,
      (
        FactionTableData,
        BaseReferences<_$AppDatabase, $FactionTableTable, FactionTableData>,
      ),
      FactionTableData,
      PrefetchHooks Function()
    >;
typedef $$StoryArcTableTableCreateCompanionBuilder =
    StoryArcTableCompanion Function({
      required String id,
      required String title,
      required String conflictType,
      required String arcType,
      required String description,
      required String prerequisites,
      required String triggers,
      required String resolutionOptions,
      required String campaignLengthMinimum,
      required String factionsInvolved,
      Value<int> rowid,
    });
typedef $$StoryArcTableTableUpdateCompanionBuilder =
    StoryArcTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> conflictType,
      Value<String> arcType,
      Value<String> description,
      Value<String> prerequisites,
      Value<String> triggers,
      Value<String> resolutionOptions,
      Value<String> campaignLengthMinimum,
      Value<String> factionsInvolved,
      Value<int> rowid,
    });

class $$StoryArcTableTableFilterComposer
    extends Composer<_$AppDatabase, $StoryArcTableTable> {
  $$StoryArcTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictType => $composableBuilder(
    column: $table.conflictType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get arcType => $composableBuilder(
    column: $table.arcType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prerequisites => $composableBuilder(
    column: $table.prerequisites,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get triggers => $composableBuilder(
    column: $table.triggers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resolutionOptions => $composableBuilder(
    column: $table.resolutionOptions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get campaignLengthMinimum => $composableBuilder(
    column: $table.campaignLengthMinimum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get factionsInvolved => $composableBuilder(
    column: $table.factionsInvolved,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StoryArcTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StoryArcTableTable> {
  $$StoryArcTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictType => $composableBuilder(
    column: $table.conflictType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get arcType => $composableBuilder(
    column: $table.arcType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prerequisites => $composableBuilder(
    column: $table.prerequisites,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggers => $composableBuilder(
    column: $table.triggers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resolutionOptions => $composableBuilder(
    column: $table.resolutionOptions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get campaignLengthMinimum => $composableBuilder(
    column: $table.campaignLengthMinimum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get factionsInvolved => $composableBuilder(
    column: $table.factionsInvolved,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StoryArcTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StoryArcTableTable> {
  $$StoryArcTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get conflictType => $composableBuilder(
    column: $table.conflictType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get arcType =>
      $composableBuilder(column: $table.arcType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prerequisites => $composableBuilder(
    column: $table.prerequisites,
    builder: (column) => column,
  );

  GeneratedColumn<String> get triggers =>
      $composableBuilder(column: $table.triggers, builder: (column) => column);

  GeneratedColumn<String> get resolutionOptions => $composableBuilder(
    column: $table.resolutionOptions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get campaignLengthMinimum => $composableBuilder(
    column: $table.campaignLengthMinimum,
    builder: (column) => column,
  );

  GeneratedColumn<String> get factionsInvolved => $composableBuilder(
    column: $table.factionsInvolved,
    builder: (column) => column,
  );
}

class $$StoryArcTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StoryArcTableTable,
          StoryArcTableData,
          $$StoryArcTableTableFilterComposer,
          $$StoryArcTableTableOrderingComposer,
          $$StoryArcTableTableAnnotationComposer,
          $$StoryArcTableTableCreateCompanionBuilder,
          $$StoryArcTableTableUpdateCompanionBuilder,
          (
            StoryArcTableData,
            BaseReferences<
              _$AppDatabase,
              $StoryArcTableTable,
              StoryArcTableData
            >,
          ),
          StoryArcTableData,
          PrefetchHooks Function()
        > {
  $$StoryArcTableTableTableManager(_$AppDatabase db, $StoryArcTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoryArcTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoryArcTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoryArcTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> conflictType = const Value.absent(),
                Value<String> arcType = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> prerequisites = const Value.absent(),
                Value<String> triggers = const Value.absent(),
                Value<String> resolutionOptions = const Value.absent(),
                Value<String> campaignLengthMinimum = const Value.absent(),
                Value<String> factionsInvolved = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StoryArcTableCompanion(
                id: id,
                title: title,
                conflictType: conflictType,
                arcType: arcType,
                description: description,
                prerequisites: prerequisites,
                triggers: triggers,
                resolutionOptions: resolutionOptions,
                campaignLengthMinimum: campaignLengthMinimum,
                factionsInvolved: factionsInvolved,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String conflictType,
                required String arcType,
                required String description,
                required String prerequisites,
                required String triggers,
                required String resolutionOptions,
                required String campaignLengthMinimum,
                required String factionsInvolved,
                Value<int> rowid = const Value.absent(),
              }) => StoryArcTableCompanion.insert(
                id: id,
                title: title,
                conflictType: conflictType,
                arcType: arcType,
                description: description,
                prerequisites: prerequisites,
                triggers: triggers,
                resolutionOptions: resolutionOptions,
                campaignLengthMinimum: campaignLengthMinimum,
                factionsInvolved: factionsInvolved,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StoryArcTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StoryArcTableTable,
      StoryArcTableData,
      $$StoryArcTableTableFilterComposer,
      $$StoryArcTableTableOrderingComposer,
      $$StoryArcTableTableAnnotationComposer,
      $$StoryArcTableTableCreateCompanionBuilder,
      $$StoryArcTableTableUpdateCompanionBuilder,
      (
        StoryArcTableData,
        BaseReferences<_$AppDatabase, $StoryArcTableTable, StoryArcTableData>,
      ),
      StoryArcTableData,
      PrefetchHooks Function()
    >;
typedef $$QuestTableTableCreateCompanionBuilder =
    QuestTableCompanion Function({
      required String id,
      required String title,
      Value<String?> parentArc,
      required String questType,
      required String description,
      Value<String?> giverNpcId,
      required String objectives,
      required String rewards,
      required String conflictWeight,
      required String conflictTags,
      required String campaignLengthMinimum,
      Value<int> rowid,
    });
typedef $$QuestTableTableUpdateCompanionBuilder =
    QuestTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> parentArc,
      Value<String> questType,
      Value<String> description,
      Value<String?> giverNpcId,
      Value<String> objectives,
      Value<String> rewards,
      Value<String> conflictWeight,
      Value<String> conflictTags,
      Value<String> campaignLengthMinimum,
      Value<int> rowid,
    });

class $$QuestTableTableFilterComposer
    extends Composer<_$AppDatabase, $QuestTableTable> {
  $$QuestTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentArc => $composableBuilder(
    column: $table.parentArc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questType => $composableBuilder(
    column: $table.questType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get giverNpcId => $composableBuilder(
    column: $table.giverNpcId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get objectives => $composableBuilder(
    column: $table.objectives,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rewards => $composableBuilder(
    column: $table.rewards,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictWeight => $composableBuilder(
    column: $table.conflictWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get campaignLengthMinimum => $composableBuilder(
    column: $table.campaignLengthMinimum,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuestTableTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestTableTable> {
  $$QuestTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentArc => $composableBuilder(
    column: $table.parentArc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questType => $composableBuilder(
    column: $table.questType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get giverNpcId => $composableBuilder(
    column: $table.giverNpcId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get objectives => $composableBuilder(
    column: $table.objectives,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rewards => $composableBuilder(
    column: $table.rewards,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictWeight => $composableBuilder(
    column: $table.conflictWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get campaignLengthMinimum => $composableBuilder(
    column: $table.campaignLengthMinimum,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuestTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestTableTable> {
  $$QuestTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get parentArc =>
      $composableBuilder(column: $table.parentArc, builder: (column) => column);

  GeneratedColumn<String> get questType =>
      $composableBuilder(column: $table.questType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get giverNpcId => $composableBuilder(
    column: $table.giverNpcId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get objectives => $composableBuilder(
    column: $table.objectives,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rewards =>
      $composableBuilder(column: $table.rewards, builder: (column) => column);

  GeneratedColumn<String> get conflictWeight => $composableBuilder(
    column: $table.conflictWeight,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conflictTags => $composableBuilder(
    column: $table.conflictTags,
    builder: (column) => column,
  );

  GeneratedColumn<String> get campaignLengthMinimum => $composableBuilder(
    column: $table.campaignLengthMinimum,
    builder: (column) => column,
  );
}

class $$QuestTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestTableTable,
          QuestTableData,
          $$QuestTableTableFilterComposer,
          $$QuestTableTableOrderingComposer,
          $$QuestTableTableAnnotationComposer,
          $$QuestTableTableCreateCompanionBuilder,
          $$QuestTableTableUpdateCompanionBuilder,
          (
            QuestTableData,
            BaseReferences<_$AppDatabase, $QuestTableTable, QuestTableData>,
          ),
          QuestTableData,
          PrefetchHooks Function()
        > {
  $$QuestTableTableTableManager(_$AppDatabase db, $QuestTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> parentArc = const Value.absent(),
                Value<String> questType = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> giverNpcId = const Value.absent(),
                Value<String> objectives = const Value.absent(),
                Value<String> rewards = const Value.absent(),
                Value<String> conflictWeight = const Value.absent(),
                Value<String> conflictTags = const Value.absent(),
                Value<String> campaignLengthMinimum = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestTableCompanion(
                id: id,
                title: title,
                parentArc: parentArc,
                questType: questType,
                description: description,
                giverNpcId: giverNpcId,
                objectives: objectives,
                rewards: rewards,
                conflictWeight: conflictWeight,
                conflictTags: conflictTags,
                campaignLengthMinimum: campaignLengthMinimum,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> parentArc = const Value.absent(),
                required String questType,
                required String description,
                Value<String?> giverNpcId = const Value.absent(),
                required String objectives,
                required String rewards,
                required String conflictWeight,
                required String conflictTags,
                required String campaignLengthMinimum,
                Value<int> rowid = const Value.absent(),
              }) => QuestTableCompanion.insert(
                id: id,
                title: title,
                parentArc: parentArc,
                questType: questType,
                description: description,
                giverNpcId: giverNpcId,
                objectives: objectives,
                rewards: rewards,
                conflictWeight: conflictWeight,
                conflictTags: conflictTags,
                campaignLengthMinimum: campaignLengthMinimum,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuestTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestTableTable,
      QuestTableData,
      $$QuestTableTableFilterComposer,
      $$QuestTableTableOrderingComposer,
      $$QuestTableTableAnnotationComposer,
      $$QuestTableTableCreateCompanionBuilder,
      $$QuestTableTableUpdateCompanionBuilder,
      (
        QuestTableData,
        BaseReferences<_$AppDatabase, $QuestTableTable, QuestTableData>,
      ),
      QuestTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EnemyTableTableTableManager get enemyTable =>
      $$EnemyTableTableTableManager(_db, _db.enemyTable);
  $$RoomTableTableTableManager get roomTable =>
      $$RoomTableTableTableManager(_db, _db.roomTable);
  $$WeaponTableTableTableManager get weaponTable =>
      $$WeaponTableTableTableManager(_db, _db.weaponTable);
  $$ArmorTableTableTableManager get armorTable =>
      $$ArmorTableTableTableManager(_db, _db.armorTable);
  $$ConsumableTableTableTableManager get consumableTable =>
      $$ConsumableTableTableTableManager(_db, _db.consumableTable);
  $$NpcTableTableTableManager get npcTable =>
      $$NpcTableTableTableManager(_db, _db.npcTable);
  $$FactionTableTableTableManager get factionTable =>
      $$FactionTableTableTableManager(_db, _db.factionTable);
  $$StoryArcTableTableTableManager get storyArcTable =>
      $$StoryArcTableTableTableManager(_db, _db.storyArcTable);
  $$QuestTableTableTableManager get questTable =>
      $$QuestTableTableTableManager(_db, _db.questTable);
}
