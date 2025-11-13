import 'question_weight_models.dart';

/// Question weights configuration for Love Profile test
/// Maps all 60 Love Profile questions to ~196 hierarchical psychological scales
class LoveProfileWeights {
  /// LOVE PROFILE - 60 Questions
  ///
  /// 6 Factors measuring relationship dimensions:
  /// 1. BP (Secure Attachment): authenticity, comfort, emotional security
  /// 2. IU (Intimacy & Vulnerability): emotional openness, sharing
  /// 3. ST (Passion & Physicality): physical connection, attraction
  /// 4. OG (Commitment & Goals): long-term orientation, shared vision
  /// 5. DR (Trust & Jealousy): trust levels, jealousy management
  /// 6. KK (Communication & Conflict): communication skills, conflict resolution
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // FACTOR 1: BP (Безопасная привязанность / Secure Attachment) - Q1-10
    // ========================================================================

    // BP_01: "In relationships, I feel like I can be myself"
    'love_profile:BP_01': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'BP_01',
      axisWeights: {
        'secure_attachment': 1.0,        // Primary: Authentic self-expression
        'authenticity': 0.9,             // Primary: Being oneself
        'self_acceptance': 0.7,          // Secondary: Comfort with self
        'intimacy_comfort': 0.7,         // Secondary: Closeness comfort
        'emotional_openness': 0.6,       // Secondary: Open expression
      },
      note: 'Secure attachment: authenticity + self-acceptance + intimacy comfort + emotional openness',
    ),

    // BP_02: "I feel comfortable and close even when my partner is away"
    'love_profile:BP_02': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'BP_02',
      axisWeights: {
        'secure_attachment': 1.0,        // Primary: Separation comfort
        'fear_of_abandonment': 0.9,      // Primary: Low abandonment fear (reversed)
        'anxious_attachment': 0.8,       // High: Low anxious attachment (reversed)
        'emotional_resilience': 0.6,     // Secondary: Emotional stability
        'autonomy_wellbeing': 0.5,       // Secondary: Independent functioning
      },
      note: 'Secure attachment: low abandonment fear + low anxious attachment + autonomy + resilience',
    ),

    // BP_03: "I calmly ask for support when I need it"
    'love_profile:BP_03': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'BP_03',
      axisWeights: {
        'secure_attachment': 1.0,        // Primary: Healthy support-seeking
        'assertiveness': 0.8,            // High: Direct communication
        'vulnerability_sharing': 0.8,    // High: Comfort expressing needs
        'emotional_intelligence': 0.6,   // Secondary: Recognizing needs
        'social_support_seeking': 0.6,   // Secondary: Seeking help
      },
      note: 'Secure attachment: assertiveness + vulnerability sharing + support-seeking + EI',
    ),

    // BP_04: "I believe my needs for closeness are important"
    'love_profile:BP_04': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'BP_04',
      axisWeights: {
        'secure_attachment': 1.0,        // Primary: Valuing own needs
        'self_esteem': 0.9,              // Primary: Self-worth
        'relatedness_need': 0.7,         // Secondary: Connection needs
        'boundary_setting': 0.6,         // Secondary: Honoring own needs
        'self_compassion': 0.6,          // Secondary: Self-care
      },
      note: 'Secure attachment: self-esteem + valuing connection needs + boundaries + self-compassion',
    ),

    // BP_05: "I know how to stay in touch with my feelings"
    'love_profile:BP_05': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'BP_05',
      axisWeights: {
        'emotional_intelligence': 1.0,   // Primary: Emotional awareness
        'self_awareness': 0.9,           // Primary: Self-knowledge
        'mindfulness_coping': 0.7,       // Secondary: Present-moment awareness
        'secure_attachment': 0.6,        // Secondary: Emotional regulation
        'feelings': 0.6,                 // Secondary: Depth of feelings (Big Five facet)
        // MBTI personality type scales
        'feeling': 0.3,
      },
      note: 'EI + self-awareness + mindfulness + emotional regulation + feelings depth',
    ),

    // BP_06: "I don't need constant confirmation of love" (REVERSED)
    'love_profile:BP_06': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'BP_06',
      axisWeights: {
        'anxious_attachment': 1.0,       // Primary: Anxious attachment (reversed - low score = good)
        'secure_attachment': 0.9,        // Primary: Security in relationship
        'fear_of_abandonment': 0.8,      // High: Abandonment fears (reversed)
        'self_esteem': 0.7,              // Secondary: Self-worth
        'emotional_resilience': 0.5,     // Secondary: Emotional stability
      },
      note: 'Reversed: low anxious attachment + low abandonment fear + secure + self-esteem + resilience',
    ),

    // BP_07: "I maintain a sense of inner support even during conflicts"
    'love_profile:BP_07': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'BP_07',
      axisWeights: {
        'emotional_resilience': 1.0,     // Primary: Resilience under stress
        'secure_attachment': 0.9,        // Primary: Internal security
        'self_efficacy': 0.8,            // High: Self-reliance
        'composure': 0.7,                // Secondary: Emotional control
        'stress_tolerance': 0.6,         // Secondary: Stress management
      },
      note: 'Resilience + secure attachment + self-efficacy + composure + stress tolerance',
    ),

    // BP_08: "I manage to combine closeness and personal boundaries"
    'love_profile:BP_08': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'BP_08',
      axisWeights: {
        'boundary_setting': 1.0,         // Primary: Boundary management
        'secure_attachment': 0.9,        // Primary: Balance of autonomy/connection
        'autonomy_wellbeing': 0.8,       // High: Personal autonomy
        'intimacy_comfort': 0.7,         // Secondary: Closeness comfort
        'assertiveness': 0.6,            // Secondary: Boundary assertion
      },
      note: 'Boundary setting + secure attachment + autonomy + intimacy comfort + assertiveness',
    ),

    // BP_09: "I feel that I deserve love and respect"
    'love_profile:BP_09': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'BP_09',
      axisWeights: {
        'self_esteem': 1.0,              // Primary: Self-worth
        'secure_attachment': 0.9,        // Primary: Deserving love
        'self_acceptance': 0.8,          // High: Self-acceptance
        'self_compassion': 0.7,          // Secondary: Self-kindness
        'entitlement': 0.4,              // Low: Healthy vs narcissistic entitlement
      },
      note: 'Self-esteem + secure attachment + self-acceptance + self-compassion + healthy entitlement',
    ),

    // BP_10: "Temporary separation doesn't cause panic in me" (REVERSED)
    'love_profile:BP_10': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'BP_10',
      axisWeights: {
        'fear_of_abandonment': 1.0,      // Primary: Abandonment fear (reversed - low = good)
        'anxious_attachment': 0.9,       // Primary: Anxious attachment (reversed)
        'secure_attachment': 0.8,        // High: Security
        'panic_tendency': 0.7,           // Secondary: Panic response (reversed)
        'emotional_resilience': 0.6,     // Secondary: Stability
      },
      note: 'Reversed: low abandonment fear + low anxious attachment + secure + low panic + resilience',
    ),

    // ========================================================================
    // FACTOR 2: IU (Интимность и уязвимость / Intimacy & Vulnerability) - Q11-20
    // ========================================================================

    // IU_11: "I can openly talk about my fears"
    'love_profile:IU_11': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'IU_11',
      axisWeights: {
        'vulnerability_sharing': 1.0,    // Primary: Sharing vulnerability
        'emotional_openness': 0.9,       // Primary: Emotional expression
        'emotional_intelligence': 0.7,   // Secondary: Emotional awareness
        'intimacy_comfort': 0.7,         // Secondary: Comfort with depth
        'assertiveness': 0.5,            // Secondary: Speaking openly
        // MBTI personality type scales
        'feeling': 0.3,
        'extraversion': 0.2,
      },
      note: 'Vulnerability sharing + emotional openness + EI + intimacy comfort + assertiveness',
    ),

    // IU_12: "I share not only successes but also weaknesses"
    'love_profile:IU_12': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'IU_12',
      axisWeights: {
        'vulnerability_sharing': 1.0,    // Primary: Sharing weaknesses
        'authenticity': 0.9,             // Primary: Authentic self-presentation
        'self_acceptance': 0.7,          // Secondary: Accepting imperfections
        'emotional_openness': 0.7,       // Secondary: Emotional sharing
        'modesty': 0.5,                  // Secondary: Humility
      },
      note: 'Vulnerability + authenticity + self-acceptance + emotional openness + modesty',
    ),

    // IU_13: "I know how to ask for tenderness and support"
    'love_profile:IU_13': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'IU_13',
      axisWeights: {
        'vulnerability_sharing': 1.0,    // Primary: Expressing needs
        'assertiveness': 0.8,            // High: Direct asking
        'emotional_openness': 0.7,       // Secondary: Emotional expression
        'relatedness_need': 0.6,         // Secondary: Connection needs
        'social_support_seeking': 0.5,   // Secondary: Seeking support
        // MBTI personality type scales
        'feeling': 0.3,
      },
      note: 'Vulnerability + assertiveness + emotional openness + connection needs + support seeking',
    ),

    // IU_14: "It's easy for me to admit my mistake and apologize"
    'love_profile:IU_14': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'IU_14',
      axisWeights: {
        'modesty': 1.0,                  // Primary: Humility
        'self_acceptance': 0.9,          // Primary: Accepting imperfections
        'vulnerability_sharing': 0.8,    // High: Admitting weakness
        'emotional_intelligence': 0.7,   // Secondary: Self-awareness
        'assertiveness': 0.6,            // Secondary: Direct communication
      },
      note: 'Humility + self-acceptance + vulnerability + EI + assertiveness',
    ),

    // IU_15: "I can discuss past traumatic experiences when appropriate"
    'love_profile:IU_15': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'IU_15',
      axisWeights: {
        'vulnerability_sharing': 1.0,    // Primary: Sharing deep pain
        'emotional_openness': 0.9,       // Primary: Emotional expression
        'emotional_resilience': 0.8,     // High: Processing trauma
        'trust': 0.7,                    // Secondary: Trusting to share
        'self_awareness': 0.6,           // Secondary: Understanding past
      },
      note: 'Vulnerability + emotional openness + resilience + trust + self-awareness',
    ),

    // IU_16: "I avoid talking about feelings" (REVERSED)
    'love_profile:IU_16': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'IU_16',
      axisWeights: {
        'emotional_openness': 1.0,       // Primary: Emotional expression (reversed)
        'emotional_avoidance': 0.9,      // Primary: Avoidance pattern (reversed)
        'intimacy_comfort': 0.8,         // High: Closeness discomfort (reversed)
        'vulnerability_sharing': 0.7,    // Secondary: Sharing reluctance (reversed)
        'alexithymia': 0.6,              // Secondary: Difficulty identifying feelings
        // MBTI personality type scales
        'thinking': 0.3,
        'introversion': 0.2,
      },
      note: 'Reversed: low emotional openness + emotional avoidance + intimacy discomfort + low vulnerability',
    ),

    // IU_17: "I listen respectfully when my partner shares experiences"
    'love_profile:IU_17': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'IU_17',
      axisWeights: {
        'active_listening': 1.0,         // Primary: Listening skill
        'empathy': 0.9,                  // Primary: Empathic response
        'respect': 0.8,                  // High: Respectful attitude
        'emotional_intelligence': 0.7,   // Secondary: Emotional understanding
        'patience': 0.6,                 // Secondary: Patience in listening
        // MBTI personality type scales
        'feeling': 0.3,
      },
      note: 'Active listening + empathy + respect + EI + patience',
    ),

    // IU_18: "I'm not ashamed of my tears or confusion"
    'love_profile:IU_18': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'IU_18',
      axisWeights: {
        'self_acceptance': 1.0,          // Primary: Accepting emotions
        'emotional_openness': 0.9,       // Primary: Emotional expression
        'self_consciousness': 0.8,       // High: Low shame (reversed)
        'authenticity': 0.7,             // Secondary: Being genuine
        'self_compassion': 0.6,          // Secondary: Self-kindness
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Self-acceptance + emotional openness + low self-consciousness + authenticity + self-compassion',
    ),

    // IU_19: "I can name my needs in words"
    'love_profile:IU_19': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'IU_19',
      axisWeights: {
        'assertiveness': 1.0,            // Primary: Expressing needs
        'self_awareness': 0.9,           // Primary: Knowing needs
        'emotional_intelligence': 0.8,   // High: Emotional clarity
        'communication_skills': 0.7,     // Secondary: Verbal expression
        'clarity': 0.6,                  // Secondary: Clear communication
      },
      note: 'Assertiveness + self-awareness + EI + communication + clarity',
    ),

    // IU_20: "I close up when the conversation gets deep" (REVERSED)
    'love_profile:IU_20': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'IU_20',
      axisWeights: {
        'emotional_avoidance': 1.0,      // Primary: Avoidance (reversed)
        'intimacy_comfort': 0.9,         // Primary: Discomfort with depth (reversed)
        'vulnerability_sharing': 0.8,    // High: Closing off (reversed)
        'emotional_openness': 0.7,       // Secondary: Shutting down (reversed)
        'fear_of_intimacy': 0.6,         // Secondary: Intimacy fear (reversed)
        // MBTI personality type scales
        'introversion': 0.3,
        'thinking': 0.2,
      },
      note: 'Reversed: emotional avoidance + intimacy discomfort + low vulnerability + shutting down',
    ),

    // ========================================================================
    // FACTOR 3: ST (Страсть и телесность / Passion & Physicality) - Q21-30
    // ========================================================================

    // ST_21: "There is room for play and flirtation in our relationship"
    'love_profile:ST_21': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'ST_21',
      axisWeights: {
        'playfulness': 1.0,              // Primary: Playful attitude
        'spontaneity': 0.9,              // Primary: Spontaneous behavior
        'positive_emotions': 0.8,        // High: Positive affect
        'excitement_seeking': 0.7,       // Secondary: Seeking excitement
        'liveliness': 0.6,               // Secondary: Energetic engagement
        // MBTI personality type scales
        'extraversion': 0.4,
        'intuition': 0.2,
      },
      note: 'Playfulness + spontaneity + positive emotions + excitement seeking + liveliness',
    ),

    // ST_22: "I take initiative in intimacy"
    'love_profile:ST_22': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'ST_22',
      axisWeights: {
        'assertiveness': 1.0,            // Primary: Initiating behavior
        'sexual_confidence': 0.9,        // Primary: Sexual self-assurance
        'activity': 0.8,                 // High: Taking action
        'self_efficacy': 0.7,            // Secondary: Confidence in ability
        'dominance': 0.5,                // Secondary: Leading role
        // MBTI personality type scales
        'extraversion': 0.3,
      },
      note: 'Assertiveness + sexual confidence + activity + self-efficacy + dominance',
    ),

    // ST_23: "I'm open to discussing desires and fantasies"
    'love_profile:ST_23': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'ST_23',
      axisWeights: {
        'sexual_openness': 1.0,          // Primary: Sexual communication
        'vulnerability_sharing': 0.9,    // Primary: Sharing intimate thoughts
        'emotional_openness': 0.8,       // High: Open expression
        'assertiveness': 0.7,            // Secondary: Speaking up
        'fantasy': 0.6,                  // Secondary: Imaginative openness
        // MBTI personality type scales
        'intuition': 0.3,
        'extraversion': 0.2,
      },
      note: 'Sexual openness + vulnerability + emotional openness + assertiveness + fantasy',
    ),

    // ST_24: "I manage to maintain novelty and spontaneity"
    'love_profile:ST_24': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'ST_24',
      axisWeights: {
        'novelty_seeking': 1.0,          // Primary: Seeking new experiences
        'spontaneity': 0.9,              // Primary: Spontaneous behavior
        'creativity': 0.8,               // High: Creative approaches
        'openness_to_experience': 0.7,   // Secondary: Open to new
        'excitement_seeking': 0.6,       // Secondary: Seeking stimulation
        // MBTI personality type scales
        'intuition': 0.4,
        'perceiving': 0.3,
      },
      note: 'Novelty seeking + spontaneity + creativity + openness + excitement seeking',
    ),

    // ST_25: "I notice and appreciate my partner's body signals"
    'love_profile:ST_25': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'ST_25',
      axisWeights: {
        'empathy': 1.0,                  // Primary: Sensing partner's state
        'attentiveness': 0.9,            // Primary: Paying attention
        'emotional_intelligence': 0.8,   // High: Reading cues
        'mindfulness_coping': 0.7,       // Secondary: Present awareness
        'sensitivity': 0.6,              // Secondary: Sensory awareness
        // MBTI personality type scales
        'feeling': 0.4,
        'sensing': 0.3,
      },
      note: 'Empathy + attentiveness + EI + mindfulness + sensitivity',
    ),

    // ST_26: "The topic of sexuality embarrasses me and I avoid it" (REVERSED)
    'love_profile:ST_26': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'ST_26',
      axisWeights: {
        'sexual_openness': 1.0,          // Primary: Sexual comfort (reversed)
        'self_consciousness': 0.9,       // Primary: Embarrassment (reversed)
        'sexual_anxiety': 0.8,           // High: Sexual discomfort (reversed)
        'emotional_avoidance': 0.7,      // Secondary: Topic avoidance (reversed)
        'shame': 0.6,                    // Secondary: Shame about sexuality (reversed)
        // MBTI personality type scales
        'introversion': 0.3,
        'judging': 0.2,
      },
      note: 'Reversed: low sexual openness + high self-consciousness + sexual anxiety + avoidance + shame',
    ),

    // ST_27: "I pay attention to my body and energy"
    'love_profile:ST_27': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'ST_27',
      axisWeights: {
        'self_care': 1.0,                // Primary: Body care
        'body_awareness': 0.9,           // Primary: Bodily awareness
        'mindfulness_coping': 0.8,       // High: Present-moment awareness
        'vitality': 0.7,                 // Secondary: Energy level
        'self_compassion': 0.6,          // Secondary: Self-care attitude
        // MBTI personality type scales
        'sensing': 0.3,
      },
      note: 'Self-care + body awareness + mindfulness + vitality + self-compassion',
    ),

    // ST_28: "I respect the consent and comfort of both"
    'love_profile:ST_28': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'ST_28',
      axisWeights: {
        'respect': 1.0,                  // Primary: Respecting boundaries
        'empathy': 0.9,                  // Primary: Sensing partner's comfort
        'boundary_setting': 0.8,         // High: Honoring boundaries
        'morality': 0.7,                 // Secondary: Ethical behavior
        'cooperation': 0.6,              // Secondary: Mutual agreement
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Respect + empathy + boundary setting + morality + cooperation',
    ),

    // ST_29: "I maintain regular, desired intimacy"
    'love_profile:ST_29': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'ST_29',
      axisWeights: {
        'relationship_investment': 1.0,  // Primary: Relationship effort
        'sexual_satisfaction': 0.9,      // Primary: Intimacy maintenance
        'commitment': 0.8,               // High: Ongoing engagement
        'vitality': 0.7,                 // Secondary: Energy for intimacy
        'prioritization': 0.6,           // Secondary: Making time
      },
      note: 'Relationship investment + sexual satisfaction + commitment + vitality + prioritization',
    ),

    // ST_30: "I often suppress my own attraction out of fear of being rejected" (REVERSED)
    'love_profile:ST_30': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'ST_30',
      axisWeights: {
        'fear_of_rejection': 1.0,        // Primary: Rejection fear (reversed)
        'assertiveness': 0.9,            // Primary: Initiative (reversed)
        'sexual_confidence': 0.8,        // High: Sexual assurance (reversed)
        'self_esteem': 0.7,              // Secondary: Self-worth (reversed)
        'anxiety': 0.6,                  // Secondary: Anxious suppression (reversed)
        // MBTI personality type scales
        'introversion': 0.3,
      },
      note: 'Reversed: fear of rejection + low assertiveness + low sexual confidence + low self-esteem + anxiety',
    ),

    // ========================================================================
    // FACTOR 4: OG (Обязательства и цели / Commitment & Goals) - Q31-40
    // ========================================================================

    // OG_31: "We discuss and agree on each other's expectations"
    'love_profile:OG_31': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'OG_31',
      axisWeights: {
        'communication_skills': 1.0,     // Primary: Effective communication
        'assertiveness': 0.9,            // Primary: Speaking up
        'cooperation': 0.8,              // High: Working together
        'perspective_taking': 0.7,       // Secondary: Understanding other
        'negotiation': 0.6,              // Secondary: Reaching agreement
        // MBTI personality type scales
        'thinking': 0.3,
      },
      note: 'Communication + assertiveness + cooperation + perspective-taking + negotiation',
    ),

    // OG_32: "I keep promises or renegotiate in advance"
    'love_profile:OG_32': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'OG_32',
      axisWeights: {
        'dutifulness': 1.0,              // Primary: Keeping commitments
        'reliability': 0.9,              // Primary: Being dependable
        'integrity': 0.8,                // High: Honoring word
        'conscientiousness': 0.7,        // Secondary: Responsible behavior
        'honesty': 0.6,                  // Secondary: Truthfulness
        // MBTI personality type scales
        'judging': 0.4,
      },
      note: 'Dutifulness + reliability + integrity + conscientiousness + honesty',
    ),

    // OG_33: "We have shared rituals and plans"
    'love_profile:OG_33': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'OG_33',
      axisWeights: {
        'relationship_investment': 1.0,  // Primary: Investing in relationship
        'tradition': 0.9,                // Primary: Valuing rituals
        'shared_goals': 0.8,             // High: Common vision
        'orderliness': 0.7,              // Secondary: Structure
        'cooperation': 0.6,              // Secondary: Joint planning
        // MBTI personality type scales
        'judging': 0.4,
        'sensing': 0.2,
      },
      note: 'Relationship investment + tradition + shared goals + orderliness + cooperation',
    ),

    // OG_34: "I know how to manage budget/household without conflicts"
    'love_profile:OG_34': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'OG_34',
      axisWeights: {
        'practical_skills': 1.0,         // Primary: Practical competence
        'cooperation': 0.9,              // Primary: Working together
        'conflict_management': 0.8,      // High: Avoiding conflicts
        'orderliness': 0.7,              // Secondary: Organization
        'fairness': 0.6,                 // Secondary: Equitable division
        // MBTI personality type scales
        'thinking': 0.4,
        'judging': 0.3,
        'sensing': 0.2,
      },
      note: 'Practical skills + cooperation + conflict management + orderliness + fairness',
    ),

    // OG_35: "I'm resilient to difficulties and not prone to 'running away'"
    'love_profile:OG_35': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'OG_35',
      axisWeights: {
        'emotional_resilience': 1.0,     // Primary: Resilience
        'commitment': 0.9,               // Primary: Staying power
        'perseverance': 0.8,             // High: Persistence
        'stress_tolerance': 0.7,         // Secondary: Handling stress
        'self_efficacy': 0.6,            // Secondary: Confidence in coping
        // MBTI personality type scales
        'judging': 0.3,
      },
      note: 'Resilience + commitment + perseverance + stress tolerance + self-efficacy',
    ),

    // OG_36: "I often postpone important conversations 'for later'" (REVERSED)
    'love_profile:OG_36': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'OG_36',
      axisWeights: {
        'procrastination': 1.0,          // Primary: Delaying (reversed)
        'avoidance': 0.9,                // Primary: Avoiding issues (reversed)
        'assertiveness': 0.8,            // High: Speaking up (reversed)
        'self_discipline': 0.7,          // Secondary: Self-control (reversed)
        'courage': 0.6,                  // Secondary: Facing difficult topics (reversed)
        // MBTI personality type scales
        'perceiving': 0.3,
      },
      note: 'Reversed: procrastination + avoidance + low assertiveness + low self-discipline + low courage',
    ),

    // OG_37: "I'm ready to invest in long-term couple projects"
    'love_profile:OG_37': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'OG_37',
      axisWeights: {
        'commitment': 1.0,               // Primary: Long-term commitment
        'future_orientation': 0.9,       // Primary: Planning ahead
        'relationship_investment': 0.8,  // High: Investing effort
        'cooperation': 0.7,              // Secondary: Joint work
        'optimism': 0.6,                 // Secondary: Positive outlook
        // MBTI personality type scales
        'judging': 0.4,
        'intuition': 0.2,
      },
      note: 'Commitment + future orientation + relationship investment + cooperation + optimism',
    ),

    // OG_38: "I know how to share responsibility"
    'love_profile:OG_38': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'OG_38',
      axisWeights: {
        'cooperation': 1.0,              // Primary: Working together
        'fairness': 0.9,                 // Primary: Equitable sharing
        'responsibility': 0.8,           // High: Taking responsibility
        'altruism': 0.7,                 // Secondary: Helping partner
        'dutifulness': 0.6,              // Secondary: Fulfilling duties
      },
      note: 'Cooperation + fairness + responsibility + altruism + dutifulness',
    ),

    // OG_39: "I try to consider my partner's values and life goals"
    'love_profile:OG_39': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'OG_39',
      axisWeights: {
        'empathy': 1.0,                  // Primary: Understanding partner
        'respect': 0.9,                  // Primary: Respecting values
        'perspective_taking': 0.8,       // High: Seeing from their view
        'altruism': 0.7,                 // Secondary: Supporting partner
        'cooperation': 0.6,              // Secondary: Joint planning
        // MBTI personality type scales
        'feeling': 0.4,
        'intuition': 0.2,
      },
      note: 'Empathy + respect + perspective-taking + altruism + cooperation',
    ),

    // OG_40: "I avoid certainty and prefer undefined relationships" (REVERSED)
    'love_profile:OG_40': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'OG_40',
      axisWeights: {
        'commitment': 1.0,               // Primary: Commitment (reversed)
        'ambiguity_tolerance': 0.9,      // Primary: Preferring ambiguity (reversed)
        'fear_of_commitment': 0.8,       // High: Commitment avoidance (reversed)
        'avoidant_attachment': 0.7,      // Secondary: Avoidant pattern (reversed)
        'clarity': 0.6,                  // Secondary: Defining relationship (reversed)
        // MBTI personality type scales
        'perceiving': 0.4,
      },
      note: 'Reversed: low commitment + high ambiguity tolerance + fear of commitment + avoidant attachment',
    ),

    // ========================================================================
    // FACTOR 5: DR (Доверие и ревность / Trust & Jealousy) - Q41-50
    // ========================================================================

    // DR_41: "I trust my partner even when we're not together"
    'love_profile:DR_41': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'DR_41',
      axisWeights: {
        'trust': 1.0,                    // Primary: Basic trust
        'secure_attachment': 0.9,        // Primary: Attachment security
        'anxiety': 0.8,                  // High: Low anxiety (reversed)
        'jealousy': 0.7,                 // Secondary: Low jealousy (reversed)
        'faith': 0.6,                    // Secondary: Belief in partner
      },
      note: 'Trust + secure attachment + low anxiety + low jealousy + faith',
    ),

    // DR_42: "I know how to distinguish facts from my fantasies"
    'love_profile:DR_42': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'DR_42',
      axisWeights: {
        'reality_testing': 1.0,          // Primary: Reality vs fantasy
        'cognitive_flexibility': 0.9,    // Primary: Thinking flexibility
        'emotional_regulation': 0.8,     // High: Managing emotions
        'rationality': 0.7,              // Secondary: Logical thinking
        'paranoia': 0.6,                 // Secondary: Low paranoia (reversed)
        // MBTI personality type scales
        'thinking': 0.4,
        'sensing': 0.3,
      },
      note: 'Reality testing + cognitive flexibility + emotional regulation + rationality + low paranoia',
    ),

    // DR_43: "I can directly discuss what hurts me"
    'love_profile:DR_43': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'DR_43',
      axisWeights: {
        'assertiveness': 1.0,            // Primary: Speaking up
        'vulnerability_sharing': 0.9,    // Primary: Sharing pain
        'emotional_openness': 0.8,       // High: Expressing feelings
        'courage': 0.7,                  // Secondary: Facing conflict
        'communication_skills': 0.6,     // Secondary: Effective expression
      },
      note: 'Assertiveness + vulnerability + emotional openness + courage + communication',
    ),

    // DR_44: "I don't control my partner's messages and social media"
    'love_profile:DR_44': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'DR_44',
      axisWeights: {
        'trust': 1.0,                    // Primary: Trusting partner
        'respect': 0.9,                  // Primary: Respecting privacy
        'jealousy': 0.8,                 // High: Low jealousy (reversed)
        'anxious_attachment': 0.7,       // Secondary: Low anxiety (reversed)
        'control': 0.6,                  // Secondary: Low controlling (reversed)
      },
      note: 'Trust + respect + low jealousy + low anxious attachment + low control',
    ),

    // DR_45: "I respect boundaries and personal space"
    'love_profile:DR_45': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'DR_45',
      axisWeights: {
        'respect': 1.0,                  // Primary: Respecting boundaries
        'boundary_setting': 0.9,         // Primary: Recognizing boundaries
        'autonomy_support': 0.8,         // High: Supporting independence
        'empathy': 0.7,                  // Secondary: Understanding needs
        'trust': 0.6,                    // Secondary: Trusting space
      },
      note: 'Respect + boundary setting + autonomy support + empathy + trust',
    ),

    // DR_46: "Any delay causes a storm of suspicion in me" (REVERSED)
    'love_profile:DR_46': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'DR_46',
      axisWeights: {
        'jealousy': 1.0,                 // Primary: Jealous reactions (reversed)
        'anxious_attachment': 0.9,       // Primary: Anxious pattern (reversed)
        'trust': 0.8,                    // High: Low trust (reversed)
        'paranoia': 0.7,                 // Secondary: Suspicious thinking (reversed)
        'emotional_reactivity': 0.6,     // Secondary: Strong reactions (reversed)
      },
      note: 'Reversed: high jealousy + anxious attachment + low trust + paranoia + emotional reactivity',
    ),

    // DR_47: "I don't compare myself to my partner's exes"
    'love_profile:DR_47': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'DR_47',
      axisWeights: {
        'self_esteem': 1.0,              // Primary: Secure self-worth
        'secure_attachment': 0.9,        // Primary: Attachment security
        'jealousy': 0.8,                 // High: Low jealousy (reversed)
        'self_monitoring': 0.7,          // Secondary: Low social comparison (reversed)
        'confidence': 0.6,               // Secondary: Self-confidence
      },
      note: 'Self-esteem + secure attachment + low jealousy + low comparison + confidence',
    ),

    // DR_48: "I know how to calm myself during jealousy triggers"
    'love_profile:DR_48': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'DR_48',
      axisWeights: {
        'emotional_regulation': 1.0,     // Primary: Managing emotions
        'self_soothing': 0.9,            // Primary: Calming self
        'coping_skills': 0.8,            // High: Effective coping
        'mindfulness_coping': 0.7,       // Secondary: Mindful awareness
        'self_efficacy': 0.6,            // Secondary: Confidence in coping
      },
      note: 'Emotional regulation + self-soothing + coping skills + mindfulness + self-efficacy',
    ),

    // DR_49: "I believe we can clarify misunderstandings"
    'love_profile:DR_49': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'DR_49',
      axisWeights: {
        'trust': 1.0,                    // Primary: Trust in resolution
        'optimism': 0.9,                 // Primary: Positive outlook
        'communication_confidence': 0.8, // High: Belief in communication
        'hope': 0.7,                     // Secondary: Hopeful attitude
        'problem_solving': 0.6,          // Secondary: Solution-focused
        // MBTI personality type scales
        'intuition': 0.2,
      },
      note: 'Trust + optimism + communication confidence + hope + problem-solving',
    ),

    // DR_50: "It's hard for me to trust even without reason" (REVERSED)
    'love_profile:DR_50': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'DR_50',
      axisWeights: {
        'trust': 1.0,                    // Primary: Trust capacity (reversed)
        'anxious_attachment': 0.9,       // Primary: Anxious pattern (reversed)
        'paranoia': 0.8,                 // High: Suspicious thinking (reversed)
        'past_trauma': 0.7,              // Secondary: Past hurt (reversed)
        'secure_attachment': 0.6,        // Secondary: Security (reversed)
      },
      note: 'Reversed: low trust + anxious attachment + paranoia + past trauma + insecurity',
    ),

    // ========================================================================
    // FACTOR 6: KK (Коммуникация и конфликт / Communication & Conflict) - Q51-60
    // ========================================================================

    // KK_51: "I talk about myself using 'I-messages'"
    'love_profile:KK_51': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'KK_51',
      axisWeights: {
        'assertiveness': 1.0,            // Primary: Assertive communication
        'communication_skills': 0.9,     // Primary: Effective communication
        'self_awareness': 0.8,           // High: Knowing own feelings
        'responsibility': 0.7,           // Secondary: Taking ownership
        'clarity': 0.6,                  // Secondary: Clear expression
      },
      note: 'Assertiveness + communication skills + self-awareness + responsibility + clarity',
    ),

    // KK_52: "In conflict, I try to understand rather than win"
    'love_profile:KK_52': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'KK_52',
      axisWeights: {
        'empathy': 1.0,                  // Primary: Understanding other
        'cooperation': 0.9,              // Primary: Collaborative approach
        'conflict_resolution': 0.8,      // High: Resolving conflicts
        'humility': 0.7,                 // Secondary: Not needing to win
        'perspective_taking': 0.6,       // Secondary: Seeing their view
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Empathy + cooperation + conflict resolution + humility + perspective-taking',
    ),

    // KK_53: "I know how to take a break and return to the topic later"
    'love_profile:KK_53': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'KK_53',
      axisWeights: {
        'emotional_regulation': 1.0,     // Primary: Managing emotions
        'self_control': 0.9,             // Primary: Controlling impulses
        'conflict_management': 0.8,      // High: Managing conflicts
        'wisdom': 0.7,                   // Secondary: Strategic timing
        'patience': 0.6,                 // Secondary: Waiting when needed
        // MBTI personality type scales
        'judging': 0.3,
      },
      note: 'Emotional regulation + self-control + conflict management + wisdom + patience',
    ),

    // KK_54: "I rephrase in my own words to check understanding"
    'love_profile:KK_54': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'KK_54',
      axisWeights: {
        'active_listening': 1.0,         // Primary: Listening skill
        'communication_skills': 0.9,     // Primary: Effective communication
        'empathy': 0.8,                  // High: Understanding other
        'diligence': 0.7,                // Secondary: Careful attention
        'clarity': 0.6,                  // Secondary: Ensuring clarity
      },
      note: 'Active listening + communication skills + empathy + diligence + clarity',
    ),

    // KK_55: "I notice and express gratitude to my partner"
    'love_profile:KK_55': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'KK_55',
      axisWeights: {
        'gratitude': 1.0,                // Primary: Being grateful
        'appreciation': 0.9,             // Primary: Appreciating partner
        'positive_communication': 0.8,   // High: Positive expression
        'attentiveness': 0.7,            // Secondary: Noticing actions
        'warmth': 0.6,                   // Secondary: Warm expression
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Gratitude + appreciation + positive communication + attentiveness + warmth',
    ),

    // KK_56: "In arguments, I often attack the person" (REVERSED)
    'love_profile:KK_56': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'KK_56',
      axisWeights: {
        'anger': 1.0,                    // Primary: Angry behavior (reversed)
        'emotional_control': 0.9,        // Primary: Control (reversed)
        'hostility': 0.8,                // High: Hostile behavior (reversed)
        'respect': 0.7,                  // Secondary: Respect (reversed)
        'empathy': 0.6,                  // Secondary: Empathy (reversed)
        // MBTI personality type scales
        'thinking': 0.3,
      },
      note: 'Reversed: high anger + low emotional control + hostility + low respect + low empathy',
    ),

    // KK_57: "I can ask for what I need specifically and clearly"
    'love_profile:KK_57': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'KK_57',
      axisWeights: {
        'assertiveness': 1.0,            // Primary: Assertive asking
        'clarity': 0.9,                  // Primary: Clear expression
        'communication_skills': 0.8,     // High: Effective communication
        'self_awareness': 0.7,           // Secondary: Knowing needs
        'directness': 0.6,               // Secondary: Direct communication
      },
      note: 'Assertiveness + clarity + communication skills + self-awareness + directness',
    ),

    // KK_58: "I distinguish criticism of behavior from criticism of personality"
    'love_profile:KK_58': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'KK_58',
      axisWeights: {
        'emotional_intelligence': 1.0,   // Primary: Emotional understanding
        'cognitive_flexibility': 0.9,    // Primary: Flexible thinking
        'fairness': 0.8,                 // High: Fair judgment
        'perspective_taking': 0.7,       // Secondary: Seeing difference
        'wisdom': 0.6,                   // Secondary: Mature understanding
        // MBTI personality type scales
        'thinking': 0.4,
        'intuition': 0.2,
      },
      note: 'EI + cognitive flexibility + fairness + perspective-taking + wisdom',
    ),

    // KK_59: "I know how to end conflicts with agreement"
    'love_profile:KK_59': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'KK_59',
      axisWeights: {
        'conflict_resolution': 1.0,      // Primary: Resolving conflicts
        'negotiation': 0.9,              // Primary: Reaching agreement
        'cooperation': 0.8,              // High: Working together
        'compromise': 0.7,               // Secondary: Finding middle ground
        'communication_skills': 0.6,     // Secondary: Effective communication
      },
      note: 'Conflict resolution + negotiation + cooperation + compromise + communication',
    ),

    // KK_60: "I often stay silent, accumulate, and explode later" (REVERSED)
    'love_profile:KK_60': const QuestionWeight(
      testId: 'love_profile',
      questionId: 'KK_60',
      axisWeights: {
        'passive_aggression': 1.0,       // Primary: Passive-aggressive pattern (reversed)
        'anger': 0.9,                    // Primary: Anger buildup (reversed)
        'emotional_dysregulation': 0.8,  // High: Poor regulation (reversed)
        'assertiveness': 0.7,            // Secondary: Low assertiveness (reversed)
        'communication_avoidance': 0.6,  // Secondary: Avoiding communication (reversed)
        // MBTI personality type scales
        'introversion': 0.3,
      },
      note: 'Reversed: passive-aggression + anger + emotional dysregulation + low assertiveness + avoidance',
    ),
  };

  /// Get weights for a specific question
  static QuestionWeight? getWeights(String testId, String questionId) {
    return weights['$testId:$questionId'];
  }

  /// Get all weights for a test
  static List<QuestionWeight> getTestWeights(String testId) {
    return weights.values
        .where((w) => w.testId == testId)
        .toList();
  }

  /// Check if per-question weights are defined for a test
  static bool hasWeights(String testId, String questionId) {
    return weights.containsKey('$testId:$questionId');
  }
}
