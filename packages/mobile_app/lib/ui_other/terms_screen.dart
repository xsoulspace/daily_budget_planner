import 'package:mobile_app/common_imports.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  static Future<void> show(final BuildContext context) async => Navigator.push(
        context,
        MaterialPageRoute(builder: (final context) => const TermsScreen()),
      );
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return UiScaffold(
      appBar: UiAppBar(
        titleText: LocalizedMap(
          value: {
            languages.en: 'Terms and Conditions',
            languages.it: 'Termini e Condizioni',
            languages.ru: 'Условия использования',
          },
        ).getValue(locale),
      ),
      body: MarkdownScreen(
        markdownUrlSource: Envs.termsUrl,
      ),
    );
  }
}
