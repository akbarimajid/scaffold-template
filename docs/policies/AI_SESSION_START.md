# AI Agent# AI Session Start Guide

**Purpose:** Minimal context loading for AI sessions (200-500 tokens vs 1000+)

> [!CAUTION]
>
> ## 🚨 CRITICAL: Read BEFORE Any Work
>
> **On every session start:**
>
> 1. Read `.ai/shadow_memory.md` first (200 tokens - your second mind)
> 2. Read `.ai/enforcement_rules.md` (MANDATORY - 6 rules NO AI may bypass)
> 3. Read current task file from `tasks/`
>
> **Before marking ANY task complete:**
>
> - Re-read `.ai/enforcement_rules.md` Rule 5 (Shadow AI checklist)
> - Verify ALL integration checklist items from `tasks/GUIDELINES.md`
> - Update `DECISIONS.md`, `LESSONS_LEARNED.md`, `shadow_memory.md`
> - **If ANY item missing → Task NOT complete. Fix NOW.**

---
**Last Updated:** 2025-11-22 (Added Shadow AI system)

---

## Quick Start (200 tokens, 2 minutes)

### Step 1: Load Shadow Memory (FIRST!)

```bash
git fetch --tags  # Ensure version awareness
cat .ai/shadow_memory.md
```

**Why first:** Contains ALL institutional knowledge - decisions, lessons, team dynamics, current priorities.

**Token cost:** ~200 tokens  
**What you get:** Full context of project history, philosophy, current state

---

### Step 2: Understand Current Work

```bash
# Check active tasks
ls tasks/*-pending-*.md | head -5

# Read current task
cat tasks/{N}-pending-{name}.md
```

**Token cost:** ~100-200 tokens per task  
**When:** You know what to work on

---

### Step 3: Load AI Agent Rules (If Needed)

```bash
cat docs/policies/AI_AGENTS.md
```

**Token cost:** ~150 lines (token-optimized)  
**When:** You need refresher on:

- Task workflow
- Architecture rules  
- Pre-commit checklist
- Git workflow

**Skip if:** You just need to continue existing task

---

### Step 4: Load Reference Docs (On-Demand Only)

**Decision Context:**

```bash
cat docs/DECISIONS.md
```

**When:** Making architectural or strategic decisions  
**Token cost:** ~300 tokens

**Past Lessons:**

```bash
cat docs/LESSONS_LEARNED.md
```

**When:** Starting similar task to past work  
**Token cost:** ~400 tokens

**Architecture Details:**

```bash
cat docs/policies/ARCHITECTURE.md
```

**When:** Implementing architecture changes (Tasks 65-67)  
**Token cost:** ~600 tokens

---

## Total Token Cost by Scenario

### Scenario 1: Continue Existing Task

**Load:** Shadow memory + task file  
**Tokens:** 200 + 200 = **400 tokens**  
**Example:** "Continue Task 70 (Market Regime Filter)"

### Scenario 2: Start New Task (Routine)

**Load:** Shadow memory + AI_AGENTS.md + task file  
**Tokens:** 200 + 150 + 200 = **550 tokens**  
**Example:** "Start Task 75 (Observability Dashboard)"

### Scenario 3: Start Complex Task (Architecture)

**Load:** Shadow memory + AI_AGENTS.md + DECISIONS.md + ARCHITECTURE.md + task file  
**Tokens:** 200 + 150 + 300 + 600 + 200 = **1450 tokens**  
**Example:** "Start Task 66 (Architecture Migration Phase 1)"

### Scenario 4: Strategic Decision-Making

**Load:** Shadow memory + DECISIONS.md + LESSONS_LEARNED.md  
**Tokens:** 200 + 300 + 400 = **900 tokens**  
**Example:** "Should we add a new strategy?"

---

## Shadow AI System (NEW - 2025-11-22)

### The Problem It Solves

**Before:** Every new AI session starts from zero, user must re-establish context (1000+ tokens)  
**After:** AI reads shadow_memory.md, fully loaded in 200 tokens

### How It Works

**Institutional Memory:**

- `.ai/shadow_memory.md` - Your persistent context (team level, decisions, lessons, priorities)
- `docs/DECISIONS.md` - Major decisions with rationale (why choices were made)
- `docs/LESSONS_LEARNED.md` - Wisdom from every task (what worked, what didn't)

**After each task:**

1. Update `LESSONS_LEARNED.md` with learnings
2. Update `shadow_memory.md` with new patterns
3. Add major decisions to `DECISIONS.md`

**Result:** Each session builds on the last, no knowledge loss

### Evolution Tracking

**Current Level:**

- Software: 9/10 (Senior)
- Trading: 6/10 (Junior-Mid)

**Target Level:**

- Software: 10/10 (Principal) - proactive, self-improving
- Trading: 9/10 (Senior) - multi-strategy, portfolio optimization

---

## User Preferences (From Shadow Memory)

- ✅ Values **honest feedback** over cheerleading
- ✅ Appreciates **token optimization**
- ✅ **"Least worst" philosophy** (pragmatic > perfect)
- ✅ Expects **proactive updates** (CHANGELOG, README without asking)
- ✅ Tests AI with intentional challenges

---

## Current Priorities (From Shadow Memory)

### P0 - Critical (Do First)

- Task 70: Market Regime Filter 🚨
- Task 71: Position Sizing & Correlation 🚨
- Task 73: Multi-Strategy Validation 🚨

### P1 - Important

- Task 75: Production Observability
- Task 72: Pre-Trade Filters

---

## Recommended Loading Strategy

### If User Says: "Continue working"

**Load:** Shadow memory (200 tokens)  
**Reason:** You already know the context

### If User Says: "Start Task {N}"

**Load:** Shadow memory + task file (400 tokens)  
**Reason:** Task file has full context

### If User Says: "Review architecture"

**Load:** Shadow memory + ARCHITECTURE.md + DECISIONS.md (1100 tokens)  
**Reason:** Need full architecture context

### If User Says: "What should I work on?"

**Load:** Shadow memory + BACKLOG.md (400 tokens)  
**Reason:** Priorities in shadow memory

---

## Critical Philosophy

**"Least Worst Architecture"**

- Simple > Complex
- Pragmatic > Perfect
- Ship in weeks > Perfect in months

**Honest Assessment**

- Software: 9/10 (excellent)
- Trading: 6/10 (needs work)
- Don't go live until multi-strategy validation (60 more days)

---

**Token Savings:** 80% reduction (1000 → 200 tokens for session start)  
**Knowledge Loss:** ZERO (Shadow AI system captures everything)  
**Evolution:** System gets smarter with each session

---

**Start every session by reading `.ai/shadow_memory.md` first. Everything else is on-demand.**

# 2. Verify architecture tests exist

make check-architecture

# If fails, Task 65 not complete yet

# 3. Check coverage requirements

# Needed if touching critical paths

```

---

## Token Efficiency Strategy

### Minimal Session (200 tokens)
- Task file (~100 lines)
- AI_AGENTS.md (~150 lines)
- **Start coding immediately**

### Medium Session (500 tokens)
- Minimal + FRAMEWORK.md (~275 lines)
- When organizing files or creating new directories

### Deep Session (1000+ tokens)
- Medium + ARCHITECTURE.md (~500 lines)
- Only for architectural decisions or major refactoring

**Rule:** Load only what you need, when you need it.

---

## Common Session Types

### Task Implementation (Most Common)
```

Read: Task file + AI_AGENTS.md
Don't need: ARCHITECTURE.md (rules already in AI_AGENTS.md)
Token cost: ~200 lines

```

### Architecture Work
```

Read: Task file + AI_AGENTS.md + ARCHITECTURE.md
Need: Full design context
Token cost: ~600 lines

```

### File Organization
```

Read: Task file + AI_AGENTS.md + FRAMEWORK.md
Need: Directory structure rules
Token cost: ~400 lines

```

### Bug Fixing
```

Read: Task file + AI_AGENTS.md
Don't need: Architecture docs (usually)
Token cost: ~200 lines

```

---

## Efficiency Checklist

- [ ] Task file read? (Required)
- [ ] AI_AGENTS.md read? (Required)
- [ ] Blocking dependencies checked? (Required)
- [ ] Other docs needed? (On-demand only)
- [ ] Architecture tests run? (If touching core/)
- [ ] Ready to start coding? (Yes!)

---

## Remember

**Goal:** Maximum productivity with minimum context loading

**Pattern:**
1. Task file tells you WHAT to do
2. AI_AGENTS.md tells you HOW to do it
3. Other docs = reference only (load on-demand)

**Token savings:** 87% (1500 → 200 lines for typical session)

---

**Last Updated:** 2025-11-22  
**Token-optimized for AI efficiency**
