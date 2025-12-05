# Enforcement Rules for AI Agents

**Purpose:** Critical rules enforced by automation - NO AI agent may bypass

**Last Updated:** 2025-12-05

> [!CAUTION]
> **AI Agents:** Read this file when starting work and before completing tasks. Rules are enforced by automation - cannot be skipped.

---

## Rule 1: Pre-Work Automation (ENFORCED)

**Automated by:** `make task-start N={N}`

**What it does:**
- Pulls latest from main
- Creates/checks out branch
- Renames task file (pending → in-progress)
- Updates status field automatically
- Updates BACKLOG.md

**AI Agent:** Run `make task-start N={N}` before ANY code changes. Cannot skip (automation prevents it).

**Why:** AI agents skip pre-work to "save time". Automation prevents skipping.

**Verification:** `make verify-prework N={N}` (pre-flight check)

---

## Rule 2: Pre-Commit Hooks (ENFORCED)

**Automated by:** Pre-commit hooks (`.pre-commit-hooks/check-ai-workflow.sh`)

**What it checks:**
- Task file status matches branch
- BACKLOG.md consistency
- Documentation bloat (AI_AGENTS.md <220 lines)
- File size limits (>800 lines = BLOCKING)
- Docs-only commit detection

**AI Agent:** Hooks run automatically. If they fail, fix issues - don't bypass.

**Exception:** Docs-only commits (markdown files only) can use `--no-verify`

**Why:** Pre-commit hooks catch bugs, enforce architecture, verify tests. Bypassing defeats safety system.

**Verification:** `make pre-commit` (run before commit)

---

## Rule 3: Code Review Patterns (AUTOMATED)

**Automated by:** `make check-code-patterns [FILES]`

**What it checks:**
- Patterns from past incidents (documented in shadow_memory.md)
- Direct file/database writes bypassing abstraction layers
- Unmocked API calls in tests
- Missing safety checks

**AI Agent:** Run before committing code changes.

**Why:** These patterns caused real bugs or architecture violations. Checking prevents regression.

**Verification:** `make check-code-patterns` (checks staged files)

---

## Rule 4: Institutional Memory (AUTOMATED)

**Automated by:** `make check-institutional-memory N={N}` (runs automatically in `make task-complete`)

**What it checks:**
- Task file has completion notes
- DECISIONS.md updated (if architectural changes)
- LESSONS_LEARNED.md updated (if task completed)
- shadow_memory.md updated (if new patterns)

**AI Agent:** Runs automatically when completing task. Fix warnings before marking complete.

**Why:** Each shortcut = knowledge loss. Shadow AI system ONLY works if every task builds institutional memory.

**Verification:** `make check-institutional-memory N={N}`

---

## Rule 5: Documentation Updates (AUTOMATED)

**Automated by:** `make check-docs-updates [FILES]`

**What it checks:**
- CHANGELOG.md updated (if user-facing changes)
- README.md updated (if new commands/features)

**AI Agent:** Run before committing user-facing changes.

**Why:** Principal-level AI updates docs WITHOUT being asked.

**Verification:** `make check-docs-updates` (checks staged files)

---

## Rule 6: File Size Limits (AUTOMATED)

**Automated by:** Pre-commit hook + `make check-file-sizes [FILES]`

**What it checks:**
- Files >800 lines = BLOCKING (must refactor)
- Files >400 lines = WARNING (consider refactoring)

**Why:** AI agents have tool call limits. Large files require multiple calls:
- <400 lines = 1 tool call (fast)
- 400-800 lines = 2-3 tool calls (moderate)
- >800 lines = 6+ tool calls (3-5x slower)

**AI Agent:** Pre-commit hook warns automatically. Check before architecture work.

**Verification:** `make check-file-sizes` (checks staged Python files)

---

## Rule 7: Git Workflow (ENFORCED)

**Automated by:** Pre-commit hooks

**What it enforces:**
- Feature branch required (cannot commit to main)
- Task file must be in-progress (not pending)
- Branch name must match task pattern

**AI Agent:** Hooks enforce automatically. Cannot bypass.

**Why:** Parallel tasks, safety, reviewability, no lost work.

---

## Rule 8: Task Detail Quality (MANUAL)

**REQUIRED:**
- Detailed implementation chunks
- Testing strategy with commands
- Specific acceptance criteria
- Follow TEMPLATE.md structure

**Why:** Quality requires human/AI judgment, not automation.

**Remember:** Incomplete tasks = next AI can't execute them.

---

## Quick Reference

**Before starting work:**
```bash
make task-start N={N}              # Automated pre-work (Rule 1)
make verify-prework N={N}          # Verify pre-work
```

**Before committing code:**
```bash
make fix                           # Auto-fix linting
make check-code-patterns           # Check past incident patterns (Rule 3)
make check-file-sizes              # Check file sizes (Rule 6)
make check-docs-updates            # Check if docs need updates (Rule 5)
make check-git-workflow            # Check commit format, branch naming
make pre-commit                    # Run all hooks (Rule 2 - includes git workflow check)
```

**Before completing task:**
```bash
make task-update-checklist N={N}      # Mark all checkboxes complete (optional, saves time)
make check-institutional-memory N={N}  # Verify memory updates (Rule 4)
make check-integration N={N}            # Verify integration checklist
make verify-completion N={N}              # Verify completion checklist
```

**Before creating PR:**
```bash
make check-pr-readiness N={N}     # Verify PR requirements
```

**Note:** Rule 4 (institutional memory) runs automatically in `make task-complete`.

---

## Integration with AI Workflow

**Automated checks run:**
- Pre-commit hook: Rules 2, 6, 7, git workflow (automatic on every commit)
- `make task-complete`: Rule 4, integration checklist, PR readiness (automatic when completing task)
- Manual checks: Rules 3, 5 (run before committing code)

**Key Principle:** Automation = Can't Skip. Manual rules = Easy to skip.

**Last Updated:** 2025-12-05 (Automated enforcement system)
