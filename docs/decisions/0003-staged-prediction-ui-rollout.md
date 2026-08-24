---
status: accepted
date: 2026-08-24
decision-makers: Antonio (xsoulspace)
north_star_impact: applies
---

# 0003: Staged discovery-ladder rollout for the prediction UI

## Context and Problem Statement

The prediction/planning UI (`ui_prediction/`, ~5k lines) is a new product surface
hidden behind debug-only gating. Its only entry point is a text row in the
settings popup; it bypasses `router.dart` (raw `Navigator.push`), contains dead
V1 code, and lands users mid-WIP with untranslated strings. Shipping it as a
big-bang switch would shock existing users; leaving it hidden makes it
undiscoverable and unmeasured.

How do we integrate a large new UI surface into the main app so existing users
are not shocked and new parts are discovered gradually?

## Considered Options

- **A. Big-bang switch** — replace home surface in one release. Fastest, but
  jarring for existing users and unrevertable without a store release.
- **B. Keep hidden under settings/debug** — zero risk, but no feedback loop,
  no analytics, dead code accumulates.
- **C. Staged "discovery ladder"** — flag-gated single doorway → guided first
  contact (SimpleSteps intro) → dismissible teaser card on Home → promotion to
  permanent surface based on engagement data.

## Decision Outcome

Chosen option: **C**, because it gives a revertable, measurable path: each
stage can be paused or rolled back via a runtime flag, and promotion decisions
are driven by analytics (`prediction_opened`, `teaser_dismissed`,
`steps_completed`) rather than guesses.

Stages:

1. **Phase 0 — shippable core**: register route (`ScreenPaths.prediction`) in
   `router.dart`; remove dead V1 code paths from the entry.
2. **Phase 1 — flag-gated entry**: runtime feature flag persisted in
   `AppSettingsModel` (default seeded by a compile-time `Envs` constant).
   Single doorway: the existing settings tile dispatches on the flag. Never
   two competing entries.
3. **Phase 2 — guided first contact**: on first open of the new UI, show the
   existing `SimpleStepsFlow` as a short intro; reuse familiar anchors
   (header sums, transaction editors, ui_kit components).
4. **Phase 3 — progressive discovery**: dismissible teaser card on HomeScreen
   deep-linking into prediction, with re-show cooldown after dismissal;
   instrumented with analytics events.
5. **Phase 4 — promotion & cleanup**: promote to permanent home element per
   engagement data; delete the flag, V1 remnants, debug gates.

## Consequences

Good:

- Users meet the new surface through one familiar entry, then opt into more.
- Runtime flag allows remote-revertable control without a store release.
- Analytics give evidence for the promotion decision (Phase 4).

Bad / trade-offs:

- Temporary flag + old/new dispatch code lives in the codebase until Phase 4.
- V2 remains WIP during early phases; entry stays gated until it is shippable.

Non-claims: this ADR does not claim the prediction UI is feature-complete,
localized, or promoted; current status is tracked in
`docs/evidence/current-status.mdx`.
