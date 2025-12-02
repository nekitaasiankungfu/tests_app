import 'test_stub.dart';

/// Тест типа креативности
///
/// Этот тест помогает понять, как именно вы создаёте — через какие каналы
/// восприятия, процессы и подходы проявляется ваша креативность.
///
/// Измеряет 8 шкал креативности:
/// - Визуальный креатор (visual_creator)
/// - Вербальный креатор (verbal_creator)
/// - Системный креатор (systematic_creator)
/// - Эмоциональный креатор (emotional_creator)
/// - Экспериментальный креатор (experimental_creator)
/// - Социальный креатор (social_creator)
/// - Блокаторы креативности (blockers)
/// - Источники вдохновения (inspiration_sources)
///
/// Содержит 48 вопросов:
/// - Вопросы 1-40: частота проявления (Never - Always), 5-point Likert
/// - Вопросы 41-48: множественный выбор из 5-6 вариантов
///
/// Основано на современных когнитивных теориях креативности (Guilford, Torrance),
/// теории множественного интеллекта Гарднера, концепции flow-состояния Чиксентмихайи
/// и исследованиях творческого процесса в цифровую эпоху.
///
/// Версия: 1.0
/// Время прохождения: ~8 минут
/// Категория: Креативность
class CreativeTypeTest extends TestStub {
  @override
  String get id => 'creative_type_v1';

  @override
  String get category => 'creativity';

  @override
  Map<String, String> get name => {
        'ru': 'Тест типа креативности',
        'en': 'Creative Type Test',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Этот тест помогает понять, как именно вы создаёте — через какие каналы восприятия, '
            'процессы и подходы проявляется ваша креативность. Определяет ваш доминирующий '
            'креативный тип, основные блокаторы и источники вдохновения.',
        'en':
            'This test helps you understand exactly how you create — through which channels of perception, '
            'processes, and approaches your creativity manifests. Identifies your dominant creative type, '
            'main blockers and sources of inspiration.',
      };

  @override
  int get questionCount => 48;

  @override
  int get estimatedMinutes => 8;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'creativity',
        'creative_thinking',
        'inspiration',
        'creative_process',
        'artistic',
        'innovation',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Based on modern creativity theories',
        'year': 2025,
        'category_display': 'Креативность',
        'factors': [
          'visual_creator',
          'verbal_creator',
          'systematic_creator',
          'emotional_creator',
          'experimental_creator',
          'social_creator',
          'blockers',
          'inspiration_sources',
        ],
        'reversed_questions': [], // Нет обратных вопросов
        'response_types': ['frequency', 'multiple_choice'],
        'scoring_method': 'weighted_sum_with_percentages',
        'disclaimer': {
          'ru':
              'Тест предназначен для самопознания и развития креативных навыков. '
              'Не является клиническим инструментом.',
          'en':
              'The test is intended for self-knowledge and creative skill development. '
              'Not a clinical instrument.',
        },
        'interpretation_ranges': {
          'creativity_types': {
            'very_strong': '≥35%',
            'strong': '25-34%',
            'moderate': '18-24%',
            'balanced': '<18%',
          },
          'blockers': {
            'low': '0-8',
            'moderate': '9-14',
            'high': '15-20',
          },
          'inspiration_sources': {
            'low': '0-12',
            'moderate': '13-20',
            'high': '21+',
          },
        },
        'target_audience': {
          'ru':
              'Подростки и молодые взрослые (14-30 лет), интересующиеся творчеством: '
              'блогеры, дизайнеры, музыканты, писатели, создатели контента',
          'en':
              'Teenagers and young adults (14-30 years old) interested in creativity: '
              'bloggers, designers, musicians, writers, content creators',
        },
      };
}
