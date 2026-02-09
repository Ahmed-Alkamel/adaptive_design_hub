import 'package:flutter/material.dart';

abstract class ResponsiveAdapter {
  /// Width calculation
  double setWidth(num width);

  /// Height calculation
  double setHeight(num height);

  /// Radius/Font size calculation (usually based on width or min of width/height)
  double setRadius(num radius);

  /// Font size calculation
  double setSp(num fontSize);
}
