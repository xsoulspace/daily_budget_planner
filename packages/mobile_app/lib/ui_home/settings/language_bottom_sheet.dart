import 'package:mobile_app/common_imports.dart';

Future<void> showLanguageBottomSheet(final BuildContext context) async =>
    showModalBottomSheet(
      context: context,
      builder: (final context) => const LanguageBottomSheet(),
    );

class LanguageBottomSheet extends HookWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(final BuildContext context) {
    final appSettings = context.read<AppSettingsNotifier>();
    useListenable(appSettings.locale);

    return Column(
      children: [
        Stack(
          children: [
            ListTile(
              title: Text(
                context.s.chooseLanguage,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.s.done),
              ),
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          itemBuilder: (final context, final index) {
            final e = namedLocalesMap.values.elementAt(index);
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              dense: true,
              key: ValueKey(e),
              onTap: () async => appSettings.updateLocale(e.locale),
              tileColor: context.colorScheme.surface,
              title: Text(e.name),
              trailing: appSettings.locale.value == e.locale ||
                      context.s.localeName == e.locale.languageCode
                  ? const Icon(Icons.done).animate().fadeIn()
                  : null,
            );
          },
          separatorBuilder: (final context, final index) => const Gap(8),
          itemCount: namedLocalesMap.length,
        ),
      ],
    );
  }
}
