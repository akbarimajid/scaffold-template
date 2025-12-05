# Search Strategy

**Purpose:** When to use grep vs semantic vs registry  
**Last Updated:** 2025-12-05

## Decision Tree

```
Need to find?
├─ Exact name? → grep (20 tokens)
├─ By purpose? → Registry (50 tokens)
└─ Understand workflow? → Semantic (400 tokens)
```

## Methods

**Grep (20 tokens):** Exact matches, function names, imports  
**Registry (50 tokens):** Find by purpose  
**Semantic (400 tokens):** Understand workflows

## Examples

**Good:**
- `grep "def process_data"` → Found (20 tokens)
- "I need to process data" → Registry → Found (50 tokens)
- "How does data processing work?" → Semantic → Understand (400 tokens)

**Bad:**
- Semantic search: "process_data function" (400 tokens, use grep instead)
- Grep: "data" (finds 200+ matches, use semantic instead)

## Anti-Patterns

❌ Semantic for exact match → Use grep (95% savings)  
❌ Grep for understanding → Use semantic (right tool)

