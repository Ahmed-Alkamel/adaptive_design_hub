import 'package:flutter/material.dart';

import '../adapters/responsive_adapter.dart';
import '../adapters/screen_util_adapter.dart';
import '../adapters/native_adapter.dart';
import '../theme/adaptive_theme.dart';

/// The core entry point for the Adaptive Design Hub library.
///
/// This singleton class manages the initialization of the responsive adapter
/// and the application-wide adaptive theme. It must be initialized before usage
/// (typically in `main.dart` or before `runApp`).
class AdaptiveDesignHub {
  static final AdaptiveDesignHub _instance = AdaptiveDesignHub._internal();

  /// Returns the singleton instance of [AdaptiveDesignHub].
  factory AdaptiveDesignHub() => _instance;

  AdaptiveDesignHub._internal();

  late ResponsiveAdapter _adapter;
  late AdaptiveTheme _theme;

  /// The active [ResponsiveAdapter] used for calculating responsive dimensions.
  ResponsiveAdapter get adapter => _adapter;

  /// The active [AdaptiveTheme] containing colors, typography, and spacing.
  AdaptiveTheme get theme => _theme;

  /// Initialize AdaptiveDesignHub with optional ScreenUtil support.
  ///
  /// This method sets up the responsive adapter and applies the initial theme.
  ///
  /// Parameters:
  /// * [useScreenUtil] - If true (default), uses `flutter_screenutil` for sizing.
  ///   If false, falls back to a native calculation adapter.
  /// * [designSize] - The baseline design dimensions (e.g., from Figma). Defaults to 375x812.
  /// * [theme] - Custom theme configuration. If not provided, a default theme is used.
  /// * [minTextAdapt] - (ScreenUtil only) Whether to adapt text size to minimum. Defaults to true.
  /// * [splitScreenMode] - (ScreenUtil only) Whether to support split screen mode. Defaults to false.
  void init({
    bool useScreenUtil = true,
    Size designSize = const Size(375, 812),
    AdaptiveTheme? theme,
    bool minTextAdapt = true,
    bool splitScreenMode = false,
  }) {
    // If a theme is provided, we adapt its typography immediately so accessed styles are already scaled.
    // Or we store the raw theme and adapt on access?
    // Better to adapt on init or provide a getter that returns adapted.
    // For simplicity and performance, we'll adapt the default or provided theme once we know we are initialized.
    // However, since adapter is set AFTER this check, we need to be careful.

    // 1. Set Adapter
    if (useScreenUtil) {
      _adapter = ScreenUtilAdapter();
      // Note: When using ScreenUtil, you must wrap your MaterialApp with ScreenUtilInit.
      // Flex just delegates to ScreenUtil in this mode.
    } else {
      _adapter = NativeAdapter(designSize: designSize);
    }

    // 2. Set Theme (now that adapter is ready for .sp calls via num_extensions)
    // We create a "raw" theme first if null
    final rawTheme = theme ?? AdaptiveTheme();

    // 3. Adapt the typography using the now-initialized adapter
    _theme = AdaptiveTheme(
      colors: rawTheme.colors,
      spacing: rawTheme.spacing,
      extensions: rawTheme.extensions,
      typography: rawTheme.typography.adapted,
    );
  }
}
