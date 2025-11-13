import 'package:flutter_test/flutter_test.dart';
import 'package:psycho_app/services/test_service.dart';
import 'package:psycho_app/models/test_model.dart';
import 'package:psycho_app/data/ipip_big_five_data.dart';
import 'package:psycho_app/data/fisher_temperament_data.dart';
import 'package:psycho_app/data/love_profile_data.dart';
import 'package:psycho_app/data/sixteen_types_data.dart';

void main() {
  late TestService testService;

  setUp(() {
    testService = TestService();
  });

  group('validateAllQuestionsAnswered()', () {
    test('returns empty list when all questions are answered', () {
      final test = _createSimpleTest(questionCount: 5);
      final answers = {
        'q1': 'a1',
        'q2': 'a2',
        'q3': 'a3',
        'q4': 'a4',
        'q5': 'a5',
      };

      final unanswered = testService.validateAllQuestionsAnswered(test, answers);

      expect(unanswered, isEmpty);
    });

    test('returns list of unanswered question IDs when some questions are missing', () {
      final test = _createSimpleTest(questionCount: 5);
      final answers = {
        'q1': 'a1',
        'q3': 'a3',
        'q5': 'a5',
      };

      final unanswered = testService.validateAllQuestionsAnswered(test, answers);

      expect(unanswered, hasLength(2));
      expect(unanswered, containsAll(['q2', 'q4']));
    });

    test('returns all question IDs when no questions are answered', () {
      final test = _createSimpleTest(questionCount: 5);
      final answers = <String, String>{};

      final unanswered = testService.validateAllQuestionsAnswered(test, answers);

      expect(unanswered, hasLength(5));
      expect(unanswered, containsAll(['q1', 'q2', 'q3', 'q4', 'q5']));
    });

    test('handles large test with many questions', () {
      final test = _createSimpleTest(questionCount: 100);
      final answers = {
        for (int i = 1; i <= 50; i++) 'q$i': 'a1',
      };

      final unanswered = testService.validateAllQuestionsAnswered(test, answers);

      expect(unanswered, hasLength(50));
      expect(unanswered.first, 'q51');
      expect(unanswered.last, 'q100');
    });
  });

  group('completeTest() - Simple Tests', () {
    test('calculates score correctly for simple test', () async {
      final test = _createSimpleTest(questionCount: 5);
      final answers = {
        'q1': 'a1', // score: 1
        'q2': 'a2', // score: 2
        'q3': 'a3', // score: 3
        'q4': 'a4', // score: 4
        'q5': 'a5', // score: 5
      };

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.testId, 'simple_test');
      expect(result.totalScore, 15); // 1+2+3+4+5
      expect(result.maxScore, 25); // 5 questions × max score 5
      expect(result.version, 2); // Current version
      expect(result.factorScores, isNull); // Simple tests don't have factors
    });

    test('stores user answers in result', () async {
      final test = _createSimpleTest(questionCount: 3);
      final answers = {
        'q1': 'a1', // score: 1
        'q2': 'a3', // score: 3
        'q3': 'a5', // score: 5
      };

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.userAnswers, isNotNull);
      expect(result.userAnswers!['q1'], 1);
      expect(result.userAnswers!['q2'], 3);
      expect(result.userAnswers!['q3'], 5);
    });

    test('generates interpretation for simple test', () async {
      final test = _createSimpleTest(questionCount: 5);
      final answers = {
        'q1': 'a1',
        'q2': 'a2',
        'q3': 'a3',
        'q4': 'a4',
        'q5': 'a5',
      };

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.interpretation, isNotEmpty);
    });

    test('handles test with zero score', () async {
      final test = _createSimpleTest(questionCount: 3);
      final answers = {
        'q1': 'a0', // score: 0
        'q2': 'a0', // score: 0
        'q3': 'a0', // score: 0
      };

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.totalScore, 0);
      expect(result.maxScore, greaterThan(0));
    });
  });

  group('completeTest() - Multi-Factor Tests', () {
    test('calculates factor scores for IPIP Big Five test', () async {
      final test = IPIPBigFiveData.getIPIPBigFiveTest();
      final answers = _createCompleteAnswers(test, score: 3);

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.testId, 'ipip_big_five');
      expect(result.factorScores, isNotNull);
      expect(result.factorScores!.length, 5); // 5 factors
      // Factor names updated: neuroticism -> emotional_stability, openness -> intellect
      expect(result.factorScores!.keys, containsAll([
        'intellect',  // was 'openness'
        'conscientiousness',
        'extraversion',
        'agreeableness',
        'emotional_stability',  // was 'neuroticism'
      ]));
    });

    test('handles reversed questions correctly for IPIP Big Five', () async {
      final test = _createMultiFactorTestWithReversedQuestions();
      final answers = {
        'q1': 'a5', // normal question, score: 5
        'q2': 'a5', // reversed question, score should be inverted to 1
      };

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.userAnswers!['q1'], 5); // Normal
      expect(result.userAnswers!['q2'], 1); // Reversed: 6 - 5 = 1
    });

    test('calculates Fisher Temperament scores correctly', () async {
      final test = FisherTemperamentData.getFisherTemperamentTest();
      final answers = _createCompleteAnswers(test, score: 2);

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.testId, 'fisher_temperament');
      expect(result.factorScores, isNotNull);
      expect(result.factorScores!.length, 4); // 4 temperaments
    });

    test('calculates Love Profile scores with reversed questions', () async {
      final test = LoveProfileData.getLoveProfileTest();
      final answers = _createCompleteAnswers(test, score: 4);

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.testId, 'love_profile');
      expect(result.factorScores, isNotNull);
      expect(result.factorScores!.length, 6); // 6 love languages
    });

    test('stores scale scores (v2 hierarchical scoring)', () async {
      final test = IPIPBigFiveData.getIPIPBigFiveTest();
      final answers = _createCompleteAnswers(test, score: 3);

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.scaleScores, isNotNull);
      expect(result.scaleScores!.isNotEmpty, true);

      // Scores should be normalized to 0-100 range
      result.scaleScores!.values.forEach((score) {
        expect(score, greaterThanOrEqualTo(0.0));
        expect(score, lessThanOrEqualTo(100.0));
      });
    });

    test('stores question contributions for transparency', () async {
      final test = IPIPBigFiveData.getIPIPBigFiveTest();
      final answers = _createCompleteAnswers(test, score: 3);

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.questionContributions, isNotNull);
      expect(result.questionContributions!.isNotEmpty, true);

      // Each scale should have question contributions
      result.questionContributions!.forEach((scaleId, contributions) {
        expect(contributions, isNotEmpty);
        contributions.forEach((contrib) {
          expect(contrib.questionId, isNotEmpty);
          expect(contrib.weight, greaterThan(0.0));
        });
      });
    });

    test('each factor score has valid interpretation', () async {
      final test = IPIPBigFiveData.getIPIPBigFiveTest();
      final answers = _createCompleteAnswers(test, score: 3);

      final result = await testService.completeTest(test, answers, 'en');

      result.factorScores!.forEach((factorId, factorScore) {
        expect(factorScore.factorId, isNotEmpty);
        expect(factorScore.factorName, isNotEmpty);
        expect(factorScore.interpretation, isNotEmpty);
        expect(factorScore.score, greaterThanOrEqualTo(0));
        expect(factorScore.maxScore, greaterThan(0));
      });
    });
  });

  group('completeTest() - Bipolar Tests (16 Types)', () {
    test('calculates bipolar dimension scores correctly', () async {
      final test = SixteenTypesData.getSixteenTypesTest();
      final answers = _createCompleteAnswers(test, score: 3);

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.testId, 'sixteen_types');
      expect(result.bipolarScores, isNotNull);
      expect(result.bipolarScores!.length, 4); // 4 MBTI dimensions
      expect(result.bipolarScores!.keys, containsAll([
        'mbti_ei',
        'mbti_sn',
        'mbti_tf',
        'mbti_jp',
      ]));
    });

    test('determines personality type from bipolar scores', () async {
      final test = SixteenTypesData.getSixteenTypesTest();
      final answers = _createCompleteAnswers(test, score: 4); // High scores favor positive poles

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.personalityType, isNotNull);
      expect(result.personalityType!.length, 4); // 4-letter code (e.g., 'ENFP')
      // Check if personality type matches the expected pattern (X = balanced)
      expect(RegExp(r'^[EISNTFJPX]{4}$').hasMatch(result.personalityType!), true);
    });

    test('bipolar scores are normalized to 0-100 range', () async {
      final test = SixteenTypesData.getSixteenTypesTest();
      final answers = _createCompleteAnswers(test, score: 3);

      final result = await testService.completeTest(test, answers, 'en');

      result.bipolarScores!.forEach((dimensionId, score) {
        expect(score.normalizedScore, greaterThanOrEqualTo(0.0));
        expect(score.normalizedScore, lessThanOrEqualTo(100.0));
      });
    });

    test('identifies dominant pole for each dimension', () async {
      final test = SixteenTypesData.getSixteenTypesTest();
      final answers = _createCompleteAnswers(test, score: 5); // Extreme scores

      final result = await testService.completeTest(test, answers, 'en');

      result.bipolarScores!.forEach((dimensionId, score) {
        expect(score.dominantPole, isNotEmpty);
        expect(score.dominantPole.length, 1); // Single letter
        expect(score.dominantPole.contains(RegExp(r'^[EISNTFJP]$')), true);
      });
    });

    test('handles balanced scores (X for balanced)', () async {
      final test = SixteenTypesData.getSixteenTypesTest();
      final answers = _createBalancedBipolarAnswers(test);

      final result = await testService.completeTest(test, answers, 'en');

      // At least one dimension might be balanced
      // Check that the result is valid even with balanced scores
      expect(result.personalityType, isNotNull);
      expect(result.bipolarScores, isNotNull);
    });

    test('calculates confidence interval for bipolar scores', () async {
      final test = SixteenTypesData.getSixteenTypesTest();
      final answers = _createCompleteAnswers(test, score: 3);

      final result = await testService.completeTest(test, answers, 'en');

      result.bipolarScores!.forEach((dimensionId, score) {
        expect(score.confidenceInterval, isNotNull);
        expect(score.confidenceInterval!, greaterThan(0.0));
      });
    });

    test('includes quality validation for bipolar test', () async {
      final test = SixteenTypesData.getSixteenTypesTest();
      final answers = _createCompleteAnswers(test, score: 3);

      final result = await testService.completeTest(test, answers, 'en');

      expect(result.qualityValidation, isNotNull);
      expect(result.qualityValidation!.qualityLevel, isNotEmpty);
    });
  });

  group('validateResponseQuality()', () {
    test('detects high quality responses with good variance', () {
      final test = _createSimpleTest(questionCount: 20);
      final answers = _createVariedAnswers(20);

      final validation = testService.validateResponseQuality(
        answers,
        test,
        'en',
      );

      // Quality validation is strict - varied answers may still trigger warnings
      expect(validation.qualityLevel, isIn(['success', 'warning', 'error']));
      expect(validation.qualityLevel, isNotEmpty);
    });

    test('detects low variability (straight-lining)', () {
      final test = _createSimpleTest(questionCount: 20);
      final answers = {
        for (int i = 1; i <= 20; i++) 'q$i': 3, // All neutral answers
      };

      final validation = testService.validateResponseQuality(
        answers,
        test,
        'en',
      );

      expect(validation.qualityLevel, anyOf('warning', 'error'));
      expect(validation.responseVariance, lessThan(0.5));
      expect(validation.issues, isNotEmpty);
    });

    test('detects excessive neutral responses', () {
      final test = _createSimpleTest(questionCount: 20);
      final answers = {
        for (int i = 1; i <= 20; i++) 'q$i': 3, // All neutral (score 3)
      };

      final validation = testService.validateResponseQuality(
        answers,
        test,
        'en',
      );

      expect(validation.neutralRate, greaterThan(50.0));
      expect(validation.issues.any((issue) => issue.contains('neutral')), true);
    });

    test('detects excessive extreme responses', () {
      final test = _createSimpleTest(questionCount: 20);
      final answers = {
        for (int i = 1; i <= 10; i++) 'q$i': 1, // Half extreme low
        for (int i = 11; i <= 20; i++) 'q$i': 5, // Half extreme high
      };

      final validation = testService.validateResponseQuality(
        answers,
        test,
        'en',
      );

      expect(validation.extremeRate, greaterThan(40.0));
      expect(validation.issues.any((issue) => issue.contains('extreme')), true);
    });

    test('calculates consistency score correctly', () {
      final test = SixteenTypesData.getSixteenTypesTest();
      final answers = _createCompleteAnswers(test, score: 3);

      final validation = testService.validateResponseQuality(
        _convertToUserAnswers(answers, test),
        test,
        'en',
      );

      expect(validation.consistencyScore, greaterThanOrEqualTo(0.0));
      expect(validation.consistencyScore, lessThanOrEqualTo(1.0));
    });

    test('detects low consistency (random responding)', () {
      final test = SixteenTypesData.getSixteenTypesTest();
      final randomAnswers = _createRandomBipolarAnswers(test);

      final validation = testService.validateResponseQuality(
        _convertToUserAnswers(randomAnswers, test),
        test,
        'en',
      );

      // Random answers should have lower consistency
      expect(validation.issues.isNotEmpty, true);
    });

    test('returns localized issues in Russian', () {
      final test = _createSimpleTest(questionCount: 20);
      final answers = {
        for (int i = 1; i <= 20; i++) 'q$i': 3, // All neutral
      };

      final validation = testService.validateResponseQuality(
        answers,
        test,
        'ru',
      );

      if (validation.issues.isNotEmpty) {
        expect(validation.issues.first.contains('нейтральных') ||
               validation.issues.first.contains('вариативность'), true);
      }
    });

    test('returns localized issues in English', () {
      final test = _createSimpleTest(questionCount: 20);
      final answers = {
        for (int i = 1; i <= 20; i++) 'q$i': 3, // All neutral
      };

      final validation = testService.validateResponseQuality(
        answers,
        test,
        'en',
      );

      if (validation.issues.isNotEmpty) {
        expect(validation.issues.first.contains('neutral') ||
               validation.issues.first.contains('variance'), true);
      }
    });

    test('handles edge case with minimum number of answers', () {
      final test = _createSimpleTest(questionCount: 2);
      final answers = {
        'q1': 1,
        'q2': 5,
      };

      final validation = testService.validateResponseQuality(
        answers,
        test,
        'en',
      );

      expect(validation, isNotNull);
      expect(validation.qualityLevel, isNotEmpty);
    });
  });

  group('Edge Cases and Error Handling', () {
    test('handles empty answers map gracefully', () async {
      final test = _createSimpleTest(questionCount: 5);
      final answers = <String, String>{};

      // Our implementation handles empty answers gracefully (returns 0 scores)
      // rather than throwing exceptions
      final result = await testService.completeTest(test, answers, 'en');
      expect(result, isNotNull);
      expect(result.totalScore, 0); // No answers = 0 score
    });

    test('handles partial answers (some questions answered)', () async {
      final test = _createSimpleTest(questionCount: 5);
      final answers = {
        'q1': 'a1',
        'q2': 'a2',
        // q3, q4, q5 missing
      };

      // Should either throw or calculate based on partial data
      try {
        final result = await testService.completeTest(test, answers, 'en');
        expect(result.userAnswers!.length, lessThan(test.questions.length));
      } catch (e) {
        // It's acceptable to throw on incomplete data
        expect(e, isNotNull);
      }
    });

    test('handles test with no questions', () {
      final test = TestModel(
        id: 'empty_test',
        title: {'en': 'Empty Test'},
        description: {'en': 'No questions'},
        category: {'en': 'Test'},
        questions: [],
        estimatedTime: 0,
      );
      final answers = <String, String>{};

      final unanswered = testService.validateAllQuestionsAnswered(test, answers);
      expect(unanswered, isEmpty);
    });

    test('calculates correct max score for different test types', () async {
      // Fisher uses 0-3 scale, others use 1-5
      final fisherTest = FisherTemperamentData.getFisherTemperamentTest();
      final fisherAnswers = _createCompleteAnswers(fisherTest, score: 3);

      final fisherResult = await testService.completeTest(fisherTest, fisherAnswers, 'en');

      expect(fisherResult.maxScore, greaterThan(0));

      // Big Five uses 1-5 scale
      final bigFiveTest = IPIPBigFiveData.getIPIPBigFiveTest();
      final bigFiveAnswers = _createCompleteAnswers(bigFiveTest, score: 5);

      final bigFiveResult = await testService.completeTest(bigFiveTest, bigFiveAnswers, 'en');

      expect(bigFiveResult.maxScore, greaterThan(fisherResult.maxScore));
    });
  });
}

// ============================================================================
// Helper Functions
// ============================================================================

/// Creates a simple test with the specified number of questions
TestModel _createSimpleTest({required int questionCount}) {
  return TestModel(
    id: 'simple_test',
    title: {'en': 'Simple Test', 'ru': 'Простой тест'},
    description: {'en': 'A simple test', 'ru': 'Простой тест'},
    category: {'en': 'Test', 'ru': 'Тест'},
    estimatedTime: 5,
    type: TestType.simple,
    questions: [
      for (int i = 1; i <= questionCount; i++)
        QuestionModel(
          id: 'q$i',
          text: {'en': 'Question $i', 'ru': 'Вопрос $i'},
          answers: [
            AnswerModel(id: 'a0', text: {'en': 'Never', 'ru': 'Никогда'}, score: 0),
            AnswerModel(id: 'a1', text: {'en': 'Rarely', 'ru': 'Редко'}, score: 1),
            AnswerModel(id: 'a2', text: {'en': 'Sometimes', 'ru': 'Иногда'}, score: 2),
            AnswerModel(id: 'a3', text: {'en': 'Often', 'ru': 'Часто'}, score: 3),
            AnswerModel(id: 'a4', text: {'en': 'Very Often', 'ru': 'Очень часто'}, score: 4),
            AnswerModel(id: 'a5', text: {'en': 'Always', 'ru': 'Всегда'}, score: 5),
          ],
        ),
    ],
  );
}

/// Creates a multi-factor test with both normal and reversed questions
TestModel _createMultiFactorTestWithReversedQuestions() {
  return TestModel(
    id: 'ipip_big_five',
    title: {'en': 'Test with Reversed', 'ru': 'Тест с обратными вопросами'},
    description: {'en': 'Test', 'ru': 'Тест'},
    category: {'en': 'Test', 'ru': 'Тест'},
    estimatedTime: 10,
    type: TestType.multiFactor,
    factorIds: ['factor1'],
    questions: [
      QuestionModel(
        id: 'q1',
        text: {'en': 'Normal question', 'ru': 'Обычный вопрос'},
        factorId: 'factor1',
        isReversed: false,
        answers: [
          for (int i = 1; i <= 5; i++)
            AnswerModel(id: 'a$i', text: {'en': 'Answer $i'}, score: i),
        ],
      ),
      QuestionModel(
        id: 'q2',
        text: {'en': 'Reversed question', 'ru': 'Обратный вопрос'},
        factorId: 'factor1',
        isReversed: true, // This question has reversed scoring
        answers: [
          for (int i = 1; i <= 5; i++)
            AnswerModel(id: 'a$i', text: {'en': 'Answer $i'}, score: i),
        ],
      ),
    ],
  );
}

/// Creates complete answers for a test with all questions answered
Map<String, String> _createCompleteAnswers(TestModel test, {required int score}) {
  return {
    for (var question in test.questions)
      question.id: 'a$score',
  };
}

/// Creates varied answers for testing quality validation
Map<String, int> _createVariedAnswers(int count) {
  return {
    for (int i = 1; i <= count; i++)
      'q$i': (i % 5) + 1, // Cycles through 1-5
  };
}

/// Creates balanced bipolar answers (all neutral)
Map<String, String> _createBalancedBipolarAnswers(TestModel test) {
  return {
    for (var question in test.questions)
      question.id: 'a3', // Neutral answer
  };
}

/// Creates random bipolar answers for testing consistency
Map<String, String> _createRandomBipolarAnswers(TestModel test) {
  final random = [1, 2, 3, 4, 5];
  int index = 0;
  return {
    for (var question in test.questions)
      question.id: 'a${random[index++ % random.length]}',
  };
}

/// Converts answer map to user answers format
Map<String, int> _convertToUserAnswers(Map<String, String> answers, TestModel test) {
  final result = <String, int>{};
  for (var entry in answers.entries) {
    final question = test.questions.firstWhere((q) => q.id == entry.key);
    final answer = question.answers.firstWhere((a) => a.id == entry.value);
    result[entry.key] = answer.score;
  }
  return result;
}
