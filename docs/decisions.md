# Product & technical decisions

Decisions that affect scope, UX, or implementation. Format: **Decision | Options | Choice | Rationale | Date.**

---

## Prediction (Phase 0 / next phase)

**Decision:** Ship prediction in release with a correct “I can spend today” value, or hide / “coming soon”?

| Option | Description                                                                                                                         |
| ------ | ----------------------------------------------------------------------------------------------------------------------------------- |
| **A**  | Fix: wire `DailyBudgetResource` from existing balance/period logic; expose “Expenses prediction” in release (Settings and/or Home). |
| **B**  | Hide: keep prediction behind `kDebugMode` or remove entry; optionally show “Planning — coming soon.”                                |

**Choice:** **A** (Fix)  
**Rationale:** Wire from existing balance/period logic in &lt;1 d; avoids shipping a broken $0.00 path and delivers core value.  
**Date:** 2025-03-12

## Sync and tag limit (Phase 0 / next phase)

**Decision:** Implement minimal sync and tag-limit enforcement, or only align premium copy?

| Option | Description                                                                                                         |
| ------ | ------------------------------------------------------------------------------------------------------------------- |
| **A**  | Implement: minimal sync (e.g. backup/restore) gated by `shouldBeSynced`; enforce `tagLimit` in UI where tags exist. |
| **B**  | Copy only: remove “sync” and “more tags” from paywall and premium copy; keep permissions in model for future use.   |

**Choice:** **B** (Copy only)  
**Rationale:** Align copy first; backlog minimal backup/restore and tag enforcement for next phase. No promise of sync/tags in paywall or premium copy.  
**Date:** 2025-03-12

**Copy audit (2025-03-12):** Grep of paywall, thanks screen, manage subscription, settings found no user-facing strings promising "sync," "all devices," or "more tags." Premium copy left as-is; no replacements required.

- [PRD next phase](PRD_next_phase.md)
- [Roadmap to vision](roadmap_to_vision_2026_2028.md)

> Pre-ADR provenance only. New decisions go to [docs/decisions/](decisions/README.md) as ADRs. The referenced plan files (`plan_to_start_next_phase.md`, `plan_next_phase.md`) were completed and removed after extracting durable truth.
