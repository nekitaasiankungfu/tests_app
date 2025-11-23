import 'question_weight_models.dart';

/// Question weights configuration for Wellbeing Happiness Inventory
/// Maps 30 questions across 6 PERMA+ factors to ~195 hierarchical psychological scales
///
/// PERMA Model (Seligman):
/// P - Positive Emotions (q1, q7, q13, q19, q25)
/// E - Engagement (q2, q8, q14, q20, q26)
/// R - Relationships (q3, q9, q15, q21, q27)
/// M - Meaning (q4, q10, q16, q22, q28)
/// A - Accomplishment (q5, q11, q17, q23, q29)
/// + Life Satisfaction (q6, q12, q18, q24, q30)
///
/// Scale: 1-6 Likert (Strongly disagree to Strongly agree)
class WellbeingHappinessInventoryWeights {
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // POSITIVE EMOTIONS (P) - Questions 1, 7, 13, 19, 25
    // ========================================================================

    // Q1: Joy and good mood
    'wellbeing_happiness_inventory_v1:q1': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q1',
      axisWeights: {
        'positive_emotions': 1.0,      // Direct mapping
        'happiness': 0.9,              // Joy = happiness
        'life_satisfaction': 0.6,      // Contributes to satisfaction
        'vitality': 0.7,               // Energy from positive mood
        'emotional_resilience': 0.5,   // Positivity builds resilience
        'mood_stability': 0.4,         // Positive mood indicator
        // Personality type
        'extraversion': 0.5,           // Positive emotions linked to E
      },
    ),

    // Q7: Gratitude
    'wellbeing_happiness_inventory_v1:q7': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q7',
      axisWeights: {
        'positive_emotions': 1.0,
        'happiness': 0.8,
        'life_satisfaction': 0.7,      // Gratitude strongly predicts satisfaction
        'self_compassion': 0.5,        // Related to self-kindness
        'emotional_resilience': 0.6,   // Gratitude builds resilience
        'benevolence': 0.5,            // Gratitude related to kindness
      },
    ),

    // Q13: Inner peace and serenity
    'wellbeing_happiness_inventory_v1:q13': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q13',
      axisWeights: {
        'positive_emotions': 1.0,
        'calmness': 0.9,               // Direct mapping to serenity
        'composure': 0.8,              // Inner peace
        'emotional_resilience': 0.7,   // Peace builds resilience
        'stress_tolerance': 0.6,       // Low stress = peace
        'anxiety': -0.7,               // Peace = low anxiety
        'mood_stability': 0.6,
        // Personality type
        'introversion': 0.3,           // Inner peace more introverted
      },
    ),

    // Q19: Laughing and having fun
    'wellbeing_happiness_inventory_v1:q19': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q19',
      axisWeights: {
        'positive_emotions': 1.0,
        'happiness': 0.9,
        'humor': 0.8,                  // Direct humor mapping
        'playfulness': 0.8,            // Fun and play
        'liveliness': 0.7,             // High energy, fun
        'vitality': 0.6,
        // Personality type
        'extraversion': 0.6,           // Social fun
      },
    ),

    // Q25: Optimism about future
    'wellbeing_happiness_inventory_v1:q25': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q25',
      axisWeights: {
        'positive_emotions': 1.0,
        'happiness': 0.8,
        'growth_mindset': 0.7,         // Optimism = growth orientation
        'self_efficacy': 0.6,          // Belief in future success
        'emotional_resilience': 0.7,   // Optimism builds resilience
        'depression': -0.7,            // Optimism counters depression
        'anxiety': -0.5,               // Less future worry
      },
    ),

    // ========================================================================
    // ENGAGEMENT (E) - Questions 2, 8, 14, 20, 26
    // ========================================================================

    // Q2: Flow - losing track of time
    'wellbeing_happiness_inventory_v1:q2': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q2',
      axisWeights: {
        'intrinsic_motivation': 0.9,   // Flow is intrinsically motivated
        'attention_control': 0.7,      // Focus in flow
        'curiosity': 0.6,              // Interest drives flow
        'vitality': 0.5,               // Engaged = energized
        'happiness': 0.6,              // Flow contributes to happiness
        // Personality type
        'perceiving': 0.4,             // Spontaneous absorption
      },
    ),

    // Q8: Activities that capture attention
    'wellbeing_happiness_inventory_v1:q8': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q8',
      axisWeights: {
        'intrinsic_motivation': 0.9,
        'attention_control': 0.8,
        'curiosity': 0.7,
        'intellectual_curiosity': 0.6,
        'stimulation': 0.5,            // Need for engaging activities
        'happiness': 0.5,
      },
    ),

    // Q14: Learning and skill development
    'wellbeing_happiness_inventory_v1:q14': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q14',
      axisWeights: {
        'curiosity': 0.9,
        'intellectual_curiosity': 0.9,
        'learning_ability': 0.7,
        'personal_growth': 0.8,        // Growth through learning
        'growth_mindset': 0.7,
        'intrinsic_motivation': 0.6,
        // Personality type
        'intuition': 0.4,              // Abstract learning
      },
    ),

    // Q20: Enthusiasm about activities
    'wellbeing_happiness_inventory_v1:q20': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q20',
      axisWeights: {
        'intrinsic_motivation': 0.9,
        'vitality': 0.8,               // Enthusiasm = energy
        'positive_emotions': 0.7,
        'achievement_motivation': 0.6,
        'liveliness': 0.6,
        'happiness': 0.6,
        // Personality type
        'extraversion': 0.4,           // Enthusiastic expression
      },
    ),

    // Q26: Time for enjoyable activities
    'wellbeing_happiness_inventory_v1:q26': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q26',
      axisWeights: {
        'autonomy_wellbeing': 0.8,     // Choice in activities
        'intrinsic_motivation': 0.7,
        'happiness': 0.7,
        'life_satisfaction': 0.6,
        'hedonism': 0.5,               // Pleasure seeking
        'self_direction': 0.5,         // Self-directed leisure
      },
    ),

    // ========================================================================
    // RELATIONSHIPS (R) - Questions 3, 9, 15, 21, 27
    // ========================================================================

    // Q3: People who care
    'wellbeing_happiness_inventory_v1:q3': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q3',
      axisWeights: {
        'positive_relations': 0.9,     // Direct mapping
        'trust_in_relationships': 0.8,
        'social_support_seeking': 0.7,
        'relatedness_need': 0.8,       // Need for connection met
        'secure_attachment': 0.6,
        'happiness': 0.6,
        'life_satisfaction': 0.5,
        // Personality type
        'feeling': 0.4,                // Value relationships
      },
    ),

    // Q9: Closeness and connection
    'wellbeing_happiness_inventory_v1:q9': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q9',
      axisWeights: {
        'emotional_intimacy': 0.9,
        'positive_relations': 0.8,
        'trust_in_relationships': 0.7,
        'intimacy_comfort': 0.8,
        'secure_attachment': 0.7,
        'relatedness_need': 0.7,
        'happiness': 0.5,
      },
    ),

    // Q15: Sharing joys and difficulties
    'wellbeing_happiness_inventory_v1:q15': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q15',
      axisWeights: {
        'positive_relations': 0.8,
        'emotional_openness': 0.8,
        'vulnerability_sharing': 0.7,
        'communication_quality': 0.7,
        'social_support_seeking': 0.8,
        'trust_in_relationships': 0.6,
        'happiness': 0.5,
      },
    ),

    // Q21: Feeling loved and valued
    'wellbeing_happiness_inventory_v1:q21': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q21',
      axisWeights: {
        'positive_relations': 0.9,
        'self_esteem': 0.7,            // Feeling valued
        'secure_attachment': 0.8,
        'trust_in_relationships': 0.7,
        'relatedness_need': 0.8,
        'happiness': 0.7,
        'life_satisfaction': 0.6,
      },
    ),

    // Q27: People to rely on
    'wellbeing_happiness_inventory_v1:q27': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q27',
      axisWeights: {
        'positive_relations': 0.9,
        'trust_in_relationships': 0.9,
        'social_support_seeking': 0.8,
        'secure_attachment': 0.7,
        'relatedness_need': 0.7,
        'dependability': 0.6,          // Others are dependable
        'happiness': 0.5,
      },
    ),

    // ========================================================================
    // MEANING (M) - Questions 4, 10, 16, 22, 28
    // ========================================================================

    // Q4: Life has meaning and direction
    'wellbeing_happiness_inventory_v1:q4': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q4',
      axisWeights: {
        'meaning_purpose': 1.0,        // Direct mapping
        'life_satisfaction': 0.7,
        'happiness': 0.6,
        'self_direction': 0.6,
        'identity_clarity': 0.6,       // Clear sense of self
        'personal_growth': 0.5,
        // Personality type
        'judging': 0.4,                // Direction, structure
      },
    ),

    // Q10: What I do has significance
    'wellbeing_happiness_inventory_v1:q10': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q10',
      axisWeights: {
        'meaning_purpose': 0.9,
        'intrinsic_motivation': 0.7,
        'achievement_value': 0.6,
        'competence': 0.5,
        'happiness': 0.5,
        'self_efficacy': 0.5,
      },
    ),

    // Q16: Part of something greater
    'wellbeing_happiness_inventory_v1:q16': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q16',
      axisWeights: {
        'meaning_purpose': 0.9,
        'universalism': 0.7,           // Broader perspective
        'benevolence': 0.6,
        'relatedness_need': 0.6,
        'spirituality': 0.5,           // If exists, otherwise skip
        'happiness': 0.5,
      },
    ),

    // Q22: Understanding what I live for
    'wellbeing_happiness_inventory_v1:q22': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q22',
      axisWeights: {
        'meaning_purpose': 1.0,
        'identity_clarity': 0.8,
        'self_awareness': 0.7,
        'values': 0.7,                 // Clear values
        'wisdom': 0.5,
        'happiness': 0.6,
        'life_satisfaction': 0.6,
      },
    ),

    // Q28: Life serves important purpose
    'wellbeing_happiness_inventory_v1:q28': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q28',
      axisWeights: {
        'meaning_purpose': 1.0,
        'achievement_value': 0.6,
        'benevolence': 0.5,
        'universalism': 0.5,
        'happiness': 0.5,
        'life_satisfaction': 0.6,
      },
    ),

    // ========================================================================
    // ACCOMPLISHMENT (A) - Questions 5, 11, 17, 23, 29
    // ========================================================================

    // Q5: Achieving goals
    'wellbeing_happiness_inventory_v1:q5': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q5',
      axisWeights: {
        'achievement_striving': 0.9,
        'competence': 0.8,
        'self_efficacy': 0.8,
        'competence_need': 0.8,
        'happiness': 0.6,
        'life_satisfaction': 0.5,
        'persistence': 0.6,
        // Personality type
        'judging': 0.4,                // Goal-oriented
      },
    ),

    // Q11: Growing and improving
    'wellbeing_happiness_inventory_v1:q11': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q11',
      axisWeights: {
        'personal_growth': 0.9,
        'growth_mindset': 0.9,
        'achievement_striving': 0.7,
        'competence': 0.6,
        'learning_ability': 0.6,
        'happiness': 0.5,
        'self_efficacy': 0.6,
      },
    ),

    // Q17: Handling tasks
    'wellbeing_happiness_inventory_v1:q17': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q17',
      axisWeights: {
        'competence': 0.9,
        'self_efficacy': 0.9,
        'environmental_mastery': 0.8,
        'competence_need': 0.7,
        'stress_tolerance': 0.5,
        'problem_solving': 0.6,
        'happiness': 0.4,
      },
    ),

    // Q23: Pride in achievements
    'wellbeing_happiness_inventory_v1:q23': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q23',
      axisWeights: {
        'achievement_striving': 0.8,
        'self_esteem': 0.8,
        'competence': 0.7,
        'happiness': 0.6,
        'life_satisfaction': 0.6,
        'self_acceptance': 0.6,
      },
    ),

    // Q29: Capable of achieving what matters
    'wellbeing_happiness_inventory_v1:q29': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q29',
      axisWeights: {
        'self_efficacy': 1.0,
        'competence': 0.8,
        'competence_need': 0.7,
        'achievement_motivation': 0.7,
        'happiness': 0.5,
        'autonomy_wellbeing': 0.5,
        'persistence': 0.6,
      },
    ),

    // ========================================================================
    // LIFE SATISFACTION - Questions 6, 12, 18, 24, 30
    // ========================================================================

    // Q6: Overall satisfaction with life
    'wellbeing_happiness_inventory_v1:q6': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q6',
      axisWeights: {
        'life_satisfaction': 1.0,
        'happiness': 0.8,
        'positive_emotions': 0.6,
        'self_acceptance': 0.6,
        'emotional_resilience': 0.5,
        'overall_adjustment': 0.6,
      },
    ),

    // Q12: Life close to ideal
    'wellbeing_happiness_inventory_v1:q12': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q12',
      axisWeights: {
        'life_satisfaction': 1.0,
        'happiness': 0.7,
        'self_acceptance': 0.7,
        'environmental_mastery': 0.5,
        'overall_adjustment': 0.6,
      },
    ),

    // Q18: Good life conditions
    'wellbeing_happiness_inventory_v1:q18': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q18',
      axisWeights: {
        'life_satisfaction': 0.9,
        'environmental_mastery': 0.8,
        'happiness': 0.6,
        'security_value': 0.5,
        'overall_adjustment': 0.5,
      },
    ),

    // Q24: Would change almost nothing
    'wellbeing_happiness_inventory_v1:q24': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q24',
      axisWeights: {
        'life_satisfaction': 1.0,
        'self_acceptance': 0.8,
        'happiness': 0.6,
        'acceptance': 0.6,             // Acceptance of life
        'overall_adjustment': 0.6,
      },
    ),

    // Q30: Getting what I want from life
    'wellbeing_happiness_inventory_v1:q30': QuestionWeight(
      testId: 'wellbeing_happiness_inventory_v1',
      questionId: 'q30',
      axisWeights: {
        'life_satisfaction': 1.0,
        'happiness': 0.7,
        'autonomy_wellbeing': 0.6,
        'competence_need': 0.5,
        'self_efficacy': 0.5,
        'overall_adjustment': 0.5,
      },
    ),
  };
}
