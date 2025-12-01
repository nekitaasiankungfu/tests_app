import 'test_stub.dart';

/// Тест эмоционального интеллекта (EQ)
///
/// Смешанная модель Salovey-Mayer + Goleman для оценки эмоционального интеллекта.
/// EQ - способность понимать, использовать и управлять своими эмоциями,
/// а также распознавать и влиять на эмоции других людей.
///
/// Измеряет 7 ключевых компонентов:
/// - Восприятие эмоций (emotional_perception)
/// - Понимание эмоций (emotional_understanding)
/// - Управление собой (self_management)
/// - Использование эмоций (emotional_facilitation)
/// - Эмпатия (empathy)
/// - Социальные навыки (social_skills)
/// - Мотивация (motivation)
///
/// Содержит 70 вопросов с 5-балльной частотной шкалой
/// (Никогда - Редко - Иногда - Часто - Всегда)
///
/// Версия: 1.0
/// Время прохождения: ~15 минут
/// Категория: Интеллект и способности
class EmotionalIntelligenceTest extends TestStub {
  @override
  String get id => 'emotional_intelligence';

  @override
  String get category => 'intelligence';

  @override
  Map<String, String> get name => {
        'ru': 'Эмоциональный интеллект (EQ)',
        'en': 'Emotional Intelligence (EQ)',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Эмоциональный интеллект — это способность понимать, использовать и управлять своими эмоциями, '
            'а также распознавать и влиять на эмоции других людей. Высокий EQ помогает строить крепкие отношения, '
            'эффективно справляться со стрессом и принимать взвешенные решения.\n\n'
            'Этот тест основан на смешанной модели Саловей-Майер и Гоулмана, оценивая семь ключевых компонентов '
            'эмоционального интеллекта: восприятие эмоций, их понимание, управление собой, использование эмоций '
            'для решения задач, эмпатию, социальные навыки и мотивацию.',
        'en':
            'Emotional Intelligence is the ability to understand, use, and manage your own emotions, '
            'as well as recognize and influence the emotions of others. High EQ helps build strong relationships, '
            'effectively cope with stress, and make informed decisions.\n\n'
            'This test is based on the mixed Salovey-Mayer and Goleman model, assessing seven key components '
            'of emotional intelligence: emotional perception, understanding, self-management, emotional facilitation, '
            'empathy, social skills, and motivation.',
      };

  @override
  int get questionCount => 70;

  @override
  int get estimatedMinutes => 15;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'emotional_intelligence',
        'eq',
        'emotions',
        'empathy',
        'self_management',
        'social_skills',
        'relationships',
        'personal_development',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Based on Salovey-Mayer & Goleman models',
        'year': 2025,
        'category_display': 'Интеллект и способности',
        'theoretical_basis': [
          'Salovey & Mayer (1990) - Four-Branch Model',
          'Goleman (1995) - Mixed Model of EI',
          'Bar-On (1997) - Emotional Quotient',
          'Petrides & Furnham (2001) - Trait EI',
        ],
        'factors': [
          'emotional_perception',
          'emotional_understanding',
          'self_management',
          'emotional_facilitation',
          'empathy',
          'social_skills',
          'motivation',
        ],
        'reversed_questions': [
          2, 5, 8, // emotional_perception
          12, 15, 18, // emotional_understanding
          22, 25, 28, // self_management
          32, 35, 38, // emotional_facilitation
          42, 45, 48, // empathy
          52, 55, 58, // social_skills
          62, 65, 68, // motivation
        ],
        'response_type': 'frequency',
        'response_options': {
          'ru': ['Никогда', 'Редко', 'Иногда', 'Часто', 'Всегда'],
          'en': ['Never', 'Rarely', 'Sometimes', 'Often', 'Always'],
        },
        'scoring': [0, 1, 2, 3, 4],
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самооценки эмоционального интеллекта и личностного развития. '
              'Результаты не являются клиническим диагнозом. Для профессиональной оценки EQ рекомендуется '
              'консультация с психологом.',
          'en':
              'This test is for self-assessment of emotional intelligence and personal development. '
              'Results are not a clinical diagnosis. For professional EQ assessment, consultation '
              'with a psychologist is recommended.',
        },
        'interpretation_levels': {
          'very_low': '0-20%',
          'low': '21-40%',
          'medium': '41-60%',
          'high': '61-80%',
          'very_high': '81-100%',
        },
        'tags': [
          'emotional_intelligence',
          'eq',
          'emotions',
          'empathy',
          'self_management',
          'social_skills',
        ],
      };
}
