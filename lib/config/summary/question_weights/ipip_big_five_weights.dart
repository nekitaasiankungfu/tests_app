import 'question_weight_models.dart';

/// Question weights configuration for IPIP Big Five test
/// Maps 50 questions to ~196 hierarchical psychological scales
class IPIPBigFiveWeights {
  /// IPIP BIG FIVE - 50 Questions
  ///
  /// This analysis uses the hierarchical scale system (196 detailed subscales)
  /// Each question maps to 3-10 axes with psychometric rationale
  /// Weight categories: Primary (0.8-1.0), Secondary (0.4-0.7), Tertiary (0.2-0.3)
  static const Map<String, QuestionWeight> weights = {    'ipip_big_five:q1': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q1',
      axisWeights: {'gregariousness': 1.0,           // Primary: Social gathering dominance
        'warmth': 0.8,                   // High: Friendly party engagement
        'positive_emotions': 0.8,        // High: Joy/enthusiasm in social context
        'social_confidence': 0.7,        // High: Comfort being center of attention
        'liveliness': 0.7,               // Secondary: Energetic presence
        'social_boldness': 0.6,          // Secondary: Assertive social behavior
        'expressiveness': 0.5,           // Secondary: Outward emotional display
        'intrinsic_motivation': 0.4,     // Moderate: Social energy drive
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.2,
      },
      note: 'Extraversion core: gregariousness + warmth + positive affect + confidence + energy',
    ),

    // Q2: "I feel little concern for others" (Agreeableness, reversed)
    // Lack of concern = low empathy, compassion deficiency, reduced social interest
    'ipip_big_five:q2': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q2',
      axisWeights: {'empathy': 1.0,                  // Primary: Perspective-taking deficiency
        'compassion': 0.9,               // Primary: Lack of caring response
        'tender_mindedness': 0.8,        // High: Emotional hardness
        'emotional_intelligence': 0.6,   // Secondary: Reduced other-awareness
        'trust': 0.5,                    // Secondary: Cynical disconnection
        'altruism': 0.5,                 // Secondary: Selfishness
        'callousness': 0.4,              // Moderate: Dark triad overlap
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
        'thinking': 0.3,
      },
      note: 'Agreeableness deficit: no empathy/compassion + emotional hardness + selfishness',
    ),

    // Q3: "I am always prepared" (Conscientiousness)
    // Preparation = organization, responsibility, proactive planning, achievement orientation
    'ipip_big_five:q3': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q3',
      axisWeights: {'organization': 1.0,             // Primary: Planning/preparedness
        'responsibility': 0.8,           // High: Reliable readiness
        'self_discipline': 0.7,          // High: Consistent preparation habit
        'achievement_striving': 0.6,     // Secondary: Preparedness for success
        'deliberation': 0.6,             // Secondary: Thoughtful anticipation
        'competence': 0.5,               // Secondary: Task readiness
        'achievement_motivation': 0.4,   // Moderate: Motivational drive
        // MBTI personality type scales
        'extraversion': 0.4,
        'judging': 0.4,
      },
      note: 'Conscientiousness: organization + responsibility + discipline + achievement',
    ),

    // Q4: "I get stressed out easily" (Emotional Stability, reversed)
    // Stress vulnerability = anxiety, low stress tolerance, emotional reactivity
    'ipip_big_five:q4': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q4',
      axisWeights: {'stress_tolerance': 1.0,         // Primary: Direct stress vulnerability (reversed)
        'anxiety': 0.9,                  // Primary: High anxiety tendency
        'emotional_resilience': 0.8,     // High: Low resilience (reversed)
        'calmness': 0.8,                 // High: Opposite of calm (reversed)
        'emotional_reactivity': 0.7,     // Secondary: High reactivity
        'vulnerability': 0.6,            // Secondary: Stress susceptibility
        'composure': 0.5,                // Secondary: Loss of composure
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Neuroticism: stress vulnerability + anxiety + low resilience + reactivity',
    ),

    // Q5: "I have a rich vocabulary" (Intellect/Openness)
    // Rich vocabulary = verbal intelligence, intellectual curiosity, learning ability
    'ipip_big_five:q5': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q5',
      axisWeights: {'verbal_intelligence': 1.0,      // Primary: Language capacity
        'intellectual_curiosity': 0.7,   // Secondary: Learning drive
        'learning_ability': 0.6,         // Secondary: Knowledge acquisition
        'ideas': 0.5,                    // Secondary: Intellectual exploration (Openness facet)
        'verbal_communication': 0.4,     // Moderate: Communication skill
        'self_discipline': 0.3,          // Tertiary: Learning effort required
        // MBTI personality type scales
        'intuition': 0.3,
      },
      note: 'Intellect: verbal capacity + curiosity + learning + discipline',
    ),

    // Q6: "I don't talk a lot" (Extraversion, reversed)
    // Low talkativeness = low gregariousness, reduced expressiveness, social reservation
    'ipip_big_five:q6': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q6',
      axisWeights: {'gregariousness': 0.9,           // Primary: Low social verbality (reversed)
        'expressiveness': 0.8,           // High: Reduced outward expression
        'social_confidence': 0.6,        // Secondary: Possible social caution
        'warmth': 0.5,                   // Secondary: Reserved warmth
        'liveliness': 0.4,               // Moderate: Lower energy expression
        'self_consciousness': 0.3,       // Tertiary: Possible shyness
        // MBTI personality type scales
        'extraversion': 0.4,
        'introversion': 0.4,
      },
      note: 'Introversion: low gregariousness + low expressiveness + social reservation',
    ),

    // Q7: "I am interested in people" (Agreeableness)
    // Interest in people = empathy, social perception, emotional intelligence, curiosity
    'ipip_big_five:q7': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q7',
      axisWeights: {'empathy': 0.9,                  // Primary: People-focused attention
        'social_perception': 0.8,        // High: Awareness of others
        'emotional_intelligence': 0.7,   // High: Understanding people
        'curiosity': 0.6,                // Secondary: Intellectual interest in people
        'warmth': 0.5,                   // Secondary: Positive orientation
        'trust': 0.4,                    // Moderate: Openness to people
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
      },
      note: 'Agreeableness: empathy + social perception + emotional intelligence + curiosity',
    ),

    // Q8: "I leave my belongings around" (Conscientiousness, reversed)
    // Leaving belongings = disorganization, lack of order, poor self-discipline
    'ipip_big_five:q8': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q8',
      axisWeights: {'order': 1.0,                    // Primary: Physical disorganization (reversed)
        'organization': 0.9,             // Primary: General organizational deficit
        'self_discipline': 0.6,          // Secondary: Lack of tidying discipline
        'responsibility': 0.4,           // Moderate: Carelessness with property
        // MBTI personality type scales
        'judging': 0.4,
        'perceiving': 0.3,
      },
      note: 'Conscientiousness deficit: no order + disorganization + low discipline',
    ),

    // Q9: "I am relaxed most of the time" (Emotional Stability)
    // Being relaxed = calmness, stress tolerance, emotional resilience
    'ipip_big_five:q9': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q9',
      axisWeights: {'calmness': 1.0,                 // Primary: Direct calmness indicator
        'stress_tolerance': 0.9,         // Primary: Resilience to stress
        'emotional_resilience': 0.8,     // High: Emotional stability
        'composure': 0.7,                // Secondary: Maintained equilibrium
        'anxiety': 0.6,                  // Secondary: Low anxiety (reversed)
        'mood_stability': 0.5,           // Secondary: Stable baseline mood
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Emotional stability: calmness + stress tolerance + resilience + composure',
    ),

    // Q10: "I have difficulty understanding abstract ideas" (Intellect, reversed)
    // Abstract difficulty = low abstract reasoning, concrete thinking preference
    'ipip_big_five:q10': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q10',
      axisWeights: {'abstract_reasoning': 1.0,       // Primary: Abstract thinking deficit (reversed)
        'intellectual_curiosity': 0.7,   // Secondary: Low intellectual exploration (reversed)
        'cognitive_flexibility': 0.6,    // Secondary: Rigid thinking style
        'ideas': 0.5,                    // Secondary: Low Openness facet (reversed)
        'learning_ability': 0.4,         // Moderate: Difficulty with complex concepts
        // MBTI personality type scales
        'intuition': 0.4,
        'sensing': 0.4,
      },
      note: 'Intellect deficit: low abstract reasoning + low curiosity + cognitive rigidity',
    ),

    // Q11: "I feel comfortable around people" (Extraversion)
    // Social comfort = social confidence, warmth, low social anxiety
    'ipip_big_five:q11': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q11',
      axisWeights: {'social_confidence': 1.0,        // Primary: Comfort in social settings
        'warmth': 0.8,                   // High: Approachability/ease with others
        'social_boldness': 0.7,          // Secondary: Lack of social inhibition
        'gregariousness': 0.6,           // Secondary: Enjoy being with people
        'self_consciousness': 0.5,       // Secondary: Low social anxiety (reversed)
        'positive_emotions': 0.4,        // Moderate: Positive social affect
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.2,
      },
      note: 'Extraversion: social confidence + warmth + boldness + gregariousness',
    ),

    // Q12: "I insult people" (Agreeableness, reversed)
    // Insulting = low politeness, antagonism, low empathy, callousness
    'ipip_big_five:q12': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q12',
      axisWeights: {'politeness': 1.0,               // Primary: Rude/offensive behavior (reversed)
        'empathy': 0.9,                  // Primary: Lack of empathy (reversed)
        'compassion': 0.8,               // High: Lack of caring (reversed)
        'callousness': 0.7,              // Secondary: Dark triad trait
        'straightforwardness': 0.5,      // Secondary: Brutal honesty/aggression
        'anger': 0.4,                    // Moderate: Aggressive tendency
        'impulsiveness': 0.3,            // Tertiary: Lack of restraint
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
        'thinking': 0.3,
      },
      note: 'Agreeableness deficit: rudeness + no empathy + callousness + anger',
    ),

    // Q13: "I pay attention to details" (Conscientiousness)
    // Detail attention = competence, perfectionism, diligence, attention control
    'ipip_big_five:q13': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q13',
      axisWeights: {'competence': 1.0,               // Primary: Task thoroughness
        'perfectionism': 0.8,            // High: High standards
        'diligence': 0.7,                // Secondary: Careful work
        'attention_control': 0.7,        // Secondary: Focused attention
        'dutifulness': 0.5,              // Secondary: Responsible completion
        'critical_thinking': 0.4,        // Moderate: Analytical scrutiny
        // MBTI personality type scales
        'sensing': 0.4,
      },
      note: 'Conscientiousness: competence + perfectionism + diligence + attention control',
    ),

    // Q14: "I worry about things" (Emotional Stability, reversed)
    // Worrying = anxiety, worry tendency, rumination, low calmness
    'ipip_big_five:q14': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q14',
      axisWeights: {'worry_tendency': 1.0,           // Primary: Chronic worry
        'anxiety': 0.9,                  // Primary: Anxious temperament
        'rumination': 0.8,               // High: Mental preoccupation
        'calmness': 0.7,                 // Secondary: Lack of calmness (reversed)
        'stress_tolerance': 0.6,         // Secondary: Low stress resilience (reversed)
        'catastrophizing': 0.5,          // Secondary: Negative thinking pattern
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Neuroticism: worry + anxiety + rumination + low calmness',
    ),

    // Q15: "I have a vivid imagination" (Intellect/Openness)
    // Vivid imagination = fantasy, creativity, originality, divergent thinking
    'ipip_big_five:q15': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q15',
      axisWeights: {'fantasy': 1.0,                  // Primary: Imaginative capacity (Openness facet)
        'originality': 0.8,              // High: Creative novelty
        'divergent_thinking': 0.7,       // Secondary: Generative ideation
        'creativity': 0.7,               // Secondary: Creative personality
        'feelings': 0.5,                 // Secondary: Rich inner emotional life (Openness facet)
        'artistic_appreciation': 0.4,    // Moderate: Aesthetic sensitivity
        // MBTI personality type scales
        'intuition': 0.4,
      },
      note: 'Openness: fantasy + originality + divergent thinking + creativity',
    ),

    // Q16: "I keep in the background" (Extraversion, reversed)
    // Keeping background = low dominance, low assertiveness, social withdrawal
    'ipip_big_five:q16': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q16',
      axisWeights: {'dominance': 1.0,                // Primary: Low social dominance (reversed)
        'assertiveness': 0.9,            // Primary: Low assertiveness (reversed)
        'social_boldness': 0.8,          // High: Social inhibition (reversed)
        'gregariousness': 0.6,           // Secondary: Avoidance of groups (reversed)
        'liveliness': 0.5,               // Secondary: Low social energy (reversed)
        'self_consciousness': 0.4,       // Moderate: Possible shyness
        // MBTI personality type scales
        'extraversion': 0.4,
      },
      note: 'Introversion: low dominance + low assertiveness + social withdrawal',
    ),

    // Q17: "I sympathize with others' feelings" (Agreeableness)
    // Sympathy = empathy, compassion, emotional intelligence, tender-mindedness
    'ipip_big_five:q17': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q17',
      axisWeights: {'empathy': 1.0,                  // Primary: Perspective-taking
        'compassion': 0.9,               // Primary: Caring response
        'tender_mindedness': 0.8,        // High: Emotional sensitivity
        'emotional_intelligence': 0.7,   // Secondary: Emotional awareness
        'social_perception': 0.6,        // Secondary: Reading others' states
        'warmth': 0.5,                   // Secondary: Positive orientation
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Agreeableness: empathy + compassion + tender-mindedness + EI',
    ),

    // Q18: "I make a mess of things" (Conscientiousness, reversed)
    // Making mess = disorganization, low competence, carelessness
    'ipip_big_five:q18': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q18',
      axisWeights: {
        'organization': 1.0,             // Primary: Disorganization (reversed)
        'competence': 0.8,               // High: Low task effectiveness (reversed)
        'order': 0.7,                    // Secondary: Messiness (reversed)
        'self_discipline': 0.6,          // Secondary: Lack of discipline (reversed)
        'attention_control': 0.4,        // Moderate: Poor focus (reversed)
      },
      note: 'Conscientiousness deficit: disorganization + low competence + messiness',
    ),

    // Q19: "I seldom feel blue" (Emotional Stability)
    // Seldom blue = low depression, positive mood, emotional resilience
    'ipip_big_five:q19': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q19',
      axisWeights: {'depression': 1.0,               // Primary: Low depressive tendency (reversed)
        'mood_stability': 0.9,           // Primary: Stable positive mood
        'positive_emotions': 0.8,        // High: Positive affectivity
        'emotional_resilience': 0.7,     // Secondary: Bounce-back from sadness
        'happiness': 0.6,                // Secondary: Baseline happiness
        'vitality': 0.5,                 // Secondary: Life energy
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Emotional stability: no depression + mood stability + positive emotions',
    ),

    // Q20: "I am not interested in abstract ideas" (Intellect, reversed)
    // No abstract interest = low intellectual curiosity, concrete thinking
    'ipip_big_five:q20': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q20',
      axisWeights: {'intellectual_curiosity': 1.0,   // Primary: Low intellectual exploration (reversed)
        'ideas': 0.9,                    // Primary: Closed to ideas (Openness facet, reversed)
        'abstract_reasoning': 0.7,       // Secondary: Preference for concrete (reversed)
        'cognitive_flexibility': 0.5,    // Secondary: Intellectual rigidity (reversed)
        'learning_ability': 0.4,         // Moderate: Low learning motivation (reversed)
        // MBTI personality type scales
        'intuition': 0.4,
        'sensing': 0.4,
      },
      note: 'Openness deficit: low curiosity + closed to ideas + concrete preference',
    ),

    // Q21: "I start conversations" (Extraversion)
    // Starting conversations = assertiveness, social boldness, gregariousness
    'ipip_big_five:q21': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q21',
      axisWeights: {'assertiveness': 1.0,            // Primary: Social initiative
        'social_boldness': 0.9,          // Primary: Conversational confidence
        'gregariousness': 0.8,           // High: Social engagement drive
        'warmth': 0.6,                   // Secondary: Friendly approach
        'social_confidence': 0.6,        // Secondary: Comfort initiating
        'expressiveness': 0.5,           // Secondary: Verbal openness
        'liveliness': 0.4,               // Moderate: Social energy
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.2,
      },
      note: 'Extraversion: assertiveness + social boldness + gregariousness + warmth',
    ),

    // Q22: "I am not interested in other people's problems" (Agreeableness, reversed)
    // No interest in others = low empathy, selfishness, callousness
    'ipip_big_five:q22': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q22',
      axisWeights: {'empathy': 1.0,                  // Primary: Lack of empathy (reversed)
        'compassion': 0.9,               // Primary: No compassion (reversed)
        'altruism': 0.8,                 // High: Selfishness (reversed)
        'social_perception': 0.6,        // Secondary: Low other-awareness (reversed)
        'callousness': 0.5,              // Secondary: Emotional coldness
        'support_giving': 0.4,           // Moderate: No helping (reversed)
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
      },
      note: 'Agreeableness deficit: no empathy + no compassion + selfishness + callousness',
    ),

    // Q23: "I get chores done right away" (Conscientiousness)
    // Immediate chore completion = self-discipline, anti-procrastination, responsibility
    'ipip_big_five:q23': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q23',
      axisWeights: {
        'self_discipline': 1.0,          // Primary: Anti-procrastination
        'responsibility': 0.8,           // High: Reliable task completion
        'dutifulness': 0.7,              // Secondary: Sense of duty
        'achievement_motivation': 0.5,   // Secondary: Task completion drive
        'deliberation': 0.4,             // Moderate: Planned vs reactive action
      },
      note: 'Conscientiousness: self-discipline + responsibility + dutifulness + motivation',
    ),

    // Q24: "I am easily disturbed" (Emotional Stability, reversed)
    // Easily disturbed = emotional reactivity, vulnerability, poor stress tolerance
    'ipip_big_five:q24': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q24',
      axisWeights: {'emotional_reactivity': 1.0,     // Primary: High reactivity
        'vulnerability': 0.9,            // Primary: Sensitivity to disturbance
        'stress_tolerance': 0.8,         // High: Low tolerance (reversed)
        'composure': 0.7,                // Secondary: Loss of composure (reversed)
        'emotional_resilience': 0.6,     // Secondary: Low resilience (reversed)
        'frustration_tolerance': 0.5,    // Secondary: Low frustration tolerance (reversed)
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Neuroticism: emotional reactivity + vulnerability + low stress tolerance',
    ),

    // Q25: "I have excellent ideas" (Intellect/Openness)
    // Excellent ideas = originality, divergent thinking, intellectual confidence
    'ipip_big_five:q25': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q25',
      axisWeights: {'originality': 1.0,              // Primary: Novel idea generation
        'divergent_thinking': 0.8,       // High: Creative ideation
        'ideas': 0.8,                    // High: Openness facet - intellectual exploration
        'self_efficacy': 0.6,            // Secondary: Intellectual confidence
        'intellectual_curiosity': 0.5,   // Secondary: Active exploration
        'creativity': 0.5,               // Secondary: Creative personality
        // MBTI personality type scales
        'intuition': 0.3,
      },
      note: 'Openness: originality + divergent thinking + intellectual confidence + ideas',
    ),

    // Q26: "I have little to say" (Extraversion, reversed)
    // Little to say = low expressiveness, reserved, low verbal engagement
    'ipip_big_five:q26': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q26',
      axisWeights: {'expressiveness': 1.0,           // Primary: Low verbal expression (reversed)
        'gregariousness': 0.7,           // Secondary: Low social verbality (reversed)
        'warmth': 0.6,                   // Secondary: Reserved demeanor (reversed)
        'liveliness': 0.5,               // Secondary: Low social energy (reversed)
        'self_consciousness': 0.4,       // Moderate: Possible shyness
        // MBTI personality type scales
        'extraversion': 0.4,
        'introversion': 0.4,
      },
      note: 'Introversion: low expressiveness + reserved + low gregariousness',
    ),

    // Q27: "I have a soft heart" (Agreeableness)
    // Soft heart = tender-mindedness, compassion, empathy, emotional sensitivity
    'ipip_big_five:q27': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q27',
      axisWeights: {'tender_mindedness': 1.0,        // Primary: Emotional softness
        'compassion': 0.9,               // Primary: Caring response
        'empathy': 0.8,                  // High: Feeling for others
        'emotional_intelligence': 0.6,   // Secondary: Emotional sensitivity
        'feelings': 0.5,                 // Secondary: Emotional depth (Openness facet)
        'altruism': 0.4,                 // Moderate: Helping tendency
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Agreeableness: tender-mindedness + compassion + empathy + EI',
    ),

    // Q28: "I often forget to put things back in their proper place" (Conscientiousness, reversed)
    // Forgetting placement = disorganization, absent-mindedness, low order
    'ipip_big_five:q28': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q28',
      axisWeights: {'order': 1.0,                    // Primary: Lack of order (reversed)
        'organization': 0.9,             // Primary: Disorganization (reversed)
        'working_memory': 0.6,           // Secondary: Absent-mindedness
        'self_discipline': 0.5,          // Secondary: Low tidying discipline (reversed)
        'attention_control': 0.4,        // Moderate: Distracted from organization (reversed)
        // MBTI personality type scales
        'judging': 0.4,
      },
      note: 'Conscientiousness deficit: no order + disorganization + absent-mindedness',
    ),

    // Q29: "I get upset easily" (Emotional Stability, reversed)
    // Upset easily = emotional reactivity, anger, low composure
    'ipip_big_five:q29': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q29',
      axisWeights: {'emotional_reactivity': 1.0,     // Primary: High reactivity
        'anger': 0.8,                    // High: Quick to upset/anger
        'composure': 0.8,                // High: Low composure (reversed)
        'frustration_tolerance': 0.7,    // Secondary: Low frustration tolerance (reversed)
        'emotional_resilience': 0.6,     // Secondary: Low resilience (reversed)
        'calmness': 0.6,                 // Secondary: Lack of calmness (reversed)
        'impulsiveness': 0.4,            // Moderate: Emotional impulsivity
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Neuroticism: emotional reactivity + anger + low composure + frustration',
    ),

    // Q30: "I do not have a good imagination" (Intellect, reversed)
    // Poor imagination = low fantasy, concrete thinking, low creativity
    'ipip_big_five:q30': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q30',
      axisWeights: {'fantasy': 1.0,                  // Primary: Low imaginative capacity (reversed)
        'creativity': 0.8,               // High: Low creative thinking (reversed)
        'divergent_thinking': 0.7,       // Secondary: Low idea generation (reversed)
        'originality': 0.6,              // Secondary: Conventional thinking (reversed)
        'artistic_appreciation': 0.4,    // Moderate: Low aesthetic imagination (reversed)
        // MBTI personality type scales
        'intuition': 0.4,
        'sensing': 0.4,
      },
      note: 'Openness deficit: low fantasy + low creativity + conventional thinking',
    ),

    // Q31: "I talk to a lot of different people at parties" (Extraversion)
    // Talking to many = gregariousness, warmth, social energy, openness to people
    'ipip_big_five:q31': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q31',
      axisWeights: {'gregariousness': 1.0,           // Primary: Social breadth/engagement
        'warmth': 0.8,                   // High: Friendliness with strangers
        'liveliness': 0.7,               // Secondary: Social energy
        'social_confidence': 0.6,        // Secondary: Comfort with new people
        'curiosity': 0.5,                // Secondary: Interest in different people
        'affiliation_motivation': 0.4,   // Moderate: Social connection drive
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.2,
      },
      note: 'Extraversion: gregariousness + warmth + social energy + curiosity',
    ),

    // Q32: "I am not really interested in others" (Agreeableness, reversed)
    // Not interested = low empathy, self-focus, lack of social interest
    'ipip_big_five:q32': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q32',
      axisWeights: {'empathy': 1.0,                  // Primary: Lack of interest in others (reversed)
        'social_perception': 0.8,        // High: Low other-awareness (reversed)
        'altruism': 0.7,                 // Secondary: Self-focus (reversed)
        'compassion': 0.6,               // Secondary: Lack of caring (reversed)
        'emotional_intelligence': 0.5,   // Secondary: Low EI (reversed)
        'callousness': 0.4,              // Moderate: Emotional coldness
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
      },
      note: 'Agreeableness deficit: no empathy + self-focus + low EI + callousness',
    ),

    // Q33: "I like order" (Conscientiousness)
    // Like order = order preference, organization, structured thinking
    'ipip_big_five:q33': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q33',
      axisWeights: {'order': 1.0,                    // Primary: Preference for order
        'organization': 0.8,             // High: Organizational tendency
        'self_discipline': 0.6,          // Secondary: Discipline for orderliness
        'deliberation': 0.5,             // Secondary: Planned/structured thinking
        'perfectionism': 0.4,            // Moderate: Standards for order
        // MBTI personality type scales
        'judging': 0.4,
      },
      note: 'Conscientiousness: order + organization + discipline + structured thinking',
    ),

    // Q34: "I change my mood a lot" (Emotional Stability, reversed)
    // Mood changes = mood instability, emotional volatility, poor regulation
    'ipip_big_five:q34': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q34',
      axisWeights: {'mood_stability': 1.0,           // Primary: Mood instability (reversed)
        'emotional_reactivity': 0.9,     // Primary: High volatility
        'emotional_resilience': 0.7,     // Secondary: Low resilience (reversed)
        'composure': 0.6,                // Secondary: Loss of equilibrium (reversed)
        'impulsiveness': 0.5,            // Secondary: Impulsive mood shifts
        'depression': 0.4,               // Moderate: Mood swings may include sadness
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Neuroticism: mood instability + emotional volatility + poor regulation',
    ),

    // Q35: "I am quick to understand things" (Intellect/Openness)
    // Quick understanding = processing speed, learning ability, cognitive flexibility
    'ipip_big_five:q35': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q35',
      axisWeights: {
        'processing_speed': 1.0,         // Primary: Fast cognitive processing
        'learning_ability': 0.8,         // High: Quick learning
        'cognitive_flexibility': 0.7,    // Secondary: Mental agility
        'intelligence': 0.6,             // Secondary: General cognitive ability
        'abstract_reasoning': 0.5,       // Secondary: Conceptual grasp
        'self_efficacy': 0.4,            // Moderate: Intellectual confidence
      },
      note: 'Intellect: processing speed + learning ability + cognitive flexibility + intelligence',
    ),

    // Q36: "I don't like to draw attention to myself" (Extraversion, reversed)
    // Don't like attention = low social boldness, modesty, self-consciousness
    'ipip_big_five:q36': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q36',
      axisWeights: {'social_boldness': 1.0,          // Primary: Low attention-seeking (reversed)
        'dominance': 0.8,                // High: Low desire for prominence (reversed)
        'modesty': 0.7,                  // Secondary: Self-effacing (positive for modesty)
        'self_consciousness': 0.6,       // Secondary: Discomfort with visibility
        'assertiveness': 0.5,            // Secondary: Low self-promotion (reversed)
        // MBTI personality type scales
        'extraversion': 0.4,
        'introversion': 0.2,
      },
      note: 'Introversion: low social boldness + modesty + self-consciousness + low dominance',
    ),

    // Q37: "I take time out for others" (Agreeableness)
    // Taking time = altruism, support giving, compassion, cooperation
    'ipip_big_five:q37': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q37',
      axisWeights: {'altruism': 1.0,                 // Primary: Helping behavior
        'support_giving': 0.9,           // Primary: Practical support
        'compassion': 0.7,               // Secondary: Caring motivation
        'cooperativeness': 0.6,          // Secondary: Collaborative orientation
        'warmth': 0.5,                   // Secondary: Positive interpersonal orientation
        'self_discipline': 0.4,          // Moderate: Prioritization of others' needs
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Agreeableness: altruism + support giving + compassion + cooperation',
    ),

    // Q38: "I shirk my duties" (Conscientiousness, reversed)
    // Shirking duties = low dutifulness, irresponsibility, poor self-discipline
    'ipip_big_five:q38': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q38',
      axisWeights: {
        'dutifulness': 1.0,              // Primary: Lack of duty (reversed)
        'responsibility': 0.9,           // Primary: Irresponsibility (reversed)
        'self_discipline': 0.8,          // High: Lack of discipline (reversed)
        'achievement_motivation': 0.6,   // Secondary: Low achievement drive (reversed)
        'achievement_striving': 0.5,     // Secondary: Low striving (reversed)
      },
      note: 'Conscientiousness deficit: no dutifulness + irresponsibility + low discipline',
    ),

    // Q39: "I have frequent mood swings" (Emotional Stability, reversed)
    // Mood swings = mood instability, emotional volatility, poor regulation
    'ipip_big_five:q39': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q39',
      axisWeights: {'mood_stability': 1.0,           // Primary: High instability (reversed)
        'emotional_reactivity': 0.9,     // Primary: Extreme volatility
        'emotional_resilience': 0.8,     // High: Low resilience (reversed)
        'impulsiveness': 0.6,            // Secondary: Impulsive emotional shifts
        'composure': 0.6,                // Secondary: Loss of equilibrium (reversed)
        'depression': 0.4,               // Moderate: May include depressive swings
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Neuroticism: severe mood instability + emotional volatility + poor resilience',
    ),

    // Q40: "I use difficult words" (Intellect/Openness)
    // Difficult words = verbal intelligence, intellectual display, education
    'ipip_big_five:q40': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q40',
      axisWeights: {'verbal_intelligence': 1.0,      // Primary: Advanced vocabulary
        'verbal_communication': 0.7,     // Secondary: Sophisticated expression
        'intellectual_curiosity': 0.5,   // Secondary: Intellectual engagement
        'ideas': 0.5,                    // Secondary: Complex idea expression (Openness facet)
        'self_efficacy': 0.4,            // Moderate: Confidence in language use
        // MBTI personality type scales
        'intuition': 0.3,
      },
      note: 'Intellect: verbal intelligence + sophisticated communication + curiosity + ideas',
    ),

    // Q41: "I don't mind being the center of attention" (Extraversion)
    // Don't mind center = social boldness, dominance, social confidence
    'ipip_big_five:q41': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q41',
      axisWeights: {'social_boldness': 1.0,          // Primary: Comfort with attention
        'social_confidence': 0.9,        // Primary: Self-assurance in spotlight
        'dominance': 0.7,                // Secondary: Comfortable being prominent
        'self_consciousness': 0.7,       // Secondary: Low social anxiety (reversed)
        'assertiveness': 0.6,            // Secondary: Bold social presence
        'positive_emotions': 0.4,        // Moderate: Enjoyment of attention
        // MBTI personality type scales
        'extraversion': 0.4,
      },
      note: 'Extraversion: social boldness + social confidence + dominance + low anxiety',
    ),

    // Q42: "I feel others' emotions" (Agreeableness)
    // Feel emotions = empathy, emotional intelligence, compassion, social perception
    'ipip_big_five:q42': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q42',
      axisWeights: {'empathy': 1.0,                  // Primary: Direct empathic resonance
        'emotional_intelligence': 0.9,   // Primary: Emotional attunement
        'social_perception': 0.8,        // High: Sensitivity to others' states
        'compassion': 0.7,               // Secondary: Caring response
        'tender_mindedness': 0.6,        // Secondary: Emotional sensitivity
        'feelings': 0.5,                 // Secondary: Emotional depth (Openness facet)
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
      },
      note: 'Agreeableness: empathy + emotional intelligence + social perception + compassion',
    ),

    // Q43: "I follow a schedule" (Conscientiousness)
    // Follow schedule = organization, self-discipline, deliberation, punctuality
    'ipip_big_five:q43': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q43',
      axisWeights: {'organization': 1.0,             // Primary: Structured planning
        'self_discipline': 0.8,          // High: Adherence to plans
        'deliberation': 0.7,             // Secondary: Planned vs spontaneous
        'punctuality': 0.7,              // Secondary: Time management
        'responsibility': 0.5,           // Secondary: Reliable scheduling
        'order': 0.4,                    // Moderate: Structured lifestyle
        // MBTI personality type scales
        'judging': 0.4,
      },
      note: 'Conscientiousness: organization + self-discipline + deliberation + punctuality',
    ),

    // Q44: "I get irritated easily" (Emotional Stability, reversed)
    // Irritated easily = anger, frustration intolerance, emotional reactivity
    'ipip_big_five:q44': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q44',
      axisWeights: {'anger': 1.0,                    // Primary: High irritability
        'frustration_tolerance': 0.9,    // Primary: Low tolerance (reversed)
        'emotional_reactivity': 0.8,     // High: High reactivity
        'composure': 0.7,                // Secondary: Low composure (reversed)
        'impulsiveness': 0.5,            // Secondary: Impulsive anger
        'politeness': 0.4,               // Moderate: May affect social courtesy (reversed)
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Neuroticism: anger/irritability + low frustration tolerance + reactivity',
    ),

    // Q45: "I spend time reflecting on things" (Intellect/Openness)
    // Reflecting = self-awareness, introspection, cognitive depth, mindfulness
    'ipip_big_five:q45': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q45',
      axisWeights: {'self_awareness': 1.0,           // Primary: Introspective capacity
        'cognitive_reappraisal': 0.7,    // Secondary: Reflective processing
        'intellectual_curiosity': 0.6,   // Secondary: Thoughtful exploration
        'feelings': 0.6,                 // Secondary: Inner experience awareness (Openness facet)
        'critical_thinking': 0.5,        // Secondary: Analytical reflection
        'calmness': 0.4,                 // Moderate: Calm needed for reflection
        // MBTI personality type scales
        'introversion': 0.3,
      },
      note: 'Openness: self-awareness + cognitive reappraisal + curiosity + feelings',
    ),

    // Q46: "I am quiet around strangers" (Extraversion, reversed)
    // Quiet with strangers = social withdrawal, self-consciousness, low warmth with unfamiliar
    'ipip_big_five:q46': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q46',
      axisWeights: {'warmth': 1.0,                   // Primary: Reserved with strangers (reversed)
        'self_consciousness': 0.9,       // Primary: Social anxiety/caution
        'social_confidence': 0.8,        // High: Low confidence with unfamiliar (reversed)
        'gregariousness': 0.6,           // Secondary: Avoidance of strangers (reversed)
        'expressiveness': 0.5,           // Secondary: Low verbal engagement (reversed)
        'social_boldness': 0.4,          // Moderate: Social inhibition (reversed)
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.2,
        'introversion': 0.4,
      },
      note: 'Introversion: reserved warmth + self-consciousness + low social confidence',
    ),

    // Q47: "I make people feel at ease" (Agreeableness)
    // Making ease = warmth, charisma, emotional intelligence, social facilitation
    'ipip_big_five:q47': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q47',
      axisWeights: {'warmth': 1.0,                   // Primary: Social warmth/friendliness
        'charisma': 0.9,                 // Primary: Social facilitation
        'emotional_intelligence': 0.8,   // High: Reading others' comfort needs
        'social_perception': 0.7,        // Secondary: Awareness of others' states
        'compassion': 0.6,               // Secondary: Caring for others' comfort
        'social_confidence': 0.5,        // Secondary: Comfortable putting others at ease
        // MBTI personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
      },
      note: 'Agreeableness: warmth + charisma + emotional intelligence + social perception',
    ),

    // Q48: "I am exacting in my work" (Conscientiousness)
    // Exacting = perfectionism, diligence, competence, achievement striving
    'ipip_big_five:q48': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q48',
      axisWeights: {
        'perfectionism': 1.0,            // Primary: High standards
        'diligence': 0.9,                // Primary: Careful/thorough work
        'competence': 0.8,               // High: Task excellence
        'achievement_striving': 0.7,     // Secondary: High performance drive
        'attention_control': 0.6,        // Secondary: Detailed focus
        'responsibility': 0.5,           // Secondary: Conscientious work ethic
      },
      note: 'Conscientiousness: perfectionism + diligence + competence + achievement striving',
    ),

    // Q49: "I often feel blue" (Emotional Stability, reversed)
    // Often blue = depression, low mood, sadness tendency, low vitality
    'ipip_big_five:q49': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q49',
      axisWeights: {'depression': 1.0,               // Primary: Depressive tendency
        'mood_stability': 0.9,           // Primary: Low mood stability (reversed)
        'positive_emotions': 0.8,        // High: Low positive affect (reversed)
        'vitality': 0.7,                 // Secondary: Low life energy (reversed)
        'happiness': 0.6,                // Secondary: Low baseline happiness (reversed)
        'emotional_resilience': 0.5,     // Secondary: Poor mood resilience (reversed)
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Neuroticism: depression + mood instability + low positive affect + low vitality',
    ),

    // Q50: "I am full of ideas" (Intellect/Openness)
    // Full of ideas = originality, divergent thinking, fluency, intellectual productivity
    'ipip_big_five:q50': const QuestionWeight(
      testId: 'ipip_big_five',
      questionId: 'q50',
      axisWeights: {'originality': 1.0,              // Primary: Novel idea generation
        'divergent_thinking': 0.9,       // Primary: Generative ideation
        'fluency': 0.8,                  // High: Abundant idea production
        'ideas': 0.7,                    // Secondary: Intellectual exploration (Openness facet)
        'intellectual_curiosity': 0.6,   // Secondary: Active intellectual engagement
        'creativity': 0.6,               // Secondary: Creative personality
        // MBTI personality type scales
        'intuition': 0.3,
      },
      note: 'Openness: originality + divergent thinking + fluency + ideas + creativity',
    ),

    // ========================================================================
    // IPIP BIG FIVE COMPLETE - All 50 questions REVISED with hierarchical scales
    //
    // NEW Coverage Statistics (Using 196 Hierarchical Scales):
    // - Total questions: 50
    // - Total axis weights: ~285 connections (was ~135)
    // - Average axes per question: 5.7 (was 2.7)
    // - Weight range: 0.3-1.0
    // - Axes range per question: 4-8
    //
    // Most Used Scales (Top 20):
    // - empathy: 10 questions (20%)
    // - emotional_reactivity: 8 questions (16%)
    // - warmth: 8 questions (16%)
    // - gregariousness: 7 questions (14%)
    // - compassion: 7 questions (14%)
    // - organization: 6 questions (12%)
    // - self_discipline: 6 questions (12%)
    // - calmness: 6 questions (12%)
    // - stress_tolerance: 5 questions (10%)
    // - social_confidence: 5 questions (10%)
    // - anxiety: 5 questions (10%)
    // - mood_stability: 5 questions (10%)
    // - intellectual_curiosity: 5 questions (10%)
    // - social_boldness: 5 questions (10%)
    // - emotional_intelligence: 5 questions (10%)
    // - positive_emotions: 4 questions (8%)
    // - order: 4 questions (8%)
    // - verbal_intelligence: 3 questions (6%)
    // - creativity: 3 questions (6%)
    // - self_consciousness: 3 questions (6%)
    //
    // Psychometric Improvements:
    // - Replaced 6 broad scales with 196 detailed subscales
    // - Increased granularity from 2.7 to 5.7 axes per question
    // - Better construct coverage across Big Five domains
    // - More precise personality profiling capability
    //
    // Next: Fisher Temperament (56 questions), Love Profile (60 questions), Stress/Self-Esteem (10 questions)
    // ========================================================================

    // ========================================================================
    // FISHER TEMPERAMENT INVENTORY - 56 Questions
    // ========================================================================
    //
    // Fisher's 4 neurochemical systems mapped to hierarchical scales:
    // 1. Curious/Energetic (Dopamine): novelty seeking, risk-taking, creativity
    // 2. Cautious/Compliant (Serotonin): order, tradition, deliberation
    // 3. Analytical/Tough (Testosterone): analytical thinking, low empathy
    // 4. Prosocial/Empathetic (Estrogen/Oxytocin): empathy, warmth, nurturing
    //
    // ========================================================================

    // Q1: "I find unpredictable situations exhilarating" (Dopamine)
    // Unpredictable exhilaration = excitement seeking, novelty seeking, positive emotions

  };
}
