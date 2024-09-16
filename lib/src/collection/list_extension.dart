extension ListExtension<E> on List<E> {
  /// Appends an [element] to the list using the `<<` operator.
  List<E> operator <<(E element) => this..add(element);

  /// Replaces the first item that matches the [predicate] with [replacement].
  /// Returns `true` if a replacement was made, `false` otherwise.
  bool replaceFirstWhere(E replacement, bool Function(E item) predicate) {
    if (isEmpty) return false;
    for (int index = 0; index < length; index++) {
      if (predicate(elementAt(index))) {
        this[index] = replacement;
        return true;
      }
    }
    return false;
  }

  /// Replaces the last item that matches the [predicate] with [replacement].
  /// Returns `true` if a replacement was made, `false` otherwise.
  bool replaceLastWhere(E replacement, bool Function(E item) predicate) {
    if (isEmpty) return false;
    for (int index = length - 1; index >= 0; index--) {
      if (predicate(elementAt(index))) {
        this[index] = replacement;
        return true;
      }
    }
    return false;
  }
}
