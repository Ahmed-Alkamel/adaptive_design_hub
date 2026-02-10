import 'package:flutter/material.dart';
import '../extensions/num_extensions.dart';

/// A centralized container for the application's design system.
///
/// Wraps colors, typography, spacing, and custom extensions into a single
/// accessible object.
class AdaptiveTheme {
  /// Semantic color palette.
  final AdaptiveColors colors;

  /// Material 3 typography scale (can be adapted to screen size).
  final AdaptiveTypography typography;

  /// Standardized spacing constants.
  final AdaptiveSpacing spacing;

  /// List of custom [ThemeExtension]s for extending the theme.
  final List<ThemeExtension<dynamic>> extensions;

  /// Creates a new [AdaptiveTheme].
  AdaptiveTheme({
    AdaptiveColors? colors,
    AdaptiveTypography? typography,
    AdaptiveSpacing? spacing,
    this.extensions = const [],
  }) : colors = colors ?? AdaptiveColors(),
       typography = typography ?? AdaptiveTypography(),
       spacing = spacing ?? AdaptiveSpacing();

  /// Retrieve a custom ThemeExtension of type [T].
  ///
  /// Returns null if no extension of type [T] is found.
  T? extension<T>() {
    for (final ext in extensions) {
      if (ext is T) {
        return ext as T;
      }
    }
    return null;
  }
}

/// Defines the semantic color palette for the application.
class AdaptiveColors {
  /// Primary brand color.
  final Color primary;

  /// Secondary brand color / accent.
  final Color secondary;

  /// Background color for pages/scaffolds.
  final Color background;

  /// Surface color for cards, sheets, etc.
  final Color surface;

  /// Color for error states.
  final Color error;

  /// Primary text color.
  final Color textPrimary;

  /// Secondary text color.
  final Color textSecondary;

  /// Creates a new [AdaptiveColors] palette.
  ///
  /// Defaults to a standard blue/teal/white/grey scheme if not specified.
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

/// Defines the typography scale for the application, following Material 3 guidelines.
///
/// Can be automatically adapted to screen size using the [adapted] getter.
class AdaptiveTypography {
  /// The font family to apply to all text styles.
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

  /// Creates a new [AdaptiveTypography] scale.
  ///
  /// If styles are not provided, defaults to standard Material 3 sizes and weights.
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

  /// Returns a NEW [AdaptiveTypography] instance where all font sizes, line heights,
  /// and letter spacings are scaled using the active adapter (e.g., `.sp`).
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

/// Standardized spacing constants.
class AdaptiveSpacing {
  /// Extra small spacing (4.0).
  final double xs;

  /// Small spacing (8.0).
  final double s;

  /// Medium spacing (16.0).
  final double m;

  /// Large spacing (24.0).
  final double l;

  /// Extra large spacing (32.0).
  final double xl;

  /// Extra extra large spacing (48.0).
  final double xxl;

  /// Creates a new [AdaptiveSpacing] set.
  const AdaptiveSpacing({
    this.xs = 4.0,
    this.s = 8.0,
    this.m = 16.0,
    this.l = 24.0,
    this.xl = 32.0,
    this.xxl = 48.0,
  });
}
