import 'test_stub.dart';

/// Fisher Temperament Inventory
///
/// A 56-question test developed by Dr. Helen Fisher to identify
/// temperament types based on brain chemistry: Explorer, Builder,
/// Director, and Negotiator.
class FisherTemperamentTest extends TestStub {
  @override
  String get id => 'fisher_temperament';

  @override
  String get category => 'temperament';

  @override
  Map<String, String> get name => {
        'ru': 'Темперамент Фишер',
        'en': 'Fisher Temperament',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест темперамента доктора Хелен Фишер для определения типа личности: Исследователь, Строитель, Директор или Переговорщик',
        'en':
            'Dr. Helen Fisher\'s temperament test to identify personality type: Explorer, Builder, Director, or Negotiator',
      };

  @override
  int get questionCount => 56;

  @override
  int get estimatedMinutes => 12;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'personality',
        'temperament',
        'brain_chemistry',
        'detailed',
        'fisher',
      ];

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Dr. Helen Fisher',
        'category_display': {
          'ru': 'Личность',
          'en': 'Personality',
        },
        'factors': [
          'explorer',
          'builder',
          'director',
          'negotiator',
        ],
      };
}
