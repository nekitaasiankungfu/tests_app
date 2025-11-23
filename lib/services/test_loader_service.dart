import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';
import '../models/test_model.dart';
import '../data/tests/test_stub.dart';
import '../utils/app_logger.dart';
// Legacy imports (for tests not yet converted to JSON)
import '../data/ipip_big_five_data.dart';
import '../data/fisher_temperament_data.dart';
import '../data/love_profile_data.dart';
import '../data/sixteen_types_data.dart';
import '../data/temperament_profile_test_data.dart';
import '../data/digital_detox_data.dart' as digital_detox;
import '../data/burnout_diagnostic_data.dart' as burnout;
import '../data/social_battery_data.dart';
import '../data/disc_personality_data.dart';
import '../data/holland_code_data.dart';
import '../data/love_languages_data.dart';
import '../data/tests/color_psychology_test.dart';
import '../data/anxiety_symptoms_inventory_data.dart';
import '../data/depression_symptoms_inventory_data.dart';
import '../data/tests/career_compass_test.dart';
import '../data/wellbeing_happiness_inventory_data.dart';
import '../data/digital_career_fit_data.dart';
import '../data/self_confidence_multiscale_data.dart';
import '../data/romantic_potential_data.dart';
import '../data/cognitive_ability_data.dart';

/// Service for loading tests from JSON files with caching.
///
/// Features:
/// - Lazy loading: Tests loaded only when needed
/// - LRU cache: Keeps last 10 loaded tests in memory
/// - Validation: Optional JSON validation in debug mode
/// - Legacy support: Falls back to Dart data files if JSON not available
class TestLoaderService {
  // Singleton pattern
  static final TestLoaderService _instance = TestLoaderService._internal();
  factory TestLoaderService() => _instance;
  TestLoaderService._internal();

  /// Cache for loaded tests (LRU with max 10 items)
  final Map<String, TestModel> _cache = {};

  /// Maximum cache size (10 tests = ~1-2 MB in memory)
  static const int maxCacheSize = 10;

  /// Load test from JSON file or legacy Dart data
  ///
  /// Returns cached version if available, otherwise loads from assets.
  /// Falls back to legacy Dart data if JSON not available.
  /// Throws [TestLoadException] if loading fails.
  Future<TestModel> loadTest(TestStub stub) async {
    try {
      // Check cache
      if (_cache.containsKey(stub.id)) {
        appLogger.d('Loading test ${stub.id} from cache');
        return _cache[stub.id]!;
      }

      // If assetPath is empty, use legacy Dart data directly
      if (stub.assetPath.isEmpty) {
        appLogger.i('Empty assetPath for ${stub.id}, using legacy Dart data');
        return await _loadLegacyTest(stub);
      }

      // Try loading from JSON first
      try {
        appLogger.i('Loading test ${stub.id} from ${stub.assetPath}');
        final jsonString = await rootBundle.loadString(stub.assetPath);
        final json = jsonDecode(jsonString) as Map<String, dynamic>;

        // Validate in debug mode
        assert(() {
          _validateTestJson(stub, json);
          return true;
        }());

        // Parse to TestModel (convert JSON + stub to TestModel)
        final test = _jsonToTestModel(stub, json);

        // Check if JSON contains TODO placeholders
        if (_containsTodoPlaceholders(test)) {
          appLogger.w('JSON for ${stub.id} contains TODO placeholders, using legacy data');
          throw Exception('JSON contains TODO placeholders');
        }

        // Add to cache
        _addToCache(stub.id, test);

        appLogger.i('Successfully loaded test ${stub.id} from JSON (${stub.questionCount} questions)');
        return test;
      } catch (e) {
        // JSON not found or invalid, try legacy
        appLogger.w('JSON not found for ${stub.id}, trying legacy Dart data: $e');
        return await _loadLegacyTest(stub);
      }
    } catch (e, stackTrace) {
      appLogger.e('Failed to load test ${stub.id}', error: e, stackTrace: stackTrace);
      throw TestLoadException('Failed to load test ${stub.id}: $e');
    }
  }

  /// Load test from legacy Dart data files
  Future<TestModel> _loadLegacyTest(TestStub stub) async {
    appLogger.i('Loading test ${stub.id} from legacy Dart data');

    TestModel test;
    switch (stub.id) {
      case 'ipip_big_five':
        test = IPIPBigFiveData.getIPIPBigFiveTest();
        break;
      case 'fisher_temperament':
        test = FisherTemperamentData.getFisherTemperamentTest();
        break;
      case 'love_profile':
        test = LoveProfileData.getLoveProfileTest();
        break;
      case 'sixteen_types':
        test = SixteenTypesData.getSixteenTypesTest();
        break;
      case 'temperament_profile_test':
        test = TemperamentProfileTestData.getTemperamentProfileTest();
        break;
      case 'digital_detox_test':
        test = digital_detox.DigitalDetoxTestData.getDigitalDetoxTest();
        break;
      case 'burnout_diagnostic_v1':
        test = burnout.BurnoutDiagnosticData.getBurnoutDiagnosticTest();
        break;
      case 'social_battery_v1':
        test = SocialBatteryData.getSocialBatteryTest();
        break;
      case 'disc_personality_v1':
        test = DISCPersonalityData.getDISCPersonalityTest();
        break;
      case 'holland_code_v1':
        test = HollandCodeData.getHollandCodeTest();
        break;
      case 'love_languages_v1':
        test = LoveLanguagesData.getLoveLanguagesTest();
        break;
      case 'color_psychology_v1':
        test = ColorPsychologyTest.getColorPsychologyTest();
        break;
      case 'anxiety_symptoms_inventory_v1':
        test = AnxietySymptomsInventoryData.getAnxietySymptomsInventoryTest();
        break;
      case 'depression_symptoms_inventory_v1':
        test = DepressionSymptomsInventoryData.getDepressionSymptomsInventoryTest();
        break;
      case 'career_compass_v1':
        test = CareerCompassTest.getCareerCompassTest();
        break;
      case 'wellbeing_happiness_inventory_v1':
        test = WellbeingHappinessInventoryData.getWellbeingHappinessInventoryTest();
        break;
      case 'digital_career_fit_v1':
        test = DigitalCareerFitData.getDigitalCareerFitTest();
        break;
      case 'self_confidence_multiscale_v1':
        test = SelfConfidenceMultiscaleData.getSelfConfidenceMultiscaleTest();
        break;
      case 'romantic_potential_v1':
        test = RomanticPotentialData.getRomanticPotentialTest();
        break;
      case 'cognitive_ability_v1':
        test = CognitiveAbilityData.getCognitiveAbilityTest();
        break;
      default:
        throw TestLoadException('No legacy data available for ${stub.id}');
    }

    // Add to cache
    _addToCache(stub.id, test);

    appLogger.i('Successfully loaded test ${stub.id} from legacy Dart (${stub.questionCount} questions)');
    // Note: Legacy Dart is the preferred architecture for this project (100-200 tests planned)

    return test;
  }

  /// Convert JSON + stub to TestModel
  TestModel _jsonToTestModel(TestStub stub, Map<String, dynamic> json) {
    // Parse questions
    final questionsJson = json['questions'] as List;
    final questions = questionsJson.map((q) {
      final questionMap = q as Map<String, dynamic>;

      // Parse answers
      final answersJson = questionMap['answers'] as List;
      final answers = answersJson.map((a) {
        final answerMap = a as Map<String, dynamic>;
        return AnswerModel(
          id: answerMap['id'] as String,
          text: Map<String, String>.from(answerMap['text']),
          score: answerMap['score'] as int,
        );
      }).toList();

      return QuestionModel(
        id: questionMap['id'] as String,
        text: Map<String, String>.from(questionMap['text']),
        answers: answers,
        factorId: questionMap['factor'] as String?,
        isReversed: questionMap['is_reversed'] as bool? ?? false,
      );
    }).toList();

    // Parse test type
    final typeStr = json['type'] as String?;
    final type = typeStr == 'multi_factor' ? TestType.multiFactor : TestType.simple;

    // Get factors list
    final factorsJson = json['factors'] as List?;
    final factorIds = factorsJson?.map((f) => f.toString()).toList();

    // Get disclaimer
    Map<String, String>? disclaimer;
    if (json.containsKey('disclaimer')) {
      disclaimer = Map<String, String>.from(json['disclaimer']);
    }

    return TestModel(
      id: stub.id,
      title: stub.name,
      description: stub.description,
      category: stub.metadata['category_display'] ?? stub.name,
      categoryId: stub.category,
      questions: questions,
      estimatedTime: stub.estimatedMinutes,
      type: type,
      factorIds: factorIds,
      disclaimer: disclaimer,
    );
  }

  /// Add test to cache with LRU eviction
  void _addToCache(String id, TestModel test) {
    // Remove oldest if cache full
    if (_cache.length >= maxCacheSize) {
      final oldestKey = _cache.keys.first;
      _cache.remove(oldestKey);
      appLogger.d('Evicted test $oldestKey from cache');
    }

    _cache[id] = test;
  }

  /// Validate JSON structure (debug mode only)
  void _validateTestJson(TestStub stub, Map<String, dynamic> json) {
    // Check required fields
    if (!json.containsKey('id')) {
      throw TestValidationException('Missing required field: id');
    }

    if (json['id'] != stub.id) {
      throw TestValidationException(
        'ID mismatch: stub=${stub.id}, json=${json['id']}',
      );
    }

    if (!json.containsKey('questions')) {
      throw TestValidationException('Missing required field: questions');
    }

    final questions = json['questions'] as List;
    if (questions.length != stub.questionCount) {
      appLogger.w(
        'Question count mismatch: stub=${stub.questionCount}, json=${questions.length}',
      );
    }

    appLogger.d('Validation passed for test ${stub.id}');
  }

  /// Check if test contains TODO placeholders (incomplete JSON)
  bool _containsTodoPlaceholders(TestModel test) {
    for (final question in test.questions) {
      // Check if question text contains TODO
      for (final text in question.text.values) {
        if (text.toUpperCase().contains('TODO')) {
          return true;
        }
      }

      // Check if answer text contains TODO
      for (final answer in question.answers) {
        for (final text in answer.text.values) {
          if (text.toUpperCase().contains('TODO')) {
            return true;
          }
        }
      }
    }
    return false;
  }

  /// Clear entire cache
  void clearCache() {
    _cache.clear();
    appLogger.i('Test cache cleared');
  }

  /// Remove specific test from cache
  void evictTest(String testId) {
    _cache.remove(testId);
    appLogger.d('Evicted test $testId from cache');
  }

  /// Get cache statistics
  Map<String, dynamic> getCacheStats() {
    return {
      'size': _cache.length,
      'maxSize': maxCacheSize,
      'tests': _cache.keys.toList(),
    };
  }

  /// Preload multiple tests (useful for popular tests)
  Future<void> preloadTests(List<TestStub> stubs) async {
    appLogger.i('Preloading ${stubs.length} tests');
    for (final stub in stubs) {
      try {
        await loadTest(stub);
      } catch (e) {
        appLogger.w('Failed to preload test ${stub.id}: $e');
      }
    }
  }
}

/// Exception thrown when test loading fails
class TestLoadException implements Exception {
  final String message;
  TestLoadException(this.message);

  @override
  String toString() => 'TestLoadException: $message';
}

/// Exception thrown when test validation fails
class TestValidationException implements Exception {
  final String message;
  TestValidationException(this.message);

  @override
  String toString() => 'TestValidationException: $message';
}
