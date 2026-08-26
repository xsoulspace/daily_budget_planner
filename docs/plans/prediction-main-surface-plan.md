# Plan: Prediction as main deep surface — remaining work

> Working plan for ADR-0004 execution. Update or delete after extraction
> (plan hygiene per AGENTS.md). Status markers: ✅ done · 🔨 in progress · ⬜ todo.

## Context

ADR-0004 (accepted): the prediction screen becomes the main "deep" surface;
today's Home stays the fast-tools layer. Each surface owns its own inputs
(separate data is intentional; no bridging). Storage migration to
universal_storage replaces sembast later — sembast bugs are not blockers.

## Done this session (2026-08-24)

- ✅ ADR-0003 staged rollout + ADR-0004 deep-surface repositioning.
- ✅ Prediction routed (`/home/prediction`), flag-gated settings entry,
  teaser card on Home, first-open intro (SimpleStepsFlow).
- ✅ Empty-state fast entry on prediction screen:
  "How much do you have right now?" → amount → number.
- ✅ Root cause of fatal save bug fixed:
  `BudgetSembastCollection.toMap()` wrote raw `DateTime` into `createdAt`;
  now ISO-8601 string (matches query filters).
- ✅ Committed surface v1 (roadmap 1.5.3): `CommittedView` sheet with list,
  period total, add form (name/amount/period), remove; wired into
  prediction screen stats and app startup (`LoadCommitmentsCmd`).

## Remaining

### 1. Verify end-to-end (next step)
- ⬜ Relaunch app after foundation package codegen; walk:
  prediction → enter amount → number appears → add commitment →
  daily number updates visibly → remove commitment.
- ⬜ Confirm no uncaught exceptions in logs during the walk.

### 2. UX polish on prediction screen
- ⬜ After saving from empty-state, show the number immediately (currently
  relies on resource refresh timing) — verify, fix if stale frame.
- ⬜ Wire `BudgetWillLast` stub: days = balance / dailyBudget; tap opens
  Budget history (remove hardcoded "~2 days", dead onPressed).
- ⬜ Localize remaining hardcoded strings in prediction screen header
  ("regular expenses/income" TODOs exist already).
- ⬜ Teaser card: re-show cooldown after dismissal (currently dismissed
  forever until flag flip).

### 3. Depth layer (roadmap 1.5.x)
- ⬜ Commitments affect the number via `RecalculateDailyNumberCmd` — verify
  cause-and-effect visible on screen after each change (trust loop).
- ⬜ Planned sums surface (one editable number per bucket) — model exists,
  no UI yet.
- ⬜ Sum→Reason drift prompt (1.5.2): adjust planned sum in one action when
  actuals diverge.

### 4. Promotion path (ADR-0003 Phase 4)
- ⬜ Analytics events firing check (`prediction_opened`, `teaser_dismissed`,
  `steps_completed`).
- ⬜ Decide promotion trigger from engagement data; then delete flag +
  debug gates, extract decision to docs, delete this plan file.

## Non-goals now
- Sync / household / widgets (2027+).
- Sembast → universal_storage migration (separate effort; current fix is
  compatible either way).
- Categories & graphs tooling (exists in early form under `wip/`).
