import 'package:mobile_app/common_imports.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});
  static Future<void> show(final BuildContext context) async => Navigator.push(
        context,
        MaterialPageRoute(builder: (final context) => const PrivacyScreen()),
      );
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return UiScaffold(
      appBar: AppBar(
        leading: UiBackButton(),
        title: Text(
          LocalizedMap(
            value: {
              languages.en: 'Privacy Policy',
              languages.it: 'Politica sulla privacy',
              languages.ru: 'Приватность',
            },
          ).getValue(locale),
        ),
      ),
      body: MarkdownScreen(
        markdownUrlSource: Envs.privacyPolicyUrl,
      ),
    );
  }
}
