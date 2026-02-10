import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'responsive_adapter.dart';

/// An implementation of [ResponsiveAdapter] that uses `flutter_screenutil`.
///
/// This adapter delegates all responsive calculations to the `ScreenUtil` library,
/// effectively wrapping its functionality:
/// * `setWidth` -> `.w`
/// * `setHeight` -> `.h`
/// * `setRadius` -> `.r`
/// * `setSp` -> `.sp`
class ScreenUtilAdapter implements ResponsiveAdapter {
  @override
  double setHeight(num height) => height.h;

  @override
  double setRadius(num radius) => radius.r;

  @override
  double setSp(num fontSize) => fontSize.sp;

  @override
  double setWidth(num width) => width.w;
}
