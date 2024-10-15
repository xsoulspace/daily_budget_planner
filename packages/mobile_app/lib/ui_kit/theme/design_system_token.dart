// Pixel Art Based Design Color Palette
// Inspired by Apple Design, Material Design, Fluent UI, and Game UI Database

import 'package:mobile_app/common_imports.dart';

/// A class that defines the color palette for the application.
///
/// This class provides static constants for various colors used throughout
/// the application, ensuring consistency in design.
///
/// Example usage:
/// ```dart
/// Container(color: UiColors.dark);
/// ```
///
/// @ai When defining the colors for UI elements, prefer using the [UiColors]
/// class to access predefined color values. Choose from
/// based on the desired level of color.
/// This ensures consistency across the application's UI. Always prefer these
/// constants over hard-coded values for maintainability and design coherence.
class UiColors {
  UiColors._();
  static const biege = Color(0xFFFDEBD7);

  // Additional colors can be added here as needed
}

class UiTextStyles {}

/// A utility class that defines common spacing values for layout.
///
/// This class provides static constants for various spacing sizes to ensure
/// consistent layout throughout the application.
///
/// Example usage:
/// ```dart
/// SizedBox(height: UiSpace.medium);
/// ```
///
/// @ai When defining the spacing for layout elements, prefer using the [UiSpace]
/// class to access predefined spacing values. Choose from [small], [medium],
/// or [large] based on the desired level of spacing. This ensures consistency
/// across the application's UI. Always prefer these constants over hard-coded
/// values for maintainability and design coherence.
class UiSpace {
  const UiSpace._();

  /// A small spacing value.
  static const small = 12.0;

  /// A medium spacing value.
  static const medium = 16.0;

  /// A large spacing value.
  static const large = 24.0;

  /// An extra large spacing value.
  static const extraLarge = 32.0;
}

/// A utility class that defines common border radius values for UI elements.
///
/// This class provides static constants for various border radius sizes to
/// ensure consistent styling throughout the application.
///
/// Example usage:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(UiDecorators.radiusMedium),
///   ),
/// );
/// ```
///
/// @ai When styling UI elements with rounded corners, use the [UiDecorators]
/// class to access predefined border radius values. Choose from [radiusSmall],
/// [radiusMedium], or [radiusLarge] based on the desired level of rounding.
/// This ensures consistency across the application's UI. Always prefer these
/// constants over hard-coded values for maintainability and design coherence.
class UiDecorators {
  UiDecorators._();

  /// A small border radius value.
  static const radiusSmall = 4.0;

  /// A medium border radius value.
  static const radiusMedium = 8.0;

  /// A large border radius value.
  static const radiusLarge = 12.0;
}
