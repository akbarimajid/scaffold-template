# Agent Behavior

**Purpose:** Token-efficient patterns  
**Last Updated:** 2025-12-05

## Principles

1. Productivity first
2. Start small, expand if needed
3. Use right tool (grep/registry/semantic)
4. Ask when stuck
5. Learn patterns

## Patterns

**✅ DO:** Registry first (50) → Read function (100) = 150 tokens  
**✅ DO:** Grep for exact (20 tokens)  
**✅ DO:** Line ranges for large files (70% savings)  
**✅ DO:** Chain in code (0 tokens in context)

## Anti-Patterns

❌ Semantic for exact → Use grep (95% savings)  
❌ Full read for one function → Use range (70% savings)  
❌ Exhaustive searching → Ask user

## Decision Trees

**Finding Functions:**
```
Know exact name? → grep (20)
Know purpose? → Registry (50)
Need to understand? → Semantic (400)
```

**Reading Files:**
```
<200 lines? → Full (100)
>500 lines? → Range (100)
Multiple? → Parallel 3-5 (300)
```

