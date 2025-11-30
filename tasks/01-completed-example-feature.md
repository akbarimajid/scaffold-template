# Task 1: Example Feature - Authentication System

> [!NOTE]
> **AI Agent Context:** Before starting, read [`docs/policies/AI_AGENTS.md`](../docs/policies/AI_AGENTS.md) for architecture rules and checklists.

**Status:** completed  
**Priority:** P1  
**Mode:** Planning  
**Created:** 2025-11-30 | **Started:** 2025-11-30 | **Completed:** 2025-11-30

---

## Description

Implement a basic authentication system with user registration and login. This example demonstrates the complete task workflow from start to finish.

**Context:** Most applications need authentication. This task shows how to structure a feature implementation using the Shadow AI system.

---

## Goals

1. **User Registration:** Allow users to create accounts
2. **User Login:** Secure authentication with sessions
3. **Password Security:** Hash passwords, no plaintext storage
4. **Session Management:** Secure session tokens

---

## Acceptance Criteria

- [x] User registration endpoint created
- [x] User login endpoint created
- [x] Passwords hashed (bcrypt or similar)
- [x] Session tokens generated securely
- [x] Tests written (>= 80% coverage)
- [x] Documentation updated

---

## Implementation

### Chunk 1: Database Schema

- [x] Create users table (id, email, password_hash, created_at)
- [x] Create sessions table (id, user_id, token, expires_at)
- [x] Add database migrations
- [x] Test schema creation

### Chunk 2: Registration Endpoint

- [x] Create registration route
- [x] Validate email format
- [x] Hash password with bcrypt
- [x] Store user in database
- [x] Return success response
- [x] Write tests

### Chunk 3: Login Endpoint

- [x] Create login route
- [x] Verify email exists
- [x] Verify password hash
- [x] Generate session token
- [x] Store session in database
- [x] Return session token
- [x] Write tests

### Chunk 4: Session Middleware

- [x] Create middleware to verify tokens
- [x] Check token expiration
- [x] Load user from session
- [x] Add to request context
- [x] Write tests

### Chunk 5: Integration & Testing

- [x] Integration tests for full flow
- [x] Update API documentation
- [x] Update README.md
- [x] Run pre-commit checks

---

## Completion Notes

**Completed:** 2025-11-30

### What Worked

- **Incremental development:** Building in chunks (schema → registration → login → middleware) made testing easier
- **Test-driven approach:** Writing tests for each chunk caught bugs early
- **Password hashing:** Using bcrypt library prevented security issues
- **Session tokens:** UUID-based tokens with expiration provided good security

- **Patterns identified:**
  - **Layered architecture:** Database → Service → API → Middleware separation made code testable
  - **Security-first:** Hashing passwords and expiring sessions prevents common vulnerabilities
  - **Error handling:** Consistent error responses improve API usability

- **Lessons learned:**
  - **Always hash passwords:** Never store plaintext passwords, even in development
  - **Test authentication flows:** Integration tests catch issues that unit tests miss
  - **Session expiration:** Short expiration times (24 hours) balance security and UX

- **Would do differently:**
  - **Add rate limiting:** Should have added rate limiting to prevent brute force attacks
  - **Email verification:** Should have included email verification step in registration
  - **Refresh tokens:** Should have implemented refresh token pattern for better UX

---

## Related Files

- `src/auth/` - Authentication module
- `tests/auth/` - Authentication tests
- `docs/API.md` - API documentation

---

**This is an example task showing the complete workflow. Replace with your own tasks!**

