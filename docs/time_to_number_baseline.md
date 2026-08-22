# Time-to-number baseline (Phase 0)

**Purpose:** Measure and document time from cold app start until the daily number is visible on home.  
**Target:** p95 &lt; 2 s (PRD P0-2, P1-1).  
**Reference:** [PRD next phase](PRD_next_phase.md).

---

## How to measure

1. Kill the app completely (no background process).
2. Cold start the app (tap icon or run from IDE).
3. Start a stopwatch at launch; stop when the daily number is visible on the home screen.
4. Run on at least one iOS and one Android device (or simulator).
5. Record p50 and p95 (e.g. 5–10 runs per platform).

---

## Baseline (to be filled)

| Platform | p50 (s) | p95 (s) | Date | Notes |
| -------- | ------- | ------- | ---- | ----- |
| iOS      | —       | —       | —    |       |
| Android  | —       | —       | —    |       |

If p95 &gt; 2 s: add a short “optimize cold start” backlog item with the measured number.

---

## Instrumentation (optional)

To add automated measurement: in the path from `PreloadingScreen` → Home, use `WidgetsBinding.instance.addPostFrameCallback` and record a timestamp when the widget that displays the daily number has built; subtract from a timestamp taken at app start (e.g. in `main` or first frame).
