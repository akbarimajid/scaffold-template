# Task {NUMBER}: {Short Title}

> [!CAUTION]
>
> ## ⚠️ MANDATORY PRE-WORK CHECKLIST - DO THIS FIRST
>
> **BEFORE touching ANY code, complete these steps:**
>
> 1. ✅ **Pull latest:** `git checkout main && git pull`
> 2. ✅ **Create branch:** `git checkout -b feature/task-{N}-{short-name}`
> 3. ✅ **Read GUIDELINES.md:** Understand chunk workflow
> 4. ✅ **Update task status:** Rename to `{N}-in-progress-{name}.md`
> 5. ✅ **Update BACKLOG:** Mark task as in-progress
>
> **After EACH chunk:**
>
> - Commit: `feat: {description} (Task {N} - Chunk {N})`
> - Push: `git push`
> - WAIT for user confirmation
>
> **No branch = no work. No commits = failed task.**

> [!NOTE]
> **AI Agent Context:** Before starting, read [`docs/policies/AI_AGENTS.md`](../docs/policies/AI_AGENTS.md) for architecture rules and checklists. See [`docs/policies/AI_SESSION_START.md`](../docs/policies/AI_SESSION_START.md) for efficient session bootstrapping.

**Status:** pending | in-progress | completed | blocked | cancelled
**Priority:** P0 | P1 | P2 | P3
**Mode:** Fast | Planning (Choose one - see AI_AGENTS.md)
**Created:** YYYY-MM-DD | **Started:** YYYY-MM-DD | **Completed:** YYYY-MM-DD

---

## Issue Reporting

For any bug or issue, create a new file using the **Issue Report Template**:

```
issues/ISSUE_REPORT_TEMPLATE.md
```

Populate it with the appropriate details and link it from the relevant task.

{What needs to be done and why}

## Goals

- {Objective 1}
- {Objective 2}

## Acceptance Criteria

- [ ] {Criterion 1}
- [ ] {Criterion 2}

---

## Implementation

### Chunk 1: {Name}

- [ ] Step 1
- [ ] Step 2
- [ ] Push + wait

### Chunk 2: {Name}

- [ ] Step 3
- [ ] Push + wait

**Essential checklist:** See "Essential Post-Implementation" in `tasks/GUIDELINES.md`
**P0/P1 only:** Use comprehensive checklists from `docs/CHECKLISTS.md`

**Architecture checklist** (from `docs/policies/AI_AGENTS.md`):

- [ ] Which layer? (Presentation, Domain, Infrastructure)
- [ ] Needs DI? (Only if critical path: trading, risk, state)
- [ ] Error handling? (Result type or exception?)
- [ ] Tests? (90% if critical, 50% otherwise)
- [ ] State? (Must use StateManager if touching state)
- [ ] Architecture tests pass? (`make check-architecture`)

---

## Integration Points

See "Integration Checklist" in `tasks/GUIDELINES.md` for:

- Makefile commands
- README & CHANGELOG updates
- GitHub workflows
- Daily scripts
- Documentation (HOW_IT_WORKS.md, CLAUDE.md, FRAMEWORK.md)

**P0/P1 tasks:** Also check `docs/CHECKLISTS.md` for comprehensive integration

---

## Technical Notes

**Files to modify:**

- `file.py` - {Changes}

**Testing:**

```bash
# Test commands
```

**Dependencies:**

- Depends on: Task {X}

---

## Progress Log

- **YYYY-MM-DD:** {Notes}

## Completion Notes

{What worked, lessons learned}

---

**Workflow:** See `tasks/GUIDELINES.md`

### Final Chunk: Integration & Enforcement (⚠️ MANDATORY BEFORE COMPLETION)

**BEFORE marking task complete or creating PR, verify ALL items below.**

**If ANY item is NO → Task is NOT complete. Fix it NOW.**

#### Code Quality

- [ ] `make pre-commit` passed (all hooks green)
- [ ] Tests pass for affected code areas
- [ ] `make check-architecture` passed (if touching core/)

#### Documentation Updates (per GUIDELINES.md Integration Checklist)

- [ ] **Makefile:** New commands added (if new scripts created)
- [ ] **README.md:** Quick Commands updated (if user-facing changes)
- [ ] **CHANGELOG.md:** Entry added under current version
- [ ] **HOW_IT_WORKS.md:** Updated (if core workflow changed: trading, bracket orders, safety, CI)
- [ ] **Related guides:** Strategy docs, how-tos updated (if applicable)

#### Institutional Memory (per .ai/enforcement_rules.md)

- [ ] **DECISIONS.md:** Major architectural choices documented
- [ ] **LESSONS_LEARNED.md:** Task learnings added (what worked, what didn't, surprises)
- [ ] **shadow_memory.md:** New patterns identified and added

#### Task Tracking

- [ ] **Task file:** All chunks marked complete (`[x]`)
- [ ] **BACKLOG.md:** Task ready to move to completed (or already in PR)

#### Final Verification

- [ ] Re-read `.ai/enforcement_rules.md` Rule 5 (Shadow AI checklist)
- [ ] Nothing committed with `--no-verify` (except docs-only commits)

**REMINDER:** This is a BLOCKING requirement, not a suggestion. AI agents must complete this chunk BEFORE task completion.
