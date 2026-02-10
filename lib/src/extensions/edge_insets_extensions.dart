import 'package:flutter/material.dart';
import 'num_extensions.dart';

/// Extensions on [EdgeInsets] for responsive padding/margin.
extension AdaptiveEdgeInsetsExtension on EdgeInsets {
  /// Smart responsive scaling.
  ///
  /// Uses height scaling (`.h`) for vertical values (top, bottom) and
  /// width scaling (`.w`) for horizontal values (left, right).
  EdgeInsets get r =>
      copyWith(top: top.h, bottom: bottom.h, left: left.w, right: right.w);

  /// Forces width scaling (`.w`) for all sides.
  EdgeInsets get w =>
      copyWith(top: top.w, bottom: bottom.w, left: left.w, right: right.w);

  /// Forces height scaling (`.h`) for all sides.
  EdgeInsets get h =>
      copyWith(top: top.h, bottom: bottom.h, left: left.h, right: right.h);
}

/// Extensions on [EdgeInsetsGeometry] for responsive support.
extension AdaptiveEdgeInsetsGeometryExtension on EdgeInsetsGeometry {
  /// Smart responsive scaling (see [AdaptiveEdgeInsetsExtension.r]).
  ///
  /// Supports [EdgeInsets] and [EdgeInsetsDirectional].
  EdgeInsetsGeometry get r {
    if (this is EdgeInsets) {
      return (this as EdgeInsets).r;
    }
    if (this is EdgeInsetsDirectional) {
      final d = this as EdgeInsetsDirectional;
      return EdgeInsetsDirectional.only(
        top: d.top.h,
        bottom: d.bottom.h,
        start: d.start.w,
        end: d.end.w,
      );
    }
    return this;
  }
}
