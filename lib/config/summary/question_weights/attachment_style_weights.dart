import 'question_weight_models.dart';

/// Question weights configuration for Attachment Styles Test
/// Maps 60 questions across 4 attachment styles to ~195 hierarchical psychological scales
///
/// Attachment Theory (Bowlby, Ainsworth, Hazan & Shaver):
/// - SECURE (15 questions): Comfort with intimacy and independence, trust, emotional openness
/// - ANXIOUS (15 questions): Fear of rejection, need for reassurance, emotional dependency
/// - AVOIDANT (15 questions): Discomfort with closeness, value independence, emotional detachment
/// - FEARFUL (15 questions): Internal conflict, ambivalence, fear of intimacy + abandonment
///
/// Scale: 0-4 Likert (Strongly disagree to Strongly agree)
/// All weights are POSITIVE (0.5-1.0) - bipolar weights added separately
///
/// Coverage: ~85 scales (44% of 195 total scales)
class AttachmentStyleWeights {
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // SECURE ATTACHMENT - Questions 1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57
    // Characteristics: Trust, emotional openness, comfort with intimacy, secure base
    // ========================================================================

    // Q1: Easy to open up and share feelings
    'attachment_styles_v1:q1': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q1',
      axisWeights: {
        'emotional_openness': 1.0, // Direct mapping
        'vulnerability_sharing': 0.9, // Sharing feelings = vulnerability
        'trust_in_relationships': 0.8,
        'secure_attachment': 0.9,
        'communication_quality': 0.7,
        'intimacy_comfort': 0.8,
        'emotional_resilience': 0.6,
        'self_confidence': 0.5,
      },
    ),

    // Q5: Comfortable when people depend on me
    'attachment_styles_v1:q5': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q5',
      axisWeights: {
        'secure_attachment': 0.9,
        'support_giving': 1.0, // Direct mapping
        'reliability_partnership': 0.8,
        'dependability': 0.8,
        'altruism': 0.6,
        'compassion': 0.6,
        'trust_in_relationships': 0.7,
        'emotional_resilience': 0.5,
      },
    ),

    // Q9: Calm about partner spending time apart
    'attachment_styles_v1:q9': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q9',
      axisWeights: {
        'secure_attachment': 1.0,
        'trust_in_relationships': 0.9,
        'autonomy_wellbeing': 0.7,
        'emotional_resilience': 0.7,
        'self_efficacy': 0.6,
        'autonomy_need': 0.6,
        'calmness': 0.6,
        'composure': 0.5,
      },
    ),

    // Q13: Can easily ask for help
    'attachment_styles_v1:q13': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q13',
      axisWeights: {
        'social_support_seeking': 1.0,
        'secure_attachment': 0.9,
        'vulnerability_sharing': 0.8,
        'assertiveness': 0.7,
        'trust_in_relationships': 0.8,
        'emotional_openness': 0.7,
        'self_efficacy': 0.6,
      },
    ),

    // Q17: Not afraid to be vulnerable
    'attachment_styles_v1:q17': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q17',
      axisWeights: {
        'vulnerability_sharing': 1.0,
        'secure_attachment': 0.9,
        'emotional_openness': 0.9,
        'trust_in_relationships': 0.8,
        'intimacy_comfort': 0.8,
        'authenticity': 0.7,
        'emotional_resilience': 0.7,
        'self_acceptance': 0.6,
      },
    ),

    // Q21: Confident people won't leave me
    'attachment_styles_v1:q21': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q21',
      axisWeights: {
        'secure_attachment': 1.0,
        'trust_in_relationships': 1.0,
        'relationship_security': 0.9,
        'self_esteem': 0.7,
        'emotional_resilience': 0.7,
        'self_confidence': 0.6,
        'positive_emotions': 0.5,
      },
    ),

    // Q25: Can be close while maintaining individuality
    'attachment_styles_v1:q25': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q25',
      axisWeights: {
        'secure_attachment': 1.0,
        'autonomy_wellbeing': 0.9,
        'identity_clarity': 0.8,
        'intimacy_comfort': 0.8,
        'boundary_setting': 0.7,
        'authenticity': 0.7,
        'self_awareness': 0.6,
        'maturity': 0.6,
      },
    ),

    // Q29: Relationships are joy, not stress
    'attachment_styles_v1:q29': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q29',
      axisWeights: {
        'secure_attachment': 0.9,
        'positive_relations': 0.9,
        'happiness': 0.7,
        'relationship_security': 0.8,
        'emotional_resilience': 0.7,
        'life_satisfaction': 0.6,
        'positive_emotions': 0.6,
        'trust_in_relationships': 0.7,
      },
    ),

    // Q33: Comfortable alone and with others
    'attachment_styles_v1:q33': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q33',
      axisWeights: {
        'secure_attachment': 1.0,
        'autonomy_wellbeing': 0.8,
        'self_efficacy': 0.7,
        'emotional_resilience': 0.7,
        'self_acceptance': 0.6,
        'intimacy_comfort': 0.7,
        'autonomy_need': 0.6,
        'maturity': 0.6,
      },
    ),

    // Q37: Can openly talk about needs
    'attachment_styles_v1:q37': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q37',
      axisWeights: {
        'communication_quality': 1.0,
        'assertiveness': 0.9,
        'emotional_openness': 0.9,
        'secure_attachment': 0.8,
        'self_confidence': 0.7,
        'authenticity': 0.7,
        'boundary_setting': 0.6,
        'self_awareness': 0.6,
      },
    ),

    // Q41: Trust partner despite difficulties
    'attachment_styles_v1:q41': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q41',
      axisWeights: {
        'trust_in_relationships': 1.0,
        'secure_attachment': 0.9,
        'emotional_resilience': 0.8,
        'relationship_security': 0.8,
        'forgiveness': 0.7,
        'maturity': 0.6,
        'acceptance': 0.6,
      },
    ),

    // Q45: Can effectively resolve conflicts
    'attachment_styles_v1:q45': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q45',
      axisWeights: {
        'conflict_resolution': 1.0,
        'communication_quality': 0.9,
        'emotional_intelligence': 0.8,
        'secure_attachment': 0.8,
        'problem_solving': 0.7,
        'social_perception': 0.6,
        'maturity': 0.6,
      },
    ),

    // Q49: Feel confident in relationships
    'attachment_styles_v1:q49': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q49',
      axisWeights: {
        'secure_attachment': 1.0,
        'self_confidence': 0.9,
        'self_efficacy': 0.8,
        'relationship_security': 0.9,
        'self_esteem': 0.7,
        'emotional_resilience': 0.7,
        'trust_in_relationships': 0.7,
      },
    ),

    // Q53: Accept partner with all flaws
    'attachment_styles_v1:q53': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q53',
      axisWeights: {
        'acceptance': 1.0,
        'secure_attachment': 0.9,
        'compassion': 0.8,
        'forgiveness': 0.8,
        'maturity': 0.7,
        'empathy': 0.7,
        'emotional_resilience': 0.6,
      },
    ),

    // Q57: Balance between closeness and personal space
    'attachment_styles_v1:q57': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q57',
      axisWeights: {
        'secure_attachment': 1.0,
        'boundary_setting': 0.9,
        'autonomy_wellbeing': 0.8,
        'intimacy_comfort': 0.8,
        'maturity': 0.7,
        'self_awareness': 0.6,
        'identity_clarity': 0.6,
      },
    ),

    // ========================================================================
    // ANXIOUS ATTACHMENT - Questions 2, 6, 10, 14, 18, 22, 26, 30, 34, 38, 42, 46, 50, 54, 58
    // Characteristics: Fear of rejection, need for reassurance, emotional dependency
    // ========================================================================

    // Q2: Worry partner doesn't love me as much
    'attachment_styles_v1:q2': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q2',
      axisWeights: {
        'anxious_attachment': 1.0,
        'fear_of_abandonment': 0.9,
        'self_consciousness': 0.9, // Social anxiety/self-doubt
        'worry_tendency': 0.8,
        'anxiety': 0.7,
        'vulnerability': 0.7,
        'rumination': 0.6,
        'self_esteem': 0.6,
      },
    ),

    // Q6: Worry when partner doesn't reply immediately
    'attachment_styles_v1:q6': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q6',
      axisWeights: {
        'anxious_attachment': 1.0,
        'anxiety': 0.9,
        'worry_tendency': 0.9,
        'fear_of_abandonment': 0.8,
        'self_consciousness': 0.7,
        'emotional_reactivity': 0.7,
        'panic_tendency': 0.6,
      },
    ),

    // Q10: Need constant confirmation of importance
    'attachment_styles_v1:q10': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q10',
      axisWeights: {
        'anxious_attachment': 1.0,
        'self_consciousness': 0.9,
        'self_esteem': 0.8,
        'fear_of_abandonment': 0.7,
        'anxiety': 0.7,
        'vulnerability': 0.6,
      },
    ),

    // Q14: Worry about being abandoned
    'attachment_styles_v1:q14': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q14',
      axisWeights: {
        'fear_of_abandonment': 1.0,
        'anxious_attachment': 1.0,
        'anxiety': 0.9,
        'self_consciousness': 0.9,
        'worry_tendency': 0.8,
        'vulnerability': 0.7,
        'catastrophizing': 0.6,
      },
    ),

    // Q18: Feel I love more than I am loved
    'attachment_styles_v1:q18': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q18',
      axisWeights: {
        'anxious_attachment': 0.9,
        'self_consciousness': 0.8,
        'self_esteem': 0.8,
        'fear_of_abandonment': 0.7,
        'rumination': 0.6,
        'vulnerability': 0.6,
      },
    ),

    // Q22: Slightest sign of distancing causes anxiety
    'attachment_styles_v1:q22': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q22',
      axisWeights: {
        'anxious_attachment': 1.0,
        'anxiety': 0.9,
        'fear_of_abandonment': 0.9,
        'emotional_reactivity': 0.8,
        'self_consciousness': 0.8,
        'worry_tendency': 0.7,
        'vulnerability': 0.6,
      },
    ),

    // Q26: Strive to merge completely (scares partner)
    'attachment_styles_v1:q26': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q26',
      axisWeights: {
        'anxious_attachment': 1.0,
        'fear_of_abandonment': 0.7,
        'self_consciousness': 0.7,
        'impulsiveness': 0.6,
        'emotional_reactivity': 0.6,
      },
    ),

    // Q30: Analyze every word for hidden meaning
    'attachment_styles_v1:q30': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q30',
      axisWeights: {
        'anxious_attachment': 0.9,
        'worry_tendency': 0.8,
        'rumination': 0.8,
        'anxiety': 0.8,
        'self_consciousness': 0.7,
        'catastrophizing': 0.6,
      },
    ),

    // Q34: Provoke arguments to test love
    'attachment_styles_v1:q34': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q34',
      axisWeights: {
        'anxious_attachment': 1.0,
        'self_consciousness': 0.9,
        'fear_of_abandonment': 0.8,
        'impulsiveness': 0.6,
        'conflict_management': 0.5,
      },
    ),

    // Q38: Feel abandoned when partner is busy
    'attachment_styles_v1:q38': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q38',
      axisWeights: {
        'anxious_attachment': 1.0,
        'fear_of_abandonment': 1.0,
        'self_consciousness': 0.8,
        'emotional_reactivity': 0.7,
        'vulnerability': 0.7,
      },
    ),

    // Q42: Difficult to cope when partner emotionally unavailable
    'attachment_styles_v1:q42': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q42',
      axisWeights: {
        'anxious_attachment': 0.9,
        'fear_of_abandonment': 0.8,
        'self_consciousness': 0.7,
        'vulnerability': 0.7,
        'emotion_focused_coping': 0.6,
      },
    ),

    // Q46: Often think about partner leaving
    'attachment_styles_v1:q46': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q46',
      axisWeights: {
        'anxious_attachment': 0.9,
        'fear_of_abandonment': 1.0,
        'rumination': 0.9,
        'worry_tendency': 0.9,
        'anxiety': 0.8,
        'catastrophizing': 0.7,
        'self_consciousness': 0.8,
      },
    ),

    // Q50: Do something to attract attention
    'attachment_styles_v1:q50': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q50',
      axisWeights: {
        'anxious_attachment': 0.9,
        'self_consciousness': 0.7,
        'impulsiveness': 0.6,
        'emotional_reactivity': 0.6,
      },
    ),

    // Q54: Scared of being alone for life
    'attachment_styles_v1:q54': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q54',
      axisWeights: {
        'anxious_attachment': 0.9,
        'fear_of_abandonment': 1.0,
        'anxiety': 0.8,
        'self_consciousness': 0.8,
        'catastrophizing': 0.6,
      },
    ),

    // Q58: Strong jealousy without reason
    'attachment_styles_v1:q58': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q58',
      axisWeights: {
        'jealousy': 1.0,
        'anxious_attachment': 0.9,
        'self_consciousness': 0.9,
        'fear_of_abandonment': 0.8,
        'emotional_reactivity': 0.7,
        'trust': 0.6,
      },
    ),

    // ========================================================================
    // AVOIDANT ATTACHMENT - Questions 3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47, 51, 55, 59
    // Characteristics: Discomfort with closeness, value independence, emotional detachment
    // ========================================================================

    // Q3: Prefer not to get too emotionally close
    'attachment_styles_v1:q3': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q3',
      axisWeights: {
        'avoidant_attachment': 1.0,
        'intimacy_comfort': 0.8,
        'autonomy_need': 0.7,
        'emotional_openness': 0.6,
      },
    ),

    // Q7: Difficult to fully trust others
    'attachment_styles_v1:q7': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q7',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'trust_in_relationships': 0.8,
        'trust': 0.8,
        'vulnerability_sharing': 0.6,
      },
    ),

    // Q11: Uncomfortable when relationships become too close
    'attachment_styles_v1:q11': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q11',
      axisWeights: {
        'avoidant_attachment': 1.0,
        'intimacy_comfort': 0.9,
        'anxiety': 0.6, // Discomfort = anxiety
        'autonomy_need': 0.7,
      },
    ),

    // Q15: Prefer not to depend on others
    'attachment_styles_v1:q15': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q15',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'autonomy_need': 1.0,
        'autonomy_wellbeing': 0.8,
        'social_support_seeking': 0.6,
      },
    ),

    // Q19: Important to maintain independence
    'attachment_styles_v1:q19': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q19',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'autonomy_need': 1.0,
        'autonomy_wellbeing': 0.9,
        'self_direction': 0.7,
      },
    ),

    // Q23: Prefer to keep problems to myself
    'attachment_styles_v1:q23': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q23',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'autonomy_need': 0.7,
        'social_support_seeking': 0.6,
        'vulnerability_sharing': 0.7,
      },
    ),

    // Q27: Expressing emotions is difficult
    'attachment_styles_v1:q27': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q27',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'emotional_openness': 0.8,
        'vulnerability_sharing': 0.7,
        'expressiveness': 0.7,
      },
    ),

    // Q31: Rarely discuss deep feelings even with loved ones
    'attachment_styles_v1:q31': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q31',
      axisWeights: {
        'avoidant_attachment': 1.0,
        'emotional_openness': 0.9,
        'vulnerability_sharing': 0.9,
        'intimacy_comfort': 0.7,
      },
    ),

    // Q35: Romantic relationships less important than other areas
    'attachment_styles_v1:q35': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q35',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'autonomy_need': 0.7,
        'intimacy_comfort': 0.6,
      },
    ),

    // Q39: More comfortable keeping people at distance
    'attachment_styles_v1:q39': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q39',
      axisWeights: {
        'avoidant_attachment': 1.0,
        'intimacy_comfort': 0.8,
        'emotional_openness': 0.7,
        'boundary_setting': 0.6,
      },
    ),

    // Q43: Unpleasant when someone tries to get emotionally close
    'attachment_styles_v1:q43': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q43',
      axisWeights: {
        'avoidant_attachment': 1.0,
        'intimacy_comfort': 0.9,
        'anxiety': 0.6, // Unpleasant = anxiety
        'vulnerability_sharing': 0.7,
      },
    ),

    // Q47: Relying on others is weakness
    'attachment_styles_v1:q47': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q47',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'autonomy_need': 0.9,
        'social_support_seeking': 0.6,
        'vulnerability_sharing': 0.7,
      },
    ),

    // Q51: Value freedom more than emotional closeness
    'attachment_styles_v1:q51': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q51',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'autonomy_need': 1.0,
        'autonomy_wellbeing': 0.9,
        'self_direction': 0.7,
        'intimacy_comfort': 0.6,
      },
    ),

    // Q55: Feel overwhelmed when partner emotionally demanding
    'attachment_styles_v1:q55': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q55',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'intimacy_comfort': 0.7,
        'stress_tolerance': 0.6,
        'emotional_reactivity': 0.6,
      },
    ),

    // Q59: Easier to deal with problems alone
    'attachment_styles_v1:q59': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q59',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'autonomy_need': 0.9,
        'social_support_seeking': 0.6,
        'problem_focused_coping': 0.6,
      },
    ),

    // ========================================================================
    // FEARFUL ATTACHMENT - Questions 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60
    // Characteristics: Internal conflict, ambivalence, fear of intimacy + abandonment
    // ========================================================================

    // Q4: Want closeness but afraid of being hurt
    'attachment_styles_v1:q4': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q4',
      axisWeights: {
        'anxious_attachment': 0.7, // Desire for closeness
        'avoidant_attachment': 0.7, // But fear of hurt
        'fear_of_abandonment': 0.8,
        'vulnerability': 0.8,
        'trust_in_relationships': 0.6,
      },
    ),

    // Q8: Strive for closeness but uncomfortable when get it
    'attachment_styles_v1:q8': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q8',
      axisWeights: {
        'anxious_attachment': 0.7,
        'avoidant_attachment': 0.7,
        'intimacy_comfort': 0.8,
        'anxiety': 0.7,
        'self_awareness': 0.6,
      },
    ),

    // Q12: Simultaneously crave and fear closeness
    'attachment_styles_v1:q12': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q12',
      axisWeights: {
        'anxious_attachment': 0.8,
        'avoidant_attachment': 0.8,
        'fear_of_abandonment': 0.9,
        'intimacy_comfort': 0.7,
        'anxiety': 0.7,
      },
    ),

    // Q16: Hard to trust but feel lonely without closeness
    'attachment_styles_v1:q16': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q16',
      axisWeights: {
        'trust_in_relationships': 0.9,
        'anxious_attachment': 0.7,
        'avoidant_attachment': 0.6,
        'fear_of_abandonment': 0.6,
        'social_support_seeking': 0.5,
      },
    ),

    // Q20: Instinctively distance when someone gets closer
    'attachment_styles_v1:q20': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q20',
      axisWeights: {
        'avoidant_attachment': 0.8,
        'anxious_attachment': 0.6,
        'intimacy_comfort': 0.8,
        'anxiety': 0.7,
        'impulsiveness': 0.5,
      },
    ),

    // Q24: Not sure I deserve love but crave it most
    'attachment_styles_v1:q24': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q24',
      axisWeights: {
        'self_esteem': 1.0,
        'self_consciousness': 0.9,
        'anxious_attachment': 0.8,
        'vulnerability': 0.7,
        'self_acceptance': 0.6,
      },
    ),

    // Q28: Afraid never find someone to truly love me
    'attachment_styles_v1:q28': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q28',
      axisWeights: {
        'fear_of_abandonment': 0.9,
        'anxious_attachment': 0.8,
        'self_consciousness': 0.9,
        'self_esteem': 0.8,
        'catastrophizing': 0.7,
        'anxiety': 0.8,
      },
    ),

    // Q32: Internal conflict between love and fear of betrayal
    'attachment_styles_v1:q32': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q32',
      axisWeights: {
        'anxious_attachment': 0.8,
        'avoidant_attachment': 0.7,
        'trust_in_relationships': 0.9,
        'vulnerability': 0.7,
        'anxiety': 0.9,
      },
    ),

    // Q36: Scared of someone really knowing me
    'attachment_styles_v1:q36': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q36',
      axisWeights: {
        'vulnerability_sharing': 0.9,
        'intimacy_comfort': 0.9,
        'self_consciousness': 0.8,
        'avoidant_attachment': 0.7,
        'anxiety': 0.6,
      },
    ),

    // Q40: Conflicting feelings - want closeness but don't trust
    'attachment_styles_v1:q40': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q40',
      axisWeights: {
        'anxious_attachment': 0.8,
        'avoidant_attachment': 0.7,
        'trust_in_relationships': 1.0,
        'intimacy_comfort': 0.7,
        'self_awareness': 0.6,
      },
    ),

    // Q44: Past negative experiences make me very cautious
    'attachment_styles_v1:q44': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q44',
      axisWeights: {
        'avoidant_attachment': 0.8,
        'trust_in_relationships': 0.9,
        'vulnerability': 0.8,
        'anxiety': 0.6,
        'harm_avoidance': 0.7,
      },
    ),

    // Q48: Want to trust but afraid of betrayal
    'attachment_styles_v1:q48': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q48',
      axisWeights: {
        'trust_in_relationships': 1.0,
        'anxious_attachment': 0.7,
        'avoidant_attachment': 0.6,
        'vulnerability': 0.7,
        'fear_of_abandonment': 0.6,
      },
    ),

    // Q52: Avoid closeness fearing repeat of past mistakes
    'attachment_styles_v1:q52': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q52',
      axisWeights: {
        'avoidant_attachment': 0.9,
        'intimacy_comfort': 0.8,
        'vulnerability': 0.7,
        'harm_avoidance': 0.7,
        'anxiety': 0.6,
      },
    ),

    // Q56: Fluctuate between wanting closeness and wanting to run
    'attachment_styles_v1:q56': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q56',
      axisWeights: {
        'anxious_attachment': 0.8,
        'avoidant_attachment': 0.8,
        'fear_of_abandonment': 0.7,
        'intimacy_comfort': 0.7,
        'mood_stability': 0.6,
      },
    ),

    // Q60: Consider myself unworthy but desperately need love
    'attachment_styles_v1:q60': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q60',
      axisWeights: {
        'self_esteem': 1.0,
        'self_consciousness': 1.0,
        'anxious_attachment': 0.9,
        'vulnerability': 0.8,
        'self_acceptance': 0.7,
      },
    ),

    // ========================================================================
    // BIPOLAR PERSONALITY TYPE SCALES (E/I, S/N, T/F, J/P)
    // Added for cross-test personality type calculation
    // All weights are POSITIVE - direction is auto-detected by sign
    // ========================================================================

    // EXTRAVERSION (E) - social openness, emotional expression
    'attachment_styles_v1:q1_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q1',
      axisWeights: {
        'extraversion': 0.7, // Easy to open up and share feelings
      },
    ),
    'attachment_styles_v1:q13_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q13',
      axisWeights: {
        'extraversion': 0.6, // Can easily ask for help
      },
    ),
    'attachment_styles_v1:q37_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q37',
      axisWeights: {
        'extraversion': 0.7, // Openly talk about needs
      },
    ),

    // INTROVERSION (I) - preference for distance, self-reliance
    'attachment_styles_v1:q3_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q3',
      axisWeights: {
        'introversion': 0.7, // Prefer not to get too emotionally close
      },
    ),
    'attachment_styles_v1:q9_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q9',
      axisWeights: {
        'introversion': 0.5, // Calm about partner spending time apart
      },
    ),
    'attachment_styles_v1:q39_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q39',
      axisWeights: {
        'introversion': 0.8, // More comfortable keeping people at distance
      },
    ),

    // FEELING (F) - emotional expression, vulnerability
    'attachment_styles_v1:q1_bipolar_f': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q1',
      axisWeights: {
        'feeling': 0.8, // Share feelings easily
      },
    ),
    'attachment_styles_v1:q17_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q17',
      axisWeights: {
        'feeling': 0.9, // Not afraid to be vulnerable
      },
    ),

    // THINKING (T) - emotional detachment, rationality
    'attachment_styles_v1:q27_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q27',
      axisWeights: {
        'thinking': 0.8, // Expressing emotions is difficult
      },
    ),
    'attachment_styles_v1:q47_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q47',
      axisWeights: {
        'thinking': 0.7, // Relying on others is weakness
      },
    ),

    // JUDGING (J) - planning, trust in stability
    'attachment_styles_v1:q21_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q21',
      axisWeights: {
        'judging': 0.6, // Confident people won't leave
      },
    ),
    'attachment_styles_v1:q45_bipolar': QuestionWeight(
      testId: 'attachment_styles_v1',
      questionId: 'q45',
      axisWeights: {
        'judging': 0.7, // Effectively resolve conflicts
      },
    ),
  };
}
