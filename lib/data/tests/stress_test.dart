import 'test_stub.dart';

/// Stress Level Test
///
/// A simple 5-question test to assess current stress levels.
/// Measures tension, sleep quality, irritability, focus, and fatigue.
class StressTest extends TestStub {
  @override
  String get id => 'stress_test';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Тест на уровень стресса',
        'en': 'Stress Level Test',
      };

  @override
  Map<String, String> get description => {
        'ru': 'Определите уровень вашего стресса с помощью простого теста',
        'en': 'Determine your stress level with a simple test',
      };

  @override
  int get questionCount => 5;

  @override
  int get estimatedMinutes => 3;

  @override
  String get type => 'simple';

  @override
  List<String> get tags => [
        'mental_health',
        'stress',
        'well-being',
        'quick',
      ];

  @override
  String get assetPath => 'assets/tests/stress_test.json';

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Psycho Tests',
        'category_display': {
          'ru': 'Стресс',
          'en': 'Stress',
        },
      };
}
