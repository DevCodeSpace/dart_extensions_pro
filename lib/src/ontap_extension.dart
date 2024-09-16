import 'package:flutter/material.dart';

/// Extension to add various tap gestures to any [Widget].
extension OnTapExtension on Widget {
  /// Adds an ink splash effect with the onTap gesture.
  ///
  /// - [onTap]: The callback function to execute when the widget is tapped.
  /// - [key]: An optional key to identify the widget.
  /// - [borderRadius]: The border radius of the ink splash effect (not used here but kept for consistency).
  /// - [splashColor]: The color of the splash effect (not used here but kept for consistency).
  Widget onInkTap(VoidCallback onTap, {Key? key}) {
    return InkWell(
      key: key,
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: this,
      ),
    );
  }

  /// Adds a basic onTap gesture without any visual feedback.
  ///
  /// - [onTap]: The callback function to execute when the widget is tapped.
  /// - [key]: An optional key to identify the widget.
  Widget onTap(VoidCallback? onTap, {Key? key}) {
    return GestureDetector(
      key: key,
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: this,
      ),
    );
  }

  /// Adds a double-tap gesture.
  ///
  /// - [onDoubleTap]: The callback function to execute when the widget is double-tapped.
  /// - [key]: An optional key to identify the widget.
  Widget onDoubleTap(VoidCallback? onDoubleTap, {Key? key}) {
    return GestureDetector(
      key: key,
      onDoubleTap: onDoubleTap,
      child: Material(
        color: Colors.transparent,
        child: this,
      ),
    );
  }

  /// Adds a tap cancel gesture.
  ///
  /// - [onTapCancel]: The callback function to execute when the tap gesture is canceled.
  /// - [key]: An optional key to identify the widget.
  Widget onTapCancel(GestureTapCancelCallback? onTapCancel, {Key? key}) {
    return GestureDetector(
      key: key,
      onTapCancel: onTapCancel,
      child: Material(
        color: Colors.transparent,
        child: this,
      ),
    );
  }

  /// Adds a long press gesture.
  ///
  /// - [onLongPress]: The callback function to execute when the widget is long-pressed.
  /// - [key]: An optional key to identify the widget.
  Widget onLongPress(VoidCallback? onLongPress, {Key? key}) {
    return GestureDetector(
      key: key,
      onLongPress: onLongPress,
      child: Material(
        color: Colors.transparent,
        child: this,
      ),
    );
  }

  /// Adds a tap down gesture.
  ///
  /// - [onTapDown]: The callback function to execute when the widget is tapped down.
  /// - [key]: An optional key to identify the widget.
  Widget onTapDown(GestureTapDownCallback? onTapDown, {Key? key}) {
    return GestureDetector(
      key: key,
      onTapDown: onTapDown,
      child: Material(
        color: Colors.transparent,
        child: this,
      ),
    );
  }

  /// Adds a scale gesture.
  ///
  /// - [onScaleStart]: The callback function to execute when the scale gesture starts.
  /// - [onScaleUpdate]: The callback function to execute when the scale gesture is updated.
  /// - [onScaleEnd]: The callback function to execute when the scale gesture ends.
  /// - [key]: An optional key to identify the widget.
  Widget onScale({
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    Key? key,
  }) {
    return GestureDetector(
      key: key,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      child: Material(
        color: Colors.transparent,
        child: this,
      ),
    );
  }
}
