import 'package:flutter_test/flutter_test.dart';
import 'package:psycho_app/models/test_model.dart';
import 'package:psycho_app/models/summary_model.dart';
import 'package:psycho_app/config/summary_config.dart';

void main() {
  group('SummaryCalculator Tests', () {
    test('should calculate summary with Big Five test results', () {
      // Создаём тестовые результаты Big Five
      final testResults = [
        TestResult(
          testId: 'ipip_big_five',
          totalScore: 200,
          maxScore: 250,
          interpretation: 'Test interpretation',
          completedAt: DateTime.now(),
          factorScores: {
            'extraversion': FactorScore(
              factorId: 'extraversion',
              factorName: {'ru': 'Экстраверсия', 'en': 'Extraversion'},
              score: 35,
              maxScore: 50,
              interpretation: {'ru': 'Высокая экстраверсия', 'en': 'High extraversion'},
            ),
            'emotional_stability': FactorScore(
              factorId: 'emotional_stability',
              factorName: {'ru': 'Эмоциональная стабильность', 'en': 'Emotional Stability'},
              score: 15,
              maxScore: 50,
              interpretation: {'ru': 'Низкая стабильность', 'en': 'Low stability'},
            ),
            'conscientiousness': FactorScore(
              factorId: 'conscientiousness',
              factorName: {'ru': 'Добросовестность', 'en': 'Conscientiousness'},
              score: 40,
              maxScore: 50,
              interpretation: {'ru': 'Высокая добросовестность', 'en': 'High conscientiousness'},
            ),
            'agreeableness': FactorScore(
              factorId: 'agreeableness',
              factorName: {'ru': 'Доброжелательность', 'en': 'Agreeableness'},
              score: 30,
              maxScore: 50,
              interpretation: {'ru': 'Средняя доброжелательность', 'en': 'Medium agreeableness'},
            ),
            'intellect': FactorScore(
              factorId: 'intellect',
              factorName: {'ru': 'Интеллект', 'en': 'Intellect'},
              score: 45,
              maxScore: 50,
              interpretation: {'ru': 'Высокий интеллект', 'en': 'High intellect'},
            ),
          },
        ),
      ];

      final calculator = SummaryCalculator(testResults);
      final summary = calculator.calculateSummary('ru');

      // Проверяем, что саммари создано
      expect(summary, isNotNull);
      expect(summary.axisScores, isNotEmpty);
      expect(summary.confidence, isNotNull);
      expect(summary.summaryText, isNotEmpty);
      expect(summary.advice, isNotEmpty);
      expect(summary.strengths, isNotEmpty);
      expect(summary.developmentAreas, isNotEmpty);

      // Проверяем баллы по шкалам
      expect(summary.axisScores.containsKey('emotional_balance'), true);
      expect(summary.axisScores.containsKey('self_control'), true);
      expect(summary.axisScores.containsKey('sociability'), true);
      expect(summary.axisScores.containsKey('mindfulness'), true);
      expect(summary.axisScores.containsKey('motivation'), true);
      expect(summary.axisScores.containsKey('creativity'), true);

      // Проверяем, что баллы в допустимом диапазоне
      for (final score in summary.axisScores.values) {
        expect(score.score, greaterThanOrEqualTo(0));
        expect(score.score, lessThanOrEqualTo(100));
      }
    });

    test('should handle empty test results', () {
      final calculator = SummaryCalculator([]);
      final summary = calculator.calculateSummary('ru');

      // With no test results, legacy system still creates default axis scores
      // v2 uses legacy fallback which includes 10 default axes
      expect(summary.axisScores.isNotEmpty, true); // Legacy fallback creates default axes
      expect(summary.confidence, ConfidenceLevel.low);
      expect(summary.testInfluences, isEmpty);
    });

    test('should calculate confidence based on test count', () {
      // Тест с одним результатом
      final singleResult = [
        TestResult(
          testId: 'stress_test',
          totalScore: 10,
          maxScore: 20,
          interpretation: 'Test',
          completedAt: DateTime.now(),
        ),
      ];

      final calculator1 = SummaryCalculator(singleResult);
      final summary1 = calculator1.calculateSummary('ru');
      expect(summary1.confidence, ConfidenceLevel.low);

      // Тест с двумя результатами
      final twoResults = [
        TestResult(
          testId: 'stress_test',
          totalScore: 10,
          maxScore: 20,
          interpretation: 'Test 1',
          completedAt: DateTime.now(),
        ),
        TestResult(
          testId: 'self_esteem_test',
          totalScore: 15,
          maxScore: 25,
          interpretation: 'Test 2',
          completedAt: DateTime.now(),
        ),
      ];

      final calculator2 = SummaryCalculator(twoResults);
      final summary2 = calculator2.calculateSummary('ru');
      // Confidence depends on data coverage, not just count - may be low with simple tests
      expect(summary2.confidence, isIn([ConfidenceLevel.low, ConfidenceLevel.medium]));

      // Тест с тремя результатами
      final threeResults = [
        ...twoResults,
        TestResult(
          testId: 'ipip_big_five',
          totalScore: 200,
          maxScore: 250,
          interpretation: 'Test 3',
          completedAt: DateTime.now(),
          factorScores: {
            'extraversion': FactorScore(
              factorId: 'extraversion',
              factorName: {'ru': 'Экстраверсия', 'en': 'Extraversion'},
              score: 35,
              maxScore: 50,
              interpretation: {'ru': 'Высокая', 'en': 'High'},
            ),
            'emotional_stability': FactorScore(
              factorId: 'emotional_stability',
              factorName: {'ru': 'Стабильность', 'en': 'Stability'},
              score: 25,
              maxScore: 50,
              interpretation: {'ru': 'Средняя', 'en': 'Medium'},
            ),
            'conscientiousness': FactorScore(
              factorId: 'conscientiousness',
              factorName: {'ru': 'Добросовестность', 'en': 'Conscientiousness'},
              score: 40,
              maxScore: 50,
              interpretation: {'ru': 'Высокая', 'en': 'High'},
            ),
            'agreeableness': FactorScore(
              factorId: 'agreeableness',
              factorName: {'ru': 'Доброжелательность', 'en': 'Agreeableness'},
              score: 30,
              maxScore: 50,
              interpretation: {'ru': 'Средняя', 'en': 'Medium'},
            ),
            'intellect': FactorScore(
              factorId: 'intellect',
              factorName: {'ru': 'Интеллект', 'en': 'Intellect'},
              score: 45,
              maxScore: 50,
              interpretation: {'ru': 'Высокий', 'en': 'High'},
            ),
          },
        ),
      ];

      final calculator3 = SummaryCalculator(threeResults);
      final summary3 = calculator3.calculateSummary('ru');
      // Confidence with 3 tests should be medium or high depending on coverage
      expect(summary3.confidence, isIn([ConfidenceLevel.medium, ConfidenceLevel.high]));
    });

    test('should generate localized text', () {
      final testResults = [
        TestResult(
          testId: 'stress_test',
          totalScore: 15,
          maxScore: 20,
          interpretation: 'High stress',
          completedAt: DateTime.now(),
        ),
        TestResult(
          testId: 'self_esteem_test',
          totalScore: 20,
          maxScore: 25,
          interpretation: 'High self-esteem',
          completedAt: DateTime.now(),
        ),
      ];

      final calculator = SummaryCalculator(testResults);

      // Тест для русского языка
      final summaryRu = calculator.calculateSummary('ru');
      expect(summaryRu.summaryText, isNotEmpty); // Should have Russian text
      expect(summaryRu.summaryText, contains(RegExp(r'[а-яА-Я]'))); // Contains Cyrillic characters
      if (summaryRu.advice.isNotEmpty) {
        expect(summaryRu.advice.first, contains(RegExp(r'[а-яА-Я]'))); // Russian advice
      }

      // Тест для английского языка
      final summaryEn = calculator.calculateSummary('en');
      expect(summaryEn.summaryText, contains('you')); // Должен содержать английские слова
    });

    test('should serialize and deserialize correctly', () {
      final testResults = [
        TestResult(
          testId: 'ipip_big_five',
          totalScore: 200,
          maxScore: 250,
          interpretation: 'Test interpretation',
          completedAt: DateTime.now(),
          factorScores: {
            'extraversion': FactorScore(
              factorId: 'extraversion',
              factorName: {'ru': 'Экстраверсия', 'en': 'Extraversion'},
              score: 35,
              maxScore: 50,
              interpretation: {'ru': 'Высокая экстраверсия', 'en': 'High extraversion'},
            ),
          },
        ),
      ];

      final calculator = SummaryCalculator(testResults);
      final summary = calculator.calculateSummary('ru');

      // Сериализация
      final json = summary.toJson();
      expect(json, isNotNull);
      expect(json.containsKey('axisScores'), true);
      expect(json.containsKey('confidence'), true);
      expect(json.containsKey('summaryText'), true);

      // Десериализация
      final restoredSummary = SummaryData.fromJson(json);
      expect(restoredSummary.axisScores.length, summary.axisScores.length);
      expect(restoredSummary.confidence, summary.confidence);
      expect(restoredSummary.summaryText, summary.summaryText);
      expect(restoredSummary.advice.length, summary.advice.length);
    });
  });

  group('SummaryConfig Tests', () {
    test('should have all required axes', () {
      // Legacy axes system has been expanded (was 6, now 10+)
      expect(SummaryConfig.axes.length, greaterThanOrEqualTo(6));
      expect(SummaryConfig.axes.containsKey('emotional_balance'), true);
      expect(SummaryConfig.axes.containsKey('self_control'), true);
      expect(SummaryConfig.axes.containsKey('sociability'), true);
      expect(SummaryConfig.axes.containsKey('mindfulness'), true);
      expect(SummaryConfig.axes.containsKey('motivation'), true);
      expect(SummaryConfig.axes.containsKey('creativity'), true);
    });

    test('should have test mappings', () {
      expect(SummaryConfig.testMappings.containsKey('ipip_big_five'), true);
      expect(SummaryConfig.testMappings.containsKey('fisher_temperament'), true);
      expect(SummaryConfig.testMappings.containsKey('stress_test'), true);
      expect(SummaryConfig.testMappings.containsKey('self_esteem_test'), true);
    });

    test('should have valid normalization settings', () {
      final settings = SummaryConfig.normalizationSettings;
      expect(settings.minScore, 0);
      expect(settings.maxScore, 100);
      expect(settings.defaultScore, 50);
    });

    test('should have confidence thresholds', () {
      final thresholds = SummaryConfig.confidenceThresholds;
      expect(thresholds.high, 0.8);
      expect(thresholds.medium, 0.5);
      expect(thresholds.low, 0.3);
    });
  });

  group('ConfidenceLevel Tests', () {
    test('should provide localized names', () {
      expect(ConfidenceLevel.high.getLocalizedName('ru'), 'Высокая');
      expect(ConfidenceLevel.high.getLocalizedName('en'), 'High');
      expect(ConfidenceLevel.medium.getLocalizedName('ru'), 'Средняя');
      expect(ConfidenceLevel.medium.getLocalizedName('en'), 'Medium');
      expect(ConfidenceLevel.low.getLocalizedName('ru'), 'Низкая');
      expect(ConfidenceLevel.low.getLocalizedName('en'), 'Low');
    });

    test('should provide localized descriptions', () {
      // Check that descriptions exist and contain Russian text
      expect(ConfidenceLevel.high.getDescription('ru'), isNotEmpty);
      expect(ConfidenceLevel.high.getDescription('ru'), contains(RegExp(r'[а-яА-Я]')));
      expect(ConfidenceLevel.medium.getDescription('ru'), isNotEmpty);
      expect(ConfidenceLevel.medium.getDescription('ru'), contains(RegExp(r'[а-яА-Я]')));
      expect(ConfidenceLevel.low.getDescription('ru'), isNotEmpty);
      expect(ConfidenceLevel.low.getDescription('ru'), contains(RegExp(r'[а-яА-Я]')));
    });
  });
}
