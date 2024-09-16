#### String
```dart
"hello world".iscapitalize().logMsg(); // Output: Hello world
"test@example.com".isValidEmail().logMsg(); // Output: true
"https://www.example.com".isValidUrl().logMsg(); // Output: true
'Hello, World!'.logMsg(); // Output: 'Hello, World!'
("😂".doesNotContainEmoji ? "not is emoji 😃" : "its emoji").logMsg(); // Output: its emoji
"Admin@123".isStrongPassword().logMsg(); // Output: true
"8865745411".isIndianMobileNumber.logMsg(); // Output: true
```

#### Comparision
```dart
 num a = 10;
 num b = 20;
 /// Using the comparison extension methods
 a.gt(b).logMsg(); // Output: false
 a.lt(b).logMsg(); // Output: true
 a.eq(10).logMsg(); // Output: true
 a.lte(b).logMsg(); // Output: true
 a.gte(b).logMsg(); // Output: false
 a.ne(b).logMsg(); // Output: true
 b.gte(a).logMsg(); // Output: true
 b.lte(a).logMsg(); // Output: false
```

#### Date Comparision
```dart
// Initializing example and current dates
DateTime selectedDate = DateTime(2024, 7, 15);
DateTime currentDate = DateTime.now();
// Adding days, months, and years to example date
DateTime dateAfter10Days = selectedDate.addDays(10);
DateTime dateAfter2Months = selectedDate.addMonths(2);
DateTime dateAfter1Year = selectedDate.addYears(1);
// Subtracting days, months, and years from current date
DateTime pastMonth = currentDate.subtractMonths(2);
DateTime pastDate = currentDate.subtractDays(10);
DateTime pastYear = currentDate.subtractYears(1);
// Using the date comparison extension methods
bool isToday = selectedDate.isToday(); // False, since exampleDate is not today
bool isTomorrow = selectedDate.isTomorrow(); // False, since exampleDate is not tomorrow
bool wasYesterday = selectedDate.wasYesterday(); // False, since exampleDate was not yesterday
bool isCurrentToday = currentDate.isToday(); // True, since currentDate is today
// Initializing now and future/past dates relative to now
DateTime now = DateTime.now();
DateTime yesterday = now.subtractDays(1);
DateTime tomorrow = now.addDays(1);
DateTime futureDate = now.addMonths(3);
// Printing the results with comments
'Example Date: ${selectedDate.toLocal()}'.logMsg(); // Example Date: 2023-07-01
'Current Date: ${currentDate.toLocal()}'.logMsg(); // Current Date: 2024-07-15
'Date After 10 Days: ${dateAfter10Days.toLocal()}'.logMsg(); // Date After 10 Days:2024-07-25
'Date After 2 Months: ${dateAfter2Months.toLocal()}'.logMsg(); // Date After 2 Months: 2024-09-15
'Date After 1 Year: ${dateAfter1Year.toLocal()}'.logMsg(); // Date After 1 Year: 2025-07-15
'Date 2 Months Ago: ${pastMonth.toLocal()}'.logMsg(); // Date 2 Months Ago: 2024-05-15
'Date 10 Days Ago: ${pastDate.toLocal()}'.logMsg(); // Date 10 Days Ago: 2024-07-05
'Date 1 Year Ago: ${pastYear.toLocal()}'.logMsg(); // Date 1 Year Ago:  2023-07-15
'Is Example Date Today? $isToday'.logMsg(); // Is Example Date Today? true
'Was Example Date Yesterday? $wasYesterday'.logMsg(); // Was Example Date Yesterday? false
'Current Date: ${now.toLocal()}'.logMsg(); // Current Date: 2024-07-15
'Yesterday: ${yesterday.toLocal()}'.logMsg(); // Yesterday: 2024-07-14
'Tomorrow: ${tomorrow.toLocal()}'.logMsg(); // Tomorrow: 2024-07-16
'Date 3 Months Later: ${futureDate.toLocal()}'.logMsg(); // Date 3 Months Later: 2024-10-15
```

#### Map
```dart
final Map<String, dynamic> map = {
  'name': 'John',
  'age': 24,
};
for(final (key, value) in map.documents) {
  '$key: $value'.logMsg();
}
```

#### Color Conversion:
```dart  
'You have 1 ${1.pluralize('item')}'.logMsg(); // Output: You have 1 item
'You have 3 ${3.pluralize('item')}'.logMsg(); // Output: You have 3 items
'1 ${1.pluralize('person', 'people')}'.logMsg(); // Output: 1 person
'2 ${2.pluralize('person', 'people')}'.logMsg(); // Output: 2 people
```
#### Pluralize:
```dart
// Using the extension to pluralize words
'You have 1 ${1.pluralize('item')}'.logMsg(); // Output: You have 1 item
'You have 3 ${3.pluralize('item')}'.logMsg(); // Output: You have 3 items
'1 ${1.pluralize('person', 'people')}'.logMsg(); // Output: 1 person
'2 ${2.pluralize('person', 'people')}'.logMsg(); // Output: 2 people
``` 

#### Future
```dart
postDelayed(2000,(){
  'after 2 seconds'.logMsg();
});
```
#### File io
```dart
final file = File('example.txt'); // Create a File object representing the file 'example.txt'
file.onModified(() => 'file modified'.logMsg()); // Sets up a listener that prints a message whenever the file is modified.
file.clear(); // Clears the contents of the file, making it empty.
file.isEmpty; // Checks if the file is empty and returns a boolean value.
file.appendString('hello'); // Appends the string 'hello' to the end of the file.
file <<'some text'; // Uses the custom `<<` operator to append the string 'some text' to the end of the file.
final file2 = File('example2.txt'); // Create another File object representing another file 'example2.txt'
file + file2; // Uses the custom `+` operator to append the contents of file2 to file1.
```
### Int
```dart
30.isDivisibleBy(5); // true
0.asBool; // false
7.twoDigits; // '07'
10.repeat((count) => count.logMsg());
```

## Navigations
```dart
ElevatedButton(
  onPressed: () {
    context.to(const SecondPage()); // Using the to extension method to push a new route
  },
  child: const Text('Navigate to Second Page'),
),
ElevatedButton(
  onPressed: () {
    context.toNamed('/second'); // Using the toNamed extension method to push a named route
  },
  child: const Text('Navigate to Named Route'),
),
ElevatedButton(
  onPressed: () {
    context.toWithReplace(const SecondPage()); // Using the toWithReplace extension method to replace the current route
  },
  child: const Text('Replace with Second Page'),
),
ElevatedButton(
  onPressed: () {
    context.replaceWithNamed('/second'); // Using the replaceWithNamed extension method to replace the current route with a named route
  },
  child: const Text('Replace with Named Route'),
),
ElevatedButton(
  onPressed: () {
    // Using the toAndRemoveAll extension method to navigate and remove all previous routes
    context.toAndRemoveAll(const SecondPage(),(Route<dynamic> route) => false,); 
  },
  child: const Text('Navigate and Remove All'),
),
ElevatedButton(
  onPressed: () {
    // Using the toNamedAndRemoveAll extension method to navigate to a named route and remove all previous routes
    context.toNamedAndRemoveAll('/second',(Route<dynamic> route) => false,); /
  },
  child: const Text('Named Route and Remove All'),
),
ElevatedButton(
  onPressed: () {
    context.back(); // Using the back extension method to pop the current route
  },
  child: const Text('Back'),
),
ElevatedButton(
  onPressed: () {
    context.backUntil((Route<dynamic> route) => route.isFirst); // Using the backUntil extension method to pop routes until the HomePage is found
  },
  child: const Text('Back Until Home'),
),

```