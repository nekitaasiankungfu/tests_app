import 'test_stub.dart';

/// IPIP Big Five Personality Test
///
/// The 50-item International Personality Item Pool Big Five test.
/// Measures the Big Five personality traits: Openness, Conscientiousness,
/// Extraversion, Agreeableness, and Neuroticism (emotional stability).
class IPIPBigFiveTest extends TestStub {
  @override
  String get id => 'ipip_big_five';

  @override
  String get category => 'personality';

  @override
  Map<String, String> get name => {
        'ru': 'IPIP Big Five',
        'en': 'IPIP Big Five',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест Большой Пятерки для оценки основных черт личности: открытость опыту, добросовестность, экстраверсия, доброжелательность и эмоциональная стабильность',
        'en':
            'Big Five personality test measuring Openness, Conscientiousness, Extraversion, Agreeableness, and Neuroticism',
      };

  @override
  int get questionCount => 50;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'personality',
        'big5',
        'professional',
        'detailed',
        'ipip',
      ];

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'International Personality Item Pool',
        'category_display': {
          'ru': 'Личность',
          'en': 'Personality',
        },
        'factors': [
          'openness',
          'conscientiousness',
          'extraversion',
          'agreeableness',
          'neuroticism',
        ],
      };
}
