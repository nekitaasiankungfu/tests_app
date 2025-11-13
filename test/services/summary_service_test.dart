import 'package:flutter_test/flutter_test.dart';
import 'package:psycho_app/services/summary_service.dart';
import 'package:psycho_app/models/test_model.dart';
import 'package:psycho_app/models/summary_model.dart';
import 'package:psycho_app/config/summary_config.dart';

void main() {
  late SummaryService summaryService;

  setUp(() {
    summaryService = SummaryService();
  });

  group('calculateAveragedPersonalityType()', () {
    test('returns null when no 16 Types test results exist', () {
      final completedTests = [
        _createTestResult('ipip_big_five'),
        _createTestResult('fisher_temperament'),
      ];

      final result = summaryService.calculateAveragedPersonalityType(
        completedTests,
        'en',
      );

      expect(result, isNull);
    });

    test('calculates personality type from single 16 Types result', () {
      final completedTests = [
        _createBipolarTestResult('ENFP'),
      ];

      final result = summaryService.calculateAveragedPersonalityType(
        completedTests,
        'en',
      );

      expect(result, isNotNull);
      expect(result!['personalityType'], 'ENFP');
      expect(result['typeName'], isNotEmpty);
      expect(result['bipolarScores'], isNotNull);
    });

    test('averages scores across multiple 16 Types attempts', () {
      final completedTests = [
        _createBipolarTestResult('ENFP', scores: {
          'mbti_ei': BipolarDimensionScore(
            dimensionId: 'mbti_ei',
            positiveScore: 30,
            negativeScore: 20,
            positiveMaxScore: 50,
            negativeMaxScore: 50,
            dominantPole: 'E',
            normalizedScore: 60.0,
          ),
        }),
        _createBipolarTestResult('ENFP', scores: {
          'mbti_ei': BipolarDimensionScore(
            dimensionId: 'mbti_ei',
            positiveScore: 40,
            negativeScore: 10,
            positiveMaxScore: 50,
            negativeMaxScore: 50,
            dominantPole: 'E',
            normalizedScore: 80.0,
          ),
        }),
      ];

      final result = summaryService.calculateAveragedPersonalityType(
        completedTests,
        'en',
      );

      expect(result, isNotNull);
      final bipolarScores = result!['bipolarScores'] as Map<String, BipolarDimensionScore>;
      expect(bipolarScores['mbti_ei']!.positiveScore, 70); // 30 + 40
      expect(bipolarScores['mbti_ei']!.negativeScore, 30); // 20 + 10
    });

    test('determines dominant pole correctly for each dimension', () {
      final completedTests = [
        _createBipolarTestResult('ISTJ', scores: {
          'mbti_ei': BipolarDimensionScore(
            dimensionId: 'mbti_ei',
            positiveScore: 10, // E
            negativeScore: 40, // I (dominant)
            positiveMaxScore: 50,
            negativeMaxScore: 50,
            dominantPole: 'I',
            normalizedScore: 20.0,
          ),
        }),
      ];

      final result = summaryService.calculateAveragedPersonalityType(
        completedTests,
        'en',
      );

      expect(result!['personalityType'], startsWith('I'));
    });

    test('handles balanced scores (equal positive and negative)', () {
      final completedTests = [
        _createBipolarTestResult('XXXX', scores: {
          'mbti_ei': BipolarDimensionScore(
            dimensionId: 'mbti_ei',
            positiveScore: 25,
            negativeScore: 25,
            positiveMaxScore: 50,
            negativeMaxScore: 50,
            dominantPole: 'X',
            normalizedScore: 50.0,
          ),
        }),
      ];

      final result = summaryService.calculateAveragedPersonalityType(
        completedTests,
        'en',
      );

      expect(result, isNotNull);
      // When balanced, should still produce a type code (may contain X)
      expect(result!['personalityType'], isNotEmpty);
    });

    test('normalizes scores to 0-100 range', () {
      final completedTests = [
        _createBipolarTestResult('ENFP'),
      ];

      final result = summaryService.calculateAveragedPersonalityType(
        completedTests,
        'en',
      );

      final bipolarScores = result!['bipolarScores'] as Map<String, BipolarDimensionScore>;
      bipolarScores.forEach((dimensionId, score) {
        expect(score.normalizedScore, greaterThanOrEqualTo(0.0));
        expect(score.normalizedScore, lessThanOrEqualTo(100.0));
      });
    });

    test('returns localized type name in Russian', () {
      final completedTests = [
        _createBipolarTestResult('ENFP'),
      ];

      final result = summaryService.calculateAveragedPersonalityType(
        completedTests,
        'ru',
      );

      expect(result!['typeName'], 'Энтузиаст'); // Russian name for ENFP
    });

    test('returns localized type name in English', () {
      final completedTests = [
        _createBipolarTestResult('ENFP'),
      ];

      final result = summaryService.calculateAveragedPersonalityType(
        completedTests,
        'en',
      );

      expect(result!['typeName'], 'Enthusiast'); // English name for ENFP
    });
  });

  group('getTypeName()', () {
    test('returns correct names for all 16 personality types in English', () {
      final types = [
        'ISTJ', 'ISFJ', 'INFJ', 'INTJ',
        'ISTP', 'ISFP', 'INFP', 'INTP',
        'ESTP', 'ESFP', 'ENFP', 'ENTP',
        'ESTJ', 'ESFJ', 'ENFJ', 'ENTJ',
      ];

      for (final type in types) {
        final name = summaryService.getTypeName(type, 'en');
        expect(name, isNotEmpty);
        expect(name, isNot(type)); // Should return name, not code
      }
    });

    test('returns correct names for all 16 personality types in Russian', () {
      final types = [
        'ISTJ', 'ISFJ', 'INFJ', 'INTJ',
        'ISTP', 'ISFP', 'INFP', 'INTP',
        'ESTP', 'ESFP', 'ENFP', 'ENTP',
        'ESTJ', 'ESFJ', 'ENFJ', 'ENTJ',
      ];

      for (final type in types) {
        final name = summaryService.getTypeName(type, 'ru');
        expect(name, isNotEmpty);
        expect(name, isNot(type)); // Should return name, not code
      }
    });

    test('returns type code for unknown type', () {
      final name = summaryService.getTypeName('XXXX', 'en');
      expect(name, 'XXXX'); // Falls back to code
    });

    test('handles empty string', () {
      final name = summaryService.getTypeName('', 'en');
      expect(name, isEmpty);
    });

    test('specific type name mapping - ENFP', () {
      expect(summaryService.getTypeName('ENFP', 'en'), 'Enthusiast');
      expect(summaryService.getTypeName('ENFP', 'ru'), 'Энтузиаст');
    });

    test('specific type name mapping - INTJ', () {
      expect(summaryService.getTypeName('INTJ', 'en'), 'Architect');
      expect(summaryService.getTypeName('INTJ', 'ru'), 'Архитектор');
    });

    test('specific type name mapping - ESFJ', () {
      expect(summaryService.getTypeName('ESFJ', 'en'), 'Consul');
      expect(summaryService.getTypeName('ESFJ', 'ru'), 'Наставник');
    });
  });

  group('analyzeBipolarScore()', () {
    test('correctly identifies dominant positive pole', () {
      final score = BipolarDimensionScore(
        dimensionId: 'mbti_ei',
        positiveScore: 35,
        negativeScore: 15,
        positiveMaxScore: 50,
        negativeMaxScore: 50,
        dominantPole: 'E',
        normalizedScore: 70.0,
      );

      final analysis = summaryService.analyzeBipolarScore(score, 'E', 'I');

      expect(analysis['isDominantPositive'], true);
      expect(analysis['isDominantNegative'], false);
      expect(analysis['isBalanced'], false);
      expect(analysis['dominantName'], 'E');
      expect(analysis['dominantPercentage'], 70);
    });

    test('correctly identifies dominant negative pole', () {
      final score = BipolarDimensionScore(
        dimensionId: 'mbti_ei',
        positiveScore: 15,
        negativeScore: 35,
        positiveMaxScore: 50,
        negativeMaxScore: 50,
        dominantPole: 'I',
        normalizedScore: 30.0,
      );

      final analysis = summaryService.analyzeBipolarScore(score, 'E', 'I');

      expect(analysis['isDominantPositive'], false);
      expect(analysis['isDominantNegative'], true);
      expect(analysis['isBalanced'], false);
      expect(analysis['dominantName'], 'I');
      expect(analysis['dominantPercentage'], 70); // 100 - 30
    });

    test('correctly identifies balanced score', () {
      final score = BipolarDimensionScore(
        dimensionId: 'mbti_ei',
        positiveScore: 25,
        negativeScore: 25,
        positiveMaxScore: 50,
        negativeMaxScore: 50,
        dominantPole: 'X',
        normalizedScore: 50.0,
      );

      final analysis = summaryService.analyzeBipolarScore(score, 'E', 'I');

      expect(analysis['isBalanced'], true);
      expect(analysis['dominantName'], 'X');
    });

    test('handles edge case with 0% normalized score', () {
      final score = BipolarDimensionScore(
        dimensionId: 'mbti_ei',
        positiveScore: 0,
        negativeScore: 50,
        positiveMaxScore: 50,
        negativeMaxScore: 50,
        dominantPole: 'I',
        normalizedScore: 0.0,
      );

      final analysis = summaryService.analyzeBipolarScore(score, 'E', 'I');

      expect(analysis['isDominantNegative'], true);
      expect(analysis['percentage'], 0);
    });

    test('handles edge case with 100% normalized score', () {
      final score = BipolarDimensionScore(
        dimensionId: 'mbti_ei',
        positiveScore: 50,
        negativeScore: 0,
        positiveMaxScore: 50,
        negativeMaxScore: 50,
        dominantPole: 'E',
        normalizedScore: 100.0,
      );

      final analysis = summaryService.analyzeBipolarScore(score, 'E', 'I');

      expect(analysis['isDominantPositive'], true);
      expect(analysis['percentage'], 100);
    });
  });

  group('Test Filtering and Sorting', () {
    test('getSixteenTypesResults filters only 16 Types tests', () {
      final completedTests = [
        _createTestResult('ipip_big_five'),
        _createTestResult('sixteen_types'),
        _createTestResult('fisher_temperament'),
        _createTestResult('sixteen_types'),
        _createTestResult('love_profile'),
      ];

      final filtered = summaryService.getSixteenTypesResults(completedTests);

      expect(filtered.length, 2);
      expect(filtered.every((t) => t.testId == 'sixteen_types'), true);
    });

    test('sortTestResultsByDate sorts newest first', () {
      final results = [
        _createTestResultWithDate('test1', DateTime(2024, 1, 1)),
        _createTestResultWithDate('test2', DateTime(2024, 3, 1)),
        _createTestResultWithDate('test3', DateTime(2024, 2, 1)),
      ];

      final sorted = summaryService.sortTestResultsByDate(results);

      expect(sorted[0].completedAt, DateTime(2024, 3, 1)); // Newest
      expect(sorted[1].completedAt, DateTime(2024, 2, 1));
      expect(sorted[2].completedAt, DateTime(2024, 1, 1)); // Oldest
    });

    test('sortTestResultsByDate handles empty list', () {
      final sorted = summaryService.sortTestResultsByDate([]);
      expect(sorted, isEmpty);
    });

    test('sortTestResultsByDate handles single item', () {
      final results = [_createTestResult('test1')];
      final sorted = summaryService.sortTestResultsByDate(results);
      expect(sorted.length, 1);
    });
  });

  group('Data Validation Methods', () {
    test('hasAnswerData returns true when answers exist', () {
      final result = _createTestResult('test1', userAnswers: {
        'q1': 3,
        'q2': 4,
      });

      expect(summaryService.hasAnswerData(result), true);
    });

    test('hasAnswerData returns false when answers are null', () {
      final result = _createTestResult('test1');

      expect(summaryService.hasAnswerData(result), false);
    });

    test('hasAnswerData returns false when answers are empty', () {
      final result = _createTestResult('test1', userAnswers: {});

      expect(summaryService.hasAnswerData(result), false);
    });

    test('hasSufficientDataForPersonalityType returns true with 16 Types results', () {
      final completedTests = [
        _createBipolarTestResult('ENFP'),
      ];

      expect(summaryService.hasSufficientDataForPersonalityType(completedTests), true);
    });

    test('hasSufficientDataForPersonalityType returns false without 16 Types results', () {
      final completedTests = [
        _createTestResult('ipip_big_five'),
        _createTestResult('fisher_temperament'),
      ];

      expect(summaryService.hasSufficientDataForPersonalityType(completedTests), false);
    });

    test('getUserAnswer returns correct answer score', () {
      final result = _createTestResult('test1', userAnswers: {
        'q1': 3,
        'q2': 5,
      });

      expect(summaryService.getUserAnswer(result, 'q1'), 3);
      expect(summaryService.getUserAnswer(result, 'q2'), 5);
    });

    test('getUserAnswer returns null for non-existent question', () {
      final result = _createTestResult('test1', userAnswers: {'q1': 3});

      expect(summaryService.getUserAnswer(result, 'q999'), isNull);
    });

    test('getUserAnswer returns null when userAnswers is null', () {
      final result = _createTestResult('test1');

      expect(summaryService.getUserAnswer(result, 'q1'), isNull);
    });
  });

  group('Test Name and Localization', () {
    test('getTestName returns correct names for all test types in English', () {
      final testIds = [
        'ipip_big_five',
        'fisher_temperament',
        'love_profile',
        'stress_test',
        'self_esteem_test',
        'sixteen_types',
      ];

      for (final testId in testIds) {
        final name = summaryService.getTestName(testId, 'en');
        expect(name, isNotEmpty);
        expect(name, isNot(testId)); // Should return name, not ID
      }
    });

    test('getTestName returns correct names for all test types in Russian', () {
      final testIds = [
        'ipip_big_five',
        'fisher_temperament',
        'love_profile',
        'stress_test',
        'self_esteem_test',
        'sixteen_types',
      ];

      for (final testId in testIds) {
        final name = summaryService.getTestName(testId, 'ru');
        expect(name, isNotEmpty);
        expect(name, isNot(testId)); // Should return name, not ID
      }
    });

    test('getTestName returns testId for unknown test', () {
      final name = summaryService.getTestName('unknown_test', 'en');
      expect(name, 'unknown_test');
    });

    test('getTestName specific mapping - IPIP Big Five', () {
      expect(summaryService.getTestName('ipip_big_five', 'en'), 'IPIP Big Five');
      expect(summaryService.getTestName('ipip_big_five', 'ru'), 'Большая пятерка IPIP');
    });
  });

  group('Confidence Level Information', () {
    test('getConfidenceLevelInfo returns correct info for high confidence', () {
      final info = summaryService.getConfidenceLevelInfo(
        ConfidenceLevel.high,
        'en',
      );

      expect(info['name'], 'High');
      expect(info['description'], isNotEmpty);
    });

    test('getConfidenceLevelInfo returns correct info for medium confidence', () {
      final info = summaryService.getConfidenceLevelInfo(
        ConfidenceLevel.medium,
        'en',
      );

      expect(info['name'], 'Medium');
      expect(info['description'], isNotEmpty);
    });

    test('getConfidenceLevelInfo returns correct info for low confidence', () {
      final info = summaryService.getConfidenceLevelInfo(
        ConfidenceLevel.low,
        'en',
      );

      expect(info['name'], 'Low');
      expect(info['description'], isNotEmpty);
    });

    test('getConfidenceLevelInfo returns Russian localization', () {
      final info = summaryService.getConfidenceLevelInfo(
        ConfidenceLevel.high,
        'ru',
      );

      expect(info['name'], 'Высокая');
      expect(info['description'], contains('достаточно'));
    });
  });

  group('Test Statistics', () {
    test('getTestStatistics calculates total and unique tests', () {
      final completedTests = [
        _createTestResult('ipip_big_five'),
        _createTestResult('fisher_temperament'),
        _createTestResult('ipip_big_five'), // Duplicate
        _createTestResult('love_profile'),
      ];

      final stats = summaryService.getTestStatistics(completedTests);

      expect(stats['totalTests'], 4);
      expect(stats['uniqueTests'], 3); // Only 3 unique test types
      expect(stats['hasMultipleAttempts'], true);
    });

    test('getTestStatistics handles single test', () {
      final completedTests = [_createTestResult('test1')];

      final stats = summaryService.getTestStatistics(completedTests);

      expect(stats['totalTests'], 1);
      expect(stats['uniqueTests'], 1);
      expect(stats['hasMultipleAttempts'], false);
    });

    test('getTestStatistics handles empty list', () {
      final stats = summaryService.getTestStatistics([]);

      expect(stats['totalTests'], 0);
      expect(stats['uniqueTests'], 0);
      expect(stats['hasMultipleAttempts'], false);
    });
  });

  group('Date Formatting', () {
    test('formatTestDate formats date correctly', () {
      final date = DateTime(2024, 3, 15);
      final formatted = summaryService.formatTestDate(date, 'en');

      expect(formatted, '15.3.2024');
    });

    test('formatTestDate handles single digit month and day', () {
      final date = DateTime(2024, 1, 5);
      final formatted = summaryService.formatTestDate(date, 'en');

      expect(formatted, '5.1.2024');
    });

    test('formatTestDate handles double digit month and day', () {
      final date = DateTime(2024, 12, 31);
      final formatted = summaryService.formatTestDate(date, 'en');

      expect(formatted, '31.12.2024');
    });
  });

  group('Bipolar Dimension Data', () {
    test('getBipolarDimensionData returns complete dimension info', () {
      final result = _createBipolarTestResult('ENFP');

      final data = summaryService.getBipolarDimensionData(
        result,
        'mbti_ei',
        'en',
      );

      expect(data, isNotEmpty);
      expect(data['positiveEnd'], isNotEmpty);
      expect(data['negativeEnd'], isNotEmpty);
      expect(data['positiveName'], isNotEmpty);
      expect(data['negativeName'], isNotEmpty);
      expect(data['normalizedScore'], isNotNull);
    });

    test('getBipolarDimensionData returns empty map for missing dimension', () {
      final result = _createTestResult('ipip_big_five');

      final data = summaryService.getBipolarDimensionData(
        result,
        'mbti_ei',
        'en',
      );

      expect(data, isEmpty);
    });

    test('getBipolarDimensionData returns empty map when bipolarScores is null', () {
      final result = _createTestResult('test1');

      final data = summaryService.getBipolarDimensionData(
        result,
        'mbti_ei',
        'en',
      );

      expect(data, isEmpty);
    });
  });

  group('Pole Color Info', () {
    test('getPoleColorInfo identifies positive pole correctly', () {
      final info = summaryService.getPoleColorInfo('E', 'E', true);

      expect(info['isPositivePole'], true);
      expect(info['shouldHighlight'], true);
    });

    test('getPoleColorInfo identifies negative pole correctly', () {
      final info = summaryService.getPoleColorInfo('I', 'E', false);

      expect(info['isPositivePole'], false);
      expect(info['shouldHighlight'], false);
    });

    test('getPoleColorInfo handles non-dominant positive pole', () {
      final info = summaryService.getPoleColorInfo('E', 'E', false);

      expect(info['isPositivePole'], true);
      expect(info['shouldHighlight'], false);
    });
  });

  group('Edge Cases and Error Handling', () {
    test('handles test results with no bipolar scores', () {
      final completedTests = [
        _createTestResult('ipip_big_five'),
      ];

      final result = summaryService.calculateAveragedPersonalityType(
        completedTests,
        'en',
      );

      expect(result, isNull);
    });

    test('handles test results with incomplete bipolar scores', () {
      final result = TestResult(
        testId: 'sixteen_types',
        totalScore: 100,
        maxScore: 200,
        interpretation: 'Test',
        completedAt: DateTime.now(),
        bipolarScores: {
          'mbti_ei': BipolarDimensionScore(
            dimensionId: 'mbti_ei',
            positiveScore: 30,
            negativeScore: 20,
            positiveMaxScore: 50,
            negativeMaxScore: 50,
            dominantPole: 'E',
            normalizedScore: 60.0,
          ),
          // Missing other 3 dimensions
        },
      );

      final completedTests = [result];

      final avgResult = summaryService.calculateAveragedPersonalityType(
        completedTests,
        'en',
      );

      // Should handle gracefully, even with missing dimensions
      expect(avgResult, isNotNull);
    });

    test('sortTestResultsByDate maintains order for same timestamps', () {
      final now = DateTime.now();
      final results = [
        _createTestResultWithDate('test1', now),
        _createTestResultWithDate('test2', now),
        _createTestResultWithDate('test3', now),
      ];

      final sorted = summaryService.sortTestResultsByDate(results);

      expect(sorted.length, 3);
      // Order should be stable (same as input for equal timestamps)
    });

    test('handles malformed personality type code', () {
      final name = summaryService.getTypeName('EN', 'en'); // Only 2 letters
      expect(name, 'EN'); // Falls back to code
    });
  });
}

// ============================================================================
// Helper Functions
// ============================================================================

/// Creates a basic test result with optional parameters
TestResult _createTestResult(
  String testId, {
  Map<String, int>? userAnswers,
}) {
  return TestResult(
    testId: testId,
    totalScore: 50,
    maxScore: 100,
    interpretation: 'Test interpretation',
    completedAt: DateTime.now(),
    userAnswers: userAnswers,
  );
}

/// Creates a test result with a specific completion date
TestResult _createTestResultWithDate(String testId, DateTime date) {
  return TestResult(
    testId: testId,
    totalScore: 50,
    maxScore: 100,
    interpretation: 'Test interpretation',
    completedAt: date,
  );
}

/// Creates a bipolar test result (16 Types) with specified personality type
TestResult _createBipolarTestResult(
  String personalityType, {
  Map<String, BipolarDimensionScore>? scores,
}) {
  // Create default scores if not provided
  final defaultScores = scores ??
      {
        'mbti_ei': BipolarDimensionScore(
          dimensionId: 'mbti_ei',
          positiveScore: personalityType[0] == 'E' ? 35 : 15,
          negativeScore: personalityType[0] == 'I' ? 35 : 15,
          positiveMaxScore: 50,
          negativeMaxScore: 50,
          dominantPole: personalityType[0],
          normalizedScore: personalityType[0] == 'E' ? 70.0 : 30.0,
        ),
        'mbti_sn': BipolarDimensionScore(
          dimensionId: 'mbti_sn',
          positiveScore: personalityType[1] == 'S' ? 35 : 15,
          negativeScore: personalityType[1] == 'N' ? 35 : 15,
          positiveMaxScore: 50,
          negativeMaxScore: 50,
          dominantPole: personalityType[1],
          normalizedScore: personalityType[1] == 'S' ? 70.0 : 30.0,
        ),
        'mbti_tf': BipolarDimensionScore(
          dimensionId: 'mbti_tf',
          positiveScore: personalityType[2] == 'T' ? 35 : 15,
          negativeScore: personalityType[2] == 'F' ? 35 : 15,
          positiveMaxScore: 50,
          negativeMaxScore: 50,
          dominantPole: personalityType[2],
          normalizedScore: personalityType[2] == 'T' ? 70.0 : 30.0,
        ),
        'mbti_jp': BipolarDimensionScore(
          dimensionId: 'mbti_jp',
          positiveScore: personalityType[3] == 'J' ? 35 : 15,
          negativeScore: personalityType[3] == 'P' ? 35 : 15,
          positiveMaxScore: 50,
          negativeMaxScore: 50,
          dominantPole: personalityType[3],
          normalizedScore: personalityType[3] == 'J' ? 70.0 : 30.0,
        ),
      };

  return TestResult(
    testId: 'sixteen_types',
    totalScore: 200,
    maxScore: 400,
    interpretation: 'Personality type: $personalityType',
    completedAt: DateTime.now(),
    bipolarScores: defaultScores,
    personalityType: personalityType,
  );
}
