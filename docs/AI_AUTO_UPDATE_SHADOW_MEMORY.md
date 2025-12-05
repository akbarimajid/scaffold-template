# AI Agent Prompt: Auto-Update Shadow Memory & Function Registry

**Purpose:** Provide AI agents with a detailed prompt to automatically update `.ai/shadow_memory.md` and `.ai/function_registry/README.md` when starting a new project or session.

---

## Prompt for AI Agents

```
You are helping set up a new project using the Shadow AI system. Your task is to read and update TWO template files with the project's actual details:

1. `.ai/shadow_memory.md` - Project's institutional memory
2. `.ai/function_registry/README.md` - Function discovery registry

**Instructions:**

### Step 1: Update Shadow Memory

1. Read the `.ai/shadow_memory.md` file (it contains placeholders like {PROJECT_NAME}, {PROJECT_GOAL}, etc.)

2. Based on the project context (README.md, existing code, project structure), fill in:
   - Project name
   - Project goal/purpose
   - Tech stack (languages, frameworks, tools)
   - Current phase (MVP, Scaling, Maintenance)
   - Any initial patterns or decisions you can identify

3. Update the "Last Updated" date to today's date

4. Keep the structure and format exactly as provided - only replace placeholders and add initial context

5. If you cannot determine a value from the project, use a reasonable placeholder or ask the user

### Step 2: Update Function Registry

1. Read the `.ai/function_registry/README.md` file (it contains template examples)

2. Scan the project's codebase to identify core functions by purpose:
   - Core functions (data processing, business logic)
   - Validation functions (input validation, permission checks)
   - State functions (state management, persistence)
   - Utility functions (formatting, logging, helpers)

3. For each function, add:
   - Function name
   - File path and line number
   - Purpose (what it does)
   - Return type
   - Related functions (if any)

4. Replace template examples with actual project functions

5. Update common patterns section with real usage patterns from your codebase

6. Update the "Last Updated" date to today's date

**If the project has no functions yet:** Keep the template structure but note "No functions added yet - update as project grows"

**Example transformations:**

**Shadow Memory:**
Before:
- **Name:** {PROJECT_NAME}
- **Goal:** {PROJECT_GOAL}
- **Tech Stack:** {TECH_STACK}

After (if it's a web app):
- **Name:** My Web App
- **Goal:** Build a SaaS platform for task management
- **Tech Stack:** Python (FastAPI), React, PostgreSQL, Docker

**Function Registry:**
Before:
- Template examples like `process_data()`, `validate_input()`

After:
- Actual functions from codebase like `create_user()`, `validate_email()`, `save_to_db()`

**Important:**
- Don't remove any sections
- Don't change the format
- Only replace placeholders with actual values
- Add initial context where placeholders exist but keep it concise
- Preserve all the "How to Maintain" guidance at the bottom
- For function registry, focus on core functions (not every single function)
```

---

## Usage

**For users:** Copy this prompt and give it to your AI agent (Cursor, Windsurf, Claude, etc.) along with access to your project files. The AI will automatically populate both template files with your project details.

**For AI agents:** Follow the prompt above to update both files when:
- Setting up a new project from this template
- The shadow memory or function registry files still have placeholders
- Project details have changed significantly
- New core functions have been added (update function registry)

---

## Integration with Workflow

After the AI updates both files:
1. Review the updates for accuracy
2. Commit the changes: `git commit -m "docs: Initialize shadow memory and function registry with project details"`
3. Continue with normal workflow (create tasks, start building)

**Note:** 
- This is a one-time setup for new projects
- After initialization, use `make update-shadow-memory task={N}` to automatically extract patterns and lessons from completed tasks
- Update function registry manually as you add new core functions, or ask your AI agent to update it periodically

