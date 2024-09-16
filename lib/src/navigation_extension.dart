import 'package:flutter/material.dart';

/// Extension to add various navigation functionalities to [BuildContext].
extension NavigationExtension on BuildContext {
  /// Pushes a new route onto the navigator stack.
  ///
  /// - [page]: The widget to navigate to.
  /// - [fullscreenDialog]: Whether the new page should be a full-screen dialog. Defaults to `false`.
  Future<T?> to<T>(Widget page, {bool fullscreenDialog = false}) {
    return Navigator.push<T>(
      this,
      MaterialPageRoute(
        builder: (context) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  /// Pushes a named route onto the navigator stack.
  ///
  /// - [routeName]: The name of the route to navigate to.
  /// - [arguments]: Optional arguments to pass to the route.
  Future<T?> toNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed<T>(
      this,
      routeName,
      arguments: arguments,
    );
  }

  /// Pops the current route off the navigator stack.
  ///
  /// - [result]: The result to return to the previous route. Defaults to `null`.
  void back<T>([T? result]) {
    Navigator.pop(this, result);
  }

  /// Pops the current route off the navigator stack until the predicate returns true.
  ///
  /// - [predicate]: A function that returns `true` for the route to stop popping at.
  void backUntil(RoutePredicate predicate) {
    Navigator.popUntil(this, predicate);
  }

  /// Replaces the current route with a new route.
  ///
  /// - [page]: The widget to navigate to.
  Future<T?> toWithReplace<T, TO>(Widget page) {
    return Navigator.pushReplacement<T, TO>(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Replaces the current route with a named route.
  ///
  /// - [routeName]: The name of the route to navigate to.
  /// - [arguments]: Optional arguments to pass to the route.
  Future<T?> replaceWithNamed<T, TO>(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed<T, TO>(
      this,
      routeName,
      arguments: arguments,
    );
  }

  /// Pushes a new route and removes all previous routes.
  ///
  /// - [page]: The widget to navigate to.
  /// - [predicate]: A function that returns `true` for the route to stop removing at.
  Future<T?> toAndRemoveAll<T>(Widget page, RoutePredicate predicate) {
    return Navigator.pushAndRemoveUntil<T>(
        this, MaterialPageRoute(builder: (context) => page), predicate);
  }

  /// Pushes a named route and removes all previous routes until the predicate returns true.
  ///
  /// - [routeName]: The name of the route to navigate to.
  /// - [predicate]: A function that returns `true` for the route to stop removing at.
  /// - [arguments]: Optional arguments to pass to the route.
  Future<T?> toNamedAndRemoveAll<T>(String routeName, RoutePredicate predicate,
      {Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      this,
      routeName,
      predicate,
      arguments: arguments,
    );
  }
}
