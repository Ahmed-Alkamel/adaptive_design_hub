import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../adapters/responsive_adapter.dart';
import '../adapters/screen_util_adapter.dart';
import '../adapters/native_adapter.dart';
import '../theme/adaptive_theme.dart';

class AdaptiveDesignHub {
  static final AdaptiveDesignHub _instance = AdaptiveDesignHub._internal();

  factory AdaptiveDesignHub() => _instance;

  AdaptiveDesignHub._internal();

  late ResponsiveAdapter _adapter;
  late AdaptiveTheme _theme;

  ResponsiveAdapter get adapter => _adapter;
  AdaptiveTheme get theme => _theme;

  /// Initialize AdaptiveDesignHub with optional ScreenUtil support
  /// [useScreenUtil] - If true, uses flutter_screenutil for sizing. Defaults to true.
  /// [designSize] - The baseline design size (e.g., from Figma). Defaults to 375x812.
  /// [theme] - Custom theme configuration.
  /// [scaleText] - specific to ScreenUtil
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
