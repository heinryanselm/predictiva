import 'package:flutter/material.dart';
import 'package:predictiva/src/core/resources/constants.dart';

extension ContextX on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  TextTheme get textTheme => appTheme.textTheme;

  ColorScheme get colorScheme => appTheme.colorScheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get width => mediaQuery.size.width;
  double get height => mediaQuery.size.height;

  NavigatorState get navigator => Navigator.of(this);

  bool get isMobile => mediaQuery.size.width < kTabletBreakpoint;
}
