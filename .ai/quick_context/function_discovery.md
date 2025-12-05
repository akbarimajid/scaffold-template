# Function Discovery

**Purpose:** Find functions efficiently  
**Last Updated:** 2025-12-05

## Decision Tree

```
Need function?
├─ Know exact name? → grep (20 tokens)
├─ Know purpose? → Registry (50 tokens)
└─ Need to understand? → Semantic (400 tokens)
```

## Methods

**Registry:** Check `.ai/function_registry/README.md` first (50 tokens, 80% success)  
**Grep:** `grep "def function_name"` (20 tokens, 95% success)  
**Semantic:** "How does X work?" (400 tokens, 90% success)

## Examples

**Good:**
- "I need to process data" → Registry → `process_data()` (50 tokens)
- "def process_data" → Grep → Found (20 tokens)

**Bad:**
- "process data function" → Semantic search (400 tokens, 95% waste)

## Anti-Patterns

❌ Semantic search for exact name → Use grep (95% savings)  
❌ Reading full file for one function → Use line range (70% savings)  
❌ Multiple searches for same thing → Check registry first

