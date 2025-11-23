import 'tests/test_stub.dart';
import 'tests/stress_test.dart';
import 'tests/self_esteem_test.dart';
import 'tests/ipip_big_five_test.dart';
import 'tests/fisher_temperament_test.dart';
import 'tests/love_profile_test.dart';
import 'tests/sixteen_types_test.dart';
import 'tests/temperament_profile_test.dart';
import 'tests/digital_detox_test.dart';
import 'tests/burnout_diagnostic_test.dart';
import 'tests/social_battery_test.dart';
import 'tests/disc_personality_test.dart';
import 'tests/holland_code_test.dart';
import 'tests/love_languages_test.dart';
import 'tests/color_psychology_test.dart';

/// Central registry for all psychological tests.
///
/// This class provides access to test metadata (stubs) and serves as
/// the single source of truth for available tests in the application.
///
/// ## Usage
///
/// ```dart
/// // Get all tests
/// final allTests = TestRegistry.allTests;
///
/// // Get specific test
/// final test = TestRegistry.getTest('stress_test');
///
/// // Filter by category
/// final personalityTests = TestRegistry.getByCategory('personality');
///
/// // Search by tags
/// final quickTests = TestRegistry.getByTag('quick');
/// ```
class TestRegistry {
  /// Private constructor to prevent instantiation
  TestRegistry._();

  /// All available tests (ordered by recommended priority)
  ///
  /// Order: Featured tests first, then by category and complexity
  static final List<TestStub> allTests = [
    // Featured/Popular tests
    SixteenTypesTest(),
    IPIPBigFiveTest(),
    LoveProfileTest(),
    LoveLanguagesTest(),

    // Temperament/Personality
    DISCPersonalityTest(),
    FisherTemperamentTest(),
    TemperamentProfileTest(),
    SocialBatteryTest(),

    // Career/Vocational
    HollandCodeTest(),

    // Emotional/Wellbeing
    ColorPsychologyTest(), // Special color-based test
    DigitalDetoxTest(),
    BurnoutDiagnosticTest(),

    // Quick assessments
    StressTest(),
    SelfEsteemTest(),
  ];

  /// Map of test ID to test stub for fast lookup
  static final Map<String, TestStub> _testsById = {
    for (var test in allTests) test.id: test
  };

  /// Get test stub by ID
  ///
  /// Returns null if test not found.
  static TestStub? getTest(String id) {
    return _testsById[id];
  }

  /// Get all tests in a specific category
  ///
  /// Example: `getByCategory('personality')`
  static List<TestStub> getByCategory(String category) {
    return allTests.where((test) => test.category == category).toList();
  }

  /// Get all tests containing a specific tag
  ///
  /// Example: `getByTag('quick')` returns tests with 'quick' tag
  static List<TestStub> getByTag(String tag) {
    return allTests.where((test) => test.tags.contains(tag)).toList();
  }

  /// Get tests by multiple tags (AND logic)
  ///
  /// Returns tests that have ALL specified tags.
  static List<TestStub> getByTags(List<String> tags) {
    return allTests.where((test) {
      return tags.every((tag) => test.tags.contains(tag));
    }).toList();
  }

  /// Get all unique categories
  static List<String> getAllCategories() {
    return allTests.map((test) => test.category).toSet().toList()..sort();
  }

  /// Get all unique tags
  static List<String> getAllTags() {
    final tags = <String>{};
    for (var test in allTests) {
      tags.addAll(test.tags);
    }
    return tags.toList()..sort();
  }

  /// Get quick tests (estimatedMinutes <= 5)
  static List<TestStub> getQuickTests() {
    return allTests.where((test) => test.estimatedMinutes <= 5).toList();
  }

  /// Get detailed tests (estimatedMinutes > 10)
  static List<TestStub> getDetailedTests() {
    return allTests.where((test) => test.estimatedMinutes > 10).toList();
  }

  /// Get multi-factor tests only
  static List<TestStub> getMultiFactorTests() {
    return allTests.where((test) => test.type == 'multi_factor').toList();
  }

  /// Get simple tests only
  static List<TestStub> getSimpleTests() {
    return allTests.where((test) => test.type == 'simple').toList();
  }

  /// Search tests by name (case-insensitive)
  ///
  /// Searches in both Russian and English names.
  static List<TestStub> search(String query) {
    final lowerQuery = query.toLowerCase();
    return allTests.where((test) {
      final nameRu = test.name['ru']?.toLowerCase() ?? '';
      final nameEn = test.name['en']?.toLowerCase() ?? '';
      final descRu = test.description['ru']?.toLowerCase() ?? '';
      final descEn = test.description['en']?.toLowerCase() ?? '';

      return nameRu.contains(lowerQuery) ||
          nameEn.contains(lowerQuery) ||
          descRu.contains(lowerQuery) ||
          descEn.contains(lowerQuery);
    }).toList();
  }

  /// Get statistics about available tests
  static Map<String, dynamic> getStats() {
    return {
      'totalTests': allTests.length,
      'simpleTests': getSimpleTests().length,
      'multiFactorTests': getMultiFactorTests().length,
      'categories': getAllCategories().length,
      'tags': getAllTags().length,
      'quickTests': getQuickTests().length,
      'detailedTests': getDetailedTests().length,
    };
  }
}
