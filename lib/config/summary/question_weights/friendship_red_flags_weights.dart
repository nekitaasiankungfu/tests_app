import 'question_weight_models.dart';

/// Question weights configuration for Friendship Red Flags Test
/// Maps 24 questions across 4 factors to ~195 hierarchical psychological scales
/// + 8 personality type bipolar poles (E/I, S/N, T/F, J/P)
///
/// Test measures 4 key risk factors:
/// - friendship_boundaries_difficulty (Q1, 5, 9, 13R, 17, 21R)
/// - blindness_to_red_flags (Q2, 6, 10R, 14, 18, 22R)
/// - tolerance_of_disrespect (Q3, 7, 11, 15, 19R, 23)
/// - drama_attraction (Q4, 8, 12, 16R, 20, 24)
///
/// Scale: 0-4 Frequency (Never-Rarely-Sometimes-Often-Always)
/// Reversed questions: 10, 13, 16, 19, 21, 22
///
/// IMPORTANT: All scales MUST exist in hierarchical_scales.dart (195 scales)
/// Coverage: ~65 hierarchical scales (33% of 195 total scales)
/// + 24 personality type weights mapping to 8 bipolar poles
///
/// Personality Type Influence:
/// - Feeling types: Prioritize harmony, emotional accommodation (Q1-3, 11, 14, 17-18, 22-24)
/// - Thinking types: Logical boundaries, clear standards (Q10, 13, 19, 21)
/// - Perceiving types: Accept chaos, drama attraction (Q3-4, 6, 8, 12, 20, 24)
/// - Judging types: Value structure, reliability (Q10, 13, 16, 19, 21)
/// - Extraversion: Social focus, high stimulation (Q4-5, 8, 11-12, 17, 20, 22-23)
/// - Introversion: Internal focus, protect energy (Q2, 13)
/// - Intuition: Complexity attraction, ignore concrete facts (Q4, 6, 12, 14, 18, 24)
/// - Sensing: Notice patterns, concrete observation (Q10, 16, 19, 21-22)
class FriendshipRedFlagsWeights {
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // FACTOR 1: Friendship Boundaries Difficulty
    // Questions: 1, 5, 9, 13(R), 17, 21(R)
    // High scores = difficulty setting boundaries, people-pleasing
    // ========================================================================

    // Q1: Agree to meet friends when tired, to avoid upsetting them
    'friendship_red_flags_v1:q1': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q1',
      axisWeights: {
        'boundary_setting': -1.0, // Can't set boundaries (reversed)
        'assertiveness': -0.9,
        'self_efficacy': -0.8,
        'autonomy_need': -0.7,
        'self_esteem': -0.7,
        'fear_of_abandonment': 0.8,
        'compliance': 0.7,
        'stress_tolerance': -0.6,
        // Personality type
        'feeling': 0.5, // Prioritize others' feelings over logic
        'perceiving': 0.3, // Flexible boundaries
      },
    ),

    // Q5: Easily cancel own plans for friend, even if not urgent
    'friendship_red_flags_v1:q5': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q5',
      axisWeights: {
        'boundary_setting': -1.0,
        'self_efficacy': -0.9,
        'autonomy_need': -0.8,
        'assertiveness': -0.8,
        'self_esteem': -0.7,
        'compliance': 0.8,
        'altruism': 0.6, // Can be positive, but excessive
        // Personality type
        'feeling': 0.6, // Relationship priority
        'extraversion': 0.5, // Social focus
      },
    ),

    // Q9: Hard to tell friend uncomfortable with personal topic
    'friendship_red_flags_v1:q9': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q9',
      axisWeights: {
        'boundary_setting': -1.0,
        'assertiveness': -0.9,
        'emotional_openness': -0.7, // Can't express discomfort
        'vulnerability_sharing': -0.6,
        'self_consciousness': 0.7,
        'anxiety': 0.6,
        'fear_of_abandonment': 0.7,
        // Personality type
        'feeling': 0.5, // Fear of hurting feelings
        'introversion': 0.3, // Keep discomfort inside
      },
    ),

    // Q13: Can honestly tell friends need rest (REVERSED - healthy boundary)
    'friendship_red_flags_v1:q13': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q13',
      axisWeights: {
        'boundary_setting': 1.0, // Good boundaries (positive)
        'assertiveness': 0.9,
        'self_efficacy': 0.8,
        'autonomy_need': 0.8,
        'self_esteem': 0.7,
        'emotional_openness': 0.7,
        'authenticity': 0.7,
        // Personality type
        'thinking': 0.6, // Logical boundaries
        'judging': 0.5, // Clear structure
        'introversion': 0.5, // Protect energy
      },
    ),

    // Q17: Reply quickly even when inconvenient, to avoid seeming rude
    'friendship_red_flags_v1:q17': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q17',
      axisWeights: {
        'boundary_setting': -1.0,
        'assertiveness': -0.8,
        'autonomy_need': -0.7,
        'anxiety': 0.8,
        'self_consciousness': 0.7,
        'fear_of_abandonment': 0.7,
        'compliance': 0.7,
        // Personality type
        'feeling': 0.6, // Fear of appearing rude
        'extraversion': 0.5, // Social responsiveness
      },
    ),

    // Q21: Can reduce contact if friendship becomes one-sided (REVERSED - healthy)
    'friendship_red_flags_v1:q21': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q21',
      axisWeights: {
        'boundary_setting': 1.0,
        'assertiveness': 0.9,
        'self_esteem': 0.8,
        'self_efficacy': 0.8,
        'social_perception': 0.7, // Notices imbalance
        'self_awareness': 0.7,
        // Personality type
        'thinking': 0.7, // Logical assessment
        'judging': 0.6, // Clear action
        'sensing': 0.5, // Notice imbalance
      },
    ),

    // ========================================================================
    // FACTOR 2: Blindness to Red Flags
    // Questions: 2, 6, 10(R), 14, 18, 22(R)
    // High scores = ignore/rationalize warning signs
    // ========================================================================

    // Q2: Friend's hurtful jokes - think "I have no sense of humor"
    'friendship_red_flags_v1:q2': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q2',
      axisWeights: {
        'social_perception': -1.0, // Can't see red flags (reversed)
        'self_awareness': -0.9,
        'critical_thinking': -0.8,
        'self_esteem': -0.8,
        'boundary_setting': -0.7,
        'self_consciousness': 0.7,
        'anxious_attachment': 0.6,
        // Personality type
        'feeling': 0.6, // Personalize emotionally
        'introversion': 0.4, // Internal blame
      },
    ),

    // Q6: Ignore mild discomfort if person seems interesting
    'friendship_red_flags_v1:q6': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q6',
      axisWeights: {
        'social_perception': -0.9,
        'self_awareness': -0.8,
        'critical_thinking': -0.8,
        'novelty_seeking': 0.7, // Positive but risky
        'impulsiveness': 0.6,
        'harm_avoidance': -0.8,
        // Personality type
        'intuition': 0.5, // Focus on potential
        'perceiving': 0.4, // Ignore concrete facts
      },
    ),

    // Q10: Constant cancellations = signal about their attitude (REVERSED - sees red flags)
    'friendship_red_flags_v1:q10': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q10',
      axisWeights: {
        'social_perception': 1.0, // Good perception (positive)
        'self_awareness': 0.9,
        'critical_thinking': 0.8,
        'self_esteem': 0.7,
        'boundary_setting': 0.7,
        'analytical_thinking': 0.6,
        // Personality type
        'sensing': 0.6, // Notice concrete patterns
        'thinking': 0.5, // Logical analysis
        'judging': 0.5, // Value reliability
      },
    ),

    // Q14: Jealousy/control seems like care, not a problem
    'friendship_red_flags_v1:q14': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q14',
      axisWeights: {
        'social_perception': -1.0,
        'critical_thinking': -0.9,
        'self_awareness': -0.8,
        'boundary_setting': -0.8,
        'anxious_attachment': 0.8,
        'fear_of_abandonment': 0.7,
        'self_esteem': -0.7,
        // Personality type
        'feeling': 0.7, // Emotional interpretation
        'intuition': 0.4, // See "deeper meaning"
      },
    ),

    // Q18: Friend gossips about others - hope they won't do it to me
    'friendship_red_flags_v1:q18': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q18',
      axisWeights: {
        'social_perception': -1.0,
        'critical_thinking': -0.9,
        'self_awareness': -0.8,
        'trust': 0.6, // Misplaced trust (ironic)
        'anxiety': 0.6,
        'harm_avoidance': -0.7,
        // Personality type
        'feeling': 0.5, // Hope over logic
        'intuition': 0.4, // Ignore concrete evidence
      },
    ),

    // Q22: Notice small changes in friends' attitudes (REVERSED - good perception)
    'friendship_red_flags_v1:q22': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q22',
      axisWeights: {
        'social_perception': 1.0,
        'self_awareness': 0.9,
        'attention_control': 0.8,
        'emotional_intelligence': 0.8,
        'empathy': 0.7,
        'social_confidence': 0.6,
        // Personality type
        'sensing': 0.7, // Concrete observation
        'feeling': 0.6, // Emotional awareness
        'extraversion': 0.4, // Social attunement
      },
    ),

    // ========================================================================
    // FACTOR 3: Tolerance of Disrespect
    // Questions: 3, 7, 11, 15, 19(R), 23
    // High scores = tolerate disrespect, one-sided relationships
    // ========================================================================

    // Q3: Friend yells, blames tiredness - I accept it
    'friendship_red_flags_v1:q3': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q3',
      axisWeights: {
        'boundary_setting': -1.0,
        'self_esteem': -0.9,
        'assertiveness': -0.9,
        'self_efficacy': -0.8,
        'compliance': 0.8,
        'fear_of_abandonment': 0.8,
        'avoidant_coping': 0.7,
        // Personality type
        'feeling': 0.7, // Emotional accommodation
        'perceiving': 0.4, // Accept chaos
      },
    ),

    // Q7: Stay friends with people who make harsh jokes about me
    'friendship_red_flags_v1:q7': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q7',
      axisWeights: {
        'boundary_setting': -1.0,
        'self_esteem': -0.9,
        'assertiveness': -0.8,
        'self_compassion': -0.8,
        'compliance': 0.7,
        'fear_of_abandonment': 0.8,
        'social_perception': -0.7,
        // Personality type
        'feeling': 0.6, // Emotional tolerance
        'perceiving': 0.3, // Accept negativity
      },
    ),

    // Q11: First to make peace, even when not wrong
    'friendship_red_flags_v1:q11': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q11',
      axisWeights: {
        'boundary_setting': -0.9,
        'assertiveness': -0.9,
        'self_esteem': -0.8,
        'conflict_resolution': 0.6, // Can be positive, but excessive
        'compliance': 0.9,
        'fear_of_abandonment': 0.8,
        'altruism': 0.5, // Excessive
        // Personality type
        'feeling': 0.7, // Harmony priority
        'extraversion': 0.4, // Social peace
      },
    ),

    // Q15: Stay with people who make unpleasant comments if otherwise "normal"
    'friendship_red_flags_v1:q15': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q15',
      axisWeights: {
        'boundary_setting': -1.0,
        'self_esteem': -0.9,
        'assertiveness': -0.9,
        'self_compassion': -0.8,
        'social_perception': -0.8,
        'fear_of_abandonment': 0.9,
        'compliance': 0.8,
        // Personality type
        'feeling': 0.6, // Rationalize emotionally
        'perceiving': 0.3, // Tolerate inconsistency
      },
    ),

    // Q19: Friend laughs at feelings - seriously reconsider closeness (REVERSED - healthy)
    'friendship_red_flags_v1:q19': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q19',
      axisWeights: {
        'boundary_setting': 1.0,
        'self_esteem': 0.9,
        'assertiveness': 0.9,
        'self_compassion': 0.8,
        'self_efficacy': 0.8,
        'social_perception': 0.7,
        'critical_thinking': 0.7,
        // Personality type
        'thinking': 0.7, // Logical decision
        'judging': 0.6, // Clear standards
        'sensing': 0.4, // Notice disrespect
      },
    ),

    // Q23: Used to tolerating mild disrespect to avoid being alone
    'friendship_red_flags_v1:q23': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q23',
      axisWeights: {
        'boundary_setting': -1.0,
        'self_esteem': -1.0,
        'assertiveness': -0.9,
        'fear_of_abandonment': 1.0,
        'self_compassion': -0.9,
        'anxious_attachment': 0.9,
        'compliance': 0.8,
        // Personality type
        'feeling': 0.8, // Emotional need
        'extraversion': 0.7, // Need for connection
      },
    ),

    // ========================================================================
    // FACTOR 4: Drama Attraction
    // Questions: 4, 8, 12, 16(R), 20, 24
    // High scores = attracted to intense, conflictual relationships
    // ========================================================================

    // Q4: Calm people seem boring vs. "stormy personality"
    'friendship_red_flags_v1:q4': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q4',
      axisWeights: {
        'sensation_seeking': 0.9,
        'novelty_seeking': 0.8,
        'excitement_seeking': 0.9,
        'emotional_reactivity': 0.7,
        'impulsiveness': 0.7,
        'harm_avoidance': -0.8,
        'calmness': -0.7,
        // Personality type
        'intuition': 0.5, // Attracted to complexity
        'perceiving': 0.6, // Comfortable with unpredictability
        'extraversion': 0.4, // High stimulation need
      },
    ),

    // Q8: Stories about friends = conflicts, fights, dramatic reconciliations
    'friendship_red_flags_v1:q8': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q8',
      axisWeights: {
        'sensation_seeking': 0.8,
        'emotional_reactivity': 0.9,
        'conflict_management': -0.8, // Poor conflict skills (reversed)
        'emotion_focused_coping': 0.7, // Drama focus
        'impulsiveness': 0.7,
        'mood_stability': -0.8,
        // Personality type
        'extraversion': 0.5, // Social excitement
        'perceiving': 0.5, // Accept chaos
        'feeling': 0.4, // Emotional intensity
      },
    ),

    // Q12: Feel more alive when friendship = roller coaster
    'friendship_red_flags_v1:q12': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q12',
      axisWeights: {
        'sensation_seeking': 1.0,
        'excitement_seeking': 0.9,
        'emotional_reactivity': 0.9,
        'novelty_seeking': 0.8,
        'impulsiveness': 0.7,
        'mood_stability': -0.8,
        'calmness': -0.8,
        // Personality type
        'perceiving': 0.7, // Thrive on unpredictability
        'extraversion': 0.6, // High energy social
        'intuition': 0.4, // Emotional complexity
      },
    ),

    // Q16: Value calm, stable friendships (REVERSED - healthy preference)
    'friendship_red_flags_v1:q16': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q16',
      axisWeights: {
        'calmness': 1.0, // Positive preference (reversed)
        'mood_stability': 0.9,
        'emotional_resilience': 0.8,
        'conflict_management': 0.8,
        'sensation_seeking': -0.9, // Less drama-seeking
        'harm_avoidance': 0.7,
        // Personality type
        'sensing': 0.6, // Practical stability
        'judging': 0.7, // Structured relationships
        'thinking': 0.4, // Rational preference
      },
    ),

    // Q20: Bored in groups without gossip/drama/"juicy" stories
    'friendship_red_flags_v1:q20': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q20',
      axisWeights: {
        'sensation_seeking': 0.9,
        'excitement_seeking': 0.8,
        'novelty_seeking': 0.7,
        'emotional_reactivity': 0.7,
        'empathy': -0.6, // Lacks depth (reversed)
        'intellectual_curiosity': -0.6,
        // Personality type
        'extraversion': 0.7, // Social stimulation
        'perceiving': 0.5, // Accept chaos
      },
    ),

    // Q24: Close friends = complicated personalities, turbulent lives
    'friendship_red_flags_v1:q24': QuestionWeight(
      testId: 'friendship_red_flags_v1',
      questionId: 'q24',
      axisWeights: {
        'sensation_seeking': 0.8,
        'novelty_seeking': 0.8,
        'emotional_reactivity': 0.8,
        'harm_avoidance': -0.9,
        'social_perception': -0.7, // May not see patterns
        'altruism': 0.6, // Drawn to "rescuing" (can be positive)
        // Personality type
        'intuition': 0.7, // Attracted to complexity
        'perceiving': 0.6, // Accept turbulence
        'feeling': 0.5, // Emotional connection
      },
    ),

  };
}
