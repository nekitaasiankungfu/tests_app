import '../models/test_model.dart';

class SelfEsteemTestData {
  static TestModel getSelfEsteemTest() {
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
}
