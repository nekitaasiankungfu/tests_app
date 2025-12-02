import 'test_stub.dart';

/// Тест «Психология дружбы: глубина, стиль и потенциал»
///
/// Психологический тест для исследования ключевых аспектов того, как вы
/// строите дружбу: способность формировать эмоциональную близость,
/// стиль общения, уровень доверия, личные границы, поддерживающее
/// поведение и ожидания от дружественных отношений.
///
/// Основан на:
/// - Модели межличностной близости
/// - Психологии привязанности (адаптация)
/// - Модели просоциального поведения
/// - Концепции личных границ
///
/// Измеряет 6 аспектов дружбы:
/// - Эмоциональная близость (emotional_closeness) 💗
/// - Стиль общения (communication_style) 💬
/// - Доверие и надёжность (trust_and_loyalty) 🤝
/// - Границы и личное пространство (boundaries_and_space) 🛡️
/// - Поддерживающее поведение (supportive_behavior) 🌟
/// - Ожидания от дружбы (friendship_expectations) 🎯
///
/// Содержит 24 вопроса (по 4 на каждый аспект)
/// Шкала ответов: 5-балльная Лайкерта (0-4)
///
/// Версия: 1.1
/// Время прохождения: ~7 минут
/// Категория: Отношения
class FriendshipPsychologyTest extends TestStub {
  @override
  String get id => 'friendship_psychology_v1';

  @override
  String get category => 'relationships';

  @override
  Map<String, String> get name => {
        'ru': 'Психология дружбы: глубина, стиль и потенциал',
        'en': 'Friendship Psychology: Depth, Style & Potential',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Этот тест исследует ключевые аспекты того, как вы строите дружбу: '
            'вашу способность формировать эмоциональную близость, стиль общения, '
            'уровень доверия, личные границы, поддерживающее поведение и ожидания '
            'от дружественных отношений. Он помогает понять, как вы создаёте и '
            'поддерживаете связи, какие сильные стороны проявляете и какие модели '
            'взаимодействия являются для вас естественными.',
        'en':
            'This test explores key aspects of how you build friendships: '
            'your ability to form emotional closeness, communication style, '
            'level of trust, personal boundaries, supportive behavior, and expectations '
            'from friendships. It helps you understand how you create and '
            'maintain connections, what strengths you demonstrate, and what interaction '
            'patterns are natural for you.',
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
        'friendship',
        'social',
        'communication',
        'trust',
        'boundaries',
        'support',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.1',
        'author': 'Based on Interpersonal Closeness & Prosocial Behavior Models',
        'year': 2025,
        'category_display': {
          'ru': 'Отношения',
          'en': 'Relationships',
        },
        'factors': [
          'emotional_closeness',
          'communication_style',
          'trust_and_loyalty',
          'boundaries_and_space',
          'supportive_behavior',
          'friendship_expectations',
        ],
        'reversed_questions': [7, 8, 9, 15, 19, 23], // Обратные вопросы
        'response_type': 'likert_5',
        'theoretical_basis': [
          'Interpersonal Closeness Model',
          'Attachment Theory (adapted)',
          'Prosocial Behavior Model',
          'Personal Boundaries Concept',
        ],
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самопознания и не является '
              'психологической диагностикой. Результаты помогают лучше понять '
              'ваш стиль дружбы и особенности в межличностных отношениях.',
          'en':
              'This test is for self-discovery and is not a psychological diagnosis. '
              'Results help you better understand your friendship style and '
              'characteristics in interpersonal relationships.',
        },
        'interpretation_ranges': {
          'low': '0-39%',
          'medium': '40-69%',
          'high': '70-100%',
        },
        'emoji_map': {
          'emotional_closeness': '💗',
          'communication_style': '💬',
          'trust_and_loyalty': '🤝',
          'boundaries_and_space': '🛡️',
          'supportive_behavior': '🌟',
          'friendship_expectations': '🎯',
        },
      };
}
