import 'package:flutter_test/flutter_test.dart';
import 'package:psycho_app/services/test_service.dart';
import 'package:psycho_app/models/test_model.dart';
import 'package:psycho_app/config/summary_config.dart';

/// Тесты для проверки системы инверсии шкал (axisDirections)
///
/// Проверяют, что негативные шкалы (тревожность, депрессия, стресс)
/// корректно инвертируются при расчете баллов
void main() {
  late TestService testService;

  setUp(() {
    testService = TestService();
  });

  group('axisDirections - Базовая логика инверсии', () {
    test('QuestionWeight.getDirection() возвращает 1 по умолчанию', () {
      const weight = QuestionWeight(
        testId: 'test',
        questionId: 'q1',
        axisWeights: {
          'anxiety': 1.0,
        },
      );

      expect(weight.getDirection('anxiety'), equals(1));
      expect(weight.getDirection('nonexistent'), equals(1));
    });

    test('QuestionWeight.getDirection() возвращает -1 для инвертированных осей', () {
      const weight = QuestionWeight(
        testId: 'test',
        questionId: 'q1',
        axisWeights: {
          'anxiety': 1.0,
          'stress_tolerance': 1.0,
        },
        axisDirections: {
          'stress_tolerance': -1,
        },
      );

      expect(weight.getDirection('anxiety'), equals(1));
      expect(weight.getDirection('stress_tolerance'), equals(-1));
    });
  });

  group('axisDirections - ScaleAccumulator инверсия', () {
    test('Прямое направление (direction=1): высокий балл → высокая шкала', () {
      final accumulator = ScaleScoreAccumulator();

      // Вопрос с диапазоном 1-5, ответ = 5 (максимум)
      accumulator.addScore(
        'extraversion',
        5.0,           // answerScore
        1.0,           // minAnswerScore
        5.0,           // maxAnswerScore
        1.0,           // weight
        _createQuestion('q1'),
        5,             // selectedAnswerScore
        1,             // direction = 1 (прямое)
      );

      final scores = accumulator.getNormalizedScores();

      // При прямом направлении: (5-1)/(5-1) = 1.0, затем 1.0 * 100 = 100
      expect(scores['extraversion'], closeTo(100.0, 0.1));
    });

    test('Инвертированное направление (direction=-1): высокий балл → низкая шкала', () {
      final accumulator = ScaleScoreAccumulator();

      // Вопрос "Как часто вы чувствуете тревогу?"
      // Ответ = 5 (очень часто) → должна быть НИЗКАЯ тревожность после инверсии
      accumulator.addScore(
        'anxiety',
        5.0,           // answerScore = 5 (очень часто тревожусь)
        1.0,           // minAnswerScore
        5.0,           // maxAnswerScore
        1.0,           // weight
        _createQuestion('q1'),
        5,             // selectedAnswerScore
        -1,            // direction = -1 (инверсия)
      );

      final scores = accumulator.getNormalizedScores();

      // При инверсии: нормализация (5-1)/(5-1) = 1.0, затем инверсия 1-1.0 = 0.0, затем 0.0 * 100 = 0
      // Ожидаем НИЗКИЙ балл тревожности
      expect(scores['anxiety'], closeTo(0.0, 0.1));
    });

    test('Инвертированное направление (direction=-1): низкий балл → высокая шкала', () {
      final accumulator = ScaleScoreAccumulator();

      // Вопрос "Как часто вы чувствуете тревогу?"
      // Ответ = 1 (никогда) → должна быть ВЫСОКАЯ тревожность после инверсии (это неправильно!)
      // НЕТ, ОШИБКА В ЛОГИКЕ! При ответе "никогда не тревожусь" тревожность должна быть НИЗКОЙ!

      // ПРАВИЛЬНАЯ ЛОГИКА:
      // Вопрос "Вы испытываете стресс?" с ответами 1=никогда, 5=постоянно
      // Ответ = 1 (никогда) → нормализация (1-1)/(5-1) = 0.0
      // Инверсия: 1 - 0.0 = 1.0 → 100% стресса (НЕПРАВИЛЬНО!)

      // Подождите, я неправильно понял логику. Давайте подумаем заново:
      //
      // Если вопрос: "Насколько хорошо вы справляетесь со стрессом?"
      // 1 = плохо, 5 = отлично
      // И шкала stress_tolerance (стресс-толерантность)
      //
      // Ответ 5 (отлично справляюсь) → нормализация (5-1)/(5-1) = 1.0
      // БЕЗ инверсии (direction=1): 1.0 * 100 = 100% стресс-толерантности ✓
      //
      // Но если вопрос: "Как часто вы испытываете стресс?"
      // 1 = никогда, 5 = постоянно
      // И шкала stress_tolerance
      //
      // Ответ 5 (постоянно стресс) → нормализация (5-1)/(5-1) = 1.0
      // С инверсией (direction=-1): 1 - 1.0 = 0.0 → 0% стресс-толерантности ✓

      accumulator.addScore(
        'stress_tolerance',
        1.0,           // answerScore = 1 (никогда не испытываю стресс)
        1.0,           // minAnswerScore
        5.0,           // maxAnswerScore
        1.0,           // weight
        _createQuestion('q1'),
        1,             // selectedAnswerScore
        -1,            // direction = -1 (инверсия)
      );

      final scores = accumulator.getNormalizedScores();

      // При инверсии: нормализация (1-1)/(5-1) = 0.0, затем инверсия 1-0.0 = 1.0, затем 1.0 * 100 = 100
      // Ожидаем ВЫСОКИЙ балл стресс-толерантности (100%)
      expect(scores['stress_tolerance'], closeTo(100.0, 0.1));
    });
  });

  group('axisDirections - Стресс тест (реальные данные)', () {
    test('Стресс Q1: "Как часто вы чувствуете напряжение?" - ответ "никогда"', () {
      final questionWeight = QuestionWeightsConfig.getWeights('stress_test', 'q1');
      expect(questionWeight, isNotNull);

      final accumulator = ScaleScoreAccumulator();

      // Вопрос: "Как часто вы чувствуете напряжение?"
      // Ответ: 1 = никогда (НЕТ напряжения)
      // Шкалы с инверсией: stress_tolerance, composure, calmness

      questionWeight!.axisWeights.forEach((scaleId, weight) {
        final direction = questionWeight.getDirection(scaleId);
        accumulator.addScore(
          scaleId,
          1.0,  // ответ = 1 (никогда не чувствую напряжение)
          1.0,  // min = 1
          5.0,  // max = 5
          weight,
          _createQuestion('q1'),
          1,
          direction,
        );
      });

      final scores = accumulator.getNormalizedScores();

      // Ожидания:
      // stress_tolerance (инверсия): низкое напряжение → ВЫСОКАЯ толерантность = 100%
      expect(scores['stress_tolerance'], closeTo(100.0, 0.1),
          reason: 'Низкое напряжение должно давать ВЫСОКУЮ стресс-толерантность');

      // anxiety (прямое): низкое напряжение → НИЗКАЯ тревожность = 0%
      expect(scores['anxiety'], closeTo(0.0, 0.1),
          reason: 'Низкое напряжение должно давать НИЗКУЮ тревожность');

      // composure (инверсия): низкое напряжение → ВЫСОКОЕ спокойствие = 100%
      expect(scores['composure'], closeTo(100.0, 0.1),
          reason: 'Низкое напряжение должно давать ВЫСОКОЕ спокойствие');
    });

    test('Стресс Q1: "Как часто вы чувствуете напряжение?" - ответ "постоянно"', () {
      final questionWeight = QuestionWeightsConfig.getWeights('stress_test', 'q1');
      expect(questionWeight, isNotNull);

      final accumulator = ScaleScoreAccumulator();

      questionWeight!.axisWeights.forEach((scaleId, weight) {
        final direction = questionWeight.getDirection(scaleId);
        accumulator.addScore(
          scaleId,
          5.0,  // ответ = 5 (постоянно чувствую напряжение)
          1.0,
          5.0,
          weight,
          _createQuestion('q1'),
          5,
          direction,
        );
      });

      final scores = accumulator.getNormalizedScores();

      // Ожидания:
      // stress_tolerance (инверсия): высокое напряжение → НИЗКАЯ толерантность = 0%
      expect(scores['stress_tolerance'], closeTo(0.0, 0.1),
          reason: 'Высокое напряжение должно давать НИЗКУЮ стресс-толерантность');

      // anxiety (прямое): высокое напряжение → ВЫСОКАЯ тревожность = 100%
      expect(scores['anxiety'], closeTo(100.0, 0.1),
          reason: 'Высокое напряжение должно давать ВЫСОКУЮ тревожность');

      // composure (инверсия): высокое напряжение → НИЗКОЕ спокойствие = 0%
      expect(scores['composure'], closeTo(0.0, 0.1),
          reason: 'Высокое напряжение должно давать НИЗКОЕ спокойствие');
    });
  });

  group('axisDirections - Self-Esteem тест (реальные данные)', () {
    test('Self-Esteem Q2: "Насколько вы уверены в социальных ситуациях?" - ответ "очень уверен"', () {
      final questionWeight = QuestionWeightsConfig.getWeights('self_esteem_test', 'q2');
      expect(questionWeight, isNotNull);

      final accumulator = ScaleScoreAccumulator();

      questionWeight!.axisWeights.forEach((scaleId, weight) {
        final direction = questionWeight.getDirection(scaleId);
        accumulator.addScore(
          scaleId,
          5.0,  // ответ = 5 (очень уверен)
          1.0,
          5.0,
          weight,
          _createQuestion('q2'),
          5,
          direction,
        );
      });

      final scores = accumulator.getNormalizedScores();

      // Ожидания:
      // social_confidence (прямое): высокая уверенность → ВЫСОКАЯ социальная уверенность = 100%
      expect(scores['social_confidence'], closeTo(100.0, 0.1));

      // self_consciousness (инверсия): высокая уверенность → НИЗКАЯ застенчивость = 0%
      expect(scores['self_consciousness'], closeTo(0.0, 0.1),
          reason: 'Высокая уверенность должна давать НИЗКУЮ застенчивость');

      // anxiety (инверсия): высокая уверенность → НИЗКАЯ тревожность = 0%
      expect(scores['anxiety'], closeTo(0.0, 0.1),
          reason: 'Высокая социальная уверенность должна давать НИЗКУЮ тревожность');
    });
  });

  group('axisDirections - IPIP Big Five (реальные данные)', () {
    test('IPIP Q4: "Я легко испытываю стресс" - ответ "совершенно не согласен"', () {
      final questionWeight = QuestionWeightsConfig.getWeights('ipip_big_five', 'q4');
      expect(questionWeight, isNotNull);

      final accumulator = ScaleScoreAccumulator();

      questionWeight!.axisWeights.forEach((scaleId, weight) {
        final direction = questionWeight.getDirection(scaleId);
        accumulator.addScore(
          scaleId,
          1.0,  // ответ = 1 (совершенно не согласен - НЕ испытываю стресс)
          1.0,
          5.0,
          weight,
          _createQuestion('q4'),
          1,
          direction,
        );
      });

      final scores = accumulator.getNormalizedScores();

      // Ожидания:
      // stress_tolerance (инверсия): не испытываю стресс → ВЫСОКАЯ толерантность
      expect(scores['stress_tolerance'], closeTo(100.0, 0.1),
          reason: 'Отсутствие стресса должно давать ВЫСОКУЮ стресс-толерантность');

      // anxiety (прямое): не испытываю стресс → НИЗКАЯ тревожность
      expect(scores['anxiety'], closeTo(0.0, 0.1),
          reason: 'Отсутствие стресса должно давать НИЗКУЮ тревожность');
    });

    test('IPIP Q4: "Я легко испытываю стресс" - ответ "полностью согласен"', () {
      final questionWeight = QuestionWeightsConfig.getWeights('ipip_big_five', 'q4');
      expect(questionWeight, isNotNull);

      final accumulator = ScaleScoreAccumulator();

      questionWeight!.axisWeights.forEach((scaleId, weight) {
        final direction = questionWeight.getDirection(scaleId);
        accumulator.addScore(
          scaleId,
          5.0,  // ответ = 5 (полностью согласен - ЛЕГКО испытываю стресс)
          1.0,
          5.0,
          weight,
          _createQuestion('q4'),
          5,
          direction,
        );
      });

      final scores = accumulator.getNormalizedScores();

      // Ожидания:
      // stress_tolerance (инверсия): легко испытываю стресс → НИЗКАЯ толерантность
      expect(scores['stress_tolerance'], closeTo(0.0, 0.1),
          reason: 'Легкость возникновения стресса должна давать НИЗКУЮ стресс-толерантность');

      // anxiety (прямое): легко испытываю стресс → ВЫСОКАЯ тревожность
      expect(scores['anxiety'], closeTo(100.0, 0.1),
          reason: 'Легкость возникновения стресса должна давать ВЫСОКУЮ тревожность');
    });
  });

  group('axisDirections - Love Profile (реальные данные)', () {
    test('Love Profile IU_16: "Я избегаю разговоров о чувствах" - ответ "полностью согласен"', () {
      final questionWeight = QuestionWeightsConfig.getWeights('love_profile', 'IU_16');
      expect(questionWeight, isNotNull);

      final accumulator = ScaleScoreAccumulator();

      questionWeight!.axisWeights.forEach((scaleId, weight) {
        final direction = questionWeight.getDirection(scaleId);
        accumulator.addScore(
          scaleId,
          5.0,  // ответ = 5 (полностью согласен - ИЗБЕГАЮ разговоров)
          1.0,
          5.0,
          weight,
          _createQuestion('IU_16'),
          5,
          direction,
        );
      });

      final scores = accumulator.getNormalizedScores();

      // Ожидания:
      // emotional_openness (инверсия): избегаю разговоров → НИЗКАЯ эмоциональная открытость
      expect(scores['emotional_openness'], closeTo(0.0, 0.1),
          reason: 'Избегание разговоров о чувствах должно давать НИЗКУЮ эмоциональную открытость');
    });

    test('Love Profile DR_46: "Любая задержка вызывает бурю подозрений" - ответ "совершенно не согласен"', () {
      final questionWeight = QuestionWeightsConfig.getWeights('love_profile', 'DR_46');
      expect(questionWeight, isNotNull);

      final accumulator = ScaleScoreAccumulator();

      questionWeight!.axisWeights.forEach((scaleId, weight) {
        final direction = questionWeight.getDirection(scaleId);
        accumulator.addScore(
          scaleId,
          1.0,  // ответ = 1 (совершенно не согласен - НЕТ подозрений)
          1.0,
          5.0,
          weight,
          _createQuestion('DR_46'),
          1,
          direction,
        );
      });

      final scores = accumulator.getNormalizedScores();

      // Ожидания:
      // trust_in_relationships (инверсия): нет подозрений → ВЫСОКОЕ доверие
      expect(scores['trust_in_relationships'], closeTo(100.0, 0.1),
          reason: 'Отсутствие подозрений должно давать ВЫСОКОЕ доверие');
    });
  });

  group('axisDirections - Множественные вопросы одного теста', () {
    test('Стресс тест: все вопросы с ответами "никогда" → низкий стресс, высокая толерантность', () {
      final accumulator = ScaleScoreAccumulator();

      // Пройдем все 5 вопросов стресс-теста с ответами "никогда" (1)
      for (int i = 1; i <= 5; i++) {
        final questionWeight = QuestionWeightsConfig.getWeights('stress_test', 'q$i');
        if (questionWeight != null) {
          questionWeight.axisWeights.forEach((scaleId, weight) {
            final direction = questionWeight.getDirection(scaleId);
            accumulator.addScore(
              scaleId,
              1.0,  // ответ = 1 (никогда)
              1.0,
              5.0,
              weight,
              _createQuestion('q$i'),
              1,
              direction,
            );
          });
        }
      }

      final scores = accumulator.getNormalizedScores();

      // Ожидания: после 5 вопросов с ответами "никогда":
      // stress_tolerance должна быть высокой (близко к 100%)
      expect(scores['stress_tolerance'], greaterThan(80.0),
          reason: 'Минимальные симптомы стресса должны давать высокую стресс-толерантность');

      // anxiety должна быть низкой (близко к 0%)
      expect(scores['anxiety'], lessThan(20.0),
          reason: 'Минимальные симптомы стресса должны давать низкую тревожность');
    });

    test('Стресс тест: все вопросы с ответами "постоянно" → высокий стресс, низкая толерантность', () {
      final accumulator = ScaleScoreAccumulator();

      // Пройдем все 5 вопросов стресс-теста с ответами "постоянно" (5)
      for (int i = 1; i <= 5; i++) {
        final questionWeight = QuestionWeightsConfig.getWeights('stress_test', 'q$i');
        if (questionWeight != null) {
          questionWeight.axisWeights.forEach((scaleId, weight) {
            final direction = questionWeight.getDirection(scaleId);
            accumulator.addScore(
              scaleId,
              5.0,  // ответ = 5 (постоянно)
              1.0,
              5.0,
              weight,
              _createQuestion('q$i'),
              5,
              direction,
            );
          });
        }
      }

      final scores = accumulator.getNormalizedScores();

      // Ожидания: после 5 вопросов с ответами "постоянно":
      // stress_tolerance должна быть низкой (близко к 0%)
      expect(scores['stress_tolerance'], lessThan(20.0),
          reason: 'Максимальные симптомы стресса должны давать низкую стресс-толерантность');

      // anxiety должна быть высокой (близко к 100%)
      expect(scores['anxiety'], greaterThan(80.0),
          reason: 'Максимальные симптомы стресса должны давать высокую тревожность');
    });
  });

  group('axisDirections - Проверка конфигурации', () {
    test('Все вопросы с REVERSED маркером имеют axisDirections', () {
      final questionIds = [
        'love_profile:BP_02',
        'love_profile:BP_06',
        'love_profile:BP_10',
        'love_profile:IU_16',
        'love_profile:IU_20',
        'love_profile:ST_26',
        'love_profile:ST_30',
        'love_profile:OG_36',
        'love_profile:OG_40',
        'love_profile:DR_46',
        'love_profile:DR_50',
        'love_profile:KK_56',
        'love_profile:KK_60',
      ];

      for (final id in questionIds) {
        final parts = id.split(':');
        final weight = QuestionWeightsConfig.getWeights(parts[0], parts[1]);
        expect(weight, isNotNull, reason: 'Вопрос $id должен существовать');
        expect(weight!.axisDirections, isNotNull, reason: 'Вопрос $id должен иметь axisDirections');
        expect(weight.axisDirections!.isNotEmpty, true, reason: 'Вопрос $id должен иметь хотя бы одно направление');
      }
    });

    test('Стресс тест: все вопросы имеют инвертированные оси', () {
      for (int i = 1; i <= 5; i++) {
        final weight = QuestionWeightsConfig.getWeights('stress_test', 'q$i');
        expect(weight, isNotNull, reason: 'Стресс вопрос q$i должен существовать');
        expect(weight!.axisDirections, isNotNull, reason: 'Стресс вопрос q$i должен иметь axisDirections');

        // Проверяем, что stress_tolerance инвертирована
        expect(weight.getDirection('stress_tolerance'), equals(-1),
            reason: 'stress_tolerance должна быть инвертирована в вопросе q$i');
      }
    });
  });
}

// Вспомогательные функции

QuestionModel _createQuestion(String id) {
  return QuestionModel(
    id: id,
    text: {'ru': 'Тестовый вопрос', 'en': 'Test question'},
    answers: [
      AnswerModel(
        id: 'a1',
        text: {'ru': 'Ответ 1', 'en': 'Answer 1'},
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {'ru': 'Ответ 2', 'en': 'Answer 2'},
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {'ru': 'Ответ 3', 'en': 'Answer 3'},
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {'ru': 'Ответ 4', 'en': 'Answer 4'},
        score: 4,
      ),
      AnswerModel(
        id: 'a5',
        text: {'ru': 'Ответ 5', 'en': 'Answer 5'},
        score: 5,
      ),
    ],
  );
}
