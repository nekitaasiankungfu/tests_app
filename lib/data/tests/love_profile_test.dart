import 'test_stub.dart';

/// Love Profile Test
///
/// A 60-question comprehensive test to assess relationship compatibility
/// and love styles. Measures various aspects of romantic relationships
/// including intimacy, passion, and commitment.
class LoveProfileTest extends TestStub {
  @override
  String get id => 'love_profile';

  @override
  String get category => 'relationships';

  @override
  Map<String, String> get name => {
        'ru': 'Профиль любви',
        'en': 'Love Profile',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Комплексный тест для оценки стиля любви и совместимости в отношениях: интимность, страсть и обязательства',
        'en':
            'Comprehensive test to assess love style and relationship compatibility: intimacy, passion, and commitment',
      };

  @override
  int get questionCount => 60;

  @override
  int get estimatedMinutes => 15;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'relationships',
        'love',
        'compatibility',
        'detailed',
        'intimacy',
      ];

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Psycho Tests',
        'category_display': {
          'ru': 'Отношения',
          'en': 'Relationships',
        },
        'factors': [
          'intimacy',
          'passion',
          'commitment',
        ],
      };
}
