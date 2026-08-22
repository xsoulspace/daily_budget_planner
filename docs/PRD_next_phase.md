# PRD: Next Phase — Solid Base & 2026 Foundation

**Product:** DailyBu (Daily Budget Planner)  
**Phase:** Phase 0 (Solid base) + Phase 1 kickoff (2026 foundation)  
**Version:** 1.0  
**Status:** Phase 0 complete; Phase 1 in progress  
**Related:** [Strategy pillars](strategy_pillars_2026_2028.md), [Roadmap to vision](roadmap_to_vision_2026_2028.md)

---

## 1. Overview

### 1.1 Purpose

Ship a **solid, honest product** that delivers the core promise—“How much can I spend today?”—without broken flows or unsold features. This phase closes ship-blockers, aligns premium with reality, and sets the baseline for 2026 (one number &lt;2 s, one plan, sync or honest copy, prediction decided).

### 1.2 Vision (one line)

*“How much can I spend today? Right, instant, everywhere. Pay when you want it everywhere and with someone else.”*

### 1.3 Scope of this PRD

| In scope | Out of scope |
|----------|----------------|
| Ship-blocker fixes (prediction decision, sync/tag honesty) | Full sync implementation |
| One subscription tier (monthly + yearly); hide/drop test product in prod | Household / shared budget |
| Measure time-to-number (&lt;2 s) | Widget, Watch, open banking |
| Premium copy aligned with what exists (or minimal backup) | AI, B2B |
| Prediction: fix “I can spend today” **or** hide/“coming soon” | New timeframes beyond daily/weekly |

---

## 2. Goals and success metrics

| Goal | Success metric | Target |
|------|----------------|--------|
| No broken user flows | Post-paywall and prediction paths work or are intentionally hidden | 100% of shipped paths functional |
| Honest premium | No copy promises sync/tags unless implemented or explicitly “coming soon” | Copy audit passed |
| One number, fast | Time from app open to number visible on home | &lt;2 s (p95, cold start) |
| One plan | Single premium tier in paywall (monthly + yearly) | One offer, clear CTA |
| Clear decision on prediction | Decision doc: fix daily number + expose in release, or hide/coming soon | Decision documented and implemented |

---

## 3. User stories

### 3.1 Core value (free)

- **US1.** As a user, I open the app and see “how much I can spend today” (daily number) within 2 seconds, so I can plan without friction.
- **US2.** I can switch between monthly and weekly planning and see the number update immediately from my amount, expenses, and next salary/budget date.
- **US3.** On first open, I can skip or complete the “method” explanation; skipping does not block me from seeing the number.

### 3.2 Monetization

- **US4.** After subscribing, I am taken to a “Thanks for subscribing” screen and can go to home (no broken route).
- **US5.** I see one clear premium offer (e.g. monthly + yearly) with copy that only mentions features we actually provide or clearly label “coming soon.”
- **US6.** I can manage my subscription from Settings; the flow works on my platform (Apple / RuStore / Huawei).

### 3.3 Prediction (if we keep it)

- **US7.** If prediction is in release: I can open “Expenses prediction” (from home or settings), and “I can spend today” shows a real value derived from my data, not $0.00.
- **US7alt.** If we hide prediction: I do not see a broken prediction screen; I may see “Coming soon” where appropriate.

### 3.4 Honesty (no fake premium)

- **US8.** If we do not have sync: premium copy does not say “sync” or “all devices” without a “coming soon” or equivalent.
- **US9.** If we do not enforce tag limit: we do not sell “more tags” as a benefit; we remove or repurpose that permission.

---

## 4. Requirements

### 4.1 Ship-blockers (must complete)

| ID | Requirement | Acceptance criteria |
|----|--------------|---------------------|
| **SB1** | Thanks for subscribing route | ✅ Done (route registered; post-paywall lands on thanks screen). |
| **SB2** | Prediction decision | (A) Wire “I can spend today” from `TotalSumResource` (or equivalent) and set `DailyBudgetResource`; expose prediction in release from home or settings. **Or** (B) Remove/hide prediction in release or show “Coming soon.” Decision documented in repo. |
| **SB3** | Sync and tag limit | Either: (A) Implement minimal sync (e.g. backup/restore) gated by `shouldBeSynced`, and enforce tag limit in UI where tags exist. **Or** (B) Remove “sync” and “more tags” from premium copy and from paywall; optionally keep permissions in model for future use but do not mention in UI. |

### 4.2 Phase 0: Solid base

| ID | Requirement | Acceptance criteria |
|----|--------------|---------------------|
| **P0-1** | One subscription tier | Paywall shows one premium tier: monthly and yearly options only; test product (`2024_day_1_test`) not shown in production. |
| **P0-2** | Measure time-to-number | Instrument or manual test: time from app launch (cold) to “daily number” visible on home. Record baseline; target p95 &lt;2 s. |

### 4.3 Phase 1 kickoff (2026 foundation)

| ID | Requirement | Acceptance criteria |
|----|--------------|---------------------|
| **P1-1** | One number &lt;2 s | No mandatory step blocks home; preload minimal; optional method. Measured p95 &lt;2 s or backlog created to optimize. |
| **P1-2** | Premium = one plan, honest copy | Paywall and settings copy: single value prop (e.g. “Premium” or “Pro”); no “sync”/“all devices”/“more tags” unless implemented or “coming soon.” |
| **P1-3** | Sync or honest copy | If no sync: copy and UI do not promise sync. If minimal sync: backup/restore (or equivalent) exists and is gated by subscription. |
| **P1-4** | Prediction decision implemented | Per SB2: either prediction fixed and in release, or hidden/“coming soon” and documented. |

---

## 5. Functional details

### 5.1 Prediction “I can spend today” (if Option A)

- **Source of truth:** Use existing balance/expenses for the selected period (e.g. `TotalSumResource` from `CalculateBudgetBalanceCmd`).
- **Formula:** Daily budget = (balance − reserved) / days remaining in period (or equivalent from current design). Write result to `DailyBudgetResource` so `DailyBudgetDisplay` shows correct value.
- **Entry point:** Add entry from Home or Settings visible in release (e.g. “Expenses prediction” or “Planning”); remove `kDebugMode` guard for that entry.

### 5.2 Premium copy (if Option B — honest, no sync/tags)

- **Paywall:** Lead with single benefit, e.g. “Support DailyBu” or “Premium — more coming soon.” Remove any line that says data syncs across devices or that more tags/categories are included, unless implemented.
- **Thanks for subscribing:** Keep generic “premium features” or “Pro” without listing sync/tags.
- **Manage subscription:** No change to functionality; ensure copy does not promise unimplemented features.

### 5.3 One subscription tier

- **Products:** Expose only `s2024year`, `s2024month3`, `s2024month1` in production (or consolidate to monthly + yearly only). Hide or filter out `s2024day1Test` in prod build.
- **Paywall UI:** Single plan name (e.g. “DailyBu Premium”) with monthly and yearly options; yearly shows savings.

---

## 6. Non-functional

- **Performance:** Target &lt;2 s cold start to number; measure and document.
- **Platforms:** Existing (iOS, Android, etc.); no new platform in this phase.
- **Analytics:** Keep purchase and key screen events; add optional event for “time to first number” if needed for measurement.

---

## 7. Out of scope (this phase)

- Full multi-device sync (can be Phase 2).
- Household / shared budget.
- Home screen widget, Watch app.
- Open banking / auto “amount left.”
- AI suggestions, B2B/white-label.
- New timeframes (e.g. biweekly).
- Ads in core path.

---

## 8. Dependencies and risks

| Dependency | Owner | Risk if missing |
|------------|--------|------------------|
| Decision: prediction fix vs hide | Product/tech | Blocked SB2 and P1-4 |
| Decision: sync/tags implement vs remove from copy | Product/tech | Blocked SB3 and P1-3 |
| Store config (hide test product in prod) | Release/config | Test product visible in prod |

---

## 9. Open questions (resolved)

1. **Prediction:** **Fix** — see [decisions.md](decisions.md). Implemented: DailyBudgetResource set in CalculateBudgetBalanceCmd; "Expenses prediction" in Settings.
2. **Sync/tags:** **Copy only** — see [decisions.md](decisions.md). Copy audited; no sync/tags promise in UI.
3. **Entry point for prediction:** **Settings** (optionally add Home later).

---

## 10. References

- [Strategy pillars (2026→2028)](strategy_pillars_2026_2028.md)
- [Roadmap to vision](roadmap_to_vision_2026_2028.md)
- Ship-blocker table and Phase 0/1 tables in roadmap doc
