import 'question_weight_models.dart';

/// Question weights for Gaming Balance Check Test
/// Maps 24 questions to 195 hierarchical psychological scales
///
/// Test measures 4 factors:
/// - time_intrusion (6 questions: q1-q6)
/// - loss_of_control (6 questions: q7-q12)
/// - mood_regulation (6 questions: q13-q18)
/// - balance_disruption (6 questions: q19-q24)
///
/// Reversed questions: q4, q9, q16, q21, q24
class GamingBalanceCheckWeights {
  static final Map<String, QuestionWeight> weights = {
    // === TIME INTRUSION (q1-q6) ===

    // Q1: Планировал поиграть "чуть-чуть", застревал на часы
    'gaming_balance_check_v1:q1': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q1',
      axisWeights: {
        'self_discipline': -0.8, // Нарушение самодисциплины
        'impulsiveness': 0.7, // Импульсивное поведение
        'time_management': -0.7, // Плохое управление временем
        'attention_control': -0.6, // Потеря контроля внимания
      },
    ),

    // Q2: Из-за игр ложусь спать позже
    'gaming_balance_check_v1:q2': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q2',
      axisWeights: {
        'self_discipline': -0.8, // Нарушение режима
        'vitality': -0.7, // Снижение жизненной энергии
        'health_consciousness': -0.6, // Игнорирование здоровья
        'impulsiveness': 0.6, // Импульсивность
      },
    ),

    // Q3: Опаздывал или срывал планы
    'gaming_balance_check_v1:q3': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q3',
      axisWeights: {
        'dutifulness': -0.9, // Нарушение обязательств
        'self_discipline': -0.8, // Потеря самодисциплины
        'time_management': -0.8, // Плохое планирование
        'impulsiveness': 0.7, // Импульсивность
      },
    ),

    // Q4: Могу не играть, когда много дел (REVERSED)
    'gaming_balance_check_v1:q4': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q4',
      axisWeights: {
        'self_discipline': 0.8, // Хорошая самодисциплина
        'conscientiousness': 0.7, // Добросовестность
        'dutifulness': 0.7, // Выполнение обязанностей
        'impulsiveness': -0.6, // Низкая импульсивность (reversed)
      },
    ),

    // Q5: Игры занимают почти всё свободное время
    'gaming_balance_check_v1:q5': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q5',
      axisWeights: {
        'self_discipline': -0.7, // Потеря баланса
        'openness_to_experience': -0.6, // Сужение интересов
        'curiosity': -0.5, // Снижение любопытства к другому
        'vitality': -0.5, // Истощение энергии
      },
    ),

    // Q6: Даже полчаса — запущу игру
    'gaming_balance_check_v1:q6': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q6',
      axisWeights: {
        'impulsiveness': 0.8, // Импульсивность
        'self_discipline': -0.7, // Нарушение самодисциплины
        'attention_control': -0.6, // Потеря фокуса
        'openness_to_experience': -0.5, // Сужение опыта
      },
    ),

    // === LOSS OF CONTROL (q7-q12) ===

    // Q7: Сложно остановиться на одном матче
    'gaming_balance_check_v1:q7': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q7',
      axisWeights: {
        'impulsiveness': 0.9, // Импульсивность
        'self_discipline': -0.8, // Потеря самоконтроля
        'deliberation': -0.7, // Недостаток обдумывания
        'self_control': -0.7, // Слабый самоконтроль
      },
    ),

    // Q8: Обещаю играть меньше, не придерживаюсь
    'gaming_balance_check_v1:q8': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q8',
      axisWeights: {
        'self_discipline': -0.9, // Крайне слабая самодисциплина
        'self_control': -0.8, // Потеря самоконтроля
        'conscientiousness': -0.7, // Низкая добросовестность
        'impulsiveness': 0.7, // Импульсивность
      },
    ),

    // Q9: Укладываюсь в лимиты (REVERSED)
    'gaming_balance_check_v1:q9': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q9',
      axisWeights: {
        'self_discipline': 0.9, // Сильная самодисциплина
        'self_control': 0.8, // Хороший самоконтроль
        'conscientiousness': 0.7, // Добросовестность
        'impulsiveness': -0.7, // Низкая импульсивность (reversed)
      },
    ),

    // Q10: Думаю об играх даже при других делах
    'gaming_balance_check_v1:q10': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q10',
      axisWeights: {
        'attention_control': -0.9, // Потеря контроля внимания
        'focus': -0.8, // Нарушение фокуса
        'worry_tendency': 0.7, // Навязчивые мысли
        'self_control': -0.7, // Слабый самоконтроль
      },
    ),

    // Q11: Раздражение на себя за потраченное время
    'gaming_balance_check_v1:q11': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q11',
      axisWeights: {
        'self_esteem': -0.7, // Снижение самооценки
        'self_criticism': 0.7, // Самокритика
        'self_discipline': -0.7, // Осознание потери контроля
        'guilt': 0.6, // Чувство вины
      },
    ),

    // Q12: Нервозность без игр несколько дней
    'gaming_balance_check_v1:q12': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q12',
      axisWeights: {
        'anxiety': 0.8, // Тревожность
        'emotional_stability': -0.8, // Эмоциональная нестабильность (reversed)
        'irritability': 0.8, // Раздражительность
        'stress_tolerance': -0.7, // Низкая стрессоустойчивость
      },
    ),

    // === MOOD REGULATION (q13-q18) ===

    // Q13: Игры для отвлечения от проблем
    'gaming_balance_check_v1:q13': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q13',
      axisWeights: {
        'avoidance_coping': 0.9, // Избегающий копинг
        'emotion_focused_coping': 0.7, // Эмоционально-ориентированный копинг
        'problem_focused_coping': -0.7, // Низкий проблемно-ориентированный копинг (reversed)
        'emotional_regulation': -0.6, // Нарушение эмоциональной регуляции
      },
    ),

    // Q14: Настроение падает при неудачах в игре
    'gaming_balance_check_v1:q14': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q14',
      axisWeights: {
        'mood_stability': -0.9, // Нестабильность настроения
        'emotional_reactivity': 0.8, // Высокая эмоциональная реактивность
        'frustration_tolerance': -0.7, // Низкая толерантность к фрустрации
        'anger': 0.6, // Гневливость
      },
    ),

    // Q15: После игры уставший и опустошённый
    'gaming_balance_check_v1:q15': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q15',
      axisWeights: {
        'vitality': -0.9, // Потеря жизненной энергии
        'emotional_exhaustion': 0.8, // Эмоциональное истощение
        'depression': 0.6, // Депрессивность
        'self_care': -0.6, // Плохая забота о себе
      },
    ),

    // Q16: Есть другие способы расслабиться (REVERSED)
    'gaming_balance_check_v1:q16': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q16',
      axisWeights: {
        'coping_flexibility': 0.8, // Гибкость копинг-стратегий
        'openness_to_experience': 0.7, // Открытость опыту
        'vitality': 0.6, // Жизненная энергия
        'avoidance_coping': -0.7, // Низкий избегающий копинг (reversed)
      },
    ),

    // Q17: Игры заменяют общение и занятия
    'gaming_balance_check_v1:q17': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q17',
      axisWeights: {
        'social_isolation': 0.9, // Социальная изоляция
        'sociability': -0.8, // Снижение общительности
        'gregariousness': -0.7, // Снижение стремления к компании (reversed)
        'openness_to_experience': -0.6, // Сужение опыта
      },
    ),

    // Q18: Настроение зависит от игры
    'gaming_balance_check_v1:q18': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q18',
      axisWeights: {
        'mood_stability': -0.9, // Нестабильность настроения
        'emotional_regulation': -0.8, // Нарушение эмоциональной регуляции
        'self_esteem': -0.6, // Зависимая самооценка
        'emotional_reactivity': 0.7, // Эмоциональная реактивность
      },
    ),

    // === BALANCE DISRUPTION (q19-q24) ===

    // Q19: Забываю поесть и делать дела
    'gaming_balance_check_v1:q19': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q19',
      axisWeights: {
        'self_care': -0.9, // Плохая забота о себе
        'self_discipline': -0.8, // Потеря самодисциплины
        'health_consciousness': -0.7, // Игнорирование здоровья
        'attention_control': -0.7, // Потеря внимания к базовым потребностям
      },
    ),

    // Q20: Близкие жалуются на время в играх
    'gaming_balance_check_v1:q20': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q20',
      axisWeights: {
        'relationship_priority': -0.8, // Низкий приоритет отношений
        'empathy': -0.6, // Снижение эмпатии
        'social_awareness': -0.6, // Снижение социальной осознанности
        'self_discipline': -0.6, // Потеря баланса
      },
    ),

    // Q21: Могу отложить игру для близких (REVERSED)
    'gaming_balance_check_v1:q21': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q21',
      axisWeights: {
        'relationship_priority': 0.9, // Высокий приоритет отношений
        'empathy': 0.7, // Эмпатия
        'altruism': 0.7, // Альтруизм
        'self_control': 0.7, // Самоконтроль
      },
    ),

    // Q22: Легче отменить встречу, чем игру
    'gaming_balance_check_v1:q22': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q22',
      axisWeights: {
        'relationship_priority': -0.9, // Крайне низкий приоритет отношений
        'social_isolation': 0.8, // Социальная изоляция
        'dutifulness': -0.7, // Нарушение обязательств
        'empathy': -0.6, // Снижение эмпатии
      },
    ),

    // Q23: Учёба/работа страдают от игр
    'gaming_balance_check_v1:q23': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q23',
      axisWeights: {
        'achievement_striving': -0.9, // Снижение стремления к достижениям
        'self_discipline': -0.8, // Потеря самодисциплины
        'dutifulness': -0.8, // Нарушение обязанностей
        'focus': -0.7, // Потеря фокуса
      },
    ),

    // Q24: Игры — часть жизни, не единственная активность (REVERSED)
    'gaming_balance_check_v1:q24': QuestionWeight(
      testId: 'gaming_balance_check_v1',
      questionId: 'q24',
      axisWeights: {
        'openness_to_experience': 0.8, // Открытость опыту
        'balance': 0.8, // Баланс жизни
        'vitality': 0.7, // Жизненная энергия
        'self_discipline': 0.7, // Самодисциплина
      },
    ),
  };
}
