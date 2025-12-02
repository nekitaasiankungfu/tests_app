import 'question_weight_models.dart';

/// Question weights configuration for FOMO & Social Comparison Test
/// Maps 48 questions to ~195 hierarchical psychological scales
///
/// Test measures 6 digital wellbeing factors:
/// - fomo (Q1-8): Fear of Missing Out - anxiety about missing events/experiences
/// - social_comparison (Q9-16): Comparing life/appearance to social media
/// - validation_seeking (Q17-24): Dependency on likes and online approval
/// - envy_discontent (Q25-32): Envy and dissatisfaction triggered by social media
/// - compulsive_checking (Q33-40): Obsessive phone/social media checking behavior
/// - self_worth_dependency (Q41-48): Self-esteem tied to social media success
///
/// Based on research:
/// - Fear of Missing Out Theory (Przybylski et al., 2013)
/// - Social Comparison Theory (Festinger, 1954)
/// - Self-Determination Theory (Deci & Ryan)
/// - Social Media Addiction Research
class FomoSocialComparisonWeights {
  /// FOMO & SOCIAL COMPARISON TEST - 48 Questions
  ///
  /// All questions use frequency scale (0-4): Never, Rarely, Sometimes, Often, Constantly
  /// All questions are direct (no reverse scoring) - measure problematic patterns
  ///
  /// Weight categories: Primary (0.8-1.2), Secondary (0.4-0.7), Tertiary (0.2-0.3)
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // FACTOR 1: FOMO - Fear of Missing Out (Q1-8)
    // Core anxiety about missing social events and experiences
    // ========================================================================

    // Q1: "I feel anxious when I see others having fun without me"
    'fomo_social_comparison_v1:q1': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q1',
      axisWeights: {
        'anxiety': 1.0, // Primary: Social anxiety trigger
        'calmness': -0.4, // Lost peace when seeing others' fun (reversed)
        'emotional_reactivity': 0.5, // Heightened emotional response
        'emotional_resilience': -0.7, // Reduced resilience to FOMO (reversed)
        'extraversion': 0.5, // ⭐ Personality Type
        'jealousy': 0.6, // Feeling envious of others' experiences
        'life_satisfaction': -0.5, // Reduced satisfaction (reversed)
        'self_esteem': -0.6, // Low self-worth when excluded (reversed)
        'worry_tendency': 0.8, // Secondary: Anxious thoughts about missing out
        'anxious_attachment': 0.8,
        'emotional_intelligence': 0.5,
        'fear_of_abandonment': 0.7,
        'relatedness_need': 0.7,
        'reward_dependence': 0.6,
      },
    ),

    // Q2: "I feel like everyone around lives more interesting lives than me"
    'fomo_social_comparison_v1:q2': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q2',
      axisWeights: {
        'depression': 0.8, // Secondary: Depressive comparison
        'jealousy': 0.9, // High: Envy of others' lives
        'life_satisfaction': -1.0, // Primary: Deep dissatisfaction (reversed)
        'self_compassion': -0.7, // Lack of self-kindness (reversed)
        'self_esteem': -1.1, // Primary: Low self-worth (reversed)
        'anxious_attachment': 0.8,
        'emotional_intelligence': 0.5,
        'fear_of_abandonment': 0.7,
        'relatedness_need': 0.7,
        'reward_dependence': 0.6,
      },
    ),

    // Q3: "I fear missing something important if I don't check social media"
    'fomo_social_comparison_v1:q3': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q3',
      axisWeights: {
        'anxiety': 1.1, // Primary: Anticipatory anxiety
        'attention_control': -0.6, // Difficulty focusing away from phone (reversed)
        'autonomy_wellbeing': -0.5, // Reduced autonomy (reversed)
        'impulsiveness': 0.9, // High: Impulsive checking behavior
        'judging': 0.6, // ⭐ Personality Type
        'stress_tolerance': -0.5, // Stress from potential missing out (reversed)
        'worry_tendency': 0.8, // Secondary: Obsessive worry
        'anxious_attachment': 0.8,
        'emotional_intelligence': 0.5,
        'fear_of_abandonment': 0.7,
        'relatedness_need': 0.7,
        'reward_dependence': 0.6,
      },
    ),

    // Q4: "Others' stories about events I wasn't at make me uncomfortable"
    'fomo_social_comparison_v1:q4': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q4',
      axisWeights: {
        'emotional_reactivity': 0.7, // Heightened emotional response
        'jealousy': 0.8, // Secondary: Envy of participants
        'secure_attachment': -0.5, // Insecure attachment patterns (reversed)
        'self_consciousness': 0.9, // High: Sensitivity to exclusion
        'self_esteem': -0.7, // Feeling less valued (reversed)
        'vulnerability': 0.6, // Emotional vulnerability to exclusion
        'anxious_attachment': 0.8,
        'emotional_intelligence': 0.5,
        'fear_of_abandonment': 0.7,
        'relatedness_need': 0.7,
        'reward_dependence': 0.6,
      },
    ),

    // Q5: "I feel excluded when I see group photos of friends without me"
    'fomo_social_comparison_v1:q5': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q5',
      axisWeights: {
        'emotional_reactivity': 0.8, // Secondary: Strong emotional response
        'extraversion': 0.6, // ⭐ Personality Type
        'jealousy': 0.7, // Envy of those included
        'self_esteem': -1.0, // Primary: Low self-worth from exclusion (reversed)
        'trust': -0.5, // Trust issues in friendships (reversed)
        'vulnerability': 0.6, // Emotional vulnerability
        'anxious_attachment': 0.8,
        'emotional_intelligence': 0.5,
        'fear_of_abandonment': 0.7,
        'relatedness_need': 0.7,
        'reward_dependence': 0.6,
      },
    ),

    // Q6: "I feel I'm missing opportunities others have"
    'fomo_social_comparison_v1:q6': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q6',
      axisWeights: {
        'achievement_motivation': -0.6, // Reduced motivation from comparison (reversed)
        'jealousy': 0.9, // High: Envy of others' opportunities
        'life_satisfaction': -0.8, // Secondary: Dissatisfaction (reversed)
        'self_efficacy': -0.7, // Low belief in own capabilities (reversed)
        'self_esteem': -1.0, // Primary: Low self-worth (reversed)
        'anxious_attachment': 0.8,
        'emotional_intelligence': 0.5,
        'fear_of_abandonment': 0.7,
        'relatedness_need': 0.7,
        'reward_dependence': 0.6,
      },
    ),

    // Q7: "I can't relax because I fear missing something online"
    'fomo_social_comparison_v1:q7': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q7',
      axisWeights: {
        'anxiety': 1.2, // Primary: Chronic anxiety
        'attention_control': -0.7, // Can't focus on present (reversed)
        'calmness': -0.9, // High: Lost peace (reversed)
        'emotional_resilience': -0.8, // Secondary: Reduced resilience (reversed)
        'judging': 0.7, // ⭐ Personality Type
        'stress_tolerance': -1.0, // Primary: Low stress tolerance (reversed)
        'anxious_attachment': 0.8,
        'emotional_intelligence': 0.5,
        'fear_of_abandonment': 0.7,
        'relatedness_need': 0.7,
        'reward_dependence': 0.6,
      },
    ),

    // Q8: "Others' travel/event stories ruin my mood"
    'fomo_social_comparison_v1:q8': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q8',
      axisWeights: {
        'emotional_reactivity': 0.9, // High: Heightened emotional response
        'emotional_resilience': -0.6, // Low resilience (reversed)
        'feeling': 0.7, // ⭐ Personality Type
        'jealousy': 1.1, // Primary: Strong envy
        'life_satisfaction': -0.8, // Secondary: Dissatisfaction (reversed)
        'mood_stability': -0.9, // High: Unstable mood (reversed)
        'positive_emotions': -0.7, // Loss of joy (reversed)
        'self_esteem': -0.7, // Feeling inadequate (reversed)
        'anxious_attachment': 0.8,
        'emotional_intelligence': 0.5,
        'fear_of_abandonment': 0.7,
        'relatedness_need': 0.7,
        'reward_dependence': 0.6,
      },
    ),

    // ========================================================================
    // FACTOR 2: SOCIAL COMPARISON (Q9-16)
    // Constant comparison of life, appearance, success with social media
    // ========================================================================

    // Q9: "I compare my appearance to what I see on social media"
    'fomo_social_comparison_v1:q9': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q9',
      axisWeights: {
        'body_image': -1.0, // Primary: Negative body image (reversed)
        'jealousy': 0.8, // Secondary: Envy of others' appearance
        'perfectionism': 0.7, // Unrealistic standards
        'self_acceptance': -0.6, // Lack of self-acceptance (reversed)
        'self_consciousness': 0.9, // High: Heightened self-awareness
        'self_esteem': -1.1, // Primary: Low self-worth from comparison (reversed)
        'sensing': 0.7, // ⭐ Personality Type
        'cognitive_reappraisal': 0.5,
        'environmental_mastery': 0.6,
        'social_boldness': 0.6,
        'social_confidence': 0.8,
        'social_perception': 0.7,
      },
    ),

    // Q10: "When I see others' achievements, I feel I've accomplished nothing"
    'fomo_social_comparison_v1:q10': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q10',
      axisWeights: {
        'achievement_motivation': -0.7, // Reduced motivation (reversed)
        'depression': 0.8, // Secondary: Depressive thinking
        'jealousy': 0.9, // High: Envy of achievements
        'life_satisfaction': -0.6, // Dissatisfaction (reversed)
        'self_efficacy': -1.0, // Primary: Low self-efficacy (reversed)
        'self_esteem': -1.2, // Primary: Very low self-worth (reversed)
        'cognitive_reappraisal': 0.5,
        'environmental_mastery': 0.6,
        'social_boldness': 0.6,
        'social_confidence': 0.8,
        'social_perception': 0.7,
      },
    ),

    // Q11: "I constantly compare my life to perfect pictures in feeds"
    'fomo_social_comparison_v1:q11': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q11',
      axisWeights: {
        'jealousy': 0.8, // Envy of perfect lives
        'life_satisfaction': -0.9, // High: Deep dissatisfaction (reversed)
        'self_acceptance': -0.6, // Lack of acceptance (reversed)
        'self_esteem': -1.0, // Primary: Low self-worth (reversed)
        'cognitive_reappraisal': 0.5,
        'environmental_mastery': 0.6,
        'social_boldness': 0.6,
        'social_confidence': 0.8,
        'social_perception': 0.7,
      },
    ),

    // Q12: "Others' gym/vacation photos make me feel like a failure"
    'fomo_social_comparison_v1:q12': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q12',
      axisWeights: {
        'achievement_motivation': -0.6, // Reduced motivation (reversed)
        'body_image': -0.7, // Negative body image (reversed)
        'depression': 0.8, // Secondary: Depressive feelings
        'feeling': 0.8, // ⭐ Personality Type
        'jealousy': 1.0, // High: Strong envy
        'self_compassion': -0.6, // Lack of self-kindness (reversed)
        'self_efficacy': -1.0, // Primary: Low self-efficacy (reversed)
        'self_esteem': -1.2, // Primary: Very low self-worth (reversed)
        'cognitive_reappraisal': 0.5,
        'environmental_mastery': 0.6,
        'social_boldness': 0.6,
        'social_confidence': 0.8,
        'social_perception': 0.7,
      },
    ),

    // Q13: "I evaluate my success through what others post"
    'fomo_social_comparison_v1:q13': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q13',
      axisWeights: {
        'authenticity': -0.6, // Loss of authentic self (reversed)
        'autonomy_wellbeing': -1.0, // Primary: Lost autonomy (reversed)
        'conformity': 0.7, // Following others' standards
        'jealousy': 0.8, // Secondary: Comparison-driven envy
        'self_direction': -0.7, // Lack of self-direction (reversed)
        'self_efficacy': -0.9, // High: Low internal standards (reversed)
        'self_esteem': -1.1, // Primary: External validation dependency (reversed)
        'cognitive_reappraisal': 0.5,
        'environmental_mastery': 0.6,
        'social_boldness': 0.6,
        'social_confidence': 0.8,
        'social_perception': 0.7,
      },
    ),

    // Q14: "Others' relationship posts make me feel lonely"
    'fomo_social_comparison_v1:q14': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q14',
      axisWeights: {
        'emotional_reactivity': 0.9, // High: Strong emotional response
        'introversion': 0.4, // ⭐ Personality Type
        'jealousy': 0.9, // High: Envy of relationships
        'life_satisfaction': -0.7, // Dissatisfaction (reversed)
        'positive_emotions': -0.6, // Loss of joy (reversed)
        'secure_attachment': -0.5, // Attachment insecurity (reversed)
        'self_esteem': -0.7, // Feeling less valuable (reversed)
        'cognitive_reappraisal': 0.5,
        'environmental_mastery': 0.6,
        'social_boldness': 0.6,
        'social_confidence': 0.8,
        'social_perception': 0.7,
      },
    ),

    // Q15: "I compare my number of likes with others'"
    'fomo_social_comparison_v1:q15': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q15',
      axisWeights: {
        'jealousy': 0.8, // Secondary: Envy of popularity
        'self_acceptance': -0.6, // Lack of acceptance (reversed)
        'self_consciousness': 0.6, // Heightened self-awareness
        'self_esteem': -1.0, // Primary: External validation dependency (reversed)
        'sensing': 0.6, // ⭐ Personality Type
        'cognitive_reappraisal': 0.5,
        'environmental_mastery': 0.6,
        'social_boldness': 0.6,
        'social_confidence': 0.8,
        'social_perception': 0.7,
      },
    ),

    // Q16: "Peers' social media success makes me feel I'm falling behind"
    'fomo_social_comparison_v1:q16': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q16',
      axisWeights: {
        'achievement_motivation': -0.7, // Reduced motivation (reversed)
        'anxiety': 0.8, // Secondary: Anxiety about falling behind
        'jealousy': 0.9, // High: Envy of success
        'life_satisfaction': -0.6, // Dissatisfaction (reversed)
        'self_efficacy': -1.0, // Primary: Low self-efficacy (reversed)
        'self_esteem': -1.1, // Primary: Low self-worth (reversed)
        'cognitive_reappraisal': 0.5,
        'environmental_mastery': 0.6,
        'social_boldness': 0.6,
        'social_confidence': 0.8,
        'social_perception': 0.7,
      },
    ),

    // ========================================================================
    // FACTOR 3: VALIDATION SEEKING (Q17-24)
    // Dependency on likes, comments, and online approval for self-worth
    // ========================================================================

    // Q17: "I constantly check how many likes my post got"
    'fomo_social_comparison_v1:q17': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q17',
      axisWeights: {
        'anxiety': 0.7, // Anxiety about approval
        'attention_control': -0.7, // Can't focus away from likes (reversed)
        'autonomy_wellbeing': -0.6, // Reduced autonomy (reversed)
        'impulsiveness': 0.8, // Secondary: Impulsive behavior
        'judging': 0.5, // ⭐ Personality Type
        'self_esteem': -0.9, // High: External validation dependency (reversed)
        'avoidant_attachment': 0.7,
        'communication_quality': 0.6,
        'nonverbal_communication': 0.4,
        'trust_in_relationships': 0.7,
        'verbal_communication': 0.5,
      },
    ),

    // Q18: "Low number of likes ruins my mood for the whole day"
    'fomo_social_comparison_v1:q18': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q18',
      axisWeights: {
        'depression': 0.8, // Secondary: Depressive mood
        'emotional_reactivity': 0.8, // Heightened emotional response
        'emotional_resilience': -0.9, // High: Low resilience (reversed)
        'feeling': 0.9, // ⭐ Personality Type
        'mood_stability': -1.0, // Primary: Unstable mood (reversed)
        'self_compassion': -0.6, // Lack of self-kindness (reversed)
        'self_esteem': -1.2, // Primary: Very low self-worth (reversed)
        'vulnerability': 0.7, // Emotional vulnerability
        'avoidant_attachment': 0.7,
        'communication_quality': 0.6,
        'nonverbal_communication': 0.4,
        'trust_in_relationships': 0.7,
        'verbal_communication': 0.5,
      },
    ),

    // Q19: "I feel valuable only when I get many reactions to posts"
    'fomo_social_comparison_v1:q19': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q19',
      axisWeights: {
        'authenticity': -0.7, // Loss of authentic self (reversed)
        'autonomy_wellbeing': -1.1, // Primary: Lost autonomy (reversed)
        'self_acceptance': -0.8, // Lack of self-acceptance (reversed)
        'self_compassion': -0.6, // Lack of self-kindness (reversed)
        'self_esteem': -1.3, // Primary: Severe external validation dependency (reversed)
        'avoidant_attachment': 0.7,
        'communication_quality': 0.6,
        'nonverbal_communication': 0.4,
        'trust_in_relationships': 0.7,
        'verbal_communication': 0.5,
      },
    ),

    // Q20: "I delete posts if they get few likes"
    'fomo_social_comparison_v1:q20': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q20',
      axisWeights: {
        'authenticity': -0.6, // Loss of authenticity (reversed)
        'perfectionism': 0.8, // Secondary: Unrealistic standards
        'self_acceptance': -0.7, // Lack of acceptance (reversed)
        'self_consciousness': 1.0, // High: Fear of social evaluation
        'self_esteem': -1.1, // Primary: Low self-worth (reversed)
        'avoidant_attachment': 0.7,
        'communication_quality': 0.6,
        'nonverbal_communication': 0.4,
        'trust_in_relationships': 0.7,
        'verbal_communication': 0.5,
      },
    ),

    // Q21: "I need social media approval to feel good"
    'fomo_social_comparison_v1:q21': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q21',
      axisWeights: {
        'autonomy_wellbeing': -1.1, // Primary: Lost autonomy (reversed)
        'emotional_resilience': -0.9, // Secondary: Low resilience (reversed)
        'happiness': -0.6, // Reduced happiness (reversed)
        'life_satisfaction': -0.7, // Reduced satisfaction (reversed)
        'self_compassion': -0.7, // Lack of self-kindness (reversed)
        'self_esteem': -1.3, // Primary: Severe validation dependency (reversed)
        'avoidant_attachment': 0.7,
        'communication_quality': 0.6,
        'nonverbal_communication': 0.4,
        'trust_in_relationships': 0.7,
        'verbal_communication': 0.5,
      },
    ),

    // Q22: "I carefully plan what to post to get maximum likes"
    'fomo_social_comparison_v1:q22': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q22',
      axisWeights: {
        'authenticity': -0.8, // Loss of authentic expression (reversed)
        'judging': 0.8, // ⭐ Personality Type
        'perfectionism': 0.9, // High: Unrealistic standards
        'self_consciousness': 0.8, // Secondary: Fear of evaluation
        'self_esteem': -0.9, // High: External validation dependency (reversed)
        'self_monitoring': 0.7, // High self-monitoring
        'spontaneity': -0.6, // Loss of spontaneity (reversed)
        'avoidant_attachment': 0.7,
        'communication_quality': 0.6,
        'nonverbal_communication': 0.4,
        'trust_in_relationships': 0.7,
        'verbal_communication': 0.5,
      },
    ),

    // Q23: "I feel rejected if no one reacts to my stories"
    'fomo_social_comparison_v1:q23': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q23',
      axisWeights: {
        'emotional_reactivity': 1.0, // High: Strong emotional response
        'feeling': 0.8, // ⭐ Personality Type
        'self_consciousness': 0.8, // Secondary: Sensitivity to evaluation
        'self_esteem': -1.2, // Primary: Low self-worth (reversed)
        'vulnerability': 0.7, // Emotional vulnerability
        'avoidant_attachment': 0.7,
        'communication_quality': 0.6,
        'nonverbal_communication': 0.4,
        'trust_in_relationships': 0.7,
        'verbal_communication': 0.5,
      },
    ),

    // Q24: "Follower count affects my opinion of myself"
    'fomo_social_comparison_v1:q24': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q24',
      axisWeights: {
        'authenticity': -0.7, // Loss of authentic self (reversed)
        'autonomy_wellbeing': -0.8, // Secondary: Lost autonomy (reversed)
        'extraversion': 0.5, // ⭐ Personality Type
        'narcissism': 0.5, // Some narcissistic traits
        'self_acceptance': -0.8, // Lack of self-acceptance (reversed)
        'self_esteem': -1.2, // Primary: External validation dependency (reversed)
        'avoidant_attachment': 0.7,
        'communication_quality': 0.6,
        'nonverbal_communication': 0.4,
        'trust_in_relationships': 0.7,
        'verbal_communication': 0.5,
      },
    ),

    // ========================================================================
    // FACTOR 4: ENVY & DISCONTENT (Q25-32)
    // Envy of others' success, appearance, life; dissatisfaction with reality
    // ========================================================================

    // Q25: "I envy people who look better than me on social media"
    'fomo_social_comparison_v1:q25': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q25',
      axisWeights: {
        'body_image': -1.0, // Primary: Negative body image (reversed)
        'emotional_reactivity': 0.7, // Heightened emotional response
        'jealousy': 1.2, // Primary: Strong envy
        'self_acceptance': -0.8, // Lack of self-acceptance (reversed)
        'self_consciousness': 0.8, // Secondary: Appearance anxiety
        'self_esteem': -1.0, // Primary: Low self-worth (reversed)
        'affection_expression': 0.5,
        'emotion_focused_coping': 0.7,
        'emotional_intimacy': 0.6,
        'emotional_openness': 0.6,
      },
    ),

    // Q26: "Others' success on social media triggers anger or bitterness in me"
    'fomo_social_comparison_v1:q26': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q26',
      axisWeights: {
        'anger': 1.0, // High: Anger response
        'emotional_reactivity': 0.9, // High: Heightened emotional response
        'feeling': 0.7, // ⭐ Personality Type
        'forgiveness': -0.6, // Difficulty letting go (reversed)
        'jealousy': 1.3, // Primary: Very strong envy
        'life_satisfaction': -0.7, // Dissatisfaction (reversed)
        'self_esteem': -0.8, // Low self-worth (reversed)
        'affection_expression': 0.5,
        'emotion_focused_coping': 0.7,
        'emotional_intimacy': 0.6,
        'emotional_openness': 0.6,
      },
    ),

    // Q27: "After scrolling the feed, I feel worse than before"
    'fomo_social_comparison_v1:q27': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q27',
      axisWeights: {
        'depression': 0.8, // Secondary: Depressive feelings
        'emotional_resilience': -0.8, // Low resilience (reversed)
        'feeling': 0.8, // ⭐ Personality Type
        'happiness': -0.6, // Reduced happiness (reversed)
        'life_satisfaction': -1.1, // Primary: Deep dissatisfaction (reversed)
        'mood_stability': -1.0, // Primary: Unstable mood (reversed)
        'positive_emotions': -0.7, // Loss of joy (reversed)
        'self_esteem': -0.9, // High: Low self-worth (reversed)
        'affection_expression': 0.5,
        'emotion_focused_coping': 0.7,
        'emotional_intimacy': 0.6,
        'emotional_openness': 0.6,
      },
    ),

    // Q28: "I'm dissatisfied with my life after viewing others' vacation photos"
    'fomo_social_comparison_v1:q28': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q28',
      axisWeights: {
        'emotional_reactivity': 0.6, // Heightened emotional response
        'jealousy': 1.0, // High: Envy of experiences
        'life_satisfaction': -1.2, // Primary: Deep dissatisfaction (reversed)
        'positive_emotions': -0.7, // Loss of joy (reversed)
        'self_esteem': -0.7, // Feeling inadequate (reversed)
        'affection_expression': 0.5,
        'emotion_focused_coping': 0.7,
        'emotional_intimacy': 0.6,
        'emotional_openness': 0.6,
      },
    ),

    // Q29: "Posts about purchases and luxurious lives trigger envy in me"
    'fomo_social_comparison_v1:q29': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q29',
      axisWeights: {
        'emotional_reactivity': 0.6, // Heightened emotional response
        'jealousy': 1.2, // Primary: Strong envy
        'life_satisfaction': -0.8, // Secondary: Dissatisfaction (reversed)
        'self_esteem': -0.7, // Feeling less successful (reversed)
        'sensing': 0.7, // ⭐ Personality Type
        'affection_expression': 0.5,
        'emotion_focused_coping': 0.7,
        'emotional_intimacy': 0.6,
        'emotional_openness': 0.6,
      },
    ),

    // Q30: "I think: 'Why do they have this and I don't?'"
    'fomo_social_comparison_v1:q30': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q30',
      axisWeights: {
        'jealousy': 1.2, // Primary: Strong envy
        'life_satisfaction': -0.9, // High: Dissatisfaction (reversed)
        'self_esteem': -1.0, // Primary: Low self-worth (reversed)
        'affection_expression': 0.5,
        'emotion_focused_coping': 0.7,
        'emotional_intimacy': 0.6,
        'emotional_openness': 0.6,
      },
    ),

    // Q31: "Perfect bodies on social media make me hate mine"
    'fomo_social_comparison_v1:q31': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q31',
      axisWeights: {
        'body_image': -1.3, // Primary: Severe negative body image (reversed)
        'jealousy': 1.0, // High: Envy of appearance
        'perfectionism': 0.7, // Unrealistic body standards
        'self_acceptance': -0.9, // Lack of self-acceptance (reversed)
        'self_compassion': -0.6, // Lack of self-kindness (reversed)
        'self_esteem': -1.1, // Primary: Very low self-worth (reversed)
        'sensing': 0.8, // ⭐ Personality Type
        'affection_expression': 0.5,
        'emotion_focused_coping': 0.7,
        'emotional_intimacy': 0.6,
        'emotional_openness': 0.6,
      },
    ),

    // Q32: "I feel irritated when I see others' happiness online"
    'fomo_social_comparison_v1:q32': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q32',
      axisWeights: {
        'anger': 0.9, // High: Irritation/anger
        'emotional_reactivity': 0.8, // Secondary: Heightened emotional response
        'empathy': -0.7, // Reduced empathy for others (reversed)
        'feeling': 0.7, // ⭐ Personality Type
        'happiness': -0.6, // Reduced own happiness (reversed)
        'jealousy': 1.2, // Primary: Strong envy
        'life_satisfaction': -0.8, // Dissatisfaction (reversed)
        'affection_expression': 0.5,
        'emotion_focused_coping': 0.7,
        'emotional_intimacy': 0.6,
        'emotional_openness': 0.6,
      },
    ),

    // ========================================================================
    // FACTOR 5: COMPULSIVE CHECKING (Q33-40)
    // Obsessive phone/social media checking, inability to stop
    // ========================================================================

    // Q33: "First thing I do in the morning is check social media"
    'fomo_social_comparison_v1:q33': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q33',
      axisWeights: {
        'autonomy_wellbeing': -0.6, // Reduced autonomy (reversed)
        'extraversion': 0.5, // ⭐ Personality Type
        'impulsiveness': 0.9, // High: Impulsive behavior
        'self_discipline': -0.8, // Low self-discipline (reversed)
        'impulsivity_behavior': 0.9,
        'impulsivity_dark': 0.7,
        'social_support_seeking': 0.6,
      },
    ),

    // Q34: "I can't resist checking my phone every few minutes"
    'fomo_social_comparison_v1:q34': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q34',
      axisWeights: {
        'anxiety': 0.7, // Anxiety driving checking
        'attention_control': -0.9, // Secondary: Can't focus (reversed)
        'autonomy_wellbeing': -0.6, // Reduced autonomy (reversed)
        'impulsiveness': 1.0, // High: Highly impulsive
        'perceiving': 0.6, // ⭐ Personality Type
        'self_discipline': -0.8, // Low self-discipline (reversed)
        'impulsivity_behavior': 0.9,
        'impulsivity_dark': 0.7,
        'social_support_seeking': 0.6,
      },
    ),

    // Q35: "I check social media even when busy with important tasks"
    'fomo_social_comparison_v1:q35': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q35',
      axisWeights: {
        'attention_control': -1.0, // High: Can't maintain focus (reversed)
        'impulsiveness': 0.9, // Impulsive behavior
        'perceiving': 0.7, // ⭐ Personality Type
        'self_discipline': -0.9, // Secondary: Low self-discipline (reversed)
        'impulsivity_behavior': 0.9,
        'impulsivity_dark': 0.7,
        'social_support_seeking': 0.6,
      },
    ),

    // Q36: "I refresh the feed again and again though nothing changed"
    'fomo_social_comparison_v1:q36': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q36',
      axisWeights: {
        'anxiety': 0.9, // Secondary: Anxiety driving behavior
        'impulsiveness': 1.0, // High: Highly impulsive
        'patience': -0.7, // Impatience (reversed)
        'perceiving': 0.8, // ⭐ Personality Type
        'self_discipline': -0.6, // Low self-discipline (reversed)
        'impulsivity_behavior': 0.9,
        'impulsivity_dark': 0.7,
        'social_support_seeking': 0.6,
      },
    ),

    // Q37: "I spend much more time on social media than planned"
    'fomo_social_comparison_v1:q37': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q37',
      axisWeights: {
        'impulsiveness': 0.8, // Impulsive behavior
        'perceiving': 0.9, // ⭐ Personality Type
        'self_discipline': -1.0, // Primary: Low self-discipline (reversed)
        'impulsivity_behavior': 0.9,
        'impulsivity_dark': 0.7,
        'social_support_seeking': 0.6,
      },
    ),

    // Q38: "I check my phone during conversations with real people"
    'fomo_social_comparison_v1:q38': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q38',
      axisWeights: {
        'attention_control': -0.8, // Can't focus on conversation (reversed)
        'empathy': -0.9, // High: Reduced empathy for present company (reversed)
        'extraversion': 0.4, // ⭐ Personality Type
        'impulsivity_behavior': 0.9,
        'impulsivity_dark': 0.7,
        'social_support_seeking': 0.6,
      },
    ),

    // Q39: "I can't fall asleep until I scroll the feed"
    'fomo_social_comparison_v1:q39': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q39',
      axisWeights: {
        'anxiety': 0.7, // Anxiety about missing out
        'judging': 0.5, // ⭐ Personality Type
        'self_discipline': -0.8, // Secondary: Low self-discipline (reversed)
        'impulsivity_behavior': 0.9,
        'impulsivity_dark': 0.7,
        'social_support_seeking': 0.6,
      },
    ),

    // Q40: "I feel anxious when I can't check notifications"
    'fomo_social_comparison_v1:q40': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q40',
      axisWeights: {
        'anxiety': 1.2, // Primary: Strong anxiety
        'autonomy_wellbeing': -0.7, // Reduced autonomy (reversed)
        'calmness': -0.6, // Lost peace (reversed)
        'emotional_resilience': -0.7, // Low resilience (reversed)
        'stress_tolerance': -0.8, // Low stress tolerance (reversed)
        'impulsivity_behavior': 0.9,
        'impulsivity_dark': 0.7,
        'social_support_seeking': 0.6,
      },
    ),

    // ========================================================================
    // FACTOR 6: SELF-WORTH DEPENDENCY (Q41-48)
    // Self-esteem and mood completely tied to social media success
    // ========================================================================

    // Q41: "My mood depends on how things go on social media"
    'fomo_social_comparison_v1:q41': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q41',
      axisWeights: {
        'autonomy_wellbeing': -0.9, // Secondary: Lost autonomy (reversed)
        'emotional_reactivity': 0.7, // Heightened emotional response
        'emotional_resilience': -1.0, // High: Low resilience (reversed)
        'feeling': 0.9, // ⭐ Personality Type
        'mood_stability': -1.2, // Primary: Very unstable mood (reversed)
        'self_esteem': -1.1, // Primary: External validation dependency (reversed)
        'vulnerability': 0.8, // Emotional vulnerability
        'cognitive_reappraisal': 0.7,
        'emotional_intelligence': 0.6,
        'social_support_seeking': 0.8,
      },
    ),

    // Q42: "I feel worthless if my posts are ignored"
    'fomo_social_comparison_v1:q42': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q42',
      axisWeights: {
        'depression': 0.9, // Secondary: Depressive feelings
        'emotional_reactivity': 1.0, // High: Strong emotional response
        'feeling': 1.0, // ⭐ Personality Type
        'self_acceptance': -0.8, // Lack of self-acceptance (reversed)
        'self_compassion': -0.6, // Lack of self-kindness (reversed)
        'self_esteem': -1.3, // Primary: Severe validation dependency (reversed)
        'vulnerability': 0.8, // Emotional vulnerability
        'cognitive_reappraisal': 0.7,
        'emotional_intelligence': 0.6,
        'social_support_seeking': 0.8,
      },
    ),

    // Q43: "Social media success is more important to me than real life success"
    'fomo_social_comparison_v1:q43': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q43',
      axisWeights: {
        'authenticity': -0.9, // Secondary: Loss of authentic values (reversed)
        'autonomy_wellbeing': -1.1, // Primary: Lost autonomy (reversed)
        'intuition': 0.5, // ⭐ Personality Type
        'life_satisfaction': -0.8, // Real life dissatisfaction (reversed)
        'narcissism': 0.7, // Narcissistic traits
        'self_direction': -0.8, // Lack of self-direction (reversed)
        'self_esteem': -1.2, // Primary: External validation dependency (reversed)
        'cognitive_reappraisal': 0.7,
        'emotional_intelligence': 0.6,
        'social_support_seeking': 0.8,
      },
    ),

    // Q44: "I judge my importance by likes and followers count"
    'fomo_social_comparison_v1:q44': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q44',
      axisWeights: {
        'authenticity': -0.7, // Loss of authentic self (reversed)
        'autonomy_wellbeing': -1.0, // High: Lost autonomy (reversed)
        'narcissism': 0.8, // Narcissistic traits
        'self_acceptance': -0.8, // Lack of self-acceptance (reversed)
        'self_esteem': -1.3, // Primary: Severe validation dependency (reversed)
        'cognitive_reappraisal': 0.7,
        'emotional_intelligence': 0.6,
        'social_support_seeking': 0.8,
      },
    ),

    // Q45: "Without social media, I don't feel connected to the world"
    'fomo_social_comparison_v1:q45': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q45',
      axisWeights: {
        'autonomy_wellbeing': -1.0, // Primary: Lost autonomy (reversed)
        'intuition': 0.6, // ⭐ Personality Type
        'cognitive_reappraisal': 0.7,
        'emotional_intelligence': 0.6,
        'social_support_seeking': 0.8,
      },
    ),

    // Q46: "I feel invisible if I don't post on social media"
    'fomo_social_comparison_v1:q46': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q46',
      axisWeights: {
        'authenticity': -0.7, // Loss of authentic presence (reversed)
        'narcissism': 0.8, // Secondary: Narcissistic needs
        'self_acceptance': -0.7, // Lack of self-acceptance (reversed)
        'self_esteem': -1.2, // Primary: External validation dependency (reversed)
        'cognitive_reappraisal': 0.7,
        'emotional_intelligence': 0.6,
        'social_support_seeking': 0.8,
      },
    ),

    // Q47: "My self-confidence drops after time on social media"
    'fomo_social_comparison_v1:q47': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q47',
      axisWeights: {
        'depression': 0.8, // Depressive feelings
        'emotional_resilience': -0.9, // High: Low resilience (reversed)
        'feeling': 0.8, // ⭐ Personality Type
        'life_satisfaction': -0.7, // Dissatisfaction (reversed)
        'mood_stability': -0.8, // Secondary: Unstable mood (reversed)
        'self_acceptance': -0.7, // Lack of self-acceptance (reversed)
        'self_efficacy': -1.0, // Primary: Low self-confidence (reversed)
        'self_esteem': -1.2, // Primary: Low self-worth (reversed)
        'vulnerability': 0.6, // Emotional vulnerability
        'cognitive_reappraisal': 0.7,
        'emotional_intelligence': 0.6,
        'social_support_seeking': 0.8,
      },
    ),

    // Q48: "I perceive my value through online interactions"
    'fomo_social_comparison_v1:q48': const QuestionWeight(
      testId: 'fomo_social_comparison_v1',
      questionId: 'q48',
      axisWeights: {
        'authenticity': -0.9, // Secondary: Loss of authentic self (reversed)
        'autonomy_wellbeing': -1.1, // Primary: Lost autonomy (reversed)
        'self_acceptance': -0.8, // Lack of self-acceptance (reversed)
        'self_esteem': -1.3, // Primary: Severe validation dependency (reversed)
        'cognitive_reappraisal': 0.7,
        'emotional_intelligence': 0.6,
        'social_support_seeking': 0.8,
      },
    ),
  };
}
