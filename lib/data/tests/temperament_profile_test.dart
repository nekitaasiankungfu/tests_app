import 'test_stub.dart';

/// Temperament Profile Test
///
/// A comprehensive psychodiagnostic instrument for assessing temperament characteristics,
/// activity level, emotionality, and reaction style. Based on Pavlov, Eysenck typologies
/// and modern personality research.
///
/// Measures 6 key temperament aspects:
/// - Energy and Activity (EA) - life energy, initiative, mobility
/// - Emotional Stability (EU) - ability to maintain inner balance, emotional control
/// - Impulsivity and Self-Control (IS) - tendency to act spontaneously or thoughtfully
/// - Social Openness (SO) - need for communication, involvement, extraversion
/// - Tempo and Rhythm (TR) - reaction speed, thinking and action speed
/// - Flexibility and Adaptability (GA) - ability to switch, accept changes, regulate behavior
///
/// Not a medical diagnosis.
class TemperamentProfileTest extends TestStub {
  @override
  String get id => 'temperament_profile_test';

  @override
  String get category => 'temperament';

  @override
  Map<String, String> get name => {
        'ru': 'Профиль темперамента',
        'en': 'Temperament Profile',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Комплексная оценка темперамента: энергичность, эмоциональная устойчивость, импульсивность, социальная открытость, темп и гибкость',
        'en':
            'Comprehensive temperament assessment: energy, emotional stability, impulsivity, social openness, tempo and flexibility',
      };

  @override
  int get questionCount => 60;

  @override
  int get estimatedMinutes => 12;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'temperament',
        'personality',
        'comprehensive',
        'detailed',
        'pavlov',
        'eysenck',
      ];

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Psycho Tests',
        'category_display': {
          'ru': 'Темперамент',
          'en': 'Temperament',
        },
        'factors': [
          'ea', // Energy and Activity
          'eu', // Emotional Stability
          'is', // Impulsivity and Self-Control
          'so', // Social Openness
          'tr', // Tempo and Rhythm
          'ga', // Flexibility and Adaptability
        ],
        'factor_names': {
          'ru': {
            'ea': 'Энергичность и активность',
            'eu': 'Эмоциональная устойчивость',
            'is': 'Импульсивность и самоконтроль',
            'so': 'Социальная открытость',
            'tr': 'Темп и ритм',
            'ga': 'Гибкость и адаптивность',
          },
          'en': {
            'ea': 'Energy and Activity',
            'eu': 'Emotional Stability',
            'is': 'Impulsivity and Self-Control',
            'so': 'Social Openness',
            'tr': 'Tempo and Rhythm',
            'ga': 'Flexibility and Adaptability',
          },
        },
        'scientific_basis': [
          'Pavlov Temperament Theory',
          'Eysenck Personality Theory',
          'Modern Personality Research',
        ],
      };
}
