# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

---

## [1.1.0] - 2025-12-05

### Added
- **Function Registry** (`.ai/function_registry/README.md`)
  - Quick reference to find functions by purpose (50 tokens vs 200-500 for semantic search)
  - 80-90% token reduction for function discovery
  - Template structure for easy maintenance
  - Auto-population via AI prompt

- **Quick Context Files** (`.ai/quick_context/`)
  - Focused guides for AI agents (function discovery, search strategy, file reading, code execution, agent behavior)
  - Token-optimized documentation (200-500 tokens vs 1000+)
  - On-demand loading pattern

- **Task Checklist Automation** (`make task-update-checklist N={N}`)
  - Automatically marks all checkboxes as complete
  - Creates backup before modification
  - Supports dry-run mode
  - Integrated into workflow (suggested by task-complete)

- **Enhanced AI Auto-Update Prompt** (`docs/AI_AUTO_UPDATE_SHADOW_MEMORY.md`)
  - Now covers both `shadow_memory.md` AND `function_registry/README.md`
  - Step-by-step instructions for AI agents
  - Auto-population of project functions

- **Key Patterns Documentation** (`docs/LESSONS_LEARNED.md`)
  - Automation-first enforcement pattern
  - Token optimization strategies
  - Hierarchical documentation pattern
  - Task checklist automation

### Enhanced
- **Task Completion Automation**
  - Automatic cleanup of backup files (.bak) when completing tasks
  - Completion timestamp automatically added to task files
  - Suggestion for task-update-checklist when checkboxes incomplete

- **AI Agent Workflow** (`docs/policies/AI_AGENTS.md`)
  - Updated to use automation commands (`make task-start`, `make task-complete`)
  - Clear workflow with automation-first approach

### Changed
- Principal review script made generic (removed project-specific terminology)
- Documentation updated with new task-update-checklist command
- All `.ai/` directory files made 100% generic (no project-specific references)

---

## [1.0.0] - 2025-11-30

### Added
- Shadow AI system (institutional memory)
- Task management framework
- AI agent policies and guidelines
- Pre-commit hooks configuration
- Task automation scripts

### Changed
- Initial release

---

## Types of Changes

- **Added** - New features
- **Changed** - Changes to existing functionality
- **Deprecated** - Soon-to-be removed features
- **Removed** - Removed features
- **Fixed** - Bug fixes
- **Security** - Security fixes

---

**Note:** Update this file after each significant change. Use `make task-complete N={N}` to track task completions.

