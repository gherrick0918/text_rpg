"""
init_db.py — Create all content tables in the SQLite database.
Safe to run multiple times — uses CREATE TABLE IF NOT EXISTS.
Usage: python scripts/init_db.py
"""

import sqlite3
import os
import sys

DB_PATH = os.environ.get("CONTENT_DB_PATH", "C:/dev/text_rpg/content.db")

TABLES = [
    """
    CREATE TABLE IF NOT EXISTS room_table (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        region TEXT NOT NULL,
        description TEXT NOT NULL,
        atmosphere TEXT NOT NULL,
        conflict_tags TEXT NOT NULL,
        encounter_eligible INTEGER NOT NULL DEFAULT 1,
        loot_eligible INTEGER NOT NULL DEFAULT 1,
        notes TEXT
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS enemy_table (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        strength INTEGER NOT NULL,
        stamina INTEGER NOT NULL,
        agility INTEGER NOT NULL,
        luck INTEGER NOT NULL,
        charisma INTEGER NOT NULL,
        wisdom INTEGER NOT NULL,
        intelligence INTEGER NOT NULL,
        damage_dice TEXT NOT NULL,
        armor_value INTEGER NOT NULL DEFAULT 0,
        tier INTEGER NOT NULL DEFAULT 1,
        behavior TEXT NOT NULL,
        special_ability TEXT,
        loot_table TEXT NOT NULL DEFAULT '[]',
        conflict_tags TEXT NOT NULL DEFAULT '[]',
        region_tags TEXT NOT NULL DEFAULT '[]',
        xp_value INTEGER NOT NULL DEFAULT 0
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS npc_table (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        role TEXT NOT NULL,
        description TEXT NOT NULL,
        personality TEXT NOT NULL,
        dialogue_hooks TEXT NOT NULL DEFAULT '[]',
        faction_alignment TEXT,
        conflict_tags TEXT NOT NULL DEFAULT '[]',
        region_tags TEXT NOT NULL DEFAULT '[]',
        services TEXT
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS weapon_table (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        weapon_type TEXT NOT NULL,
        tier INTEGER NOT NULL DEFAULT 1,
        description TEXT NOT NULL,
        damage_dice TEXT NOT NULL,
        stat_requirement TEXT NOT NULL,
        requirement_threshold INTEGER NOT NULL DEFAULT 10,
        special_effect TEXT,
        conflict_tags TEXT NOT NULL DEFAULT '[]',
        region_tags TEXT NOT NULL DEFAULT '[]'
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS armor_table (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        armor_type TEXT NOT NULL,
        tier INTEGER NOT NULL DEFAULT 1,
        description TEXT NOT NULL,
        defense_value INTEGER NOT NULL DEFAULT 1,
        stat_requirement TEXT NOT NULL,
        requirement_threshold INTEGER NOT NULL DEFAULT 8,
        agility_penalty INTEGER NOT NULL DEFAULT 0,
        special_effect TEXT,
        conflict_tags TEXT NOT NULL DEFAULT '[]',
        region_tags TEXT NOT NULL DEFAULT '[]'
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS consumable_table (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        tier INTEGER NOT NULL DEFAULT 1,
        description TEXT NOT NULL,
        effect_type TEXT NOT NULL,
        effect_value TEXT NOT NULL,
        duration TEXT NOT NULL,
        conflict_tags TEXT NOT NULL DEFAULT '[]',
        region_tags TEXT NOT NULL DEFAULT '[]'
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS faction_table (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        archetype TEXT NOT NULL,
        description TEXT NOT NULL,
        agenda TEXT NOT NULL,
        methods TEXT NOT NULL,
        leader_npc_id TEXT,
        key_members TEXT NOT NULL DEFAULT '[]',
        home_region TEXT NOT NULL,
        allied_factions TEXT NOT NULL DEFAULT '[]',
        rival_factions TEXT NOT NULL DEFAULT '[]',
        player_reputation_start INTEGER NOT NULL DEFAULT 0,
        conflict_tags TEXT NOT NULL DEFAULT '[]',
        campaign_length_minimum TEXT NOT NULL DEFAULT 'short'
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS story_arc_table (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        conflict_type TEXT NOT NULL,
        arc_type TEXT NOT NULL,
        description TEXT NOT NULL,
        prerequisites TEXT NOT NULL DEFAULT '[]',
        triggers TEXT NOT NULL,
        resolution_options TEXT NOT NULL DEFAULT '[]',
        campaign_length_minimum TEXT NOT NULL DEFAULT 'short',
        factions_involved TEXT NOT NULL DEFAULT '[]'
    )
    """,
    """
    CREATE TABLE IF NOT EXISTS quest_table (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        parent_arc TEXT,
        quest_type TEXT NOT NULL,
        description TEXT NOT NULL,
        giver_npc_id TEXT,
        objectives TEXT NOT NULL DEFAULT '[]',
        rewards TEXT NOT NULL DEFAULT '{}',
        conflict_weight TEXT NOT NULL DEFAULT '{}',
        conflict_tags TEXT NOT NULL DEFAULT '[]',
        campaign_length_minimum TEXT NOT NULL DEFAULT 'short'
    )
    """,
]

def init_db():
    print(f"Initialising database: {DB_PATH}")
    conn = sqlite3.connect(DB_PATH)
    try:
        for table_sql in TABLES:
            conn.execute(table_sql)
        conn.commit()
        # Report what exists
        cursor = conn.execute(
            "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"
        )
        tables = [row[0] for row in cursor.fetchall()]
        print(f"Tables in database ({len(tables)}):")
        for t in tables:
            row = conn.execute(f"SELECT COUNT(*) FROM {t}").fetchone()
            print(f"  {t:<30} {row[0]} rows")
        print("\nDatabase ready.")
    except Exception as e:
        conn.rollback()
        print(f"Error: {e}")
        sys.exit(1)
    finally:
        conn.close()

if __name__ == "__main__":
    init_db()