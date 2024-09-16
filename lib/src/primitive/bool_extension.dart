import 'dart:math';

/// Extensions for [bool].
extension BoolExtension on bool {
  /// Negates the boolean value.
  bool get toggled => !this;

  /// Converts the boolean to 1 if true, otherwise 0.
  int toInt() => this ? 1 : 0;
}

/// Returns a random boolean value.
bool randomBool() => Random().nextBool();
