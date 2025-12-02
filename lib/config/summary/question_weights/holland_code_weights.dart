import 'question_weight_models.dart';

/// Question weights configuration for Holland Code Career Test
/// Maps 60 questions to ~195 hierarchical psychological scales
///
/// Test measures 6 RIASEC factors (based on Holland's Theory):
/// - realistic (R) - practical, hands-on, physical work
/// - investigative (I) - analytical, intellectual, scientific
/// - artistic (A) - creative, expressive, aesthetic
/// - social (S) - helping, teaching, interpersonal
/// - enterprising (E) - leading, persuading, business
/// - conventional (C) - organizing, detail-oriented, structured
class HollandCodeWeights {
  /// HOLLAND CODE TEST - 60 Questions
  ///
  /// Based on Holland's RIASEC model of career interests
  /// Each question maps career preferences to personality traits
  /// Weight categories: Primary (0.9-1.2), Secondary (0.5-0.8), Tertiary (0.2-0.4)
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // REALISTIC QUESTIONS (q1, 7, 13, 19, 25, 31, 37, 43, 49, 55)
    // Practical, hands-on, physical work preferences
    // ========================================================================

    // Q1: "Work with tools and machinery"
    'holland_code_v1:q1': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q1',
      axisWeights: {
        'practicality': 1.0,                  // Primary: Practical orientation
        'independence': 0.8,                  // High: Self-directed work
        'activity': 0.7,                      // Secondary: Physical activity
        'straightforwardness': 0.6,           // Secondary: Direct approach
        'endurance': 0.5,                     // Moderate: Physical stamina
        'introversion': 0.5,                  // Moderate: Less social interaction
        'sensing': 0.7,                       // High: Concrete focus
        'thinking': 0.5,                      // Moderate: Logical approach
      },
    ),

    // Q7: "Build or repair things with hands"
    'holland_code_v1:q7': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q7',
      axisWeights: {
        'practicality': 1.1,                  // Primary: Hands-on approach
        'competence': 0.8,                    // High: Skill mastery
        'achievement_striving': 0.6,          // Secondary: Tangible results
        'self_efficacy': 0.6,                 // Secondary: Confidence in abilities
        'persistence': 0.5,                    // Moderate: Task completion
        'introversion': 0.4,                  // Moderate: Solo work
        'sensing': 0.8,                       // High: Concrete focus
      },
    ),

    // Q13: "Work outdoors with nature or animals"
    'holland_code_v1:q13': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q13',
      axisWeights: {
        'nature_connection': 1.2,             // Primary: Nature affinity
        'independence': 0.8,                  // High: Autonomous work
        'activity': 0.8,                      // High: Physical engagement
        'adventure_seeking': 0.6,             // Secondary: Outdoor challenges
        'simplicity': 0.5,                    // Moderate: Simple pleasures
        'introversion': 0.5,                  // Moderate: Less social
        'sensing': 0.7,                       // High: Sensory experience
      },
    ),

    // Q19: "Operate vehicles or machinery"
    'holland_code_v1:q19': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q19',
      axisWeights: {
        'competence': 0.9,                    // Primary: Technical skill
        'independence': 0.8,                  // High: Solo operation
        'risk_taking': 0.6,                   // Secondary: Physical risk
        'self_reliance': 0.7,                 // Secondary: Self-sufficiency
        'focus': 0.6,                         // Secondary: Concentration
        'sensing': 0.8,                       // High: Sensory focus
        'thinking': 0.5,                      // Moderate: Logical operation
      },
    ),

    // Q25: "Work with electronics or computer hardware"
    'holland_code_v1:q25': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q25',
      axisWeights: {
        'competence': 1.0,                    // Primary: Technical expertise
        'analytical_thinking': 0.8,           // High: Problem-solving
        'detail_orientation': 0.7,            // Secondary: Precision
        'independence': 0.6,                  // Secondary: Solo work
        'persistence': 0.6,                    // Secondary: Troubleshooting
        'thinking': 0.8,                      // High: Logical approach
        'sensing': 0.6,                       // Secondary: Concrete focus
      },
    ),

    // Q31: "Engage in physical work or sports"
    'holland_code_v1:q31': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q31',
      axisWeights: {
        'activity': 1.2,                      // Primary: Physical energy
        'vitality': 1.0,                      // Primary: Physical vigor
        'competitiveness': 0.7,               // Secondary: Athletic competition
        'endurance': 0.8,                     // High: Stamina
        'achievement_striving': 0.6,          // Secondary: Performance goals
        'extraversion': 0.5,                  // Moderate: Team sports
        'sensing': 0.7,                       // High: Body awareness
      },
    ),

    // Q37: "Assemble or disassemble mechanisms"
    'holland_code_v1:q37': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q37',
      axisWeights: {
        'analytical_thinking': 0.9,           // Primary: System understanding
        'detail_orientation': 0.8,            // High: Precision work
        'patience': 0.7,                      // Secondary: Methodical approach
        'competence': 0.7,                    // Secondary: Technical skill
        'independence': 0.6,                  // Secondary: Solo work
        'thinking': 0.8,                      // High: Logical process
        'sensing': 0.7,                       // High: Hands-on focus
      },
    ),

    // Q43: "Work with agricultural or construction equipment"
    'holland_code_v1:q43': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q43',
      axisWeights: {
        'practicality': 1.1,                  // Primary: Practical work
        'endurance': 0.9,                     // High: Physical stamina
        'independence': 0.8,                  // High: Self-directed
        'traditionalism': 0.6,                // Secondary: Traditional work
        'simplicity': 0.5,                    // Moderate: Straightforward tasks
        'sensing': 0.8,                       // High: Concrete reality
        'introversion': 0.4,                  // Moderate: Less social
      },
    ),

    // Q49: "Repair broken equipment or machinery"
    'holland_code_v1:q49': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q49',
      axisWeights: {
        'problem_solving': 1.0,               // Primary: Troubleshooting
        'competence': 0.9,                    // Primary: Technical skill
        'persistence': 0.8,                    // High: Problem resolution
        'analytical_thinking': 0.7,           // Secondary: Diagnosis
        'independence': 0.7,                  // Secondary: Self-reliant
        'thinking': 0.8,                      // High: Logical analysis
        'sensing': 0.7,                       // High: Practical focus
      },
    ),

    // Q55: "Technical maintenance of buildings and structures"
    'holland_code_v1:q55': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q55',
      axisWeights: {
        'responsibility': 1.0,                // Primary: Maintenance duty
        'competence': 0.9,                    // Primary: Technical skill
        'dependability': 0.8,                 // High: Reliability
        'detail_orientation': 0.7,            // Secondary: Thoroughness
        'order': 0.6,                         // Secondary: Systematic approach
        'sensing': 0.8,                       // High: Practical focus
        'judging': 0.5,                       // Moderate: Structured approach
      },
    ),

    // ========================================================================
    // INVESTIGATIVE QUESTIONS (q2, 8, 14, 20, 26, 32, 38, 44, 50, 56)
    // Analytical, intellectual, scientific interests
    // ========================================================================

    // Q2: "Conduct scientific experiments and research"
    'holland_code_v1:q2': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q2',
      axisWeights: {
        'intellectual_curiosity': 1.2,        // Primary: Scientific curiosity
        'analytical_thinking': 1.0,           // Primary: Analytical mindset
        'openness_to_experience': 0.9,        // Primary: Intellectual openness
        'abstract_thinking': 0.8,             // High: Theoretical thinking
        'achievement_striving': 0.7,          // Secondary: Research goals
        'independence': 0.6,                  // Secondary: Independent inquiry
        'intuition': 0.8,                     // High: Pattern recognition
        'thinking': 0.9,                      // Primary: Logical analysis
      },
    ),

    // Q8: "Analyze data and look for patterns"
    'holland_code_v1:q8': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q8',
      axisWeights: {
        'analytical_thinking': 1.2,           // Primary: Data analysis
        'detail_orientation': 0.9,            // High: Pattern recognition
        'intellectual_curiosity': 0.8,        // High: Understanding patterns
        'focus': 0.8,                         // High: Concentration
        'abstract_thinking': 0.7,             // Secondary: Conceptual thinking
        'thinking': 1.0,                      // Primary: Logical process
        'intuition': 0.7,                     // Secondary: Pattern insight
      },
    ),

    // Q14: "Solve complex mathematical or scientific problems"
    'holland_code_v1:q14': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q14',
      axisWeights: {
        'analytical_thinking': 1.2,           // Primary: Problem solving
        'intellectual_curiosity': 1.0,        // Primary: Intellectual challenge
        'abstract_thinking': 0.9,             // High: Abstract reasoning
        'persistence': 0.8,                    // High: Problem persistence
        'achievement_striving': 0.7,          // Secondary: Solution achievement
        'thinking': 1.0,                      // Primary: Logical reasoning
        'intuition': 0.6,                     // Secondary: Insight
      },
    ),

    // Q20: "Read scientific articles and books"
    'holland_code_v1:q20': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q20',
      axisWeights: {
        'intellectual_curiosity': 1.1,        // Primary: Knowledge seeking
        'openness_to_experience': 0.9,        // High: Learning openness
        'academic_interest': 0.9,             // High: Scholarly interest
        'abstract_thinking': 0.7,             // Secondary: Theoretical understanding
        'independence': 0.6,                  // Secondary: Self-directed learning
        'intuition': 0.7,                     // Secondary: Conceptual grasp
        'introversion': 0.5,                  // Moderate: Solitary study
      },
    ),

    // Q26: "Study new theories and concepts"
    'holland_code_v1:q26': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q26',
      axisWeights: {
        'openness_to_experience': 1.1,        // Primary: Intellectual openness
        'intellectual_curiosity': 1.0,        // Primary: Theoretical interest
        'abstract_thinking': 0.9,             // High: Conceptual thinking
        'learning_orientation': 0.8,          // High: Continuous learning
        'complexity_tolerance': 0.7,          // Secondary: Complex ideas
        'intuition': 0.9,                     // High: Abstract patterns
        'thinking': 0.7,                      // Secondary: Logical analysis
      },
    ),

    // Q32: "Conduct laboratory research"
    'holland_code_v1:q32': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q32',
      axisWeights: {
        'methodicalness': 1.0,                // Primary: Research methodology
        'detail_orientation': 0.9,            // High: Precise procedures
        'analytical_thinking': 0.9,           // High: Scientific analysis
        'patience': 0.8,                      // High: Long-term research
        'objectivity': 0.8,                   // High: Scientific objectivity
        'thinking': 0.9,                      // High: Logical approach
        'sensing': 0.6,                       // Secondary: Empirical focus
      },
    ),

    // Q38: "Develop new methods for solving problems"
    'holland_code_v1:q38': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q38',
      axisWeights: {
        'innovation': 1.1,                    // Primary: Innovative thinking
        'problem_solving': 1.0,               // Primary: Solution development
        'analytical_thinking': 0.9,           // High: Methodological thinking
        'openness_to_experience': 0.8,        // High: New approaches
        'independence': 0.7,                  // Secondary: Original thinking
        'intuition': 0.9,                     // High: Creative insight
        'thinking': 0.8,                      // High: Logical innovation
      },
    ),

    // Q44: "Study causes of natural phenomena"
    'holland_code_v1:q44': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q44',
      axisWeights: {
        'intellectual_curiosity': 1.2,        // Primary: Scientific curiosity
        'nature_connection': 0.8,             // High: Natural world interest
        'analytical_thinking': 0.9,           // High: Causal analysis
        'abstract_thinking': 0.8,             // High: Theoretical understanding
        'openness_to_experience': 0.7,        // Secondary: Wonder
        'intuition': 0.8,                     // High: Pattern recognition
        'thinking': 0.8,                      // High: Scientific reasoning
      },
    ),

    // Q50: "Develop computer programs or algorithms"
    'holland_code_v1:q50': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q50',
      axisWeights: {
        'analytical_thinking': 1.2,           // Primary: Algorithmic thinking
        'problem_solving': 1.0,               // Primary: Coding solutions
        'abstract_thinking': 0.9,             // High: Abstract logic
        'detail_orientation': 0.8,            // High: Code precision
        'persistence': 0.8,                    // High: Debugging persistence
        'thinking': 1.0,                      // Primary: Logical structure
        'introversion': 0.5,                  // Moderate: Solo coding
      },
    ),

    // Q56: "Research new medical drugs or technologies"
    'holland_code_v1:q56': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q56',
      axisWeights: {
        'altruism': 0.9,                      // High: Helping through research
        'intellectual_curiosity': 1.0,        // Primary: Medical research
        'analytical_thinking': 0.9,           // High: Scientific analysis
        'achievement_striving': 0.8,          // High: Research breakthroughs
        'responsibility': 0.8,                // High: Ethical research
        'thinking': 0.9,                      // High: Scientific method
        'feeling': 0.5,                       // Moderate: Human impact
      },
    ),

    // ========================================================================
    // ARTISTIC QUESTIONS (q3, 9, 15, 21, 27, 33, 39, 45, 51, 57)
    // Creative, expressive, aesthetic interests
    // ========================================================================

    // Q3: "Create artistic or design works"
    'holland_code_v1:q3': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q3',
      axisWeights: {
        'aesthetics': 1.2,                    // Primary: Artistic appreciation
        'openness_to_experience': 1.0,        // Primary: Creative openness
        'imagination': 1.0,                   // Primary: Creative imagination
        'self_expression': 0.9,               // High: Personal expression
        'independence': 0.7,                  // Secondary: Creative freedom
        'intuition': 0.9,                     // High: Creative intuition
        'feeling': 0.7,                       // Secondary: Emotional expression
        'perceiving': 0.6,                    // Secondary: Flexible creativity
      },
    ),

    // Q9: "Write creative texts or music"
    'holland_code_v1:q9': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q9',
      axisWeights: {
        'imagination': 1.1,                   // Primary: Creative imagination
        'self_expression': 1.0,               // Primary: Artistic expression
        'openness_to_experience': 0.9,        // High: Creative openness
        'emotional_depth': 0.8,               // High: Emotional expression
        'independence': 0.7,                  // Secondary: Creative autonomy
        'intuition': 0.9,                     // High: Creative insight
        'feeling': 0.8,                       // High: Emotional content
      },
    ),

    // Q15: "Play musical instrument or sing"
    'holland_code_v1:q15': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q15',
      axisWeights: {
        'aesthetics': 1.1,                    // Primary: Musical appreciation
        'self_expression': 0.9,               // High: Musical expression
        'emotional_expression': 0.8,          // High: Emotional outlet
        'discipline': 0.7,                    // Secondary: Practice discipline
        'perfectionism': 0.6,                 // Secondary: Performance quality
        'feeling': 0.8,                       // High: Emotional connection
        'sensing': 0.6,                       // Secondary: Sensory experience
      },
    ),

    // Q21: "Create original visual images"
    'holland_code_v1:q21': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q21',
      axisWeights: {
        'imagination': 1.2,                   // Primary: Visual imagination
        'aesthetics': 1.0,                    // Primary: Visual aesthetics
        'openness_to_experience': 0.9,        // High: Creative openness
        'originality': 0.9,                   // High: Original vision
        'independence': 0.7,                  // Secondary: Creative autonomy
        'intuition': 0.9,                     // High: Visual intuition
        'perceiving': 0.7,                    // Secondary: Open exploration
      },
    ),

    // Q27: "Perform on stage or in front of camera"
    'holland_code_v1:q27': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q27',
      axisWeights: {
        'exhibitionism': 1.0,                 // Primary: Performance desire
        'self_expression': 1.0,               // Primary: Public expression
        'social_boldness': 0.9,               // High: Performance confidence
        'extraversion': 0.9,                  // High: Public engagement
        'excitement_seeking': 0.7,            // Secondary: Performance thrill
        'feeling': 0.7,                       // Secondary: Emotional performance
        'perceiving': 0.6,                    // Secondary: Spontaneity
      },
    ),

    // Q33: "Create something unique and unusual"
    'holland_code_v1:q33': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q33',
      axisWeights: {
        'originality': 1.2,                   // Primary: Unique creation
        'imagination': 1.0,                   // Primary: Creative imagination
        'openness_to_experience': 1.0,        // Primary: Creative openness
        'nonconformity': 0.8,                 // High: Breaking conventions
        'independence': 0.8,                  // High: Creative independence
        'intuition': 1.0,                     // Primary: Creative insight
        'perceiving': 0.7,                    // Secondary: Open possibilities
      },
    ),

    // Q39: "Work on film or theatrical production"
    'holland_code_v1:q39': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q39',
      axisWeights: {
        'collaboration': 0.9,                 // High: Team creativity
        'aesthetics': 1.0,                    // Primary: Artistic production
        'imagination': 0.9,                   // High: Creative vision
        'social_engagement': 0.7,             // Secondary: Team interaction
        'excitement_seeking': 0.6,            // Secondary: Production energy
        'feeling': 0.7,                       // Secondary: Emotional storytelling
        'extraversion': 0.6,                  // Secondary: Team collaboration
      },
    ),

    // Q45: "Develop fashion or interior design"
    'holland_code_v1:q45': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q45',
      axisWeights: {
        'aesthetics': 1.2,                    // Primary: Design aesthetics
        'style_consciousness': 1.0,           // Primary: Fashion/style sense
        'detail_orientation': 0.8,            // High: Design details
        'openness_to_experience': 0.8,        // High: Design trends
        'perfectionism': 0.7,                 // Secondary: Design quality
        'sensing': 0.7,                       // Secondary: Material focus
        'feeling': 0.6,                       // Secondary: Emotional design
      },
    ),

    // Q51: "Take artistic photos or videos"
    'holland_code_v1:q51': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q51',
      axisWeights: {
        'aesthetics': 1.1,                    // Primary: Visual aesthetics
        'observation_skills': 0.9,            // High: Visual observation
        'imagination': 0.9,                   // High: Creative vision
        'patience': 0.7,                      // Secondary: Perfect shot patience
        'independence': 0.7,                  // Secondary: Solo creativity
        'sensing': 0.8,                       // High: Visual perception
        'intuition': 0.7,                     // Secondary: Composition intuition
      },
    ),

    // Q57: "Create scripts or literary works"
    'holland_code_v1:q57': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q57',
      axisWeights: {
        'imagination': 1.2,                   // Primary: Narrative imagination
        'verbal_fluency': 1.0,                // Primary: Writing ability
        'self_expression': 0.9,               // High: Literary expression
        'emotional_depth': 0.8,               // High: Character depth
        'independence': 0.8,                  // High: Solo writing
        'intuition': 0.9,                     // High: Story intuition
        'feeling': 0.8,                       // High: Emotional narratives
      },
    ),

    // ========================================================================
    // SOCIAL QUESTIONS (q4, 10, 16, 22, 28, 34, 40, 46, 52, 58)
    // Helping, teaching, interpersonal interests
    // ========================================================================

    // Q4: "Help people solve their problems"
    'holland_code_v1:q4': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q4',
      axisWeights: {
        'altruism': 1.2,                      // Primary: Helping orientation
        'empathy': 1.0,                       // Primary: Understanding others
        'compassion': 0.9,                    // High: Caring for others
        'social_engagement': 0.8,             // High: Interpersonal focus
        'warmth': 0.7,                        // Secondary: Personal warmth
        'feeling': 1.0,                       // Primary: Emotional focus
        'extraversion': 0.6,                  // Secondary: Social interaction
      },
    ),

    // Q10: "Teach or mentor other people"
    'holland_code_v1:q10': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q10',
      axisWeights: {
        'nurturance': 1.1,                    // Primary: Developmental care
        'patience': 0.9,                      // High: Teaching patience
        'communication_skills': 0.9,          // High: Clear instruction
        'altruism': 0.8,                      // High: Helping others grow
        'leadership': 0.6,                    // Secondary: Guiding role
        'feeling': 0.8,                       // High: Supportive approach
        'extraversion': 0.7,                  // Secondary: Social teaching
      },
    ),

    // Q16: "Counsel people on personal matters"
    'holland_code_v1:q16': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q16',
      axisWeights: {
        'empathy': 1.2,                       // Primary: Deep understanding
        'emotional_intelligence': 1.0,        // Primary: Emotional awareness
        'compassion': 0.9,                    // High: Caring support
        'trust': 0.8,                         // High: Trustworthy presence
        'patience': 0.7,                      // Secondary: Listening patience
        'feeling': 1.0,                       // Primary: Emotional focus
        'introversion': 0.4,                  // Moderate: Deep listening
      },
    ),

    // Q22: "Care for sick or elderly people"
    'holland_code_v1:q22': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q22',
      axisWeights: {
        'compassion': 1.2,                    // Primary: Caregiving compassion
        'altruism': 1.1,                      // Primary: Selfless service
        'patience': 0.9,                      // High: Care patience
        'tender_mindedness': 0.8,             // High: Gentle care
        'responsibility': 0.8,                // High: Care duty
        'feeling': 1.0,                       // Primary: Emotional care
        'sensing': 0.6,                       // Secondary: Physical care
      },
    ),

    // Q28: "Work with children or teenagers"
    'holland_code_v1:q28': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q28',
      axisWeights: {
        'nurturance': 1.1,                    // Primary: Youth development
        'playfulness': 0.9,                   // High: Youth engagement
        'patience': 0.9,                      // High: Youth patience
        'energy': 0.8,                        // High: Active engagement
        'flexibility': 0.7,                   // Secondary: Adaptive approach
        'feeling': 0.8,                       // High: Emotional connection
        'extraversion': 0.7,                  // Secondary: Social energy
      },
    ),

    // Q34: "Inspire and motivate other people"
    'holland_code_v1:q34': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q34',
      axisWeights: {
        'leadership': 1.0,                    // Primary: Inspirational leadership
        'charisma': 0.9,                      // High: Motivational presence
        'positive_emotions': 0.9,             // High: Positive influence
        'communication_skills': 0.8,          // High: Motivational speaking
        'enthusiasm': 0.8,                    // High: Contagious energy
        'extraversion': 0.9,                  // High: Social influence
        'feeling': 0.7,                       // Secondary: Emotional connection
      },
    ),

    // Q40: "Work in charitable or social organization"
    'holland_code_v1:q40': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q40',
      axisWeights: {
        'altruism': 1.2,                      // Primary: Social service
        'social_responsibility': 1.0,         // Primary: Community service
        'compassion': 0.9,                    // High: Social compassion
        'idealism': 0.8,                      // High: Social ideals
        'cooperation': 0.7,                   // Secondary: Team service
        'feeling': 0.9,                       // High: Value-driven
        'extraversion': 0.6,                  // Secondary: Social work
      },
    ),

    // Q46: "Organize group sessions or training"
    'holland_code_v1:q46': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q46',
      axisWeights: {
        'leadership': 0.9,                    // High: Group leadership
        'organization': 0.9,                  // High: Session planning
        'communication_skills': 0.9,          // High: Group facilitation
        'social_engagement': 0.8,             // High: Group dynamics
        'assertiveness': 0.7,                 // Secondary: Group management
        'extraversion': 0.9,                  // High: Group interaction
        'judging': 0.6,                       // Secondary: Structured approach
      },
    ),

    // Q52: "Provide psychological counseling"
    'holland_code_v1:q52': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q52',
      axisWeights: {
        'emotional_intelligence': 1.2,        // Primary: Psychological insight
        'empathy': 1.1,                       // Primary: Deep understanding
        'analytical_thinking': 0.8,           // High: Psychological analysis
        'patience': 0.8,                      // High: Therapeutic patience
        'trust': 0.8,                         // High: Therapeutic alliance
        'feeling': 0.9,                       // High: Emotional focus
        'intuition': 0.7,                     // Secondary: Psychological intuition
      },
    ),

    // Q58: "Develop educational programs"
    'holland_code_v1:q58': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q58',
      axisWeights: {
        'planning_skills': 1.0,               // Primary: Program design
        'nurturance': 0.9,                    // High: Educational care
        'organization': 0.9,                  // High: Curriculum structure
        'analytical_thinking': 0.7,           // Secondary: Needs analysis
        'social_responsibility': 0.7,         // Secondary: Educational mission
        'feeling': 0.7,                       // Secondary: Student focus
        'judging': 0.7,                       // Secondary: Structured planning
      },
    ),

    // ========================================================================
    // ENTERPRISING QUESTIONS (q5, 11, 17, 23, 29, 35, 41, 47, 53, 59)
    // Leadership, business, persuasion interests
    // ========================================================================

    // Q5: "Manage projects and lead people"
    'holland_code_v1:q5': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q5',
      axisWeights: {
        'leadership': 1.2,                    // Primary: Leadership drive
        'assertiveness': 1.0,                 // Primary: Directive approach
        'dominance': 0.9,                     // High: Control orientation
        'achievement_striving': 0.9,          // High: Goal achievement
        'self_confidence': 0.8,               // High: Leadership confidence
        'extraversion': 0.9,                  // High: Social leadership
        'thinking': 0.7,                      // Secondary: Strategic thinking
        'judging': 0.8,                       // High: Organized leadership
      },
    ),

    // Q11: "Sell ideas, products or services"
    'holland_code_v1:q11': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q11',
      axisWeights: {
        'persuasiveness': 1.1,                // Primary: Influence skills
        'social_boldness': 0.9,               // High: Sales confidence
        'achievement_striving': 0.9,          // High: Sales goals
        'competitiveness': 0.8,               // High: Sales competition
        'extraversion': 1.0,                  // Primary: Social selling
        'assertiveness': 0.8,                 // High: Sales assertion
        'thinking': 0.5,                      // Moderate: Strategic selling
      },
    ),

    // Q17: "Start own business or project"
    'holland_code_v1:q17': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q17',
      axisWeights: {
        'risk_taking': 1.1,                   // Primary: Entrepreneurial risk
        'independence': 1.0,                  // Primary: Business autonomy
        'achievement_striving': 1.0,          // Primary: Business success
        'self_confidence': 0.9,               // High: Entrepreneurial confidence
        'innovation': 0.8,                    // High: Business innovation
        'extraversion': 0.7,                  // Secondary: Business networking
        'intuition': 0.7,                     // Secondary: Business vision
      },
    ),

    // Q23: "Persuade others to your point of view"
    'holland_code_v1:q23': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q23',
      axisWeights: {
        'persuasiveness': 1.2,                // Primary: Persuasion skill
        'assertiveness': 1.0,                 // Primary: Argument assertion
        'dominance': 0.8,                     // High: Influence dominance
        'communication_skills': 0.8,          // High: Persuasive communication
        'self_confidence': 0.7,               // Secondary: Argument confidence
        'extraversion': 0.8,                  // High: Social persuasion
        'thinking': 0.7,                      // Secondary: Logical arguments
      },
    ),

    // Q29: "Make important business decisions"
    'holland_code_v1:q29': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q29',
      axisWeights: {
        'decisiveness': 1.1,                  // Primary: Decision making
        'responsibility': 0.9,                // High: Decision responsibility
        'analytical_thinking': 0.8,           // High: Decision analysis
        'risk_taking': 0.8,                   // High: Decision risk
        'self_confidence': 0.8,               // High: Decision confidence
        'thinking': 0.9,                      // High: Logical decisions
        'judging': 0.7,                       // Secondary: Decisive closure
      },
    ),

    // Q35: "Organize large events"
    'holland_code_v1:q35': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q35',
      axisWeights: {
        'organization': 1.1,                  // Primary: Event organization
        'leadership': 0.9,                    // High: Event leadership
        'planning_skills': 0.9,               // High: Event planning
        'social_engagement': 0.8,             // High: Social coordination
        'stress_tolerance': 0.7,              // Secondary: Event pressure
        'extraversion': 0.8,                  // High: Social events
        'judging': 0.8,                       // High: Structured planning
      },
    ),

    // Q41: "Negotiate and close deals"
    'holland_code_v1:q41': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q41',
      axisWeights: {
        'negotiation_skills': 1.2,            // Primary: Deal negotiation
        'persuasiveness': 1.0,                // Primary: Deal persuasion
        'competitiveness': 0.9,               // High: Deal competition
        'assertiveness': 0.9,                 // High: Negotiation assertion
        'achievement_striving': 0.8,          // High: Deal closure
        'extraversion': 0.8,                  // High: Social negotiation
        'thinking': 0.8,                      // High: Strategic negotiation
      },
    ),

    // Q47: "Develop company development strategy"
    'holland_code_v1:q47': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q47',
      axisWeights: {
        'strategic_thinking': 1.2,            // Primary: Strategic planning
        'analytical_thinking': 1.0,           // Primary: Strategic analysis
        'vision': 0.9,                        // High: Strategic vision
        'leadership': 0.9,                    // High: Strategic leadership
        'achievement_striving': 0.8,          // High: Strategic goals
        'intuition': 0.8,                     // High: Strategic insight
        'thinking': 0.9,                      // High: Strategic logic
      },
    ),

    // Q53: "Manage investments and financial assets"
    'holland_code_v1:q53': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q53',
      axisWeights: {
        'analytical_thinking': 1.0,           // Primary: Financial analysis
        'risk_assessment': 1.0,               // Primary: Investment risk
        'responsibility': 0.9,                // High: Financial responsibility
        'detail_orientation': 0.8,            // High: Financial details
        'achievement_striving': 0.8,          // High: Financial returns
        'thinking': 1.0,                      // Primary: Financial logic
        'judging': 0.7,                       // Secondary: Financial planning
      },
    ),

    // Q59: "Represent company at meetings and presentations"
    'holland_code_v1:q59': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q59',
      axisWeights: {
        'presentation_skills': 1.1,           // Primary: Public speaking
        'social_confidence': 1.0,             // Primary: Public confidence
        'professionalism': 0.9,               // High: Corporate representation
        'communication_skills': 0.9,          // High: Clear presentation
        'social_boldness': 0.8,               // High: Public presence
        'extraversion': 1.0,                  // Primary: Public engagement
        'thinking': 0.6,                      // Secondary: Logical presentation
      },
    ),

    // ========================================================================
    // CONVENTIONAL QUESTIONS (q6, 12, 18, 24, 30, 36, 42, 48, 54, 60)
    // Organizing, detail-oriented, structured interests
    // ========================================================================

    // Q6: "Organize data and create accounting systems"
    'holland_code_v1:q6': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q6',
      axisWeights: {
        'order': 1.2,                         // Primary: System organization
        'detail_orientation': 1.0,            // Primary: Data precision
        'methodicalness': 0.9,                // High: Systematic approach
        'organization': 0.9,                  // High: Structural organization
        'conscientiousness': 0.8,             // High: Thorough work
        'sensing': 0.8,                       // High: Concrete details
        'judging': 0.9,                       // High: Structured systems
      },
    ),

    // Q12: "Keep financial records and documents"
    'holland_code_v1:q12': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q12',
      axisWeights: {
        'responsibility': 1.0,                // Primary: Record keeping duty
        'detail_orientation': 1.0,            // Primary: Financial accuracy
        'dependability': 0.9,                 // High: Reliable records
        'organization': 0.8,                  // High: Document organization
        'conscientiousness': 0.8,             // High: Careful work
        'sensing': 0.8,                       // High: Factual focus
        'judging': 0.8,                       // High: Systematic approach
      },
    ),

    // Q18: "Work according to clear instructions and procedures"
    'holland_code_v1:q18': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q18',
      axisWeights: {
        'compliance': 1.1,                    // Primary: Rule following
        'dutifulness': 1.0,                   // Primary: Procedure adherence
        'traditionalism': 0.8,                // High: Conventional approach
        'security_need': 0.7,                 // Secondary: Structure security
        'dependability': 0.7,                 // Secondary: Reliable execution
        'sensing': 0.7,                       // Secondary: Concrete procedures
        'judging': 0.9,                       // High: Structured work
      },
    ),

    // Q24: "Verify accuracy of information and data"
    'holland_code_v1:q24': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q24',
      axisWeights: {
        'detail_orientation': 1.2,            // Primary: Accuracy checking
        'perfectionism': 0.9,                 // High: Error detection
        'thoroughness': 0.9,                  // High: Complete verification
        'analytical_thinking': 0.7,           // Secondary: Data analysis
        'conscientiousness': 0.8,             // High: Careful checking
        'sensing': 0.8,                       // High: Factual verification
        'thinking': 0.7,                      // Secondary: Logical checking
      },
    ),

    // Q30: "Sort and classify information"
    'holland_code_v1:q30': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q30',
      axisWeights: {
        'organization': 1.1,                  // Primary: Information organization
        'order': 1.0,                         // Primary: Systematic sorting
        'methodicalness': 0.9,                // High: Classification method
        'detail_orientation': 0.8,            // High: Category precision
        'patience': 0.6,                      // Secondary: Sorting patience
        'sensing': 0.8,                       // High: Concrete categories
        'judging': 0.8,                       // High: Structured classification
      },
    ),

    // Q36: "Follow established rules and standards"
    'holland_code_v1:q36': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q36',
      axisWeights: {
        'compliance': 1.2,                    // Primary: Rule adherence
        'dutifulness': 1.0,                   // Primary: Standard following
        'traditionalism': 0.9,                // High: Conventional values
        'security_need': 0.8,                 // High: Rule security
        'conformity': 0.7,                    // Secondary: Social conformity
        'sensing': 0.7,                       // Secondary: Established practice
        'judging': 0.9,                       // High: Rule structure
      },
    ),

    // Q42: "Prepare detailed reports and documentation"
    'holland_code_v1:q42': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q42',
      axisWeights: {
        'detail_orientation': 1.1,            // Primary: Report detail
        'thoroughness': 1.0,                  // Primary: Complete documentation
        'communication_skills': 0.8,          // High: Written communication
        'organization': 0.8,                  // High: Report structure
        'conscientiousness': 0.8,             // High: Careful documentation
        'sensing': 0.7,                       // Secondary: Factual reporting
        'judging': 0.7,                       // Secondary: Structured reports
      },
    ),

    // Q48: "Work with databases and spreadsheets"
    'holland_code_v1:q48': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q48',
      axisWeights: {
        'analytical_thinking': 0.9,           // High: Data analysis
        'detail_orientation': 1.0,            // Primary: Data accuracy
        'organization': 0.9,                  // High: Data organization
        'methodicalness': 0.8,                // High: Systematic data work
        'patience': 0.7,                      // Secondary: Data patience
        'thinking': 0.8,                      // High: Logical data work
        'sensing': 0.8,                       // High: Concrete data
      },
    ),

    // Q54: "Ensure compliance with legal norms and standards"
    'holland_code_v1:q54': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q54',
      axisWeights: {
        'responsibility': 1.1,                // Primary: Legal responsibility
        'compliance': 1.0,                    // Primary: Legal compliance
        'dutifulness': 0.9,                   // High: Legal duty
        'detail_orientation': 0.8,            // High: Legal precision
        'integrity': 0.8,                     // High: Ethical standards
        'judging': 0.9,                       // High: Legal structure
        'thinking': 0.7,                      // Secondary: Legal logic
      },
    ),

    // Q60: "Maintain archives and systematize documents"
    'holland_code_v1:q60': const QuestionWeight(
      testId: 'holland_code_v1',
      questionId: 'q60',
      axisWeights: {
        'organization': 1.2,                  // Primary: Archive organization
        'order': 1.0,                         // Primary: Systematic filing
        'methodicalness': 0.9,                // High: Archive method
        'patience': 0.8,                      // High: Archive patience
        'dependability': 0.8,                 // High: Archive reliability
        'sensing': 0.8,                       // High: Physical archives
        'judging': 0.9,                       // High: Archive structure
      },
    ),
  };
}