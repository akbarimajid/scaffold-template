# Task Implementation Guidelines

Quick reference for task workflows. **See `docs/CHECKLISTS.md` for comprehensive P0/P1 checklists.**

---

## Workflow

1. Read task file FIRST (all details in task file)
2. Rename to `{N}-in-progress-{name}.md`
3. Update `BACKLOG.md`
4. Create branch: `feature/task-{NUMBER}-{short-name}`
5. Work in chunks (1 chunk = 1 logical unit, 2-5 items)
6. **Chunk discipline:** Code → Commit → Push → Wait for confirmation
7. Test locally when applicable
8. Complete integration (see below)
9. Rename to `{N}-completed-{name}.md`
10. Update `BACKLOG.md`
11. Create PR

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
make fix          # Auto-fix linting/formatting
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

**Future automation:** Pre-commit hook or `make check-task-blockers N={ID}`

---

## Integration Checklist (MANDATORY)

**Before marking task complete:**
- [ ] **Makefile:** New script? → Add `make {name}` command
- [ ] **README.md:** User-facing changes? → Update relevant section
- [ ] **CHANGELOG.md:** Notable changes? → Add entry
- [ ] **GitHub Workflows:** New validation/env var? → Update workflows
- [ ] **Daily Scripts:** Affects workflow? → Update `TRADING/daily_routine.sh`
- [ ] **Documentation:** HOW_IT_WORKS.md, CLAUDE.md, FRAMEWORK.md if applicable
- [ ] **Institutional Memory:** DECISIONS.md, LESSONS_LEARNED.md, shadow_memory.md

---

## Issue Management

**Create issues for:** Bugs, unexpected behavior, critical problems, reproducible failures  
**Don't create issues for:** Feature requests, minor improvements, docs (create tasks directly)

**Process:**
1. Copy template: `cp issues/ISSUE_TEMPLATE.md issues/NNN-short-name.md`
2. Fill sections (summary, impact, description, steps, evidence, solution)
3. Add to `issues/ISSUES.md` index
4. Create task if needed (cross-reference)
5. Commit: `git commit -m "docs: add Issue #NNN" --no-verify`

**Resolving:** Update issue status, move to "Resolved" in index, update related task

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

- [ ] **Code quality:** Run `make pre-commit` (black, flake8)
- [ ] **Tests:** Run `uv run pytest` if code changes
- [ ] **Architecture:** Run `make check-architecture` if touching core/
- [ ] **Coverage:** Run `make test-cov-critical` if critical path (90% required)
- [ ] **Makefile:** Add command if new script created
- [ ] **README:** Update if user-facing changes
- [ ] **CHANGELOG:** Add entry for notable changes
- [ ] **Token limits:** CLAUDE.md <600, README.md <400
- [ ] **BACKLOG:** Move task to completed
- [ ] **Commit:** Use format `{type}: {description} (Task {N})`

**Architecture rules:** See `docs/policies/AI_AGENTS.md`  
**For comprehensive checklist (P0/P1 only):** `docs/CHECKLINES.md`

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
- **Detailed checklists:** `docs/CHECKLISTS.md`
- **Task template:** `tasks/TEMPLATE.md`
- **Task backlog:** `tasks/BACKLOG.md`
- **Project guide:** `CLAUDE.md`
- **Framework:** `FRAMEWORK.md`
- **Architecture:** `docs/policies/ARCHITECTURE.md`

---

**Total: ~200 lines** (down from 466, 57% reduction)
