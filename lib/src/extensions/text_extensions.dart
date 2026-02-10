import 'package:flutter/material.dart';
import 'num_extensions.dart';

/// Extensions on [TextStyle] for fluent styling.
extension AdaptiveTextStyleExtension on TextStyle {
  /// Scales the font size using `.sp`.
  TextStyle get sp => copyWith(fontSize: fontSize?.sp);

  /// Sets a specific font size (not scaled by default, use .sp after if needed).
  TextStyle fontSizeExt(double s) => copyWith(fontSize: s);

  /// Scales the line height using `.h`.
  TextStyle get h => copyWith(height: height?.h);

  /// Scales the letter spacing using `.w`.
  TextStyle get ls => copyWith(letterSpacing: letterSpacing?.w);

  // FontWeight shortcuts

  /// Sets font weight to Bold.
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  /// Sets font weight to Semi-bold (w600).
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Sets font weight to Medium (w500).
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Sets font weight to Regular (w400).
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Sets font weight to Light (w300).
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  // Color shortcuts

  /// Sets the text color.
  TextStyle colorExt(Color c) => copyWith(color: c);
}

/// Extensions on the [Text] widget for fluent styling and configuration.
///
/// Allows chaining methods like `text.bold.color(Colors.red).center`.
extension AdaptiveTextWidgetExtension on Text {
  /// Sets the font size (applies .sp automatically).
  Text fontSize(double s) =>
      copyWith(style: (style ?? const TextStyle()).copyWith(fontSize: s.sp));

  /// Sets the font weight.
  Text fontWeight(FontWeight w) =>
      copyWith(style: (style ?? const TextStyle()).copyWith(fontWeight: w));

  /// Sets the text color.
  Text color(Color c) =>
      copyWith(style: (style ?? const TextStyle()).copyWith(color: c));

  /// Sets the text alignment.
  Text align(TextAlign a) => copyWith(textAlign: a);

  // FontWeight shortcuts

  /// Applies bold font weight.
  Text get bold => fontWeight(FontWeight.bold);

  /// Applies semi-bold font weight.
  Text get semiBold => fontWeight(FontWeight.w600);

  /// Applies medium font weight.
  Text get medium => fontWeight(FontWeight.w500);

  /// Applies regular font weight.
  Text get regular => fontWeight(FontWeight.w400);

  /// Applies light font weight.
  Text get light => fontWeight(FontWeight.w300);

  /// Helper to copy properties to a new Text widget.
  Text copyWith({
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return Text(
      data ?? '',
      style: this.style?.merge(style) ?? style,
      textAlign: textAlign ?? this.textAlign,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
    );
  }
}
