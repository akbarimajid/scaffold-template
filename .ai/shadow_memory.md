# Project Shadow Memory

> **System Prompt:** Always read this file at the start of every session. It contains the project's institutional memory, architectural decisions, and active context.

**Last Updated:** {DATE}  
**Purpose:** Permanent memory that evolves across sessions - your AI team's second mind

---

## 1. Project Context

- **Name:** {PROJECT_NAME}
- **Goal:** {PROJECT_GOAL}
- **Tech Stack:** {TECH_STACK} (e.g., Python, Next.js, etc.)
- **Current Phase:** MVP / Scaling / Maintenance
- **Template Version:** 1.0 (Python-focused)

---

## 2. Active Context (The "Now")

- **Current Focus:** Task {N} - {TASK_NAME}
- **Recent Changes:**
  - Implemented feature X
  - Refactored module Y
- **Active Blockers:** None

---

## 3. Architectural Patterns & Decisions

*See [`docs/DECISIONS.md`](docs/DECISIONS.md) for full context*

- **Pattern 1:** [Name] - [Description] (e.g., "Use Factory Pattern for API clients to enable mocking")
- **Pattern 2:** [Name] - [Description]
- **Decision:** [Date] - [Decision] (e.g., "Use SQLite for local dev, Postgres for prod")

---

## 4. Lessons Learned

*See [`docs/LESSONS_LEARNED.md`](docs/LESSONS_LEARNED.md) for details*

- **Lesson:** [Insight] (e.g., "Always mock external APIs in unit tests to avoid rate limits")
- **Lesson:** [Insight] (e.g., "Keep functions under 50 lines for AI readability")

### Critical Mistakes to Never Repeat

- ❌ **[Mistake]** - [What happened and how to avoid] (e.g., "Missing state update before checking - always update state first")

---

## 5. Task History (Summary)

- **Task 1-10:** Setup and initial infrastructure
- **Task 11-20:** Core feature implementation

*Use `make update-shadow-memory task={N}` to automatically extract patterns and lessons from completion notes*

---

## How to Maintain This File

**The workflow does the heavy lifting for you:**

- **Automated updates:** After completing tasks, run `make update-shadow-memory task={N}` to automatically extract patterns and lessons from completion notes
- **Manual updates:** Only needed for major architectural decisions or when automation doesn't capture everything

**When to update:**
- After completing tasks with new patterns or lessons (use automation)
- When making major architectural decisions (add to DECISIONS.md, reference here)
- When identifying critical mistakes to avoid (add to "Critical Mistakes to Never Repeat" section)

**What makes a good entry:**
- ✅ Specific and actionable (not vague)
- ✅ Includes context (what, why, when)
- ✅ References related tasks or decisions
- ✅ Concise (1-2 sentences)

**What to avoid:**
- ❌ Vague statements ("be careful with X")
- ❌ Duplicate entries (automation checks for duplicates)
- ❌ Overly detailed explanations (link to docs instead)

---

**Remember:** The automation (`make update-shadow-memory`) handles most updates. You only need to manually add major decisions or critical patterns that aren't captured in completion notes.
- **Task 01:** **Layered architecture:** Database → Service → API → Middleware separation made code testable. **Always hash passwords:** Never store plaintext passwords, even in development.
