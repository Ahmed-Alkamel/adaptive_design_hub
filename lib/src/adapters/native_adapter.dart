import 'dart:ui';

import 'responsive_adapter.dart';

class NativeAdapter implements ResponsiveAdapter {
  final Size designSize;

  // We use the first view's physical size / pixel ratio as a fallback if no context is available
  // This is minimal "no-context" support for native mode.
  static Size get _screenSize {
    final view = PlatformDispatcher.instance.views.first;
    return view.physicalSize / view.devicePixelRatio;
  }

  NativeAdapter({this.designSize = const Size(375, 812)});

  double get _scaleWidth => _screenSize.width / designSize.width;
  double get _scaleHeight => _screenSize.height / designSize.height;
  double get _scaleText => _scaleWidth; // Simplified approach

  @override
  double setHeight(num height) => height * _scaleHeight;

  @override
  double setRadius(num radius) => radius * _scaleWidth; // Typically width-based or min-based

  @override
  double setSp(num fontSize) => fontSize * _scaleText;

  @override
  double setWidth(num width) => width * _scaleWidth;
}
