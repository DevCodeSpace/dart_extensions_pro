import 'helpers.dart';

/// Represents a range of integers from [start] to [end] with a specified [step].
class IntRange extends Iterable<int> {
  /// The starting value of the range.
  final int start;

  /// The ending value of the range, which may or may not be included based on the [step] value.
  final int end;

  /// The step size between values in the range.
  final int step;

  /// Creates an instance of IntRange.
  IntRange(this.start, this.end, {this.step = 1}) {
    require(step != 0, 'Step must be non-zero.');
    require(start != end, 'Start and end must not be equal.');
    require(
        step != minIntValue,
        'Step must be greater than MIN_INT_VALUE to avoid overflow '
        'on negation.');
    if (step > 0) {
      require(start < end, 'End must be greater than start when step > 0.');
    } else {
      require(start > end, 'End must be less than start when step < 0.');
    }
  }

  @override
  Iterator<int> get iterator => IntRangeIterator(start, end, step: step);

  @override
  bool get isEmpty => step > 0 ? start >= end : start <= end;

  @override
  int get hashCode => Object.hash(start, end, step);

  /// Returns a reversed range with the same step size.
  IntRange reversed() => IntRange(end, start, step: -step);

  @override
  bool operator ==(Object other) =>
      other is IntRange &&
      start == other.start &&
      end == other.end &&
      step == other.step;

  @override
  String toString() =>
      step > 0 ? '$start to $end by $step' : '$start to $end by $step';
}

/// Iterates over integers from [start] to [end] with a specified [step].
class IntRangeIterator implements Iterator<int> {
  /// The starting value of the range.
  final int start;

  /// The ending value of the range.
  final int end;

  /// The step size between values in the range.
  final int step;

  int? _current;

  /// Creates an instance of IntRangeIterator.
  IntRangeIterator(this.start, this.end, {this.step = 1});

  @override
  int get current => _current!;

  @override
  bool moveNext() {
    var currentElement = _current;
    if (currentElement == null) {
      _current = start;
      return true;
    }
    if (step > 0) {
      if (currentElement >= end) return false;
      var next = currentElement + step;
      if (next > end) return false;
      _current = next;
      return true;
    } else {
      if (currentElement <= end) return false;
      var next = currentElement + step;
      if (next < end) return false;
      _current = next;
      return true;
    }
  }
}
