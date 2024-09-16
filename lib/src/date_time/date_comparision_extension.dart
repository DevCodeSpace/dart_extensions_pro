/// Extension methods for comparing and manipulating [DateTime] instances.
extension DateComparisonExtension on DateTime {
  /// Checks if the date matches [other] without considering the time.
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Determines if the date is today, disregarding the time.
  bool isToday() {
    final now = DateTime.now();
    return isSameDate(DateTime(now.year, now.month, now.day));
  }

  /// Determines if the date is the day after today, ignoring time.
  bool isTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return isSameDate(DateTime(tomorrow.year, tomorrow.month, tomorrow.day));
  }

  /// Determines if the date is the day before today, ignoring time.
  bool wasYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return isSameDate(DateTime(yesterday.year, yesterday.month, yesterday.day));
  }

  /// Returns a new [DateTime] instance with the specified number of days added.
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  /// Returns a new [DateTime] instance with the specified number of months added.
  DateTime addMonths(int months) {
    int newYear = year + (month + months - 1) ~/ 12;
    int newMonth = (month + months - 1) % 12 + 1;
    int newDay = day;
    while (newDay > daysInMonth(newYear, newMonth)) {
      newDay--;
    }
    return DateTime(newYear, newMonth, newDay, hour, minute, second,
        millisecond, microsecond);
  }

  /// Returns a new [DateTime] instance with the specified number of years added.
  DateTime addYears(int years) {
    int newYear = year + years;
    int newMonth = month;
    int newDay = day;
    while (newDay > daysInMonth(newYear, newMonth)) {
      newDay--;
    }
    return DateTime(newYear, newMonth, newDay, hour, minute, second,
        millisecond, microsecond);
  }

  /// Calculates the number of days in the given month of the specified year.
  int daysInMonth(int year, int month) {
    List<int> monthLengths = [
      31, // January
      28, // February (non-leap year)
      31, // March
      30, // April
      31, // May
      30, // June
      31, // July
      31, // August
      30, // September
      31, // October
      30, // November
      31, // December
    ];

    if (month == 2 && isLeapYear(year)) {
      return 29;
    } else {
      return monthLengths[month - 1];
    }
  }

  /// Checks if the given year is a leap year.
  bool isLeapYear(int year) {
    if (year % 4 != 0) return false;
    if (year % 100 == 0 && year % 400 != 0) return false;
    return true;
  }

  /// Returns a new [DateTime] instance with the specified number of days subtracted.
  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }

  /// Returns a new [DateTime] instance with the specified number of months subtracted.
  DateTime subtractMonths(int months) {
    int newYear = year - (month - months - 1) ~/ 12;
    int newMonth = (month - months - 1) % 12 + 1;
    if (newMonth <= 0) {
      newYear -= 1;
      newMonth += 12;
    }
    int newDay = day;
    while (newDay > daysInMonth(newYear, newMonth)) {
      newDay--;
    }
    return DateTime(newYear, newMonth, newDay, hour, minute, second,
        millisecond, microsecond);
  }

  /// Returns a new [DateTime] instance with the specified number of years subtracted.
  DateTime subtractYears(int years) {
    int newYear = year - years;
    int newMonth = month;
    int newDay = day;
    while (newDay > daysInMonth(newYear, newMonth)) {
      newDay--;
    }
    return DateTime(newYear, newMonth, newDay, hour, minute, second,
        millisecond, microsecond);
  }

  /// Shortcut for obtaining the current date and time.
  DateTime now() => DateTime.now();

  /// Provides a [DateTime] instance with only the date component, excluding time.
  /// Example:
  ///     final date = DateTime().now();   // 26-07-2020 16:54:23
  ///     date.dateOnly                    // 26-07-2020
  /// Useful for date comparisons without time influence.
  DateTime get dateOnly => DateTime(year, month, day);

  /// Calculates the time span between [this] and the current moment.
  Duration fromNow() => difference(now());

  /// Checks if [this] is before the date of [other], ignoring time.
  bool isBeforeDate(DateTime other) => dateOnly.isBefore(other.dateOnly);

  /// Checks if [this] is after the date of [other], ignoring time.
  bool isAfterDate(DateTime other) => dateOnly.isAfter(other.dateOnly);

  /// Determines if [this] is a date in the past, without considering time.
  bool get isPast => isBefore(DateTime.now());

  /// Determines if [this] is a future date, without considering time.
  bool get isFuture => isAfter(DateTime.now());

  /// Checks if [this] falls in the month preceding the current month.
  bool get isInPreviousMonth {
    final now = DateTime.now();
    final previousMonth = DateTime(now.year, now.month - 1, now.day);
    return month == previousMonth.month && year == previousMonth.year;
  }

  /// Checks if [this] falls in the month following the current month.
  bool get isInNextMonth {
    final now = DateTime.now();
    final nextMonth = DateTime(now.year, now.month + 1, now.day);
    return month == nextMonth.month && year == nextMonth.year;
  }

  /// Checks if [this] falls in the year before the current year.
  bool get isInPreviousYear => year == DateTime.now().year - 1;

  /// Checks if [this] falls in the year after the current year.
  bool get isInNextYear => year == DateTime.now().year + 1;

  /// Checks if [this] is a Monday according to ISO 8601.
  bool get isMonday => weekday == DateTime.monday;

  /// Checks if [this] is a Tuesday according to ISO 8601.
  bool get isTuesday => weekday == DateTime.tuesday;

  /// Checks if [this] is a Wednesday according to ISO 8601.
  bool get isWednesday => weekday == DateTime.wednesday;

  /// Checks if [this] is a Thursday according to ISO 8601.
  bool get isThursday => weekday == DateTime.thursday;

  /// Checks if [this] is a Friday according to ISO 8601.
  bool get isFriday => weekday == DateTime.friday;

  /// Checks if [this] is a Saturday according to ISO 8601.
  bool get isSaturday => weekday == DateTime.saturday;

  /// Checks if [this] is a Sunday according to ISO 8601.
  bool get isSunday => weekday == DateTime.sunday;

  /// Checks if [this] falls in January.
  bool get isInJanuary => month == DateTime.january;

  /// Checks if [this] falls in February.
  bool get isInFebruary => month == DateTime.february;

  /// Checks if [this] falls in March.
  bool get isInMarch => month == DateTime.march;

  /// Checks if [this] falls in April.
  bool get isInApril => month == DateTime.april;

  /// Checks if [this] falls in May.
  bool get isInMay => month == DateTime.may;

  /// Checks if [this] falls in June.
  bool get isInJune => month == DateTime.june;

  /// Checks if [this] falls in July.
  bool get isInJuly => month == DateTime.july;

  /// Checks if [this] falls in August.
  bool get isInAugust => month == DateTime.august;

  /// Checks if [this] falls in September.
  bool get isInSeptember => month == DateTime.september;

  /// Checks if [this] falls in October.
  bool get isInOctober => month == DateTime.october;

  /// Checks if [this] falls in November.
  bool get isInNovember => month == DateTime.november;

  /// Checks if [this] falls in December.
  bool get isInDecember => month == DateTime.december;
}
