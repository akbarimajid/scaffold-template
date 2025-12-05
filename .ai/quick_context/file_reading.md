# File Reading

**Purpose:** Optimize file reads  
**Last Updated:** 2025-12-05

## Decision Tree

```
Read file?
├─ <200 lines? → Full (100 tokens)
├─ >500 lines? → Range (100 tokens)
└─ Multiple small? → Parallel 3-5 (300 tokens)
```

## Guidelines

**Small files (<200):** Read full  
**Large files (>500):** Use line range `read_file(file, offset=X, limit=Y)`  
**Multiple files:** Parallel read 3-5 max

## Examples

**Good:**
- `read_file("config/settings.yaml")` - Small file, OK (100 tokens)
- `read_file("core/utils/helpers.py", offset=72, limit=100)` - Large file, use range (100 tokens vs 800)

**Bad:**
- `read_file("core/utils/helpers.py")` - 800 lines, only need 100 (700 token waste)
- Reading 10+ files in parallel (token explosion)

## Anti-Patterns

❌ Full read for one function → Use range (70% savings)  
❌ 10+ parallel reads → Limit to 3-5

