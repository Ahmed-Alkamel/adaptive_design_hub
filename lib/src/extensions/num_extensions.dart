import 'package:flutter/material.dart';
import '../core/adaptive_design_hub.dart';

/// Extensions on [num] (int, double) for easy access to responsive values.
extension AdaptiveNumExtension on num {
  /// Calculates the responsive width.
  ///
  /// Example: `10.w`
  double get w => AdaptiveDesignHub().adapter.setWidth(this);

  /// Calculates the responsive height.
  ///
  /// Example: `10.h`
  double get h => AdaptiveDesignHub().adapter.setHeight(this);

  /// Calculates the responsive radius.
  ///
  /// Example: `10.r`
  double get r => AdaptiveDesignHub().adapter.setRadius(this);

  /// Calculates the responsive font size.
  ///
  /// Example: `10.sp`
  double get sp => AdaptiveDesignHub().adapter.setSp(this);

  // Aliases for common usages

  /// Alias for [.sp].
  double get dp => sp;

  // Spacing helpers

  /// Returns a [SizedBox] with height equal to the responsive value.
  ///
  /// Example: `20.verticalSpace`
  Widget get verticalSpace => SizedBox(height: h);

  /// Returns a [SizedBox] with width equal to the responsive value.
  ///
  /// Example: `15.horizontalSpace`
  Widget get horizontalSpace => SizedBox(width: w);
}

extension ScreenUtilWidgetExtension on num {
  // Spacing helpers

  // Padding helpers
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble().w);
  EdgeInsets get paddingLeft => EdgeInsets.only(left: toDouble().w);
  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble().w);
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: toDouble().w);
  EdgeInsetsDirectional get paddingEnd =>
      EdgeInsetsDirectional.only(end: toDouble().w);
  EdgeInsetsDirectional get paddingStart =>
      EdgeInsetsDirectional.only(start: toDouble().w);
  EdgeInsets get paddingRight => EdgeInsets.only(right: toDouble().w);
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble().w);
  EdgeInsets get paddingVertical =>
      EdgeInsets.symmetric(vertical: toDouble().h);
  // EdgeInsets paddingOnly({
  //   required double left,
  //   required double right,
  //   required double top,
  //   required double bottom,
  // }) => EdgeInsets.only(top: top.h, bottom: bottom, left: left, right: right);

  // BorderRadius helpers
  BorderRadius get circularBorder => BorderRadius.circular(toDouble().r);
  Radius get circularRadius => Radius.circular(toDouble().r);
}
