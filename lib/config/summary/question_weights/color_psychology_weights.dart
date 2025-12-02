import 'question_weight_models.dart';

/// Question weights configuration for Color Psychology Test
/// Maps 12 color psychology scales to ~195 hierarchical psychological scales
///
/// Color Psychology test measures:
/// - energy_level - Overall energy and vitality
/// - stress_level - Current stress and tension
/// - emotional_balance - Emotional stability and equilibrium
/// - openness - Openness to new experiences
/// - control_need - Need for control and structure
/// - satisfaction - Life satisfaction and contentment
/// - defensiveness - Psychological defensiveness
/// - need_for_change - Desire for change and novelty
/// - optimism - Positive outlook and hope
/// - social_connection - Need for social bonds
/// - self_esteem - Self-worth and confidence
/// - future_orientation - Focus on future goals
///
/// Unlike traditional tests, Color Psychology saves scale scores as "questions"
/// using format: scale_[scaleId] with normalized score (0-4)
///
/// IMPORTANT: Uses ONLY existing scales from hierarchical_scales.dart (195 scales)
class ColorPsychologyWeights {
  /// COLOR PSYCHOLOGY TEST - 12 Scale "Questions"
  ///
  /// Each scale result contributes to personality type and other scales
  /// Weight categories: Primary (0.9-1.2), Secondary (0.5-0.8), Tertiary (0.2-0.4)
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // ENERGY LEVEL - Overall energy and vitality
    // High score indicates high energy, activity, enthusiasm
    // ========================================================================
    'color_psychology_v1:scale_energy_level': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_energy_level',
      axisWeights: {
        // Personality Type
        'extraversion': 0.8,              // High energy correlates with extraversion
        // Extraversion facets
        'activity': 1.0,                  // Primary: Energy level
        'excitement_seeking': 0.7,        // Secondary: Active lifestyle
        'assertiveness': 0.6,             // Secondary: Energetic assertion
        'liveliness': 0.9,                // High: Enthusiasm and vigor
        'positive_emotions': 0.7,         // Secondary: Positive affect
        // Wellbeing
        'vitality': 1.0,                  // Primary: Life energy
        // Motivation
        'intrinsic_motivation': 0.6,      // Secondary: Drive and motivation
        'achievement_motivation': 0.5,    // Moderate: Achievement drive
        // Emotional stability
        'emotional_resilience': 0.5,      // Moderate: Energy supports resilience
      },
    ),

    // ========================================================================
    // STRESS LEVEL - Current stress and tension (INVERTED)
    // High score indicates HIGH stress (negative weights to positive scales)
    // ========================================================================
    'color_psychology_v1:scale_stress_level': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_stress_level',
      axisWeights: {
        // High stress = low in positive scales (negative weights)
        'stress_tolerance': -1.0,         // Primary INVERTED: High stress = low tolerance
        'calmness': -0.9,                 // High INVERTED: High stress = low calm
        'composure': -0.8,                // High INVERTED: Less composed under stress
        'emotional_resilience': -0.7,     // Secondary INVERTED: Stress hurts resilience
        'mood_stability': -0.6,           // Secondary INVERTED: Stress affects mood
        'frustration_tolerance': -0.5,    // Moderate INVERTED: Less tolerance
        // High stress = high in negative scales (positive weights)
        'anxiety': 0.9,                   // High: Stress increases anxiety
        'vulnerability': 0.8,             // High: Stress indicates vulnerability
        'worry_tendency': 0.7,            // Secondary: Stress breeds worry
        'rumination': 0.6,                // Secondary: Stress increases rumination
        'catastrophizing': 0.5,           // Moderate: Stress leads to catastrophizing
      },
    ),

    // ========================================================================
    // EMOTIONAL BALANCE - Emotional stability and equilibrium
    // High score indicates good emotional regulation
    // ========================================================================
    'color_psychology_v1:scale_emotional_balance': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_emotional_balance',
      axisWeights: {
        // Personality Type
        'thinking': 0.4,                  // Moderate: Balance involves some rationality
        'judging': 0.3,                   // Low: Structure helps balance
        // Emotional stability facets
        'emotional_resilience': 1.0,      // Primary: Core emotional balance
        'mood_stability': 0.9,            // High: Stable moods
        'stress_tolerance': 0.8,          // High: Handles stress well
        'composure': 0.8,                 // High: Keeps composure
        'calmness': 0.7,                  // Secondary: Inner calm
        'frustration_tolerance': 0.7,     // Secondary: Handles frustration
        // Low negative emotions
        'anxiety': -0.6,                  // INVERTED: Balance reduces anxiety
        'impulsiveness': -0.5,            // INVERTED: Balance reduces impulsivity
        'emotional_reactivity': -0.4,     // INVERTED: Less reactive
      },
    ),

    // ========================================================================
    // OPENNESS - Openness to new experiences
    // High score indicates curiosity, creativity, openness
    // ========================================================================
    'color_psychology_v1:scale_openness': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_openness',
      axisWeights: {
        // Personality Type
        'intuition': 0.8,                 // High: Abstract, creative thinking
        'perceiving': 0.6,                // Secondary: Flexible, open approach
        // Openness facets
        'curiosity': 0.9,                 // High: Intellectual curiosity
        'intellectual_curiosity': 0.8,    // High: Ideas and learning
        'fantasy': 0.8,                   // High: Imaginative thinking
        'aesthetics': 0.7,                // Secondary: Art appreciation
        'ideas': 0.7,                     // Secondary: Abstract ideas
        'actions': 0.6,                   // Secondary: Trying new things
        'values': 0.5,                    // Moderate: Open to new values
        'artistic_appreciation': 0.5,     // Moderate: Art appreciation
        // Creativity
        'divergent_thinking': 0.6,        // Secondary: Creative thinking
        'originality': 0.5,               // Moderate: Unique ideas
      },
    ),

    // ========================================================================
    // CONTROL NEED - Need for control and structure
    // High score indicates preference for order, planning, control
    // ========================================================================
    'color_psychology_v1:scale_control_need': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_control_need',
      axisWeights: {
        // Personality Type
        'judging': 0.9,                   // High: Preference for structure
        'sensing': 0.5,                   // Moderate: Practical approach
        'thinking': 0.4,                  // Moderate: Logical control
        // Conscientiousness facets
        'order': 0.9,                     // High: Need for order
        'self_discipline': 0.8,           // High: Self-control
        'dutifulness': 0.7,               // Secondary: Responsibility
        'organization': 0.8,              // High: Structured approach
        'deliberation': 0.7,              // Secondary: Thinking before acting
        'diligence': 0.6,                 // Secondary: Thoroughness
        'perfectionism': 0.6,             // Secondary: High standards
        // Behavioral
        'harm_avoidance': 0.5,            // Moderate: Risk aversion
        // May indicate some anxiety about uncertainty
        'anxiety': 0.3,                   // Low: Control need may signal anxiety
      },
    ),

    // ========================================================================
    // SATISFACTION - Life satisfaction and contentment
    // High score indicates happiness, fulfillment, contentment
    // ========================================================================
    'color_psychology_v1:scale_satisfaction': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_satisfaction',
      axisWeights: {
        // Personality Type
        'extraversion': 0.5,              // Moderate: Satisfaction often external
        'feeling': 0.4,                   // Moderate: Values-based satisfaction
        // Wellbeing facets
        'life_satisfaction': 1.0,         // Primary: Core satisfaction
        'happiness': 0.9,                 // High: General happiness
        'positive_emotions': 0.8,         // High: Positive affect
        'meaning_purpose': 0.7,           // Secondary: Sense of purpose
        'self_acceptance': 0.7,           // Secondary: Accepting oneself
        'personal_growth': 0.6,           // Secondary: Development
        'positive_relations': 0.6,        // Secondary: Good relationships
        'vitality': 0.5,                  // Moderate: Life energy
        // Low negative states
        'depression': -0.7,               // INVERTED: Satisfaction counters depression
        'anxiety': -0.5,                  // INVERTED: Satisfaction reduces anxiety
      },
    ),

    // ========================================================================
    // DEFENSIVENESS - Psychological defensiveness
    // High score indicates protective mechanisms, guardedness
    // ========================================================================
    'color_psychology_v1:scale_defensiveness': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_defensiveness',
      axisWeights: {
        // Personality Type
        'introversion': 0.6,              // Secondary: Defensive people often withdraw
        // High defensiveness correlates with
        'self_consciousness': 0.8,        // High: Self-protection
        'vulnerability': 0.7,             // High: Defensive when vulnerable
        'anxiety': 0.6,                   // Secondary: Anxiety drives defense
        'avoidant_attachment': 0.6,       // Secondary: Avoidant patterns
        'harm_avoidance': 0.5,            // Moderate: Risk averse
        'avoidant_coping': 0.7,           // Secondary: Avoidance strategies
        // Low in openness facets
        'trust': -0.6,                    // INVERTED: Less trusting
        'warmth': -0.4,                   // INVERTED: Less warm/open
        'emotional_openness': -0.5,       // INVERTED: Less emotionally open
        'vulnerability_sharing': -0.6,    // INVERTED: Doesn't share vulnerability
      },
    ),

    // ========================================================================
    // NEED FOR CHANGE - Desire for change and novelty
    // High score indicates restlessness, desire for new experiences
    // ========================================================================
    'color_psychology_v1:scale_need_for_change': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_need_for_change',
      axisWeights: {
        // Personality Type
        'perceiving': 0.8,                // High: Flexible, open to change
        'intuition': 0.6,                 // Secondary: Future-focused
        // Behavioral styles
        'novelty_seeking': 0.9,           // High: Seeking novelty
        'sensation_seeking': 0.7,         // Secondary: Need for stimulation
        'risk_taking': 0.6,               // Secondary: Willing to take risks
        // Openness facets
        'actions': 0.8,                   // High: Trying new activities
        'stimulation': 0.8,               // High: Value of novelty
        'curiosity': 0.6,                 // Secondary: Curiosity
        // Low in stability-seeking
        'harm_avoidance': -0.6,           // INVERTED: Less risk averse
        'conformity': -0.5,               // INVERTED: Less conforming
        'tradition': -0.4,                // INVERTED: Less traditional
      },
    ),

    // ========================================================================
    // OPTIMISM - Positive outlook and hope
    // High score indicates positive future expectations
    // ========================================================================
    'color_psychology_v1:scale_optimism': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_optimism',
      axisWeights: {
        // Personality Type
        'extraversion': 0.6,              // Secondary: Optimism often social
        'intuition': 0.5,                 // Moderate: Future-focused
        // Wellbeing facets
        'positive_emotions': 0.9,         // High: Positive affect
        'happiness': 0.8,                 // High: General happiness
        'life_satisfaction': 0.7,         // Secondary: Satisfaction
        'vitality': 0.6,                  // Secondary: Life energy
        // Resilience and coping
        'resilience_meta': 0.8,           // High: Bounce back
        'cognitive_reappraisal': 0.7,     // Secondary: Positive reframing
        'self_efficacy': 0.6,             // Secondary: Belief in ability
        'growth_mindset': 0.6,            // Secondary: Belief in growth
        // Low negative states
        'depression': -0.7,               // INVERTED: Optimism counters depression
        'rumination': -0.5,               // INVERTED: Less ruminating
        'catastrophizing': -0.6,          // INVERTED: Less catastrophizing
      },
    ),

    // ========================================================================
    // SOCIAL CONNECTION - Need for social bonds
    // High score indicates sociability, need for connection
    // ========================================================================
    'color_psychology_v1:scale_social_connection': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_social_connection',
      axisWeights: {
        // Personality Type
        'extraversion': 0.9,              // High: Social orientation
        'feeling': 0.6,                   // Secondary: People-focused
        // Extraversion facets
        'warmth': 0.9,                    // High: Interpersonal warmth
        'gregariousness': 0.9,            // High: Social activity
        'social_boldness': 0.6,           // Secondary: Social confidence
        'expressiveness': 0.6,            // Secondary: Emotional expression
        // Agreeableness facets
        'empathy': 0.7,                   // Secondary: Understanding others
        'trust': 0.6,                     // Secondary: Trusting others
        'compassion': 0.5,                // Moderate: Caring for others
        // Relationship facets
        'secure_attachment': 0.6,         // Secondary: Secure bonds
        'affiliation_motivation': 0.8,    // High: Need to belong
        'relatedness_need': 0.8,          // High: Need for relationships
        // Low social avoidance
        'self_consciousness': -0.5,       // INVERTED: Less self-conscious
        'avoidant_attachment': -0.6,      // INVERTED: Less avoidant
      },
    ),

    // ========================================================================
    // SELF ESTEEM - Self-worth and confidence
    // High score indicates positive self-image
    // ========================================================================
    'color_psychology_v1:scale_self_esteem': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_self_esteem',
      axisWeights: {
        // Personality Type
        'extraversion': 0.5,              // Moderate: Confidence often external
        'thinking': 0.3,                  // Low: Some rational self-assessment
        // Identity facets
        'self_esteem': 1.0,               // Primary: Core self-esteem
        'self_efficacy': 0.9,             // High: Belief in capability
        'self_acceptance': 0.8,           // High: Accepting oneself
        'self_compassion': 0.7,           // Secondary: Self-kindness
        'authenticity': 0.6,              // Secondary: Being true to self
        'identity_clarity': 0.5,          // Moderate: Clear self-concept
        // Extraversion facets
        'assertiveness': 0.7,             // Secondary: Self-assertion
        'social_confidence': 0.6,         // Secondary: Social confidence
        // Emotional stability
        'emotional_resilience': 0.5,      // Moderate: Resilience
        'mood_stability': 0.5,            // Moderate: Stable self-image
        // Low negative self-views
        'self_consciousness': -0.7,       // INVERTED: Less self-conscious
        'depression': -0.6,               // INVERTED: Higher self-esteem = less depression
        'anxiety': -0.4,                  // INVERTED: Less anxiety
      },
    ),

    // ========================================================================
    // FUTURE ORIENTATION - Focus on future goals
    // High score indicates forward-thinking, goal-oriented
    // ========================================================================
    'color_psychology_v1:scale_future_orientation': QuestionWeight(
      testId: 'color_psychology_v1',
      questionId: 'scale_future_orientation',
      axisWeights: {
        // Personality Type
        'intuition': 0.8,                 // High: Abstract future thinking
        'judging': 0.6,                   // Secondary: Planning ahead
        // Conscientiousness facets
        'achievement_striving': 0.9,      // High: Goal focus
        'deliberation': 0.7,              // Secondary: Thinking ahead
        'self_discipline': 0.6,           // Secondary: Discipline for goals
        'organization': 0.5,              // Moderate: Structured approach
        // Motivation facets
        'achievement_motivation': 0.8,    // High: Achievement drive
        'ambition': 0.8,                  // High: Future aspirations
        'drive_for_excellence': 0.6,      // Secondary: Excellence seeking
        // Leadership
        'vision': 0.7,                    // Secondary: Creating future vision
        'strategic_thinking': 0.6,        // Secondary: Long-term thinking
        // Wellbeing
        'meaning_purpose': 0.6,           // Secondary: Sense of purpose
        // Positive outlook
        'positive_emotions': 0.5,         // Moderate: Positive expectations
        'growth_mindset': 0.5,            // Moderate: Belief in growth
      },
    ),
  };
}
