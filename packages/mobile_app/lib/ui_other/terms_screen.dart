import 'package:mobile_app/common_imports.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(final BuildContext context) => UiScaffold(
        appBar: AppBar(
          leading: UiBackButton(),
        ),
        body: MdScreen(
          markdownUrlSource: Envs.termsUrl,
        ),
      );
}
