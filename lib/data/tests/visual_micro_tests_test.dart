import 'test_stub.dart';

/// Visual Micro Tests - A package of 10 visual perception micro-tests
///
/// Special test type that uses custom screen and accumulates trait scores
///
/// @version: 1.0.0
class VisualMicroTestsTest extends TestStub {
  @override
  String get id => 'visual_micro_tests_v1';

  @override
  String get category => 'visual';

  @override
  int get questionCount => 10; // 10 micro-tests

  @override
  int get estimatedMinutes => 5;

  @override
  String get type => 'special'; // Uses custom screen

  @override
  String get assetPath => ''; // Special test with custom screen

  @override
  Map<String, String> get name => {
    'ru': 'Визуальные Инсайты',
    'en': 'Visual Insights',
  };

  @override
  Map<String, String> get description => {
    'ru': 'Пакет из 10 визуальных микротестов для определения черт личности через первое впечатление',
    'en': 'A package of 10 visual micro-tests to determine personality traits through first impressions',
  };

  @override
  List<String> get tags => ['visual', 'quick', 'projective', 'special'];

  @override
  List<dynamic> get questions => []; // Questions loaded from data file

  @override
  Map<String, dynamic> get metadata => {
    'micro_test_count': 10,
    'scoring_method': 'trait_accumulation',
    'result_format': 'top_traits',
    'visual_elements': true,
    'custom_screen': true,
    'micro_test_ids': [
      'visual_test_01', // Первое впечатление
      'visual_test_02', // Геометрия выбора
      'visual_test_03', // Цветовой импульс
      'visual_test_04', // Двойное восприятие
      'visual_test_05', // Путь сквозь линии
      'visual_test_06', // Паттерн или порядок
      'visual_test_07', // Эмоция в абстракции
      'visual_test_08', // Баланс элементов
      'visual_test_09', // Текстура души
      'visual_test_10', // Горизонт или детали
    ],
    'traits_count': 95, // Total unique traits across all micro-tests
    'top_traits_display': 5,
  };
}
