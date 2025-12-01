import 'question_weight_models.dart';

/// Question weights for Imposter Syndrome Test
///
/// Maps 42 questions to psychological scales
/// 6 factors: fear_of_exposure, achievement_devaluation, perfectionism,
///            challenge_avoidance, external_attribution, overcompensation
class ImposterSyndromeWeights {
  static final Map<String, QuestionWeight> weights = {
    // ========================================================================
    // FEAR OF EXPOSURE (Q1-Q7)
    // Страх разоблачения - тревога о том, что другие узнают о «мнимой» некомпетентности
    // ========================================================================

    'imposter_syndrome:q1': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q1',
      axisWeights: {
        'anxiety': 0.9,
        'self_doubt': 0.9,
        'fear_of_judgment': 0.9,
        'self_consciousness': 0.8,
        'social_anxiety': 0.8,
        'vulnerability': 0.7,
        'insecurity': 0.9,
        'self_esteem': -0.8, // reversed
        'confidence': -0.8, // reversed
        'self_efficacy': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q2': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q2',
      axisWeights: {
        'anxiety': 0.9,
        'self_doubt': 1.0,
        'fear_of_judgment': 0.9,
        'insecurity': 0.9,
        'worry': 0.8,
        'vulnerability': 0.8,
        'self_esteem': -0.9, // reversed
        'confidence': -0.9, // reversed
        'authenticity': -0.7, // reversed - чувство обмана
      },
    ),

    'imposter_syndrome:q3': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q3',
      axisWeights: {
        'anxiety': 0.8,
        'worry': 0.9,
        'fear_of_judgment': 0.8,
        'performance_anxiety': 0.9,
        'pressure': 0.8,
        'self_doubt': 0.7,
        'self_confidence': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q4': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q4',
      axisWeights: {
        'confidence': 0.9,
        'self_esteem': 0.9,
        'self_efficacy': 0.8,
        'self_assurance': 0.9,
        'assertiveness': 0.7,
        'anxiety': -0.8, // reversed
        'self_doubt': -0.9, // reversed
        'insecurity': -0.9, // reversed
      },
    ),

    'imposter_syndrome:q5': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q5',
      axisWeights: {
        'authenticity': -0.9, // reversed - притворство
        'self_doubt': 0.9,
        'insecurity': 0.9,
        'self_consciousness': 0.8,
        'confidence': -0.8, // reversed
        'self_esteem': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q6': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q6',
      axisWeights: {
        'social_anxiety': 0.9,
        'fear_of_judgment': 0.9,
        'self_consciousness': 0.8,
        'insecurity': 0.8,
        'assertiveness': -0.8, // reversed
        'confidence': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q7': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q7',
      axisWeights: {
        'avoidance': 0.9,
        'fear_of_judgment': 0.8,
        'anxiety': 0.8,
        'self_doubt': 0.8,
        'confidence': -0.8, // reversed
        'courage': -0.7, // reversed
      },
    ),

    // ========================================================================
    // ACHIEVEMENT DEVALUATION (Q8-Q14)
    // Обесценивание достижений - систематическое отрицание собственных заслуг
    // ========================================================================

    'imposter_syndrome:q8': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q8',
      axisWeights: {
        'self_esteem': -0.9, // reversed
        'self_satisfaction': -0.9, // reversed
        'self_doubt': 0.8,
        'pessimism': 0.7,
        'emotional_flatness': 0.6,
      },
    ),

    'imposter_syndrome:q9': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q9',
      axisWeights: {
        'self_esteem': -0.9, // reversed
        'self_doubt': 0.9,
        'self_criticism': 0.9,
        'pessimism': 0.7,
        'confidence': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q10': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q10',
      axisWeights: {
        'self_esteem': 0.9,
        'confidence': 0.9,
        'self_satisfaction': 0.9,
        'self_acceptance': 0.8,
        'self_doubt': -0.9, // reversed
        'self_criticism': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q11': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q11',
      axisWeights: {
        'self_doubt': 0.9,
        'self_esteem': -0.8, // reversed
        'self_efficacy': -0.8, // reversed
        'confidence': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q12': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q12',
      axisWeights: {
        'self_consciousness': 0.8,
        'self_esteem': -0.9, // reversed
        'discomfort': 0.7,
        'self_doubt': 0.8,
        'confidence': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q13': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q13',
      axisWeights: {
        'self_esteem': -0.9, // reversed
        'self_doubt': 0.8,
        'modesty': 0.6, // может быть позитивной в умеренных дозах
        'confidence': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q14': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q14',
      axisWeights: {
        'self_esteem': -0.9, // reversed
        'self_doubt': 0.9,
        'self_criticism': 0.8,
        'discomfort': 0.7,
        'confidence': -0.8, // reversed
      },
    ),

    // ========================================================================
    // PERFECTIONISM (Q15-Q21)
    // Перфекционизм - нереалистично высокие стандарты
    // ========================================================================

    'imposter_syndrome:q15': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q15',
      axisWeights: {
        'perfectionism': 0.9,
        'high_standards': 0.9,
        'self_criticism': 0.8,
        'rigidity': 0.7,
        'flexibility': -0.6, // reversed
      },
    ),

    'imposter_syndrome:q16': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q16',
      axisWeights: {
        'perfectionism': 0.9,
        'self_criticism': 0.9,
        'all_or_nothing_thinking': 0.9,
        'self_esteem': -0.8, // reversed
        'resilience': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q17': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q17',
      axisWeights: {
        'self_acceptance': 0.9,
        'resilience': 0.9,
        'growth_mindset': 0.9,
        'flexibility': 0.8,
        'perfectionism': -0.8, // reversed
        'self_criticism': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q18': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q18',
      axisWeights: {
        'perfectionism': 0.8,
        'self_criticism': 0.9,
        'self_doubt': 0.9,
        'all_or_nothing_thinking': 0.8,
        'resilience': -0.8, // reversed
        'self_esteem': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q19': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q19',
      axisWeights: {
        'perfectionism': 0.9,
        'obsessiveness': 0.8,
        'attention_to_detail': 0.7,
        'efficiency': -0.6, // reversed - непродуктивно
        'flexibility': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q20': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q20',
      axisWeights: {
        'perfectionism': 0.9,
        'procrastination': 0.8,
        'fear_of_failure': 0.9,
        'self_doubt': 0.8,
        'confidence': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q21': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q21',
      axisWeights: {
        'social_comparison': 0.9,
        'self_criticism': 0.8,
        'self_esteem': -0.8, // reversed
        'insecurity': 0.8,
        'contentment': -0.7, // reversed
      },
    ),

    // ========================================================================
    // CHALLENGE AVOIDANCE (Q22-Q28)
    // Избегание вызовов - уклонение от новых возможностей
    // ========================================================================

    'imposter_syndrome:q22': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q22',
      axisWeights: {
        'avoidance': 0.9,
        'fear_of_failure': 0.9,
        'anxiety': 0.8,
        'courage': -0.8, // reversed
        'risk_taking': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q23': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q23',
      axisWeights: {
        'avoidance': 0.9,
        'self_doubt': 0.9,
        'fear_of_failure': 0.8,
        'confidence': -0.9, // reversed
        'ambition': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q24': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q24',
      axisWeights: {
        'courage': 0.9,
        'confidence': 0.9,
        'openness_to_experience': 0.8,
        'growth_mindset': 0.8,
        'avoidance': -0.9, // reversed
        'fear_of_failure': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q25': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q25',
      axisWeights: {
        'avoidance': 0.9,
        'comfort_seeking': 0.8,
        'fear_of_failure': 0.8,
        'risk_taking': -0.8, // reversed
        'courage': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q26': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q26',
      axisWeights: {
        'anxiety': 0.9,
        'panic': 0.9,
        'avoidance': 0.8,
        'fear_of_failure': 0.8,
        'confidence': -0.8, // reversed
        'resilience': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q27': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q27',
      axisWeights: {
        'procrastination': 0.9,
        'avoidance': 0.9,
        'fear_of_failure': 0.8,
        'self_doubt': 0.8,
        'self_discipline': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q28': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q28',
      axisWeights: {
        'self_sabotage': 0.9,
        'avoidance': 0.8,
        'fear_of_failure': 0.9,
        'anxiety': 0.8,
        'confidence': -0.8, // reversed
      },
    ),

    // ========================================================================
    // EXTERNAL ATTRIBUTION (Q29-Q35)
    // Внешняя атрибуция успеха - приписывание достижений везению/внешним факторам
    // ========================================================================

    'imposter_syndrome:q29': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q29',
      axisWeights: {
        'external_locus_of_control': 0.9,
        'self_doubt': 0.8,
        'self_esteem': -0.8, // reversed
        'self_efficacy': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q30': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q30',
      axisWeights: {
        'internal_locus_of_control': 0.9,
        'self_efficacy': 0.9,
        'confidence': 0.9,
        'self_esteem': 0.8,
        'external_locus_of_control': -0.9, // reversed
        'self_doubt': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q31': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q31',
      axisWeights: {
        'external_locus_of_control': 0.9,
        'self_doubt': 0.8,
        'self_esteem': -0.8, // reversed
        'self_efficacy': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q32': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q32',
      axisWeights: {
        'external_locus_of_control': 0.9,
        'self_doubt': 0.9,
        'self_esteem': -0.9, // reversed
        'confidence': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q33': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q33',
      axisWeights: {
        'self_esteem': -0.9, // reversed
        'self_doubt': 0.8,
        'self_criticism': 0.7,
        'confidence': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q34': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q34',
      axisWeights: {
        'external_locus_of_control': 0.9,
        'self_criticism': 0.8,
        'self_doubt': 0.8,
        'pessimism': 0.7,
        'self_esteem': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q35': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q35',
      axisWeights: {
        'self_esteem': -0.9, // reversed
        'self_doubt': 0.9,
        'self_acceptance': -0.8, // reversed
        'confidence': -0.8, // reversed
      },
    ),

    // ========================================================================
    // OVERCOMPENSATION (Q36-Q42)
    // Гиперкомпенсация - чрезмерные усилия как компенсация за «недостаточность»
    // ========================================================================

    'imposter_syndrome:q36': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q36',
      axisWeights: {
        'overwork': 0.9,
        'self_doubt': 0.8,
        'insecurity': 0.8,
        'work_life_balance': -0.8, // reversed
        'self_esteem': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q37': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q37',
      axisWeights: {
        'pressure': 0.9,
        'performance_anxiety': 0.8,
        'self_doubt': 0.8,
        'insecurity': 0.8,
        'self_acceptance': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q38': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q38',
      axisWeights: {
        'relaxation': 0.9,
        'self_acceptance': 0.9,
        'confidence': 0.8,
        'work_life_balance': 0.8,
        'pressure': -0.8, // reversed
        'anxiety': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q39': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q39',
      axisWeights: {
        'overwork': 0.9,
        'fear_of_judgment': 0.8,
        'anxiety': 0.8,
        'work_life_balance': -0.8, // reversed
      },
    ),

    'imposter_syndrome:q40': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q40',
      axisWeights: {
        'overwork': 0.9,
        'restlessness': 0.8,
        'work_life_balance': -0.9, // reversed
        'relaxation': -0.8, // reversed
        'self_care': -0.7, // reversed
      },
    ),

    'imposter_syndrome:q41': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q41',
      axisWeights: {
        'control_need': 0.8,
        'perfectionism': 0.7,
        'trust_in_others': -0.7, // reversed
        'delegation': -0.8, // reversed
        'collaboration': -0.6, // reversed
      },
    ),

    'imposter_syndrome:q42': const QuestionWeight(
      testId: 'imposter_syndrome',
      questionId: 'q42',
      axisWeights: {
        'overwork': 0.9,
        'work_life_balance': -0.9, // reversed
        'self_care': -0.9, // reversed
        'health_consciousness': -0.8, // reversed
      },
    ),
  };
}
