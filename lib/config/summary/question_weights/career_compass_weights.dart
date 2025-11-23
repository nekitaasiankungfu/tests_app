import 'question_weight_models.dart';

/// Question weights configuration for Career Compass Test
/// Maps 8 career interest scales to ~195 hierarchical psychological scales
///
/// Career Compass uses forced-choice (ipsative) scoring with 8 scales:
/// - people - working with people, communication
/// - analysis - research, data analysis
/// - creation - creativity, artistic expression
/// - technology - technical work, engineering
/// - business - management, entrepreneurship
/// - nature - outdoor work, environmental
/// - order - organization, structure
/// - care - helping, nurturing
///
/// Unlike traditional tests, Career Compass saves scale scores as "questions"
/// using format: scale_[scaleId] with normalized score (0-4)
class CareerCompassWeights {
  /// CAREER COMPASS TEST - 8 Scale "Questions"
  ///
  /// Each scale result contributes to personality type and other scales
  /// Weight categories: Primary (0.9-1.2), Secondary (0.5-0.8), Tertiary (0.2-0.4)
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // PEOPLE SCALE - Working with people, communication
    // High score indicates social orientation, extroversion
    // ========================================================================
    'career_compass_v1:scale_people': const QuestionWeight(
      testId: 'career_compass_v1',
      questionId: 'scale_people',
      axisWeights: {
        // Personality Type
        'extraversion': 1.0,              // Primary: Social orientation
        'feeling': 0.6,                   // Secondary: People-focused decisions
        // Big Five related
        'sociability': 1.0,               // Primary: Social engagement
        'warmth': 0.9,                    // High: Interpersonal warmth
        'communication_skills': 0.9,      // High: Communication ability
        'empathy': 0.8,                   // High: Understanding others
        'team_orientation': 0.8,          // High: Group work preference
        'cooperation': 0.7,               // Secondary: Working together
        'gregariousness': 0.7,            // Secondary: Social activity
        'friendliness': 0.6,              // Secondary: Approachability
        'assertiveness': 0.5,             // Moderate: Social confidence
      },
    ),

    // ========================================================================
    // ANALYSIS SCALE - Research, data analysis, investigation
    // High score indicates analytical thinking, introversion
    // ========================================================================
    'career_compass_v1:scale_analysis': const QuestionWeight(
      testId: 'career_compass_v1',
      questionId: 'scale_analysis',
      axisWeights: {
        // Personality Type
        'thinking': 1.0,                  // Primary: Logical analysis
        'introversion': 0.6,              // Secondary: Reflective work
        'intuition': 0.5,                 // Moderate: Pattern recognition
        // Big Five related
        'analytical_thinking': 1.0,       // Primary: Data analysis
        'intellect': 0.9,                 // High: Intellectual curiosity
        'attention_to_detail': 0.8,       // High: Precision
        'curiosity': 0.8,                 // High: Knowledge seeking
        'methodicalness': 0.7,            // Secondary: Systematic approach
        'competence': 0.7,                // Secondary: Expertise focus
        'objectivity': 0.6,               // Secondary: Unbiased thinking
        'critical_thinking': 0.6,         // Secondary: Evaluation skills
        'rationality': 0.5,               // Moderate: Reason-based
      },
    ),

    // ========================================================================
    // CREATION SCALE - Creativity, artistic expression
    // High score indicates creative orientation, openness
    // ========================================================================
    'career_compass_v1:scale_creation': const QuestionWeight(
      testId: 'career_compass_v1',
      questionId: 'scale_creation',
      axisWeights: {
        // Personality Type
        'intuition': 0.9,                 // High: Abstract thinking
        'perceiving': 0.7,                // Secondary: Flexible approach
        'feeling': 0.5,                   // Moderate: Aesthetic values
        // Big Five related
        'creativity': 1.1,                // Primary: Creative expression
        'imagination': 1.0,               // Primary: Imaginative thinking
        'aesthetic_sensitivity': 0.9,     // High: Artistic appreciation
        'openness_to_experience': 0.8,    // High: New experiences
        'innovation': 0.8,                // High: Novel solutions
        'originality': 0.7,               // Secondary: Unique ideas
        'artistic_interests': 0.7,        // Secondary: Arts engagement
        'unconventionality': 0.6,         // Secondary: Non-traditional
        'self_expression': 0.6,           // Secondary: Personal expression
      },
    ),

    // ========================================================================
    // TECHNOLOGY SCALE - Technical work, engineering
    // High score indicates technical orientation, systematic thinking
    // ========================================================================
    'career_compass_v1:scale_technology': const QuestionWeight(
      testId: 'career_compass_v1',
      questionId: 'scale_technology',
      axisWeights: {
        // Personality Type
        'thinking': 0.9,                  // High: Logical systems
        'sensing': 0.7,                   // Secondary: Concrete implementation
        'introversion': 0.5,              // Moderate: Focused work
        // Big Five related
        'competence': 1.0,                // Primary: Technical mastery
        'analytical_thinking': 0.9,       // High: Problem solving
        'intellect': 0.8,                 // High: Technical knowledge
        'problem_solving': 0.8,           // High: Solution finding
        'persistence': 0.7,               // Secondary: Task completion
        'focus': 0.7,                     // Secondary: Concentration
        'precision': 0.6,                 // Secondary: Exactness
        'self_efficacy': 0.6,             // Secondary: Confidence
        'independence': 0.5,              // Moderate: Autonomous work
      },
    ),

    // ========================================================================
    // BUSINESS SCALE - Management, entrepreneurship
    // High score indicates leadership orientation, extroversion
    // ========================================================================
    'career_compass_v1:scale_business': const QuestionWeight(
      testId: 'career_compass_v1',
      questionId: 'scale_business',
      axisWeights: {
        // Personality Type
        'extraversion': 0.8,              // High: Social leadership
        'thinking': 0.7,                  // Secondary: Strategic decisions
        'judging': 0.7,                   // Secondary: Organized approach
        // Big Five related
        'leadership': 1.0,                // Primary: Leading others
        'ambition': 0.9,                  // High: Goal pursuit
        'assertiveness': 0.9,             // High: Confident action
        'achievement_striving': 0.8,      // High: Success orientation
        'dominance': 0.7,                 // Secondary: Taking charge
        'competitiveness': 0.7,           // Secondary: Competitive drive
        'confidence': 0.7,                // Secondary: Self-assurance
        'influence': 0.6,                 // Secondary: Persuasion
        'risk_taking': 0.6,               // Secondary: Entrepreneurial risk
        'decision_making': 0.5,           // Moderate: Decisive action
      },
    ),

    // ========================================================================
    // NATURE SCALE - Outdoor work, environmental
    // High score indicates nature orientation, physical activity
    // ========================================================================
    'career_compass_v1:scale_nature': const QuestionWeight(
      testId: 'career_compass_v1',
      questionId: 'scale_nature',
      axisWeights: {
        // Personality Type
        'sensing': 0.8,                   // High: Concrete experience
        'perceiving': 0.6,                // Secondary: Flexible approach
        // Big Five related
        'nature_connection': 1.1,         // Primary: Nature affinity
        'activity': 0.9,                  // High: Physical engagement
        'adventure_seeking': 0.8,         // High: Outdoor exploration
        'practicality': 0.7,              // Secondary: Hands-on work
        'simplicity': 0.7,                // Secondary: Simple living
        'independence': 0.6,              // Secondary: Autonomous work
        'physical_health': 0.6,           // Secondary: Health awareness
        'endurance': 0.5,                 // Moderate: Stamina
        'environmental_awareness': 0.5,   // Moderate: Eco-consciousness
      },
    ),

    // ========================================================================
    // ORDER SCALE - Organization, structure, systems
    // High score indicates structured orientation, conscientiousness
    // ========================================================================
    'career_compass_v1:scale_order': const QuestionWeight(
      testId: 'career_compass_v1',
      questionId: 'scale_order',
      axisWeights: {
        // Personality Type
        'judging': 1.0,                   // Primary: Structured approach
        'sensing': 0.7,                   // Secondary: Concrete details
        'thinking': 0.5,                  // Moderate: Logical systems
        // Big Five related
        'orderliness': 1.0,               // Primary: Organization
        'methodicalness': 0.9,            // High: Systematic approach
        'attention_to_detail': 0.9,       // High: Precision
        'self_discipline': 0.8,           // High: Self-control
        'reliability': 0.8,               // High: Dependability
        'dutifulness': 0.7,               // Secondary: Rule following
        'perfectionism': 0.7,             // Secondary: High standards
        'planning': 0.7,                  // Secondary: Future preparation
        'cautiousness': 0.6,              // Secondary: Careful action
        'consistency': 0.5,               // Moderate: Stable behavior
      },
    ),

    // ========================================================================
    // CARE SCALE - Helping, nurturing, supporting
    // High score indicates nurturing orientation, empathy
    // ========================================================================
    'career_compass_v1:scale_care': const QuestionWeight(
      testId: 'career_compass_v1',
      questionId: 'scale_care',
      axisWeights: {
        // Personality Type
        'feeling': 1.0,                   // Primary: Value-based decisions
        'extraversion': 0.5,              // Moderate: People interaction
        // Big Five related
        'nurturance': 1.0,                // Primary: Caring for others
        'empathy': 0.9,                   // High: Understanding feelings
        'compassion': 0.9,                // High: Care for suffering
        'supportiveness': 0.8,            // High: Helping others
        'altruism': 0.8,                  // High: Selfless concern
        'warmth': 0.7,                    // Secondary: Interpersonal warmth
        'patience': 0.7,                  // Secondary: Tolerant waiting
        'cooperation': 0.6,               // Secondary: Working together
        'trust': 0.6,                     // Secondary: Faith in others
        'emotional_stability': 0.5,       // Moderate: Calm presence
        'sensitivity': 0.5,               // Moderate: Emotional awareness
      },
    ),
  };
}
