#!/usr/bin/env python3
"""
Update task checklist: Mark all checkboxes as complete in a task file.

This script safely updates all unchecked checkboxes ([ ]) to checked ([x])
in a task markdown file. Creates a backup before modification.

Usage:
    python scripts/validation/update_task_checklist.py <TASK_NUMBER>
    python scripts/validation/update_task_checklist.py <FILE_PATH>
"""

import argparse
import re
import shutil
import sys
from pathlib import Path
from typing import Tuple


def find_task_file(task_number: int) -> Path:
    """Find task file by number (in-progress or completed)."""
    tasks_dir = Path("tasks")

    # Try in-progress first
    pattern = f"{task_number}-in-progress-*.md"
    matches = list(tasks_dir.glob(pattern))
    if matches:
        return matches[0]

    # Try completed
    pattern = f"{task_number}-completed-*.md"
    matches = list(tasks_dir.glob(pattern))
    if matches:
        return matches[0]

    # Try pending (shouldn't happen, but handle it)
    pattern = f"{task_number}-pending-*.md"
    matches = list(tasks_dir.glob(pattern))
    if matches:
        return matches[0]

    raise FileNotFoundError(f"Task {task_number} file not found in tasks/ directory")


def update_checkboxes(content: str) -> Tuple[str, int]:
    """
    Update all unchecked checkboxes to checked.

    Returns:
        Tuple of (updated_content, count_of_updates)
    """
    # Pattern matches:
    # - [ ] or * [ ] (with optional whitespace)
    # Captures the list marker (- or *) and whitespace
    pattern = r"(\s*[-*]\s+)\[ \]"

    def replace_checkbox(match):
        return f"{match.group(1)}[x]"

    updated_content = re.sub(pattern, replace_checkbox, content)

    # Count how many were replaced
    original_count = len(re.findall(r"\[ \]", content))
    updated_count = len(re.findall(r"\[ \]", updated_content))
    replacements = original_count - updated_count

    return updated_content, replacements


def main():
    parser = argparse.ArgumentParser(
        description="Update task checklist: Mark all checkboxes as complete"
    )
    parser.add_argument(
        "input", help="Task number (e.g., 118) or file path (e.g., tasks/118-in-progress-*.md)"
    )
    parser.add_argument(
        "--dry-run", action="store_true", help="Show what would be updated without making changes"
    )
    parser.add_argument(
        "--no-backup", action="store_true", help="Skip creating backup file (not recommended)"
    )

    args = parser.parse_args()

    # Determine file path
    try:
        task_number = int(args.input)
        file_path = find_task_file(task_number)
    except ValueError:
        # Not a number, treat as file path
        file_path = Path(args.input)
        if not file_path.exists():
            print(f"❌ File not found: {file_path}")
            sys.exit(1)
    except FileNotFoundError as e:
        print(f"❌ {e}")
        sys.exit(1)

    if not file_path.exists():
        print(f"❌ File not found: {file_path}")
        sys.exit(1)

    # Read file
    try:
        content = file_path.read_text(encoding="utf-8")
    except Exception as e:
        print(f"❌ Error reading file: {e}")
        sys.exit(1)

    # Update checkboxes
    updated_content, replacements = update_checkboxes(content)

    if replacements == 0:
        print(f"ℹ️  No unchecked checkboxes found in {file_path.name}")
        sys.exit(0)

    # Show what will be updated
    print(f"📋 Found {replacements} unchecked checkbox(es) in {file_path.name}")

    if args.dry_run:
        print("🔍 Dry-run mode: No changes will be made")
        print(f"   Would update {replacements} checkbox(es)")
        sys.exit(0)

    # Create backup
    if not args.no_backup:
        backup_path = file_path.with_suffix(f"{file_path.suffix}.bak")
        try:
            shutil.copy2(file_path, backup_path)
            print(f"💾 Backup created: {backup_path.name}")
        except Exception as e:
            print(f"⚠️  Warning: Could not create backup: {e}")
            response = input("   Continue without backup? (y/N): ")
            if response.lower() != "y":
                print("❌ Aborted")
                sys.exit(1)

    # Write updated content
    try:
        file_path.write_text(updated_content, encoding="utf-8")
        print(f"✅ Updated {replacements} checkbox(es) in {file_path.name}")
        if not args.no_backup:
            print(f"💡 Backup available at: {backup_path.name}")
    except Exception as e:
        print(f"❌ Error writing file: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
