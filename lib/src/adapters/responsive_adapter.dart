/// Abstract interface for responsive calculation adapters.
///
/// Implementations of this class are responsible for converting raw design values
/// (e.g., from Figma) into actual device pixels or logical pixels based on the
/// current screen size and density.
abstract class ResponsiveAdapter {
  /// Calculates the responsive width.
  ///
  /// [width] is the design width.
  double setWidth(num width);

  /// Calculates the responsive height.
  ///
  /// [height] is the design height.
  double setHeight(num height);

  /// Calculates the responsive radius.
  ///
  /// Typically uses the minimum scale factor of width or height, or just width.
  /// [radius] is the design radius.
  double setRadius(num radius);

  /// Calculates the responsive font size (`sp`).
  ///
  /// [fontSize] is the design font size.
  double setSp(num fontSize);
}
