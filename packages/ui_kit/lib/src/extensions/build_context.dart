import 'package:flutter/material.dart';
import 'package:ui_locale/ui_locale.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  S get s => S.of(this);
}
