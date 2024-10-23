import 'package:mobile_app/common_imports.dart';

class UiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UiAppBar({
    this.titleText = '',
    this.leading,
    this.title,
    this.automaticallyImplyLeading = true,
    super.key,
  });
  final String titleText;
  final Widget? leading;
  final Widget? title;
  final bool automaticallyImplyLeading;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(final BuildContext context) => AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: leading ?? (automaticallyImplyLeading ? UiBackButton() : null),
        centerTitle: true,
        title: FittedBox(
          child: titleText.isEmpty ? title : title ?? Text(titleText),
        ),
      );
}
