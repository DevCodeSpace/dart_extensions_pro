import 'dart:async';

/// Typedef for a debounced action.
typedef DeBounceAction<R> = FutureOr<R> Function();

/// Debounces method calls to ensure they run only once within [duration].
/// Useful for scenarios like search or filtering.
final class DeBouncer {
  /// Debounce period; default is 300 ms.
  /// Calls within this period are ignored.
  final Duration duration;

  /// If true, the first call runs immediately.
  final bool immediateFirstRun;

  Timer? _timer;

  /// True if a timer is active and a call is scheduled.
  bool get isRunning => _timer?.isActive ?? false;

  /// Creates an instance with an optional [Duration] (default 300 ms) and no immediate first run.
  DeBouncer([Duration? duration])
      : duration = duration ?? const Duration(milliseconds: 300),
        immediateFirstRun = false;

  /// Creates an instance with an optional [Duration] (default 300 ms) and immediate first run.
  DeBouncer.immediate([Duration? duration])
      : duration = duration ?? const Duration(milliseconds: 300),
        immediateFirstRun = true;

  /// Executes [action] after a delay defined by [duration].
  /// If [immediateFirstRun] is true, [action] runs right away on the first call.
  /// Following calls within [duration] will be deferred.
  ///
  /// Returns a [Future] that resolves with [action]'s result.
  /// For asynchronous actions, this future completes once [action]'s future resolves.
  Future<R> run<R>(DeBounceAction<R> action, {bool? immediateFirstRun}) {
    immediateFirstRun ??= this.immediateFirstRun;
    final completer = Completer<R>();
    if (immediateFirstRun && !isRunning) {
      // Immediate execution and reset timer.
      _timer?.cancel();
      _timer = Timer(duration, () {});
      return _runAction<R>(action, completer);
    }

    _timer?.cancel();
    _timer = Timer(duration, () => _runAction<R>(action, completer));

    return completer.future;
  }

  Future<R> _runAction<R>(DeBounceAction<R> action, Completer<R> completer) {
    final FutureOr<R> result = action();
    if (result is Future<R>) {
      // For async actions, complete the completer when the future resolves.
      result
          .then((value) => completer.complete(value))
          .catchError((error) => completer.completeError(error));
      return completer.future;
    }

    /// For sync actions, immediately complete the completer with the result.
    completer.complete(result);
    return completer.future;
  }

  /// Provides a shorthand for calling [run] as a function.
  ///
  /// Example usage:
  /// ```dart
  /// final debouncer = DeBouncer();
  /// debouncer(() async {
  ///   // Your action here
  ///   'debounced action'.logMsg();
  /// });
  /// ```
  ///
  /// Returns a [Future] that completes with the result of [action].
  Future<R> call<R>(DeBounceAction<R> action) => run<R>(action);

  /// Cancels the ongoing debounce timer.
  void cancel() {
    _timer?.cancel();
    _timer = null;
  }
}

/// A global [DeBouncer] instance for debouncing actions throughout the app.
/// Use the [debounce] function to work with this instance.
///
/// NOTE:
/// This shared instance may lead to conflicts if used for multiple actions with different settings.
/// For distinct debounce configurations, create separate [DeBouncer] instances.
///
/// Refer to the [debounce] function for usage details.
final DeBouncer debouncer = DeBouncer();

/// Debounces [action] calls using the global [debouncer] instance.
/// If [immediateFirstRun] is true, [action] is executed immediately on the first call.
/// Subsequent calls within [duration] are delayed.
///
/// This function avoids the need to create a new [DeBouncer] instance.
/// For different debounce settings or multiple actions, use separate [DeBouncer] instances.
///
/// Example:
/// ```dart
/// debounce(() {
///   // Your action here
///   'debounced action'.logMsg();
/// });
/// ```
///
/// To cancel the ongoing timer, call [debouncer.cancel()].
/// ```dart
/// debouncer.cancel(); // Cancels the active timer on the global instance.
/// ```
///
/// Executes [action] right away for the first call and delays further calls by 300 milliseconds.
Future<R> debounce<R>(DeBounceAction<R> action,
        {bool immediateFirstRun = false}) =>
    debouncer.run<R>(action, immediateFirstRun: immediateFirstRun);
