import 'test_stub.dart';

/// Stub for Mental Age: Style of Adulthood Test.
///
/// Explores your typical style of thinking and behaving in everyday life
/// through 4 life-stage patterns: inner child, teen rebel, young adult, inner elder.
/// Uses Likert 5-point scale (0-4).
/// Category: personality
///
/// IMPORTANT: This test is NOT about chronological age or intelligence.
/// It's a metaphorical assessment of your dominant life-style pattern.
class MentalAgeLifespanStylesTest extends TestStub {
  @override
  String get id => 'mental_age_lifespan_styles_v1';

  @override
  Map<String, String> get name => {
        'ru': 'Ментальный возраст: стиль взрослости',
        'en': 'Mental Age: Style of Adulthood',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест помогает оценить ваш условный «ментальный возраст» — то, как вы думаете, принимаете решения и относитесь к жизни: по-детски, по-подростковому, как молодой взрослый или как мудрый старший',
        'en':
            'This test helps you estimate your metaphorical \'mental age\' – how you think, make decisions, and relate to life: more like a child, a teenager, a young adult, or a wise elder',
      };

  @override
  String get category => 'personality';

  @override
  int get questionCount => 36;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor';

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'category_display': 'Типология личности',
        'question_type': 'likert_5',
        'score_range': '0-4',
        'factors': 4,
        'profiles': 4,
        'has_reversed': true,
        'reversed_questions': [13, 14, 15, 16], // One per factor
        'not_age_or_iq': true,
      };

  @override
  List<String> get tags => [
        'personality',
        'mental_age',
        'life_style',
        'development',
        'self_discovery'
      ];
}
