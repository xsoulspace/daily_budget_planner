## User

hi. i think we need to improve quality of UI/UX - we have hidden surface of new ui hidden under debug in settings, analyse how to correctly integrate it into main app, so user wot be shocked, and discoveered new parts gradually

## Assistant

Hi! Great instinct — shipping a UI overhaul as a big-bang switch can be jarring. Let me first explore the codebase to understand what's there: the hidden surface, the current settings/debug gating, and how the app is structured.

**Tool Call: bash**
Status: Completed

Terminal:

```
AGENTS.md
CHANGELOG.md
CODE_OF_CONDUCT.md
HANDOFF.md
LICENSE
Makefile
PRIVACY_POLICY.md
README.md
TERMS_AND_CONDITIONS.md
analysis_options.yaml
android
assets
build
configs
devtools_options.yaml
docs
docs.yaml
ideas
ios
lib
linux
macos
maestro
melos.yaml
packages
pubspec.lock
pubspec.yaml
skills.json
snap
steward.yaml
tool
web
common_imports.dart
core
data_commands
data_local_api
data_models
data_resources
data_states
debug_dump_render_tree.json
di
envs.dart
get_root_widget.json
main_dev.dart
mobile_app.dart
router.dart
ui_account
ui_home
ui_kit
ui_other
ui_pay
ui_prediction
ui_root

```

**Tool Call: root_search**
Status: Completed

No workspace roots registered. Ask the user to run /root add <path>.

**Tool Call: bash**
Status: Completed

Terminal:

```
---
packages/mobile_app/lib/router.dart
packages/mobile_app/lib/di/storage_kernel_bootstrap.dart
packages/mobile_app/lib/ui_pay/waiting_pay_confirmation_screen.dart
packages/mobile_app/lib/ui_pay/monetization_products.dart
packages/mobile_app/lib/ui_pay/paywall_flow.dart
packages/mobile_app/lib/ui_home/settings/settings_bottom_dialog.dart
packages/mobile_app/lib/ui_home/hooks/use_tab_controller_listener.dart
packages/mobile_app/lib/ui_prediction/ui_prediction_desktop_screen.dart
packages/mobile_app/lib/ui_prediction/ui_prediction_screen.dart
packages/mobile_app/lib/ui_prediction/transaction_editor_fields/currency_field.dart
packages/mobile_app/lib/ui_root/app_scaffold.dart

```

## User

contiue

**Tool Call: bash**
Status: Completed

Terminal:

```
lib/ui_home/settings/settings_bottom_dialog.dart:96:            if (kDebugMode) ...[
lib/router.dart:24:  debugLogDiagnostics: true,
lib/router.dart:87:  debugPrint('Navigate to: ${state.uri}');



```

**Tool Call: read**
Status: Completed

import 'package:flutter/foundation.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/hooks/use_monetization_type.dart';
import 'package:mobile_app/ui_home/settings/language_bottom_sheet.dart';
import 'package:mobile_app/ui_home/settings/ui_theme_mode_tile.dart';

class SettingsBottomPopup extends StatelessWidget {
const SettingsBottomPopup({
required this.onClose,
super.key,
});
final VoidCallback onClose;
@override
Widget build(final BuildContext context) => UiPopupDecoration(
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
UiPopupListTile(
onTap: () async => AppPathsController.of(context).toTerms(),
title: LocalizedMap(
{
languages.en: 'Terms of use',
languages.it: 'Condizioni di utilizzo',
languages.ru: 'Условия использования',
},
).getValue(useLocale(context)),
iconData: CupertinoIcons.doc_plaintext,
),
const UiDivider.size1(),
UiPopupListTile(
onTap: () async => AppPathsController.of(context).toPrivacy(),
title: LocalizedMap(
{
languages.en: 'Privacy policy',
languages.it: 'Condizioni di utilizzo',
languages.ru: 'Приватность',
},
).getValue(useLocale(context)),
iconData: Icons.privacy_tip_outlined,
),
const UiDivider.size1(),
UiPopupListTile(
iconData: Icons.money,
onTap: () async {
unawaited(UiPredictionScreen.show(context));
onClose();
},
title: LocalizedMap(
{
languages.en: 'Expenses prediction',
languages.it: 'Previsione delle spese',
languages.ru: 'Предположение о расходах',
},
).getValue(useLocale(context)),
),
const UiDivider.size1(),
const UiDivider.size5(),
if (context.watch<StoreReviewRequester>().isAvailable) ...[
UiLoader(
builder: (final context, final isLoading, final setLoading) =>
UiPopupListTile(
isLoading: isLoading,
onTap: () async {
setLoading(true);
await context
.read<StoreReviewRequester>()
.requestReview(context: context);
setLoading(false);
},
title: LocalizedMap(
{
languages.en: 'Leave Review',
languages.it: 'Lascia un feedback',
languages.ru: 'Оставить отзыв',
},
).getValue(useLocale(context)),
iconData: Icons.rate_review_outlined,
),
),
const UiDivider.size1(),
],
if (Envs.isWiredashAvailable) ...[
UiPopupListTile(
onTap: () async => UserFeedback.show(context),
title: LocalizedMap(
{
languages.en: 'Support & Suggest',
languages.it: 'Supporto & Suggerimenti',
languages.ru: 'Помощь и предложения',
},
).getValue(useLocale(context)),
iconData: CupertinoIcons.question_circle,
),
const UiDivider.size5(),
],
if (kDebugMode) ...[
const UiThemeModeTile(),
const UiDivider.size1(),
],
if (useIsSubscriptionMonetization(context)
.isSubscriptionMonetization) ...[
UiPopupListTile(
onTap: () async =>
AppPathsController.of(context).toManageSubscription(),
title: LocalizedMap(
{
languages.en: 'Manage subscription',
languages.it: 'Gestisci abbonamento',
languages.ru: 'Управление подпиской',
},
).getValue(useLocale(context)),
iconData: CupertinoIcons.star,
),
const UiDivider.size1(),
],
UiPopupListTile(
onTap: () async => AppPathsController.of(context).toExplanation(),
title: LocalizedMap(
{
languages.en: 'How to use?',
languages.it: 'Come usarlo?',
languages.ru: 'Как пользоваться?',
},
).getValue(useLocale(context)),
iconData: CupertinoIcons.wand_stars,
),
const UiDivider.size1(),
UiPopupListTile(
onTap: () {
onClose();
unawaited(showLanguageBottomSheet(context));
},
title: context.s.language,
iconData: Icons.language,
),
],
)
.animate()
.slideY(
begin: 0.1,
duration: 200.milliseconds,
curve: Curves.easeOutExpo,
)
.scale(
begin: const Offset(0.95, 0.95),
duration: 200.milliseconds,
curve: Curves.easeOutExpo,
),
);
}

class PopupHandle extends StatelessWidget {
const PopupHandle({super.key});

@override
Widget build(final BuildContext context) => Container(
margin: const EdgeInsets.symmetric(vertical: 8),
width: 36,
height: 4,
decoration: BoxDecoration(
color: context.colorScheme.onSurface.withOpacity(0.2),
borderRadius: BorderRadius.circular(2),
),
);
}

**Tool Call: bash**
Status: Completed

Terminal:

```
lib/ui_home:
home.dart
home_screen.dart
hooks
method_explanation_screen.dart
monthly
settings
weekly
widgets

lib/ui_root:
README.md
app_scaffold.dart
bootstrap.dart
ui_root.dart
===
lib/data_models/task_model.dart
lib/di/dependency_injector.dart
lib/di/storage_kernel_bootstrap.dart
lib/router.dart
lib/ui_home/hooks/use_tab_controller_listener.dart
lib/ui_home/settings/settings_bottom_dialog.dart
lib/ui_kit/atoms/ui_base_button.dart
lib/ui_kit/atoms/ui_language_switcher_menu.dart
lib/ui_pay/monetization_products.dart
lib/ui_pay/paywall_flow.dart
lib/ui_pay/waiting_pay_confirmation_screen.dart
lib/ui_pay/widgets/subscription_actions.dart
lib/ui_prediction/transaction_editor_fields/currency_field.dart
lib/ui_prediction/ui_prediction_screen.dart
lib/ui_root/app_scaffold.dart

```

**Tool Call: bash**
Status: Completed

Terminal:

```
lib/ui_root/app_scaffold.dart:75:      themeMode: kDebugMode ? themeMode : ThemeMode.light,
lib/ui_root/app_scaffold.dart:76:      debugShowCheckedModeBanner: false,
lib/ui_home/hooks/use_tab_controller_listener.dart:10:        debugLabel: 'TabControllerListenerState',
lib/router.dart:24:  debugLogDiagnostics: true,
lib/router.dart:87:  debugPrint('Navigate to: ${state.uri}');

```

**Tool Call: bash**
Status: Completed

Terminal:

```
ideas
mobile_app
ui_locale
xsoulspace_analytics
===

```

**Tool Call: bash**
Status: Completed

Terminal:

```
gen
main.dart
main_prod.dart
===
packages/mobile_app/lib/ui_pay/monetization_products.dart:34:      kDebugMode ? subscriptions : subscriptionsForProduction;
packages/mobile_app/lib/ui_home/settings/settings_bottom_dialog.dart:96:            if (kDebugMode) ...[
packages/mobile_app/lib/ui_prediction/ui_prediction_screen.dart:332:        if (kDebugMode) ...[_TrendIndicator(), const Gap(6)],
packages/mobile_app/lib/ui_prediction/ui_prediction_screen.dart:376:                  if (kDebugMode) ...[_TrendIndicator(), const Gap(6)],
packages/mobile_app/lib/ui_root/app_scaffold.dart:75:      themeMode: kDebugMode ? themeMode : ThemeMode.light,

```

**Tool Call: bash**
Status: Completed

Terminal:

```
===
1af3505 wip: storage
f9a9048 wip: assets
75de8d2 wip: navigation
666ac98 wip: testing
69ff099 wip: testing
f367973 wip: budget
c472814 wip: budget planner
93fdb38 feat: skill steward
===
app_structure.md

```

**Tool Call: bash**
Status: Completed

Terminal:

```
packages/mobile_app/lib/di/storage_kernel_bootstrap.dart:108:      debugPrint(
packages/mobile_app/lib/di/storage_kernel_bootstrap.dart:159:      debugPrint(
===ui_root README===
The difference between 'app' and 'root' scopes in the time of its initialization.

The 'root' scope of the application is after splash screen and before MaterialApp is initialized.

The 'app' scope is inside of the MaterialApp.

```

**Tool Call: bash**
Status: Completed

Terminal:

````
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
````

Regenerated (`rm -rf .dart_tool/build && flutter pub run build_runner build
--delete-conflicting-outputs` INSIDE packages/mobile_app; root-level runs skip the
package / cache says fresh). `data_models.g.dart` now emits `.toJson()`.
NOTE: do NOT add class-level `@JsonSerializable()` on freezed classes — it generates
===theme tile===
import 'package:mobile_app/common_imports.dart';

/// A list tile that allows switching between system, light, and dark themes
class UiThemeModeTile extends StatelessWidget {
const UiThemeModeTile({super.key});

@override
Widget build(final BuildContext context) {
final themeMode = context.select<AppSettingsNotifier, ThemeMode>(
(final c) => c.value.brightness.themeMode,
);
final locale = useLocale(context);

    return ListTile(
      title: Text(
        LocalizedMap(
        {
            languages.en: 'Theme',
            languages.it: 'Tema',
            languages.ru: 'Тема',
          },
        ).getValue(locale),
      ),
      subtitle: Text(_getThemeModeText(themeMode, locale)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ThemeModeIcon(
            currentThemeMode: themeMode,
            icon: CupertinoIcons.circle_lefthalf_fill,
            themeMode: ThemeMode.system,
            onTap: _updateThemeMode,
          ),
          const Gap(8),
          _ThemeModeIcon(
            currentThemeMode: themeMode,
            icon: CupertinoIcons.sun_max_fill,
            themeMode: ThemeMode.light,
            onTap: _updateThemeMode,
          ),

```


**Tool Call: bash**
Status: Completed

Terminal:
```

- 0.3-exp
  main
  remotes/origin/0.3-exp
  remotes/origin/HEAD -> origin/main
  remotes/origin/gh-pages
  remotes/origin/main
  remotes/origin/release/web
  \===
  packages/mobile_app/lib/ui_home/monthly:
  monthly_notifier.dart
  monthly_view.dart

packages/mobile_app/lib/ui_home/weekly:
weekly_notifier.dart
weekly_view.dart
===

packages/mobile_app/lib/router.dart:6:enum ScreenPaths {
packages/mobile_app/lib/router.dart:17: const ScreenPaths(this.value);
packages/mobile_app/lib/router.dart:23: initialLocation: ScreenPaths.root.value,
packages/mobile_app/lib/router.dart:27: ScreenPaths.root.value,
packages/mobile_app/lib/router.dart:29: (final context, final state) => const PreloadingScreen(),
packages/mobile_app/lib/router.dart:32: ScreenPaths.home.value,
packages/mobile_app/lib/router.dart:34: (final context, final state) => const HomeScreen(),
packages/mobile_app/lib/router.dart:37: ScreenPaths.paywall.value,
packages/mobile_app/lib/router.dart:38: (final context, final state) => const PaywallScreen(),
packages/mobile_app/lib/router.dart:41: ScreenPaths.explanation.value,
packages/mobile_app/lib/router.dart:42: (final context, final state) => MethodExplanationScreen(
packages/mobile_app/lib/router.dart:48: ScreenPaths.manageSubscription.value,
packages/mobile_app/lib/router.dart:49: (final context, final state) => const ManageSubscriptionScreen(),
packages/mobile_app/lib/router.dart:52: ScreenPaths.privacy.value,
packages/mobile_app/lib/router.dart:53: (final context, final state) => const PrivacyScreen(),
packages/mobile_app/lib/router.dart:56: ScreenPaths.terms.value,
packages/mobile_app/lib/router.dart:57: (final context, final state) => const TermsScreen(),
packages/mobile_app/lib/router.dart:60: ScreenPaths.thanksForSubscribing.value,
packages/mobile_app/lib/router.dart:62: const ThanksForSubscribingScreen(),
packages/mobile_app/lib/router.dart:65: ScreenPaths.waitingPayConfirmation.value,
packages/mobile_app/lib/router.dart:67: const WaitingPayConfirmationScreen(),
packages/mobile_app/lib/router.dart:83: if (appStatus == AppStatus.loading && location != ScreenPaths.root.value) {
packages/mobile_app/lib/router.dart:84: return ScreenPaths.root.value;
packages/mobile_app/lib/router.dart:92:class AppPathsController {
packages/mobile_app/lib/router.dart:95: final _homeRoutes = [ScreenPaths.home];
packages/mobile_app/lib/router.dart:96: void toRoot() => go(ScreenPaths.root);
packages/mobile_app/lib/router.dart:97: void toHome() => go(ScreenPaths.home);
packages/mobile_app/lib/router.dart:98: void toPrivacy() => go(ScreenPaths.privacy, routes: _homeRoutes);
packages/mobile_app/lib/router.dart:99: void toTerms() => go(ScreenPaths.terms, routes: _homeRoutes);
packages/mobile_app/lib/router.dart:100: void toPaywall() => go(ScreenPaths.paywall, routes: _homeRoutes);

```


**Tool Call: bash**
Status: Completed

Terminal:
```

# Flutter Project Structure Guide

## Directory Organization

### Core Layers

- `data_models/` - Domain entities and data structures
- `data_states/` - State management and business logic
- `data_services/` - Service layer implementations
- `data_local_api/` - Local storage and API implementations
- `core/` - Core utilities and shared functionality

### UI Layers

- `ui_kit/` - Reusable UI components and design system
- `ui_*` directories - Feature-specific UI implementations
  - Each feature module is isolated in its own directory
  - Example: `ui_home/`, `ui_account/`, `ui_prediction/`

### Application Layer

- `di/` - Dependency injection and service locator
- `router.dart` - Navigation and routing configuration
- `common_imports.dart` - Shared imports and constants
- `envs.dart` - Environment configuration
- `main_*.dart` - Entry points for different environments

## Best Practices

1. **Feature Isolation**

   - Keep feature-specific code within its UI directory
   - Maintain clear boundaries between features

2. **Data Flow**

   ```
   UI Layer → States → Services → Local/Remote API
   ```

3. **File Naming**

   - Prefix files with their layer: `ui_`, `data_`, etc.
   - Use descriptive suffixes: `_screen`, `_widget`, `_state`

4. **Directory Structure**

   ```
   feature/
   ├── widgets/
   ├── screens/
   └── states/
   ```

5. **State Management**

   - Keep states in `data_states/`
   - Use notifiers/blocs for complex state
   - Local states stay in feature directories

6. **Dependencies**
   - Register services in `di/`
   - Configure environments in `envs.dart`
   - Share common imports via `common_imports.dart`

## Development Guidelines

1. **New Features**

   - Create new directory under `ui_*`
   - Add routes to `router.dart`
   - Register dependencies in `di/`

2. **Data Layer**

   - Models in `data_models/`
   - Business logic in `data_states/`
   - API calls in `data_services/`

3. **UI Components**
   \===
   108
   import 'package:flutter_portal/flutter_portal.dart';
   import 'package:mobile_app/common_imports.dart';
   import 'package:mobile_app/ui_home/monthly/monthly_view.dart';
   import 'package:mobile_app/ui_home/settings/settings_icon_button.dart';
   import 'package:mobile_app/ui_home/weekly/weekly_view.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
Widget build(final BuildContext context) => DefaultTabController(
length: 2,
child: _HomeScreenProvider(
builder: (final context) => const HomeScreenBody(),
),
);
}

class _HomeScreenProvider extends StatelessWidget {
const _HomeScreenProvider({
required this.builder,
});
final WidgetBuilder builder;
@override
Widget build(final BuildContext context) => Portal(
child: Builder(builder: builder),
);
}

class HomeScreenBody extends StatelessWidget {
const HomeScreenBody({super.key});

@override
Widget build(final BuildContext context) => PopScope(
canPop: false,
child: Scaffold(
body: Column(
children: [
const UiSafeArea.top(),
const Expanded(
child: Padding(
padding: EdgeInsets.only(left: 18, right: 18),
child: TabBarView(
children: [
MonthlyView(),
WeeklyView(),
],
),
),
),
ConstrainedBox(
constraints: const BoxConstraints(maxWidth: 350),
child: Row(
children: [
Expanded(

```


## User

see
[Context] file:///Users/antonio/xs/storage_problem/daily_budget_planner/packages/mobile_app/lib/ui_prediction/

**Tool Call: bash**
Status: Completed

Terminal:
```

./simple_steps/simple_steps.dart
./tasks/tasks.dart
./tasks/ui_general_tasks_view.dart
./tasks/ui_task_editor.dart
./tasks/ui_tasks_actions.dart
./tasks/ui_tasks_actions_bar.dart
./tasks/ui_tasks_view.dart
./timeline/state/ui_prediction_timeline_notifier.dart
./timeline/state/ui_prediction_timeline_notifier.freezed.dart
./timeline/state/ui_prediction_timeline_params.dart
./timeline/timeline.dart
./timeline/ui_horizontal_prediction_timeline.dart
./timeline/ui_vertical_prediction_timeline.dart
./transaction_editor_fields/coin_price_field.dart
./transaction_editor_fields/currency_field.dart
./transaction_editor_fields/currency_type_field.dart
./transaction_editor_fields/datetime_field.dart
./transaction_editor_fields/schedule_period_switcher.dart
./transaction_editor_fields/task_id_field.dart
./transaction_editor_fields/transaction_amount_field.dart
./transaction_editor_fields/transaction_editor_fields.dart
./transaction_editor_fields/transaction_name_field.dart
./transaction_editor_fields/transaction_note_field.dart
./transaction_editor_fields/transaction_type_field.dart
./transactions/ui_expenses_view.dart
./transactions/ui_incomes_view.dart
./transactions/ui_transaction_editor.dart
./transactions/ui_transaction_editor_state.dart
./transactions/ui_transactions_actions_bar.dart
./transactions/ui_transactions_table.dart
./ui_bookmark.dart
./ui_prediction.dart
./ui_prediction_desktop_screen.dart
./ui_prediction_screen.dart
./upsert_budget_dialog.dart
./wip/expenses_prediction_graph.dart
./wip/expenses_prediction_service.dart
===

      40 ./transaction_editor_fields/coin_price_field.dart
      29 ./transaction_editor_fields/schedule_period_switcher.dart
      10 ./transaction_editor_fields/transaction_editor_fields.dart
      24 ./transaction_editor_fields/transaction_note_field.dart
    5012 total

```


**Tool Call: bash**
Status: Completed

Terminal:
```

// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_desktop_screen.dart';
import 'package:mobile_app/ui_prediction/upsert_budget_dialog.dart';

class UiPredictionScreen extends StatelessWidget {
const UiPredictionScreen({super.key});

static Future<void> show(final BuildContext context) => Navigator.push(
context,
MaterialPageRoute(
builder: (final _) {
// return const UiPredictionScreen();
return const UiPredictionScreenV2();
},
),
);

@override
Widget build(final BuildContext context) => UiScaffold(
body: LayoutBuilder(
builder: (final context, final constraints) {
final isDesktop = UiLayout.fromConstraints(constraints).isDesktop;

        if (isDesktop) {
          return const Column(
            children: [
              _PredictionHeader(),
              Expanded(child: DesktopPredictionBody()),
              UiPredictionBottomActionBar(),
            ],
          );
        } else {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  const PinnedHeaderSliver(child: _PredictionHeader()),
                  const SliverGap(48),
                  const MobilePredictionBody().toSliver(),
                  const SliverGap(64),
                  const UiSafeArea.bottom().toSliver(),
                ],
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: UiPredictionBottomActionBar(),
              ),
            ],
          );
        }
      },
    ),

);
}

class _PredictionHeader extends StatelessWidget {
const _PredictionHeader();

@override
Widget build(final BuildContext context) {
final locale = useLocale(context);
final selectedDate = useSelectionDate(context);
final configPeriodSelector = useConfigPeriodSelector(context: context);
return DecoratedBox(
decoration: BoxDecoration(
color: context.colorScheme.surface.withOpacity(0.5),
borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
border: Border.all(
color: context.colorScheme.onSurface.withOpacity(0.2),
),
),
child: Column(
children: [
const UiSafeArea.top(),
const Gap(12),
Container(
padding: const EdgeInsets.symmetric(horizontal: 8),
child: Row(
spacing: 6,
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Gap(6),
PeriodSelectorButton(
period: configPeriodSelector.period,
onPeriodSelected: configPeriodSelector.onPeriodSelected,
),
const Spacer(),
Builder(
builder: (final context) {
final plannedExpensesSum = context
.select<PlannedSumResource, double>(
(final state) => state.expensesSum,
);

                    return _HeaderItem(
                      onPressed: () async =>
                          showExpensesTasksView(context: context),
                      title: LocalizedMap({
                        // TODO(arenukvern): add localization l10n
                        languages.en: 'regular expenses',
                        languages.it: 'spese regolari',
                        languages.ru: 'регулярные расходы',
                      }).getValue(locale),
                      value: '\$${plannedExpensesSum.toStringAsFixed(2)}',
                      icon: Icons.arrow_drop_down_rounded,
                    );
                  },
                ),
                Builder(
                  builder: (final context) {
                    final plannedIncomesSum = context
                        .select<PlannedSumResource, double>(
                          (final state) => state.incomesSum,

```


**Tool Call: bash**
Status: Completed

Terminal:
```

./tasks/ui_general_tasks_view.dart:32: this.currencyType = Envs.kDefaultCurrencyType,
./ui_prediction_desktop_screen.dart:5:class UiPredictionScreenV2 extends StatelessWidget {
./ui_prediction_desktop_screen.dart:6: const UiPredictionScreenV2({super.key});
./transactions/ui_transaction_editor.dart:14: this.isCurrencyChoosable = Envs.isCryptoEnabled,
./transactions/ui_transaction_editor.dart:204: if (Envs.isCurrencySwitchingEnabled) ...[
./transactions/ui_transactions_actions_bar.dart:15: .getDefaultCurrencyId(Envs.kDefaultCurrencyType);
./transactions/ui_transactions_actions_bar.dart:27: currencyType: Envs.kDefaultCurrencyType,
./ui_prediction_screen.dart:18: return const UiPredictionScreenV2();
./ui_prediction_screen.dart:332: if (kDebugMode) ...[_TrendIndicator(), const Gap(6)],
./ui_prediction_screen.dart:376: if (kDebugMode) ...[_TrendIndicator(), const Gap(6)],
./transaction_editor_fields/transaction_amount_field.dart:40: if (!Envs.isCurrencySwitchingEnabled) {
===

       7 ui_prediction.dart
     117 ui_bookmark.dart
     124 total

```


**Tool Call: read**
Status: Completed

import 'package:flutter/cupertino.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_kit/molecules/ui_modal_sheet_route.dart';

void showEditActionsSheet(final BuildContext context) {
  unawaited(
    Navigator.of(context, rootNavigator: true).push(
      UiModalSheetRoute<void>(
        builder: (final context) => const EditActionsSheet(),
      ),
    ),
  );
}

class EditActionsSheet extends StatelessWidget {
  const EditActionsSheet({super.key});

  @override
  Widget build(final BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Edit Actions'),
        trailing: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Done'),
        ),
      ),
      child: const _ActionList(),
    ),
  );
}

class _ActionList extends StatelessWidget {
  const _ActionList();

  @override
  Widget build(final BuildContext context) => ListView(
    children: const [
      SizedBox(height: 16),
      _ActionListSection(
        header: Text('Favorites'),
        children: [
          _ActionListItem(title: 'Copy', isFavorite: true),
          _ActionListItem(title: 'Save in Keep', isFavorite: true),
        ],
      ),
      SizedBox(height: 16),
      _ActionListSection(
        header: Text('Safari'),
        children: [
          _ActionListItem(title: 'Add to Reading List'),
          _ActionListItem(title: 'Add Bookmark'),
          _ActionListItem(title: 'Add to Favorites'),
          _ActionListItem(title: 'Add to Quick Note'),
          _ActionListItem(title: 'Find on Page'),
          _ActionListItem(title: 'Add to Home Screen'),
        ],
      ),
      SizedBox(height: 16),
      _ActionListSection(
        header: Text('Other actions'),
        children: [
          _ActionListItem(title: 'Markup'),
          _ActionListItem(title: 'Print'),
          _ActionListItem(title: 'Analyze with Bing Chat'),
          _ActionListItem(title: 'Open in Chrome'),
          _ActionListItem(title: 'Open using Mastodon'),
          _ActionListItem(title: 'Save to Pinterest'),
          _ActionListItem(title: 'Save to Dropbox'),
        ],
      ),
    ],
  );
}

class _ActionListSection extends StatelessWidget {
  const _ActionListSection({required this.children, this.header});

  final Widget? header;
  final List<Widget> children;

  @override
  Widget build(final BuildContext context) => CupertinoListSection.insetGrouped(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    header: header,
    children: children,
  );
}

class _ActionListItem extends StatelessWidget {
  const _ActionListItem({required this.title, this.isFavorite = false});

  final String title;
  final bool isFavorite;

  @override
  Widget build(final BuildContext context) => CupertinoListTile.notched(
    title: Text(title),
    leading: isFavorite
        ? const Icon(
            CupertinoIcons.minus_circle_fill,
            color: CupertinoColors.systemRed,
          )
        : const Icon(
            CupertinoIcons.plus_circle_fill,
            color: CupertinoColors.systemGreen,
          ),
    trailing: isFavorite
        ? const Icon(
            CupertinoIcons.line_horizontal_3,
            color: CupertinoColors.systemGrey4,
          )
        : null,
  );
}


**Tool Call: bash**
Status: Completed

Terminal:
```

     209 lib/ui_prediction/ui_prediction_desktop_screen.dart

import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';
import 'package:recase/recase.dart';

class UiPredictionScreenV2 extends StatelessWidget {
const UiPredictionScreenV2({super.key});

@override
Widget build(final BuildContext context) {
final backgroungColor = context.colorScheme.primary;
return UiScaffold(
body: ColoredBox(
color: backgroungColor,
child: LayoutBuilder(
builder: (final context, final constraints) {
const _ = '';
final selectedDate = useSelectionDate(context);
// final isDesktop = UiLayout.fromConstraints(constraints).isDesktop;
// return isDesktop
// ? const DesktopPredictionBody()
// : const MobilePredictionBody();
return Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
const UiSafeArea.top(),
const Gap(16),
// Center(
// child: ElevatedButton(
// onPressed: () async => SimpleStepsFlow.show(context),
// child: const Text('Show steps'),
// ),
// ),
const Gap(16),
Expanded(
child: Center(
child: Container(
constraints: const BoxConstraints(maxWidth: 650),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(
margin: const EdgeInsets.only(left: 56, right: 56),
foregroundDecoration: BoxDecoration(
// color: backgroungColor.withAlpha(180),
borderRadius: BorderRadius.circular(16),
),
child: const Row(
mainAxisAlignment: MainAxisAlignment.center,
),
),
Container(
constraints: const BoxConstraints(maxHeight: 500),
margin: const EdgeInsets.only(
left: 32,
right: 32,
bottom: 32,
top: 8,
),
child: const Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Flexible(child: _MainContentCard()),
// const Gap(16),
// Container(
// width: 3,
// margin: const EdgeInsets.symmetric(
// vertical: 16,
// ),
// decoration: BoxDecoration(
// borderRadius: const BorderRadius.all(
// Radius.elliptical(32, 32),
// ),
// color: context.colorScheme.primaryContainer
// .withAlpha(100),
// ),
// ),
// const Gap(16),
// _ContentCard(
// constraints: const BoxConstraints(
// maxWidth: 400,
// minWidth: 300,
// maxHeight: 500,
// ),
// color: context.colorScheme.primaryContainer,
// child: const Column(
// children: [Text('Budgets'), Gap(12)],
// ),
// ),
],
),
),
],
),
),
),
),

                // Container(
                //   foregroundDecoration: BoxDecoration(
                //     color: backgroungColor.withAlpha(200),

```


**Tool Call: bash**
Status: Completed

Terminal:
```

// ignore_for_file: do_not_use_environment
import 'package:mobile_app/common_imports.dart';
import 'package:xsoulspace_installation_store/xsoulspace_installation_store.dart';

class Envs {
const Envs._();
static const kDefaultCurrencyType = CurrencyType.fiat;
static const appScheme = 'dev.xsoulspace.daily_budget_planner';
static const logging = bool.fromEnvironment('LOGGING');
static const rustoreApplicationId = '2045332927';
static const isTestPayments = bool.fromEnvironment('TEST_PAYMENTS');
static const monetizationTypeJson = String.fromEnvironment(
'MONETIZATION',
defaultValue: 'free',
);
// TODO(arenukvern): handle taxes
static const isAmountsTaxFree = false;
static const isCryptoEnabled = bool.fromEnvironment('CRYPTO_ENABLED');
static const isCurrencySwitchingEnabled = bool.fromEnvironment(
'CURRENCY_SWITCHING_ENABLED',
);
static final monetizationType = MonetizationType.fromJson(
monetizationTypeJson,
);
static final storeName = switch (storeTarget) {
InstallationTargetStore.mobileGooglePlay => 'Google Play',
InstallationTargetStore.rustore => 'RuStore',
InstallationTargetStore.huawei => 'Huawei AppGallery',
InstallationTargetStore.mobileAppleAppStore || _ => 'App Store',
};
static final storeTarget = InstallationTargetStore.values.firstWhere(
(final e) =>
e.name ==
const String.fromEnvironment('STORE', defaultValue: 'rustore'),
orElse: () => InstallationTargetStore.rustore,
);
static const privacyPolicyUrl =
'https://raw.githubusercontent.com/xsoulspace/daily_budget_planner/refs/heads/main/PRIVACY_POLICY.md';
static const termsUrl =
'https://raw.githubusercontent.com/xsoulspace/daily_budget_planner/refs/heads/main/TERMS_AND_CONDITIONS.md';
static const wiredashProjectId = String.fromEnvironment(
'WIREDASH_PROJECT_ID',
);
static const wiredashSecret = String.fromEnvironment('WIREDASH_API_KEY');
static final isWiredashAvailable =
wiredashSecret.isNotEmpty && wiredashProjectId.isNotEmpty;
}
===

lib/ui_home/settings/settings_bottom_dialog.dart:45: unawaited(UiPredictionScreen.show(context));
lib/ui_home/settings/settings_bottom_dialog.dart:84: onTap: () async => UserFeedback.show(context),
===

export 'tasks/tasks.dart';
export 'timeline/timeline.dart';
export 'transactions/ui_expenses_view.dart';
export 'transactions/ui_incomes_view.dart';
export 'transactions/ui_transaction_editor.dart';
export 'transactions/ui_transactions_table.dart';
export 'ui_prediction_screen.dart';

```


## Assistant

Thanks — now it's clear. Here's what I found and my analysis.

## Current state (what exists)

**The hidden surface:** `packages/mobile_app/lib/ui_prediction/` (~5k lines) — the prediction/planning UI:
- `ui_prediction_screen.dart:14` — `show()` is hardwired to `UiPredictionScreenV2()` (old V1 body is dead code below it)
- Only entry point: **Settings popup → "Expenses prediction"** tile (`settings_bottom_dialog.dart:45`)
- It bypasses `router.dart` entirely (`Navigator.push`, no `ScreenPaths` entry)
- Two `kDebugMode`-gated `_TrendIndicator`s inside the screen (lines 332, 376)
- V2 itself is WIP: heavy commented-out blocks, `TODO(l10n)` untranslated strings
- There's an unused `simple_steps/` guided flow that could serve as the intro

So today: users can't discover it unless they open settings and tap a text row — and when they do, they land mid-WIP.

## Recommended integration: staged "discovery ladder"

### Phase 0 — Make it shippable (prerequisite)
- Finish the V2 core loop; delete V1 dead code + commented blocks (repo plan hygiene rule)
- Localize all strings (no English-only leaks)
- Register it in `router.dart` as `ScreenPaths.prediction` instead of raw `Navigator.push` — needed later for deep links from banners/cards

### Phase 1 — Flag-gated entry, single doorway
- Add a **runtime** feature flag (persisted in `AppSettingsNotifier`), not just `bool.fromEnvironment` like existing `Envs` flags — you need remote-revertable control. Pattern: `Envs` sets the *default*, settings store allows override.
- Keep **one** entry ("Expenses prediction") that dispatches on the flag. Never ship two competing entries — that's what shocks users.
- Default: `debug` → V2, `release` → still V1/V2 behind your choice, flip per release.

### Phase 2 — Guided first contact (don't shock)
- On first open of the new UI, run the existing `SimpleStepsFlow` as a 3-step intro ("here you plan, here you see the forecast")
- Reuse familiar anchors: same header sums, same transaction editors, same `ui_kit` components — recognition over novelty
- Add a lightweight "What's new?" affordance rather than silently changing behavior

### Phase 3 — Progressive discovery from home
Once feedback/analytics say the flow works:
- Add a dismissible teaser card on `HomeScreen` (below Monthly/Weekly): *"See how your budget evolves →"*. Deep-links into prediction. Cooldown on re-show if dismissed (never nag).
- Instrument with `xsoulspace_analytics`: `prediction_opened`, `teaser_dismissed`, `steps_completed`

### Phase 4 — Promotion & cleanup
- Promote to a permanent home element (card/tab) based on engagement data
- Delete the flag, V1 remnants, debug gates → extract decision to an ADR

## Governance note (per AGENTS.md)

This is likely `north_star_impact: applies` (product surface change), but the *migration mechanism* decision (flag + ladder vs big-bang) has trade-offs → worth a short ADR in `docs/decisions/` before code.

---

Want me to start with **Phase 0+1**: clean up the dead V1 code, wire the screen into `router.dart`, and add the runtime flag? Or draft the ADR first?

## User

yes, pease do all phases step by step

## Assistant

Let me start by reading all the files I'll touch, then work through the phases.

**Tool Call: read**
Status: Completed

import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_other/privacy_screen.dart';
import 'package:mobile_app/ui_other/terms_screen.dart';
import 'package:mobile_app/ui_pay/ui_pay.dart';

enum ScreenPaths {
  root('/'),
  home('/home'),
  paywall('paywall'),
  manageSubscription('manage-subscription'),
  thanksForSubscribing('subscribing-thanks'),
  waitingPayConfirmation('waiting-pay-confirmation'),
  privacy('privacy'),
  terms('terms'),
  explanation('explain');

  const ScreenPaths(this.value);
  final String value;
}

final router = GoRouter(
  redirect: _handleRootRedirect,
  initialLocation: ScreenPaths.root.value,
  debugLogDiagnostics: true,
  routes: [
    AppRoute(
      ScreenPaths.root.value,
      useFade: true,
      (final context, final state) => const PreloadingScreen(),
      routes: [
        AppRoute(
          ScreenPaths.home.value,
          useFade: true,
          (final context, final state) => const HomeScreen(),
          routes: [
            AppRoute(
              ScreenPaths.paywall.value,
              (final context, final state) => const PaywallScreen(),
            ),
            AppRoute(
              ScreenPaths.explanation.value,
              (final context, final state) => MethodExplanationScreen(
                isFirstOpening:
                    state.uri.queryParameters['isFirstOpening'] != null,
              ),
            ),
            AppRoute(
              ScreenPaths.manageSubscription.value,
              (final context, final state) => const ManageSubscriptionScreen(),
            ),
            AppRoute(
              ScreenPaths.privacy.value,
              (final context, final state) => const PrivacyScreen(),
            ),
            AppRoute(
              ScreenPaths.terms.value,
              (final context, final state) => const TermsScreen(),
            ),
            AppRoute(
              ScreenPaths.thanksForSubscribing.value,
              (final context, final state) =>
                  const ThanksForSubscribingScreen(),
            ),
            AppRoute(
              ScreenPaths.waitingPayConfirmation.value,
              (final context, final state) =>
                  const WaitingPayConfirmationScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

String? _handleRootRedirect(
  final BuildContext context,
  final GoRouterState state,
) {
  final appStatus = context.read<AppStatusResource>().value;
  final location = state.uri.toString();
  // Prevent anyone from navigating away from `/` if app is starting up.
  if (appStatus == AppStatus.loading && location != ScreenPaths.root.value) {
    return ScreenPaths.root.value;
  }

  debugPrint('Navigate to: ${state.uri}');
  return null; // do nothing
}

/// runtime only
class AppPathsController {
  AppPathsController.of(this.context);
  final BuildContext context;
  final _homeRoutes = [ScreenPaths.home];
  void toRoot() => go(ScreenPaths.root);
  void toHome() => go(ScreenPaths.home);
  void toPrivacy() => go(ScreenPaths.privacy, routes: _homeRoutes);
  void toTerms() => go(ScreenPaths.terms, routes: _homeRoutes);
  void toPaywall() => go(ScreenPaths.paywall, routes: _homeRoutes);
  void toThanksForSubscribing() =>
      go(ScreenPaths.thanksForSubscribing, routes: _homeRoutes);
  void toWaitingPayConfirmation() =>
      go(ScreenPaths.waitingPayConfirmation, routes: _homeRoutes);
  void toManageSubscription() =>
      go(ScreenPaths.manageSubscription, routes: _homeRoutes);
  void toExplanation({final bool isFirstTimeOpening = false}) => go(
    ScreenPaths.explanation,
    routes: [ScreenPaths.home],
    params: {if (isFirstTimeOpening) 'isFirstOpening': 'true'},
  );
  void go(
    final ScreenPaths path, {
    final List<ScreenPaths> routes = const [],
    final Map<String, String> params = const {},
  }) {
    final pathWithRoutes =
        // ignore: lines_longer_than_80_chars
        '${routes.isEmpty ? '' : '${routes.map((final e) => e.value).join('/')}/'}${path.value}';
    final uri = Uri(path: pathWithRoutes, queryParameters: params);
    to(uri.toString());
  }

  void to(final String path) => context.go(path);
}

extension RouterBuildContextX on BuildContext {
  GoRouter get router => GoRouter.of(this);
  Map<String, String> get routeParams =>
      router.routerDelegate.currentConfiguration.pathParameters;
}

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(
    final String path,
    final Widget Function(BuildContext context, GoRouterState state) builder, {
    final List<GoRoute> routes = const [],
    final bool useFade = false,
    final bool isTransparent = false,
  }) : super(
         path: path,
         routes: routes,
         pageBuilder: (final context, final state) {
           final pageContent = builder(context, state);
           if (useFade || isTransparent) {
             return CustomTransitionPage(
               key: state.pageKey,
               child: pageContent,
               opaque: !isTransparent,
               barrierColor: isTransparent
                   ? Colors.transparent
                   : context.colorScheme.surface,
               transitionsBuilder:
                   (
                     final context,
                     final animation,
                     final secondaryAnimation,
                     final child,
                   ) => FadeTransition(opacity: animation, child: child),
             );
           }
           return CupertinoPage(child: pageContent);
         },
       );
}


**Tool Call: bash**
Status: Completed

Terminal:
```

                          (final state) => state.incomesSum,
                        );
                    return _HeaderItem(
                      onPressed: () async =>
                          showIncomesTasksView(context: context),
                      title: LocalizedMap({
                        // TODO(arenukvern): add localization l10n
                        languages.en: 'regular income',
                        languages.it: 'entrate regolari',
                        languages.ru: 'регулярные доходы',
                      }).getValue(locale),
                      value: '\$${plannedIncomesSum.toStringAsFixed(2)}',
                      icon: Icons.arrow_drop_up_rounded,
                    );
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
          const Gap(8),
        ],
      ),
    );

}
}

typedef UseConfigPeriodSelectorRecord = ({
Period period,
ValueChanged<Period> onPeriodSelected,
});
UseConfigPeriodSelectorRecord useConfigPeriodSelector({
required final BuildContext context,
}) {
final period = context.select<PredictionConfigResource, Period>(
(final state) => state.period,
);
return (
period: period,
onPeriodSelected:
const UpdatePredictionConfigCommand().onSelectedPeriodChanged,
);
}

class PeriodSelectorButton extends HookWidget {
const PeriodSelectorButton({
required this.period,
required this.onPeriodSelected,
super.key,
});

final Period period;
final ValueChanged<Period> onPeriodSelected;

@override
Widget build(final BuildContext context) {
final locale = useLocale(context);
final controller = useUiPopupButtonController();

    final periodTitle = LocalizedMap({
      languages.en: 'period',
      languages.it: 'periodo',
      languages.ru: 'период',
    }).getValue(locale);

    final periodValue = switch (period) {
      Period.weekly => 'week',
      Period.monthly => 'month',
      Period.quarterly => 'quarter',
      Period.yearly => 'year',
      _ => '${period.inDays} days',
    };

    return UiPopupButton(
      controller: controller,
      scaleDirection: UiPopupButtonScaleDirection.down,
      menuBuilder: (final context) => UiPopupDecoration(
        child: PeriodMenu(
          onPeriodSelected: (final newPeriod) {
            onPeriodSelected(newPeriod);
            controller.close();
          },
          selectedPeriod: period,
        ),
      ),
      shouldRotate: false,
      buttonBuilder: (final context, final isVisible, final onPressed) =>
          _HeaderItem(
            onPressed: onPressed,
            title: periodTitle,
            value: periodValue,
          ),
    );

}
}

class PeriodMenu extends StatelessWidget {
const PeriodMenu({
required this.onPeriodSelected,
required this.selectedPeriod,
super.key,
});

final ValueChanged<Period> onPeriodSelected;
final Period selectedPeriod;

@override
Widget build(final BuildContext context) => Column(
mainAxisSize: MainAxisSize.min,
children: [
_PeriodMenuItem(
title: 'Weekly',
period: Period.weekly,
selectedPeriod: selectedPeriod,
onSelect: onPeriodSelected,
),
_PeriodMenuItem(
title: 'Monthly',
period: Period.monthly,
selectedPeriod: selectedPeriod,
onSelect: onPeriodSelected,
),
_PeriodMenuItem(
title: 'Quarterly',
period: Period.quarterly,
selectedPeriod: selectedPeriod,
onSelect: onPeriodSelected,
),
_PeriodMenuItem(
title: 'Yearly',
period: Period.yearly,
selectedPeriod: selectedPeriod,
onSelect: onPeriodSelected,
),
],
);
}

class _PeriodMenuItem extends StatelessWidget {
const _PeriodMenuItem({
required this.title,
required this.period,
required this.selectedPeriod,
required this.onSelect,
});

final String title;
final Period period;
final Period selectedPeriod;
final ValueChanged<Period> onSelect;

@override
Widget build(final BuildContext context) => UiPopupListTile(
onTap: () => onSelect(period),
title: title,
isSelected: selectedPeriod == period,
);
}

class _HeaderItem extends StatelessWidget {
const _HeaderItem({
required this.title,
required this.value,
required this.onPressed,
this.icon,
});

final String title;
final String value;
final IconData? icon;
final VoidCallback onPressed;
@override
Widget build(final BuildContext context) => UiTextButton(
padding: EdgeInsets.zero,
onPressed: onPressed,
title: Column(
mainAxisSize: MainAxisSize.min,
children: [
FittedBox(
fit: BoxFit.scaleDown,
child: Text(
title,
style: context.textTheme.labelSmall,
textAlign: TextAlign.center,
),
),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
if (icon != null) Icon(icon),
Text(
value,
style: context.textTheme.titleLarge,
textAlign: TextAlign.center,
),
],
),
],
),
);
}

class MobilePredictionBody extends StatelessWidget {
const MobilePredictionBody({super.key});

@override
Widget build(final BuildContext context) {
final selectedDate = useSelectionDate(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (kDebugMode) ...[_TrendIndicator(), const Gap(6)],
        const BudgetButton(),
        const Gap(24),
        const DailyBudgetDisplay(),
        const Gap(24),
        UiHorizontalPredictionTimeline(
          notifier: context.read(),
          onDateChanged:
              const UpdatePredictionConfigCommand().onSelectedDateChanged,
        ),
        const Gap(28),
        DailyStatistics(selectedDate: selectedDate),
      ],
    );

}
}

class DesktopPredictionBody extends StatelessWidget {
const DesktopPredictionBody({super.key});

@override
Widget build(final BuildContext context) {
final selectedDate = useSelectionDate(context);
final dailyBudget = context.watch<DailyBudgetResource>();

    return Row(
      children: [
        UiVerticalPredictionTimeline(
          notifier: context.read(),
          onDateChanged:
              const UpdatePredictionConfigCommand().onSelectedDateChanged,
        ),
        Expanded(
          child: Row(
            children: [
              const Gap(24),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [DailyBudgetDisplay()],
              ),
              const Gap(24),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (kDebugMode) ...[_TrendIndicator(), const Gap(6)],
                  const BudgetButton(),
                  const Gap(24),
                  DailyStatistics(selectedDate: selectedDate),
                ],
              ),
            ],
          ),
        ),
      ],
    );

}
}

class _TrendIndicator extends StatelessWidget {
@override
Widget build(final BuildContext context) {
final locale = useLocale(context);
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 16),
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.trending_up_rounded,

```


**Tool Call: bash**
Status: Completed

Terminal:
```

            Icons.trending_up_rounded,
            size: 16,
            color: context.colorScheme.onSurface.withOpacity(0.3),
          ),
          const Gap(4),
          Text(
            LocalizedMap({
              languages.en: 'Trend: savings left for ~2 days',
              languages.it: 'Tendenza: risparmio rimanente per ~2 giorni',
              languages.ru: 'Тренд: накоплений хватит на ~2 дня',
            }).getValue(locale),
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

}
}

class BudgetButton extends StatelessWidget {
const BudgetButton({super.key});

@override
Widget build(final BuildContext context) {
final locale = useLocale(context);
final recentBudget = context.select<RecentBudgetResource, Budget>(
(final state) => state.recentBudget,
);
return UiBaseButton(
onPressed: () async => BudgetBottomSheet.show(context),
builder: (final _, final __, final ___) => Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.history,
size: 16,
color: context.colorScheme.onSurface.withOpacity(0.8),
),
const Gap(8),
Text(
// TODO(arenukvern): description
'\$${recentBudget.input.amount(taxFree: true).toStringAsFixed(2)} '
            '${LocalizedMap({languages.en: '- left', languages.it: '- rimanenti', languages.ru: '- осталось'}).getValue(locale)}',
style: context.textTheme.titleLarge,
),
],
),
);
}
}

class DailyBudgetDisplay extends StatelessWidget {
const DailyBudgetDisplay({super.key});

@override
Widget build(final BuildContext context) {
final locale = useLocale(context);
final dailyBudget = context.watch<DailyBudgetResource>();
return Column(
children: [
Row(
mainAxisSize: MainAxisSize.min,
children: [
Text(
'\$${dailyBudget.value.toStringAsFixed(2)}',
style: context.textTheme.displayLarge,
),
const Gap(4),
IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
],
),
Text(
LocalizedMap({
languages.en: "I can spend today (Today's budget)",
languages.it: 'Posso spendere oggi (Budget oggi)',
languages.ru: 'Могу потратить сегодня (Сегодняшний бюджет)',
}).getValue(locale),
style: context.textTheme.labelLarge,
),
],
);
}
}

class DailyStatistics extends StatelessWidget {
const DailyStatistics({required this.selectedDate, super.key});

final DateTime selectedDate;

@override
Widget build(final BuildContext context) {
final locale = useLocale(context);
final totalSumResource = context.watch<TotalSumResource>();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          _StatisticItem(
            onPressed: () async => UiExpensesView.show(context: context),
            value: '-\$${totalSumResource.expensesSum.toStringAsFixed(2)}',
            label: LocalizedMap({
              languages.en: 'What I spent (Expenses)',
              languages.it: 'Cosa ho speso (Spese)',
              languages.ru: 'Что я потратил (Расходы)',
            }).getValue(locale),
          ),
          _StatisticItem(
            onPressed: () async => UiIncomesView.show(context: context),
            value: '+\$${totalSumResource.incomesSum.toStringAsFixed(2)}',
            label: LocalizedMap({
              languages.en: 'What I earned (Income)',
              languages.it: 'Cosa ho guadagnato (Entrate)',
              languages.ru: 'Что я заработал (Доходы)',
            }).getValue(locale),
          ),
        ],

===V2 rest===
// color: backgroungColor.withAlpha(200),
// borderRadius: BorderRadius.circular(16),
// ),
// child: DailyStatistics(selectedDate: selectedDate),
// ),
const Gap(16),
const UiSafeArea.bottom(),
],
);
},
),
),
);
}
}

class PeriodSelector extends StatelessWidget {
const PeriodSelector({super.key});

@override
Widget build(final BuildContext context) {
final period = context.select<PredictionConfigResource, Period>(
(final state) => state.period,
);
return UiSegmentedButton(
segments:
const [Period.weekly, Period.monthly, Period.quarterly, Period.yearly]
.map(
(final e) => ButtonSegment(
value: e,
label: Text(
switch (e) {
Period.weekly => 'week',
Period.monthly => 'month',
Period.quarterly => 'quarter',
Period.yearly => 'year',
_ => '${period.inDays} days',
}.sentenceCase,
),
),
)
.toList(),
selected: period,
onSelectionChanged:
(final d) =>
const UpdatePredictionConfigCommand().onSelectedPeriodChanged(d),
);
}
}

class _MainContentCard extends StatelessWidget {
const _MainContentCard({super.key});

@override
Widget build(final BuildContext context) => const _ContentCard(
constraints: BoxConstraints(maxWidth: 650, maxHeight: 500),
// constraints: BoxConstraints(maxWidth: 400, maxHeight: 500),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
DailyBudgetDisplay(),
Gap(32),
Row(
spacing: 16,
mainAxisAlignment: MainAxisAlignment.center,
children: [
// BudgetWillLast(),
TodaysBudget(),

          ],
        ),
      ],
    ),

);
}

class AddBudgetButton extends StatelessWidget {
const AddBudgetButton({super.key});

@override
Widget build(BuildContext context) {
return const Placeholder();
}
}

class _ContentCard extends StatelessWidget {
const _ContentCard({
required this.child,
required this.constraints,
this.color,
super.key,
});
final Widget child;
final Color? color;
final BoxConstraints constraints;

@override
Widget build(final BuildContext context) => Container(
constraints: constraints,
decoration: BoxDecoration(
color: color ?? context.colorScheme.surface,
borderRadius: BorderRadius.circular(16),
),
padding: const EdgeInsets.all(16),
child: DefaultTextStyle.merge(
style: context.textTheme.labelMedium,
child: child,
),
);
}

```


**Tool Call: bash**
Status: Completed

Terminal:
```

lib/ui_prediction/ui_prediction_screen.dart:544:class TodaysBudget extends StatelessWidget {
===

import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/upsert_budget_dialog.dart';

/// {@template simple_steps_flow}
/// A step-by-step onboarding flow for first-time users.
/// Displays a vertical carousel of steps to guide users through
/// the initial setup of the application.
/// {@endtemplate}
class SimpleStepsFlow extends HookWidget {
/// {@macro simple_steps_flow}
const SimpleStepsFlow({super.key});

/// Shows the simple steps flow in a full-screen dialog.
static Future<void> show(final BuildContext context) =>
Navigator.of(context).push(
MaterialPageRoute(
fullscreenDialog: true,
builder: (_) => const SimpleStepsFlow(),
),
);

@override
Widget build(final BuildContext context) {
final pageController = usePageController();
final currentPage = useState(0);
const stepsCount = 6;

    void onNext() {
      if (currentPage.value < stepsCount) {
        unawaited(
          pageController.animateToPage(
            currentPage.value + 1,
            duration: 400.milliseconds,
            curve: Curves.easeInOut,
          ),
        );
      } else {
        _completeOnboarding(context);
      }
    }

    Widget buildStep(final int index) => switch (index) {
      0 => _WelcomeStep(),
      1 => _SetupBudgetStep(onNext: onNext),
      2 => _DailyBudgetStep(),
      3 => _RegularIncomeStep(),
      4 => _RegularExpensesStep(),
      5 => _CompletionStep(),
      _ => const SizedBox.shrink(),
    };

    // Listen to page changes
    useEffect(() {
      void listener() {
        if (pageController.page != null) {
          currentPage.value = pageController.page!.round();
        }
      }

      pageController.addListener(listener);
      return () => pageController.removeListener(listener);
    }, [pageController]);

    return UiScaffold(
      body: ColoredBox(
        color: context.colorScheme.primary,
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 650, maxHeight: 650),
              child: Column(
                children: [
                  _buildHeader(
                    context: context,
                    currentStep: currentPage.value,
                    totalSteps: stepsCount,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,

===
507 lib/ui_prediction/simple_steps/simple_steps.dart

```


**Tool Call: bash**
Status: Completed

Terminal:
```

lib/data_states/app_settings_notifier.dart
lib/di/dependency_injector.dart
lib/di/global_state_providers.dart
===

lib/data_states/app_settings_notifier.dart:4:class AppSettingsNotifier extends ValueNotifier<AppSettingsModel>

```


## User

continue

**Tool Call: bash**
Status: Completed

Terminal:
```

import 'package:flutter/foundation.dart';
import 'package:mobile_app/common_imports.dart';

class AppSettingsNotifier extends ValueNotifier<AppSettingsModel>
with HasLocalApis, HasNotifiers {
AppSettingsNotifier() : super(AppSettingsModel.empty);

Future<void> _updateSettings(final AppSettingsModel settings) async {
value = settings;
await appSettingsApi.saveSettings(settings: settings);
}

AppSettingsModel get settings => value;

Future<void> onLoad() async {
final settings = await appSettingsApi.loadSettings();
await _updateSettings(settings);
await updateLocale(value.locale);
}

Future<void> updateBrightness(final UiBrightness brightness) async {
await _updateSettings(value.copyWith(brightness: brightness));
}

ValueListenable<Locale> get locale => localeNotifier;
UiLanguage get language => locale.value.language;
Future<void> updateLocale(final Locale? locale) async {
final result = await LocaleLogic().updateLocale(
newLocale: locale,
oldLocale: value.locale,
uiLocale: localeNotifier.value,
onLocaleChanged: S.delegate.load,
);
if (result == null) return;
localeNotifier.value = result.uiLocale;
notifyListeners();
if (value.locale == result.updatedLocale) return;
await _updateSettings(value.copyWith(locale: result.updatedLocale));
}

bool get use24HourFormat => value.use24HourFormat;
}
===

lib/data_models/app_settings_model.dart:24:abstract class AppSettingsModel with _$AppSettingsModel {

```


**Tool Call: bash**
Status: Completed

Terminal:
```

// ignore_for_file: invalid_annotation_target

part of 'data_models.dart';

enum UiBrightness {
system,
light,
dark;

factory UiBrightness.fromJson(final String json) {
if (json.isEmpty) return UiBrightness.light;
return UiBrightness.values.byName(json);
}
static String toJson(final UiBrightness brightness) => brightness.name;
ThemeMode get themeMode => switch (this) {
UiBrightness.system => ThemeMode.system,
UiBrightness.light => ThemeMode.light,
UiBrightness.dark => ThemeMode.dark,
};
}

@immutable
@Freezed()
abstract class AppSettingsModel with _$AppSettingsModel {
@JsonSerializable(explicitToJson: true)
const factory AppSettingsModel({
@JsonKey(fromJson: localeFromString, toJson: localeToString)
final Locale? locale,
@Default(UiBrightness.system)
@JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)
final UiBrightness brightness,
@Default(true) final bool use24HourFormat,
}) = _AppSettingsModel;

const AppSettingsModel._();

factory AppSettingsModel.fromJson(final Map<String, dynamic> json) =>
_$AppSettingsModelFromJson(json);
static const empty = AppSettingsModel();
}
===API===
lib/data_local_api/app_settings_local_api.dart

```


**Tool Call: bash**
Status: Completed

Terminal:
```

lib/common_imports.dart
lib/core/hooks/hooks.dart
lib/core/hooks/use_analytics.dart
lib/di/dependency_injector.dart
lib/di/global_initializer.dart
lib/di/global_state_initializer.dart
lib/di/global_state_providers.dart
lib/ui_root/app_scaffold.dart
===

                    Expanded(
                      child: TabBar(
                        padding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,
                        tabs: [
                          UiTab(
                            iconData: Icons.calendar_month_rounded,
                            label: context.s.monthly,
                          ),
                          UiTab(
                            iconData: Icons.view_week_rounded,
                            label: context.s.weekly,
                          ),
                        ],
                      ),
                    ),
                    const SettingsIconButton(),
                  ],
                ),
              ),
              const UiSafeArea.bottom(),
            ],
          ),
        ),
      );

}

class UiTab extends StatelessWidget {
const UiTab({
required this.label,
required this.iconData,
super.key,
});
final String label;
final IconData iconData;
@override
Widget build(final BuildContext context) => Tab(
height: 32,
iconMargin: EdgeInsets.zero,
child: Row(
mainAxisSize: MainAxisSize.min,
children: [
Icon(iconData),
const Gap(4),
Text(label),
],
),
);
}
===

import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/settings/settings_bottom_dialog.dart';

class SettingsIconButton extends HookWidget {
const SettingsIconButton({super.key});

@override
Widget build(final BuildContext context) {
final controller = useUiPopupButtonController();
return UiPopupButton(
controller: controller,
menuBuilder: (final context) => UiPopupDecoration(
child: SettingsBottomPopup(
onClose: controller.close,
),
),
buttonBuilder: (final context, final isVisible, final onPressed) =>
IconButton(
onPressed: onPressed,
tooltip: 'Settings',
icon: const Icon(Icons.settings),
),
);
}
}

```


**Tool Call: bash**
Status: Completed

Terminal:
```

import 'package:mobile_app/common_imports.dart';

AnalyticsService useAnalyticsService() =>
useAnalyticsManager().analyticsService;
AnalyticsManager useAnalyticsManager() => useContext().read<AnalyticsManager>();

void useLogScreenView(final String screenName) {
final analytics = useAnalyticsManager();
useEffect(
() {
unawaited(analytics.setCurrentScreen(screenName));
return null;
},
[screenName],
);
}
===

lib/di/global_state_providers.dart:48: Provider<AnalyticsManager>.value(value: g()),
lib/di/global_state_providers.dart:49: Provider<AnalyticsService>.value(value: g()),
===monthly_view head===
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/hooks/use_tab_controller_listener.dart';
import 'package:mobile_app/ui_home/monthly/monthly_notifier.dart';
import 'package:mobile_app/ui_home/widgets/widgets.dart';

class MonthlyView extends StatefulHookWidget {
const MonthlyView({super.key});

@override
State<MonthlyView> createState() => _MonthlyViewState();
}

class _MonthlyViewState extends State<MonthlyView>
with AutomaticKeepAliveClientMixin {
void _requestAmountFocus() {
_requestAmountFocusByIndex(DefaultTabController.of(context).index);
}

void _requestSavingsFocus() {
final monthlyCubit = context.read<MonthlyNotifier>();
unawaited(SoftKeyboard.open());
monthlyCubit.savingsFocusNode.requestFocus();
}

void _requestAmountFocusByIndex(final int index) {
if (index != 0) return;
final monthlyCubit = context.read<MonthlyNotifier>();
unawaited(SoftKeyboard.open());
monthlyCubit.amountFocusNode.requestFocus();
}

@override
Widget build(final BuildContext context) {
super.build(context);
final monthlyCubit = context.watch<MonthlyNotifier>();
final locale = useLocale(context);
useTabControllerListenerState(
onTabChanged: _requestAmountFocusByIndex,
);

    final isLandscape = MediaQuery.sizeOf(context).width > 600;

    return Form(
      child: isLandscape
          ? _buildLandscapeLayout(context, monthlyCubit, locale)
          : _buildMobileLayout(context, monthlyCubit, locale),
    );

}

Widget _buildLandscapeLayout(

```


**Tool Call: bash**
Status: Completed

Terminal:
```

./packages/xsoulspace_analytics/lib/src/analytics_manager.dart

```


**Tool Call: bash**
Status: Completed

Terminal:
```

packages/xsoulspace_analytics/lib/xsoulspace_analytics.dart
packages/xsoulspace_analytics/lib/src/utils/error_to_string.dart
packages/xsoulspace_analytics/lib/src/utils/utils.dart
packages/xsoulspace_analytics/lib/src/models/analytics_events.dart
packages/xsoulspace_analytics/lib/src/models/analytics_event.dart
packages/xsoulspace_analytics/lib/src/models/models.dart
packages/xsoulspace_analytics/lib/src/firebase/firebase_crashlytics_plugin_web.dart
packages/xsoulspace_analytics/lib/src/firebase/firebase_analytics_plugin.dart
packages/xsoulspace_analytics/lib/src/firebase/firebase_crashlytics_plugin.dart
packages/xsoulspace_analytics/lib/src/firebase/firebase.dart
packages/xsoulspace_analytics/lib/src/firebase/firebase_initializer.dart
packages/xsoulspace_analytics/lib/src/analytics_manager.dart
packages/xsoulspace_analytics/lib/src/interfaces/analytics_service.dart
packages/xsoulspace_analytics/lib/src/interfaces/interfaces.dart
packages/xsoulspace_analytics/lib/src/interfaces/crashlytics_service.dart
packages/xsoulspace_analytics/lib/src/analytics_manager.dart:9:class AnalyticsManager implements Loadable, Disposable {
packages/xsoulspace_analytics/lib/src/interfaces/analytics_service.dart:26:abstract interface class AnalyticsService implements Loadable, Disposable {

```


**Tool Call: bash**
Status: Completed

Terminal:
```

import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

import '../models/models.dart';

/// A no-operation implementation of [AnalyticsService].
///
/// This class can be used as a placeholder or for testing purposes
/// when actual analytics tracking is not required.
class NoopAnalyticsService implements AnalyticsService {
@override
Future<void> onLoad() async {}

@override
Future<void> logEvent(final AnalyticsEvent event) async {}

@override
Future<void> setUserProperty(final String name, final String? value) async {}

@override
Future<void> setUserId(final String? id) async {}

@override
void dispose() {}
}

abstract interface class AnalyticsService implements Loadable, Disposable {
Future<void> logEvent(final AnalyticsEvent event);
Future<void> setUserProperty(final String name, final String? value);
Future<void> setUserId(final String? id);
}
===

packages/xsoulspace_analytics/lib/src/models/analytics_event.dart:1:class AnalyticsEvent {
packages/xsoulspace_analytics/lib/src/models/analytics_event.dart:2: const AnalyticsEvent({
packages/xsoulspace_analytics/lib/src/models/analytics_event.dart:6: factory AnalyticsEvent.fromJson(final Map<String, dynamic> json) =>
packages/xsoulspace_analytics/lib/src/models/analytics_event.dart:7: AnalyticsEvent(name: json['name'], parameters: json['parameters']);

```


## Assistant

Now let me check the remaining pieces: ADR conventions, `common_imports`, analytics event usage patterns, and the SimpleSteps content.

**Tool Call: bash**
Status: Completed

Terminal:
```

0001-adopt-skill-steward-governance.md
0002-aggregate-first-projection-engine.md
README.md
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
  \===

```


**Tool Call: bash**
Status: Completed

Terminal:
```

===
controller: pageController,
scrollDirection: Axis.vertical,
itemCount: stepsCount,
itemBuilder:
(final context, final index) => buildStep(index),
),
),
_buildFooter(
context: context,
currentStep: currentPage.value,
totalSteps: stepsCount,
onNext: onNext,
onSkip: () => _completeOnboarding(context),
),
],
),
),
),
),
),
);
}

Widget _buildHeader({
required final BuildContext context,
required final int currentStep,
required final int totalSteps,
}) => Padding(
padding: const EdgeInsets.all(16),
child: Row(
children: [
StepIndicator(currentStep: currentStep, totalSteps: totalSteps),
const Spacer(),
IconButton(
icon: Icon(Icons.close, color: context.colorScheme.onPrimary),
onPressed: () => _completeOnboarding(context),
),
],
),
);

Widget _buildFooter({
required final BuildContext context,
required final int currentStep,
required final int totalSteps,
required final VoidCallback onNext,
required final VoidCallback onSkip,
}) => Padding(
padding: const EdgeInsets.all(16),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
if (currentStep < totalSteps - 1)
TextButton(
onPressed: onSkip,
child: Text(
'Skip',
style: TextStyle(color: context.colorScheme.onPrimary),
),
)
else
const SizedBox.shrink(),
UiTextButton(
onPressed: onNext,
title: Text(
currentStep < totalSteps - 1 ? 'Next' : 'Get Started',
style: TextStyle(color: context.colorScheme.onPrimary),
),
),
],
),
);

void _completeOnboarding(final BuildContext context) {
// TODO: Save onboarding completion status
Navigator.of(context).pop();
}
}

/// A widget that displays the current step progress.
class StepIndicator extends StatelessWidget {
/// Creates a step indicator.
const StepIndicator({
required this.currentStep,
required this.totalSteps,
super.key,
});

/// The current step index.
final int currentStep;

/// The total number of steps.
final int totalSteps;

@override
Widget build(final BuildContext context) => Column(
mainAxisSize: MainAxisSize.min,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Step ${currentStep + 1} of $totalSteps',
style: context.textTheme.labelMedium?.copyWith(
color: context.colorScheme.onPrimary,
),
),
const Gap(8),
Row(
children: List.generate(
totalSteps,
(final index) => Container(
width: 24,
height: 4,
margin: const EdgeInsets.only(right: 4),
decoration: BoxDecoration(
color:
index <= currentStep
? context.colorScheme.onPrimary
: context.colorScheme.onPrimary.withOpacity(0.3),
borderRadius: BorderRadius.circular(2),
),
),

```


**Tool Call: bash**
Status: Completed

Terminal:
```

export 'dart:async';

export 'package:collection/collection.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'package:flutter/material.dart';
export 'package:flutter/widgets.dart';
export 'package:flutter_animate/flutter_animate.dart';
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:gap/gap.dart';
export 'package:go_router/go_router.dart';
export 'package:provider/provider.dart' hide Dispose;
export 'package:ui_locale/ui_locale.dart';
export 'package:from_json_to_json/from_json_to_json.dart';
export 'package:is_dart_empty_or_not/is_dart_empty_or_not.dart';
export 'package:xsoulspace_analytics/xsoulspace_analytics.dart';
export 'package:xsoulspace_foundation/xsoulspace_foundation.dart';
export 'package:xsoulspace_ui_foundation/xsoulspace_ui_foundation.dart';
export 'package:xsoulspace_monetization_foundation/xsoulspace_monetization_foundation.dart';
export 'package:xsoulspace_review/xsoulspace_review.dart';

export 'core/core.dart';
export 'data_commands/data_commands.dart';
export 'data_local_api/data_local_api.dart';
export 'data_models/data_models.dart';
export 'data_resources/data_resources.dart';
export 'data_states/data_states.dart';
export 'di/di.dart';
export 'envs.dart';
export 'router.dart';
export 'ui_account/ui_account.dart';
export 'ui_home/home.dart';
export 'ui_kit/ui_kit.dart';
export 'ui_prediction/ui_prediction.dart';
===

import 'package:mobile_app/data_local_api/kernel_map_storage_bridge.dart';
import 'package:mobile_app/data_models/data_models.dart';
import 'package:universal_storage_sync/universal_storage_sync.dart';
import 'package:xsoulspace_foundation/xsoulspace_foundation.dart';

/// The purpose of the service is to get | set information about
/// application wide user settings like locale, etc
class AppSettingsLocalApi {
AppSettingsLocalApi({
required final LocalDbI localDb,
required final StorageKernel storageKernel,
final StorageNamespace settingsNamespace = _defaultSettingsNamespace,
}) : _kernelMapStore = KernelMapStorageBridge(
localDb: localDb,
storageKernel: storageKernel,
),
_settingsNamespace = settingsNamespace;

static const _persistenceKey = 'settings';
static const _kernelPath = 'app/settings_v1.json';
static const _defaultSettingsNamespace = StorageNamespace.settings;

final KernelMapStorageBridge _kernelMapStore;
final StorageNamespace _settingsNamespace;

Future<void> saveSettings({
required final AppSettingsModel settings,
}) async {
await _kernelMapStore.writeMap(
legacyKey: _persistenceKey,
namespace: _settingsNamespace,
kernelPath: _kernelPath,
value: settings.toJson(),
);
}

Future<AppSettingsModel> loadSettings() async {
final json = await _kernelMapStore.readMap(
legacyKey: _persistenceKey,
namespace: _settingsNamespace,
kernelPath: _kernelPath,
);
if (json.isEmpty) return AppSettingsModel.empty;
return AppSettingsModel.fromJson(json);
}
}

```


## Assistant

I have full context now. Let me check a few last APIs before writing code.

**Tool Call: bash**
Status: Completed

Terminal:
```

lib/ui_kit/atoms/ui_popup_list_tile.dart:25:class UiPopupListTile extends StatelessWidget {
lib/ui_kit/atoms/ui_popup_list_tile.dart-26- /// {@macro ui_popup_list_tile}
lib/ui_kit/atoms/ui_popup_list_tile.dart-27- const UiPopupListTile({
lib/ui_kit/atoms/ui_popup_list_tile.dart-28- required this.onTap,
lib/ui_kit/atoms/ui_popup_list_tile.dart-29- required this.title,
lib/ui_kit/atoms/ui_popup_list_tile.dart-30- this.iconData,
lib/ui_kit/atoms/ui_popup_list_tile.dart-31- this.icon,
lib/ui_kit/atoms/ui_popup_list_tile.dart-32- this.isLoading = false,
lib/ui_kit/atoms/ui_popup_list_tile.dart-33- this.isSelected = false,
lib/ui_kit/atoms/ui_popup_list_tile.dart-34- super.key,
lib/ui_kit/atoms/ui_popup_list_tile.dart-35- });
lib/ui_kit/atoms/ui_popup_list_tile.dart-36-
lib/ui_kit/atoms/ui_popup_list_tile.dart-37- /// Callback when the tile is tapped
lib/ui_kit/atoms/ui_popup_list_tile.dart-38- final VoidCallback onTap;
lib/ui_kit/atoms/ui_popup_list_tile.dart-39-
lib/ui_kit/atoms/ui_popup_list_tile.dart-40- /// The title text to display
lib/ui_kit/atoms/ui_popup_list_tile.dart-41- final String title;
lib/ui_kit/atoms/ui_popup_list_tile.dart-42-
lib/ui_kit/atoms/ui_popup_list_tile.dart-43- /// The leading icon to display
lib/ui_kit/atoms/ui_popup_list_tile.dart-44- final IconData? iconData;
lib/ui_kit/atoms/ui_popup_list_tile.dart-45-
lib/ui_kit/atoms/ui_popup_list_tile.dart-46- /// The leading icon to display
lib/ui_kit/atoms/ui_popup_list_tile.dart-47- final Widget? icon;
lib/ui_kit/atoms/ui_popup_list_tile.dart-48-
lib/ui_kit/atoms/ui_popup_list_tile.dart-49- /// Whether to show a loading indicator instead of the chevron
lib/ui_kit/atoms/ui_popup_list_tile.dart-50- final bool isLoading;
===

class AnalyticsEvent {
const AnalyticsEvent({
required this.name,
this.parameters,
});
factory AnalyticsEvent.fromJson(final Map<String, dynamic> json) =>
AnalyticsEvent(name: json['name'], parameters: json['parameters']);

final String name;
final Map<String, dynamic>? parameters;
Map<String, dynamic> toJson() => {
'name': name,
'parameters': parameters,
};
}
===

import 'analytics_event.dart';

class AnalyticsEvents {
AnalyticsEvents._();
static const userSignUp = AnalyticsEvent(name: 'user_sign_up');
static const userLogin = AnalyticsEvent(name: 'user_login');

static const kPurchaseComplete = 'purchase_complete';
static const kPurchaseValue = 'purchase_value';
static const kPurchaseCurrency = 'purchase_currency';
static const kPurchaseTransactionId = 'purchase_transaction_id';
static AnalyticsEvent purchaseComplete({
required final double value,
required final String currency,
required final String transactionId,
}) =>
AnalyticsEvent(
name: kPurchaseComplete,
parameters: {
kPurchaseValue: value,
kPurchaseCurrency: currency,
kPurchaseTransactionId: transactionId,
},
);

static const kScreenView = 'screen_view';
static const kScreenViewScreenName = 'screen_name';
static AnalyticsEvent screenView(final String screenName) => AnalyticsEvent(
name: kScreenView,
parameters: {kScreenViewScreenName: screenName},

```

```
