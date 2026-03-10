"""
validate_all.py — Validate all generated output files.

Usage:
    python validate_all.py               # validates everything in output/
    python validate_all.py output/       # same, explicit path
    python validate_all.py path/to/dir/  # validate files in a specific folder

Validates all JSON files found in the target directory, auto-detecting
content type from the filename prefix (e.g. enemy_20250101_120000.json).
Validated files are copied to validated/ on success.
"""

import subprocess
import sys
import os
import glob
import json
from datetime import datetime

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
VALIDATE_SCRIPT = os.path.join(SCRIPT_DIR, "scripts", "validate.py")
OUTPUT_DIR = os.path.join(SCRIPT_DIR, "output")
VALIDATED_DIR = os.path.join(SCRIPT_DIR, "validated")

# Map filename prefixes to content type names
KNOWN_TYPES = [
    "room", "enemy", "npc", "weapon", "armor",
    "consumable", "faction", "story_arc", "quest",
]

def detect_type(filename: str) -> str | None:
    base = os.path.basename(filename).lower()
    for t in KNOWN_TYPES:
        if base.startswith(t):
            return t
    return None

def validate_all(search_dir: str):
    json_files = sorted(glob.glob(os.path.join(search_dir, "*.json")))

    if not json_files:
        print(f"  No JSON files found in {search_dir}")
        return

    print(f"\n{'='*50}")
    print(f"  Iron Gryphon — Validate All Output Files")
    print(f"  Directory: {search_dir}")
    print(f"  Started:   {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"{'='*50}\n")

    results = []
    skipped = []

    for filepath in json_files:
        filename = os.path.basename(filepath)
        content_type = detect_type(filename)

        if content_type is None:
            print(f"  ? SKIP  {filename} (unrecognised prefix)")
            skipped.append(filename)
            continue

        print(f"  Validating {filename} as '{content_type}'...")
        result = subprocess.run(
            [sys.executable, VALIDATE_SCRIPT, content_type, filepath],
            capture_output=True,
            text=True
        )

        if result.returncode == 0:
            print(f"  ✓ PASS  {filename}")
            # Copy to validated/
            os.makedirs(VALIDATED_DIR, exist_ok=True)
            dest = os.path.join(VALIDATED_DIR, filename)
            with open(filepath, "r", encoding="utf-8") as f:
                data = f.read()
            with open(dest, "w", encoding="utf-8") as f:
                f.write(data)
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
    print(f"  Validation Summary")
    print(f"{'='*50}")
    print(f"  Passed:  {passed}/{total}")
    if skipped:
        print(f"  Skipped: {len(skipped)} (unknown type)")
    if failed:
        print(f"  Failed:  {failed}/{total}")
        print(f"\n  Fix the errors above and re-run before importing.")
    else:
        print(f"\n  All files passed. Run import_all.py to load into the database.")
    print()

if __name__ == "__main__":
    search_dir = sys.argv[1] if len(sys.argv) > 1 else OUTPUT_DIR
    search_dir = os.path.abspath(search_dir)
    validate_all(search_dir)
