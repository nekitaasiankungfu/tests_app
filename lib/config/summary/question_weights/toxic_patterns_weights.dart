import 'question_weight_models.dart';

/// Question weights for Toxic Patterns Test.
///
/// Maps 48 questions to psychological scales:
/// - Passive Aggression (Q1-8) → indirect_communication, anger_expression, assertiveness
/// - Silent Treatment (Q9-16) → emotional_withdrawal, control, conflict_avoidance
/// - Dramatization (Q17-24) → emotional_intensity, attention_seeking, emotional_regulation
/// - Devaluation (Q25-32) → empathy, respect, criticism
/// - Victim Mentality (Q33-40) → personal_responsibility, self_victimization, external_locus_of_control
/// - Manipulation & Gaslighting (Q41-48) → manipulation, honesty, trust, gaslighting
///
/// All scales use existing hierarchical scales.
/// Scores: 0-4 (frequency scale: Never to Constantly)
class ToxicPatternsWeights {
  static final Map<String, QuestionWeight> weights = {
    // Passive Aggression (Q1-8)
    'toxic_patterns:q1': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q1',
      axisWeights: {
        'anger_expression': -0.9, // Indirect anger expression
        'emotional_honesty': -0.85,
        'assertiveness': -0.7,
        'conflict_avoidance': 0.6,
      },
    ),
    'toxic_patterns:q2': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q2',
      axisWeights: {
        'anger_expression': -0.8,
        'emotional_honesty': -0.85,
        'sarcasm_usage': 0.9,
        'assertiveness': -0.7,
      },
    ),
    'toxic_patterns:q3': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q3',
      axisWeights: {
        'anger_expression': -0.8,
        'reliability': -0.8,
        'assertiveness': -0.75,
        'conflict_avoidance': 0.7,
      },
    ),
    'toxic_patterns:q4': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q4',
      axisWeights: {
        'communication_clarity': -0.85,
        'emotional_honesty': -0.8,
        'manipulation': 0.6,
      },
    ),
    'toxic_patterns:q5': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q5',
      axisWeights: {
        'reliability': -0.9,
        'anger_expression': -0.8,
        'assertiveness': -0.8,
        'sabotage_tendency': 0.85,
      },
    ),
    'toxic_patterns:q6': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q6',
      axisWeights: {
        'communication_clarity': -0.85,
        'emotional_honesty': -0.8,
        'assertiveness': -0.75,
        'control': 0.6,
      },
    ),
    'toxic_patterns:q7': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q7',
      axisWeights: {
        'anger_expression': -0.8,
        'emotional_honesty': -0.75,
        'nonverbal_communication': 0.7,
        'assertiveness': -0.7,
      },
    ),
    'toxic_patterns:q8': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q8',
      axisWeights: {
        'sarcasm_usage': 0.9,
        'emotional_honesty': -0.8,
        'anger_expression': -0.75,
        'empathy': -0.6,
      },
    ),

    // Silent Treatment (Q9-16)
    'toxic_patterns:q9': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q9',
      axisWeights: {
        'emotional_withdrawal': 0.9,
        'conflict_avoidance': 0.75,
        'communication_skills': -0.8,
        'control': 0.7,
      },
    ),
    'toxic_patterns:q10': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q10',
      axisWeights: {
        'emotional_withdrawal': 0.9,
        'conflict_resolution': -0.85,
        'communication_skills': -0.8,
        'control': 0.7,
      },
    ),
    'toxic_patterns:q11': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q11',
      axisWeights: {
        'emotional_withdrawal': 0.85,
        'manipulation': 0.8,
        'control': 0.8,
        'empathy': -0.7,
      },
    ),
    'toxic_patterns:q12': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q12',
      axisWeights: {
        'emotional_withdrawal': 0.9,
        'control': 0.85,
        'conflict_resolution': -0.8,
        'stubbornness': 0.7,
      },
    ),
    'toxic_patterns:q13': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q13',
      axisWeights: {
        'emotional_withdrawal': 0.95,
        'empathy': -0.85,
        'control': 0.8,
        'cruelty': 0.7,
      },
    ),
    'toxic_patterns:q14': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q14',
      axisWeights: {
        'emotional_withdrawal': 0.85,
        'conflict_resolution': -0.9,
        'communication_skills': -0.85,
        'control': 0.75,
      },
    ),
    'toxic_patterns:q15': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q15',
      axisWeights: {
        'control': 0.9,
        'emotional_withdrawal': 0.85,
        'manipulation': 0.8,
        'power_motivation': 0.7,
      },
    ),
    'toxic_patterns:q16': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q16',
      axisWeights: {
        'control': 0.9,
        'manipulation': 0.85,
        'empathy': -0.8,
        'cruelty': 0.75,
      },
    ),

    // Dramatization (Q17-24)
    'toxic_patterns:q17': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q17',
      axisWeights: {
        'emotional_intensity': 0.9,
        'emotional_regulation': -0.85,
        'attention_seeking': 0.8,
        'impulsiveness': 0.7,
      },
    ),
    'toxic_patterns:q18': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q18',
      axisWeights: {
        'catastrophizing': 0.9,
        'emotional_intensity': 0.85,
        'emotional_regulation': -0.8,
        'anxiety': 0.6,
      },
    ),
    'toxic_patterns:q19': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q19',
      axisWeights: {
        'catastrophizing': 0.9,
        'emotional_intensity': 0.85,
        'manipulation': 0.7,
        'impulsiveness': 0.65,
      },
    ),
    'toxic_patterns:q20': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q20',
      axisWeights: {
        'emotional_intensity': 0.9,
        'impulsiveness': 0.85,
        'emotional_regulation': -0.85,
        'self_control': -0.75,
      },
    ),
    'toxic_patterns:q21': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q21',
      axisWeights: {
        'attention_seeking': 0.95,
        'emotional_intensity': 0.8,
        'manipulation': 0.7,
        'insecurity': 0.65,
      },
    ),
    'toxic_patterns:q22': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q22',
      axisWeights: {
        'manipulation': 0.85,
        'emotional_intensity': 0.8,
        'impulsiveness': 0.75,
        'relationship_stability': -0.7,
      },
    ),
    'toxic_patterns:q23': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q23',
      axisWeights: {
        'catastrophizing': 0.9,
        'emotional_intensity': 0.85,
        'emotional_regulation': -0.8,
        'perspective_taking': -0.7,
      },
    ),
    'toxic_patterns:q24': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q24',
      axisWeights: {
        'manipulation': 0.95,
        'attention_seeking': 0.85,
        'emotional_intensity': 0.8,
        'cruelty': 0.7,
      },
    ),

    // Devaluation (Q25-32)
    'toxic_patterns:q25': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q25',
      axisWeights: {
        'empathy': -0.85,
        'respect': -0.9,
        'criticism': 0.85,
        'supportiveness': -0.75,
      },
    ),
    'toxic_patterns:q26': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q26',
      axisWeights: {
        'empathy': -0.9,
        'respect': -0.85,
        'emotional_invalidation': 0.9,
        'cruelty': 0.7,
      },
    ),
    'toxic_patterns:q27': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q27',
      axisWeights: {
        'emotional_invalidation': 0.9,
        'empathy': -0.85,
        'respect': -0.8,
        'gaslighting': 0.7,
      },
    ),
    'toxic_patterns:q28': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q28',
      axisWeights: {
        'respect': -0.9,
        'empathy': -0.8,
        'criticism': 0.85,
        'jealousy': 0.6,
      },
    ),
    'toxic_patterns:q29': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q29',
      axisWeights: {
        'empathy': -0.9,
        'respect': -0.85,
        'selfishness': 0.85,
        'supportiveness': -0.8,
      },
    ),
    'toxic_patterns:q30': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q30',
      axisWeights: {
        'criticism': 0.9,
        'respect': -0.85,
        'empathy': -0.75,
        'judgmentalness': 0.8,
      },
    ),
    'toxic_patterns:q31': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q31',
      axisWeights: {
        'respect': -0.9,
        'supportiveness': -0.85,
        'emotional_invalidation': 0.85,
        'appreciation': -0.8,
      },
    ),
    'toxic_patterns:q32': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q32',
      axisWeights: {
        'criticism': 0.85,
        'respect': -0.9,
        'empathy': -0.75,
        'cruelty': 0.7,
      },
    ),

    // Victim Mentality (Q33-40)
    'toxic_patterns:q33': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q33',
      axisWeights: {
        'self_victimization': 0.9,
        'external_locus_of_control': 0.85,
        'personal_responsibility': -0.85,
        'pessimism': 0.7,
      },
    ),
    'toxic_patterns:q34': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q34',
      axisWeights: {
        'personal_responsibility': -0.95,
        'external_locus_of_control': 0.9,
        'self_victimization': 0.85,
        'blame_shifting': 0.85,
      },
    ),
    'toxic_patterns:q35': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q35',
      axisWeights: {
        'self_victimization': 0.95,
        'external_locus_of_control': 0.85,
        'pessimism': 0.8,
        'self_pity': 0.8,
      },
    ),
    'toxic_patterns:q36': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q36',
      axisWeights: {
        'personal_responsibility': -0.95,
        'accountability': -0.9,
        'self_victimization': 0.8,
        'maturity': -0.75,
      },
    ),
    'toxic_patterns:q37': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q37',
      axisWeights: {
        'self_victimization': 0.85,
        'personal_responsibility': -0.8,
        'excuse_making': 0.85,
        'self_justification': 0.8,
      },
    ),
    'toxic_patterns:q38': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q38',
      axisWeights: {
        'entitlement': 0.9,
        'self_victimization': 0.85,
        'external_locus_of_control': 0.8,
        'manipulation': 0.7,
      },
    ),
    'toxic_patterns:q39': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q39',
      axisWeights: {
        'paranoia': 0.85,
        'self_victimization': 0.85,
        'external_locus_of_control': 0.8,
        'pessimism': 0.8,
      },
    ),
    'toxic_patterns:q40': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q40',
      axisWeights: {
        'manipulation': 0.9,
        'self_victimization': 0.8,
        'guilt_tripping': 0.95,
        'entitlement': 0.75,
      },
    ),

    // Manipulation & Gaslighting (Q41-48)
    'toxic_patterns:q41': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q41',
      axisWeights: {
        'gaslighting': 0.95,
        'honesty': -0.9,
        'manipulation': 0.85,
        'reality_distortion': 0.9,
      },
    ),
    'toxic_patterns:q42': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q42',
      axisWeights: {
        'manipulation': 0.95,
        'gaslighting': 0.85,
        'blame_shifting': 0.9,
        'honesty': -0.8,
      },
    ),
    'toxic_patterns:q43': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q43',
      axisWeights: {
        'gaslighting': 0.95,
        'reality_distortion': 0.95,
        'manipulation': 0.85,
        'cruelty': 0.75,
      },
    ),
    'toxic_patterns:q44': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q44',
      axisWeights: {
        'manipulation': 0.95,
        'guilt_tripping': 0.9,
        'control': 0.8,
        'empathy': -0.7,
      },
    ),
    'toxic_patterns:q45': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q45',
      axisWeights: {
        'manipulation': 0.95,
        'guilt_tripping': 0.85,
        'emotional_blackmail': 0.9,
        'control': 0.75,
      },
    ),
    'toxic_patterns:q46': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q46',
      axisWeights: {
        'manipulation': 0.9,
        'blame_shifting': 0.95,
        'gaslighting': 0.85,
        'personal_responsibility': -0.8,
      },
    ),
    'toxic_patterns:q47': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q47',
      axisWeights: {
        'manipulation': 0.9,
        'emotional_blackmail': 0.95,
        'control': 0.85,
        'cruelty': 0.75,
      },
    ),
    'toxic_patterns:q48': QuestionWeight(
      testId: 'toxic_patterns',
      questionId: 'q48',
      axisWeights: {
        'gaslighting': 0.95,
        'reality_distortion': 0.95,
        'manipulation': 0.9,
        'psychological_abuse': 0.9,
      },
    ),
  };
}
