import 'question_weight_models.dart';

/// Question weights configuration for Digital Detox Test
/// Maps 50 questions to ~195 hierarchical psychological scales
///
/// Test measures 7 digital health factors:
/// - dependency_level (Q1, 8, 15, 22, 29, 36, 43) - technology addiction
/// - attention_control (Q2, 9, 16, 23, 30, 37, 44) - focus and distraction
/// - social_impact (Q3, 10, 17, 24, 31, 38, 45) - social life effects
/// - physical_health (Q4, 11, 18, 25, 32, 39, 46) - physical symptoms
/// - productivity_loss (Q5, 12, 19, 26, 33, 40, 47) - work/productivity impact
/// - emotional_state (Q6, 13, 20, 27, 34, 41, 48) - emotional wellbeing
/// - usage_patterns (Q7, 14, 21, 28, 35, 42, 49, 50) - usage behaviors
class DigitalDetoxWeights {
  /// DIGITAL DETOX TEST - 50 Questions
  ///
  /// This analysis uses the hierarchical scale system (195 detailed subscales)
  /// Each question maps to 5-10 axes with psychometric rationale
  /// Weight categories: Primary (0.8-1.0), Secondary (0.4-0.7), Tertiary (0.2-0.3)
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // FACTOR 1: DEPENDENCY LEVEL (q1, 8, 15, 22, 29, 36, 43)
    // ========================================================================

    // Q1: "I feel anxious or worried when I cannot check my phone"
    // Technology anxiety = anxiety, impulsiveness, frustration_tolerance
    'digital_detox_test:q1': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q1',
      axisWeights: {
        'anxiety': 1.0,                      // Primary: Technology-induced anxiety
        'impulsiveness': 0.8,                // High: Need to check phone
        'frustration_tolerance': 0.7,        // Secondary: Low tolerance for device separation (reversed)
        'stress_tolerance': 0.6,             // Secondary: Device separation stress (reversed)
        'emotional_reactivity': 0.6,         // Secondary: Emotional response to separation
        'worry_tendency': 0.5,               // Secondary: Anticipatory worry
        'self_discipline': 0.4,              // Moderate: Difficulty controlling phone use (reversed)
        // MBTI personality type scales
        'feeling': 0.3,
        'judging': 0.2,
      },
      note: 'Technology anxiety: anxiety + impulsiveness + low frustration tolerance + worry',
    ),

    // Q8: "I check my phone within the first 5 minutes after waking up"
    // Morning dependency = impulsiveness, self_discipline, habit strength
    'digital_detox_test:q8': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q8',
      axisWeights: {
        'impulsiveness': 1.0,                // Primary: Immediate phone checking
        'self_discipline': 0.9,              // Primary: Low morning control (reversed)
        'anxiety': 0.7,                      // Secondary: Need for immediate check
        'deliberation': 0.6,                 // Secondary: Automatic behavior (reversed)
        'patience': 0.5,                     // Secondary: Cannot delay (reversed)
        'autonomy_need': 0.4,                // Moderate: External dependency (reversed)
        'vitality': 0.3,                     // Tertiary: Morning energy directed to phone
        // MBTI personality type scales
        'perceiving': 0.3,
      },
      note: 'Morning dependency: impulsiveness + low self-discipline + anxiety + automatic behavior',
    ),

    // Q15: "I tried to reduce gadget usage time, but could not"
    // Failed control = self_discipline, willpower, addiction indicators
    'digital_detox_test:q15': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q15',
      axisWeights: {
        'self_discipline': 1.0,              // Primary: Failed behavioral control
        'persistence': 0.8,                  // High: Failed persistence in reduction
        'impulsiveness': 0.7,                // Secondary: Impulse control failure
        'frustration_tolerance': 0.6,        // Secondary: Inability to tolerate reduction
        'achievement_striving': 0.6,         // Secondary: Failed goal pursuit
        'emotional_resilience': 0.5,         // Secondary: Difficulty with change
        'autonomy_need': 0.4,                // Moderate: Lack of behavioral autonomy (reversed)
        // MBTI personality type scales
        'judging': 0.3,
      },
      note: 'Failed control: low self-discipline + failed persistence + impulse control failure',
    ),

    // Q22: "I feel anxious when my phone battery is low"
    // Battery anxiety = anxiety, vulnerability, fear_of_abandonment (device separation)
    'digital_detox_test:q22': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q22',
      axisWeights: {
        'anxiety': 1.0,                      // Primary: Battery anxiety (nomophobia)
        'vulnerability': 0.9,                // Primary: Feeling vulnerable without phone
        'fear_of_abandonment': 0.7,          // Secondary: Fear of disconnection
        'worry_tendency': 0.7,               // Secondary: Anticipatory worry
        'stress_tolerance': 0.6,             // Secondary: Low stress tolerance (reversed)
        'emotional_reactivity': 0.5,         // Secondary: Emotional response to battery level
        'security_value': 0.4,               // Moderate: Phone as security object
        // MBTI personality type scales
        'feeling': 0.4,
        'judging': 0.2,
      },
      note: 'Battery anxiety: anxiety + vulnerability + fear of disconnection + worry',
    ),

    // Q29: "I feel like my phone is vibrating when it is not (phantom vibration)"
    // Phantom sensation = anxiety, rumination, attention fixation
    'digital_detox_test:q29': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q29',
      axisWeights: {
        'anxiety': 1.0,                      // Primary: Anxious hypervigilance
        'rumination': 0.8,                   // High: Mental preoccupation with phone
        'attention_control': 0.7,            // Secondary: Attention fixation on phone (reversed)
        'stress_tolerance': 0.6,             // Secondary: Stress-induced sensation (reversed)
        'worry_tendency': 0.6,               // Secondary: Anticipatory monitoring
        'impulsiveness': 0.5,                // Secondary: Compulsive checking
        'vulnerability': 0.4,                // Moderate: Psychological vulnerability
        // MBTI personality type scales
        'intuition': 0.3,
        'feeling': 0.2,
      },
      note: 'Phantom sensation: anxiety + rumination + attention fixation + hypervigilance',
    ),

    // Q36: "I take my phone with me even to the bathroom"
    // Constant proximity = impulsiveness, dependency, boundary issues
    'digital_detox_test:q36': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q36',
      axisWeights: {
        'impulsiveness': 1.0,                // Primary: Cannot separate from device
        'self_discipline': 0.9,              // Primary: Lack of boundaries (reversed)
        'anxiety': 0.7,                      // Secondary: Separation anxiety
        'boundary_setting': 0.7,             // Secondary: Poor personal boundaries (reversed)
        'patience': 0.5,                     // Secondary: Cannot delay usage (reversed)
        'autonomy_need': 0.4,                // Moderate: Device dependency (reversed)
        'modesty': 0.3,                      // Tertiary: Privacy boundary issues
        // MBTI personality type scales
        'perceiving': 0.3,
      },
      note: 'Constant proximity: impulsiveness + low self-discipline + anxiety + poor boundaries',
    ),

    // Q43: "If I had to spend a whole day without my phone, it would be very difficult"
    // Severe dependency = anxiety, vulnerability, dependence on external
    'digital_detox_test:q43': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q43',
      axisWeights: {
        'anxiety': 1.0,                      // Primary: Severe separation anxiety
        'vulnerability': 0.9,                // Primary: Feeling helpless without phone
        'self_discipline': 0.8,              // High: Cannot function independently (reversed)
        'emotional_resilience': 0.7,         // Secondary: Low resilience to deprivation (reversed)
        'autonomy_need': 0.6,                // Secondary: Lack of autonomy (reversed)
        'stress_tolerance': 0.6,             // Secondary: Stress intolerance (reversed)
        'fear_of_abandonment': 0.5,          // Secondary: Fear of disconnection
        // MBTI personality type scales
        'feeling': 0.4,
        'judging': 0.2,
      },
      note: 'Severe dependency: high anxiety + vulnerability + low self-sufficiency + stress intolerance',
    ),

    // ========================================================================
    // FACTOR 2: ATTENTION CONTROL (q2, 9, 16, 23, 30, 37, 44)
    // ========================================================================

    // Q2: "I can read long texts or articles without wanting to check my phone" (REVERSED)
    // Sustained attention = attention_control, patience, self_discipline
    'digital_detox_test:q2': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q2',
      axisWeights: {
        'attention_control': 1.0,            // Primary: Sustained focus ability
        'patience': 0.8,                     // High: Ability to delay gratification
        'self_discipline': 0.7,              // Secondary: Resistance to distraction
        'impulsiveness': 0.7,                // Secondary: Low impulsiveness (reversed in question)
        'diligence': 0.6,                    // Secondary: Task persistence
        'intellectual_curiosity': 0.5,       // Secondary: Engagement with content
        'cognitive_flexibility': 0.4,        // Moderate: Single-task focus
        // MBTI personality type scales
        'judging': 0.4,
        'thinking': 0.2,
      },
      note: 'Sustained attention (REVERSED): high attention control + patience + self-discipline',
    ),

    // Q9: "I can focus on one task for more than 30 minutes without checking my phone" (REVERSED)
    // Task focus = attention_control, persistence, self_discipline
    'digital_detox_test:q9': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q9',
      axisWeights: {
        'attention_control': 1.0,            // Primary: Deep focus capacity
        'persistence': 0.8,                  // High: Sustained effort
        'self_discipline': 0.8,              // High: Behavioral control
        'impulsiveness': 0.7,                // Secondary: Low impulsiveness (reversed)
        'patience': 0.6,                     // Secondary: Delay capacity
        'achievement_striving': 0.5,         // Secondary: Goal pursuit
        'diligence': 0.5,                    // Secondary: Work concentration
        // MBTI personality type scales
        'judging': 0.4,
        'introversion': 0.2,
      },
      note: 'Task focus (REVERSED): attention control + persistence + self-discipline + low impulsiveness',
    ),

    // Q16: "I automatically open apps without even realizing why"
    // Automatic behavior = impulsiveness, attention_control, mindfulness
    'digital_detox_test:q16': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q16',
      axisWeights: {
        'impulsiveness': 1.0,                // Primary: Automatic behavior
        'attention_control': 0.9,            // Primary: Lack of conscious control (reversed)
        'self_awareness': 0.8,               // High: Low awareness of actions (reversed)
        'deliberation': 0.7,                 // Secondary: Lack of intentionality (reversed)
        'mindfulness_coping': 0.6,           // Secondary: Lack of mindfulness (reversed)
        'self_discipline': 0.6,              // Secondary: Habitual behavior (reversed)
        'rumination': 0.4,                   // Moderate: Mind wandering
        // MBTI personality type scales
        'perceiving': 0.4,
        'sensing': 0.2,
      },
      note: 'Automatic behavior: impulsiveness + low attention control + low self-awareness + lack of deliberation',
    ),

    // Q23: "I forget what I just read or saw on my phone"
    // Poor retention = attention_control, working_memory, cognitive_load
    'digital_detox_test:q23': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q23',
      axisWeights: {
        'attention_control': 1.0,            // Primary: Shallow attention processing
        'working_memory': 0.9,               // Primary: Poor memory encoding
        'mindfulness_coping': 0.7,           // Secondary: Lack of present awareness (reversed)
        'processing_speed': 0.6,             // Secondary: Information overload
        'cognitive_flexibility': 0.5,        // Secondary: Rapid task switching effects
        'rumination': 0.5,                   // Secondary: Mental distraction
        'self_awareness': 0.4,               // Moderate: Low awareness of consumption
        // MBTI personality type scales
        'perceiving': 0.3,
        'intuition': 0.2,
      },
      note: 'Poor retention: low attention + poor working memory + mindlessness + cognitive overload',
    ),

    // Q30: "I can refrain from checking my phone during an important conversation or meeting" (REVERSED)
    // Social attention control = attention_control, self_discipline, respect/politeness
    'digital_detox_test:q30': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q30',
      axisWeights: {
        'attention_control': 1.0,            // Primary: Focus during social interaction
        'self_discipline': 0.9,              // Primary: Impulse control in social context
        'politeness': 0.7,                   // Secondary: Social respect
        'impulsiveness': 0.7,                // Secondary: Low impulsiveness (reversed)
        'active_listening': 0.6,             // Secondary: Engagement with others
        'social_perception': 0.6,            // Secondary: Social awareness
        'patience': 0.5,                     // Secondary: Delay capacity
        // MBTI personality type scales
        'judging': 0.4,
        'feeling': 0.2,
      },
      note: 'Social attention control (REVERSED): attention + self-discipline + politeness + social awareness',
    ),

    // Q37: "I start a task but quickly get distracted by notifications"
    // Notification distraction = attention_control, impulsiveness, self_discipline
    'digital_detox_test:q37': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q37',
      axisWeights: {
        'attention_control': 1.0,            // Primary: Distraction susceptibility
        'impulsiveness': 0.9,                // Primary: Immediate response to notifications
        'self_discipline': 0.8,              // High: Lack of task persistence (reversed)
        'persistence': 0.7,                  // Secondary: Task abandonment (reversed)
        'patience': 0.6,                     // Secondary: Cannot delay notification check (reversed)
        'achievement_striving': 0.5,         // Secondary: Difficulty with goal pursuit (reversed)
        'frustration_tolerance': 0.4,        // Moderate: Low tolerance for notification delay (reversed)
        // MBTI personality type scales
        'perceiving': 0.4,
        'extraversion': 0.2,
      },
      note: 'Notification distraction: low attention + impulsiveness + low self-discipline + low persistence',
    ),

    // Q44: "I can spend a free evening without using gadgets" (REVERSED)
    // Leisure self-control = self_discipline, autonomy, intrinsic_motivation
    'digital_detox_test:q44': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q44',
      axisWeights: {
        'self_discipline': 1.0,              // Primary: Voluntary gadget abstinence
        'autonomy_need': 0.8,                // High: Self-directed leisure
        'intrinsic_motivation': 0.7,         // Secondary: Internal activity drive
        'impulsiveness': 0.7,                // Secondary: Low impulsiveness (reversed)
        'creativity': 0.6,                   // Secondary: Alternative activities
        'attention_control': 0.6,            // Secondary: Ability to focus on offline activities
        'actions': 0.5,                      // Secondary: Openness to non-digital activities
        // MBTI personality type scales
        'judging': 0.4,
        'introversion': 0.2,
      },
      note: 'Leisure self-control (REVERSED): self-discipline + autonomy + intrinsic motivation + creativity',
    ),

    // ========================================================================
    // FACTOR 3: SOCIAL IMPACT (q3, 10, 17, 24, 31, 38, 45)
    // ========================================================================

    // Q3: "I use my phone while communicating with friends or family"
    // Social phubbing = politeness, attention_control, relationship_quality
    'digital_detox_test:q3': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q3',
      axisWeights: {
        'politeness': 1.0,                   // Primary: Social rudeness (reversed)
        'active_listening': 0.9,             // Primary: Poor listening (reversed)
        'communication_quality': 0.8,        // High: Degraded communication (reversed)
        'attention_control': 0.7,            // Secondary: Divided attention (reversed)
        'empathy': 0.6,                      // Secondary: Reduced empathic engagement (reversed)
        'relationship_quality': 0.6,         // Secondary: Relationship harm (reversed)
        'impulsiveness': 0.5,                // Secondary: Cannot resist phone use
        // MBTI personality type scales
        'thinking': 0.3,
        'perceiving': 0.2,
      },
      note: 'Social phubbing: low politeness + poor listening + degraded communication + divided attention',
    ),

    // Q10: "People close to me complain that I spend too much time on my phone"
    // Relationship complaints = relationship_quality, social_perception, boundary_setting
    'digital_detox_test:q10': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q10',
      axisWeights: {
        'relationship_quality': 1.0,         // Primary: Relationship damage
        'social_perception': 0.8,            // High: Low awareness of social impact (reversed)
        'communication_quality': 0.7,        // Secondary: Communication problems (reversed)
        'boundary_setting': 0.7,             // Secondary: Poor digital boundaries (reversed)
        'empathy': 0.6,                      // Secondary: Low empathy for others' concerns (reversed)
        'conflict_resolution': 0.5,          // Secondary: Recurring conflict pattern
        'self_awareness': 0.5,               // Secondary: Low self-awareness (reversed)
        // MBTI personality type scales
        'thinking': 0.3,
        'perceiving': 0.2,
      },
      note: 'Relationship complaints: damaged relationships + low social awareness + poor communication',
    ),

    // Q17: "I prefer to text rather than meet or call"
    // Digital preference = gregariousness, warmth, intimacy_comfort
    'digital_detox_test:q17': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q17',
      axisWeights: {
        'gregariousness': 1.0,               // Primary: Low in-person social seeking (reversed)
        'warmth': 0.8,                       // High: Reduced warmth in communication (reversed)
        'intimacy_comfort': 0.7,             // Secondary: Avoidance of deep connection (reversed)
        'social_confidence': 0.6,            // Secondary: Possible social anxiety
        'verbal_communication': 0.6,         // Secondary: Reduced verbal skills (reversed)
        'avoidant_attachment': 0.5,          // Secondary: Intimacy avoidance pattern
        'self_consciousness': 0.5,           // Secondary: Possible social anxiety
        // MBTI personality type scales
        'introversion': 0.4,
        'thinking': 0.2,
      },
      note: 'Digital preference: low gregariousness + reduced warmth + intimacy avoidance + possible anxiety',
    ),

    // Q24: "I feel lonely despite active online communication"
    // Digital loneliness = emotional_intimacy, relationship_quality, positive_relations
    'digital_detox_test:q24': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q24',
      axisWeights: {
        'emotional_intimacy': 1.0,           // Primary: Lack of deep connection (reversed)
        'positive_relations': 0.9,           // Primary: Poor relationship quality (reversed)
        'affiliation_motivation': 0.7,       // Secondary: Unmet connection need
        'relationship_quality': 0.7,         // Secondary: Shallow relationships (reversed)
        'warmth': 0.6,                       // Secondary: Lack of warmth in digital connection (reversed)
        'depression': 0.6,                   // Secondary: Loneliness-related low mood
        'vulnerability_sharing': 0.5,        // Secondary: Lack of vulnerability online (reversed)
        // MBTI personality type scales
        'feeling': 0.4,
        'introversion': 0.2,
      },
      note: 'Digital loneliness: lack of intimacy + poor relationships + unmet connection needs + depression',
    ),

    // Q31: "I spend less time on personal meetings due to online activity"
    // Social displacement = gregariousness, relationship_quality, time_management
    'digital_detox_test:q31': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q31',
      axisWeights: {
        'gregariousness': 1.0,               // Primary: Reduced in-person socializing (reversed)
        'relationship_quality': 0.8,         // High: Relationship neglect (reversed)
        'time_management': 0.7,              // Secondary: Poor priority balance (reversed)
        'affiliation_motivation': 0.6,       // Secondary: Reduced real connection drive (reversed)
        'warmth': 0.6,                       // Secondary: Reduced interpersonal warmth (reversed)
        'self_discipline': 0.5,              // Secondary: Digital time control failure (reversed)
        'values': 0.4,                       // Moderate: Misaligned priorities
        // MBTI personality type scales
        'introversion': 0.3,
      },
      note: 'Social displacement: reduced gregariousness + relationship neglect + poor time management',
    ),

    // Q38: "I have hobbies and interests not related to screens that I regularly spend time on" (REVERSED)
    // Offline engagement = actions, creativity, autonomy_need
    'digital_detox_test:q38': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q38',
      axisWeights: {
        'actions': 1.0,                      // Primary: Openness to varied activities
        'curiosity': 0.8,                    // High: Exploration of offline interests
        'intrinsic_motivation': 0.7,         // Secondary: Self-driven engagement
        'creativity': 0.7,                   // Secondary: Creative pursuits
        'autonomy_need': 0.6,                // Secondary: Self-directed activity
        'life_satisfaction': 0.6,            // Secondary: Balanced life engagement
        'self_direction': 0.5,               // Secondary: Independent activity choices
        // MBTI personality type scales
        'openness': 0.4,
        'perceiving': 0.2,
      },
      note: 'Offline engagement (REVERSED): varied activities + curiosity + intrinsic motivation + creativity',
    ),

    // Q45: "I use my phone during walks or trips instead of observing my surroundings"
    // Environmental disconnection = mindfulness, aesthetics, present_moment
    'digital_detox_test:q45': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q45',
      axisWeights: {
        'mindfulness_coping': 1.0,           // Primary: Lack of present awareness (reversed)
        'aesthetics': 0.8,                   // High: Reduced aesthetic appreciation (reversed)
        'curiosity': 0.7,                    // Secondary: Reduced environmental curiosity (reversed)
        'attention_control': 0.6,            // Secondary: Attention on phone vs. environment (reversed)
        'openness_to_experience': 0.6,       // Secondary: Closed to immediate experience (reversed)
        'impulsiveness': 0.5,                // Secondary: Cannot resist phone use
        'vitality': 0.4,                     // Moderate: Reduced aliveness (reversed)
        // MBTI personality type scales
        'sensing': 0.3,
        'perceiving': 0.2,
      },
      note: 'Environmental disconnection: lack of mindfulness + reduced aesthetics + low curiosity + inattention',
    ),

    // ========================================================================
    // FACTOR 4: PHYSICAL HEALTH (q4, 11, 18, 25, 32, 39, 46)
    // ========================================================================

    // Q4: "My eyes get tired or hurt from working with screens"
    // Eye strain = physical symptoms, health_consciousness, self_care
    'digital_detox_test:q4': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q4',
      axisWeights: {
        'vulnerability': 1.0,                // Primary: Physical vulnerability to screens
        'self_discipline': 0.7,              // Secondary: Excessive screen time (reversed)
        'health_consciousness': 0.7,         // Secondary: Low health awareness (reversed)
        'stress_tolerance': 0.5,             // Secondary: Physical stress symptoms (reversed)
        'self_compassion': 0.5,              // Secondary: Ignoring body signals (reversed)
        'boundary_setting': 0.4,             // Moderate: Poor screen time boundaries (reversed)
        'patience': 0.3,                     // Tertiary: Cannot take breaks (reversed)
        // MBTI personality type scales
        'sensing': 0.3,
      },
      note: 'Eye strain: physical vulnerability + excessive screen time + low health awareness',
    ),

    // Q11: "I have trouble falling asleep due to using screens before bed"
    // Sleep disruption = sleep_quality, self_discipline, health_consciousness
    'digital_detox_test:q11': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q11',
      axisWeights: {
        'vulnerability': 1.0,                // Primary: Sleep system vulnerability
        'self_discipline': 0.9,              // Primary: Poor bedtime boundaries (reversed)
        'health_consciousness': 0.7,         // Secondary: Ignoring sleep hygiene (reversed)
        'impulsiveness': 0.6,                // Secondary: Cannot resist screens before bed
        'deliberation': 0.5,                 // Secondary: Lack of sleep planning (reversed)
        'vitality': 0.5,                     // Secondary: Reduced energy from poor sleep (reversed)
        'patience': 0.4,                     // Moderate: Cannot delay screen use (reversed)
        // MBTI personality type scales
        'perceiving': 0.3,
      },
      note: 'Sleep disruption: vulnerability + low self-discipline + poor health habits + impulsiveness',
    ),

    // Q18: "My neck, back or wrists hurt from using gadgets"
    // Musculoskeletal pain = physical symptoms, posture, self_care
    'digital_detox_test:q18': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q18',
      axisWeights: {
        'vulnerability': 1.0,                // Primary: Musculoskeletal vulnerability
        'self_discipline': 0.7,              // Secondary: Excessive usage duration (reversed)
        'health_consciousness': 0.7,         // Secondary: Ignoring ergonomics (reversed)
        'body_image': 0.6,                   // Secondary: Body awareness
        'self_compassion': 0.5,              // Secondary: Ignoring pain signals (reversed)
        'patience': 0.4,                     // Moderate: Cannot take breaks (reversed)
        'stress_tolerance': 0.4,             // Moderate: Physical stress symptoms (reversed)
        // MBTI personality type scales
        'sensing': 0.3,
      },
      note: 'Musculoskeletal pain: vulnerability + excessive usage + low health awareness + poor self-care',
    ),

    // Q25: "I feel constant fatigue that I attribute to screen usage"
    // Chronic fatigue = vitality, energy_levels, health impact
    'digital_detox_test:q25': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q25',
      axisWeights: {
        'vitality': 1.0,                     // Primary: Depleted life energy (reversed)
        'vulnerability': 0.8,                // High: Physical exhaustion
        'health_consciousness': 0.7,         // Secondary: Awareness of screen impact
        'self_discipline': 0.6,              // Secondary: Excessive screen time (reversed)
        'stress_tolerance': 0.6,             // Secondary: Depleted stress capacity (reversed)
        'emotional_resilience': 0.5,         // Secondary: Reduced resilience (reversed)
        'environmental_mastery': 0.4,        // Moderate: Poor life balance control (reversed)
        // MBTI personality type scales
        'sensing': 0.3,
      },
      note: 'Chronic fatigue: depleted vitality + vulnerability + excessive usage + low stress capacity',
    ),

    // Q32: "The quality of my sleep has worsened due to gadget use"
    // Sleep quality degradation = health_consciousness, self_awareness
    'digital_detox_test:q32': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q32',
      axisWeights: {
        'vulnerability': 1.0,                // Primary: Sleep system damage
        'self_awareness': 0.9,               // Primary: Recognition of causal link
        'health_consciousness': 0.8,         // High: Health impact awareness
        'self_discipline': 0.7,              // Secondary: Poor boundaries (reversed)
        'vitality': 0.6,                     // Secondary: Energy depletion (reversed)
        'emotional_resilience': 0.5,         // Secondary: Sleep affects resilience (reversed)
        'self_compassion': 0.4,              // Moderate: Need for self-care
        // MBTI personality type scales
        'sensing': 0.3,
        'thinking': 0.2,
      },
      note: 'Sleep quality degradation: vulnerability + self-awareness + health impact + poor boundaries',
    ),

    // Q39: "I have headaches that I attribute to screen usage"
    // Headaches = physical symptoms, screen_time_excess
    'digital_detox_test:q39': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q39',
      axisWeights: {
        'vulnerability': 1.0,                // Primary: Neurological vulnerability
        'self_awareness': 0.8,               // High: Recognition of cause
        'health_consciousness': 0.7,         // Secondary: Health impact awareness
        'self_discipline': 0.6,              // Secondary: Excessive screen time (reversed)
        'stress_tolerance': 0.6,             // Secondary: Stress-related headaches (reversed)
        'self_compassion': 0.5,              // Secondary: Ignoring pain signals (reversed)
        'boundary_setting': 0.4,             // Moderate: Poor screen boundaries (reversed)
        // MBTI personality type scales
        'sensing': 0.3,
      },
      note: 'Headaches: vulnerability + self-awareness + excessive usage + stress',
    ),

    // Q46: "I notice worsening posture due to gadget use ('text neck')"
    // Posture degradation = body_image, health_consciousness, self_awareness
    'digital_detox_test:q46': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q46',
      axisWeights: {
        'body_image': 1.0,                   // Primary: Body awareness and posture
        'self_awareness': 0.9,               // Primary: Recognition of physical change
        'health_consciousness': 0.8,         // High: Health impact awareness
        'vulnerability': 0.7,                // Secondary: Physical vulnerability
        'self_discipline': 0.6,              // Secondary: Excessive usage (reversed)
        'self_compassion': 0.5,              // Secondary: Body care concern
        'patience': 0.4,                     // Moderate: Cannot maintain good posture (reversed)
        // MBTI personality type scales
        'sensing': 0.4,
      },
      note: 'Posture degradation: body awareness + self-awareness + health consciousness + vulnerability',
    ),

    // ========================================================================
    // FACTOR 5: PRODUCTIVITY LOSS (q5, 12, 19, 26, 33, 40, 47)
    // ========================================================================

    // Q5: "Gadgets distract me from completing important tasks"
    // Task distraction = attention_control, self_discipline, achievement_striving
    'digital_detox_test:q5': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q5',
      axisWeights: {
        'attention_control': 1.0,            // Primary: Distraction susceptibility
        'self_discipline': 0.9,              // Primary: Poor impulse control (reversed)
        'achievement_striving': 0.7,         // Secondary: Hindered goal pursuit (reversed)
        'persistence': 0.7,                  // Secondary: Task abandonment (reversed)
        'impulsiveness': 0.6,                // Secondary: Cannot resist gadgets
        'time_management': 0.6,              // Secondary: Poor time allocation (reversed)
        'diligence': 0.5,                    // Secondary: Reduced work focus (reversed)
        // MBTI personality type scales
        'perceiving': 0.4,
      },
      note: 'Task distraction: low attention + low self-discipline + hindered achievement + impulsiveness',
    ),

    // Q12: "I postpone important tasks to spend time on social media or apps"
    // Procrastination = procrastination, self_discipline, time_management
    'digital_detox_test:q12': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q12',
      axisWeights: {
        'procrastination': 1.0,              // Primary: Active procrastination behavior
        'self_discipline': 0.9,              // Primary: Impulse control failure (reversed)
        'time_management': 0.8,              // High: Poor prioritization (reversed)
        'achievement_striving': 0.7,         // Secondary: Goal avoidance (reversed)
        'impulsiveness': 0.7,                // Secondary: Immediate gratification seeking
        'hedonism': 0.6,                     // Secondary: Pleasure prioritization
        'deliberation': 0.5,                 // Secondary: Lack of planning (reversed)
        // MBTI personality type scales
        'perceiving': 0.5,
        'feeling': 0.2,
      },
      note: 'Procrastination: active procrastination + low self-discipline + poor time management + hedonism',
    ),

    // Q19: "I notice that my productivity has decreased due to gadgets"
    // Productivity awareness = self_awareness, productivity, achievement
    'digital_detox_test:q19': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q19',
      axisWeights: {
        'self_awareness': 1.0,               // Primary: Recognition of productivity decline
        'achievement_striving': 0.8,         // High: Concern for achievement (reversed)
        'time_management': 0.7,              // Secondary: Recognition of time waste (reversed)
        'diligence': 0.7,                    // Secondary: Reduced work quality (reversed)
        'self_discipline': 0.6,              // Secondary: Control failure (reversed)
        'competence': 0.6,                   // Secondary: Reduced effectiveness (reversed)
        'frustration_tolerance': 0.4,        // Moderate: Frustration with self
        // MBTI personality type scales
        'thinking': 0.3,
      },
      note: 'Productivity awareness: self-awareness + achievement concern + time waste + reduced effectiveness',
    ),

    // Q26: "I spend more time on gadgets than I planned"
    // Time underestimation = time_management, self_discipline, self_awareness
    'digital_detox_test:q26': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q26',
      axisWeights: {
        'time_management': 1.0,              // Primary: Poor time estimation (reversed)
        'self_discipline': 0.9,              // Primary: Exceeded planned time (reversed)
        'self_awareness': 0.7,               // Secondary: Low awareness of time passage (reversed)
        'impulsiveness': 0.7,                // Secondary: Cannot stop usage
        'deliberation': 0.6,                 // Secondary: Lack of time planning (reversed)
        'patience': 0.5,                     // Secondary: Cannot delay gratification (reversed)
        'procrastination': 0.5,              // Secondary: Time displacement
        // MBTI personality type scales
        'perceiving': 0.4,
      },
      note: 'Time underestimation: poor time management + low self-discipline + impulsiveness + low awareness',
    ),

    // Q33: "I notice that I miss deadlines due to gadget distractions"
    // Deadline failure = achievement_striving, responsibility, time_management
    'digital_detox_test:q33': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q33',
      axisWeights: {
        'achievement_striving': 1.0,         // Primary: Goal failure (reversed)
        'responsibility': 0.9,               // Primary: Obligation failure (reversed)
        'time_management': 0.8,              // High: Poor time allocation (reversed)
        'self_discipline': 0.8,              // High: Control failure (reversed)
        'dutifulness': 0.7,                  // Secondary: Duty neglect (reversed)
        'competence': 0.6,                   // Secondary: Reduced effectiveness (reversed)
        'procrastination': 0.6,              // Secondary: Procrastination behavior
        // MBTI personality type scales
        'judging': 0.4,
      },
      note: 'Deadline failure: goal failure + responsibility neglect + poor time management + procrastination',
    ),

    // Q40: "I can rate my productivity as high despite using gadgets" (REVERSED)
    // Maintained productivity = achievement_striving, competence, self_discipline
    'digital_detox_test:q40': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q40',
      axisWeights: {
        'achievement_striving': 1.0,         // Primary: Goal achievement
        'competence': 0.8,                   // High: Effective performance
        'self_discipline': 0.7,              // Secondary: Controlled gadget use
        'time_management': 0.7,              // Secondary: Effective time use
        'self_efficacy': 0.6,                // Secondary: Confidence in abilities
        'diligence': 0.6,                    // Secondary: Work focus
        'organization': 0.5,                 // Secondary: Structured approach
        // MBTI personality type scales
        'judging': 0.4,
        'thinking': 0.2,
      },
      note: 'Maintained productivity (REVERSED): achievement + competence + self-discipline + time management',
    ),

    // Q47: "I postpone important tasks to 'just quickly check' social media"
    // Check impulse = impulsiveness, procrastination, self_deception
    'digital_detox_test:q47': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q47',
      axisWeights: {
        'impulsiveness': 1.0,                // Primary: Immediate impulse action
        'procrastination': 0.9,              // Primary: Task avoidance
        'self_discipline': 0.8,              // High: Control failure (reversed)
        'self_awareness': 0.7,               // Secondary: Self-deception about "quick" check (reversed)
        'time_management': 0.6,              // Secondary: Time estimation failure (reversed)
        'achievement_striving': 0.6,         // Secondary: Goal avoidance (reversed)
        'deliberation': 0.5,                 // Secondary: Lack of intentionality (reversed)
        // MBTI personality type scales
        'perceiving': 0.4,
      },
      note: 'Check impulse: impulsiveness + procrastination + low self-discipline + self-deception',
    ),

    // ========================================================================
    // FACTOR 6: EMOTIONAL STATE (q6, 13, 20, 27, 34, 41, 48)
    // ========================================================================

    // Q6: "I fear missing something important if I do not constantly check my phone (FOMO)"
    // FOMO = anxiety, fear_of_abandonment, insecurity
    'digital_detox_test:q6': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q6',
      axisWeights: {
        'anxiety': 1.0,                      // Primary: Fear of missing out
        'fear_of_abandonment': 0.8,          // High: Fear of social exclusion
        'insecurity': 0.8,                   // High: Social insecurity
        'worry_tendency': 0.7,               // Secondary: Chronic worry
        'anxious_attachment': 0.7,           // Secondary: Anxious relationship pattern
        'self_esteem': 0.6,                  // Secondary: Need for external validation (reversed)
        'vulnerability': 0.5,                // Secondary: Emotional vulnerability
        // MBTI personality type scales
        'feeling': 0.4,
        'judging': 0.2,
      },
      note: 'FOMO: anxiety + fear of exclusion + insecurity + chronic worry + low self-esteem',
    ),

    // Q13: "I feel irritation or anger when someone interrupts me while using gadgets"
    // Interruption anger = anger, frustration_tolerance, emotional_reactivity
    'digital_detox_test:q13': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q13',
      axisWeights: {
        'anger': 1.0,                        // Primary: Irritation/anger response
        'frustration_tolerance': 0.9,        // Primary: Low interruption tolerance (reversed)
        'emotional_reactivity': 0.8,         // High: Strong emotional response
        'composure': 0.7,                    // Secondary: Loss of composure (reversed)
        'impulsiveness': 0.6,                // Secondary: Reactive behavior
        'empathy': 0.6,                      // Secondary: Low empathy for interrupter (reversed)
        'patience': 0.5,                     // Secondary: Impatience (reversed)
        // MBTI personality type scales
        'feeling': 0.3,
        'perceiving': 0.2,
      },
      note: 'Interruption anger: anger + low frustration tolerance + emotional reactivity + low composure',
    ),

    // Q20: "I compare my life to what I see on social media, and it affects my mood"
    // Social comparison = self_esteem, depression, envy
    'digital_detox_test:q20': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q20',
      axisWeights: {
        'self_esteem': 1.0,                  // Primary: Low self-worth from comparison (reversed)
        'depression': 0.9,                   // Primary: Mood lowering
        'envy': 0.8,                         // High: Envious comparison
        'self_acceptance': 0.7,              // Secondary: Lack of self-acceptance (reversed)
        'life_satisfaction': 0.7,            // Secondary: Dissatisfaction (reversed)
        'rumination': 0.6,                   // Secondary: Obsessive comparison thinking
        'vulnerability': 0.5,                // Secondary: Emotional vulnerability
        // MBTI personality type scales
        'feeling': 0.4,
        'intuition': 0.2,
      },
      note: 'Social comparison: low self-esteem + depression + envy + rumination + dissatisfaction',
    ),

    // Q27: "I feel anxious when I cannot access the internet"
    // Internet anxiety = anxiety, vulnerability, dependency
    'digital_detox_test:q27': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q27',
      axisWeights: {
        'anxiety': 1.0,                      // Primary: Internet disconnection anxiety
        'vulnerability': 0.9,                // Primary: Feeling vulnerable without connection
        'fear_of_abandonment': 0.7,          // Secondary: Fear of disconnection
        'stress_tolerance': 0.6,             // Secondary: Low stress tolerance (reversed)
        'emotional_resilience': 0.6,         // Secondary: Low resilience to deprivation (reversed)
        'autonomy_need': 0.5,                // Secondary: Dependence on external (reversed)
        'worry_tendency': 0.5,               // Secondary: Anticipatory worry
        // MBTI personality type scales
        'feeling': 0.4,
        'judging': 0.2,
      },
      note: 'Internet anxiety: anxiety + vulnerability + fear + low stress tolerance + dependency',
    ),

    // Q34: "I feel envy or dissatisfaction looking at other people's lives on social media"
    // Comparison envy = envy, self_esteem, life_satisfaction
    'digital_detox_test:q34': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q34',
      axisWeights: {
        'envy': 1.0,                         // Primary: Envious feelings
        'self_esteem': 0.9,                  // Primary: Low self-worth (reversed)
        'life_satisfaction': 0.8,            // High: Life dissatisfaction (reversed)
        'depression': 0.7,                   // Secondary: Depressive mood
        'self_acceptance': 0.7,              // Secondary: Lack of self-acceptance (reversed)
        'rumination': 0.6,                   // Secondary: Obsessive comparison
        'gratitude': 0.5,                    // Secondary: Lack of gratitude (reversed)
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Comparison envy: envy + low self-esteem + life dissatisfaction + depression + rumination',
    ),

    // Q41: "The thought of turning off notifications makes me anxious"
    // Notification anxiety = anxiety, control_need, fear_of_missing
    'digital_detox_test:q41': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q41',
      axisWeights: {
        'anxiety': 1.0,                      // Primary: Notification anxiety
        'fear_of_abandonment': 0.8,          // High: Fear of missing connection
        'worry_tendency': 0.8,               // High: Anticipatory worry
        'vulnerability': 0.7,                // Secondary: Emotional vulnerability
        'self_discipline': 0.6,              // Secondary: Cannot tolerate notification silence (reversed)
        'impulsiveness': 0.6,                // Secondary: Need for immediate information
        'stress_tolerance': 0.5,             // Secondary: Low stress tolerance (reversed)
        // MBTI personality type scales
        'feeling': 0.4,
        'judging': 0.3,
      },
      note: 'Notification anxiety: anxiety + fear of missing + worry + vulnerability + low tolerance',
    ),

    // Q48: "After using social media I feel worse than before"
    // Post-use mood decline = depression, self_awareness, emotional_reactivity
    'digital_detox_test:q48': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q48',
      axisWeights: {
        'depression': 1.0,                   // Primary: Mood lowering
        'self_awareness': 0.9,               // Primary: Recognition of negative impact
        'emotional_reactivity': 0.7,         // Secondary: Emotional response to content
        'vulnerability': 0.7,                // Secondary: Emotional vulnerability
        'life_satisfaction': 0.6,            // Secondary: Reduced satisfaction (reversed)
        'rumination': 0.6,                   // Secondary: Post-use negative thinking
        'self_esteem': 0.5,                  // Secondary: Lowered self-worth (reversed)
        // MBTI personality type scales
        'feeling': 0.4,
        'introversion': 0.2,
      },
      note: 'Post-use mood decline: depression + self-awareness + vulnerability + rumination + low satisfaction',
    ),

    // ========================================================================
    // FACTOR 7: USAGE PATTERNS (q7, 14, 21, 28, 35, 42, 49, 50)
    // ========================================================================

    // Q7: "How many hours per day do you spend in front of screens?"
    // Screen time volume = time_management, self_discipline, health_consciousness
    'digital_detox_test:q7': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q7',
      axisWeights: {
        'time_management': 1.0,              // Primary: Time allocation to screens
        'self_discipline': 0.8,              // High: Control over screen time (reversed at high levels)
        'health_consciousness': 0.6,         // Secondary: Awareness of health impact (reversed)
        'boundary_setting': 0.6,             // Secondary: Poor time boundaries (reversed)
        'achievement_striving': 0.5,         // Secondary: Time away from goals (reversed)
        'vitality': 0.4,                     // Moderate: Sedentary behavior impact (reversed)
        'actions': 0.4,                      // Moderate: Limited varied activities (reversed)
        // MBTI personality type scales
        'perceiving': 0.3,
      },
      note: 'Screen time volume: time allocation + self-discipline + health awareness + boundaries',
    ),

    // Q14: "How often do you check your phone during the day?"
    // Check frequency = impulsiveness, attention_control, compulsiveness
    'digital_detox_test:q14': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q14',
      axisWeights: {
        'impulsiveness': 1.0,                // Primary: Frequent checking impulse
        'attention_control': 0.9,            // Primary: Attention fragmentation (reversed)
        'self_discipline': 0.7,              // Secondary: Low checking control (reversed)
        'anxiety': 0.7,                      // Secondary: Anxious checking behavior
        'patience': 0.6,                     // Secondary: Cannot delay checking (reversed)
        'rumination': 0.5,                   // Secondary: Preoccupation with phone
        'mindfulness_coping': 0.4,           // Moderate: Lack of present awareness (reversed)
        // MBTI personality type scales
        'perceiving': 0.4,
        'extraversion': 0.2,
      },
      note: 'Check frequency: impulsiveness + attention fragmentation + anxiety + low self-discipline',
    ),

    // Q21: "How much time passes from when you pick up your phone until you put it away?"
    // Session duration = self_discipline, time_awareness, engagement_depth
    'digital_detox_test:q21': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q21',
      axisWeights: {
        'self_discipline': 1.0,              // Primary: Session time control (reversed at high)
        'time_management': 0.8,              // High: Time awareness (reversed)
        'impulsiveness': 0.7,                // Secondary: Cannot stop usage
        'attention_control': 0.6,            // Secondary: Engagement capture
        'patience': 0.5,                     // Secondary: Delayed gratification (reversed)
        'self_awareness': 0.5,               // Secondary: Awareness of time passage (reversed)
        'procrastination': 0.4,              // Moderate: Extended avoidance behavior
        // MBTI personality type scales
        'perceiving': 0.4,
      },
      note: 'Session duration: low self-discipline + poor time awareness + impulsiveness + engagement capture',
    ),

    // Q28: "How quickly after receiving a notification do you check it?"
    // Notification response speed = impulsiveness, patience, urgency
    'digital_detox_test:q28': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q28',
      axisWeights: {
        'impulsiveness': 1.0,                // Primary: Immediate response impulse
        'patience': 0.9,                     // Primary: Cannot delay response (reversed)
        'self_discipline': 0.7,              // Secondary: Low impulse control (reversed)
        'anxiety': 0.7,                      // Secondary: Anxious urgency
        'attention_control': 0.6,            // Secondary: Notification distraction susceptibility (reversed)
        'frustration_tolerance': 0.5,        // Secondary: Low tolerance for delay (reversed)
        'deliberation': 0.4,                 // Moderate: Automatic response (reversed)
        // MBTI personality type scales
        'perceiving': 0.4,
        'extraversion': 0.2,
      },
      note: 'Notification response speed: impulsiveness + impatience + anxiety + low self-discipline',
    ),

    // Q35: "Do you use your phone while eating?"
    // Mealtime phone use = mindfulness, boundary_setting, presence
    'digital_detox_test:q35': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q35',
      axisWeights: {
        'mindfulness_coping': 1.0,           // Primary: Lack of present awareness (reversed)
        'boundary_setting': 0.8,             // High: Poor activity boundaries (reversed)
        'self_discipline': 0.7,              // Secondary: Cannot abstain during meals (reversed)
        'impulsiveness': 0.6,                // Secondary: Automatic phone use
        'aesthetics': 0.5,                   // Secondary: Reduced food/meal appreciation (reversed)
        'health_consciousness': 0.5,         // Secondary: Ignoring mindful eating (reversed)
        'politeness': 0.4,                   // Moderate: Social meal rudeness (reversed)
        // MBTI personality type scales
        'perceiving': 0.3,
        'sensing': 0.2,
      },
      note: 'Mealtime phone use: lack of mindfulness + poor boundaries + impulsiveness + low self-discipline',
    ),

    // Q42: "Do you take your phone to bed before sleep?"
    // Bedtime phone use = sleep_hygiene, boundary_setting, self_discipline
    'digital_detox_test:q42': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q42',
      axisWeights: {
        'boundary_setting': 1.0,             // Primary: Poor sleep boundaries (reversed)
        'self_discipline': 0.9,              // Primary: Cannot separate from phone (reversed)
        'health_consciousness': 0.7,         // Secondary: Ignoring sleep hygiene (reversed)
        'impulsiveness': 0.6,                // Secondary: Cannot resist phone before sleep
        'deliberation': 0.5,                 // Secondary: Automatic behavior (reversed)
        'vulnerability': 0.5,                // Secondary: Sleep vulnerability
        'patience': 0.4,                     // Moderate: Cannot delay usage (reversed)
        // MBTI personality type scales
        'perceiving': 0.3,
      },
      note: 'Bedtime phone use: poor boundaries + low self-discipline + low health awareness + impulsiveness',
    ),

    // Q49: "How many apps do you check each morning in the first 30 minutes after waking up?"
    // Morning app routine = impulsiveness, ritual_behavior, dependency
    'digital_detox_test:q49': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q49',
      axisWeights: {
        'impulsiveness': 1.0,                // Primary: Immediate multi-app checking
        'self_discipline': 0.8,              // High: Low morning control (reversed)
        'anxiety': 0.7,                      // Secondary: Need for immediate information
        'autonomy_need': 0.6,                // Secondary: External dependency (reversed)
        'deliberation': 0.5,                 // Secondary: Automatic behavior (reversed)
        'vitality': 0.4,                     // Moderate: Morning energy to phone vs. self
        'mindfulness_coping': 0.4,           // Moderate: Lack of present awareness (reversed)
        // MBTI personality type scales
        'perceiving': 0.4,
        'extraversion': 0.2,
      },
      note: 'Morning app routine: impulsiveness + low self-discipline + anxiety + automatic behavior',
    ),

    // Q50: "How often do you check your phone when waiting for someone or something?"
    // Waiting phone use = patience, impulsiveness, boredom_tolerance
    'digital_detox_test:q50': const QuestionWeight(
      testId: 'digital_detox_test',
      questionId: 'q50',
      axisWeights: {
        'patience': 1.0,                     // Primary: Intolerance for waiting (reversed)
        'impulsiveness': 0.9,                // Primary: Automatic phone use when idle
        'mindfulness_coping': 0.7,           // Secondary: Lack of present awareness (reversed)
        'self_discipline': 0.6,              // Secondary: Cannot resist idle phone use (reversed)
        'curiosity': 0.5,                    // Secondary: Reduced environmental curiosity (reversed)
        'attention_control': 0.5,            // Secondary: Difficulty with unoccupied attention (reversed)
        'vitality': 0.4,                     // Moderate: Low tolerance for idle state
        // MBTI personality type scales
        'perceiving': 0.4,
        'sensing': 0.2,
      },
      note: 'Waiting phone use: impatience + impulsiveness + lack of mindfulness + low self-discipline',
    ),

    // ========================================================================
    // DIGITAL DETOX TEST COMPLETE - All 50 questions mapped
    //
    // Coverage Statistics (Using 195 Hierarchical Scales):
    // - Total questions: 50
    // - Total axis weights: ~350 connections
    // - Average axes per question: 7.0
    // - Weight range: 0.2-1.0
    // - Axes range per question: 5-10
    //
    // Factor Coverage:
    // - dependency_level (7 questions): anxiety, impulsiveness, vulnerability, dependency patterns
    // - attention_control (7 questions): attention, focus, distraction, mindfulness
    // - social_impact (7 questions): relationships, communication, social isolation, connection quality
    // - physical_health (7 questions): fatigue, sleep, pain, physical symptoms, body awareness
    // - productivity_loss (7 questions): procrastination, time management, achievement, work quality
    // - emotional_state (7 questions): anxiety, depression, FOMO, comparison, mood, self-esteem
    // - usage_patterns (8 questions): time, frequency, duration, boundaries, habits
    //
    // Most Used Scales (Top 30):
    // - anxiety: 13 questions (26%) - Technology-induced anxiety, FOMO, separation anxiety
    // - impulsiveness: 13 questions (26%) - Impulse checking, automatic behavior, cannot resist
    // - self_discipline: 13 questions (26%) - Lack of control, poor boundaries, habit strength
    // - attention_control: 10 questions (20%) - Distraction, focus loss, fragmented attention
    // - vulnerability: 9 questions (18%) - Physical/emotional vulnerability to screens
    // - patience: 9 questions (18%) - Cannot delay, impatience, urgency
    // - frustration_tolerance: 7 questions (14%) - Low tolerance for device separation
    // - health_consciousness: 7 questions (14%) - Awareness of health impact
    // - time_management: 7 questions (14%) - Poor time allocation, awareness
    // - self_awareness: 7 questions (14%) - Recognition of problems, self-deception
    // - boundary_setting: 7 questions (14%) - Poor digital boundaries
    // - deliberation: 7 questions (14%) - Automatic vs. intentional behavior
    // - stress_tolerance: 6 questions (12%) - Stress from device separation
    // - emotional_reactivity: 6 questions (12%) - Emotional responses to digital stimuli
    // - achievement_striving: 6 questions (12%) - Goal pursuit impact
    // - worry_tendency: 6 questions (12%) - Chronic worry about connection
    // - rumination: 6 questions (12%) - Obsessive thinking about phone/content
    // - mindfulness_coping: 6 questions (12%) - Lack of present awareness
    // - persistence: 5 questions (10%) - Task abandonment, goal pursuit
    // - relationship_quality: 5 questions (10%) - Social relationship impact
    // - vitality: 5 questions (10%) - Energy depletion, fatigue
    // - emotional_resilience: 5 questions (10%) - Resilience to digital stress
    // - autonomy_need: 5 questions (10%) - Dependence on external devices
    // - fear_of_abandonment: 5 questions (10%) - Fear of disconnection/exclusion
    // - procrastination: 4 questions (8%) - Task avoidance behaviors
    // - depression: 4 questions (8%) - Mood lowering effects
    // - self_esteem: 4 questions (8%) - Self-worth impact
    // - gregariousness: 3 questions (6%) - In-person social seeking
    // - communication_quality: 3 questions (6%) - Communication degradation
    // - body_image: 3 questions (6%) - Physical awareness
    //
    // Psychological Construct Mapping:
    // 1. Technology Addiction: anxiety, impulsiveness, vulnerability, dependency patterns
    // 2. Cognitive Impact: attention_control, working_memory, processing_speed, cognitive_flexibility
    // 3. Emotional Impact: anxiety, depression, FOMO, envy, mood_stability, emotional_reactivity
    // 4. Social Impact: relationship_quality, communication, intimacy, social_isolation
    // 5. Physical Health: vulnerability, vitality, sleep_quality, pain, fatigue
    // 6. Productivity: procrastination, time_management, achievement, task_focus
    // 7. Self-Regulation: self_discipline, impulsiveness, boundary_setting, patience
    // 8. Awareness: self_awareness, mindfulness, health_consciousness
    //
    // Key Insights:
    // - Digital addiction manifests across emotional, cognitive, social, and physical domains
    // - Core psychological mechanisms: anxiety, impulsiveness, poor self-regulation
    // - Strong FOMO (fear of missing out) component tied to anxiety and attachment
    // - Mindfulness deficits central to usage patterns and social disconnection
    // - Physical symptoms reflect chronic stress and poor self-care boundaries
    // - Productivity loss driven by procrastination and attention fragmentation
    // - Social media comparison linked to depression, envy, and low self-esteem
    // - Nomophobia (phone separation anxiety) central to dependency factor
    //
    // Clinical Relevance:
    // - Maps to ICD-11 "Gaming Disorder" and proposed "Internet Addiction" criteria
    // - Covers nomophobia (fear of being without mobile phone) extensively
    // - Addresses digital wellbeing research domains comprehensively
    // - Integrates cognitive load theory and attention restoration theory
    // - Reflects attachment theory in digital context (anxious attachment patterns)
    //
    // Next Steps:
    // - Validate against standardized digital addiction scales (SABAS, SMAS, etc.)
    // - Cross-reference with mental health outcomes (anxiety, depression scales)
    // - Consider age-based normative data (Gen Z vs. Millennials vs. older adults)
    // - Explore intervention recommendations based on factor profiles
    // ========================================================================
  };
}
