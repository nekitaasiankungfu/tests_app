import 'package:flutter_test/flutter_test.dart';
import 'package:psycho_app/models/test_model.dart';
import 'package:psycho_app/models/summary_model.dart';
import 'package:psycho_app/exceptions/validation_exceptions.dart';
import 'package:psycho_app/config/summary_config.dart';

void main() {
  group('TestResult Validation Tests', () {
    test('Valid TestResult should deserialize successfully', () {
      final json = {
        'testId': 'test_1',
        'totalScore': 80,
        'maxScore': 100,
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
        'version': 2,
      };

      final result = TestResult.fromJson(json);
      expect(result.testId, 'test_1');
      expect(result.totalScore, 80);
      expect(result.maxScore, 100);
    });

    test('Missing required field should throw MissingFieldException', () {
      final json = {
        // 'testId' is missing
        'totalScore': 80,
        'maxScore': 100,
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
      };

      expect(
        () => TestResult.fromJson(json),
        throwsA(isA<MissingFieldException>()),
      );
    });

    test('Invalid type should throw InvalidTypeException', () {
      final json = {
        'testId': 'test_1',
        'totalScore': 'not_a_number', // Should be int
        'maxScore': 100,
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
      };

      expect(
        () => TestResult.fromJson(json),
        throwsA(isA<InvalidTypeException>()),
      );
    });

    test('Negative score should throw RangeValidationException', () {
      final json = {
        'testId': 'test_1',
        'totalScore': -10, // Should be >= 0
        'maxScore': 100,
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
      };

      expect(
        () => TestResult.fromJson(json),
        throwsA(isA<RangeValidationException>()),
      );
    });

    test('Invalid date format should throw DateTimeParseException', () {
      final json = {
        'testId': 'test_1',
        'totalScore': 80,
        'maxScore': 100,
        'interpretation': 'Good result',
        'completedAt': 'invalid-date',
      };

      expect(
        () => TestResult.fromJson(json),
        throwsA(isA<DateTimeParseException>()),
      );
    });

    test('Score exceeding maxScore should log warning but not throw', () {
      final json = {
        'testId': 'test_1',
        'totalScore': 120, // Exceeds maxScore
        'maxScore': 100,
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
      };

      // Should not throw, just log warning
      final result = TestResult.fromJson(json);
      expect(result.totalScore, 120);
    });

    test('Optional fields can be null', () {
      final json = {
        'testId': 'test_1',
        'totalScore': 80,
        'maxScore': 100,
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
        // Optional fields are null
      };

      final result = TestResult.fromJson(json);
      expect(result.factorScores, isNull);
      expect(result.userAnswers, isNull);
      expect(result.scaleScores, isNull);
    });

    test('Version defaults to 1 for old data', () {
      final json = {
        'testId': 'test_1',
        'totalScore': 80,
        'maxScore': 100,
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
        // No version field
      };

      final result = TestResult.fromJson(json);
      expect(result.version, 1);
    });

    test('ScaleScores out of range should be clamped', () {
      final json = {
        'testId': 'test_1',
        'totalScore': 80,
        'maxScore': 100,
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
        'version': 2,
        'scaleScores': {
          'anxiety': 150.0, // Out of range (should clamp to 100)
          'happiness': -10.0, // Out of range (should clamp to 0)
        },
      };

      final result = TestResult.fromJson(json);
      expect(result.scaleScores!['anxiety'], 100.0);
      expect(result.scaleScores!['happiness'], 0.0);
    });
  });

  group('FactorScore Validation Tests', () {
    test('Valid FactorScore should deserialize successfully', () {
      final json = {
        'factorId': 'openness',
        'factorName': {'en': 'Openness', 'ru': 'Открытость'},
        'score': 45,
        'maxScore': 50,
        'interpretation': {'en': 'High openness', 'ru': 'Высокая открытость'},
      };

      final factor = FactorScore.fromJson(json);
      expect(factor.factorId, 'openness');
      expect(factor.score, 45);
    });

    test('Empty factorName map should throw EmptyCollectionException', () {
      final json = {
        'factorId': 'openness',
        'factorName': {}, // Empty map
        'score': 45,
        'maxScore': 50,
        'interpretation': {'en': 'High openness'},
      };

      expect(
        () => FactorScore.fromJson(json),
        throwsA(isA<EmptyCollectionException>()),
      );
    });
  });

  group('QuestionContribution Validation Tests', () {
    test('Valid QuestionContribution should deserialize successfully', () {
      final json = {
        'questionId': 'q1',
        'questionText': {'en': 'How do you feel?', 'ru': 'Как вы себя чувствуете?'},
        'answerScore': 4,
        'maxAnswerScore': 5,
        'weight': 0.8,
        'normalizedContribution': 64.0,
      };

      final contribution = QuestionContribution.fromJson(json);
      expect(contribution.questionId, 'q1');
      expect(contribution.weight, 0.8);
    });

    test('Negative weight should be converted to absolute value', () {
      final json = {
        'questionId': 'q1',
        'questionText': {'en': 'Question'},
        'answerScore': 4,
        'maxAnswerScore': 5,
        'weight': -0.5, // Negative weight
        'normalizedContribution': 64.0,
      };

      final contribution = QuestionContribution.fromJson(json);
      expect(contribution.weight, 0.5); // Should be positive
    });
  });

  group('BipolarDimensionScore Validation Tests', () {
    test('Valid BipolarDimensionScore should deserialize successfully', () {
      final json = {
        'dimensionId': 'personality_type_ei',
        'positiveScore': 30,
        'negativeScore': 20,
        'positiveMaxScore': 40,
        'negativeMaxScore': 40,
        'dominantPole': 'E',
        'normalizedScore': 60.0,
      };

      final bipolar = BipolarDimensionScore.fromJson(json);
      expect(bipolar.dimensionId, 'personality_type_ei');
      expect(bipolar.dominantPole, 'E');
    });

    test('NormalizedScore out of range should be clamped', () {
      final json = {
        'dimensionId': 'personality_type_ei',
        'positiveScore': 30,
        'negativeScore': 20,
        'positiveMaxScore': 40,
        'negativeMaxScore': 40,
        'dominantPole': 'E',
        'normalizedScore': 150.0, // Out of range
      };

      final bipolar = BipolarDimensionScore.fromJson(json);
      expect(bipolar.normalizedScore, 100.0); // Clamped
    });
  });

  group('TestQualityValidation Validation Tests', () {
    test('Valid TestQualityValidation should deserialize successfully', () {
      final json = {
        'responseVariance': 1.2,
        'neutralRate': 30.0,
        'consistencyScore': 0.85,
        'extremeRate': 20.0,
        'qualityLevel': 'success',
        'issues': [],
      };

      final quality = TestQualityValidation.fromJson(json);
      expect(quality.qualityLevel, 'success');
      expect(quality.consistencyScore, 0.85);
    });

    test('Invalid qualityLevel should log warning but not throw', () {
      final json = {
        'responseVariance': 1.2,
        'neutralRate': 30.0,
        'consistencyScore': 0.85,
        'extremeRate': 20.0,
        'qualityLevel': 'invalid_level', // Invalid but should still work
        'issues': [],
      };

      final quality = TestQualityValidation.fromJson(json);
      expect(quality.qualityLevel, 'invalid_level'); // Accepted but logged
    });
  });

  group('SummaryScore Validation Tests', () {
    test('Valid SummaryScore should deserialize successfully', () {
      final json = {
        'axisId': 'emotional_balance',
        'score': 75.5,
        'rawScore': 50.0,
        'confidence': 0.9,
        'contributions': [
          {
            'testId': 'test_1',
            'testName': 'Test One',
            'scale': 'neuroticism',
            'score': 60.0,
            'weight': 1.0,
            'direction': -1,
            'contribution': -60.0,
          }
        ],
      };

      final summary = SummaryScore.fromJson(json);
      expect(summary.axisId, 'emotional_balance');
      expect(summary.score, 75.5);
    });

    test('Score above 100 should be clamped', () {
      final json = {
        'axisId': 'test_axis',
        'score': 150.0, // Out of range
        'rawScore': 100.0,
        'confidence': 0.9,
        'contributions': [],
      };

      final summary = SummaryScore.fromJson(json);
      expect(summary.score, 100.0); // Clamped to max
    });
  });

  group('TestContribution Validation Tests', () {
    test('Valid TestContribution should deserialize successfully', () {
      final json = {
        'testId': 'test_1',
        'testName': 'Big Five',
        'scale': 'openness',
        'score': 75.0,
        'weight': 1.0,
        'direction': 1,
        'contribution': 75.0,
      };

      final contrib = TestContribution.fromJson(json);
      expect(contrib.testId, 'test_1');
      expect(contrib.direction, 1);
    });

    test('Invalid direction should default to 1', () {
      final json = {
        'testId': 'test_1',
        'testName': 'Big Five',
        'scale': 'openness',
        'score': 75.0,
        'weight': 1.0,
        'direction': 5, // Invalid (should be 1 or -1)
        'contribution': 75.0,
      };

      final contrib = TestContribution.fromJson(json);
      expect(contrib.direction, 1); // Defaulted to 1
    });
  });

  group('SummaryData Validation Tests', () {
    test('Valid SummaryData should deserialize successfully', () {
      final json = {
        'axisScores': {
          'emotional_balance': {
            'axisId': 'emotional_balance',
            'score': 75.0,
            'rawScore': 50.0,
            'confidence': 0.9,
            'contributions': [],
          }
        },
        'confidence': 2, // ConfidenceLevel.high
        'summaryText': 'You are balanced',
        'advice': ['Keep it up'],
        'strengths': ['Emotional stability'],
        'developmentAreas': ['Time management'],
        'testInfluences': [
          {
            'testId': 'test_1',
            'testName': 'Big Five',
            'questionsCount': 50,
            'totalInfluence': 100.0,
            'influencedAxes': ['emotional_balance'],
          }
        ],
        'generatedAt': '2025-01-01T12:00:00.000Z',
      };

      final data = SummaryData.fromJson(json);
      expect(data.confidence, ConfidenceLevel.high);
      expect(data.summaryText, 'You are balanced');
    });

    test('Invalid confidence enum should default to low', () {
      final json = {
        'axisScores': {
          'test_axis': {
            'axisId': 'test_axis',
            'score': 50.0,
            'rawScore': 50.0,
            'confidence': 0.5,
            'contributions': [],
          }
        },
        'confidence': 999, // Invalid enum index
        'summaryText': 'Text',
        'advice': [],
        'strengths': [],
        'developmentAreas': [],
        'testInfluences': [],
        'generatedAt': '2025-01-01T12:00:00.000Z',
      };

      final data = SummaryData.fromJson(json);
      expect(data.confidence, ConfidenceLevel.low); // Fallback
    });
  });

  group('TestInfluence Validation Tests', () {
    test('Valid TestInfluence should deserialize successfully', () {
      final json = {
        'testId': 'test_1',
        'testName': 'Big Five',
        'questionsCount': 50,
        'totalInfluence': 100.0,
        'influencedAxes': ['emotional_balance', 'sociability'],
      };

      final influence = TestInfluence.fromJson(json);
      expect(influence.testId, 'test_1');
      expect(influence.questionsCount, 50);
    });

    test('Negative questionsCount should be set to 0', () {
      final json = {
        'testId': 'test_1',
        'testName': 'Big Five',
        'questionsCount': -10, // Negative
        'totalInfluence': 100.0,
        'influencedAxes': [],
      };

      final influence = TestInfluence.fromJson(json);
      expect(influence.questionsCount, 0); // Corrected to 0
    });
  });

  group('Edge Cases and Backward Compatibility', () {
    test('Double values in int fields should be converted', () {
      final json = {
        'testId': 'test_1',
        'totalScore': 80.7, // Double instead of int
        'maxScore': 100.0, // Double instead of int
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
      };

      final result = TestResult.fromJson(json);
      expect(result.totalScore, 80); // Converted to int
      expect(result.maxScore, 100); // Converted to int
    });

    test('String numeric values should be parsed', () {
      final json = {
        'testId': 'test_1',
        'totalScore': '80', // String instead of int
        'maxScore': '100', // String instead of int
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
      };

      final result = TestResult.fromJson(json);
      expect(result.totalScore, 80);
      expect(result.maxScore, 100);
    });

    test('Corrupted nested data should be gracefully handled', () {
      final json = {
        'testId': 'test_1',
        'totalScore': 80,
        'maxScore': 100,
        'interpretation': 'Good result',
        'completedAt': '2025-01-01T12:00:00.000Z',
        'factorScores': 'invalid_data', // Should be Map but is String
      };

      // Should not throw, just set factorScores to null
      final result = TestResult.fromJson(json);
      expect(result.factorScores, isNull);
    });
  });
}
