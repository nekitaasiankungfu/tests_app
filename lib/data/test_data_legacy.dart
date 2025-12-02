import '../models/test_model.dart';
import 'ipip_big_five_data.dart';
import 'fisher_temperament_data.dart';
import 'love_profile_data.dart';
import 'sixteen_types_data.dart';

class TestData {
  static List<TestModel> getTests() {
    return [
      SixteenTypesData.getSixteenTypesTest(),
      LoveProfileData.getLoveProfileTest(),
      IPIPBigFiveData.getIPIPBigFiveTest(),
      FisherTemperamentData.getFisherTemperamentTest(),
      _getStressTest(),
      _getSelfEsteemTest(),
    ];
  }

  static TestModel _getStressTest() {
    return TestModel(
      id: 'stress_test',
      title: {
        'ru': 'Тест на уровень стресса',
        'en': 'Stress Level Test',
      },
      description: {
        'ru': 'Определите уровень вашего стресса с помощью простого теста',
        'en': 'Determine your stress level with a simple test',
      },
      category: {
        'ru': 'Стресс',
        'en': 'Stress',
      },
      categoryId: 'emotional',
      estimatedTime: 3,
      type: TestType.simple,
      questions: [
        QuestionModel(
          id: 'q1',
          text: {
            'ru': 'Как часто вы чувствуете напряжение в течение дня?',
            'en': 'How often do you feel tension during the day?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Никогда', 'en': 'Never'}, score: 0),
            AnswerModel(id: 'a2', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 1),
            AnswerModel(id: 'a3', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Часто', 'en': 'Often'}, score: 3),
            AnswerModel(id: 'a5', text: {'ru': 'Постоянно', 'en': 'Constantly'}, score: 4),
          ],
        ),
        QuestionModel(
          id: 'q2',
          text: {
            'ru': 'Насколько хорошо вы спите?',
            'en': 'How well do you sleep?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Отлично', 'en': 'Excellent'}, score: 0),
            AnswerModel(id: 'a2', text: {'ru': 'Хорошо', 'en': 'Good'}, score: 1),
            AnswerModel(id: 'a3', text: {'ru': 'Нормально', 'en': 'Normal'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Плохо', 'en': 'Bad'}, score: 3),
            AnswerModel(id: 'a5', text: {'ru': 'Очень плохо', 'en': 'Very bad'}, score: 4),
          ],
        ),
        QuestionModel(
          id: 'q3',
          text: {
            'ru': 'Как часто вы испытываете раздражительность?',
            'en': 'How often do you experience irritability?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Никогда', 'en': 'Never'}, score: 0),
            AnswerModel(id: 'a2', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 1),
            AnswerModel(id: 'a3', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Часто', 'en': 'Often'}, score: 3),
            AnswerModel(id: 'a5', text: {'ru': 'Постоянно', 'en': 'Constantly'}, score: 4),
          ],
        ),
        QuestionModel(
          id: 'q4',
          text: {
            'ru': 'Насколько легко вам сосредоточиться на задачах?',
            'en': 'How easy is it for you to focus on tasks?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Очень легко', 'en': 'Very easy'}, score: 0),
            AnswerModel(id: 'a2', text: {'ru': 'Легко', 'en': 'Easy'}, score: 1),
            AnswerModel(id: 'a3', text: {'ru': 'Нормально', 'en': 'Normal'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Сложно', 'en': 'Difficult'}, score: 3),
            AnswerModel(id: 'a5', text: {'ru': 'Очень сложно', 'en': 'Very difficult'}, score: 4),
          ],
        ),
        QuestionModel(
          id: 'q5',
          text: {
            'ru': 'Как часто вы чувствуете усталость?',
            'en': 'How often do you feel tired?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Никогда', 'en': 'Never'}, score: 0),
            AnswerModel(id: 'a2', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 1),
            AnswerModel(id: 'a3', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Часто', 'en': 'Often'}, score: 3),
            AnswerModel(id: 'a5', text: {'ru': 'Постоянно', 'en': 'Constantly'}, score: 4),
          ],
        ),
      ],
    );
  }

  static TestModel _getSelfEsteemTest() {
    return TestModel(
      id: 'self_esteem_test',
      title: {
        'ru': 'Тест на самооценку',
        'en': 'Self-Esteem Test',
      },
      description: {
        'ru': 'Оцените уровень вашей самооценки',
        'en': 'Assess your level of self-esteem',
      },
      category: {
        'ru': 'Личность',
        'en': 'Personality',
      },
      categoryId: 'emotional',
      estimatedTime: 4,
      type: TestType.simple,
      questions: [
        QuestionModel(
          id: 'q1',
          text: {
            'ru': 'Как вы оцениваете свои способности?',
            'en': 'How do you rate your abilities?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Очень высоко', 'en': 'Very high'}, score: 4),
            AnswerModel(id: 'a2', text: {'ru': 'Высоко', 'en': 'High'}, score: 3),
            AnswerModel(id: 'a3', text: {'ru': 'Средне', 'en': 'Average'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Низко', 'en': 'Low'}, score: 1),
            AnswerModel(id: 'a5', text: {'ru': 'Очень низко', 'en': 'Very low'}, score: 0),
          ],
        ),
        QuestionModel(
          id: 'q2',
          text: {
            'ru': 'Насколько вы уверены в себе в социальных ситуациях?',
            'en': 'How confident are you in social situations?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Очень уверен', 'en': 'Very confident'}, score: 4),
            AnswerModel(id: 'a2', text: {'ru': 'Уверен', 'en': 'Confident'}, score: 3),
            AnswerModel(id: 'a3', text: {'ru': 'Средне', 'en': 'Average'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Неуверен', 'en': 'Not confident'}, score: 1),
            AnswerModel(id: 'a5', text: {'ru': 'Очень неуверен', 'en': 'Very unconfident'}, score: 0),
          ],
        ),
        QuestionModel(
          id: 'q3',
          text: {
            'ru': 'Как часто вы критикуете себя?',
            'en': 'How often do you criticize yourself?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Никогда', 'en': 'Never'}, score: 4),
            AnswerModel(id: 'a2', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 3),
            AnswerModel(id: 'a3', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Часто', 'en': 'Often'}, score: 1),
            AnswerModel(id: 'a5', text: {'ru': 'Постоянно', 'en': 'Constantly'}, score: 0),
          ],
        ),
        QuestionModel(
          id: 'q4',
          text: {
            'ru': 'Насколько вы довольны своей внешностью?',
            'en': 'How satisfied are you with your appearance?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Полностью доволен', 'en': 'Completely satisfied'}, score: 4),
            AnswerModel(id: 'a2', text: {'ru': 'В основном доволен', 'en': 'Mostly satisfied'}, score: 3),
            AnswerModel(id: 'a3', text: {'ru': 'Нейтрально', 'en': 'Neutral'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'В основном недоволен', 'en': 'Mostly dissatisfied'}, score: 1),
            AnswerModel(id: 'a5', text: {'ru': 'Полностью недоволен', 'en': 'Completely dissatisfied'}, score: 0),
          ],
        ),
        QuestionModel(
          id: 'q5',
          text: {
            'ru': 'Как часто вы сравниваете себя с другими?',
            'en': 'How often do you compare yourself to others?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Никогда', 'en': 'Never'}, score: 4),
            AnswerModel(id: 'a2', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 3),
            AnswerModel(id: 'a3', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Часто', 'en': 'Often'}, score: 1),
            AnswerModel(id: 'a5', text: {'ru': 'Постоянно', 'en': 'Constantly'}, score: 0),
          ],
        ),
      ],
    );
  }

  static String getStressInterpretation(int score) {
    if (score <= 5) {
      return 'Низкий уровень стресса. Вы хорошо справляетесь со стрессовыми ситуациями.';
    } else if (score <= 10) {
      return 'Умеренный уровень стресса. Рекомендуется больше отдыхать и расслабляться.';
    } else if (score <= 15) {
      return 'Высокий уровень стресса. Стоит обратиться к специалисту или изменить образ жизни.';
    } else {
      return 'Очень высокий уровень стресса. Настоятельно рекомендуется обратиться к психологу.';
    }
  }

  static String getSelfEsteemInterpretation(int score) {
    if (score >= 16) {
      return 'Высокая самооценка. Вы уверены в себе и своих способностях.';
    } else if (score >= 12) {
      return 'Умеренная самооценка. Есть потенциал для роста уверенности в себе.';
    } else if (score >= 8) {
      return 'Низкая самооценка. Рекомендуется работа над самопринятием и развитием уверенности.';
    } else {
      return 'Очень низкая самооценка. Настоятельно рекомендуется обратиться к психологу.';
    }
  }
}
