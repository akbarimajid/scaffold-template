#!/bin/bash
# scripts/task_automation/complete_task.sh
# Auto-rename task from in-progress → completed, add completion notes, update BACKLOG.md

set -e

N=$1

if [ -z "$N" ]; then
  echo "❌ Usage: $0 <TASK_NUMBER>"
  echo "   Example: $0 78"
  exit 1
fi

# Find in-progress task file
IN_PROGRESS_FILES=$(find tasks -name "${N}-in-progress-*.md" 2>/dev/null)
IN_PROGRESS_COUNT=$(echo "$IN_PROGRESS_FILES" | grep -c . || echo "0")

if [ "$IN_PROGRESS_COUNT" -eq 0 ]; then
  echo "❌ Task $N not found or not in in-progress status"
  echo "   Looking for: tasks/${N}-in-progress-*.md"
  exit 1
fi

if [ "$IN_PROGRESS_COUNT" -gt 1 ]; then
  echo "❌ Multiple in-progress files found for Task $N:"
  echo "$IN_PROGRESS_FILES"
  echo "   Please clean up duplicate files manually"
  exit 1
fi

IN_PROGRESS_FILE=$(echo "$IN_PROGRESS_FILES" | head -1)

# Check if completed file already exists
COMPLETED_FILE=$(echo "$IN_PROGRESS_FILE" | sed 's/in-progress/completed/')
if [ -f "$COMPLETED_FILE" ]; then
  echo "❌ Completed file already exists: $COMPLETED_FILE"
  echo "   This should not happen. Please check for duplicate files."
  exit 1
fi

# Rename file
mv "$IN_PROGRESS_FILE" "$COMPLETED_FILE"

# Verify rename succeeded
if [ ! -f "$COMPLETED_FILE" ]; then
  echo "❌ Failed to rename file to: $COMPLETED_FILE"
  exit 1
fi

# Cleanup: Remove any leftover in-progress files (in case editor saved to old name)
find tasks -name "${N}-in-progress-*.md" -delete 2>/dev/null || true

# Add completion notes template if not present
if ! grep -q "## Completion Notes" "$COMPLETED_FILE"; then
  cat >> "$COMPLETED_FILE" << 'EOF'

## Completion Notes

- **What worked:**
- **Patterns identified:**
- **Lessons learned:**
- **Would do differently:**
EOF
  echo "   Added completion notes template"
fi

# Update BACKLOG.md
if [ -f "tasks/BACKLOG.md" ]; then
  # Update status to completed
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS sed requires backup extension
    sed -i.bak "s/\[Task $N\](.*-in-progress-.*\.md)/[Task $N]($(basename $COMPLETED_FILE))/g" tasks/BACKLOG.md
    sed -i.bak "s/Task $N.*in-progress/Task $N - completed/g" tasks/BACKLOG.md
    rm -f tasks/BACKLOG.md.bak
  else
    # Linux sed
    sed -i "s/\[Task $N\](.*-in-progress-.*\.md)/[Task $N]($(basename $COMPLETED_FILE))/g" tasks/BACKLOG.md
    sed -i "s/Task $N.*in-progress/Task $N - completed/g" tasks/BACKLOG.md
  fi
fi

# Warn if integration checklist incomplete (don't block)
if ! grep -q "\[x\].*make pre-commit.*passed" "$COMPLETED_FILE" && ! grep -q "\[x\].*Code Quality" "$COMPLETED_FILE"; then
  echo "⚠️  Warning: Integration checklist may be incomplete"
  echo "   Review the 'Final Chunk: Integration & Enforcement' section"
fi

echo "✅ Task $N completed: $COMPLETED_FILE"
echo "   BACKLOG.md updated"
echo "   Fill in completion notes before committing"
