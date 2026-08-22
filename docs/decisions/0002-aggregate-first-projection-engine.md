---
status: accepted
date: 2026-08-23
decision-makers: Antonio (xsoulspace)
north_star_impact: amends
---

# 0002: Aggregate-first projection engine (commitments and planned sums as source of truth)

## Context and Problem Statement

Today's number is computed from a static snapshot: `(amount − expenses) / days to next budget`. The product carries two budget systems (SimpleBudget vs manual budgets for prediction) because it never decided whether the number comes from plans or from records. The strategy says "plan, don't ledger", but the data model still treats records as primary inputs. Long-term predictability (credits, subscriptions, inflation) cannot be built on record-level data.

## Considered Options

- **A. Keep record-first** — familiar budgeting-app model; contradicts "plan, don't ledger"; makes projections noisy; keeps two-systems debt.
- **B. Aggregate-first projection engine** — commitments (recurring obligations) + planned sums are primary; records become optional reconciliation evidence ("explain the delta"); trajectory extends the number across months with amortization, inflation, interest assumptions.
- **C. Hybrid without model change** — keep both systems, add forecasting on top — multiplies the existing two-model debt.

## Decision Outcome

Chosen option: **B**, because it is the faithful implementation of the product's own stated principle, resolves the two-budget-systems debt at the root, and is the only base on which long-term planning (Step: credits, inflation, interest), subscription management, and later AI/BYOK features can stand.

Core model:

- `Commitment` — recurring obligation: amount, cadence, start/end date, category (subscriptions, credit payments, rent).
- `PlannedSum` — per-period planned amount per bucket (editable single number, not records).
- Realized drift = actual vs plan; resolved by user via **Sum→Reason**: adjust the remaining sum in one action, or log a few records to explain it.
- Daily number formula evolves to: `(income − Σ commitments in horizon − planned sums)` adjusted by realized drift. Output still lands in `DailyBudgetResource`; Home contract unchanged.
- Planning layer (follow-up ADR when implemented): amortization schedules folded into commitments, one global inflation assumption applied to planned sums, optional interest on savings/debt.
- AI scope (follow-up ADR): BYOK-first reconciliation assistant and subscription intelligence; output remains one number; managed inference priced as usage packs, never a second subscription.

Migration: existing manual budgets map to `PlannedSum`; transactions persist but demote to reconciliation evidence; SimpleBudget vs manual-budget split retires into the single model.

## Consequences

Good:
- One data model instead of two "daily" concepts.
- Projections over aggregates have lower error variance than over records.
- Sync/household get easier: dozens of commitments sync instead of thousands of transactions.
- Premium value prop becomes honest and strong: projections + commitment management + everywhere/together.

Bad:
- Cold-start problem: new users have no commitments yet; mitigated by a 3-input setup (income, rent/subscriptions total, next salary date) producing a working number from defaults.
- Migration risk for existing local data; needs a versioned migration path before any release of the new model.
- Larger architectural change than incremental alternatives; must be sequenced before Phase 2 sync/household work.

Neutral:
- Widget/watch surfaces unaffected: they read the same `DailyBudgetResource`.

## Pros and Cons of the Options

- **A** — pro: no migration; con: permanently contradicts the strategy pillar and blocks 2028 milestones.
- **C** — pro: reversible; con: third budget concept added to two that already disagree.

## More Information

- UX interaction model (Sum→Reason, horizon view) documented in [DESIGN_FAQ](../DESIGN_FAQ.mdx).
- Sequencing lives in [roadmap_to_vision_2026_2028.md](../roadmap_to_vision_2026_2028.md) Phase 1.5.
