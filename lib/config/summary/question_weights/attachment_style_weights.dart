import 'question_weight_models.dart';

/// Question weights configuration for Attachment Style test
/// Maps all 40 Attachment Style questions to ~195 hierarchical psychological scales
///
/// Test measures 4 attachment styles:
/// 1. Secure (q1, q5, q9, q13, q17, q21, q25, q29, q33, q37)
/// 2. Anxious (q2, q6, q10, q14, q18, q22, q26, q30, q34, q38)
/// 3. Avoidant (q3, q7, q11, q15, q19, q23, q27, q31, q35, q39)
/// 4. Fearful-Avoidant (q4, q8, q12, q16, q20, q24, q28, q32, q36, q40)
class AttachmentStyleWeights {
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // SECURE ATTACHMENT (q1, q5, q9, q13, q17, q21, q25, q29, q33, q37)
    // ========================================================================

    // Q1: "Я чувствую себя комфортно, открываясь партнёру эмоционально"
    'attachment_style_v1:q1': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q1',
      axisWeights: {
        'emotional_openness': 1.0,        // Primary: emotional openness
        'trust_in_relationships': 0.9,    // High: trust
        'intimacy_comfort': 0.9,          // High: comfort with intimacy
        'vulnerability_sharing': 0.8,     // Secondary: accepting vulnerability (FIXED: vulnerability_acceptance → vulnerability_sharing)
        'emotional_intelligence': 0.7,    // Secondary: emotional awareness
        'authenticity': 0.7,              // Secondary: willingness to share (FIXED: self_disclosure → authenticity)
        // Personality type
        'feeling': 0.4,
        'extraversion': 0.3,
      },
      note: 'Secure: emotional openness + trust + intimacy comfort',
    ),

    // Q5: "Я могу быть независимым, но при этом чувствовать себя близким с партнёром"
    'attachment_style_v1:q5': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q5',
      axisWeights: {
        'autonomy_need': 0.9,             // High: independence (FIXED: autonomy → autonomy_need)
        'intimacy_comfort': 0.9,          // High: comfort with closeness
        'emotional_resilience': 0.9,      // High: healthy balance (FIXED: relationship_balance → emotional_resilience)
        'mood_stability': 0.8,            // Secondary: stability (FIXED: emotional_stability → mood_stability)
        'autonomy_wellbeing': 0.7,        // Secondary: independence (FIXED: self_sufficiency → autonomy_wellbeing)
        'secure_attachment': 1.0,         // Primary: secure attachment marker
      },
      note: 'Secure: autonomy + intimacy balance (key marker)',
    ),

    // Q9: "Я легко доверяю партнёру и не беспокоюсь о предательстве"
    'attachment_style_v1:q9': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q9',
      axisWeights: {
        'trust_in_relationships': 1.0,    // Primary: trust
        'relationship_security': 1.0,     // Primary: feeling secure
        'anxiety': -0.9,                  // Reversed: low anxiety
        'trust': 0.8,                     // Secondary: general trust (FIXED: paranoia reversed → trust)
        'mood_stability': 0.9,            // High: emotional stability (FIXED: emotional_stability → mood_stability)
        'positive_emotions': 0.6,         // Secondary: positive outlook (FIXED: optimism → positive_emotions)
      },
      note: 'Secure: trust + security, low anxiety',
    ),

    // Q13: "Я могу открыто обсуждать свои чувства и потребности с партнёром"
    'attachment_style_v1:q13': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q13',
      axisWeights: {
        'emotional_openness': 1.0,        // Primary: openness
        'communication_quality': 1.0,     // Primary: communication
        'assertiveness': 0.9,             // High: expressing needs
        'authenticity': 0.8,              // Secondary: sharing (FIXED: self_disclosure → authenticity)
        'emotional_intelligence': 0.7,    // Secondary: emotional awareness
        // Personality type
        'feeling': 0.4,
        'extraversion': 0.3,
      },
      note: 'Secure: communication + emotional openness + assertiveness',
    ),

    // Q17: "Я не боюсь, что партнёр меня бросит"
    'attachment_style_v1:q17': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q17',
      axisWeights: {
        'relationship_security': 1.0,     // Primary: security
        'anxiety': -1.0,                  // Reversed: no abandonment anxiety
        'fear_of_abandonment': -1.0,      // Reversed: no fear
        'self_esteem': 0.8,               // Secondary: confidence
        'trust_in_relationships': 0.8,    // Secondary: trust
        'mood_stability': 0.7,            // Secondary: stability (FIXED: emotional_stability → mood_stability)
      },
      note: 'Secure: no abandonment fear, high security',
    ),

    // Q21: "Я комфортно себя чувствую как в близости, так и в одиночестве"
    'attachment_style_v1:q21': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q21',
      axisWeights: {
        'autonomy_need': 1.0,             // Primary: comfortable alone (FIXED: autonomy → autonomy_need)
        'intimacy_comfort': 1.0,          // Primary: comfortable with closeness
        'emotional_resilience': 1.0,      // Primary: balance (key marker) (FIXED: relationship_balance → emotional_resilience)
        'autonomy_wellbeing': 0.8,        // Secondary: independence (FIXED: self_sufficiency → autonomy_wellbeing)
        'mood_stability': 0.7,            // Secondary: stability (FIXED: emotional_stability → mood_stability)
        'secure_attachment': 1.0,         // Primary: secure marker
      },
      note: 'Secure: ultimate balance between intimacy and solitude',
    ),

    // Q25: "Я могу спокойно разрешать конфликты в отношениях"
    'attachment_style_v1:q25': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q25',
      axisWeights: {
        'conflict_resolution': 1.0,       // Primary: resolving conflicts
        'emotional_resilience': 0.9,      // High: regulating emotions
        'communication_quality': 0.8,     // Secondary: communicating well
        'mood_stability': 0.8,       // Secondary: staying calm
        'problem_solving': 0.7,           // Secondary: finding solutions
        // Personality type
        'thinking': 0.3,
      },
      note: 'Secure: conflict resolution + emotional regulation',
    ),

    // Q29: "Я чувствую себя в безопасности, полагаясь на партнёра"
    'attachment_style_v1:q29': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q29',
      axisWeights: {
        'relationship_security': 1.0,     // Primary: feeling secure
        'trust_in_relationships': 1.0,    // Primary: trust
        'secure_attachment': 0.9,         // High: healthy dependence (FIXED: interdependence → secure_attachment)
        'social_support_seeking': 0.8,    // Secondary: seeking support (FIXED: support_seeking → social_support_seeking)
        'mood_stability': 0.7,            // Secondary: stability (FIXED: emotional_stability → mood_stability)
      },
      note: 'Secure: security in relying on partner',
    ),

    // Q33: "Мне легко быть уязвимым с партнёром"
    'attachment_style_v1:q33': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q33',
      axisWeights: {
        'vulnerability_sharing': 1.0,     // Primary: accepting vulnerability (FIXED: vulnerability_acceptance → vulnerability_sharing)
        'emotional_openness': 0.9,        // High: openness
        'trust_in_relationships': 0.9,    // High: trust
        'intimacy_comfort': 0.8,          // Secondary: intimacy
        'authenticity': 0.7,              // Secondary: sharing (FIXED: self_disclosure → authenticity)
        // Personality type
        'feeling': 0.4,
      },
      note: 'Secure: vulnerability + openness + trust',
    ),

    // Q37: "Я верю, что могу рассчитывать на партнёра в трудные времена"
    'attachment_style_v1:q37': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q37',
      axisWeights: {
        'trust_in_relationships': 1.0,    // Primary: trust
        'relationship_security': 1.0,     // Primary: security
        'social_support_seeking': 0.9,    // High: seeking support (FIXED: support_seeking → social_support_seeking)
        'secure_attachment': 0.8,         // Secondary: dependence (FIXED: interdependence → secure_attachment)
        'positive_emotions': 0.7,         // Secondary: positive expectations (FIXED: optimism → positive_emotions)
      },
      note: 'Secure: trust in partner support',
    ),

    // ========================================================================
    // ANXIOUS ATTACHMENT (q2, q6, q10, q14, q18, q22, q26, q30, q34, q38)
    // ========================================================================

    // Q2: "Я часто беспокоюсь, что партнёр на самом деле меня не любит"
    'attachment_style_v1:q2': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q2',
      axisWeights: {
        'anxiety': 1.0,                   // Primary: relationship anxiety
        'fear_of_abandonment': 1.0,       // Primary: abandonment fear
        'anxious_attachment': 1.0,        // Primary: insecurity (FIXED: relationship_insecurity → anxious_attachment)
        'self_esteem': -0.8,              // Reversed: low self-esteem
        'trust_in_relationships': -0.8,   // Reversed: low trust
        'rumination': 0.8,                // Secondary: overthinking
      },
      note: 'Anxious: relationship anxiety + abandonment fear',
    ),

    // Q6: "Если партнёр не отвечает на сообщения быстро, я начинаю переживать"
    'attachment_style_v1:q6': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q6',
      axisWeights: {
        'anxiety': 1.0,                   // Primary: immediate anxiety
        'fear_of_abandonment': 0.9,       // High: abandonment trigger
        'anxiety': 1.0,      // Primary: reassurance seeking
        'emotional_reactivity': 0.9,      // High: strong reaction
        'worry_tendency': 0.8,            // Secondary: monitoring behavior
        'rumination': 0.7,                // Secondary: overthinking
      },
      note: 'Anxious: immediate anxiety + reassurance need',
    ),

    // Q10: "Мне нужно постоянное подтверждение любви от партнёра"
    'attachment_style_v1:q10': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q10',
      axisWeights: {
        'anxiety': 1.0,      // Primary: constant reassurance
        'anxious_attachment': 1.0,   // Primary: insecurity
        'self_esteem': -0.9,              // Reversed: low self-worth
        'anxious_attachment': 0.9,      // High: dependence
        'anxiety': 0.8,                   // Secondary: anxiety
        'fear_of_abandonment': 0.7,       // Secondary: abandonment fear
      },
      note: 'Anxious: constant reassurance need + low self-esteem',
    ),

    // Q14: "Я очень расстраиваюсь, когда партнёр проводит время без меня"
    'attachment_style_v1:q14': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q14',
      axisWeights: {
        'fear_of_abandonment': 1.0,       // Primary: abandonment sensitivity
        'anxious_attachment': 1.0,      // Primary: dependence on partner
        'jealousy': 0.9,                  // High: jealous feelings
        'anxiety': 0.8,                   // Secondary: anxiety
        'anxiety': 0.7,      // Secondary: needing connection
        'autonomy_need': -0.8,                 // Reversed: low independence
      },
      note: 'Anxious: distress at separation + dependence',
    ),

    // Q18: "Я склонен переживать о том, что партнёр не так сильно вовлечён в отношения"
    'attachment_style_v1:q18': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q18',
      axisWeights: {
        'anxious_attachment': 1.0,   // Primary: insecurity
        'rumination': 1.0,                // Primary: overthinking
        'anxiety': 0.9,                   // High: anxiety
        'worry_tendency': 0.9,            // High: monitoring
        'fear_of_abandonment': 0.8,       // Secondary: abandonment fear
        'self_esteem': -0.7,              // Reversed: low self-worth
      },
      note: 'Anxious: rumination about partner commitment',
    ),

    // Q22: "Я часто чувствую себя недооценённым в отношениях"
    'attachment_style_v1:q22': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q22',
      axisWeights: {
        'self_esteem': -1.0,              // Reversed: low self-esteem
        'anxious_attachment': 0.9,   // High: insecurity
        'anxiety': 0.9,      // High: need for validation
        'emotional_reactivity': 0.8,     // Secondary: sensitivity
        'anxiety': 0.7,                   // Secondary: anxiety
        'anger': 0.6,                // Tertiary: feeling undervalued
      },
      note: 'Anxious: feeling undervalued + low self-esteem',
    ),

    // Q26: "Малейший конфликт заставляет меня бояться расставания"
    'attachment_style_v1:q26': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q26',
      axisWeights: {
        'fear_of_abandonment': 1.0,       // Primary: abandonment terror
        'anxiety': 1.0,                   // Primary: conflict anxiety
        'emotional_reactivity': 0.9,      // High: overreaction
        'catastrophizing': 0.9,           // High: worst-case thinking
        'emotional_resilience': -0.8,     // Reversed: poor regulation
        'anxious_attachment': 0.8,   // Secondary: insecurity
      },
      note: 'Anxious: conflict triggers abandonment fear',
    ),

    // Q30: "Я постоянно ищу признаки того, что партнёр теряет интерес"
    'attachment_style_v1:q30': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q30',
      axisWeights: {
        'worry_tendency': 1.0,            // Primary: constant monitoring
        'anxiety': 1.0,                   // Primary: relationship anxiety
        'rumination': 0.9,                // High: overthinking
        'trust': 0.8,                  // Secondary: suspicious thinking
        'fear_of_abandonment': 0.8,       // Secondary: abandonment fear
        'anxious_attachment': 0.7,   // Secondary: insecurity
      },
      note: 'Anxious: hypervigilance + monitoring behavior',
    ),

    // Q34: "Я становлюсь очень эмоциональным, когда чувствую дистанцию от партнёра"
    'attachment_style_v1:q34': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q34',
      axisWeights: {
        'emotional_reactivity': 1.0,      // Primary: strong emotional reaction
        'fear_of_abandonment': 0.9,       // High: abandonment trigger
        'emotional_resilience': -0.9,     // Reversed: poor regulation
        'anxiety': 0.8,                   // Secondary: anxiety
        'anxious_attachment': 0.8,      // Secondary: dependence
        'emotional_reactivity': 0.7,     // Secondary: sensitivity
      },
      note: 'Anxious: emotional reactivity to distance',
    ),

    // Q38: "Я часто чувствую, что люблю сильнее, чем меня любят"
    'attachment_style_v1:q38': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q38',
      axisWeights: {
        'anxious_attachment': 1.0,   // Primary: insecurity
        'self_esteem': -0.9,              // Reversed: low self-worth
        'mood_stability': 0.9,       // High: perceived imbalance
        'anxiety': 0.8,      // Secondary: reassurance seeking
        'anxiety': 0.7,                   // Secondary: anxiety
        'fear_of_abandonment': 0.6,       // Tertiary: abandonment fear
      },
      note: 'Anxious: perceived love imbalance',
    ),

    // ========================================================================
    // AVOIDANT ATTACHMENT (q3, q7, q11, q15, q19, q23, q27, q31, q35, q39)
    // ========================================================================

    // Q3: "Мне некомфортно, когда партнёр хочет быть слишком близким эмоционально"
    'attachment_style_v1:q3': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q3',
      axisWeights: {
        'intimacy_comfort': 1.0,        // Primary: avoiding intimacy
        'emotional_openness': 1.0,        // Primary: keeping distance
        'intimacy_comfort': 1.0, // Primary: closeness discomfort
        'vulnerability_sharing': 0.9,   // High: avoiding vulnerability
        'avoidant_attachment': 0.8,    // Secondary: overvaluing independence
        // Personality type
        'introversion': 0.4,
        'thinking': 0.3,
      },
      note: 'Avoidant: intimacy avoidance + emotional distance',
    ),

    // Q7: "Я предпочитаю держать эмоциональную дистанцию в отношениях"
    'attachment_style_v1:q7': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q7',
      axisWeights: {
        'emotional_openness': 1.0,        // Primary: preferring distance
        'intimacy_comfort': 1.0,        // Primary: avoiding closeness
        'emotional_openness': 0.9,     // High: suppressing emotions
        'avoidant_attachment': 0.9,    // High: overvaluing independence
        'vulnerability_sharing': 0.8,   // Secondary: avoiding vulnerability
        // Personality type
        'introversion': 0.4,
        'thinking': 0.4,
      },
      note: 'Avoidant: preferring emotional distance',
    ),

    // Q11: "Я чувствую себя лучше, когда сохраняю эмоциональную независимость"
    'attachment_style_v1:q11': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q11',
      axisWeights: {
        'avoidant_attachment': 1.0,    // Primary: independence priority
        'emotional_openness': 0.9,        // High: maintaining distance
        'avoidant_attachment': 0.9,   // High: excessive self-reliance
        'intimacy_comfort': 0.8,        // Secondary: avoiding closeness
        'emotional_openness': 0.7,     // Secondary: suppressing needs
        // Personality type
        'introversion': 0.3,
        'thinking': 0.3,
      },
      note: 'Avoidant: emotional independence priority',
    ),

    // Q15: "Разговоры о чувствах кажутся мне неудобными и ненужными"
    'attachment_style_v1:q15': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q15',
      axisWeights: {
        'emotional_openness': 1.0,     // Primary: suppressing emotions
        'avoidant_coping': 1.0,       // Primary: avoiding emotional talk
        'vulnerability_sharing': 0.9,   // High: avoiding vulnerability
        'emotional_openness': -0.9,       // Reversed: closed emotionally
        'avoidant_attachment': 0.8,   // Secondary: avoiding communication
        // Personality type
        'thinking': 0.5,
        'introversion': 0.3,
      },
      note: 'Avoidant: emotional expression discomfort',
    ),

    // Q19: "Я стараюсь не слишком полагаться на партнёра эмоционально"
    'attachment_style_v1:q19': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q19',
      axisWeights: {
        'avoidant_attachment': 1.0,   // Primary: excessive self-reliance
        'avoidant_attachment': 0.9,    // High: independence overvalued
        'emotional_openness': 0.9,        // High: keeping distance
        'secure_attachment': -0.8,          // Reversed: avoiding interdependence
        'trust_in_relationships': -0.7,   // Reversed: difficulty trusting
        // Personality type
        'thinking': 0.3,
      },
      note: 'Avoidant: avoiding emotional reliance',
    ),

    // Q23: "Мне важнее личная свобода, чем эмоциональная близость"
    'attachment_style_v1:q23': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q23',
      axisWeights: {
        'avoidant_attachment': 1.0,    // Primary: freedom priority
        'intimacy_comfort': 1.0,        // Primary: avoiding intimacy
        'autonomy_need': 0.9,              // High: valuing independence
        'emotional_openness': 0.8,        // Secondary: preferring distance
        'avoidant_attachment': 0.8,      // Secondary: avoiding commitment
        // Personality type
        'thinking': 0.4,
      },
      note: 'Avoidant: freedom over intimacy',
    ),

    // Q27: "Когда партнёр хочет поговорить о чувствах, я стремлюсь уйти от разговора"
    'attachment_style_v1:q27': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q27',
      axisWeights: {
        'avoidant_coping': 1.0,       // Primary: avoiding emotional talk
        'avoidant_attachment': 1.0,   // Primary: avoiding communication
        'vulnerability_sharing': 0.9,   // High: avoiding vulnerability
        'conflict_resolution': 0.8,        // Secondary: avoiding difficult talks
        'emotional_openness': 0.8,     // Secondary: suppressing emotions
        // Personality type
        'thinking': 0.4,
        'introversion': 0.3,
      },
      note: 'Avoidant: avoiding emotional conversations',
    ),

    // Q31: "Я считаю, что слишком большая близость делает меня уязвимым"
    'attachment_style_v1:q31': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q31',
      axisWeights: {
        'vulnerability_sharing': 1.0,   // Primary: avoiding vulnerability
        'intimacy_comfort': 1.0,        // Primary: avoiding closeness
        'intimacy_comfort': 0.9,          // High: intimacy fear
        'emotional_openness': 0.8,        // Secondary: keeping distance
        'trust_in_relationships': -0.8,   // Reversed: difficulty trusting
        'positive_emotions': 0.7,       // Secondary: pessimistic view
      },
      note: 'Avoidant: vulnerability as weakness belief',
    ),

    // Q35: "Я чувствую себя комфортно без глубокой эмоциональной вовлечённости"
    'attachment_style_v1:q35': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q35',
      axisWeights: {
        'emotional_openness': 1.0,        // Primary: preferring shallow connection
        'intimacy_comfort': 1.0,        // Primary: avoiding depth
        'emotional_openness': 0.9,     // High: suppressing needs
        'avoidant_attachment': 0.8,    // Secondary: independence priority
        'emotional_openness': 0.7,            // Secondary: surface-level comfort
        // Personality type
        'thinking': 0.4,
        'introversion': 0.3,
      },
      note: 'Avoidant: comfortable without emotional depth',
    ),

    // Q39: "Я предпочитаю не раскрываться полностью даже близким людям"
    'attachment_style_v1:q39': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q39',
      axisWeights: {
        'vulnerability_sharing': 1.0,   // Primary: avoiding vulnerability
        'authenticity': -1.0,          // Reversed: no self-disclosure
        'emotional_openness': 0.9,     // High: suppressing sharing
        'trust_in_relationships': -0.9,   // Reversed: trust issues
        'intimacy_comfort': 0.8,        // Secondary: avoiding intimacy
        // Personality type
        'introversion': 0.4,
        'thinking': 0.3,
      },
      note: 'Avoidant: no self-disclosure even with close ones',
    ),

    // ========================================================================
    // FEARFUL-AVOIDANT ATTACHMENT (q4, q8, q12, q16, q20, q24, q28, q32, q36, q40)
    // ========================================================================

    // Q4: "Я хочу быть близким с партнёром, но боюсь, что меня снова ранят"
    'attachment_style_v1:q4': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q4',
      axisWeights: {
        'intimacy_comfort': 1.0,          // Primary: intimacy fear
        'anxiety': 1.0, // Primary: push-pull pattern
        'vulnerability': 0.9,          // High: past trauma
        'vulnerability_sharing': 0.9,   // High: fear of hurt
        'trust_in_relationships': -0.9,   // Reversed: trust issues
        'avoidant_attachment': 1.0,      // Primary: wanting yet fearing
      },
      note: 'Fearful-Avoidant: wanting closeness but fearing hurt',
    ),

    // Q8: "Я одновременно жажду близости и боюсь её"
    'attachment_style_v1:q8': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q8',
      axisWeights: {
        'anxiety': 1.0, // Primary: core fearful-avoidant marker
        'avoidant_attachment': 1.0,      // Primary: simultaneous craving and fear
        'intimacy_comfort': 1.0,          // Primary: intimacy fear
        'self_awareness': 0.9,       // High: conflicted feelings
        'anxiety': 0.8,                   // Secondary: anxiety
        'intimacy_comfort': 0.8,        // Secondary: avoidance
      },
      note: 'Fearful-Avoidant: core marker of style',
    ),

    // Q12: "Я часто сомневаюсь, стоит ли мне вообще быть в отношениях"
    'attachment_style_v1:q12': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q12',
      axisWeights: {
        'anxiety': 1.0,  // Primary: ambivalence
        'anxiety': 0.9, // High: push-pull
        'self_esteem': 0.9,                // High: doubting self
        'self_awareness': 0.8,       // Secondary: confusion
        'intimacy_comfort': 0.7,          // Secondary: intimacy fear
        'avoidant_attachment': 0.7,      // Secondary: avoiding commitment
      },
      note: 'Fearful-Avoidant: relationship ambivalence',
    ),

    // Q16: "Я часто притягиваюсь к людям, а затем отталкиваю их"
    'attachment_style_v1:q16': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q16',
      axisWeights: {
        'anxiety': 1.0, // Primary: push-pull behavior
        'impulsiveness': 1.0,     // Primary: sabotaging
        'intimacy_comfort': 0.9,          // High: intimacy fear
        'emotional_reactivity': 0.9,   // High: poor regulation
        'impulsiveness': 0.7,               // Secondary: impulsive actions
        'impulsiveness': 0.8,             // Secondary: self-destructive
      },
      note: 'Fearful-Avoidant: push-pull relationship pattern',
    ),

    // Q20: "Доверие другим даётся мне очень тяжело из-за прошлого опыта"
    'attachment_style_v1:q20': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q20',
      axisWeights: {
        'trust_in_relationships': -1.0,   // Reversed: deep trust issues
        'vulnerability': 1.0,          // Primary: past trauma
        'vulnerability': 1.0,             // Primary: trauma effects
        'trust': 0.8,                  // Secondary: suspicious
        'intimacy_comfort': 0.8,          // Secondary: intimacy fear
        'worry_tendency': 0.7,            // Secondary: monitoring
      },
      note: 'Fearful-Avoidant: trauma-based trust issues',
    ),

    // Q24: "Когда кто-то становится слишком близким, я чувствую желание дистанцироваться"
    'attachment_style_v1:q24': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q24',
      axisWeights: {
        'intimacy_comfort': 1.0,          // Primary: intimacy triggers distance
        'anxiety': 1.0, // Primary: push-pull
        'emotional_openness': 0.9,        // High: creating distance
        'vulnerability_sharing': 0.9,   // High: avoiding vulnerability
        'intimacy_comfort': 0.8,        // Secondary: avoiding closeness
        'anxiety': 0.7,                   // Secondary: anxiety response
      },
      note: 'Fearful-Avoidant: closeness triggers distancing',
    ),

    // Q28: "Мне трудно понять, чего я на самом деле хочу от отношений"
    'attachment_style_v1:q28': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q28',
      axisWeights: {
        'self_awareness': 1.0,       // Primary: confusion about needs
        'self_awareness': -0.9,           // Reversed: lack of self-awareness
        'anxiety': 0.9, // High: conflicting desires
        'anxiety': 0.8,  // Secondary: ambivalence
        'emotional_intelligence': -0.8,        // Reversed: lack of clarity
        'decisiveness': 0.7,            // Secondary: difficulty deciding
      },
      note: 'Fearful-Avoidant: confusion about relationship needs',
    ),

    // Q32: "У меня есть глубокий страх быть покинутым, но я также боюсь слишком сильной зависимости"
    'attachment_style_v1:q32': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q32',
      axisWeights: {
        'fear_of_abandonment': 1.0,       // Primary: abandonment fear
        'avoidant_attachment': 1.0,        // Primary: dependency fear
        'anxiety': 1.0, // Primary: core marker
        'anxiety': 0.9,                   // High: anxiety on both ends
        'self_awareness': 0.8,       // Secondary: conflicted
        'avoidant_attachment': 1.0,      // Primary: ambivalence
      },
      note: 'Fearful-Avoidant: dual fear of abandonment and dependency',
    ),

    // Q36: "Мои отношения часто характеризуются драматическими взлётами и падениями"
    'attachment_style_v1:q36': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q36',
      axisWeights: {
        'mood_stability': 1.0,  // Primary: unstable relationships
        'emotional_reactivity': 1.0,   // Primary: poor regulation
        'anxiety': 0.9, // High: push-pull creating drama
        'impulsiveness': 0.8,               // Secondary: impulsive actions
        'emotional_reactivity': 0.8,       // Secondary: intense emotions
        'emotional_reactivity': 0.9,               // High: dramatic patterns
      },
      note: 'Fearful-Avoidant: unstable, dramatic relationships',
    ),

    // Q40: "Я чувствую себя недостойным любви, но отчаянно нуждаюсь в ней"
    'attachment_style_v1:q40': const QuestionWeight(
      testId: 'attachment_style_v1',
      questionId: 'q40',
      axisWeights: {
        'self_esteem': -1.0,              // Reversed: very low self-esteem
        'anxiety': 1.0, // Primary: desperate need yet unworthiness
        'anxious_attachment': 1.0,       // Primary: desperate need
        'self_consciousness': 0.9,                     // High: feeling unworthy
        'fear_of_abandonment': 0.9,       // High: fear of losing love
        'vulnerability': 0.8,          // Secondary: deep wounds
      },
      note: 'Fearful-Avoidant: unworthiness + desperate need',
    ),
  };
}
