import 'package:flutter/material.dart';

/// An extension on the Widget class to add padding functionality
extension PaddingExtension on Widget {
  /// - If `all` is specified, it adds padding equally on all sides.
  /// [all] - Adds padding equally on all sides if specified.
  /// [h] - Adds padding horizontal.
  /// [v] - Adds padding vertical.
  /// [l] - Adds padding on the left side if specified.
  /// [t] - Adds padding on the top side if specified.
  /// [r] - Adds padding on the right side if specified.
  /// [b] - Adds padding on the bottom side if specified.

  /// Adds padding equally on all sides if specified.
  Widget p(double all) {
    return Padding(
      padding: EdgeInsets.all(all),
      child: this,
    );
  }

  /// Adds padding based on the specified named parameters.
  Widget pOnly({
    double? l, // Adds padding on the left side if specified.
    double? t, // Adds padding on the top side if specified.
    double? r, // Adds padding on the right side if specified.
    double? b, // Adds padding on the bottom side if specified.
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: l ?? 0, // Sets left padding
        top: t ?? 0, // Sets top padding
        right: r ?? 0, // Sets right padding
        bottom: b ?? 0, // Sets bottom padding
      ),
      child: this,
    );
  }

  /// Adds padding based on the Symmetric
  Widget pS({double? h, double? v}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h ?? 0, vertical: v ?? 0),
      child: this,
    );
  }
}

/// An extension on the Widget class to add margin functionality
extension MarginExtension on Widget {
  /// Adds margin equally on all sides if specified.
  ///
  /// - If `all` is specified, it adds margin equally on all sides.
  /// - If `all` is not specified, it adds margin based on individual side values
  ///   or combined horizontal and vertical values.
  ///
  /// [all] - Adds margin equally on all sides if specified.
  /// [h] - Adds margin horizontal.
  /// [v] - Adds margin vertical.
  /// [l] - Adds margin on the left side if specified.
  /// [t] - Adds margin on the top side if specified.
  /// [r] - Adds margin on the right side if specified.
  /// [b] - Adds margin on the bottom side if specified.
  Widget m(double all) {
    return Container(
      margin: EdgeInsets.all(all),
      child: this,
    );
  }

  /// Adds margin based on the specified named parameters.
  Widget mOnly({
    double? l, // Adds margin on the left side if specified.
    double? t, // Adds margin on the top side if specified.
    double? r, // Adds margin on the right side if specified.
    double? b, // Adds margin on the bottom side if specified.
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: l ?? 0, // Sets left margin
        top: t ?? 0, // Sets top margin
        right: r ?? 0, // Sets right margin
        bottom: b ?? 0, // Sets bottom margin
      ),
      child: this,
    );
  }

  /// Adds margin symmetrically based on the specified horizontal and vertical values.
  Widget mS({double? h, double? v}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: h ?? 0, vertical: v ?? 0),
      child: this,
    );
  }
}

// widget_extensions.dart

extension WidgetExtensions on Widget {
  // Center Extension
  /// Centers a widget within its parent.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Centered Text').centered()
  /// ```
  Widget centered() {
    return Center(child: this);
  }

  // Border Extension
  /// Adds a border around a widget with customizable color and width.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Text with Border').withBorder(color: Colors.blue, width: 2)
  /// ```
  Widget withBorder({Color color = Colors.black, double width = 1.0}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: width),
      ),
      child: this,
    );
  }

  // Background Color Extension
  /// Sets the background color of a widget.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Background Color').withBackgroundColor(Colors.yellow)
  /// ```
  Widget withBackgroundColor(Color color) {
    return Container(
      color: color,
      child: this,
    );
  }

  // Circular Border Radius Extension
  /// Adds a circular border radius to a widget.
  ///
  /// Example usage:
  /// ```dart
  /// Image.network('https://example.com/image.jpg').withCircularBorderRadius(12)
  /// ```
  Widget withCircularBorderRadius(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: this,
    );
  }

  // Shadow Extension
  /// Adds a shadow to a widget with customizable color, blur radius, and offset.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Shadow').withShadow(blurRadius: 5, offset: Offset(2, 2))
  /// ```
  Widget withShadow({
    Color color = Colors.black,
    double blurRadius = 10.0,
    Offset offset = const Offset(2, 2),
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blurRadius,
            offset: offset,
          ),
        ],
      ),
      child: this,
    );
  }

  // Opacity Extension
  /// Sets the opacity of a widget.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Opacity').withOpacity(0.5)
  /// ```
  Widget withOpacity(double opacity) {
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }

  // Rotate Extension
  /// Rotates a widget by a specified angle.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Rotated Text').rotated(0.5)
  /// ```
  Widget rotated(double angle) {
    return Transform.rotate(
      angle: angle,
      child: this,
    );
  }

  // Scale Extension
  /// Scales a widget by a specified factor.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Scaled Text').scaled(1.5)
  /// ```
  Widget scaled(double scale) {
    return Transform.scale(
      scale: scale,
      child: this,
    );
  }

  // Translate Extension
  /// Translates (moves) a widget by a specified offset.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Translated Text').translated(Offset(10, 10))
  /// ```
  Widget translated(Offset offset) {
    return Transform.translate(
      offset: offset,
      child: this,
    );
  }

  // Align Extension
  /// Aligns a widget within its parent using a specified alignment.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Aligned Text').aligned(Alignment.topLeft)
  /// ```
  Widget aligned(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  // Expanded Extension
  /// Expands a widget to fill available space within a Flex container.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Expanded Text').expanded()
  /// ```
  Widget expanded({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  // Flexible Extension
  /// Makes a widget flexible within a Flex container.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Flexible Text').flexible(flex: 2)
  /// ```
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: this,
    );
  }

  // Tooltip Extension
  /// Adds a tooltip to a widget that displays on long press.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Tooltip Text').withTooltip('This is a tooltip')
  /// ```
  Widget withTooltip(String message) {
    return Tooltip(
      message: message,
      child: this,
    );
  }

  // Visibility Extension
  /// Toggles the visibility of a widget.
  ///
  /// Example usage:
  /// ```dart
  /// Text('Visibility Text').visibility(true)
  /// ```
  Widget visibility(bool visible) {
    return Visibility(
      visible: visible,
      child: this,
    );
  }

  // Hero Extension
  /// Wraps a widget in a Hero widget for shared element transitions.
  ///
  /// Example usage:
  /// ```dart
  /// Image.network('https://example.com/image.jpg').withHero('heroTag')
  /// ```
  Widget withHero(String tag) {
    return Hero(
      tag: tag,
      child: this,
    );
  }

  // FittedBox Extension
  /// Fits a widget within its parent using a FittedBox with a specified fit.
  ///
  /// Example usage:
  /// ```dart
  /// Text('FittedBox Text').fittedBox()
  /// ```
  Widget fittedBox({BoxFit fit = BoxFit.contain}) {
    return FittedBox(
      fit: fit,
      child: this,
    );
  }

  ///Add a circular gradient background
  Widget withCircularGradient(List<Color> colors) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: colors),
      ),
      child: this,
    );
  }
}

/// Extension on BuildContext to provide convenient access to common properties and methods.
extension BuildContextExtensions on BuildContext {
  /// Returns the ThemeData associated with the current context.
  ThemeData get theme => Theme.of(this);

  /// Returns the TextTheme associated with the current context.
  TextTheme get texttheme => Theme.of(this).textTheme;

  /// Returns the ColorScheme associated with the current context.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Returns the MediaQueryData associated with the current context.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the size of the screen associated with the current context.
  Size get screenSize => MediaQuery.of(this).size;

  /// Returns the width of the screen associated with the current context.
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Returns the height of the screen associated with the current context.
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Returns true if the keyboard is currently open, false otherwise.
  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom > 0;

  /// Shows a Snackbar with the provided message in the current context.
  void showSnackBar(String message) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
}
