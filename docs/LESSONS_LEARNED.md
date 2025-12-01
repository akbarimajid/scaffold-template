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

**How to add lessons:**
- After completing tasks with significant learnings
- When identifying patterns or anti-patterns
- When something works particularly well or poorly
- Use `make update-shadow-memory task={N}` to automatically extract from completion notes

