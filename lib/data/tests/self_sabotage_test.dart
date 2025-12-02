import 'test_stub.dart';

/// Stub for Self-Sabotage: How You Get in Your Own Way Test.
///
/// Explores patterns of self-sabotaging behavior across 4 dimensions:
/// procrastination/avoidance, toxic relationship patterns, self-devaluation,
/// and fear of success/failure.
/// Uses frequency scale (0-4: Never to Always).
/// Category: emotional
///
/// IMPORTANT: This test is for self-awareness, not clinical diagnosis.
/// Identifies behavioral patterns that may undermine personal goals.
class SelfSabotageTest extends TestStub {
  @override
  String get id => 'self_sabotage_how_you_block_yourself_v1';

  @override
  Map<String, String> get name => {
        'ru': 'Самосаботаж: в чём ты сам себе ставишь палки в колёса?',
        'en': 'Self-Sabotage: How You Get in Your Own Way',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест помогает выявить паттерны поведения, которые мешают достижению целей: прокрастинация, токсичные отношения, самообесценивание и страх успеха/неудачи',
        'en':
            'This test helps identify behavioral patterns that undermine goal achievement: procrastination, toxic relationships, self-devaluation, and fear of success/failure',
      };

  @override
  String get category => 'emotional';

  @override
  int get questionCount => 24;

  @override
  int get estimatedMinutes => 7;

  @override
  String get type => 'multi_factor';

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'category_display': 'Эмоциональные состояния',
        'question_type': 'frequency_5',
        'score_range': '0-4',
        'factors': 4,
        'profiles': 4,
        'has_reversed': true,
        'reversed_questions': [4, 10, 16, 22], // One per scale
        'has_disclaimer': true,
      };

  @override
  List<String> get tags => [
        'emotional',
        'self_sabotage',
        'behavioral_patterns',
        'self_awareness',
        'personal_growth'
      ];
}
