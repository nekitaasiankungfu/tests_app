import 'question_weight_models.dart';

/// Question weights configuration for Perfectionism and Fear of Error test
/// Maps all 36 questions to ~195 hierarchical psychological scales
///
/// Test measures 4 factors:
/// 1. Healthy Perfectionism (q1, q5, q9, q13R, q17, q21R, q25, q29R, q33R)
/// 2. Maladaptive Perfectionism (q2, q6R, q10, q14, q18R, q22, q26R, q30, q34R)
/// 3. Fear of Evaluation (q3, q7, q11R, q15, q19, q23R, q27, q31R, q35R)
/// 4. Procrastination Due to Ideal (q4, q8, q12R, q16, q20R, q24, q28R, q32, q36R)
///
/// ПРАВИЛО #1: Scores are 0-4 (NOT 1-5!)
/// ПРАВИЛО #6: Using ONLY existing 195 hierarchical scales
class PerfectionismFearOfErrorWeights {
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // FACTOR 1: HEALTHY PERFECTIONISM (9 questions)
    // ========================================================================

    // Q1: "Мне важно выполнять задачи качественно, даже если никто этого не заметит"
    // Intrinsic motivation, quality standards, conscientiousness
    'perfectionism_fear_of_error_v1:q1': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q1',
      axisWeights: {
        'conscientiousness': 1.0,          // Primary: quality orientation
        'achievement_striving': 0.9,       // High: intrinsic achievement
        'self_discipline': 0.8,            // High: internal standards
        'dutifulness': 0.7,                // Secondary: responsibility
        'intrinsic_motivation': 0.9,       // High: internal drive
        'quality_focus': 0.8,              // High: quality standards
        'self_efficacy': 0.6,              // Tertiary: competence belief
        // Personality type
        'judging': 0.5,
      },
      note: 'Intrinsic quality standards + conscientiousness + achievement striving',
    ),

    // Q5: "Высокие стандарты помогают мне расти и развиваться"
    // Growth mindset, adaptive perfectionism
    'perfectionism_fear_of_error_v1:q5': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q5',
      axisWeights: {
        'achievement_striving': 1.0,       // Primary: growth through standards
        'openness_to_growth': 0.9,         // High: development orientation
        'self_improvement': 0.9,           // High: self-development
        'conscientiousness': 0.7,          // Secondary: standards
        'optimism': 0.6,                   // Tertiary: positive view
        'persistence': 0.7,                // Secondary: sustained effort
        // Personality type
        'judging': 0.4,
      },
      note: 'Growth mindset + adaptive standards + self-improvement',
    ),

    // Q9: "Я чувствую удовлетворение, когда сделал всё максимально хорошо в рамках разумного"
    // Satisfaction from achievement, balanced standards
    'perfectionism_fear_of_error_v1:q9': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q9',
      axisWeights: {
        'positive_emotions': 0.9,          // High: satisfaction
        'achievement_striving': 0.8,       // High: achievement orientation
        'self_efficacy': 0.8,              // High: competence satisfaction
        'conscientiousness': 0.7,          // Secondary: quality standards
        'life_satisfaction': 0.6,          // Tertiary: overall satisfaction
        'self_esteem': 0.6,                // Tertiary: self-regard
        // Personality type
        'judging': 0.3,
      },
      note: 'Achievement satisfaction + balanced standards + self-efficacy',
    ),

    // Q13R: "Мне трудно остановиться, даже когда результат уже достаточно хорош" (REVERSED)
    // Difficulty stopping, excessive perfectionism (low healthy = high this)
    'perfectionism_fear_of_error_v1:q13': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q13',
      axisWeights: {
        'flexibility': -0.8,               // Reversed: rigidity
        'stress_tolerance': -0.7,          // Reversed: stress from over-work
        'self_discipline': 0.6,            // Positive: discipline (but excessive)
        'impulsiveness': -0.5,             // Reversed: inability to stop
        'balance': -0.7,                   // Reversed: lack of balance
        'conscientiousness': 0.5,          // Positive but excessive
        // Negative effects
        'burnout': 0.6,                    // Risk: overwork
      },
      note: 'Reversed: Difficulty stopping (rigidity + stress + burnout risk)',
    ),

    // Q17: "Я умею ставить реалистичные цели и планировать шаги к ним"
    // Realistic goal-setting, planning skills
    'perfectionism_fear_of_error_v1:q17': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q17',
      axisWeights: {
        'planning': 1.0,                   // Primary: planning ability
        'goal_orientation': 0.9,           // High: goal setting
        'self_discipline': 0.8,            // High: organized approach
        'achievement_striving': 0.7,       // Secondary: achievement orientation
        'time_management': 0.8,            // High: time planning
        'conscientiousness': 0.7,          // Secondary: organized
        // Personality type
        'judging': 0.6,
      },
      note: 'Realistic planning + goal-setting + time management',
    ),

    // Q21R: "Мне сложно радоваться результату, если он не идеален во всех деталях" (REVERSED)
    // Difficulty with satisfaction, all-or-nothing thinking (low healthy = high this)
    'perfectionism_fear_of_error_v1:q21': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q21',
      axisWeights: {
        'positive_emotions': -0.9,         // Reversed: reduced satisfaction
        'life_satisfaction': -0.7,         // Reversed: dissatisfaction
        'self_compassion': -0.8,           // Reversed: harsh self-judgment
        'cognitive_flexibility': -0.7,     // Reversed: all-or-nothing thinking
        'gratitude': -0.6,                 // Reversed: inability to appreciate
        'self_esteem': -0.6,               // Reversed: low self-regard
      },
      note: 'Reversed: Inability to enjoy imperfect results (dissatisfaction + harsh standards)',
    ),

    // Q25: "Я могу отличить важные детали от второстепенных и распределять усилия соответственно"
    // Prioritization, strategic thinking
    'perfectionism_fear_of_error_v1:q25': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q25',
      axisWeights: {
        'strategic_thinking': 1.0,         // Primary: strategic prioritization
        'attention_control': 0.9,          // High: selective attention
        'cognitive_flexibility': 0.8,      // High: adaptive thinking
        'time_management': 0.8,            // High: efficient allocation
        'problem_solving': 0.7,            // Secondary: effective approach
        'conscientiousness': 0.6,          // Tertiary: organized
        // Personality type
        'thinking': 0.4,
      },
      note: 'Strategic prioritization + cognitive flexibility + time management',
    ),

    // Q29R: "Я часто чувствую, что должен работать больше других, чтобы заслужить право на отдых" (REVERSED)
    // Guilt about rest, worth tied to productivity (low healthy = high this)
    'perfectionism_fear_of_error_v1:q29': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q29',
      axisWeights: {
        'self_compassion': -0.9,           // Reversed: harsh self-judgment
        'self_esteem': -0.8,               // Reversed: conditional self-worth
        'burnout': 0.8,                    // Positive: burnout risk
        'vitality': -0.7,                  // Reversed: depletion
        'balance': -0.8,                   // Reversed: work-life imbalance
        'guilt': 0.7,                      // Positive: excessive guilt
      },
      note: 'Reversed: Worth tied to overwork (burnout + guilt + low self-compassion)',
    ),

    // Q33R: "Когда я не справляюсь на высшем уровне, мне кажется, что вся моя ценность снижается" (REVERSED)
    // Worth tied to performance (low healthy = high this)
    'perfectionism_fear_of_error_v1:q33': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q33',
      axisWeights: {
        'self_esteem': -1.0,               // Reversed: fragile self-worth
        'self_compassion': -0.9,           // Reversed: harsh judgment
        'self_acceptance': -0.9,           // Reversed: conditional acceptance
        'emotional_resilience': -0.7,      // Reversed: vulnerability
        'anxiety': 0.8,                    // Positive: performance anxiety
        'depression': 0.6,                 // Positive: risk
      },
      note: 'Reversed: Worth = performance (fragile self-esteem + anxiety + depression risk)',
    ),

    // ========================================================================
    // FACTOR 2: MALADAPTIVE PERFECTIONISM (9 questions)
    // ========================================================================

    // Q2: "Если я допускаю ошибку, я долго прокручиваю её в голове"
    // Rumination, self-criticism
    'perfectionism_fear_of_error_v1:q2': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q2',
      axisWeights: {
        'rumination': 1.0,                 // Primary: obsessive thinking
        'self_criticism': 1.0,             // Primary: harsh self-judgment
        'anxiety': 0.9,                    // High: anxious rumination
        'emotional_reactivity': 0.8,       // High: strong reaction to errors
        'cognitive_flexibility': -0.7,     // Reversed: stuck thinking
        'self_compassion': -0.8,           // Reversed: lack of kindness
        // Personality type
        'neuroticism': 0.7,
      },
      note: 'Error rumination + self-criticism + anxiety',
    ),

    // Q6R: "Я легко прощаю себе мелкие недочёты" (REVERSED)
    // Self-forgiveness difficulty (low self-forgiveness = high maladaptive)
    'perfectionism_fear_of_error_v1:q6': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q6',
      axisWeights: {
        'self_compassion': -1.0,           // Reversed: harshness
        'self_forgiveness': -1.0,          // Reversed: inability to forgive
        'self_criticism': 0.9,             // Positive: harsh judgment
        'guilt': 0.8,                      // Positive: excessive guilt
        'emotional_resilience': -0.7,      // Reversed: poor recovery
        'flexibility': -0.6,               // Reversed: rigidity
      },
      note: 'Reversed: Difficulty forgiving self (harsh + guilt + low compassion)',
    ),

    // Q10: "Если результат не идеален, я считаю, что провалился"
    // All-or-nothing thinking, failure attribution
    'perfectionism_fear_of_error_v1:q10': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q10',
      axisWeights: {
        'cognitive_distortions': 1.0,      // Primary: all-or-nothing
        'self_criticism': 0.9,             // High: harsh judgment
        'perfectionism': 1.0,              // Primary: unrealistic standards
        'self_esteem': -0.8,               // Reversed: fragile worth
        'depression': 0.7,                 // Secondary: depressive thinking
        'cognitive_flexibility': -0.8,     // Reversed: rigid thinking
        // Personality type
        'neuroticism': 0.6,
      },
      note: 'All-or-nothing thinking + harsh standards + low self-esteem',
    ),

    // Q14: "Я часто сравниваю свои достижения с другими и чувствую, что должен быть лучше"
    // Social comparison, inadequacy
    'perfectionism_fear_of_error_v1:q14': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q14',
      axisWeights: {
        'social_comparison': 1.0,          // Primary: comparison tendency
        'self_esteem': -0.8,               // Reversed: inadequacy
        'envy': 0.7,                       // Secondary: comparative envy
        'anxiety': 0.7,                    // Secondary: social anxiety
        'self_acceptance': -0.7,           // Reversed: lack of self-acceptance
        'competitiveness': 0.6,            // Tertiary: competitive drive
      },
      note: 'Social comparison + inadequacy + anxiety',
    ),

    // Q18R: "Я могу признать ошибку и идти дальше, не зацикливаясь на ней" (REVERSED)
    // Error recovery difficulty (low recovery = high maladaptive)
    'perfectionism_fear_of_error_v1:q18': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q18',
      axisWeights: {
        'emotional_resilience': -1.0,      // Reversed: poor recovery
        'self_compassion': -0.9,           // Reversed: harsh on self
        'rumination': 0.9,                 // Positive: dwelling on errors
        'cognitive_flexibility': -0.8,     // Reversed: stuck
        'acceptance': -0.7,                // Reversed: non-acceptance
        'growth_mindset': -0.7,            // Reversed: fixed mindset
      },
      note: 'Reversed: Difficulty moving past errors (rumination + low resilience)',
    ),

    // Q22: "Часто мои внутренние требования ко мне выше, чем ожидания окружающих"
    // Excessive internal standards
    'perfectionism_fear_of_error_v1:q22': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q22',
      axisWeights: {
        'perfectionism': 1.0,              // Primary: excessive standards
        'self_criticism': 0.9,             // High: harsh self-demands
        'anxiety': 0.8,                    // High: pressure
        'stress_tolerance': -0.7,          // Reversed: stress from standards
        'self_compassion': -0.7,           // Reversed: harshness
        'burnout': 0.6,                    // Secondary: burnout risk
      },
      note: 'Excessive internal standards + self-criticism + anxiety',
    ),

    // Q26R: "Если я сделал ошибку, это не означает, что я плохой специалист или человек" (REVERSED)
    // Identity fusion with performance (low separation = high maladaptive)
    'perfectionism_fear_of_error_v1:q26': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q26',
      axisWeights: {
        'self_esteem': -1.0,               // Reversed: fragile worth
        'self_compassion': -0.9,           // Reversed: harsh judgment
        'self_acceptance': -0.9,           // Reversed: conditional acceptance
        'cognitive_distortions': 0.8,      // Positive: overgeneralization
        'shame': 0.8,                      // Positive: shame proneness
        'anxiety': 0.7,                    // Secondary: performance anxiety
      },
      note: 'Reversed: Identity = performance (shame + fragile self-worth)',
    ),

    // Q30: "Я часто испытываю стыд, вспоминая о своих прошлых промахах"
    // Shame, self-blame
    'perfectionism_fear_of_error_v1:q30': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q30',
      axisWeights: {
        'shame': 1.0,                      // Primary: shame proneness
        'self_criticism': 0.9,             // High: harsh self-judgment
        'rumination': 0.9,                 // High: dwelling on past
        'self_esteem': -0.8,               // Reversed: low self-regard
        'depression': 0.7,                 // Secondary: depressive pattern
        'self_compassion': -0.8,           // Reversed: lack of kindness
        // Personality type
        'neuroticism': 0.7,
      },
      note: 'Shame about errors + rumination + low self-esteem',
    ),

    // Q34R: "Я могу быть к себе доброжелателен, даже когда что-то не получилось" (REVERSED)
    // Self-kindness deficit (low kindness = high maladaptive)
    'perfectionism_fear_of_error_v1:q34': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q34',
      axisWeights: {
        'self_compassion': -1.0,           // Reversed: harshness
        'self_criticism': 0.9,             // Positive: harsh judgment
        'emotional_resilience': -0.8,      // Reversed: poor recovery
        'self_acceptance': -0.8,           // Reversed: non-acceptance
        'kindness': -0.7,                  // Reversed: lack of kindness
        'warmth': -0.6,                    // Reversed: coldness to self
      },
      note: 'Reversed: Lack of self-kindness (harshness + low compassion)',
    ),

    // ========================================================================
    // FACTOR 3: FEAR OF EVALUATION (9 questions)
    // ========================================================================

    // Q3: "Я боюсь, что другие осудят меня, если узнают о моих ошибках"
    // Fear of judgment, social anxiety
    'perfectionism_fear_of_error_v1:q3': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q3',
      axisWeights: {
        'social_anxiety': 1.0,             // Primary: fear of judgment
        'fear_of_negative_evaluation': 1.0, // Primary: evaluation anxiety
        'self_consciousness': 0.9,         // High: self-focus in social situations
        'anxiety': 0.8,                    // High: general anxiety
        'shame': 0.7,                      // Secondary: shame proneness
        'self_esteem': -0.7,               // Reversed: fragile worth
        // Personality type
        'neuroticism': 0.6,
        'introversion': 0.4,
      },
      note: 'Fear of judgment + social anxiety + shame',
    ),

    // Q7: "Мне трудно попросить обратную связь, потому что боюсь услышать критику"
    // Feedback avoidance, criticism sensitivity
    'perfectionism_fear_of_error_v1:q7': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q7',
      axisWeights: {
        'fear_of_negative_evaluation': 1.0, // Primary: criticism fear
        'social_anxiety': 0.9,             // High: social fear
        'assertiveness': -0.8,             // Reversed: low assertiveness
        'self_esteem': -0.7,               // Reversed: fragile worth
        'openness_to_feedback': -0.8,      // Reversed: defensive
        'vulnerability': 0.7,              // Secondary: feeling vulnerable
      },
      note: 'Feedback avoidance + criticism fear + defensiveness',
    ),

    // Q11R: "Замечания других людей я в основном воспринимаю как помощь, а не как угрозу" (REVERSED)
    // Feedback as threat (low constructive view = high fear)
    'perfectionism_fear_of_error_v1:q11': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q11',
      axisWeights: {
        'openness_to_feedback': -1.0,      // Reversed: defensive
        'fear_of_negative_evaluation': 0.9, // Positive: criticism as threat
        'trust_in_relationships': -0.7,    // Reversed: distrust
        'growth_mindset': -0.7,            // Reversed: fixed mindset
        'social_anxiety': 0.7,             // Positive: social fear
        'cognitive_flexibility': -0.6,     // Reversed: rigid interpretation
      },
      note: 'Reversed: Feedback as threat (defensive + fear + distrust)',
    ),

    // Q15: "Я переживаю, что одно неверное действие испортит впечатление обо мне"
    // Impression management anxiety
    'perfectionism_fear_of_error_v1:q15': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q15',
      axisWeights: {
        'social_anxiety': 1.0,             // Primary: impression anxiety
        'fear_of_negative_evaluation': 0.9, // High: evaluation fear
        'self_consciousness': 0.9,         // High: self-monitoring
        'perfectionism': 0.7,              // Secondary: need for flawlessness
        'anxiety': 0.8,                    // High: general anxiety
        'self_esteem': -0.7,               // Reversed: fragile worth
      },
      note: 'Impression management anxiety + perfectionism + self-consciousness',
    ),

    // Q19: "Я сильно переживаю, если кто-то видит, как я учусь и допускаю ошибки"
    // Public error anxiety, performance anxiety
    'perfectionism_fear_of_error_v1:q19': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q19',
      axisWeights: {
        'performance_anxiety': 1.0,        // Primary: performance fear
        'social_anxiety': 0.9,             // High: social context anxiety
        'fear_of_negative_evaluation': 0.9, // High: judgment fear
        'self_consciousness': 0.8,         // High: visibility discomfort
        'shame': 0.7,                      // Secondary: shame about imperfection
        'vulnerability': 0.7,              // Secondary: exposure discomfort
        // Personality type
        'neuroticism': 0.6,
      },
      note: 'Public error anxiety + performance fear + shame',
    ),

    // Q23R: "Мне относительно комфортно показывать другим незавершённый или черновой результат" (REVERSED)
    // Comfort with imperfection (low comfort = high fear)
    'perfectionism_fear_of_error_v1:q23': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q23',
      axisWeights: {
        'social_anxiety': 0.9,             // Positive: fear of showing imperfection
        'fear_of_negative_evaluation': 0.9, // Positive: judgment fear
        'perfectionism': 0.8,              // Positive: need for polish
        'self_consciousness': 0.8,         // Positive: visibility discomfort
        'vulnerability': -0.7,             // Reversed: discomfort with vulnerability
        'self_esteem': -0.6,               // Reversed: fragile worth
      },
      note: 'Reversed: Discomfort with imperfection visibility (fear + perfectionism)',
    ),

    // Q27: "Мне трудно принимать похвалу — я думаю, что люди переоценивают меня и 'раскроют' при первой ошибке"
    // Impostor phenomenon, fear of exposure
    'perfectionism_fear_of_error_v1:q27': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q27',
      axisWeights: {
        'impostor_syndrome': 1.0,          // Primary: impostor feelings
        'self_esteem': -0.9,               // Reversed: low self-regard
        'fear_of_negative_evaluation': 0.9, // High: exposure fear
        'anxiety': 0.8,                    // High: anxiety about being "found out"
        'self_acceptance': -0.8,           // Reversed: non-acceptance
        'shame': 0.7,                      // Secondary: shame about inadequacy
      },
      note: 'Impostor syndrome + fear of exposure + low self-esteem',
    ),

    // Q31R: "Даже если меня оценивают, я всё равно могу позволить себе экспериментировать и пробовать новое" (REVERSED)
    // Risk-taking under evaluation (low risk-taking = high fear)
    'perfectionism_fear_of_error_v1:q31': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q31',
      axisWeights: {
        'fear_of_negative_evaluation': 1.0, // Positive: evaluation constraint
        'creativity': -0.8,                // Reversed: inhibited creativity
        'risk_taking': -0.8,               // Reversed: risk avoidance
        'social_anxiety': 0.8,             // Positive: social constraint
        'openness_to_experience': -0.7,    // Reversed: closed to novelty
        'cognitive_flexibility': -0.7,     // Reversed: rigidity
      },
      note: 'Reversed: Inhibited experimentation under evaluation (fear + rigidity)',
    ),

    // Q35R: "Мне не нужно казаться безупречным, чтобы чувствовать себя принятым другими" (REVERSED)
    // Conditional belonging (low unconditional acceptance = high fear)
    'perfectionism_fear_of_error_v1:q35': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q35',
      axisWeights: {
        'fear_of_negative_evaluation': 1.0, // Positive: acceptance = perfection
        'self_esteem': -0.9,               // Reversed: fragile worth
        'belonging': -0.8,                 // Reversed: insecure belonging
        'self_acceptance': -0.8,           // Reversed: conditional self-worth
        'social_anxiety': 0.8,             // Positive: social fear
        'perfectionism': 0.7,              // Positive: need for flawlessness
      },
      note: 'Reversed: Perfection = belonging (fragile worth + social anxiety)',
    ),

    // ========================================================================
    // FACTOR 4: PROCRASTINATION DUE TO IDEAL (9 questions)
    // ========================================================================

    // Q4: "Я откладываю выполнение задач, пока не почувствую, что готов сделать всё идеально"
    // Delay until readiness, perfectionism-driven procrastination
    'perfectionism_fear_of_error_v1:q4': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q4',
      axisWeights: {
        'procrastination': 1.0,            // Primary: delay behavior
        'perfectionism': 0.9,              // High: ideal standards
        'anxiety': 0.8,                    // High: anxiety about imperfection
        'self_discipline': -0.7,           // Reversed: poor execution
        'initiative': -0.7,                // Reversed: delayed start
        'time_management': -0.6,           // Reversed: poor time use
      },
      note: 'Perfectionism-driven delay + anxiety + poor execution',
    ),

    // Q8: "Иногда я так долго дорабатываю детали, что не успеваю сдать работу вовремя"
    // Over-refinement, deadline issues
    'perfectionism_fear_of_error_v1:q8': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q8',
      axisWeights: {
        'procrastination': 0.9,            // High: delay from over-work
        'perfectionism': 1.0,              // Primary: excessive refinement
        'time_management': -0.8,           // Reversed: poor deadline management
        'cognitive_flexibility': -0.7,     // Reversed: rigidity
        'stress_tolerance': -0.6,          // Reversed: deadline stress
        'prioritization': -0.7,            // Reversed: poor prioritization
      },
      note: 'Over-refinement + deadline issues + poor time management',
    ),

    // Q12R: "Я предпочитаю завершить задачу на хорошем уровне, чем бесконечно доводить её до идеала" (REVERSED)
    // Completion ability (low completion = high procrastination)
    'perfectionism_fear_of_error_v1:q12': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q12',
      axisWeights: {
        'procrastination': 0.9,            // Positive: delay from endless refinement
        'perfectionism': 0.9,              // Positive: ideal pursuit
        'cognitive_flexibility': -0.8,     // Reversed: rigidity
        'pragmatism': -0.8,                // Reversed: impractical
        'time_management': -0.7,           // Reversed: poor completion
        'self_discipline': -0.6,           // Reversed: execution difficulty
      },
      note: 'Reversed: Endless refinement (procrastination + perfectionism + rigidity)',
    ),

    // Q16: "Я откладываю начало сложных задач, потому что заранее боюсь не справиться на нужном уровне"
    // Anticipatory anxiety, avoidance
    'perfectionism_fear_of_error_v1:q16': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q16',
      axisWeights: {
        'procrastination': 1.0,            // Primary: avoidance behavior
        'anxiety': 1.0,                    // Primary: anticipatory anxiety
        'fear_of_failure': 0.9,            // High: failure fear
        'self_efficacy': -0.8,             // Reversed: low confidence
        'initiative': -0.8,                // Reversed: delayed start
        'courage': -0.7,                   // Reversed: avoidance
      },
      note: 'Anticipatory anxiety + avoidance + fear of failure',
    ),

    // Q20R: "Даже если условия не идеальны, я всё равно стараюсь двигаться вперёд по задаче" (REVERSED)
    // Action despite imperfection (low action = high procrastination)
    'perfectionism_fear_of_error_v1:q20': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q20',
      axisWeights: {
        'procrastination': 0.9,            // Positive: waiting for perfection
        'initiative': -0.9,                // Reversed: low initiative
        'pragmatism': -0.8,                // Reversed: impractical
        'cognitive_flexibility': -0.8,     // Reversed: rigidity
        'persistence': -0.7,               // Reversed: conditional effort
        'perfectionism': 0.7,              // Positive: ideal-seeking
      },
      note: 'Reversed: Waiting for perfect conditions (low initiative + rigidity)',
    ),

    // Q24: "Иногда я тяну с началом дела, потому что сначала ищу 'идеальный момент'"
    // Perfect timing fallacy
    'perfectionism_fear_of_error_v1:q24': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q24',
      axisWeights: {
        'procrastination': 1.0,            // Primary: delay behavior
        'perfectionism': 0.9,              // High: ideal-seeking
        'initiative': -0.8,                // Reversed: delayed start
        'pragmatism': -0.7,                // Reversed: impractical
        'cognitive_flexibility': -0.7,     // Reversed: rigid thinking
        'time_management': -0.6,           // Reversed: poor timing
      },
      note: 'Perfect moment fallacy + procrastination + low initiative',
    ),

    // Q28R: "Я стараюсь завершить задачи даже тогда, когда не уверен, что сделаю их идеально" (REVERSED)
    // Completion despite uncertainty (low completion = high procrastination)
    'perfectionism_fear_of_error_v1:q28': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q28',
      axisWeights: {
        'procrastination': 0.9,            // Positive: delay from uncertainty
        'perfectionism': 0.9,              // Positive: ideal requirement
        'self_efficacy': -0.8,             // Reversed: low confidence
        'courage': -0.7,                   // Reversed: avoidance
        'initiative': -0.7,                // Reversed: delayed action
        'risk_taking': -0.6,               // Reversed: risk avoidance
      },
      note: 'Reversed: Delay from uncertainty (procrastination + perfectionism + avoidance)',
    ),

    // Q32: "Иногда я так долго обдумываю, как сделать лучше, что почти не перехожу к действиям"
    // Analysis paralysis
    'perfectionism_fear_of_error_v1:q32': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q32',
      axisWeights: {
        'procrastination': 1.0,            // Primary: delay from over-thinking
        'rumination': 0.9,                 // High: excessive thinking
        'perfectionism': 0.8,              // High: ideal-seeking
        'initiative': -0.8,                // Reversed: low action
        'decisiveness': -0.8,              // Reversed: indecisiveness
        'pragmatism': -0.7,                // Reversed: over-analysis
      },
      note: 'Analysis paralysis + procrastination + indecisiveness',
    ),

    // Q36R: "Даже если работа ещё далека от идеала, я всё равно предпочитаю сдавать её в срок" (REVERSED)
    // Deadline respect (low respect = high procrastination)
    'perfectionism_fear_of_error_v1:q36': const QuestionWeight(
      testId: 'perfectionism_fear_of_error_v1',
      questionId: 'q36',
      axisWeights: {
        'procrastination': 0.9,            // Positive: delay despite deadline
        'perfectionism': 0.9,              // Positive: ideal over timeliness
        'time_management': -0.8,           // Reversed: poor deadline respect
        'pragmatism': -0.8,                // Reversed: impractical
        'responsibility': -0.7,            // Reversed: lower responsibility
        'self_discipline': -0.7,           // Reversed: execution difficulty
      },
      note: 'Reversed: Ideal > deadline (procrastination + poor time management)',
    ),
  };
}
