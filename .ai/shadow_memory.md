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

---

## 6. Token Optimization Patterns (Template)

**Function Registry Pattern:**
- Find functions by purpose, not just name
- Check `.ai/function_registry/README.md` first (50 tokens)
- 80% success rate for common operations
- **Savings:** 150-450 tokens per function discovery

**Search Strategy Pattern:**
- Grep for exact matches (10-50 tokens)
- Function registry for purpose (50 tokens)
- Semantic search for understanding (200-500 tokens)
- **Savings:** 70-95% reduction vs always using semantic search

**File Reading Pattern:**
- Use line ranges for large files (>200 lines)
- Read 3-5 small files in parallel
- Limit parallel reads to avoid token explosion
- **Savings:** 50-70% reduction on file reads

**Code Execution Pattern:**
- Chain operations in code, not in LLM context
- Write workflow functions, execute in sandbox
- Pass data directly between operations
- **Savings:** 200-1000 tokens per workflow

**See:** `.ai/quick_context/` for detailed guides

---

## 7. Task Automation Patterns (Template)

**Checklist Automation Pattern:**
- Automate marking checkboxes in task files
- Use `make task-update-checklist N={N}` before task completion
- Saves time and reduces errors
- **Savings:** ~2 minutes per task, prevents incomplete checkboxes

**Workflow Automation Pattern:**
- Single commands replace multiple manual steps
- `make task-start N={N}` automates pre-work (5 steps → 1 command)
- `make task-complete N={N}` automates completion (4 steps → 1 command)
- **Savings:** 80% token reduction, prevents skipping steps

**Why it works:**
- Automation enforces rules (can't skip steps)
- Manual rules can be ignored, automation can't
- Single commands reduce cognitive load
- Validation scripts catch issues early

**Evidence:** Automation-first approach reduces errors and saves time
