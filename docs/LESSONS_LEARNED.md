# Lessons Learned

**Purpose:** Capture insights, patterns, and learnings from completed tasks.

**Format:** Organized by task or theme, with actionable insights.

---

## Template Entry

```markdown
## Task {N}: {Task Name}

**Date:** YYYY-MM-DD  
**What Worked:**
- Insight 1
- Insight 2

**What Didn't Work:**
- Issue 1
- Issue 2

**Key Learnings:**
- Learning 1
- Learning 2

**Would Do Differently:**
- Change 1
- Change 2
```

---

## Example Entry

## Task 1: Authentication System

**Date:** 2025-11-30  
**What Worked:**
- Incremental development (schema → registration → login) made testing easier
- Using bcrypt library prevented security issues
- Test-driven approach caught bugs early

**What Didn't Work:**
- Forgot to add rate limiting initially (security gap)
- Email verification was an afterthought (should have been in initial design)

**Key Learnings:**
- Always hash passwords, even in development
- Security features should be planned from the start, not added later
- Integration tests catch issues that unit tests miss

**Would Do Differently:**
- Include rate limiting in initial design
- Add email verification step in registration flow
- Implement refresh token pattern for better UX

---

## Example: Test-Driven Development Workflow

**Date:** YYYY-MM-DD  
**Context:** Establishing TDD workflow for bug fixes and new features

### What Worked ✅

- **TDD Workflow Pattern** - RED (tests first) → GREEN (implementation) → REFACTOR
  - Write tests FIRST before implementation
  - Tests define expected behavior clearly
  - Tests document bugs/requirements
  - Clear task dependencies prevent working on wrong things first

- **Task Splitting Strategy** - Split large tasks into focused tasks with clear dependencies
  - Task A (P1): Write tests FIRST (RED phase)
  - Task B (P0/P1): Implement fix/feature (GREEN phase)
  - Clear execution order prevents confusion

- **Test Quality Over Coverage** - Write tests to catch bugs, not just pass
  - Test edge cases (zero, negative, extreme values)
  - Test error conditions (missing data, invalid input)
  - Test side effects (state changes, file writes)
  - Test boundary conditions

- **Atomic File Operations** - Prevent incomplete files from interrupted writes
  - Write to temp file → validate → rename
  - Prevents incomplete files from Ctrl+C, exceptions, process kills
  - Add cleanup method to remove incomplete files on startup

### What Didn't Work ❌

- **Ad-hoc Work Without Task Structure** - Quick fixes done without proper task workflow
  - Should create task first, then implement
  - Even "quick fixes" benefit from task structure

- **Missing Root Cause Fixes** - Initially just removed symptoms
  - Should investigate root cause
  - Fix root cause, not just symptoms

### Key Learnings

- **TDD is Mandatory** - Tests must be written FIRST before implementation
  - Tests define expected behavior
  - Tests document bugs clearly
  - Tests prevent regressions
  - Clear execution order (tests → implementation)

- **Test Quality > Test Coverage** - Tests that catch bugs are more valuable than high coverage
  - Write tests to catch bugs, not just pass
  - Test edge cases and error conditions
  - Verify side effects, not just return values

- **Atomic Operations** - File writes should be atomic to prevent incomplete files
  - Write to temp file first
  - Validate before finalizing
  - Atomic rename ensures file is always valid

- **Task Dependency Chain** - Clear dependencies prevent working on wrong things first
  - Tests written first (Task A)
  - Implementation makes tests pass (Task B depends on A)
  - Clear execution order

### Patterns Identified 📊

1. **TDD Workflow Pattern:** RED (tests first) → GREEN (implementation) → REFACTOR
2. **Task Dependency Pattern:** Test task (P1) → Implementation task (P0/P1)
3. **Atomic Write Pattern:** Temp file → Validate → Rename

### Would Do Differently Next Time 🔄

- **Start with Task Structure** - Even for "quick fixes", create task first, then implement
- **Write Tests First** - Always write tests before implementation (TDD)
- **Fix Root Causes** - Investigate and fix root causes, not just symptoms

---

---

## Key Patterns from Production Use

### Pattern 1: Automation-First Enforcement

**What Works:**
- Automated tools can't be skipped (unlike manual checklists)
- `make task-start N={N}` automates pre-work (5 steps → 1 command)
- `make task-complete N={N}` automates completion (4 steps → 1 command)
- Validation scripts run automatically in `make task-complete` and pre-commit hooks

**Key Insight:** Automation = Can't Skip. Manual rules = Easy to skip.

**Evidence:**
- 80% token reduction in workflow automation (285 vs 1030 tokens)
- 65% reduction per task start (632 → 220 lines)
- Validation catches issues automatically (can't be bypassed)

**Implementation:**
- Use `make task-start N={N}` before ANY code changes
- Use `make task-complete N={N}` when finishing tasks
- Validation tools run automatically (no manual steps)

---

### Pattern 2: Token Optimization Compounds

**What Works:**
- Small token reductions add up across many AI sessions
- Function registry: 50 tokens vs 200-500 for semantic search (80-90% reduction)
- Quick context files: 200 tokens vs 1000+ for full docs (80% reduction)
- Hierarchical docs: Extract guides, keep index minimal (on-demand loading)

**Key Insight:** Every optimization accumulates. Prioritize token efficiency.

**Evidence:**
- Git operations: 95% reduction (1450 → 75 tokens)
- Documentation: 31-45% reduction
- Task automation: 72% reduction (285 vs 1030 tokens)

**Implementation:**
- Use function registry for function discovery
- Read quick context files first, full docs on-demand
- Keep main docs as indexes, extract detailed guides

---

### Pattern 3: Hierarchical Documentation

**What Works:**
- Extract detailed guides to separate files
- Keep main docs as minimal indexes (~100 lines)
- Reference guides from multiple places (DRY principle)
- Load guides on-demand (not upfront)

**Key Insight:** Index files are fast to read, detailed guides are loaded when needed.

**Evidence:**
- GUIDELINES.md: 632 → 220 lines (65% reduction)
- Guides in `tasks/guides/` directory (git-workflow.md, integration.md, pull-requests.md)
- Better discoverability (separate files easier to find)

**Implementation:**
- Keep main docs under 220 lines
- Extract detailed guides to separate files
- Reference guides from multiple places (don't duplicate)

---

### Pattern 4: Task Checklist Automation

**What Works:**
- `make task-update-checklist N={N}` marks all checkboxes complete
- Saves time and reduces errors
- Optional but recommended before task completion

**Key Insight:** Automation reduces manual work and prevents incomplete checkboxes.

**Evidence:**
- ~2 minutes saved per task
- Prevents incomplete checkboxes in completed tasks
- Reduces errors from manual checkbox updates

**Implementation:**
- Run `make task-update-checklist N={N}` before `make task-complete`
- Optional but recommended for consistency

---

**How to add lessons:**
- After completing tasks with significant learnings
- When identifying patterns or anti-patterns
- When something works particularly well or poorly
- Use `make update-shadow-memory task={N}` to automatically extract from completion notes

