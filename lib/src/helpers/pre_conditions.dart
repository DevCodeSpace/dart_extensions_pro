/// Throws [IllegalStateException] if [argument] is `null`.
/// Uses [message] in the error if provided.
/// Returns [argument] if it's non-null.
T checkNotNull<T>(T argument, [String? message]) =>
    argument ??
    (throw IllegalStateException(message ?? 'Argument cannot be null'));

/// Throws [IllegalStateException] if [value] is `false`.
/// Uses [message] in the error if provided.
/// Avoid using with a positional boolean parameter.
void check(bool value, [String? message]) {
  if (!value) {
    throw IllegalStateException(message ?? 'Value cannot be false');
  }
}

/// Throws [IllegalArgumentException] if [argument] is `null`.
/// Uses [message] in the error if provided.
/// Returns [argument] if it's non-null.
T requireNotNull<T>(T argument, [String? message]) =>
    argument ??
    (throw IllegalArgumentException(message ?? 'Argument must not be null'));

/// Throws [IllegalArgumentException] if [value] is `false`.
/// Uses [message] in the error if provided.
/// Avoid using with a positional boolean parameter.
void require(bool value, [String? message]) {
  if (!value) {
    throw IllegalArgumentException(message ?? 'Value must be true');
  }
}

/// Exception for illegal or inappropriate arguments.
class IllegalArgumentException implements Exception {
  /// Error message.
  final String message;

  /// Creates an instance with [message].
  IllegalArgumentException(this.message);

  @override
  String toString() => 'IllegalArgumentException: $message';
}

/// Exception for illegal or inappropriate method calls.
class IllegalStateException implements Exception {
  /// Error message.
  final String message;

  /// Creates an instance with [message].
  IllegalStateException(this.message);

  @override
  String toString() => 'IllegalStateException: $message';
}
