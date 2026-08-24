---
status: accepted
date: 2026-08-24
decision-makers: Antonio (xsoulspace)
north_star_impact: amends
---

# 0004: Prediction screen becomes the main deep surface; Home becomes fast tools

## Context and Problem Statement

Today's Home (Monthly/Weekly tabs) answers "how much can I spend today?" with
fast inputs only. The prediction screen (`ui_prediction/`) holds continuity and
depth — commitments, planned sums, period reasoning ("why this sum"), timeline
— but is a secondary surface. The product vision (North Star value paths 3,
strategy pillar 1) requires one number that extends into an honest trajectory.
Two surfaces computing two different daily numbers (Home: $10.53; prediction:
$0.00 on fresh install) violates the "True" value path.

Decision needed: which surface is primary, and how do fast vs deep relate?

## Considered Options

- **A. Keep two parallel surfaces** — status quo. Two numbers, split identity,
  violates "one number".
- **B. Prediction becomes THE main screen; old Home breaks into fast tools**
  (calculator model: quick ops up front, depth behind). Migration risk exists
  but direction is singular.
- **C. Merge everything into prediction immediately** — big-bang; contradicts
  ADR-0003's staged rollout.

## Decision Outcome

Chosen option: **B**, executed through ADR-0003's discovery ladder rather than
a flag flip.

The interaction model:

- **Fast layer** (today's Home): add amount → see today's number instantly.
  Zero required depth. This stays free and stays <2 s.
- **Deep layer** (prediction screen): same simplicity at entry ("add current
  budget — see what will happen") plus continuity and depth: commitments,
  planned sums, per-period reasoning ("why this sum as such"), which improve
  predictions over time.
- **Complex tools** (categories, graphs, transaction tables): built inside the
  deep layer as progressive disclosures; several exist in early form.

Consequences:

- The daily number must be **single-sourced**. Until the projection engine owns
  it fully (ADR-0002 milestone 1.5.1), the prediction calculation falls back to
  the simple budget when no manual budgets exist, so both surfaces show the
  same number from day one.
- Home's fast inputs remain canonical *inputs*; prediction renders the
  trajectory from those inputs plus added depth.
- North Star amendment: the "owned" list gains an explicit two-layer
  interaction contract (fast tools + deep planning surface). This does not
  change what the repository owns; it clarifies how the number's surfaces are
  organized.

Non-claims: this ADR does not claim the prediction screen is complete, that
categories/graphs are shipped, or that Home has been decomposed into tool
widgets yet. Current state lives in `docs/evidence/current-status.mdx`.
