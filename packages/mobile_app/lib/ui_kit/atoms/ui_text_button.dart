import 'package:mobile_app/common_imports.dart';

class UiTextButton extends StatelessWidget {
  const UiTextButton({
    required this.onPressed,
    this.textTitle = '',
    this.tooltip = '',
    this.isLoading = false,
    this.title,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
    super.key,
  });
  final String textTitle;
  final bool isLoading;
  final String tooltip;
  final Widget? title;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  @override
  Widget build(final BuildContext context) => UiBaseButton(
        tooltip: tooltip,
        onPressed: isLoading ? () {} : onPressed,
        builder: (final context, final focused, final onlyFocused) => Container(
          padding: padding,
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: title ?? Text(textTitle)),
              if (isLoading) ...[
                Gap(8),
                UiCircularProgress.uncentered(),
              ],
            ],
          ),
        ),
      );
}
