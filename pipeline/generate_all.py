"""
generate_all.py — Run all content generation in sequence.
Usage: python generate_all.py
Outputs JSON files to the output/ directory, named by type and timestamp.
"""

import subprocess
import sys
import os
from datetime import datetime

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
GENERATE_SCRIPT = os.path.join(SCRIPT_DIR, "scripts", "generate.py")

# Content type -> count to generate
GENERATION_TARGETS = [
    ("room",       75),
    ("enemy",      45),
    ("npc",        35),
    ("weapon",     25),
    ("armor",      18),
    ("consumable", 18),
    ("faction",     5),
    ("story_arc",  14),
    ("quest",      28),
]

def run_generation():
    total = len(GENERATION_TARGETS)
    results = []

    print(f"\n{'='*50}")
    print(f"  Iron Gryphon — Full Content Generation Run")
    print(f"  Started: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"{'='*50}\n")

    for i, (content_type, count) in enumerate(GENERATION_TARGETS, 1):
        print(f"[{i}/{total}] Generating {count} {content_type} records...")
        result = subprocess.run(
            [sys.executable, GENERATE_SCRIPT, content_type, str(count)],
            capture_output=True,
            text=True
        )
        if result.returncode == 0:
            print(f"  ✓ {content_type} — done")
            print(f"    {result.stdout.strip()}")
            results.append((content_type, True, result.stdout.strip()))
        else:
            print(f"  ✗ {content_type} — FAILED")
            print(f"    {result.stderr.strip()}")
            results.append((content_type, False, result.stderr.strip()))

    print(f"\n{'='*50}")
    print(f"  Generation Summary")
    print(f"{'='*50}")
    passed = sum(1 for _, ok, _ in results if ok)
    failed = sum(1 for _, ok, _ in results if not ok)
    print(f"  Passed: {passed}/{total}")
    if failed:
        print(f"  Failed: {failed}/{total}")
        for content_type, ok, msg in results:
            if not ok:
                print(f"    - {content_type}: {msg}")
    print(f"\n  Output files are in the output/ directory.")
    print(f"  Run validate_all.py next to check the results.\n")

if __name__ == "__main__":
    run_generation()
