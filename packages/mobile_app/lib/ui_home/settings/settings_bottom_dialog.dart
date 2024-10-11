import 'package:flutter/cupertino.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/hooks/use_monetization_type.dart';
import 'package:mobile_app/ui_home/settings/language_bottom_sheet.dart';

class SettingsBottomPopup extends StatelessWidget {
  const SettingsBottomPopup({
    required this.onClose,
    super.key,
  });
  final VoidCallback onClose;
  @override
  Widget build(final BuildContext context) {
    final (:isSubscriptionMonetization) =
        useIsSubscriptionMonetization(context);
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
              onTap: () {
                // TODO(arenukvern): description
              },
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
              onTap: () {
                // TODO(arenukvern): description
              },
              title: LocalizedMap(
                value: {
                  languages.en: 'Privacy policy',
                  languages.it: 'Condizioni di utilizzo',
                  languages.ru: 'Политика конфиденциальности',
                },
              ).getValue(locale),
              icon: Icons.privacy_tip_outlined,
            ),
            UiDivider.size5(),
            if (isSubscriptionMonetization) ...[
              _ListTile(
                onTap: () async => AppPathsController.of(context).toPaywall(),
                title: LocalizedMap(
                  value: {
                    languages.en: 'PRO version',
                    languages.it: 'Versione PRO',
                    languages.ru: 'Версия PRO',
                  },
                ).getValue(locale),
                icon: CupertinoIcons.star_fill,
              ),
              UiDivider.size1(),
            ],
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
  });
  final VoidCallback onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(final BuildContext context) => ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(title),
        trailing: Icon(icon),
      );
}
