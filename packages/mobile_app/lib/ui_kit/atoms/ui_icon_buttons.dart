import 'package:flutter/cupertino.dart';
import 'package:mobile_app/common_imports.dart';

class UiBackButton extends StatelessWidget {
  const UiBackButton({super.key});

  @override
  Widget build(final BuildContext context) => CupertinoNavigationBarBackButton(
        color: context.colorScheme.onSurface,
      );
}
