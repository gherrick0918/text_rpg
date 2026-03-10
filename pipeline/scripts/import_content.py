"""
import_content.py — Import validated JSON into the SQLite content database.
Usage: python scripts/import_content.py <content_type> <json_file>
"""

import sys
import json
import sqlite3
import os
from datetime import datetime

DB_PATH = os.environ.get("CONTENT_DB_PATH", "C:/dev/text_rpg/content.db")

def get_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

def encode(val):
    if isinstance(val, (list, dict)):
        return json.dumps(val)
    return val

# ── Importers ────────────────────────────────────────────────────────────────

def import_enemy(conn, records):
    sql = """
        INSERT OR IGNORE INTO enemy_table (
            id, name, description,
            strength, stamina, agility, luck, charisma, wisdom, intelligence,
            damage_dice, armor_value, tier, behavior, special_ability,
            loot_table, conflict_tags, region_tags, xp_value
        ) VALUES (
            :id, :name, :description,
            :strength, :stamina, :agility, :luck, :charisma, :wisdom, :intelligence,
            :damageDice, :armorValue, :tier, :behavior, :specialAbility,
            :lootTable, :conflictTags, :regionTags, :xpValue
        )
    """
    count = 0
    for r in records:
        r["lootTable"] = encode(r.get("lootTable", []))
        r["conflictTags"] = encode(r.get("conflictTags", []))
        r["regionTags"] = encode(r.get("regionTags", []))
        r["specialAbility"] = r.get("specialAbility") or r.get("special_ability")
        r["armorValue"] = r.get("armorValue") or r.get("armor_value", 0)
        r["damageDice"] = r.get("damageDice") or r.get("damage_dice", "1d6")
        r["xpValue"] = r.get("xpValue") or r.get("xp_value", 0)
        conn.execute(sql, r)
        count += 1
    return count

def import_room(conn, records):
    sql = """
        INSERT OR IGNORE INTO room_table (
            id, name, region, description, atmosphere,
            conflict_tags, encounter_eligible, loot_eligible, notes
        ) VALUES (
            :id, :name, :region, :description, :atmosphere,
            :conflictTags, :encounterEligible, :lootEligible, :notes
        )
    """
    count = 0
    for r in records:
        r["conflictTags"] = encode(r.get("conflictTags", r.get("conflict_tags", [])))
        r["encounterEligible"] = 1 if r.get("encounterEligible", r.get("encounter_eligible", True)) else 0
        r["lootEligible"] = 1 if r.get("lootEligible", r.get("loot_eligible", True)) else 0
        r["notes"] = r.get("notes", "")
        conn.execute(sql, r)
        count += 1
    return count

def import_npc(conn, records):
    sql = """
        INSERT OR IGNORE INTO npc_table (
            id, name, role, description, personality,
            dialogue_hooks, faction_alignment,
            conflict_tags, region_tags, services
        ) VALUES (
            :id, :name, :role, :description, :personality,
            :dialogueHooks, :factionAlignment,
            :conflictTags, :regionTags, :services
        )
    """
    count = 0
    for r in records:
        r["dialogueHooks"] = encode(r.get("dialogueHooks", r.get("dialogue_hooks", [])))
        r["factionAlignment"] = r.get("factionAlignment", r.get("faction_alignment"))
        r["conflictTags"] = encode(r.get("conflictTags", r.get("conflict_tags", [])))
        r["regionTags"] = encode(r.get("regionTags", r.get("region_tags", [])))
        r["services"] = r.get("services")
        conn.execute(sql, r)
        count += 1
    return count

def import_weapon(conn, records):
    sql = """
        INSERT OR IGNORE INTO weapon_table (
            id, name, weapon_type, tier, description,
            damage_dice, stat_requirement, requirement_threshold,
            special_effect, conflict_tags, region_tags
        ) VALUES (
            :id, :name, :weaponType, :tier, :description,
            :damageDice, :statRequirement, :requirementThreshold,
            :specialEffect, :conflictTags, :regionTags
        )
    """
    count = 0
    for r in records:
        r["weaponType"] = r.get("weaponType", r.get("weapon_type", ""))
        r["damageDice"] = r.get("damageDice", r.get("damage_dice", "1d6"))
        r["statRequirement"] = r.get("statRequirement", r.get("stat_requirement", "strength"))
        r["requirementThreshold"] = r.get("requirementThreshold", r.get("requirement_threshold", 10))
        r["specialEffect"] = r.get("specialEffect", r.get("special_effect"))
        r["conflictTags"] = encode(r.get("conflictTags", r.get("conflict_tags", [])))
        r["regionTags"] = encode(r.get("regionTags", r.get("region_tags", [])))
        conn.execute(sql, r)
        count += 1
    return count

def import_armor(conn, records):
    sql = """
        INSERT OR IGNORE INTO armor_table (
            id, name, armor_type, tier, description,
            defense_value, stat_requirement, requirement_threshold,
            agility_penalty, special_effect, conflict_tags, region_tags
        ) VALUES (
            :id, :name, :armorType, :tier, :description,
            :defenseValue, :statRequirement, :requirementThreshold,
            :agilityPenalty, :specialEffect, :conflictTags, :regionTags
        )
    """
    count = 0
    for r in records:
        r["armorType"] = r.get("armorType", r.get("armor_type", "light"))
        r["defenseValue"] = r.get("defenseValue", r.get("defense_value", 1))
        r["statRequirement"] = r.get("statRequirement", r.get("stat_requirement", "strength"))
        r["requirementThreshold"] = r.get("requirementThreshold", r.get("requirement_threshold", 8))
        r["agilityPenalty"] = r.get("agilityPenalty", r.get("agility_penalty", 0))
        r["specialEffect"] = r.get("specialEffect", r.get("special_effect"))
        r["conflictTags"] = encode(r.get("conflictTags", r.get("conflict_tags", [])))
        r["regionTags"] = encode(r.get("regionTags", r.get("region_tags", [])))
        conn.execute(sql, r)
        count += 1
    return count

def import_consumable(conn, records):
    sql = """
        INSERT OR IGNORE INTO consumable_table (
            id, name, tier, description,
            effect_type, effect_value, duration,
            conflict_tags, region_tags
        ) VALUES (
            :id, :name, :tier, :description,
            :effectType, :effectValue, :duration,
            :conflictTags, :regionTags
        )
    """
    count = 0
    for r in records:
        r["effectType"] = r.get("effectType", r.get("effect_type", "heal"))
        r["effectValue"] = r.get("effectValue", r.get("effect_value", ""))
        r["conflictTags"] = encode(r.get("conflictTags", r.get("conflict_tags", [])))
        r["regionTags"] = encode(r.get("regionTags", r.get("region_tags", [])))
        conn.execute(sql, r)
        count += 1
    return count

def import_faction(conn, records):
    sql = """
        INSERT OR IGNORE INTO faction_table (
            id, name, archetype, description, agenda, methods,
            leader_npc_id, key_members, home_region,
            allied_factions, rival_factions,
            player_reputation_start, conflict_tags, campaign_length_minimum
        ) VALUES (
            :id, :name, :archetype, :description, :agenda, :methods,
            :leaderNpcId, :keyMembers, :homeRegion,
            :alliedFactions, :rivalFactions,
            :playerReputationStart, :conflictTags, :campaignLengthMinimum
        )
    """
    count = 0
    for r in records:
        r["leaderNpcId"] = r.get("leaderNpcId", r.get("leader_npc_id", r.get("leaderNpc_id")))
        r["keyMembers"] = encode(r.get("keyMembers", r.get("key_members", [])))
        r["homeRegion"] = r.get("homeRegion", r.get("home_region", "town"))
        r["alliedFactions"] = encode(r.get("alliedFactions", r.get("allied_factions", [])))
        r["rivalFactions"] = encode(r.get("rivalFactions", r.get("rival_factions", [])))
        r["playerReputationStart"] = r.get("playerReputationStart", r.get("player_reputation_start", 0))
        r["conflictTags"] = encode(r.get("conflictTags", r.get("conflict_tags", [])))
        r["campaignLengthMinimum"] = r.get("campaignLengthMinimum", r.get("campaign_length_minimum", "short"))
        conn.execute(sql, r)
        count += 1
    return count

def import_story_arc(conn, records):
    sql = """
        INSERT OR IGNORE INTO story_arc_table (
            id, title, conflict_type, arc_type, description,
            prerequisites, triggers, resolution_options,
            campaign_length_minimum, factions_involved
        ) VALUES (
            :id, :title, :conflictType, :arcType, :description,
            :prerequisites, :triggers, :resolutionOptions,
            :campaignLengthMinimum, :factionsInvolved
        )
    """
    count = 0
    for r in records:
        r["conflictType"] = r.get("conflictType", r.get("conflict_type", "epic"))
        r["arcType"] = r.get("arcType", r.get("arc_type", "optional"))
        r["prerequisites"] = encode(r.get("prerequisites", []))
        r["resolutionOptions"] = encode(r.get("resolutionOptions", r.get("resolution_options", [])))
        r["campaignLengthMinimum"] = r.get("campaignLengthMinimum", r.get("campaign_length_minimum", "short"))
        r["factionsInvolved"] = encode(r.get("factionsInvolved", r.get("factions_involved", [])))
        conn.execute(sql, r)
        count += 1
    return count

def import_quest(conn, records):
    sql = """
        INSERT OR IGNORE INTO quest_table (
            id, title, parent_arc, quest_type, description,
            giver_npc_id, objectives, rewards,
            conflict_weight, conflict_tags, campaign_length_minimum
        ) VALUES (
            :id, :title, :parentArc, :questType, :description,
            :giverNpcId, :objectives, :rewards,
            :conflictWeight, :conflictTags, :campaignLengthMinimum
        )
    """
    count = 0
    for r in records:
        r["parentArc"] = r.get("parentArc", r.get("parent_arc"))
        r["questType"] = r.get("questType", r.get("quest_type", "side"))
        r["giverNpcId"] = r.get("giverNpcId", r.get("giver_npc_id", r.get("giver")))
        r["objectives"] = encode(r.get("objectives", []))
        r["rewards"] = encode(r.get("rewards", {}))
        r["conflictWeight"] = encode(r.get("conflictWeight", r.get("conflict_weight", {})))
        r["conflictTags"] = encode(r.get("conflictTags", r.get("conflict_tags", [])))
        r["campaignLengthMinimum"] = r.get("campaignLengthMinimum", r.get("campaign_length_minimum", "short"))
        conn.execute(sql, r)
        count += 1
    return count

# ── Dispatch ─────────────────────────────────────────────────────────────────

IMPORTERS = {
    "enemy":     import_enemy,
    "room":      import_room,
    "npc":       import_npc,
    "weapon":    import_weapon,
    "armor":     import_armor,
    "consumable": import_consumable,
    "faction":   import_faction,
    "story_arc": import_story_arc,
    "quest":     import_quest,
}

def main():
    if len(sys.argv) != 3:
        print("Usage: python import_content.py <content_type> <json_file>")
        print(f"Types: {', '.join(IMPORTERS.keys())}")
        sys.exit(1)

    content_type = sys.argv[1].lower()
    json_file = sys.argv[2]

    if content_type not in IMPORTERS:
        print(f"Unknown content type: {content_type}")
        print(f"Valid types: {', '.join(IMPORTERS.keys())}")
        sys.exit(1)

    if not os.path.exists(json_file):
        print(f"File not found: {json_file}")
        sys.exit(1)

    with open(json_file, "r", encoding="utf-8") as f:
        records = json.load(f)

    if not isinstance(records, list):
        print("JSON file must contain an array of records.")
        sys.exit(1)

    conn = get_connection()
    try:
        importer = IMPORTERS[content_type]
        count = importer(conn, records)
        conn.commit()
        print(f"Imported {count} {content_type} records into {DB_PATH}")
    except Exception as e:
        conn.rollback()
        print(f"Import failed: {e}")
        sys.exit(1)
    finally:
        conn.close()

if __name__ == "__main__":
    main()