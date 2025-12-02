import 'question_weight_models.dart';

/// Question weights for Dark Personality Traits Test
/// Maps 36 questions to 195 psychological scales
///
/// Test structure:
/// - Machiavellianism (q1-q12): Strategic manipulation, pragmatism
/// - Narcissism (q13-q24): Self-esteem, need for admiration
/// - Psychopathy (q25-q36): Reduced empathy, impulsivity
///
/// Key scales used:
/// - Machiavellianism → manipulation, strategic_thinking, trust (reversed), honesty (reversed)
/// - Narcissism → narcissism, grandiosity, self_esteem
/// - Psychopathy → empathy (reversed), impulsiveness, emotional_openness (reversed), risk_taking
class DarkPersonalityTraitsWeights {
  static final Map<String, QuestionWeight> weights = {
    // ========================================================================
    // MACHIAVELLIANISM (q1-q12)
    // Strategic manipulation, pragmatism, "end justifies means"
    // ========================================================================

    'dark_personality_traits:q1': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q1',
      axisWeights: {
        'manipulation': 0.9, // Telling people what they want to hear
        'honesty': -0.8, // (reversed) - dishonesty
        'strategic_thinking': 0.7,
        'trust': -0.6, // (reversed) - manipulative trust
      },
    ),

    'dark_personality_traits:q2': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q2',
      axisWeights: {
        'honesty': 0.9, // Always tell truth (reversed question)
        'manipulation': -0.7, // (reversed)
        'trust': 0.6, // Honest people are trustworthy
      },
    ),

    'dark_personality_traits:q3': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q3',
      axisWeights: {
        'strategic_thinking': 1.0, // Strategic use of information
        'manipulation': 0.8,
        'assertiveness': 0.6, // Getting advantage
      },
    ),

    'dark_personality_traits:q4': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q4',
      axisWeights: {
        'cooperativeness': 0.9, // Willing to compromise (reversed question)
        'manipulation': -0.7, // (reversed)
        'agreeableness': 0.8,
      },
    ),

    'dark_personality_traits:q5': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q5',
      axisWeights: {
        'manipulation': 1.0, // End justifies means
        'strategic_thinking': 0.8,
        'moral_values': -0.9, // (reversed) - weak ethics
      },
    ),

    'dark_personality_traits:q6': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q6',
      axisWeights: {
        'manipulation': -0.9, // Never use people (reversed question)
        'empathy': 0.8,
        'cooperativeness': 0.7,
      },
    ),

    'dark_personality_traits:q7': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q7',
      axisWeights: {
        'social_intelligence': 0.8, // Reading people
        'manipulation': 0.9, // Using knowledge for own purposes
        'strategic_thinking': 0.7,
      },
    ),

    'dark_personality_traits:q8': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q8',
      axisWeights: {
        'honesty': 0.9, // Prefer straightforwardness (reversed question)
        'manipulation': -1.0, // (reversed)
        'authenticity': 0.8,
      },
    ),

    'dark_personality_traits:q9': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q9',
      axisWeights: {
        'competitiveness': 0.8, // Being smarter than others
        'manipulation': 0.7,
        'strategic_thinking': 0.9,
      },
    ),

    'dark_personality_traits:q10': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q10',
      axisWeights: {
        'strategic_thinking': -0.9, // Don't plan ahead (reversed question)
        'impulsiveness': 0.7,
        'manipulation': -0.6, // (reversed)
      },
    ),

    'dark_personality_traits:q11': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q11',
      axisWeights: {
        'manipulation': 1.0, // Pretend to be friend
        'honesty': -0.9, // (reversed)
        'trust': -0.8, // (reversed) - betraying trust
      },
    ),

    'dark_personality_traits:q12': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q12',
      axisWeights: {
        'honesty': 1.0, // Value honesty above gain (reversed question)
        'moral_values': 0.9,
        'manipulation': -0.8, // (reversed)
      },
    ),

    // ========================================================================
    // NARCISSISM (q13-q24)
    // Inflated self-esteem, need for admiration, grandiosity
    // ========================================================================

    'dark_personality_traits:q13': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q13',
      axisWeights: {
        'narcissism': 1.0, // Feel special, deserve more
        'grandiosity': 0.9,
        'self_esteem': 0.7, // Inflated self-esteem
        'humility': -0.8, // (reversed)
      },
    ),

    'dark_personality_traits:q14': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q14',
      axisWeights: {
        'humility': 0.9, // Don't consider self better (reversed question)
        'narcissism': -1.0, // (reversed)
        'grandiosity': -0.8, // (reversed)
      },
    ),

    'dark_personality_traits:q15': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q15',
      axisWeights: {
        'narcissism': 0.9, // Like being center of attention
        'extraversion': 0.7, // Social attention-seeking
        'grandiosity': 0.6,
      },
    ),

    'dark_personality_traits:q16': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q16',
      axisWeights: {
        'narcissism': -0.9, // Comfortable when others in spotlight (reversed question)
        'humility': 0.8,
        'empathy': 0.6, // Can appreciate others
      },
    ),

    'dark_personality_traits:q17': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q17',
      axisWeights: {
        'narcissism': 0.9, // Fantasize about success and fame
        'grandiosity': 1.0,
        'achievement_striving': 0.6, // Ambitious fantasies
      },
    ),

    'dark_personality_traits:q18': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q18',
      axisWeights: {
        'narcissism': -0.9, // Don't need admiration (reversed question)
        'self_esteem': 0.7, // Healthy self-esteem
        'emotional_independence': 0.6,
      },
    ),

    'dark_personality_traits:q19': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q19',
      axisWeights: {
        'narcissism': 0.9, // Believe possess outstanding abilities
        'grandiosity': 0.9,
        'self_esteem': 0.7, // Inflated
      },
    ),

    'dark_personality_traits:q20': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q20',
      axisWeights: {
        'narcissism': -0.9, // Realistically assess abilities (reversed question)
        'grandiosity': -0.9, // (reversed)
        'self_awareness': 0.8, // Realistic self-view
      },
    ),

    'dark_personality_traits:q21': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q21',
      axisWeights: {
        'narcissism': 1.0, // People should recognize importance
        'grandiosity': 0.9,
        'entitlement': 0.8, // Expecting special recognition
      },
    ),

    'dark_personality_traits:q22': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q22',
      axisWeights: {
        'narcissism': -0.9, // Don't expect special treatment (reversed question)
        'humility': 0.9,
        'entitlement': -0.8, // (reversed)
      },
    ),

    'dark_personality_traits:q23': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q23',
      axisWeights: {
        'narcissism': 0.9, // Like impressing others
        'grandiosity': 0.7,
        'achievement_striving': 0.5, // Showing off achievements
      },
    ),

    'dark_personality_traits:q24': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q24',
      axisWeights: {
        'narcissism': -0.9, // Don't need constant confirmation (reversed question)
        'self_esteem': 0.8, // Healthy, stable self-esteem
        'emotional_independence': 0.7,
      },
    ),

    // ========================================================================
    // PSYCHOPATHY (q25-q36)
    // Reduced empathy, impulsivity, emotional coldness, risk-taking
    // ========================================================================

    'dark_personality_traits:q25': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q25',
      axisWeights: {
        'empathy': -1.0, // (reversed) - hard to understand why people upset
        'emotional_intelligence': -0.8, // (reversed)
        'sensitivity': -0.7, // (reversed)
      },
    ),

    'dark_personality_traits:q26': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q26',
      axisWeights: {
        'empathy': 1.0, // Can feel others' pain (reversed question)
        'emotional_intelligence': 0.9,
        'sensitivity': 0.8,
      },
    ),

    'dark_personality_traits:q27': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q27',
      axisWeights: {
        'empathy': -0.9, // (reversed) - cold rational decisions
        'emotional_openness': -0.8, // (reversed)
        'strategic_thinking': 0.7, // Rational decision-making
      },
    ),

    'dark_personality_traits:q28': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q28',
      axisWeights: {
        'empathy': 0.9, // Others' emotions influence decisions (reversed question)
        'emotional_intelligence': 0.8,
        'sensitivity': 0.7,
      },
    ),

    'dark_personality_traits:q29': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q29',
      axisWeights: {
        'impulsiveness': 1.0, // Act impulsively
        'self_control': -0.9, // (reversed)
        'risk_taking': 0.7,
      },
    ),

    'dark_personality_traits:q30': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q30',
      axisWeights: {
        'impulsiveness': -0.9, // Carefully consider consequences (reversed question)
        'self_control': 1.0,
        'conscientiousness': 0.8,
      },
    ),

    'dark_personality_traits:q31': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q31',
      axisWeights: {
        'guilt': -0.9, // (reversed) - rarely feel ashamed
        'moral_values': -0.8, // (reversed)
        'empathy': -0.7, // (reversed)
      },
    ),

    'dark_personality_traits:q32': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q32',
      axisWeights: {
        'guilt': 1.0, // Feel strong remorse (reversed question)
        'moral_values': 0.9,
        'empathy': 0.8,
      },
    ),

    'dark_personality_traits:q33': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q33',
      axisWeights: {
        'risk_taking': 1.0, // Like taking risks
        'thrill_seeking': 0.9, // Experiencing thrills
        'impulsiveness': 0.7,
      },
    ),

    'dark_personality_traits:q34': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q34',
      axisWeights: {
        'risk_taking': -0.9, // Prefer safety (reversed question)
        'thrill_seeking': -0.8, // (reversed)
        'orderliness': 0.7, // Predictability
      },
    ),

    'dark_personality_traits:q35': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q35',
      axisWeights: {
        'empathy': -0.9, // (reversed) - attachments don't stop
        'emotional_openness': -0.8, // (reversed)
        'strategic_thinking': 0.6, // Do what's necessary
      },
    ),

    'dark_personality_traits:q36': QuestionWeight(
      testId: 'dark_personality_traits',
      questionId: 'q36',
      axisWeights: {
        'empathy': 0.9, // Close relationships important (reversed question)
        'emotional_intimacy': 0.9,
        'commitment': 0.8,
      },
    ),
  };
}
