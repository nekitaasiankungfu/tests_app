import 'question_weight_models.dart';

/// Weight mappings for Emotional Intelligence Test
/// 70 questions mapped to existing 195 psychological scales
/// Test uses 5-point frequency scale (0-4: Never - Rarely - Sometimes - Often - Always)
///
/// 7 Factors (10 questions each):
/// - emotional_perception: Q1-Q10 (ability to recognize emotions)
/// - emotional_understanding: Q11-Q20 (understanding emotional causes)
/// - self_management: Q21-Q30 (regulating own emotions)
/// - emotional_facilitation: Q31-Q40 (using emotions productively)
/// - empathy: Q41-Q50 (understanding others' emotions)
/// - social_skills: Q51-Q60 (interpersonal effectiveness)
/// - motivation: Q61-Q70 (emotional drive and persistence)
///
/// Reversed questions (21 total): Q2, Q5, Q8, Q12, Q15, Q18, Q22, Q25, Q28,
/// Q32, Q35, Q38, Q42, Q45, Q48, Q52, Q55, Q58, Q62, Q65, Q68
class EmotionalIntelligenceWeights {
  static final Map<String, QuestionWeight> weights = {
    // ============================================
    // EMOTIONAL PERCEPTION (Q1-Q10)
    // Ability to recognize and identify emotions
    // ============================================

    // Q1: "Я легко определяю, в каком настроении находятся окружающие"
    // Easy to identify others' moods
    'emotional_intelligence:q1': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q1',
      axisWeights: {
        'empathy': 0.9,
        'social_perception': 0.8,
        'emotional_awareness': 0.7,
        'social_intelligence': 0.7,
        'attentiveness': 0.6,
        'interpersonal_sensitivity': 0.8,
      },
    ),

    // Q2: "Мне сложно понять, что я чувствую в данный момент" (REVERSED)
    // Difficulty understanding own feelings
    'emotional_intelligence:q2': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q2',
      axisWeights: {
        'self_awareness': -0.9,
        'emotional_awareness': -0.8,
        'introspection': -0.7,
        'self_understanding': -0.8,
        'emotional_clarity': -0.9,
      },
    ),

    // Q3: "Я замечаю тонкие изменения в выражении лица собеседника"
    // Notice subtle facial changes
    'emotional_intelligence:q3': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q3',
      axisWeights: {
        'social_perception': 1.0,
        'attentiveness': 0.9,
        'empathy': 0.8,
        'interpersonal_sensitivity': 0.9,
        'detail_orientation': 0.6,
      },
    ),

    // Q4: "По интонации голоса я могу определить истинные чувства человека"
    // Identify feelings by voice tone
    'emotional_intelligence:q4': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q4',
      axisWeights: {
        'social_perception': 0.9,
        'empathy': 0.9,
        'social_intelligence': 0.8,
        'interpersonal_sensitivity': 0.9,
        'perceptiveness': 0.8,
      },
    ),

    // Q5: "Мне трудно распознать, когда кто-то расстроен или обижен" (REVERSED)
    // Difficulty recognizing others' upset
    'emotional_intelligence:q5': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q5',
      axisWeights: {
        'empathy': -0.9,
        'social_perception': -0.9,
        'interpersonal_sensitivity': -0.8,
        'social_intelligence': -0.7,
        'attentiveness': -0.6,
      },
    ),

    // Q6: "Я быстро осознаю изменения в своём эмоциональном состоянии"
    // Quickly aware of own emotional changes
    'emotional_intelligence:q6': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q6',
      axisWeights: {
        'self_awareness': 1.0,
        'emotional_awareness': 1.0,
        'introspection': 0.8,
        'emotional_clarity': 0.9,
        'mindfulness': 0.8,
      },
    ),

    // Q7: "Язык тела людей говорит мне больше, чем их слова"
    // Body language speaks louder than words
    'emotional_intelligence:q7': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q7',
      axisWeights: {
        'social_perception': 1.0,
        'interpersonal_sensitivity': 0.9,
        'social_intelligence': 0.8,
        'perceptiveness': 0.9,
        'empathy': 0.7,
      },
    ),

    // Q8: "Я с трудом могу назвать эмоцию, которую испытываю" (REVERSED)
    // Difficulty naming own emotions
    'emotional_intelligence:q8': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q8',
      axisWeights: {
        'emotional_awareness': -1.0,
        'self_awareness': -0.9,
        'emotional_clarity': -1.0,
        'introspection': -0.7,
        'self_understanding': -0.8,
      },
    ),

    // Q9: "Я замечаю эмоциональную атмосферу в группе людей"
    // Notice group emotional atmosphere
    'emotional_intelligence:q9': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q9',
      axisWeights: {
        'social_perception': 1.0,
        'social_intelligence': 0.9,
        'empathy': 0.8,
        'attentiveness': 0.8,
        'interpersonal_sensitivity': 0.9,
        'group_awareness': 0.9,
      },
    ),

    // Q10: "Мне легко определить, когда человек неискренен в своих эмоциях"
    // Detect emotional insincerity
    'emotional_intelligence:q10': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q10',
      axisWeights: {
        'social_perception': 1.0,
        'perceptiveness': 1.0,
        'social_intelligence': 0.9,
        'interpersonal_sensitivity': 0.8,
        'discernment': 0.9,
      },
    ),

    // ============================================
    // EMOTIONAL UNDERSTANDING (Q11-Q20)
    // Understanding causes and development of emotions
    // ============================================

    // Q11: "Я понимаю, почему у меня возникают определённые эмоции"
    // Understand why emotions arise
    'emotional_intelligence:q11': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q11',
      axisWeights: {
        'self_awareness': 1.0,
        'emotional_awareness': 0.9,
        'introspection': 1.0,
        'self_understanding': 1.0,
        'emotional_insight': 0.9,
      },
    ),

    // Q12: "Мне трудно объяснить причины моих чувств" (REVERSED)
    // Difficulty explaining feelings
    'emotional_intelligence:q12': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q12',
      axisWeights: {
        'self_awareness': -0.9,
        'emotional_awareness': -0.9,
        'introspection': -0.8,
        'emotional_clarity': -0.9,
        'self_understanding': -0.9,
      },
    ),

    // Q13: "Я знаю, как одна эмоция может перерасти в другую"
    // Know how emotions evolve
    'emotional_intelligence:q13': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q13',
      axisWeights: {
        'emotional_awareness': 1.0,
        'emotional_insight': 1.0,
        'self_understanding': 0.8,
        'psychological_mindedness': 0.9,
      },
    ),

    // Q14: "Я понимаю взаимосвязь между моими мыслями и эмоциями"
    // Understand thought-emotion connection
    'emotional_intelligence:q14': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q14',
      axisWeights: {
        'self_awareness': 1.0,
        'introspection': 1.0,
        'emotional_insight': 0.9,
        'psychological_mindedness': 1.0,
        'self_understanding': 0.9,
      },
    ),

    // Q15: "Сложные эмоции других людей остаются для меня загадкой" (REVERSED)
    // Others' complex emotions are a mystery
    'emotional_intelligence:q15': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q15',
      axisWeights: {
        'empathy': -0.9,
        'social_intelligence': -0.9,
        'interpersonal_sensitivity': -0.8,
        'psychological_mindedness': -0.8,
        'social_perception': -0.7,
      },
    ),

    // Q16: "Я могу предсказать, как изменятся мои чувства в ближайшем будущем"
    // Predict own emotional changes
    'emotional_intelligence:q16': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q16',
      axisWeights: {
        'self_awareness': 0.9,
        'emotional_insight': 1.0,
        'introspection': 0.9,
        'self_understanding': 0.9,
        'foresight': 0.7,
      },
    ),

    // Q17: "Я понимаю, какие события вызывают у меня стресс"
    // Understand stress triggers
    'emotional_intelligence:q17': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q17',
      axisWeights: {
        'self_awareness': 1.0,
        'introspection': 0.9,
        'self_understanding': 1.0,
        'emotional_insight': 0.8,
        'stress_awareness': 1.0,
      },
    ),

    // Q18: "Мне сложно разобраться в смешанных эмоциях" (REVERSED)
    // Difficulty with mixed emotions
    'emotional_intelligence:q18': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q18',
      axisWeights: {
        'emotional_awareness': -0.9,
        'emotional_clarity': -1.0,
        'emotional_insight': -0.9,
        'self_understanding': -0.8,
        'psychological_mindedness': -0.7,
      },
    ),

    // Q19: "Я осознаю, как моё поведение влияет на эмоции окружающих"
    // Aware of behavior's impact on others
    'emotional_intelligence:q19': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q19',
      axisWeights: {
        'social_awareness': 1.0,
        'empathy': 0.9,
        'social_intelligence': 1.0,
        'interpersonal_sensitivity': 0.9,
        'self_awareness': 0.7,
      },
    ),

    // Q20: "Я понимаю культурные различия в выражении эмоций"
    // Understand cultural emotional differences
    'emotional_intelligence:q20': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q20',
      axisWeights: {
        'social_intelligence': 0.9,
        'cultural_sensitivity': 1.0,
        'open_mindedness': 0.8,
        'empathy': 0.7,
        'intellectual_curiosity': 0.6,
      },
    ),

    // ============================================
    // SELF-MANAGEMENT (Q21-Q30)
    // Regulating and controlling own emotions
    // ============================================

    // Q21: "Я могу сохранять спокойствие в стрессовых ситуациях"
    // Stay calm under stress
    'emotional_intelligence:q21': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q21',
      axisWeights: {
        'composure': 1.0,
        'calmness': 1.0,
        'stress_tolerance': 1.0,
        'emotional_stability': 0.9,
        'self_control': 0.9,
      },
    ),

    // Q22: "Когда я злюсь, мне трудно контролировать свои реакции" (REVERSED)
    // Difficulty controlling anger
    'emotional_intelligence:q22': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q22',
      axisWeights: {
        'self_control': -1.0,
        'anger_management': -1.0,
        'composure': -0.9,
        'impulsiveness': 0.8, // High impulsiveness (positive weight)
        'emotional_stability': -0.8,
      },
    ),

    // Q23: "Я умею быстро восстанавливаться после разочарований"
    // Quick recovery from disappointments
    'emotional_intelligence:q23': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q23',
      axisWeights: {
        'emotional_resilience': 1.0,
        'psychological_resilience': 1.0,
        'optimism': 0.8,
        'frustration_tolerance': 0.9,
        'adaptability': 0.7,
      },
    ),

    // Q24: "Я могу отложить удовольствие ради достижения важной цели"
    // Delay gratification for goals
    'emotional_intelligence:q24': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q24',
      axisWeights: {
        'self_control': 1.0,
        'self_discipline': 1.0,
        'goal_orientation': 0.9,
        'deliberation': 0.8,
        'impulsiveness': -0.9, // Low impulsiveness (negative weight)
      },
    ),

    // Q25: "Мои эмоции часто выходят из-под контроля" (REVERSED)
    // Emotions often out of control
    'emotional_intelligence:q25': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q25',
      axisWeights: {
        'self_control': -1.0,
        'emotional_stability': -1.0,
        'composure': -0.9,
        'impulsiveness': 0.9, // High impulsiveness
        'emotional_reactivity': 0.8,
      },
    ),

    // Q26: "Я использую техники для управления своим стрессом"
    // Use stress management techniques
    'emotional_intelligence:q26': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q26',
      axisWeights: {
        'stress_tolerance': 1.0,
        'self_care': 0.9,
        'coping_strategies': 1.0,
        'self_discipline': 0.7,
        'mindfulness': 0.8,
      },
    ),

    // Q27: "Я могу сохранить позитивный настрой даже в трудные времена"
    // Maintain positive attitude in hard times
    'emotional_intelligence:q27': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q27',
      axisWeights: {
        'optimism': 1.0,
        'emotional_resilience': 1.0,
        'psychological_resilience': 0.9,
        'calmness': 0.8,
        'hopefulness': 1.0,
      },
    ),

    // Q28: "Я часто действую импульсивно под влиянием эмоций" (REVERSED)
    // Act impulsively under emotions
    'emotional_intelligence:q28': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q28',
      axisWeights: {
        'impulsiveness': 1.0, // High impulsiveness (positive weight)
        'self_control': -1.0,
        'deliberation': -0.9,
        'composure': -0.8,
        'emotional_stability': -0.7,
      },
    ),

    // Q29: "Я умею переключаться с негативных мыслей на позитивные"
    // Switch from negative to positive thoughts
    'emotional_intelligence:q29': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q29',
      axisWeights: {
        'cognitive_flexibility': 1.0,
        'optimism': 0.9,
        'emotional_regulation': 1.0,
        'self_control': 0.8,
        'adaptability': 0.8,
      },
    ),

    // Q30: "Я контролирую свои эмоциональные реакции в конфликтах"
    // Control emotions in conflicts
    'emotional_intelligence:q30': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q30',
      axisWeights: {
        'composure': 1.0,
        'self_control': 1.0,
        'conflict_management': 0.9,
        'emotional_stability': 0.9,
        'anger_management': 0.8,
      },
    ),

    // ============================================
    // EMOTIONAL FACILITATION (Q31-Q40)
    // Using emotions productively
    // ============================================

    // Q31: "Я использую свои эмоции для повышения креативности"
    // Use emotions to enhance creativity
    'emotional_intelligence:q31': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q31',
      axisWeights: {
        'creativity': 0.9,
        'emotional_awareness': 0.8,
        'self_awareness': 0.7,
        'artistic_orientation': 0.7,
        'imagination': 0.8,
      },
    ),

    // Q32: "Эмоции мешают мне принимать правильные решения" (REVERSED)
    // Emotions hinder decision-making
    'emotional_intelligence:q32': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q32',
      axisWeights: {
        'emotional_regulation': -0.9,
        'decision_making': -0.8,
        'composure': -0.7,
        'self_control': -0.7,
        'deliberation': -0.6,
      },
    ),

    // Q33: "Позитивное настроение помогает мне решать проблемы"
    // Positive mood helps problem-solving
    'emotional_intelligence:q33': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q33',
      axisWeights: {
        'optimism': 0.9,
        'problem_solving': 0.8,
        'emotional_awareness': 0.7,
        'positive_thinking': 0.9,
        'cheerfulness': 0.7,
      },
    ),

    // Q34: "Я знаю, какие эмоции полезны для разных видов задач"
    // Know which emotions help different tasks
    'emotional_intelligence:q34': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q34',
      axisWeights: {
        'emotional_awareness': 1.0,
        'self_awareness': 0.9,
        'emotional_insight': 1.0,
        'strategic_thinking': 0.7,
        'psychological_mindedness': 0.8,
      },
    ),

    // Q35: "Мне трудно использовать эмоции в конструктивных целях" (REVERSED)
    // Difficulty using emotions constructively
    'emotional_intelligence:q35': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q35',
      axisWeights: {
        'emotional_regulation': -0.9,
        'emotional_awareness': -0.8,
        'self_awareness': -0.7,
        'emotional_insight': -0.8,
      },
    ),

    // Q36: "Я могу создать нужное настроение для выполнения задачи"
    // Create right mood for tasks
    'emotional_intelligence:q36': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q36',
      axisWeights: {
        'self_control': 0.9,
        'emotional_regulation': 1.0,
        'self_discipline': 0.8,
        'goal_orientation': 0.7,
      },
    ),

    // Q37: "Эмоции помогают мне расставлять приоритеты в делах"
    // Emotions help prioritize
    'emotional_intelligence:q37': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q37',
      axisWeights: {
        'emotional_awareness': 0.9,
        'decision_making': 0.8,
        'goal_orientation': 0.7,
        'self_awareness': 0.8,
        'organization': 0.6,
      },
    ),

    // Q38: "Я не понимаю, как можно использовать эмоции для работы" (REVERSED)
    // Don't understand using emotions for work
    'emotional_intelligence:q38': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q38',
      axisWeights: {
        'emotional_awareness': -0.9,
        'emotional_insight': -1.0,
        'self_awareness': -0.7,
        'psychological_mindedness': -0.8,
      },
    ),

    // Q39: "Я учитываю своё эмоциональное состояние при планировании дел"
    // Consider emotional state when planning
    'emotional_intelligence:q39': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q39',
      axisWeights: {
        'self_awareness': 1.0,
        'emotional_awareness': 1.0,
        'self_care': 0.8,
        'planning': 0.7,
        'mindfulness': 0.8,
      },
    ),

    // Q40: "Разные эмоции дают мне разные взгляды на проблему"
    // Different emotions give different perspectives
    'emotional_intelligence:q40': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q40',
      axisWeights: {
        'emotional_awareness': 1.0,
        'cognitive_flexibility': 0.9,
        'open_mindedness': 0.8,
        'emotional_insight': 0.9,
        'perspective_taking': 0.9,
      },
    ),

    // ============================================
    // EMPATHY (Q41-Q50)
    // Understanding and sharing others' emotions
    // ============================================

    // Q41: "Я глубоко сопереживаю чувствам других людей"
    // Deeply empathize with others
    'emotional_intelligence:q41': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q41',
      axisWeights: {
        'empathy': 1.0,
        'compassion': 1.0,
        'interpersonal_sensitivity': 0.9,
        'tender_mindedness': 0.9,
        'altruism': 0.8,
      },
    ),

    // Q42: "Мне сложно понять, почему люди реагируют так, а не иначе" (REVERSED)
    // Difficulty understanding reactions
    'emotional_intelligence:q42': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q42',
      axisWeights: {
        'empathy': -1.0,
        'social_intelligence': -0.9,
        'perspective_taking': -0.9,
        'interpersonal_sensitivity': -0.8,
        'social_perception': -0.7,
      },
    ),

    // Q43: "Я чувствую боль других людей, как свою собственную"
    // Feel others' pain as own
    'emotional_intelligence:q43': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q43',
      axisWeights: {
        'empathy': 1.0,
        'compassion': 1.0,
        'interpersonal_sensitivity': 0.9,
        'tender_mindedness': 1.0,
        'emotional_contagion': 0.8,
      },
    ),

    // Q44: "Я умею поставить себя на место другого человека"
    // Put self in others' shoes
    'emotional_intelligence:q44': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q44',
      axisWeights: {
        'empathy': 1.0,
        'perspective_taking': 1.0,
        'social_intelligence': 0.9,
        'interpersonal_sensitivity': 0.9,
      },
    ),

    // Q45: "Эмоциональные проблемы других меня не очень волнуют" (REVERSED)
    // Others' problems don't concern me
    'emotional_intelligence:q45': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q45',
      axisWeights: {
        'empathy': -1.0,
        'compassion': -1.0,
        'altruism': -0.9,
        'tender_mindedness': -0.9,
        'interpersonal_sensitivity': -0.8,
      },
    ),

    // Q46: "Я внимательно выслушиваю людей, когда им плохо"
    // Listen carefully when people feel bad
    'emotional_intelligence:q46': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q46',
      axisWeights: {
        'empathy': 0.9,
        'compassion': 0.9,
        'active_listening': 1.0,
        'supportiveness': 1.0,
        'attentiveness': 0.8,
      },
    ),

    // Q47: "Я чувствую, когда человеку нужна моя поддержка"
    // Sense when someone needs support
    'emotional_intelligence:q47': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q47',
      axisWeights: {
        'empathy': 1.0,
        'social_perception': 0.9,
        'interpersonal_sensitivity': 1.0,
        'supportiveness': 0.8,
        'attentiveness': 0.8,
      },
    ),

    // Q48: "Мне трудно разделять эмоции других людей" (REVERSED)
    // Difficulty sharing others' emotions
    'emotional_intelligence:q48': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q48',
      axisWeights: {
        'empathy': -1.0,
        'emotional_contagion': -0.8,
        'interpersonal_sensitivity': -0.9,
        'compassion': -0.8,
        'perspective_taking': -0.7,
      },
    ),

    // Q49: "Я замечаю, когда кому-то нужна помощь, даже если они не просят"
    // Notice when help needed without asking
    'emotional_intelligence:q49': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q49',
      axisWeights: {
        'empathy': 1.0,
        'social_perception': 1.0,
        'interpersonal_sensitivity': 1.0,
        'attentiveness': 0.9,
        'altruism': 0.8,
      },
    ),

    // Q50: "Я понимаю невысказанные переживания близких мне людей"
    // Understand unspoken feelings of loved ones
    'emotional_intelligence:q50': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q50',
      axisWeights: {
        'empathy': 1.0,
        'social_perception': 1.0,
        'interpersonal_sensitivity': 1.0,
        'intimacy': 0.8,
        'perceptiveness': 0.9,
      },
    ),

    // ============================================
    // SOCIAL SKILLS (Q51-Q60)
    // Interpersonal effectiveness
    // ============================================

    // Q51: "Я легко нахожу общий язык с разными людьми"
    // Easily find common ground
    'emotional_intelligence:q51': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q51',
      axisWeights: {
        'social_skills': 1.0,
        'warmth': 0.9,
        'gregariousness': 0.8,
        'adaptability': 0.8,
        'friendliness': 0.9,
      },
    ),

    // Q52: "Мне сложно разрешать конфликты между людьми" (REVERSED)
    // Difficulty resolving conflicts
    'emotional_intelligence:q52': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q52',
      axisWeights: {
        'conflict_management': -1.0,
        'social_skills': -0.9,
        'assertiveness': -0.6,
        'diplomacy': -0.9,
        'leadership': -0.6,
      },
    ),

    // Q53: "Я умею вдохновлять и мотивировать других"
    // Inspire and motivate others
    'emotional_intelligence:q53': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q53',
      axisWeights: {
        'leadership': 1.0,
        'influence': 1.0,
        'assertiveness': 0.8,
        'inspiration': 1.0,
        'social_skills': 0.9,
      },
    ),

    // Q54: "Я эффективно работаю в команде"
    // Work effectively in team
    'emotional_intelligence:q54': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q54',
      axisWeights: {
        'team_orientation': 1.0,
        'cooperation': 1.0,
        'social_skills': 0.9,
        'adaptability': 0.7,
        'trust': 0.7,
      },
    ),

    // Q55: "Мне трудно влиять на мнение других людей" (REVERSED)
    // Difficulty influencing opinions
    'emotional_intelligence:q55': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q55',
      axisWeights: {
        'influence': -1.0,
        'assertiveness': -0.9,
        'leadership': -0.8,
        'social_skills': -0.7,
        'persuasiveness': -1.0,
      },
    ),

    // Q56: "Я помогаю людям находить компромиссы в спорах"
    // Help find compromises
    'emotional_intelligence:q56': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q56',
      axisWeights: {
        'conflict_management': 1.0,
        'diplomacy': 1.0,
        'cooperation': 0.9,
        'social_skills': 0.9,
        'moderation': 0.8,
      },
    ),

    // Q57: "Я создаю позитивную атмосферу в группе"
    // Create positive group atmosphere
    'emotional_intelligence:q57': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q57',
      axisWeights: {
        'cheerfulness': 0.9,
        'warmth': 0.9,
        'social_skills': 0.9,
        'positive_influence': 1.0,
        'gregariousness': 0.7,
      },
    ),

    // Q58: "Мне сложно выстраивать долгосрочные отношения" (REVERSED)
    // Difficulty building long-term relationships
    'emotional_intelligence:q58': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q58',
      axisWeights: {
        'commitment': -0.9,
        'trust': -0.8,
        'intimacy': -0.8,
        'social_skills': -0.7,
        'loyalty': -0.9,
      },
    ),

    // Q59: "Я умею давать конструктивную обратную связь"
    // Give constructive feedback
    'emotional_intelligence:q59': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q59',
      axisWeights: {
        'assertiveness': 0.8,
        'diplomacy': 0.9,
        'social_skills': 0.9,
        'honesty': 0.7,
        'supportiveness': 0.7,
      },
    ),

    // Q60: "Я успешно адаптируюсь к разным социальным ситуациям"
    // Adapt to social situations
    'emotional_intelligence:q60': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q60',
      axisWeights: {
        'adaptability': 1.0,
        'social_skills': 1.0,
        'flexibility': 0.9,
        'social_intelligence': 0.9,
        'versatility': 0.8,
      },
    ),

    // ============================================
    // MOTIVATION (Q61-Q70)
    // Emotional drive and persistence
    // ============================================

    // Q61: "Я сохраняю энтузиазм даже при столкновении с трудностями"
    // Maintain enthusiasm despite difficulties
    'emotional_intelligence:q61': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q61',
      axisWeights: {
        'persistence': 1.0,
        'optimism': 0.9,
        'emotional_resilience': 0.9,
        'determination': 1.0,
        'activity_level': 0.7,
      },
    ),

    // Q62: "Мне трудно заставить себя работать над долгосрочными целями" (REVERSED)
    // Difficulty working on long-term goals
    'emotional_intelligence:q62': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q62',
      axisWeights: {
        'goal_orientation': -1.0,
        'self_discipline': -1.0,
        'persistence': -0.9,
        'achievement_striving': -1.0,
        'dutifulness': -0.7,
      },
    ),

    // Q63: "Я нахожу внутренние ресурсы для преодоления препятствий"
    // Find internal resources to overcome obstacles
    'emotional_intelligence:q63': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q63',
      axisWeights: {
        'psychological_resilience': 1.0,
        'emotional_resilience': 1.0,
        'self_reliance': 0.9,
        'inner_strength': 1.0,
        'determination': 0.9,
      },
    ),

    // Q64: "Я стремлюсь к совершенству в том, что делаю"
    // Strive for excellence
    'emotional_intelligence:q64': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q64',
      axisWeights: {
        'achievement_striving': 1.0,
        'perfectionism': 0.8,
        'competence': 0.9,
        'goal_orientation': 0.9,
        'ambition': 0.8,
      },
    ),

    // Q65: "Я быстро теряю интерес к начатым делам" (REVERSED)
    // Quickly lose interest
    'emotional_intelligence:q65': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q65',
      axisWeights: {
        'persistence': -1.0,
        'self_discipline': -0.9,
        'dutifulness': -0.8,
        'achievement_striving': -0.9,
        'focus': -0.8,
      },
    ),

    // Q66: "Я использую свои эмоции как источник энергии для действий"
    // Use emotions as energy source
    'emotional_intelligence:q66': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q66',
      axisWeights: {
        'emotional_awareness': 0.9,
        'activity_level': 0.8,
        'energy': 0.9,
        'self_awareness': 0.8,
        'motivation': 1.0,
      },
    ),

    // Q67: "Я настойчив в достижении важных для меня целей"
    // Persistent in achieving goals
    'emotional_intelligence:q67': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q67',
      axisWeights: {
        'persistence': 1.0,
        'determination': 1.0,
        'goal_orientation': 1.0,
        'achievement_striving': 1.0,
        'self_discipline': 0.9,
      },
    ),

    // Q68: "Неудачи сильно подрывают мою мотивацию" (REVERSED)
    // Failures undermine motivation
    'emotional_intelligence:q68': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q68',
      axisWeights: {
        'emotional_resilience': -1.0,
        'psychological_resilience': -0.9,
        'optimism': -0.8,
        'frustration_tolerance': -0.9,
        'vulnerability': 0.8, // High vulnerability (positive weight)
      },
    ),

    // Q69: "Я нахожу смысл и удовлетворение в своей деятельности"
    // Find meaning and satisfaction
    'emotional_intelligence:q69': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q69',
      axisWeights: {
        'life_satisfaction': 0.9,
        'purpose': 1.0,
        'meaning_in_life': 1.0,
        'intrinsic_motivation': 1.0,
        'fulfillment': 1.0,
      },
    ),

    // Q70: "Я оптимистично смотрю на будущее"
    // Optimistic about future
    'emotional_intelligence:q70': const QuestionWeight(
      testId: 'emotional_intelligence',
      questionId: 'q70',
      axisWeights: {
        'optimism': 1.0,
        'hopefulness': 1.0,
        'positive_outlook': 1.0,
        'cheerfulness': 0.7,
        'emotional_stability': 0.7,
      },
    ),
  };
}
