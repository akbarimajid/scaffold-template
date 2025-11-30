# Setup Guide

**Get started with the Shadow AI template in 5 minutes.**

---

## Prerequisites

- Git installed
- **Python 3.8+** (required for v1.0 - automation scripts use Python/bash)
- Your preferred AI coding assistant (Cursor, Windsurf, GitHub Copilot, etc.)

> **Note:** This template is optimized for Python projects. The Shadow AI system (task management, documentation) is language-agnostic, but automation scripts require Python. Support for other languages planned for future versions.

---

## Quick Setup

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd scaffold-template
```

### 2. Customize Project Details

Edit `.ai/shadow_memory.md` and fill in:
- Project name
- Project goal
- Tech stack
- Current phase

### 3. Install Pre-commit Hooks (Optional but Recommended)

```bash
# Install pre-commit
pip install pre-commit
# or
python3 -m pip install pre-commit

# Install hooks
pre-commit install

# Test it works
make pre-commit
```

### 4. Create Your First Task

**Option A: Manual Creation**
```bash
# Copy the template
cp tasks/TEMPLATE.md tasks/01-pending-my-first-feature.md

# Edit the task file with your feature details
# Then start it
make task-start N=1
```

**Option B: AI-Assisted Creation (Recommended)**
- Use your AI agent's **planning/plan mode** (Cursor, Windsurf, etc.)
- Give it the task template and your feature idea
- The AI will create a detailed task file with all required sections
- Then start it: `make task-start N=1`

### 5. Start Building

Use your AI agent to execute the task. The system will:
- Track task status automatically
- Update backlog
- Maintain institutional memory

---

## Project Structure

```
scaffold-template/
├── .ai/                    # Shadow AI system
│   ├── shadow_memory.md    # Institutional memory (read first!)
│   ├── enforcement_rules.md # Critical rules for AI agents
│   └── decision_tree.md    # Decision-making guide
├── tasks/                  # Task management
│   ├── TEMPLATE.md        # Task template
│   ├── GUIDELINES.md      # Workflow guide
│   └── BACKLOG.md         # Task tracking
├── docs/                   # Documentation
│   └── policies/          # AI agent policies
├── scripts/                # Automation scripts
│   └── task_automation/   # Task management automation
└── Makefile               # Common commands
```

---

## Essential Commands

```bash
# Task management
make task-start N=1              # Start a task
make task-complete N=1           # Complete a task
make task-status N=1             # Check task status
make check-task-blockers N=1     # Check dependencies
make update-shadow-memory task=1 # Update memory from task

# Code quality
make pre-commit                  # Run pre-commit checks

# Help
make help                        # Show all commands
```

---

## Next Steps

1. **Read the docs:**
   - `.ai/shadow_memory.md` - Understand the system
   - `tasks/GUIDELINES.md` - Learn the workflow
   - `docs/policies/AI_AGENTS.md` - AI agent rules

2. **Create your first task:**
   - Copy `tasks/TEMPLATE.md`
   - Fill in your feature details
   - Use `make task-start N=1` to begin

3. **Build with AI:**
   - Share the task file with your AI agent
   - Let it execute the implementation
   - Review and iterate

---

## Troubleshooting

**Pre-commit not found:**
```bash
pip install pre-commit
# or
python3 -m pip install pre-commit
```

**Task automation scripts not working:**
- Ensure scripts are executable: `chmod +x scripts/task_automation/*.sh`
- Check you're in the project root directory

**Need help?**
- Check `tasks/GUIDELINES.md` for workflow details
- Review `.ai/enforcement_rules.md` for common issues
- See `README.md` for overview

---

**Ready to build?** Start with your first task!

