import anthropic
import json
import os
import sys
import argparse
from datetime import datetime
from pathlib import Path

# Paths
PIPELINE_DIR = Path(__file__).parent.parent
PROMPTS_DIR = PIPELINE_DIR / "prompts"
OUTPUT_DIR = PIPELINE_DIR / "output"

# Supported content types and their prompt files
CONTENT_TYPES = {
    "enemy": "enemy_prompt.txt",
    "room": "room_prompt.txt",
    "npc": "npc_prompt.txt",
    "weapon": "weapon_prompt.txt",
    "armor": "armor_prompt.txt",
    "consumable": "consumable_prompt.txt",
    "faction": "faction_prompt.txt",
    "story_arc": "story_arc_prompt.txt",
    "quest": "quest_prompt.txt",
}

def load_prompt(content_type: str, count: int) -> str:
    prompt_file = PROMPTS_DIR / CONTENT_TYPES[content_type]
    if not prompt_file.exists():
        raise FileNotFoundError(f"Prompt file not found: {prompt_file}")
    template = prompt_file.read_text(encoding="utf-8")
    return template.replace("{{count}}", str(count))

def generate(content_type: str, count: int, batch_size: int = 10) -> list:
    client = anthropic.Anthropic()
    all_results = []
    batches = (count + batch_size - 1) // batch_size  # ceiling division

    print(f"Generating {count} {content_type} records in {batches} batch(es)...")

    for batch_num in range(batches):
        current_count = min(batch_size, count - len(all_results))
        print(f"  Batch {batch_num + 1}/{batches} — requesting {current_count} records...")

        prompt = load_prompt(content_type, current_count)

        try:
            message = client.messages.create(
                model="claude-opus-4-5",
                max_tokens=4096,
                messages=[{"role": "user", "content": prompt}]
            )

            raw = message.content[0].text.strip()

            # Strip markdown fences if model includes them despite instructions
            if raw.startswith("```"):
                lines = raw.split("\n")
                raw = "\n".join(lines[1:-1])

            batch_results = json.loads(raw)

            if not isinstance(batch_results, list):
                print(f"  Warning: batch {batch_num + 1} did not return a list, skipping.")
                continue

            all_results.extend(batch_results)
            print(f"  Batch {batch_num + 1} complete — got {len(batch_results)} records.")

        except json.JSONDecodeError as e:
            print(f"  Error: batch {batch_num + 1} returned invalid JSON: {e}")
            print(f"  Raw response saved for inspection.")
            error_file = OUTPUT_DIR / f"{content_type}_error_batch{batch_num + 1}.txt"
            error_file.write_text(raw, encoding="utf-8")
            continue
        except Exception as e:
            print(f"  Error in batch {batch_num + 1}: {e}")
            continue

    return all_results

def save_output(content_type: str, results: list) -> Path:
    OUTPUT_DIR.mkdir(exist_ok=True)
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    output_file = OUTPUT_DIR / f"{content_type}_{timestamp}.json"
    output_file.write_text(
        json.dumps(results, indent=2, ensure_ascii=False),
        encoding="utf-8"
    )
    print(f"\nSaved {len(results)} records to {output_file}")
    return output_file

def main():
    parser = argparse.ArgumentParser(description="Generate RPG content via Claude API")
    parser.add_argument("content_type", choices=CONTENT_TYPES.keys(),
                        help="Type of content to generate")
    parser.add_argument("count", type=int,
                        help="Number of records to generate")
    parser.add_argument("--batch-size", type=int, default=10,
                        help="Records per API call (default: 10)")
    args = parser.parse_args()

    results = generate(args.content_type, args.count, args.batch_size)

    if results:
        save_output(args.content_type, results)
        print(f"\nDone. {len(results)} {args.content_type} records generated.")
    else:
        print("\nNo results generated. Check errors above.")

if __name__ == "__main__":
    main()