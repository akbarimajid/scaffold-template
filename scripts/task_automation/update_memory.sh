#!/bin/bash
# scripts/task_automation/update_memory.sh
# Extract patterns and lessons from completion notes and append to shadow_memory.md

set -e

TASK=$1

if [ -z "$TASK" ]; then
  echo "❌ Usage: $0 <TASK_NUMBER>"
  echo "   Example: $0 78"
  exit 1
fi

# Find completed task file
TASK_FILE=$(find tasks -name "${TASK}-completed-*.md" | head -1)

if [ -z "$TASK_FILE" ]; then
  echo "❌ Task $TASK not found or not completed"
  echo "   Looking for: tasks/${TASK}-completed-*.md"
  exit 1
fi

# Check if shadow_memory.md exists
if [ ! -f ".ai/shadow_memory.md" ]; then
  echo "❌ Shadow memory file not found: .ai/shadow_memory.md"
  exit 1
fi

# Extract completion notes section (stop at next ## section)
COMPLETION_NOTES=$(sed -n '/## Completion Notes/,/^## [^C]/p' "$TASK_FILE" | sed '/^## [^C]/d' || true)

if [ -z "$COMPLETION_NOTES" ]; then
  echo "⚠️  No completion notes found in Task $TASK"
  echo "   Add completion notes to the task file first"
  exit 1
fi

# Extract only bullet points (lines starting with "  - ") from Patterns and Lessons sections
# Skip headers, code blocks, and other content
PATTERNS=$(echo "$COMPLETION_NOTES" | sed -n '/- \*\*Patterns identified:\*\*/,/- \*\*Lessons learned:\*\*/p' | \
  sed '/- \*\*Patterns identified:\*\*/d' | \
  sed '/- \*\*Lessons learned:\*\*/d' | \
  grep '^  - ' | \
  sed 's/^  - //' | \
  sed '/^$/d' || true)

LESSONS=$(echo "$COMPLETION_NOTES" | sed -n '/- \*\*Lessons learned:\*\*/,/- \*\*Would do differently:\*\*/p' | \
  sed '/- \*\*Lessons learned:\*\*/d' | \
  sed '/- \*\*Would do differently:\*\*/d' | \
  grep '^  - ' | \
  sed 's/^  - //' | \
  sed '/^$/d' || true)

# Check if task already exists in shadow_memory.md (prevent duplicates)
if grep -q "Task $TASK:" .ai/shadow_memory.md; then
  echo "⚠️  Task $TASK already exists in shadow_memory.md"
  echo "   Remove existing entry first if you want to update it"
  exit 1
fi

# Append to shadow_memory.md in the format used by other tasks
if [ -n "$PATTERNS" ] || [ -n "$LESSONS" ]; then
  # Combine patterns and lessons into concise format (single line, like Task 100)
  COMBINED=""

  if [ -n "$PATTERNS" ]; then
    # Take first pattern (most important), clean it up
    FIRST_PATTERN=$(echo "$PATTERNS" | head -1 | sed 's/[.!;]*$//')
    COMBINED="${FIRST_PATTERN}"
  fi

  if [ -n "$LESSONS" ]; then
    # Take first lesson, clean it up
    FIRST_LESSON=$(echo "$LESSONS" | head -1 | sed 's/[.!;]*$//')
    if [ -n "$COMBINED" ]; then
      # Combine with period and space
      COMBINED="${COMBINED}. ${FIRST_LESSON}"
    else
      COMBINED="${FIRST_LESSON}"
    fi
  fi

  # Add period at the end if not present
  COMBINED=$(echo "$COMBINED" | sed 's/[.!;]*$//' | sed 's/$/./')

  # Append in the same format as other tasks (single line, concise)
  echo "- **Task $TASK:** $COMBINED" >> .ai/shadow_memory.md

  echo "✅ Shadow memory updated from Task $TASK"
else
  echo "⚠️  No patterns or lessons found in completion notes"
  echo "   Add patterns and lessons to the completion notes section"
fi
