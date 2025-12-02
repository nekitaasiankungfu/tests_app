import 'question_weight_models.dart';

/// DISC Personality Test Question Weights
///
/// Maps 56 DISC questions to psychological scales
/// Based on William Marston's DISC Theory (1928)
///
/// Test structure:
/// - 56 questions total
/// - 14 questions per factor (D, I, S, C)
/// - Alternating question order (D-I-S-C cycle)
///
/// IMPORTANT NOTES:
/// 1. All scores are 0-4 (NOT 1-5) per RULE #1
/// 2. No negative weights for Personality Type scales per RULE #2
/// 3. Direction auto-detected from weight sign per RULE #3
/// 4. Only existing scales from hierarchical_scales.dart per RULE #6
class DISCPersonalityWeights {
  static final Map<String, QuestionWeight> weights = {
    // === DOMINANCE QUESTIONS (14) ===
    // Q1, Q5, Q9, Q13, Q17, Q21, Q25, Q29, Q33, Q37, Q41, Q45, Q49, Q53

    // Q1: "Я прямо говорю людям, что думаю, даже если это может их обидеть"
    'disc_personality_v1:q1': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q1',
      axisWeights: {
        'dominance': 1.2, // Прямолинейность
        'assertiveness': 1.0, // Ассертивность
        'extraversion': 0.4, // Экстраверсия
      },
    ),

    // Q5: "Я люблю конкуренцию и стремлюсь побеждать"
    'disc_personality_v1:q5': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q5',
      axisWeights: {
        'dominance': 1.3, // Доминантность
        'achievement_striving': 1.2, // Стремление к достижениям (конкурентность)
        'ambition': 1.0, // Амбициозность
      },
    ),

    // Q9: "Я быстро принимаю решения и действую решительно"
    'disc_personality_v1:q9': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q9',
      axisWeights: {
        'dominance': 1.1,
        'decisiveness': 1.3, // Решительность
        'impulsiveness': 0.6, // Импульсивность (средняя связь)
      },
    ),

    // Q13: "Я предпочитаю брать на себя ответственность и контроль"
    'disc_personality_v1:q13': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q13',
      axisWeights: {
        'dominance': 1.3,
        'responsibility': 1.0, // Ответственность
        'dominance': 0.9, // Потребность в контроле
      },
    ),

    // Q17: "Я фокусируюсь на результатах, а не на процессе"
    'disc_personality_v1:q17': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q17',
      axisWeights: {
        'dominance': 1.0,
        'achievement_striving': 1.2, // Ориентация на цели
        'achievement_striving': 1.0,
        'thinking': 0.5, // Мыслящий тип (результаты > процесс)
      },
    ),

    // Q21: "Я предпочитаю действовать, а не обсуждать"
    'disc_personality_v1:q21': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q21',
      axisWeights: {
        'dominance': 1.1,
        'activity': 1.2, // Ориентация на действие
        'impulsiveness': 0.5,
        'introversion': 0.4, // Может быть интровертированным действием
      },
    ),

    // Q25: "Я не боюсь вызовов и люблю сложные задачи"
    'disc_personality_v1:q25': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q25',
      axisWeights: {
        'dominance': 1.2,
        'risk_taking': 1.0, // Принятие рисков
        'risk_taking': 1.2, // Поиск вызовов
      },
    ),

    // Q29: "Я предпочитаю быстрый темп работы и люблю многозадачность"
    'disc_personality_v1:q29': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q29',
      axisWeights: {
        'dominance': 1.0,
        'activity': 1.2, // Активность
        'activity': 1.1, // Многозадачность
      },
    ),

    // Q33: "Я не против идти против течения и оспаривать статус-кво"
    'disc_personality_v1:q33': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q33',
      axisWeights: {
        'dominance': 1.2,
      },
    ),

    // Q37: "Я напорист(а) и настойчив(а) в достижении целей"
    'disc_personality_v1:q37': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q37',
      axisWeights: {
        'dominance': 1.2,
        'persistence': 1.3, // Настойчивость
        'assertiveness': 1.1,
        'self_discipline': 0.7, // Самодисциплина
      },
    ),

    // Q41: "Я независим(а) и предпочитаю работать автономно"
    'disc_personality_v1:q41': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q41',
      axisWeights: {
        'dominance': 1.0,
        'introversion': 0.6, // Интроверсия
      },
    ),

    // Q45: "Я уверен(а) в себе и решителен(льна)"
    'disc_personality_v1:q45': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q45',
      axisWeights: {
        'dominance': 1.3,
        'decisiveness': 1.2,
        'self_efficacy': 1.1, // Самоэффективность
      },
    ),

    // Q49: "Я люблю власть и влияние на решения"
    'disc_personality_v1:q49': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q49',
      axisWeights: {
        'dominance': 1.4, // Очень высокая доминантность
        'power_motivation': 1.3, // Мотивация власти
        'dominance': 1.2,
        'power_motivation': 1.1, // Мотивация влияния
      },
    ),

    // Q53: "Я конфронтационен(на) и не боюсь споров"
    'disc_personality_v1:q53': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q53',
      axisWeights: {
        'dominance': 1.3,
        'assertiveness': 1.2,
        'assertiveness': 1.1, // Ориентация на конфликт
      },
    ),

    // === INFLUENCE QUESTIONS (14) ===
    // Q2, Q6, Q10, Q14, Q18, Q22, Q26, Q30, Q34, Q38, Q42, Q46, Q50, Q54

    // Q2: "Я легко завожу новые знакомства и люблю быть в центре внимания"
    'disc_personality_v1:q2': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q2',
      axisWeights: {
        'gregariousness': 1.3, // Общительность
        'warmth': 1.1, // Теплота
        'social_confidence': 1.0,
        'extraversion': 1.3, // Экстраверсия
      },
    ),

    // Q6: "Я энтузиаст и легко вдохновляю других людей"
    'disc_personality_v1:q6': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q6',
      axisWeights: {
        'positive_emotions': 1.3, // Позитивные эмоции
        'charisma': 1.2, // Харизма
        'extraversion': 1.0,
      },
    ),

    // Q10: "Я оптимист и вижу лучшее в людях и ситуациях"
    'disc_personality_v1:q10': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q10',
      axisWeights: {
        'positive_emotions': 1.2,
        'trust': 1.0, // Доверие
      },
    ),

    // Q14: "Я общительный(ая) и легко налаживаю контакт с незнакомцами"
    'disc_personality_v1:q14': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q14',
      axisWeights: {
        'gregariousness': 1.3,
        'social_boldness': 1.2, // Социальная смелость
        'warmth': 1.0,
        'extraversion': 1.2,
      },
    ),

    // Q18: "Я люблю работать с людьми и в команде"
    'disc_personality_v1:q18': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q18',
      axisWeights: {
        'cooperativeness': 1.3, // Ориентация на команду
        'warmth': 1.0,
        'extraversion': 0.9,
      },
    ),

    // Q22: "Я убедителен(льна) и легко продаю свои идеи"
    'disc_personality_v1:q22': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q22',
      axisWeights: {
        'charisma': 1.2,
        'expressiveness': 1.1,
        'assertiveness': 0.9,
        'social_confidence': 1.0,
      },
    ),

    // Q26: "Я выразителен(льна) и эмоционален(льна) в общении"
    'disc_personality_v1:q26': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q26',
      axisWeights: {
        'expressiveness': 1.4, // Выразительность
        'extraversion': 1.0,
        'feeling': 0.8, // Чувствующий тип
      },
    ),

    // Q30: "Я дружелюбен(на) и легко создаю позитивную атмосферу"
    'disc_personality_v1:q30': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q30',
      axisWeights: {
        'warmth': 1.3,
        'positive_emotions': 1.2,
        'empathy': 0.8,
        'social_confidence': 1.0, // Социальные навыки
      },
    ),

    // Q34: "Я спонтанный(ая) и люблю импровизацию"
    'disc_personality_v1:q34': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q34',
      axisWeights: {
        'spontaneity': 1.3, // Спонтанность
        'impulsiveness': 0.8,
        'perceiving': 1.0, // Воспринимающий тип
      },
    ),

    // Q38: "Я вдохновляю других и создаю энтузиазм"
    'disc_personality_v1:q38': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q38',
      axisWeights: {
        'charisma': 1.2,
        'positive_emotions': 1.1,
      },
    ),

    // Q42: "Я разговорчив(а) и люблю общаться"
    'disc_personality_v1:q42': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q42',
      axisWeights: {
        'gregariousness': 1.2,
        'expressiveness': 1.0,
        'extraversion': 1.3,
      },
    ),

    // Q46: "Я люблю веселиться и не принимаю всё слишком серьёзно"
    'disc_personality_v1:q46': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q46',
      axisWeights: {
        'playfulness': 1.3, // Игривость
        'humor': 1.2, // Чувство юмора
        'positive_emotions': 1.1,
        'excitement_seeking': 1.0, // Поиск впечатлений
      },
    ),

    // Q50: "Я доверяю людям и ожидаю лучшего от них"
    'disc_personality_v1:q50': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q50',
      axisWeights: {
        'trust': 1.3,
      },
    ),

    // Q54: "Я эмоционально выразителен(льна) и показываю свои чувства"
    'disc_personality_v1:q54': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q54',
      axisWeights: {
        'expressiveness': 1.2,
        'feeling': 0.9,
      },
    ),

    // === STEADINESS QUESTIONS (14) ===
    // Q3, Q7, Q11, Q15, Q19, Q23, Q27, Q31, Q35, Q39, Q43, Q47, Q51, Q55

    // Q3: "Я предпочитаю работать в стабильной, предсказуемой среде"
    'disc_personality_v1:q3': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q3',
      axisWeights: {
        'anxiety': 1.3, // Потребность в стабильности
        'anxiety': 0.5, // Связь с тревожностью
        'sensing': 0.7, // Сенсорный тип
      },
    ),

    // Q7: "Я терпеливый(ая) слушатель и готов(а) помогать другим"
    'disc_personality_v1:q7': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q7',
      axisWeights: {
        'patience': 1.3,
        'empathy': 1.2,
        'empathy': 1.2, // Навыки слушания
        'altruism': 1.0, // Альтруизм
      },
    ),

    // Q11: "Я не люблю конфликты и стремлюсь к гармонии"
    'disc_personality_v1:q11': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q11',
      axisWeights: {
      },
    ),

    // Q15: "Я лоялен(льна) и ценю долгосрочные отношения"
    'disc_personality_v1:q15': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q15',
      axisWeights: {
        'loyalty': 1.3, // Лояльность
        'commitment': 1.2, // Обязательность
        'trust_in_relationships': 1.1, // Стабильность в отношениях
        'dutifulness': 1.0,
        'trust': 0.8,
      },
    ),

    // Q19: "Мне нужно время, чтобы привыкнуть к изменениям"
    'disc_personality_v1:q19': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q19',
      axisWeights: {
        'anxiety': 0.5,
      },
    ),

    // Q23: "Я предпочитаю работать в размеренном темпе, без спешки"
    'disc_personality_v1:q23': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q23',
      axisWeights: {
        'patience': 1.2,
        'deliberation': 1.1,
        'calmness': 1.0,
      },
    ),

    // Q27: "Я ценю безопасность и стабильность выше риска и новизны"
    'disc_personality_v1:q27': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q27',
      axisWeights: {
        'anxiety': 1.3, // Потребность в безопасности
        'anxiety': 1.2,
      },
    ),

    // Q31: "Я надёжный(ая) и люди могут на меня положиться"
    'disc_personality_v1:q31': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q31',
      axisWeights: {
        'dutifulness': 1.2,
        'responsibility': 1.1,
        'trust': 1.0, // Вызывание доверия
      },
    ),

    // Q35: "Я предсказуем(а) и последователен(льна) в своём поведении"
    'disc_personality_v1:q35': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q35',
      axisWeights: {
        'dutifulness': 1.3, // Последовательность
        'dutifulness': 1.2, // Предсказуемость
      },
    ),

    // Q39: "Я поддерживаю(ю) других и создаю комфортную среду"
    'disc_personality_v1:q39': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q39',
      axisWeights: {
        'support_giving': 1.3, // Поддержка
        'empathy': 1.2,
        'support_giving': 1.1, // Забота
        'warmth': 1.0,
      },
    ),

    // Q43: "Я хороший(ая) командный(ая) игрок(ша) и кооперативен(на)"
    'disc_personality_v1:q43': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q43',
      axisWeights: {
        'cooperativeness': 1.2,
      },
    ),

    // Q47: "Я спокоен(йна) и эмоционально стабилен(льна)"
    'disc_personality_v1:q47': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q47',
      axisWeights: {
        'calmness': 1.3,
        'composure': 1.1,
      },
    ),

    // Q51: "Я приспосабливаюсь к нуждам других и ставлю их выше своих"
    'disc_personality_v1:q51': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q51',
      axisWeights: {
        'cooperativeness': 1.2, // Приспособление
        'altruism': 1.3,
        'altruism': 1.1, // Бескорыстие
      },
    ),

    // Q55: "Я консервативен(на) и осторожен(жна) с изменениями"
    'disc_personality_v1:q55': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q55',
      axisWeights: {
        'tradition': 0.9, // Традиционализм
      },
    ),

    // === CONSCIENTIOUSNESS QUESTIONS (14) ===
    // Q4, Q8, Q12, Q16, Q20, Q24, Q28, Q32, Q36, Q40, Q44, Q48, Q52, Q56

    // Q4: "Я обращаю большое внимание на детали и точность в работе"
    'disc_personality_v1:q4': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q4',
      axisWeights: {
        'perfectionism': 0.8,
      },
    ),

    // Q8: "Я следую правилам и процедурам очень тщательно"
    'disc_personality_v1:q8': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q8',
      axisWeights: {
        'dutifulness': 1.3, // Следование правилам
        'dutifulness': 1.2,
        'judging': 0.9, // Решающий тип
      },
    ),

    // Q12: "Я аналитичен(на) и опираюсь на факты и данные"
    'disc_personality_v1:q12': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q12',
      axisWeights: {
        'analytical_thinking': 1.3,
        'thinking': 1.2, // Мыслящий тип
      },
    ),

    // Q16: "Я систематичен(на) и предпочитаю всё планировать заранее"
    'disc_personality_v1:q16': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q16',
      axisWeights: {
        'organization': 1.2, // Организованность
        'judging': 1.0,
      },
    ),

    // Q20: "Я перфекционист и стремлюсь к высокому качеству"
    'disc_personality_v1:q20': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q20',
      axisWeights: {
        'perfectionism': 1.4,
        'achievement_striving': 1.2,
        'perfectionism': 1.1, // Фокус на качестве
        'self_discipline': 1.0,
        'vulnerability': 0.5, // Перфекционизм → уязвимость
      },
    ),

    // Q24: "Я осторожен(жна) и избегаю рисков"
    'disc_personality_v1:q24': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q24',
      axisWeights: {
        'deliberation': 1.2,
        'anxiety': 0.6,
        'anxiety': 0.8,
      },
    ),

    // Q28: "Я задаю много вопросов и проверяю информацию"
    'disc_personality_v1:q28': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q28',
      axisWeights: {
        'critical_thinking': 1.2, // Критическое мышление
        'analytical_thinking': 1.1,
        'curiosity': 0.9, // Любопытство
      },
    ),

    // Q32: "Я дипломатичен(на) и тактичен(на) в общении"
    'disc_personality_v1:q32': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q32',
      axisWeights: {
      },
    ),

    // Q36: "Я объективен(на) и отделяю эмоции от фактов"
    'disc_personality_v1:q36': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q36',
      axisWeights: {
        'thinking': 1.2,
      },
    ),

    // Q40: "Я скептичен(на) и критически оцениваю информацию"
    'disc_personality_v1:q40': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q40',
      axisWeights: {
        'critical_thinking': 1.3,
      },
    ),

    // Q44: "Я организован(на) и структурирован(на)"
    'disc_personality_v1:q44': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q44',
      axisWeights: {
        'organization': 1.3,
        'self_discipline': 1.0,
        'judging': 0.9,
      },
    ),

    // Q48: "Я предпочитаю работать с проверенными методами, а не экспериментировать"
    'disc_personality_v1:q48': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q48',
      axisWeights: {
        'tradition': 1.1,
      },
    ),

    // Q52: "Я ориентирован(а) на качество и стандарты"
    'disc_personality_v1:q52': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q52',
      axisWeights: {
        'perfectionism': 1.3,
        'achievement_striving': 1.1,
        'self_discipline': 1.0,
      },
    ),

    // Q56: "Я методичен(на) и люблю следовать процессам"
    'disc_personality_v1:q56': QuestionWeight(
      testId: 'disc_personality_v1',
      questionId: 'q56',
      axisWeights: {
        'deliberation': 1.1, // Ориентация на процесс
        'self_discipline': 1.0,
      },
    ),
  };
}
