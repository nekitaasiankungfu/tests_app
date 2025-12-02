import 'question_weight_models.dart';

/// Weight mappings for Depression Symptoms Inventory
/// 27 questions mapped to existing 195 psychological scales
/// Test uses 4-point frequency scale (0-3)
///
/// Factors:
/// - emotional: Q1, Q6, Q11, Q16, Q21, Q26 (6 questions)
/// - cognitive: Q2, Q7, Q12, Q17, Q22, Q27 (6 questions)
/// - motivational: Q3, Q8, Q13, Q18, Q23 (5 questions)
/// - somatic: Q4, Q9, Q14, Q19, Q24 (5 questions)
/// - social: Q5, Q10, Q15, Q20, Q25 (5 questions)
class DepressionSymptomsInventoryWeights {
  static final Map<String, QuestionWeight> weights = {
    // ============================================
    // EMOTIONAL SYMPTOMS (Q1, Q6, Q11, Q16, Q21, Q26)
    // ============================================

    // Q1: "Чувство грусти, подавленности или тоски"
    // Core depressed mood - direct indicator
    'depression_symptoms_inventory_v1:q1': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q1',
      axisWeights: {
        'depression': 1.0, // Direct depression indicator
        'positive_emotions': -1.0, // (reversed) Low positive emotions
        'mood_stability': -0.9, // (reversed) Unstable mood
        'happiness': -0.9, // (reversed) Low happiness
        'emotional_resilience': -0.8, // (reversed) Low resilience
        'life_satisfaction': -0.7, // (reversed) Low satisfaction
        'vitality': -0.7, // (reversed) Low energy
        'optimism': -0.8, // (reversed) Pessimism
        'neuroticism': 0.7, // High neuroticism
      },
    ),

    // Q6: "Ощущение внутренней пустоты или эмоционального онемения"
    // Emotional emptiness
    'depression_symptoms_inventory_v1:q6': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q6',
      axisWeights: {
        'depression': 0.9,
        'positive_emotions': -0.9, // (reversed)
        'feelings': -0.8, // (reversed) Emotional numbness
        'emotional_openness': -0.7, // (reversed)
        'vulnerability': 0.8,
        'happiness': -0.8, // (reversed)
        'life_satisfaction': -0.7, // (reversed)
        'emotional_resilience': -0.6, // (reversed)
      },
    ),

    // Q11: "Плаксивость или желание плакать без видимой причины"
    // Tearfulness
    'depression_symptoms_inventory_v1:q11': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q11',
      axisWeights: {
        'depression': 0.8,
        'emotional_reactivity': 0.8,
        'mood_stability': -0.8, // (reversed)
        'composure': -0.7, // (reversed)
        'emotional_resilience': -0.6, // (reversed)
        'vulnerability': 0.7,
        'neuroticism': 0.6,
      },
    ),

    // Q16: "Раздражительность или вспышки гнева"
    // Irritability
    'depression_symptoms_inventory_v1:q16': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q16',
      axisWeights: {
        'depression': 0.6, // Depression often includes irritability
        'anger': 0.9, // Direct anger indicator
        'emotional_reactivity': 0.8,
        'frustration_tolerance': -0.9, // (reversed)
        'mood_stability': -0.8, // (reversed)
        'composure': -0.7, // (reversed)
        'impulsiveness': 0.6,
        'neuroticism': 0.7,
      },
    ),

    // Q21: "Ощущение, что хочется плакать, но слёзы не идут"
    // Emotional numbness variant
    'depression_symptoms_inventory_v1:q21': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q21',
      axisWeights: {
        'depression': 0.9,
        'feelings': -0.9, // (reversed) Emotional suppression
        'emotional_openness': -0.8, // (reversed)
        'vulnerability': 0.8,
        'emotional_resilience': -0.7, // (reversed)
        'mood_stability': -0.6, // (reversed)
      },
    ),

    // Q26: "Ощущение, что вы не заслуживаете хорошего или счастья"
    // Worthlessness - deep emotional symptom
    'depression_symptoms_inventory_v1:q26': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q26',
      axisWeights: {
        'depression': 1.0,
        'self_esteem': -1.0, // (reversed) Core self-esteem issue
        'self_compassion': -1.0, // (reversed) Low self-compassion
        'self_acceptance': -0.9, // (reversed)
        'happiness': -0.8, // (reversed)
        'vulnerability': 0.9,
        'neuroticism': 0.7,
      },
    ),

    // ============================================
    // COGNITIVE SYMPTOMS (Q2, Q7, Q12, Q17, Q22, Q27)
    // ============================================

    // Q2: "Негативные мысли о себе (ощущение себя неудачником)"
    // Negative self-view - cognitive triad
    'depression_symptoms_inventory_v1:q2': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q2',
      axisWeights: {
        'depression': 1.0,
        'self_esteem': -1.0, // (reversed) Core indicator
        'self_acceptance': -0.9, // (reversed)
        'self_compassion': -0.9, // (reversed)
        'competence': -0.7, // (reversed) Feeling incompetent
        'self_efficacy': -0.8, // (reversed)
        'vulnerability': 0.8,
        'neuroticism': 0.7,
      },
    ),

    // Q7: "Трудности с концентрацией внимания, принятием решений"
    // Concentration difficulties
    'depression_symptoms_inventory_v1:q7': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q7',
      axisWeights: {
        'depression': 0.8,
        'attention_control': -1.0, // (reversed) Core indicator
        'cognitive_flexibility': -0.7, // (reversed)
        'working_memory': -0.7, // (reversed)
        'decisiveness': -0.8, // (reversed)
        'processing_speed': -0.5, // (reversed)
        'deliberation': -0.6, // (reversed)
      },
    ),

    // Q12: "Пессимистичный взгляд на будущее, ощущение безнадёжности"
    // Hopelessness - cognitive triad (future)
    'depression_symptoms_inventory_v1:q12': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q12',
      axisWeights: {
        'depression': 1.0,
        'optimism': -1.0, // (reversed) Core indicator
        'happiness': -0.8, // (reversed)
        'life_satisfaction': -0.8, // (reversed)
        'meaning_purpose': -0.7, // (reversed)
        'growth_mindset': -0.6, // (reversed)
        'vulnerability': 0.9,
        'neuroticism': 0.7,
      },
    ),

    // Q17: "Чрезмерное чувство вины или самообвинение"
    // Excessive guilt
    'depression_symptoms_inventory_v1:q17': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q17',
      axisWeights: {
        'depression': 0.9,
        'self_compassion': -1.0, // (reversed) Harsh on self
        'self_esteem': -0.8, // (reversed)
        'rumination': 0.8, // Tends to ruminate on guilt
        'self_acceptance': -0.7, // (reversed)
        'vulnerability': 0.7,
        'neuroticism': 0.6,
      },
    ),

    // Q22: "Мысли о том, что вы сделали что-то непоправимо плохое"
    // Catastrophic guilt
    'depression_symptoms_inventory_v1:q22': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q22',
      axisWeights: {
        'depression': 0.9,
        'rumination': 0.9, // Rumination on past
        'catastrophizing': 0.8, // Catastrophic thinking
        'self_compassion': -0.9, // (reversed)
        'self_esteem': -0.8, // (reversed)
        'anxiety': 0.6, // Often comorbid
        'vulnerability': 0.8,
        'neuroticism': 0.7,
      },
    ),

    // Q27: "Мысли о том, что лучше бы вас не было" - CRITICAL ITEM
    // Suicidal ideation
    'depression_symptoms_inventory_v1:q27': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q27',
      axisWeights: {
        'depression': 1.0, // Strongest depression indicator
        'life_satisfaction': -1.0, // (reversed)
        'meaning_purpose': -1.0, // (reversed)
        'happiness': -1.0, // (reversed)
        'optimism': -1.0, // (reversed)
        'self_esteem': -0.9, // (reversed)
        'vulnerability': 1.0, // Maximum vulnerability
        'emotional_resilience': -1.0, // (reversed)
      },
    ),

    // ============================================
    // MOTIVATIONAL SYMPTOMS (Q3, Q8, Q13, Q18, Q23)
    // ============================================

    // Q3: "Потеря интереса к занятиям, которые раньше приносили удовольствие"
    // Anhedonia - core symptom
    'depression_symptoms_inventory_v1:q3': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q3',
      axisWeights: {
        'depression': 1.0, // Core depression symptom
        'positive_emotions': -1.0, // (reversed)
        'excitement_seeking': -0.8, // (reversed)
        'actions': -0.7, // (reversed) Less openness to activities
        'curiosity': -0.6, // (reversed)
        'vitality': -0.8, // (reversed)
        'happiness': -0.8, // (reversed)
        'hedonism': -0.7, // (reversed)
      },
    ),

    // Q8: "Отсутствие энергии, ощущение истощённости или усталости"
    // Fatigue
    'depression_symptoms_inventory_v1:q8': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q8',
      axisWeights: {
        'depression': 0.9,
        'vitality': -1.0, // (reversed) Core indicator
        'activity': -0.9, // (reversed)
        'liveliness': -0.8, // (reversed)
        'persistence': -0.6, // (reversed)
        'achievement_striving': -0.5, // (reversed)
        'emotional_resilience': -0.6, // (reversed)
      },
    ),

    // Q13: "Трудности заставить себя что-то делать, даже необходимые вещи"
    // Amotivation
    'depression_symptoms_inventory_v1:q13': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q13',
      axisWeights: {
        'depression': 0.9,
        'self_discipline': -1.0, // (reversed) Core indicator
        'achievement_striving': -0.9, // (reversed)
        'persistence': -0.8, // (reversed)
        'competence': -0.6, // (reversed)
        'diligence': -0.7, // (reversed)
        'intrinsic_motivation': -0.8, // (reversed)
        'procrastination': 0.8, // Tendency to procrastinate
      },
    ),

    // Q18: "Ощущение, что ничто не радует и не приносит удовлетворения"
    // Deep anhedonia
    'depression_symptoms_inventory_v1:q18': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q18',
      axisWeights: {
        'depression': 1.0,
        'positive_emotions': -1.0, // (reversed)
        'happiness': -1.0, // (reversed)
        'life_satisfaction': -0.9, // (reversed)
        'hedonism': -0.8, // (reversed)
        'vitality': -0.7, // (reversed)
        'meaning_purpose': -0.6, // (reversed)
      },
    ),

    // Q23: "Безразличие к вещам, которые раньше были важны"
    // Apathy
    'depression_symptoms_inventory_v1:q23': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q23',
      axisWeights: {
        'depression': 0.9,
        'feelings': -0.9, // (reversed) Emotional flatness
        'positive_emotions': -0.8, // (reversed)
        'intrinsic_motivation': -0.8, // (reversed)
        'curiosity': -0.7, // (reversed)
        'commitment': -0.6, // (reversed) Lower commitment
        'values': -0.5, // (reversed) Disconnection from values
      },
    ),

    // ============================================
    // SOMATIC SYMPTOMS (Q4, Q9, Q14, Q19, Q24)
    // ============================================

    // Q4: "Проблемы со сном: трудности с засыпанием, частые пробуждения"
    // Insomnia
    'depression_symptoms_inventory_v1:q4': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q4',
      axisWeights: {
        'depression': 0.8,
        'stress_tolerance': -0.8, // (reversed)
        'emotional_resilience': -0.6, // (reversed)
        'vitality': -0.7, // (reversed) Poor sleep = low energy
        'calmness': -0.6, // (reversed)
        'anxiety': 0.6, // Often comorbid
        'worry_tendency': 0.5, // Worry disrupts sleep
      },
    ),

    // Q9: "Изменения аппетита: значительное снижение или повышение"
    // Appetite changes
    'depression_symptoms_inventory_v1:q9': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q9',
      axisWeights: {
        'depression': 0.7,
        'mood_stability': -0.7, // (reversed)
        'emotional_resilience': -0.5, // (reversed)
        'self_discipline': -0.4, // (reversed) Disrupted self-regulation
        'vitality': -0.5, // (reversed)
      },
    ),

    // Q14: "Физическая тяжесть в теле, ощущение «свинцовых» рук или ног"
    // Psychomotor retardation
    'depression_symptoms_inventory_v1:q14': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q14',
      axisWeights: {
        'depression': 0.9,
        'vitality': -1.0, // (reversed) Core indicator
        'activity': -0.9, // (reversed)
        'liveliness': -0.8, // (reversed)
        'emotional_resilience': -0.6, // (reversed)
        'vulnerability': 0.7,
      },
    ),

    // Q19: "Чрезмерная сонливость или потребность спать больше обычного"
    // Hypersomnia
    'depression_symptoms_inventory_v1:q19': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q19',
      axisWeights: {
        'depression': 0.8,
        'vitality': -0.8, // (reversed)
        'activity': -0.8, // (reversed)
        'liveliness': -0.7, // (reversed)
        'avoidant_coping': 0.5, // Sleep as escape
        'emotional_resilience': -0.5, // (reversed)
      },
    ),

    // Q24: "Беспокойство, неспособность усидеть на месте или заторможенность"
    // Psychomotor changes
    'depression_symptoms_inventory_v1:q24': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q24',
      axisWeights: {
        'depression': 0.8,
        'composure': -0.8, // (reversed)
        'calmness': -0.7, // (reversed)
        'mood_stability': -0.7, // (reversed)
        'emotional_resilience': -0.6, // (reversed)
        'anxiety': 0.5, // Restlessness often anxious
        'impulsiveness': 0.4,
      },
    ),

    // ============================================
    // SOCIAL SYMPTOMS (Q5, Q10, Q15, Q20, Q25)
    // ============================================

    // Q5: "Желание избегать общения с людьми, стремление к уединению"
    // Social withdrawal
    'depression_symptoms_inventory_v1:q5': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q5',
      axisWeights: {
        'depression': 0.8,
        'gregariousness': -0.9, // (reversed) Core indicator
        'warmth': -0.7, // (reversed)
        'social_boldness': -0.7, // (reversed)
        'social_confidence': -0.6, // (reversed)
        'positive_relations': -0.7, // (reversed)
        'avoidant_attachment': 0.6, // Avoidant pattern
        'introversion': 0.5, // Behavioral introversion (not personality)
      },
    ),

    // Q10: "Трудности с выполнением рабочих или домашних обязанностей"
    // Functional impairment
    'depression_symptoms_inventory_v1:q10': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q10',
      axisWeights: {
        'depression': 0.8,
        'competence': -0.9, // (reversed) Core indicator
        'self_discipline': -0.8, // (reversed)
        'responsibility': -0.7, // (reversed)
        'achievement_striving': -0.7, // (reversed)
        'diligence': -0.7, // (reversed)
        'self_efficacy': -0.6, // (reversed)
        'environmental_mastery': -0.7, // (reversed)
      },
    ),

    // Q15: "Ощущение себя обузой для близких или окружающих"
    // Perceived burdensomeness
    'depression_symptoms_inventory_v1:q15': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q15',
      axisWeights: {
        'depression': 0.9,
        'self_esteem': -0.9, // (reversed)
        'self_compassion': -0.8, // (reversed)
        'relationship_security': -0.7, // (reversed)
        'vulnerability': 0.9,
        'self_acceptance': -0.7, // (reversed)
        'fear_of_abandonment': 0.6, // Fear of rejection
        'neuroticism': 0.6,
      },
    ),

    // Q20: "Чувство одиночества, даже когда есть люди рядом"
    // Loneliness
    'depression_symptoms_inventory_v1:q20': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q20',
      axisWeights: {
        'depression': 0.9,
        'positive_relations': -1.0, // (reversed) Core indicator
        'emotional_intimacy': -0.8, // (reversed)
        'trust_in_relationships': -0.6, // (reversed)
        'warmth': -0.6, // (reversed)
        'vulnerability': 0.8,
        'relatedness_need': 0.7, // Unmet need
      },
    ),

    // Q25: "Отдаление от близких людей, ощущение стены между собой и другими"
    // Disconnection
    'depression_symptoms_inventory_v1:q25': const QuestionWeight(
      testId: 'depression_symptoms_inventory_v1',
      questionId: 'q25',
      axisWeights: {
        'depression': 0.9,
        'emotional_intimacy': -0.9, // (reversed) Core indicator
        'emotional_openness': -0.8, // (reversed)
        'positive_relations': -0.8, // (reversed)
        'vulnerability_sharing': -0.7, // (reversed)
        'trust_in_relationships': -0.6, // (reversed)
        'avoidant_attachment': 0.6,
        'intimacy_comfort': -0.6, // (reversed)
      },
    ),
  };
}
