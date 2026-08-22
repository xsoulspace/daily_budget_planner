import 'package:flutter/cupertino.dart';

/// iOS-style modal sheet route from the Flutter SDK.
///
/// Replaces smooth_sheets' `CupertinoModalSheetRoute`. Provides the same
/// drag-to-dismiss behavior natively.
class UiModalSheetRoute<T> extends CupertinoSheetRoute<T> {
  UiModalSheetRoute({required final WidgetBuilder builder, super.settings})
    : super(builder: builder);
}

/// Shows an iOS-style modal sheet using the Flutter SDK.
Future<T?> showUiModalSheet<T>({
  required final BuildContext context,
  required final WidgetBuilder builder,
}) => showCupertinoSheet<T>(
  context: context,
  useNestedNavigation: false,
  scrollableBuilder: (final context, final scrollController) =>
      PrimaryScrollController(
        controller: scrollController,
        child: Builder(key: UniqueKey(), builder: builder),
      ),
);
