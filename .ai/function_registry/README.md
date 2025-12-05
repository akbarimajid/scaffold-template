# Function Registry

**Purpose:** Quick reference to find functions by purpose (50 tokens vs 200-500 for semantic search)  
**Last Updated:** {DATE} (Update when adding new functions)

---

## What Is This?

This file helps AI agents quickly find functions by **purpose** instead of searching by name. It's like a phone book organized by "what you want to do" rather than "who you're looking for."

**Example:**
- ❌ **Without registry:** Search for "process" → find 20 functions → read each one (500 tokens)
- ✅ **With registry:** Check registry → find `process_data()` → read that one function (50 tokens)

**Savings:** 80-90% token reduction for common operations

---

## How to Use (For AI Agents)

1. **Need a function?** Check this file first (50 tokens)
2. **Found it?** Read the specific function file (use line range if large)
3. **Not found?** Use grep for exact name or semantic search for understanding

**Search Strategy:**
```
Registry (50 tokens) → Grep (20 tokens) → Semantic Search (400 tokens)
```

---

## How to Maintain (For Users)

**When to update:**
- After adding new core functions
- When function purposes change
- When new patterns emerge

**How to update:**
1. Add function name, file path, line number
2. Include purpose and return type
3. Add to relevant category
4. Update common patterns if new workflow emerges

**Tip:** Use `docs/AI_AUTO_UPDATE_SHADOW_MEMORY.md` prompt to have your AI agent update this automatically.

---

## Template Structure

**Replace the sections below with your project's actual functions:**

### Core Functions

**`process_data()`** - `core/utils/processors.py:42`  
Process input data. Returns processed result. Related: `validate_data()`

**`save_data()`** - `core/storage/saver.py:15`  
Save data to storage. Returns success bool.

### Validation Functions

**`validate_input()`** - `core/validation/validators.py:20`  
Validate input data. Returns (is_valid, errors).

**`check_permissions()`** - `core/auth/permissions.py:35`  
Check user permissions. Returns bool.

### State Functions

**`StateManager`** - `core/state/manager.py`  
Unified state management. Methods: `get()`, `set()`, `save()`, `load()`

**`atomic_save()`** - `core/utils/atomic_save.py`  
Atomic file write operation. Returns success bool.

### Utility Functions

**`format_output()`** - `core/utils/formatters.py:10`  
Format data for output. Returns formatted string.

**`log_event()`** - `core/utils/logging.py:25`  
Log event to system. Returns void.

---

## Common Patterns

**Process Data:**
```python
if not validate_input(data):
    return {"error": "Invalid input"}
processed = process_data(data)
save_data(processed)
```

**Check Before Action:**
```python
if not check_permissions(user, action):
    return False
result = perform_action(action)
log_event("action_performed", result)
```

---

## Getting Started

**For new projects:**

1. Keep this template structure
2. As you add functions, update this file
3. Or use the AI prompt in `docs/AI_AUTO_UPDATE_SHADOW_MEMORY.md` to auto-populate

**For existing projects:**

1. Scan your codebase for core functions
2. Categorize by purpose (Core, Validation, State, Utility, etc.)
3. Add function name, file path, line number, purpose, return type
4. Document common usage patterns

---

**Remember:** This file is a living document. Update it as your project evolves!
