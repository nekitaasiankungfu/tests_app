import 'question_weight_models.dart';

/// Question weights configuration for Love Languages test
/// Maps all 30 Love Languages questions to ~195 hierarchical psychological scales
///
/// Test measures 5 love languages:
/// 1. Words of Affirmation (q1, q6, q11, q16, q21, q26)
/// 2. Quality Time (q2, q7, q12, q17, q22, q27)
/// 3. Receiving Gifts (q3, q8, q13, q18, q23, q28)
/// 4. Acts of Service (q4, q9, q14, q19, q24, q29)
/// 5. Physical Touch (q5, q10, q15, q20, q25, q30)
class LoveLanguagesWeights {
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // LANGUAGE 1: WORDS OF AFFIRMATION (q1, q6, q11, q16, q21, q26)
    // ========================================================================

    // Q1: "Когда партнёр говорит мне комплименты или хвалит меня"
    'love_languages_v1:q1': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q1',
      axisWeights: {
        'verbal_communication': 1.0,     // Primary: verbal expression
        'affection_expression': 0.9,      // High: expressing affection
        'positive_emotions': 0.7,         // Secondary: appreciation
        'warmth': 0.6,                    // Secondary: warmth in relations
        'emotional_openness': 0.5,        // Tertiary: openness
        // Personality type
        'extraversion': 0.3,
        'feeling': 0.3,
      },
      note: 'Words of Affirmation: verbal communication + affection expression + positive emotions',
    ),

    // Q6: "Слышать 'Я люблю тебя' от партнёра"
    'love_languages_v1:q6': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q6',
      axisWeights: {
        'verbal_communication': 1.0,     // Primary: verbal love expression
        'affection_expression': 1.0,      // Primary: affection need
        'emotional_intimacy': 0.8,        // High: emotional closeness
        'relationship_security': 0.7,     // Secondary: reassurance
        'trust_in_relationships': 0.6,    // Secondary: trust
        // Personality type
        'feeling': 0.4,
      },
      note: 'Verbal love expression + emotional intimacy + affection needs',
    ),

    // Q11: "Получать записки или сообщения с тёплыми словами от партнёра"
    'love_languages_v1:q11': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q11',
      axisWeights: {
        'verbal_communication': 0.9,      // Primary: written communication
        'affection_expression': 0.9,       // Primary: affection
        'relationship_security': 0.6,      // Secondary: reassurance
        'emotional_openness': 0.6,         // Secondary: openness to emotions
        'positive_emotions': 0.5,          // Tertiary: positive feelings
        // Personality type
        'feeling': 0.3,
      },
      note: 'Written communication + affection + emotional connection',
    ),

    // Q16: "Когда партнёр говорит мне, что гордится мной"
    'love_languages_v1:q16': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q16',
      axisWeights: {
        'verbal_communication': 1.0,       // Primary: verbal recognition
        'self_esteem': 0.8,                // High: esteem through recognition
        'achievement_motivation': 0.7,     // Secondary: recognition of achievement
        'affection_expression': 0.7,        // Secondary: affection
        'support_giving': 0.6,              // Tertiary: feeling supported
        // Personality type
        'feeling': 0.3,
      },
      note: 'Verbal recognition + self-esteem + achievement validation',
    ),

    // Q21: "Когда партнёр публично выражает благодарность или признательность мне"
    'love_languages_v1:q21': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q21',
      axisWeights: {
        'verbal_communication': 1.0,       // Primary: public verbal expression
        'social_confidence': 0.7,          // Secondary: public recognition
        'self_esteem': 0.7,                // Secondary: esteem from recognition
        'affection_expression': 0.6,        // Secondary: public affection
        'relationship_security': 0.5,       // Tertiary: validation
        // Personality type
        'extraversion': 0.4,
        'feeling': 0.3,
      },
      note: 'Public verbal recognition + social confidence + relationship validation',
    ),

    // Q26: "Когда партнёр поддерживает меня словами в трудных ситуациях"
    'love_languages_v1:q26': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q26',
      axisWeights: {
        'verbal_communication': 1.0,       // Primary: verbal support
        'support_giving': 0.9,              // High: emotional support
        'emotional_intelligence': 0.7,      // Secondary: understanding emotions
        'empathy': 0.7,                     // Secondary: empathic response
        'trust_in_relationships': 0.6,      // Tertiary: trust for support
        // Personality type
        'feeling': 0.4,
      },
      note: 'Verbal support + empathy + emotional intelligence',
    ),

    // ========================================================================
    // LANGUAGE 2: QUALITY TIME (q2, q7, q12, q17, q22, q27)
    // ========================================================================

    // Q2: "Когда партнёр откладывает всё в сторону, чтобы провести время со мной"
    'love_languages_v1:q2': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q2',
      axisWeights: {
        'relationship_security': 1.0,      // Primary: undivided attention
        'intimacy_comfort': 0.9,            // High: closeness through time
        'relatedness_need': 0.8,            // High: need for connection
        'emotional_intimacy': 0.7,          // Secondary: emotional closeness
        'affection_expression': 0.6,         // Secondary: showing care
        // Personality type
        'feeling': 0.3,
      },
      note: 'Undivided attention + intimacy + connection need',
    ),

    // Q7: "Когда партнёр активно слушает меня без отвлечений"
    'love_languages_v1:q7': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q7',
      axisWeights: {
        'active_listening': 1.0,            // Primary: listening skill
        'communication_quality': 0.9,       // High: quality communication
        'emotional_intelligence': 0.7,      // Secondary: understanding
        'intimacy_comfort': 0.7,             // Secondary: closeness
        'trust_in_relationships': 0.6,       // Tertiary: showing respect (respect replacement)
        // Personality type
        'feeling': 0.3,
      },
      note: 'Active listening + communication quality + emotional understanding',
    ),

    // Q12: "Когда мы с партнёром занимаемся чем-то вместе, что нравится нам обоим"
    'love_languages_v1:q12': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q12',
      axisWeights: {
        'shared_goals': 0.9,                // High: shared activities
        'intimacy_comfort': 0.8,             // High: togetherness comfort
        'playfulness': 0.7,                  // Secondary: enjoying together
        'relationship_security': 0.6,        // Secondary: bonding
        'positive_emotions': 0.6,            // Secondary: joy together
        // Personality type
        'extraversion': 0.3,
      },
      note: 'Shared activities + playfulness + bonding',
    ),

    // Q17: "Когда партнёр планирует особенное свидание или время для нас двоих"
    'love_languages_v1:q17': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q17',
      axisWeights: {
        'relationship_security': 1.0,       // Primary: prioritizing relationship
        'commitment': 0.9,                   // High: commitment demonstration
        'passion_vitality': 0.8,             // High: romantic gesture (romance replacement)
        'intimacy_comfort': 0.7,              // Secondary: closeness
        'affection_expression': 0.6,          // Secondary: showing care
        // Personality type
        'feeling': 0.3,
        'judging': 0.2,                       // Planning
      },
      note: 'Relationship priority + commitment + passion/romance',
    ),

    // Q22: "Когда партнёр откладывает телефон и даёт мне безраздельное внимание"
    'love_languages_v1:q22': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q22',
      axisWeights: {
        'attention_control': 0.9,            // High: focused attention
        'relationship_security': 0.9,        // High: prioritizing partner
        'intimacy_comfort': 0.7,              // Secondary: closeness
        'communication_quality': 0.6,         // Secondary: quality interaction
        'trust_in_relationships': 0.6,        // Tertiary: showing respect (respect replacement)
        // Personality type
        'feeling': 0.3,
      },
      note: 'Focused attention + relationship priority + trust/respect',
    ),

    // Q27: "Когда мы с партнёром ведём глубокие, значимые разговоры"
    'love_languages_v1:q27': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q27',
      axisWeights: {
        'communication_quality': 1.0,        // Primary: deep communication
        'emotional_intimacy': 0.9,            // High: emotional depth
        'vulnerability_sharing': 0.8,         // High: opening up
        'intellectual_curiosity': 0.6,        // Secondary: depth of thought
        'emotional_intelligence': 0.6,        // Secondary: understanding
        // Personality type
        'feeling': 0.4,
        'intuition': 0.3,                     // Deep thinking
      },
      note: 'Deep communication + emotional intimacy + vulnerability',
    ),

    // ========================================================================
    // LANGUAGE 3: RECEIVING GIFTS (q3, q8, q13, q18, q23, q28)
    // ========================================================================

    // Q3: "Когда партнёр дарит мне подарки или сюрпризы"
    'love_languages_v1:q3': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q3',
      axisWeights: {
        'affection_expression': 0.9,          // High: symbolic affection
        'relationship_security': 0.7,         // Secondary: feeling valued
        'positive_emotions': 0.6,             // Secondary: joy
        'empathy': 0.6,                       // Tertiary: being thought of (thoughtfulness replacement)
        'spontaneity': 0.5,                   // Tertiary: surprise element
      },
      note: 'Symbolic affection + feeling valued + thoughtfulness',
    ),

    // Q8: "Когда партнёр запоминает важные для меня даты и дарит подарки"
    'love_languages_v1:q8': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q8',
      axisWeights: {
        'empathy': 0.9,                       // High: remembering (thoughtfulness replacement)
        'affection_expression': 0.8,           // High: showing care
        'diligence': 0.7,                      // Secondary: noticing details
        'relationship_security': 0.6,          // Secondary: feeling important
        'commitment': 0.5,                     // Tertiary: long-term care
      },
      note: 'Thoughtfulness + attention to detail + symbolic care',
    ),

    // Q13: "Когда партнёр приносит мне что-то, что показывает, что он думал обо мне"
    'love_languages_v1:q13': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q13',
      axisWeights: {
        'empathy': 1.0,                        // Primary: being thought of (thoughtfulness replacement)
        'affection_expression': 0.8,            // High: symbolic love
        'emotional_intelligence': 0.6,          // Secondary: understanding needs
        'relationship_security': 0.6,           // Secondary: feeling valued
        'compassion': 0.5,                      // Tertiary: knowing partner
      },
      note: 'Empathy (thoughtfulness) + emotional intelligence + feeling valued',
    ),

    // Q18: "Когда партнёр дарит мне подарок без повода"
    'love_languages_v1:q18': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q18',
      axisWeights: {
        'spontaneity': 0.9,                     // High: spontaneous affection
        'affection_expression': 0.9,             // High: showing love
        'playfulness': 0.6,                      // Secondary: fun surprise
        'relationship_security': 0.6,            // Secondary: feeling loved
        'positive_emotions': 0.5,                // Tertiary: joy
      },
      note: 'Spontaneity + affection + playfulness',
    ),

    // Q23: "Видеть, что партнёр хранит подарки, которые я ему дарил(а)"
    'love_languages_v1:q23': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q23',
      axisWeights: {
        'relationship_security': 0.9,           // High: valuing relationship
        'commitment': 0.8,                       // High: treasuring symbols
        'emotional_intimacy': 0.7,               // Secondary: sentimental value (sentimentality replacement)
        'loyalty': 0.6,                          // Secondary: loyalty signal
        'affection_expression': 0.5,              // Tertiary: reciprocal care
      },
      note: 'Relationship value + commitment + emotional intimacy (sentimentality)',
    ),

    // Q28: "Когда партнёр покупает мне что-то, что я давно хотел(а)"
    'love_languages_v1:q28': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q28',
      axisWeights: {
        'empathy': 1.0,                          // Primary: knowing desires (thoughtfulness replacement)
        'affection_expression': 0.8,              // High: showing care
        'emotional_intelligence': 0.7,            // Secondary: understanding wants
        'active_listening': 0.6,                  // Secondary: listening to wishes
        'relationship_security': 0.6,             // Secondary: feeling valued
      },
      note: 'Empathy (thoughtfulness) + emotional intelligence + active listening',
    ),

    // ========================================================================
    // LANGUAGE 4: ACTS OF SERVICE (q4, q9, q14, q19, q24, q29)
    // ========================================================================

    // Q4: "Когда партнёр помогает мне с делами или задачами"
    'love_languages_v1:q4': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q4',
      axisWeights: {
        'support_giving': 1.0,                   // Primary: practical support
        'cooperativeness': 0.8,                  // High: cooperation
        'altruism': 0.8,                         // High: helping behavior (helpfulness replacement)
        'compassion': 0.6,                       // Secondary: selflessness
        'relationship_security': 0.5,            // Tertiary: feeling cared for
        // Personality type
        'feeling': 0.2,
      },
      note: 'Practical support + cooperation + altruism (helpfulness)',
    ),

    // Q9: "Когда партнёр делает что-то, чтобы облегчить мою жизнь"
    'love_languages_v1:q9': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q9',
      axisWeights: {
        'support_giving': 1.0,                   // Primary: life support
        'empathy': 0.8,                          // High: understanding burden
        'emotional_intelligence': 0.7,           // Secondary: noticing needs (thoughtfulness replacement)
        'altruism': 0.7,                         // Secondary: selfless acts
        'compassion': 0.6,                       // Tertiary: caring action
        // Personality type
        'feeling': 0.3,
      },
      note: 'Support + empathy + emotional intelligence (thoughtfulness)',
    ),

    // Q14: "Когда партнёр берёт на себя задачи, которые я не люблю"
    'love_languages_v1:q14': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q14',
      axisWeights: {
        'support_giving': 1.0,                   // Primary: taking on burden
        'altruism': 0.9,                         // High: selfless sacrifice
        'empathy': 0.7,                          // Secondary: understanding dislike
        'relationship_security': 0.6,            // Secondary: feeling cared for
        'emotional_intelligence': 0.6,           // Tertiary: noticing preferences (thoughtfulness replacement)
      },
      note: 'Burden-taking + altruism + empathy',
    ),

    // Q19: "Когда партнёр готовит для меня еду"
    'love_languages_v1:q19': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q19',
      axisWeights: {
        'support_giving': 0.9,                   // High: nurturing support
        'tender_mindedness': 0.9,                // High: care-giving (nurturance replacement)
        'affection_expression': 0.6,              // Secondary: showing love
        'empathy': 0.6,                          // Secondary: planning care (thoughtfulness replacement)
        'warmth': 0.5,                            // Tertiary: warmth
      },
      note: 'Nurturing support + tender-mindedness (care-giving) + affection',
    ),

    // Q24: "Когда партнёр делает что-то практичное, чтобы помочь мне"
    'love_languages_v1:q24': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q24',
      axisWeights: {
        'support_giving': 1.0,                   // Primary: practical help
        'problem_solving': 0.7,                  // Secondary: solving issues
        'reliability_partnership': 0.7,          // Secondary: reliable support
        'cooperativeness': 0.6,                  // Tertiary: teamwork
        'dependability': 0.6,                    // Tertiary: can count on
      },
      note: 'Practical help + problem-solving + reliability',
    ),

    // Q29: "Когда партнёр замечает, что нужно сделать, и делает это без напоминания"
    'love_languages_v1:q29': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q29',
      axisWeights: {
        'empathy': 1.0,                          // Primary: noticing needs (thoughtfulness replacement)
        'support_giving': 0.9,                   // High: proactive support
        'emotional_intelligence': 0.7,           // Secondary: understanding needs
        'responsibility': 0.7,                   // Secondary: taking initiative (initiative replacement)
        'dependability': 0.6,                    // Tertiary: ownership
      },
      note: 'Empathy (thoughtfulness) + proactive support + responsibility (initiative)',
    ),

    // ========================================================================
    // LANGUAGE 5: PHYSICAL TOUCH (q5, q10, q15, q20, q25, q30)
    // ========================================================================

    // Q5: "Когда партнёр обнимает меня или прикасается ко мне"
    'love_languages_v1:q5': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q5',
      axisWeights: {
        'physical_intimacy': 1.0,                // Primary: physical connection
        'affection_expression': 0.9,              // High: physical affection
        'intimacy_comfort': 0.7,                  // Secondary: comfort with closeness
        'warmth': 0.6,                            // Secondary: warmth
        'relationship_security': 0.5,             // Tertiary: feeling loved
        // Personality type
        'feeling': 0.3,
      },
      note: 'Physical connection + affection + intimacy comfort',
    ),

    // Q10: "Когда партнёр держит меня за руку на публике"
    'love_languages_v1:q10': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q10',
      axisWeights: {
        'physical_intimacy': 1.0,                 // Primary: public physical contact
        'affection_expression': 0.8,               // High: public affection
        'relationship_security': 0.7,              // Secondary: pride in relationship
        'social_confidence': 0.6,                  // Secondary: public display comfort
        'commitment': 0.5,                         // Tertiary: public commitment
        // Personality type
        'extraversion': 0.3,
      },
      note: 'Public physical touch + affection + relationship pride',
    ),

    // Q15: "Когда партнёр обнимает меня после тяжёлого дня"
    'love_languages_v1:q15': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q15',
      axisWeights: {
        'physical_intimacy': 1.0,                  // Primary: comforting touch
        'support_giving': 0.9,                     // High: emotional support through touch
        'empathy': 0.7,                            // Secondary: understanding distress
        'emotional_intelligence': 0.6,             // Secondary: recognizing need
        'affection_expression': 0.6,                // Tertiary: showing care
        // Personality type
        'feeling': 0.3,
      },
      note: 'Comforting touch + emotional support + empathy',
    ),

    // Q20: "Когда партнёр делает мне массаж"
    'love_languages_v1:q20': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q20',
      axisWeights: {
        'physical_intimacy': 1.0,                  // Primary: physical care
        'support_giving': 0.8,                     // High: nurturing support
        'tender_mindedness': 0.7,                  // Secondary: care-giving (nurturance replacement)
        'affection_expression': 0.7,                // Secondary: showing love
        'empathy': 0.5,                            // Tertiary: attention to needs (thoughtfulness replacement)
      },
      note: 'Physical care + tender-mindedness (nurturing) + affection',
    ),

    // Q25: "Когда партнёр сидит рядом со мной на диване и касается меня"
    'love_languages_v1:q25': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q25',
      axisWeights: {
        'physical_intimacy': 1.0,                  // Primary: casual physical closeness
        'intimacy_comfort': 0.8,                   // High: comfort with proximity
        'affection_expression': 0.6,                // Secondary: subtle affection
        'relationship_security': 0.6,               // Secondary: comfortable together
        'warmth': 0.5,                              // Tertiary: warmth
      },
      note: 'Casual physical closeness + intimacy comfort + warmth',
    ),

    // Q30: "Когда партнёр целует меня спонтанно"
    'love_languages_v1:q30': const QuestionWeight(
      testId: 'love_languages_v1',
      questionId: 'q30',
      axisWeights: {
        'physical_intimacy': 1.0,                  // Primary: spontaneous physical affection
        'spontaneity': 0.9,                        // High: spontaneous expression
        'affection_expression': 0.9,                // High: showing love
        'passion_vitality': 0.7,                    // Secondary: passion
        'playfulness': 0.6,                         // Secondary: playful affection
        // Personality type
        'feeling': 0.3,
      },
      note: 'Spontaneous physical affection + passion + playfulness',
    ),
  };
}
