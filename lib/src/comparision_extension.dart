/// Extension for numeric comparisons.
extension ComparisonExtension on num {
  /// Returns `true` if the value is greater than [other].
  bool gt(num other) {
    return this > other;
  }

  /// Returns `true` if the value is less than [other].
  bool lt(num other) {
    return this < other;
  }

  /// Returns `true` if the value is equal to [check].
  bool eq(num check) {
    return this == check;
  }

  /// Returns `true` if the value is less than or equal to [other].
  bool lte(num other) {
    return this <= other;
  }

  /// Returns `true` if the value is greater than or equal to [other].
  bool gte(num other) {
    return this >= other;
  }

  /// Returns `true` if the value is not equal to [other].
  bool ne(num other) {
    return this != other;
  }
}
