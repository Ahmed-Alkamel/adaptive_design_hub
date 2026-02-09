import 'package:flutter/material.dart';
import 'num_extensions.dart';

extension AdaptiveTextStyleExtension on TextStyle {
  /// copyWith(fontSize: fontSize * val) or just set fontSize
  TextStyle get sp => copyWith(fontSize: fontSize?.sp);

  /// Set generic font size
  TextStyle fontSizeExt(double s) => copyWith(fontSize: s);

  /// Adaptive line height
  TextStyle get h => copyWith(height: height?.h);

  /// Adaptive letter spacing
  TextStyle get ls => copyWith(letterSpacing: letterSpacing?.w);

  // FontWeight shortcuts
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  // Color shortcuts
  TextStyle colorExt(Color c) => copyWith(color: c);
}

extension AdaptiveTextWidgetExtension on Text {
  Text fontSize(double s) =>
      copyWith(style: (style ?? const TextStyle()).copyWith(fontSize: s.sp));
  Text fontWeight(FontWeight w) =>
      copyWith(style: (style ?? const TextStyle()).copyWith(fontWeight: w));
  Text color(Color c) =>
      copyWith(style: (style ?? const TextStyle()).copyWith(color: c));
  Text align(TextAlign a) => copyWith(textAlign: a);

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
