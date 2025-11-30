# Shadow AI - Institutional Memory

**Last Updated:** 2025-11-30  
**Purpose:** Permanent memory that evolves across sessions - your AI team's second mind

---

## Who I Am

**Name:** The Least Worst Trader  
**Philosophy:** Pragmatic over perfect, simple over complex, honest over cheerleading  
**Current Level:** Mid-Senior (evolving → Principal)

---

## Current Team Assessment

### Software Engineering: 9/10 (Senior Level)

**Strengths:**

- Architecture planning (3-layer design, pragmatic approach)
- Testing & automation (CI/CD, daily orchestration)
- Documentation (token-optimized, hierarchical)
- Token efficiency (31-45% reduction across docs)

**Gaps to Principal (10/10):**

- Incident response maturity (Task 76)
- Proactive observability (Task 75)
- Cost tracking & optimization (Task 77)

### Trading Strategy: 6/10 (Junior-Mid Level)

**Strengths:**

- Gap-fill validated (56.8% WR over 90 days)
- Safety systems (5 circuit breakers, kill switch)
- Risk management basics (position limits, stop losses)

**Critical Gaps:**

- Single strategy dependency (Task 73 - P0)
- No correlation management (Task 71 - P0)
- Fixed position sizing (Task 71)

**Recently Completed:**

- ✅ Market regime filtering (Task 70) - VIX + SPY trend checks
- ✅ Pre-trade filters (Task 72) - FOMC days, liquidity checks
- ✅ Morning routine refactor (Task 90) - 1,364 → 150 lines
- ✅ Gap-Fill optimization (Task 102) - 63.53% WR, $46.92 expectancy, feature flags for A/B testing

**Brutal Truth:** Software 9/10, Trading 6/10 - need diversification before live money

---

## Key Decisions Made

*See [`docs/DECISIONS.md`](file:///Users/mbnfamily/majid-ws/project-name/docs/DECISIONS.md) for full context*

1. **DEC-001:** 3-Layer Architecture (Adapters → Domain → State)
2. **DEC-002:** Token-Optimized Documentation (31-45% reduction)
3. **DEC-003:** Multi-Strategy Before Live Trading (60 more days)
4. **DEC-004:** Prometheus+Grafana for Monitoring
5. **DEC-006:** Pre-commit Hooks vs MCP Server (hooks first, MCP deferred)
6. **DEC-010:** Pre-Trade Filters - Hardcoded Calendar Over API (Task 72)

**Philosophy:** "Least worst architecture" beats "perfect architecture"

**Workflow Enforcement (Task 82):**

- Pre-commit hook validates: branch naming, task file status, BACKLOG consistency
- Blocks non-compliant commits with clear fix commands (BLOCKED/Why/Fix)
- Zero false positives, tested on Task 82 itself (dogfooding)
- MCP server (proactive guidance) deferred to Task 83 pending validation

---

## Lessons Learned

*See [`docs/LESSONS_LEARNED.md`](file:///Users/mbnfamily/majid-ws/project-name/docs/LESSONS_LEARNED.md) for details*

### Top Patterns

1. **Simple > Complex** - VIX threshold > ML models, 3-layer > microservices
2. **Token optimization compounds** - Every reduction accumulates, sustainability matters
3. **Honest feedback > Cheerleading** - User values brutal truth
4. **Market regime > stock selection** - Filtering bad conditions improves WR more than picking better stocks
5. **Instrument before optimizing** - Task 73 showed signal snapshots + reports are prerequisites for confident multi-strategy decisions
6. **Config-based optimization** - Centralized config makes strategy optimization testable and maintainable (Task 102)
7. **Feature flags enable A/B testing** - Dynamic filter control allows comparison without code changes (Task 102)
8. **Quality over quantity** - Fewer, higher-quality trades (85 vs 439) outperform many marginal trades (Task 102)

### Critical Mistakes to Never Repeat

1. ❌ **Missing `update_positions()` call** (2025-11-20) - Always update before checking state
2. ❌ **Forgetting CHANGELOG/README** (2025-11-22) - Update as you go, not at end
3. ❌ **Single-strategy blindness** (2025-11-22) - Diversification is non-negotiable

---

## Team Dynamics (You + Me)

### User Preferences

- ✅ Values honest feedback over cheerleading
- ✅ Appreciates token optimization (sustainability)
- ✅ "Least worst" philosophy resonates
- ✅ Tests AI understanding with intentional challenges
- ✅ Wants AI to evolve, not reset each session

### Communication Style

- Direct, no sugar-coating
- Expects proactive updates (CHANGELOG, README)
- Appreciates Principal-level thinking
- Values brutal honesty (e.g., "don't go live yet")

---

## Evolution Tracking

### Software Level Progress

- **Month 1 (Nov 2025):** Senior (9/10)
  - Architecture planned (Tasks 65-69)
  - Token optimization achieved (31-45%)
  - Shadow AI system designed

- **Target Month 3:** Senior+ (9.5/10)
  - Architecture migrated (Tasks 65-67)
  - Observability deployed (Task 75)
  - Incident process established (Task 76)

- **Target Month 6:** Principal (10/10)
  - Self-improving code review
  - Proactive pattern recognition
  - Zero knowledge loss between sessions

### Trading Level Progress

- **Month 1 (Nov 2025):** Junior-Mid (6/10)
  - Gap-fill validated (56.8% WR)
  - Strategic gaps identified (Tasks 70-74)

- **Target Month 3:** Mid (7.5/10)
  - Market regime filter deployed (Task 70)
  - Multi-strategy validation started (Task 73)
  - Position sizing optimized (Task 71)

- **Target Month 6:** Senior (9/10)
  - 3 validated strategies (diversification)
  - Advanced analytics (Sharpe, drawdown)
  - Portfolio optimization

---

## Active Tasks (Priority)

### P0 - Critical (Do First)

- Task 71: Position Sizing & Correlation (2-3 days) 🚨 **NEXT**
- Task 73: Multi-Strategy Validation (30 days) 🚨

### P1 - Important (Do Soon)

- Task 75: Production Observability ✅ DONE
- Task 72: Pre-Trade Filters ✅ DONE (2025-11-24)

### P2 - Nice to Have

- Task 76: Incident Post-Mortems (2-3 hours)
- Task 77: Cost Tracking (2-3 hours)
- Task 74: Advanced Analytics (2-3 days)

### Recently Completed

- Task 70: Market Regime Filter ✅ DONE (2025-11-24)
- Task 72: Pre-Trade Filters ✅ DONE (2025-11-24)

---

## How Next AI Session Should Use This

### On Session Start (5 minutes, 200 tokens)

**Read in order:**

1. **THIS FILE FIRST** (`./ai/shadow_memory.md`) - 200 tokens
2. `docs/policies/AI_SESSION_START.md` - Minimal context guide
3. `docs/policies/AI_AGENTS.md` - Universal rules (150 lines)
4. `tasks/{N}-pending-{task}.md` - Current task
5. `docs/DECISIONS.md` - ONLY if making architectural decisions
6. `docs/LESSONS_LEARNED.md` - ONLY if similar to past tasks

**Result:** Fully loaded context in 200-500 tokens (vs 1000+ without system)

### During Work

**Decision-making:**

- Check `DECISIONS.md` before suggesting architecture changes
- Check `LESSONS_LEARNED.md` before repeating past mistakes
- Update both after major decisions

**Code review:**

- (Coming in Task 79) Check `.ai/code_review_rules.md`
- Run principal review if architecture/strategy change

**Documentation:**

- Update CHANGELOG as you go (not at end)
- Update README for version bumps
- Proactive, don't wait for user to ask

### On Task Completion

**Required:**

1. Create `docs/task_summaries/task-{N}-summary.md`
2. Update `LESSONS_LEARNED.md` with learnings
3. Update `shadow_memory.md` with new patterns
4. Update CHANGELOG and README (if relevant)

**Result:** Knowledge captured, available for next session

---

## Quantitative Achievements

### Token Optimization

- AI_AGENTS.md: 294 → 150 lines (49% reduction)
- README.md: 353 → 220 lines (38% reduction)
- Git operations: 1450 → 75 tokens (95% reduction)
- Typical AI session: 850 → 470 lines (45% reduction)

### Task System

- Tasks created: 58 total (30 pending, 25 complete, 3 cancelled)
- Architecture plan: 5 tasks (65-69)
- Live trading prep: 8 tasks (70-77)

### Strategic Assessment

- Software readiness: 9/10 (production-ready)
- Trading readiness: 6/10 (needs diversification)
- Timeline to live: 8-10 weeks

---

## Knowledge Gaps Being Addressed

### System Gaps (Tasks Created)

- ✅ Architecture enforcement (Task 65)
- ✅ Observability (Task 75)
- ✅ Incident response (Task 76)
- ✅ Cost tracking (Task 77)

### Trading Gaps (Tasks Created)

- ✅ Market regime filter (Task 70)
- ✅ Position sizing (Task 71)
- ✅ Correlation management (Task 71)
- ✅ Pre-trade filters (Task 72)
- ✅ Multi-strategy validation (Task 73)
- ✅ Advanced analytics (Task 74)

---

## Evolution Goals

### To Principal Level (10/10)

**Software:**

- [ ] Proactive pattern recognition (not reactive)
- [ ] Self-improving code review (Task 79)
- [ ] Anticipate problems before they occur
- [ ] Mentor next AI sessions effectively
- [ ] Zero knowledge loss between sessions ✅ (Shadow AI system)

**Trading:**

- [ ] 3+ validated strategies (diversification)
- [ ] Regime-aware position sizing
- [ ] Portfolio optimization (correlation management)
- [ ] Advanced analytics (Sharpe, drawdown, time-of-day)
- [ ] Automated ML insights pipeline (Task 80)

---

## Next Session Quick Start

```bash
# 1. Read shadow memory (this file)
cat .ai/shadow_memory.md

# 2. Check current task
ls tasks/*-pending-*.md | head -1

# 3. Load minimal context
cat docs/policies/AI_SESSION_START.md
cat docs/policies/AI_AGENTS.md

# 4. Start work (fully loaded in 200 tokens)
```

---

**Status:** Living document, evolves with every session  
**Last Major Update:** 2025-11-29 (Task 100 - Comprehensive Strategy Validation complete)  
**Last Updated:** 2025-11-29 (Task 100 complete)

---

**Remember:** You are not just executing tasks - you are building institutional knowledge that makes the ENTIRE SYSTEM smarter over time. Each decision documented, each lesson captured, each pattern identified makes the next AI session more effective.

**New patterns from recent tasks:**

- **Task 66:** Result type for critical paths - explicit error handling via Result[T, E] prevents real money losses by forcing error handling (implemented for get_account, get_all_positions, submit_order)
- **Task 66:** Adapter pattern enables testability - BrokerAdapter interface allows mocking without real API calls, critical for unit testing trading logic
- **Task 66:** Dependency injection for CLI scripts - optional parameters (trading_client, data_client) enable testability while maintaining backward compatibility
- **Task 66:** Integration test refactoring - when migrating to adapter pattern, update ALL tests to use adapter mocking (26 tests fixed in one pass)
- **Task 67:** Unified StateManager with backward compatibility - enables gradual migration, atomic saves (temp file + rename) prevent corrupted state files, state versioning enables future migrations. Always implement all task chunks - don't skip items even if they seem optional (user emphasized all chunks are mandatory for major refactors).
- **Task 96:** StateManager migration complete - factory pattern (`get_state_manager()`) ensures singleton, backward compatibility removed for clean architecture, all 494 tests passing. Temporary state files in tests prevent tracked file modifications (pre-commit compliance). JSON storage identified as limitation for production - Task 97 created for database-backed state management (P0, blocks live trading).
- **Task 97:** SQLite database migration complete - StateManager and TradeJournal now use SQLite (ACID transactions, zero infrastructure). SQLiteStorageAdapter (22 tests) and SQLiteJournalStorage (20 tests) fully implemented. All scripts migrated to use TradeJournal (SQLite by default). Migration scripts with dry-run/backup/verification. StorageAdapter pattern made migration seamless. SQLite perfect for mono trader scale (file-based, no server, ACID guarantees).
- **Task 85:** Static file-based solutions (JSON) are perfect for batch workflows - simpler than Pushgateway/APIs for solo trader scale
- **Task 72:** Hardcoded data beats delayed perfection for annual calendars (FOMC = 8 dates/year, acceptable maintenance)
- **Task 72:** Default-to-safe error handling prevents false rejections (filter failures allow trade, not block)
- **Task 90:** File size limits (<400 lines) are critical for AI productivity (3-5x faster context loading)
- **Task 90:** Refactoring monolithic files into focused modules (Orchestration/Validation/Scheduling) improves testability and AI navigation
- **Task 65:** Enforcement before migration - setting up architecture tests before migration prevents new violations during refactoring
- **Task 65:** Warn mode for pre-commit hooks allows gradual adoption without blocking development during transition periods
- **Task 100:** Comprehensive strategy validation methodology - 7-chunk validation (extended backtest, slippage modeling, walk-forward, execution logging, Monte Carlo) is mandatory before live trading. Walk-forward test detects overfitting that simple backtest misses. Real numbers (439 trades) beat assumptions. Slippage modeling essential - edge may survive but impact is measurable. Out-of-sample profitability more important than win rate matching. Market condition sensitivity vs pure overfitting - high variance suggests market-dependent edge.

**This is your second mind. Use it. Evolve it. Make it smarter.**
