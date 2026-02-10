import 'package:flutter/material.dart';
import '../core/adaptive_design_hub.dart';
import '../theme/adaptive_theme.dart';

extension AdaptiveContextExtension on BuildContext {
  // Theme Shortcuts

  /// Access the nearest [ThemeData] from the current context.
  ThemeData get theme => Theme.of(this);

  /// Access the nearest [TextTheme] from the current context.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Access the nearest [ColorScheme] from the current context.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Adaptive Theme Shortcut

  /// Access the global [AdaptiveTheme] configured in [AdaptiveDesignHub].
  AdaptiveTheme get adaptiveTheme => AdaptiveDesignHub().theme;

  /// Access the global [AdaptiveColors] configured in [AdaptiveDesignHub].
  AdaptiveColors get adaptiveColors => AdaptiveDesignHub().theme.colors;

  /// Access the global [AdaptiveTypography] configured in [AdaptiveDesignHub].
  AdaptiveTypography get adaptiveTypography =>
      AdaptiveDesignHub().theme.typography;

  /// Access the global [AdaptiveSpacing] configured in [AdaptiveDesignHub].
  AdaptiveSpacing get adaptiveSpacing => AdaptiveDesignHub().theme.spacing;

  // MediaQuery Shortcuts

  /// Access [MediaQueryData] from the current context.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// The size of the media in logical pixels (e.g, the size of the screen).
  Size get screenSize => mediaQuery.size;

  /// The horizontal extent of this size.
  double get screenWidth => screenSize.width;

  /// The vertical extent of this size.
  double get screenHeight => screenSize.height;

  /// The parts of the display that are partially obscured by system UI,
  /// typically by the hardware display "notches" or the system status bar.
  EdgeInsets get padding => mediaQuery.padding;

  /// The parts of the display that are completely obscured by system UI,
  /// typically by the device's keyboard.
  EdgeInsets get viewPadding => mediaQuery.viewPadding;

  /// The parts of the display that are completely obscured by system UI,
  /// typically by the device's keyboard.
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  /// The orientation of the media (e.g., whether the device is in landscape or portrait mode).
  Orientation get orientation => mediaQuery.orientation;

  /// Whether the device is in portrait mode.
  bool get isPortrait => orientation == Orientation.portrait;

  /// Whether the device is in landscape mode.
  bool get isLandscape => orientation == Orientation.landscape;

  // Adaptive Methods (Explicit context usage)

  /// Scale width based on context (if supported by adapter, otherwise global).
  ///
  /// This is an alternative to `10.w` that explicitly uses the context,
  /// which can be useful for testing or specific adapter implementations.
  double w(num value) => AdaptiveDesignHub().adapter.setWidth(value);

  /// Scale height based on context.
  ///
  /// This is an alternative to `10.h` that explicitly uses the context.
  double h(num value) => AdaptiveDesignHub().adapter.setHeight(value);

  /// Scale radius based on context.
  ///
  /// This is an alternative to `10.r` that explicitly uses the context.
  double r(num value) => AdaptiveDesignHub().adapter.setRadius(value);

  /// Scale font size based on context.
  ///
  /// This is an alternative to `10.sp` that explicitly uses the context.
  double sp(num value) => AdaptiveDesignHub().adapter.setSp(value);
}
