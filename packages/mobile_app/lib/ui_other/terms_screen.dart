import 'package:mobile_app/common_imports.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return UiScaffold(
      appBar: AppBar(
        leading: UiBackButton(),
        title: Text(
          LocalizedMap(
            value: {
              languages.en: 'Terms and Conditions',
              languages.it: 'Termini e Condizioni',
              languages.ru: 'Условия использования',
            },
          ).getValue(locale),
        ),
      ),
      body: MarkdownScreen(
        markdownUrlSource: Envs.termsUrl,
      ),
    );
  }
}
