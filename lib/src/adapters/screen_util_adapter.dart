import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'responsive_adapter.dart';

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
