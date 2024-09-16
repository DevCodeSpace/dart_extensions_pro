import '../typedefs.dart';

/// A mixin that provides serialization capabilities for a class.
mixin SerializableMixin {
  /// Converts the object into a JSON-compatible map.
  JsonMap toJson();
}
