import 'test_stub.dart';

/// Values and Priorities: Personal Values and Life Priorities Assessment
///
/// Comprehensive assessment of personal values and life priorities across 10 core value dimensions.
/// Each dimension measures both importance (subjective significance) and energy (actual investment).
///
/// Based on:
/// - Schwartz Basic Values Theory
/// - Humanistic Psychology (Rogers, Maslow)
/// - Self-Determination Theory (Deci & Ryan)
/// - Value-Based Living approach in Positive Psychology
///
/// Measures 10 value dimensions:
/// - Security and Stability (security_importance, security_energy)
/// - Freedom and Autonomy (freedom_importance, freedom_energy)
/// - Achievement and Success (achievement_importance, achievement_energy)
/// - Creativity and Self-Realization (creativity_importance, creativity_energy)
/// - Relationships and Closeness (relationships_importance, relationships_energy)
/// - Growth and Learning (growth_importance, growth_energy)
/// - Influence and Leadership (influence_importance, influence_energy)
/// - Comfort and Pleasure (comfort_importance, comfort_energy)
/// - Contribution and Helping Others (contribution_importance, contribution_energy)
/// - Health and Life Balance (health_balance_importance, health_balance_energy)
///
/// Composite Indices:
/// - Overall Importance Index
/// - Overall Energy Index
/// - Values Alignment Index (importance-energy gap)
/// - Top 5 Values by Importance
/// - Top 5 Values by Energy Investment
///
/// Not a medical diagnosis. For self-awareness, career planning, and life optimization.
class ValuesPrioritiesTest extends TestStub {
  @override
  String get id => 'values_priorities_v1';

  @override
  String get category => 'personality';

  @override
  Map<String, String> get name => {
        'ru': 'Личностные ценности и жизненные приоритеты',
        'en': 'Personal Values and Life Priorities',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Этот тест помогает выявить ваши ключевые жизненные ценности и понять, куда в реальности уходит ваша энергия. '
            'Он одновременно оценивает, что для вас важно (уровень значимости ценности) и насколько вы вкладываете в это время, силы и внимание в повседневной жизни. '
            'Результат позволит увидеть топ-5 ваших ведущих ценностей и сравнить их с теми сферами, куда вы действительно инвестируете ресурсы сейчас. '
            'Это может стать основой для выбора карьеры, планирования изменений и выстраивания более осознанного стиля жизни.',
        'en':
            'This test helps identify your key life values and understand where your energy actually goes. '
            'It simultaneously evaluates what is important to you (value significance level) and how much time, effort, and attention you invest in it in daily life. '
            'The results will reveal your top 5 leading values and compare them with the areas where you currently invest resources. '
            'This can serve as a foundation for career choices, planning changes, and building a more conscious lifestyle.',
      };

  @override
  int get questionCount => 40;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'personality',
        'values',
        'priorities',
        'career',
        'self_awareness',
        'life_planning',
        'comprehensive',
      ];

  @override
  String get assetPath => ''; // Legacy Dart architecture

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'GPT-5.1 Thinking with Nikita',
        'year': 2025,
        'category_display': {
          'ru': 'Типология личности',
          'en': 'Personality Typology',
        },
        'factors': [
          'security_importance',
          'security_energy',
          'freedom_importance',
          'freedom_energy',
          'achievement_importance',
          'achievement_energy',
          'creativity_importance',
          'creativity_energy',
          'relationships_importance',
          'relationships_energy',
          'growth_importance',
          'growth_energy',
          'influence_importance',
          'influence_energy',
          'comfort_importance',
          'comfort_energy',
          'contribution_importance',
          'contribution_energy',
          'health_balance_importance',
          'health_balance_energy',
        ],
        'value_dimensions': [
          'security',
          'freedom',
          'achievement',
          'creativity',
          'relationships',
          'growth',
          'influence',
          'comfort',
          'contribution',
          'health_balance',
        ],
        'composite_indices': [
          'overall_importance_index',
          'overall_energy_index',
          'values_alignment_index',
          'top5_values_importance',
          'top5_values_energy',
        ],
        'reversed_questions': [3, 4, 7, 8, 11, 12, 15, 16, 19, 20, 23, 24, 27, 28, 31, 32, 35, 36, 39, 40],
        'response_type': 'likert_5',
        'scientific_basis': [
          'Schwartz Basic Values Theory',
          'Humanistic Psychology (Rogers, Maslow)',
          'Self-Determination Theory (Deci & Ryan)',
          'Value-Based Living approach in Positive Psychology',
        ],
        'target_audience': 'Adults (18+) interested in self-knowledge, career planning, and conscious living',
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самооценки и не заменяет профессиональную консультацию. '
              'Результаты могут использоваться для личного развития, планирования карьеры и принятия жизненных решений.',
          'en':
              'This test is for self-assessment and does not replace professional consultation. '
              'Results can be used for personal development, career planning, and life decision-making.',
        },
        'interpretation_ranges': {
          'low': '0-33%',
          'medium': '34-66%',
          'high': '67-100%',
        },
      };
}
