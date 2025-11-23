import 'question_weight_models.dart';

/// Weight mappings for Anxiety Symptoms Inventory
/// 24 questions mapped to existing 195 psychological scales
/// Test uses 4-point intensity scale (0-3)
///
/// Factors:
/// - somatic: Q1, Q5, Q9, Q13, Q17, Q21 (6 questions)
/// - cognitive: Q2, Q6, Q10, Q14, Q18, Q22 (6 questions)
/// - affective: Q3, Q7, Q11, Q15, Q19, Q23 (6 questions)
/// - behavioral: Q4, Q8, Q12, Q16, Q20, Q24 (6 questions)
class AnxietySymptomsInventoryWeights {
  static final Map<String, QuestionWeight> weights = {
    // ============================================
    // SOMATIC SYMPTOMS (Q1, Q5, Q9, Q13, Q17, Q21)
    // ============================================

    // Q1: "Учащённое сердцебиение или ощущение, что сердце колотится"
    // Rapid heartbeat - cardiovascular manifestation of anxiety
    'anxiety_symptoms_inventory_v1:q1': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q1',
      axisWeights: {
        'anxiety': 1.0, // Direct anxiety indicator
        'panic_tendency': 0.9, // Panic-like symptom
        'stress_tolerance': -0.8, // (reversed) Low stress tolerance
        'emotional_resilience': -0.7, // (reversed) Low resilience
        'emotional_reactivity': 0.8, // High reactivity
        'vulnerability': 0.7, // High vulnerability
        'calmness': -0.9, // (reversed) Low calmness
        'composure': -0.7, // (reversed) Low composure
        'neuroticism': 0.6, // Neuroticism indicator
      },
    ),

    // Q5: "Напряжение или скованность в мышцах"
    // Muscle tension - somatic manifestation
    'anxiety_symptoms_inventory_v1:q5': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q5',
      axisWeights: {
        'anxiety': 0.9,
        'stress_tolerance': -0.9, // (reversed)
        'emotional_resilience': -0.6, // (reversed)
        'vulnerability': 0.7,
        'calmness': -0.8, // (reversed)
        'composure': -0.6, // (reversed)
        'frustration_tolerance': -0.5, // (reversed)
      },
    ),

    // Q9: "Ощущение нехватки воздуха или затруднённое дыхание"
    // Breathing difficulties - respiratory manifestation
    'anxiety_symptoms_inventory_v1:q9': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q9',
      axisWeights: {
        'anxiety': 1.0,
        'panic_tendency': 1.0, // Strong panic indicator
        'stress_tolerance': -0.9, // (reversed)
        'emotional_resilience': -0.8, // (reversed)
        'vulnerability': 0.9,
        'calmness': -1.0, // (reversed)
        'composure': -0.8, // (reversed)
        'neuroticism': 0.7,
      },
    ),

    // Q13: "Повышенная потливость (не связанная с жарой)"
    // Excessive sweating - autonomic symptom
    'anxiety_symptoms_inventory_v1:q13': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q13',
      axisWeights: {
        'anxiety': 0.8,
        'stress_tolerance': -0.7, // (reversed)
        'emotional_reactivity': 0.7,
        'vulnerability': 0.6,
        'calmness': -0.7, // (reversed)
        'self_consciousness': 0.5, // Social embarrassment potential
      },
    ),

    // Q17: "Дрожь в руках или теле"
    // Trembling - motor manifestation
    'anxiety_symptoms_inventory_v1:q17': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q17',
      axisWeights: {
        'anxiety': 1.0,
        'panic_tendency': 0.8,
        'stress_tolerance': -0.9, // (reversed)
        'emotional_resilience': -0.7, // (reversed)
        'vulnerability': 0.8,
        'calmness': -0.9, // (reversed)
        'composure': -0.8, // (reversed)
        'neuroticism': 0.6,
      },
    ),

    // Q21: "Неприятные ощущения в животе, тошнота"
    // Gastrointestinal symptoms
    'anxiety_symptoms_inventory_v1:q21': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q21',
      axisWeights: {
        'anxiety': 0.9,
        'stress_tolerance': -0.8, // (reversed)
        'emotional_resilience': -0.6, // (reversed)
        'vulnerability': 0.7,
        'calmness': -0.7, // (reversed)
        'neuroticism': 0.5,
      },
    ),

    // ============================================
    // COGNITIVE SYMPTOMS (Q2, Q6, Q10, Q14, Q18, Q22)
    // ============================================

    // Q2: "Трудности сосредоточиться из-за беспокойных мыслей"
    // Concentration difficulties
    'anxiety_symptoms_inventory_v1:q2': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q2',
      axisWeights: {
        'anxiety': 0.9,
        'worry_tendency': 1.0, // Direct worry indicator
        'attention_control': -0.9, // (reversed)
        'cognitive_flexibility': -0.6, // (reversed)
        'working_memory': -0.5, // (reversed)
        'processing_speed': -0.4, // (reversed)
        'stress_tolerance': -0.7, // (reversed)
        'calmness': -0.6, // (reversed)
      },
    ),

    // Q6: "Мысли о том, что может случиться что-то плохое"
    // Catastrophizing thoughts
    'anxiety_symptoms_inventory_v1:q6': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q6',
      axisWeights: {
        'anxiety': 1.0,
        'worry_tendency': 1.0,
        'panic_tendency': 0.6,
        'stress_tolerance': -0.8, // (reversed)
        'emotional_resilience': -0.7, // (reversed)
        'optimism': -0.8, // (reversed) Pessimistic thinking
        'vulnerability': 0.8,
        'neuroticism': 0.7,
      },
    ),

    // Q10: "Ощущение, что мысли скачут или трудно их контролировать"
    // Racing thoughts
    'anxiety_symptoms_inventory_v1:q10': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q10',
      axisWeights: {
        'anxiety': 0.9,
        'worry_tendency': 0.9,
        'attention_control': -1.0, // (reversed)
        'cognitive_flexibility': -0.5, // (reversed)
        'deliberation': -0.6, // (reversed)
        'impulsiveness': 0.5, // Less control
        'calmness': -0.7, // (reversed)
        'composure': -0.6, // (reversed)
      },
    ),

    // Q14: "Чрезмерное беспокойство о повседневных делах"
    // Excessive worry
    'anxiety_symptoms_inventory_v1:q14': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q14',
      axisWeights: {
        'anxiety': 1.0,
        'worry_tendency': 1.0,
        'stress_tolerance': -0.9, // (reversed)
        'emotional_resilience': -0.7, // (reversed)
        'calmness': -0.8, // (reversed)
        'optimism': -0.6, // (reversed)
        'neuroticism': 0.7,
        'perfectionism': 0.4, // Often linked
      },
    ),

    // Q18: "Мысли, которые прокручиваются снова и снова"
    // Rumination
    'anxiety_symptoms_inventory_v1:q18': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q18',
      axisWeights: {
        'anxiety': 0.9,
        'worry_tendency': 1.0,
        'attention_control': -0.8, // (reversed)
        'cognitive_flexibility': -0.7, // (reversed)
        'stress_tolerance': -0.7, // (reversed)
        'calmness': -0.6, // (reversed)
        'depression': 0.5, // Rumination linked to depression
        'neuroticism': 0.6,
      },
    ),

    // Q22: "Ожидание худшего исхода событий"
    // Negative expectations / catastrophizing
    'anxiety_symptoms_inventory_v1:q22': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q22',
      axisWeights: {
        'anxiety': 1.0,
        'worry_tendency': 0.9,
        'optimism': -1.0, // (reversed) Strong pessimism
        'stress_tolerance': -0.7, // (reversed)
        'emotional_resilience': -0.8, // (reversed)
        'vulnerability': 0.7,
        'depression': 0.4,
        'neuroticism': 0.6,
      },
    ),

    // ============================================
    // AFFECTIVE SYMPTOMS (Q3, Q7, Q11, Q15, Q19, Q23)
    // ============================================

    // Q3: "Чувство нервозности или взвинченности"
    // Nervousness
    'anxiety_symptoms_inventory_v1:q3': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q3',
      axisWeights: {
        'anxiety': 1.0,
        'emotional_reactivity': 0.9,
        'stress_tolerance': -0.9, // (reversed)
        'emotional_resilience': -0.7, // (reversed)
        'calmness': -1.0, // (reversed) Direct opposite
        'composure': -0.8, // (reversed)
        'mood_stability': -0.7, // (reversed)
        'neuroticism': 0.8,
      },
    ),

    // Q7: "Ощущение страха без видимой причины"
    // Free-floating fear
    'anxiety_symptoms_inventory_v1:q7': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q7',
      axisWeights: {
        'anxiety': 1.0,
        'panic_tendency': 0.9,
        'stress_tolerance': -0.9, // (reversed)
        'emotional_resilience': -0.8, // (reversed)
        'vulnerability': 0.9,
        'calmness': -0.9, // (reversed)
        'social_boldness': -0.5, // (reversed) Fear affects boldness
        'neuroticism': 0.8,
      },
    ),

    // Q11: "Чувство, что вот-вот случится что-то ужасное"
    // Impending doom
    'anxiety_symptoms_inventory_v1:q11': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q11',
      axisWeights: {
        'anxiety': 1.0,
        'panic_tendency': 1.0, // Strong panic indicator
        'stress_tolerance': -1.0, // (reversed)
        'emotional_resilience': -0.9, // (reversed)
        'vulnerability': 1.0,
        'calmness': -1.0, // (reversed)
        'optimism': -0.8, // (reversed)
        'neuroticism': 0.9,
      },
    ),

    // Q15: "Раздражительность или вспыльчивость"
    // Irritability
    'anxiety_symptoms_inventory_v1:q15': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q15',
      axisWeights: {
        'anxiety': 0.7,
        'anger': 0.9, // Direct anger indicator
        'emotional_reactivity': 0.9,
        'frustration_tolerance': -0.9, // (reversed)
        'stress_tolerance': -0.7, // (reversed)
        'mood_stability': -0.8, // (reversed)
        'composure': -0.7, // (reversed)
        'impulsiveness': 0.6,
        'neuroticism': 0.7,
      },
    ),

    // Q19: "Ощущение внутреннего беспокойства или тревоги"
    // Inner restlessness
    'anxiety_symptoms_inventory_v1:q19': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q19',
      axisWeights: {
        'anxiety': 1.0,
        'worry_tendency': 0.8,
        'emotional_reactivity': 0.7,
        'stress_tolerance': -0.8, // (reversed)
        'emotional_resilience': -0.7, // (reversed)
        'calmness': -1.0, // (reversed)
        'composure': -0.7, // (reversed)
        'mood_stability': -0.6, // (reversed)
        'neuroticism': 0.7,
      },
    ),

    // Q23: "Чувство неуверенности или незащищённости"
    // Insecurity
    'anxiety_symptoms_inventory_v1:q23': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q23',
      axisWeights: {
        'anxiety': 0.9,
        'vulnerability': 1.0,
        'self_consciousness': 0.8,
        'stress_tolerance': -0.7, // (reversed)
        'emotional_resilience': -0.8, // (reversed)
        'social_confidence': -0.8, // (reversed)
        'social_boldness': -0.6, // (reversed)
        'fear_of_abandonment': 0.5, // Related fear
        'neuroticism': 0.7,
      },
    ),

    // ============================================
    // BEHAVIORAL SYMPTOMS (Q4, Q8, Q12, Q16, Q20, Q24)
    // ============================================

    // Q4: "Трудности с засыпанием из-за тревожных мыслей"
    // Sleep difficulties
    'anxiety_symptoms_inventory_v1:q4': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q4',
      axisWeights: {
        'anxiety': 0.9,
        'worry_tendency': 0.9,
        'stress_tolerance': -0.8, // (reversed)
        'emotional_resilience': -0.6, // (reversed)
        'calmness': -0.9, // (reversed)
        'attention_control': -0.5, // (reversed) Can't stop thoughts
        'neuroticism': 0.6,
      },
    ),

    // Q8: "Стремление избегать ситуаций, которые вызывают беспокойство"
    // Avoidance behavior
    'anxiety_symptoms_inventory_v1:q8': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q8',
      axisWeights: {
        'anxiety': 0.9,
        'avoidant_attachment': 0.6,
        'social_boldness': -0.8, // (reversed)
        'social_confidence': -0.7, // (reversed)
        'actions': -0.6, // (reversed) Less openness to new actions
        'excitement_seeking': -0.5, // (reversed)
        'assertiveness': -0.5, // (reversed)
        'vulnerability': 0.7,
      },
    ),

    // Q12: "Суетливость, неспособность усидеть на месте"
    // Restlessness
    'anxiety_symptoms_inventory_v1:q12': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q12',
      axisWeights: {
        'anxiety': 0.9,
        'emotional_reactivity': 0.7,
        'impulsiveness': 0.6,
        'stress_tolerance': -0.7, // (reversed)
        'calmness': -0.9, // (reversed)
        'composure': -0.8, // (reversed)
        'deliberation': -0.5, // (reversed)
        'self_discipline': -0.4, // (reversed)
      },
    ),

    // Q16: "Трудности с расслаблением, постоянное напряжение"
    // Difficulty relaxing
    'anxiety_symptoms_inventory_v1:q16': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q16',
      axisWeights: {
        'anxiety': 1.0,
        'stress_tolerance': -1.0, // (reversed) Core indicator
        'emotional_resilience': -0.8, // (reversed)
        'calmness': -1.0, // (reversed)
        'composure': -0.8, // (reversed)
        'vulnerability': 0.8,
        'neuroticism': 0.7,
      },
    ),

    // Q20: "Проверка и перепроверка вещей"
    // Checking behavior
    'anxiety_symptoms_inventory_v1:q20': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q20',
      axisWeights: {
        'anxiety': 0.8,
        'worry_tendency': 0.8,
        'perfectionism': 0.5, // Related trait
        'stress_tolerance': -0.6, // (reversed)
        'calmness': -0.5, // (reversed)
        'attention_control': -0.4, // (reversed) Compulsive attention
        'order': 0.3, // Sometimes linked to order need
      },
    ),

    // Q24: "Откладывание дел из-за страха не справиться"
    // Procrastination due to fear
    'anxiety_symptoms_inventory_v1:q24': const QuestionWeight(
      testId: 'anxiety_symptoms_inventory_v1',
      questionId: 'q24',
      axisWeights: {
        'anxiety': 0.9,
        'vulnerability': 0.8,
        'self_discipline': -0.8, // (reversed)
        'achievement_striving': -0.6, // (reversed)
        'persistence': -0.6, // (reversed)
        'competence': -0.5, // (reversed) Self-doubt
        'self_consciousness': 0.6, // Fear of failure
        'avoidant_attachment': 0.4,
        'diligence': -0.5, // (reversed)
      },
    ),
  };
}
