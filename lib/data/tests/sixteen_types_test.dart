import 'test_stub.dart';

/// 16 Personality Types Test (Type Theory style)
///
/// An 80-question test to determine personality type based on
/// Jungian Type Theory dimensions: Extraversion/Introversion,
/// Sensing/Intuition, Thinking/Feeling, and Judging/Perceiving.
class SixteenTypesTest extends TestStub {
  @override
  String get id => 'sixteen_types';

  @override
  String get category => 'personality';

  @override
  Map<String, String> get name => {
        'ru': '16 типов личности',
        'en': '16 Personality Types',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест для определения типа личности по системе Personality Type: определите свой тип среди 16 возможных комбинаций',
        'en':
            'Personality Type-style test to determine your personality type among 16 possible combinations',
      };

  @override
  int get questionCount => 80;

  @override
  int get estimatedMinutes => 18;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'personality',
        'type_theory',
        'professional',
        'detailed',
        '16types',
      ];

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Psycho Tests',
        'category_display': {
          'ru': 'Личность',
          'en': 'Personality',
        },
        'factors': [
          'extraversion_introversion',
          'sensing_intuition',
          'thinking_feeling',
          'judging_perceiving',
        ],
      };
}
