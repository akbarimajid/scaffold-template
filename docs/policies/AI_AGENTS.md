# AI Agent Development Rules

**Version:** 1.1 (Token-Optimized)  
**For:** Claude, Gemini, and all AI coding assistants  
**Read before starting ANY task**

---

## 🎯 Core Architecture

**Design your project with clear layer separation:**

```
Presentation Layer → Business Logic Layer → Infrastructure/Adapters Layer
```

**Layer Rules:**
- ❌ Presentation layer MUST NOT import from Infrastructure layer
- ❌ Business logic MUST NOT import from Presentation layer
- ✅ Use dependency injection for critical paths
- ✅ Keep layers loosely coupled

**Example structure:**
- `src/` or `app/` - Presentation (API routes, CLI, UI)
- `core/` or `domain/` - Business logic (pure functions, domain models)
- `adapters/` or `infrastructure/` - External systems (databases, APIs, file I/O)

---

## 🧪 Testing Requirements

**Coverage Guidelines:**
- **Critical paths** (business logic, state management, security): 90%+ coverage
- **Other modules:** 50%+ coverage
- **External dependencies:** Always mock in tests

**Testing Best Practices:**
- Mock all external APIs, databases, and file I/O
- Test business logic in isolation
- Use integration tests for critical workflows
- Keep tests fast and independent

**Commands:**
```bash
# Run your project's test suite
# Add these to your Makefile based on your testing framework
# Example for Python:
# make test                    # Run all tests
# make test-cov               # Check coverage
```

---

## 📋 Pre-Task Checklist (MANDATORY)

**Before starting ANY work:**

1. **Check task status**
   - Is it `blocked`? Don't start. Check blocker first.
   - Read task file completely

2. **Architecture decisions:**
   - [ ] Which layer? (Presentation, Domain, Infrastructure)
   - [ ] Needs DI? (Only if critical path: core logic, state)
   - [ ] Error handling? (Result type or exception?)
   - [ ] Tests? (90% if critical, 50% otherwise)
   - [ ] State? (Must use StateManager)


3. **Run checks before commit:**
   - [ ] `make pre-commit` passes (or your project's equivalent)
   - [ ] Tests pass (if code changes)
   - [ ] Architecture validation passes (if applicable)

---

## 🚀 Mode Selection (Step 0)

**AI Agent:** Read the `**Mode:**` field from the task file. The mode depends on your AI tool:

**For thinking models (Claude, GPT-4, etc.):**
- **Fast:** Execute chunks directly (skip detailed planning)
- **Planning:** Create `implementation_plan.md` first, then execute

**For non-thinking models or agent modes (Cursor Agent, etc.):**
- **Fast:** Use agent/auto mode for direct execution
- **Planning:** Use plan/planning mode to create detailed plan first

**Prompt the user:**
```
📋 Mode: [Fast/Planning] – please confirm to proceed.
Reply `Ready` when you have switched to the indicated mode.
```

**User must approve mode switch before any work begins.**


## �🔧 Git Operations (Token-Optimized)

**Problem:** Verbose git output wastes 1000+ tokens per commit  
**Solution:** Use quiet flags + error filtering = **95% token reduction**

```bash
# Stage (silent unless error)
git add -A 2>&1 | grep -i error || echo "✅ Staged"

# Check status (concise)
git status --short

# Commit docs/tasks (skip hooks)
git commit -m "docs: description (Task N)" --no-verify 2>&1 | \
  grep -E "(error|fatal|files changed)" || echo "✅ Committed"

# Commit code (run hooks, filter output)
git commit -m "feat: description (Task N)" 2>&1 | \
  grep -E "(Failed|error|fatal|files changed)" || echo "✅ Committed"

# Push (minimal output)
git push 2>&1 | tail -5
```

**When to use --no-verify:**
- ✅ Docs-only changes (README, tasks, guides, CHANGELOG, BACKLOG.md)
- ❌ Code changes (.py, .yaml, .json) - need linting

**⚠️ CRITICAL:**
- AI_AGENTS.md MUST stay <220 lines
- DO NOT add examples/scenarios to AI_AGENTS.md (put in GUIDELINES.md)
Token savings: 1450 → 75 per commit = **95% reduction**

---

## 🛡️ Workflow Enforcement

Pre-commit hooks validate workflow compliance automatically. Follow task workflow (below) and hooks will pass. Hook errors include fix commands.

---

## 🚫 Common Violations & Fixes

### ❌ Layer Violation
```python
# WRONG - Presentation importing from Infrastructure
from adapters.database import DatabaseAdapter
adapter = DatabaseAdapter()

# CORRECT - Use dependency injection
from domain.service import create_service
service = create_service(adapter)  # Factory handles DI
```

### ❌ Hardcoded Dependency
```python
# WRONG
class UserService:
    def __init__(self):
        self.db = DatabaseClient(...)  # Hardcoded!

# CORRECT
class UserService:
    def __init__(self, db_adapter: DatabaseAdapter):
        self.db = db_adapter  # Injected!
```

### ❌ Silent Failure
```python
# WRONG
try:
    result = process_data(data)
except Exception:
    pass  # Silent failure!

# CORRECT
try:
    result = process_data(data)
except ProcessingError as e:
    logger.error("Processing failed", error=str(e), data=data)
    raise  # Re-raise, don't swallow
```

### ❌ Direct State Write (Bypassing Abstraction)
```python
# WRONG
with open("data/state.json", "w") as f:
    json.dump(state, f)

# CORRECT
state_manager.update_state(state)
state_manager.save()
```

---

## 📝 Task Workflow (MANDATORY)

### Before Implementation
1. **Check if task exists** - Search `tasks/BACKLOG.md`
2. **Create task if needed** - Use `tasks/TEMPLATE.md`
3. **Update BACKLOG.md** - Add to appropriate priority section

### During Implementation
1. **Rename task** - `{N}-in-progress-{name}.md`
2. **Create branch** - `feature/task-{N}-{short-name}`
3. **Work in chunks** - Code → Commit → Push → Wait
4. **Run checks** - `make ci-checks` before commit

### After Implementation
1. **Integration checklist** - See `tasks/GUIDELINES.md`
2. **Run tests** - Ensure all tests pass
3. **Update documentation** - DECISIONS.md, LESSONS_LEARNED.md, shadow_memory.md
3. **Update task** - Mark complete, add notes
4. **Update BACKLOG.md** - Move to completed section

---

## 🔗 Full Documentation

**Need more details?**
- **Task workflow:** [tasks/GUIDELINES.md](../../tasks/GUIDELINES.md)
- **Session start guide:** [AI_SESSION_START.md](AI_SESSION_START.md)
- **Architectural decisions:** [docs/DECISIONS.md](../../docs/DECISIONS.md)
- **Lessons learned:** [docs/LESSONS_LEARNED.md](../../docs/LESSONS_LEARNED.md)
- **Enforcement rules:** [.ai/enforcement_rules.md](../../.ai/enforcement_rules.md)
- **Decision tree:** [.ai/decision_tree.md](../../.ai/decision_tree.md)

---

**Token-optimized for AI agents | Last Updated: 2025-11-30**
