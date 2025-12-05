# Quick Context Files

**Purpose:** 50-60 line context files for AI agents to load on-demand instead of reading full 500+ line documents.

**Last Updated:** 2025-12-05

## Usage

**For AI agents:** Load relevant context file instead of full docs when you need specific information.

**Example:**

- Starting architecture work? → Read `architecture_basics.md` (60 lines)
- Writing tests? → Read `testing_strategy.md` (50 lines)
- Need to find functions? → Read `function_discovery.md` (40 lines)
- Need current status? → Read `current_state.md` (60 lines)

## Files

| File | Lines | Purpose |
|------|-------|---------|
| `function_discovery.md` | ~40 | Find functions efficiently (registry, grep, semantic) |
| `search_strategy.md` | ~40 | When to use grep vs semantic vs registry |
| `file_reading.md` | ~40 | Optimize file reads with line ranges |
| `code_execution_patterns.md` | ~50 | Chain operations directly |
| `agent_behavior.md` | ~40 | Token-efficient patterns |

## Benefits

- **Token efficiency:** ~50 lines vs. 500+ in full docs (90% reduction)
- **Focused context:** Only what you need, when you need it
- **Faster loading:** 1 tool call vs. multiple for large docs
- **Up-to-date:** Maintained as project evolves

## When to Update

- After identifying new patterns or learnings
- When token optimization opportunities are discovered
- When workflow improvements are made

