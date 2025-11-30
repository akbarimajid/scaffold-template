# Approved Dependencies

**Purpose:** Track approved dependencies and their justification to prevent dependency bloat.

**Format:** List dependencies with reason for approval and alternatives considered.

---

## Dependency Template

```markdown
## {Package Name}

**Version:** {version}  
**Purpose:** {What it's used for}  
**Justification:** {Why this dependency is needed}  
**Alternatives Considered:** {Other options evaluated}  
**Maintenance:** {How often updated, who maintains it}  
**Approved:** YYYY-MM-DD
```

---

## Example Entry

## bcrypt

**Version:** 4.0.1  
**Purpose:** Password hashing for authentication  
**Justification:** Industry-standard password hashing library. More secure than built-in hashlib for passwords.  
**Alternatives Considered:**
- hashlib (not designed for passwords, vulnerable to timing attacks)
- argon2 (more secure but overkill for this use case)
**Maintenance:** Actively maintained, widely used  
**Approved:** 2025-11-30

---

**How to add dependencies:**
- Before adding a new dependency, check this list
- If not listed, ask for approval
- Document why it's needed and what alternatives were considered
- Update this file when dependency is approved

**Guidelines:**
- Prefer standard library when possible
- Consider maintenance burden (abandoned packages are risky)
- Document security implications for sensitive dependencies

