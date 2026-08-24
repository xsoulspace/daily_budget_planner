# HANDOFF — Flutter MCP Toolkit + User-Flow Debugging + Maestro E2E

> Temporary working notes. Delete after the remaining work lands (extract durable
> facts to docs/ADRs first, per AGENTS.md plan hygiene).

## Original task

1. Add Flutter MCP Toolkit (Arenukvern/mcp_flutter — NOT `dart mcp`)
2. Debug the entire app from the user's point of view
3. Add e2e tests with Maestro

## Environment facts (hard-won, reuse them)

- Flutter 3.47 beta, fvm. iOS sim: iPhone 17 Pro `959D5FE0-15B6-4A58-8276-899CF0AA8BF9` (booted).
- Bundle id: `dev.xsoulspace.dailyBudgetPlanner`. Default run target: `packages/mobile_app/lib/main_dev.dart`
  (root `lib/main.dart` does NOT init the toolkit).
- flutter-mcp-toolkit CLI v5.0.4 at `~/.local/bin` (upgraded via install.sh; was v3 → protocol mismatch).
- In-app package `mcp_toolkit: ^5.0.4` already integrated in `main_dev.dart` (v3-style
  `initialize()` / `initializeFlutterToolkit()` — works fine with v5 server).
- `.mcp.json` at repo root registers `flutter-mcp-toolkit-server` (stdio).
- CLI does not persist connections between `exec` calls → pass
  `{"connection":{"uri":"ws://127.0.0.1:<port>/<token>/ws"}}` on every command.
- iOS: `flutter run` probes a wrong cached VM port. Get the real URL from sim logs:
  `xcrun simctl spawn <udid> log show --last 5m --predicate 'eventMessage CONTAINS "listening on"'`
- Web (`-d chrome`) is the fastest loop; iOS sim needed for Maestro.
- Helper used for CLI calls: `/tmp/fmt.sh` (wraps `exec --name X --args Y`, prints ok/data).
- `wait_for` command exists: `{"predicate":{"kind":"text","text":"..."},"timeoutMs":10000}`
  — ALWAYS use it after taps; plain `semantic_snapshot` right after a tap returns stale UI.
- Web tap limitation: taps on nodes without `SemanticsAction.tap` fail
  (`web_gesture_not_supported`) — e.g. the Weekly `Tab` never received the tap via semantics.

## Bugs found & FIXED

### Bug 1 — Crash on iOS launch (Firebase)
`ios/Runner/GoogleService-Info.plist` was a placeholder (only BUNDLE_ID + PROJECT_ID).
Native FirebaseCore plugin auto-configures from it during plugin registration and throws
`invalid GOOGLE_APP_ID` BEFORE any Dart runs. Fix: removed the plist + its 4 references in
`ios/Runner.xcodeproj/project.pbxproj` (app intentionally runs without Firebase; Dart side
already guards with null firebaseOptions).
⚠️ STALE COPY REAPPEARS: `build/ios/iphonesimulator/Runner.app/GoogleService-Info.plist`
(timestamped old) survives incremental builds → `rm` it (or `flutter clean`) before
installing to the sim, else the crash returns.

### Bug 2 — Tasks could not be saved; onboarding step 2 "Next" dead (root cause)
`data_models.g.dart` `_$TaskToJson` emitted RAW enum instances for `status` and
`transactionType` → sembast: `Invalid argument: type TaskStatus not supported`
(wrapped in `LocalApiException` chains — extract real cause via
`evaluate_dart_expression` + `debugPrint` + `get_recent_logs`).
Mechanism: enums with a custom `factory fromJson` are handled by JsonHelper (not
EnumHelper); with `explicitToJson: false` its `serialize()` falls through to the bare
expression. Fix: `packages/mobile_app/build.yaml`:
```yaml
json_serializable:
  options:
    explicit_to_json: true
```
Regenerated (`rm -rf .dart_tool/build && flutter pub run build_runner build
--delete-conflicting-outputs` INSIDE packages/mobile_app; root-level runs skip the
package / cache says fresh). `data_models.g.dart` now emits `.toJson()`.
NOTE: do NOT add class-level `@JsonSerializable()` on freezed classes — it generates
empty conflicting `_$XToJson` stubs. `@JsonKey(fromJson:)` alone fixes decode only.
All 13 mobile_app tests pass; analyze has no new issues (52 pre-existing infos).

### Verified end-to-end on Chrome (via toolkit)
Full onboarding (balance 10000 → expenses 3000 → payday date) → Congratulations →
Home: Balance 10000, Extra Costs 3000, Next Budget Date 25.09.2026,
Daily Budget 212.12. No app errors.

## Bug 3 — TODO (IN PROGRESS): iOS stuck on splash/loading spinner
Sim log: `DailyBudgetStorageKernelBootstrap.initialize failed: FileSystemException:
Creation failed, path = './.us_daily_budget_planner' (OS Error: Read-only file system, errno = 30)`
Relative default `storageRootPath` in
`packages/mobile_app/lib/di/storage_kernel_bootstrap.dart:13` works on web/desktop,
fails in iOS sandbox. App hangs on PreloadingScreen (error is only debugPrinted).
**Fix plan:** resolve relative paths against `getApplicationSupportDirectory()`
(path_provider already a dep) inside `initialize()` / `_buildConfig()` when
`!kIsWeb && path.isRelative(...)`. Keep web behavior unchanged (web uses webLocalDb).
Then: rebuild (`flutter build ios --simulator --debug`), DELETE stale
GoogleService-Info.plist from the .app, `simctl install`, relaunch, verify it reaches
onboarding/home.

## Maestro e2e (drafted, not yet passing — blocked on Bug 3)
Files at repo root `maestro/`:
- `subflows/onboarding.yaml` — balance → expenses → date picker OK → congratulations → home
- `01_launch_onboarding.yaml` (clearState, extendedWaitUntil 60s for cold debug start)
- `02_home_tabs.yaml` (Weekly/Monthly tab switch; precondition: onboarding done once)
- `03_settings_navigation.yaml` (Settings popup → Terms → back → Privacy → back)
Run: `maestro test -e APP_ID=dev.xsoulspace.dailyBudgetPlanner maestro/01_launch_onboarding.yaml`
TODO after Bug 3 fix:
- [ ] Run 01 on iOS sim; adjust selectors if iOS date picker labels differ (Cupertino picker may not have "OK")
- [ ] Verify 02 (check real Weekly-view strings; `daysLeftInWeek` = "Days Left in week")
- [ ] Verify 03 (Terms screen title text — arb has no explicit title key; check `ui_other/terms_screen.dart`)
- [ ] Add Makefile targets (`make e2e`) and a short docs note; delete this file after
- [ ] Cleanup: remove `packages/mobile_app/lib/data_models/_gen_probe.dart` (debug probe),
      decide fate of placeholder `maestro/config.yaml`
- [ ] Optional: `steward evidence init --minimal` / record ADR for explicit_to_json decision
