import 'question_weight_models.dart';

/// Веса вопросов для теста "Личные границы и People-Pleasing"
///
/// Маппинг 48 вопросов на ~195 психологических шкал.
/// Тест измеряет 6 факторов:
/// - assertiveness (Q1-8, reversed: 2,4,6,8)
/// - self_prioritization (Q9-16, reversed: 10,12,14,16)
/// - emotional_autonomy (Q17-24, reversed: 18,20,22,24)
/// - people_pleasing (Q25-32, все прямые)
/// - fear_of_rejection (Q33-40, все прямые)
/// - boundary_clarity (Q41-48, reversed: 42,44,46,48)
///
/// Scoring: 0-4 (Никогда-Редко-Иногда-Часто-Всегда)
/// Reversed questions: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 42, 44, 46, 48]
const Map<String, QuestionWeight> boundariesPeoplePleasingWeights = {
  // ============================================================================
  // ШКАЛА 1: Ассертивность (Q1-8)
  // ============================================================================

  // Q1: Я легко выражаю свои потребности и желания.
  'boundaries_people_pleasing:q1': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q1',
    axisWeights: {
      'assertiveness': 1.0,
      'confidence': 0.9,
      'self_expression': 0.9,
      'emotional_openness': 0.8,
      'directness': 0.8,
      'self_advocacy': 0.9,
      'communication_skills': 0.8,
      'social_boldness': 0.7,
      'passivity': -0.9,
      'submissiveness': -0.8,
    },
  ),

  // Q2: Мне сложно высказывать несогласие с чужим мнением. (REVERSED)
  'boundaries_people_pleasing:q2': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q2',
    axisWeights: {
      'assertiveness': -0.9,
      'conflict_avoidance': 0.9,
      'passivity': 0.8,
      'submissiveness': 0.8,
      'people_pleasing': 0.7,
      'fear_of_conflict': 0.8,
      'courage': -0.7,
      'independence': -0.7,
    },
  ),

  // Q3: Я могу настоять на своём, даже если это вызывает напряжение.
  'boundaries_people_pleasing:q3': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q3',
    axisWeights: {
      'assertiveness': 1.0,
      'courage': 0.9,
      'persistence': 0.9,
      'conflict_tolerance': 0.8,
      'strength': 0.8,
      'resilience': 0.7,
      'conflict_avoidance': -0.9,
      'submissiveness': -0.8,
    },
  ),

  // Q4: Я избегаю конфликтов, даже когда мои права нарушены. (REVERSED)
  'boundaries_people_pleasing:q4': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q4',
    axisWeights: {
      'assertiveness': -1.0,
      'conflict_avoidance': 1.0,
      'passivity': 0.9,
      'self_advocacy': -0.9,
      'courage': -0.8,
      'submissiveness': 0.8,
      'fear_of_conflict': 0.8,
    },
  ),

  // Q5: Я уверенно говорю «нет», когда что-то не подходит мне.
  'boundaries_people_pleasing:q5': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q5',
    axisWeights: {
      'assertiveness': 1.0,
      'boundary_setting': 1.0,
      'confidence': 0.9,
      'self_respect': 0.9,
      'autonomy': 0.8,
      'directness': 0.8,
      'people_pleasing': -0.9,
      'submissiveness': -0.8,
    },
  ),

  // Q6: Мне трудно отказать людям, даже если мне неудобно. (REVERSED)
  'boundaries_people_pleasing:q6': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q6',
    axisWeights: {
      'assertiveness': -0.9,
      'people_pleasing': 1.0,
      'boundary_setting': -1.0,
      'submissiveness': 0.8,
      'fear_of_rejection': 0.7,
      'self_prioritization': -0.8,
      'guilt_proneness': 0.7,
    },
  ),

  // Q7: Я защищаю свои границы, не чувствуя вины.
  'boundaries_people_pleasing:q7': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q7',
    axisWeights: {
      'assertiveness': 1.0,
      'boundary_setting': 1.0,
      'self_respect': 0.9,
      'guilt_freedom': 0.9,
      'emotional_resilience': 0.8,
      'self_advocacy': 0.9,
      'guilt_proneness': -0.9,
      'people_pleasing': -0.8,
    },
  ),

  // Q8: Я чувствую себя неуютно, когда приходится отстаивать своё мнение. (REVERSED)
  'boundaries_people_pleasing:q8': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q8',
    axisWeights: {
      'assertiveness': -0.9,
      'anxiety': 0.8,
      'social_anxiety': 0.8,
      'confidence': -0.8,
      'conflict_avoidance': 0.8,
      'courage': -0.7,
      'self_doubt': 0.7,
    },
  ),

  // ============================================================================
  // ШКАЛА 2: Приоритет своих потребностей (Q9-16)
  // ============================================================================

  // Q9: Я забочусь о своих потребностях так же, как о потребностях других.
  'boundaries_people_pleasing:q9': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q9',
    axisWeights: {
      'self_prioritization': 1.0,
      'self_care': 1.0,
      'balance': 0.9,
      'self_respect': 0.9,
      'healthy_boundaries': 0.9,
      'self_advocacy': 0.8,
      'selflessness': -0.8,
      'self_sacrifice': -0.8,
    },
  ),

  // Q10: Я жертвую своими интересами ради других. (REVERSED)
  'boundaries_people_pleasing:q10': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q10',
    axisWeights: {
      'self_prioritization': -1.0,
      'self_sacrifice': 1.0,
      'people_pleasing': 0.9,
      'selflessness': 0.9,
      'self_care': -0.9,
      'codependency': 0.8,
      'martyrdom': 0.8,
    },
  ),

  // Q11: Я уделяю время себе, не чувствуя вины.
  'boundaries_people_pleasing:q11': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q11',
    axisWeights: {
      'self_prioritization': 1.0,
      'self_care': 1.0,
      'guilt_freedom': 0.9,
      'self_respect': 0.9,
      'healthy_selfishness': 0.8,
      'balance': 0.8,
      'guilt_proneness': -0.9,
      'self_sacrifice': -0.8,
    },
  ),

  // Q12: Мне кажется эгоистичным ставить свои нужды на первое место. (REVERSED)
  'boundaries_people_pleasing:q12': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q12',
    axisWeights: {
      'self_prioritization': -0.9,
      'guilt_proneness': 1.0,
      'self_sacrifice': 0.9,
      'people_pleasing': 0.8,
      'self_care': -0.9,
      'healthy_selfishness': -0.9,
      'martyrdom': 0.7,
    },
  ),

  // Q13: Я позволяю себе отдыхать, когда чувствую усталость.
  'boundaries_people_pleasing:q13': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q13',
    axisWeights: {
      'self_prioritization': 1.0,
      'self_care': 1.0,
      'self_awareness': 0.9,
      'healthy_boundaries': 0.9,
      'rest_priority': 0.9,
      'burnout_resistance': 0.8,
      'overwork_tendency': -0.8,
      'self_sacrifice': -0.7,
    },
  ),

  // Q14: Я чувствую себя обязанным помогать всем, кто просит. (REVERSED)
  'boundaries_people_pleasing:q14': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q14',
    axisWeights: {
      'self_prioritization': -0.9,
      'people_pleasing': 1.0,
      'overresponsibility': 0.9,
      'codependency': 0.9,
      'boundary_setting': -0.9,
      'self_sacrifice': 0.8,
      'guilt_proneness': 0.7,
    },
  ),

  // Q15: Я принимаю решения исходя из своих ценностей, а не ожиданий других.
  'boundaries_people_pleasing:q15': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q15',
    axisWeights: {
      'self_prioritization': 1.0,
      'autonomy': 1.0,
      'authenticity': 0.9,
      'independence': 0.9,
      'self_integrity': 0.9,
      'value_alignment': 0.9,
      'conformity': -0.9,
      'people_pleasing': -0.8,
    },
  ),

  // Q16: Я откладываю свои дела ради просьб других людей. (REVERSED)
  'boundaries_people_pleasing:q16': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q16',
    axisWeights: {
      'self_prioritization': -1.0,
      'people_pleasing': 0.9,
      'boundary_setting': -0.9,
      'self_sacrifice': 0.8,
      'time_management': -0.7,
      'assertiveness': -0.7,
      'overresponsibility': 0.8,
    },
  ),

  // ============================================================================
  // ШКАЛА 3: Эмоциональная автономия (Q17-24)
  // ============================================================================

  // Q17: Я могу сохранять спокойствие, даже если кто-то недоволен мной.
  'boundaries_people_pleasing:q17': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q17',
    axisWeights: {
      'emotional_autonomy': 1.0,
      'emotional_resilience': 0.9,
      'calmness': 0.9,
      'emotional_stability': 0.9,
      'self_confidence': 0.8,
      'independence': 0.8,
      'approval_seeking': -0.9,
      'anxiety': -0.7,
    },
  ),

  // Q18: Я сильно переживаю, если чувствую, что разочаровал кого-то. (REVERSED)
  'boundaries_people_pleasing:q18': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q18',
    axisWeights: {
      'emotional_autonomy': -0.9,
      'guilt_proneness': 1.0,
      'approval_seeking': 0.9,
      'people_pleasing': 0.8,
      'anxiety': 0.8,
      'emotional_resilience': -0.8,
      'self_compassion': -0.7,
    },
  ),

  // Q19: Моё настроение не зависит от одобрения или критики других.
  'boundaries_people_pleasing:q19': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q19',
    axisWeights: {
      'emotional_autonomy': 1.0,
      'emotional_stability': 1.0,
      'independence': 0.9,
      'self_confidence': 0.9,
      'resilience': 0.8,
      'approval_seeking': -1.0,
      'external_validation': -0.9,
      'vulnerability': -0.7,
    },
  ),

  // Q20: Я болезненно реагирую на критику в свой адрес. (REVERSED)
  'boundaries_people_pleasing:q20': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q20',
    axisWeights: {
      'emotional_autonomy': -0.9,
      'sensitivity': 0.9,
      'vulnerability': 0.9,
      'emotional_resilience': -0.9,
      'self_confidence': -0.8,
      'defensiveness': 0.8,
      'approval_seeking': 0.7,
    },
  ),

  // Q21: Я принимаю, что невозможно всем нравиться.
  'boundaries_people_pleasing:q21': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q21',
    axisWeights: {
      'emotional_autonomy': 1.0,
      'self_acceptance': 1.0,
      'realistic_thinking': 0.9,
      'emotional_maturity': 0.9,
      'independence': 0.8,
      'approval_seeking': -1.0,
      'people_pleasing': -0.9,
      'perfectionism': -0.7,
    },
  ),

  // Q22: Мне нужно одобрение других, чтобы чувствовать себя уверенно. (REVERSED)
  'boundaries_people_pleasing:q22': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q22',
    axisWeights: {
      'emotional_autonomy': -1.0,
      'approval_seeking': 1.0,
      'external_validation': 1.0,
      'self_confidence': -0.9,
      'independence': -0.9,
      'codependency': 0.8,
      'insecurity': 0.8,
    },
  ),

  // Q23: Я сохраняю уверенность в себе, даже когда другие не согласны со мной.
  'boundaries_people_pleasing:q23': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q23',
    axisWeights: {
      'emotional_autonomy': 1.0,
      'self_confidence': 1.0,
      'independence': 0.9,
      'resilience': 0.9,
      'emotional_stability': 0.9,
      'assertiveness': 0.8,
      'approval_seeking': -0.9,
      'insecurity': -0.8,
    },
  ),

  // Q24: Чужое неодобрение сильно влияет на моё эмоциональное состояние. (REVERSED)
  'boundaries_people_pleasing:q24': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q24',
    axisWeights: {
      'emotional_autonomy': -1.0,
      'external_validation': 1.0,
      'approval_seeking': 0.9,
      'emotional_stability': -0.9,
      'vulnerability': 0.9,
      'sensitivity': 0.8,
      'resilience': -0.8,
    },
  ),

  // ============================================================================
  // ШКАЛА 4: Угождение другим / People-Pleasing (Q25-32)
  // ============================================================================

  // Q25: Я стараюсь сделать всё, чтобы другие были довольны мной.
  'boundaries_people_pleasing:q25': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q25',
    axisWeights: {
      'people_pleasing': 1.0,
      'approval_seeking': 0.9,
      'external_validation': 0.9,
      'self_sacrifice': 0.8,
      'overresponsibility': 0.8,
      'authenticity': -0.8,
      'self_prioritization': -0.8,
      'independence': -0.7,
    },
  ),

  // Q26: Я соглашаюсь с другими, чтобы избежать конфликтов.
  'boundaries_people_pleasing:q26': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q26',
    axisWeights: {
      'people_pleasing': 1.0,
      'conflict_avoidance': 1.0,
      'submissiveness': 0.9,
      'assertiveness': -0.9,
      'authenticity': -0.8,
      'fear_of_conflict': 0.8,
      'passivity': 0.8,
    },
  ),

  // Q27: Я изменяю своё поведение, чтобы соответствовать ожиданиям других.
  'boundaries_people_pleasing:q27': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q27',
    axisWeights: {
      'people_pleasing': 1.0,
      'conformity': 1.0,
      'authenticity': -1.0,
      'approval_seeking': 0.9,
      'self_integrity': -0.9,
      'adaptability': 0.6, // может быть адаптивным в норме
      'independence': -0.8,
    },
  ),

  // Q28: Я часто говорю «да», когда хочу сказать «нет».
  'boundaries_people_pleasing:q28': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q28',
    axisWeights: {
      'people_pleasing': 1.0,
      'boundary_setting': -1.0,
      'assertiveness': -0.9,
      'authenticity': -0.9,
      'self_betrayal': 0.9,
      'internal_conflict': 0.8,
      'self_respect': -0.8,
    },
  ),

  // Q29: Я чувствую себя ответственным за настроение других людей.
  'boundaries_people_pleasing:q29': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q29',
    axisWeights: {
      'people_pleasing': 0.9,
      'overresponsibility': 1.0,
      'codependency': 0.9,
      'boundary_confusion': 0.9,
      'emotional_autonomy': -0.8,
      'caretaking': 0.8,
      'healthy_boundaries': -0.8,
    },
  ),

  // Q30: Я извиняюсь даже тогда, когда не виноват.
  'boundaries_people_pleasing:q30': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q30',
    axisWeights: {
      'people_pleasing': 0.9,
      'guilt_proneness': 1.0,
      'overresponsibility': 0.9,
      'submissiveness': 0.8,
      'self_respect': -0.8,
      'assertiveness': -0.7,
      'conflict_avoidance': 0.8,
    },
  ),

  // Q31: Я стараюсь предугадать желания других и выполнить их.
  'boundaries_people_pleasing:q31': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q31',
    axisWeights: {
      'people_pleasing': 1.0,
      'hypervigilance': 0.9,
      'anticipatory_caretaking': 0.9,
      'codependency': 0.8,
      'overresponsibility': 0.8,
      'self_prioritization': -0.8,
      'healthy_boundaries': -0.8,
    },
  ),

  // Q32: Мне трудно делать выбор, если он может кого-то расстроить.
  'boundaries_people_pleasing:q32': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q32',
    axisWeights: {
      'people_pleasing': 1.0,
      'fear_of_rejection': 0.9,
      'conflict_avoidance': 0.9,
      'decision_difficulty': 0.8,
      'assertiveness': -0.8,
      'self_prioritization': -0.8,
      'guilt_proneness': 0.7,
    },
  ),

  // ============================================================================
  // ШКАЛА 5: Страх отвержения (Q33-40)
  // ============================================================================

  // Q33: Я боюсь, что люди перестанут общаться со мной, если я буду отказывать.
  'boundaries_people_pleasing:q33': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q33',
    axisWeights: {
      'fear_of_rejection': 1.0,
      'abandonment_fear': 0.9,
      'insecurity': 0.9,
      'people_pleasing': 0.8,
      'boundary_setting': -0.9,
      'self_confidence': -0.8,
      'anxiety': 0.8,
    },
  ),

  // Q34: Мысль о том, что меня могут отвергнуть, вызывает сильную тревогу.
  'boundaries_people_pleasing:q34': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q34',
    axisWeights: {
      'fear_of_rejection': 1.0,
      'anxiety': 1.0,
      'abandonment_fear': 0.9,
      'insecurity': 0.9,
      'emotional_resilience': -0.8,
      'vulnerability': 0.8,
      'attachment_anxiety': 0.8,
    },
  ),

  // Q35: Я избегаю высказывать своё мнение из страха быть непринятым.
  'boundaries_people_pleasing:q35': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q35',
    axisWeights: {
      'fear_of_rejection': 1.0,
      'assertiveness': -0.9,
      'social_anxiety': 0.9,
      'approval_seeking': 0.9,
      'self_expression': -0.9,
      'authenticity': -0.8,
      'conflict_avoidance': 0.8,
    },
  ),

  // Q36: Я часто думаю, что другие могут меня бросить или отвергнуть.
  'boundaries_people_pleasing:q36': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q36',
    axisWeights: {
      'fear_of_rejection': 1.0,
      'abandonment_fear': 1.0,
      'insecurity': 0.9,
      'catastrophic_thinking': 0.9,
      'attachment_anxiety': 0.9,
      'trust': -0.8,
      'self_confidence': -0.8,
    },
  ),

  // Q37: Я соглашаюсь на вещи, которые мне неприятны, чтобы сохранить отношения.
  'boundaries_people_pleasing:q37': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q37',
    axisWeights: {
      'fear_of_rejection': 0.9,
      'boundary_setting': -1.0,
      'self_sacrifice': 0.9,
      'people_pleasing': 0.9,
      'self_respect': -0.9,
      'relationship_dependency': 0.8,
      'authenticity': -0.8,
    },
  ),

  // Q38: Мне тяжело переживать ситуации, где кто-то недоволен мной.
  'boundaries_people_pleasing:q38': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q38',
    axisWeights: {
      'fear_of_rejection': 0.9,
      'approval_seeking': 0.9,
      'emotional_resilience': -0.9,
      'anxiety': 0.8,
      'sensitivity': 0.8,
      'emotional_stability': -0.8,
      'self_confidence': -0.7,
    },
  ),

  // Q39: Я постоянно беспокоюсь о том, что думают обо мне другие.
  'boundaries_people_pleasing:q39': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q39',
    axisWeights: {
      'fear_of_rejection': 0.9,
      'social_anxiety': 1.0,
      'approval_seeking': 1.0,
      'external_validation': 0.9,
      'self_confidence': -0.9,
      'rumination': 0.8,
      'anxiety': 0.8,
    },
  ),

  // Q40: Я чувствую панику, если отношения с кем-то напряжены.
  'boundaries_people_pleasing:q40': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q40',
    axisWeights: {
      'fear_of_rejection': 1.0,
      'panic': 0.9,
      'anxiety': 0.9,
      'abandonment_fear': 0.9,
      'emotional_resilience': -0.9,
      'conflict_tolerance': -0.9,
      'attachment_anxiety': 0.8,
    },
  ),

  // ============================================================================
  // ШКАЛА 6: Ясность границ (Q41-48)
  // ============================================================================

  // Q41: Я чётко понимаю, где проходят мои личные границы.
  'boundaries_people_pleasing:q41': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q41',
    axisWeights: {
      'boundary_clarity': 1.0,
      'self_awareness': 1.0,
      'self_knowledge': 0.9,
      'healthy_boundaries': 0.9,
      'assertiveness': 0.8,
      'self_respect': 0.8,
      'boundary_confusion': -0.9,
    },
  ),

  // Q42: Мне трудно определить, когда кто-то нарушает мои границы. (REVERSED)
  'boundaries_people_pleasing:q42': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q42',
    axisWeights: {
      'boundary_clarity': -1.0,
      'boundary_confusion': 1.0,
      'self_awareness': -0.9,
      'vulnerability': 0.8,
      'healthy_boundaries': -0.9,
      'manipulation_susceptibility': 0.8,
    },
  ),

  // Q43: Я знаю, что мне комфортно, а что — нет, в отношениях.
  'boundaries_people_pleasing:q43': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q43',
    axisWeights: {
      'boundary_clarity': 1.0,
      'self_awareness': 1.0,
      'emotional_intelligence': 0.9,
      'self_knowledge': 0.9,
      'healthy_boundaries': 0.9,
      'assertiveness': 0.7,
      'boundary_confusion': -0.9,
    },
  ),

  // Q44: Мне сложно понять, где заканчиваются мои обязанности и начинаются чужие. (REVERSED)
  'boundaries_people_pleasing:q44': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q44',
    axisWeights: {
      'boundary_clarity': -1.0,
      'boundary_confusion': 1.0,
      'overresponsibility': 0.9,
      'codependency': 0.9,
      'healthy_boundaries': -0.9,
      'self_awareness': -0.8,
    },
  ),

  // Q45: Я могу объяснить другим, что для меня приемлемо, а что — нет.
  'boundaries_people_pleasing:q45': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q45',
    axisWeights: {
      'boundary_clarity': 1.0,
      'assertiveness': 0.9,
      'communication_skills': 0.9,
      'self_expression': 0.9,
      'healthy_boundaries': 0.9,
      'confidence': 0.8,
      'directness': 0.8,
    },
  ),

  // Q46: Я часто не замечаю, что беру на себя чужие проблемы. (REVERSED)
  'boundaries_people_pleasing:q46': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q46',
    axisWeights: {
      'boundary_clarity': -0.9,
      'boundary_confusion': 1.0,
      'overresponsibility': 1.0,
      'codependency': 0.9,
      'caretaking': 0.9,
      'self_awareness': -0.8,
      'healthy_boundaries': -0.9,
    },
  ),

  // Q47: Я осознаю свои эмоциональные и физические пределы.
  'boundaries_people_pleasing:q47': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q47',
    axisWeights: {
      'boundary_clarity': 1.0,
      'self_awareness': 1.0,
      'emotional_intelligence': 0.9,
      'self_care': 0.9,
      'healthy_boundaries': 0.9,
      'burnout_resistance': 0.8,
      'self_knowledge': 0.9,
    },
  ),

  // Q48: Мне трудно распознать, когда кто-то манипулирует мной. (REVERSED)
  'boundaries_people_pleasing:q48': QuestionWeight(
    testId: 'boundaries_people_pleasing',
    questionId: 'q48',
    axisWeights: {
      'boundary_clarity': -0.9,
      'manipulation_susceptibility': 1.0,
      'vulnerability': 0.9,
      'naivety': 0.8,
      'self_awareness': -0.8,
      'healthy_boundaries': -0.9,
      'assertiveness': -0.7,
    },
  ),
};
