import 'test_stub.dart';

/// Social Battery: Social Energy Diagnostic Test
///
/// Comprehensive assessment of social energy patterns across 6 dimensions:
/// depletion_rate, recharge_method, social_anxiety, solitude_need,
/// interaction_preference, and capacity_flexibility.
///
/// Based on Big Five Personality Theory (Extraversion), Jungian Theory,
/// Social Energy Depletion Model, and Social Anxiety Research.
///
/// Not a medical diagnosis. For self-awareness and social life optimization.
class SocialBatteryTest extends TestStub {
  @override
  String get id => 'social_battery_v1';

  @override
  String get category => 'personality';

  @override
  Map<String, String> get name => {
        'ru': 'Социальная батарея: Диагностика социальной энергии',
        'en': 'Social Battery: Social Energy Diagnostic',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Социальная батарея — это метафора, описывающая индивидуальную способность человека к социальному взаимодействию и его потребность в восстановлении после общения. Некоторые люди заряжаются от общения (экстраверты), другие теряют энергию (интроверты), а третьи находятся где-то посередине (амбиверты). Понимание своей социальной батареи критически важно для mental health и построения здоровых границ.',
        'en':
            'Social battery is a metaphor describing an individual\'s capacity for social interaction and their need for recovery after socializing. Some people recharge from interaction (extraverts), others lose energy (introverts), and some are in between (ambiverts). Understanding your social battery is crucial for mental health and building healthy boundaries.',
      };

  @override
  int get questionCount => 48;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'personality',
        'social_energy',
        'introversion',
        'extraversion',
        'comprehensive',
      ];

  @override
  String get assetPath => ''; // Legacy Dart architecture

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Social Psychology Research Institute',
        'category_display': {
          'ru': 'Типология личности',
          'en': 'Personality Typology',
        },
        'factors': [
          'depletion_rate',
          'recharge_method',
          'social_anxiety',
          'solitude_need',
          'interaction_preference',
          'capacity_flexibility',
        ],
        'factor_names': {
          'ru': {
            'depletion_rate': 'Скорость истощения',
            'recharge_method': 'Способ восстановления',
            'social_anxiety': 'Социальная тревожность',
            'solitude_need': 'Потребность в одиночестве',
            'interaction_preference': 'Предпочтения в общении',
            'capacity_flexibility': 'Гибкость батареи',
          },
          'en': {
            'depletion_rate': 'Depletion Rate',
            'recharge_method': 'Recharge Method',
            'social_anxiety': 'Social Anxiety',
            'solitude_need': 'Solitude Need',
            'interaction_preference': 'Interaction Preference',
            'capacity_flexibility': 'Capacity Flexibility',
          },
        },
        'scientific_basis': [
          'Big Five Personality Theory - Extraversion dimension',
          'Jungian Introversion-Extraversion Theory',
          'Social Energy Depletion Model',
          'Self-Determination Theory - Need for Autonomy',
          'Optimal Arousal Theory',
          'Social Anxiety Research',
        ],
      };
}
