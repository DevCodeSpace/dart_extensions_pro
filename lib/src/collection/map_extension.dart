import 'dart:collection';
import 'dart:convert';

extension MapExtension<K, V> on Map<K, V> {
  /// Adds a key-value [entry] to the map using the `+` operator.
  void operator +((K, V) entry) => this[entry.$1] = entry.$2;

  /// Inserts a [MapEntry] into the map using the `<<` operator.
  void operator <<(MapEntry<K, V> entry) => this[entry.key] = entry.value;

  /// Converts the map into a JSON string.
  String toJson() => json.encode(this);

  /// Returns a new map without the specified [keys].
  Map<K, V> except(Iterable<K> keys) =>
      Map.fromEntries(entries.where((entry) => !keys.contains(entry.key)));

  /// Returns a new map containing only the specified [keys].
  Map<K, V> only(Iterable<K> keys) => {
        for (final MapEntry(:key, :value) in entries)
          if (keys.contains(key)) key: value
      };

  /// Filters the map based on a [test] and returns matching key-value pairs.
  Map<K, V> where(bool Function(K key, V value) test) => {
        for (final MapEntry(:key, :value) in entries)
          if (test(key, value)) key: value
      };

  /// Filters the map to exclude key-value pairs that match the [test].
  Map<K, V> whereNot(bool Function(K key, V value) test) => {
        for (final MapEntry(:key, :value) in entries)
          if (!test(key, value)) key: value
      };

  /// Returns an iterable of key-value pairs as records instead of [MapEntry].
  ///
  /// Useful when iterating over the map while accessing both keys and values.
  Iterable<(K key, V value)> get documents sync* {
    for (final entry in entries) {
      yield (entry.key, entry.value);
    }
  }

  /// Removes the given [keys] from the map.
  /// If the map is immutable, returns a new map excluding the [keys].
  Map<K, V> removeKeys(Iterable<K> keys) {
    if (this is UnmodifiableMapBase) return except(keys);
    return this..removeWhere((key, value) => keys.contains(key));
  }
}
