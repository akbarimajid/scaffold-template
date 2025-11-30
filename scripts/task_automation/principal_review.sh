#!/bin/bash
# scripts/task_automation/principal_review.sh
# Automated principal review for P0/P1 tasks - applies criteria from GUIDELINES.md

set -e

TASK=$1

if [ -z "$TASK" ]; then
  echo "❌ Usage: $0 <TASK_NUMBER>"
  echo "   Example: $0 79"
  exit 1
fi

# Get changed files (compare to main branch)
if ! git rev-parse --verify main >/dev/null 2>&1; then
  echo "⚠️  Warning: main branch not found, comparing to HEAD"
  FILES=$(git diff --name-only HEAD~1 HEAD 2>/dev/null || echo "")
else
  FILES=$(git diff --name-only main...HEAD 2>/dev/null || echo "")
fi

if [ -z "$FILES" ]; then
  echo "⚠️  No changed files detected. Are you on a feature branch?"
  echo "   Run this from a branch with changes compared to main"
  exit 1
fi

# Categorize files
DOCS_ONLY=1
HAS_CODE=0
HAS_ARCHITECTURE=0
HAS_STRATEGY=0
HAS_RISK=0
HAS_STATE=0
HAS_TESTS=0
HAS_BREAKING_API=0

for FILE in $FILES; do
  # Skip markdown files for code detection
  if [[ "$FILE" == *.md ]]; then
    continue
  fi

  DOCS_ONLY=0
  HAS_CODE=1

  # Architecture changes (core/ directory)
  if [[ "$FILE" == core/* ]]; then
    HAS_ARCHITECTURE=1
  fi

  # Strategy modifications
  if [[ "$FILE" == strategies/* ]]; then
    HAS_STRATEGY=1
  fi

  # Risk management (position sizing, stops, circuit breakers)
  if [[ "$FILE" == *position* ]] || [[ "$FILE" == *stop* ]] || [[ "$FILE" == *circuit* ]] || \
     [[ "$FILE" == *risk* ]] || [[ "$FILE" == *filter* ]]; then
    HAS_RISK=1
  fi

  # State management (StateManager, TradeJournal)
  if [[ "$FILE" == *state* ]] || [[ "$FILE" == *journal* ]] || [[ "$FILE" == *database* ]] || \
     [[ "$FILE" == *sqlite* ]] || [[ "$FILE" == *db* ]]; then
    HAS_STATE=1
  fi

  # Tests
  if [[ "$FILE" == test_* ]] || [[ "$FILE" == *_test.py ]] || [[ "$FILE" == tests/* ]]; then
    HAS_TESTS=1
  fi

  # Breaking API changes (adapter interfaces, public APIs)
  if [[ "$FILE" == *adapter* ]] && [[ "$FILE" != *test* ]]; then
    HAS_BREAKING_API=1
  fi
done

# Check if docs-only (all files are .md)
if [ "$DOCS_ONLY" -eq 1 ]; then
  NON_MD_COUNT=$(echo "$FILES" | grep -v "\.md$" | grep -c . || echo "0")
  if [ "$NON_MD_COUNT" -eq 0 ]; then
    echo "✅ Auto-approve: Documentation-only changes"
    echo ""
    echo "Reasoning: All changed files are markdown (docs). No code changes to trading logic."
    exit 0
  fi
fi

# Check if tests-only (no production code)
if [ "$HAS_TESTS" -eq 1 ] && [ "$HAS_CODE" -eq 0 ]; then
  echo "✅ Auto-approve: Test additions only"
  echo ""
  echo "Reasoning: Only test files changed. No production code modifications."
  exit 0
fi

# Review required checks
REVIEW_REQUIRED=0
REVIEW_REASONS=()

if [ "$HAS_ARCHITECTURE" -eq 1 ]; then
  REVIEW_REQUIRED=1
  REVIEW_REASONS+=("Core architecture changes (core/ directory)")
fi

if [ "$HAS_STRATEGY" -eq 1 ]; then
  REVIEW_REQUIRED=1
  REVIEW_REASONS+=("Strategy modifications (strategies/ directory)")
fi

if [ "$HAS_RISK" -eq 1 ]; then
  REVIEW_REQUIRED=1
  REVIEW_REASONS+=("Risk management changes (position sizing, stops, filters)")
fi

if [ "$HAS_STATE" -eq 1 ]; then
  REVIEW_REQUIRED=1
  REVIEW_REASONS+=("State management changes (StateManager, TradeJournal, database)")
fi

if [ "$HAS_BREAKING_API" -eq 1 ]; then
  REVIEW_REQUIRED=1
  REVIEW_REASONS+=("Breaking API changes (adapter interfaces)")
fi

# Block checks (need to check task file and git diff for details)
BLOCK_REASONS=()

# Check for DECISIONS.md entry (would need to parse task file - simplified check)
TASK_FILE=$(find tasks -name "${TASK}-*.md" | head -1)
if [ -n "$TASK_FILE" ] && [ "$HAS_ARCHITECTURE" -eq 1 ]; then
  # Check if DECISIONS.md was updated (simplified - just check if file changed)
  if ! echo "$FILES" | grep -q "docs/DECISIONS.md"; then
    BLOCK_REASONS+=("Missing DECISIONS.md entry for major architectural decision (violates Rule 1)")
  fi
fi

# Check for layer violations (simplified - would need deeper analysis)
# This is a placeholder - full check would require dependency analysis

# Output decision
echo "📋 Principal Review for Task $TASK"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ ${#BLOCK_REASONS[@]} -gt 0 ]; then
  echo "❌ BLOCK: Critical issues must be resolved"
  echo ""
  for REASON in "${BLOCK_REASONS[@]}"; do
    echo "  • $REASON"
  done
  echo ""
  echo "Fix these issues before proceeding."
  exit 2
fi

if [ "$REVIEW_REQUIRED" -eq 1 ]; then
  echo "⚠️  REVIEW REQUIRED: Manual review needed"
  echo ""
  for REASON in "${REVIEW_REASONS[@]}"; do
    echo "  • $REASON"
  done
  echo ""
  echo "5-Question Checklist (answer Y/N):"
  echo "  1. Architecture alignment? (3-layer design, no violations)"
  echo "  2. Risk impact? (Could cause real money loss?)"
  echo "  3. Testing coverage? (Critical path >= 90%?)"
  echo "  4. Decisions documented? (DECISIONS.md updated?)"
  echo "  5. Integration complete? (Makefile, README, CHANGELOG updated?)"
  echo ""
  echo "See tasks/GUIDELINES.md for full criteria and examples."
  exit 1
fi

# Default: Auto-approve
echo "✅ Auto-approve: No architecture or risk changes"
echo ""
echo "Reasoning: Changes are limited to non-critical areas (scripts, tests, docs)."
exit 0
