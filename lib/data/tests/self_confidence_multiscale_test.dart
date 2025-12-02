import 'test_stub.dart';

/// Многофакторный тест уверенности в себе (Self-Confidence Multiscale)
///
/// Оценка разных аспектов уверенности в себе по четырём ключевым компонентам:
/// - Общая вера в себя (general_self_belief) - базовое ощущение компетентности
/// - Социальная уверенность (social_assertiveness) - уверенность в общении
/// - Самопринятие (self_acceptance) - доброжелательность к себе
/// - Инициативность и устойчивость (initiative_resilience) - готовность действовать
///
/// Основан на:
/// - Теории самоэффективности А. Бандуры
/// - Гуманистическом подходе К. Роджерса (концепция "Я" и самопринятие)
/// - Когнитивно-поведенческом подходе (установки и убеждения о себе)
///
/// Содержит 32 вопроса с 5-балльной шкалой Лайкерта (0-4).
/// Время прохождения: ~10 минут.
/// Категория: Эмоциональное состояние
class SelfConfidenceMultiscaleTest extends TestStub {
  @override
  String get id => 'self_confidence_multiscale_v1';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Многофакторный тест уверенности в себе',
        'en': 'Self-Confidence Multiscale Test',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Оценка разных аспектов уверенности в себе: веры в собственные способности, '
            'уверенности в социальных ситуациях, отношения к себе и устойчивости к неудачам. '
            'Результаты помогут лучше понять ваши сильные стороны и зоны роста.',
        'en':
            'Assessment of different aspects of self-confidence: belief in your own abilities, '
            'confidence in social situations, self-attitude and resilience to failures. '
            'Results will help you better understand your strengths and growth areas.',
      };

  @override
  int get questionCount => 32;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'self_confidence',
        'self_esteem',
        'assertiveness',
        'emotional',
        'self_assessment',
        'personal_growth',
      ];

  @override
  String get assetPath => ''; // Legacy Dart architecture

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Psycho Tests',
        'year': 2025,
        'category_display': {
          'ru': 'Эмоциональное состояние',
          'en': 'Emotional State',
        },
        'factors': [
          'general_self_belief',
          'social_assertiveness',
          'self_acceptance',
          'initiative_resilience',
        ],
        'response_type': 'likert_5',
        'theoretical_basis': [
          'Теория самоэффективности А. Бандуры',
          'Гуманистический подход К. Роджерса',
          'Когнитивно-поведенческий подход',
        ],
        'disclaimer': {
          'ru':
              'Этот тест предназначен только для самопознания и личного развития. '
              'Он не является медицинским диагнозом и не заменяет консультацию специалиста.',
          'en':
              'This test is intended for self-knowledge and personal development only. '
              'It is not a medical diagnosis and does not replace consultation with a specialist.',
        },
        'interpretation_ranges': {
          'very_low': '0-20%',
          'low': '21-40%',
          'medium': '41-60%',
          'high': '61-80%',
          'very_high': '81-100%',
        },
      };
}
