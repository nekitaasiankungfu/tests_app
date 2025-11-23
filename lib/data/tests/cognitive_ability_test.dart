import 'test_stub.dart';

/// Cognitive Ability Test: Assessment of mental capabilities
/// Test ID: cognitive_ability_v1
/// Questions: 60 (20 logical + 20 numerical + 20 verbal)
/// Factors: 3 (logical_reasoning, numerical_ability, verbal_ability)
/// Category: career
class CognitiveAbilityTest extends TestStub {
  @override
  String get id => 'cognitive_ability_v1';

  @override
  Map<String, String> get name => {
    'ru': 'Cognitive Ability Test',
    'en': 'Cognitive Ability Test',
  };

  @override
  Map<String, String> get description => {
    'ru': 'Оценка когнитивных способностей: логическое мышление, числовые способности и вербальный интеллект',
    'en': 'Assessment of cognitive abilities: logical reasoning, numerical ability, and verbal intelligence',
  };

  @override
  String get category => 'career';

  @override
  int get questionCount => 60;

  @override
  int get estimatedMinutes => 30;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => ['cognitive', 'iq', 'intelligence', 'career', 'analytical'];

  @override
  Map<String, dynamic> get metadata => {
    'author': 'Cognitive Assessment Institute',
    'version': '1.0',
    'factors': ['logical_reasoning', 'numerical_ability', 'verbal_ability'],
    'scoring_type': 'correct_answers',
    'has_correct_answers': true,
    'time_limited': true,
    'time_per_section_minutes': 10,
    'questions_per_factor': 20,
    'category_display': {
      'ru': '💼 Карьера',
      'en': '💼 Career',
    },
  };

  @override
  String get assetPath => ''; // Legacy Dart, no JSON needed
}