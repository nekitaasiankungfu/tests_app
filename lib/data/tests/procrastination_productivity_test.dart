import 'test_stub.dart';

/// Тест прокрастинации и стиля продуктивности
///
/// Помогает понять, почему вы откладываете важные дела, и какой стиль работы
/// лучше поддерживает вашу продуктивность. Разбирает эмоциональные причины
/// (страх неудачи, скука, избегание неприятных задач), организационные факторы
/// (хаос в делах, отсутствие структуры), перфекционизм и уровень ресурса.
///
/// Измеряет 4 ключевых аспекта:
/// - Эмоциональная прокрастинация (emotional_procrastination)
/// - Организационная прокрастинация (organizational_procrastination)
/// - Перфекционистская прокрастинация (perfectionistic_procrastination)
/// - Энергия и ресурс (energy_resource)
///
/// Содержит 24 вопроса с 5-балльной частотной шкалой
/// (Никогда - Редко - Иногда - Часто - Всегда)
///
/// Версия: 1.0
/// Время прохождения: ~8 минут
/// Категория: Эмоциональное состояние
class ProcrastinationProductivityTest extends TestStub {
  @override
  String get id => 'procrastination_productivity_style_v1';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Прокрастинация и стиль продуктивности',
        'en': 'Procrastination and Productivity Style',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест помогает понять, почему вы откладываете важные дела, и какой стиль работы лучше поддерживает вашу продуктивность. '
            'Мы разбираем эмоциональные причины (страх неудачи, скука, избегание неприятных задач), организационные факторы '
            '(хаос в делах, отсутствие структуры), перфекционизм и уровень ресурса.\n\n'
            'Результат показывает, какие механизмы прокрастинации у вас ведущие и какие настройки рабочего дня, планирования '
            'и заботы о себе помогут легче переходить от «я знаю, что хочу» к «я действительно делаю». '
            'Тест не является клинической диагностикой, а инструментом саморефлексии и планирования изменений.',
        'en':
            'This questionnaire helps you understand why you put off important tasks and which work style best supports your productivity. '
            'It covers emotional reasons (fear of failure, boredom, avoiding unpleasant tasks), organizational factors '
            '(chaos in tasks, lack of structure), perfectionism, and your energy level.\n\n'
            'The result highlights your main procrastination drivers and suggests workday, planning and self-care adjustments '
            'that make it easier to move from "I know what I want" to "I actually do it". '
            'This is not a clinical diagnostic tool but a self-reflection and change-planning instrument.',
      };

  @override
  int get questionCount => 48;

  @override
  int get estimatedMinutes => 15;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'procrastination',
        'productivity',
        'self_regulation',
        'time_management',
        'perfectionism',
        'energy_management',
        'emotional_regulation',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': '4Marketing / Nikita & ChatGPT (draft)',
        'year': 2025,
        'category_display': 'Эмоциональное состояние',
        'theoretical_basis': [
          'Procrastination research (P. Steel, F. Sirois)',
          'Temporal Motivation Theory',
          'Self-regulation and emotion regulation models',
          'Energy and resource management approaches',
        ],
        'factors': [
          'emotional_procrastination',
          'organizational_procrastination',
          'perfectionistic_procrastination',
          'energy_resource',
        ],
        'reversed_questions': [3, 6, 8, 11, 15, 16, 20, 22, 24, 27, 30, 32, 35, 39, 40, 44, 46, 48],
        'response_type': 'frequency',
        'response_options': {
          'ru': ['Никогда', 'Редко', 'Иногда', 'Часто', 'Всегда'],
          'en': ['Never', 'Rarely', 'Sometimes', 'Often', 'Always'],
        },
        'scoring': [0, 1, 2, 3, 4],
        'target_audience': {
          'ru':
              'Взрослые 18–55 лет, сталкивающиеся с откладыванием задач в учёбе, работе или личных проектах.',
          'en':
              'Adults 18–55 who struggle with putting off tasks at work, in studies or personal projects.',
        },
        'interpretation_levels': {
          'low': '0-39%',
          'medium': '40-69%',
          'high': '70-100%',
        },
      };
}
