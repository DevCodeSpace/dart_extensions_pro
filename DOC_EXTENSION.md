# Extensions

## comparable_extension
| Extension | Type | Description |
|---|---|---|
| `<` | `METHOD` | Less than operator. |
| `<=` | `METHOD` | Less than or equal to operator. |
| `<` | `METHOD` | Greater than operator. |
| `<=` | `METHOD` | Greater than or equal to operator. |
| `atLeast` | `METHOD` | Returns this value if it's greater than or equal to [minimum], otherwise [minimum]. |
| `atMost` | `METHOD` | Returns this value if it's less than or equal to [maximum], otherwise [maximum]. |
| `inRange` | `METHOD` | Returns this value if it's within the range [min]..[max], otherwise the nearest bound. |


## iterable_extension
| Extension | Type | Description |
|---|---|---|
| `secOrNull` | `METHOD` | Returns null if the iterable contains fewer than two elements. |
| `thirdOrNull` | `METHOD` | Returns null if the iterable contains fewer than three elements. |
| `thirdOrNull` | `METHOD` | Returns null if the iterable contains fewer than three elements. |
| `hasSingleElement` | `METHOD` | Checks if the collection contains exactly one element. |
| `addAllMatchingTo` | `METHOD` |  Adds all elements that satisfy the given [predicate] to the provided [target] list. |
| `whereFilter` | `METHOD` | Alias for [Iterable.where]. |
| `whereFilterIndexed` | `METHOD` | Alias for [whereIndexed] which returns a new lazy Iterable. |
| `Function` | `METHOD` | Applies the [transform] function to each element and returns an iterable of the results. |
| `skipElements` | `METHOD` | Returns a new iterable that skips the first [count] elements. |
| `takeLastElements` | `METHOD` | Returns a new iterable that contains the last [count] elements. |
| `skipWhileElements` | `METHOD` | Returns a new iterable that skips elements while [test] is satisfied. |
| `skipLastElements` | `METHOD` | Returns a new iterable that skips the last [count] elements. |
| `allSatisfy` | `METHOD` | Returns true if all elements satisfy the [test]. |
| `mapToMap` | `METHOD` | Returns a [Map] containing key-value pairs provided by [transform] function applied to each element of the iterable. |
| `mapToMapTo` | `METHOD` |Populates and returns the [destination] map with key-value pairs provided by [transform] function applied to each element of the given iterable. |
| `mapByKey` | `METHOD` | Returns a [Map] where each element from the given [List] is associated with a key derived from applying the [keyExtractor] function to each element.The [keyExtractor] function should return a key of type [K] for each element.|
| `mapByKeyTo` | `METHOD` | Populates the [targetMap] with key-value pairs from the current iterable. The key for each pair is obtained by applying the [keyExtractor] function to each element, and the value is the element itself. Returns the [targetMap] after it has been populated. |
| `mapElementsToValues` | `METHOD` | Creates a [Map] where each key is an element from the current iterable and the corresponding value is obtained by applying the [valueProvider] function to that element. |
| `mapElementsToValuesIn` | `METHOD` | Populates the [targetMap] with key-value pairs from the current iterable,where each key is an element from the iterable, and the corresponding value is obtained by applying the [valueProvider] function to that key.Returns the [targetMap] after it has been populated. |
| `groupByElements` | `METHOD` |Groups elements of the current iterable by a key obtained from applying the [keyExtractor] function to each element. Returns a [Map] where each key is associated with a list of elements that correspond to that key. |
| `groupByToElements` | `METHOD` | Groups elements of the current iterable by a key obtained from applying the [keyExtractor] function to each element and populates the [targetMap] with each group key associated with a list of that correspond to that key. Returns the [targetMap] after it has been populated. |
| `distinct` | `METHOD` | Returns an iterable containing only distinct elements from the given iterable. |
| `distinctBy` | `METHOD` | Returns an iterable containing only elements from the given iterable having distinct keys returned by the provided [keySelector] function. |
| `distinctBy` | `METHOD` | Returns an iterable containing only elements from the given iterable having distinct keys returned by the provided [keySelector] function. |
| `intersection` | `METHOD` | Returns an iterable containing all elements that are present in both [this] iterable and the [other] iterable. |
| `difference` | `METHOD` | Returns an iterable containing all elements that are present in [this] iterable but not in the [other] iterable. |
| `union` | `METHOD` | Returns an iterable containing all distinct elements from both iterables. |
| `countWhere` | `METHOD` | Returns the number of elements in [this] iterable that satisfy the given [predicate]. |
| `foldRight` | `METHOD` |  Accumulates value starting with [initialValue] value and applying [operation] from right to left to each element and current accumulator value. |
| `foldRightIndexed` | `METHOD` |  Accumulates value starting with [initialValue] value and applying [operation] from right to left to each element with its index in the original list and current accumulator value. |
| `randomOrNull` | `METHOD` | Returns a random element from [this]. Returns null if no elements are present. |
| `random` | `METHOD` | Returns a random element from [this]. Throws [StateError] if there are no elements in the collection. |
| `maxByOrNull` | `METHOD` | Returns the first element yielding the largest value of the given function or `null` if there are no elements. |
| `onEach` | `METHOD` | Performs the given [action] on each element and returns the iterable itself afterwards. |
| `maxByLastOrNull` | `METHOD` | Returns the last element yielding the largest value of the given function. Throws [StateError] if there are no elements in the collection. |
| `maxBy` | `METHOD` | Returns the first element yielding the largest value of the given function. Throws [StateError] if there are no elements in the collection. |
| `maxByLast` | `METHOD` | Returns the last element yielding the largest value of the given function Throws [StateError] if there are no elements in the collection. |
| `minByOrNull` | `METHOD` | Returns the first element yielding the smallest value of the given Returns the first element yielding the smallest value of the given |
| `minBy` | `METHOD` | Returns the first element yielding the smallest value of the given function.Throws [StateError] if there are no elements in the collection. |
| `minByLastOrNull` | `METHOD` | Returns the last element yielding the smallest value of the given function or `null` if there are no elements. |
| `minByLast` | `METHOD` | Returns the last element yielding the smallest value of the given function.Throws [StateError] if there are no elements in the collection. |
| `sumBy` | `METHOD` | Returns the sum of all values produced by [selector] function applied to each element in the collection. |
| `averageBy` | `METHOD` | Returns the average of all values produced by [selector] function applied to each element in the collection. |
| `except` | `METHOD` | Alias for [subtract]. |
| `containsAll` | `METHOD` | Returns true if the collection contains all the elements present in [other] collection. |
| `containsNone` | `METHOD` | Returns true if the collection doesn't contain any of the elements present in [other] collection. |
| `findBy` | `METHOD` | Finds an element where the result of [selector] matches the [query].Throws [StateError] if no element is found. |
| `findByOrNull` | `METHOD` | Finds an element where the result of [selector] matches the [query].Returns null if no element is found.|
| `findAllBy` | `METHOD` | Finds all elements where the result of [selector] matches the [query].Returns empty collection if no element is found.|
| `records` | `METHOD` |Returns an iterable containing the items with their respective indices in form of records. |
| `isNullOrEmpty` | `METHOD` |  Returns true if [this] is either null or empty collection |
| `isNotNullOrEmpty` | `METHOD` | Returns true if [this] is neither null nor empty collection |

## iterator_extension
| Extension | Type | Description |
|---|---|---|
| `next` | `METHOD` | Advances the current index and returns current element |

## list_extension
| Extension | Type | Description |
|---|---|---|
| `<<` | `METHOD` | Adds an [element] to the end of the list using the `<<` operator. |
| `replaceFirstWhere` | `METHOD` | Returns `true` if an element was replaced, otherwise returns `false`. |
| `replaceLastWhere` | `METHOD` | Returns `true` if an element was replaced, otherwise returns `false`. |

## map_extension
| Extension | Type | Description |
|---|---|---|
| `+` | `METHOD` |Adds a key-value [entry] to the map using the `+` operator. |
| `<<` | `METHOD` |Adds a [MapEntry] to the map using the `<<` operator. |
| `toJson` | `METHOD` | Converts the map to a JSON string. |
| `except` | `METHOD` | Returns a new map excluding the specified [keys]. |
| `only` | `METHOD` | Returns a new map including only the specified [keys]. |
| `where` | `METHOD` | Returns a new map containing only the key-value pairs that satisfy the [test]. |
| `whereNot` | `METHOD` | Returns a new map containing only the key-value pairs that do not satisfy the [test]. |
| `documents` | `METHOD` | Similar to [Map.entries] but returns an iterable of records instead of [MapEntry]. |
| `removeKeys` | `METHOD` | If the map is unmodifiable, returns a new map excluding the [keys]. |

## future_extension
| Extension | Type | Description |
|---|---|---|
| `scheduleNextIteration` | `METHOD` | Schedules the given [action] to run in the next event-loop iteration, after all micro-tasks have completed. |
| `delayed` | `METHOD` | Schedules the given [action] to run after a delay of [millis] milliseconds, ensuring it runs no sooner than the next event-loop iteration, after all micro-tasks have completed. |

## date_extension
| Extension | Type | Description |
|---|---|---|
| `isSameDate` | `METHOD` | Returns true if the date is the same as [other], ignoring the time component. |
| `isToday` | `METHOD` | Returns true if the date is today, ignoring the time component. |
| `isTomorrow` | `METHOD` | Returns true if the date is tomorrow, ignoring the time component. |
| `wasYesterday` | `METHOD` | Returns true if the date was yesterday, ignoring the time component. |
| `addDays` | `METHOD` | Adds the specified number of days to the date. |
| `addMonths` | `METHOD` | Adds the specified number of months to the date. |
| `addYears` | `METHOD` | Adds the specified number of years to the date. |
| `daysInMonth` | `METHOD` | Returns the number of days in the given month and year. |
| `isLeapYear` | `METHOD` | Determines if the given year is a leap year. |
| `subtractDays` | `METHOD` | Subtracts the specified number of days from the date. |
| `subtractMonths` | `METHOD` | Subtracts the specified number of months from the date. |
| `subtractYears` | `METHOD` | Subtracts the specified number of years from the date. |
| `dateOnly` | `METHOD` | Returns an instance of [DateTime] without time related values. |
| `fromNow` | `METHOD` | Returns Duration difference between [this] and current time. |
| `isBeforeDate` | `METHOD` | Returns true if the date of [this] occurs before the date of [other]. |
| `isPast` | `METHOD` | Returns true if [this] occurs in past This doesn't account for time. |
| `isFuture` | `METHOD` | Returns true if [this] occurs in future This doesn't account for time.|
| `isInPreviousMonth` | `METHOD` | Returns true if [this] occurs in previous month |
| `isInPreviousYear` | `METHOD` | Returns true if [this] occurs in previous year |
| `isInNextYear` | `METHOD` | Returns true if [this] occurs in Next year |
| `isAfter` | `METHOD` | This doesn't account for time.|

## file_extension
| Extension | Type | Description |
|---|---|---|
| `copyTo` | `METHOD` | Copies the contents of [this] file to the [other] file. |
| `clear` | `METHOD` | Asynchronously clears all data in [this] file, leaving it empty. |
| `clearSync` | `METHOD` | Synchronously clears all data in [this] file, leaving it empty.. |
| `onModified` | `METHOD` | Invokes [block] each time [this] file is modified.Returns a [StreamSubscription] that can be used to cancel the listener. |
| `onDeleted` | `METHOD` | Invokes [block] when [this] file is deleted.Returns a [StreamSubscription] that can be used to cancel the listener. |
| `appendString` | `METHOD` | Appends the [value] string to the end of the file using the specified [encoding]. |
| `appendStringSync` | `METHOD` | Appends the [value] string to the end of the file with the specified [encoding]. |
| `appendStringLine` | `METHOD` | Appends the [value] string as a new line at the end of the file using the specified [encoding]. |
| `appendBytes` | `METHOD` | Appends the [value] bytes to the end of the file. |
| `appendBytesSync` | `METHOD` | Adds the [value] bytes to the file's end. |
| `appendFrom` | `METHOD` | Appends content of [file] at the end of [this] file. |
| `appendFromSync` | `METHOD` | Appends the contents of the [file] to the end of the current file. |
| `<<` | `METHOD` | Allows appending a [String] value to the current file using the `<<` operator. |
| `+` | `METHOD` | Allows appending the contents of another [file] to the current file using the `+` operator. |
| `isEmpty` | `METHOD` | Returns a [Future] indicating whether the current file is empty. |
| `isEmptySync` | `METHOD` | Returns a [bool] indicating whether the current file is empty synchronously. |

## bool_extension
| Extension | Type | Description |
|---|---|---|
| `toggled` | `METHOD` | Returns the boolean value negated (i.e., true becomes false and false becomes true). |
| `toInt` | `METHOD` | Returns 1 if [this] is true and 0 if otherwise. |
| `randomBool` | `METHOD` | Generates a random boolean value. |

## double_extension
| Extension | Type | Description |
|---|---|---|
| `isWhole` | `METHOD` |Returns to if [this] has .00000 fraction points |
| `roundToPrecision` | `METHOD` | Rounds value [precision] number of fraction points.|
| `isCloseTo` | `METHOD` | Returns true if [this] is close to [other] within [precision] By default, [precision] is set to 1.0e-8 which is 0.00000001 which makes.it suitable for most of the cases. |
| `randomDouble` | `METHOD` | Generates a non-negative random floating point value uniformly distributed in the range from 0.0, inclusive, to 1.0, exclusive. |

## int_extension
| Extension | Type | Description |
|---|---|---|
| `seconds` | `METHOD` | Returns [Duration] equal to [this] no. of seconds |
| `milliseconds` | `METHOD` | Returns [Duration] equal to [this] no. of milliseconds |
| `microseconds` | `METHOD` | Returns [Duration] equal to [this] no. of microseconds |
| `length` | `METHOD` | Returns no. of digits |
| `digits` | `METHOD` |Returns list of digits of [this]|
| `isDivisibleBy` | `METHOD` | Returns true if [this] can be completely divisible by [divider] |
| `isDivisibleByAll` | `METHOD` |  Returns true if [this] can be completely divisible by all of the [dividers]. |
| `repeat` | `METHOD` | This is irrespective of the sign of [this]. the for loop will always run from 1 to absolute value of [this]. Returns [List] of type [T] where T is the return type of [func] |
| `asBool` | `METHOD` | Evaluates the integer as a boolean, returning true for non-zero values (similar to C language behavior). |
| `twoDigits` | `METHOD` |  Returns [int] as string which has a zero appended as prefix if [this] is a single digit value. |
| `rangeTo` | `METHOD` | Generates an [IntRange] starting from this value up to and including [end], with a default step size of 1. |
| `downTo` | `METHOD` | Creates an [IntRange] from this value down to [end], inclusive, with a default step size of 1.|
| `until` | `METHOD` | Generates a range starting from this value up to, but not including, the specified [end] value. |
| `randomInt` | `METHOD` | Produces a non-negative random integer within the range [0, max],where the default value of [max] is 1,000,000. |

## object_extension
| Extension | Type | Description |
|---|---|---|
| `isNull` | `METHOD` | Returns true if the object is null |
| `isNotNull` | `METHOD` | Returns true if the object is not null |


## num_extension
| Extension | Type | Description |
|---|---|---|
| `isBetween` | `METHOD` | Converts positive numbers to their negative counterparts. Boundaries are included if [inclusive] is set to true. |
| `negative` | `METHOD` | Converts positive numbers to their negative counterparts.Use [abs] to convert numbers to their positive equivalents. |
| `roundToDecimals` | `METHOD` | - Rounds the number to the specified number of decimal places. |
| `asRadians` | `METHOD` | Converts the angle from degrees to radians. |
| `asDegrees` | `METHOD` | Converts the angle from radians to degrees. |
| `maxim` | `METHOD` | Returns the value limited to the specified upper bound. |
| `minm` | `METHOD` | Ensures the value is not less than the specified [lowerBound]. |
| `clampAtMin` | `METHOD` |Ensures the value is not below the specified [lowerBound]. |
| `clampAtMax` | `METHOD` | Ensures the value does not exceed the specified [upperBound].|
| `orZero` | `METHOD` | Returns this value if it is not null; otherwise, returns 0.Useful for calculations where a default value is needed. |
| `orOne` | `METHOD` | Returns this value if it is not null; otherwise, returns 1.Useful for calculations where a default non-zero value is needed. |
| `or` | `METHOD` | Returns this value if it is not null; otherwise, returns the specified [value].Useful for providing a default value in calculations. |

## string_extension
| Extension | Type | Description |
|---|---|---|
| `iscapitalize` | `METHOD` | Capitalizes the first letter of the string. |
| `getFirstLetter` | `METHOD` | Returns the first letter of the string.If the string is empty, returns an empty string. |
| `getLastLetter` | `METHOD` | Returns the last letter of the string.If the string is empty, returns an empty string. |
| `copyTo` | `METHOD` | Copies the string to the clipboard.This method is asynchronous and returns a Future. |
| `isValidEmail` | `METHOD` | Returns true if the string is a valid email address. |
| `doesNotContainEmoji` | `METHOD` | Checks if the string does not contain any type of emoji. |
| `containsEmoji` | `METHOD` | Checks if the string contains any type of emoji. |
| `isIndianMobileNumber` | `METHOD` | Checks if the string valid indian mobile number or not. |
| `isValidPinCode` | `METHOD` | Validates if the string is a valid 5-digit PIN code. |
| `isValidUrl` | `METHOD` | Returns true if the string is a valid URL. |
| `isNumeric` | `METHOD` | Returns true if the string is a valid number. |
| `isremoveAllWhitespace` | `METHOD` | Trims the string and removes all whitespace. |
| `isPalindrome` | `METHOD` | Returns true if the string is a palindrome. |
| `toCamelCase` | `METHOD` | Converts the string to camel case. |
| `toSnakeCase` | `METHOD` | Converts the string to snake case. |
| `reverse` | `METHOD` | Reverses the string. |
| `isAlphabetic` | `METHOD` | Checks if the string contains only alphabets. |
| `isAlphanumeric` | `METHOD` | Checks if the string contains only alphanumeric characters. |
| `initials` | `METHOD` | Returns the initials of the string. |
| `isStrongPassword` | `METHOD` | Checks if the string is a strong password. |
| `isUserName` | `METHOD` | Returns `true` if the string is a proper name, otherwise `false`. |
| `toDouble` | `METHOD` | Converts the string to a double. |
| `toInt` | `METHOD` | Converts the string to an int. |
| `wordCount` | `METHOD` | Return the count the number of words |
| `toIntOrNull` | `METHOD` | Returns [this] as [int] or null |
| `wrap` | `METHOD` | Adds the specified [prefix] and [suffix] around the string. |
| `unwrap` | `METHOD` | Removes the specified [prefix] and [suffix] from the string if they exist. |
| `toBoolOrNull` | `METHOD` | Converts the string to a boolean if it represents a true value (case insensitive) or a non-zero integer; otherwise, returns null. |
| `removeIfHasPrefix` | `METHOD` | Removes the specified prefix from the string if it exists. |
| `removeIfHasSuffix` | `METHOD` | Removes the specified suffix from the string if it exists.|
| `isBinary` | `METHOD` |  Checks if the string can be parsed string which only contains 1's and 0's |
| `isHexadecimal` | `METHOD` | Checks if the string can be parsed hex string which only |
| `isOctal` | `METHOD` | Checks if the string can be parsed hex string which only|
| `isDecimal` | `METHOD` | Checks if the string can be parsed into a decimal.|
| `isDouble` | `METHOD` | Checks if the string can be parsed into a double. |
| `toDoubleOrNull` | `METHOD` | Tries to parse the string into a double, returning null if parsing fails. |
| `words` | `METHOD` | This would tokenize [this] into words by breaking it with space. |
| `isBlank` | `METHOD` | Checks if the string is blank (contains only whitespace characters or is empty). |
| `hasContent` | `METHOD` | Checks if the string is not blank (contains non-whitespace characters). |
| `toDateTimeOrNull` | `METHOD` | Tries to parse the string into a DateTime, returning null if parsing fails. |
| `decodeJson` | `METHOD` | Converts a JSON-encoded string into a Map with String keys and dynamic values. |
| `decodeJsonArray` | `METHOD` | Converts a JSON-encoded string into a List of Maps with String keys and dynamic values. |
| `equalsToIgnoreCase` | `METHOD` | Compares two strings for equality, ignoring case differences |
| `countOccurrences` | `METHOD` | Counts the occurrences of a specific character in the given string. |
| `findIndexOf` | `METHOD` |  Finds the first occurrence of the given pattern in the string. |
| `title` | `METHOD` | Capitalizes the first letter of each word in the string. |
| `toggledCase` | `METHOD` | Toggles the case of each character in the string. |
| `splitMapJoinRgex` | `METHOD` | Splits the string based on the provided [regex] and joins the parts back together using the provided [onMatch] and [onNonMatch] functions. |
| `splitMap` | `METHOD` |Splits the string based on the provided [regex] and maps the matches and non-matches to a list of type [R] using the provided [onMatch] and [onNonMatch] functions.|
| `toColor` | `METHOD` | Converts a hex color string to a Color object. |
| `logMsg` | `METHOD` | This is useful for chaining calls or debugging. |
| `darken` | `METHOD` | The amount to darken the color by can be specified as a parameter. |
| `lighten` | `METHOD` | The amount to lighten the color by can be specified as a parameter. |
| `toHex` | `METHOD` | Converts the color to its hexadecimal string representation. |
| `toCurrency` | `METHOD` | The default symbol is '$'. |
| `toDuration` | `METHOD` | Converts the number to a Duration, assuming the number represents seconds. |
| `pluralize` | `METHOD` | Otherwise, returns the plural form or the singular form with 's' appended if no plural form is provided. |
| `validateAllFields` | `METHOD` | It returns `true` if all fields are valid, otherwise `false`. |
| `resetAllFields` | `METHOD` | Resets all the form fields.|
| `isNullOrEmpty` | `METHOD` | Checks if the string is null or empty. might be displayed. |
| `isNotNullOrEmpty` | `METHOD` | Checks if the string is neither null nor empty. |
| `isNullOrBlank` | `METHOD` | vChecks if the string is null or contains only whitespace. |
| `isNotNullOrBlank` | `METHOD` | Checks if the string is neither null nor contains only whitespace. |
| `hasContent` | `METHOD` | Checks if the string has any content (not null and not empty). |
| `orEmpty` | `METHOD` | Returns the string itself if it's not null, otherwise returns an empty string. |

## comparision_extension
| Extension | Type | Description |
|---|---|---|
| `gt` | `METHOD` | Returns true if the value is greater than [other]. |
| `lt` | `METHOD` | Returns true if the value is less than [other]. |
| `eq` | `METHOD` | Returns true if the value is equal to [check]. |
| `lte` | `METHOD` | Returns true if the value is less than or equal to [other]. |
| `gte` | `METHOD` | Returns true if the value is greater than or equal to [other]. |
| `ne` | `METHOD` | Returns true if the value is not equal to [other]. |


## dev_extension_config
| Extension | Type | Description |
|---|---|---|
| `p` | `METHOD` | Adds padding equally on all sides if specified. |
| `pOnly` | `METHOD` | Adds padding based on the specified named parameters. |
| `pS` | `METHOD` | Adds padding based on the Symmetric |
| `m` | `METHOD` |  Adds margin equally on all sides if specified. |
| `mOnly` | `METHOD` | Adds margin based on the specified named parameters. |
| `mS` | `METHOD` | Adds margin symmetrically based on the specified horizontal and vertical values. |
| `centered` | `METHOD` | Centers a widget within its parent.|
| `withBorder` | `METHOD` | Adds a border around a widget with customizable color and width. |
| `withBackgroundColor` | `METHOD` | Sets the background color of a widget. |
| `withCircularBorderRadius` | `METHOD` | Adds a circular border radius to a widget. |
| `withShadow` | `METHOD` | Adds a shadow to a widget with customizable color, blur radius, and offset. |
| `withOpacity` | `METHOD` | Sets the opacity of a widget. |
| `rotated` | `METHOD` | Rotates a widget by a specified angle. |
| `scaled` | `METHOD` | Scales a widget by a specified factor. |
| `translated` | `METHOD` | Translates (moves) a widget by a specified offset. |
| `aligned` | `METHOD` | Aligns a widget within its parent using a specified alignment. |
| `expanded` | `METHOD` | Expands a widget to fill available space within a Flex container. |
| `flexible` | `METHOD` | Makes a widget flexible within a Flex container. |
| `withTooltip` | `METHOD` | Adds a tooltip to a widget that displays on long press. |
| `visibility` | `METHOD` | Toggles the visibility of a widget. |
| `withHero` | `METHOD` | Wraps a widget in a Hero widget for shared element transitions. |
| `fittedBox` | `METHOD` | Fits a widget within its parent using a FittedBox with a specified fit. |
| `withCircularGradient` | `METHOD` | Add a circular gradient background |
| `theme` | `METHOD` | Returns the ThemeData associated with the current context. |
| `texttheme` | `METHOD` | Returns the TextTheme associated with the current context. |
| `colorScheme` | `METHOD` | Returns the ColorScheme associated with the current context. |
| `mediaQuery` | `METHOD` | Returns the MediaQueryData associated with the current context. |
| `screenSize` | `METHOD` | Returns the size of the screen associated with the current context. |
| `screenHeight` | `METHOD` | Returns the width of the screen associated with the current context. |
| `isKeyboardOpen` | `METHOD` | Returns the height of the screen associated with the current context. |
| `of` | `METHOD` | Returns true if the keyboard is currently open, false otherwise. |
| `showSnackBar` | `METHOD` | Shows a Snackbar with the provided message in the current context. |

## duration_extension
| Extension | Type | Description |
|---|---|---|
| `inYears` | `METHOD` | Returns the number of whole years spanned by this Duration.Please note that this does not account for leap year. |
| `isInYears` | `METHOD` | Returns true if [this] duration equals to or more than a year. |
| `isInDays` | `METHOD` | Returns true if [this] duration equals to or more than a day. |
| `isInHours` | `METHOD` | Returns true if [this] duration equals to or more than an hour but is less than a day. |
| `isInMinutes` | `METHOD` | Returns true if [this] duration equals to or more than a minute but is less than an hour.|
| `isInSeconds` | `METHOD` | Returns true if [this] duration equals to or more than a second but is less than a minute.|
| `isInMillis` | `METHOD` |Returns true if [this] duration equals to or more than a millisecond but is less than a second.|
| `absoluteMinutes` | `METHOD` | Returns remaining minutes after deriving hours.|
| `absoluteHours` | `METHOD` | Returns remaining minutes after deriving days.|
| `absoluteSeconds` | `METHOD` | Returns remaining minutes after deriving minutes.|

## navigation_extension
| Extension | Type | Description |
|---|---|---|
| `to` | `METHOD` | Pushes a new route onto the navigator stack. |
| `toNamed` | `METHOD` |  Pushes a named route onto the navigator stack. |
| `back` | `METHOD` |  Pops the current route off the navigator stack. |
| `backUntil` | `METHOD` | Pops the current route off the navigator stack until the predicate returns true. |
| `toWithReplace` | `METHOD` | Pops the current route off the navigator stack until the predicate returns true. |
| `replaceWithNamed` | `METHOD` | Replaces the current route with a named route. |
| `toAndRemoveAll` | `METHOD` | Pushes a new route and removes all the previous routes. |
| `toNamedAndRemoveAll` | `METHOD` | Pushes a named route and removes all the previous routes until the predicate returns true. |

## ontap_extension
| Extension | Type | Description |
|---|---|---|
| `onInkTap` | `METHOD` | Adds an ink splash effect with the onTap gesture. |
| `onTap` | `METHOD` | Adds a basic onTap gesture without any visual feedback. |
| `onDoubleTap` | `METHOD` | Adds a double-tap gesture. |
| `onTapCancel` | `METHOD` | Adds a tap cancel gesture. |
| `onLongPress` | `METHOD` | Adds a long press gesture. |
| `onTapDown` | `METHOD` | Adds a tap down gesture. |
| `onScale` | `METHOD` | Adds a scale gesture. |

## shape_extension
| Extension | Type | Description |
|---|---|---|
| `withCircle` | `METHOD` | Clips the container into a circular shape |
| `withTriangle` | `METHOD` | Clips the container into a triangular shape |
| `withSquare` | `METHOD` | Clips the container into a square shape |
| `withRectangle` | `METHOD` | Returns the container as it is, which is already a rectangle |
| `withPentagon` | `METHOD` | Clips the container into a pentagonal shape |
| `withOctagon` | `METHOD` | Clips the container into an octagonal shape |
| `withRiverFlow` | `METHOD` | Clips the container into a river flow-like shape with curves |
| `withUnderRoundShape` | `METHOD` | Clips the container into an under-round shape with curves |
