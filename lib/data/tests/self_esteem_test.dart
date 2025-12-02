import 'test_stub.dart';

/// Self-Esteem Test
///
/// A 5-question test to assess self-esteem levels.
/// Evaluates self-perception, confidence, self-criticism, appearance satisfaction,
/// and social comparison tendencies.
class SelfEsteemTest extends TestStub {
  @override
  String get id => 'self_esteem_test';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Тест на самооценку',
        'en': 'Self-Esteem Test',
      };

  @override
  Map<String, String> get description => {
        'ru': 'Оцените уровень вашей самооценки',
        'en': 'Assess your level of self-esteem',
      };

  @override
  int get questionCount => 5;

  @override
  int get estimatedMinutes => 4;

  @override
  String get type => 'simple';

  @override
  List<String> get tags => [
        'personality',
        'self-esteem',
        'confidence',
        'quick',
      ];

  @override
  String get assetPath => 'assets/tests/self_esteem_test.json';

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Psycho Tests',
        'category_display': {
          'ru': 'Личность',
          'en': 'Personality',
        },
      };
}
