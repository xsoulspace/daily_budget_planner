import 'package:flutter/cupertino.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/hooks/use_monetization_type.dart';
import 'package:mobile_app/ui_home/settings/language_bottom_sheet.dart';
import 'package:mobile_app/ui_prediction/ui_prediction_screen.dart';

class SettingsBottomPopup extends StatelessWidget {
  const SettingsBottomPopup({
    required this.onClose,
    super.key,
  });
  final VoidCallback onClose;
  @override
  Widget build(final BuildContext context) {
    final storeReviewRequester = context.watch<StoreReviewRequester>();
    final (:isSubscriptionMonetization) =
        useIsSubscriptionMonetization(context);
    final (:activeSubscription) = useActiveSubscription(context);
    final locale = useLocale(context);
    return Card(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 270,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ListTile(
              onTap: () async => AppPathsController.of(context).toTerms(),
              title: LocalizedMap(
                value: {
                  languages.en: 'Terms of use',
                  languages.it: 'Condizioni di utilizzo',
                  languages.ru: 'Условия использования',
                },
              ).getValue(locale),
              icon: CupertinoIcons.doc_plaintext,
            ),
            UiDivider.size1(),
            _ListTile(
              onTap: () async => AppPathsController.of(context).toPrivacy(),
              title: LocalizedMap(
                value: {
                  languages.en: 'Privacy policy',
                  languages.it: 'Condizioni di utilizzo',
                  languages.ru: 'Приватность',
                },
              ).getValue(locale),
              icon: Icons.privacy_tip_outlined,
            ),
            _ListTile(
              icon: Icons.money,
              onTap: () async => UiPredictionScreen.show(context),
              title: LocalizedMap(
                value: {
                  languages.en: 'Expenses prediction',
                  languages.it: 'Previsione delle spese',
                  languages.ru: 'Предположение о расходах',
                },
              ).getValue(locale),
            ),
            UiDivider.size5(),
            if (storeReviewRequester.isAvailable) ...[
              UiLoader(
                builder: (final context, final isLoading, final setLoading) =>
                    _ListTile(
                  isLoading: isLoading,
                  onTap: () async {
                    setLoading(true);
                    await storeReviewRequester.requestReview(context: context);
                    setLoading(false);
                  },
                  title: LocalizedMap(
                    value: {
                      languages.en: 'Leave Review',
                      languages.it: 'Lascia un feedback',
                      languages.ru: 'Оставить отзыв',
                    },
                  ).getValue(locale),
                  icon: Icons.rate_review_outlined,
                ),
              ),
              UiDivider.size1(),
            ],
            if (Envs.isWiredashAvailable) ...[
              _ListTile(
                onTap: () async => UserFeedback.show(context),
                title: LocalizedMap(
                  value: {
                    languages.en: 'Support & Suggest',
                    languages.it: 'Supporto & Suggerimenti',
                    languages.ru: 'Помощь и предложения',
                  },
                ).getValue(locale),
                icon: CupertinoIcons.question_circle,
              ),
              UiDivider.size5(),
            ],
            if (isSubscriptionMonetization) ...[
              if (activeSubscription != null)
                _ListTile(
                  onTap: () async =>
                      AppPathsController.of(context).toManageSubscription(),
                  title: LocalizedMap(
                    value: {
                      languages.en: 'Manage subscription',
                      languages.it: 'Gestisci abbonamento',
                      languages.ru: 'Управление подпиской',
                    },
                  ).getValue(locale),
                  icon: CupertinoIcons.star,
                )
              else
                _ListTile(
                  onTap: () async => AppPathsController.of(context).toPaywall(),
                  title: LocalizedMap(
                    value: {
                      languages.en: 'PRO version',
                      languages.it: 'Versione PRO',
                      languages.ru: 'Версия PRO',
                    },
                  ).getValue(locale),
                  icon: CupertinoIcons.star,
                ),
              UiDivider.size1(),
            ],
            _ListTile(
              onTap: () async => AppPathsController.of(context).toExplanation(),
              title: LocalizedMap(
                value: {
                  languages.en: 'How to use?',
                  languages.it: 'Come usarlo?',
                  languages.ru: 'Как пользоваться?',
                },
              ).getValue(locale),
              icon: CupertinoIcons.wand_stars,
            ),
            UiDivider.size1(),
            _ListTile(
              onTap: () {
                onClose();
                unawaited(showLanguageBottomSheet(context));
              },
              title: context.s.language,
              icon: Icons.language,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.onTap,
    required this.title,
    required this.icon,
    this.isLoading = false,
  });
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  final bool isLoading;

  @override
  Widget build(final BuildContext context) => ListTile(
        onTap: isLoading ? () {} : onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(title),
        trailing:
            isLoading ? const UiCircularProgress.uncentered() : Icon(icon),
      );
}
