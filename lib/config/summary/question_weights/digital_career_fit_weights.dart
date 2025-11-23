import 'question_weight_models.dart';

/// Question weights configuration for Digital Career Fit Test
/// Maps 18 questions across 6 digital career directions to psychological scales
///
/// Career Directions:
/// - product_thinking (score 0)
/// - data_analytics (score 1)
/// - design_ux (score 2)
/// - content_marketing (score 3)
/// - management_communication (score 4)
/// - tech_development (score 5)
///
/// Note: This test uses single-choice questions where each answer
/// corresponds to a different career direction. The score indicates
/// which direction was chosen.
class DigitalCareerFitWeights {
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // Q1: Most interesting task
    // ========================================================================
    'digital_career_fit_v1:q1': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q1',
      axisWeights: {
        // Product thinking (score 0)
        'strategic_thinking': 0.3,
        'business_acumen': 0.3,
        // Data analytics (score 1)
        'analytical_thinking': 0.3,
        'attention_to_detail': 0.2,
        // Design/UX (score 2)
        'creativity': 0.3,
        'aesthetic_sensitivity': 0.3,
        // Content/Marketing (score 3)
        'communication_skills': 0.3,
        'influence_motivation': 0.2,
        // Management (score 4)
        'leadership': 0.3,
        'organization_skills': 0.3,
        // Tech (score 5)
        'technical_aptitude': 0.3,
        'problem_solving': 0.3,
        // Bipolar scales
        'thinking': 0.3,  // Analytical tasks
        'intuition': 0.2, // Creative/strategic tasks
      },
    ),

    // ========================================================================
    // Q2: Work day format
    // ========================================================================
    'digital_career_fit_v1:q2': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q2',
      axisWeights: {
        'strategic_thinking': 0.2,
        'analytical_thinking': 0.3,
        'creativity': 0.3,
        'communication_skills': 0.2,
        'leadership': 0.2,
        'technical_aptitude': 0.3,
        'focus': 0.2,
        // Bipolar scales
        'introversion': 0.3, // Deep focused work
        'judging': 0.2,      // Structured work
      },
    ),

    // ========================================================================
    // Q3: Reaction to new idea
    // ========================================================================
    'digital_career_fit_v1:q3': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q3',
      axisWeights: {
        'business_acumen': 0.3,
        'analytical_thinking': 0.3,
        'empathy': 0.3,
        'communication_skills': 0.3,
        'organization_skills': 0.2,
        'technical_aptitude': 0.3,
        // Bipolar scales
        'thinking': 0.2,   // Analytical approach
        'feeling': 0.2,    // Empathetic approach
        'intuition': 0.3,  // Big picture thinking
      },
    ),

    // ========================================================================
    // Q4: Work motivation
    // ========================================================================
    'digital_career_fit_v1:q4': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q4',
      axisWeights: {
        'achievement_striving': 0.3,
        'analytical_thinking': 0.2,
        'aesthetic_sensitivity': 0.2,
        'influence_motivation': 0.3,
        'leadership': 0.3,
        'technical_aptitude': 0.2,
        'goal_orientation': 0.2,
        // Bipolar scales
        'extraversion': 0.2, // Leadership/influence
        'judging': 0.2,      // Goal-oriented
      },
    ),

    // ========================================================================
    // Q5: Decision making in difficult situations
    // ========================================================================
    'digital_career_fit_v1:q5': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q5',
      axisWeights: {
        'strategic_thinking': 0.3,
        'analytical_thinking': 0.4,
        'empathy': 0.3,
        'communication_skills': 0.2,
        'organization_skills': 0.3,
        'problem_solving': 0.4,
        // Bipolar scales
        'thinking': 0.3,  // Analytical decision making
        'judging': 0.2,   // Structured approach
      },
    ),

    // ========================================================================
    // Q6: Interesting course
    // ========================================================================
    'digital_career_fit_v1:q6': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q6',
      axisWeights: {
        'business_acumen': 0.3,
        'analytical_thinking': 0.3,
        'creativity': 0.3,
        'communication_skills': 0.3,
        'leadership': 0.2,
        'technical_aptitude': 0.4,
        'openness': 0.2,
        // Bipolar scales
        'intuition': 0.3, // Learning new things
        'perceiving': 0.2, // Openness to learning
      },
    ),

    // ========================================================================
    // Q7: Attitude to routine
    // ========================================================================
    'digital_career_fit_v1:q7': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q7',
      axisWeights: {
        'efficiency': 0.2,
        'attention_to_detail': 0.3,
        'creativity': 0.2,
        'novelty_seeking': 0.2,
        'conscientiousness': 0.3,
        'persistence': 0.3,
        // Bipolar scales
        'judging': 0.3,   // Structured routine
        'sensing': 0.2,   // Detail-oriented
      },
    ),

    // ========================================================================
    // Q8: Statement agreement
    // ========================================================================
    'digital_career_fit_v1:q8': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q8',
      axisWeights: {
        'business_acumen': 0.3,
        'analytical_thinking': 0.4,
        'aesthetic_sensitivity': 0.3,
        'influence_motivation': 0.3,
        'organization_skills': 0.3,
        'technical_aptitude': 0.3,
        // Bipolar scales
        'thinking': 0.3,   // Logical analysis
        'sensing': 0.2,    // Practical approach
      },
    ),

    // ========================================================================
    // Q9: Learning preference
    // ========================================================================
    'digital_career_fit_v1:q9': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q9',
      axisWeights: {
        'strategic_thinking': 0.2,
        'analytical_thinking': 0.3,
        'creativity': 0.3,
        'communication_skills': 0.2,
        'leadership': 0.2,
        'technical_aptitude': 0.3,
        'openness': 0.3,
        // Bipolar scales
        'intuition': 0.3,  // Abstract learning
        'perceiving': 0.2, // Flexible learning style
      },
    ),

    // ========================================================================
    // Q10: Reaction to error
    // ========================================================================
    'digital_career_fit_v1:q10': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q10',
      axisWeights: {
        'strategic_thinking': 0.3,
        'analytical_thinking': 0.4,
        'empathy': 0.2,
        'communication_skills': 0.2,
        'organization_skills': 0.3,
        'problem_solving': 0.4,
        'self_reflection': 0.2,
        // Bipolar scales
        'thinking': 0.3,     // Logical problem solving
        'introversion': 0.2, // Self-reflection
      },
    ),

    // ========================================================================
    // Q11: Most satisfying result
    // ========================================================================
    'digital_career_fit_v1:q11': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q11',
      axisWeights: {
        'achievement_striving': 0.3,
        'analytical_thinking': 0.3,
        'aesthetic_sensitivity': 0.3,
        'influence_motivation': 0.3,
        'leadership': 0.3,
        'technical_aptitude': 0.3,
        // Bipolar scales
        'feeling': 0.2,      // Satisfaction from impact
        'extraversion': 0.2, // Recognition motivation
      },
    ),

    // ========================================================================
    // Q12: Presenting idea to team
    // ========================================================================
    'digital_career_fit_v1:q12': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q12',
      axisWeights: {
        'business_acumen': 0.3,
        'analytical_thinking': 0.3,
        'creativity': 0.3,
        'communication_skills': 0.4,
        'organization_skills': 0.3,
        'technical_aptitude': 0.2,
        'assertiveness': 0.2,
        // Bipolar scales
        'extraversion': 0.3, // Presenting to others
        'thinking': 0.2,     // Structured presentation
      },
    ),

    // ========================================================================
    // Q13: Task type in team projects
    // ========================================================================
    'digital_career_fit_v1:q13': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q13',
      axisWeights: {
        'strategic_thinking': 0.3,
        'analytical_thinking': 0.3,
        'creativity': 0.3,
        'communication_skills': 0.3,
        'leadership': 0.3,
        'technical_aptitude': 0.3,
        'team_orientation': 0.2,
        // Bipolar scales
        'extraversion': 0.2, // Team collaboration
        'judging': 0.2,      // Task organization
      },
    ),

    // ========================================================================
    // Q14: Most important in digital product
    // ========================================================================
    'digital_career_fit_v1:q14': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q14',
      axisWeights: {
        'business_acumen': 0.3,
        'analytical_thinking': 0.2,
        'aesthetic_sensitivity': 0.3,
        'influence_motivation': 0.2,
        'empathy': 0.2,
        'technical_aptitude': 0.3,
        // Bipolar scales
        'feeling': 0.2,   // User empathy
        'sensing': 0.2,   // Practical quality
      },
    ),

    // ========================================================================
    // Q15: Comfortable work environment
    // ========================================================================
    'digital_career_fit_v1:q15': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q15',
      axisWeights: {
        'strategic_thinking': 0.2,
        'attention_to_detail': 0.3,
        'creativity': 0.3,
        'communication_skills': 0.3,
        'team_orientation': 0.3,
        'technical_aptitude': 0.3,
        // Bipolar scales
        'extraversion': 0.2,  // Social environment
        'introversion': -0.2, // Negative for solo preference
      },
    ),

    // ========================================================================
    // Q16: Easiest to come up with
    // ========================================================================
    'digital_career_fit_v1:q16': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q16',
      axisWeights: {
        'business_acumen': 0.3,
        'analytical_thinking': 0.3,
        'creativity': 0.4,
        'communication_skills': 0.3,
        'organization_skills': 0.3,
        'problem_solving': 0.3,
        // Bipolar scales
        'intuition': 0.3, // Creative ideation
        'perceiving': 0.2, // Flexibility in thinking
      },
    ),

    // ========================================================================
    // Q17: Own project role
    // ========================================================================
    'digital_career_fit_v1:q17': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q17',
      axisWeights: {
        'strategic_thinking': 0.4,
        'analytical_thinking': 0.3,
        'creativity': 0.3,
        'communication_skills': 0.3,
        'leadership': 0.4,
        'technical_aptitude': 0.4,
        'autonomy': 0.3,
        // Bipolar scales
        'introversion': 0.2, // Independent work
        'judging': 0.3,      // Project planning
      },
    ),

    // ========================================================================
    // Q18: Pleasant compliment
    // ========================================================================
    'digital_career_fit_v1:q18': QuestionWeight(
      testId: 'digital_career_fit_v1',
      questionId: 'q18',
      axisWeights: {
        'strategic_thinking': 0.3,
        'analytical_thinking': 0.3,
        'aesthetic_sensitivity': 0.3,
        'influence_motivation': 0.3,
        'leadership': 0.3,
        'technical_aptitude': 0.3,
        'self_esteem': 0.2,
        // Bipolar scales
        'feeling': 0.2,      // Value recognition
        'extraversion': 0.2, // Social validation
      },
    ),
  };
}
