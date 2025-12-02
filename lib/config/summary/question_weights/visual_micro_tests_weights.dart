import 'question_weight_models.dart';

/// Question weights for Visual Micro Tests
///
/// Maps micro-test options to hierarchical scales (195) and bipolar poles (8)
/// Weights: 0.05-0.10 (light influence, as these are micro-tests)
///
/// Coverage: ~40 options × avg 8 weights = ~320 weight mappings
/// Only traits that map to existing hierarchical scales are included
///
/// @version: 1.0.0
class VisualMicroTestsWeights {
  static final Map<String, QuestionWeight> weights = {
    // ========================================================================
    // VISUAL TEST 01: Первое впечатление (4 options)
    // ========================================================================

    'visual_micro_tests_v1:visual_test_01:A': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_01:A',
      axisWeights: {
        // Hierarchical (emotional_openness: 3, spontaneity: 2, optimism: 2)
        'emotional_openness': 0.10,
        'spontaneity': 0.08,
        'positive_emotions': 0.08, // optimism → positive_emotions
        // Bipolar
        'feeling': 0.05,
        'extraversion': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_01:B': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_01:B',
      axisWeights: {
        // Hierarchical (analytical_thinking: 3, orderliness: 2, rational_approach: 2)
        'analytical_thinking': 0.10,
        'order': 0.08, // orderliness → order
        'problem_solving': 0.08, // rational_approach → problem_solving
        // Bipolar
        'thinking': 0.08,
        'sensing': 0.06,
        'judging': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_01:C': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_01:C',
      axisWeights: {
        // Hierarchical (intuition: 3, emotional_openness: 2, holistic_thinking: 2)
        'feelings': 0.10, // intuition → feelings (closest match)
        'emotional_openness': 0.08,
        'abstract_reasoning': 0.08, // holistic_thinking → abstract_reasoning
        // Bipolar
        'intuition': 0.08,
        'feeling': 0.06,
      },
    ),

    'visual_micro_tests_v1:visual_test_01:D': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_01:D',
      axisWeights: {
        // Hierarchical (creativity: 3, spontaneity: 2, energy_level: 2)
        'originality': 0.10, // creativity → originality
        'spontaneity': 0.08,
        'activity': 0.08, // energy_level → activity
        // Bipolar
        'perceiving': 0.08,
        'extraversion': 0.05,
      },
    ),

    // ========================================================================
    // VISUAL TEST 02: Геометрия выбора (4 options)
    // ========================================================================

    'visual_micro_tests_v1:visual_test_02:circle': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_02:circle',
      axisWeights: {
        // Hierarchical (sociability: 3, harmony_seeking: 3, empathy: 2)
        'gregariousness': 0.10, // sociability → gregariousness
        'compliance': 0.10, // harmony_seeking → compliance
        'empathy': 0.08,
        // Bipolar
        'feeling': 0.08,
        'extraversion': 0.06,
      },
    ),

    'visual_micro_tests_v1:visual_test_02:square': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_02:square',
      axisWeights: {
        // Hierarchical (orderliness: 3, systematicity: 3, need_for_structure: 2)
        'order': 0.10,
        'organization': 0.10, // systematicity → organization
        'deliberation': 0.08, // need_for_structure → deliberation
        // Bipolar
        'sensing': 0.08,
        'judging': 0.08,
        'thinking': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_02:triangle': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_02:triangle',
      axisWeights: {
        // Hierarchical (ambition: 3, leadership: 2, decisiveness: 2)
        'ambition': 0.10,
        'dominance': 0.08, // leadership → dominance
        'decisiveness': 0.08,
        // Bipolar
        'thinking': 0.06,
        'judging': 0.07,
        'extraversion': 0.06,
      },
    ),

    'visual_micro_tests_v1:visual_test_02:spiral': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_02:spiral',
      axisWeights: {
        // Hierarchical (creativity: 3, non_linear_thinking: 2, complexity: 2)
        'originality': 0.10,
        'divergent_thinking': 0.08, // non_linear_thinking → divergent_thinking
        'cognitive_flexibility': 0.08, // complexity → cognitive_flexibility
        // Bipolar
        'intuition': 0.10,
        'perceiving': 0.08,
      },
    ),

    // ========================================================================
    // VISUAL TEST 03: Цветовой импульс (5 options)
    // ========================================================================

    'visual_micro_tests_v1:visual_test_03:red': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_03:red',
      axisWeights: {
        // Hierarchical (energy_level: 3, passion: 3, assertiveness: 2)
        'activity': 0.10,
        'passion_vitality': 0.10,
        'assertiveness': 0.08,
        // Bipolar
        'extraversion': 0.08,
        'sensing': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_03:blue': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_03:blue',
      axisWeights: {
        // Hierarchical (calmness: 3, trustworthiness: 2, orderliness: 2)
        'calmness': 0.10,
        'trust': 0.08, // trustworthiness → trust
        'order': 0.08,
        // Bipolar
        'introversion': 0.08,
        'thinking': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_03:yellow': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_03:yellow',
      axisWeights: {
        // Hierarchical (optimism: 3, spontaneity: 2, sociability: 2)
        'positive_emotions': 0.10,
        'spontaneity': 0.08,
        'gregariousness': 0.08,
        // Bipolar
        'extraversion': 0.08,
        'perceiving': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_03:green': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_03:green',
      axisWeights: {
        // Hierarchical (balance: 3, growth_mindset: 2, calmness: 3)
        'emotional_resilience': 0.10, // balance → emotional_resilience
        'growth_mindset': 0.08,
        'calmness': 0.10,
        // Bipolar
        'feeling': 0.06,
        'judging': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_03:purple': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_03:purple',
      axisWeights: {
        // Hierarchical (creativity: 3, intuition: 2, idealism: 2)
        'originality': 0.10,
        'feelings': 0.08,
        'values': 0.08, // idealism → values
        // Bipolar
        'intuition': 0.10,
        'feeling': 0.05,
      },
    ),

    // ========================================================================
    // VISUAL TEST 04: Двойное восприятие (2 options)
    // ========================================================================

    'visual_micro_tests_v1:visual_test_04:vase': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_04:vase',
      axisWeights: {
        // Hierarchical (detail_orientation: 3, analytical_thinking: 2, focus: 2)
        'attention_control': 0.10, // detail_orientation → attention_control
        'analytical_thinking': 0.08,
        'attention_control': 0.08, // focus already mapped above, keeping as is
        // Bipolar
        'thinking': 0.08,
        'sensing': 0.06,
        'introversion': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_04:faces': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_04:faces',
      axisWeights: {
        // Hierarchical (social_awareness: 3, empathy: 2, holistic_perception: 2)
        'social_perception': 0.10,
        'empathy': 0.08,
        'abstract_reasoning': 0.08, // holistic_perception → abstract_reasoning
        // Bipolar
        'feeling': 0.08,
        'intuition': 0.06,
        'extraversion': 0.05,
      },
    ),

    // ========================================================================
    // VISUAL TEST 05: Путь сквозь линии (3 options)
    // ========================================================================

    'visual_micro_tests_v1:visual_test_05:straight': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_05:straight',
      axisWeights: {
        // Hierarchical (decisiveness: 3, efficiency: 2, rational_approach: 2)
        'decisiveness': 0.10,
        'organization': 0.08, // efficiency → organization
        'problem_solving': 0.08,
        // Bipolar
        'thinking': 0.08,
        'judging': 0.08,
        'sensing': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_05:wavy': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_05:wavy',
      axisWeights: {
        // Hierarchical (adaptability: 3, gentleness: 2, emotional_fluency: 2)
        'adaptability_leadership': 0.10,
        'tender_mindedness': 0.08, // gentleness → tender_mindedness
        'emotional_intelligence': 0.08, // emotional_fluency → emotional_intelligence
        // Bipolar
        'feeling': 0.06,
        'perceiving': 0.08,
      },
    ),

    'visual_micro_tests_v1:visual_test_05:spiral': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_05:spiral',
      axisWeights: {
        // Hierarchical (non_linear_thinking: 3, creativity: 2, philosophical_thinking: 2)
        'divergent_thinking': 0.10,
        'originality': 0.08,
        'wisdom': 0.08, // philosophical_thinking → wisdom
        // Bipolar
        'intuition': 0.10,
        'perceiving': 0.06,
      },
    ),

    // ========================================================================
    // VISUAL TEST 06: Паттерн или порядок (4 options)
    // ========================================================================

    'visual_micro_tests_v1:visual_test_06:grid': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_06:grid',
      axisWeights: {
        // Hierarchical (systematicity: 3, need_for_structure: 3, orderliness: 2)
        'organization': 0.10,
        'order': 0.10,
        'order': 0.08, // orderliness (already mapped)
        // Bipolar
        'sensing': 0.08,
        'judging': 0.10,
        'thinking': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_06:chaos': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_06:chaos',
      axisWeights: {
        // Hierarchical (tolerance_for_ambiguity: 3, spontaneity: 2, openness_to_experience: 2)
        'cognitive_flexibility': 0.10,
        'spontaneity': 0.08,
        'novelty_seeking': 0.08, // openness_to_experience → novelty_seeking
        // Bipolar
        'perceiving': 0.10,
        'intuition': 0.06,
      },
    ),

    'visual_micro_tests_v1:visual_test_06:waves': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_06:waves',
      axisWeights: {
        // Hierarchical (aesthetic_sensitivity: 3, harmony_seeking: 2, emotional_openness: 2)
        'aesthetics': 0.10,
        'compliance': 0.08,
        'emotional_openness': 0.08,
        // Bipolar
        'feeling': 0.08,
        'perceiving': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_06:fractal': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_06:fractal',
      axisWeights: {
        // Hierarchical (complexity: 3, pattern_recognition: 2, analytical_thinking: 2)
        'cognitive_flexibility': 0.10,
        'abstract_reasoning': 0.08,
        'analytical_thinking': 0.08,
        // Bipolar
        'intuition': 0.08,
        'thinking': 0.06,
      },
    ),

    // ========================================================================
    // VISUAL TEST 07: Эмоция в абстракции (3 options)
    // ========================================================================

    'visual_micro_tests_v1:visual_test_07:calm': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_07:calm',
      axisWeights: {
        // Hierarchical (inner_peace: 3, emotional_stability: 2, groundedness: 2)
        'life_satisfaction': 0.10, // inner_peace → life_satisfaction
        'emotional_resilience': 0.08,
        'calmness': 0.08, // groundedness → calmness
        // Bipolar
        'introversion': 0.06,
        'thinking': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_07:curiosity': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_07:curiosity',
      axisWeights: {
        // Hierarchical (curiosity: 3, intellectual_curiosity: 2, openness_to_experience: 2)
        'curiosity': 0.10,
        'intellectual_curiosity': 0.08,
        'novelty_seeking': 0.08,
        // Bipolar
        'intuition': 0.08,
        'perceiving': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_07:tension': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_07:tension',
      axisWeights: {
        // Hierarchical (alertness: 3, energy_level: 2, sensitivity_to_ambiguity: 2)
        'attention_control': 0.10,
        'activity': 0.08,
        'anxiety': 0.08, // sensitivity_to_ambiguity → anxiety
        // Bipolar
        'sensing': 0.06,
        'judging': 0.05,
      },
    ),

    // ========================================================================
    // VISUAL TEST 08: Баланс элементов (3 options)
    // ========================================================================

    'visual_micro_tests_v1:visual_test_08:symmetry': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_08:symmetry',
      axisWeights: {
        // Hierarchical (orderliness: 3, aesthetic_sensitivity: 2, perfectionism: 2)
        'order': 0.10,
        'aesthetics': 0.08,
        'perfectionism': 0.08,
        // Bipolar
        'sensing': 0.08,
        'judging': 0.08,
      },
    ),

    'visual_micro_tests_v1:visual_test_08:asymmetry': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_08:asymmetry',
      axisWeights: {
        // Hierarchical (creativity: 3, tolerance_for_imbalance: 2, individuality: 2)
        'originality': 0.10,
        'cognitive_flexibility': 0.08,
        'autonomy_need': 0.08, // individuality → autonomy_need
        // Bipolar
        'intuition': 0.08,
        'perceiving': 0.06,
      },
    ),

    'visual_micro_tests_v1:visual_test_08:centered': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_08:centered',
      axisWeights: {
        // Hierarchical (balance: 3, focus: 2, groundedness: 2)
        'emotional_resilience': 0.10,
        'attention_control': 0.08,
        'calmness': 0.08,
        // Bipolar
        'thinking': 0.06,
        'introversion': 0.05,
      },
    ),

    // ========================================================================
    // VISUAL TEST 09: Текстура души (4 options)
    // ========================================================================

    'visual_micro_tests_v1:visual_test_09:smooth': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_09:smooth',
      axisWeights: {
        // Hierarchical (calmness: 3, efficiency: 2, minimalist_preference: 1)
        'calmness': 0.10,
        'organization': 0.08,
        'self_discipline': 0.05, // minimalist_preference (close match)
        // Bipolar
        'thinking': 0.06,
        'sensing': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_09:rough': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_09:rough',
      axisWeights: {
        // Hierarchical (toughness: 3, resilience: 2, directness: 2)
        'emotional_resilience': 0.10,
        'resilience_meta': 0.08,
        'assertiveness': 0.08, // directness → assertiveness
        // Bipolar
        'sensing': 0.08,
        'thinking': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_09:soft': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_09:soft',
      axisWeights: {
        // Hierarchical (gentleness: 3, empathy: 2, emotional_sensitivity: 2)
        'tender_mindedness': 0.10,
        'empathy': 0.08,
        'emotional_reactivity': 0.08,
        // Bipolar
        'feeling': 0.10,
        'introversion': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_09:structured': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_09:structured',
      axisWeights: {
        // Hierarchical (layered_thinking: 2, complexity: 2, intellectual_engagement: 2)
        'cognitive_flexibility': 0.08,
        'cognitive_flexibility': 0.08, // complexity (already mapped)
        'intellectual_curiosity': 0.08,
        // Bipolar
        'thinking': 0.06,
        'judging': 0.06,
        'intuition': 0.05,
      },
    ),

    // ========================================================================
    // VISUAL TEST 10: Горизонт или детали (4 options)
    // ========================================================================

    'visual_micro_tests_v1:visual_test_10:horizon': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_10:horizon',
      axisWeights: {
        // Hierarchical (vision_orientation: 3, future_focus: 2, ambition: 2)
        'vision': 0.10,
        'strategic_thinking': 0.08, // future_focus → strategic_thinking
        'ambition': 0.08,
        // Bipolar
        'intuition': 0.08,
        'judging': 0.06,
      },
    ),

    'visual_micro_tests_v1:visual_test_10:sky': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_10:sky',
      axisWeights: {
        // Hierarchical (idealism: 3, dreaming_tendency: 2, openness_to_experience: 2)
        'values': 0.10,
        'fantasy': 0.08, // dreaming_tendency → fantasy
        'novelty_seeking': 0.08,
        // Bipolar
        'intuition': 0.10,
        'feeling': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_10:foreground': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_10:foreground',
      axisWeights: {
        // Hierarchical (detail_orientation: 3, present_moment_awareness: 2, pragmatism: 2)
        'attention_control': 0.10,
        'mindfulness_coping': 0.08,
        'problem_focused_coping': 0.08, // pragmatism → problem_focused_coping
        // Bipolar
        'sensing': 0.10,
        'introversion': 0.05,
      },
    ),

    'visual_micro_tests_v1:visual_test_10:overall': QuestionWeight(
      testId: 'visual_micro_tests_v1',
      questionId: 'visual_test_10:overall',
      axisWeights: {
        // Hierarchical (big_picture_thinking: 3, holistic_perception: 2, gestalt_thinking: 2)
        'abstract_reasoning': 0.10,
        'abstract_reasoning': 0.08, // holistic_perception (already mapped)
        'abstract_reasoning': 0.08, // gestalt_thinking (already mapped)
        // Bipolar
        'intuition': 0.08,
        'feeling': 0.06,
      },
    ),
  };
}
