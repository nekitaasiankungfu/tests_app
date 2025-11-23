import 'question_weight_models.dart';

/// Weight mappings for Self-Confidence Multiscale Test
/// 32 questions mapped to existing 195 psychological scales
/// Test uses 5-point Likert scale (0-4)
///
/// Factors:
/// - general_self_belief: Q1, Q5, Q9, Q13, Q17, Q21, Q25, Q29 (8 questions)
/// - social_assertiveness: Q2, Q6(R), Q10(R), Q14, Q18(R), Q22, Q26, Q30(R) (8 questions)
/// - self_acceptance: Q3, Q7(R), Q11(R), Q15, Q19(R), Q23, Q27, Q31 (8 questions)
/// - initiative_resilience: Q4, Q8(R), Q12, Q16(R), Q20, Q24(R), Q28(R), Q32 (8 questions)
///
/// (R) = reversed question
class SelfConfidenceMultiscaleWeights {
  static final Map<String, QuestionWeight> weights = {
    // ============================================
    // GENERAL SELF-BELIEF (Q1, Q5, Q9, Q13, Q17, Q21, Q25, Q29)
    // ============================================

    // Q1: "В целом я считаю себя человеком, который справляется с большинством жизненных задач"
    'self_confidence_multiscale_v1:q1': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q1',
      axisWeights: {
        'self_efficacy': 1.0, // Core self-efficacy
        'self_esteem': 0.9, // Self-esteem
        'competence': 0.8, // Competence belief
        'environmental_mastery': 0.7, // Mastery
        'resilience_meta': 0.6, // General resilience
        'growth_mindset': 0.5, // Growth orientation
        // Bipolar: practical competence → Sensing
        'sensing': 0.3,
      },
    ),

    // Q5: "Когда передо мной стоит сложная задача, я обычно уверен(а), что найду способ"
    'self_confidence_multiscale_v1:q5': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q5',
      axisWeights: {
        'self_efficacy': 1.0,
        'problem_solving': 0.8,
        'competence': 0.7,
        'resilience_meta': 0.7,
        'cognitive_flexibility': 0.6,
        'stress_tolerance': 0.5,
        'positive_emotions': 0.6, // Optimism indicator
        // Bipolar: creative problem-solving → Intuition; open to possibilities → Perceiving
        'intuition': 0.4,
        'perceiving': 0.3,
      },
    ),

    // Q9: "Я доверяю своим решениям, даже если вокруг есть люди с другим мнением"
    'self_confidence_multiscale_v1:q9': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q9',
      axisWeights: {
        'self_efficacy': 0.9,
        'decisiveness': 0.8,
        'autonomy_need': 0.8,
        'self_direction': 0.7,
        'identity_clarity': 0.6,
        'authenticity': 0.6,
        'confidence_building': 0.7,
        // Bipolar: logical confidence in decisions → Thinking
        'thinking': 0.4,
      },
    ),

    // Q13: "Если я взял(а) на себя ответственность, я уверен(а), что доведу дело до конца"
    'self_confidence_multiscale_v1:q13': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q13',
      axisWeights: {
        'self_efficacy': 0.9,
        'responsibility': 0.9,
        'self_discipline': 0.8,
        'persistence': 0.8,
        'commitment': 0.7,
        'dutifulness': 0.6,
        'accountability': 0.7,
        // Bipolar: structured completion → Judging
        'judging': 0.5,
      },
    ),

    // Q17: "В неожиданных ситуациях я обычно сохраняю способность действовать и принимать решения"
    'self_confidence_multiscale_v1:q17': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q17',
      axisWeights: {
        'self_efficacy': 0.9,
        'stress_tolerance': 0.8,
        'decisiveness': 0.8,
        'composure': 0.7,
        'calmness': 0.6,
        'emotional_resilience': 0.7,
        'adaptability_leadership': 0.6,
        // Bipolar: rational under pressure → Thinking; adapts to change → Perceiving
        'thinking': 0.4,
        'perceiving': 0.4,
      },
    ),

    // Q21: "Я верю, что в долгосрочной перспективе могу реализовать свои цели"
    'self_confidence_multiscale_v1:q21': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q21',
      axisWeights: {
        'self_efficacy': 0.9,
        'achievement_motivation': 0.8,
        'meaning_purpose': 0.7,
        'ambition': 0.7,
        'persistence': 0.6,
        'growth_mindset': 0.7,
        'life_satisfaction': 0.5,
        // Bipolar: long-term vision → Intuition; goal-oriented structure → Judging
        'intuition': 0.4,
        'judging': 0.4,
      },
    ),

    // Q25: "В сложных обстоятельствах я могу опереться на себя и свои ресурсы"
    'self_confidence_multiscale_v1:q25': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q25',
      axisWeights: {
        'self_efficacy': 1.0,
        'autonomy_need': 0.8,
        'resilience_meta': 0.8,
        'environmental_mastery': 0.7,
        'problem_focused_coping': 0.6,
        'self_direction': 0.6,
        'competence': 0.7,
        // Bipolar: self-reliance, internal resources → Introversion; practical coping → Sensing
        'introversion': 0.3,
        'sensing': 0.3,
      },
    ),

    // Q29: "Я ощущаю, что в большинстве ситуаций способен(на) влиять на ход событий"
    'self_confidence_multiscale_v1:q29': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q29',
      axisWeights: {
        'self_efficacy': 1.0,
        'environmental_mastery': 0.9,
        'power_motivation': 0.6,
        'autonomy_need': 0.7,
        'decisiveness': 0.6,
        'self_direction': 0.6,
        'competence': 0.7,
        // Bipolar: active influence → Extraversion; structured control → Judging
        'extraversion': 0.4,
        'judging': 0.4,
      },
    ),

    // ============================================
    // SOCIAL ASSERTIVENESS (Q2, Q6(R), Q10(R), Q14, Q18(R), Q22, Q26, Q30(R))
    // ============================================

    // Q2: "Мне легко заговорить с незнакомым человеком, если это необходимо"
    'self_confidence_multiscale_v1:q2': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q2',
      axisWeights: {
        'assertiveness': 0.9,
        'social_boldness': 0.9,
        'social_confidence': 0.8,
        'warmth': 0.6,
        'gregariousness': 0.7,
        // Bipolar: social initiative → Extraversion (increased weight)
        'extraversion': 0.7,
      },
    ),

    // Q6: "Мне трудно отстоять свою точку зрения, если собеседник ведёт себя уверенно" (reversed)
    'self_confidence_multiscale_v1:q6': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q6',
      axisWeights: {
        'assertiveness': -0.9, // (reversed)
        'social_confidence': -0.8, // (reversed)
        'social_boldness': -0.7, // (reversed)
        'dominance': -0.6, // (reversed)
        'compliance': 0.6, // Direct - high compliance when agree
        'vulnerability': 0.5, // Direct - vulnerable when agree
        // Bipolar: difficulty asserting → Introversion; yielding to others → Feeling
        'introversion': 0.5,
        'feeling': 0.4,
      },
    ),

    // Q10: "В группе людей я обычно чувствую себя зажатым(ой) и неловким(ой)" (reversed)
    'self_confidence_multiscale_v1:q10': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q10',
      axisWeights: {
        'social_confidence': -1.0, // (reversed)
        'social_boldness': -0.8, // (reversed)
        'gregariousness': -0.7, // (reversed)
        'self_consciousness': 0.8, // Direct - high when agree
        'anxiety': 0.6, // Direct - social anxiety
        // Bipolar: social discomfort → Introversion (increased weight)
        'introversion': 0.7,
      },
    ),

    // Q14: "Я без особого напряжения прошу о помощи или поддержке, когда она мне нужна"
    'self_confidence_multiscale_v1:q14': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q14',
      axisWeights: {
        'assertiveness': 0.7,
        'social_support_seeking': 0.9,
        'trust': 0.7,
        'relatedness_need': 0.6,
        'vulnerability_sharing': 0.8,
        'social_confidence': 0.6,
        // Bipolar: comfortable seeking support → Extraversion; emotional openness → Feeling
        'extraversion': 0.5,
        'feeling': 0.5,
      },
    ),

    // Q18: "Мне трудно сказать «нет», даже когда просьба мне неудобна" (reversed)
    'self_confidence_multiscale_v1:q18': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q18',
      axisWeights: {
        'assertiveness': -0.9, // (reversed)
        'boundary_setting': -0.9, // (reversed)
        'autonomy_need': -0.7, // (reversed)
        'compliance': 0.7, // Direct - high compliance when agree
        'self_direction': -0.6, // (reversed)
        'modesty': 0.5, // Can be related
        // Bipolar: difficulty refusing → Feeling (prioritizes others' feelings)
        'feeling': 0.5,
      },
    ),

    // Q22: "Я спокойно высказываю своё мнение, даже если оно отличается от мнения большинства"
    'self_confidence_multiscale_v1:q22': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q22',
      axisWeights: {
        'assertiveness': 1.0,
        'social_boldness': 0.8,
        'autonomy_need': 0.7,
        'self_direction': 0.8,
        'authenticity': 0.7,
        'social_confidence': 0.7,
        'conformity': -0.6, // (reversed) - non-conformist
        // Bipolar: confident expression → Extraversion; independent thinking → Thinking
        'extraversion': 0.6,
        'thinking': 0.5,
      },
    ),

    // Q26: "Мне комфортно быть в центре внимания, когда я выступаю или делюсь своими идеями"
    'self_confidence_multiscale_v1:q26': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q26',
      axisWeights: {
        'social_boldness': 1.0,
        'social_confidence': 0.9,
        'assertiveness': 0.7,
        'expressiveness': 0.8,
        'self_consciousness': -0.6, // (reversed)
        // Bipolar: enjoys spotlight → Extraversion (strong indicator)
        'extraversion': 0.8,
      },
    ),

    // Q30: "В спорной ситуации я предпочитаю промолчать, даже если считаю себя правым(ой)" (reversed)
    'self_confidence_multiscale_v1:q30': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q30',
      axisWeights: {
        'assertiveness': -0.9, // (reversed)
        'social_boldness': -0.7, // (reversed)
        'social_confidence': -0.7, // (reversed)
        'conflict_management': -0.6, // (reversed)
        'avoidant_coping': 0.6, // Direct - avoidance when agree
        'compliance': 0.5, // Direct
        // Bipolar: avoids conflict → Introversion; harmony-seeking → Feeling
        'introversion': 0.5,
        'feeling': 0.4,
      },
    ),

    // ============================================
    // SELF-ACCEPTANCE (Q3, Q7(R), Q11(R), Q15, Q19(R), Q23, Q27, Q31)
    // ============================================

    // Q3: "Я принимаю свои недостатки и не обесцениваю себя из-за них"
    'self_confidence_multiscale_v1:q3': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q3',
      axisWeights: {
        'self_acceptance': 1.0,
        'self_compassion': 0.9,
        'self_esteem': 0.8,
        'emotional_resilience': 0.6,
        'acceptance': 0.7,
        'identity_clarity': 0.5,
        // Bipolar: emotional self-acceptance → Feeling; flexible self-view → Perceiving
        'feeling': 0.5,
        'perceiving': 0.3,
      },
    ),

    // Q7: "Я часто ругаю себя за промахи дольше, чем это действительно нужно" (reversed)
    'self_confidence_multiscale_v1:q7': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q7',
      axisWeights: {
        'self_compassion': -0.9, // (reversed)
        'self_acceptance': -0.8, // (reversed)
        'rumination': 0.8, // Direct - rumination when agree
        'self_esteem': -0.7, // (reversed)
        'perfectionism': 0.6, // Can be related
        'neuroticism': 0.5, // Direct
        // Bipolar: strict self-judgment → Judging; internal processing → Introversion
        'judging': 0.4,
        'introversion': 0.3,
      },
    ),

    // Q11: "Мне сложно сказать о себе что-то хорошее, не чувствуя неловкости" (reversed)
    'self_confidence_multiscale_v1:q11': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q11',
      axisWeights: {
        'self_acceptance': -0.9, // (reversed)
        'self_esteem': -0.8, // (reversed)
        'self_consciousness': 0.7, // Direct
        'modesty': 0.5, // Can be related
        'vulnerability': 0.5, // Direct
        'authenticity': -0.5, // (reversed)
        // Bipolar: uncomfortable with self-promotion → Introversion
        'introversion': 0.5,
      },
    ),

    // Q15: "Я считаю, что имею право на ошибки и не обязан(а) быть идеальным(ой)"
    'self_confidence_multiscale_v1:q15': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q15',
      axisWeights: {
        'self_acceptance': 1.0,
        'self_compassion': 0.9,
        'perfectionism': -0.7, // (reversed) - non-perfectionist
        'acceptance': 0.7,
        'growth_mindset': 0.6,
        'emotional_resilience': 0.5,
        // Bipolar: flexible about standards → Perceiving; values-based acceptance → Feeling
        'perceiving': 0.5,
        'feeling': 0.4,
      },
    ),

    // Q19: "Даже небольшие недостатки во внешности или характере сильно снижают мою самооценку" (reversed)
    'self_confidence_multiscale_v1:q19': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q19',
      axisWeights: {
        'self_acceptance': -1.0, // (reversed)
        'self_esteem': -0.9, // (reversed)
        'body_image': -0.7, // (reversed)
        'self_consciousness': 0.8, // Direct
        'perfectionism': 0.6, // Direct
        'vulnerability': 0.7, // Direct
        // Bipolar: sensitive to details/flaws → Sensing; strict standards → Judging
        'sensing': 0.4,
        'judging': 0.4,
      },
    ),

    // Q23: "Когда меня критикуют, я не обесцениваю себя целиком как личность"
    'self_confidence_multiscale_v1:q23': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q23',
      axisWeights: {
        'self_acceptance': 0.9,
        'emotional_resilience': 0.8,
        'self_esteem': 0.8,
        'self_compassion': 0.7,
        'identity_clarity': 0.6,
        'cognitive_reappraisal': 0.6,
        // Bipolar: logical separation of criticism from self-worth → Thinking
        'thinking': 0.5,
      },
    ),

    // Q27: "Я отношусь к себе скорее с пониманием и поддержкой, чем с критикой"
    'self_confidence_multiscale_v1:q27': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q27',
      axisWeights: {
        'self_compassion': 1.0,
        'self_acceptance': 0.9,
        'self_esteem': 0.7,
        'tender_mindedness': 0.5,
        'emotional_resilience': 0.5,
        'life_satisfaction': 0.5,
        // Bipolar: emotional self-support → Feeling
        'feeling': 0.6,
      },
    ),

    // Q31: "Мне удаётся сохранять уважение к себе, даже сталкиваясь с критикой или ошибками"
    'self_confidence_multiscale_v1:q31': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q31',
      axisWeights: {
        'self_acceptance': 0.9,
        'self_esteem': 0.9,
        'emotional_resilience': 0.8,
        'self_compassion': 0.7,
        'identity_clarity': 0.6,
        'composure': 0.5,
        // Bipolar: stable self-view under pressure → Thinking (objectivity)
        'thinking': 0.4,
      },
    ),

    // ============================================
    // INITIATIVE AND RESILIENCE (Q4, Q8(R), Q12, Q16(R), Q20, Q24(R), Q28(R), Q32)
    // ============================================

    // Q4: "Я лучше действую, чем долго сомневаюсь и откладываю решения"
    'self_confidence_multiscale_v1:q4': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q4',
      axisWeights: {
        'decisiveness': 0.9,
        'activity': 0.8,
        'procrastination': -0.8, // (reversed)
        'self_efficacy': 0.7,
        'impulsiveness': 0.4, // Can be slightly related
        // Bipolar: quick decisions → Judging (strong); action-oriented → Extraversion
        'judging': 0.6,
        'extraversion': 0.4,
      },
    ),

    // Q8: "После неудачи мне требуется много времени, чтобы снова решиться действовать" (reversed)
    'self_confidence_multiscale_v1:q8': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q8',
      axisWeights: {
        'resilience_meta': -0.9, // (reversed)
        'persistence': -0.8, // (reversed)
        'emotional_resilience': -0.7, // (reversed)
        'harm_avoidance': 0.6, // Direct
        'rumination': 0.6, // Direct
        'stress_tolerance': -0.6, // (reversed)
        // Bipolar: slow recovery → Introversion (needs time to process internally)
        'introversion': 0.4,
      },
    ),

    // Q12: "Столкнувшись с трудностями, я скорее продолжаю пробовать, чем сдаюсь"
    'self_confidence_multiscale_v1:q12': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q12',
      axisWeights: {
        'persistence': 1.0,
        'resilience_meta': 0.9,
        'self_efficacy': 0.7,
        'achievement_striving': 0.7,
        'growth_mindset': 0.6,
        'drive_for_excellence': 0.6,
        // Bipolar: determined completion → Judging
        'judging': 0.5,
      },
    ),

    // Q16: "Когда появляется возможность чего-то нового, я часто отказываюсь из-за страха не справиться" (reversed)
    'self_confidence_multiscale_v1:q16': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q16',
      axisWeights: {
        'self_efficacy': -0.9, // (reversed)
        'risk_taking': -0.7, // (reversed)
        'novelty_seeking': -0.6, // (reversed)
        'harm_avoidance': 0.7, // Direct
        'avoidant_coping': 0.6, // Direct
        'anxiety': 0.6, // Direct
        // Bipolar: prefers familiar → Sensing; avoids novelty → Judging
        'sensing': 0.4,
        'judging': 0.3,
      },
    ),

    // Q20: "Если что-то не получилось с первого раза, я воспринимаю это как полезный опыт"
    'self_confidence_multiscale_v1:q20': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q20',
      axisWeights: {
        'growth_mindset': 1.0,
        'resilience_meta': 0.8,
        'cognitive_reappraisal': 0.8,
        'learning_ability': 0.6,
        'acceptance': 0.6,
        'positive_emotions': 0.5,
        // Bipolar: sees patterns/possibilities → Intuition; flexible approach → Perceiving
        'intuition': 0.5,
        'perceiving': 0.5,
      },
    ),

    // Q24: "Я часто отказываюсь от инициативы, потому что боюсь выглядеть глупо" (reversed)
    'self_confidence_multiscale_v1:q24': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q24',
      axisWeights: {
        'social_boldness': -0.8, // (reversed)
        'assertiveness': -0.7, // (reversed)
        'self_consciousness': 0.8, // Direct
        'social_confidence': -0.7, // (reversed)
        'avoidant_coping': 0.6, // Direct
        'anxiety': 0.5, // Direct - social anxiety
        // Bipolar: avoids social exposure → Introversion
        'introversion': 0.6,
      },
    ),

    // Q28: "Если меня подводит результат, я надолго застреваю в мыслях о своём поражении" (reversed)
    'self_confidence_multiscale_v1:q28': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q28',
      axisWeights: {
        'resilience_meta': -0.9, // (reversed)
        'emotional_resilience': -0.8, // (reversed)
        'rumination': 0.9, // Direct
        'stress_tolerance': -0.6, // (reversed)
        'acceptance': -0.6, // (reversed)
        'neuroticism': 0.6, // Direct
        // Bipolar: internal emotional processing → Introversion; Feeling
        'introversion': 0.4,
        'feeling': 0.4,
      },
    ),

    // Q32: "Если план А не срабатывает, я способен(на) перейти к плану Б или придумать новый подход"
    'self_confidence_multiscale_v1:q32': const QuestionWeight(
      testId: 'self_confidence_multiscale_v1',
      questionId: 'q32',
      axisWeights: {
        'cognitive_flexibility': 1.0,
        'problem_solving': 0.9,
        'resilience_meta': 0.8,
        'adaptability_leadership': 0.7,
        'divergent_thinking': 0.6,
        'self_efficacy': 0.7,
        // Bipolar: creative alternatives → Intuition; flexible adaptation → Perceiving
        'intuition': 0.6,
        'perceiving': 0.6,
      },
    ),
  };
}
