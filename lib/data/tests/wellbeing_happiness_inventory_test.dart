import 'test_stub.dart';

/// Индекс субъективного благополучия (Wellbeing Happiness Inventory)
///
/// Комплексная оценка счастья и удовлетворённости жизнью,
/// основанная на PERMA-модели Мартина Селигмана и теории
/// субъективного благополучия Эда Динера.
///
/// Измеряет 6 ключевых компонентов благополучия:
/// - Позитивные эмоции (positive_emotions) - P
/// - Вовлечённость (engagement) - E
/// - Отношения (relationships) - R
/// - Смысл (meaning) - M
/// - Достижения (accomplishment) - A
/// - Удовлетворённость жизнью (life_satisfaction)
///
/// Содержит 30 вопросов с 6-балльной шкалой Лайкерта.
///
/// Версия: 1.0
/// Время прохождения: ~8 минут
/// Категория: Эмоциональное состояние
class WellbeingHappinessInventoryTest extends TestStub {
  @override
  String get id => 'wellbeing_happiness_inventory_v1';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Индекс субъективного благополучия',
        'en': 'Wellbeing Happiness Inventory',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Комплексная оценка счастья и удовлетворённости жизнью. '
            'Тест измеряет позитивные эмоции, вовлечённость, качество отношений, '
            'смысл жизни, достижения и общую удовлетворённость.',
        'en':
            'Comprehensive assessment of happiness and life satisfaction. '
            'The test measures positive emotions, engagement, relationship quality, '
            'meaning in life, accomplishments and overall satisfaction.',
      };

  @override
  int get questionCount => 30;

  @override
  int get estimatedMinutes => 8;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'wellbeing',
        'happiness',
        'life_satisfaction',
        'positive_psychology',
        'perma',
        'mental_health',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Positive Psychology Research Lab',
        'year': 2025,
        'category_display': 'Эмоциональное состояние',
        'factors': [
          'positive_emotions',
          'engagement',
          'relationships',
          'meaning',
          'accomplishment',
          'life_satisfaction',
        ],
        'reversed_questions': [], // Нет обратных вопросов
        'response_types': ['likert_6'],
        'disclaimer': {
          'ru':
              'Данный опросник является инструментом самопознания и самооценки. '
              'Он основан на научных исследованиях в области позитивной психологии, '
              'но не является клиническим или диагностическим инструментом.',
          'en':
              'This questionnaire is a self-assessment tool. '
              'It is based on scientific research in positive psychology, '
              'but is not a clinical or diagnostic instrument.',
        },
        'interpretation_ranges': {
          'very_low': '0-20%',
          'low': '21-40%',
          'moderate': '41-60%',
          'high': '61-80%',
          'very_high': '81-100%',
        },
        'composite_scores': [
          'total_wellbeing',
          'hedonic_wellbeing',
          'eudaimonic_wellbeing',
        ],
        'tags': ['wellbeing', 'happiness', 'positive_psychology', 'perma'],
      };
}
