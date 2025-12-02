import 'test_stub.dart';

/// Money Mindset & Financial Habits Test
///
/// Explores your money mindset — the beliefs and habits you hold around money.
/// Measures tendency toward impulsive spending, avoiding financial topics, rigid expense control,
/// fear of poverty, and shame connected with money.
///
/// Version: 1.0
/// Questions: 24
/// Estimated time: 7 minutes
/// Category: career
class MoneyMindsetHabitsTest extends TestStub {
  @override
  String get id => 'money_mindset_habits_v1';

  @override
  Map<String, String> get name => {
        'ru': 'Отношение к деньгам и финансовые привычки',
        'en': 'Money Mindset & Financial Habits',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест помогает понять, как вы обращаетесь с деньгами: склонны ли к импульсивным тратам, избеганию финансовых тем, жёсткому контролю, страху бедности и стыду за деньги.',
        'en':
            'This test helps you understand how you relate to money: whether you tend toward impulsive spending, avoiding financial topics, rigid control, fear of poverty, and money shame.',
      };

  @override
  String get category => 'career';

  @override
  int get questionCount => 24;

  @override
  int get estimatedMinutes => 7;

  @override
  String get type => 'multi_factor';

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'reversed_questions': [5, 9, 15, 19, 24],
        'has_disclaimer': true,
        'disclaimer': {
          'ru':
              'Этот тест помогает осознать свои финансовые привычки и установки, но не заменяет консультацию с финансовым специалистом или психологом. Если вы испытываете серьёзные сложности с управлением деньгами, рекомендуем обратиться к профессионалу.',
          'en':
              'This test helps you become aware of your financial habits and beliefs, but does not replace consultation with a financial specialist or psychologist. If you are experiencing serious difficulties with money management, we recommend seeking professional help.',
        },
        'scales': {
          'impulsive_spending': {
            'ru': 'Импульсивные траты',
            'en': 'Impulsive Spending',
            'item_count': 5,
            'max_score': 20,
          },
          'financial_avoidance': {
            'ru': 'Финансовое избегание и хаос',
            'en': 'Financial Avoidance & Chaos',
            'item_count': 5,
            'max_score': 20,
          },
          'control_strictness': {
            'ru': 'Жёсткий контроль и финансовая зажатость',
            'en': 'Rigid Control & Financial Tightness',
            'item_count': 5,
            'max_score': 20,
          },
          'poverty_fear': {
            'ru': 'Страх бедности и обнуления',
            'en': 'Fear of Poverty & Ruin',
            'item_count': 4,
            'max_score': 16,
          },
          'money_shame': {
            'ru': 'Стыд и самооценка, связанные с деньгами',
            'en': 'Money Shame & Self-Worth',
            'item_count': 5,
            'max_score': 20,
          },
        },
        'profile_count': 4,
      };

  @override
  List<String> get tags => [
        'career',
        'finance',
        'money_mindset',
        'financial_habits',
        'self_awareness',
      ];
}
