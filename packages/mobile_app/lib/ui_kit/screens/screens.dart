import 'package:flutter/cupertino.dart';
import 'package:mobile_app/common_imports.dart';

export 'markdown_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(final BuildContext context) => Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          alignment: Alignment.center,
          color: context.colorScheme.surface,
          child: const UiCircularProgress(),
        ),
      );
}

class UiCircularProgress extends StatelessWidget {
  const UiCircularProgress({super.key}) : centered = true;
  const UiCircularProgress.uncentered({super.key}) : centered = false;
  final bool centered;
  @override
  Widget build(final BuildContext context) {
    final child = CupertinoActivityIndicator(
      color: context.colorScheme.primary,
    );
    return centered ? Center(child: child) : child;
  }
}
