/// Extension methods for [Iterator]
extension IteratorExtension<E> on Iterator<E> {
  /// Moves to the next item and returns it, or null if done
  E? next() => moveNext() ? current : null;
}
