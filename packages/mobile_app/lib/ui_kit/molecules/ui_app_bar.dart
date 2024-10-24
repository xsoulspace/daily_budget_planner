import 'package:mobile_app/common_imports.dart';

class UiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UiAppBar({
    this.titleText = '',
    this.leading,
    this.title,
    this.trailing,
    this.automaticallyImplyLeading = true,
    super.key,
  });
  final String titleText;
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final bool automaticallyImplyLeading;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(final BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: kToolbarHeight,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (leading case final leading?)
              Positioned(
                left: 1,
                child: leading,
              )
            else if (automaticallyImplyLeading)
              Positioned(
                left: 1,
                child: const UiBackButton(),
              ),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.titleMedium!,
              child: FittedBox(
                child: titleText.isEmpty ? title : title ?? Text(titleText),
              ),
            ),
            if (trailing case final trailing?)
              Positioned(
                right: 1,
                child: trailing,
              ),
          ],
        ),
      );
}
