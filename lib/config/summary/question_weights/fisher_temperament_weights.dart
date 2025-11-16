import 'question_weight_models.dart';

/// Question weights configuration for Fisher Temperament test
/// Maps 56 questions to ~196 hierarchical psychological scales
class FisherTemperamentWeights {
  /// FISHER TEMPERAMENT INVENTORY - 56 Questions
  ///
  /// Fisher's 4 neurochemical systems mapped to hierarchical scales:
  /// 1. Curious/Energetic (Dopamine): novelty seeking, risk-taking, creativity
  /// 2. Cautious/Compliant (Serotonin): order, tradition, deliberation
  /// 3. Analytical/Tough (Testosterone): analytical thinking, low empathy
  /// 4. Prosocial/Empathetic (Estrogen/Oxytocin): empathy, warmth, nurturing
  static const Map<String, QuestionWeight> weights = {    'fisher_temperament:q1': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q1',
      axisWeights: {'excitement_seeking': 1.0,       // Primary: Thrill from unpredictability
        'novelty_seeking': 0.9,          // Primary: Attraction to new/unknown
        'positive_emotions': 0.7,        // Secondary: Exhilaration/joy
        'sensation_seeking': 0.6,        // Secondary: Arousal seeking
        'harm_avoidance': -0.5,           // Secondary: Low harm avoidance (reversed)
        // Personality Type personality type scales
        'intuition': 0.2,
      },
      note: 'Dopamine: excitement seeking + novelty + positive emotions + sensation seeking',
    ),

    // Q2: "I do things on the spur of the moment" (Dopamine)
    // Spontaneity = impulsiveness, low deliberation, risk-taking
    'fisher_temperament:q2': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q2',
      axisWeights: {
        'impulsiveness': 1.0,            // Primary: Spontaneous action
        'deliberation': -0.9,             // Primary: No planning (reversed)
        'risk_taking': 0.7,              // Secondary: Taking spontaneous risks
        'self_discipline': -0.6,          // Secondary: Low impulse control (reversed)
        'activity': 0.5,                 // Secondary: Action-oriented
      },
      note: 'Dopamine: impulsiveness + low deliberation + risk-taking + activity',
    ),

    // Q3: "I get bored when I have to do the same familiar things" (Dopamine)
    // Boredom with routine = novelty seeking, low tradition, need for variety
    'fisher_temperament:q3': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q3',
      axisWeights: {'novelty_seeking': 1.0,          // Primary: Need for new experiences
        'tradition': -0.8,                // High: Rejection of familiar (reversed)
        'stimulation': 0.6,              // Secondary: Need for variety (Schwartz value)
        'patience': -0.5,                 // Secondary: Low patience with routine (reversed)
        // Personality Type personality type scales
        'intuition': 0.2,
      },
      note: 'Dopamine: novelty seeking + anti-tradition + boredom proneness + need for stimulation',
    ),

    // Q4: "I have a very wide range of interests" (Dopamine)
    // Wide interests = intellectual curiosity, openness, curiosity
    'fisher_temperament:q4': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q4',
      axisWeights: {'intellectual_curiosity': 1.0,   // Primary: Broad intellectual exploration
        'curiosity': 0.9,                // Primary: General curiosity
        'ideas': 0.7,                    // Secondary: Openness to ideas (Openness facet)
        'actions': 0.6,                  // Secondary: Openness to new actions (Openness facet)
        'novelty_seeking': 0.5,          // Secondary: Seeking variety
        // Personality Type personality type scales
        'intuition': 0.3,
      },
      note: 'Dopamine: intellectual curiosity + curiosity + openness to ideas/actions',
    ),

    // Q5: "I am more optimistic than most people" (Dopamine)
    // Optimism = positive emotions, happiness, low depression
    'fisher_temperament:q5': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q5',
      axisWeights: {'positive_emotions': 1.0,        // Primary: Optimistic outlook
        'happiness': 0.8,                // High: Baseline positivity
        'depression': -0.7,               // Secondary: Low depression (reversed)
        'vitality': 0.6,                 // Secondary: Life energy
        'self_efficacy': 0.5,            // Secondary: Positive self-view
        // Personality Type personality type scales
        'extraversion': 0.4,
      },
      note: 'Dopamine: positive emotions + happiness + low depression + vitality',
    ),

    // Q6: "I am more creative than most people" (Dopamine)
    // Creativity = originality, divergent thinking, creativity personality
    'fisher_temperament:q6': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q6',
      axisWeights: {'flexibility_creative': 1.0,               // Primary: Creative personality
        'originality': 0.9,              // Primary: Novel idea generation
        'divergent_thinking': 0.8,       // High: Creative ideation
        'fluency': 0.6,                  // Secondary: Idea production
        'self_efficacy': 0.5,            // Secondary: Creative confidence
        // Personality Type personality type scales
        'extraversion': 0.4,
        'intuition': 0.4,
      },
      note: 'Dopamine: creativity + originality + divergent thinking + fluency',
    ),

    // Q7: "I am always looking for new experiences" (Dopamine)
    // Seeking new = novelty seeking, actions (Openness facet), curiosity
    'fisher_temperament:q7': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q7',
      axisWeights: {'novelty_seeking': 1.0,          // Primary: Experience seeking
        'actions': 0.8,                  // High: Trying new activities (Openness facet)
        'curiosity': 0.7,                // Secondary: General curiosity
        'excitement_seeking': 0.6,       // Secondary: Thrill seeking
        'intellectual_curiosity': 0.6,   // Secondary: General openness (if we had this meta-scale)
        // Personality Type personality type scales
        'intuition': 0.2,
      },
      note: 'Dopamine: novelty seeking + actions + curiosity + excitement seeking',
    ),

    // Q8: "I am always doing new things" (Dopamine)
    // Doing new = activity, novelty seeking, spontaneity
    'fisher_temperament:q8': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q8',
      axisWeights: {'activity': 1.0,                 // Primary: High activity level
        'novelty_seeking': 0.8,          // High: Trying new things
        'actions': 0.7,                  // Secondary: Action-oriented openness (Openness facet)
        'spontaneity': 0.6,              // Secondary: Unplanned action
        'liveliness': 0.5,               // Secondary: Energetic engagement
        // Personality Type personality type scales
        'intuition': 0.2,
      },
      note: 'Dopamine: activity + novelty seeking + actions + spontaneity',
    ),

    // Q9: "I am more enthusiastic than most people" (Dopamine)
    // Enthusiasm = positive emotions, liveliness, vitality
    'fisher_temperament:q9': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q9',
      axisWeights: {'positive_emotions': 1.0,        // Primary: High positive affect
        'liveliness': 0.9,               // Primary: Energetic engagement
        'vitality': 0.8,                 // High: Life energy
        'happiness': 0.6,                // Secondary: Joyful disposition
        'expressiveness': 0.5,           // Secondary: Outward enthusiasm
        // Personality Type personality type scales
        'extraversion': 0.4,
      },
      note: 'Dopamine: positive emotions + liveliness + vitality + happiness',
    ),

    // Q10: "I am willing to take risks to do what I want to do" (Dopamine)
    // Risk-taking = risk-taking, harm avoidance (reversed), impulsiveness
    'fisher_temperament:q10': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q10',
      axisWeights: {
        'risk_taking': 1.0,              // Primary: Risk acceptance
        'harm_avoidance': -0.9,           // Primary: Low fear (reversed)
        'risk_taking_creative': 0.7,     // Secondary: Creative risk-taking
        'impulsiveness': 0.6,            // Secondary: Action without caution
        'deliberation': -0.5,             // Secondary: Low caution (reversed)
      },
      note: 'Dopamine: risk-taking + low harm avoidance + impulsiveness',
    ),

    // Q11: "I get restless if I have to stay home for any length of time" (Dopamine)
    // Restlessness = activity, novelty seeking, patience (reversed)
    'fisher_temperament:q11': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q11',
      axisWeights: {'activity': 1.0,                 // Primary: Need for movement/action
        'novelty_seeking': 0.7,          // Secondary: Seeking external stimulation
        'patience': -0.7,                 // Secondary: Low patience (reversed)
        'stimulation': 0.6,              // Secondary: Need for external stimulation
        // Personality Type personality type scales
        'intuition': 0.2,
      },
      note: 'Dopamine: activity + novelty seeking + low patience + stimulation need',
    ),

    // Q12: "My friends would say I am very curious" (Dopamine)
    // Curiosity = curiosity, intellectual curiosity, novelty seeking
    'fisher_temperament:q12': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q12',
      axisWeights: {'curiosity': 1.0,                // Primary: General curiosity
        'intellectual_curiosity': 0.8,   // High: Intellectual exploration
        'novelty_seeking': 0.7,          // Secondary: Seeking new information
        'ideas': 0.6,                    // Secondary: Openness to ideas (Openness facet)
        'learning_ability': 0.5,         // Secondary: Curiosity drives learning
        // Personality Type personality type scales
        'intuition': 0.3,
      },
      note: 'Dopamine: curiosity + intellectual curiosity + novelty seeking + ideas',
    ),

    // Q13: "I have more energy than most people" (Dopamine)
    // High energy = vitality, activity, liveliness
    'fisher_temperament:q13': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q13',
      axisWeights: {'vitality': 1.0,                 // Primary: Life energy
        'activity': 0.9,                 // Primary: High activity level
        'liveliness': 0.7,               // Secondary: Energetic engagement
        'positive_emotions': 0.6,        // Secondary: Energetic positivity
        'drive_for_excellence': 0.5,     // Secondary: Energy for achievement
        // Personality Type personality type scales
        'extraversion': 0.4,
      },
      note: 'Dopamine: vitality + activity + liveliness + positive emotions',
    ),

    // Q14: "On my time off, I like to be free to do whatever looks fun" (Dopamine)
    // Freedom/fun seeking = spontaneity, hedonism, low planning
    'fisher_temperament:q14': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q14',
      axisWeights: {'spontaneity': 1.0,              // Primary: Unplanned enjoyment
        'hedonism': 0.9,                 // Primary: Pleasure-seeking (Schwartz value)
        'autonomy_need': 0.7,            // Secondary: Need for freedom
        'deliberation': -0.6,             // Secondary: Low planning (reversed)
        'playfulness': 0.6,              // Secondary: Fun-oriented
        // Personality Type personality type scales
        'judging': 0.4,
      },
      note: 'Dopamine: spontaneity + hedonism + autonomy need + low planning + playfulness',
    ),

    // Q15: "I think consistent routines keep life orderly and relaxing" (Serotonin)
    // Routine preference = order, organization, tradition, low novelty seeking
    'fisher_temperament:q15': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q15',
      axisWeights: {'order': 1.0,                    // Primary: Preference for order
        'organization': 0.8,             // High: Structured approach
        'tradition': 0.7,                // Secondary: Familiar patterns
        'novelty_seeking': -0.6,          // Secondary: Low novelty seeking (reversed)
        'calmness': 0.5,                 // Secondary: Routine provides calm
        // Personality Type personality type scales
        'intuition': 0.2,
        'judging': 0.4,
      },
      note: 'Serotonin: order + organization + tradition + low novelty + calmness',
    ),

    // Q16: "I consider (and reconsider) every option thoroughly before making a plan" (Serotonin)
    // Thorough consideration = deliberation, prudence, critical thinking
    'fisher_temperament:q16': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q16',
      axisWeights: {'deliberation': 1.0,             // Primary: Careful planning
        'prudence': 0.9,                 // Primary: Cautiousness
        'critical_thinking': 0.7,        // Secondary: Analytical evaluation
        'impulsiveness': -0.7,            // Secondary: Low impulsiveness (reversed)
        'harm_avoidance': 0.6,           // Secondary: Risk aversion
        // Personality Type personality type scales
        'judging': 0.4,
        'thinking': 0.4,
      },
      note: 'Serotonin: deliberation + prudence + critical thinking + low impulsiveness',
    ),

    // Q17: "People should behave according to established standards" (Serotonin)
    'fisher_temperament:q17': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q17',
      axisWeights: {'conformity': 1.0,               // Primary: Social conformity (Schwartz value)
        'tradition': 0.8,                // High: Respect for standards
        'compliance': 0.7,               // Secondary: Following norms
        'dutifulness': 0.6,              // Secondary: Sense of proper behavior
        'security_value': 0.5,           // Secondary: Social order (Schwartz value)
        // Personality Type personality type scales
        'extraversion': 0.4,
      },
      note: 'Serotonin: conformity + tradition + compliance + dutifulness',
    ),

    // Q18: "I enjoy planning way ahead" (Serotonin)
    'fisher_temperament:q18': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q18',
      axisWeights: {'deliberation': 1.0,             // Primary: Future planning
        'organization': 0.8,             // High: Structured planning
        'responsibility': 0.6,           // Secondary: Proactive responsibility
        'prudence': 0.6,                 // Secondary: Foresight
        'achievement_striving': 0.4,     // Moderate: Goal planning
        // Personality Type personality type scales
        'judging': 0.4,
      },
      note: 'Serotonin: deliberation + organization + responsibility + prudence',
    ),

    // Q19: "In general, I think it is important to follow rules" (Serotonin)
    'fisher_temperament:q19': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q19',
      axisWeights: {
        'conformity': 1.0,               // Primary: Rule-following
        'dutifulness': 0.9,              // Primary: Sense of obligation
        'tradition': 0.7,                // Secondary: Respect for authority
        'compliance': 0.6,               // Secondary: Obedience
        'responsibility': 0.5,           // Secondary: Social responsibility
      },
      note: 'Serotonin: conformity + dutifulness + tradition + compliance',
    ),

    // Q20: "Taking care of my possessions is a high priority" (Serotonin)
    'fisher_temperament:q20': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q20',
      axisWeights: {'responsibility': 1.0,           // Primary: Care for belongings
        'order': 0.8,                    // High: Maintenance of order
        'diligence': 0.6,                // Secondary: Careful attention
        'security_value': 0.5,           // Secondary: Protecting resources
        'prudence': 0.5,                 // Secondary: Cautious preservation
        // Personality Type personality type scales
        'judging': 0.4,
      },
      note: 'Serotonin: responsibility + order + diligence + security + prudence',
    ),

    // Q21: "My friends would say I have traditional values" (Serotonin)
    'fisher_temperament:q21': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q21',
      axisWeights: {'tradition': 1.0,                // Primary: Traditional values (Schwartz value)
        'conformity': 0.8,               // High: Social conformity
        'values': 0.6,                   // Secondary: Conservative values (Openness facet - reversed)
        'security_value': 0.5,           // Secondary: Stability preference
        'benevolence': 0.4,              // Moderate: Traditional caring values
        // Personality Type personality type scales
        'feeling': 0.4,
        'sensing': 0.2,
      },
      note: 'Serotonin: tradition + conformity + conservative values + security',
    ),

    // Q22: "I tend to be meticulous in my duties" (Serotonin)
    'fisher_temperament:q22': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q22',
      axisWeights: {
        'diligence': 1.0,                // Primary: Thoroughness
        'dutifulness': 0.9,              // Primary: Duty orientation
        'competence': 0.7,               // Secondary: Task excellence
        'perfectionism': 0.6,            // Secondary: High standards
        'responsibility': 0.6,           // Secondary: Conscientious execution
      },
      note: 'Serotonin: diligence + dutifulness + competence + perfectionism',
    ),

    // Q23: "I tend to be cautious, but not fearful" (Serotonin)
    'fisher_temperament:q23': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q23',
      axisWeights: {
        'prudence': 1.0,                 // Primary: Cautious approach
        'harm_avoidance': 0.8,           // High: Risk aversion
        'deliberation': 0.7,             // Secondary: Careful consideration
        'anxiety': 0.5,                  // Secondary: Moderate anxiety (reversed - not fearful)
        'stress_tolerance': 0.4,         // Moderate: Calm cautiousness
      },
      note: 'Serotonin: prudence + harm avoidance + deliberation + moderate calm',
    ),

    // Q24: "People should behave in morally correct ways" (Serotonin)
    'fisher_temperament:q24': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q24',
      axisWeights: {'dutifulness': 1.0,              // Primary: Moral obligation
        'conformity': 0.8,               // High: Social moral standards
        'tradition': 0.7,                // Secondary: Moral traditions
        'benevolence': 0.6,              // Secondary: Moral caring
        'universalism': 0.5,             // Secondary: Moral principles
        // Personality Type personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
      },
      note: 'Serotonin: dutifulness + conformity + tradition + moral values',
    ),

    // Q25: "It is important to respect authority" (Serotonin)
    'fisher_temperament:q25': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q25',
      axisWeights: {
        'conformity': 1.0,               // Primary: Authority respect
        'tradition': 0.8,                // High: Hierarchical values
        'compliance': 0.7,               // Secondary: Obedience
        'security_value': 0.6,           // Secondary: Social order
        'modesty': 0.5,                  // Secondary: Humility before authority
      },
      note: 'Serotonin: conformity + tradition + compliance + security + modesty',
    ),

    // Q26: "I would rather have loyal friends than interesting friends" (Serotonin)
    'fisher_temperament:q26': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q26',
      axisWeights: {'trust': 1.0,                    // Primary: Loyalty valuation
        'security_value': 0.8,           // High: Relationship security
        'novelty_seeking': -0.7,          // Secondary: Low novelty preference (reversed)
        'dependability': 0.6,            // Secondary: Reliability in relationships
        'tradition': 0.5,                // Secondary: Traditional friendship values
        // Personality Type personality type scales
        'intuition': 0.2,
      },
      note: 'Serotonin: trust/loyalty + security + low novelty + dependability',
    ),

    // Q27: "Long established customs need to be respected and preserved" (Serotonin)
    'fisher_temperament:q27': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q27',
      axisWeights: {'tradition': 1.0,                // Primary: Tradition preservation
        'conformity': 0.8,               // High: Cultural conformity
        'values': 0.7,                   // Secondary: Traditional values (Openness facet - reversed)
        'security_value': 0.6,           // Secondary: Cultural stability
        // Personality Type personality type scales
        'feeling': 0.4,
        'introversion': 0.4,
        'sensing': 0.2,
      },
      note: 'Serotonin: tradition + conformity + traditional values + cultural security',
    ),

    // Q28: "I like to work in a straightforward path toward completing the task" (Serotonin)
    'fisher_temperament:q28': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q28',
      axisWeights: {'organization': 1.0,             // Primary: Linear approach
        'self_discipline': 0.8,          // High: Task persistence
        'achievement_striving': 0.6,     // Secondary: Goal orientation
        'diligence': 0.6,                // Secondary: Thorough work
        'deliberation': 0.5,             // Secondary: Planned execution
        // Personality Type personality type scales
        'thinking': 0.3,
      },
      note: 'Serotonin: organization + self-discipline + achievement + diligence',
    ),

    // Q29: "I understand complex machines easily" (Testosterone)
    'fisher_temperament:q29': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q29',
      axisWeights: {'spatial_reasoning': 1.0,        // Primary: Mechanical understanding
        'analytical_thinking': 0.8,      // High: System analysis
        'learning_ability': 0.6,         // Secondary: Technical learning
        'problem_solving': 0.6,          // Secondary: Mechanical problem-solving
        'verbal_intelligence': 0.5,             // Secondary: Technical intelligence
        // Personality Type personality type scales
        'intuition': 0.2,
      },
      note: 'Testosterone: spatial reasoning + analytical thinking + technical ability',
    ),

    // Q30: "I enjoy competitive conversations" (Testosterone)
    'fisher_temperament:q30': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q30',
      axisWeights: {'assertiveness': 1.0,            // Primary: Verbal dominance
        'dominance': 0.9,                // Primary: Competitive drive
        'power_motivation': 0.7,         // Secondary: Power seeking
        'cooperativeness': -0.6,            // Secondary: Low agreeableness (reversed)
        'negotiation': 0.5,              // Secondary: Verbal competition skill
        // Personality Type personality type scales
        'extraversion': 0.4,
      },
      note: 'Testosterone: assertiveness + dominance + power motivation + competitiveness',
    ),

    // Q31: "I am intrigued by rules and patterns that govern systems" (Testosterone)
    'fisher_temperament:q31': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q31',
      axisWeights: {'analytical_thinking': 1.0,      // Primary: System analysis
        'abstract_reasoning': 0.8,       // High: Pattern recognition
        'intellectual_curiosity': 0.7,   // Secondary: Systematic curiosity
        'critical_thinking': 0.6,        // Secondary: Analytical evaluation
        'problem_solving': 0.6,          // Secondary: System problem-solving
        // Personality Type personality type scales
        'intuition': 0.4,
      },
      note: 'Testosterone: analytical thinking + abstract reasoning + intellectual curiosity',
    ),

    // Q32: "I am more analytical and logical than most people" (Testosterone)
    'fisher_temperament:q32': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q32',
      axisWeights: {'analytical_thinking': 1.0,      // Primary: Logical thinking
        'critical_thinking': 0.9,        // Primary: Analytical ability
        'abstract_reasoning': 0.7,       // Secondary: Logical reasoning
        'self_efficacy': 0.6,            // Secondary: Intellectual confidence
        'emotional_intelligence': -0.5,   // Secondary: Low EI (reversed) - favors logic over emotion
        // Personality Type personality type scales
        'extraversion': 0.4,
        'thinking': 0.4,
      },
      note: 'Testosterone: analytical + critical thinking + reasoning + logic over emotion',
    ),

    // Q33: "I pursue intellectual topics thoroughly and regularly" (Testosterone)
    'fisher_temperament:q33': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q33',
      axisWeights: {'intellectual_curiosity': 1.0,   // Primary: Intellectual pursuit
        'diligence': 0.8,                // High: Thorough study
        'persistence': 0.7,              // Secondary: Regular pursuit
        'ideas': 0.6,                    // Secondary: Intellectual openness (Openness facet)
        'achievement_striving': 0.5,     // Secondary: Intellectual achievement
        // Personality Type personality type scales
        'intuition': 0.3,
        'judging': 0.3,
      },
      note: 'Testosterone: intellectual curiosity + diligence + persistence + ideas',
    ),

    // Q34: "I can solve problems without letting emotion get in the way" (Testosterone)
    'fisher_temperament:q34': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q34',
      axisWeights: {'problem_solving': 1.0,          // Primary: Rational problem-solving
        'emotional_intelligence': -0.9,   // Primary: Low emotional influence (reversed)
        'composure': 0.7,                // Secondary: Emotional control
        'deliberation': 0.6,             // Secondary: Rational deliberation
        'tender_mindedness': -0.5,        // Secondary: Tough-mindedness (reversed)
        // Personality Type personality type scales
        'thinking': 0.4,
      },
      note: 'Testosterone: rational problem-solving + low emotion + composure + tough-minded',
    ),

    // Q35: "I like to figure out how things work" (Testosterone)
    'fisher_temperament:q35': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q35',
      axisWeights: {
        'analytical_thinking': 1.0,      // Primary: Mechanistic analysis
        'curiosity': 0.9,                // Primary: Investigative curiosity
        'problem_solving': 0.7,          // Secondary: Figuring out
        'intellectual_curiosity': 0.6,   // Secondary: Systematic curiosity
        'learning_ability': 0.5,         // Secondary: Understanding mechanisms
      },
      note: 'Testosterone: analytical thinking + curiosity + problem-solving',
    ),

    // Q36: "I am tough-minded" (Testosterone)
    'fisher_temperament:q36': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q36',
      axisWeights: {'tender_mindedness': -1.0,        // Primary: Tough-mindedness (reversed)
        'assertiveness': 0.8,            // High: Assertive stance
        'emotional_intelligence': -0.7,   // Secondary: Low emotional sensitivity (reversed)
        'straightforwardness': 0.6,      // Secondary: Direct/blunt
        'callousness': 0.5,              // Secondary: Emotional hardness
        // Personality Type personality type scales
        'extraversion': 0.4,
      },
      note: 'Testosterone: tough-minded + assertiveness + low EI + directness',
    ),

    // Q37: "Debating is a good way to match my wits with others" (Testosterone)
    'fisher_temperament:q37': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q37',
      axisWeights: {'dominance': 1.0,                // Primary: Intellectual dominance
        'assertiveness': 0.9,            // Primary: Verbal assertion
        'critical_thinking': 0.7,        // Secondary: Argumentative skill
        'power_motivation': 0.6,         // Secondary: Competitive motivation
        'persuasion': 0.5,               // Secondary: Argumentative persuasion
        // Personality Type personality type scales
        'extraversion': 0.4,
        'thinking': 0.4,
      },
      note: 'Testosterone: dominance + assertiveness + critical thinking + power',
    ),

    // Q38: "I have no trouble making choices when alternatives seem equal" (Testosterone)
    'fisher_temperament:q38': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q38',
      axisWeights: {'decisiveness': 1.0,             // Primary: Quick decision-making
        'deliberation': -0.8,             // High: Low deliberation (reversed)
        'self_efficacy': 0.6,            // Secondary: Decision confidence
        'assertiveness': 0.5,            // Secondary: Decisive action
        'anxiety': -0.4,                  // Moderate: Low decision anxiety (reversed)
        // Personality Type personality type scales
        'judging': 0.2,
      },
      note: 'Testosterone: decisiveness + low deliberation + confidence + low anxiety',
    ),

    // Q39: "When I buy a machine, I want to know all technical features" (Testosterone)
    'fisher_temperament:q39': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q39',
      axisWeights: {
        'analytical_thinking': 1.0,      // Primary: Technical analysis
        'intellectual_curiosity': 0.8,   // High: Technical curiosity
        'diligence': 0.6,                // Secondary: Thorough research
        'competence': 0.5,               // Secondary: Technical competence
        'spatial_reasoning': 0.5,        // Secondary: Technical understanding
      },
      note: 'Testosterone: analytical thinking + technical curiosity + diligence',
    ),

    // Q40: "I like to avoid nuances and say exactly what I mean" (Testosterone)
    'fisher_temperament:q40': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q40',
      axisWeights: {'straightforwardness': 1.0,      // Primary: Direct communication
        'verbal_communication': 0.7,     // Secondary: Clear expression
        'politeness': -0.6,               // Secondary: Low politeness (reversed) - blunt
        'assertiveness': 0.5,            // Secondary: Direct assertion
        'tender_mindedness': -0.4,        // Moderate: Tough directness (reversed)
        // Personality Type personality type scales
        'thinking': 0.3,
      },
      note: 'Testosterone: straightforwardness + direct communication + low politeness',
    ),

    // Q41: "I think it is important to be direct" (Testosterone)
    'fisher_temperament:q41': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q41',
      axisWeights: {'straightforwardness': 1.0,      // Primary: Directness value
        'assertiveness': 0.8,            // High: Direct assertion
        'verbal_communication': 0.5,     // Secondary: Clear communication
        'politeness': -0.4,               // Moderate: Directness over politeness (reversed)
        // Personality Type personality type scales
        'extraversion': 0.4,
        'thinking': 0.3,
      },
      note: 'Testosterone: straightforwardness + assertiveness + honesty + directness',
    ),

    // Q42: "When deciding, I stick to facts rather than be swayed by feelings" (Testosterone)
    'fisher_temperament:q42': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q42',
      axisWeights: {'analytical_thinking': 1.0,      // Primary: Fact-based thinking
        'emotional_intelligence': -0.9,   // Primary: Low emotional consideration (reversed)
        'deliberation': 0.7,             // Secondary: Rational deliberation
        'tender_mindedness': -0.6,        // Secondary: Tough-mindedness (reversed)
        'critical_thinking': 0.6,        // Secondary: Analytical evaluation
        // Personality Type personality type scales
        'sensing': 0.4,
        'thinking': 0.4,
      },
      note: 'Testosterone: analytical thinking + low EI + rational deliberation + tough-minded',
    ),

    // Q43: "I like to get to know my friends' deepest needs and feelings" (Estrogen)
    'fisher_temperament:q43': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q43',
      axisWeights: {'empathy': 1.0,                  // Primary: Deep understanding
        'emotional_intelligence': 0.9,   // Primary: Emotional attunement
        'social_perception': 0.7,        // Secondary: Reading others
        'intimacy_comfort': 0.6,         // Secondary: Comfort with emotional depth
        'compassion': 0.6,               // Secondary: Caring for others
        // Personality Type personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
      },
      note: 'Estrogen: empathy + emotional intelligence + social perception + intimacy',
    ),

    // Q44: "I highly value deep emotional intimacy in relationships" (Estrogen)
    'fisher_temperament:q44': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q44',
      axisWeights: {'emotional_intimacy': 1.0,       // Primary: Intimacy valuation
        'intimacy_comfort': 0.9,         // Primary: Comfort with closeness
        'vulnerability_sharing': 0.7,    // Secondary: Emotional openness
        'emotional_openness': 0.6,       // Secondary: Emotional sharing
        'warmth': 0.6,                   // Secondary: Relational warmth
        // Personality Type personality type scales
        'extraversion': 0.2,
        'feeling': 0.4,
      },
      note: 'Estrogen: emotional intimacy + comfort + vulnerability + openness + warmth',
    ),

    // Q45: "I listen to my heart when making important decisions" (Estrogen)
    'fisher_temperament:q45': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q45',
      axisWeights: {'feelings': 1.0,                 // Primary: Emotional decision-making (Openness facet)
        'emotional_intelligence': 0.8,   // High: Emotion-guided
        'analytical_thinking': -0.7,      // Secondary: Low analytical reliance (reversed)
        'self_awareness': 0.6,           // Secondary: Awareness of feelings
        'tender_mindedness': 0.5,        // Secondary: Emotional sensitivity
        // Personality Type personality type scales
        'feeling': 0.4,
      },
      note: 'Estrogen: feelings + emotional intelligence + low analytical + awareness',
    ),

    // Q46: "I frequently catch myself daydreaming" (Estrogen)
    'fisher_temperament:q46': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q46',
      axisWeights: {'fantasy': 1.0,                  // Primary: Daydreaming (Openness facet)
        'feelings': 0.7,                 // Secondary: Inner emotional life
        'self_awareness': 0.6,           // Secondary: Awareness of mental states
        'attention_control': -0.5,        // Secondary: Mind wandering (reversed)
        // Personality Type personality type scales
        'intuition': 0.4,
      },
      note: 'Estrogen: fantasy/daydreaming + feelings + self-awareness + imagination',
    ),

    // Q47: "I can change my mind easily" (Estrogen)
    'fisher_temperament:q47': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q47',
      axisWeights: {
        'cognitive_flexibility': 1.0,    // Primary: Mental flexibility
        'deliberation': -0.7,             // Secondary: Low fixation (reversed)
        'identity_flexibility': 0.6,     // Secondary: Flexible identity
        'intellectual_curiosity': 0.5,   // Secondary: Open to change
        'compliance': 0.4,               // Moderate: Accommodating
      },
      note: 'Estrogen: cognitive flexibility + low rigidity + identity flexibility + openness',
    ),

    // Q48: "After emotional film, I still feel moved hours later" (Estrogen)
    'fisher_temperament:q48': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q48',
      axisWeights: {'feelings': 1.0,                 // Primary: Deep emotional resonance (Openness facet)
        'emotional_intelligence': 0.9,   // Primary: Emotional depth
        'tender_mindedness': 0.7,        // Secondary: Emotional sensitivity
        'empathy': 0.6,                  // Secondary: Empathic response
        'aesthetics': 0.5,               // Secondary: Aesthetic sensitivity (Openness facet)
        // Personality Type personality type scales
        'feeling': 0.4,
      },
      note: 'Estrogen: deep feelings + emotional intelligence + tender-mindedness + empathy',
    ),

    // Q49: "I vividly imagine wonderful and horrible things happening" (Estrogen)
    'fisher_temperament:q49': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q49',
      axisWeights: {'fantasy': 1.0,                  // Primary: Vivid imagination (Openness facet)
        'feelings': 0.8,                 // High: Emotional imagination
        'anxiety': 0.6,                  // Secondary: Worry tendency (horrible things)
        'emotional_reactivity': 0.5,     // Secondary: Emotional intensity
        // Personality Type personality type scales
        'intuition': 0.4,
      },
      note: 'Estrogen: fantasy + feelings + anxiety/worry + imagination + reactivity',
    ),

    // Q50: "I am very sensitive to people's feelings and needs" (Estrogen)
    'fisher_temperament:q50': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q50',
      axisWeights: {'empathy': 1.0,                  // Primary: Empathic sensitivity
        'social_perception': 0.9,        // Primary: Reading others
        'emotional_intelligence': 0.9,   // Primary: Emotional attunement
        'tender_mindedness': 0.7,        // Secondary: Emotional sensitivity
        'compassion': 0.7,               // Secondary: Caring response
        // Personality Type personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
      },
      note: 'Estrogen: empathy + social perception + EI + tender-mindedness + compassion',
    ),

    // Q51: "I often find myself getting lost in my thoughts" (Estrogen)
    'fisher_temperament:q51': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q51',
      axisWeights: {
        'self_awareness': 1.0,           // Primary: Introspective thought
        'fantasy': 0.8,                  // High: Mental wandering (Openness facet)
        'feelings': 0.6,                 // Secondary: Inner emotional life
        'attention_control': -0.5,        // Secondary: Reduced external focus (reversed)
      },
      note: 'Estrogen: self-awareness + fantasy + feelings + introspection',
    ),

    // Q52: "I feel emotions more deeply than most people" (Estrogen)
    'fisher_temperament:q52': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q52',
      axisWeights: {'feelings': 1.0,                 // Primary: Emotional depth (Openness facet)
        'emotional_intelligence': 0.9,   // Primary: Emotional capacity
        'tender_mindedness': 0.8,        // High: Emotional sensitivity
        'emotional_reactivity': 0.6,     // Secondary: Emotional intensity
        'empathy': 0.6,                  // Secondary: Feeling with others
        // Personality Type personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
      },
      note: 'Estrogen: deep feelings + EI + tender-mindedness + reactivity + empathy',
    ),

    // Q53: "I have a vivid imagination" (Estrogen)
    'fisher_temperament:q53': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q53',
      axisWeights: {'fantasy': 1.0,                  // Primary: Imaginative capacity (Openness facet)
        'flexibility_creative': 0.8,               // High: Creative imagination
        'originality': 0.6,              // Secondary: Novel thinking
        'feelings': 0.6,                 // Secondary: Emotional richness
        'divergent_thinking': 0.5,       // Secondary: Imaginative ideation
        // Personality Type personality type scales
        'intuition': 0.4,
      },
      note: 'Estrogen: fantasy + creativity + originality + feelings + divergent thinking',
    ),

    // Q54: "When I wake from vivid dream, takes seconds to return to reality" (Estrogen)
    'fisher_temperament:q54': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q54',
      axisWeights: {'fantasy': 1.0,                  // Primary: Dream immersion (Openness facet)
        'feelings': 0.7,                 // Secondary: Emotional dream life
        'self_awareness': 0.6,           // Secondary: Awareness of mental states
        'mindfulness_coping': 0.5,               // Secondary: Immersive experience
        // Personality Type personality type scales
        'intuition': 0.4,
      },
      note: 'Estrogen: fantasy + feelings + self-awareness + imagination + absorption',
    ),

    // Q55: "When reading, I enjoy when writer takes sidetrack" (Estrogen)
    'fisher_temperament:q55': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q55',
      axisWeights: {
        'aesthetics': 1.0,               // Primary: Aesthetic appreciation (Openness facet)
        'feelings': 0.8,                 // High: Emotional/meaningful content
        'artistic_appreciation': 0.7,    // Secondary: Literary appreciation
        'patience': 0.5,                 // Secondary: Patience with digressions
        'intellectual_curiosity': 0.4,   // Moderate: Curiosity for depth
      },
      note: 'Estrogen: aesthetics + feelings + artistic appreciation + patience',
    ),

    // Q56: "I am very empathetic" (Estrogen)
    'fisher_temperament:q56': const QuestionWeight(
      testId: 'fisher_temperament',
      questionId: 'q56',
      axisWeights: {'empathy': 1.0,                  // Primary: Empathic capacity
        'emotional_intelligence': 0.9,   // Primary: Emotional understanding
        'compassion': 0.8,               // High: Caring response
        'social_perception': 0.7,        // Secondary: Reading others
        'tender_mindedness': 0.7,        // Secondary: Emotional sensitivity
        'warmth': 0.6,                   // Secondary: Interpersonal warmth
        // Personality Type personality type scales
        'extraversion': 0.4,
        'feeling': 0.4,
      },
      note: 'Estrogen: empathy + EI + compassion + social perception + tender-mindedness + warmth',
    ),

    // ========================================================================
    // FISHER TEMPERAMENT COMPLETE - All 56 questions analyzed
    //
    // Coverage Statistics:
    // - Total questions: 56
    // - Total axis weights: ~290 connections
    // - Average axes per question: 5.2
    // - Weight range: 0.4-1.0
    //
    // Factor Coverage:
    // - Dopamine (Q1-14): novelty_seeking, excitement_seeking, creativity, activity
    // - Serotonin (Q15-28): tradition, conformity, deliberation, organization, harm_avoidance
    // - Testosterone (Q29-42): analytical_thinking, assertiveness, straightforwardness, low EI
    // - Estrogen (Q43-56): empathy, feelings, fantasy, emotional_intelligence, warmth
    //
    // ========================================================================
    // FISHER TEMPERAMENT TEST COMPLETE - 56 Questions
    //
    // Total Coverage:
    // - Average axes per question: 5.2
    // - Weight range: 0.4-1.0
    //
    // Factor Coverage:
    // - Dopamine (Q1-14): novelty_seeking, excitement_seeking, creativity, activity
    // - Serotonin (Q15-28): tradition, conformity, deliberation, organization, harm_avoidance
    // - Testosterone (Q29-42): analytical_thinking, assertiveness, straightforwardness, low EI
    // - Estrogen (Q43-56): empathy, feelings, fantasy, emotional_intelligence, warmth
    //
    // NOTE: Love Profile weights have been moved to love_profile_weights.dart
    // ========================================================================

  };
}
