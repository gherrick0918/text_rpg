"""
import_all.py — Import all validated content files into the SQLite database.

Usage:
    python import_all.py                  # imports everything in validated/
    python import_all.py validated/       # same, explicit path
    python import_all.py path/to/dir/     # import from a specific folder

Imports are skipped if a record with the same id already exists, so this
script is safe to re-run — it will only insert new records.
"""

import subprocess
import sys
import os
import glob
from datetime import datetime

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
IMPORT_SCRIPT = os.path.join(SCRIPT_DIR, "scripts", "import_content.py")
VALIDATED_DIR = os.path.join(SCRIPT_DIR, "validated")

KNOWN_TYPES = [
    "room", "enemy", "npc", "weapon", "armor",
    "consumable", "faction", "story_arc", "quest",
]

# Import order matters — factions before npcs, arcs before quests
IMPORT_ORDER = [
    "faction",
    "room",
    "enemy",
    "npc",
    "weapon",
    "armor",
    "consumable",
    "story_arc",
    "quest",
]

def detect_type(filename: str) -> str | None:
    base = os.path.basename(filename).lower()
    for t in KNOWN_TYPES:
        if base.startswith(t):
            return t
    return None

def import_all(search_dir: str):
    json_files = sorted(glob.glob(os.path.join(search_dir, "*.json")))

    if not json_files:
        print(f"  No JSON files found in {search_dir}")
        print(f"  Run validate_all.py first — it copies passing files to validated/")
        return

    # Group files by content type
    by_type: dict[str, list[str]] = {t: [] for t in IMPORT_ORDER}
    skipped = []

    for filepath in json_files:
        content_type = detect_type(os.path.basename(filepath))
        if content_type is None:
            skipped.append(os.path.basename(filepath))
        else:
            by_type[content_type].append(filepath)

    print(f"\n{'='*50}")
    print(f"  Iron Gryphon — Import All Validated Files")
    print(f"  Directory: {search_dir}")
    print(f"  Started:   {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"{'='*50}\n")

    if skipped:
        for f in skipped:
            print(f"  ? SKIP  {f} (unrecognised type)")
        print()

    results = []

    for content_type in IMPORT_ORDER:
        files = by_type[content_type]
        if not files:
            continue

        for filepath in files:
            filename = os.path.basename(filepath)
            print(f"  Importing {filename} as '{content_type}'...")

            result = subprocess.run(
                [sys.executable, IMPORT_SCRIPT, content_type, filepath],
                capture_output=True,
                text=True
            )

            if result.returncode == 0:
                output = result.stdout.strip()
                print(f"  ✓ {filename}")
                if output:
                    for line in output.splitlines():
                        print(f"    {line}")
                results.append((filename, True, ""))
            else:
                errors = result.stdout.strip() or result.stderr.strip()
                print(f"  ✗ FAIL  {filename}")
                for line in errors.splitlines():
                    print(f"         {line}")
                results.append((filename, False, errors))

    passed = sum(1 for _, ok, _ in results if ok)
    failed = sum(1 for _, ok, _ in results if not ok)
    total = len(results)

    print(f"\n{'='*50}")
    print(f"  Import Summary")
    print(f"{'='*50}")
    print(f"  Imported: {passed}/{total} files")
    if failed:
        print(f"  Failed:   {failed}/{total} files")
        print(f"\n  Check errors above. Failed files were not imported.")
    else:
        print(f"\n  All files imported successfully.")
        print(f"  Copy the updated content.db to your Flutter project.")
    print()

if __name__ == "__main__":
    search_dir = sys.argv[1] if len(sys.argv) > 1 else VALIDATED_DIR
    search_dir = os.path.abspath(search_dir)
    import_all(search_dir)
