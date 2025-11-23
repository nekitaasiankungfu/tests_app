import 'question_weight_models.dart';

/// Weight mappings for Romantic Potential and Love Beliefs Test
/// 36 questions across 3 factors:
/// - romantic_potential (q1-q12, reversed: 3,6,8,11)
/// - love_attitudes (q13-q24, reversed: 17,18,21,23)
/// - love_stories (q25-q36, reversed: 29,31,33,35)
///
/// Uses ONLY existing 195 psychological scales + 8 bipolar poles
/// Verified against hierarchical_scales.dart
class RomanticPotentialWeights {
  static final Map<String, QuestionWeight> weights = {
    // ========================================
    // ROMANTIC POTENTIAL (q1-q12)
    // ========================================

    // Q1: "Мне легко выражать чувства человеку, который мне нравится"
    'romantic_potential_v1:q1': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q1',
      axisWeights: {
        'emotional_openness': 1.2,
        'expressiveness': 1.0,
        'vulnerability_sharing': 0.9,
        'affection_expression': 0.8,
        'social_confidence': 0.6,
        'extraversion': 0.5, // Bipolar pole
      },
    ),

    // Q2: "Я умею устанавливать эмоциональную близость без страха быть отвергнутым"
    'romantic_potential_v1:q2': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q2',
      axisWeights: {
        'emotional_intimacy': 1.2,
        'secure_attachment': 1.0,
        'intimacy_comfort': 0.9,
        'fear_of_abandonment': -0.8, // (reversed)
        'emotional_resilience': 0.7,
        'self_esteem': 0.5,
      },
    ),

    // Q3: "Мне сложно доверять партнёру полностью" (REVERSED)
    'romantic_potential_v1:q3': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q3',
      axisWeights: {
        'trust': -1.2, // (reversed)
        'trust_in_relationships': -1.0, // (reversed)
        'secure_attachment': -0.9, // (reversed)
        'avoidant_attachment': 0.8,
        'fear_of_abandonment': 0.7,
        'vulnerability': 0.5,
      },
    ),

    // Q4: "Я открыт(а) к новым отношениям и эмоциональному опыту"
    'romantic_potential_v1:q4': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q4',
      axisWeights: {
        'emotional_openness': 1.2,
        'feelings': 1.0,
        'novelty_seeking': 0.8,
        'risk_taking': 0.6,
        'spontaneity': 0.5,
        'extraversion': 0.4, // Bipolar pole
      },
    ),

    // Q5: "Я умею спокойно обсуждать свои потребности в отношениях"
    'romantic_potential_v1:q5': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q5',
      axisWeights: {
        'communication_quality': 1.2,
        'assertiveness': 1.0,
        'verbal_communication': 0.8,
        'conflict_resolution': 0.7,
        'emotional_intelligence': 0.6,
        'composure': 0.5,
      },
    ),

    // Q6: "Я часто избегаю разговоров о чувствах" (REVERSED)
    'romantic_potential_v1:q6': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q6',
      axisWeights: {
        'emotional_openness': -1.2, // (reversed)
        'communication_quality': -1.0, // (reversed)
        'vulnerability_sharing': -0.9, // (reversed)
        'avoidant_coping': 0.8,
        'avoidant_attachment': 0.7,
        'introversion': 0.5, // Bipolar pole
      },
    ),

    // Q7: "Я способен(на) поддерживать эмоциональную стабильность даже в сложные периоды"
    'romantic_potential_v1:q7': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q7',
      axisWeights: {
        'emotional_resilience': 1.2,
        'mood_stability': 1.0,
        'stress_tolerance': 0.9,
        'composure': 0.8,
        'emotion_focused_coping': 0.6,
        'maturity': 0.5,
      },
    ),

    // Q8: "Мне трудно начать отношения, даже если человек мне нравится" (REVERSED)
    'romantic_potential_v1:q8': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q8',
      axisWeights: {
        'social_boldness': -1.0, // (reversed)
        'social_confidence': -0.9, // (reversed)
        'assertiveness': -0.8, // (reversed)
        'self_consciousness': 0.8,
        'avoidant_attachment': 0.7,
        'anxiety': 0.5,
      },
    ),

    // Q9: "Я умею проявлять заботу и внимательность по отношению к партнёру"
    'romantic_potential_v1:q9': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q9',
      axisWeights: {
        'support_giving': 1.2,
        'empathy': 1.0,
        'affection_expression': 0.9,
        'tender_mindedness': 0.8,
        'compassion': 0.7,
        'altruism': 0.5,
      },
    ),

    // Q10: "Я чувствую уверенность, когда строю отношения"
    'romantic_potential_v1:q10': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q10',
      axisWeights: {
        'social_confidence': 1.2,
        'self_efficacy': 1.0,
        'self_esteem': 0.9,
        'secure_attachment': 0.8,
        'relationship_security': 0.7,
        'competence': 0.5,
      },
    ),

    // Q11: "Иногда я закрываюсь, когда отношения становятся слишком близкими" (REVERSED)
    'romantic_potential_v1:q11': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q11',
      axisWeights: {
        'intimacy_comfort': -1.2, // (reversed)
        'emotional_intimacy': -1.0, // (reversed)
        'vulnerability_sharing': -0.9, // (reversed)
        'avoidant_attachment': 0.9,
        'fear_of_abandonment': 0.6,
        'boundary_setting': 0.4,
      },
    ),

    // Q12: "Мне нравится идея стабильных, долгосрочных отношений"
    'romantic_potential_v1:q12': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q12',
      axisWeights: {
        'commitment': 1.2,
        'reliability_partnership': 1.0,
        'loyalty': 0.9,
        'relationship_security': 0.8,
        'shared_goals': 0.6,
        'security_value': 0.5,
      },
    ),

    // ========================================
    // LOVE ATTITUDES (q13-q24)
    // ========================================

    // Q13: "Любовь — это прежде всего доверие и партнёрство"
    'romantic_potential_v1:q13': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q13',
      axisWeights: {
        'trust_in_relationships': 1.2,
        'reliability_partnership': 1.0,
        'commitment': 0.9,
        'trust': 0.8,
        'cooperativeness': 0.6,
        'maturity': 0.5,
      },
    ),

    // Q14: "Я верю, что истинная любовь всегда иррациональна"
    'romantic_potential_v1:q14': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q14',
      axisWeights: {
        'passion_vitality': 0.9,
        'excitement_seeking': 0.7,
        'fantasy': 0.6,
        'sensation_seeking': 0.5,
        'impulsiveness': 0.4,
        'feeling': 0.3, // Bipolar pole
      },
    ),

    // Q15: "Любовь должна быть страстной, иначе это не любовь"
    'romantic_potential_v1:q15': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q15',
      axisWeights: {
        'passion_vitality': 1.0,
        'physical_intimacy': 0.8,
        'excitement_seeking': 0.7,
        'sensation_seeking': 0.6,
        'emotional_reactivity': 0.5,
        'stimulation': 0.4,
      },
    ),

    // Q16: "Любовь — это ежедневный выбор и работа"
    'romantic_potential_v1:q16': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q16',
      axisWeights: {
        'commitment': 1.2,
        'responsibility': 1.0,
        'persistence': 0.9,
        'deliberation': 0.7,
        'maturity': 0.6,
        'wisdom': 0.5,
      },
    ),

    // Q17: "Я считаю, что любовь должна происходить естественно, без усилий" (REVERSED)
    'romantic_potential_v1:q17': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q17',
      axisWeights: {
        'persistence': -0.9, // (reversed)
        'commitment': -0.8, // (reversed)
        'responsibility': -0.7, // (reversed)
        'fantasy': 0.7,
        'spontaneity': 0.5,
        'impulsiveness': 0.4,
      },
    ),

    // Q18: "Чем сильнее чувства, тем лучше отношения" (REVERSED)
    'romantic_potential_v1:q18': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q18',
      axisWeights: {
        'emotional_resilience': -0.7, // (reversed)
        'mood_stability': -0.6, // (reversed)
        'emotional_reactivity': 0.8,
        'sensation_seeking': 0.7,
        'anxious_attachment': 0.6,
        'passion_vitality': 0.5,
      },
    ),

    // Q19: "Настоящая любовь исключает идеализацию партнёра"
    'romantic_potential_v1:q19': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q19',
      axisWeights: {
        'self_awareness': 1.0,
        'critical_thinking': 0.9,
        'acceptance': 0.8,
        'maturity': 0.7,
        'cognitive_reappraisal': 0.6,
        'wisdom': 0.5,
      },
    ),

    // Q20: "Любовь — это гармония между эмоциями и разумом"
    'romantic_potential_v1:q20': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q20',
      axisWeights: {
        'emotional_intelligence': 1.2,
        'deliberation': 1.0,
        'composure': 0.8,
        'emotional_resilience': 0.7,
        'maturity': 0.6,
        'wisdom': 0.5,
      },
    ),

    // Q21: "Настоящая любовь всегда драматична" (REVERSED)
    'romantic_potential_v1:q21': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q21',
      axisWeights: {
        'emotional_resilience': -0.9, // (reversed)
        'mood_stability': -0.8, // (reversed)
        'calmness': -0.7, // (reversed)
        'emotional_reactivity': 0.8,
        'sensation_seeking': 0.7,
        'anxious_attachment': 0.6,
      },
    ),

    // Q22: "Любовь — это пространство, где оба могут быть собой"
    'romantic_potential_v1:q22': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q22',
      axisWeights: {
        'authenticity': 1.2,
        'autonomy_wellbeing': 1.0,
        'self_acceptance': 0.9,
        'emotional_openness': 0.8,
        'intimacy_comfort': 0.7,
        'secure_attachment': 0.6,
      },
    ),

    // Q23: "Любовь требует полной эмоциональной зависимости" (REVERSED)
    'romantic_potential_v1:q23': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q23',
      axisWeights: {
        'autonomy_need': -1.0, // (reversed)
        'autonomy_wellbeing': -0.9, // (reversed)
        'boundary_setting': -0.8, // (reversed)
        'anxious_attachment': 0.9,
        'fear_of_abandonment': 0.8,
        'reward_dependence': 0.6,
      },
    ),

    // Q24: "Любовь — это свобода и взаимное уважение"
    'romantic_potential_v1:q24': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q24',
      axisWeights: {
        'autonomy_wellbeing': 1.2,
        'positive_relations': 1.0,
        'boundary_setting': 0.9,
        'trust_in_relationships': 0.8,
        'self_direction': 0.7,
        'secure_attachment': 0.6,
      },
    ),

    // ========================================
    // LOVE STORIES (q25-q36)
    // ========================================

    // Q25: "Мне близка идея любви как партнёрства, где двое идут одной дорогой"
    'romantic_potential_v1:q25': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q25',
      axisWeights: {
        'reliability_partnership': 1.2,
        'shared_goals': 1.0,
        'cooperativeness': 0.9,
        'commitment': 0.8,
        'trust_in_relationships': 0.7,
        'benevolence': 0.5,
      },
    ),

    // Q26: "Для меня любовь — это история страсти и эмоциональной интенсивности"
    'romantic_potential_v1:q26': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q26',
      axisWeights: {
        'passion_vitality': 1.2,
        'excitement_seeking': 0.9,
        'sensation_seeking': 0.8,
        'emotional_reactivity': 0.7,
        'physical_intimacy': 0.6,
        'stimulation': 0.5,
      },
    ),

    // Q27: "Я воспринимаю любовь как заботу и постоянную поддержку"
    'romantic_potential_v1:q27': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q27',
      axisWeights: {
        'support_giving': 1.2,
        'tender_mindedness': 1.0,
        'compassion': 0.9,
        'empathy': 0.8,
        'altruism': 0.7,
        'benevolence': 0.6,
      },
    ),

    // Q28: "Любовь — это история личностного роста, где партнёры помогают друг другу развиваться"
    'romantic_potential_v1:q28': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q28',
      axisWeights: {
        'personal_growth': 1.2,
        'growth_mindset': 1.0,
        'shared_goals': 0.9,
        'support_giving': 0.8,
        'mentoring': 0.6,
        'maturity': 0.5,
      },
    ),

    // Q29: "Любовь — это борьба, преодоление и драматичные повороты" (REVERSED)
    'romantic_potential_v1:q29': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q29',
      axisWeights: {
        'calmness': -1.0, // (reversed)
        'mood_stability': -0.9, // (reversed)
        'relationship_security': -0.8, // (reversed)
        'emotional_reactivity': 0.9,
        'sensation_seeking': 0.7,
        'anxious_attachment': 0.6,
      },
    ),

    // Q30: "Мне важно сохранять чувство свободы и автономии даже в любви"
    'romantic_potential_v1:q30': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q30',
      axisWeights: {
        'autonomy_need': 1.2,
        'autonomy_wellbeing': 1.0,
        'self_direction': 0.9,
        'boundary_setting': 0.8,
        'identity_clarity': 0.6,
        'self_acceptance': 0.5,
      },
    ),

    // Q31: "Любовь — это когда партнёры полностью принадлежат друг другу" (REVERSED)
    'romantic_potential_v1:q31': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q31',
      axisWeights: {
        'autonomy_need': -1.0, // (reversed)
        'boundary_setting': -0.9, // (reversed)
        'identity_clarity': -0.8, // (reversed)
        'anxious_attachment': 0.9,
        'fear_of_abandonment': 0.7,
        'jealousy': 0.6,
      },
    ),

    // Q32: "Любовь должна приносить ощущение спокойствия и надёжности"
    'romantic_potential_v1:q32': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q32',
      axisWeights: {
        'relationship_security': 1.2,
        'calmness': 1.0,
        'reliability_partnership': 0.9,
        'secure_attachment': 0.8,
        'dependability': 0.7,
        'security_value': 0.6,
      },
    ),

    // Q33: "Любовь — это поиск ярких переживаний и эмоциональных всплесков" (REVERSED)
    'romantic_potential_v1:q33': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q33',
      axisWeights: {
        'calmness': -0.9, // (reversed)
        'mood_stability': -0.8, // (reversed)
        'emotional_resilience': -0.7, // (reversed)
        'sensation_seeking': 0.9,
        'excitement_seeking': 0.8,
        'emotional_reactivity': 0.7,
      },
    ),

    // Q34: "В здоровой любви партнёры могут оставаться самостоятельными"
    'romantic_potential_v1:q34': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q34',
      axisWeights: {
        'autonomy_wellbeing': 1.2,
        'autonomy_need': 1.0,
        'boundary_setting': 0.9,
        'identity_clarity': 0.8,
        'self_acceptance': 0.7,
        'maturity': 0.6,
      },
    ),

    // Q35: "Для меня любовь связана с глубокой эмоциональной зависимостью" (REVERSED)
    'romantic_potential_v1:q35': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q35',
      axisWeights: {
        'autonomy_need': -1.0, // (reversed)
        'secure_attachment': -0.8, // (reversed)
        'identity_clarity': -0.7, // (reversed)
        'anxious_attachment': 1.0,
        'fear_of_abandonment': 0.8,
        'reward_dependence': 0.7,
      },
    ),

    // Q36: "Любовь — это поддержка, развитие и уважение к индивидуальности партнёра"
    'romantic_potential_v1:q36': QuestionWeight(
      testId: 'romantic_potential_v1',
      questionId: 'q36',
      axisWeights: {
        'support_giving': 1.2,
        'personal_growth': 1.0,
        'autonomy_wellbeing': 0.9,
        'positive_relations': 0.8,
        'empathy': 0.7,
        'maturity': 0.6,
      },
    ),
  };
}
