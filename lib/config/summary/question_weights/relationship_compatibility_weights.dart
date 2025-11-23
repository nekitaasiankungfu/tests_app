import 'question_weight_models.dart';

/// Weights for Relationship Compatibility Test
///
/// Maps 24 questions to 195 psychological scales + 8 bipolar poles.
///
/// 6 factors:
/// - emotional_connection (q1, q4, q7, q10)
/// - communication_style (q2, q5, q8[R], q11)
/// - values_alignment (q3, q6, q9, q12)
/// - relationship_expectations (q13, q14, q15, q16)
/// - conflict_management (q17, q18[R], q19, q20[R])
/// - intimacy_and_romance (q21, q22, q23, q24)
///
/// [R] = reversed question (negative weights on positive scales)
class RelationshipCompatibilityWeights {
  static final Map<String, QuestionWeight> weights = {
    // ===== EMOTIONAL CONNECTION (q1, q4, q7, q10) =====

    // Q1: Мне важно чувствовать эмоциональную поддержку от партнёра
    'relationship_compatibility_v1:q1': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q1',
      axisWeights: {
        'trust_in_relationships': 0.9,
        'emotional_intimacy': 0.9,
        'support_giving': 0.7,
        'warmth': 0.6,
        'empathy': 0.5,
        'feeling': 0.3,  // Personality type - feeling pole
      },
    ),

    // Q4: Я быстро привязываюсь к человеку, если чувствую тепло и заботу
    'relationship_compatibility_v1:q4': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q4',
      axisWeights: {
        'trust_in_relationships': 0.8,
        'warmth': 0.8,
        'emotional_intimacy': 0.7,
        'attachment_security': 0.6,
        'feeling': 0.3,
        'openness': 0.4,
      },
    ),

    // Q7: Я чувствую себя ближе к человеку, когда он делится переживаниями
    'relationship_compatibility_v1:q7': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q7',
      axisWeights: {
        'empathy': 0.9,
        'emotional_intimacy': 0.8,
        'trust_in_relationships': 0.7,
        'intimacy_comfort': 0.6,
        'warmth': 0.5,
        'feeling': 0.3,
      },
    ),

    // Q10: Я стремлюсь поддерживать партнёра эмоционально даже в мелочах
    'relationship_compatibility_v1:q10': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q10',
      axisWeights: {
        'support_giving': 0.9,
        'empathy': 0.8,
        'warmth': 0.7,
        'emotional_intimacy': 0.6,
        'nurturance': 0.5,
        'feeling': 0.3,
      },
    ),

    // ===== COMMUNICATION STYLE (q2, q5, q8[R], q11) =====

    // Q2: Мне легко говорить о своих потребностях партнёру
    'relationship_compatibility_v1:q2': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q2',
      axisWeights: {
        'communication_quality': 0.9,
        'assertiveness': 0.8,
        'verbal_communication': 0.7,
        'social_confidence': 0.6,
        'self_consciousness': -0.5,  // reversed - less self-conscious
        'extraversion': 0.4,
      },
    ),

    // Q5: В конфликте я стараюсь объяснить, что чувствую и почему
    'relationship_compatibility_v1:q5': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q5',
      axisWeights: {
        'communication_quality': 0.9,
        'conflict_resolution': 0.8,
        'verbal_communication': 0.7,
        'assertiveness': 0.6,
        'emotional_resilience': 0.5,
        'feeling': 0.3,
      },
    ),

    // Q8: Мне сложно открыто говорить, что меня тревожит (REVERSED)
    // High agreement = lower communication quality
    'relationship_compatibility_v1:q8': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q8',
      axisWeights: {
        'communication_quality': -0.9,  // reversed
        'assertiveness': -0.8,  // reversed
        'verbal_communication': -0.7,  // reversed
        'social_confidence': -0.6,  // reversed
        'self_consciousness': 0.6,  // high agreement = more self-conscious
        'anxiety': 0.5,  // high agreement = more anxiety
        'introversion': 0.4,
      },
    ),

    // Q11: Я умею слушать и не перебивать
    'relationship_compatibility_v1:q11': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q11',
      axisWeights: {
        'communication_quality': 0.9,
        'empathy': 0.7,
        'patience': 0.8,
        'impulsiveness': -0.6,  // low impulsiveness
        'composure': 0.6,
        'conflict_resolution': 0.5,
      },
    ),

    // ===== VALUES ALIGNMENT (q3, q6, q9, q12) =====

    // Q3: Наши ценности — ключевой элемент совместимости
    'relationship_compatibility_v1:q3': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q3',
      axisWeights: {
        'commitment': 0.8,
        'conscientiousness': 0.7,
        'values_ethics': 0.9,
        'trust_in_relationships': 0.6,
        'judging': 0.4,
      },
    ),

    // Q6: Для гармонии важно совпадать во взглядах на семью, работу и будущее
    'relationship_compatibility_v1:q6': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q6',
      axisWeights: {
        'commitment': 0.9,
        'values_ethics': 0.8,
        'conscientiousness': 0.7,
        'future_orientation': 0.6,
        'judging': 0.4,
      },
    ),

    // Q9: Мне важно, чтобы партнёр разделял мои жизненные приоритеты
    'relationship_compatibility_v1:q9': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q9',
      axisWeights: {
        'commitment': 0.9,
        'values_ethics': 0.8,
        'trust_in_relationships': 0.7,
        'conscientiousness': 0.5,
        'judging': 0.3,
      },
    ),

    // Q12: Ценности оказывают влияние на то, насколько я сближаюсь с человеком
    'relationship_compatibility_v1:q12': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q12',
      axisWeights: {
        'values_ethics': 0.9,
        'commitment': 0.8,
        'conscientiousness': 0.6,
        'trust': 0.5,
        'judging': 0.3,
      },
    ),

    // ===== RELATIONSHIP EXPECTATIONS (q13, q14, q15, q16) =====

    // Q13: Я ожидаю, что партнёр будет инициативным в развитии отношений
    'relationship_compatibility_v1:q13': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q13',
      axisWeights: {
        'commitment': 0.7,
        'activity': 0.6,
        'relationship_satisfaction': 0.5,
        'assertiveness': 0.4,
      },
    ),

    // Q14: Я предпочитаю отношения, где каждый сохраняет личное пространство
    'relationship_compatibility_v1:q14': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q14',
      axisWeights: {
        'independence': 0.9,
        'autonomy': 0.9,
        'self_sufficiency': 0.7,
        'introversion': 0.5,
        'attachment_security': 0.4,
      },
    ),

    // Q15: Мне важно, чтобы отношения развивались равномерно и предсказуемо
    'relationship_compatibility_v1:q15': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q15',
      axisWeights: {
        'need_for_stability': 0.9,
        'need_for_security': 0.8,
        'predictability': 0.8,
        'judging': 0.5,
        'anxiety': 0.3,  // slight correlation
      },
    ),

    // Q16: Я ожидаю много романтики и эмоциональных жестов
    'relationship_compatibility_v1:q16': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q16',
      axisWeights: {
        'physical_intimacy': 0.8,
        'emotional_intimacy': 0.7,
        'expressiveness': 0.7,
        'positive_emotions': 0.6,
        'feeling': 0.4,
      },
    ),

    // ===== CONFLICT MANAGEMENT (q17, q18[R], q19, q20[R]) =====

    // Q17: В конфликте я стараюсь искать компромисс и спокойное обсуждение
    'relationship_compatibility_v1:q17': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q17',
      axisWeights: {
        'conflict_resolution': 0.9,
        'conflict_management': 0.9,
        'composure': 0.8,
        'cooperation': 0.7,
        'emotional_resilience': 0.6,
        'calmness': 0.5,
      },
    ),

    // Q18: Когда конфликт становится сильным, я предпочитаю отдалиться (REVERSED)
    // High agreement = avoidant behavior = lower conflict resolution skills
    'relationship_compatibility_v1:q18': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q18',
      axisWeights: {
        'conflict_resolution': -0.8,  // reversed
        'conflict_management': -0.8,  // reversed
        'conflict_avoidance': 0.9,  // positive - avoiding is conflict avoidance
        'assertiveness': -0.6,  // reversed
        'anxiety': 0.5,  // avoidance linked to anxiety
        'introversion': 0.4,
      },
    ),

    // Q19: Во время разногласий мне важно быть услышанным
    'relationship_compatibility_v1:q19': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q19',
      axisWeights: {
        'assertiveness': 0.8,
        'communication_quality': 0.7,
        'conflict_resolution': 0.6,
        'self_esteem': 0.5,
        'verbal_communication': 0.6,
      },
    ),

    // Q20: Я могу резко реагировать, если чувствую несправедливость (REVERSED)
    // High agreement = poor emotional control = lower conflict management
    'relationship_compatibility_v1:q20': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q20',
      axisWeights: {
        'conflict_resolution': -0.7,  // reversed
        'composure': -0.8,  // reversed
        'impulsiveness': 0.8,  // high impulsiveness
        'emotional_reactivity': 0.7,  // high reactivity
        'anger': 0.6,  // higher anger
        'calmness': -0.6,  // reversed
      },
    ),

    // ===== INTIMACY AND ROMANCE (q21, q22, q23, q24) =====

    // Q21: Мне важна тактильность в отношениях
    'relationship_compatibility_v1:q21': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q21',
      axisWeights: {
        'physical_intimacy': 0.9,
        'intimacy_comfort': 0.8,
        'warmth': 0.7,
        'emotional_intimacy': 0.5,
        'expressiveness': 0.5,
        'feeling': 0.3,
      },
    ),

    // Q22: Романтические жесты помогают мне чувствовать связь с партнёром
    'relationship_compatibility_v1:q22': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q22',
      axisWeights: {
        'emotional_intimacy': 0.9,
        'physical_intimacy': 0.7,
        'warmth': 0.6,
        'positive_emotions': 0.6,
        'expressiveness': 0.5,
        'feeling': 0.4,
      },
    ),

    // Q23: Я воспринимаю романтику как важную часть отношений
    'relationship_compatibility_v1:q23': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q23',
      axisWeights: {
        'emotional_intimacy': 0.8,
        'physical_intimacy': 0.7,
        'commitment': 0.6,
        'positive_emotions': 0.6,
        'expressiveness': 0.5,
        'feeling': 0.4,
      },
    ),

    // Q24: Я чувствую себя ближе к партнёру через совместные тёплые жесты
    'relationship_compatibility_v1:q24': QuestionWeight(
      testId: 'relationship_compatibility_v1',
      questionId: 'q24',
      axisWeights: {
        'physical_intimacy': 0.9,
        'emotional_intimacy': 0.8,
        'warmth': 0.8,
        'intimacy_comfort': 0.7,
        'trust_in_relationships': 0.5,
        'feeling': 0.3,
      },
    ),
  };
}
