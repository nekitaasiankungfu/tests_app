import 'question_weight_models.dart';

/// Question weights configuration for Conflict Communication Style Test
///
/// This test uses a STYLE-BASED weighting system where weights are assigned
/// per conflict style (avoiding, accommodating, competing, compromising, collaborating)
/// rather than per individual question.
///
/// When a user selects an answer:
/// 1. The answer maps to one of 5 styles (via factorOrder)
/// 2. That style's factor score increases by 1
/// 3. The style's weights contribute to psychological scales
///
/// Based on Thomas-Kilmann Conflict Mode Instrument (TKI):
/// - 2-dimensional model: Assertiveness × Cooperativeness
/// - 5 styles representing different combinations of these dimensions
///
/// Coverage: 32 scales (16% of 195) - ONLY scales from hierarchical_scales.dart + 8 personality type poles
/// Bipolar coverage: All 8 personality type poles (extraversion/introversion, sensing/intuition, thinking/feeling, judging/perceiving)
class ConflictCommunicationStyleWeights {
  static const Map<String, QuestionWeight> weights = {

    // =================================================================
    // AVOIDING - Low assertiveness, low cooperativeness
    // Withdrawal, postponement, sidestepping
    // Saved as factor_avoiding with score 0-45 (count of times selected)
    // =================================================================
    'conflict_communication_style_v1:factor_avoiding': QuestionWeight(
      testId: 'conflict_communication_style_v1',
      questionId: 'factor_avoiding',
      axisWeights: {
        // Primary characteristics (from hierarchical_scales.dart)
        'avoidant_coping': 0.9,
        'assertiveness': -0.8,
        'anxiety': 0.6,
        'stress_tolerance': -0.6,
        'decisiveness': -0.7,
        'procrastination': 0.5,
        'social_confidence': -0.6,
        'communication_quality': -0.5,

        // Personality type poles (special scales for type calculation)
        // Avoiding: withdraws from interaction → Introversion
        // Avoiding: postpones decisions → Perceiving
        'introversion': 0.7,   // Withdraws from interaction
        'perceiving': 0.6,     // Postpones, flexible
      },
    ),

    // =================================================================
    // ACCOMMODATING - Low assertiveness, high cooperativeness
    // Yielding, harmony-seeking, self-sacrifice
    // =================================================================
    'conflict_communication_style_v1:factor_accommodating': QuestionWeight(
      testId: 'conflict_communication_style_v1',
      questionId: 'factor_accommodating',
      axisWeights: {
        // Primary characteristics (from hierarchical_scales.dart)
        'cooperativeness': 1.0,
        'empathy': 0.9,
        'assertiveness': -0.7,
        'compassion': 0.8,
        'autonomy_need': -0.6,
        'social_confidence': -0.5,

        // Personality type poles (special scales for type calculation)
        // Accommodating: empathetic, values harmony → Feeling
        // Accommodating: flexible, adaptive → Perceiving
        'feeling': 0.8,        // Empathy, harmony
        'perceiving': 0.5,     // Flexible, adaptive
      },
    ),

    // =================================================================
    // COMPETING - High assertiveness, low cooperativeness
    // Dominance, win-lose orientation, forceful
    // =================================================================
    'conflict_communication_style_v1:factor_competing': QuestionWeight(
      testId: 'conflict_communication_style_v1',
      questionId: 'factor_competing',
      axisWeights: {
        // Primary characteristics (from hierarchical_scales.dart)
        'assertiveness': 1.0,
        'dominance': 0.9,
        'cooperativeness': -0.8,
        'power_motivation': 0.9,
        'decisiveness': 0.8,
        'achievement_motivation': 0.7,
        'ambition': 0.8,
        'empathy': -0.7,
        'compassion': -0.6,

        // Personality type poles (special scales for type calculation)
        // Competing: assertive, dominant → Extraversion
        // Competing: practical, action-focused → Sensing
        // Competing: objective, logical → Thinking
        // Competing: decisive, structured → Judging
        'extraversion': 0.8,   // Assertive, dominant
        'sensing': 0.6,        // Practical, action-focused
        'thinking': 0.8,       // Objective, logical
        'judging': 0.7,        // Decisive, controlling
      },
    ),

    // =================================================================
    // COMPROMISING - Medium assertiveness, medium cooperativeness
    // Middle ground, fairness, mutual concessions
    // =================================================================
    'conflict_communication_style_v1:factor_compromising': QuestionWeight(
      testId: 'conflict_communication_style_v1',
      questionId: 'factor_compromising',
      axisWeights: {
        // Primary characteristics (from hierarchical_scales.dart)
        'cooperativeness': 0.6,
        'assertiveness': 0.5,
        'decisiveness': 0.7,
        'conflict_management': 0.7,
        'communication_quality': 0.6,

        // Personality type poles (special scales for type calculation)
        // Compromising: balanced, moderate on all dimensions
        // Slight preference for practicality and flexibility
        'sensing': 0.4,        // Practical solutions
        'perceiving': 0.5,     // Flexible, adaptive
      },
    ),

    // =================================================================
    // COLLABORATING - High assertiveness, high cooperativeness
    // Win-win, integrative solutions, mutual satisfaction
    // =================================================================
    'conflict_communication_style_v1:factor_collaborating': QuestionWeight(
      testId: 'conflict_communication_style_v1',
      questionId: 'factor_collaborating',
      axisWeights: {
        // Primary characteristics (from hierarchical_scales.dart)
        'cooperativeness': 1.0,
        'assertiveness': 0.9,
        'conflict_resolution': 1.0,
        'communication_quality': 0.9,
        'empathy': 0.8,
        'active_listening': 0.9,
        'emotional_intelligence': 0.9,
        'analytical_thinking': 0.7,
        'curiosity': 0.7,
        'maturity': 0.8,
        'patience': 0.7,

        // Personality type poles (special scales for type calculation)
        // Collaborating: outgoing, engages actively → Extraversion
        // Collaborating: sees possibilities, creative → Intuition
        // Collaborating: values people, empathic → Feeling
        // Collaborating: plans collaboration, structured → Judging
        'extraversion': 0.7,   // Engages actively
        'intuition': 0.7,      // Sees possibilities
        'feeling': 0.8,        // Values people
        'judging': 0.6,        // Plans collaboration
      },
    ),
  };
}
