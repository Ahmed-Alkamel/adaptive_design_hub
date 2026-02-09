import 'package:flutter/material.dart';
import 'num_extensions.dart';

extension AdaptiveWidgetExtension on Widget {
  // Padding
  Widget p(double value) =>
      Padding(padding: EdgeInsets.all(value.w), child: this);
  Widget px(double value) => Padding(
    padding: EdgeInsets.symmetric(horizontal: value.w),
    child: this,
  );
  Widget py(double value) => Padding(
    padding: EdgeInsets.symmetric(vertical: value.h),
    child: this,
  );

  Widget pt(double value) => Padding(
    padding: EdgeInsets.only(top: value.h),
    child: this,
  );
  Widget pb(double value) => Padding(
    padding: EdgeInsets.only(bottom: value.h),
    child: this,
  );
  Widget pl(double value) => Padding(
    padding: EdgeInsets.only(left: value.w),
    child: this,
  );
  Widget pr(double value) => Padding(
    padding: EdgeInsets.only(right: value.w),
    child: this,
  );

  // Layout
  Widget get center => Center(child: this);
  Widget get expand => Expanded(child: this);
  Widget get flexible => Flexible(child: this);
  Widget get safeArea => SafeArea(child: this);

  Widget fit({
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
  }) => FittedBox(fit: fit, alignment: alignment, child: this);

  Widget get scrollable => SingleChildScrollView(child: this);

  // Sizing
  /// Wrap with SizedBox width
  Widget w(double value) => SizedBox(width: value.w, child: this);

  /// Wrap with SizedBox height
  Widget h(double value) => SizedBox(height: value.h, child: this);

  /// Wrap with SizedBox size (square)
  Widget size(double value) =>
      SizedBox(width: value.w, height: value.w, child: this);
}
