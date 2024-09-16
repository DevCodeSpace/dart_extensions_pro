// ignore_for_file: avoid_print
import 'package:dart_extensions_pro/dart_extensions_pro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyWidget(),
      routes: {
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
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

    // Initializing example and current dates
    DateTime selectedDate = DateTime(2024, 7, 15);
    DateTime currentDate = DateTime.now();

    // Adding days, months, and years to date
    DateTime dateAfter10Days = selectedDate.addDays(10);
    DateTime dateAfter2Months = selectedDate.addMonths(2);
    DateTime dateAfter1Year = selectedDate.addYears(1);

    // Subtracting days, months, and years from current date
    DateTime pastMonth = currentDate.subtractMonths(2);
    DateTime pastDate = currentDate.subtractDays(10);
    DateTime pastYear = currentDate.subtractYears(1);

    // Using the date comparison extension methods
    bool isToday =
        selectedDate.isToday(); // False, since exampleDate is not today
    bool isTomorrow =
        selectedDate.isTomorrow(); // False, since exampleDate is not tomorrow
    bool wasYesterday = selectedDate
        .wasYesterday(); // False, since exampleDate was not yesterday
    bool isCurrentToday =
        currentDate.isToday(); // True, since currentDate is today

    // Initializing now and future/past dates relative to now
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtractDays(1);
    DateTime tomorrow = now.addDays(1);
    DateTime futureDate = now.addMonths(3);

    // Printing the results with comments
    'Example Date: ${selectedDate.toLocal()}'
        .logMsg(); // Example Date: 2023-07-01
    'Current Date: ${currentDate.toLocal()}'
        .logMsg(); // Current Date: 2024-07-15
    'Date After 10 Days: ${dateAfter10Days.toLocal()}'
        .logMsg(); // Date After 10 Days:2024-07-25
    'Date After 2 Months: ${dateAfter2Months.toLocal()}'
        .logMsg(); // Date After 2 Months: 2024-09-15
    'Date After 1 Year: ${dateAfter1Year.toLocal()}'
        .logMsg(); // Date After 1 Year: 2025-07-15
    'Date 2 Months Ago: ${pastMonth.toLocal()}'
        .logMsg(); // Date 2 Months Ago: 2024-05-15
    'Date 10 Days Ago: ${pastDate.toLocal()}'
        .logMsg(); // Date 10 Days Ago: 2024-07-05
    'Date 1 Year Ago: ${pastYear.toLocal()}'
        .logMsg(); // Date 1 Year Ago:  2023-07-15

    'Is Example Date Today? $isToday'.logMsg(); // Is Example Date Today? true
    'Is Example Date Tomorrow? $isTomorrow'
        .logMsg(); // Is Example Date Tomorrow? false
    'Was Example Date Yesterday? $wasYesterday'
        .logMsg(); // Was Example Date Yesterday? false

    'Is Current Date Today? $isCurrentToday'
        .logMsg(); // Is Current Date Today? true

    'Current Date: ${now.toLocal()}'.logMsg(); // Current Date: 2024-07-15
    'Yesterday: ${yesterday.toLocal()}'.logMsg(); // Yesterday: 2024-07-14
    'Tomorrow: ${tomorrow.toLocal()}'.logMsg(); // Tomorrow: 2024-07-16
    'Date 3 Months Later: ${futureDate.toLocal()}'
        .logMsg(); // Date 3 Months Later: 2024-10-15

    String? example = "hello world";
    String email = "test@example.com";
    String url = "https://www.example.com";
    String number = "12345";
    String whitespace = " A string with whitespace ";
    String palindrome = "A man a plan a canal Panama";
    String mixedCase = "helloWorld";
    String alphabetic = "hello";
    String alphanumeric = "hello123";

    example.iscapitalize().logMsg(); // Output: Hello world
    email.isValidEmail().logMsg(); // Output: true
    url.isValidUrl().logMsg(); // Output: true
    number.isNumeric().logMsg(); // Output: true
    whitespace
        .isremoveAllWhitespace()
        .logMsg(); // Output: Astringwithwhitespace
    palindrome.isPalindrome().logMsg(); // Output: true
    example.toCamelCase().logMsg(); // Output: HelloWorld
    mixedCase.toSnakeCase().logMsg(); // Output: hello_world
    example.reverse().logMsg(); // Output: dlrow olleh
    alphabetic.isAlphabetic().logMsg(); // Output: true
    alphanumeric.isAlphanumeric().logMsg(); // Output: true
    example.initials().logMsg(); // Output: HW

    'Hello, World!'.logMsg(); // Prints 'Hello, World!'
    ("😂".doesNotContainEmoji ? "not is emoji 😃" : "its emoji")
        .logMsg(); // Output: its emoji
    "Admin@123".isStrongPassword().logMsg();
    "8865745411".isIndianMobileNumber.logMsg();
    "Admin Ad".isUserName().logMsg();
    123.logMsg(); // Prints '123'
    [1, 2, 3].logMsg(); // Prints '[1, 2, 3]'

    String? nullableString2 = '';
    String? nullableString3 = 'Hello, World!';

    // Using the extension methods
    nullableString2.isNullOrEmpty.logMsg(); // true
    nullableString3.isNullOrEmpty.logMsg(); // false

    123.toCurrency().logMsg();
    Future.delayed(15.toDuration(), () {
      "after 15 sec".logMsg();
    });

    'You have 1 ${1.pluralize('item')}'.logMsg(); // Output: You have 1 item
    'You have 3 ${3.pluralize('item')}'.logMsg(); // Output: You have 3 items
    '1 ${1.pluralize('person', 'people')}'.logMsg(); // Output: 1 person
    '2 ${2.pluralize('person', 'people')}'.logMsg(); // Output: 2 people

    delayed(2000, () {
      'after 2 seconds'.logMsg();
    });

    // final file = File(
    //     'example.txt'); // Create a File object representing the file 'example.txt'
    // file.onModified(() =>
    //     'file modified')); // Sets up a listener that prints a message whenever the file is modified.
    // file.clear(); // Clears the contents of the file, making it empty.
    // file.isEmpty; // Checks if the file is empty and returns a boolean value.
    // file.appendString(
    //     'hello'); // Appends the string 'hello' to the end of the file.
    // file <<
    //     'some text'; // Uses the custom `<<` operator to append the string 'some text' to the end of the file.
    // final file2 = File(
    //     'example2.txt'); // Create another File object representing another file 'example2.txt'
    // file +
    //     file2; // Uses the custom `+` operator to append the contents of file2 to file1.

    30.isDivisibleBy(5); // true
    0.asBool; // false
    7.twoDigits; // '07'
    10.repeat((count) => count.logMsg());

    return Scaffold(
      appBar: AppBar(
        title: const Text("dev extention example"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //add padding on all sides
              Container().p(10),
              //add padding only from left
              Container().pOnly(l: 10),

              /// Padding
              // Container(
              //   height: 150,
              //   color: Colors.amberAccent,
              //   child: const Text('Hello, world!')
              //       .p(10), // Adds 10 pixels of padding on all sides
              // ), // Adds 10 pixels of margin on  bottom

              // Container(
              //   height: 150,
              //   color: Colors.blueAccent,
              //   child: const Text('Hello, world!')
              //       .pOnly(l: 10), // Adds 10 pixels of padding on the left side
              // ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: 150,
              //       color: Colors.greenAccent,
              //       child: const Text('Hello, world!').pS(
              //           h: 10,
              //           v: 5), // Adds symmetric padding (10 horizontal, 5 vertical)
              //     ),
              //     Container(
              //       height: 150,
              //       color: Colors.greenAccent,
              //       child: const Text('Hello, world!').pS(
              //           h: 10,
              //           v: 5), // Adds symmetric padding (10 horizontal, 5 vertical)
              //     ),
              //   ],
              // ),

              /// Margin
              // Container(
              //   height: 150,
              //   color: Colors.amberAccent,
              //   child: const Text('Hello, world!')
              //       .m(10), // Adds 10 pixels of margin on all sides
              // ),

              /// Example of adding margin only to specific sides
              // Container(
              //   height: 150,
              //   color: Colors.blueAccent,
              //   child: const Text('Hello, world!').mOnly(
              //       l: 10,
              //       t: 20,
              //       r: 10,
              //       b: 5), // Adds 10 pixels of margin on left and right, 20 pixels on top, and 5 pixels on bottom
              // ),

              /// Example of adding symmetric margin
              // Container(
              //   height: 150,
              //   color: Colors.greenAccent,
              //   child: const Text('Hello, world!').mS(
              //       h: 10,
              //       v: 5), // Adds symmetric margin (10 horizontal, 5 vertical)
              // ),

              /// Using the onInkTap extension
              // Container(
              //   padding: const EdgeInsets.all(16.0),
              //   decoration: BoxDecoration(
              //     color: Colors.blue,
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              //   child: const Text(
              //     'Ink Tap Me',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ).onInkTap(() {
              //   'ink tapped!'.logMsg();
              // }),
              // // Using the onTap extension
              // Container(
              //   padding: const EdgeInsets.all(16.0),
              //   decoration: BoxDecoration(
              //     color: Colors.green,
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              //   child: const Text(
              //     'Tap Me',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ).onTap(
              //   () {
              //     'tapped!'.logMsg();
              //   },
              // ),
              /// Using the onDoubleTap extension
              // Container(
              //   padding: const EdgeInsets.all(16.0),
              //   decoration: BoxDecoration(
              //     color: Colors.red,
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              //   child: const Text(
              //     'Double Tap Me',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ).onDoubleTap(
              //   () {
              //     'double-tapped!'.logMsg();
              //   },
              // ),

              // // Using the onTapCancel extension
              // Container(
              //   padding: const EdgeInsets.all(16.0),
              //   decoration: BoxDecoration(
              //     color: Colors.yellow,
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              //   child: const Text(
              //     'Tap Cancel Me',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ).onTapCancel(
              //   () {
              //     'tap canceled!'.logMsg();
              //   },
              // ),

              // // Using the  onLongPress Extension
              // Container(
              //   padding: const EdgeInsets.all(20),
              //   color: Colors.purple,
              //   child: const Text('LongPress Gesture').onLongPress(() {
              //     'LongPress Gesture Detected'.logMsg();
              //   }),
              // ),
              // const SizedBox(height: 20),

              // // Using the  onTapDown Extension
              // Container(
              //   padding: const EdgeInsets.all(20),
              //   color: Colors.teal,
              //   child: const Text('TapDown Gesture').onTapDown((details) {
              //     'TapDown Gesture Detected'.logMsg();
              //   }),
              // ),
              // const SizedBox(height: 20),

              // // Using the onScale Extension
              // Container(
              //   padding: const EdgeInsets.all(20),
              //   color: Colors.brown,
              //   child: const Text('Scale Gesture').onScale(
              //     onScaleStart: (details) {
              //       'Scale Start Gesture Detected'.logMsg();
              //     },
              //     onScaleUpdate: (details) {
              //       'Scale Update Gesture Detected'.logMsg();
              //     },
              //     onScaleEnd: (details) {
              //       'Scale End Gesture Detected'.logMsg();
              //     },
              //   ),
              // ),
              // const SizedBox(height: 20),

              // / Using Navigation Extension
              // Example of pushPage
              // ElevatedButton(
              //   onPressed: () {
              //     Get.to(const SecondPage());
              //   },
              //   child: const Text('Push Page'),
              // ),
              // const SizedBox(height: 20),

              // ElevatedButton(
              //   onPressed: () {
              // // Using the to extension method to push a new route
              //     context.to(const SecondPage());
              //   },
              //   child: const Text('Navigate to Second Page'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Using the toNamed extension method to push a named route
              //     context.toNamed('/second');
              //   },
              //   child: const Text('Navigate to Named Route'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Using the toWithReplace extension method to replace the current route
              //     context.toWithReplace(const SecondPage());
              //   },
              //   child: const Text('Replace with Second Page'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Using the replaceWithNamed extension method to replace the current route with a named route
              //     context.replaceWithNamed('/second');
              //   },
              //   child: const Text('Replace with Named Route'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Using the toAndRemoveAll extension method to navigate and remove all previous routes
              //     context.toAndRemoveAll(
              //       const SecondPage(),
              //       (Route<dynamic> route) => false,
              //     );
              //   },
              //   child: const Text('Navigate and Remove All'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Using the toNamedAndRemoveAll extension method to navigate to a named route and remove all previous routes
              //     context.toNamedAndRemoveAll(
              //       '/second',
              //       (Route<dynamic> route) => false,
              //     );
              //   },
              //   child: const Text('Named Route and Remove All'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Using the back extension method to pop the current route
              //     context.back();
              //   },
              //   child: const Text('Back'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Using the backUntil extension method to pop routes until the HomePage is found
              //     context.backUntil((Route<dynamic> route) => route.isFirst);
              //   },
              //   child: const Text('Back Until Home'),
              // ),

              // // Centers the text within its parent widget
              // const Text('Centered Text').centered(),

              // // Adds a blue border with a width of 2 around the text
              // const Text('Text with Border')
              //     .withBorder(color: Colors.blue, width: 2),

              // // Sets a yellow background color to the text widget
              // const Text('Background Color').withBackgroundColor(Colors.yellow),

              // // Adds a circular border radius of 12 to the image
              // Image.network(
              //         'https://images.pexels.com/photos/301599/pexels-photo-301599.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
              //     .withCircularBorderRadius(12)
              //     .p(8),

              // // Adds a shadow with a blur radius of 5 and an offset to the text
              // const Text('Shadow')
              //     .withShadow(blurRadius: 5, offset: const Offset(2, 2)),

              // // Sets the opacity of the text to 0.5 (50% opacity)
              // const Text('Opacity').withOpacity(0.5),

              // // Rotates the text widget by an angle of 0.5 radians
              // const Text('Rotated Text').rotated(0.5),

              // // Scales the text widget by a factor of 1.5
              // const Text('Scaled Text').scaled(1.5),

              // // Translates (moves) the text widget by an offset of (10, 10)
              // const Text('Translated Text').translated(const Offset(10, 10)),

              // // Aligns the text widget to the top-left within its parent
              // const Text('Aligned Text').aligned(Alignment.topLeft),

              // // Expands the text widget to fill the available space within a Flex container
              // const Text('Expanded Text').expanded(),

              // // Makes the text widget flexible within a Flex container with a flex factor of 2
              // const Text('Flexible Text').flexible(flex: 2),

              // // Adds a tooltip with the message 'This is a tooltip' to the text widget
              // const Text('Tooltip Text').withTooltip('This is a tooltip'),

              // // Toggles the visibility of the text widget (visible when true)
              // const Text('Visibility Text').visibility(true),

              // // Wraps the image in a Hero widget for shared element transitions with the tag 'heroTag'
              // Image.network(
              //   'https://images.pexels.com/photos/301599/pexels-photo-301599.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              //   height: 100,
              // ).withHero('heroTag').p(10),

              // // Fits the text widget within its parent using a FittedBox
              // Container(
              //     color: Colors.amber,
              //     child: const Text('FittedBox Text').fittedBox()),

              // Container(
              //   width: 100,
              //   height: 100,
              //   color: Colors.blue,
              // ).withCircle(),
              // Container(
              //   width: 100,
              //   height: 100,
              //   color: Colors.green,
              // ).withTriangle(),
              // Container(
              //   width: 100,
              //   height: 100,
              //   color: Colors.red,
              // ).withSquare(),
              // Container(
              //   width: 150,
              //   height: 100,
              //   color: Colors.orange,
              // ).withRectangle(),
              // Container(
              //   width: 100,
              //   height: 100,
              //   color: Colors.purple,
              // ).withPentagon(),
              // Container(
              //   width: 100,
              //   height: 100,
              //   color: Colors.teal,
              // ).withOctagon(),
              // Container(
              //   // width: 200,
              //   height: 100,
              //   color: Colors.blueAccent,
              // ).withRiverFlow(),

              Text(
                'Screen Width: ${context.screenWidth}',
                style: context.texttheme.bodyLarge,
              ),
              Text(
                'Screen Height: ${context.screenHeight}',
                style: context.texttheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (context.isKeyboardOpen) {
                    context.showSnackBar('Keyboard is open');
                  } else {
                    context.showSnackBar('Keyboard is closed');
                  }
                },
                child: const Text('Check Keyboard Status'),
              ),

              const Text(
                'Original Color',
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                'Darkened Color',
                style: TextStyle(color: Colors.blue.darken(0.2)),
              ),
              Text(
                'Lightened Color',
                style: TextStyle(color: Colors.blue.lighten(0.2)),
              ),
              Text(
                'Hex Value: ${Colors.blue.toHex()}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: const Center(
        child: Text('This is the second page'),
      ),
    );
  }
}
