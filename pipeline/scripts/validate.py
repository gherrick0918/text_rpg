import json
import sys
import argparse
from pathlib import Path

OUTPUT_DIR = Path(__file__).parent.parent / "output"
VALIDATED_DIR = Path(__file__).parent.parent / "validated"

# Required fields per content type
SCHEMAS = {
    "enemy": {
        "required": [
            "id", "name", "description",
            "strength", "stamina", "agility", "luck",
            "charisma", "wisdom", "intelligence",
            "damageDice", "armorValue", "tier", "behavior",
            "lootTable", "conflictTags", "regionTags", "xpValue"
        ],
        "stat_fields": [
            "strength", "stamina", "agility", "luck",
            "charisma", "wisdom", "intelligence"
        ],
        "list_fields": ["lootTable", "conflictTags", "regionTags"],
        "valid_behaviors": ["aggressive", "defensive", "tactical", "erratic"],
        "valid_conflict_tags": ["epic", "political", "social"],
        "valid_region_tags": ["wilderness", "dungeon", "town", "ruins"],
    },
    "room": {
        "required": [
            "id", "name", "region", "description",
            "atmosphere", "conflictTags", "encounterEligible", "lootEligible"
        ],
        "list_fields": ["conflictTags"],
        "valid_regions": ["wilderness", "dungeon", "town", "ruins"],
        "valid_atmospheres": ["tense", "peaceful", "eerie", "bustling", "desolate", "mysterious"],
        "valid_conflict_tags": ["epic", "political", "social"],
    },
    "npc": {
        "required": [
            "id", "name", "role", "description", "personality",
            "dialogueHooks", "conflictTags", "regionTags"
        ],
        "list_fields": ["dialogueHooks", "conflictTags", "regionTags"],
        "valid_roles": ["merchant", "quest_giver", "faction_contact", "innkeeper",
                       "guard", "sage", "criminal", "noble", "priest", "wanderer"],
        "valid_conflict_tags": ["epic", "political", "social"],
        "valid_region_tags": ["wilderness", "dungeon", "town", "ruins"],
    },
    "weapon": {
        "required": [
            "id", "name", "weaponType", "tier", "description",
            "damageDice", "statRequirement", "requirementThreshold",
            "conflictTags", "regionTags"
        ],
        "list_fields": ["conflictTags", "regionTags"],
        "valid_weapon_types": ["sword", "axe", "bow", "staff", "dagger",
                               "mace", "spear", "crossbow", "warhammer"],
        "valid_stat_requirements": ["strength", "agility", "intelligence"],
        "valid_conflict_tags": ["epic", "political", "social"],
        "valid_region_tags": ["wilderness", "dungeon", "town", "ruins"],
    },
    "armor": {
        "required": [
            "id", "name", "armorType", "tier", "description",
            "defenseValue", "statRequirement", "requirementThreshold",
            "agilityPenalty", "conflictTags", "regionTags"
        ],
        "list_fields": ["conflictTags", "regionTags"],
        "valid_armor_types": ["light", "medium", "heavy", "shield", "accessory"],
        "valid_stat_requirements": ["strength", "stamina", "agility"],
        "valid_conflict_tags": ["epic", "political", "social"],
        "valid_region_tags": ["wilderness", "dungeon", "town", "ruins"],
    },
    "consumable": {
        "required": [
            "id", "name", "tier", "description", "effectType",
            "effectValue", "duration", "conflictTags", "regionTags"
        ],
        "list_fields": ["conflictTags", "regionTags"],
        "valid_effect_types": ["heal", "buff", "debuff", "utility"],
        "valid_durations": ["instant", "rounds", "persistent"],
        "valid_conflict_tags": ["epic", "political", "social"],
        "valid_region_tags": ["wilderness", "dungeon", "town", "ruins"],
    },
    "faction": {
        "required": [
            "id", "name", "archetype", "description", "agenda",
            "methods", "homeRegion", "conflictTags", "campaignLengthMinimum"
        ],
        "list_fields": ["conflictTags", "alliedFactions", "rivalFactions", "keyMembers"],
        "valid_archetypes": ["military", "religious", "criminal", "noble",
                            "merchant", "rebel", "arcane", "civic"],
        "valid_regions": ["wilderness", "dungeon", "town", "ruins"],
        "valid_conflict_tags": ["epic", "political", "social"],
        "valid_lengths": ["short", "medium", "long"],
    },
    "story_arc": {
        "required": [
            "id", "title", "conflictType", "arcType", "description",
            "triggers", "resolutionOptions", "campaignLengthMinimum"
        ],
        "list_fields": ["prerequisites", "resolutionOptions", "factionsInvolved"],
        "valid_conflict_types": ["epic", "political", "social"],
        "valid_arc_types": ["main", "optional"],
        "valid_lengths": ["short", "medium", "long"],
    },
    "quest": {
        "required": [
            "id", "title", "questType", "description",
            "objectives", "rewards", "conflictWeight",
            "conflictTags", "campaignLengthMinimum"
        ],
        "list_fields": ["objectives", "conflictTags"],
        "valid_quest_types": ["main", "side", "faction", "dynamic"],
        "valid_conflict_tags": ["epic", "political", "social"],
        "valid_lengths": ["short", "medium", "long"],
    },
}

def validate_enemy(record: dict, index: int) -> list:
    errors = []
    schema = SCHEMAS["enemy"]

    # Required fields
    for field in schema["required"]:
        if field not in record:
            errors.append(f"[{index}] Missing field: {field}")

    # Stat ranges
    for stat in schema.get("stat_fields", []):
        if stat in record:
            val = record[stat]
            if not isinstance(val, int) or val < 1 or val > 20:
                errors.append(f"[{index}] {stat} must be integer 1-20, got: {val}")

    # Behavior
    if "behavior" in record and record["behavior"] not in schema["valid_behaviors"]:
        errors.append(f"[{index}] Invalid behavior: {record['behavior']}")

    # Conflict tags
    if "conflictTags" in record:
        for tag in record["conflictTags"]:
            if tag not in schema["valid_conflict_tags"]:
                errors.append(f"[{index}] Invalid conflictTag: {tag}")

    # Region tags
    if "regionTags" in record:
        for tag in record["regionTags"]:
            if tag not in schema["valid_region_tags"]:
                errors.append(f"[{index}] Invalid regionTag: {tag}")

    # List fields
    for field in schema["list_fields"]:
        if field in record and not isinstance(record[field], list):
            errors.append(f"[{index}] {field} must be a list")

    return errors

def validate_room(record: dict, index: int) -> list:
    errors = []
    schema = SCHEMAS["room"]

    # Required fields
    for field in schema["required"]:
        if field not in record:
            errors.append(f"[{index}] Missing field: {field}")

    # Region
    if "region" in record and record["region"] not in schema["valid_regions"]:
        errors.append(f"[{index}] Invalid region: {record['region']}")

    # Atmosphere
    if "atmosphere" in record and record["atmosphere"] not in schema["valid_atmospheres"]:
        errors.append(f"[{index}] Invalid atmosphere: {record['atmosphere']}")

    # Conflict tags
    if "conflictTags" in record:
        for tag in record["conflictTags"]:
            if tag not in schema["valid_conflict_tags"]:
                errors.append(f"[{index}] Invalid conflictTag: {tag}")

    # Boolean fields
    for field in ["encounterEligible", "lootEligible"]:
        if field in record and not isinstance(record[field], bool):
            errors.append(f"[{index}] {field} must be boolean")

    return errors

def validate_npc(record: dict, index: int) -> list:
    errors = []
    schema = SCHEMAS["npc"]
    for field in schema["required"]:
        if field not in record:
            errors.append(f"[{index}] Missing field: {field}")
    if "role" in record and record["role"] not in schema["valid_roles"]:
        errors.append(f"[{index}] Invalid role: {record['role']}")
    if "conflictTags" in record:
        for tag in record["conflictTags"]:
            if tag not in schema["valid_conflict_tags"]:
                errors.append(f"[{index}] Invalid conflictTag: {tag}")
    if "regionTags" in record:
        for tag in record["regionTags"]:
            if tag not in schema["valid_region_tags"]:
                errors.append(f"[{index}] Invalid regionTag: {tag}")
    for field in schema["list_fields"]:
        if field in record and not isinstance(record[field], list):
            errors.append(f"[{index}] {field} must be a list")
    return errors

def validate_weapon(record: dict, index: int) -> list:
    errors = []
    schema = SCHEMAS["weapon"]
    for field in schema["required"]:
        if field not in record:
            errors.append(f"[{index}] Missing field: {field}")
    if "weaponType" in record and record["weaponType"] not in schema["valid_weapon_types"]:
        errors.append(f"[{index}] Invalid weaponType: {record['weaponType']}")
    if "statRequirement" in record and record["statRequirement"] not in schema["valid_stat_requirements"]:
        errors.append(f"[{index}] Invalid statRequirement: {record['statRequirement']}")
    if "tier" in record and record["tier"] not in [1, 2, 3]:
        errors.append(f"[{index}] Invalid tier: {record['tier']}")
    if "conflictTags" in record:
        for tag in record["conflictTags"]:
            if tag not in schema["valid_conflict_tags"]:
                errors.append(f"[{index}] Invalid conflictTag: {tag}")
    return errors

def validate_armor(record: dict, index: int) -> list:
    errors = []
    schema = SCHEMAS["armor"]
    for field in schema["required"]:
        if field not in record:
            errors.append(f"[{index}] Missing field: {field}")
    if "armorType" in record and record["armorType"] not in schema["valid_armor_types"]:
        errors.append(f"[{index}] Invalid armorType: {record['armorType']}")
    if "statRequirement" in record and record["statRequirement"] not in schema["valid_stat_requirements"]:
        errors.append(f"[{index}] Invalid statRequirement: {record['statRequirement']}")
    if "tier" in record and record["tier"] not in [1, 2, 3]:
        errors.append(f"[{index}] Invalid tier: {record['tier']}")
    if "conflictTags" in record:
        for tag in record["conflictTags"]:
            if tag not in schema["valid_conflict_tags"]:
                errors.append(f"[{index}] Invalid conflictTag: {tag}")
    return errors

def validate_consumable(record: dict, index: int) -> list:
    errors = []
    schema = SCHEMAS["consumable"]
    for field in schema["required"]:
        if field not in record:
            errors.append(f"[{index}] Missing field: {field}")
    if "effectType" in record and record["effectType"] not in schema["valid_effect_types"]:
        errors.append(f"[{index}] Invalid effectType: {record['effectType']}")
    if "duration" in record and record["duration"] not in schema["valid_durations"]:
        errors.append(f"[{index}] Invalid duration: {record['duration']}")
    if "tier" in record and record["tier"] not in [1, 2, 3]:
        errors.append(f"[{index}] Invalid tier: {record['tier']}")
    if "conflictTags" in record:
        for tag in record["conflictTags"]:
            if tag not in schema["valid_conflict_tags"]:
                errors.append(f"[{index}] Invalid conflictTag: {tag}")
    return errors

def validate_faction(record: dict, index: int) -> list:
    errors = []
    schema = SCHEMAS["faction"]
    for field in schema["required"]:
        if field not in record:
            errors.append(f"[{index}] Missing field: {field}")
    if "archetype" in record and record["archetype"] not in schema["valid_archetypes"]:
        errors.append(f"[{index}] Invalid archetype: {record['archetype']}")
    if "homeRegion" in record and record["homeRegion"] not in schema["valid_regions"]:
        errors.append(f"[{index}] Invalid homeRegion: {record['homeRegion']}")
    if "campaignLengthMinimum" in record and record["campaignLengthMinimum"] not in schema["valid_lengths"]:
        errors.append(f"[{index}] Invalid campaignLengthMinimum: {record['campaignLengthMinimum']}")
    if "conflictTags" in record:
        for tag in record["conflictTags"]:
            if tag not in schema["valid_conflict_tags"]:
                errors.append(f"[{index}] Invalid conflictTag: {tag}")
    return errors

def validate_story_arc(record: dict, index: int) -> list:
    errors = []
    schema = SCHEMAS["story_arc"]
    for field in schema["required"]:
        if field not in record:
            errors.append(f"[{index}] Missing field: {field}")
    if "conflictType" in record and record["conflictType"] not in schema["valid_conflict_types"]:
        errors.append(f"[{index}] Invalid conflictType: {record['conflictType']}")
    if "arcType" in record and record["arcType"] not in schema["valid_arc_types"]:
        errors.append(f"[{index}] Invalid arcType: {record['arcType']}")
    if "campaignLengthMinimum" in record and record["campaignLengthMinimum"] not in schema["valid_lengths"]:
        errors.append(f"[{index}] Invalid campaignLengthMinimum: {record['campaignLengthMinimum']}")
    if "resolutionOptions" in record and not isinstance(record["resolutionOptions"], list):
        errors.append(f"[{index}] resolutionOptions must be a list")
    return errors

def validate_quest(record: dict, index: int) -> list:
    errors = []
    schema = SCHEMAS["quest"]
    for field in schema["required"]:
        if field not in record:
            errors.append(f"[{index}] Missing field: {field}")
    if "questType" in record and record["questType"] not in schema["valid_quest_types"]:
        errors.append(f"[{index}] Invalid questType: {record['questType']}")
    if "campaignLengthMinimum" in record and record["campaignLengthMinimum"] not in schema["valid_lengths"]:
        errors.append(f"[{index}] Invalid campaignLengthMinimum: {record['campaignLengthMinimum']}")
    if "conflictTags" in record:
        for tag in record["conflictTags"]:
            if tag not in schema["valid_conflict_tags"]:
                errors.append(f"[{index}] Invalid conflictTag: {tag}")
    if "objectives" in record and not isinstance(record["objectives"], list):
        errors.append(f"[{index}] objectives must be a list")
    return errors

VALIDATORS = {
    "enemy": validate_enemy,
    "room": validate_room,
    "npc": validate_npc,
    "weapon": validate_weapon,
    "armor": validate_armor,
    "consumable": validate_consumable,
    "faction": validate_faction,
    "story_arc": validate_story_arc,
    "quest": validate_quest,
}

def validate_file(input_file: Path, content_type: str) -> tuple[list, list]:
    raw = json.loads(input_file.read_text(encoding="utf-8"))
    if not isinstance(raw, list):
        print("Error: input file must contain a JSON array.")
        return [], []

    valid_records = []
    all_errors = []

    validator = VALIDATORS[content_type]

    for i, record in enumerate(raw):
        errors = validator(record, i)
        if errors:
            all_errors.extend(errors)
        else:
            valid_records.append(record)

    return valid_records, all_errors

def main():
    parser = argparse.ArgumentParser(description="Validate generated RPG content")
    parser.add_argument("content_type", choices=SCHEMAS.keys())
    parser.add_argument("input_file", help="Path to JSON file to validate")
    args = parser.parse_args()

    input_file = Path(args.input_file)
    if not input_file.exists():
        print(f"File not found: {input_file}")
        sys.exit(1)

    print(f"Validating {input_file.name}...")
    valid_records, errors = validate_file(input_file, args.content_type)

    if errors:
        print(f"\n{len(errors)} validation error(s) found:")
        for error in errors:
            print(f"  {error}")

    print(f"\n{len(valid_records)} valid records out of {len(valid_records) + len(errors)} total.")

    if valid_records:
        VALIDATED_DIR.mkdir(exist_ok=True)
        output_file = VALIDATED_DIR / input_file.name
        output_file.write_text(
            json.dumps(valid_records, indent=2, ensure_ascii=False),
            encoding="utf-8"
        )
        print(f"Valid records saved to {output_file}")

if __name__ == "__main__":
    main()