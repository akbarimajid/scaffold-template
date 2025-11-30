#!/bin/bash
# scripts/task_automation/status_task.sh
# Show current task status, file location, and blocker status

set -e

N=$1

if [ -z "$N" ]; then
  echo "❌ Usage: $0 <TASK_NUMBER>"
  echo "   Example: $0 78"
  exit 1
fi

# Find task file (any status)
TASK_FILE=$(find tasks -name "${N}-*.md" | head -1)

if [ -z "$TASK_FILE" ]; then
  echo "❌ Task $N not found"
  echo "   Looking for: tasks/${N}-*.md"
  exit 1
fi

# Extract status from filename (handles pending, in-progress, completed, blocked, cancelled)
STATUS=$(basename "$TASK_FILE" | sed -E "s/${N}-(pending|in-progress|completed|blocked|cancelled)-.*\.md/\1/")

echo "📋 Task $N Status"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Status: $STATUS"
echo "File:   $TASK_FILE"
echo ""

# Check for blockers
if [ -f "$TASK_FILE" ]; then
  BLOCKERS=$(grep -E "Blocked by:|Dependencies:" "$TASK_FILE" | grep -oE "Task [0-9]+" | grep -oE "[0-9]+" || true)

  if [ -n "$BLOCKERS" ]; then
    echo "Blockers:"
    for BLOCKER in $BLOCKERS; do
      BLOCKER_FILE=$(find tasks -name "${BLOCKER}-*.md" | head -1)
      if [ -n "$BLOCKER_FILE" ]; then
        BLOCKER_STATUS=$(basename "$BLOCKER_FILE" | sed -E "s/${BLOCKER}-(pending|in-progress|completed|blocked|cancelled)-.*\.md/\1/")
        if [ "$BLOCKER_STATUS" = "completed" ]; then
          echo "  ✅ Task $BLOCKER: completed"
        else
          echo "  ❌ Task $BLOCKER: $BLOCKER_STATUS (blocks Task $N)"
        fi
      else
        echo "  ⚠️  Task $BLOCKER: not found"
      fi
    done
  else
    echo "Blockers: None"
  fi
fi
