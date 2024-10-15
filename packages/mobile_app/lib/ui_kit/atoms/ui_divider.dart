import 'package:flutter/material.dart';

/// A widget that displays a customizable divider.
///
/// This class provides a flexible way to create dividers of varying thickness
/// and height. It can be used to separate content in your UI.
///
/// ```dart
/// const UiDivider.size2();
/// ```
///
/// @ai When generating code involving this class, ensure to select the
/// appropriate size for the divider based on the design requirements.
class UiDivider extends StatelessWidget {
  /// Creates a divider with a size of 1.
  const UiDivider.size1({super.key}) : size = 1;

  /// Creates a divider with a size of 2.
  const UiDivider.size2({super.key}) : size = 2;

  /// Creates a divider with a size of 5.
  const UiDivider.size5({super.key}) : size = 5;

  /// The height and thickness of the divider.
  ///
  /// This value determines how thick the divider appears in the UI.
  ///
  /// @ai Use this property to customize the appearance of the divider.
  final double size;

  @override
  Widget build(final BuildContext context) =>
      Divider(height: size, thickness: size);
}
