# Lessons Learned

**Purpose:** Capture insights, patterns, and learnings from completed tasks.

**Format:** Organized by task or theme, with actionable insights.

---

## Template Entry

```markdown
## Task {N}: {Task Name}

**Date:** YYYY-MM-DD  
**What Worked:**
- Insight 1
- Insight 2

**What Didn't Work:**
- Issue 1
- Issue 2

**Key Learnings:**
- Learning 1
- Learning 2

**Would Do Differently:**
- Change 1
- Change 2
```

---

## Example Entry

## Task 1: Authentication System

**Date:** 2025-11-30  
**What Worked:**
- Incremental development (schema → registration → login) made testing easier
- Using bcrypt library prevented security issues
- Test-driven approach caught bugs early

**What Didn't Work:**
- Forgot to add rate limiting initially (security gap)
- Email verification was an afterthought (should have been in initial design)

**Key Learnings:**
- Always hash passwords, even in development
- Security features should be planned from the start, not added later
- Integration tests catch issues that unit tests miss

**Would Do Differently:**
- Include rate limiting in initial design
- Add email verification step in registration flow
- Implement refresh token pattern for better UX

---

**How to add lessons:**
- After completing tasks with significant learnings
- When identifying patterns or anti-patterns
- When something works particularly well or poorly
- Use `make update-shadow-memory task={N}` to automatically extract from completion notes

