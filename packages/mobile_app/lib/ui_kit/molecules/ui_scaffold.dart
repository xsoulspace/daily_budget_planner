import 'package:mobile_app/common_imports.dart';

class UiScaffold extends StatelessWidget {
  const UiScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    super.key,
  });
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  @override
  Widget build(final BuildContext context) => Scaffold(
        body: body,
        appBar: appBar,
        floatingActionButton: floatingActionButton,
      );
}

class UiColumnScaffold extends StatelessWidget {
  const UiColumnScaffold({
    required this.children,
    this.appBar,
    this.floatingActionButton,
    super.key,
  });
  final List<Widget> children;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  @override
  Widget build(final BuildContext context) => UiScaffold(
        body: Column(children: children),
        appBar: appBar,
        floatingActionButton: floatingActionButton,
      );
}
