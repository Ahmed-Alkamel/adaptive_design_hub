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
