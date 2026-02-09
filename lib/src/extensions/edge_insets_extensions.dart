import 'package:flutter/material.dart';
import 'num_extensions.dart';

extension AdaptiveEdgeInsetsExtension on EdgeInsets {
  /// Adapt all values using width/height scaling
  EdgeInsets get r =>
      copyWith(top: top.h, bottom: bottom.h, left: left.w, right: right.w);

  /// Adapt using width scaling for all sides
  /// (Use caution, usually you want .r which uses h for vertical and w for horizontal)
  EdgeInsets get w =>
      copyWith(top: top.w, bottom: bottom.w, left: left.w, right: right.w);

  /// Adapt using height scaling for all sides
  EdgeInsets get h =>
      copyWith(top: top.h, bottom: bottom.h, left: left.h, right: right.h);
}

extension AdaptiveEdgeInsetsGeometryExtension on EdgeInsetsGeometry {
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
