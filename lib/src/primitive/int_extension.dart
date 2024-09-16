import 'dart:math';

import '../helpers/int_range.dart';

/// Extensions for [int].
extension IntExtension<T> on int {
  /// Converts to a [Duration] in seconds.
  Duration get seconds => Duration(seconds: this);

  /// Converts to a [Duration] in milliseconds.
  Duration get milliseconds => Duration(milliseconds: this);

  /// Converts to a [Duration] in microseconds.
  Duration get microseconds => Duration(microseconds: this);

  /// Returns the number of digits.
  int get length => toString().length;

  /// Returns a list of digits.
  List<int> get digits => toString().split('').map(int.parse).toList();

  /// Checks if divisible by [divider].
  bool isDivisibleBy(int divider) => this % divider == 0;

  /// Checks if divisible by all [dividers].
  bool isDivisibleByAll(List<int> dividers) =>
      dividers.every((divider) => this % divider == 0);

  /// Runs [func] for absolute value of [this] times.
  List<T> repeat(T Function(int count) func) {
    return [for (var i = 1; i <= abs(); i++) func(i)];
  }

  /// Converts to boolean (non-zero is true).
  bool get asBool => this != 0;

  /// Converts to a two-digit string.
  String twoDigits() => this < 10 ? '0$this' : toString();

  /// Creates a range from this value to [end].
  IntRange rangeTo(int end) => IntRange(this, end);

  /// Creates a range from this value down to [end].
  IntRange downTo(int end) => IntRange(this, end, step: -1);

  /// Creates a range up to, but not including, [end].
  IntRange until(int end) => IntRange(this, end - 1);
}

/// Generates a random integer in the range [0, max].
int randomInt({int? max}) => Random().nextInt(max ?? 1000000);
