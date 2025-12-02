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
import 'tests/anxiety_symptoms_inventory_test.dart';
import 'tests/depression_symptoms_inventory_test.dart';
import 'tests/career_compass_test.dart';
import 'tests/wellbeing_happiness_inventory_test.dart';
import 'tests/digital_career_fit_test.dart';
import 'tests/self_confidence_multiscale_test.dart';
import 'tests/romantic_potential_test.dart';
import 'tests/cognitive_ability_test.dart';
import 'tests/relationship_compatibility_test.dart';
import 'tests/friendship_psychology_test.dart';
import 'tests/adhd_attention_profile_test.dart';
import 'tests/perfectionism_fear_of_error_test.dart';
import 'tests/values_priorities_test.dart';
import 'tests/attachment_style_test.dart';
import 'tests/motivational_strategies_test.dart';
import 'tests/conflict_communication_style_test.dart';
import 'tests/emotional_intelligence_test.dart';
import 'tests/imposter_syndrome_test.dart';
import 'tests/sleep_recovery_test.dart';
import 'tests/procrastination_productivity_test.dart';
import 'tests/boundaries_people_pleasing_test.dart';
import 'tests/fomo_social_comparison_test.dart';
import 'tests/creative_type_test.dart';
import 'tests/friendship_red_flags_test.dart';
import 'tests/visual_micro_tests_test.dart';

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
    AttachmentStyleTest(), // Attachment styles in relationships assessment
    RomanticPotentialTest(), // Romantic beliefs and potential assessment
    RelationshipCompatibilityTest(), // Relationship compatibility assessment
    FriendshipPsychologyTest(), // Friendship style and depth assessment
    FriendshipRedFlagsTest(), // Friendship red flags and toxic patterns assessment
    ConflictCommunicationStyleTest(), // Conflict resolution styles assessment (Thomas-Kilmann)

    // Temperament/Personality
    DISCPersonalityTest(),
    FisherTemperamentTest(),
    TemperamentProfileTest(),
    SocialBatteryTest(),
    ValuesPrioritiesTest(), // Personal values and life priorities assessment
    MotivationalStrategiesTest(), // Motivational patterns assessment (9 types)

    // Career/Vocational
    HollandCodeTest(),
    CareerCompassTest(), // Special forced_choice test
    DigitalCareerFitTest(), // Digital career direction assessment
    CognitiveAbilityTest(), // Cognitive ability assessment (IQ-style)
    PerfectionismFearOfErrorTest(), // Perfectionism and fear of error assessment

    // Intelligence/Abilities
    EmotionalIntelligenceTest(), // Emotional intelligence (EQ) assessment

    // Creativity
    CreativeTypeTest(), // Creative type and style assessment

    // Visual Insights
    VisualMicroTestsTest(), // Special visual perception micro-tests package

    // Emotional/Wellbeing
    ColorPsychologyTest(), // Special color-based test
    DigitalDetoxTest(),
    FomoSocialComparisonTest(), // FOMO and social comparison assessment
    BurnoutDiagnosticTest(),
    AnxietySymptomsInventoryTest(), // Anxiety assessment
    DepressionSymptomsInventoryTest(), // Depression assessment
    WellbeingHappinessInventoryTest(), // PERMA wellbeing assessment
    SelfConfidenceMultiscaleTest(), // Self-confidence assessment
    ADHDAttentionProfileTest(), // ADHD attention and self-regulation profile
    ImposterSyndromeTest(), // Imposter syndrome assessment
    SleepRecoveryTest(), // Sleep quality and recovery assessment
    ProcrastinationProductivityTest(), // Procrastination and productivity style assessment
    BoundariesPeoplePleasingTest(), // Personal boundaries and people-pleasing assessment

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
