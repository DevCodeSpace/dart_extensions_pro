import 'dart:async';

/// A mixin for managing stream subscriptions across different scopes.
mixin StreamSubscriptionMixin {
  late final Map<String, List<StreamSubscription<dynamic>>> _scopes = {};

  /// The default scope used for subscriptions if no specific scope is provided.
  static const String defaultScope = 'default';

  /// Subscribes to the specified [stream] and adds the resulting subscription
  /// to the specified [scope]. If no scope is provided, it defaults to
  /// [StreamSubscriptionMixin.defaultScope]. All subscriptions in this default
  /// scope will be cancelled when [cancelSubscriptions] is called.
  ///
  /// To manage subscriptions more precisely, you can use a custom [scope]. After
  /// adding subscriptions to a custom scope, you can call [cancelScopedSubscriptions]
  /// to cancel only those in the specified scope.
  ///
  /// Parameters [onData], [onError], [onDone], and [cancelOnError] are used just
  /// like in [Stream.listen].
  StreamSubscription<T> listenTo<T>(
    Stream<T> stream,
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
    String scope = defaultScope,
  }) {
    final subscription = stream.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    _scopes.update(scope, (list) => list..add(subscription),
        ifAbsent: () => [subscription]);
    return subscription;
  }

  /// Cancels all subscriptions within the specified [scope].
  void cancelScopedSubscriptions(String scope) {
    _scopes[scope]?.forEach((subscription) => subscription.cancel());
    _scopes.remove(scope);
  }

  /// Cancels all subscriptions across all scopes. This method is intended to be
  /// used when disposing of the object.
  void cancelSubscriptions() {
    for (final scope in _scopes.entries) {
      for (final subscription in scope.value) {
        subscription.cancel();
      }
    }
    _scopes.clear();
  }
}
