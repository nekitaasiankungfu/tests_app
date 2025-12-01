import 'question_weight_models.dart';

/// Question weights for Procrastination and Productivity Style Test
///
/// Maps 48 questions to psychological scales.
///
/// Test structure:
/// - 4 factors: emotional_procrastination, organizational_procrastination,
///              perfectionistic_procrastination, energy_resource
/// - 48 questions (12 per factor)
/// - Scoring: 0-4 (Никогда - Редко - Иногда - Часто - Всегда)
/// - Reversed questions: [3, 6, 8, 11, 15, 16, 20, 22, 24, 27, 30, 32, 35, 39, 40, 44, 46, 48]
///
/// Weight calculation:
/// - Use negative weights for scales that correlate inversely
/// - Reversed questions (isReversed: true) should have opposite sign patterns
///
/// Personality type impact:
/// - J/P dimension: organizational_procrastination questions
/// - T/F dimension: emotional_procrastination questions
/// - E/I dimension: minimal impact
/// - S/N dimension: minimal impact

const Map<String, QuestionWeight> procrastinationProductivityWeights = {
  // ============================================================================
  // FACTOR 1: EMOTIONAL PROCRASTINATION (Q1-Q6)
  // Emotional avoidance, fear of failure, anxiety-driven delay
  // ============================================================================

  // Q1: Я откладываю важные задачи, если они вызывают у меня тревогу или дискомфорт.
  'procrastination_productivity_style_v1:q1': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q1',
    axisWeights: {
      'anxiety': 0.9,
      'avoidance': 0.9,
      'stress': 0.8,
      'emotional_resilience': -0.8, // reversed
      'calmness': -0.7, // reversed
      'composure': -0.7, // reversed
      'courage': -0.7, // reversed
      'emotion_over_logic': 0.6, // F in T/F
    },
  ),

  // Q2: Когда передо мной сложная задача, я ищу способы отвлечься (соцсети, сериалы, бытовые дела).
  'procrastination_productivity_style_v1:q2': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q2',
    axisWeights: {
      'distraction': 0.9,
      'avoidance': 0.9,
      'self_discipline': -0.9, // reversed
      'focus': -0.8, // reversed
      'task_persistence': -0.8, // reversed
      'willpower': -0.7, // reversed
      'impulse_control': -0.7, // reversed
    },
  ),

  // Q3: Я легко приступаю к делу, даже если результат пока неясен. (REVERSED)
  'procrastination_productivity_style_v1:q3': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q3',
    axisWeights: {
      'action_orientation': 0.9, // REVERSED question: high answer = high action
      'initiative': 0.9,
      'courage': 0.8,
      'anxiety': -0.8, // reversed correlation
      'avoidance': -0.8, // reversed correlation
      'fear_of_failure': -0.7, // reversed correlation
      'risk_aversion': -0.7, // reversed correlation
    },
  ),

  // Q4: Я боюсь, что не справлюсь, поэтому не начинаю — так кажется безопаснее.
  'procrastination_productivity_style_v1:q4': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q4',
    axisWeights: {
      'fear_of_failure': 0.9,
      'anxiety': 0.9,
      'risk_aversion': 0.8,
      'self_confidence': -0.9, // reversed
      'courage': -0.8, // reversed
      'initiative': -0.8, // reversed
      'optimism': -0.7, // reversed
    },
  ),

  // Q5: Неприятные эмоции (скука, раздражение, страх) мешают мне взяться за задачу.
  'procrastination_productivity_style_v1:q5': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q5',
    axisWeights: {
      'emotional_resilience': -0.9, // reversed
      'stress': 0.8,
      'irritability': 0.8,
      'fear_of_failure': 0.8,
      'emotional_regulation': -0.8, // reversed
      'composure': -0.7, // reversed
      'emotion_over_logic': 0.7, // F in T/F
    },
  ),

  // Q6: Я могу работать продуктивно, даже если не в настроении. (REVERSED)
  'procrastination_productivity_style_v1:q6': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q6',
    axisWeights: {
      'emotional_resilience': 0.9, // REVERSED question
      'self_discipline': 0.9,
      'willpower': 0.8,
      'task_persistence': 0.8,
      'emotional_regulation': 0.8,
      'stress': -0.7, // reversed correlation
      'emotion_over_logic': -0.6, // T in T/F (logic over emotions)
    },
  ),

  // ============================================================================
  // FACTOR 2: ORGANIZATIONAL PROCRASTINATION (Q7-Q12)
  // Poor planning, chaos, lack of structure
  // ============================================================================

  // Q7: У меня нет чёткого плана на день, и я не знаю, с чего начать.
  'procrastination_productivity_style_v1:q7': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q7',
    axisWeights: {
      'organization': -0.9, // reversed
      'planning': -0.9, // reversed
      'chaos': 0.9,
      'structure_preference': -0.8, // reversed
      'methodicalness': -0.8, // reversed
      'self_discipline': -0.7, // reversed
      'judging_over_perceiving': -0.7, // P in J/P (perceiving = less organized)
    },
  ),

  // Q8: Я хорошо веду список дел и регулярно его обновляю. (REVERSED)
  'procrastination_productivity_style_v1:q8': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q8',
    axisWeights: {
      'organization': 0.9, // REVERSED question
      'planning': 0.9,
      'methodicalness': 0.9,
      'structure_preference': 0.8,
      'self_discipline': 0.8,
      'chaos': -0.8, // reversed correlation
      'judging_over_perceiving': 0.8, // J in J/P
    },
  ),

  // Q9: Задачи накапливаются, потому что я не расставляю приоритеты.
  'procrastination_productivity_style_v1:q9': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q9',
    axisWeights: {
      'organization': -0.9, // reversed
      'planning': -0.9, // reversed
      'priority_setting': -0.9, // reversed
      'overwhelm': 0.8,
      'stress': 0.7,
      'self_discipline': -0.7, // reversed
      'judging_over_perceiving': -0.7, // P in J/P
    },
  ),

  // Q10: Я часто забываю о важных делах, потому что не записываю.
  'procrastination_productivity_style_v1:q10': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q10',
    axisWeights: {
      'organization': -0.9, // reversed
      'methodicalness': -0.9, // reversed
      'attention_to_detail': -0.8, // reversed
      'memory_issues': 0.8,
      'chaos': 0.7,
      'structure_preference': -0.7, // reversed
      'judging_over_perceiving': -0.7, // P in J/P
    },
  ),

  // Q11: Я быстро справляюсь с задачей, если у меня есть пошаговый алгоритм. (REVERSED)
  'procrastination_productivity_style_v1:q11': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q11',
    axisWeights: {
      'methodicalness': 0.9, // REVERSED question
      'structure_preference': 0.9,
      'task_persistence': 0.8,
      'action_orientation': 0.8,
      'organization': 0.7,
      'chaos': -0.7, // reversed correlation
      'judging_over_perceiving': 0.7, // J in J/P
    },
  ),

  // Q12: Я откладываю задачи, потому что не понимаю, как их правильно разбить на шаги.
  'procrastination_productivity_style_v1:q12': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q12',
    axisWeights: {
      'planning': -0.9, // reversed
      'methodicalness': -0.9, // reversed
      'organization': -0.8, // reversed
      'analytical_thinking': -0.8, // reversed
      'overwhelm': 0.8,
      'avoidance': 0.7,
      'judging_over_perceiving': -0.6, // P in J/P
    },
  ),

  // ============================================================================
  // FACTOR 3: PERFECTIONISTIC PROCRASTINATION (Q13-Q18)
  // Fear of imperfection, all-or-nothing thinking, unrealistic standards
  // ============================================================================

  // Q13: Я откладываю, потому что хочу сделать идеально, а это невозможно прямо сейчас.
  'procrastination_productivity_style_v1:q13': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q13',
    axisWeights: {
      'perfectionism': 0.9,
      'fear_of_failure': 0.9,
      'anxiety': 0.8,
      'avoidance': 0.8,
      'self_criticism': 0.8,
      'flexibility': -0.8, // reversed
      'pragmatism': -0.7, // reversed
    },
  ),

  // Q14: Мне сложно начать, если я не уверен(а), что результат будет на высоте.
  'procrastination_productivity_style_v1:q14': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q14',
    axisWeights: {
      'perfectionism': 0.9,
      'fear_of_failure': 0.9,
      'self_confidence': -0.9, // reversed
      'anxiety': 0.8,
      'initiative': -0.8, // reversed
      'risk_aversion': 0.7,
      'courage': -0.7, // reversed
    },
  ),

  // Q15: Я легко принимаю несовершенный результат, если нужно двигаться дальше. (REVERSED)
  'procrastination_productivity_style_v1:q15': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q15',
    axisWeights: {
      'flexibility': 0.9, // REVERSED question
      'pragmatism': 0.9,
      'action_orientation': 0.8,
      'perfectionism': -0.9, // reversed correlation
      'self_criticism': -0.8, // reversed correlation
      'anxiety': -0.7, // reversed correlation
      'adaptability': 0.7,
    },
  ),

  // Q16: Я спокойно делаю черновик, даже если он далёк от идеала. (REVERSED)
  'procrastination_productivity_style_v1:q16': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q16',
    axisWeights: {
      'pragmatism': 0.9, // REVERSED question
      'action_orientation': 0.9,
      'flexibility': 0.8,
      'perfectionism': -0.9, // reversed correlation
      'fear_of_failure': -0.8, // reversed correlation
      'self_criticism': -0.7, // reversed correlation
      'composure': 0.7,
    },
  ),

  // Q17: Я критикую себя за ошибки и боюсь, что другие заметят недостатки.
  'procrastination_productivity_style_v1:q17': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q17',
    axisWeights: {
      'self_criticism': 0.9,
      'perfectionism': 0.9,
      'anxiety': 0.9,
      'fear_of_judgment': 0.8,
      'self_esteem': -0.9, // reversed
      'self_confidence': -0.8, // reversed
      'emotional_resilience': -0.7, // reversed
    },
  ),

  // Q18: Я не начинаю, потому что «сейчас не лучшие условия», «не то время дня» и т.д.
  'procrastination_productivity_style_v1:q18': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q18',
    axisWeights: {
      'perfectionism': 0.9,
      'avoidance': 0.9,
      'excuse_making': 0.9,
      'action_orientation': -0.9, // reversed
      'initiative': -0.8, // reversed
      'flexibility': -0.8, // reversed
      'pragmatism': -0.7, // reversed
    },
  ),

  // ============================================================================
  // FACTOR 4: ENERGY & RESOURCE (Q19-Q24)
  // Fatigue, burnout, low motivation, depleted resources
  // ============================================================================

  // Q19: Я часто чувствую усталость и не могу заставить себя работать.
  'procrastination_productivity_style_v1:q19': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q19',
    axisWeights: {
      'fatigue': 0.9,
      'vitality': -0.9, // reversed
      'energy': -0.9, // reversed
      'burnout': 0.8,
      'motivation': -0.8, // reversed
      'willpower': -0.7, // reversed
      'health_issues': 0.7,
    },
  ),

  // Q20: У меня достаточно сил и ресурса, чтобы продуктивно работать. (REVERSED)
  'procrastination_productivity_style_v1:q20': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q20',
    axisWeights: {
      'vitality': 0.9, // REVERSED question
      'energy': 0.9,
      'motivation': 0.9,
      'fatigue': -0.9, // reversed correlation
      'burnout': -0.8, // reversed correlation
      'health_issues': -0.7, // reversed correlation
      'resilience': 0.7,
    },
  ),

  // Q21: Мне трудно сосредоточиться, даже если дело важное.
  'procrastination_productivity_style_v1:q21': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q21',
    axisWeights: {
      'focus': -0.9, // reversed
      'attention_control': -0.9, // reversed
      'distraction': 0.9,
      'cognitive_fatigue': 0.8,
      'burnout': 0.7,
      'stress': 0.7,
      'mental_clarity': -0.7, // reversed
    },
  ),

  // Q22: Я регулярно делаю паузы и восстанавливаюсь. (REVERSED)
  'procrastination_productivity_style_v1:q22': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q22',
    axisWeights: {
      'self_care': 0.9, // REVERSED question
      'energy_management': 0.9,
      'recovery': 0.9,
      'burnout': -0.8, // reversed correlation
      'fatigue': -0.8, // reversed correlation
      'health_awareness': 0.8,
      'work_life_balance': 0.7,
    },
  ),

  // Q23: Я чувствую себя выгоревшим и потерял(а) интерес к делам.
  'procrastination_productivity_style_v1:q23': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q23',
    axisWeights: {
      'burnout': 0.9,
      'motivation': -0.9, // reversed
      'interest': -0.9, // reversed
      'depression_symptoms': 0.8,
      'emotional_exhaustion': 0.8,
      'vitality': -0.8, // reversed
      'life_satisfaction': -0.7, // reversed
    },
  ),

  // Q24: Я легко восстанавливаюсь после нагрузки и готов(а) действовать. (REVERSED)
  'procrastination_productivity_style_v1:q24': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q24',
    axisWeights: {
      'resilience': 0.9, // REVERSED question
      'recovery': 0.9,
      'vitality': 0.9,
      'energy': 0.8,
      'burnout': -0.9, // reversed correlation
      'fatigue': -0.8, // reversed correlation
      'emotional_resilience': 0.7,
    },
  ),

  // ============================================================================
  // ADDITIONAL QUESTIONS (Q25-Q48) - Extended version
  // ============================================================================

  // Q25: Когда передо мной сложная задача, я ищу способы отвлечься
  'procrastination_productivity_style_v1:q25': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q25',
    axisWeights: {
      'distraction': 0.9,
      'avoidance': 0.9,
      'self_discipline': -0.9,
      'focus': -0.8,
      'task_persistence': -0.8,
      'willpower': -0.7,
      'impulse_control': -0.7,
    },
  ),

  // Q26: Я боюсь, что не справлюсь, поэтому не начинаю
  'procrastination_productivity_style_v1:q26': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q26',
    axisWeights: {
      'fear_of_failure': 0.9,
      'anxiety': 0.9,
      'risk_aversion': 0.8,
      'self_confidence': -0.9,
      'courage': -0.8,
      'initiative': -0.8,
      'optimism': -0.7,
    },
  ),

  // Q27: Я легко приступаю к делу, даже если результат пока неясен (REVERSED)
  'procrastination_productivity_style_v1:q27': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q27',
    axisWeights: {
      'action_orientation': 0.9,
      'initiative': 0.9,
      'courage': 0.8,
      'anxiety': -0.8,
      'avoidance': -0.8,
      'fear_of_failure': -0.7,
      'risk_aversion': -0.7,
    },
  ),

  // Q28: У меня нет чёткого плана на день
  'procrastination_productivity_style_v1:q28': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q28',
    axisWeights: {
      'organization': -0.9,
      'planning': -0.9,
      'chaos': 0.9,
      'structure_preference': -0.8,
      'methodicalness': -0.8,
      'self_discipline': -0.7,
      'judging_over_perceiving': -0.7,
    },
  ),

  // Q29: Задачи накапливаются, потому что я не расставляю приоритеты
  'procrastination_productivity_style_v1:q29': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q29',
    axisWeights: {
      'organization': -0.9,
      'planning': -0.9,
      'priority_setting': -0.9,
      'overwhelm': 0.8,
      'stress': 0.7,
      'self_discipline': -0.7,
      'judging_over_perceiving': -0.7,
    },
  ),

  // Q30: Я хорошо веду список дел и регулярно его обновляю (REVERSED)
  'procrastination_productivity_style_v1:q30': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q30',
    axisWeights: {
      'organization': 0.9,
      'planning': 0.9,
      'methodicalness': 0.9,
      'structure_preference': 0.8,
      'self_discipline': 0.8,
      'chaos': -0.8,
      'judging_over_perceiving': 0.8,
    },
  ),

  // Q31: Неприятные эмоции мешают мне взяться за задачу
  'procrastination_productivity_style_v1:q31': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q31',
    axisWeights: {
      'emotional_resilience': -0.9,
      'stress': 0.8,
      'irritability': 0.8,
      'fear_of_failure': 0.8,
      'emotional_regulation': -0.8,
      'composure': -0.7,
      'emotion_over_logic': 0.7,
    },
  ),

  // Q32: Я могу работать продуктивно, даже если не в настроении (REVERSED)
  'procrastination_productivity_style_v1:q32': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q32',
    axisWeights: {
      'emotional_resilience': 0.9,
      'self_discipline': 0.9,
      'willpower': 0.8,
      'task_persistence': 0.8,
      'emotional_regulation': 0.8,
      'stress': -0.7,
      'emotion_over_logic': -0.6,
    },
  ),

  // Q33: Я откладываю, потому что хочу сделать идеально
  'procrastination_productivity_style_v1:q33': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q33',
    axisWeights: {
      'perfectionism': 0.9,
      'fear_of_failure': 0.9,
      'anxiety': 0.8,
      'avoidance': 0.8,
      'self_criticism': 0.8,
      'flexibility': -0.8,
      'pragmatism': -0.7,
    },
  ),

  // Q34: Я часто откладываю задачи, потому что не понимаю, как их разбить
  'procrastination_productivity_style_v1:q34': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q34',
    axisWeights: {
      'planning': -0.9,
      'methodicalness': -0.9,
      'organization': -0.8,
      'analytical_thinking': -0.8,
      'overwhelm': 0.8,
      'avoidance': 0.7,
      'judging_over_perceiving': -0.6,
    },
  ),

  // Q35: Я быстро справляюсь с задачей, если у меня есть алгоритм (REVERSED)
  'procrastination_productivity_style_v1:q35': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q35',
    axisWeights: {
      'methodicalness': 0.9,
      'structure_preference': 0.9,
      'task_persistence': 0.8,
      'action_orientation': 0.8,
      'organization': 0.7,
      'chaos': -0.7,
      'judging_over_perceiving': 0.7,
    },
  ),

  // Q36: Мне сложно начать, если я не уверен в результате
  'procrastination_productivity_style_v1:q36': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q36',
    axisWeights: {
      'perfectionism': 0.9,
      'fear_of_failure': 0.9,
      'self_confidence': -0.9,
      'anxiety': 0.8,
      'initiative': -0.8,
      'risk_aversion': 0.7,
      'courage': -0.7,
    },
  ),

  // Q37: Я критикую себя за ошибки и боюсь критики
  'procrastination_productivity_style_v1:q37': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q37',
    axisWeights: {
      'self_criticism': 0.9,
      'perfectionism': 0.9,
      'anxiety': 0.9,
      'fear_of_judgment': 0.8,
      'self_esteem': -0.9,
      'self_confidence': -0.8,
      'emotional_resilience': -0.7,
    },
  ),

  // Q38: Я не начинаю, потому что условия неидеальны
  'procrastination_productivity_style_v1:q38': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q38',
    axisWeights: {
      'perfectionism': 0.9,
      'avoidance': 0.9,
      'excuse_making': 0.9,
      'action_orientation': -0.9,
      'initiative': -0.8,
      'flexibility': -0.8,
      'pragmatism': -0.7,
    },
  ),

  // Q39: Я легко принимаю несовершенный результат (REVERSED)
  'procrastination_productivity_style_v1:q39': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q39',
    axisWeights: {
      'flexibility': 0.9,
      'pragmatism': 0.9,
      'action_orientation': 0.8,
      'perfectionism': -0.9,
      'self_criticism': -0.8,
      'anxiety': -0.7,
      'adaptability': 0.7,
    },
  ),

  // Q40: У меня достаточно сил и ресурса (REVERSED)
  'procrastination_productivity_style_v1:q40': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q40',
    axisWeights: {
      'vitality': 0.9,
      'energy': 0.9,
      'motivation': 0.9,
      'fatigue': -0.9,
      'burnout': -0.8,
      'health_issues': -0.7,
      'resilience': 0.7,
    },
  ),

  // Q41: Я часто чувствую усталость
  'procrastination_productivity_style_v1:q41': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q41',
    axisWeights: {
      'fatigue': 0.9,
      'vitality': -0.9,
      'energy': -0.9,
      'burnout': 0.8,
      'motivation': -0.8,
      'willpower': -0.7,
      'health_issues': 0.7,
    },
  ),

  // Q42: Мне трудно сосредоточиться
  'procrastination_productivity_style_v1:q42': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q42',
    axisWeights: {
      'focus': -0.9,
      'attention_control': -0.9,
      'distraction': 0.9,
      'cognitive_fatigue': 0.8,
      'burnout': 0.7,
      'stress': 0.7,
      'mental_clarity': -0.7,
    },
  ),

  // Q43: Я оправдываю откладывание внешними причинами
  'procrastination_productivity_style_v1:q43': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q43',
    axisWeights: {
      'excuse_making': 0.9,
      'avoidance': 0.9,
      'external_locus_of_control': 0.8,
      'self_awareness': -0.8,
      'personal_responsibility': -0.8,
      'self_honesty': -0.7,
      'initiative': -0.7,
    },
  ),

  // Q44: Я спокойно делаю черновик (REVERSED)
  'procrastination_productivity_style_v1:q44': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q44',
    axisWeights: {
      'pragmatism': 0.9,
      'action_orientation': 0.9,
      'flexibility': 0.8,
      'perfectionism': -0.9,
      'fear_of_failure': -0.8,
      'self_criticism': -0.7,
      'composure': 0.7,
    },
  ),

  // Q45: Страх критики останавливает меня
  'procrastination_productivity_style_v1:q45': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q45',
    axisWeights: {
      'fear_of_judgment': 0.9,
      'anxiety': 0.9,
      'avoidance': 0.8,
      'self_confidence': -0.9,
      'courage': -0.8,
      'initiative': -0.7,
      'social_anxiety': 0.7,
    },
  ),

  // Q46: Я часто забываю о делах
  'procrastination_productivity_style_v1:q46': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q46',
    axisWeights: {
      'organization': -0.9,
      'methodicalness': -0.9,
      'attention_to_detail': -0.8,
      'memory_issues': 0.8,
      'chaos': 0.7,
      'structure_preference': -0.7,
      'judging_over_perceiving': -0.7,
    },
  ),

  // Q47: Я теряюсь в хаосе мелких дел
  'procrastination_productivity_style_v1:q47': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q47',
    axisWeights: {
      'chaos': 0.9,
      'overwhelm': 0.9,
      'organization': -0.9,
      'priority_setting': -0.8,
      'planning': -0.8,
      'stress': 0.7,
      'judging_over_perceiving': -0.6,
    },
  ),

  // Q48: Я регулярно делаю паузы и восстанавливаюсь (REVERSED)
  'procrastination_productivity_style_v1:q48': QuestionWeight(
    testId: 'procrastination_productivity_style_v1',
    questionId: 'q48',
    axisWeights: {
      'self_care': 0.9,
      'energy_management': 0.9,
      'recovery': 0.9,
      'burnout': -0.8,
      'fatigue': -0.8,
      'health_awareness': 0.8,
      'work_life_balance': 0.7,
    },
  ),
};
