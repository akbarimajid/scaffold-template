# AI Agent Prompt: Auto-Update Shadow Memory

**Purpose:** Provide AI agents with a detailed prompt to automatically update `.ai/shadow_memory.md` when starting a new project or session.

---

## Prompt for AI Agents

```
You are helping set up a new project using the Shadow AI system. Your task is to read the current `.ai/shadow_memory.md` template file and update it with the project's actual details.

**Instructions:**

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

**Example transformation:**

Before:
- **Name:** {PROJECT_NAME}
- **Goal:** {PROJECT_GOAL}
- **Tech Stack:** {TECH_STACK}

After (if it's a web app):
- **Name:** My Web App
- **Goal:** Build a SaaS platform for task management
- **Tech Stack:** Python (FastAPI), React, PostgreSQL, Docker

**Important:**
- Don't remove any sections
- Don't change the format
- Only replace placeholders with actual values
- Add initial context where placeholders exist but keep it concise
- Preserve all the "How to Maintain" guidance at the bottom
```

---

## Usage

**For users:** Copy this prompt and give it to your AI agent (Cursor, Windsurf, Claude, etc.) along with access to your project files. The AI will automatically populate the shadow memory template with your project details.

**For AI agents:** Follow the prompt above to update `.ai/shadow_memory.md` when:
- Setting up a new project from this template
- The shadow memory file still has placeholders
- Project details have changed significantly

---

## Integration with Workflow

After the AI updates the shadow memory:
1. Review the updates for accuracy
2. Commit the changes: `git commit -m "docs: Initialize shadow memory with project details"`
3. Continue with normal workflow (create tasks, start building)

**Note:** This is a one-time setup. After initialization, use `make update-shadow-memory task={N}` to automatically extract patterns and lessons from completed tasks.

