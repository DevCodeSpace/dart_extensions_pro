import 'dart:collection';
import 'dart:math';
import 'package:collection/collection.dart';
import 'comparable_extension.dart';
import 'map_extension.dart';

/// Extensions for Iterable
extension IterableExtension<E> on Iterable<E> {
  /// Returns the second element or null if not available.
  E? get secOrNull => length > 1 ? elementAt(1) : null;

  /// Returns the third element or null if not available.
  E? get thirdOrNull => length > 2 ? elementAt(2) : null;

  /// Returns the index of the last element or -1 if empty.
  int get lastElementIndex => length > 0 ? length - 1 : -1;

  /// Checks if the iterable has exactly one element.
  bool get hasSingleElement => length == 1;

  /// Adds elements that match [predicate] to [target].
  Iterable<E> addAllMatchingTo(
      List<E> target, bool Function(E element) predicate) {
    for (final element in this) {
      if (predicate(element)) target.add(element);
    }
    return target;
  }

  /// Equivalent to [Iterable.where].
  Iterable<E> whereFilter(bool Function(E element) predicate) =>
      addAllMatchingTo(<E>[], predicate);

  /// Similar to [whereIndexed], but yields results lazily.
  Iterable<E> whereFilterIndexed(
      bool Function(int index, E element) test) sync* {
    var idx = 0;
    for (var element in this) {
      if (test(idx++, element)) yield element;
    }
  }

  /// Transforms each element with [transform] and produces an iterable of the outcomes.
  Iterable<R> mapTransform<R>(R Function(E element) transform) =>
      map<R>(transform);

  /// Creates a new iterable by skipping the first [count] elements.
  Iterable<E> skipElements(int count) => skip(count);

  /// Generates an iterable with the last [count] elements.
  Iterable<E> takeLastElements(int count) {
    assert(count > -1);
    if (isEmpty) return [];
    if (length <= count) return this;
    return toList().sublist(length - count, length);
  }

  /// Creates an iterable that skips elements as long as [test] returns true.
  Iterable<E> skipWhileElements(bool Function(E element) test) =>
      skipWhile(test);

  /// Produces an iterable that excludes the last [count] elements.
  Iterable<E> skipLastElements(int count) {
    assert(count > -1);
    if (count == 0) return this;
    if (count >= length) return [];
    return toList().sublist(0, length - count);
  }

  /// Checks if every element meets the criteria defined by [test].
  bool allSatisfy(bool Function(E element) test) => every(test);

  /// Converts each element into a key-value pair using [transform] and returns a [Map].
  Map<K, V> mapToMap<K, V>((K, V) Function(E element) transform) =>
      mapToMapTo(<K, V>{}, transform);

  /// Populates and returns the [destination] map with key-value pairs
  /// provided by [transform] function applied to each element
  /// of the given iterable.
  Map<K, V> mapToMapTo<K, V>(
      Map<K, V> target, (K, V) Function(E element) transform) {
    for (final element in this) {
      target + transform(element);
    }
    return target;
  }

  /// Returns a [Map] where each element from the given [List] is associated
  /// with a key derived from applying the [keyExtractor] function to each element.
  /// The [keyExtractor] function should return a key of type [K] for each element.
  Map<K, E> mapByKey<K>(K Function(E element) keyExtractor) =>
      mapByKeyTo(<K, E>{}, keyExtractor);

  /// Populates the [targetMap] with key-value pairs from the current iterable.
  /// The key for each pair is obtained by applying the [keyExtractor] function
  /// to each element, and the value is the element itself.
  /// Returns the [targetMap] after it has been populated.
  Map<K, E> mapByKeyTo<K>(
      Map<K, E> targetMap, K Function(E element) keyExtractor) {
    for (final element in this) {
      targetMap[keyExtractor(element)] = element;
    }
    return targetMap;
  }

  /// Creates a [Map] where each key is an element from the current iterable
  /// and the corresponding value is obtained by applying the [valueProvider]
  /// function to that element.
  /// Returns the newly created [Map] with elements mapped to their corresponding values.
  Map<E, V> mapElementsToValues<V>(V Function(E element) valueProvider) =>
      mapElementsToValuesIn(<E, V>{}, valueProvider);

  /// Populates the [targetMap] with key-value pairs from the current iterable,
  /// where each key is an element from the iterable, and the corresponding
  /// value is obtained by applying the [valueProvider] function to that key.
  /// Returns the [targetMap] after it has been populated.
  Map<E, V> mapElementsToValuesIn<V>(
      Map<E, V> targetMap, V Function(E element) valueProvider) {
    for (final element in this) {
      targetMap[element] = valueProvider(element);
    }
    return targetMap;
  }

  /// Groups elements of the current iterable by a key obtained from applying
  /// the [keyExtractor] function to each element.
  /// Returns a [Map] where each key is associated with a list of elements
  /// that correspond to that key.
  Map<K, List<E>> groupByElements<K>(K Function(E element) keyExtractor) =>
      groupByToElements(<K, List<E>>{}, keyExtractor);

  /// Groups elements of the current iterable by a key obtained from applying
  /// the [keyExtractor] function to each element and populates the [targetMap]
  /// with each group key associated with a list of elements that correspond
  /// to that key. Returns the [targetMap] after it has been populated.
  Map<K, List<E>> groupByToElements<K>(
      Map<K, List<E>> targetMap, K Function(E element) keyExtractor) {
    for (final element in this) {
      final key = keyExtractor(element);
      final list = targetMap.putIfAbsent(key, () => []);
      list.add(element);
    }
    return targetMap;
  }

  /// Returns an iterable containing only distinct elements from the given iterable.
  Iterable<E> distinct() => toSet().toList();

  /// Returns an iterable containing only elements from the given iterable
  /// having distinct keys returned by the provided [keySelector] function.
  Iterable<E> distinctBy<K>(K Function(E element) keySelector) {
    return _populateDistinctElements(<E>[], keySelector);
  }

  /// Populates the [destination] list with elements from the given iterable
  /// having distinct keys returned by the provided [keySelector] function,
  /// and returns the [destination] list.
  Iterable<E> _populateDistinctElements<K>(
      List<E> destination, K Function(E element) keySelector) {
    final seenKeys = HashSet<K>();
    for (var element in this) {
      final key = keySelector(element);
      if (seenKeys.add(key)) {
        destination.add(element);
      }
    }
    return destination;
  }

  /// Returns an iterable containing all elements that are present in both
  /// [this] iterable and the [other] iterable.
  Iterable<E> intersection(Iterable<E> other) =>
      (toSet()..retainAll(other)).toList();

  /// Returns an iterable containing all elements that are present in [this]
  /// iterable but not in the [other] iterable.
  Iterable<E> difference(Iterable<E> other) =>
      (toSet()..removeAll(other)).toList();

  /// Returns an iterable containing all distinct elements from both iterables.
  Iterable<E> union(Iterable<E> other) => (toSet()..addAll(other)).toList();

  /// Returns the number of elements in [this] iterable that satisfy the given [predicate].
  int countWhere(bool Function(E element) predicate) {
    if (isEmpty) return 0;
    var matchingCount = 0;
    for (var element in this) {
      if (predicate(element)) ++matchingCount;
    }
    return matchingCount;
  }

  /// Accumulates value starting with [initialValue] value and
  /// applying [operation] from right to left to each element
  /// and current accumulator value.
  R foldRight<R>(
      R initialValue, R Function(R previousValue, E element) operation) {
    var accumulator = initialValue;
    if (isNotEmpty) {
      for (final element in toList().reversed) {
        accumulator = operation(accumulator, element);
      }
    }
    return accumulator;
  }

  /// Accumulates value starting with [initialValue] value and applying
  /// [operation] from right to left to each element with its index in
  /// the original list and current accumulator value.
  R foldRightIndexed<R>(R initialValue,
      R Function(int index, R previousValue, E element) operation) {
    var accumulator = initialValue;
    if (isNotEmpty) {
      for (var index = length - 1; index >= 0; index--) {
        accumulator = operation(index, accumulator, elementAt(index));
      }
    }
    return accumulator;
  }

  /// Returns a random element from [this]. Returns null if no elements
  /// are present.
  E? randomOrNull([Random? random]) {
    if (isEmpty) return null;
    if (length == 1) return first;
    return elementAt((random ?? Random()).nextInt(length));
  }

  /// Returns a random element from [this].
  /// Throws [StateError] if there are no elements in the collection.
  E random([Random? random]) {
    if (isEmpty) throw StateError('no elements');
    if (length == 1) return first;
    return elementAt((random ?? Random()).nextInt(length));
  }

  /// Performs the given [action] on each element and returns the
  /// iterable itself afterwards.
  Iterable<E> onEach(void Function(E element) action) => this..forEach(action);

  /// Returns the first element yielding the largest value of the given
  /// function or `null` if there are no elements.
  E? maxByOrNull<R extends Comparable<dynamic>>(
      R Function(E element) selector) {
    if (isEmpty) return null;
    if (length == 1) return first;
    var maxElement = first;
    var maxValue = selector(maxElement);
    for (final element in this) {
      final value = selector(element);
      if (maxValue < value) {
        maxValue = value;
        maxElement = element;
      }
    }
    return maxElement;
  }

  /// Returns the first element yielding the largest value of the given
  /// function.
  /// Throws [StateError] if there are no elements in the collection.
  E maxBy<R extends Comparable<dynamic>>(R Function(E element) selector) {
    if (isEmpty) throw StateError('no elements');
    if (length == 1) return first;
    var maxElement = first;
    var maxValue = selector(maxElement);
    for (final element in this) {
      final value = selector(element);
      if (maxValue < value) {
        maxValue = value;
        maxElement = element;
      }
    }
    return maxElement;
  }

  /// Returns the last element yielding the largest value of the given
  /// function or `null` if there are no elements.
  E? maxByLastOrNull<R extends Comparable<dynamic>>(
      R Function(E element) selector) {
    if (isEmpty) return null;
    if (length == 1) return first;
    var maxElement = first;
    var maxValue = selector(maxElement);
    for (final element in this) {
      final value = selector(element);
      if (maxValue <= value) {
        maxValue = value;
        maxElement = element;
      }
    }
    return maxElement;
  }

  /// Returns the last element yielding the largest value of the given
  /// function.
  /// Throws [StateError] if there are no elements in the collection.
  E maxByLast<R extends Comparable<dynamic>>(R Function(E element) selector) {
    if (isEmpty) throw StateError('no elements');
    if (length == 1) return first;
    var maxElement = first;
    var maxValue = selector(maxElement);
    for (final element in this) {
      final value = selector(element);
      if (maxValue <= value) {
        maxValue = value;
        maxElement = element;
      }
    }
    return maxElement;
  }

  /// Returns the first element yielding the smallest value of the given
  ///Returns the first element yielding the smallest value of the given
  E? minByOrNull<R extends Comparable<dynamic>>(
      R Function(E element) selector) {
    if (isEmpty) return null;
    if (length == 1) return first;
    var minElement = first;
    var minValue = selector(minElement);
    for (final element in this) {
      final value = selector(element);
      if (minValue > value) {
        minValue = value;
        minElement = element;
      }
    }
    return minElement;
  }

  /// Returns the first element yielding the smallest value of the given
  /// function.
  /// Throws [StateError] if there are no elements in the collection.
  E minBy<R extends Comparable<dynamic>>(R Function(E element) selector) {
    if (isEmpty) throw StateError('no elements');
    if (length == 1) return first;
    var minElement = first;
    var minValue = selector(minElement);
    for (final element in this) {
      final value = selector(element);
      if (minValue > value) {
        minValue = value;
        minElement = element;
      }
    }
    return minElement;
  }

  /// Returns the last element yielding the smallest value of the given
  /// function or `null` if there are no elements.
  E? minByLastOrNull<R extends Comparable<dynamic>>(
      R Function(E element) selector) {
    if (isEmpty) return null;
    if (length == 1) return first;
    var minElement = first;
    var minValue = selector(minElement);
    for (final element in this) {
      final value = selector(element);
      if (minValue >= value) {
        minValue = value;
        minElement = element;
      }
    }
    return minElement;
  }

  /// Returns the last element yielding the smallest value of the given
  /// function.
  /// Throws [StateError] if there are no elements in the collection.
  E minByLast<R extends Comparable<dynamic>>(R Function(E element) selector) {
    if (isEmpty) throw StateError('no elements');
    if (length == 1) return first;
    var minElement = first;
    var minValue = selector(minElement);
    for (final element in this) {
      final value = selector(element);
      if (minValue >= value) {
        minValue = value;
        minElement = element;
      }
    }
    return minElement;
  }

  /// Returns the sum of all values produced by [selector] function
  /// applied to each element in the collection.
  R sumBy<R extends num>(R Function(E element) selector) => fold<R>(
      (R == int ? 0 : 0.0) as R,
      (previousValue, element) => previousValue + selector(element) as R);

  /// Returns the average of all values produced by [selector] function
  /// applied to each element in the collection.
  double averageBy<R extends num>(R Function(E element) selector) {
    if (isEmpty) return 0;
    return sumBy(selector) / length;
  }

  /// Alias for [subtract].
  Iterable<E> except(Iterable<E> other) => difference(other);

  /// Returns true if the collection contains all the elements
  /// present in [other] collection.
  bool containsAll(Iterable<E> other) => other.every(contains);

  /// Returns true if the collection doesn't contain any of the elements
  /// present in [other] collection.
  bool containsNone(Iterable<E> other) =>
      none((element) => other.contains(element));

  /// Returns an iterable containing the items with their respective indices
  /// in form of records.
  ///
  /// One of the use-cases includes iterating over the collection with access
  /// to the index of each item in a for loop.
  ///
  /// e.g.
  ///
  /// for (final (index, item) in list.records) {
  ///   '$index: $item'.logMsg();
  /// }
  ///
  Iterable<(int, E)> get records sync* {
    for (int index = 0; index < length; index++) {
      yield (index, elementAt(index));
    }
  }

  /// Finds an element where the result of [selector] matches the [query].Throws [StateError] if no element is found.
  E findBy<S>(S query, S Function(E item) selector) {
    for (final item in this) {
      if (selector(item) == query) return item;
    }
    throw StateError('no element found');
  }

  /// Finds an element where the result of selector matches the query.
  /// Returns null if no element is found.
  E? findByOrNull<C>(C query, C Function(E item) selector) {
    for (final item in this) {
      if (selector(item) == query) return item;
    }
    return null;
  }

  /// Finds all elements where the result of selector matches the query.
  /// Returns empty collection if no element is found.
  Iterable<E> findAllBy<S>(S query, S Function(E item) selector) sync* {
    for (final item in this) {
      if (selector(item) == query) yield item;
    }
  }
}

/// provides extensions for nullable Iterable
extension NullableIterableExtension<E> on Iterable<E>? {
  /// Returns true if [this] is either null or empty collection
  bool get isNullOrEmpty {
    var iterable = this;
    return iterable == null || iterable.isEmpty;
  }

  /// Returns true if [this] is neither null nor empty collection
  bool get isNotNullOrEmpty {
    var iterable = this;
    return iterable != null && iterable.isNotEmpty;
  }
}
