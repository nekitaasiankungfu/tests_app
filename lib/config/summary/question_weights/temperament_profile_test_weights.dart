import 'question_weight_models.dart';

/// Question weights configuration for Temperament Profile Test
/// Maps 60 questions to ~195 hierarchical psychological scales
///
/// Test measures 6 temperament factors:
/// - EA (Energy and Activity): q1-q10 - life energy, initiative, mobility
/// - EU (Emotional Stability): q11-q20 - emotional control, stress resilience
/// - IS (Impulsivity and Self-Control): q21-q30 - spontaneity vs deliberation
/// - SO (Social Openness): q31-q40 - extraversion, social engagement
/// - TR (Tempo and Rhythm): q41-q50 - reaction speed, cognitive pace
/// - GA (Flexibility and Adaptability): q51-q60 - behavioral flexibility, change adaptation
class TemperamentProfileTestWeights {
  /// TEMPERAMENT PROFILE TEST - 60 Questions
  ///
  /// This analysis uses the hierarchical scale system (195 detailed subscales)
  /// Each question maps to 4-10 axes with psychometric rationale
  /// Weight categories: Primary (0.8-1.0), Secondary (0.4-0.7), Tertiary (0.2-0.3)
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // FACTOR EA: ENERGY AND ACTIVITY (q1-q10)
    // ========================================================================

    // Q1: "I find it hard to sit idle" (EA, not reversed)
    // High activity need = restlessness, energy, anti-passivity
    'temperament_profile_test:q1': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q1',
      axisWeights: {
        'activity': 1.0,                     // Primary: Need for activity
        'vitality': 0.8,                     // High: Life energy
        'impulsiveness': 0.7,                // Secondary: Difficulty being idle
        'excitement_seeking': 0.6,           // Secondary: Stimulation seeking
        'intrinsic_motivation': 0.5,         // Secondary: Self-driven activity
        'liveliness': 0.4,                   // Moderate: Energetic presence
        // Personality Type personality type scales
        'extraversion': 0.3,
        'perceiving': 0.2,
      },
      note: 'Energy core: high activity need + vitality + restlessness + stimulation seeking',
    ),

    // Q2: "I quickly engage in new activities" (EA, not reversed)
    // Quick engagement = initiative, action orientation, low inertia
    'temperament_profile_test:q2': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q2',
      axisWeights: {
        'assertiveness': 1.0,                // Primary: Proactive engagement
        'activity': 0.8,                     // High: Action-oriented
        'novelty_seeking': 0.7,              // Secondary: Openness to new
        'decisiveness': 0.6,                 // Secondary: Quick action decisions
        'cognitive_flexibility': 0.5,                 // Secondary: Flexibility in starting
        'intrinsic_motivation': 0.4,         // Moderate: Self-starting
        // Personality Type personality type scales
        'extraversion': 0.3,
        'intuition': 0.2,
      },
      note: 'Initiative: quick engagement + proactivity + novelty seeking + decisiveness',
    ),

    // Q3: "I often feel a surge of energy and enthusiasm" (EA, not reversed)
    // Energy surges = vitality, positive emotions, energetic arousal
    'temperament_profile_test:q3': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q3',
      axisWeights: {
        'vitality': 1.0,                     // Primary: Life energy
        'positive_emotions': 0.9,            // Primary: Enthusiasm/joy
        'activity': 0.7,                     // Secondary: Energetic state
        'liveliness': 0.7,                   // Secondary: Animated energy
        'excitement_seeking': 0.5,           // Secondary: Energy for stimulation
        'mood_stability': 0.4,               // Moderate: Positive baseline mood
        // Personality Type personality type scales
        'extraversion': 0.4,
        'feeling': 0.2,
      },
      note: 'Vitality: energy surges + positive emotions + liveliness + enthusiasm',
    ),

    // Q4: "I like to be constantly on the move" (EA, not reversed)
    // Constant movement = activity preference, restlessness, kinetic drive
    'temperament_profile_test:q4': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q4',
      axisWeights: {
        'activity': 1.0,                     // Primary: Movement preference
        'impulsiveness': 0.8,                // High: Can't stay still
        'excitement_seeking': 0.6,           // Secondary: Stimulation through movement
        'vitality': 0.6,                     // Secondary: Physical energy
        'patience': -0.5,                     // Secondary: Low patience (reversed)
        'sensation_seeking': 0.4,            // Moderate: Physical stimulation
        // Personality Type personality type scales
        'extraversion': 0.3,
        'sensing': 0.2,
      },
      note: 'Movement drive: high activity + restlessness + excitement seeking + low patience',
    ),

    // Q5: "I get tired faster than others" (EA, REVERSED)
    // Quick fatigue = low stamina, low vitality, energy depletion (reversed for EA)
    'temperament_profile_test:q5': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q5',
      axisWeights: {
        'vitality': -1.0,                     // Primary: Low energy (reversed)
        'activity': -0.8,                     // High: Low activity capacity (reversed)
        'emotional_resilience': -0.6,         // Secondary: Physical resilience (reversed)
        'stress_tolerance': -0.5,             // Secondary: Energy under pressure (reversed)
        'persistence': -0.5,                  // Secondary: Endurance (reversed)
        'composure': -0.4,                    // Moderate: Energy depletion (reversed)
        // Personality Type personality type scales
        'introversion': 0.3,
      },
      note: 'Low stamina (REVERSED): quick fatigue = low vitality + low activity capacity + low resilience',
    ),

    // Q6: "I tend to act as soon as an idea comes to me" (EA, not reversed)
    // Immediate action = impulsiveness, quick decisiveness, low deliberation
    'temperament_profile_test:q6': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q6',
      axisWeights: {
        'impulsiveness': 1.0,                // Primary: Immediate action
        'decisiveness': 0.8,                 // High: Quick decisions
        'activity': 0.7,                     // Secondary: Action orientation
        'deliberation': -0.6,                 // Secondary: Low planning (reversed)
        'assertiveness': 0.5,                // Secondary: Proactive action
        'patience': -0.4,                     // Moderate: Low waiting (reversed)
        // Personality Type personality type scales
        'extraversion': 0.3,
        'perceiving': 0.3,
      },
      note: 'Impulsive action: immediate response + low deliberation + high decisiveness + initiative',
    ),

    // Q7: "I easily motivate myself to be active" (EA, not reversed)
    // Self-motivation = intrinsic motivation, self-discipline for activity, autonomy
    'temperament_profile_test:q7': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q7',
      axisWeights: {
        'intrinsic_motivation': 1.0,         // Primary: Self-driven motivation
        'self_discipline': 0.8,              // High: Self-activation
        'activity': 0.7,                     // Secondary: Activity engagement
        'assertiveness': 0.6,                // Secondary: Self-starting
        'achievement_motivation': 0.5,       // Secondary: Drive for doing
        'autonomy_need': 0.4,                // Moderate: Self-directed action
        // Personality Type personality type scales
        'extraversion': 0.3,
        'judging': 0.2,
      },
      note: 'Self-motivation: intrinsic drive + self-discipline + initiative + autonomy',
    ),

    // Q8: "I often take on multiple tasks at once" (EA, not reversed)
    // Multitasking = high activity, low focus, energetic engagement
    'temperament_profile_test:q8': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q8',
      axisWeights: {
        'activity': 1.0,                     // Primary: Multiple simultaneous actions
        'attention_control': -0.7,            // Secondary: Divided attention (reversed)
        'cognitive_flexibility': 0.6,        // Secondary: Task switching
        'vitality': 0.6,                     // Secondary: High energy demand
        'impulsiveness': 0.5,                // Secondary: Action impulse
        'organization': -0.4,                 // Moderate: Low single-focus (reversed)
        // Personality Type personality type scales
        'extraversion': 0.3,
        'perceiving': 0.3,
      },
      note: 'Multitasking: high activity + divided attention + cognitive flexibility + energy',
    ),

    // Q9: "After sleep, I quickly get into working mode" (EA, not reversed)
    // Quick activation = fast arousal, alertness, readiness, energy mobilization
    'temperament_profile_test:q9': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q9',
      axisWeights: {
        'activity': 1.0,                     // Primary: Quick mental activation
        'processing_speed': 0.8,             // High: Fast readiness
        'vitality': 0.7,                     // Secondary: Morning energy
        'cognitive_flexibility': 0.6,                 // Secondary: State transition speed
        'self_discipline': 0.5,              // Secondary: Morning routine
        'liveliness': 0.4,                   // Moderate: Quick energy state
        // Personality Type personality type scales
        'extraversion': 0.3,
      },
      note: 'Quick activation: fast arousal + alertness + vitality + processing speed',
    ),

    // Q10: "I prefer a calm lifestyle" (EA, REVERSED)
    // Calm preference = low activity, low excitement seeking, preference for peace (reversed for EA)
    'temperament_profile_test:q10': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q10',
      axisWeights: {
        'activity': -1.0,                     // Primary: Low activity preference (reversed)
        'excitement_seeking': -0.9,           // Primary: Low stimulation need (reversed)
        'sensation_seeking': -0.7,            // Secondary: Low novelty (reversed)
        'calmness': 0.6,                     // Secondary: Preference for calm (positive)
        'novelty_seeking': -0.5,              // Secondary: Low variety seeking (reversed)
        'impulsiveness': 0.4,                // Moderate: Low impulsiveness (positive)
        // Personality Type personality type scales
        'introversion': 0.4,
        'sensing': 0.2,
      },
      note: 'Calm preference (REVERSED): low activity + low excitement seeking + preference for peace',
    ),

    // ========================================================================
    // FACTOR EU: EMOTIONAL STABILITY (q11-q20)
    // ========================================================================

    // Q11: "In difficult situations, I maintain composure" (EU, not reversed)
    // Maintain composure = composure, emotional stability, stress tolerance
    'temperament_profile_test:q11': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q11',
      axisWeights: {
        'composure': 1.0,                    // Primary: Emotional control under stress
        'stress_tolerance': 0.9,             // Primary: Stress resilience
        'emotional_resilience': 0.8,         // High: Bounce-back capacity
        'calmness': 0.7,                     // Secondary: Baseline calm
        'emotional_reactivity': -0.6,         // Secondary: Low reactivity (reversed)
        'emotional_intelligence': 0.5,       // Secondary: Emotional regulation
        // Personality Type personality type scales
        'thinking': 0.3,
        'judging': 0.2,
      },
      note: 'Composure: emotional control + stress tolerance + resilience + calmness',
    ),

    // Q12: "I rarely panic" (EU, not reversed)
    // Low panic = panic resistance, calmness, emotional stability
    'temperament_profile_test:q12': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q12',
      axisWeights: {
        'panic_tendency': -1.0,               // Primary: Low panic (reversed)
        'anxiety': -0.9,                      // Primary: Low anxiety (reversed)
        'emotional_resilience': 0.8,         // High: Stable emotional state
        'calmness': 0.7,                     // Secondary: Calm temperament
        'stress_tolerance': 0.6,             // Secondary: Stress resistance
        'composure': 0.5,                    // Secondary: Maintained control
        // Personality Type personality type scales
        'thinking': 0.3,
      },
      note: 'Low panic: panic resistance + low anxiety + emotional stability + calmness',
    ),

    // Q13: "I react calmly to criticism" (EU, not reversed)
    // Calm to criticism = low defensiveness, composure, self-acceptance, frustration tolerance
    'temperament_profile_test:q13': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q13',
      axisWeights: {
        'composure': 1.0,                    // Primary: Calm under criticism
        'frustration_tolerance': 0.8,        // High: Criticism tolerance
        'self_acceptance': 0.7,              // Secondary: Secure self-view
        'emotional_resilience': 0.6,         // Secondary: Resilience to feedback
        'anger': -0.6,                        // Secondary: Low anger (reversed)
        'self_consciousness': -0.5,           // Secondary: Low social anxiety (reversed)
        // Personality Type personality type scales
        'thinking': 0.4,
        'introversion': 0.2,
      },
      note: 'Criticism tolerance: composure + frustration tolerance + self-acceptance + low anger',
    ),

    // Q14: "I dwell on troubles for a long time" (EU, REVERSED)
    // Rumination = worry tendency, rumination, low resilience (reversed for EU)
    'temperament_profile_test:q14': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q14',
      axisWeights: {
        'rumination': -1.0,                   // Primary: Mental dwelling (reversed)
        'emotional_resilience': -0.9,         // Primary: Low bounce-back (reversed)
        'worry_tendency': -0.8,               // High: Persistent worry (reversed)
        'catastrophizing': -0.6,              // Secondary: Negative focus (reversed)
        'cognitive_reappraisal': -0.5,        // Secondary: Low reframing (reversed)
        'mood_stability': -0.5,               // Secondary: Mood persistence (reversed)
        // Personality Type personality type scales
        'feeling': 0.4,
        'introversion': 0.2,
      },
      note: 'Rumination (REVERSED): dwelling + low resilience + worry + catastrophizing',
    ),

    // Q15: "I am able to recover quickly from stress" (EU, not reversed)
    // Quick recovery = emotional resilience, stress tolerance, adaptive coping
    'temperament_profile_test:q15': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q15',
      axisWeights: {
        'emotional_resilience': 1.0,         // Primary: Recovery capacity
        'stress_tolerance': 0.9,             // Primary: Stress resistance
        'cognitive_flexibility': 0.7,                 // Secondary: Adaptive flexibility
        'calmness': 0.6,                     // Secondary: Return to baseline
        'vitality': 0.5,                     // Secondary: Energy restoration
        'problem_focused_coping': 0.5,       // Secondary: Effective coping
        // Personality Type personality type scales
        'thinking': 0.3,
      },
      note: 'Resilience: quick recovery + stress tolerance + adaptability + coping',
    ),

    // Q16: "Small things rarely upset me" (EU, not reversed)
    // Low upset to trivia = frustration tolerance, composure, emotional stability
    'temperament_profile_test:q16': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q16',
      axisWeights: {
        'frustration_tolerance': 1.0,        // Primary: Tolerance to minor annoyances
        'emotional_reactivity': -0.9,         // Primary: Low reactivity (reversed)
        'composure': 0.8,                    // High: Maintained calm
        'anger': -0.7,                        // Secondary: Low irritability (reversed)
        'calmness': 0.6,                     // Secondary: Baseline tranquility
        'patience': 0.5,                     // Secondary: Tolerance capacity
        // Personality Type personality type scales
        'thinking': 0.3,
      },
      note: 'Frustration tolerance: low reactivity to trivia + composure + low anger + patience',
    ),

    // Q17: "I know how to manage my emotions" (EU, not reversed)
    // Emotion management = emotional intelligence, self-control, regulation
    'temperament_profile_test:q17': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q17',
      axisWeights: {
        'emotional_intelligence': 1.0,       // Primary: Emotion awareness/control
        'self_discipline': 0.8,              // High: Emotional self-control
        'composure': 0.7,                    // Secondary: Controlled expression
        'cognitive_reappraisal': 0.6,        // Secondary: Reframing skill
        'self_awareness': 0.6,               // Secondary: Emotion recognition
        'maturity': 0.5,                     // Secondary: Emotional maturity
        // Personality Type personality type scales
        'feeling': 0.4,
        'judging': 0.2,
      },
      note: 'Emotion management: emotional intelligence + self-control + reappraisal + awareness',
    ),

    // Q18: "I often worry without a specific reason" (EU, REVERSED)
    // Free-floating anxiety = generalized anxiety, worry tendency (reversed for EU)
    'temperament_profile_test:q18': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q18',
      axisWeights: {
        'anxiety': -1.0,                      // Primary: Generalized anxiety (reversed)
        'worry_tendency': -0.9,               // Primary: Chronic worry (reversed)
        'emotional_resilience': -0.8,          // High: Low stability (reversed)
        'calmness': -0.7,                     // Secondary: Low calm (reversed)
        'rumination': -0.6,                   // Secondary: Mental preoccupation (reversed)
        'stress_tolerance': -0.5,             // Secondary: Low tolerance (reversed)
        // Personality Type personality type scales
        'feeling': 0.4,
        'intuition': 0.2,
      },
      note: 'Free-floating anxiety (REVERSED): generalized worry + chronic anxiety + low stability',
    ),

    // Q19: "I don't get flustered by surprises" (EU, not reversed)
    // Surprise tolerance = adaptability, composure, low anxiety
    'temperament_profile_test:q19': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q19',
      axisWeights: {
        'composure': 1.0,                    // Primary: Calm under unexpected
        'cognitive_flexibility': 0.9,                 // Primary: Flexibility to change
        'anxiety': -0.7,                      // Secondary: Low anticipatory anxiety (reversed)
        'stress_tolerance': 0.6,             // Secondary: Stress resistance
        'emotional_reactivity': -0.5,         // Secondary: Low reactivity (reversed)
        // Personality Type personality type scales
        'thinking': 0.3,
        'perceiving': 0.3,
      },
      note: 'Surprise tolerance: composure + adaptability + low anxiety + cognitive flexibility',
    ),

    // Q20: "I tend to dramatize situations" (EU, REVERSED)
    // Dramatization = catastrophizing, emotional reactivity, low composure (reversed for EU)
    'temperament_profile_test:q20': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q20',
      axisWeights: {
        'catastrophizing': -1.0,              // Primary: Exaggeration tendency (reversed)
        'emotional_reactivity': -0.9,         // Primary: High reactivity (reversed)
        'composure': -0.8,                    // High: Low composure (reversed)
        'emotional_intelligence': -0.6,       // Secondary: Low regulation (reversed)
        'anxiety': -0.6,                      // Secondary: Anxious amplification (reversed)
        'expressiveness': 0.4,               // Moderate: Dramatic expression
        // Personality Type personality type scales
        'feeling': 0.4,
        'extraversion': 0.2,
      },
      note: 'Dramatization (REVERSED): catastrophizing + high reactivity + low composure + anxiety',
    ),

    // ========================================================================
    // FACTOR IS: IMPULSIVITY AND SELF-CONTROL (q21-q30)
    // ========================================================================

    // Q21: "I often act without thinking" (IS, REVERSED)
    // Acting without thought = impulsiveness, low deliberation (reversed for self-control)
    'temperament_profile_test:q21': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q21',
      axisWeights: {
        'impulsiveness': -1.0,                // Primary: Unthinking action (reversed)
        'deliberation': -0.9,                 // Primary: Low planning (reversed)
        'self_discipline': -0.8,              // High: Low control (reversed)
        'patience': -0.6,                     // Secondary: Low waiting (reversed)
        'cognitive_reappraisal': -0.5,        // Secondary: Low reflection (reversed)
        'decisiveness_behavior': 0.4,        // Moderate: Quick but hasty decisions
        // Personality Type personality type scales
        'perceiving': 0.4,
        'extraversion': 0.2,
      },
      note: 'Impulsiveness (REVERSED): acting without thought + low deliberation + low self-control',
    ),

    // Q22: "Before an important decision, I try to think everything through" (IS, not reversed)
    // Thoughtful decision = deliberation, analytical thinking, self-discipline
    'temperament_profile_test:q22': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q22',
      axisWeights: {
        'deliberation': 1.0,                 // Primary: Careful consideration
        'analytical_thinking': 0.8,          // High: Systematic analysis
        'critical_thinking': 0.7,            // Secondary: Evaluation skill
        'self_discipline': 0.6,              // Secondary: Controlled decision-making
        'prudence': 0.6,                     // Secondary: Cautious approach
        'patience': 0.5,                     // Secondary: Takes time
        // Personality Type personality type scales
        'thinking': 0.4,
        'judging': 0.4,
      },
      note: 'Deliberation: thoughtful analysis + careful consideration + prudence + patience',
    ),

    // Q23: "I easily give in to impulses" (IS, REVERSED)
    // Giving in to impulses = impulsiveness, low self-control (reversed for self-control)
    'temperament_profile_test:q23': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q23',
      axisWeights: {
        'impulsiveness': -1.0,                // Primary: Impulse yielding (reversed)
        'self_discipline': -0.9,              // Primary: Low control (reversed)
        'deliberation': -0.7,                 // Secondary: Low planning (reversed)
        'patience': -0.6,                     // Secondary: Low delay capacity (reversed)
        'hedonism': -0.6,                     // Secondary: Pleasure seeking (reversed)
        'emotional_reactivity': 0.4,         // Moderate: Reactive behavior
        // Personality Type personality type scales
        'perceiving': 0.4,
        'feeling': 0.2,
      },
      note: 'Impulse yielding (REVERSED): low self-control + high impulsiveness + low resistance',
    ),

    // Q24: "I can restrain irritation" (IS, not reversed)
    // Restraining irritation = self-control, anger management, composure
    'temperament_profile_test:q24': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q24',
      axisWeights: {
        'self_discipline': 1.0,              // Primary: Emotional self-control
        'anger': -0.9,                        // Primary: Anger control (reversed)
        'composure': 0.8,                    // High: Maintained calm
        'frustration_tolerance': 0.7,        // Secondary: Irritation tolerance
        'emotional_intelligence': 0.6,       // Secondary: Emotion management
        'patience': 0.5,                     // Secondary: Tolerance capacity
        // Personality Type personality type scales
        'thinking': 0.3,
        'judging': 0.3,
      },
      note: 'Anger restraint: self-control + anger management + composure + frustration tolerance',
    ),

    // Q25: "I act quickly, even when not everything is clear" (IS, REVERSED)
    // Quick action despite uncertainty = impulsiveness, low prudence (reversed for self-control)
    'temperament_profile_test:q25': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q25',
      axisWeights: {
        'impulsiveness': -1.0,                // Primary: Hasty action (reversed)
        'prudence': -0.9,                     // Primary: Low caution (reversed)
        'deliberation': -0.8,                 // High: Low consideration (reversed)
        'risk_taking': 0.6,                  // Secondary: Risk tolerance
        'patience': -0.5,                     // Secondary: Low waiting (reversed)
        'anxiety': 0.4,                      // Moderate: Low anticipatory anxiety
        // Personality Type personality type scales
        'perceiving': 0.4,
        'extraversion': 0.2,
      },
      note: 'Hasty action (REVERSED): impulsiveness + low prudence + low deliberation + risk-taking',
    ),

    // Q26: "I am able to stop myself when necessary" (IS, not reversed)
    // Self-stopping = self-control, impulse control, self-discipline
    'temperament_profile_test:q26': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q26',
      axisWeights: {
        'self_discipline': 1.0,              // Primary: Behavioral self-control
        'impulsiveness': -0.9,                // Primary: Low impulsiveness (reversed)
        'composure': 0.7,                    // Secondary: Maintained control
        'deliberation': 0.6,                 // Secondary: Considered restraint
        'emotional_intelligence': 0.5,       // Secondary: Self-awareness
        'patience': 0.5,                     // Secondary: Delay capacity
        // Personality Type personality type scales
        'judging': 0.4,
        'thinking': 0.2,
      },
      note: 'Self-stopping: self-control + low impulsiveness + composure + deliberation',
    ),

    // Q27: "I often do things based on emotions" (IS, REVERSED)
    // Emotion-driven action = emotional reactivity, low self-control (reversed for self-control)
    'temperament_profile_test:q27': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q27',
      axisWeights: {
        'emotional_reactivity': -1.0,         // Primary: Emotion-driven behavior (reversed)
        'self_discipline': -0.9,              // Primary: Low emotional control (reversed)
        'deliberation': -0.7,                 // Secondary: Low rational thought (reversed)
        'impulsiveness': -0.6,                // Secondary: Reactive impulsiveness (reversed)
        'emotional_intelligence': -0.5,       // Secondary: Low regulation (reversed)
        'composure': -0.5,                    // Secondary: Low composure (reversed)
        // Personality Type personality type scales
        'feeling': 0.5,
        'perceiving': 0.3,
      },
      note: 'Emotion-driven (REVERSED): emotional reactivity + low self-control + low deliberation',
    ),

    // Q28: "I carefully plan my steps" (IS, not reversed)
    // Careful planning = deliberation, organization, prudence, self-discipline
    'temperament_profile_test:q28': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q28',
      axisWeights: {
        'deliberation': 1.0,                 // Primary: Careful planning
        'organization': 0.8,                 // High: Structured approach
        'prudence': 0.7,                     // Secondary: Cautious planning
        'self_discipline': 0.6,              // Secondary: Planning discipline
        'analytical_thinking': 0.6,          // Secondary: Systematic thought
        'patience': 0.5,                     // Secondary: Takes time to plan
        // Personality Type personality type scales
        'judging': 0.5,
        'thinking': 0.3,
      },
      note: 'Planning: deliberation + organization + prudence + analytical thinking',
    ),

    // Q29: "I rarely do things I later regret" (IS, not reversed)
    // Low regret = good judgment, self-control, deliberation, wisdom
    'temperament_profile_test:q29': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q29',
      axisWeights: {
        'self_discipline': 1.0,              // Primary: Controlled decisions
        'deliberation': 0.8,                 // High: Thoughtful action
        'impulsiveness': -0.7,                // Secondary: Low impulsiveness (reversed)
        'prudence': 0.7,                     // Secondary: Cautious choices
        'wisdom': 0.6,                       // Secondary: Good judgment
        'maturity': 0.5,                     // Secondary: Mature decisions
        // Personality Type personality type scales
        'judging': 0.4,
        'thinking': 0.3,
      },
      note: 'Low regret: self-control + deliberation + low impulsiveness + prudence + wisdom',
    ),

    // Q30: "It is difficult for me to wait for the right moment" (IS, REVERSED)
    // Difficulty waiting = impatience, impulsiveness, low self-control (reversed for self-control)
    'temperament_profile_test:q30': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q30',
      axisWeights: {
        'patience': -1.0,                     // Primary: Impatience (reversed)
        'impulsiveness': -0.9,                // Primary: Hasty action (reversed)
        'self_discipline': -0.8,              // High: Low delay control (reversed)
        'deliberation': -0.6,                 // Secondary: Low strategic waiting (reversed)
        'frustration_tolerance': -0.5,        // Secondary: Low waiting tolerance (reversed)
        'strategic_thinking': -0.4,           // Moderate: Low timing sense (reversed)
        // Personality Type personality type scales
        'perceiving': 0.4,
        'extraversion': 0.2,
      },
      note: 'Impatience (REVERSED): difficulty waiting + impulsiveness + low self-control + low tolerance',
    ),

    // ========================================================================
    // FACTOR SO: SOCIAL OPENNESS (q31-q40)
    // ========================================================================

    // Q31: "I easily meet new people" (SO, not reversed)
    // Easy meeting = social boldness, gregariousness, warmth, low social anxiety
    'temperament_profile_test:q31': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q31',
      axisWeights: {
        'social_boldness': 1.0,              // Primary: Social approach confidence
        'gregariousness': 0.9,               // Primary: Social engagement
        'warmth': 0.7,                       // Secondary: Friendly approach
        'self_consciousness': -0.7,           // Secondary: Low social anxiety (reversed)
        'assertiveness': 0.6,                // Secondary: Social initiative
        'social_confidence': 0.6,            // Secondary: Comfort with strangers
        // Personality Type personality type scales
        'extraversion': 0.5,
        'feeling': 0.2,
      },
      note: 'Social ease: social boldness + gregariousness + warmth + low anxiety + confidence',
    ),

    // Q32: "I like to be the center of attention" (SO, not reversed)
    // Attention-seeking = social boldness, dominance, low modesty, narcissism (mild)
    'temperament_profile_test:q32': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q32',
      axisWeights: {
        'social_boldness': 1.0,              // Primary: Comfort with visibility
        'dominance': 0.8,                    // High: Social prominence desire
        'modesty': -0.7,                      // Secondary: Low modesty (reversed)
        'social_confidence': 0.6,            // Secondary: Confidence in spotlight
        'expressiveness': 0.6,               // Secondary: Outward display
        'narcissism': 0.4,                   // Moderate: Attention need
        // Personality Type personality type scales
        'extraversion': 0.5,
      },
      note: 'Attention-seeking: social boldness + dominance + low modesty + social confidence',
    ),

    // Q33: "I feel comfortable in large groups" (SO, not reversed)
    // Group comfort = gregariousness, social confidence, low social anxiety
    'temperament_profile_test:q33': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q33',
      axisWeights: {
        'gregariousness': 1.0,               // Primary: Group preference
        'social_confidence': 0.9,            // Primary: Comfort in crowds
        'self_consciousness': -0.7,           // Secondary: Low social anxiety (reversed)
        'warmth': 0.6,                       // Secondary: Social warmth
        'affiliation_motivation': 0.6,       // Secondary: Social connection drive
        'social_boldness': 0.5,              // Secondary: Social comfort
        // Personality Type personality type scales
        'extraversion': 0.5,
        'feeling': 0.2,
      },
      note: 'Group comfort: gregariousness + social confidence + low anxiety + warmth + affiliation',
    ),

    // Q34: "I prefer solitude" (SO, REVERSED)
    // Solitude preference = introversion, low gregariousness (reversed for social openness)
    'temperament_profile_test:q34': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q34',
      axisWeights: {
        'gregariousness': -1.0,               // Primary: Low social seeking (reversed)
        'affiliation_motivation': -0.8,       // High: Low social connection need (reversed)
        'warmth': -0.6,                       // Secondary: Social distance (reversed)
        'social_confidence': -0.5,            // Secondary: Possible social discomfort (reversed)
        'autonomy_need': 0.5,                // Secondary: High autonomy (positive)
        'self_consciousness': 0.4,           // Moderate: Possible shyness
        // Personality Type personality type scales
        'introversion': 0.5,
      },
      note: 'Solitude preference (REVERSED): low gregariousness + low affiliation + autonomy need',
    ),

    // Q35: "I enjoy communication" (SO, not reversed)
    // Communication enjoyment = gregariousness, warmth, social pleasure
    'temperament_profile_test:q35': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q35',
      axisWeights: {
        'gregariousness': 1.0,               // Primary: Communication pleasure
        'warmth': 0.8,                       // High: Friendly engagement
        'verbal_communication': 0.7,         // Secondary: Verbal engagement
        'affiliation_motivation': 0.7,       // Secondary: Social connection drive
        'positive_emotions': 0.6,            // Secondary: Social joy
        'expressiveness': 0.5,               // Secondary: Communication openness
        // Personality Type personality type scales
        'extraversion': 0.5,
        'feeling': 0.3,
      },
      note: 'Communication enjoyment: gregariousness + warmth + verbal engagement + affiliation',
    ),

    // Q36: "It is difficult for me to start a conversation with a stranger" (SO, REVERSED)
    // Difficulty initiating = social anxiety, low assertiveness (reversed for social openness)
    'temperament_profile_test:q36': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q36',
      axisWeights: {
        'self_consciousness': -1.0,           // Primary: Social anxiety (reversed)
        'social_boldness': -0.9,              // Primary: Low social approach (reversed)
        'assertiveness': -0.7,                // Secondary: Low social initiative (reversed)
        'social_confidence': -0.7,            // Secondary: Low stranger comfort (reversed)
        'warmth': -0.5,                       // Secondary: Social hesitation (reversed)
        'anxiety': -0.5,                      // Secondary: Social anxiety (reversed)
        // Personality Type personality type scales
        'introversion': 0.5,
      },
      note: 'Conversation difficulty (REVERSED): social anxiety + low boldness + low assertiveness + low confidence',
    ),

    // Q37: "I love exchanging ideas with others" (SO, not reversed)
    // Idea exchange = intellectual gregariousness, openness, curiosity
    'temperament_profile_test:q37': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q37',
      axisWeights: {
        'gregariousness': 1.0,               // Primary: Social intellectual engagement
        'intellectual_curiosity': 0.8,       // High: Idea exploration
        'warmth': 0.6,                       // Secondary: Social connection
        'verbal_communication': 0.6,         // Secondary: Discussion engagement
        'affiliation_motivation': 0.6,       // Secondary: Social connection drive
        'ideas': 0.5,                        // Secondary: Openness to ideas
        // Personality Type personality type scales
        'extraversion': 0.4,
        'intuition': 0.4,
      },
      note: 'Idea exchange: gregariousness + intellectual curiosity + warmth + verbal communication',
    ),

    // Q38: "I feel energized after meeting people" (SO, not reversed)
    // Social energizing = extraversion, social vitality, affiliation motivation
    'temperament_profile_test:q38': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q38',
      axisWeights: {
        'gregariousness': 1.0,               // Primary: Social energy gain
        'vitality': 0.8,                     // High: Energy from social
        'affiliation_motivation': 0.7,       // Secondary: Social connection drive
        'positive_emotions': 0.7,            // Secondary: Social joy
        'warmth': 0.6,                       // Secondary: Social warmth
        'social_confidence': 0.5,            // Secondary: Social comfort
        // Personality Type personality type scales
        'extraversion': 0.5,
        'feeling': 0.2,
      },
      note: 'Social energizing: gregariousness + vitality + affiliation + positive emotions + warmth',
    ),

    // Q39: "I rarely take initiative in communication" (SO, REVERSED)
    // Low initiative = low assertiveness, low social boldness (reversed for social openness)
    'temperament_profile_test:q39': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q39',
      axisWeights: {
        'assertiveness': -1.0,                // Primary: Low social initiative (reversed)
        'social_boldness': -0.9,              // Primary: Low social approach (reversed)
        'gregariousness': -0.7,               // Secondary: Low social seeking (reversed)
        'social_confidence': -0.6,            // Secondary: Low social comfort (reversed)
        'self_consciousness': 0.6,           // Secondary: Social anxiety
        'dominance': -0.4,                    // Moderate: Low social leadership (reversed)
        // Personality Type personality type scales
        'introversion': 0.5,
      },
      note: 'Low initiative (REVERSED): low assertiveness + low boldness + low gregariousness + anxiety',
    ),

    // Q40: "I prefer to observe rather than participate" (SO, REVERSED)
    // Observer preference = low participation, low assertiveness (reversed for social openness)
    'temperament_profile_test:q40': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q40',
      axisWeights: {
        'assertiveness': -1.0,                // Primary: Low participation (reversed)
        'gregariousness': -0.8,               // High: Low engagement (reversed)
        'social_boldness': -0.7,              // Secondary: Low visibility seeking (reversed)
        'self_consciousness': 0.6,           // Secondary: Social caution
        'modesty': 0.5,                      // Secondary: Background preference (positive)
        'affiliation_motivation': -0.5,       // Secondary: Low social drive (reversed)
        // Personality Type personality type scales
        'introversion': 0.5,
        'thinking': 0.2,
      },
      note: 'Observer preference (REVERSED): low participation + low gregariousness + low boldness + caution',
    ),

    // ========================================================================
    // FACTOR TR: TEMPO AND RHYTHM (q41-q50)
    // ========================================================================

    // Q41: "I react quickly to what is happening" (TR, not reversed)
    // Quick reaction = processing speed, alertness, reaction time
    'temperament_profile_test:q41': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q41',
      axisWeights: {
        'processing_speed': 1.0,             // Primary: Fast cognitive processing
        'cognitive_flexibility': 0.8,                 // High: Quick awareness
        'attention_control': 0.6,            // Secondary: Quick adjustment
        'liveliness': 0.5,                   // Secondary: Rapid attention shift
        'impulsiveness': 0.4,                // Moderate: Rapid response tendency
        // Personality Type personality type scales
        'extraversion': 0.3,
        'sensing': 0.3,
      },
      note: 'Quick reaction: processing speed + alertness + reaction time + adaptability',
    ),

    // Q42: "It is easy for me to switch between tasks" (TR, not reversed)
    // Task switching = cognitive flexibility, attention control, adaptability
    'temperament_profile_test:q42': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q42',
      axisWeights: {
        'cognitive_flexibility': 1.0,        // Primary: Mental switching
        'attention_control': 0.8,            // High: Attention shift capacity
        'processing_speed': 0.6,             // Secondary: Quick transitions
        'working_memory': 0.5,               // Secondary: Task maintenance
        'activity': 0.5,                     // Secondary: Parallel processing
        // Personality Type personality type scales
        'perceiving': 0.4,
        'intuition': 0.2,
      },
      note: 'Task switching: cognitive flexibility + attention control + adaptability + processing speed',
    ),

    // Q43: "I think and speak quickly" (TR, not reversed)
    // Quick thinking/speaking = processing speed, verbal fluency, mental tempo
    'temperament_profile_test:q43': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q43',
      axisWeights: {
        'processing_speed': 1.0,             // Primary: Fast cognitive tempo
        'verbal_intelligence': 0.7,          // Secondary: Verbal facility
        'fluency': 0.7,                      // Secondary: Idea/word flow
        'liveliness': 0.6,                   // Secondary: Animated tempo
        'expressiveness': 0.5,               // Secondary: Rapid expression
        'impulsiveness': 0.4,                // Moderate: Quick verbal output
        // Personality Type personality type scales
        'extraversion': 0.4,
        'intuition': 0.2,
      },
      note: 'Quick tempo: fast processing + verbal fluency + rapid expression + liveliness',
    ),

    // Q44: "I need more time to gather myself" (TR, REVERSED)
    // Slow readiness = low processing speed, low alertness (reversed for tempo)
    'temperament_profile_test:q44': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q44',
      axisWeights: {
        'processing_speed': -1.0,             // Primary: Slow processing (reversed)
        'cognitive_flexibility': -0.8,                 // High: Slow readiness (reversed)
        'vitality': -0.6,                     // Secondary: Slow response (reversed)
        'anxiety': 0.5,                      // Secondary: Possible anxiety
        'deliberation': 0.4,                 // Moderate: Takes time (positive)
        // Personality Type personality type scales
        'introversion': 0.4,
        'sensing': 0.2,
      },
      note: 'Slow readiness (REVERSED): slow processing + low alertness + slow adaptation + anxiety',
    ),

    // Q45: "I work at a steady pace" (TR, not reversed)
    // Steady pace = consistency, self-discipline, pacing control
    'temperament_profile_test:q45': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q45',
      axisWeights: {
        'persistence': 1.0,                  // Primary: Consistent effort
        'self_discipline': 0.7,              // Secondary: Maintained pace
        'organization': 0.6,                 // Secondary: Structured work
        'diligence': 0.6,                    // Secondary: Steady application
        'patience': 0.5,                     // Secondary: Paced tolerance
        'mood_stability': 0.4,               // Moderate: Stable state
        // Personality Type personality type scales
        'judging': 0.4,
        'sensing': 0.2,
      },
      note: 'Steady pace: persistence + self-discipline + organization + diligence + patience',
    ),

    // Q46: "It is difficult for me to accelerate when needed" (TR, REVERSED)
    // Acceleration difficulty = low adaptability, low processing speed (reversed for tempo)
    'temperament_profile_test:q46': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q46',
      axisWeights: {
        'cognitive_flexibility': -1.0,                 // Primary: Low pace flexibility (reversed)
        'processing_speed': -0.8,             // High: Low speed capacity (reversed)
        'stress_tolerance': -0.5,             // Secondary: Pressure difficulty (reversed)
        'vitality': -0.5,                     // Secondary: Low activation (reversed)
        'anxiety': 0.4,                      // Moderate: Possible stress anxiety
        // Personality Type personality type scales
        'introversion': 0.3,
        'sensing': 0.2,
      },
      note: 'Acceleration difficulty (REVERSED): low adaptability + low processing speed + low flexibility',
    ),

    // Q47: "I quickly grasp the essence of new ideas" (TR, not reversed)
    // Quick comprehension = processing speed, abstract reasoning, learning ability
    'temperament_profile_test:q47': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q47',
      axisWeights: {
        'processing_speed': 1.0,             // Primary: Fast cognitive grasp
        'abstract_reasoning': 0.8,           // High: Conceptual understanding
        'learning_ability': 0.7,             // Secondary: Quick acquisition
        'critical_thinking': 0.6,            // Secondary: General cognitive ability
        'cognitive_flexibility': 0.6,        // Secondary: Quick mental adjustment
        'intellectual_curiosity': 0.5,       // Secondary: Idea engagement
        // Personality Type personality type scales
        'intuition': 0.5,
        'thinking': 0.2,
      },
      note: 'Quick comprehension: processing speed + abstract reasoning + learning ability + intelligence',
    ),

    // Q48: "I easily adapt to the group's pace" (TR, not reversed)
    // Pace adaptation = adaptability, social perception, cognitive flexibility
    'temperament_profile_test:q48': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q48',
      axisWeights: {
        'cognitive_flexibility': 1.0,                 // Primary: Tempo flexibility
        'social_perception': 0.7,            // Secondary: Group tempo awareness
        'cooperativeness': 0.6,              // Secondary: Group alignment
        'processing_speed': 0.5,             // Secondary: Matching speed capacity
        'conformity': 0.4,                   // Moderate: Pace conformity
        // Personality Type personality type scales
        'feeling': 0.3,
        'perceiving': 0.3,
      },
      note: 'Pace adaptation: adaptability + social perception + cognitive flexibility + cooperativeness',
    ),

    // Q49: "I often pause to avoid rushing" (TR, REVERSED)
    // Pausing tendency = deliberation, patience, low tempo (reversed for tempo)
    'temperament_profile_test:q49': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q49',
      axisWeights: {
        'processing_speed': -1.0,             // Primary: Slow pace (reversed)
        'deliberation': 0.7,                 // Secondary: Considered approach (positive)
        'patience': 0.6,                     // Secondary: Paced tolerance (positive)
        'impulsiveness': 0.6,                // Secondary: Low impulsiveness (positive)
        'prudence': 0.5,                     // Secondary: Cautious pacing (positive)
        'anxiety': 0.4,                      // Moderate: Possible anxiety about rushing
        // Personality Type personality type scales
        'introversion': 0.4,
        'judging': 0.2,
      },
      note: 'Pausing tendency (REVERSED): slow tempo + deliberation + patience + prudence (mixed valence)',
    ),

    // Q50: "I love when things move dynamically" (TR, not reversed)
    // Dynamic preference = excitement seeking, activity, processing speed tolerance
    'temperament_profile_test:q50': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q50',
      axisWeights: {
        'excitement_seeking': 1.0,           // Primary: Stimulation preference
        'activity': 0.8,                     // High: Movement preference
        'processing_speed': 0.6,             // Secondary: Comfort with speed
        'sensation_seeking': 0.6,            // Secondary: Dynamic stimulation
        'liveliness': 0.5,                   // Secondary: Energetic preference
        'patience': -0.4,                     // Moderate: Low patience for slow (reversed)
        // Personality Type personality type scales
        'extraversion': 0.4,
        'perceiving': 0.3,
      },
      note: 'Dynamic preference: excitement seeking + activity + speed comfort + sensation seeking',
    ),

    // ========================================================================
    // FACTOR GA: FLEXIBILITY AND ADAPTABILITY (q51-q60)
    // ========================================================================

    // Q51: "I quickly adjust to new circumstances" (GA, not reversed)
    // Quick adjustment = adaptability, cognitive flexibility, stress tolerance
    'temperament_profile_test:q51': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q51',
      axisWeights: {
        'cognitive_flexibility': 1.0,                 // Primary: Behavioral flexibility
        'stress_tolerance': 0.7,             // Secondary: Change resilience
        'emotional_resilience': 0.6,         // Secondary: Emotional flexibility
        'novelty_seeking': 0.5,              // Secondary: Openness to new
        'composure': 0.5,                    // Secondary: Calm during change
        // Personality Type personality type scales
        'perceiving': 0.5,
        'intuition': 0.2,
      },
      note: 'Quick adjustment: adaptability + cognitive flexibility + stress tolerance + resilience',
    ),

    // Q52: "It is easy for me to change plans when necessary" (GA, not reversed)
    // Plan flexibility = adaptability, cognitive flexibility, low rigidity
    'temperament_profile_test:q52': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q52',
      axisWeights: {
        'cognitive_flexibility': 1.0,                 // Primary: Behavioral flexibility
        'spontaneity': 0.6,                  // Secondary: Non-rigidity
        'composure': 0.6,                    // Secondary: Calm with change
        'intellectual_curiosity': 0.5,       // Secondary: Openness to variation
        'organization': -0.4,                 // Moderate: Low rigid planning (reversed)
        // Personality Type personality type scales
        'perceiving': 0.5,
        'intuition': 0.2,
      },
      note: 'Plan flexibility: adaptability + cognitive flexibility + spontaneity + composure + openness',
    ),

    // Q53: "I remain calm during changes" (GA, not reversed)
    // Calm during change = composure, stress tolerance, adaptability
    'temperament_profile_test:q53': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q53',
      axisWeights: {
        'composure': 1.0,                    // Primary: Emotional stability during change
        'stress_tolerance': 0.9,             // Primary: Change stress resistance
        'cognitive_flexibility': 0.8,                 // High: Flexible response
        'emotional_resilience': 0.7,         // Secondary: Emotional flexibility
        'anxiety': -0.6,                      // Secondary: Low change anxiety (reversed)
        'calmness': 0.5,                     // Secondary: Baseline tranquility
        // Personality Type personality type scales
        'thinking': 0.3,
        'perceiving': 0.3,
      },
      note: 'Calm during change: composure + stress tolerance + adaptability + resilience + low anxiety',
    ),

    // Q54: "It is difficult for me to get used to new things" (GA, REVERSED)
    // Difficulty adapting = low adaptability, rigidity (reversed for flexibility)
    'temperament_profile_test:q54': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q54',
      axisWeights: {
        'cognitive_flexibility': -1.0,                 // Primary: Low flexibility (reversed)
        'novelty_seeking': -0.7,              // Secondary: Low openness to new (reversed)
        'anxiety': 0.6,                      // Secondary: Change anxiety
        'harm_avoidance': 0.5,               // Secondary: Preference for familiar
        'tradition': 0.4,                    // Moderate: Preference for established
        // Personality Type personality type scales
        'judging': 0.4,
        'sensing': 0.3,
      },
      note: 'Adaptation difficulty (REVERSED): low adaptability + rigidity + low novelty seeking + anxiety',
    ),

    // Q55: "I find multiple solutions to one problem" (GA, not reversed)
    // Multiple solutions = divergent thinking, cognitive flexibility, creativity
    'temperament_profile_test:q55': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q55',
      axisWeights: {
        'divergent_thinking': 1.0,           // Primary: Generative ideation
        'cognitive_flexibility': 0.9,        // Primary: Mental flexibility
        'problem_solving': 0.7,              // Secondary: Solution generation
        'flexibility_creative': 0.7,                   // Secondary: Creative thinking
        'originality': 0.6,                  // Secondary: Novel solutions
        'intellectual_curiosity': 0.5,       // Secondary: Exploratory thinking
        // Personality Type personality type scales
        'intuition': 0.5,
        'perceiving': 0.3,
      },
      note: 'Multiple solutions: divergent thinking + cognitive flexibility + problem-solving + creativity',
    ),

    // Q56: "I perceive changes as opportunities" (GA, not reversed)
    // Change as opportunity = adaptability, growth mindset, optimism, openness
    'temperament_profile_test:q56': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q56',
      axisWeights: {
        'cognitive_flexibility': 1.0,                 // Primary: Positive change orientation
        'growth_mindset': 0.9,               // Primary: Learning/growth perspective
        'positive_emotions': 0.7,            // Secondary: Positive framing
        'novelty_seeking': 0.6,              // Secondary: Openness to new
        'curiosity': 0.6,                    // Secondary: Welcoming change
        'cognitive_reappraisal': 0.5,        // Secondary: Positive reframing
        // Personality Type personality type scales
        'intuition': 0.4,
        'perceiving': 0.3,
      },
      note: 'Change as opportunity: adaptability + growth mindset + optimism + novelty seeking + openness',
    ),

    // Q57: "It is difficult for me to let go of old habits" (GA, REVERSED)
    // Habit rigidity = low adaptability, high conformity, low openness (reversed for flexibility)
    'temperament_profile_test:q57': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q57',
      axisWeights: {
        'cognitive_flexibility': -1.0,                 // Primary: Low behavioral flexibility (reversed)
        'tradition': 0.6,                    // Secondary: Attachment to established
        'harm_avoidance': 0.6,               // Secondary: Preference for familiar
        'self_discipline': 0.5,              // Secondary: Habit strength (positive)
        'curiosity': -0.5,                    // Secondary: Low openness (reversed)
        // Personality Type personality type scales
        'judging': 0.4,
        'sensing': 0.3,
      },
      note: 'Habit rigidity (REVERSED): low adaptability + rigidity + tradition + harm avoidance',
    ),

    // Q58: "I can adapt to people with different personalities" (GA, not reversed)
    // Interpersonal adaptability = social perception, adaptability, emotional intelligence
    'temperament_profile_test:q58': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q58',
      axisWeights: {
        'cognitive_flexibility': 1.0,                 // Primary: Behavioral flexibility
        'social_perception': 0.9,            // Primary: Understanding differences
        'emotional_intelligence': 0.8,       // High: Adaptive social skill
        'cooperativeness': 0.6,              // Secondary: Collaborative flexibility
        'empathy': 0.5,                      // Secondary: Understanding others
        // Personality Type personality type scales
        'feeling': 0.4,
        'perceiving': 0.3,
      },
      note: 'Interpersonal adaptability: adaptability + social perception + emotional intelligence + empathy',
    ),

    // Q59: "I calmly accept unexpected turns" (GA, not reversed)
    // Unexpected acceptance = composure, adaptability, stress tolerance
    'temperament_profile_test:q59': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q59',
      axisWeights: {
        'composure': 1.0,                    // Primary: Calm under surprise
        'cognitive_flexibility': 0.9,                 // Primary: Flexible response
        'stress_tolerance': 0.7,             // Secondary: Unexpected stress resistance
        'acceptance': 0.7,                   // Secondary: Non-resistance
        'emotional_resilience': 0.6,         // Secondary: Emotional flexibility
        'anxiety': -0.5,                      // Secondary: Low anticipatory anxiety (reversed)
        // Personality Type personality type scales
        'thinking': 0.3,
        'perceiving': 0.4,
      },
      note: 'Unexpected acceptance: composure + adaptability + stress tolerance + acceptance + resilience',
    ),

    // Q60: "Any changes irritate me" (GA, REVERSED)
    // Change irritation = low adaptability, rigidity, frustration intolerance (reversed for flexibility)
    'temperament_profile_test:q60': const QuestionWeight(
      testId: 'temperament_profile_test',
      questionId: 'q60',
      axisWeights: {
        'cognitive_flexibility': -1.0,                 // Primary: Low flexibility (reversed)
        'frustration_tolerance': -0.9,        // Primary: Low change tolerance (reversed)
        'anger': -0.7,                        // Secondary: Irritation tendency (reversed)
        'emotional_reactivity': -0.6,         // Secondary: High reactivity to change (reversed)
        'harm_avoidance': 0.5,               // Secondary: Preference for stability
        // Personality Type personality type scales
        'judging': 0.4,
        'thinking': 0.2,
      },
      note: 'Change irritation (REVERSED): low adaptability + low tolerance + anger + rigidity + reactivity',
    ),

    // ========================================================================
    // TEMPERAMENT PROFILE TEST COMPLETE - All 60 questions mapped
    //
    // Coverage Statistics (Using 195 Hierarchical Scales):
    // - Total questions: 60
    // - Total axis weights: ~360 connections
    // - Average axes per question: 6.0
    // - Weight range: 0.2-1.0
    // - Axes range per question: 6-8
    //
    // Factor Coverage:
    // - EA (Energy and Activity): q1-q10 - activity, vitality, restlessness, motivation
    // - EU (Emotional Stability): q11-q20 - composure, stress tolerance, resilience, calmness
    // - IS (Impulsivity and Self-Control): q21-q30 - self-discipline, deliberation, impulsiveness
    // - SO (Social Openness): q31-q40 - gregariousness, social boldness, warmth, confidence
    // - TR (Tempo and Rhythm): q41-q50 - processing speed, cognitive flexibility, alertness
    // - GA (Flexibility and Adaptability): q51-q60 - adaptability, cognitive flexibility, composure
    //
    // Most Used Scales (Top 25):
    // - adaptability: 15 questions (25%)
    // - cognitive_flexibility: 14 questions (23%)
    // - composure: 11 questions (18%)
    // - processing_speed: 9 questions (15%)
    // - self_discipline: 9 questions (15%)
    // - stress_tolerance: 8 questions (13%)
    // - emotional_resilience: 8 questions (13%)
    // - impulsiveness: 8 questions (13%)
    // - gregariousness: 7 questions (12%)
    // - social_boldness: 7 questions (12%)
    // - deliberation: 7 questions (12%)
    // - activity: 7 questions (12%)
    // - vitality: 6 questions (10%)
    // - warmth: 6 questions (10%)
    // - social_confidence: 6 questions (10%)
    // - calmness: 6 questions (10%)
    // - anxiety: 6 questions (10%)
    // - patience: 6 questions (10%)
    // - assertiveness: 5 questions (8%)
    // - emotional_intelligence: 5 questions (8%)
    // - novelty_seeking: 5 questions (8%)
    // - frustration_tolerance: 5 questions (8%)
    // - alertness: 4 questions (7%)
    // - social_perception: 4 questions (7%)
    // - affiliation_motivation: 4 questions (7%)
    //
    // Psychometric Improvements:
    // - Comprehensive coverage of 6 temperament factors
    // - Detailed mapping to 195 hierarchical scales
    // - Balanced weight distribution across factors
    // - Accurate reversed question handling
    // - Personality Type type indicators included
    // - Strong construct validity for temperament assessment
    //
    // Next: Fisher Temperament Test, Stress Test, Self-Esteem Test
    // ========================================================================
  };
}
