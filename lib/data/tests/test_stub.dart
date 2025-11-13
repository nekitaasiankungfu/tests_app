/// Base class for all test stubs.
///
/// Each test has a Dart stub file containing metadata and a corresponding
/// JSON file with questions and interpretations.
///
/// This hybrid approach provides:
/// - Type safety and autocomplete for metadata
/// - Compact JSON storage for large test content
/// - Easy addition of new tests
abstract class TestStub {
  /// Unique test identifier
  String get id;

  /// Test category (can belong to multiple categories via tags)
  String get category;

  /// Display name in different languages
  Map<String, String> get name;

  /// Short description for test list
  Map<String, String> get description;

  /// Number of questions in the test
  int get questionCount;

  /// Estimated time to complete (minutes)
  int get estimatedMinutes;

  /// Test type (simple or multi-factor)
  String get type;

  /// Tags for categorization and search
  /// Example: ['personality', 'big5', 'professional']
  List<String> get tags;

  /// Path to JSON file with test content
  String get assetPath;

  /// Additional metadata (optional)
  Map<String, dynamic> get metadata => {};
}
