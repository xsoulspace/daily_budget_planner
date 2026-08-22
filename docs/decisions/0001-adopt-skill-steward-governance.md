---
status: accepted
date: 2026-08-23
decision-makers: Antonio (xsoulspace)
north_star_impact: applies
---

# 0001: Adopt Skill Steward and the governance lifecycle

## Context and Problem Statement

The repository accumulated product strategy docs (`PRD_next_phase.md`, roadmap, pillars) without a charter, ADR log, FAQ layer, or agent entrypoint map. Decisions lived in `docs/decisions.md` as informal tables, referenced deleted plan files. Agents had no legible contract for validation gates, evidence routing, or plan hygiene.

## Considered Options

- **A. Keep ad-hoc docs** — cheapest now; decisions stay scattered; every future structural change re-litigates context.
- **B. Adopt Skill Steward + governance lifecycle** — `steward.yaml` contract, `AGENTS.md` map, `docs/NORTH_STAR.mdx` charter, `docs/decisions/` ADRs, DESIGN/DX FAQs, evidence ledger.
- **C. Full harness adoption** (typed actions, probes, benchmarks) — premature; no repeated deterministic drift yet.

## Decision Outcome

Chosen option: **B**, because the repo is entering an architectural phase (projection engine) where durable decision records and a charter are prerequisites, while C stays deferred per "default to no harness".

Adopted surfaces:

- `steward.yaml` (archetype: app), `AGENTS.md`, `skills.json`
- Skills installed under `.agents/skills/`: repository-governance-lifecycle, repo-quality-system-lifecycle, skill-source-citations
- `docs/NORTH_STAR.mdx` charter
- `docs/decisions/` ADR log (this file is 0001)
- `docs/evidence/current-status.mdx` ledger

Native validation gate: `flutter analyze` (repo root) + `cd packages/mobile_app && flutter test` (7 tests, passing). Repo-root analyzer status is red (55 pre-existing errors, mostly missing generated `firebase_options.dart` and monetization package issues) — recorded honestly in the evidence ledger.

## Consequences

Good:

- Structural changes now route through North Star classification + ADR before code.
- Plan hygiene enforced: completed plans are extracted then deleted.
- Agents get one entrypoint map instead of doc archaeology.

Bad:

- Doc maintenance cost per change (small; bounded by FAQ brevity rules).
- Analyzer gate is currently failing; stewardship claims are limited until fixed or scoped.

Neutral:

- Harness actions/probes remain unadopted until a real repeated need appears.

## More Information

- [NORTH_STAR](../NORTH_STAR.mdx) · [ADR index](README.md) · evidence ledger at `docs/evidence/current-status.mdx`
