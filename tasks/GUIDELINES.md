# Task Implementation Guidelines

Quick reference for task workflows. **See `docs/CHECKLISTS.md` for comprehensive P0/P1 checklists.**

---

## Task Automation Commands (AI Agents)

**Quick reference for task management automation:**

| Command | Description |
|---------|-------------|
| `make task-start N={ID}` | Start task: rename pending → in-progress, update BACKLOG |
| `make task-update-checklist N={ID}` | Mark all checkboxes as complete (before task completion) |
| `make task-complete N={ID}` | Complete task: rename in-progress → completed, add completion template |
| `make task-status N={ID}` | Show task status, file location, and blocker status |
| `make check-task-blockers N={ID}` | Verify blocker tasks are completed (exit 0 if ready, 1 if blocked) |
| `make update-shadow-memory task={N}` | Extract patterns/lessons from completion notes to shadow memory |
| `make principal-review task={N}` | Automated principal review for P0/P1 tasks (auto-approve/review/block) |

**Usage:**
- Always use `make task-start N={N}` at the beginning, `make task-complete N={N}` at the end
- Never manually rename task files
- **After completing task:** Run `make update-shadow-memory task={N}` if completion notes contain patterns or lessons learned

---

## Workflow

1. Read task file FIRST (all details in task file)
2. **Automated:** Run `make task-start N={N}` (renames file, updates BACKLOG)
3. Create branch: `feature/task-{NUMBER}-{short-name}`
4. **Optional:** Run `make check-task-blockers N={N}` to verify dependencies
5. Work in chunks (1 chunk = 1 logical unit, 2-5 items)
6. **Chunk discipline:** Code → Commit → Push → Wait for confirmation
7. Test locally when applicable
8. Complete integration (see below)
9. Fill in completion notes (what worked, patterns, lessons)
10. **Optional:** Run `make task-update-checklist N={N}` to mark all checkboxes complete (saves time, reduces errors)
11. **Automated:** Run `make task-complete N={N}` (renames file, updates BACKLOG, adds completion template)
12. **Optional:** Run `make update-shadow-memory task={N}` to update shadow memory
13. Create PR

**Commit format:** `{type}: {description} (Task {NUMBER})`  
**Types:** `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `integrate`

---

## Chunk Discipline

**Rule:** 1 chunk = 1 commit + 1 push

- Code → Commit → Push → Wait
- Never batch multiple chunks
- Exception: Tiny fixes can be single chunk

**Ask human to run:**
- pytest commands
- Backtesting scripts
- Scripts needing data/API access
- Performance-intensive operations

---

## Git Workflow (Token-Optimized)

```bash
# 1. Prepare code (MANDATORY)
make pre-commit   # Verify all checks pass

# 2. Stage changes
git add -A 2>&1 | grep -i error || echo "✅ Staged"
git status --short

# 3a. Commit docs/tasks (skip pre-commit hooks)
git commit -m "docs: description (Task N)" --no-verify 2>&1 | \
  grep -E "(error|fatal|files changed)" || echo "✅ Committed"

# 3b. Commit code (run hooks, filter output)
git commit -m "feat: description (Task N)" 2>&1 | \
  grep -E "(Failed|error|fatal|files changed)" || echo "✅ Committed"

# 4. Push
git push 2>&1 | tail -5
```

**Use --no-verify when:** Docs-only changes, no code modifications, already ran `make pre-commit`

---

## Pull Request Creation

**After task completion:** AI provides PR title + description (~500 tokens), user creates PR manually.

**PR Template:** Summary, Changes (by category), Impact, Verification

**Checklist:** User approves → AI provides text → User creates PR

---

## Test-Driven Development (TDD)

**Mandatory Workflow for Bug Fixes and New Features:**

### TDD Workflow: RED → GREEN → REFACTOR

1. **RED Phase (Write Tests First)**
   - Write tests that define expected behavior
   - Tests will fail (this is expected - bugs exist or feature doesn't exist)
   - Tests document the bug/requirement clearly
   - Create a separate task for writing tests if needed

2. **GREEN Phase (Make Tests Pass)**
   - Implement code to make tests pass
   - Focus on making tests green, not perfect code
   - Verify all tests pass

3. **REFACTOR Phase (Improve Code)**
   - Improve code quality while keeping tests green
   - Add edge case tests if needed
   - Ensure no regressions

### Task Dependency Pattern

**For bug fixes or feature work:**
- **Task A (P1):** Write tests FIRST (RED phase) - Tests fail as expected
- **Task B (P0/P1):** Implement fix/feature (GREEN phase) - Makes tests pass
- Clear dependency: Task B depends on Task A

**Benefits:**
- Tests define expected behavior before implementation
- Tests document bugs/requirements clearly
- Tests prevent regressions
- Clear execution order prevents working on wrong things first

### Test Quality Principles

**Write tests to catch bugs, not just pass:**
- ✅ Test edge cases (zero, negative, extreme values)
- ✅ Test error conditions (missing data, invalid input)
- ✅ Test side effects (state changes, file writes)
- ✅ Test boundary conditions
- ❌ Don't accept buggy behavior in tests
- ❌ Don't only check return values (verify side effects)

### Test Coverage Requirements

- **Critical path** (core logic, state, safety): >= 90% coverage
- **Other code:** >= 50% coverage
- **Integration tests:** Required for workflows
- **Unit tests:** Required for individual functions

### Atomic File Operations

**When writing files (JSON, config, data):**
- Use atomic writes: Write to temp file → validate → rename
- Prevents incomplete files from interrupted writes (Ctrl+C, exceptions, process kills)
- Add cleanup method to remove incomplete files on startup

**Example Pattern:**
```python
# Write to temp file first
temp_filepath = filepath + ".tmp"
with open(temp_filepath, "w") as f:
    json.dump(data, f)

# Validate before finalizing
with open(temp_filepath, "r") as f:
    json.load(f)  # Validate

# Atomic rename
os.rename(temp_filepath, filepath)
```

---

## Task Blocking Dependencies

**If task status is `blocked`:**

- Check `Blocked by` field for blocker task ID
- DO NOT start blocked task
- Verify blocker task status is `completed` before starting
- Re-evaluate need after blocker completes (may be unnecessary)

**Before starting ANY task:**
1. Check task file for `blocked` status
2. If blocked, verify blocker completion
3. If blocker not complete, choose different task

**Automation:** Use `make check-task-blockers N={ID}` to verify dependencies

---

## Principal Review (P0/P1 Tasks Only)

**Purpose:** Token-efficient review process for critical changes. Provides 200-token guidance instead of reading entire codebase.

**When to request review:** Architecture changes, core functionality modifications, breaking changes, or any change that could cause production issues.

**5-Question Checklist (Answer Y/N):**

1. **Architecture alignment?** Does this follow your project's architecture patterns? No layer violations?
2. **Risk impact?** Could this cause production issues? (data loss, security, performance, breaking changes)
3. **Testing coverage?** Critical path covered >= 90%? All new code paths tested?
4. **Decisions documented?** Major architectural choices in DECISIONS.md? (see Rule 1 in enforcement_rules.md)
5. **Integration complete?** Makefile, README, CHANGELOG, documentation updated if needed?

**Auto-approve if ALL true:**
- Documentation-only changes (no code)
- Test additions (no production code changes)
- Coverage >= 90% for any code changes
- No architecture or core functionality modifications
- No breaking changes

**Review required if ANY true:**
- Core architecture changes (e.g., major refactoring, new patterns)
- Core functionality modifications (e.g., critical business logic changes)
- Breaking API changes (public interfaces, data formats)
- Security-sensitive changes (authentication, authorization, data handling)
- Performance-critical changes (database queries, algorithms, caching)

**Block if ANY true:**
- Missing tests on critical path (< 90% coverage for core code)
- No DECISIONS.md entry for major architectural decision (violates Rule 1)
- Production risk without safety validation (untested critical paths)
- Layer violations (e.g., circular dependencies, wrong abstraction levels)
- Pre-commit hooks failing (Rule 2 violation)

**Automated Review:** Run `make principal-review task={N}` to automatically:
- Analyze changed files (git diff vs main)
- Categorize changes (architecture/core/security/docs)
- Apply criteria and output decision (Auto-approve/Review required/Block)
- Display 5-question checklist if review required

**Manual Review (if automation unavailable):**
1. Read task file and `git diff` for changed files
2. Answer 5 questions (Y/N) from checklist above
3. Check approval/review/block criteria
4. If review required: Provide 1-sentence reasoning + 1-2 specific suggestions (<200 tokens)
5. If block: List specific blocking items (missing tests, layer violations, etc.)

---

## Integration Checklist (MANDATORY)

**Before marking task complete:**
- [ ] **Makefile:** New script? → Add `make {name}` command
- [ ] **README.md:** User-facing changes? → Update relevant section
- [ ] **CHANGELOG.md:** Notable changes? → Add entry
- [ ] **Institutional Memory:** DECISIONS.md, LESSONS_LEARNED.md, shadow_memory.md

---


## ⚠️ CRITICAL: Enforcement Rules

> [!CAUTION]
> **Before ANY work:** Read [`.ai/enforcement_rules.md`](../.ai/enforcement_rules.md) - 5 rules NO AI may bypass

**Quick check:**
- ✅ Task files complete (not shortcuts)?
- ✅ DECISIONS.md / LESSONS_LEARNED.md / shadow_memory.md updated?
- ✅ Pre-commit checks passed?
- ✅ CHANGELOG/README updated if needed?

---

## Essential Post-Implementation

Quick checklist for all tasks:

- [ ] **Code quality:** Run `make pre-commit` to verify all checks pass
- [ ] **Tests:** Run your project's test suite if code changes
- [ ] **Makefile:** Add command if new script created
- [ ] **README:** Update if user-facing changes
- [ ] **CHANGELOG:** Add entry for notable changes
- [ ] **Institutional Memory:** Update DECISIONS.md, LESSONS_LEARNED.md, shadow_memory.md
- [ ] **BACKLOG:** Task will be moved to completed automatically via `make task-complete`
- [ ] **Commit:** Use format `{type}: {description} (Task {N})`

**Architecture rules:** See `docs/policies/AI_AGENTS.md`

---

## Task Completion

- [ ] Rename to `{N}-completed-{name}.md`
- [ ] **Mark all items as `[x]` in task file**
- [ ] Update BACKLOG.md
- [ ] Add completion notes to task file
- [ ] Create PR referencing task number
- [ ] All integration points checked

---

## Reference

- **Architecture rules:** `docs/policies/AI_AGENTS.md` ⭐ (Universal for all AI agents)
- **Task template:** `tasks/TEMPLATE.md`
- **Task backlog:** `tasks/BACKLOG.md`
- **Session start guide:** `docs/policies/AI_SESSION_START.md`
- **Decisions:** `docs/DECISIONS.md`
- **Lessons learned:** `docs/LESSONS_LEARNED.md`
