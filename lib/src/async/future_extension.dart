import 'dart:async';

/// Runs [action] in the next event-loop after micro-tasks.
Future<T> scheduleNextIteration<T>(FutureOr<T> Function() action) =>
    Future.delayed(Duration.zero, action);

/// Runs [action] after a [millis] delay, no sooner than the next event-loop.
Future<T> delayed<T>(int millis, FutureOr<T> Function() action) =>
    Future.delayed(Duration(milliseconds: millis), action);
