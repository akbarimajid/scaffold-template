# Enforcement Rules for AI Agents

**Purpose:** Critical rules that NO AI agent may bypass under any circumstances.

**Last Updated:** 2025-11-22

---

## Rule 1: Never Compromise Institutional Memory

**FORBIDDEN:**

- ❌ Creating "short task summaries" or incomplete task files
- ❌ Skipping DECISIONS.md updates for major architectural choices
- ❌ Skipping LESSONS_LEARNED.md updates after task completion  
- ❌ Not updating shadow_memory.md when new patterns emerge

**REQUIRED:**

- ✅ ALL task files MUST follow TEMPLATE.md completely
- ✅ ALL major decisions MUST be documented in `docs/DECISIONS.md`
- ✅ ALL completed tasks MUST update `docs/LESSONS_LEARNED.md`
- ✅ ALL new patterns MUST update `.ai/shadow_memory.md`

**Why:** Each shortcut = knowledge loss. Shadow AI system ONLY works if every task builds institutional memory.

---

## Rule 2: Never Bypass Pre-Commit Checks

**FORBIDDEN:**

- ❌ Using `git commit --no-verify` to skip pre-commit hooks (except docs-only)
- ❌ Ignoring linting/formatting failures
- ❌ Committing code with known test failures

**REQUIRED:**

- ✅ ALWAYS run `make pre-commit` before committing
- ✅ FIX all linting/formatting issues before commit
- ✅ ENSURE tests pass before commit
- ✅ Commit with meaningful messages: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`  
- ✅ Reference task: `(Task {N} - Chunk {M})`

**Exception:** Docs-only commits can use `--no-verify` IF stated in commit message
**Exception:** WIP commits allowed on feature branches (squash before PR)

---

## Rule 3: Never Take Shortcuts on Task Detail

**FORBIDDEN:**

- ❌ "I'll create short summaries to ship faster"
- ❌ Incomplete implementation chunks
- ❌ Missing testing strategy
- ❌ No acceptance criteria

**REQUIRED:**

- ✅ Implementation MUST have detailed chunks with specific steps
- ✅ Testing MUST include commands and expected outcomes
- ✅ Acceptance criteria MUST be specific and measurable
- ✅ Follow TEMPLATE.md structure completely

**Remember:** Incomplete tasks = next AI can't execute them

---

## Rule 4: Never Skip CHANGELOG/README Updates

**REQUIRED:**

- ✅ PROACTIVELY update CHANGELOG.md after major changes (don't wait)
- ✅ PROACTIVELY update README.md for user-facing changes
- ✅ Update as you go, not at the end

**Why:** Principal-level AI updates docs WITHOUT being asked

---

## Rule 5: Shadow AI Principles Checklist

**PRE-WORK (DO FIRST, BEFORE ANY CODE):**

1. ✅ Pull latest: `git checkout main && git pull`
2. ✅ Create branch: `git checkout -b feature/task-N-name`
3. ✅ Read GUIDELINES.md (understand chunk workflow)
4. ✅ Rename task: `N-in-progress-name.md`
5. ✅ Update BACKLOG.md (mark in-progress)

**Issue #002 lesson:** AI agent skipped pre-work to "save time" - this violated process and required user correction. Pre-work is NOT optional.

---

**TRIGGER:** Before marking ANY task as complete OR creating PR

**MANDATORY:** Before completing ANY task, STOP and verify:

1. ✅ Task file: All chunks complete + final integration chunk checked?
2. ✅ DECISIONS.md: Major choices documented?
3. ✅ LESSONS_LEARNED.md: Learnings from this task added?
4. ✅ shadow_memory.md: New patterns identified?
5. ✅ CHANGELOG/README: Updated if user-facing changes?
6. ✅ Pre-commit checks: All passed?

**If ANY answer is NO → STOP. Complete it NOW. Don't wait for user reminder.**

**AI agents:** Treat this as a BLOCKING requirement, not a suggestion. The task is NOT complete until all 6 items are verified.

**How to verify:** Run `make validate-task` before marking task complete.

---

## Rule 6: Git Workflow is MANDATORY

**FORBIDDEN:**

- ❌ Working directly on main branch
- ❌ No feature branch created
- ❌ Implementing entire task without commits per chunk
- ❌ Not pushing after each chunk

**REQUIRED:**

- ✅ ALWAYS create feature branch BEFORE any code changes
- ✅ Branch naming: `feature/task-{N}-{short-description}`
- ✅ Commit after EACH chunk (not at the end)
- ✅ Push after each commit
- ✅ WAIT for user confirmation between chunks

**Why:** Parallel tasks, safety, reviewability, no lost work

**Enforcement:** Task files now have MANDATORY pre-work checklist

---

## Rule 7: File Size Limits for AI Agent Productivity

**FORBIDDEN:**

- ❌ Creating files >800 lines (BLOCKING for architecture work)
- ❌ Ignoring file size warnings from pre-commit hooks  
- ❌ Adding code to already-large files (>400 lines) without refactoring

**REQUIRED:**

- ✅ Files SHOULD be <400 lines (AI-friendly, 1 tool call to understand)
- ✅ Files >400 lines = consider refactoring (AI agents need 2-3 tool calls)
- ✅ Files >800 lines = MUST refactor before architecture work (AI agents need 6+ tool calls, 3-5x slower)
- ✅ Classes with >10 methods = refactoring candidate

**Why:** AI agents have tool call limits. Large files require multiple calls to understand:

- <400 lines = 1 tool call to understand (fast)
- 400-800 lines = 2-3 tool calls (moderate)
- 1,500+ lines = 6+ tool calls (3-5x slower)

**Real example:** `TRADING/morning_routine.py` (1,575 lines) required 6 tool calls just to understand structure, slowing down architecture review significantly.

**Enforcement:**

- Pre-commit hook warns on files >400 lines
- Task 90: Refactor morning_routine.py (1,575 lines → 8-10 modules @ 200-300 lines each)

**Exceptions:** Configuration files, auto-generated code (document why)

---

## Rule 8: Quick Context Files Must Stay Current

**FORBIDDEN:**

- ❌ Completing tasks without updating relevant quick_context files
- ❌ Adding new architecture patterns without documenting in patterns/
- ❌ Major state changes without updating current_state.md

**REQUIRED:**

- ✅ After architecture tasks (65-67): Update `.ai/quick_context/architecture_basics.md`
- ✅ After testing changes: Update `.ai/quick_context/testing_strategy.md`
- ✅ After incidents/gotchas: Add to `.ai/quick_context/common_gotchas.md`
- ✅ Weekly or after milestones: Update `.ai/quick_context/current_state.md`

**Why:** Quick context files enable 76-95% token reduction. Stale files = misleads AI agents.

**Maintenance triggers:**

- Architecture tasks complete → Update architecture_basics.md
- New incident documented → Add to common_gotchas.md
- Weekly review → Update current_state.md
- Major milestone → Update all 4 files

**Enforcement:** Task completion checklist includes "Update relevant quick_context files"

**See:** `.ai/quick_context/README.md` for file descriptions and update frequency

---

## Rule 9: Always Verify Pre-commit Hooks Pass

**FORBIDDEN:**

- ❌ Running `git push` without checking commit exit status
- ❌ Ignoring pre-commit hook failures (exit code 1)
- ❌ Bypassing hooks with `--no-verify` (except docs-only commits)

**REQUIRED:**

- ✅ Run `make fix` before committing (auto-fixes linting, formatting)
- ✅ Check commit command exit status before pushing
- ✅ If hooks fail (exit 1), re-stage auto-fixed files and amend commit
- ✅ Read hook output for warnings (version tags, missing make commands)

**Why:** Pre-commit hooks auto-fix files but don't stage them. Pushing without verification = incomplete commits or broken code.

**Correct Workflow:**

```bash
# Step 1: Fix auto-fixable issues
make fix

# Step 2: Stage and commit
git add -A
git commit -m "feat: description"

# Step 3: Check command status
# If exit code != 0:
git add -A                      # Re-stage auto-fixes
git commit --amend --no-edit    # Amend commit

# Step 4: Verify exit code 0, then push
git push origin <branch>
```

**Pre-commit hook behavior:**

- Exit 0 = Success, ready to push
- Exit 1 = Failed OR auto-fixed files (must re-stage)
- Auto-fixes are NOT automatically staged

**Tools:**

- `make fix` - Run ruff format + bandit before commit
- `make pre-commit` - Run all pre-commit hooks manually
- `make safe-commit` - Commit with automatic hook verification (Task 93)

**Enforcement:** AI agents MUST check command status before pushing

**See:** `docs/lessons_learned/precommit_hook_verification.md` for incident details

---

**Read this file:** When starting work, after completing work, or if uncertain about standards.  
**Don't read frequently:** These are reference rules, not workflow steps (use GUIDELINES.md for workflow).

**Last Updated:** 2025-11-26 (Added Rule 7: File Size Limits, Rule 8: Quick Context Maintenance, Rule 9: Git Commit Verification)
