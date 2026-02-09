import 'package:flutter/material.dart';
import '../core/adaptive_design_hub.dart';
import '../theme/adaptive_theme.dart';

extension AdaptiveContextExtension on BuildContext {
  // Theme Shortcuts
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Adaptive Theme Shortcut
  AdaptiveTheme get adaptiveTheme => AdaptiveDesignHub().theme;
  AdaptiveColors get adaptiveColors => AdaptiveDesignHub().theme.colors;
  AdaptiveTypography get adaptiveTypography =>
      AdaptiveDesignHub().theme.typography;
  AdaptiveSpacing get adaptiveSpacing => AdaptiveDesignHub().theme.spacing;

  // MediaQuery Shortcuts
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  Orientation get orientation => mediaQuery.orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  // Adaptive Methods (Explicit context usage)
  /// Scale width based on context (if supported by adapter, otherwise global)
  double w(num value) => AdaptiveDesignHub().adapter.setWidth(value);

  /// Scale height based on context
  double h(num value) => AdaptiveDesignHub().adapter.setHeight(value);

  /// Scale radius based on context
  double r(num value) => AdaptiveDesignHub().adapter.setRadius(value);

  /// Scale font size based on context
  double sp(num value) => AdaptiveDesignHub().adapter.setSp(value);
}
