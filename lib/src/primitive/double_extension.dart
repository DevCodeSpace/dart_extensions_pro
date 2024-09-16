import 'dart:math';
// ignore: implementation_imports
import 'package:intl/src/intl/number_format.dart';

final NumberFormat _formatter = NumberFormat('0.##')..minimumFractionDigits = 0;

/// Extensions for [double].
extension DoubleExtension on double {
  /// Checks if the value is a whole number.
  bool get isWhole =>
      this != double.infinity &&
      this != double.negativeInfinity &&
      !isNaN &&
      truncate() == this;

  /// Rounds the value to [precision] decimal places.
  double roundToPrecision(int nthPosition) {
    if (isNaN || isInfinite || this == double.negativeInfinity) return this;
    _formatter.maximumFractionDigits = nthPosition;
    return double.parse(_formatter.format(this));
  }

  /// Checks if the value is close to [other] within [precision].
  bool isCloseTo(double other, {double precision = 1.0e-8}) {
    return (this - other).abs() <= precision;
  }
}

/// Generates a random double between 0.0 (inclusive) and 1.0 (exclusive).
double randomDouble({double? max}) => Random().nextDouble() * (max ?? 1);
