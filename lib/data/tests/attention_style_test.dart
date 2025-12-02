import 'test_stub.dart';

/// Stub for Attention Style Test.
///
/// Measures individual attention and concentration style through 5 factors.
/// Uses frequency scale (0-4: Never to Constantly).
/// Category: cognitive
///
/// IMPORTANT: This test is NOT a diagnostic tool for ADHD.
class AttentionStyleTest extends TestStub {
  @override
  String get id => 'attention_style';

  @override
  Map<String, String> get name => {
        'ru': 'Тест «Стиль внимания: мозг-пчёлка или лазер»',
        'en': 'Attention Style Test: Bee Brain or Laser Brain',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Узнайте, как работает ваше внимание: мозг-лазер, мозг-пчёлка или мозг-бабочка',
        'en':
            'Discover how your attention works: laser brain, bee brain, or butterfly brain',
      };

  @override
  String get category => 'intelligence';

  @override
  int get questionCount => 40;

  @override
  int get estimatedMinutes => 7;

  @override
  String get type => 'multi_factor';

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'category_display': 'Когнитивные способности',
        'question_type': 'frequency',
        'score_range': '0-4',
        'factors': 5,
        'profiles': 5,
        'has_reversed': false,
        'not_adhd_diagnosis': true,
      };

  @override
  List<String> get tags => ['attention', 'focus', 'cognitive', 'productivity'];
}
