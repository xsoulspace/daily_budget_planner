import 'package:flutter/material.dart';

/// Bottom-sheet layout with a scrollable [body] and a pinned [bottomBar].
///
/// Pure Flutter replacement for the smooth_sheets scaffold. The keyboard is
/// avoided via [MediaQuery.viewInsets] and the bottom bar stays visible while
/// the keyboard is open.
class UiBottomSheetScaffold extends StatelessWidget {
  const UiBottomSheetScaffold({
    required this.body,
    required this.bottomBar,
    required this.onPopInvoked,
    super.key,
  });
  final Widget body;
  final Widget bottomBar;
  final VoidCallback onPopInvoked;

  @override
  Widget build(final BuildContext context) {
    const sheetShape = ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );

    return SafeArea(
      bottom: false,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (final didPop, final result) async {
          if (didPop) return;
          return onPopInvoked();
        },
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: sheetShape,
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: SingleChildScrollView(child: body)),
                bottomBar,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
