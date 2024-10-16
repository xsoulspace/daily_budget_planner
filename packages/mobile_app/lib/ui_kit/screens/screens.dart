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
  const UiCircularProgress({super.key});

  @override
  Widget build(final BuildContext context) => Center(
        child: CupertinoActivityIndicator(color: context.colorScheme.primary),
      );
}
