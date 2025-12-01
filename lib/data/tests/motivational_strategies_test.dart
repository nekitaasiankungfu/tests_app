import 'test_stub.dart';

/// Тест мотивационных стратегий
///
/// Определяет доминирующий мотивационный паттерн — то, что движет вашими
/// действиями, решениями и реакциями на жизненные ситуации.
///
/// Основан на:
/// - Теории самодетерминации (Deci & Ryan, 1985)
/// - Теории базовых психологических потребностей
/// - Концепции мотивационных систем (McClelland)
/// - Теории защитных стратегий и копинг-механизмов
///
/// Выявляет 9 основных мотивационных стратегий:
/// - Идеалист (idealist) - стремление к совершенству
/// - Альтруист (altruist) - потребность быть нужным
/// - Достигатель (achiever) - ориентация на успех
/// - Созидатель (creator) - поиск уникальности
/// - Аналитик (analyst) - жажда знаний
/// - Защитник (guardian) - потребность в безопасности
/// - Оптимист (optimist) - стремление к радости
/// - Лидер (leader) - потребность в контроле
/// - Гармонизатор (harmonizer) - стремление к миру
///
/// Содержит 90 вопросов (по 10 на каждый тип мотивации)
///
/// Версия: 1.0
/// Время прохождения: ~20 минут
/// Категория: Типология личности
class MotivationalStrategiesTest extends TestStub {
  @override
  String get id => 'motivational_strategies_v1';

  @override
  String get category => 'personality';

  @override
  Map<String, String> get name => {
        'ru': 'Тест мотивационных стратегий',
        'en': 'Motivational Strategies Assessment',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Этот тест помогает определить ваш доминирующий мотивационный паттерн — то, '
            'что движет вашими действиями, решениями и реакциями на жизненные ситуации. '
            'Основываясь на теории базовых психологических потребностей и современных '
            'исследованиях мотивации, тест выявляет 9 основных стратегий, которые люди '
            'используют для достижения удовлетворенности и преодоления жизненных вызовов.',
        'en':
            'This test helps identify your dominant motivational pattern — what drives your '
            'actions, decisions, and reactions to life situations. Based on the theory of basic '
            'psychological needs and modern motivation research, the test reveals 9 core strategies '
            'that people use to achieve satisfaction and overcome life challenges.',
      };

  @override
  int get questionCount => 90;

  @override
  int get estimatedMinutes => 20;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'motivation',
        'personality',
        'self_determination',
        'psychological_needs',
        'typology',
        'comprehensive',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author':
            'Based on Self-Determination Theory (Deci & Ryan) and Motivational Systems Theory',
        'year': 2025,
        'category_display': 'Типология личности',
        'factors': [
          'idealist',
          'altruist',
          'achiever',
          'creator',
          'analyst',
          'guardian',
          'optimist',
          'leader',
          'harmonizer',
        ],
        'reversed_questions': [], // Все вопросы прямые
        'response_type': 'likert_5',
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самопознания и личностного развития. '
              'Результаты помогают лучше понять свои сильные стороны, области роста '
              'и оптимальные пути самореализации.',
          'en':
              'This test is designed for self-knowledge and personal development. '
              'Results help better understand your strengths, growth areas and '
              'optimal paths for self-realization.',
        },
        'interpretation_ranges': {
          'low': '0-40%',
          'medium': '40-70%',
          'high': '70-100%',
        },
        'tags': [
          'motivation',
          'personality',
          'self_determination',
          'psychological_needs'
        ],
      };
}
