import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Provides additional functionality for [String] type.
extension StringExtensions on String {
  /// Capitalizes the first letter of the string.
  String iscapitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Returns the first letter of the string.
  String getFirstLetter() {
    if (isEmpty) return '';
    return this[0];
  }

  /// Returns the last letter of the string or an empty string if empty.
  String getLastLetter() {
    if (isEmpty) return '';
    return this[length - 1];
  }

  /// Copies the string to the clipboard asynchronously.
  Future<void> copyTo() async {
    await Clipboard.setData(ClipboardData(text: this));
  }

  /// Checks if the string is a valid email address.
  bool isValidEmail() {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(this);
  }

  /// Checks if the string contains any type of emoji.
  bool get containsEmoji {
    final regex = RegExp(
        r'(\u00a9|\u00ae|[\u2000-\u3300]|[\ud83c-\ud83e][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3?|[\u2194-\u21aa]|[\u2300-\u2b55]|[\u2934-\u2b55]|[\u3030-\u303d]|[\u3297-\u3299]|[\u2049-\u2139]|[\ud83c][\udde6-\uddff]|[\ud83c][\udde8-\uddec]|[\ud83c][\uddee-\uddfa]|[\ud83c][\uddfb-\uddff]|[\ud83d][\ude00-\ude4f]|[\ud83d][\ude80-\udec2]|[\ud83d][\uded0-\udee5]|[\ud83d][\udee7-\udfff]|[\ud83d][\udc00-\uddff]|[\ud83e][\udd00-\uddff]|[\ud83e][\udc00-\udfff]|[\ud83e][\udc00-\uddff])');
    return regex.hasMatch(this);
  }

  /// Checks if the string does not contain any emoji.
  bool get doesNotContainEmoji => !containsEmoji;

  /// Checks if the string is a valid Indian mobile number.
  bool get isIndianMobileNumber {
    final regex = RegExp(r'^[6-9]\d{9}$');
    return regex.hasMatch(this);
  }

  /// Validates if the string is a valid 5-digit PIN code.
  bool isValidPinCode() {
    final pinCodeRegex = RegExp(r'^\d{5}$');
    return pinCodeRegex.hasMatch(this);
  }

  /// Returns true if the string is a valid URL.
  bool isValidUrl() {
    final urlRegex = RegExp(
      r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
    );
    return urlRegex.hasMatch(this);
  }

  /// Returns true if the string is a valid number.
  bool isNumeric() {
    if (isEmpty) return false;
    final numberRegex = RegExp(r'^-?[0-9]+(\.[0-9]+)?$');
    return numberRegex.hasMatch(this);
  }

  /// Trims the string and removes all whitespace.
  String isremoveAllWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Returns true if the string is a palindrome.
  bool isPalindrome() {
    final trimmed = isremoveAllWhitespace().toLowerCase();
    return trimmed == trimmed.split('').reversed.join('');
  }

  /// Converts the string to camel case.
  String toCamelCase() {
    return split(' ')
        .map((word) => word.isEmpty
            ? word
            : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join('');
  }

  /// Converts the string to snake case.
  String toSnakeCase() {
    return replaceAllMapped(
            RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}')
        .replaceAll(RegExp(r'\s+'), '_')
        .toLowerCase();
  }

  /// Reverses the string.
  String reverse() {
    return split('').reversed.join('');
  }

  /// Checks if the string contains only alphabets.
  bool isAlphabetic() {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }

  /// Checks if the string contains only alphanumeric characters.
  bool isAlphanumeric() {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
  }

  /// Returns the initials of the string.
  String initials() {
    return split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase())
        .join('');
  }

  /// Checks if the string is a strong password.
  /// A strong password must:
  /// - Be at least 8 characters long
  /// - Contain at least one uppercase letter
  /// - Contain at least one lowercase letter
  /// - Contain at least one digit
  /// - Contain at least one special character
  bool isStrongPassword() {
    final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$');
    return passwordRegex.hasMatch(this);
  }

  /// Checks if the string is a proper name.
  ///
  /// A proper name must:
  /// - Not be empty.
  /// - Start with a capital letter.
  /// - Contain only letters, spaces, and hyphens.
  ///
  /// Returns `true` if the string is a proper name, otherwise `false`.
  bool isUserName() {
    // Check if the string is empty
    if (isEmpty) {
      return false;
    }

    // Check if the string starts with a capital letter
    if (!RegExp(r'^[A-Z]').hasMatch(this)) {
      return false;
    }

    // Check if the string contains only valid characters (letters, spaces, and hyphens)
    if (!RegExp(r'^[A-Za-z\s-]+$').hasMatch(this)) {
      return false;
    }

    // If all checks pass, return true
    return true;
  }

  /// Converts the string to a double or returns `null` if conversion fails.
  double? toDouble() {
    return double.tryParse(this);
  }

  /// Converts the string to an int or returns `null` if conversion fails.
  int? toInt() {
    return int.tryParse(this);
  }

  /// Returns the number of words in the string.
  int get wordCount {
    if (isEmpty) return 0;
    return split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length;
  }

  /// Parses [this] to an [int] or returns null.
  /// Radix can be between 2 and 36.
  int? toIntOrNull({int? radix}) => int.tryParse(this, radix: radix);

  /// Wraps the string with [prefix] and [suffix].
  /// If [suffix] is not provided, [prefix] is used as [suffix].
  ///
  /// Examples:
  ///   - 'hello'.wrap("*") returns '*hello*'
  ///   - 'html'.wrap('<', '>') returns '<html>'
  String wrap(String prefix, [String? suffix]) =>
      '$prefix$this${suffix ?? prefix}';

  /// Removes [prefix] and [suffix] from the string if they exist.
  /// If [suffix] is not provided, [prefix] is used as [suffix].
  ///
  /// Examples:
  ///   - '*hello*'.unwrap("*") returns 'hello'
  ///   - '<html>'.unwrap('<', '>') returns 'html'
  String unwrap(String prefix, [String? suffix]) {
    suffix ??= prefix;
    if (startsWith(prefix)) {
      return substring(
        prefix.length,
        endsWith(suffix) ? length - suffix.length : length,
      );
    }
    return endsWith(suffix) ? substring(0, length - suffix.length) : this;
  }

  /// Converts the string to a boolean if it represents a true value (case insensitive)
  /// or a non-zero integer; otherwise, returns null.
  ///
  /// Examples:
  ///   - 'true'.toBoolOrNull() returns true
  ///   - 'TRUE'.toBoolOrNull() returns true
  ///   - 'FALSE'.toBoolOrNull() returns false
  ///   - 'something'.toBoolOrNull() returns null
  ///   - '1'.toBoolOrNull() returns true
  ///   - '0'.toBoolOrNull() returns false
  bool? toBoolOrNull() {
    final lowerCaseStr = toLowerCase();
    if (lowerCaseStr == 'true') return true;
    if (lowerCaseStr == 'false') return false;
    return toIntOrNull() != null && toIntOrNull()! > 0;
  }

  /// Removes the specified prefix from the string if it exists.
  ///
  /// Examples:
  ///   - 'hello-world'.removeIfHasPrefix('hello') returns '-world'
  ///   - 'hello-world'.removeIfHasPrefix('world') returns 'hello-world'
  String removeIfHasPrefix(String prefix) =>
      startsWith(prefix) ? substring(prefix.length) : this;

  /// Removes the specified suffix from the string if it exists.
  ///
  /// Examples:
  ///   - 'hello-world'.removeIfHasSuffix('world') returns 'hello-'
  ///   - 'hello-world'.removeIfHasSuffix('hello') returns 'hello-world'
  String removeIfHasSuffix(String suffix) =>
      endsWith(suffix) ? substring(0, length - suffix.length) : this;

  /// Checks if the string can be parsed as a binary number (only contains 1's and 0's).
  bool get isBinary => toIntOrNull(radix: 2) != null;

  /// Checks if the string can be parsed as a hexadecimal number, which only
  /// contains characters 0-9 and A-F or a-f.
  bool get isHexadecimal => toIntOrNull(radix: 16) != null;

  /// Checks if the string can be parsed as an octal number, which only
  /// contains characters 0-7.
  bool get isOctal => toIntOrNull(radix: 8) != null;

  /// Checks if the string can be parsed as a decimal number.
  bool get isDecimal => toIntOrNull() != null;

  /// Checks if the string can be parsed into a double.
  bool get isDouble => toDoubleOrNull() != null;

  /// Tries to parse the string into a double, returning null if parsing fails.
  double? toDoubleOrNull() => double.tryParse(this);

  /// Tokenizes [this] into words by splitting it with spaces.
  /// Only non-empty words are included.
  List<String> get words =>
      trim().split(' ').where((element) => element.hasContent).toList();

  /// Checks if the string is blank (contains only whitespace characters or is empty).
  bool get isBlank => trim().isEmpty;

  /// Checks if the string is not blank (contains non-whitespace characters).
  bool get hasContent => trim().isNotEmpty;

  /// Tries to parse the string into a [DateTime], returning null if parsing fails.
  DateTime? toDateTimeOrNull() => DateTime.tryParse(this);

  /// Converts a JSON-encoded string into a [Map] with [String] keys and [dynamic] values.
  ///
  /// Decodes the JSON string and casts it into a [Map]. The map represents a JSON
  /// object with keys of type [String] and values of type [dynamic].
  ///
  /// - Returns: A [Map] containing key-value pairs representing the JSON object.
  Map<String, dynamic> decodeJson() =>
      json.decode(this) as Map<String, dynamic>;

  /// Converts a JSON-encoded string into a [List] of [Map]s with [String] keys and [dynamic] values.
  ///
  /// Decodes the JSON string and casts it into a [List] of [Map]s. Each map represents
  /// a JSON object with keys of type [String] and values of type [dynamic].
  ///
  /// - Returns: A [List] of [Map]s, each containing key-value pairs representing the JSON objects.
  List<Map<String, dynamic>> decodeJsonArray() =>
      List<Map<String, dynamic>>.from(json.decode(this) as Iterable);

  /// Compares two strings for equality, ignoring case differences.
  ///
  /// - Parameter matcher: The string to compare with the original string.
  /// - Returns: A boolean indicating whether the two strings are equal when
  ///            case differences are ignored.
  bool equalsToIgnoreCase(String matcher) =>
      toLowerCase() == matcher.toLowerCase();

  /// Counts occurrences of a character in a string.
  ///
  /// - Parameters:
  ///   - match: The character to count.
  ///   - caseSensitive: Whether the match is case-sensitive. Default is true.
  /// - Returns: The count of the character.
  int countOccurrences(String match, {bool caseSensitive = true}) {
    var count = 0;
    for (final char in characters) {
      if (caseSensitive ? char == match : char.equalsToIgnoreCase(match)) {
        count++;
      }
    }
    return count;
  }

  /// Finds the index of the first occurrence of a pattern.
  int findIndexOf(Pattern pattern) => indexOf(pattern);

  /// Capitalizes the first letter of each word.
  String title() => split(' ').map((e) => e.iscapitalize()).join(' ');

  /// Toggles the case of each character.
  String get toggledCase => characters
      .map((e) => e.toUpperCase() == e ? e.toLowerCase() : e.toUpperCase())
      .join();

  /// Splits the string using [regex], mapping matches and non-matches with [onMatch] and [onNonMatch].
  String splitMapJoinRgex(
    RegExp regex, {
    String Function(RegExpMatch match)? onMatch,
    String Function(String text)? onNonMatch,
  }) {
    return splitMapJoin(
      regex,
      onMatch: onMatch != null
          ? (match) {
              match as RegExpMatch;
              return onMatch(match);
            }
          : null,
      onNonMatch: onNonMatch,
    );
  }

  /// Splits the string with [regex], mapping matches and non-matches to a list using [onMatch] and [onNonMatch].
  List<R> splitMap<R>(
    RegExp regex, {
    R? Function(RegExpMatch match)? onMatch,
    R? Function(String text)? onNonMatch,
  }) {
    List<R> list = [];
    splitMapJoinRgex(
      regex,
      onMatch: onMatch != null
          ? (match) {
              final result = onMatch(match);
              if (result != null) list.add(result);
              return match[0]!;
            }
          : null,
      onNonMatch: onNonMatch != null
          ? (nonMatch) {
              final result = onNonMatch(nonMatch);
              if (result != null) list.add(result);
              return nonMatch;
            }
          : null,
    );
    return list;
  }
}

// Extension on String to convert a hex color string to a Color object.
extension ColorExtension on String {
  /// Converts a hex color string to a Color object.
  Color toColor() {
    var hexStringColor = this;
    final buffer = StringBuffer();

    // Validate hex string length and format
    if (hexStringColor.length == 6 || hexStringColor.length == 7) {
      buffer.write('ff'); // Add 'ff' for full opacity
      buffer
          .write(hexStringColor.replaceFirst("#", "")); // Remove '#' if present
      return Color(
          int.parse(buffer.toString(), radix: 16)); // Parse and create Color
    }
    throw ArgumentError('Invalid hex color format'); // Invalid format
  }
}

/// Class to handle hex color codes with optional alpha component.
class HexColor extends Color {
  /// Converts a hex color string to an integer color value.
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor
        .toUpperCase()
        .replaceAll("#", ""); // Normalize hex color string
    if (hexColor.length == 6) hexColor = "FF$hexColor"; // Add alpha if missing
    return int.parse(hexColor, radix: 16); // Parse and return color value
  }

  /// Creates a HexColor instance from a hex color string.
  HexColor(final String hexColor) : super(getColorFromHex(hexColor));
}

extension PrintExtension on Object {
  /// Prints the object and returns it for chaining or debugging.
  logMsg() {
    /// Print the object (currently does nothing).
    log('$this');
  }
}

/// Extension on [Color] to provide utility methods for color manipulation and conversion.
extension ColorExtensions on Color {
  /// Darkens the color by blending it with black.
  ///
  /// The [amount] parameter determines how much to darken the color.
  /// A value of 0.0 returns the original color, and a value of 1.0 returns black.
  /// Defaults to 0.1 if not specified.
  Color darken([double amount = .1]) => Color.lerp(this, Colors.black, amount)!;

  /// Lightens the color by blending it with white.
  ///
  /// The [amount] parameter determines how much to lighten the color.
  /// A value of 0.0 returns the original color, and a value of 1.0 returns white.
  /// Defaults to 0.1 if not specified.
  Color lighten([double amount = .1]) =>
      Color.lerp(this, Colors.white, amount)!;

  /// Converts the color to its hexadecimal string representation.
  ///
  /// Returns the hexadecimal color code in the format '#RRGGBB'.
  String toHex() =>
      '#${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}';
}

/// Extension on [num] to provide utility methods for number formatting and conversion.
extension NumExtensions on num {
  /// Formats the number as a currency string with the specified symbol.
  ///
  /// The [symbol] parameter determines the currency symbol to use.
  /// Defaults to '$' if not specified. The number is formatted with two decimal places.
  String toCurrency([String symbol = '\$']) => '$symbol${toStringAsFixed(2)}';

  /// Converts the number to a [Duration], assuming the number represents seconds.
  ///
  /// The number is multiplied by 1000 to convert seconds to milliseconds and then used to create the [Duration].
  Duration toDuration() => Duration(milliseconds: (this * 1000).round());

  /// Returns the plural or singular form of a word based on the number.
  ///
  /// If the number is 1, returns the [singular] form.
  /// Otherwise, returns the [plural] form if provided, or appends 's' to the singular form if no plural form is specified.
  String pluralize(String singular, [String? plural]) =>
      this == 1 ? singular : (plural ?? '${singular}s');
}

/// Extension on [FormState] to provide utility methods for form management.
extension FormExtensions on FormState {
  /// Validates all the form fields.
  ///
  /// This method iterates through all the form fields and validates them
  /// based on the validation logic provided in each field's validator function.
  /// It returns `true` if all fields are valid; otherwise, it returns `false`.
  bool validateAllFields() {
    return validate();
  }

  /// Resets all the form fields to their initial values.
  ///
  /// This method resets the state of all the form fields to their initial
  /// values, clearing any validation errors that might be displayed.
  void resetAllFields() {
    reset();
  }
}

/// Extension on [String?] to provide utility methods for null and empty checks.
extension NullableString on String? {
  /// Checks if the string is null or empty.
  ///
  /// Returns `true` if the string is null or its length is zero; otherwise, `false`.
  bool get isNullOrEmpty {
    var stringValue = this;
    return stringValue == null || stringValue.isEmpty;
  }

  /// Checks if the string is neither null nor empty.
  ///
  /// Returns `true` if the string is not null and its length is greater than zero; otherwise, `false`.
  bool get isNotNullOrEmpty {
    var stringValue = this;
    return stringValue != null && stringValue.isNotEmpty;
  }

  /// Checks if the string is null or contains only whitespace.
  ///
  /// Returns `true` if the string is null or contains only whitespace characters after trimming; otherwise, `false`.
  bool get isNullOrBlank {
    var stringValue = this;
    return stringValue == null || stringValue.trim().isEmpty;
  }

  /// Checks if the string is neither null nor contains only whitespace.
  ///
  /// Returns `true` if the string is not null and contains non-whitespace characters after trimming; otherwise, `false`.
  bool get isNotNullOrBlank {
    var stringValue = this;
    return stringValue != null && stringValue.trim().isNotEmpty;
  }

  /// Checks if the string has any content (not null and not empty).
  ///
  /// This is an alias for [isNotNullOrEmpty].
  bool get hasContent => isNotNullOrEmpty;

  /// Returns the string itself if it's not null; otherwise, returns an empty string.
  ///
  /// This is useful for ensuring a non-null string value.
  String get orEmpty => this ?? '';
}
