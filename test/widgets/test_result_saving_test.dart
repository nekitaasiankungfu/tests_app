/// Widget tests for test result saving and persistence
///
/// This test file ensures that psychological test results are correctly:
/// 1. Saved to local storage (SharedPreferences)
/// 2. Loaded on app restart
/// 3. Persisted across multiple tests
/// 4. Serialized/deserialized without data loss
///
/// Critical for data integrity - users' psychological profiles must not be lost!

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:psycho_app/providers/test_provider.dart';
import 'package:psycho_app/models/test_model.dart';
import 'dart:convert';

void main() {
  group('Test Result Saving & Persistence', () {
    setUp(() async {
      // Reset SharedPreferences before each test
      SharedPreferences.setMockInitialValues({});
    });

    test('Single test result is saved to SharedPreferences', () async {
      final testProvider = TestProvider();

      // Wait for provider to initialize
      await Future.delayed(const Duration(milliseconds: 100));

      // Create a test result
      final result = TestResult(
        testId: 'stress_test',
        totalScore: 15,
        maxScore: 25,
        interpretation: 'Moderate stress level',
        completedAt: DateTime.now(),
        factorScores: null,
        userAnswers: {'q1': 3, 'q2': 4, 'q3': 2, 'q4': 3, 'q5': 3},
      );

      // Save the result
      final success = await testProvider.saveTestResult(result);

      // Verify save was successful
      expect(success, true, reason: 'saveTestResult should return true');

      // Verify result was added to provider's list
      expect(testProvider.completedTests.length, 1);
      expect(testProvider.completedTests.first.testId, 'stress_test');

      // Verify data was written to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final savedJson = prefs.getString('completedTests');
      expect(savedJson, isNotNull, reason: 'Data should be saved to storage');

      // Verify JSON structure
      final savedData = json.decode(savedJson!);
      expect(savedData, isA<List>());
      expect((savedData as List).length, 1);
      expect(savedData[0]['testId'], 'stress_test');
      expect(savedData[0]['totalScore'], 15);
    });

    test('Multiple test results are saved correctly', () async {
      final testProvider = TestProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Create 3 different test results
      final results = [
        TestResult(
          testId: 'stress_test',
          totalScore: 15,
          maxScore: 25,
          interpretation: 'Moderate stress',
          completedAt: DateTime.now(),
          factorScores: null,
          userAnswers: {'q1': 3},
        ),
        TestResult(
          testId: 'self_esteem_test',
          totalScore: 20,
          maxScore: 25,
          interpretation: 'High self-esteem',
          completedAt: DateTime.now(),
          factorScores: null,
          userAnswers: {'q1': 5},
        ),
        TestResult(
          testId: 'ipip_big_five',
          totalScore: 150,
          maxScore: 250,
          interpretation: 'Balanced personality',
          completedAt: DateTime.now(),
          factorScores: {
            'openness': FactorScore(
              factorId: 'openness',
              factorName: {'ru': 'Открытость', 'en': 'Openness'},
              score: 70,
              maxScore: 100,
              interpretation: {'ru': 'Высокий', 'en': 'High'},
            ),
            'conscientiousness': FactorScore(
              factorId: 'conscientiousness',
              factorName: {'ru': 'Добросовестность', 'en': 'Conscientiousness'},
              score: 80,
              maxScore: 100,
              interpretation: {'ru': 'Высокий', 'en': 'High'},
            ),
            'extraversion': FactorScore(
              factorId: 'extraversion',
              factorName: {'ru': 'Экстраверсия', 'en': 'Extraversion'},
              score: 60,
              maxScore: 100,
              interpretation: {'ru': 'Умеренный', 'en': 'Moderate'},
            ),
            'agreeableness': FactorScore(
              factorId: 'agreeableness',
              factorName: {'ru': 'Доброжелательность', 'en': 'Agreeableness'},
              score: 75,
              maxScore: 100,
              interpretation: {'ru': 'Высокий', 'en': 'High'},
            ),
            'neuroticism': FactorScore(
              factorId: 'neuroticism',
              factorName: {'ru': 'Нейротизм', 'en': 'Neuroticism'},
              score: 40,
              maxScore: 100,
              interpretation: {'ru': 'Низкий', 'en': 'Low'},
            ),
          },
          userAnswers: {},
        ),
      ];

      // Save all results
      for (final result in results) {
        await testProvider.saveTestResult(result);
      }

      // Verify all 3 results are in memory
      expect(testProvider.completedTests.length, 3);

      // Verify all 3 results are in storage
      final prefs = await SharedPreferences.getInstance();
      final savedJson = prefs.getString('completedTests');
      final savedData = json.decode(savedJson!) as List;
      expect(savedData.length, 3);

      // Verify each test is saved
      expect(savedData.any((r) => r['testId'] == 'stress_test'), true);
      expect(savedData.any((r) => r['testId'] == 'self_esteem_test'), true);
      expect(savedData.any((r) => r['testId'] == 'ipip_big_five'), true);
    });

    test('Test results are loaded on provider initialization', () async {
      // Pre-populate SharedPreferences with test data
      final testData = [
        {
          'testId': 'stress_test',
          'totalScore': 15,
          'maxScore': 25,
          'interpretation': 'Moderate stress',
          'completedAt': DateTime.now().toIso8601String(),
          'version': 2,
          'userAnswers': {'q1': 3},
        },
        {
          'testId': 'self_esteem_test',
          'totalScore': 20,
          'maxScore': 25,
          'interpretation': 'High self-esteem',
          'completedAt': DateTime.now().toIso8601String(),
          'version': 2,
          'userAnswers': {'q1': 5},
        },
      ];

      SharedPreferences.setMockInitialValues({
        'completedTests': json.encode(testData),
      });

      // Create provider - should auto-load data
      final testProvider = TestProvider();

      // Wait for async loading
      await Future.delayed(const Duration(milliseconds: 200));

      // Verify both results were loaded
      expect(testProvider.completedTests.length, 2);
      expect(testProvider.completedTests[0].testId, 'stress_test');
      expect(testProvider.completedTests[1].testId, 'self_esteem_test');
      expect(testProvider.completedTests[0].totalScore, 15);
      expect(testProvider.completedTests[1].totalScore, 20);
    });

    test('Multi-factor test results preserve factor scores', () async {
      final testProvider = TestProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Create a multi-factor result (Big Five)
      final result = TestResult(
        testId: 'ipip_big_five',
        totalScore: 150,
        maxScore: 250,
        interpretation: 'Balanced personality',
        completedAt: DateTime.now(),
        factorScores: {
          'openness': FactorScore(
            factorId: 'openness',
            factorName: {'ru': 'Открытость', 'en': 'Openness'},
            score: 70,
            maxScore: 100,
            interpretation: {'ru': 'Высокий', 'en': 'High'},
          ),
          'conscientiousness': FactorScore(
            factorId: 'conscientiousness',
            factorName: {'ru': 'Добросовестность', 'en': 'Conscientiousness'},
            score: 80,
            maxScore: 100,
            interpretation: {'ru': 'Высокий', 'en': 'High'},
          ),
          'extraversion': FactorScore(
            factorId: 'extraversion',
            factorName: {'ru': 'Экстраверсия', 'en': 'Extraversion'},
            score: 60,
            maxScore: 100,
            interpretation: {'ru': 'Умеренный', 'en': 'Moderate'},
          ),
          'agreeableness': FactorScore(
            factorId: 'agreeableness',
            factorName: {'ru': 'Доброжелательность', 'en': 'Agreeableness'},
            score: 75,
            maxScore: 100,
            interpretation: {'ru': 'Высокий', 'en': 'High'},
          ),
          'neuroticism': FactorScore(
            factorId: 'neuroticism',
            factorName: {'ru': 'Нейротизм', 'en': 'Neuroticism'},
            score: 40,
            maxScore: 100,
            interpretation: {'ru': 'Низкий', 'en': 'Low'},
          ),
        },
        userAnswers: {'q1': 3, 'q2': 4},
      );

      // Save result
      await testProvider.saveTestResult(result);

      // Load from storage
      final prefs = await SharedPreferences.getInstance();
      final savedJson = prefs.getString('completedTests');
      final savedData = json.decode(savedJson!) as List;
      final savedResult = savedData.first;

      // Verify factor scores are preserved (check nested structure)
      expect(savedResult['factorScores'], isNotNull);
      expect(savedResult['factorScores']['openness']['score'], 70);
      expect(savedResult['factorScores']['conscientiousness']['score'], 80);
      expect(savedResult['factorScores']['extraversion']['score'], 60);
      expect(savedResult['factorScores']['agreeableness']['score'], 75);
      expect(savedResult['factorScores']['neuroticism']['score'], 40);
    });

    test('Empty result list is handled gracefully', () async {
      // No initial data
      SharedPreferences.setMockInitialValues({});

      final testProvider = TestProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Should have empty list, not null
      expect(testProvider.completedTests, isNotNull);
      expect(testProvider.completedTests.length, 0);
      expect(testProvider.completedTests, isEmpty);
    });

    test('Corrupted JSON data is handled gracefully', () async {
      // Set invalid JSON data
      SharedPreferences.setMockInitialValues({
        'completedTests': 'invalid json {{{',
      });

      final testProvider = TestProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Should handle error gracefully with empty list
      expect(testProvider.completedTests, isEmpty);
      expect(testProvider.lastError, isNotNull,
          reason: 'Error should be recorded');
    });

    test('DateTime serialization preserves timestamp', () async {
      final testProvider = TestProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      final now = DateTime(2025, 11, 8, 14, 30, 0); // Fixed timestamp

      final result = TestResult(
        testId: 'stress_test',
        totalScore: 15,
        maxScore: 25,
        interpretation: 'Moderate stress',
        completedAt: now,
        factorScores: null,
        userAnswers: {'q1': 3},
      );

      // Save result
      await testProvider.saveTestResult(result);

      // Create new provider to load from storage
      final testProvider2 = TestProvider();
      await Future.delayed(const Duration(milliseconds: 200));

      // Verify timestamp was preserved
      final loadedResult = testProvider2.completedTests.first;
      expect(loadedResult.completedAt.year, 2025);
      expect(loadedResult.completedAt.month, 11);
      expect(loadedResult.completedAt.day, 8);
      expect(loadedResult.completedAt.hour, 14);
      expect(loadedResult.completedAt.minute, 30);
    });

    test('Answer map is preserved in serialization', () async {
      final testProvider = TestProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Create result with many answers (simulate 16 types test)
      final userAnswers = <String, int>{};
      for (int i = 1; i <= 80; i++) {
        userAnswers['q$i'] = (i % 5) + 1; // Scores 1-5
      }

      final result = TestResult(
        testId: 'sixteen_types',
        totalScore: 200,
        maxScore: 400,
        interpretation: 'INTJ personality',
        completedAt: DateTime.now(),
        factorScores: null,
        userAnswers: userAnswers,
      );

      // Save result
      await testProvider.saveTestResult(result);

      // Load from storage
      final testProvider2 = TestProvider();
      await Future.delayed(const Duration(milliseconds: 200));

      // Verify all 80 answers are preserved
      final loadedResult = testProvider2.completedTests.first;
      expect(loadedResult.userAnswers?.length, 80,
          reason: 'All 80 answers should be preserved');
      expect(loadedResult.userAnswers?['q1'], 2);
      expect(loadedResult.userAnswers?['q50'], 1);
      expect(loadedResult.userAnswers?['q80'], 1);
    });

    test('Loading indicator is set during async operations', () async {
      SharedPreferences.setMockInitialValues({});

      final testProvider = TestProvider();

      // Initially loading should be true (or false after quick init)
      // We can't reliably test this without listening to changes

      await Future.delayed(const Duration(milliseconds: 100));

      // After loading completes, should be false
      expect(testProvider.isLoading, false);
    });

    test('Question contributions are preserved for hierarchical scales',
        () async {
      final testProvider = TestProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      // Create result with question contributions (hierarchical scale data)
      final questionContributions = {
        'neuroticism': 45.5,
        'extraversion': 72.3,
        'openness': 88.1,
      };

      final result = TestResult(
        testId: 'ipip_big_five',
        totalScore: 150,
        maxScore: 250,
        interpretation: 'Balanced personality',
        completedAt: DateTime.now(),
        factorScores: null,
        userAnswers: {'q1': 3},
        scaleScores: questionContributions,
      );

      // Save result
      await testProvider.saveTestResult(result);

      // Load from storage
      final testProvider2 = TestProvider();
      await Future.delayed(const Duration(milliseconds: 200));

      // Verify scale scores are preserved
      final loadedResult = testProvider2.completedTests.first;
      expect(loadedResult.scaleScores, isNotNull);
      expect(loadedResult.scaleScores?['neuroticism'], 45.5);
      expect(loadedResult.scaleScores?['extraversion'], 72.3);
      expect(loadedResult.scaleScores?['openness'], 88.1);
    });
  });

  group('Test Result Data Integrity', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('Test ID and interpretation are preserved', () async {
      final testProvider = TestProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      final result = TestResult(
        testId: 'stress_test',
        totalScore: 15,
        maxScore: 25,
        interpretation: 'Moderate stress level - you are handling stress well',
        completedAt: DateTime.now(),
        factorScores: null,
        userAnswers: {'q1': 3},
      );

      await testProvider.saveTestResult(result);

      // Load from storage
      final testProvider2 = TestProvider();
      await Future.delayed(const Duration(milliseconds: 200));

      final loadedResult = testProvider2.completedTests.first;
      expect(loadedResult.testId, 'stress_test');
      expect(loadedResult.interpretation, 'Moderate stress level - you are handling stress well');
    });

    test('Special characters in interpretation are preserved', () async {
      final testProvider = TestProvider();
      await Future.delayed(const Duration(milliseconds: 100));

      final interpretation =
          'Ваш уровень стресса: "умеренный" (50-75%). Рекомендации: медитация, спорт.';

      final result = TestResult(
        testId: 'stress_test',
        totalScore: 15,
        maxScore: 25,
        interpretation: interpretation,
        completedAt: DateTime.now(),
        factorScores: null,
        userAnswers: {'q1': 3},
      );

      await testProvider.saveTestResult(result);

      // Load from storage
      final testProvider2 = TestProvider();
      await Future.delayed(const Duration(milliseconds: 200));

      final loadedResult = testProvider2.completedTests.first;
      expect(loadedResult.interpretation, interpretation);
    });
  });
}
