/// Extends Comparable with extra utility methods.
extension ComparableUtilsExtension<E extends Comparable<dynamic>> on E {
  /// Checks if this is less than [other].
  bool operator <(E other) => compareTo(other) < 0;

  /// Checks if this is less than or equal to [other].
  bool operator <=(E other) => compareTo(other) <= 0;

  /// Checks if this is greater than [other].
  bool operator >(E other) => compareTo(other) > 0;

  /// Checks if this is greater than or equal to [other].
  bool operator >=(E other) => compareTo(other) >= 0;

  /// Returns this value if it's not less than [minimum], otherwise returns [minimum].
  E atLeast(E minimum) => this < minimum ? minimum : this;

  /// Returns this value if it's not greater than [maximum], otherwise returns [maximum].
  E atMost(E maximum) => this > maximum ? maximum : this;

  /// Returns this value if it lies between [min] and [max], otherwise returns the closest bound.
  E inRange(E min, E max) {
    if (min > max) {
      throw ArgumentError(
          'Invalid range: maximum $max cannot be less than minimum $min.');
    }
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }
}
