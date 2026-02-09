import 'package:flutter/material.dart';
import '../extensions/num_extensions.dart';

class AdaptiveTheme {
  final AdaptiveColors colors;
  final AdaptiveTypography typography;
  final AdaptiveSpacing spacing;
  final List<ThemeExtension<dynamic>> extensions;

  AdaptiveTheme({
    AdaptiveColors? colors,
    AdaptiveTypography? typography,
    AdaptiveSpacing? spacing,
    this.extensions = const [],
  }) : colors = colors ?? AdaptiveColors(),
       typography = typography ?? AdaptiveTypography(),
       spacing = spacing ?? AdaptiveSpacing();

  /// Retrieve a custom ThemeExtension
  T? extension<T>() {
    for (final ext in extensions) {
      if (ext is T) {
        return ext as T;
      }
    }
    return null;
  }
}

class AdaptiveColors {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color error;
  final Color textPrimary;
  final Color textSecondary;

  AdaptiveColors({
    this.primary = Colors.blue,
    this.secondary = Colors.teal,
    this.background = Colors.white,
    this.surface = const Color(0xFFF5F5F5),
    this.error = Colors.red,
    this.textPrimary = Colors.black,
    this.textSecondary = Colors.grey,
  });
}

class AdaptiveTypography {
  final String? fontFamily;

  // Material 3 Scale
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;

  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;

  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;

  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  AdaptiveTypography({
    this.fontFamily,
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
  }) : displayLarge =
           (displayLarge ??
                   const TextStyle(fontSize: 57, fontWeight: FontWeight.w400))
               .copyWith(fontFamily: fontFamily),
       displayMedium =
           (displayMedium ??
                   const TextStyle(fontSize: 45, fontWeight: FontWeight.w400))
               .copyWith(fontFamily: fontFamily),
       displaySmall =
           (displaySmall ??
                   const TextStyle(fontSize: 36, fontWeight: FontWeight.w400))
               .copyWith(fontFamily: fontFamily),

       headlineLarge =
           (headlineLarge ??
                   const TextStyle(fontSize: 32, fontWeight: FontWeight.w400))
               .copyWith(fontFamily: fontFamily),
       headlineMedium =
           (headlineMedium ??
                   const TextStyle(fontSize: 28, fontWeight: FontWeight.w400))
               .copyWith(fontFamily: fontFamily),
       headlineSmall =
           (headlineSmall ??
                   const TextStyle(fontSize: 24, fontWeight: FontWeight.w400))
               .copyWith(fontFamily: fontFamily),

       titleLarge =
           (titleLarge ??
                   const TextStyle(fontSize: 22, fontWeight: FontWeight.w400))
               .copyWith(fontFamily: fontFamily),
       titleMedium =
           (titleMedium ??
                   const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
               .copyWith(fontFamily: fontFamily),
       titleSmall =
           (titleSmall ??
                   const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
               .copyWith(fontFamily: fontFamily),

       bodyLarge =
           (bodyLarge ??
                   const TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
               .copyWith(fontFamily: fontFamily),
       bodyMedium =
           (bodyMedium ??
                   const TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
               .copyWith(fontFamily: fontFamily),
       bodySmall =
           (bodySmall ??
                   const TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
               .copyWith(fontFamily: fontFamily),

       labelLarge =
           (labelLarge ??
                   const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
               .copyWith(fontFamily: fontFamily),
       labelMedium =
           (labelMedium ??
                   const TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
               .copyWith(fontFamily: fontFamily),
       labelSmall =
           (labelSmall ??
                   const TextStyle(fontSize: 11, fontWeight: FontWeight.w500))
               .copyWith(fontFamily: fontFamily);

  /// Returns a NEW AdaptiveTypography where all font sizes are scaled using .sp
  AdaptiveTypography get adapted {
    return AdaptiveTypography(
      fontFamily: fontFamily,
      displayLarge: _scale(displayLarge),
      displayMedium: _scale(displayMedium),
      displaySmall: _scale(displaySmall),
      headlineLarge: _scale(headlineLarge),
      headlineMedium: _scale(headlineMedium),
      headlineSmall: _scale(headlineSmall),
      titleLarge: _scale(titleLarge),
      titleMedium: _scale(titleMedium),
      titleSmall: _scale(titleSmall),
      bodyLarge: _scale(bodyLarge),
      bodyMedium: _scale(bodyMedium),
      bodySmall: _scale(bodySmall),
      labelLarge: _scale(labelLarge),
      labelMedium: _scale(labelMedium),
      labelSmall: _scale(labelSmall),
    );
  }

  TextStyle _scale(TextStyle style) {
    return style.copyWith(
      fontSize: style.fontSize?.sp,
      height: style.height?.h, // scale line height if provided
      letterSpacing: style.letterSpacing?.w, // scale letter spacing
    );
  }
}

class AdaptiveSpacing {
  final double xs;
  final double s;
  final double m;
  final double l;
  final double xl;
  final double xxl;

  const AdaptiveSpacing({
    this.xs = 4.0,
    this.s = 8.0,
    this.m = 16.0,
    this.l = 24.0,
    this.xl = 32.0,
    this.xxl = 48.0,
  });
}
