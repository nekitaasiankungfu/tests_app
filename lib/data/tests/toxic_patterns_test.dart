import 'test_stub.dart';

/// Stub for Toxic Patterns Test.
///
/// Identifies 6 toxic relationship patterns through behavioral assessments.
/// Uses frequency scale (0-4: Never to Constantly).
/// Category: emotional
class ToxicPatternsTest extends TestStub {
  @override
  String get id => 'toxic_patterns';

  @override
  Map<String, String> get name => {
        'ru': 'Тест токсичных паттернов',
        'en': 'Toxic Patterns Test',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Выявите скрытые токсичные паттерны в ваших отношениях и научитесь строить здоровое общение',
        'en':
            'Identify hidden toxic patterns in your relationships and learn to build healthy communication',
      };

  @override
  String get category => 'emotional';

  @override
  int get questionCount => 48;

  @override
  int get estimatedMinutes => 8;

  @override
  String get type => 'multi_factor';

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'category_display': 'Эмоциональное здоровье',
        'question_type': 'frequency',
        'score_range': '0-4',
        'factors': 6,
        'profiles': 5,
        'has_reversed': false,
      };

  @override
  List<String> get tags => ['relationships', 'emotional', 'toxicity', 'communication'];
}
