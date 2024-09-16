/// Provides extensions for [Duration] to simplify time unit checks and conversions.
extension DurationExtension on Duration {
  /// Returns the number of whole years spanned by this [Duration].
  ///
  /// Note: This calculation does not account for leap years.
  int get inYears => inDays ~/ 365;

  /// Returns `true` if the [Duration] is equal to or longer than one year.
  bool get isInYears => inYears > 0;

  /// Returns `true` if the [Duration] is equal to or longer than one day.
  bool get isInDays => inDays > 0;

  /// Returns `true` if the [Duration] is equal to or longer than one hour
  /// but less than one day.
  bool get isInHours => inHours > 0 && !isInDays;

  /// Returns `true` if the [Duration] is equal to or longer than one minute
  /// but less than one hour.
  bool get isInMinutes => inMinutes > 0 && !isInHours;

  /// Returns `true` if the [Duration] is equal to or longer than one second
  /// but less than one minute.
  bool get isInSeconds => inSeconds > 0 && !isInMinutes;

  /// Returns `true` if the [Duration] is equal to or longer than one millisecond
  /// but less than one second.
  bool get isInMillis => inMilliseconds > 0 && !isInSeconds;

  /// Returns the number of minutes remaining after accounting for whole hours.
  int get absoluteMinutes => inMinutes % Duration.minutesPerHour;

  /// Returns the number of hours remaining after accounting for whole days.
  int get absoluteHours => inHours % Duration.hoursPerDay;

  /// Returns the number of seconds remaining after accounting for whole minutes.
  int get absoluteSeconds => inSeconds % Duration.secondsPerMinute;
}
