import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Provides extensions for [File] operations.
extension FileExtension on File {
  /// Copies the content of the current file to another specified file.
  Future<void> copyTo(File other) async {
    final sink = other.openWrite();
    await sink.addStream(openRead());
    await sink.close();
  }

  /// Clears all content from the file asynchronously, resulting in an empty file.
  Future<void> clear() => writeAsString('');

  /// Clears all content from the file synchronously, leaving it empty.
  void clearSync() => writeAsStringSync('');

  /// Sets up a listener that triggers [block] whenever the file is modified.
  /// Returns a [StreamSubscription] to manage the listener's lifecycle.
  StreamSubscription<FileSystemEvent> onModified(void Function() block) {
    return watch(events: FileSystemEvent.modify).listen((event) => block());
  }

  /// Sets up a listener that triggers [block] when the file is deleted.
  /// Returns a [StreamSubscription] to manage the listener's lifecycle.
  StreamSubscription<FileSystemEvent> onDeleted(void Function() block) {
    return watch(events: FileSystemEvent.delete).listen((event) => block());
  }

  /// Appends the [value] string to the end of the file using the specified [encoding].
  Future<void> appendString(String value, {Encoding encoding = utf8}) async {
    final fileAccess = await open(mode: FileMode.writeOnlyAppend);
    await fileAccess.writeString(value, encoding: encoding);
    await fileAccess.close();
  }

  /// Appends the [value] string to the end of the file with the specified [encoding] synchronously.
  void appendStringSync(String value, {Encoding encoding = utf8}) {
    final fileAccess = openSync(mode: FileMode.writeOnlyAppend);
    fileAccess.writeStringSync(value, encoding: encoding);
    fileAccess.closeSync();
  }

  /// Appends the [value] string as a new line at the end of the file using the specified [encoding].
  Future<void> appendStringLine(String value,
      {Encoding encoding = utf8}) async {
    final sink = openWrite(mode: FileMode.writeOnlyAppend, encoding: encoding);
    sink.writeln(value);
    await sink.close();
  }

  /// Appends the [value] bytes to the end of the file.
  Future<void> appendBytes(List<int> value) async {
    final fileAccess = await open(mode: FileMode.writeOnlyAppend);
    await fileAccess.writeFrom(value);
    await fileAccess.close();
  }

  /// Appends the [value] bytes to the file synchronously.
  void appendBytesSync(List<int> value) {
    final fileAccess = openSync(mode: FileMode.writeOnlyAppend);
    fileAccess.writeFromSync(value);
    fileAccess.closeSync();
  }

  /// Appends the content of another file to the end of the current file.
  Future<void> appendFrom(File file) async {
    final sink = openWrite(mode: FileMode.writeOnlyAppend);
    await sink.addStream(file.openRead());
    await sink.close();
  }

  /// Appends the content of another file to the end of the current file synchronously.
  void appendFromSync(File file) {
    final fileAccess = openSync(mode: FileMode.writeOnlyAppend);
    fileAccess.writeFromSync(file.readAsBytesSync().toList());
    fileAccess.closeSync();
  }

  /// Allows appending a [String] to the current file using the `<<` operator.
  void operator <<(String value) => appendStringSync(value);

  /// Allows appending the contents of another [File] to the current file using the `+` operator.
  void operator +(File file) => appendFromSync(file);

  /// Checks asynchronously if the file is empty.
  Future<bool> get isEmpty async => await length() == 0;

  /// Checks synchronously if the file is empty.
  bool get isEmptySync => lengthSync() == 0;
}
