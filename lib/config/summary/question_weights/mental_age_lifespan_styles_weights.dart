import 'question_weight_models.dart';

/// Question weights for Mental Age: Style of Adulthood Test.
///
/// Maps 36 questions to psychological scales:
/// - Inner Child (Q1,5,9,13R,17,21,25,29,33) → playfulness, spontaneity, impulsiveness
/// - Teen Rebel (Q2,6,10,14R,18,22,26,30,34) → independence, rebelliousness, autonomy
/// - Young Adult (Q3,7,11,15R,19,23,27,31,35) → responsibility, planning, goal_orientation
/// - Inner Elder (Q4,8,12,16R,20,24,28,32,36) → wisdom, reflection, stability
///
/// All scales use existing hierarchical scales.
/// Scores: 0-4 (Likert 5-point scale: Strongly disagree to Strongly agree)
class MentalAgeLifespanStylesWeights {
  static final Map<String, QuestionWeight> weights = {
    // Inner Child (Q1,5,9,13R,17,21) - Playfulness, spontaneity, pleasure focus
    'mental_age_lifespan_styles_v1:q1': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q1',
      axisWeights: {
        'playfulness': 0.9, // Fun over useful
        'spontaneity': 0.85,
        'hedonism': 0.7,
        'self_discipline': -0.6,
      },
    ),
    'mental_age_lifespan_styles_v1:q5': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q5',
      axisWeights: {
        'playfulness': 0.85, // Absorbed in games/shows
        'focus': -0.7,
        'time_management': -0.75,
        'procrastination': 0.6,
      },
    ),
    'mental_age_lifespan_styles_v1:q9': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q9',
      axisWeights: {
        'playfulness': 0.9, // Lose track of time when playing
        'creativity': 0.7,
        'spontaneity': 0.75,
        'time_awareness': -0.6,
      },
    ),
    'mental_age_lifespan_styles_v1:q13': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q13',
      axisWeights: {
        'playfulness': -0.85, // REVERSED: Hard to be playful
        'seriousness': 0.8,
        'spontaneity': -0.75,
        'emotional_expressiveness': -0.6,
      },
    ),
    'mental_age_lifespan_styles_v1:q17': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q17',
      axisWeights: {
        'playfulness': 0.9, // Keep space for play/creativity
        'creativity': 0.8,
        'life_satisfaction': 0.6,
        'work_life_balance': 0.7,
      },
    ),
    'mental_age_lifespan_styles_v1:q21': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q21',
      axisWeights: {
        'playfulness': 0.9, // Life as game first
        'responsibility': -0.8,
        'spontaneity': 0.75,
        'hedonism': 0.7,
      },
    ),

    // Teen Rebel (Q2,6,10,14R,18,22) - Independence, rebelliousness, autonomy
    'mental_age_lifespan_styles_v1:q2': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q2',
      axisWeights: {
        'rebelliousness': 0.9, // Want to do opposite
        'independence': 0.8,
        'conformity': -0.85,
        'openness_to_influence': -0.7,
      },
    ),
    'mental_age_lifespan_styles_v1:q6': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q6',
      axisWeights: {
        'rebelliousness': 0.85, // Think how to get around rules
        'rule_following': -0.9,
        'autonomy': 0.75,
        'defiance': 0.8,
      },
    ),
    'mental_age_lifespan_styles_v1:q10': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q10',
      axisWeights: {
        'rebelliousness': 0.8, // Hard to accept authority
        'autonomy': 0.85,
        'submissiveness': -0.9,
        'independence': 0.75,
      },
    ),
    'mental_age_lifespan_styles_v1:q14': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q14',
      axisWeights: {
        'rebelliousness': -0.85, // REVERSED: No inner protest
        'conformity': 0.9,
        'compliance': 0.8,
        'autonomy': -0.75,
      },
    ),
    'mental_age_lifespan_styles_v1:q18': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q18',
      axisWeights: {
        'rebelliousness': 0.75, // React to injustice
        'justice_orientation': 0.9,
        'empathy': 0.7,
        'social_activism': 0.8,
      },
    ),
    'mental_age_lifespan_styles_v1:q22': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q22',
      axisWeights: {
        'rebelliousness': 0.9, // Argue with authorities
        'independence': 0.85,
        'critical_thinking': 0.7,
        'conformity': -0.85,
      },
    ),

    // Young Adult (Q3,7,11,15R,19,23) - Responsibility, planning, goal orientation
    'mental_age_lifespan_styles_v1:q3': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q3',
      axisWeights: {
        'goal_orientation': 0.9, // Have a plan
        'planning': 0.9,
        'future_orientation': 0.8,
        'purposefulness': 0.85,
      },
    ),
    'mental_age_lifespan_styles_v1:q7': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q7',
      axisWeights: {
        'responsibility': 0.9, // Follow through despite laziness/fear
        'persistence': 0.85,
        'self_discipline': 0.85,
        'courage': 0.7,
      },
    ),
    'mental_age_lifespan_styles_v1:q11': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q11',
      axisWeights: {
        'responsibility': 0.85, // Think about finances/work
        'financial_responsibility': 0.9,
        'planning': 0.75,
        'maturity': 0.8,
      },
    ),
    'mental_age_lifespan_styles_v1:q15': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q15',
      axisWeights: {
        'goal_orientation': -0.85, // REVERSED: Go with flow
        'planning': -0.85,
        'spontaneity': 0.7,
        'purposefulness': -0.8,
      },
    ),
    'mental_age_lifespan_styles_v1:q19': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q19',
      axisWeights: {
        'self_discipline': 0.9, // Have habits to stay on track
        'health_consciousness': 0.8,
        'routine': 0.75,
        'responsibility': 0.8,
      },
    ),
    'mental_age_lifespan_styles_v1:q23': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q23',
      axisWeights: {
        'rationality': 0.9, // Logic over emotions
        'analytical_thinking': 0.85,
        'emotional_regulation': 0.7,
        'thoughtfulness': 0.8,
      },
    ),

    // Inner Elder (Q4,8,12,16R,20,24) - Wisdom, reflection, stability
    'mental_age_lifespan_styles_v1:q4': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q4',
      axisWeights: {
        'long_term_thinking': 0.9, // Think 5-10 years ahead
        'future_orientation': 0.85,
        'wisdom': 0.8,
        'foresight': 0.85,
      },
    ),
    'mental_age_lifespan_styles_v1:q8': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q8',
      axisWeights: {
        'calmness': 0.85, // Value calm predictable days
        'stability_seeking': 0.9,
        'novelty_seeking': -0.7,
        'peace_of_mind': 0.8,
      },
    ),
    'mental_age_lifespan_styles_v1:q12': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q12',
      axisWeights: {
        'nostalgia': 0.8, // Compare to 'back then'
        'reflection': 0.75,
        'life_review': 0.7,
        'traditionalism': 0.6,
      },
    ),
    'mental_age_lifespan_styles_v1:q16': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q16',
      axisWeights: {
        'generativity': -0.9, // REVERSED: Rarely think about legacy
        'meaning_in_life': -0.8,
        'long_term_thinking': -0.75,
        'altruism': -0.7,
      },
    ),
    'mental_age_lifespan_styles_v1:q20': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q20',
      axisWeights: {
        'selectivity': 0.85, // Invest in few close people
        'depth_over_breadth': 0.9,
        'quality_of_relationships': 0.85,
        'wisdom': 0.7,
      },
    ),
    'mental_age_lifespan_styles_v1:q24': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q24',
      axisWeights: {
        'wisdom': 0.9, // Save energy for what matters
        'prioritization': 0.85,
        'emotional_stability': 0.75,
        'maturity': 0.8,
      },
    ),

    // NEW QUESTIONS (Q25-Q36) - Expansion to 36 questions total

    // Inner Child (Q25, Q29, Q33)
    'mental_age_lifespan_styles_v1:q25': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q25',
      axisWeights: {
        'impulsiveness': 0.85, // Buy cute things "just because"
        'hedonism': 0.8,
        'playfulness': 0.75,
        'financial_responsibility': -0.7,
      },
    ),
    'mental_age_lifespan_styles_v1:q29': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q29',
      axisWeights: {
        'playfulness': 0.9, // Drawn to playground equipment
        'spontaneity': 0.8,
        'childlike_wonder': 0.85,
        'self_consciousness': -0.6,
      },
    ),
    'mental_age_lifespan_styles_v1:q33': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q33',
      axisWeights: {
        'spontaneity': 0.9, // Suddenly change plans for fun
        'flexibility': 0.85,
        'novelty_seeking': 0.75,
        'planning': -0.7,
      },
    ),

    // Teen Rebel (Q26, Q30, Q34)
    'mental_age_lifespan_styles_v1:q26': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q26',
      axisWeights: {
        'rebelliousness': 0.9, // Want to test "impossible"
        'curiosity': 0.8,
        'autonomy': 0.85,
        'conformity': -0.8,
      },
    ),
    'mental_age_lifespan_styles_v1:q30': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q30',
      axisWeights: {
        'critical_thinking': 0.85, // Need to understand rules
        'autonomy': 0.9,
        'intellectual_autonomy': 0.8,
        'blind_obedience': -0.9,
      },
    ),
    'mental_age_lifespan_styles_v1:q34': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q34',
      axisWeights: {
        'independent_thinking': 0.9, // Seek different perspectives
        'rebelliousness': 0.75,
        'creativity': 0.7,
        'conformity': -0.85,
      },
    ),

    // Young Adult (Q27, Q31, Q35)
    'mental_age_lifespan_styles_v1:q27': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q27',
      axisWeights: {
        'persistence': 0.9, // Finish what started despite fatigue
        'responsibility': 0.85,
        'self_discipline': 0.85,
        'giving_up_easily': -0.8,
      },
    ),
    'mental_age_lifespan_styles_v1:q31': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q31',
      axisWeights: {
        'financial_responsibility': 0.95, // Track finances
        'planning': 0.85,
        'organization': 0.8,
        'impulsiveness': -0.75,
      },
    ),
    'mental_age_lifespan_styles_v1:q35': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q35',
      axisWeights: {
        'deliberation': 0.9, // Gather info, weigh pros/cons
        'analytical_thinking': 0.85,
        'thoughtfulness': 0.8,
        'impulsiveness': -0.85,
      },
    ),

    // Inner Elder (Q28, Q32, Q36)
    'mental_age_lifespan_styles_v1:q28': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q28',
      axisWeights: {
        'existential_thinking': 0.9, // Think about meaning & legacy
        'generativity': 0.85,
        'meaning_in_life': 0.85,
        'depth': 0.8,
      },
    ),
    'mental_age_lifespan_styles_v1:q32': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q32',
      axisWeights: {
        'selectivity': 0.9, // Prefer few close people
        'depth_over_breadth': 0.9,
        'intimacy': 0.75, // Value close intimate relationships (hierarchical scale, NOT bipolar)
        'quality_of_relationships': 0.85,
      },
    ),
    'mental_age_lifespan_styles_v1:q36': QuestionWeight(
      testId: 'mental_age_lifespan_styles_v1',
      questionId: 'q36',
      axisWeights: {
        'self_knowledge': 0.9, // Know self, don't chase trends
        'autonomy': 0.85,
        'maturity': 0.85,
        'social_conformity': -0.8,
      },
    ),
  };
}
