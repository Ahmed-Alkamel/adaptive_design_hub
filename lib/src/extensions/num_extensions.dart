import 'package:flutter/material.dart';
import '../core/adaptive_design_hub.dart';

extension AdaptiveNumExtension on num {
  /// Adaptive width
  double get w => AdaptiveDesignHub().adapter.setWidth(this);

  /// Adaptive height
  double get h => AdaptiveDesignHub().adapter.setHeight(this);

  /// Adaptive radius
  double get r => AdaptiveDesignHub().adapter.setRadius(this);

  /// Adaptive font size
  double get sp => AdaptiveDesignHub().adapter.setSp(this);

  // Aliases for common usages
  double get dp => sp;

  // Spacing helpers
  Widget get verticalSpace => SizedBox(height: h);
  Widget get horizontalSpace => SizedBox(width: w);
}
