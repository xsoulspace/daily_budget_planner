# AGENTS.md — Agent Entrypoint Map

Welcome. This project uses **Skill Steward** to make repository purpose, validation, docs, and agent handoff legible.

## Operational Desk

Run the following commands to interact with the project's agentic tools:

- **Show operational map**: `steward map`
- **Inspect Steward contract**: `steward doctor --json`
- **Validate workspace**: use the native validation command recorded in `steward.yaml`

## North Star Impact

Before durable structural changes, classify `north_star_impact`: `none`, `applies`, `clarifies`, `sub_star`, `amends`, or `conflicts`.

- `none` / `applies`: use the native workflow and validation gate.
- `clarifies`: update the smallest FAQ, docs map, skill, check, or validation message.
- `sub_star`: declare the local parent/child boundary and what the sub-North Star cannot override.
- `amends` / `conflicts`: stop and write or update an ADR before changing the repo center.

Ask whether the change serves real product pain, which North Star value path it serves, and whether a mechanism is becoming the mission.

## Claims and Evidence

Before claiming readiness, maturity, harness support, steward status, or adoption:

1. Name the exact claim.
2. Check the weakest proof that supports only that claim.
3. Route the durable artifact:
   - ADR for durable decisions and trade-offs.
   - FAQ/docs for standing why/how guidance.
   - Check/tool/test for repeated deterministic drift.
   - Current ledger for the weakest true current status.
   - Evidence for real proof or blocked proof.
   - Delete completed plans after extracting durable truth.
4. Record non-claims.

If the same friction loops twice, stop before making another packet. Name the pain signal, owner, native validation gate, smallest disposition, rerun route, and non-claims; then fix the owner, move repeated drift to a check/tool/skill/current ledger, leave the path native, or stop.

If this repo needs a current claim ledger, run `steward evidence init --minimal`.
Default to no harness: do not add actions, probes, benchmarks, or scenarios unless typed actions, probes, or benchmarks help real repo work.
Use `steward.yaml` and harness proof only when typed actions, probes, or benchmarks help real repo work.

## Documentation Router

| Need                                | Go to                                                                      |
| ----------------------------------- | -------------------------------------------------------------------------- |
| Docs map (find any doc)             | [docs/start_here/docs_map.mdx](docs/start_here/docs_map.mdx)               |
| Repo purpose, ownership, boundaries | [docs/NORTH_STAR.mdx](docs/NORTH_STAR.mdx)                                 |
| Why it's built this way             | [docs/DESIGN_FAQ.mdx](docs/DESIGN_FAQ.mdx)                                 |
| How to work in this repo            | [docs/DX_FAQ.mdx](docs/DX_FAQ.mdx)                                         |
| Decisions (ADRs)                    | [docs/decisions/README.md](docs/decisions/README.md)                       |
| Strategy pillars                    | [docs/strategy_pillars_2026_2028.md](docs/strategy_pillars_2026_2028.md)   |
| Roadmap / phases                    | [docs/roadmap_to_vision_2026_2028.md](docs/roadmap_to_vision_2026_2028.md) |
| Current claims / evidence           | [docs/evidence/current-status.mdx](docs/evidence/current-status.mdx)       |

## Non-negotiables

- Validate before PR: `cd packages/mobile_app && flutter test` passes; `flutter analyze` clean on touched files.
- Decisions with trade-offs → ADR in `docs/decisions/` before code.
- Plan hygiene: extract durable truth, then delete plan files.
- No secrets, tokens, or private URLs in docs or ADRs.
- No unimplemented features claimed in user-facing copy.

## Active Skills

Skills are installed locally under `.agents/skills/`. You can view them using:

- `steward list`

For more information on the project charter and decisions:

- Read [NORTH_STAR.mdx](docs/NORTH_STAR.mdx) (if present)
- Read [ADR Index](docs/decisions/README) (if present)
