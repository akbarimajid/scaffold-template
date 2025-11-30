#!/bin/bash
# scripts/task_automation/check_blockers.sh
# Verify blocker tasks are complete before starting a task

set -e

N=$1

if [ -z "$N" ]; then
  echo "❌ Usage: $0 <TASK_NUMBER>"
  echo "   Example: $0 78"
  exit 1
fi

# Find task file
TASK_FILE=$(find tasks -name "${N}-*.md" | head -1)

if [ -z "$TASK_FILE" ]; then
  echo "❌ Task $N not found"
  echo "   Looking for: tasks/${N}-*.md"
  exit 1
fi

# Extract blocker task IDs
BLOCKERS=$(grep -E "Blocked by:|Dependencies:" "$TASK_FILE" | grep -oE "Task [0-9]+" | grep -oE "[0-9]+" || true)

if [ -z "$BLOCKERS" ]; then
  echo "✅ No blockers found, Task $N ready to start"
  exit 0
fi

# Check each blocker
BLOCKED=0
for BLOCKER in $BLOCKERS; do
  # Check BACKLOG.md for blocker status
  BLOCKER_STATUS=$(grep -E "Task $BLOCKER" tasks/BACKLOG.md | grep -oE "pending|in-progress|completed" | head -1 || echo "not-found")

  if [ "$BLOCKER_STATUS" != "completed" ]; then
    echo "❌ Task $N blocked by Task $BLOCKER (status: $BLOCKER_STATUS)"
    echo "   Complete Task $BLOCKER first before starting Task $N"
    BLOCKED=1
  else
    echo "✅ Task $BLOCKER completed (unblocks Task $N)"
  fi
done

if [ $BLOCKED -eq 1 ]; then
  exit 1
else
  echo "✅ All blockers complete, Task $N ready to start"
  exit 0
fi
