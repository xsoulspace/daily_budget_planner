import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CupertinoAppBar({
    required this.title,
    super.key,
    this.leading,
    this.trailing,
  });

  final Widget title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(final BuildContext context) => Container(
        height: preferredSize.height,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemGroupedBackground,
          border:
              Border(bottom: BorderSide(color: CupertinoColors.systemGrey5)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (leading case final leading?)
              Positioned(
                left: 1,
                child: leading,
              ),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.titleMedium!,
              child: title,
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
