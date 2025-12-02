import 'question_weight_models.dart';

/// Веса для Values and Priorities Test
///
/// Маппинг 40 вопросов теста на 195 психологических шкал + 8 биполярных полюсов
/// Используется для Summary Screen (cross-test personality type analysis)
///
/// ПРАВИЛА:
/// - Scores: 0-4 (5-point Likert)
/// - Только существующие шкалы из hierarchical_scales.dart
/// - Отрицательные веса ТОЛЬКО для психологических шкал
/// - НЕТ отрицательных весов для биполярных полюсов (extraversion, etc.)
class ValuesPrioritiesWeights {
  static final Map<String, QuestionWeight> weights = {
    // ===== SECURITY (Q1-4) =====
    // Q1: Важность финансовой и бытовой стабильности
    'values_priorities_v1:q1': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q1',
      axisWeights: {
        // Security-related scales
        'need_for_security': 1.0,
        'stability': 0.9,
        'prudence': 0.8,
        'risk_taking': -0.9, // Reversed
        'spontaneity': -0.6, // Reversed
        'adventurousness': -0.7, // Reversed
        // Conscientiousness
        'conscientiousness': 0.7,
        'deliberation': 0.8,
        'responsibility': 0.7,
        // Bipolar: J/P (структура vs гибкость)
        'judging': 0.7, // Стабильность → планирование, структура
      },
    ),

    // Q2: Фактическое вложение в безопасность
    'values_priorities_v1:q2': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q2',
      axisWeights: {
        'need_for_security': 1.0,
        'prudence': 0.9,
        'financial_responsibility': 0.9,
        'deliberation': 0.8,
        'future_orientation': 0.8,
        'planning': 0.7,
        'conscientiousness': 0.7,
        // Bipolar: J/P
        'judging': 0.8, // Планирование, подготовка → J
      },
    ),

    // Q3: Легко рискнуть (REVERSED - важность безопасности низкая)
    'values_priorities_v1:q3': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q3',
      axisWeights: {
        'need_for_security': -1.0, // This question measures LOW security importance
        'risk_taking': 0.9,
        'adventurousness': 0.8,
        'spontaneity': 0.7,
        'impulsiveness': 0.6,
        'prudence': -0.8,
        'deliberation': -0.7,
        // Bipolar: J/P
        'perceiving': 0.7, // Спонтанность, риск → P
      },
    ),

    // Q4: Не создаю подушку безопасности (REVERSED - энергия низкая)
    'values_priorities_v1:q4': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q4',
      axisWeights: {
        'need_for_security': -1.0,
        'prudence': -0.9,
        'financial_responsibility': -0.9,
        'deliberation': -0.8,
        'conscientiousness': -0.7,
        'responsibility': -0.7,
        // Bipolar: J/P
        'perceiving': 0.6, // Не планируешь → гибкость, P
      },
    ),

    // ===== FREEDOM (Q5-8) =====
    // Q5: Важность свободы выбора
    'values_priorities_v1:q5': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q5',
      axisWeights: {
        'autonomy_need': 1.0,
        'independence': 0.9,
        'self_direction': 0.9,
        'autonomy_wellbeing': 0.8,
        'assertiveness': 0.7,
        'compliance': -0.7, // Reversed
        'conformity': -0.8, // Reversed
        // Bipolar: J/P
        'perceiving': 0.8, // Свобода выбора → гибкость, P
      },
    ),

    // Q6: Фактическое создание свободы
    'values_priorities_v1:q6': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q6',
      axisWeights: {
        'autonomy_need': 1.0,
        'independence': 0.9,
        'self_direction': 0.9,
        'flexibility': 0.8,
        'adaptability': 0.7,
        'autonomy_wellbeing': 0.8,
        // Bipolar: J/P
        'perceiving': 0.9, // Гибкость, адаптивность → P
      },
    ),

    // Q7: Комфортно когда решают за меня (REVERSED - низкая свобода)
    'values_priorities_v1:q7': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q7',
      axisWeights: {
        'autonomy_need': -1.0,
        'independence': -0.9,
        'compliance': 0.8,
        'conformity': 0.8,
        'submissiveness': 0.7,
        'assertiveness': -0.8,
      },
    ),

    // Q8: Нет пространства для свободы (REVERSED - низкая энергия)
    'values_priorities_v1:q8': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q8',
      axisWeights: {
        'autonomy_need': -1.0,
        'independence': -0.9,
        'autonomy_wellbeing': -0.9,
        'self_direction': -0.8,
        'vitality': -0.6, // Lack of freedom drains energy
      },
    ),

    // ===== ACHIEVEMENT (Q9-12) =====
    // Q9: Важность успеха и результатов
    'values_priorities_v1:q9': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q9',
      axisWeights: {
        'achievement_striving': 1.0,
        'achievement_motivation': 1.0,
        'achievement_value': 0.9,
        'competence': 0.8,
        'ambition': 0.9,
        'goal_orientation': 0.8,
        // Bipolar: S/N
        'intuition': 0.6, // Амбиции, будущее → N
      },
    ),

    // Q10: Фактическая работа над целями
    'values_priorities_v1:q10': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q10',
      axisWeights: {
        'achievement_striving': 1.0,
        'achievement_motivation': 0.9,
        'persistence': 0.9,
        'self_discipline': 0.8,
        'goal_orientation': 0.9,
        'diligence': 0.8,
      },
    ),

    // Q11: Достаточно не отставать (REVERSED - низкий achievement)
    'values_priorities_v1:q11': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q11',
      axisWeights: {
        'achievement_striving': -1.0,
        'achievement_motivation': -1.0,
        'ambition': -0.9,
        'complacency': 0.7,
        'contentment': 0.6, // Not negative - can be positive trait
      },
    ),

    // Q12: Не делаю шагов к целям (REVERSED - низкая энергия)
    'values_priorities_v1:q12': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q12',
      axisWeights: {
        'achievement_striving': -1.0,
        'persistence': -0.9,
        'self_discipline': -0.8,
        'goal_orientation': -0.9,
        'procrastination': 0.8,
        'motivation_loss': 0.7,
      },
    ),

    // ===== CREATIVITY (Q13-16) =====
    // Q13: Важность творчества
    'values_priorities_v1:q13': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q13',
      axisWeights: {
        'creativity': 1.0,
        'artistic_interests': 0.9,
        'openness': 0.9,
        'fantasy': 0.8,
        'imaginativeness': 0.9,
        'aesthetic_appreciation': 0.8,
        // Bipolar: S/N
        'intuition': 0.9, // Творчество, абстрактное мышление → N
      },
    ),

    // Q14: Фактическое время на творчество
    'values_priorities_v1:q14': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q14',
      axisWeights: {
        'creativity': 1.0,
        'artistic_interests': 0.9,
        'openness': 0.8,
        'imaginativeness': 0.8,
        'self_expression': 0.9,
        // Bipolar: S/N
        'intuition': 0.8, // Время на творчество → N
      },
    ),

    // Q15: Креативность не важна (REVERSED)
    'values_priorities_v1:q15': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q15',
      axisWeights: {
        'creativity': -1.0,
        'openness': -0.8,
        'imaginativeness': -0.8,
        'practicality': 0.7,
        'conventionality': 0.7,
        // Bipolar: S/N
        'sensing': 0.7, // Практичность, конкретность → S
      },
    ),

    // Q16: Нет места для творчества (REVERSED)
    'values_priorities_v1:q16': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q16',
      axisWeights: {
        'creativity': -1.0,
        'self_expression': -0.9,
        'artistic_interests': -0.8,
        'life_satisfaction': -0.5, // Lack of creative expression affects wellbeing
      },
    ),

    // ===== RELATIONSHIPS (Q17-20) =====
    // Q17: Важность близких отношений
    'values_priorities_v1:q17': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q17',
      axisWeights: {
        'intimacy': 1.0,
        'emotional_intimacy': 1.0,
        'intimacy_comfort': 0.9,
        'relationship_value': 0.9,
        'warmth': 0.8,
        'trust_in_relationships': 0.8,
        'extraversion': 0.6, // Social aspect
        // Bipolar: T/F
        'feeling': 0.8, // Эмоциональная связь, ценности → F
      },
    ),

    // Q18: Фактическое вложение в отношения
    'values_priorities_v1:q18': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q18',
      axisWeights: {
        'intimacy': 1.0,
        'emotional_intimacy': 0.9,
        'care': 0.9,
        'warmth': 0.8,
        'commitment': 0.8,
        'supportiveness': 0.8,
        // Bipolar: T/F, E/I
        'feeling': 0.7, // Забота, поддержка → F
        'extraversion': 0.5, // Время с людьми → E
      },
    ),

    // Q19: Близость не приоритет (REVERSED)
    'values_priorities_v1:q19': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q19',
      axisWeights: {
        'intimacy': -1.0,
        'emotional_intimacy': -1.0,
        'relationship_value': -0.9,
        'introversion': 0.7, // Preference for solitude
        'independence': 0.6,
      },
    ),

    // Q20: Редко время с близкими (REVERSED)
    'values_priorities_v1:q20': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q20',
      axisWeights: {
        'intimacy': -1.0,
        'emotional_intimacy': -0.9,
        'commitment': -0.8,
        'relationship_satisfaction': -0.8,
        'life_satisfaction': -0.5,
      },
    ),

    // ===== GROWTH (Q21-24) =====
    // Q21: Важность развития
    'values_priorities_v1:q21': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q21',
      axisWeights: {
        'personal_growth': 1.0,
        'growth_mindset': 1.0,
        'learning_ability': 0.9,
        'intellectual_curiosity': 0.9,
        'openness': 0.8,
        'ideas': 0.8,
        // Bipolar: S/N
        'intuition': 0.8, // Рост, потенциал, будущее → N
      },
    ),

    // Q22: Фактическое обучение
    'values_priorities_v1:q22': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q22',
      axisWeights: {
        'personal_growth': 1.0,
        'growth_mindset': 0.9,
        'learning_ability': 0.9,
        'intellectual_curiosity': 0.9,
        'self_discipline': 0.7,
        'diligence': 0.7,
        // Bipolar: S/N
        'intuition': 0.7, // Активное обучение → N
      },
    ),

    // Q23: Достаточно текущего уровня (REVERSED)
    'values_priorities_v1:q23': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q23',
      axisWeights: {
        'personal_growth': -1.0,
        'growth_mindset': -1.0,
        'intellectual_curiosity': -0.9,
        'complacency': 0.8,
        'contentment': 0.6,
      },
    ),

    // Q24: Редко расширяю знания (REVERSED)
    'values_priorities_v1:q24': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q24',
      axisWeights: {
        'personal_growth': -1.0,
        'learning_ability': -0.9,
        'intellectual_curiosity': -0.9,
        'stagnation': 0.8,
      },
    ),

    // ===== INFLUENCE (Q25-28) =====
    // Q25: Важность влияния
    'values_priorities_v1:q25': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q25',
      axisWeights: {
        'power_motivation': 1.0,
        'influence_motivation': 1.0,
        'dominance': 0.9,
        'assertiveness': 0.9,
        'social_boldness': 0.8,
        'leadership': 0.9,
      },
    ),

    // Q26: Фактическая инициатива
    'values_priorities_v1:q26': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q26',
      axisWeights: {
        'power_motivation': 0.9,
        'influence_motivation': 0.9,
        'leadership': 1.0,
        'assertiveness': 0.9,
        'responsibility': 0.8,
        'initiative': 0.9,
      },
    ),

    // Q27: Комфортнее без ответственности (REVERSED)
    'values_priorities_v1:q27': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q27',
      axisWeights: {
        'power_motivation': -1.0,
        'influence_motivation': -1.0,
        'leadership': -0.9,
        'submissiveness': 0.8,
        'compliance': 0.7,
      },
    ),

    // Q28: Не проявляю инициативу (REVERSED)
    'values_priorities_v1:q28': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q28',
      axisWeights: {
        'power_motivation': -0.9,
        'influence_motivation': -0.9,
        'leadership': -1.0,
        'initiative': -0.9,
        'assertiveness': -0.8,
        'passivity': 0.8,
      },
    ),

    // ===== COMFORT (Q29-32) =====
    // Q29: Важность комфорта
    'values_priorities_v1:q29': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q29',
      axisWeights: {
        'hedonism': 1.0,
        'pleasure_seeking': 0.9,
        'comfort_seeking': 0.9,
        'stress_tolerance': -0.6, // Prefers low stress
        'relaxation': 0.8,
      },
    ),

    // Q30: Фактические траты на отдых
    'values_priorities_v1:q30': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q30',
      axisWeights: {
        'hedonism': 1.0,
        'pleasure_seeking': 0.9,
        'self_care': 0.8,
        'work_life_balance': 0.8,
        'relaxation': 0.9,
      },
    ),

    // Q31: Комфорт не важен (REVERSED)
    'values_priorities_v1:q31': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q31',
      axisWeights: {
        'hedonism': -1.0,
        'pleasure_seeking': -0.9,
        'comfort_seeking': -0.9,
        'asceticism': 0.7,
        'self_discipline': 0.6,
      },
    ),

    // Q32: Мало времени на отдых (REVERSED)
    'values_priorities_v1:q32': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q32',
      axisWeights: {
        'hedonism': -0.9,
        'work_life_balance': -1.0,
        'self_care': -0.9,
        'relaxation': -0.9,
        'burnout': 0.7,
        'workaholism': 0.8,
      },
    ),

    // ===== CONTRIBUTION (Q33-36) =====
    // Q33: Важность пользы другим
    'values_priorities_v1:q33': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q33',
      axisWeights: {
        'altruism': 1.0,
        'benevolence': 1.0,
        'compassion': 0.9,
        'helping_others': 0.9,
        'social_responsibility': 0.8,
        'empathy': 0.8,
        // Bipolar: T/F
        'feeling': 0.9, // Забота о людях, эмпатия → F
      },
    ),

    // Q34: Фактическая помощь
    'values_priorities_v1:q34': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q34',
      axisWeights: {
        'altruism': 1.0,
        'benevolence': 0.9,
        'helping_others': 1.0,
        'compassion': 0.8,
        'care': 0.8,
        'supportiveness': 0.8,
        // Bipolar: T/F
        'feeling': 0.8, // Активная помощь, поддержка → F
      },
    ),

    // Q35: Польза другим не принципиальна (REVERSED)
    'values_priorities_v1:q35': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q35',
      axisWeights: {
        'altruism': -1.0,
        'benevolence': -1.0,
        'helping_others': -0.9,
        'self_interest': 0.7,
        'individualism': 0.6,
      },
    ),

    // Q36: Редко думаю о вкладе (REVERSED)
    'values_priorities_v1:q36': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q36',
      axisWeights: {
        'altruism': -1.0,
        'helping_others': -0.9,
        'social_responsibility': -0.8,
        'self_interest': 0.7,
      },
    ),

    // ===== HEALTH & BALANCE (Q37-40) =====
    // Q37: Важность здоровья и баланса
    'values_priorities_v1:q37': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q37',
      axisWeights: {
        'health_consciousness': 1.0,
        'work_life_balance': 1.0,
        'self_care': 0.9,
        'wellbeing': 0.9,
        'balance': 0.9,
      },
    ),

    // Q38: Фактическая забота о себе
    'values_priorities_v1:q38': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q38',
      axisWeights: {
        'health_consciousness': 1.0,
        'self_care': 1.0,
        'work_life_balance': 0.9,
        'wellbeing': 0.9,
        'vitality': 0.8,
        'energy_level': 0.8,
      },
    ),

    // Q39: Баланс может подождать (REVERSED)
    'values_priorities_v1:q39': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q39',
      axisWeights: {
        'health_consciousness': -1.0,
        'work_life_balance': -1.0,
        'self_care': -0.9,
        'workaholism': 0.8,
        'achievement_striving': 0.6, // Can correlate with neglecting health
      },
    ),

    // Q40: Ритм вредит здоровью (REVERSED)
    'values_priorities_v1:q40': QuestionWeight(
      testId: 'values_priorities_v1',
      questionId: 'q40',
      axisWeights: {
        'health_consciousness': -1.0,
        'work_life_balance': -1.0,
        'self_care': -1.0,
        'burnout': 1.0,
        'stress': 0.9,
        'vitality': -0.9,
      },
    ),
  };
}
