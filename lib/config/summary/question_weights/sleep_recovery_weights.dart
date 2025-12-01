import 'question_weight_models.dart';

/// Question weights for Sleep Quality and Recovery Test
///
/// Maps 40 questions to psychological scales
/// 8 factors: sleep_rhythm, sleep_quality, daytime_functioning,
///            screens_and_habits, stress_and_recovery, sleep_environment,
///            physical_symptoms, sleep_disorders
class SleepRecoveryWeights {
  static final Map<String, QuestionWeight> weights = {
    // ========================================================================
    // SLEEP_RHYTHM (Q1, Q2, Q16)
    // Регулярность отхода ко сну и подъёма, длительность сна
    // ========================================================================

    'sleep_recovery_v1:q1': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q1',
      axisWeights: {
        'self_discipline': 0.8,
        'routine': 0.9,
        'organization': 0.7,
        'self_control': 0.7,
        'conscientiousness': 0.6,
        'vitality': 0.6, // стабильный режим → энергия
        'health_awareness': 0.7,
      },
    ),

    'sleep_recovery_v1:q2': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q2',
      axisWeights: {
        'routine': 0.9,
        'self_discipline': 0.8,
        'organization': 0.7,
        'conscientiousness': 0.6,
        'vitality': 0.6,
        'health_awareness': 0.7,
        'flexibility': -0.5, // reversed - жесткий режим
      },
    ),

    // ========================================================================
    // SLEEP_QUALITY (Q3, Q4, Q5, Q13)
    // Глубина сна, непрерывность, ощущение отдыха по утрам
    // ========================================================================

    'sleep_recovery_v1:q3': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q3',
      axisWeights: {
        'relaxation': 0.8,
        'calmness': 0.8,
        'emotional_stability': 0.6,
        'anxiety': -0.7, // reversed
        'stress_tolerance': 0.7,
        'inner_peace': 0.7,
        'composure': 0.6,
      },
    ),

    'sleep_recovery_v1:q4': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q4',
      axisWeights: {
        'relaxation': 0.9,
        'calmness': 0.9,
        'inner_peace': 0.8,
        'anxiety': -0.9, // reversed
        'worry': -0.8, // reversed
        'restlessness': -0.9, // reversed
        'emotional_stability': 0.7,
        'composure': 0.7,
      },
    ),

    'sleep_recovery_v1:q5': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q5',
      axisWeights: {
        'vitality': 0.9,
        'energy': 0.9,
        'optimism': 0.7,
        'wellbeing': 0.8,
        'positive_mood': 0.7,
        'life_satisfaction': 0.6,
        'emotional_stability': 0.6,
        'fatigue': -0.9, // reversed
      },
    ),

    // ========================================================================
    // DAYTIME_FUNCTIONING (Q6, Q7, Q8) - Q6 и Q8 reversed
    // Сонливость днём, уровень энергии и концентрации
    // ========================================================================

    'sleep_recovery_v1:q6': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q6',
      axisWeights: {
        'fatigue': 0.9,
        'vitality': -0.9, // reversed
        'energy': -0.9, // reversed
        'motivation': -0.7, // reversed
        'attentiveness': -0.7, // reversed
        'productivity': -0.7, // reversed
        'wellbeing': -0.6, // reversed
      },
    ),

    'sleep_recovery_v1:q7': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q7',
      axisWeights: {
        'vitality': 0.9,
        'energy': 0.9,
        'attentiveness': 0.8,
        'attention_control': 0.8,
        'motivation': 0.7,
        'productivity': 0.8,
        'mental_clarity': 0.7,
        'fatigue': -0.9, // reversed
      },
    ),

    'sleep_recovery_v1:q8': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q8',
      axisWeights: {
        'fatigue': 0.9,
        'vitality': -0.9, // reversed
        'energy': -0.9, // reversed
        'attentiveness': -0.8, // reversed
        'attention_control': -0.8, // reversed
        'wellbeing': -0.7, // reversed
        'health_awareness': -0.6, // reversed
      },
    ),

    // ========================================================================
    // SCREENS_AND_HABITS (Q9, Q10, Q11, Q14, Q19) - Q10 и Q14 reversed
    // Использование экранов, кофеина и условия в спальне
    // ========================================================================

    'sleep_recovery_v1:q9': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q9',
      axisWeights: {
        'self_discipline': 0.8,
        'self_control': 0.8,
        'health_awareness': 0.9,
        'mindfulness': 0.7,
        'impulse_control': 0.7,
        'conscientiousness': 0.6,
        'impulsiveness': -0.7, // reversed
      },
    ),

    'sleep_recovery_v1:q10': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q10',
      axisWeights: {
        'impulsiveness': 0.8,
        'distraction': 0.8,
        'self_discipline': -0.8, // reversed
        'self_control': -0.8, // reversed
        'health_awareness': -0.7, // reversed
        'mindfulness': -0.7, // reversed
        'attention_control': -0.6, // reversed
      },
    ),

    'sleep_recovery_v1:q11': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q11',
      axisWeights: {
        'health_awareness': 0.9,
        'self_care': 0.8,
        'organization': 0.7,
        'environmental_sensitivity': 0.6,
        'conscientiousness': 0.6,
        'wellbeing': 0.6,
      },
    ),

    // ========================================================================
    // STRESS_AND_RECOVERY (Q12, Q15, Q17, Q18, Q20) - Q12 и Q15 reversed
    // Влияние стресса и тревожных мыслей на сон
    // ========================================================================

    'sleep_recovery_v1:q12': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q12',
      axisWeights: {
        'worry': 0.9,
        'rumination': 0.9,
        'anxiety': 0.8,
        'stress': 0.8,
        'relaxation': -0.9, // reversed
        'calmness': -0.8, // reversed
        'emotional_stability': -0.7, // reversed
        'inner_peace': -0.8, // reversed
      },
    ),

    'sleep_recovery_v1:q13': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q13',
      axisWeights: {
        'relaxation': 0.9,
        'calmness': 0.8,
        'inner_peace': 0.8,
        'emotional_stability': 0.7,
        'composure': 0.7,
        'anxiety': -0.8, // reversed
        'worry': -0.7, // reversed
      },
    ),

    'sleep_recovery_v1:q14': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q14',
      axisWeights: {
        'impulsiveness': 0.7,
        'health_awareness': -0.9, // reversed
        'self_discipline': -0.7, // reversed
        'self_control': -0.7, // reversed
        'mindfulness': -0.6, // reversed
      },
    ),

    'sleep_recovery_v1:q15': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q15',
      axisWeights: {
        'anxiety': 0.9,
        'worry': 0.9,
        'performance_anxiety': 0.8,
        'rumination': 0.8,
        'stress': 0.7,
        'relaxation': -0.9, // reversed
        'calmness': -0.8, // reversed
        'composure': -0.7, // reversed
      },
    ),

    'sleep_recovery_v1:q16': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q16',
      axisWeights: {
        'health_awareness': 0.9,
        'self_discipline': 0.8,
        'self_care': 0.8,
        'routine': 0.7,
        'conscientiousness': 0.6,
        'vitality': 0.7,
        'wellbeing': 0.6,
      },
    ),

    'sleep_recovery_v1:q17': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q17',
      axisWeights: {
        'resilience': 0.9,
        'stress_tolerance': 0.9,
        'emotional_resilience': 0.9,
        'adaptability': 0.7,
        'vitality': 0.8,
        'recovery': 0.9,
        'wellbeing': 0.7,
      },
    ),

    'sleep_recovery_v1:q18': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q18',
      axisWeights: {
        'vitality': 0.8,
        'emotional_stability': 0.8,
        'positive_mood': 0.9,
        'optimism': 0.7,
        'wellbeing': 0.8,
        'life_satisfaction': 0.6,
        'recovery': 0.7,
      },
    ),

    'sleep_recovery_v1:q19': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q19',
      axisWeights: {
        'self_discipline': 0.8,
        'routine': 0.9,
        'mindfulness': 0.8,
        'self_care': 0.8,
        'health_awareness': 0.8,
        'relaxation': 0.7,
        'organization': 0.6,
      },
    ),

    'sleep_recovery_v1:q20': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q20',
      axisWeights: {
        'self_awareness': 0.9,
        'health_awareness': 0.9,
        'adaptability': 0.8,
        'proactivity': 0.8,
        'self_discipline': 0.7,
        'problem_solving': 0.6,
        'mindfulness': 0.7,
      },
    ),

    // ========================================================================
    // SLEEP_ENVIRONMENT (Q21-Q25)
    // Условия в спальне: температура, свет, шум, комфорт
    // ========================================================================

    'sleep_recovery_v1:q21': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q21',
      axisWeights: {
        'health_awareness': 0.8,
        'self_care': 0.8,
        'environmental_sensitivity': 0.9,
        'organization': 0.6,
        'wellbeing': 0.7,
        'vitality': 0.6,
      },
    ),

    'sleep_recovery_v1:q22': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q22',
      axisWeights: {
        'environmental_sensitivity': 0.9,
        'distraction': 0.8,
        'stress': 0.7,
        'relaxation': -0.8, // reversed
        'calmness': -0.7, // reversed
        'sleep_quality': -0.7, // reversed
      },
    ),

    'sleep_recovery_v1:q23': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q23',
      axisWeights: {
        'health_awareness': 0.9,
        'self_care': 0.8,
        'organization': 0.7,
        'environmental_sensitivity': 0.8,
        'sleep_quality': 0.7,
      },
    ),

    'sleep_recovery_v1:q24': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q24',
      axisWeights: {
        'physical_discomfort': 0.9,
        'sleep_quality': -0.9, // reversed
        'wellbeing': -0.7, // reversed
        'self_care': -0.7, // reversed
        'health_awareness': -0.6, // reversed
      },
    ),

    'sleep_recovery_v1:q25': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q25',
      axisWeights: {
        'self_discipline': 0.8,
        'organization': 0.9,
        'boundaries': 0.8,
        'health_awareness': 0.8,
        'work_life_balance': 0.7,
        'sleep_quality': 0.7,
      },
    ),

    // ========================================================================
    // PHYSICAL_SYMPTOMS (Q26-Q30) - Q26, Q28 reversed
    // Физические симптомы и дискомфорт
    // ========================================================================

    'sleep_recovery_v1:q26': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q26',
      axisWeights: {
        'physical_discomfort': 0.9,
        'sleep_quality': -0.9, // reversed
        'vitality': -0.7, // reversed
        'wellbeing': -0.8, // reversed
        'health_issues': 0.8,
      },
    ),

    'sleep_recovery_v1:q27': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q27',
      axisWeights: {
        'wellbeing': 0.8,
        'vitality': 0.8,
        'health_awareness': 0.7,
        'sleep_quality': 0.8,
        'physical_discomfort': -0.9, // reversed (no pain)
      },
    ),

    'sleep_recovery_v1:q28': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q28',
      axisWeights: {
        'physical_discomfort': 0.8,
        'sleep_quality': -0.8, // reversed
        'environmental_sensitivity': 0.7,
        'wellbeing': -0.7, // reversed
        'health_issues': 0.7,
      },
    ),

    'sleep_recovery_v1:q29': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q29',
      axisWeights: {
        'sleep_quality': 0.9,
        'wellbeing': 0.8,
        'relaxation': 0.8,
        'physical_discomfort': -0.9, // reversed (comfort = no discomfort)
        'restlessness': -0.7, // reversed
      },
    ),

    'sleep_recovery_v1:q30': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q30',
      axisWeights: {
        'vitality': 0.9,
        'energy': 0.9,
        'recovery': 0.9,
        'wellbeing': 0.8,
        'optimism': 0.7,
        'fatigue': -0.9, // reversed
      },
    ),

    // ========================================================================
    // SLEEP_DISORDERS (Q31-Q40) - Q32, Q36 reversed
    // Признаки нарушений сна: храп, апноэ, бессонница
    // ========================================================================

    'sleep_recovery_v1:q31': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q31',
      axisWeights: {
        'sleep_disorders': 0.9,
        'health_issues': 0.8,
        'sleep_quality': -0.7, // reversed (snoring affects quality)
        'vitality': -0.6, // reversed
      },
    ),

    'sleep_recovery_v1:q32': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q32',
      axisWeights: {
        'sleep_disorders': 0.9,
        'health_issues': 0.9,
        'anxiety': 0.8,
        'sleep_quality': -0.9, // reversed
        'wellbeing': -0.8, // reversed
      },
    ),

    'sleep_recovery_v1:q33': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q33',
      axisWeights: {
        'sleep_disorders': 0.9,
        'restlessness': 0.9,
        'physical_discomfort': 0.8,
        'sleep_quality': -0.8, // reversed
        'relaxation': -0.7, // reversed
      },
    ),

    'sleep_recovery_v1:q34': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q34',
      axisWeights: {
        'sleep_quality': 0.9,
        'relaxation': 0.8,
        'self_control': 0.7,
        'calmness': 0.8,
        'sleep_disorders': -0.9, // reversed (can fall asleep = no disorder)
      },
    ),

    'sleep_recovery_v1:q35': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q35',
      axisWeights: {
        'anxiety': 0.9,
        'stress': 0.8,
        'worry': 0.8,
        'sleep_quality': -0.7, // reversed
        'emotional_stability': -0.7, // reversed
        'sleep_disorders': 0.7,
      },
    ),

    'sleep_recovery_v1:q36': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q36',
      axisWeights: {
        'sleep_disorders': 0.9,
        'anxiety': 0.7,
        'sleep_quality': -0.9, // reversed
        'vitality': -0.7, // reversed
        'wellbeing': -0.7, // reversed
      },
    ),

    'sleep_recovery_v1:q37': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q37',
      axisWeights: {
        'fatigue': 0.9,
        'sleep_disorders': 0.8,
        'vitality': -0.9, // reversed
        'energy': -0.9, // reversed
        'attentiveness': -0.7, // reversed
      },
    ),

    'sleep_recovery_v1:q38': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q38',
      axisWeights: {
        'sleep_disorders': 0.9,
        'restlessness': 0.9,
        'physical_discomfort': 0.8,
        'sleep_quality': -0.8, // reversed
      },
    ),

    'sleep_recovery_v1:q39': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q39',
      axisWeights: {
        'sleep_disorders': 0.9,
        'fatigue': 0.9,
        'health_issues': 0.9,
        'vitality': -0.9, // reversed
        'attentiveness': -0.9, // reversed
        'safety_awareness': -0.8, // reversed (dangerous situation)
      },
    ),

    'sleep_recovery_v1:q40': const QuestionWeight(
      testId: 'sleep_recovery_v1',
      questionId: 'q40',
      axisWeights: {
        'sleep_quality': 0.9,
        'wellbeing': 0.8,
        'vitality': 0.8,
        'sleep_disorders': -0.9, // reversed (no problems = no disorders)
        'health_awareness': 0.7,
      },
    ),
  };
}
