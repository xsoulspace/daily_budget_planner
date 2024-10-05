import 'package:mobile_app/common_imports.dart';

Locale useLocale(
  final BuildContext context, {
  final bool listen = true,
}) =>
    Provider.of<UiLocaleNotifier>(context, listen: listen).value;

class UiLocalizedText extends HookWidget {
  const UiLocalizedText({super.key});

  @override
  Widget build(final BuildContext context) {
    final text = useLocale(context);
    return Text(text.languageCode);
  }
}
