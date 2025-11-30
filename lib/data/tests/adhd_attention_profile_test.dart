import 'test_stub.dart';

/// Тест профиля внимания и саморегуляции (расширенный)
///
/// Комплексная методика оценки особенностей внимания и саморегуляции,
/// основанная на клинических моделях СДВГ у взрослых и исследованиях
/// исполнительных функций.
///
/// Измеряет 5 ключевых показателей:
/// - Невнимательность и рассеянность (inattention)
/// - Гиперактивность и внутреннее беспокойство (hyperactivity_restlessness)
/// - Импульсивность (impulsivity)
/// - Организация и планирование (organization_planning)
/// - Эмоциональная саморегуляция (emotional_regulation)
///
/// Содержит 50 вопросов с 5-балльной шкалой частоты (никогда - всегда).
///
/// Версия: 2.0
/// Время прохождения: ~10 минут
/// Категория: Эмоциональное состояние
class ADHDAttentionProfileTest extends TestStub {
  @override
  String get id => 'adhd_attention_profile_v2';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Профиль внимания и саморегуляции',
        'en': 'Attention & Self-Regulation Profile',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Оцените, как устроены ваше внимание и саморегуляция в повседневной жизни. '
                'Тест не ставит диагноз и не заменяет консультацию специалиста — он показывает '
                'выраженность черт, которые часто встречаются у людей с особенностями внимания.',
        'en':
            'Assess how your attention and self-regulation work in everyday life. '
                'This test does not diagnose and does not replace professional consultation — it shows '
                'the expression of traits often found in people with attention characteristics.',
      };

  @override
  int get questionCount => 50;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'attention',
        'adhd',
        'self_regulation',
        'executive_functions',
        'impulsivity',
        'organization',
        'comprehensive',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '2.0',
        'author': 'Based on Adult ADHD Assessment Models',
        'year': 2025,
        'category_display': {
          'ru': 'Эмоциональное состояние',
          'en': 'Emotional State',
        },
        'factors': [
          'inattention',
          'hyperactivity_restlessness',
          'impulsivity',
          'organization_planning',
          'emotional_regulation',
        ],
        'reversed_questions': [
          12, 14, 15, 16, 18, 26, 27, 28, 29, 30, 36, 37, 38, 39, 40, 46, 47, 48, 49, 50
        ],
        'response_types': ['frequency_5'],
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самопознания и не является медицинским диагнозом. '
                  'Результаты могут стать отправной точкой для самопомощи, разговоров с близкими '
                  'или обсуждения с психотерапевтом/психиатром.',
          'en':
              'This test is for self-awareness and is not a medical diagnosis. '
                  'Results can be a starting point for self-help, conversations with loved ones, '
                  'or discussion with a psychotherapist/psychiatrist.',
        },
        'interpretation_ranges': {
          'low': '0-33%',
          'medium': '34-66%',
          'high': '67-100%',
        },
        'theoretical_basis': [
          'Clinical models of adult ADHD',
          'Executive function and self-regulation models (Barkley)',
          'Self-report ADHD-like traits assessment approaches',
        ],
        'profiles': [
          'balanced_attention',
          'inattentive_profile',
          'hyperactive_impulsive_profile',
          'mixed_profile',
        ],
      };
}
