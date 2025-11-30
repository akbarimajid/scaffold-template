# AI Agent Development Rules

**Version:** 1.1 (Token-Optimized)  
**For:** Claude, Gemini, and all AI coding assistants  
**Read before starting ANY task**

---

## 🎯 Core Architecture (3-Layer Design)

```
scripts/ (Presentation) → core/domain/ (Business Logic) → core/adapters/ (External Systems)
```

**Layer Rules:**
- ❌ Scripts MUST NOT import from `core/adapters/`
- ❌ Domain MUST NOT import from `scripts/`
- ✅ Use dependency injection for critical paths

---

## 🧪 Testing Requirements

| Module | Coverage | Enforcement |
|--------|----------|-------------|
| `core/domain/trading.py` | 90%+ | Pre-commit |
| `core/domain/risk.py` | 90%+ | Pre-commit |
| `core/adapters/alpaca.py` | 90%+ | Pre-commit |
| `core/state/manager.py` | 90%+ | Pre-commit |
| Other modules | 50%+ | CI |

**Commands:**
```bash
make test                    # Run all tests
make test-cov-critical       # Check 90% coverage
make check-architecture      # Validate architecture
```

---

## 📋 Pre-Task Checklist (MANDATORY)

**Before starting ANY work:**

1. **Check task status**
   - Is it `blocked`? Don't start. Check blocker first.
   - Read task file completely

2. **Architecture decisions:**
   - [ ] Which layer? (Presentation, Domain, Infrastructure)
   - [ ] Needs DI? (Only if critical path: trading, risk, state)
   - [ ] Error handling? (Result type or exception?)
   - [ ] Tests? (90% if critical, 50% otherwise)
   - [ ] State? (Must use StateManager)


3. **Run checks before commit:**
   - [ ] **ALWAYS run `make fix` before `git commit`** (fixes linting 90% of the time)
   - [ ] `make check-architecture` passes
   - [ ] `make test-cov-critical` passes (if critical path)
   - [ ] `make pre-commit` passes

---

## 🚀 Mode Selection (Step 0)

**AI Agent:** Read the `**Mode:**` field from the task file. Prompt the user with:

```
📋 Mode: [Fast/Planning] – please confirm to proceed.
Reply `Ready` when you have switched the agent to the indicated mode.
```

- **Fast:** Execute chunks directly (skip `implementation_plan.md`).
- **Planning:** Create `implementation_plan.md` first.

**User must approve mode switch before any work begins.** Token savings: 500‑1000 per Fast task.


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

### ❌ Script Importing Adapter
```python
# WRONG
from core.adapters.alpaca import AlpacaTradingAdapter
adapter = AlpacaTradingAdapter()

# CORRECT
from core.domain.trading import create_trade_executor
executor = create_trade_executor()  # Factory handles DI
```

### ❌ Hardcoded Dependency
```python
# WRONG
class PositionManager:
    def __init__(self):
        self.client = TradingClient(...)  # Hardcoded!

# CORRECT
class PositionManager:
    def __init__(self, adapter: TradingAdapter):
        self.adapter = adapter  # Injected!
```

### ❌ Silent Failure
```python
# WRONG
try:
    order = place_order(symbol)
except Exception:
    pass  # Silent failure!

# CORRECT
try:
    order = place_order(symbol)
except OrderExecutionError as e:
    logger.error("Order failed", error=str(e), symbol=symbol)
    raise  # Re-raise, don't swallow
```

### ❌ Direct State Write
```python
# WRONG
with open("data/positions/current.json", "w") as f:
    json.dump(positions, f)

# CORRECT
state_manager.update_positions(positions)
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
2. **Architecture validation** - `make check-architecture`
3. **Update task** - Mark complete, add notes
4. **Update BACKLOG.md** - Move to completed section

---

## 🔗 Full Documentation

**Need more details?**
- **Physical organization:** [FRAMEWORK.md](../../FRAMEWORK.md)
- **Architecture design:** [ARCHITECTURE.md](ARCHITECTURE.md)
- **Detailed enforcement:** [ARCHITECTURE_RULES.md](ARCHITECTURE_RULES.md)
- **Testing strategy:** [VERIFICATION_PLAN.md](VERIFICATION_PLAN.md)
- **Task workflow:** [tasks/GUIDELINES.md](../../tasks/GUIDELINES.md)
- **Session start guide:** [AI_SESSION_START.md](AI_SESSION_START.md)

---

**Token-optimized for AI agents | Last Updated: 2025-11-22**
