import 'package:flutter/material.dart';
import 'num_extensions.dart';

/// Extensions on [Widget] for succinct layout and sizing.
extension AdaptiveWidgetExtension on Widget {
  // Padding

  /// Adds uniform padding to all sides.
  ///
  /// [value] is adaptive (uses `.w`).
  Widget p(double value) =>
      Padding(padding: EdgeInsets.all(value.w), child: this);

  /// Adds symmetric horizontal padding.
  ///
  /// [value] is adaptive (uses `.w`).
  Widget px(double value) => Padding(
    padding: EdgeInsets.symmetric(horizontal: value.w),
    child: this,
  );

  /// Adds symmetric vertical padding.
  ///
  /// [value] is adaptive (uses `.h`).
  Widget py(double value) => Padding(
    padding: EdgeInsets.symmetric(vertical: value.h),
    child: this,
  );

  /// Adds padding to the top.
  Widget pt(double value) => Padding(
    padding: EdgeInsets.only(top: value.h),
    child: this,
  );

  /// Adds padding to the bottom.
  Widget pb(double value) => Padding(
    padding: EdgeInsets.only(bottom: value.h),
    child: this,
  );

  /// Adds padding to the left.
  Widget pl(double value) => Padding(
    padding: EdgeInsets.only(left: value.w),
    child: this,
  );

  /// Adds padding to the right.
  Widget pr(double value) => Padding(
    padding: EdgeInsets.only(right: value.w),
    child: this,
  );

  // Layout

  /// Centers the widget using a [Center] widget.
  Widget get center => Center(child: this);

  /// Expands the widget using an [Expanded] widget.
  Widget get expand => Expanded(child: this);

  /// Makes the widget flexible using a [Flexible] widget.
  Widget get flexible => Flexible(child: this);

  /// Wraps the widget in a [SafeArea].
  Widget get safeArea => SafeArea(child: this);

  /// Wraps the widget in a [FittedBox].
  Widget fit({
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
  }) => FittedBox(fit: fit, alignment: alignment, child: this);

  /// Makes the widget scrollable using a [SingleChildScrollView].
  Widget get scrollable => SingleChildScrollView(child: this);

  // Sizing

  /// Wraps the widget in a [SizedBox] with responsive width.
  Widget w(double value) => SizedBox(width: value.w, child: this);

  /// Wraps the widget in a [SizedBox] with responsive height.
  Widget h(double value) => SizedBox(height: value.h, child: this);

  /// Wraps the widget in a square [SizedBox] with responsive dimension.
  Widget size(double value) =>
      SizedBox(width: value.w, height: value.w, child: this);
}
