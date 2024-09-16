import 'dart:math';

/// Extensions for [num].
extension NumExtension on num {
  /// Converts positive numbers to their negative counterparts.
  num get negative => sign > 0 ? -this : this;

  /// Checks if [this] is between [value1] and [value2], inclusive if [inclusive] is true.
  bool isBetween(num value1, num value2, {bool inclusive = false}) => inclusive
      ? (this >= value1 && this <= value2) || (this >= value2 && this <= value1)
      : (this > value1 && this < value2) || (this > value2 && this < value1);

  /// Rounds the number to [decimalPlaces] decimal places.
  num roundToDecimals(int decimalPlaces) =>
      num.parse((this).toStringAsFixed(decimalPlaces));

  /// Converts degrees to radians.
  double get asRadians => this * pi / 180;

  /// Converts radians to degrees.
  double get asDegrees => this * 180 / pi;
}

/// Typed extensions for [num] and its subtypes.
extension TypedNumExtension<T extends num> on T {
  /// Limits the value to the [upperBound], exclusive if [exclusive] is true.
  T maxim(T upperBound, {bool exclusive = false}) {
    return exclusive
        ? (this < upperBound ? this : upperBound)
        : (this < upperBound ? this : upperBound);
  }

  /// Ensures the value is not less than [lowerBound], exclusive if [exclusive] is true.
  T minm(T lowerBound, {bool exclusive = false}) {
    return exclusive
        ? (this > lowerBound ? this : lowerBound)
        : (this > lowerBound ? this : lowerBound);
  }

  /// Ensures the value is not below [lowerBound].
  T clampAtMin(T lowerBound) => this < lowerBound ? lowerBound : this;

  /// Ensures the value does not exceed [upperBound].
  T clampAtMax(T upperBound) => this > upperBound ? upperBound : this;
}

/// Extensions for nullable [num] types.
extension NullableNumExtension on num? {
  /// Returns this value or 0 if null.
  num get orZero => this ?? 0;

  /// Returns this value or 1 if null.
  num get orOne => this ?? 1;

  /// Returns this value or [value] if null.
  num or(num value) => this ?? value;
}
