import 'package:flutter/cupertino.dart';
import 'package:mobile_app/common_imports.dart';

class UiTextActionButton extends StatelessWidget {
  const UiTextActionButton.cancel({super.key, this.onPressed})
      : isCancel = true;
  const UiTextActionButton.done({super.key, this.onPressed}) : isCancel = false;
  final VoidCallback? onPressed;
  final bool isCancel;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final textTitle = (isCancel
            ? LocalizedMap(
                value: {
                  languages.en: 'Cancel',
                  languages.it: 'Annulla',
                  languages.ru: 'Отмена',
                },
              )
            : LocalizedMap(
                value: {
                  languages.en: 'Done',
                  languages.it: 'Fatto',
                  languages.ru: 'Готово',
                },
              ))
        .getValue(locale);
    return UiTextButton(
      onPressed: onPressed ?? () => context.router.pop(),
      title: Text(
        textTitle,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
      ),
    );
  }
}

class UiBackButton extends StatelessWidget {
  const UiBackButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(final BuildContext context) => UiBaseButton(
        onPressed: onPressed ?? () => context.router.pop(),
        builder: (final isPressed, final isHovered, final isFocused) =>
            Container(
          padding: const EdgeInsets.all(6),
          child: const Icon(CupertinoIcons.back),
        ),
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
