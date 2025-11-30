# Architectural Decisions

**Purpose:** Document major architectural and strategic decisions for future reference.

**Format:** Each decision should include context, decision, consequences, and alternatives considered.

---

## Decision Template

```markdown
## DEC-{NUMBER}: {Short Title}

**Date:** YYYY-MM-DD  
**Status:** Proposed | Accepted | Deprecated | Superseded  
**Context:** What problem are we solving?  
**Decision:** What did we decide?  
**Consequences:** What are the implications?  
**Alternatives Considered:** What other options did we evaluate?  
**References:** Links to related tasks, PRs, or discussions
```

---

## Example Decision

## DEC-001: Use SQLite for Local Development

**Date:** 2025-11-30  
**Status:** Accepted  
**Context:** Need a simple database for local development that doesn't require external services.  
**Decision:** Use SQLite for local development, PostgreSQL for production.  
**Consequences:** 
- Simple local setup (no database server needed)
- Easy to reset/test (delete .db file)
- Production requires different database (migration needed)
**Alternatives Considered:**
- PostgreSQL for both (more complex local setup)
- File-based storage (not suitable for concurrent access)
**References:** Task 1, PR #123

---

**How to add decisions:**
- After making a major architectural choice
- When choosing between significant alternatives
- When establishing patterns or conventions
- Reference in task completion notes if relevant

