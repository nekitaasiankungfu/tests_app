import 'test_stub.dart';

/// Тест «Совместимость и идеальные отношения»
///
/// Психологический тест для определения индивидуального стиля партнёрских
/// отношений и ключевых аспектов совместимости с партнёром.
///
/// Основан на:
/// - Теории привязанности (Боулби, Айнсворт)
/// - Модели межличностных стилей общения
/// - Поведенческих маркерах совместимости в парах
///
/// Измеряет 6 аспектов совместимости:
/// - Эмоциональная близость (emotional_connection) ❤️
/// - Стиль общения (communication_style) 💬
/// - Совпадение ценностей (values_alignment) ⚖️
/// - Ожидания от отношений (relationship_expectations) 🎯
/// - Стиль решения конфликтов (conflict_management) 🤝
/// - Близость и романтика (intimacy_and_romance) 💕
///
/// Содержит 24 вопроса (по 4 на каждый аспект)
/// Шкала ответов: 5-балльная (Совершенно не согласен - Полностью согласен)
///
/// Версия: 1.0
/// Время прохождения: ~7 минут
/// Категория: Отношения
class RelationshipCompatibilityTest extends TestStub {
  @override
  String get id => 'relationship_compatibility_v1';

  @override
  String get category => 'relationships';

  @override
  Map<String, String> get name => {
        'ru': 'Тест «Совместимость и идеальные отношения»',
        'en': 'Relationship Compatibility Test',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Этот тест помогает определить ваш индивидуальный стиль партнёрских отношений '
            'и выявляет ключевые аспекты совместимости с потенциальным или текущим партнёром. '
            'Он оценивает эмоциональные потребности, стиль общения, ожидания, ценности '
            'и ролевые предпочтения в отношениях.',
        'en':
            'This test helps determine your individual partnership style '
            'and identifies key compatibility aspects with a potential or current partner. '
            'It evaluates emotional needs, communication style, expectations, values '
            'and role preferences in relationships.',
      };

  @override
  int get questionCount => 24;

  @override
  int get estimatedMinutes => 7;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'relationships',
        'compatibility',
        'love',
        'partnership',
        'communication',
        'values',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Based on Attachment Theory & Interpersonal Styles',
        'year': 2025,
        'category_display': 'Отношения',
        'factors': [
          'emotional_connection',
          'communication_style',
          'values_alignment',
          'relationship_expectations',
          'conflict_management',
          'intimacy_and_romance',
        ],
        'reversed_questions': [8, 18, 20], // Обратные вопросы
        'response_type': 'likert_5',
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самопознания и не является '
              'психологической диагностикой. Результаты помогают лучше понять '
              'ваши сильные стороны и особенности в отношениях.',
          'en':
              'This test is for self-discovery and is not a psychological diagnosis. '
              'Results help you better understand your strengths and '
              'characteristics in relationships.',
        },
        'interpretation_ranges': {
          'low': '0-44%',
          'medium': '45-74%',
          'high': '75-100%',
        },
        'emoji_map': {
          'emotional_connection': '❤️',
          'communication_style': '💬',
          'values_alignment': '⚖️',
          'relationship_expectations': '🎯',
          'conflict_management': '🤝',
          'intimacy_and_romance': '💕',
        },
      };
}
