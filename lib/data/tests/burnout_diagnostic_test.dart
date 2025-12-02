import 'test_stub.dart';

/// Тест на диагностику профессионального выгорания
///
/// Комплексная методика оценки синдрома профессионального выгорания,
/// основанная на модели Кристины Маслач и современных исследованиях.
///
/// Измеряет 7 ключевых показателей выгорания:
/// - Эмоциональное истощение (emotional_exhaustion)
/// - Деперсонализация (depersonalization)
/// - Снижение профессиональной эффективности (reduced_efficacy)
/// - Физические симптомы (physical_symptoms)
/// - Когнитивные нарушения (cognitive_impairment)
/// - Потеря мотивации (motivation_loss)
/// - Рабочая среда (work_environment)
///
/// Содержит 54 вопроса с различными типами ответов:
/// - Частота проявления симптомов (никогда - постоянно)
/// - Согласие с утверждениями (5-балльная шкала)
/// - Множественный выбор
///
/// Версия: 1.0
/// Время прохождения: ~12 минут
/// Категория: Эмоциональное состояние
class BurnoutDiagnosticTest extends TestStub {
  @override
  String get id => 'burnout_diagnostic_v1';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Диагностика профессионального выгорания',
        'en': 'Burnout Diagnostic Assessment',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Комплексная диагностика синдрома профессионального выгорания. '
            'Тест измеряет эмоциональное истощение, деперсонализацию, снижение эффективности, '
            'физические симптомы, когнитивные нарушения и другие аспекты выгорания.',
        'en':
            'Comprehensive burnout syndrome diagnostic. '
            'The test measures emotional exhaustion, depersonalization, reduced efficacy, '
            'physical symptoms, cognitive impairment and other burnout aspects.',
      };

  @override
  int get questionCount => 54;

  @override
  int get estimatedMinutes => 12;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'burnout',
        'stress',
        'work',
        'mental_health',
        'professional',
        'comprehensive',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Based on Maslach Burnout Inventory',
        'year': 2025,
        'category_display': 'Эмоциональное состояние',
        'factors': [
          'emotional_exhaustion',
          'depersonalization',
          'reduced_efficacy',
          'physical_symptoms',
          'cognitive_impairment',
          'motivation_loss',
          'work_environment',
        ],
        'reversed_questions': [21, 24, 28, 35, 38, 40, 45, 52, 53, 54],
        'response_types': ['frequency', 'likert_5', 'multiple_choice'],
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самооценки и не заменяет профессиональную '
              'психологическую консультацию. При наличии признаков выгорания рекомендуется '
              'обратиться к специалисту.',
          'en':
              'This test is for self-assessment and does not replace professional '
              'psychological consultation. If you experience burnout symptoms, please '
              'consult a specialist.',
        },
        'interpretation_ranges': {
          'low': '0-35%',
          'medium': '36-65%',
          'high': '66-100%',
        },
        'tags': ['burnout', 'stress', 'work', 'mental_health', 'professional'],
      };
}
