import 'package:mobile_app/common_imports.dart';

/// ADR-0003 Phase 3: dismissible teaser card that deep-links into the
/// prediction UI. Hidden while dismissed; re-shown only when the flag
/// flips back (no nagging cooldown timer for now).
class PredictionTeaserCard extends HookWidget {
  const PredictionTeaserCard({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final isEnabled = context.select<AppSettingsNotifier, bool>(
      (final c) => c.value.isPredictionUiEnabled,
    );
    final isDismissed = context.select<AppSettingsNotifier, bool>(
      (final c) => !c.value.showPredictionTeaser,
    );
    if (!isEnabled || isDismissed) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Icon(Icons.insights_rounded, color: context.colorScheme.primary),
            const Gap(12),
            Expanded(
              child: Text(
                LocalizedMap({
                  languages.en: 'See how your budget evolves',
                  languages.it: 'Scopri come evolve il tuo budget',
                  languages.ru: 'Узнайте, как меняется ваш бюджет',
                }).getValue(locale),
                style: context.textTheme.bodyMedium,
              ),
            ),
            IconButton(
              tooltip: 'Dismiss',
              icon: Icon(
                Icons.close,
                size: 18,
                color: context.colorScheme.onSurface.withOpacity(0.4),
              ),
              onPressed: () async {
                unawaited(
                  context.read<AnalyticsManager>().analyticsService.logEvent(
                    const AnalyticsEvent(name: 'teaser_dismissed'),
                  ),
                );
                await context
                    .read<AppSettingsNotifier>()
                    .dismissPredictionTeaser();
              },
            ),
            UiTextButton(
              onPressed: () {
                unawaited(
                  context.read<AnalyticsManager>().analyticsService.logEvent(
                    const AnalyticsEvent(name: 'prediction_opened'),
                  ),
                );
                AppPathsController.of(context).toPrediction();
              },
              title: Text(
                LocalizedMap({
                  languages.en: 'Try it',
                  languages.it: 'Provalo',
                  languages.ru: 'Попробовать',
                }).getValue(locale),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
