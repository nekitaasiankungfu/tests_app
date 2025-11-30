import 'question_weight_models.dart';

/// Weight mappings for ADHD Attention Profile Test
///
/// Maps 50 questions to psychological scales for Summary screen integration.
/// Based on:
/// - Clinical models of adult ADHD
/// - Executive function and self-regulation models (Barkley)
/// - Self-report ADHD-like traits assessment approaches
///
/// 5 factors of the test:
/// - inattention (Q1, Q6, Q11, Q16*, Q21, Q26*, Q31, Q36*, Q41, Q46*)
/// - hyperactivity_restlessness (Q2, Q7, Q12*, Q17, Q22, Q27*, Q32, Q37*, Q42, Q47*)
/// - impulsivity (Q3, Q8, Q13, Q18*, Q23, Q28*, Q33, Q38*, Q43, Q48*)
/// - organization_planning (Q4, Q9, Q14*, Q19, Q24, Q29*, Q34, Q39*, Q44, Q49*)
/// - emotional_regulation (Q5, Q10, Q15*, Q20, Q25, Q30*, Q35, Q40*, Q45, Q50*)
///
/// * = reversed questions
///
/// ПРАВИЛО #2: Отрицательные веса используются только для 195 шкал,
/// НЕ для биполярных полюсов (extraversion, introversion, sensing, intuition,
/// thinking, feeling, judging, perceiving)
class ADHDAttentionProfileWeights {
  static final Map<String, QuestionWeight> weights = {
    // ============================================================
    // INATTENTION FACTOR (10 questions)
    // ============================================================

    // Q1: "Мне трудно сосредоточиться на задаче, если она требует длительного умственного усилия."
    'adhd_attention_profile_v2:q1': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q1',
      axisWeights: {
        'attention_control': -1.0,
        'self_discipline': -0.9,
        'persistence': -0.8,
        'cognitive_flexibility': -0.6,
        'working_memory': -0.7,
        'diligence': -0.7,
        'deliberation': -0.5,
        'procrastination': 0.7,
        // Personality Type poles (positive only!)
        'perceiving': 0.3,
      },
    ),

    // Q6: "Во время чтения или работы я замечаю, что пропускаю важные детали."
    'adhd_attention_profile_v2:q6': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q6',
      axisWeights: {
        'attention_control': -1.0,
        'perfectionism': -0.7,
        'order': -0.6,
        'deliberation': -0.6,
        'competence': -0.5,
        'analytical_thinking': -0.5,
        'processing_speed': -0.4,
        // Personality Type poles
        'sensing': -0.3,
        'intuition': 0.3,
      },
    ),

    // Q11: "Я часто ловлю себя на том, что слушаю человека, но теряю нить разговора."
    'adhd_attention_profile_v2:q11': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q11',
      axisWeights: {
        'attention_control': -1.0,
        'active_listening': -0.9,
        'empathy': -0.5,
        'social_perception': -0.6,
        'working_memory': -0.7,
        'verbal_communication': -0.4,
        'rumination': 0.5,
        // Personality Type poles
        'introversion': 0.3,
      },
    ),

    // Q16: "Мне обычно удаётся сосредоточиться, даже если вокруг много отвлекающих факторов." (REVERSED)
    'adhd_attention_profile_v2:q16': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q16',
      axisWeights: {
        // Reversed: high answer = LOW inattention = good attention
        'attention_control': 1.0,
        'self_discipline': 0.8,
        'stress_tolerance': 0.6,
        'composure': 0.5,
        'environmental_mastery': 0.6,
        'cognitive_flexibility': 0.4,
        // Personality Type poles
        'judging': 0.3,
      },
    ),

    // Q21: "Когда я работаю, мой мозг легко переключается на посторонние мысли или стимулы."
    'adhd_attention_profile_v2:q21': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q21',
      axisWeights: {
        'attention_control': -1.0,
        'cognitive_flexibility': 0.4, // Can switch easily (positive)
        'fantasy': 0.6,
        'creativity': 0.4,
        'rumination': 0.5,
        'mindfulness_coping': -0.6,
        'self_discipline': -0.7,
        // Personality Type poles
        'perceiving': 0.3,
        'intuition': 0.3,
      },
    ),

    // Q26: "Если я ставлю себе цель, я обычно довожу дело до конца без частых отвлечений." (REVERSED)
    'adhd_attention_profile_v2:q26': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q26',
      axisWeights: {
        // Reversed: high answer = LOW inattention
        'attention_control': 1.0,
        'persistence': 0.9,
        'self_discipline': 0.9,
        'achievement_striving': 0.8,
        'goal_orientation': 0.7,
        'diligence': 0.7,
        'competence': 0.6,
        // Personality Type poles
        'judging': 0.4,
      },
    ),

    // Q31: "Я часто начинаю читать или смотреть что-то, и в итоге не помню, о чём это было."
    'adhd_attention_profile_v2:q31': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q31',
      axisWeights: {
        'attention_control': -1.0,
        'working_memory': -0.9,
        'learning_ability': -0.6,
        'intellectual_curiosity': -0.4,
        'mindfulness_coping': -0.5,
        'self_awareness': -0.4,
        'cognitive_flexibility': -0.3,
        // Personality Type poles
        'perceiving': 0.2,
      },
    ),

    // Q36: "Когда задача для меня важна, я могу довольно долго удерживать устойчивый фокус." (REVERSED)
    'adhd_attention_profile_v2:q36': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q36',
      axisWeights: {
        // Reversed: high answer = LOW inattention
        'attention_control': 1.0,
        'intrinsic_motivation': 0.8,
        'persistence': 0.8,
        'self_discipline': 0.7,
        'achievement_striving': 0.6,
        'passion_vitality': 0.5,
        'competence': 0.5,
        // Personality Type poles
        'judging': 0.3,
      },
    ),

    // Q41: "При работе за компьютером я постоянно перескакиваю между окнами и приложениями."
    'adhd_attention_profile_v2:q41': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q41',
      axisWeights: {
        'attention_control': -1.0,
        'self_discipline': -0.8,
        'impulsiveness': 0.6,
        'novelty_seeking': 0.5,
        'stimulation': 0.5,
        'procrastination': 0.6,
        'cognitive_flexibility': 0.3, // Can switch
        // Personality Type poles
        'perceiving': 0.3,
      },
    ),

    // Q46: "Если мне нужно внимательно кого-то выслушать, я способен(на) это сделать без сильных отвлечений." (REVERSED)
    'adhd_attention_profile_v2:q46': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q46',
      axisWeights: {
        // Reversed: high answer = LOW inattention
        'attention_control': 1.0,
        'active_listening': 0.9,
        'empathy': 0.6,
        'social_perception': 0.5,
        'respect': 0.5,
        'politeness': 0.4,
        'self_discipline': 0.5,
        // Personality Type poles
        'feeling': 0.3,
      },
    ),

    // ============================================================
    // HYPERACTIVITY & RESTLESSNESS FACTOR (10 questions)
    // ============================================================

    // Q2: "Мне сложно спокойно сидеть, я часто ерзаю или двигаю руками и ногами."
    'adhd_attention_profile_v2:q2': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q2',
      axisWeights: {
        'activity': 0.9,
        'excitement_seeking': 0.6,
        'impulsiveness': 0.5,
        'patience': -0.8,
        'calmness': -0.9,
        'composure': -0.7,
        'deliberation': -0.4,
        // Personality Type poles
        'extraversion': 0.3,
        'perceiving': 0.2,
      },
    ),

    // Q7: "Даже когда вокруг тихо, внутри я чувствую себя так, будто у меня не выключается «двигатель»."
    'adhd_attention_profile_v2:q7': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q7',
      axisWeights: {
        'activity': 0.9,
        'anxiety': 0.6,
        'calmness': -1.0,
        'composure': -0.8,
        'stress_tolerance': -0.5,
        'emotional_resilience': -0.4,
        'mindfulness_coping': -0.6,
        // Personality Type poles
        'extraversion': 0.2,
      },
    ),

    // Q12: "Мне легко расслабиться и просто ничего не делать, когда это нужно." (REVERSED)
    'adhd_attention_profile_v2:q12': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q12',
      axisWeights: {
        // Reversed: high answer = LOW hyperactivity
        'calmness': 1.0,
        'composure': 0.9,
        'stress_tolerance': 0.7,
        'emotional_resilience': 0.6,
        'patience': 0.8,
        'mindfulness_coping': 0.6,
        'self_acceptance': 0.5,
        // Personality Type poles
        'introversion': 0.3,
      },
    ),

    // Q17: "Я часто начинаю делать несколько дел одновременно, потому что чувствую внутреннее беспокойство."
    'adhd_attention_profile_v2:q17': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q17',
      axisWeights: {
        'activity': 0.8,
        'anxiety': 0.7,
        'attention_control': -0.6,
        'organization': -0.5,
        'calmness': -0.7,
        'patience': -0.6,
        'impulsiveness': 0.5,
        // Personality Type poles
        'perceiving': 0.3,
      },
    ),

    // Q22: "Мне трудно оставаться на месте, когда нужно долго ждать."
    'adhd_attention_profile_v2:q22': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q22',
      axisWeights: {
        'patience': -1.0,
        'calmness': -0.8,
        'composure': -0.7,
        'frustration_tolerance': -0.7,
        'activity': 0.7,
        'impulsiveness': 0.5,
        'self_discipline': -0.5,
        // Personality Type poles
        'perceiving': 0.2,
      },
    ),

    // Q27: "Во время отдыха я действительно чувствую себя спокойным(ой) и расслабленным(ой)." (REVERSED)
    'adhd_attention_profile_v2:q27': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q27',
      axisWeights: {
        // Reversed: high answer = LOW hyperactivity
        'calmness': 1.0,
        'composure': 0.9,
        'emotional_resilience': 0.7,
        'stress_tolerance': 0.7,
        'life_satisfaction': 0.5,
        'happiness': 0.5,
        'self_acceptance': 0.5,
        // Personality Type poles
        'introversion': 0.2,
      },
    ),

    // Q32: "Мне сложно сидеть спокойно, даже если ситуация формально этого требует."
    'adhd_attention_profile_v2:q32': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q32',
      axisWeights: {
        'activity': 0.9,
        'patience': -0.9,
        'calmness': -0.8,
        'composure': -0.7,
        'conformity': -0.5,
        'dutifulness': -0.4,
        'impulsiveness': 0.5,
        // Personality Type poles
        'perceiving': 0.3,
      },
    ),

    // Q37: "В ситуациях, где нужно сидеть спокойно, я обычно чувствую себя достаточно комфортно." (REVERSED)
    'adhd_attention_profile_v2:q37': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q37',
      axisWeights: {
        // Reversed: high answer = LOW hyperactivity
        'calmness': 1.0,
        'composure': 0.8,
        'patience': 0.9,
        'self_discipline': 0.6,
        'conformity': 0.4,
        'emotional_resilience': 0.5,
        'stress_tolerance': 0.5,
        // Personality Type poles
        'judging': 0.2,
      },
    ),

    // Q42: "Когда я сильно взволнован(а), мне трудно сидеть спокойно."
    'adhd_attention_profile_v2:q42': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q42',
      axisWeights: {
        'activity': 0.8,
        'emotional_reactivity': 0.8,
        'calmness': -0.7,
        'composure': -0.8,
        'stress_tolerance': -0.5,
        'emotion_focused_coping': -0.4,
        'impulsiveness': 0.5,
        // Personality Type poles
        'feeling': 0.3,
      },
    ),

    // Q47: "Когда у меня появляется возможность спокойно полежать или посидеть, я действительно могу этим наслаждаться." (REVERSED)
    'adhd_attention_profile_v2:q47': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q47',
      axisWeights: {
        // Reversed: high answer = LOW hyperactivity
        'calmness': 1.0,
        'composure': 0.8,
        'hedonism': 0.5,
        'life_satisfaction': 0.5,
        'happiness': 0.4,
        'self_acceptance': 0.5,
        'mindfulness_coping': 0.6,
        // Personality Type poles
        'introversion': 0.3,
      },
    ),

    // ============================================================
    // IMPULSIVITY FACTOR (10 questions)
    // ============================================================

    // Q3: "Я часто говорю или действую, не успев толком подумать, а потом жалею об этом."
    'adhd_attention_profile_v2:q3': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q3',
      axisWeights: {
        'impulsiveness': 1.0,
        'deliberation': -0.9,
        'self_discipline': -0.7,
        'composure': -0.6,
        'prudence': -0.7,
        'rumination': 0.5, // regret leads to rumination
        'self_compassion': -0.4,
        // Personality Type poles
        'perceiving': 0.3,
      },
    ),

    // Q8: "Мне трудно дождаться своей очереди или спокойно ждать, пока говорят другие."
    'adhd_attention_profile_v2:q8': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q8',
      axisWeights: {
        'impulsiveness': 0.9,
        'patience': -1.0,
        'active_listening': -0.7,
        'politeness': -0.6,
        'respect': -0.5,
        'compliance': -0.4,
        'frustration_tolerance': -0.6,
        // Personality Type poles
        'perceiving': 0.2,
      },
    ),

    // Q13: "Я легко принимаю спонтанные решения, даже если не продумал(а) все возможные последствия."
    'adhd_attention_profile_v2:q13': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q13',
      axisWeights: {
        'impulsiveness': 0.9,
        'risk_taking': 0.7,
        'spontaneity': 0.8,
        'deliberation': -0.8,
        'prudence': -0.7,
        'novelty_seeking': 0.5,
        'excitement_seeking': 0.5,
        // Personality Type poles
        'perceiving': 0.4,
      },
    ),

    // Q18: "Перед важными решениями я обычно тщательно взвешиваю плюсы и минусы." (REVERSED)
    'adhd_attention_profile_v2:q18': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q18',
      axisWeights: {
        // Reversed: high answer = LOW impulsivity
        'deliberation': 1.0,
        'prudence': 0.9,
        'analytical_thinking': 0.7,
        'critical_thinking': 0.6,
        'self_discipline': 0.6,
        'responsibility': 0.5,
        'harm_avoidance': 0.5,
        // Personality Type poles
        'thinking': 0.4,
        'judging': 0.3,
      },
    ),

    // Q23: "Иногда я совершаю импульсивные покупки или действия, о которых потом жалею."
    'adhd_attention_profile_v2:q23': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q23',
      axisWeights: {
        'impulsiveness': 1.0,
        'self_discipline': -0.8,
        'prudence': -0.7,
        'deliberation': -0.6,
        'hedonism': 0.5,
        'rumination': 0.5, // regret
        'self_compassion': -0.4,
        // Personality Type poles
        'perceiving': 0.3,
      },
    ),

    // Q28: "Если я сильно злюсь или раздражён(а), мне всё равно удаётся сдержать первые импульсы." (REVERSED)
    'adhd_attention_profile_v2:q28': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q28',
      axisWeights: {
        // Reversed: high answer = LOW impulsivity
        'composure': 1.0,
        'emotional_resilience': 0.8,
        'self_discipline': 0.8,
        'anger': -0.7,
        'emotion_focused_coping': 0.6,
        'conflict_management': 0.5,
        'stress_tolerance': 0.6,
        // Personality Type poles
        'thinking': 0.3,
      },
    ),

    // Q33: "Я нередко перебиваю людей, потому что мне трудно дождаться, пока они договорят."
    'adhd_attention_profile_v2:q33': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q33',
      axisWeights: {
        'impulsiveness': 0.9,
        'active_listening': -0.9,
        'politeness': -0.8,
        'patience': -0.8,
        'respect': -0.6,
        'empathy': -0.4,
        'communication_quality': -0.5,
        // Personality Type poles
        'perceiving': 0.2,
      },
    ),

    // Q38: "Даже когда я испытываю сильные эмоции, мне удаётся не реагировать моментально." (REVERSED)
    'adhd_attention_profile_v2:q38': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q38',
      axisWeights: {
        // Reversed: high answer = LOW impulsivity
        'composure': 1.0,
        'emotional_resilience': 0.8,
        'deliberation': 0.7,
        'self_discipline': 0.7,
        'emotion_focused_coping': 0.6,
        'mindfulness_coping': 0.5,
        'prudence': 0.5,
        // Personality Type poles
        'thinking': 0.3,
      },
    ),

    // Q43: "Я иногда отправляю сообщения или комментарии, о которых позже жалею."
    'adhd_attention_profile_v2:q43': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q43',
      axisWeights: {
        'impulsiveness': 0.9,
        'deliberation': -0.8,
        'prudence': -0.7,
        'verbal_communication': -0.5,
        'rumination': 0.6, // regret
        'self_compassion': -0.4,
        'self_monitoring': -0.5,
        // Personality Type poles
        'perceiving': 0.2,
      },
    ),

    // Q48: "Даже в эмоционально зарядной ситуации я часто успеваю подумать, прежде чем что-то сказать или сделать." (REVERSED)
    'adhd_attention_profile_v2:q48': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q48',
      axisWeights: {
        // Reversed: high answer = LOW impulsivity
        'deliberation': 1.0,
        'composure': 0.9,
        'prudence': 0.8,
        'self_discipline': 0.7,
        'emotional_resilience': 0.6,
        'wisdom': 0.4,
        'maturity': 0.4,
        // Personality Type poles
        'thinking': 0.3,
        'judging': 0.2,
      },
    ),

    // ============================================================
    // ORGANIZATION & PLANNING FACTOR (10 questions)
    // ============================================================

    // Q4: "Мне трудно планировать свои дела так, чтобы всё успевать вовремя."
    'adhd_attention_profile_v2:q4': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q4',
      axisWeights: {
        'organization': -1.0,
        'self_discipline': -0.8,
        'punctuality': -0.8,
        'order': -0.7,
        'responsibility': -0.6,
        'strategic_thinking': -0.5,
        'procrastination': 0.7,
        // Personality Type poles
        'perceiving': 0.4,
      },
    ),

    // Q9: "В моём рабочем пространстве или дома часто бывает беспорядок, который мешает мне собраться."
    'adhd_attention_profile_v2:q9': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q9',
      axisWeights: {
        'order': -1.0,
        'organization': -0.9,
        'environmental_mastery': -0.7,
        'self_discipline': -0.6,
        'attention_control': -0.5,
        'competence': -0.4,
        'procrastination': 0.5,
        // Personality Type poles
        'perceiving': 0.4,
      },
    ),

    // Q14: "Я без особых усилий разбиваю большую задачу на маленькие шаги и следую этому плану." (REVERSED)
    'adhd_attention_profile_v2:q14': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q14',
      axisWeights: {
        // Reversed: high answer = LOW organization problems
        'organization': 1.0,
        'strategic_thinking': 0.8,
        'self_discipline': 0.8,
        'analytical_thinking': 0.6,
        'problem_solving': 0.6,
        'persistence': 0.6,
        'competence': 0.5,
        // Personality Type poles
        'judging': 0.4,
      },
    ),

    // Q19: "Я часто опаздываю или сдаю задачи позже срока, потому что не рассчитал(а) время."
    'adhd_attention_profile_v2:q19': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q19',
      axisWeights: {
        'punctuality': -1.0,
        'organization': -0.9,
        'responsibility': -0.7,
        'self_discipline': -0.7,
        'dutifulness': -0.6,
        'processing_speed': -0.4,
        'procrastination': 0.7,
        // Personality Type poles
        'perceiving': 0.4,
      },
    ),

    // Q24: "Я часто теряю или забываю, где лежат важные вещи."
    'adhd_attention_profile_v2:q24': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q24',
      axisWeights: {
        'order': -0.9,
        'organization': -0.9,
        'working_memory': -0.8,
        'attention_control': -0.6,
        'environmental_mastery': -0.5,
        'competence': -0.4,
        'self_discipline': -0.5,
        // Personality Type poles
        'perceiving': 0.3,
      },
    ),

    // Q29: "Список дел действительно помогает мне, и я обычно следую ему без особых проблем." (REVERSED)
    'adhd_attention_profile_v2:q29': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q29',
      axisWeights: {
        // Reversed: high answer = LOW organization problems
        'organization': 1.0,
        'self_discipline': 0.9,
        'order': 0.8,
        'persistence': 0.6,
        'diligence': 0.6,
        'dutifulness': 0.5,
        'competence': 0.5,
        // Personality Type poles
        'judging': 0.4,
      },
    ),

    // Q34: "Мне сложно организовать свой день так, чтобы оставалось время и на дела, и на отдых."
    'adhd_attention_profile_v2:q34': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q34',
      axisWeights: {
        'organization': -0.9,
        'self_discipline': -0.7,
        'life_satisfaction': -0.5,
        'environmental_mastery': -0.6,
        'stress_tolerance': -0.5,
        'balance': -0.6,
        'autonomy_wellbeing': -0.4,
        // Personality Type poles
        'perceiving': 0.3,
      },
    ),

    // Q39: "У меня есть рабочие привычки и ритуалы, которые помогают держать дела и пространство в порядке." (REVERSED)
    'adhd_attention_profile_v2:q39': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q39',
      axisWeights: {
        // Reversed: high answer = LOW organization problems
        'organization': 1.0,
        'order': 0.9,
        'self_discipline': 0.8,
        'environmental_mastery': 0.7,
        'diligence': 0.5,
        'prudence': 0.5,
        'tradition': 0.3,
        // Personality Type poles
        'judging': 0.4,
      },
    ),

    // Q44: "Я часто берусь сразу за несколько проектов и потом с трудом их координирую."
    'adhd_attention_profile_v2:q44': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q44',
      axisWeights: {
        'organization': -0.8,
        'self_discipline': -0.7,
        'strategic_thinking': -0.6,
        'ambition': 0.5, // Takes on many things
        'novelty_seeking': 0.4,
        'impulsiveness': 0.5,
        'stress_tolerance': -0.5,
        // Personality Type poles
        'perceiving': 0.3,
      },
    ),

    // Q49: "Я обычно заранее думаю, как организовать пространство, чтобы потом не искать вещи." (REVERSED)
    'adhd_attention_profile_v2:q49': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q49',
      axisWeights: {
        // Reversed: high answer = LOW organization problems
        'order': 1.0,
        'organization': 0.9,
        'strategic_thinking': 0.7,
        'deliberation': 0.6,
        'prudence': 0.6,
        'environmental_mastery': 0.6,
        'competence': 0.5,
        // Personality Type poles
        'judging': 0.4,
      },
    ),

    // ============================================================
    // EMOTIONAL SELF-REGULATION FACTOR (10 questions)
    // ============================================================

    // Q5: "Моё настроение может резко меняться из-за, казалось бы, мелких событий."
    'adhd_attention_profile_v2:q5': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q5',
      axisWeights: {
        'mood_stability': -1.0,
        'emotional_reactivity': 0.9,
        'emotional_resilience': -0.7,
        'stress_tolerance': -0.6,
        'vulnerability': 0.7,
        'calmness': -0.5,
        'composure': -0.6,
        // Personality Type poles
        'feeling': 0.4,
      },
    ),

    // Q10: "Из-за усталости или перегруза я легко срываюсь на окружающих."
    'adhd_attention_profile_v2:q10': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q10',
      axisWeights: {
        'anger': 0.9,
        'stress_tolerance': -0.9,
        'composure': -0.8,
        'emotional_resilience': -0.7,
        'conflict_management': -0.6,
        'empathy': -0.4,
        'politeness': -0.5,
        // Personality Type poles
        'feeling': 0.3,
      },
    ),

    // Q15: "Даже когда меня что-то сильно раздражает, я обычно сохраняю внешнее спокойствие." (REVERSED)
    'adhd_attention_profile_v2:q15': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q15',
      axisWeights: {
        // Reversed: high answer = LOW emotional regulation problems
        'composure': 1.0,
        'emotional_resilience': 0.8,
        'stress_tolerance': 0.7,
        'self_discipline': 0.6,
        'calmness': 0.7,
        'self_monitoring': 0.5,
        'maturity': 0.4,
        // Personality Type poles
        'thinking': 0.3,
      },
    ),

    // Q20: "Мне сложно переключиться с неприятной ситуации, я долго прокручиваю её в голове."
    'adhd_attention_profile_v2:q20': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q20',
      axisWeights: {
        'rumination': 1.0,
        'emotional_resilience': -0.8,
        'cognitive_flexibility': -0.6,
        'stress_tolerance': -0.6,
        'worry_tendency': 0.7,
        'anxiety': 0.6,
        'acceptance': -0.6,
        // Personality Type poles
        'feeling': 0.3,
      },
    ),

    // Q25: "Я часто испытываю чувство вины за то, что не справляюсь с делами так, как планировал(а)."
    'adhd_attention_profile_v2:q25': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q25',
      axisWeights: {
        'self_compassion': -0.9,
        'rumination': 0.8,
        'self_esteem': -0.7,
        'depression': 0.6,
        'perfectionism': 0.5,
        'self_acceptance': -0.7,
        'vulnerability': 0.5,
        // Personality Type poles
        'feeling': 0.3,
      },
    ),

    // Q30: "В стрессовых ситуациях я относительно быстро прихожу в себя и начинаю действовать более рационально." (REVERSED)
    'adhd_attention_profile_v2:q30': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q30',
      axisWeights: {
        // Reversed: high answer = LOW emotional regulation problems
        'emotional_resilience': 1.0,
        'stress_tolerance': 0.9,
        'composure': 0.8,
        'problem_focused_coping': 0.7,
        'cognitive_reappraisal': 0.6,
        'resilience_meta': 0.6,
        'maturity': 0.5,
        // Personality Type poles
        'thinking': 0.3,
      },
    ),

    // Q35: "Небольшие трудности или задержки могут сильно испортить мне настроение на весь день."
    'adhd_attention_profile_v2:q35': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q35',
      axisWeights: {
        'frustration_tolerance': -1.0,
        'emotional_resilience': -0.8,
        'mood_stability': -0.8,
        'vulnerability': 0.7,
        'catastrophizing': 0.6,
        'stress_tolerance': -0.6,
        'patience': -0.5,
        // Personality Type poles
        'feeling': 0.3,
      },
    ),

    // Q40: "После стрессовых событий я обычно достаточно быстро нахожу способы восстановиться." (REVERSED)
    'adhd_attention_profile_v2:q40': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q40',
      axisWeights: {
        // Reversed: high answer = LOW emotional regulation problems
        'emotional_resilience': 1.0,
        'stress_tolerance': 0.9,
        'emotion_focused_coping': 0.7,
        'self_compassion': 0.6,
        'resilience_meta': 0.7,
        'vitality': 0.5,
        'happiness': 0.4,
        // Personality Type poles
        'thinking': 0.2,
      },
    ),

    // Q45: "Когда что-то идёт не по плану, я могу надолго застревать в раздражении или разочаровании."
    'adhd_attention_profile_v2:q45': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q45',
      axisWeights: {
        'frustration_tolerance': -0.9,
        'rumination': 0.9,
        'emotional_resilience': -0.8,
        'cognitive_flexibility': -0.6,
        'anger': 0.6,
        'acceptance': -0.6,
        'stress_tolerance': -0.5,
        // Personality Type poles
        'feeling': 0.3,
      },
    ),

    // Q50: "Когда я переживаю сильные эмоции, у меня есть способы успокоиться и поддержать себя." (REVERSED)
    'adhd_attention_profile_v2:q50': QuestionWeight(
      testId: 'adhd_attention_profile_v2',
      questionId: 'q50',
      axisWeights: {
        // Reversed: high answer = LOW emotional regulation problems
        'emotional_resilience': 1.0,
        'emotion_focused_coping': 0.9,
        'self_compassion': 0.8,
        'stress_tolerance': 0.7,
        'mindfulness_coping': 0.6,
        'self_awareness': 0.6,
        'maturity': 0.5,
        // Personality Type poles
        'thinking': 0.2,
      },
    ),
  };
}
