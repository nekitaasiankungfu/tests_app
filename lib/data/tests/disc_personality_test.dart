import 'test_stub.dart';

/// DISC Personality Test - Поведенческий профиль
///
/// Основан на теории DISC Уильяма Марстона (1928).
/// Измеряет 4 поведенческих фактора, определяющих стиль коммуникации,
/// принятия решений и взаимодействия с окружающей средой.
///
/// Измеряет 4 ключевых фактора:
/// - Dominance (Доминирование): Прямолинейность, результативность, решительность
/// - Influence (Влияние): Общительность, энтузиазм, убедительность
/// - Steadiness (Стабильность): Терпение, лояльность, командная работа
/// - Conscientiousness (Сознательность): Точность, системность, качество
///
/// Содержит 56 вопросов (14 на каждый фактор)
/// Версия: 1.0
/// Время прохождения: ~10 минут
/// Категория: Типология личности
class DISCPersonalityTest extends TestStub {
  @override
  String get id => 'disc_personality_v1';

  @override
  String get category => 'personality';

  @override
  Map<String, String> get name => {
        'ru': 'DISC: Профиль поведения',
        'en': 'DISC Personality Test',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'DISC - один из наиболее популярных инструментов оценки поведения в мире. '
            'Модель основана на теории эмоций Уильяма Марстона и измеряет четыре базовых '
            'поведенческих фактора: Доминирование, Влияние, Стабильность и Сознательность. '
            'Понимание своего DISC профиля помогает в карьере, лидерстве, командной работе '
            'и личных отношениях.',
        'en':
            'DISC is one of the most popular behavioral assessment tools worldwide. '
            'Based on William Marston\'s theory of emotions, it measures four fundamental '
            'behavioral factors: Dominance, Influence, Steadiness, and Conscientiousness. '
            'Understanding your DISC profile helps in career, leadership, teamwork, '
            'and personal relationships.',
      };

  @override
  int get questionCount => 56;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'personality',
        'behavior',
        'communication',
        'leadership',
        'teamwork',
        'professional',
        'career',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Based on William Marston\'s DISC Theory (1928)',
        'year': 2025,
        'category_display': 'Типология личности',
        'factors': [
          'dominance',
          'influence',
          'steadiness',
          'conscientiousness',
        ],
        'factor_labels': {
          'D': 'Dominance (Доминирование)',
          'I': 'Influence (Влияние)',
          'S': 'Steadiness (Стабильность)',
          'C': 'Conscientiousness (Сознательность)',
        },
        'response_type': 'likert_5',
        'disclaimer': {
          'ru':
              'DISC - это оценка поведения, а не личности. Результаты показывают ваш '
              'естественный стиль поведения в различных ситуациях. Нет "хороших" или '
              '"плохих" профилей - каждый имеет свои сильные стороны и области для развития.',
          'en':
              'DISC is a behavioral assessment, not a personality test. Results show your '
              'natural behavioral style in different situations. There are no "good" or '
              '"bad" profiles - each has its strengths and areas for development.',
        },
        'interpretation_ranges': {
          'low': '0-40%',
          'medium': '40-60%',
          'high': '60-100%',
        },
        'profile_types': [
          'D',
          'I',
          'S',
          'C',
          'DI',
          'ID',
          'IS',
          'SI',
          'SC',
          'CS',
          'CD',
          'DC',
          'DS',
          'SD',
          'IC',
          'CI'
        ],
        'applications': [
          'Карьерный выбор',
          'Командная совместимость',
          'Стиль лидерства',
          'Коммуникация',
          'Продажи',
          'Профессиональное развитие'
        ],
        'tags': [
          'personality',
          'behavior',
          'communication',
          'leadership',
          'teamwork'
        ],
      };
}
