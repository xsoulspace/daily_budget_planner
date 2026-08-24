import 'package:flutter/foundation.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/hooks/use_monetization_type.dart';
import 'package:mobile_app/ui_home/settings/language_bottom_sheet.dart';
import 'package:mobile_app/ui_home/settings/ui_theme_mode_tile.dart';

class SettingsBottomPopup extends StatelessWidget {
  const SettingsBottomPopup({required this.onClose, super.key});
  final VoidCallback onClose;
  @override
  Widget build(final BuildContext context) => UiPopupDecoration(
    child:
        Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UiPopupListTile(
                  onTap: () async => AppPathsController.of(context).toTerms(),
                  title: LocalizedMap({
                    languages.en: 'Terms of use',
                    languages.it: 'Condizioni di utilizzo',
                    languages.ru: 'Условия использования',
                  }).getValue(useLocale(context)),
                  iconData: CupertinoIcons.doc_plaintext,
                ),
                const UiDivider.size1(),
                UiPopupListTile(
                  onTap: () async => AppPathsController.of(context).toPrivacy(),
                  title: LocalizedMap({
                    languages.en: 'Privacy policy',
                    languages.it: 'Condizioni di utilizzo',
                    languages.ru: 'Приватность',
                  }).getValue(useLocale(context)),
                  iconData: Icons.privacy_tip_outlined,
                ),
                const UiDivider.size1(),
                // ADR-0003: single flag-gated doorway to the prediction UI.
                if (context.select<AppSettingsNotifier, bool>(
                      (final c) => c.value.isPredictionUiEnabled,
                    ) ||
                    kDebugMode) ...[
                  UiPopupListTile(
                    iconData: Icons.money,
                    onTap: () async {
                      onClose();
                      AppPathsController.of(context).toPrediction();
                    },
                    title: LocalizedMap({
                      languages.en: 'Expenses prediction',
                      languages.it: 'Previsione delle spese',
                      languages.ru: 'Предположение о расходах',
                    }).getValue(useLocale(context)),
                  ),
                  const UiDivider.size1(),
                ],
                const UiDivider.size5(),
                if (context.watch<StoreReviewRequester>().isAvailable) ...[
                  UiLoader(
                    builder:
                        (final context, final isLoading, final setLoading) =>
                            UiPopupListTile(
                              isLoading: isLoading,
                              onTap: () async {
                                setLoading(true);
                                await context
                                    .read<StoreReviewRequester>()
                                    .requestReview(context: context);
                                setLoading(false);
                              },
                              title: LocalizedMap({
                                languages.en: 'Leave Review',
                                languages.it: 'Lascia un feedback',
                                languages.ru: 'Оставить отзыв',
                              }).getValue(useLocale(context)),
                              iconData: Icons.rate_review_outlined,
                            ),
                  ),
                  const UiDivider.size1(),
                ],
                if (Envs.isWiredashAvailable) ...[
                  UiPopupListTile(
                    onTap: () async => UserFeedback.show(context),
                    title: LocalizedMap({
                      languages.en: 'Support & Suggest',
                      languages.it: 'Supporto & Suggerimenti',
                      languages.ru: 'Помощь и предложения',
                    }).getValue(useLocale(context)),
                    iconData: CupertinoIcons.question_circle,
                  ),
                  const UiDivider.size5(),
                ],
                if (kDebugMode) ...[
                  const UiThemeModeTile(),
                  const UiDivider.size1(),
                ],
                if (useIsSubscriptionMonetization(
                  context,
                ).isSubscriptionMonetization) ...[
                  UiPopupListTile(
                    onTap: () async =>
                        AppPathsController.of(context).toManageSubscription(),
                    title: LocalizedMap({
                      languages.en: 'Manage subscription',
                      languages.it: 'Gestisci abbonamento',
                      languages.ru: 'Управление подпиской',
                    }).getValue(useLocale(context)),
                    iconData: CupertinoIcons.star,
                  ),
                  const UiDivider.size1(),
                ],
                UiPopupListTile(
                  onTap: () async =>
                      AppPathsController.of(context).toExplanation(),
                  title: LocalizedMap({
                    languages.en: 'How to use?',
                    languages.it: 'Come usarlo?',
                    languages.ru: 'Как пользоваться?',
                  }).getValue(useLocale(context)),
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
