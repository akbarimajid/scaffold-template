# AI Agent Decision Tree

Quick decision guide for common implementation choices.

## Should I create a new error hierarchy?

**Decision Flow:**
```
Is exception-based causing problems?
├─ NO → Use existing exceptions from core.errors
│         (TradingError, BrokerAPIError, etc.)
│
└─ YES → Check DECISIONS.md (DEC-024)
          ├─ Result type under evaluation (Task 66)
          └─ For now: Use existing exception hierarchy
```

**Reference:** `.ai/patterns/error_handling_pattern.md`

---

## Should I refactor this file?

**Decision Flow:**
```
Is file >400 lines?
├─ NO → Leave as-is (acceptable size)
│
└─ YES → Is it >800 lines?
          ├─ YES → MUST refactor (create task)
          │         - Add to file size dashboard
          │         - Create refactoring task
          │
          └─ NO → Consider refactoring (ask user)
                    - Check if file is growing
                    - Consider splitting into modules
```

**Reference:** Run `make file-size-dashboard` to see file sizes

---

## Should I add a dependency?

**Decision Flow:**
```
Is dependency in approved list?
├─ YES → Use it (docs/DEPENDENCIES.md)
│
└─ NO → Ask user
          - Check if alternative exists
          - Consider maintenance burden
          - Document in DEPENDENCIES.md if approved
```

**Reference:** `docs/DEPENDENCIES.md` for approved dependencies

---

## Should I create an implementation plan?

**Decision Flow:**
```
Check task Mode field
├─ Fast → Execute directly
│         - No plan needed
│         - Code → Test → Commit
│
└─ Planning → Plan → approval → execute
                - Create detailed plan
                - Get user approval
                - Then execute
```

**Reference:** Task file `Mode` field in task template

---

## Should I use SQLite or JSON for state?

**Decision Flow:**
```
Is this new code?
├─ YES → Use SQLite (default)
│         - get_state_manager() uses SQLite by default
│         - No need to specify storage
│
└─ NO → Is this migration code?
          ├─ YES → Use migration script
          │         (scripts/maintenance/migrate_state_to_sqlite.py)
          │
          └─ NO → Use SQLite (JSON deprecated)
```

**Reference:** `.ai/patterns/state_management_pattern.md`

---

## Should I mock this in tests?

**Decision Flow:**
```
Is it an external dependency?
├─ YES → Always mock
│         - Alpaca API → Mock
│         - Telegram → Mock
│         - Prometheus → Mock
│         - File I/O → Use tempfile or mock
│
└─ NO → Is it internal but stateful?
          ├─ YES → Mock or use fixtures
          │         - State manager → Mock
          │         - Config loader → Mock
          │
          └─ NO → Use directly
                    - Pure functions → No mock needed
```

**Reference:** `.ai/patterns/testing_pattern.md`

---

## Should I add a Makefile command?

**Decision Flow:**
```
Is it a common workflow?
├─ YES → Add to Makefile
│         - Daily operations → Yes
│         - One-off scripts → No
│
└─ NO → Is it documented in README?
          ├─ YES → Consider adding for convenience
          │
          └─ NO → Leave as script only
```

**Reference:** `Makefile` sections for organization

---

## Should I update documentation?

**Decision Flow:**
```
Did I change core workflow?
├─ YES → Update HOW_IT_WORKS.md
│         - Trading workflow changes
│         - Bracket order changes
│         - Safety system changes
│
└─ NO → Did I add new feature?
          ├─ YES → Update relevant docs
          │         - Strategy docs for new strategies
          │         - README.md for user-facing changes
          │
          └─ NO → No doc update needed
```

**Reference:** `tasks/GUIDELINES.md` Integration Checklist

---

## Quick Reference

| Decision | Answer |
|----------|--------|
| Error handling | Use `core.errors` exception hierarchy |
| State storage | Use SQLite (default via `get_state_manager()`) |
| Testing | Mock all external dependencies |
| File size >800 lines | Must refactor (create task) |
| File size 400-800 lines | Consider refactoring (ask user) |
| New dependency | Check `docs/DEPENDENCIES.md` |
| Task mode "Fast" | Execute directly, no plan needed |
| Task mode "Planning" | Create plan → approval → execute |
