import 'question_weight_models.dart';

/// Weight mappings for Money Mindset & Financial Habits Test
///
/// Maps 24 questions to hierarchical psychological scales.
/// Questions measure 5 factors:
/// - Impulsive Spending (Q1-5, reversed: Q5)
/// - Financial Avoidance (Q6-10, reversed: Q9)
/// - Rigid Control (Q11-15, reversed: Q15)
/// - Poverty Fear (Q16-19, reversed: Q19)
/// - Money Shame (Q20-24, reversed: Q24)
class MoneyMindsetHabitsWeights {
  static final Map<String, QuestionWeight> weights = {
    // Impulsive Spending (Q1-5)
    'money_mindset_habits_v1:q1': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q1',
      axisWeights: {
        'impulsivity': 0.9,
        'self_discipline': -0.85,
        'conscientiousness': -0.75,
        'planning_orientation': -0.7,
        'present_focus': 0.8,
      },
    ),
    'money_mindset_habits_v1:q2': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q2',
      axisWeights: {
        'impulsivity': 0.95,
        'self_discipline': -0.9,
        'hedonism': 0.8,
        'instant_gratification': 0.85,
        'conscientiousness': -0.7,
      },
    ),
    'money_mindset_habits_v1:q3': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q3',
      axisWeights: {
        'emotional_spending': 0.95,
        'emotion_regulation': -0.85,
        'impulsivity': 0.8,
        'avoidance_coping': 0.75,
        'self_soothing': 0.7,
      },
    ),
    'money_mindset_habits_v1:q4': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q4',
      axisWeights: {
        'impulsivity': 0.9,
        'self_discipline': -0.95,
        'financial_planning': -0.9,
        'future_orientation': -0.8,
        'restraint': -0.85,
      },
    ),
    'money_mindset_habits_v1:q5': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q5',
      axisWeights: {
        'impulsivity': -0.85,
        'self_discipline': 0.9,
        'conscientiousness': 0.8,
        'deliberation': 0.85,
        'planning_orientation': 0.75,
      },
    ),

    // Financial Avoidance (Q6-10)
    'money_mindset_habits_v1:q6': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q6',
      axisWeights: {
        'procrastination': 0.9,
        'avoidance_coping': 0.85,
        'financial_avoidance': 0.95,
        'anxiety_avoidance': 0.8,
        'conscientiousness': -0.75,
      },
    ),
    'money_mindset_habits_v1:q7': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q7',
      axisWeights: {
        'financial_avoidance': 0.95,
        'anxiety_avoidance': 0.9,
        'financial_anxiety': 0.85,
        'avoidance_coping': 0.8,
        'emotional_avoidance': 0.75,
      },
    ),
    'money_mindset_habits_v1:q8': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q8',
      axisWeights: {
        'financial_avoidance': 0.9,
        'financial_awareness': -0.95,
        'conscientiousness': -0.8,
        'self_discipline': -0.75,
        'organization': -0.85,
      },
    ),
    'money_mindset_habits_v1:q9': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q9',
      axisWeights: {
        'financial_avoidance': -0.9,
        'financial_awareness': 0.95,
        'emotional_regulation': 0.8,
        'conscientiousness': 0.85,
        'self_efficacy': 0.75,
      },
    ),
    'money_mindset_habits_v1:q10': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q10',
      axisWeights: {
        'financial_avoidance': 0.85,
        'openness_communication': -0.8,
        'social_avoidance': 0.75,
        'shame': 0.7,
        'vulnerability_avoidance': 0.8,
      },
    ),

    // Rigid Control (Q11-15)
    'money_mindset_habits_v1:q11': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q11',
      axisWeights: {
        'financial_rigidity': 0.9,
        'anxiety': 0.85,
        'control_need': 0.8,
        'spontaneity': -0.75,
        'flexibility': -0.7,
      },
    ),
    'money_mindset_habits_v1:q12': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q12',
      axisWeights: {
        'guilt': 0.9,
        'self_denial': 0.85,
        'financial_rigidity': 0.8,
        'self_compassion': -0.85,
        'permission_giving': -0.75,
      },
    ),
    'money_mindset_habits_v1:q13': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q13',
      axisWeights: {
        'financial_rigidity': 0.85,
        'control_need': 0.9,
        'perfectionism': 0.8,
        'flexibility': -0.85,
        'rigidity': 0.8,
      },
    ),
    'money_mindset_habits_v1:q14': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q14',
      axisWeights: {
        'financial_rigidity': 0.8,
        'rigidity': 0.85,
        'control_need': 0.75,
        'social_awareness': 0.7,
        'flexibility': -0.8,
      },
    ),
    'money_mindset_habits_v1:q15': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q15',
      axisWeights: {
        'financial_rigidity': -0.8,
        'flexibility': 0.85,
        'spontaneity': 0.8,
        'permission_giving': 0.75,
        'self_compassion': 0.7,
      },
    ),

    // Poverty Fear (Q16-19)
    'money_mindset_habits_v1:q16': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q16',
      axisWeights: {
        'financial_anxiety': 0.95,
        'catastrophizing': 0.9,
        'anxiety': 0.85,
        'insecurity': 0.8,
        'trust_future': -0.85,
      },
    ),
    'money_mindset_habits_v1:q17': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q17',
      axisWeights: {
        'financial_anxiety': 0.9,
        'poverty_fear': 0.95,
        'catastrophizing': 0.85,
        'anxiety': 0.8,
        'worry': 0.85,
      },
    ),
    'money_mindset_habits_v1:q18': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q18',
      axisWeights: {
        'catastrophizing': 0.95,
        'rumination': 0.9,
        'financial_anxiety': 0.85,
        'negative_thinking': 0.8,
        'anxiety': 0.75,
      },
    ),
    'money_mindset_habits_v1:q19': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q19',
      axisWeights: {
        'financial_anxiety': -0.85,
        'self_efficacy': 0.9,
        'resilience': 0.85,
        'optimism': 0.8,
        'trust_future': 0.85,
      },
    ),

    // Money Shame (Q20-24)
    'money_mindset_habits_v1:q20': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q20',
      axisWeights: {
        'shame': 0.95,
        'social_comparison': 0.9,
        'self_worth': -0.85,
        'financial_shame': 0.9,
        'self_criticism': 0.8,
      },
    ),
    'money_mindset_habits_v1:q21': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q21',
      axisWeights: {
        'financial_shame': 0.9,
        'shame': 0.85,
        'vulnerability_avoidance': 0.8,
        'fear_of_judgment': 0.9,
        'openness_communication': -0.75,
      },
    ),
    'money_mindset_habits_v1:q22': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q22',
      axisWeights: {
        'financial_shame': 0.85,
        'guilt': 0.9,
        'shame': 0.8,
        'social_comparison': 0.75,
        'discomfort_with_privilege': 0.8,
      },
    ),
    'money_mindset_habits_v1:q23': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q23',
      axisWeights: {
        'financial_shame': 0.9,
        'self_worth': -0.95,
        'social_comparison': 0.9,
        'inadequacy': 0.85,
        'status_consciousness': 0.8,
      },
    ),
    'money_mindset_habits_v1:q24': QuestionWeight(
      testId: 'money_mindset_habits_v1',
      questionId: 'q24',
      axisWeights: {
        'financial_shame': -0.9,
        'self_worth': 0.85,
        'openness_communication': 0.8,
        'self_acceptance': 0.85,
        'shame': -0.8,
      },
    ),
  };
}
