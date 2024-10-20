import 'package:flutter/cupertino.dart';
import 'package:mobile_app/common_imports.dart';

class UiBackButton extends StatelessWidget {
  const UiBackButton({super.key});

  @override
  Widget build(final BuildContext context) => CupertinoNavigationBarBackButton(
        color: context.colorScheme.onSurface,
      );
}

class UiCloseButton extends StatelessWidget {
  const UiCloseButton({super.key});

  @override
  Widget build(final BuildContext context) => UiBaseButton(
        onPressed: () => context.router.pop(),
        builder: (final isPressed, final isHovered, final isFocused) =>
            Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.secondary.withOpacity(0.2),
          ),
          child: const Icon(CupertinoIcons.clear, size: 16),
        ),
      );
}
