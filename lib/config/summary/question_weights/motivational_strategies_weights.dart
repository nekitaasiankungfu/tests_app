import 'question_weight_models.dart';

/// Question weights configuration for Motivational Strategies Test
/// Maps 90 questions across 9 motivation types to ~195 hierarchical psychological scales
///
/// Based on Self-Determination Theory (Deci & Ryan, 1985) and Motivational Systems Theory
///
/// 9 Motivational Strategies (10 questions each):
/// - IDEALIST (Q1,10,19,28,37,46,55,64,73,82): Perfectionism, ethics, self-improvement
/// - ALTRUIST (Q2,11,20,29,38,47,56,65,74,83): Helping, being needed, relationships
/// - ACHIEVER (Q3,12,21,30,39,48,57,66,75,84): Success, recognition, results
/// - CREATOR (Q4,13,22,31,40,49,58,67,76,85): Uniqueness, meaning, authenticity
/// - ANALYST (Q5,14,23,32,41,50,59,68,77,86): Knowledge, understanding, competence
/// - GUARDIAN (Q6,15,24,33,42,51,60,69,78,87): Security, structure, reliability
/// - OPTIMIST (Q7,16,25,34,43,52,61,70,79,88): Joy, novelty, avoiding pain
/// - LEADER (Q8,17,26,35,44,53,62,71,80,89): Control, power, protection
/// - HARMONIZER (Q9,18,27,36,45,54,63,72,81,90): Peace, comfort, avoiding conflict
///
/// Scale: 0-4 Likert (Strongly disagree to Strongly agree)
/// All weights are POSITIVE (0.5-1.0) - bipolar weights added separately
///
/// Coverage: ~120 scales (62% of 195 total scales)
class MotivationalStrategiesWeights {
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // IDEALIST - Questions 1, 10, 19, 28, 37, 46, 55, 64, 73, 82
    // Core: Perfectionism, ethics, correctness, self-improvement
    // ========================================================================

    // Q1: Important to do everything correctly, even in small details
    'motivational_strategies_v1:q1': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q1',
      axisWeights: {
        'perfectionism': 1.0, // Direct mapping
        'conscientiousness': 0.9,
        'attention_to_detail': 0.9,
        'quality_focus': 0.8,
        'methodicalness': 0.7,
        'achievement_striving': 0.6,
        'self_discipline': 0.7,
        'rule_following': 0.6,
      },
    ),

    // Q10: Upset when people act unethically
    'motivational_strategies_v1:q10': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q10',
      axisWeights: {
        'moral_sensitivity': 1.0,
        'ethical_values': 0.9,
        'justice_orientation': 0.8,
        'integrity': 0.8,
        'empathy': 0.6,
        'sensitivity': 0.7,
        'compassion': 0.6,
      },
    ),

    // Q19: Strive for self-improvement
    'motivational_strategies_v1:q19': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q19',
      axisWeights: {
        'personal_growth': 1.0,
        'self_improvement': 0.9,
        'achievement_striving': 0.8,
        'learning_orientation': 0.8,
        'openness_to_growth': 0.7,
        'self_discipline': 0.7,
        'reflection': 0.6,
      },
    ),

    // Q28: Often criticize myself for mistakes
    'motivational_strategies_v1:q28': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q28',
      axisWeights: {
        'self_criticism': 1.0,
        'perfectionism': 0.9,
        'neuroticism': 0.7,
        'anxiety': 0.6,
        'worry_tendency': 0.6,
        'self_acceptance': -0.8, // Negative correlation
        'self_compassion': -0.7,
      },
    ),

    // Q37: Clear ideas about right and wrong
    'motivational_strategies_v1:q37': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q37',
      axisWeights: {
        'ethical_values': 1.0,
        'moral_clarity': 0.9,
        'conviction': 0.8,
        'integrity': 0.8,
        'certainty': 0.7,
        'self_discipline': 0.6,
      },
    ),

    // Q46: Believe there's always a better way
    'motivational_strategies_v1:q46': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q46',
      axisWeights: {
        'perfectionism': 0.9,
        'improvement_orientation': 1.0,
        'innovation_drive': 0.7,
        'optimism': 0.6,
        'problem_solving': 0.7,
        'persistence': 0.6,
      },
    ),

    // Q55: Notice mistakes where others don't
    'motivational_strategies_v1:q55': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q55',
      axisWeights: {
        'attention_to_detail': 1.0,
        'critical_thinking': 0.9,
        'perfectionism': 0.8,
        'analytical_thinking': 0.7,
        'quality_focus': 0.8,
        'observation_skills': 0.8,
      },
    ),

    // Q64: Inner tension from world's imperfection
    'motivational_strategies_v1:q64': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q64',
      axisWeights: {
        'perfectionism': 0.9,
        'frustration_tolerance': -0.8, // Negative
        'stress': 0.7,
        'neuroticism': 0.7,
        'anxiety': 0.6,
        'idealism': 0.9,
        'dissatisfaction': 0.7,
      },
    ),

    // Q73: Demand high standards from self and others
    'motivational_strategies_v1:q73': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q73',
      axisWeights: {
        'perfectionism': 1.0,
        'high_standards': 0.9,
        'achievement_striving': 0.8,
        'assertiveness': 0.6,
        'conscientiousness': 0.8,
        'leadership': 0.5,
      },
    ),

    // Q82: Righteous anger at injustice
    'motivational_strategies_v1:q82': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q82',
      axisWeights: {
        'justice_orientation': 1.0,
        'moral_sensitivity': 0.9,
        'assertiveness': 0.7,
        'passion': 0.7,
        'emotional_intensity': 0.7,
        'ethical_values': 0.8,
      },
    ),

    // ========================================================================
    // ALTRUIST - Questions 2, 11, 20, 29, 38, 47, 56, 65, 74, 83
    // Core: Helping others, being needed, relationships, empathy
    // ========================================================================

    // Q2: Satisfied when helping others
    'motivational_strategies_v1:q2': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q2',
      axisWeights: {
        'altruism': 1.0,
        'helping_behavior': 0.9,
        'compassion': 0.8,
        'empathy': 0.8,
        'supportiveness': 0.8,
        'prosocial_behavior': 0.9,
        'warmth': 0.7,
      },
    ),

    // Q11: Forget my needs caring for others
    'motivational_strategies_v1:q11': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q11',
      axisWeights: {
        'selflessness': 1.0,
        'self_sacrifice': 0.9,
        'altruism': 0.8,
        'boundary_management': -0.8, // Negative
        'self_care': -0.7,
        'codependency': 0.7,
      },
    ),

    // Q20: Hard to ask for help
    'motivational_strategies_v1:q20': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q20',
      axisWeights: {
        'independence_seeking': 0.7,
        'social_support_seeking': -0.8, // Negative
        'vulnerability_sharing': -0.7,
        'pride': 0.6,
        'self_reliance': 0.7,
      },
    ),

    // Q29: Feel valuable when others need me
    'motivational_strategies_v1:q29': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q29',
      axisWeights: {
        'validation_seeking': 0.9,
        'worth_through_others': 1.0,
        'helping_behavior': 0.7,
        'codependency': 0.7,
        'self_esteem': -0.5, // Conditional self-esteem
      },
    ),

    // Q38: Intuitively sense others' emotional needs
    'motivational_strategies_v1:q38': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q38',
      axisWeights: {
        'empathy': 1.0,
        'emotional_intelligence': 0.9,
        'intuition': 0.8,
        'sensitivity': 0.8,
        'compassion': 0.8,
        'perspective_taking': 0.8,
      },
    ),

    // Q47: Get energy from caring for loved ones
    'motivational_strategies_v1:q47': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q47',
      axisWeights: {
        'nurturance': 1.0,
        'caregiving': 0.9,
        'warmth': 0.8,
        'supportiveness': 0.9,
        'vitality': 0.6,
        'relationship_satisfaction': 0.7,
      },
    ),

    // Q56: Pride through others' success
    'motivational_strategies_v1:q56': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q56',
      axisWeights: {
        'vicarious_achievement': 1.0,
        'supportiveness': 0.8,
        'selflessness': 0.7,
        'worth_through_others': 0.8,
        'pride': 0.7,
      },
    ),

    // Q65: Manipulate so others need me
    'motivational_strategies_v1:q65': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q65',
      axisWeights: {
        'manipulation': 1.0,
        'codependency': 0.9,
        'control_need': 0.7,
        'boundary_issues': 0.8,
        'insecurity': 0.7,
      },
    ),

    // Q74: Suppress own needs for others
    'motivational_strategies_v1:q74': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q74',
      axisWeights: {
        'self_sacrifice': 1.0,
        'selflessness': 0.9,
        'boundary_management': -0.9,
        'self_care': -0.8,
        'assertiveness': -0.7,
      },
    ),

    // Q83: Hard to accept help
    'motivational_strategies_v1:q83': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q83',
      axisWeights: {
        'pride': 0.8,
        'vulnerability_sharing': -0.8,
        'independence_seeking': 0.8,
        'reciprocity_difficulty': 1.0,
        'control_need': 0.6,
      },
    ),

    // ========================================================================
    // ACHIEVER - Questions 3, 12, 21, 30, 39, 48, 57, 66, 75, 84
    // Core: Success, results, recognition, achievement
    // ========================================================================

    // Q3: Visible results motivate me most
    'motivational_strategies_v1:q3': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q3',
      axisWeights: {
        'achievement_striving': 1.0,
        'goal_orientation': 0.9,
        'result_focus': 0.9,
        'extrinsic_motivation': 0.8,
        'ambition': 0.8,
        'competitiveness': 0.7,
      },
    ),

    // Q12: Recognition of achievements important
    'motivational_strategies_v1:q12': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q12',
      axisWeights: {
        'validation_seeking': 1.0,
        'recognition_need': 0.9,
        'extrinsic_motivation': 0.8,
        'social_desirability': 0.7,
        'self_esteem': -0.5, // Conditional
      },
    ),

    // Q21: Always set ambitious goals
    'motivational_strategies_v1:q21': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q21',
      axisWeights: {
        'ambition': 1.0,
        'achievement_striving': 0.9,
        'goal_orientation': 0.9,
        'self_discipline': 0.7,
        'persistence': 0.8,
        'optimism': 0.6,
      },
    ),

    // Q30: Adapt behavior to achieve success
    'motivational_strategies_v1:q30': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q30',
      axisWeights: {
        'adaptability': 1.0,
        'strategic_thinking': 0.8,
        'flexibility': 0.8,
        'pragmatism': 0.8,
        'social_intelligence': 0.7,
        'authenticity': -0.6, // May compromise authenticity
      },
    ),

    // Q39: Failure lowers self-esteem
    'motivational_strategies_v1:q39': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q39',
      axisWeights: {
        'performance_contingent_worth': 1.0,
        'self_esteem': -0.7, // Fragile
        'failure_sensitivity': 0.9,
        'anxiety': 0.7,
        'self_compassion': -0.7,
      },
    ),

    // Q48: Results over process
    'motivational_strategies_v1:q48': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q48',
      axisWeights: {
        'result_focus': 1.0,
        'goal_orientation': 0.9,
        'pragmatism': 0.8,
        'efficiency': 0.7,
        'impatience': 0.6,
      },
    ),

    // Q57: Worth through achievements
    'motivational_strategies_v1:q57': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q57',
      axisWeights: {
        'performance_contingent_worth': 1.0,
        'self_esteem': -0.6, // Conditional
        'achievement_striving': 0.8,
        'validation_seeking': 0.8,
        'self_acceptance': -0.7,
      },
    ),

    // Q66: Fear looking like failure
    'motivational_strategies_v1:q66': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q66',
      axisWeights: {
        'failure_fear': 1.0,
        'social_anxiety': 0.8,
        'perfectionism': 0.7,
        'self_esteem': -0.7,
        'shame_proneness': 0.8,
      },
    ),

    // Q75: Work above relationships
    'motivational_strategies_v1:q75': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q75',
      axisWeights: {
        'work_centrality': 1.0,
        'achievement_striving': 0.9,
        'relationship_priority': -0.8,
        'work_life_balance': -0.8,
        'ambition': 0.7,
      },
    ),

    // Q84: Strive to be the best
    'motivational_strategies_v1:q84': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q84',
      axisWeights: {
        'ambition': 1.0,
        'competitiveness': 0.9,
        'achievement_striving': 0.9,
        'perfectionism': 0.7,
        'self_discipline': 0.7,
      },
    ),

    // ========================================================================
    // CREATOR - Questions 4, 13, 22, 31, 40, 49, 58, 67, 76, 85
    // Core: Uniqueness, depth, authenticity, meaning
    // ========================================================================

    // Q4: Feel different from most people
    'motivational_strategies_v1:q4': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q4',
      axisWeights: {
        'uniqueness_seeking': 1.0,
        'nonconformity': 0.8,
        'individuality': 0.9,
        'alienation': 0.6,
        'openness': 0.7,
      },
    ),

    // Q13: Deeply experience emotions
    'motivational_strategies_v1:q13': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q13',
      axisWeights: {
        'emotional_intensity': 1.0,
        'emotional_depth': 0.9,
        'sensitivity': 0.9,
        'introspection': 0.8,
        'self_awareness': 0.8,
        'neuroticism': 0.6,
      },
    ),

    // Q22: Attracted to unusual and artistic
    'motivational_strategies_v1:q22': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q22',
      axisWeights: {
        'aesthetic_appreciation': 1.0,
        'creativity': 0.9,
        'openness': 0.9,
        'nonconformity': 0.7,
        'imagination': 0.8,
      },
    ),

    // Q31: Feel something is missing
    'motivational_strategies_v1:q31': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q31',
      axisWeights: {
        'dissatisfaction': 1.0,
        'longing': 0.9,
        'incompleteness': 0.9,
        'melancholy': 0.7,
        'life_satisfaction': -0.7,
      },
    ),

    // Q40: Value beauty and aesthetics
    'motivational_strategies_v1:q40': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q40',
      axisWeights: {
        'aesthetic_appreciation': 1.0,
        'openness': 0.8,
        'sensitivity': 0.8,
        'refinement': 0.8,
        'creativity': 0.7,
      },
    ),

    // Q49: Express through creativity
    'motivational_strategies_v1:q49': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q49',
      axisWeights: {
        'creativity': 1.0,
        'self_expression': 0.9,
        'authenticity': 0.8,
        'individuality': 0.8,
        'imagination': 0.8,
      },
    ),

    // Q58: Pull toward unattainable
    'motivational_strategies_v1:q58': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q58',
      axisWeights: {
        'idealization': 1.0,
        'longing': 0.9,
        'dissatisfaction': 0.8,
        'envy': 0.7,
        'melancholy': 0.7,
      },
    ),

    // Q67: Idealize what I don't have
    'motivational_strategies_v1:q67': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q67',
      axisWeights: {
        'idealization': 1.0,
        'envy': 0.8,
        'dissatisfaction': 0.9,
        'gratitude': -0.7,
        'contentment': -0.8,
      },
    ),

    // Q76: Overly absorbed in emotions
    'motivational_strategies_v1:q76': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q76',
      axisWeights: {
        'emotional_intensity': 0.9,
        'rumination': 1.0,
        'self_absorption': 0.8,
        'neuroticism': 0.8,
        'emotional_regulation': -0.8,
      },
    ),

    // Q85: Feel misunderstood
    'motivational_strategies_v1:q85': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q85',
      axisWeights: {
        'alienation': 1.0,
        'loneliness': 0.8,
        'uniqueness_seeking': 0.7,
        'social_connection': -0.7,
        'belonging': -0.7,
      },
    ),

    // ========================================================================
    // ANALYST - Questions 5, 14, 23, 32, 41, 50, 59, 68, 77, 86
    // Core: Knowledge, understanding, analysis, competence
    // ========================================================================

    // Q5: Need deep understanding before decisions
    'motivational_strategies_v1:q5': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q5',
      axisWeights: {
        'analytical_thinking': 1.0,
        'deliberation': 0.9,
        'thoroughness': 0.8,
        'knowledge_seeking': 0.8,
        'conscientiousness': 0.7,
      },
    ),

    // Q14: Observe and analyze before acting
    'motivational_strategies_v1:q14': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q14',
      axisWeights: {
        'reflection': 1.0,
        'caution': 0.8,
        'analytical_thinking': 0.9,
        'deliberation': 0.8,
        'introversion': 0.7,
      },
    ),

    // Q23: Minimize social contacts
    'motivational_strategies_v1:q23': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q23',
      axisWeights: {
        'introversion': 1.0,
        'solitude_preference': 0.9,
        'social_withdrawal': 0.8,
        'independence_seeking': 0.7,
        'sociability': -0.9,
      },
    ),

    // Q32: Need alone time to restore energy
    'motivational_strategies_v1:q32': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q32',
      axisWeights: {
        'introversion': 1.0,
        'solitude_preference': 0.9,
        'energy_management': 0.8,
        'self_care': 0.7,
        'autonomy_need': 0.7,
      },
    ),

    // Q41: Collect knowledge even if not using
    'motivational_strategies_v1:q41': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q41',
      axisWeights: {
        'knowledge_seeking': 1.0,
        'curiosity': 0.9,
        'learning_orientation': 0.9,
        'openness': 0.7,
        'intellectual_interest': 0.9,
      },
    ),

    // Q50: Comfortable as expert
    'motivational_strategies_v1:q50': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q50',
      axisWeights: {
        'competence_need': 1.0,
        'expertise_valuation': 0.9,
        'self_efficacy': 0.8,
        'mastery_orientation': 0.8,
        'confidence': 0.7,
      },
    ),

    // Q59: Think rather than act emotionally
    'motivational_strategies_v1:q59': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q59',
      axisWeights: {
        'rationality': 1.0,
        'emotional_detachment': 0.8,
        'deliberation': 0.9,
        'impulse_control': 0.8,
        'analytical_thinking': 0.8,
      },
    ),

    // Q68: Detach from emotions for clarity
    'motivational_strategies_v1:q68': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q68',
      axisWeights: {
        'emotional_detachment': 1.0,
        'rationality': 0.9,
        'objectivity': 0.9,
        'composure': 0.7,
        'emotional_regulation': 0.7,
      },
    ),

    // Q77: Minimize contact, feel drained
    'motivational_strategies_v1:q77': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q77',
      axisWeights: {
        'social_withdrawal': 1.0,
        'introversion': 0.9,
        'social_exhaustion': 0.9,
        'isolation': 0.7,
        'sociability': -0.9,
      },
    ),

    // Q86: Explore deeper than necessary
    'motivational_strategies_v1:q86': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q86',
      axisWeights: {
        'curiosity': 1.0,
        'intellectual_depth': 0.9,
        'knowledge_seeking': 0.9,
        'thoroughness': 0.8,
        'openness': 0.8,
      },
    ),

    // ========================================================================
    // GUARDIAN - Questions 6, 15, 24, 33, 42, 51, 60, 69, 78, 87
    // Core: Security, structure, reliability, caution
    // ========================================================================

    // Q6: Prefer clear plan
    'motivational_strategies_v1:q6': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q6',
      axisWeights: {
        'structure_preference': 1.0,
        'planning': 0.9,
        'predictability_seeking': 0.8,
        'conscientiousness': 0.7,
        'order_need': 0.8,
      },
    ),

    // Q15: Uncertainty causes anxiety
    'motivational_strategies_v1:q15': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q15',
      axisWeights: {
        'anxiety': 1.0,
        'uncertainty_intolerance': 0.9,
        'neuroticism': 0.8,
        'worry_tendency': 0.8,
        'stress_sensitivity': 0.7,
      },
    ),

    // Q24: Value reliability in people
    'motivational_strategies_v1:q24': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q24',
      axisWeights: {
        'dependability_valuation': 1.0,
        'trust_in_relationships': 0.8,
        'loyalty': 0.8,
        'stability_seeking': 0.8,
        'conscientiousness': 0.7,
      },
    ),

    // Q33: Doubt decisions, seek confirmation
    'motivational_strategies_v1:q33': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q33',
      axisWeights: {
        'indecisiveness': 1.0,
        'self_doubt': 0.9,
        'anxiety': 0.8,
        'external_validation_seeking': 0.8,
        'self_efficacy': -0.7,
      },
    ),

    // Q42: Loyal to trusted people/organizations
    'motivational_strategies_v1:q42': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q42',
      axisWeights: {
        'loyalty': 1.0,
        'commitment': 0.9,
        'trust_in_relationships': 0.8,
        'dependability': 0.8,
        'stability_seeking': 0.7,
      },
    ),

    // Q51: Carefully assess risks
    'motivational_strategies_v1:q51': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q51',
      axisWeights: {
        'risk_aversion': 1.0,
        'caution': 0.9,
        'deliberation': 0.8,
        'conscientiousness': 0.7,
        'planning': 0.8,
      },
    ),

    // Q60: Seek guidance from authorities
    'motivational_strategies_v1:q60': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q60',
      axisWeights: {
        'authority_seeking': 1.0,
        'dependence': 0.8,
        'external_validation_seeking': 0.8,
        'self_efficacy': -0.6,
        'autonomy_need': -0.7,
      },
    ),

    // Q69: Project fears, see dangers
    'motivational_strategies_v1:q69': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q69',
      axisWeights: {
        'paranoia': 0.9,
        'anxiety': 1.0,
        'threat_sensitivity': 0.9,
        'neuroticism': 0.8,
        'worry_tendency': 0.9,
      },
    ),

    // Q78: Constant anxiety about future
    'motivational_strategies_v1:q78': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q78',
      axisWeights: {
        'anxiety': 1.0,
        'worry_tendency': 0.9,
        'neuroticism': 0.9,
        'stress': 0.8,
        'future_focus': 0.7,
      },
    ),

    // Q87: Comfortable in structured environment
    'motivational_strategies_v1:q87': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q87',
      axisWeights: {
        'structure_preference': 1.0,
        'predictability_seeking': 0.9,
        'order_need': 0.8,
        'conscientiousness': 0.7,
        'flexibility': -0.6,
      },
    ),

    // ========================================================================
    // OPTIMIST - Questions 7, 16, 25, 34, 43, 52, 61, 70, 79, 88
    // Core: Joy, novelty, avoiding pain, positivity
    // ========================================================================

    // Q7: Always seek new experiences
    'motivational_strategies_v1:q7': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q7',
      axisWeights: {
        'novelty_seeking': 1.0,
        'openness': 0.9,
        'adventurousness': 0.9,
        'curiosity': 0.8,
        'excitement_seeking': 0.9,
      },
    ),

    // Q16: Hard to tolerate boredom
    'motivational_strategies_v1:q16': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q16',
      axisWeights: {
        'boredom_proneness': 1.0,
        'stimulation_seeking': 0.9,
        'novelty_seeking': 0.8,
        'restlessness': 0.8,
        'patience': -0.7,
      },
    ),

    // Q25: Keep options open
    'motivational_strategies_v1:q25': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q25',
      axisWeights: {
        'flexibility': 1.0,
        'openness_to_options': 0.9,
        'commitment_avoidance': 0.7,
        'adaptability': 0.8,
        'planning': -0.6,
      },
    ),

    // Q34: Make routine interesting
    'motivational_strategies_v1:q34': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q34',
      axisWeights: {
        'creativity': 1.0,
        'optimism': 0.9,
        'reframing_ability': 0.8,
        'resilience': 0.7,
        'positivity': 0.8,
      },
    ),

    // Q43: Impatient, want everything now
    'motivational_strategies_v1:q43': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q43',
      axisWeights: {
        'impulsiveness': 1.0,
        'impatience': 0.9,
        'instant_gratification': 0.9,
        'self_control': -0.8,
        'delay_of_gratification': -0.8,
      },
    ),

    // Q52: Focus on possibilities not limitations
    'motivational_strategies_v1:q52': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q52',
      axisWeights: {
        'optimism': 1.0,
        'positivity': 0.9,
        'hope': 0.9,
        'possibility_thinking': 0.9,
        'resilience': 0.7,
      },
    ),

    // Q61: Hard to focus with so much interesting
    'motivational_strategies_v1:q61': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q61',
      axisWeights: {
        'distractibility': 1.0,
        'attention_control': -0.9,
        'focus': -0.8,
        'novelty_seeking': 0.7,
        'restlessness': 0.7,
      },
    ),

    // Q70: Avoid negative emotions
    'motivational_strategies_v1:q70': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q70',
      axisWeights: {
        'emotional_avoidance': 1.0,
        'pain_avoidance': 0.9,
        'denial': 0.7,
        'emotional_regulation': -0.6,
        'emotional_acceptance': -0.8,
      },
    ),

    // Q79: Impulsive decisions to avoid discomfort
    'motivational_strategies_v1:q79': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q79',
      axisWeights: {
        'impulsiveness': 1.0,
        'pain_avoidance': 0.9,
        'discomfort_intolerance': 0.9,
        'self_control': -0.8,
        'deliberation': -0.8,
      },
    ),

    // Q88: Life as adventure
    'motivational_strategies_v1:q88': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q88',
      axisWeights: {
        'optimism': 1.0,
        'adventurousness': 0.9,
        'openness': 0.8,
        'excitement_seeking': 0.9,
        'vitality': 0.8,
      },
    ),

    // ========================================================================
    // LEADER - Questions 8, 17, 26, 35, 44, 53, 62, 71, 80, 89
    // Core: Control, power, strength, protection
    // ========================================================================

    // Q8: Not afraid to confront
    'motivational_strategies_v1:q8': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q8',
      axisWeights: {
        'assertiveness': 1.0,
        'confrontation_comfort': 0.9,
        'courage': 0.8,
        'dominance': 0.7,
        'conflict_orientation': 0.8,
      },
    ),

    // Q17: Value strength over gentleness
    'motivational_strategies_v1:q17': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q17',
      axisWeights: {
        'toughness': 1.0,
        'dominance': 0.8,
        'assertiveness': 0.8,
        'gentleness': -0.7,
        'compassion': -0.5,
      },
    ),

    // Q26: Naturally take leader role
    'motivational_strategies_v1:q26': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q26',
      axisWeights: {
        'leadership': 1.0,
        'dominance': 0.9,
        'assertiveness': 0.9,
        'confidence': 0.8,
        'initiative': 0.8,
      },
    ),

    // Q35: Defend weak and offended
    'motivational_strategies_v1:q35': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q35',
      axisWeights: {
        'protectiveness': 1.0,
        'justice_orientation': 0.9,
        'compassion': 0.7,
        'courage': 0.8,
        'assertiveness': 0.7,
      },
    ),

    // Q44: Speak directly
    'motivational_strategies_v1:q44': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q44',
      axisWeights: {
        'directness': 1.0,
        'honesty': 0.9,
        'assertiveness': 0.8,
        'bluntness': 0.8,
        'tact': -0.6,
      },
    ),

    // Q53: Respect strength, show toughness
    'motivational_strategies_v1:q53': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q53',
      axisWeights: {
        'toughness': 1.0,
        'dominance': 0.9,
        'assertiveness': 0.8,
        'vulnerability_avoidance': 0.8,
        'emotional_expression': -0.6,
      },
    ),

    // Q62: Not afraid of confrontation/aggression
    'motivational_strategies_v1:q62': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q62',
      axisWeights: {
        'aggression': 0.9,
        'confrontation_comfort': 1.0,
        'assertiveness': 0.9,
        'dominance': 0.8,
        'conflict_orientation': 0.9,
      },
    ),

    // Q71: Overly controlling
    'motivational_strategies_v1:q71': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q71',
      axisWeights: {
        'control_need': 1.0,
        'dominance': 0.9,
        'micromanagement': 0.9,
        'trust_in_relationships': -0.7,
        'flexibility': -0.6,
      },
    ),

    // Q80: Hide vulnerability behind strength
    'motivational_strategies_v1:q80': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q80',
      axisWeights: {
        'vulnerability_avoidance': 1.0,
        'emotional_suppression': 0.9,
        'toughness': 0.8,
        'authenticity': -0.7,
        'intimacy_comfort': -0.7,
      },
    ),

    // Q89: Prefer control over being controlled
    'motivational_strategies_v1:q89': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q89',
      axisWeights: {
        'control_need': 1.0,
        'autonomy_need': 0.9,
        'dominance': 0.9,
        'independence_seeking': 0.8,
        'power_motivation': 0.9,
      },
    ),

    // ========================================================================
    // HARMONIZER - Questions 9, 18, 27, 36, 45, 54, 63, 72, 81, 90
    // Core: Peace, harmony, avoiding conflict, comfort
    // ========================================================================

    // Q9: Prefer avoid conflicts
    'motivational_strategies_v1:q9': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q9',
      axisWeights: {
        'conflict_avoidance': 1.0,
        'harmony_seeking': 0.9,
        'peacefulness': 0.8,
        'assertiveness': -0.7,
        'accommodation': 0.8,
      },
    ),

    // Q18: Easily adapt to avoid tension
    'motivational_strategies_v1:q18': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q18',
      axisWeights: {
        'accommodation': 1.0,
        'conflict_avoidance': 0.9,
        'flexibility': 0.7,
        'assertiveness': -0.8,
        'boundary_management': -0.7,
      },
    ),

    // Q27: Easier to agree than defend position
    'motivational_strategies_v1:q27': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q27',
      axisWeights: {
        'submissiveness': 1.0,
        'conflict_avoidance': 0.9,
        'assertiveness': -0.9,
        'self_efficacy': -0.6,
        'accommodation': 0.8,
      },
    ),

    // Q36: Postpone decisions for peace
    'motivational_strategies_v1:q36': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q36',
      axisWeights: {
        'procrastination': 1.0,
        'conflict_avoidance': 0.9,
        'indecisiveness': 0.8,
        'passivity': 0.8,
        'initiative': -0.7,
      },
    ),

    // Q45: Hard to say no
    'motivational_strategies_v1:q45': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q45',
      axisWeights: {
        'assertiveness': -1.0,
        'boundary_management': -0.9,
        'submissiveness': 0.9,
        'accommodation': 0.8,
        'self_efficacy': -0.6,
      },
    ),

    // Q54: Value comfort over ambition
    'motivational_strategies_v1:q54': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q54',
      axisWeights: {
        'comfort_seeking': 1.0,
        'stability_seeking': 0.9,
        'ambition': -0.8,
        'achievement_striving': -0.7,
        'contentment': 0.7,
      },
    ),

    // Q63: Lose touch with desires adapting
    'motivational_strategies_v1:q63': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q63',
      axisWeights: {
        'self_awareness': -0.9,
        'accommodation': 0.9,
        'authenticity': -0.8,
        'boundary_management': -0.9,
        'self_alienation': 1.0,
      },
    ),

    // Q72: Passive and procrastinate
    'motivational_strategies_v1:q72': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q72',
      axisWeights: {
        'passivity': 1.0,
        'procrastination': 0.9,
        'initiative': -0.9,
        'motivation': -0.8,
        'self_discipline': -0.7,
      },
    ),

    // Q81: Forget priorities, dissolve in life
    'motivational_strategies_v1:q81': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q81',
      axisWeights: {
        'self_alienation': 1.0,
        'goal_orientation': -0.8,
        'self_awareness': -0.8,
        'passivity': 0.9,
        'mindfulness': -0.7,
      },
    ),

    // Q90: Value peace and harmony above all
    'motivational_strategies_v1:q90': QuestionWeight(
      testId: 'motivational_strategies_v1',
      questionId: 'q90',
      axisWeights: {
        'harmony_seeking': 1.0,
        'peacefulness': 1.0,
        'conflict_avoidance': 0.9,
        'tranquility': 0.8,
        'calmness': 0.8,
      },
    ),
  };

  // ========================================================================
  // BIPOLAR PERSONALITY TYPE WEIGHTS (E/I, S/N, T/F, J/P)
  // ========================================================================
  // Add bipolar weights for 4 personality dimensions
  // Total: 20-30 questions should contribute to bipolar scales
  //
  // These weights are added to the main weights map above
  // Format: 'extraversion': X or 'introversion': X (never negative!)

  static const Map<String, Map<String, double>> bipolarWeights = {
    // E/I - Extraversion vs Introversion
    'motivational_strategies_v1:q2': {
      'extraversion': 0.6, // Altruist - social
      'feeling': 0.8, // Altruist - helping (T/F)
    },
    'motivational_strategies_v1:q7': {
      'extraversion': 0.7, // Optimist - seeking experiences
      'perceiving': 0.6, // Optimist - spontaneity (J/P)
    },
    'motivational_strategies_v1:q8': {
      'extraversion': 0.7, // Leader - confrontation
    },
    'motivational_strategies_v1:q23': {
      'introversion': 0.9, // Analyst - minimize social
    },
    'motivational_strategies_v1:q32': {
      'introversion': 1.0, // Analyst - alone time
    },
    'motivational_strategies_v1:q77': {
      'introversion': 0.9, // Analyst - social exhaustion
      'thinking': 0.5, // Analyst - analytical approach (T/F)
    },
    'motivational_strategies_v1:q47': {
      'extraversion': 0.5, // Altruist - energy from caring
    },
    'motivational_strategies_v1:q26': {
      'extraversion': 0.8, // Leader - natural leader
    },

    // S/N - Sensing vs Intuition
    'motivational_strategies_v1:q1': {
      'sensing': 0.7, // Idealist - details
      'judging': 0.7, // Idealist - correctly (J/P)
    },
    'motivational_strategies_v1:q55': {
      'sensing': 0.8, // Idealist - notice mistakes
    },
    'motivational_strategies_v1:q4': {
      'intuition': 0.8, // Creator - different perception
    },
    'motivational_strategies_v1:q22': {
      'intuition': 0.9, // Creator - unusual/artistic
    },
    'motivational_strategies_v1:q31': {
      'intuition': 0.7, // Creator - something missing
    },
    'motivational_strategies_v1:q52': {
      'intuition': 0.8, // Optimist - possibilities
      'perceiving': 0.6, // Optimist - see possibilities (J/P)
    },
    'motivational_strategies_v1:q6': {
      'sensing': 0.6, // Guardian - clear plan
      'judging': 0.9, // Guardian - clear plan (J/P)
    },

    // T/F - Thinking vs Feeling
    'motivational_strategies_v1:q10': {
      'feeling': 0.7, // Idealist - upset by unethical
    },
    'motivational_strategies_v1:q38': {
      'feeling': 0.9, // Altruist - sense emotions
    },
    'motivational_strategies_v1:q11': {
      'feeling': 0.8, // Altruist - forget own needs
    },
    'motivational_strategies_v1:q20': {
      'feeling': 0.7, // Altruist - hard to ask for help
    },
    'motivational_strategies_v1:q29': {
      'feeling': 0.8, // Altruist - feel valuable when needed
    },
    'motivational_strategies_v1:q13': {
      'feeling': 0.6, // Creator - deeply experience emotions
    },
    'motivational_strategies_v1:q5': {
      'thinking': 0.8, // Analyst - need understanding
    },
    'motivational_strategies_v1:q14': {
      'thinking': 0.7, // Analyst - observe and analyze
    },
    'motivational_strategies_v1:q41': {
      'thinking': 0.6, // Analyst - collect information
    },
    'motivational_strategies_v1:q59': {
      'thinking': 1.0, // Analyst - think not emotional
    },
    'motivational_strategies_v1:q68': {
      'thinking': 0.9, // Analyst - detach emotions
    },
    'motivational_strategies_v1:q35': {
      'feeling': 0.7, // Leader - defend weak
    },
    'motivational_strategies_v1:q44': {
      'thinking': 0.6, // Leader - speak directly (honest, not tactful)
    },

    // J/P - Judging vs Perceiving
    'motivational_strategies_v1:q28': {
      'judging': 0.7, // Idealist - criticize self for mistakes
    },
    'motivational_strategies_v1:q37': {
      'judging': 0.8, // Idealist - clear ideas about right/wrong
    },
    'motivational_strategies_v1:q46': {
      'judging': 0.6, // Idealist - always better way
    },
    'motivational_strategies_v1:q15': {
      'judging': 0.8, // Guardian - uncertainty causes anxiety
    },
    'motivational_strategies_v1:q24': {
      'judging': 0.7, // Guardian - value reliability
    },
    'motivational_strategies_v1:q33': {
      'judging': 0.6, // Guardian - doubt decisions
    },
    'motivational_strategies_v1:q42': {
      'judging': 0.7, // Guardian - loyal to earned trust
    },
    'motivational_strategies_v1:q51': {
      'judging': 0.8, // Guardian - assess risks
    },
    'motivational_strategies_v1:q60': {
      'judging': 0.9, // Guardian - need order
    },
    'motivational_strategies_v1:q78': {
      'judging': 0.7, // Guardian - follow rules
    },
    'motivational_strategies_v1:q87': {
      'judging': 0.9, // Guardian - structured
    },
    'motivational_strategies_v1:q16': {
      'perceiving': 0.8, // Optimist - difficulty with boredom
    },
    'motivational_strategies_v1:q25': {
      'perceiving': 0.9, // Optimist - keep options open
    },
    'motivational_strategies_v1:q34': {
      'perceiving': 0.7, // Optimist - make tasks interesting
    },
    'motivational_strategies_v1:q43': {
      'perceiving': 0.7, // Optimist - impatient
    },
    'motivational_strategies_v1:q61': {
      'perceiving': 0.8, // Optimist - live in moment
    },
    'motivational_strategies_v1:q70': {
      'perceiving': 0.7, // Optimist - spontaneous
    },
    'motivational_strategies_v1:q79': {
      'perceiving': 0.6, // Optimist - avoid long commitments
    },
    'motivational_strategies_v1:q18': {
      'perceiving': 0.5, // Harmonizer - adapt easily
    },
    'motivational_strategies_v1:q27': {
      'perceiving': 0.6, // Harmonizer - easier to agree
    },
    'motivational_strategies_v1:q36': {
      'perceiving': 0.6, // Harmonizer - postpone decisions
    },
    'motivational_strategies_v1:q45': {
      'perceiving': 0.5, // Harmonizer - hard to say no
    },
  };
}
