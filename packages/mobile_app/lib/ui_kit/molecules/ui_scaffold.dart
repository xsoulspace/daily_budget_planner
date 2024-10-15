import 'package:mobile_app/common_imports.dart';

class UiScaffold extends StatelessWidget {
  const UiScaffold({
    required this.body,
    this.appBar,
    super.key,
  });
  final Widget body;
  final PreferredSizeWidget? appBar;
  @override
  Widget build(final BuildContext context) => Scaffold(
        body: body,
        appBar: appBar,
      );
}
