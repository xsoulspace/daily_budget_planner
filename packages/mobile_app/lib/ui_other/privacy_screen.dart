import 'package:mobile_app/common_imports.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(final BuildContext context) => UiScaffold(
        appBar: AppBar(
          leading: UiBackButton(),
        ),
        body: MdScreen(
          markdownUrlSource: Envs.privacyPolicyUrl,
        ),
      );
}
