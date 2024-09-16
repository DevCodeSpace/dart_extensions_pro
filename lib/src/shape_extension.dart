import 'package:flutter/material.dart';

/// CustomShapeClipper allows clipping a widget with a custom shape defined by a Path function.
class CustomShapeClipper extends CustomClipper<Path> {
  final Path Function(Size size) customShape;

  CustomShapeClipper(this.customShape);

  @override
  Path getClip(Size size) {
    return customShape(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true; // Indicates whether the clipper should reclip if the widget's size changes
  }
}

/// Extension on Container to provide various custom shapes
extension ShapeContainer on Container {
  /// Clips the container into a circular shape
  Widget withCircle() {
    return ClipOval(child: this);
  }

  /// Clips the container into a triangular shape
  Widget withTriangle() {
    return ClipPath(
      clipper: CustomShapeClipper((size) {
        Path path = Path()
          ..moveTo(size.width / 2, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();
        return path;
      }),
      child: this,
    );
  }

  /// Clips the container into a square shape
  Widget withSquare() {
    return ClipPath(
      clipper: CustomShapeClipper((size) {
        double side = size.shortestSide;
        Path path = Path()..addRect(Rect.fromLTWH(0, 0, side, side));
        return path;
      }),
      child: this,
    );
  }

  /// Returns the container as it is, which is already a rectangle
  Widget withRectangle() {
    return this;
  }

  /// Clips the container into a pentagonal shape
  Widget withPentagon() {
    return ClipPath(
      clipper: CustomShapeClipper((size) {
        double width = size.width;
        double height = size.height;
        Path path = Path()
          ..moveTo(width * 0.5, 0)
          ..lineTo(width, height * 0.38)
          ..lineTo(width * 0.81, height)
          ..lineTo(width * 0.19, height)
          ..lineTo(0, height * 0.38)
          ..close();
        return path;
      }),
      child: this,
    );
  }

  /// Clips the container into an octagonal shape
  Widget withOctagon() {
    return ClipPath(
      clipper: CustomShapeClipper((size) {
        double width = size.width;
        double height = size.height;
        double c = 0.3; // Control the size of the octagon sides
        Path path = Path()
          ..moveTo(width * c, 0)
          ..lineTo(width * (1 - c), 0)
          ..lineTo(width, height * c)
          ..lineTo(width, height * (1 - c))
          ..lineTo(width * (1 - c), height)
          ..lineTo(width * c, height)
          ..lineTo(0, height * (1 - c))
          ..lineTo(0, height * c)
          ..close();
        return path;
      }),
      child: this,
    );
  }

  /// Clips the container into a river flow-like shape with curves
  Widget withRiverFlow() {
    return ClipPath(
      clipper: CustomShapeClipper((size) {
        Path path = Path();
        double width = size.width;
        double height = size.height;

        // Starting point
        path.moveTo(0, height * 0.3);

        // Curve 1
        path.quadraticBezierTo(
            width * 0.10, height * 0.45, width * 0.5, height * 0.3);

        // Curve 2
        path.quadraticBezierTo(
            width * 0.85, height * 0.10, width, height * 0.3);

        // Continue the path to cover the rest of the container
        path.lineTo(width, height);
        path.lineTo(0, height);
        path.close();

        return path;
      }),
      child: this,
    );
  }

  /// Clips the container into an under-round shape with curves
  Widget withUnderRoundShape() {
    return ClipPath(
      clipper: CustomShapeClipper((size) {
        Path path = Path();
        double width = size.width;
        double height = size.height;

        // Starting point
        path.moveTo(0, height * 0.3);

        // Curve 1
        path.quadraticBezierTo(
            width * 0.10, height * 0.45, width * 0.5, height * 0.3);

        // Curve 2
        path.quadraticBezierTo(
            width * 0.85, height * 0.10, width, height * 0.3);

        // Continue the path to cover the rest of the container
        path.lineTo(width, height);
        path.lineTo(0, height);
        path.close();

        return path;
      }),
      child: this,
    );
  }
}
