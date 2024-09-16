<img src="https://raw.githubusercontent.com/DevCodeSpace/dart_extensions_pro/main/assets/banner1.png"/>

## dart_extensions_pro

A Dart package that provides handy extensions and helper functions, designed to simplify and speed up development, making coding more efficient and streamlined.

## Types of Extensions

📊 Comparison <br>
📅 Date Handling <br>
✍️ String Utilities <br>
📋 List Enhancements <br>
🧭 Navigation <br>
👆 Tap Gestures <br>
🔁 Iterable Enhancements <br>
🎨 Color Conversion <br>
🔢 Number Utilities <br>
🛠️ Utility Functions

## Analytics
Visit [EXTENSIONS.md](https://github.com/DevCodeSpace/dart_extensions_pro/blob/main/DOC_EXTENSION.md) for a complete list of all the available extensions.

```yaml  
Extensions:                    271
Helper Classes:                7
Helper Functions & Getters:    21
Typedefs:                      7
Mixins:                        2
```

## Getting started

Add dependency to your `pubspec.yaml` file & run Pub get

```yaml
dependencies:
  dart_extensions_pro: ^0.0.1
```
And import package into your class file

```dart
import 'package:dart_extensions_pro/dart_extensions_pro.dart';
```

## Here’s a quick preview of dart_extensions_pro
### String extension:

```dart
'hello'.iscapitalize(); // Capitalizes first letter // Hello
'Copy this text'.copyTo(); // Copies string to clipboard
'test@example.com'.isValidEmail(); // Checks if valid email // true
'flutter'.reverse(); // Reverses string // rettulf
'madam'.isPalindrome(); // Checks for palindrome // true
'flutter example'.toCamelCase(); // Converts to camel case // FlutterExample
'{"name": "Flutter"}'.decodeJson(); // Parses JSON string to map // {name: Flutter}
```

### Comparison extension:

```dart
5.gt(3);  // true, checks if 5 is greater than 3
3.lt(5);  // true, checks if 3 is less than 5
5.eq(5);  // true, checks if 5 is equal to 5
3.lte(3); // true, checks if 3 is less than or equal to 3
5.gte(3); // true, checks if 5 is greater than or equal to 3
5.ne(3);  // true, checks if 5 is not equal to 3
```

### Date extension

```dart
DateTime.now().isSameDate(DateTime(2023, 9, 14));  // true, checks if today matches the provided date
DateTime.now().isToday();  // true, checks if today is today
DateTime.now().isTomorrow();  // true, checks if today is tomorrow (unlikely)
DateTime.now().wasYesterday();  // true, checks if today is yesterday (false)
DateTime.now().addDays(5);  // adds 5 days to the current date
DateTime.now().addMonths(3);  // adds 3 months to the current date
DateTime.now().addYears(2);  // adds 2 years to the current date
DateTime.now().subtractDays(7);  // subtracts 7 days from the current date
DateTime.now().subtractMonths(1);  // subtracts 1 month from the current date
DateTime.now().subtractYears(1);  // subtracts 1 year from the current date
```

### List extension

```dart  
final list = [1, 2, 3] << 4;  // [1, 2, 3, 4], appends 4 to the list using the `<<` operator
list.replaceFirstWhere(10, (item) => item == 2);  // true, replaces the first occurrence of 2 with 10
list.replaceLastWhere(20, (item) => item > 1);  // true, replaces the last item greater than 1 with 20
```

### Navigation extension

```dart
context.to(MyPage());  // Navigates to `MyPage` using `to()`
context.toNamed('/home');  // Navigates to the named route '/home' using `toNamed()`
context.back();  // Pops the current route using `back()`
context.backUntil((route) => route.isFirst);  // Pops routes until the first one using `backUntil()`
context.toWithReplace(AnotherPage());  // Replaces current route with `AnotherPage` using `toWithReplace()`
context.replaceWithNamed('/dashboard');  // Replaces the current route with named route '/dashboard' using `replaceWithNamed()`
context.toAndRemoveAll(HomePage(), (route) => false);  // Navigates to `HomePage` and removes all previous routes using `toAndRemoveAll()`
context.toNamedAndRemoveAll('/login', (route) => false);  // Navigates to named route '/login' and removes all previous routes using `toNamedAndRemoveAll()`
``` 

### Gesture extension

```dart
widget.onInkTap(() => 'Tapped!'.logMsg());  // Adds an ink splash effect with `onInkTap()`
widget.onTap(() => 'Tapped!'.logMsg());  // Adds a basic tap gesture with `onTap()`
widget.onDoubleTap(() => 'Double Tapped!'.logMsg());  // Adds a double-tap gesture with `onDoubleTap()`
widget.onTapCancel(() => 'Tap Cancelled!'.logMsg());  // Adds a tap cancel gesture with `onTapCancel()`
widget.onLongPress(() => 'Long Pressed!'.logMsg());  // Adds a long press gesture with `onLongPress()`
widget.onTapDown((details) => 'Tap Down!'.logMsg());  // Adds a tap down gesture with `onTapDown()`
widget.onScale(
  onScaleStart: (details) => 'Scale Started!'.logMsg(),
  onScaleUpdate: (details) => 'Scaling!'.logMsg(),
  onScaleEnd: (details) => 'Scale Ended!'.logMsg(),
);  // Adds a scale gesture with `onScale()`
``` 

### Iterable extension

```dart
iterable.lastElementIndex;  // Returns the index of the last element or -1 if empty.
iterable.hasSingleElement;  // Checks if the iterable has exactly one element.
iterable.addAllMatchingTo(targetList, (e) => e.isEven);  // Adds elements matching the predicate to the target list.
iterable.whereFilter((e) => e.isEven);  // Filters elements matching the predicate.
iterable.whereFilterIndexed((index, e) => index % 2 == 0);  // Filters elements with their index.
iterable.mapTransform((e) => e.toString());  // Transforms each element and maps to a new iterable.
iterable.skipElements(2);  // Skips the first 2 elements.
iterable.takeLastElements(2);  // Takes the last 2 elements.
iterable.skipWhileElements((e) => e < 5);  // Skips elements while the predicate is true.
iterable.skipLastElements(2);  // Skips the last 2 elements.
``` 

### Color conversion

```dart
String.toColor();  // Converts a hex color string to a Color object, assuming full opacity.
HexColor.getColorFromHex(hexColor);  // Converts a hex color string to an integer color value, adding alpha if missing.
HexColor(hexColor);  // Creates a HexColor instance from a hex color string.
``` 

### Number conversion

```dart
num.negative;  // Converts positive numbers to their negative counterparts.
num.isBetween(value1, value2, {inclusive = false});  // Checks if [this] is between [value1] and [value2], inclusive if [inclusive] is true.
num.roundToDecimals(decimalPlaces);  // Rounds the number to [decimalPlaces] decimal places.
double.asRadians;  // Converts degrees to radians.
double.asDegrees;  // Converts radians to degrees.
T.maxim(upperBound, {exclusive = false});  // Limits the value to [upperBound], exclusive if [exclusive] is true.
T.minm(lowerBound, {exclusive = false});  // Ensures the value is not less than [lowerBound], exclusive if [exclusive] is true.
T.clampAtMin(lowerBound);  // Ensures the value is not below [lowerBound].
T.clampAtMax(upperBound);  // Ensures the value does not exceed [upperBound].
num.orZero;  // Returns this value or 0 if null.
num.orOne;  // Returns this value or 1 if null.
num.or(value);  // Returns this value or [value] if null.
```

### Utility conversion

```dart
double.isWhole;  // Checks if the value is a whole number.
double.roundToPrecision(nthPosition);  // Rounds the value to [precision] decimal places.
bool.isCloseTo(other, {precision = 1.0e-8});  // Checks if the value is close to [other] within [precision].
double.randomDouble({max});  // Generates a random double between 0.0 (inclusive) and 1.0 (exclusive).
int Duration.inYears;  // Returns the number of whole years spanned by this [Duration].
bool Duration.isInYears;  // Returns `true` if the [Duration] is equal to or longer than one year.
int Duration.absoluteSeconds;  // Returns the number of seconds remaining after accounting for whole minutes.
void Map<K, V>.operator <<(MapEntry<K, V> entry);  // Inserts a [MapEntry] into the map using the `<<` operator.
String Map<K, V>.toJson();  // Converts the map into a JSON string.
```

## Code Contributors

[![](https://raw.githubusercontent.com/DevCodeSpace/dart_extensions_pro/main/assets/contributors.png)](https://github.com/DevCodeSpace/dart_extensions_pro/graphs/contributors)