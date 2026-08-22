# Roadmap to Vision (2026 → 2028)

Complete roadmap from **current product state** to the strategy pillars. Brutally honest.

---

## Part 1: Current state (analysis summary)

### What works

| Area | State | Notes |
|------|--------|------|
| **Home "one number"** | ✅ Done | Monthly + Weekly tabs; daily = (amount − savings) / days to next budget day (monthly) or amount / days in week (weekly). Persisted via `SimpleBudgetLocalApi`. |
| **Preload → Home** | ✅ Done | PreloadingScreen → Home; first-time can show method explanation (not blocking after first run). |
| **Paywall** | ✅ Done | Route `/home/paywall`, products from `MonetizationProducts`; subscribe flow calls `toThanksForSubscribing()`. |
| **Manage subscription** | ✅ Done | `/home/manage-subscription`; shows active sub, platform manage. |
| **Settings, Privacy, Terms** | ✅ Done | All routed and functional. |
| **Local persistence** | ✅ Done | User, app settings, simple budget (monthly/weekly), manual budgets, tasks, transactions, fin settings — all local (kernel + Isar/Sembast). |

### Broken or missing (brutal)

| Issue | Severity | Detail |
|-------|----------|--------|
| **Thanks for subscribing route** | ✅ Fixed | Route registered in `router.dart`; post-paywall lands on thanks screen. |
| **Prediction "I can spend today"** | ✅ Fixed | `DailyBudgetResource` set in `CalculateBudgetBalanceCmd`; "I can spend today" shows correct value. |
| **Prediction reachable only in debug** | ✅ Fixed | "Expenses prediction" always visible in Settings (no `kDebugMode` guard). |
| **BudgetWillLast** | 🟠 Stub | Hardcoded "~2 days", `onPressed: () {}`. No logic. |
| **Sync** | ✅ Honest copy | No promise in UI; copy-only decision. See [decisions.md](decisions.md). |
| **Tag limit** | ✅ Honest copy | Not sold in UI; copy-only decision. See [decisions.md](decisions.md). |
| **Two budget systems** | 🟡 Debt | Simple monthly/weekly (`SimpleBudgetLocalApi`) vs manual budgets for prediction (`manualBudgetsLocalApi` + kernel). Two "daily" concepts; prediction daily number is now wired. |
| **Household / shared** | ❌ Missing | Single-user only. |
| **Widgets / Watch / Open banking** | ❌ Missing | None. |
| **Ads** | ❌ Missing | No ad SDK or code (strategy says no ads in core path — OK). |

### Honest summary

- **Core value works on Home and Prediction.** Monthly and weekly "one number" is correct and fast; prediction "I can spend today" is computed and exposed in release.
- **Monetization:** Post-paywall route fixed; one tier in prod (monthly + yearly); premium copy audited, no sync/tags promise.
- **Premium:** Permissions (sync, tag limit) kept in model for future use; not claimed in UI.

---

## Part 2: Fixes before vision (ship-blockers)

Do these before committing to 2026 vision milestones.

| # | Fix | Owner | Done |
|---|-----|--------|------|
| 1 | **Register Thanks for subscribing route** in `router.dart`: add `AppRoute(ScreenPaths.thanksForSubscribing.value, ...)` under home routes, builder → `ThanksForSubscribingScreen` (subscription from `SubscriptionManager.activeSubscription`). | — | ☑ Applied |
| 2 | **Decide prediction's role.** Either: (A) Wire prediction "I can spend today" from existing data (e.g. from `TotalSumResource` + days in period → daily budget, write to `DailyBudgetResource`), or (B) Remove/hide prediction until it's part of the roadmap. Document decision. | — | ☑ Done (Option A; see [decisions.md](decisions.md). Implementation in place.) |
| 3 | **Either implement or stop claiming.** Sync: either add a minimal sync path (e.g. cloud backup/restore) and gate it on `shouldBeSynced`, or remove "sync" from premium copy. Tag limit: either enforce in UI (e.g. limit categories/tags to `tagLimit`) or remove from `UserPermissionsModel` and copy. | — | ☑ Done (Copy only; see [decisions.md](decisions.md). No sync/tags promise in UI.) |

---

## Part 3: Roadmap to vision

### Phase 0: Solid base (before 2026 vision)

- Fix all ship-blockers above.
- One subscription tier in paywall (e.g. monthly + yearly; drop or hide test product in prod).
- Measure: time from app open to number on home (&lt;2 s target).

### Phase 1: 2026 — One number, obvious premium

| Milestone | Deliverables | Success |
|-----------|--------------|--------|
| **1.1 One screen, one number, &lt;2 s** | Preload minimal; no mandatory steps before showing home number. Optional "method" for new users; skip/back doesn't block. | Open app → number visible in &lt;2 s. |
| **1.2 Premium = one plan** | Single premium tier (e.g. "DailyBu Premium": monthly + yearly). Copy: "Your budget on all devices" (sync) and/or "One number for you and your partner" (household teaser). | Clear value prop; no "more tags" as main sell. |
| **1.3 Sync or honest copy** | Either: (A) Minimal sync (e.g. signed-in backup/restore to cloud, second device restores), gated by `shouldBeSynced`; or (B) Remove "sync" from premium until 2027. | No selling a feature that doesn't exist. |
| **1.4 Prediction decision** | If prediction stays: expose in release (e.g. from home or settings), fix "I can spend today" (compute and set `DailyBudgetResource`). If not: remove from release or clearly "coming soon." | No broken $0.00 or hidden-in-debug only. |

### Phase 2: 2027 — Everywhere, together

| Milestone | Deliverables | Success |
|-----------|--------------|--------|
| **2.1 Widget + Watch** | Home screen widget: "You can spend X today." Watch app (or complication): same number. | One number on home screen and wrist without opening app. |
| **2.2 Household as hero** | Shared budget: two users, one number (or one number per person from shared pool). Gated by premium. | "One number for you and your partner" is real. |
| **2.3 Sync (if not in 2026)** | Real sync: same data on all devices, gated by `shouldBeSynced`. | Premium = "everywhere" is true. |

### Phase 3: 2028 — True amount, intelligence, scale

| Milestone | Deliverables | Success |
|-----------|--------------|--------|
| **3.1 Open banking / auto "amount left"** | Read-only link to account(s) or aggregator; "amount left" auto-filled (with user consent). Number feels true without manual entry. | Friction on "amount left" drops; number is trusted. |
| **3.2 AI suggestions** | Light AI: e.g. "Your spending is usually higher on weekends" or suggested daily cap. Output remains one number. | Still one number; smarter inputs or guidance. |
| **3.3 B2B / white-label (optional)** | Employers, coaches, or banks offer "daily budget" under their brand. Same engine, different shell. | New revenue channel; product stays focused. |

---

## Part 4: Dependency order

```
Phase 0 (ship-blockers)
  → 1.1 (one number &lt;2 s)
  → 1.2 (one plan) + 1.3 (sync or honest copy) + 1.4 (prediction)
  → 2.1 (widget + watch)
  → 2.2 (household) [can parallel 2.1]
  → 2.3 (sync if deferred)
  → 3.1 (open banking)
  → 3.2 (AI) [depends on data from 3.1 or manual]
  → 3.3 (B2B)
```

---

## Part 5: What we're not doing (focus)

- **No "track every expense" as core.** Plan, don't ledger. Optional logging can support the number but isn't the product.
- **No ads in core path.** Optional rewarded for a secondary action is acceptable; never between user and the number.
- **No extra timeframes** until daily and weekly are perfect.
- **No gating the free number.** Premium = sync + household + everywhere; free = one number, instant, on one device.

---

## One-line vision (reminder)

**"How much can I spend today? Right, instant, everywhere. Pay when you want it everywhere and with someone else."**

This roadmap closes the gap between current state (working home, broken post-paywall and prediction, unused premium flags) and that vision.
