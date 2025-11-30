# Scaffold Template

**Build your MVP with AI that never forgets**

This template implements the **Shadow AI system** - institutional memory for AI-assisted development.

> **Note:** This template is optimized for **Python projects** (v1.0). The Shadow AI system itself is language-agnostic, but automation scripts and pre-commit hooks are Python-focused. Support for other languages coming in future versions.

## Problem Solved

AI coding tools lose context after 1 session. This system preserves 100% context across unlimited sessions.

## What's Included

- **Shadow AI System:** `.ai/shadow_memory.md` (87% token reduction) - Language agnostic
- **Task Management:** `tasks/` directory with proven workflow - Language agnostic
- **AI Policies:** `docs/policies/` for consistent agent behavior - Language agnostic
- **Automation:** `Makefile` for common commands - Python-focused (v1.0)
- **Pre-commit Hooks:** Generic file checks + optional Python (Black, Flake8)

## Quick Start

1. **Clone this repo**
2. **Setup:** Follow [SETUP.md](SETUP.md) for detailed installation instructions
3. **Read Context:** Read `.ai/shadow_memory.md` to understand the system
   - **AI agents can auto-update it:** See [docs/AI_AUTO_UPDATE_SHADOW_MEMORY.md](docs/AI_AUTO_UPDATE_SHADOW_MEMORY.md) for a prompt you can give your AI agent to automatically fill in project details
4. **Create Task:** Copy `tasks/TEMPLATE.md` to `tasks/01-pending-my-feature.md`
5. **Start Building:** Use your AI agent (Cursor, Windsurf, etc.) to execute the task
6. **Update Memory:** After completing tasks, run `make update-shadow-memory task={N}` to extract patterns and lessons

**See [SETUP.md](SETUP.md) for complete setup guide and [tasks/01-completed-example-feature.md](tasks/01-completed-example-feature.md) for a working example.**

## Battle-Tested

Built a production production system in 58 tasks with zero knowledge loss using this exact framework.
