import 'question_weight_models.dart';

/// Weights for Friendship Psychology Test
///
/// Maps 24 questions to 195 psychological scales + 8 bipolar poles.
///
/// 6 factors:
/// - emotional_closeness (q1, q4, q7[R], q10)
/// - communication_style (q2, q5, q8[R], q11)
/// - trust_and_loyalty (q3, q6, q9[R], q12)
/// - boundaries_and_space (q13, q14, q15[R], q16)
/// - supportive_behavior (q17, q18, q19[R], q20)
/// - friendship_expectations (q21, q22, q23[R], q24)
///
/// [R] = reversed question (negative weights on positive scales)
class FriendshipPsychologyWeights {
  static final Map<String, QuestionWeight> weights = {
    // ===== EMOTIONAL CLOSENESS (q1, q4, q7[R], q10) =====

    // Q1: Мне легко делиться переживаниями с близким другом
    'friendship_psychology_v1:q1': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q1',
      axisWeights: {
        'emotional_intimacy': 0.9,
        'trust_in_relationships': 0.8,
        'emotional_openness': 0.9,
        'vulnerability_sharing': 0.7,
        'warmth': 0.6,
        'feeling': 0.3, // Personality type - feeling pole
        'extraversion': 0.3,
      },
    ),

    // Q4: Когда у меня проблемы, я обычно рассказываю об этом друзьям
    'friendship_psychology_v1:q4': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q4',
      axisWeights: {
        'emotional_openness': 0.9,
        'trust_in_relationships': 0.8,
        'emotional_intimacy': 0.7,
        'support_giving': 0.5,
        'warmth': 0.6,
        'extraversion': 0.4,
        'feeling': 0.3,
      },
    ),

    // Q7: Мне сложно эмоционально сблизиться с кем-либо (REVERSED)
    'friendship_psychology_v1:q7': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q7',
      axisWeights: {
        'emotional_intimacy': -0.9, // reversed
        'trust_in_relationships': -0.8, // reversed
        'emotional_openness': -0.8, // reversed
        'avoidant_attachment': 0.7, // high agreement = avoidant
        'intimacy_comfort': -0.7, // reversed
        'introversion': 0.4,
        'vulnerability': 0.5,
      },
    ),

    // Q10: Я ценю глубокие разговоры и эмоциональную поддержку в дружбе
    'friendship_psychology_v1:q10': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q10',
      axisWeights: {
        'emotional_intimacy': 0.9,
        'warmth': 0.8,
        'support_giving': 0.7,
        'empathy': 0.7,
        'emotional_openness': 0.6,
        'feeling': 0.4,
      },
    ),

    // ===== COMMUNICATION STYLE (q2, q5, q8[R], q11) =====

    // Q2: Мне легко говорить о том, что мне нравится или не нравится в общении
    'friendship_psychology_v1:q2': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q2',
      axisWeights: {
        'communication_quality': 0.9,
        'assertiveness': 0.8,
        'social_confidence': 0.7,
        'straightforwardness': 0.7,
        'self_consciousness': -0.5, // reversed - less self-conscious
        'extraversion': 0.4,
      },
    ),

    // Q5: В конфликте я стараюсь объяснить свою позицию спокойно
    'friendship_psychology_v1:q5': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q5',
      axisWeights: {
        'conflict_resolution': 0.9,
        'communication_quality': 0.8,
        'composure': 0.8,
        'emotional_resilience': 0.7,
        'assertiveness': 0.6,
        'calmness': 0.6,
        'thinking': 0.3, // Personality type
      },
    ),

    // Q8: Мне трудно говорить о том, что меня задевает (REVERSED)
    'friendship_psychology_v1:q8': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q8',
      axisWeights: {
        'communication_quality': -0.9, // reversed
        'assertiveness': -0.8, // reversed
        'social_confidence': -0.7, // reversed
        'self_consciousness': 0.7, // high agreement = more self-conscious
        'vulnerability_sharing': -0.6, // reversed
        'anxiety': 0.5,
        'introversion': 0.4,
      },
    ),

    // Q11: Я умею слушать и понимать чувства другого человека
    'friendship_psychology_v1:q11': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q11',
      axisWeights: {
        'empathy': 0.9,
        'communication_quality': 0.8,
        'compassion': 0.7,
        'warmth': 0.6,
        'patience': 0.6,
        'feeling': 0.4,
      },
    ),

    // ===== TRUST AND LOYALTY (q3, q6, q9[R], q12) =====

    // Q3: Если я что-то пообещал другу, я обязательно выполню
    'friendship_psychology_v1:q3': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q3',
      axisWeights: {
        'loyalty': 0.9,
        'dependability': 0.9,
        'dutifulness': 0.8,
        'responsibility': 0.8,
        'commitment': 0.7,
        'conscientiousness': 0.6,
        'judging': 0.3, // Personality type
      },
    ),

    // Q6: Я считаю, что дружба невозможна без полного доверия
    'friendship_psychology_v1:q6': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q6',
      axisWeights: {
        'trust': 0.9,
        'trust_in_relationships': 0.9,
        'loyalty': 0.7,
        'commitment': 0.6,
        'relationship_security': 0.5,
        'feeling': 0.3,
      },
    ),

    // Q9: Мне трудно полностью довериться даже близкому другу (REVERSED)
    'friendship_psychology_v1:q9': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q9',
      axisWeights: {
        'trust': -0.9, // reversed
        'trust_in_relationships': -0.9, // reversed
        'avoidant_attachment': 0.7, // high agreement = avoidant
        'fear_of_abandonment': 0.5,
        'vulnerability': 0.6,
        'anxiety': 0.5,
      },
    ),

    // Q12: Я могу положиться на друзей, и они — на меня
    'friendship_psychology_v1:q12': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q12',
      axisWeights: {
        'trust_in_relationships': 0.9,
        'dependability': 0.8,
        'loyalty': 0.8,
        'support_giving': 0.7,
        'secure_attachment': 0.6,
        'relationship_security': 0.5,
      },
    ),

    // ===== BOUNDARIES AND SPACE (q13, q14, q15[R], q16) =====

    // Q13: Мне важно, чтобы друзья уважали моё личное пространство
    'friendship_psychology_v1:q13': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q13',
      axisWeights: {
        'autonomy_need': 0.9,
        'assertiveness': 0.6,
        'independence': 0.7,
        'self_consciousness': 0.4,
        'introversion': 0.4,
      },
    ),

    // Q14: Я стараюсь уважать границы других людей
    'friendship_psychology_v1:q14': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q14',
      axisWeights: {
        'politeness': 0.8,
        'compliance': 0.6,
        'empathy': 0.7,
        'tender_mindedness': 0.6,
        'conscientiousness': 0.5,
        'modesty': 0.5,
        'feeling': 0.3,
      },
    ),

    // Q15: Когда друг слишком навязчив, мне сложно об этом сказать (REVERSED)
    'friendship_psychology_v1:q15': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q15',
      axisWeights: {
        'assertiveness': -0.9, // reversed
        'social_confidence': -0.7, // reversed
        'self_consciousness': 0.7, // high agreement = more self-conscious
        'compliance': 0.6, // high agreement = too compliant
        'anxiety': 0.5,
        'introversion': 0.4,
      },
    ),

    // Q16: В дружбе важно сохранять баланс близости и автономии
    'friendship_psychology_v1:q16': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q16',
      axisWeights: {
        'autonomy_need': 0.8,
        'emotional_resilience': 0.6,
        'secure_attachment': 0.6,
        'deliberation': 0.5,
        'thinking': 0.3, // Personality type
      },
    ),

    // ===== SUPPORTIVE BEHAVIOR (q17, q18, q19[R], q20) =====

    // Q17: Я стараюсь поддерживать друзей в трудные моменты
    'friendship_psychology_v1:q17': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q17',
      axisWeights: {
        'support_giving': 0.9,
        'altruism': 0.9,
        'empathy': 0.8,
        'warmth': 0.7,
        'nurturance': 0.7,
        'compassion': 0.6,
        'feeling': 0.4,
      },
    ),

    // Q18: Когда у друга проблемы, я стараюсь помочь, насколько могу
    'friendship_psychology_v1:q18': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q18',
      axisWeights: {
        'support_giving': 0.9,
        'altruism': 0.8,
        'nurturance': 0.8,
        'empathy': 0.7,
        'dependability': 0.6,
        'warmth': 0.5,
        'feeling': 0.3,
      },
    ),

    // Q19: Я редко проявляю инициативу, чтобы поддержать друга (REVERSED)
    'friendship_psychology_v1:q19': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q19',
      axisWeights: {
        'support_giving': -0.9, // reversed
        'altruism': -0.8, // reversed
        'nurturance': -0.7, // reversed
        'activity': -0.5, // reversed - less active
        'social_confidence': -0.4, // reversed
        'introversion': 0.4,
      },
    ),

    // Q20: Я умею заметить, когда другу нужна помощь
    'friendship_psychology_v1:q20': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q20',
      axisWeights: {
        'empathy': 0.9,
        'support_giving': 0.8,
        'emotional_openness': 0.6,
        'warmth': 0.6,
        'compassion': 0.7,
        'intuition': 0.5, // Personality type
        'feeling': 0.4,
      },
    ),

    // ===== FRIENDSHIP EXPECTATIONS (q21, q22, q23[R], q24) =====

    // Q21: Я ожидаю, что друзья будут рядом, когда мне плохо
    'friendship_psychology_v1:q21': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q21',
      axisWeights: {
        'support_giving': 0.7,
        'trust_in_relationships': 0.7,
        'emotional_intimacy': 0.6,
        'anxious_attachment': 0.4, // may indicate some dependency
        'feeling': 0.3,
      },
    ),

    // Q22: Мне важно, чтобы друг уважал мои приоритеты и цели
    'friendship_psychology_v1:q22': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q22',
      axisWeights: {
        'autonomy_need': 0.7,
        'achievement_striving': 0.6,
        'assertiveness': 0.5,
        'commitment': 0.5,
        'conscientiousness': 0.4,
        'judging': 0.3, // Personality type
      },
    ),

    // Q23: Я считаю, что друзья должны общаться каждый день (REVERSED)
    // High agreement indicates unrealistic expectations
    'friendship_psychology_v1:q23': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q23',
      axisWeights: {
        'anxious_attachment': 0.7, // high agreement = anxious
        'autonomy_need': -0.6, // high agreement = low autonomy need
        'secure_attachment': -0.5, // high agreement = less secure
        'fear_of_abandonment': 0.5, // high agreement = more fear
        'extraversion': 0.4,
      },
    ),

    // Q24: Для меня дружба — это взаимность, а не обязанность
    'friendship_psychology_v1:q24': QuestionWeight(
      testId: 'friendship_psychology_v1',
      questionId: 'q24',
      axisWeights: {
        'secure_attachment': 0.7,
        'autonomy_need': 0.6,
        'emotional_resilience': 0.5,
        'trust_in_relationships': 0.5,
        'relationship_security': 0.4,
        'perceiving': 0.3, // Personality type - flexibility
      },
    ),
  };
}
