import 'question_weight_models.dart';

/// Question weights configuration for Creative Type Test
/// Maps 48 questions to ~195 hierarchical psychological scales
///
/// Test measures 8 creativity dimensions:
/// - visual_creator (Q1-7, 41-48) - visual thinking and aesthetics
/// - verbal_creator (Q8-14, 41-48) - linguistic and narrative creativity
/// - systematic_creator (Q15-21, 41-48) - structural and analytical creativity
/// - emotional_creator (Q22-28, 41-48) - emotional expression through creativity
/// - experimental_creator (Q29-35, 41-48) - experimentation and rule-breaking
/// - social_creator (Q36-40, 41-48) - collaborative creativity
/// - blockers (Q1-40) - obstacles to creative process
/// - inspiration_sources (Q1-40, 41-48) - sources of creative energy
class CreativeTypeWeights {
  /// CREATIVE TYPE TEST - 48 Questions
  ///
  /// Based on modern creativity theories (Guilford, Torrance),
  /// Gardner's multiple intelligences, and Csikszentmihalyi's flow concept
  /// Each question maps to 6-12 axes with psychological rationale
  /// Weight categories: Primary (0.8-1.2), Secondary (0.4-0.7), Tertiary (0.2-0.3)
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // VISUAL CREATOR QUESTIONS (q1-7)
    // Visual thinking, aesthetic sensitivity, image-based creativity
    // ========================================================================

    // Q1: "When explaining an idea, I draw diagrams, charts, or sketches"
    // Visual communication preference
    'creative_type_v1:q1': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q1',
      axisWeights: {
        'spatial_reasoning': 1.2,              // Primary: Visual-spatial thinking
        'nonverbal_communication': 1.0,        // Primary: Visual communication
        'originality': 0.8,                    // High: Creative visual expression
        'elaboration': 0.6,                    // Secondary: Detailed visual thinking
        'cognitive_flexibility': 0.5,          // Secondary: Multiple representation modes
        'abstract_reasoning': 0.5,             // Secondary: Concept visualization
        'intellectual_curiosity': 0.4,         // Moderate: Exploratory thinking
        'actions': 0.4,                        // Moderate: Behavioral creativity (Openness)
        // Personality Type scales
        'intuition': 0.3,
        'perceiving': 0.2,
      },
      note: 'Visual communication: spatial reasoning + nonverbal expression + visual originality',
    ),

    // Q2: "I save screenshots or images that evoke some feeling, even if I don't know why"
    // Visual inspiration collection + emotional aesthetics
    'creative_type_v1:q2': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q2',
      axisWeights: {
        'aesthetics': 1.2,                     // Primary: Aesthetic sensitivity (Openness)
        'feelings': 1.0,                       // Primary: Emotional awareness (Openness)
        'artistic_appreciation': 0.9,          // High: Visual art sensitivity
        'intuition': 0.7,                      // Secondary: Intuitive recognition
        'emotional_intelligence': 0.6,         // Secondary: Emotion-aesthetic connection
        'curiosity': 0.5,                      // Secondary: Exploratory collection
        'fantasy': 0.4,                        // Moderate: Visual imagination (Openness)
        'novelty_seeking': 0.4,                // Moderate: New visual stimuli
        // Personality Type scales
        'feeling': 0.3,
        'perceiving': 0.3,
      },
      note: 'Visual-emotional collection: aesthetics + feelings + artistic appreciation',
    ),

    // Q3: "I notice colors, lighting, composition in everyday life"
    // Aesthetic awareness in environment
    'creative_type_v1:q3': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q3',
      axisWeights: {
        'aesthetics': 1.3,                     // Primary: Core aesthetic sensitivity
        'attention_control': 1.0,              // Primary: Focused attention on details
        'spatial_reasoning': 0.8,              // High: Spatial-visual awareness
        'artistic_appreciation': 0.7,          // Secondary: Art sensitivity
        'mindfulness_coping': 0.6,             // Secondary: Present-moment awareness
        'curiosity': 0.5,                      // Secondary: Environmental exploration
        'environmental_mastery': 0.4,          // Moderate: Environmental engagement
        'feelings': 0.4,                       // Moderate: Emotional aesthetics connection
        // Personality Type scales
        'sensing': 0.3,
        'perceiving': 0.2,
      },
      note: 'Aesthetic awareness: aesthetics + attention + spatial reasoning + mindfulness',
    ),

    // Q4: "I think in images rather than words"
    // Visual thinking dominance
    'creative_type_v1:q4': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q4',
      axisWeights: {
        'spatial_reasoning': 1.4,              // Primary: Dominant visual thinking
        'fantasy': 1.0,                        // Primary: Visual imagination (Openness)
        'abstract_reasoning': 0.7,             // Secondary: Visual abstraction
        'cognitive_flexibility': 0.6,          // Secondary: Alternative thinking modes
        'verbal_intelligence': -0.5,           // Moderate: Lower verbal dominance (reversed)
        'nonverbal_communication': 0.5,        // Secondary: Visual expression preference
        'originality': 0.5,                    // Secondary: Unique visual thinking
        // Personality Type scales
        'intuition': 0.4,
        'perceiving': 0.3,
      },
      note: 'Visual thinking dominance: spatial + fantasy + abstract reasoning',
    ),

    // Q5: "My work must be visually appealing"
    // Aesthetic standards for creative output
    'creative_type_v1:q5': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q5',
      axisWeights: {
        'aesthetics': 1.3,                     // Primary: Visual quality priority
        'perfectionism': 0.9,                  // High: High aesthetic standards
        'drive_for_excellence': 0.8,           // High: Quality-focused
        'artistic_appreciation': 0.7,          // Secondary: Art sensitivity
        'achievement_striving': 0.6,           // Secondary: High standards pursuit
        'order': 0.5,                          // Secondary: Visual organization
        'self_consciousness': 0.4,             // Moderate: Social presentation concern
        'elaboration': 0.4,                    // Moderate: Detailed refinement
        // Personality Type scales
        'judging': 0.3,
        'sensing': 0.2,
      },
      note: 'Aesthetic perfectionism: aesthetics + perfectionism + excellence drive',
    ),

    // Q6: "I can spend hours choosing the right color or font"
    // Aesthetic detail attention + perfectionism
    'creative_type_v1:q6': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q6',
      axisWeights: {
        'perfectionism': 1.2,                  // Primary: Detail perfectionism
        'aesthetics': 1.1,                     // Primary: Visual detail sensitivity
        'attention_control': 0.9,              // High: Sustained focus on details
        'persistence': 0.8,                    // High: Long-term focus
        'elaboration': 0.7,                    // Secondary: Detail elaboration
        'patience': 0.6,                       // Secondary: Tolerance for detail work
        'impulsiveness': -0.5,                 // Moderate: Low impulsivity (reversed)
        'decisiveness_behavior': -0.4,         // Moderate: Careful decisions (reversed)
        // Personality Type scales
        'judging': 0.4,
        'sensing': 0.3,
      },
      note: 'Aesthetic perfectionism: perfectionism + aesthetics + attention + persistence',
    ),

    // Q7: "I create mood boards or visual collections for projects"
    // Visual preparation and inspiration collection
    'creative_type_v1:q7': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q7',
      axisWeights: {
        'aesthetics': 1.1,                     // Primary: Visual curation
        'organization': 1.0,                   // Primary: Visual organization
        'elaboration': 0.8,                    // High: Detailed visual planning
        'strategic_thinking': 0.7,             // Secondary: Planning approach
        'artistic_appreciation': 0.6,          // Secondary: Art collection
        'curiosity': 0.5,                      // Secondary: Visual exploration
        'order': 0.5,                          // Secondary: Structured collection
        'persistence': 0.4,                    // Moderate: Collection effort
        // Personality Type scales
        'judging': 0.3,
        'intuition': 0.3,
      },
      note: 'Visual preparation: aesthetics + organization + elaboration + strategic thinking',
    ),

    // ========================================================================
    // VERBAL CREATOR QUESTIONS (q8-14)
    // Linguistic creativity, storytelling, conceptual thinking
    // ========================================================================

    // Q8: "I make up stories or dialogues in my head"
    // Internal narrative creativity
    'creative_type_v1:q8': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q8',
      axisWeights: {
        'fantasy': 1.3,                        // Primary: Imaginative narratives (Openness)
        'verbal_intelligence': 1.1,            // Primary: Linguistic ability
        'originality': 0.9,                    // High: Creative storytelling
        'fluency': 0.8,                        // High: Idea generation
        'curiosity': 0.6,                      // Secondary: Narrative exploration
        'ideas': 0.6,                          // Secondary: Conceptual thinking (Openness)
        'feelings': 0.5,                       // Secondary: Emotional narratives
        'intellectual_curiosity': 0.5,         // Secondary: Mental exploration
        // Personality Type scales
        'intuition': 0.4,
        'feeling': 0.3,
        'perceiving': 0.2,
      },
      note: 'Internal narratives: fantasy + verbal intelligence + originality + fluency',
    ),

    // Q9: "I love playing with words, puns, metaphors"
    // Linguistic playfulness and creativity
    'creative_type_v1:q9': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q9',
      axisWeights: {
        'verbal_intelligence': 1.3,            // Primary: Language mastery
        'humor': 1.1,                          // Primary: Linguistic humor
        'originality': 1.0,                    // Primary: Creative language use
        'fluency': 0.8,                        // High: Wordplay generation
        'flexibility_creative': 0.7,           // Secondary: Semantic flexibility
        'cognitive_flexibility': 0.6,          // Secondary: Mental agility
        'playfulness': 0.6,                    // Secondary: Playful attitude
        'intellectual_curiosity': 0.5,         // Secondary: Language exploration
        // Personality Type scales
        'extraversion': 0.3,
        'intuition': 0.3,
        'perceiving': 0.2,
      },
      note: 'Linguistic playfulness: verbal intelligence + humor + originality + fluency',
    ),

    // Q10: "I can talk for hours on topics that interest me"
    // Verbal expressiveness and passion
    'creative_type_v1:q10': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q10',
      axisWeights: {
        'verbal_communication': 1.2,           // Primary: Verbal expressiveness
        'intellectual_curiosity': 1.0,         // Primary: Topic engagement
        'gregariousness': 0.8,                 // High: Social engagement
        'expressiveness': 0.8,                 // High: Emotional expression
        'passion_vitality': 0.7,               // Secondary: Passionate engagement
        'positive_emotions': 0.6,              // Secondary: Energetic communication
        'ideas': 0.6,                          // Secondary: Conceptual depth (Openness)
        'warmth': 0.5,                         // Secondary: Social warmth
        // Personality Type scales
        'extraversion': 0.5,
        'intuition': 0.3,
      },
      note: 'Verbal expressiveness: verbal communication + intellectual curiosity + gregariousness',
    ),

    // Q11: "I write down my thoughts, ideas, observations"
    // Written reflection and idea capture
    'creative_type_v1:q11': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q11',
      axisWeights: {
        'self_awareness': 1.1,                 // Primary: Reflective awareness
        'verbal_intelligence': 1.0,            // Primary: Written expression
        'ideas': 0.9,                          // High: Conceptual thinking (Openness)
        'intellectual_curiosity': 0.7,         // Secondary: Exploratory thinking
        'deliberation': 0.6,                   // Secondary: Thoughtful processing
        'organization': 0.6,                   // Secondary: Idea organization
        'originality': 0.5,                    // Secondary: Unique insights
        'mindfulness_coping': 0.4,             // Moderate: Present awareness
        // Personality Type scales
        'introversion': 0.4,
        'intuition': 0.3,
        'judging': 0.2,
      },
      note: 'Written reflection: self-awareness + verbal intelligence + ideas + intellectual curiosity',
    ),

    // Q12: "I come up with names, titles, slogans easily"
    // Linguistic creativity and naming ability
    'creative_type_v1:q12': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q12',
      axisWeights: {
        'originality': 1.2,                    // Primary: Creative naming
        'fluency': 1.1,                        // Primary: Rapid idea generation
        'verbal_intelligence': 1.0,            // Primary: Linguistic skill
        'abstract_reasoning': 0.7,             // Secondary: Conceptual abstraction
        'convergent_thinking': 0.6,            // Secondary: Focused creativity
        'cognitive_flexibility': 0.6,          // Secondary: Semantic flexibility
        'elaboration': 0.5,                    // Secondary: Refinement ability
        'decisiveness_behavior': 0.4,          // Moderate: Quick decisions
        // Personality Type scales
        'intuition': 0.4,
        'perceiving': 0.2,
      },
      note: 'Linguistic creativity: originality + fluency + verbal intelligence + abstraction',
    ),

    // Q13: "I notice linguistic patterns, rhythms, sounds of words"
    // Phonological and structural linguistic awareness
    'creative_type_v1:q13': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q13',
      axisWeights: {
        'verbal_intelligence': 1.2,            // Primary: Linguistic sophistication
        'attention_control': 1.0,              // Primary: Pattern attention
        'aesthetics': 0.8,                     // High: Linguistic aesthetics
        'analytical_thinking': 0.7,            // Secondary: Pattern analysis
        'intellectual_curiosity': 0.6,         // Secondary: Language exploration
        'mindfulness_coping': 0.5,             // Secondary: Attentive awareness
        'abstract_reasoning': 0.5,             // Secondary: Pattern recognition
        'curiosity': 0.5,                      // Secondary: Linguistic curiosity
        // Personality Type scales
        'sensing': 0.3,
        'thinking': 0.3,
      },
      note: 'Linguistic awareness: verbal intelligence + attention + aesthetics + analytical thinking',
    ),

    // Q14: "It's important for me that my texts read beautifully"
    // Stylistic perfectionism and prose aesthetics
    'creative_type_v1:q14': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q14',
      axisWeights: {
        'aesthetics': 1.1,                     // Primary: Linguistic aesthetics
        'perfectionism': 1.0,                  // Primary: Writing standards
        'verbal_intelligence': 0.9,            // High: Language mastery
        'elaboration': 0.8,                    // High: Refinement effort
        'drive_for_excellence': 0.7,           // Secondary: Quality pursuit
        'achievement_striving': 0.6,           // Secondary: High standards
        'persistence': 0.5,                    // Secondary: Revision effort
        'self_consciousness': 0.4,             // Moderate: Reader awareness
        // Personality Type scales
        'judging': 0.3,
        'feeling': 0.2,
      },
      note: 'Linguistic perfectionism: aesthetics + perfectionism + verbal intelligence + elaboration',
    ),

    // ========================================================================
    // SYSTEMATIC CREATOR QUESTIONS (q15-21)
    // Structural thinking, logical creativity, systems design
    // ========================================================================

    // Q15: "I enjoy creating systems, frameworks, structures"
    // Systems thinking and structural creativity
    'creative_type_v1:q15': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q15',
      axisWeights: {
        'strategic_thinking': 1.3,             // Primary: System design
        'organization': 1.1,                   // Primary: Structural thinking
        'analytical_thinking': 1.0,            // Primary: Logical analysis
        'convergent_thinking': 0.8,            // High: Focused problem-solving
        'abstract_reasoning': 0.7,             // Secondary: Conceptual frameworks
        'order': 0.7,                          // Secondary: Systematic order
        'originality': 0.6,                    // Secondary: Creative systems
        'elaboration': 0.5,                    // Secondary: Detailed structure
        // Personality Type scales
        'thinking': 0.4,
        'judging': 0.4,
        'intuition': 0.2,
      },
      note: 'Systems thinking: strategic + organization + analytical + convergent thinking',
    ),

    // Q16: "I see patterns and connections everywhere"
    // Pattern recognition and relational thinking
    'creative_type_v1:q16': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q16',
      axisWeights: {
        'abstract_reasoning': 1.3,             // Primary: Pattern abstraction
        'analytical_thinking': 1.1,            // Primary: Pattern analysis
        'cognitive_flexibility': 0.9,          // High: Connecting diverse elements
        'intellectual_curiosity': 0.8,         // High: Exploratory thinking
        'ideas': 0.7,                          // Secondary: Conceptual connections (Openness)
        'attention_control': 0.6,              // Secondary: Pattern attention
        'originality': 0.6,                    // Secondary: Unique connections
        'convergent_thinking': 0.5,            // Secondary: Integration ability
        // Personality Type scales
        'intuition': 0.5,
        'thinking': 0.3,
      },
      note: 'Pattern recognition: abstract + analytical + cognitive flexibility + intellectual curiosity',
    ),

    // Q17: "I love organizing information into categories, lists, diagrams"
    // Information structuring and categorization
    'creative_type_v1:q17': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q17',
      axisWeights: {
        'organization': 1.4,                   // Primary: Dominant organizational drive
        'order': 1.2,                          // Primary: Systematic ordering
        'analytical_thinking': 0.8,            // High: Logical categorization
        'deliberation': 0.7,                   // Secondary: Thoughtful organization
        'diligence': 0.6,                      // Secondary: Careful work
        'attention_control': 0.6,              // Secondary: Focused organization
        'convergent_thinking': 0.5,            // Secondary: Integration
        'elaboration': 0.5,                    // Secondary: Detailed structuring
        // Personality Type scales
        'judging': 0.5,
        'sensing': 0.3,
        'thinking': 0.3,
      },
      note: 'Information structuring: organization + order + analytical + deliberation',
    ),

    // Q18: "I can optimize and improve any process"
    // Process optimization and efficiency thinking
    'creative_type_v1:q18': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q18',
      axisWeights: {
        'strategic_thinking': 1.2,             // Primary: Strategic optimization
        'analytical_thinking': 1.1,            // Primary: Process analysis
        'problem_solving': 1.0,                // Primary: Solution finding
        'convergent_thinking': 0.8,            // High: Focused improvement
        'drive_for_excellence': 0.7,           // Secondary: Improvement motivation
        'cognitive_flexibility': 0.6,          // Secondary: Alternative approaches
        'originality': 0.6,                    // Secondary: Creative solutions
        'self_efficacy': 0.5,                  // Secondary: Confidence in ability
        // Personality Type scales
        'thinking': 0.4,
        'judging': 0.3,
      },
      note: 'Process optimization: strategic + analytical + problem-solving + convergent thinking',
    ),

    // Q19: "I get satisfaction from logical consistency"
    // Logical coherence appreciation
    'creative_type_v1:q19': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q19',
      axisWeights: {
        'analytical_thinking': 1.3,            // Primary: Logical thinking
        'critical_thinking': 1.1,              // Primary: Evaluative reasoning
        'convergent_thinking': 0.8,            // High: Coherent solutions
        'perfectionism': 0.7,                  // Secondary: Logical perfectionism
        'order': 0.7,                          // Secondary: Systematic order
        'intellectual_curiosity': 0.6,         // Secondary: Logical exploration
        'deliberation': 0.6,                   // Secondary: Careful reasoning
        'achievement_striving': 0.5,           // Secondary: Standards pursuit
        // Personality Type scales
        'thinking': 0.5,
        'judging': 0.3,
      },
      note: 'Logical consistency: analytical + critical thinking + convergent + perfectionism',
    ),

    // Q20: "I can visualize complex relationships between elements"
    // Systems visualization and relational thinking
    'creative_type_v1:q20': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q20',
      axisWeights: {
        'abstract_reasoning': 1.3,             // Primary: Abstract relationship thinking
        'spatial_reasoning': 1.0,              // Primary: Spatial-relational visualization
        'analytical_thinking': 0.9,            // High: Relationship analysis
        'cognitive_flexibility': 0.8,          // High: Multiple perspectives
        'strategic_thinking': 0.7,             // Secondary: Systems thinking
        'intellectual_curiosity': 0.6,         // Secondary: Exploratory thinking
        'originality': 0.5,                    // Secondary: Unique visualizations
        'working_memory': 0.5,                 // Secondary: Complex holding
        // Personality Type scales
        'intuition': 0.4,
        'thinking': 0.3,
      },
      note: 'Systems visualization: abstract + spatial reasoning + analytical + cognitive flexibility',
    ),

    // Q21: "I create algorithms, step-by-step plans"
    // Procedural thinking and sequential planning
    'creative_type_v1:q21': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q21',
      axisWeights: {
        'strategic_thinking': 1.2,             // Primary: Planning ability
        'organization': 1.1,                   // Primary: Structural organization
        'deliberation': 1.0,                   // Primary: Careful planning
        'analytical_thinking': 0.8,            // High: Logical sequencing
        'order': 0.7,                          // Secondary: Systematic order
        'convergent_thinking': 0.7,            // Secondary: Focused solutions
        'persistence': 0.6,                    // Secondary: Planning effort
        'problem_solving': 0.6,                // Secondary: Solution design
        // Personality Type scales
        'judging': 0.5,
        'thinking': 0.4,
        'sensing': 0.2,
      },
      note: 'Procedural planning: strategic + organization + deliberation + analytical thinking',
    ),

    // ========================================================================
    // EMOTIONAL CREATOR QUESTIONS (q22-28)
    // Emotional expression, mood-based creativity, atmosphere creation
    // ========================================================================

    // Q22: "My creativity depends heavily on my mood"
    // Mood-creativity connection
    'creative_type_v1:q22': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q22',
      axisWeights: {
        'feelings': 1.3,                       // Primary: Emotion-driven (Openness)
        'emotional_reactivity': 1.1,           // Primary: Mood sensitivity
        'mood_stability': -0.8,                // High: Mood variability (reversed)
        'emotional_intelligence': 0.7,         // Secondary: Emotion awareness
        'fantasy': 0.6,                        // Secondary: Mood-imagination link
        'vulnerability': 0.6,                  // Secondary: Emotional openness
        'self_awareness': 0.5,                 // Secondary: Mood recognition
        'passion_vitality': 0.5,               // Secondary: Emotional energy
        // Personality Type scales
        'feeling': 0.4,
        'perceiving': 0.3,
      },
      note: 'Mood-creativity link: feelings + emotional reactivity + low mood stability',
    ),

    // Q23: "I want my work to evoke specific emotions"
    // Intentional emotional communication
    'creative_type_v1:q23': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q23',
      axisWeights: {
        'emotional_intelligence': 1.2,         // Primary: Emotional understanding
        'empathy': 1.0,                        // Primary: Emotional resonance
        'expressiveness': 0.9,                 // High: Emotional expression
        'feelings': 0.8,                       // High: Emotion focus (Openness)
        'charisma': 0.7,                       // Secondary: Emotional impact
        'social_perception': 0.6,              // Secondary: Audience awareness
        'originality': 0.6,                    // Secondary: Unique emotional expression
        'compassion': 0.5,                     // Secondary: Emotional connection
        // Personality Type scales
        'feeling': 0.5,
        'extraversion': 0.3,
      },
      note: 'Emotional communication: emotional intelligence + empathy + expressiveness + feelings',
    ),

    // Q24: "I can feel the 'vibe' or atmosphere of places/works"
    // Atmospheric sensitivity and emotional perception
    'creative_type_v1:q24': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q24',
      axisWeights: {
        'feelings': 1.3,                       // Primary: Deep emotional sensing (Openness)
        'emotional_intelligence': 1.1,         // Primary: Emotion recognition
        'social_perception': 0.9,              // High: Environmental sensing
        'empathy': 0.8,                        // High: Emotional resonance
        'aesthetics': 0.7,                     // Secondary: Aesthetic-emotional link
        'curiosity': 0.7,                      // Secondary: Exploratory sensing
        'mindfulness_coping': 0.6,             // Secondary: Present awareness
        'vulnerability': 0.5,                  // Secondary: Emotional openness
        // Personality Type scales
        'feeling': 0.5,
        'intuition': 0.4,
        'sensing': 0.2,
      },
      note: 'Atmospheric sensitivity: feelings + emotional intelligence + social perception + empathy',
    ),

    // Q25: "I create to express what's hard to put into words"
    // Emotional expression through creativity
    'creative_type_v1:q25': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q25',
      axisWeights: {
        'feelings': 1.4,                       // Primary: Core emotional expression (Openness)
        'vulnerability_sharing': 1.0,          // Primary: Emotional openness
        'expressiveness': 0.9,                 // High: Non-verbal expression
        'originality': 0.8,                    // High: Unique expression
        'emotional_intelligence': 0.7,         // Secondary: Emotion understanding
        'fantasy': 0.6,                        // Secondary: Imaginative expression
        'authenticity': 0.6,                   // Secondary: Genuine expression
        'self_awareness': 0.6,                 // Secondary: Internal awareness
        // Personality Type scales
        'feeling': 0.5,
        'intuition': 0.3,
      },
      note: 'Emotional expression: feelings + vulnerability sharing + expressiveness + originality',
    ),

    // Q26: "I find inspiration in music and its emotional impact"
    // Musical-emotional inspiration
    'creative_type_v1:q26': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q26',
      axisWeights: {
        'aesthetics': 1.2,                     // Primary: Aesthetic sensitivity (Openness)
        'feelings': 1.1,                       // Primary: Emotional resonance (Openness)
        'artistic_appreciation': 1.0,          // Primary: Art sensitivity
        'emotional_intelligence': 0.7,         // Secondary: Emotion-art connection
        'actions': 0.7,                        // Secondary: Receptivity (Openness)
        'mood_stability': -0.5,                // Moderate: Emotional variability (reversed)
        'passion_vitality': 0.5,               // Secondary: Emotional energy
        'fantasy': 0.5,                        // Secondary: Imaginative response
        // Personality Type scales
        'feeling': 0.4,
        'perceiving': 0.2,
      },
      note: 'Musical inspiration: aesthetics + feelings + artistic appreciation + emotional intelligence',
    ),

    // Q27: "I work best when I'm emotionally charged"
    // Emotional arousal and creative energy
    'creative_type_v1:q27': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q27',
      axisWeights: {
        'passion_vitality': 1.3,               // Primary: Emotional energy
        'feelings': 1.1,                       // Primary: Emotion-driven (Openness)
        'emotional_reactivity': 0.9,           // High: Emotional activation
        'expressiveness': 0.8,                 // High: Emotional expression
        'activity': 0.7,                       // Secondary: Energy level
        'excitement_seeking': 0.6,             // Secondary: Stimulation seeking
        'mood_stability': -0.6,                // Secondary: Emotional variability (reversed)
        'intrinsic_motivation': 0.5,           // Secondary: Internal drive
        // Personality Type scales
        'feeling': 0.4,
        'extraversion': 0.3,
        'perceiving': 0.2,
      },
      note: 'Emotional energy: passion + feelings + emotional reactivity + expressiveness',
    ),

    // Q28: "I sense subtle emotional nuances in people and works"
    // Emotional nuance perception and sensitivity
    'creative_type_v1:q28': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q28',
      axisWeights: {
        'emotional_intelligence': 1.3,         // Primary: Emotion recognition
        'empathy': 1.2,                        // Primary: Emotional attunement
        'social_perception': 1.0,              // Primary: Subtle cue reading
        'feelings': 0.9,                       // High: Emotional awareness (Openness)
        'curiosity': 0.7,                      // Secondary: Exploratory sensitivity
        'tender_mindedness': 0.6,              // Secondary: Emotional sensitivity
        'mindfulness_coping': 0.5,             // Secondary: Attentive awareness
        'attention_control': 0.5,              // Secondary: Focused attention
        // Personality Type scales
        'feeling': 0.5,
        'intuition': 0.4,
      },
      note: 'Emotional sensitivity: emotional intelligence + empathy + social perception + feelings',
    ),

    // ========================================================================
    // EXPERIMENTAL CREATOR QUESTIONS (q29-35)
    // Experimentation, rule-breaking, spontaneous creativity
    // ========================================================================

    // Q29: "I love trying new techniques, even if they fail"
    // Experimental mindset and risk-taking
    'creative_type_v1:q29': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q29',
      axisWeights: {
        'risk_taking_creative': 1.4,           // Primary: Creative risk-taking
        'novelty_seeking': 1.2,                // Primary: New experience seeking
        'curiosity': 1.0,                      // Primary: Exploratory drive
        'growth_mindset': 0.8,                 // High: Learning from failure
        'flexibility_creative': 0.7,           // Secondary: Creative adaptability
        'actions': 0.7,                        // Secondary: Behavioral openness (Openness)
        'resilience_meta': 0.6,                // Secondary: Resilience to failure
        'harm_avoidance': -0.5,                // Moderate: Low fear of failure (reversed)
        // Personality Type scales
        'perceiving': 0.4,
        'intuition': 0.3,
      },
      note: 'Experimental mindset: creative risk + novelty seeking + curiosity + growth mindset',
    ),

    // Q30: "I mix styles, genres, approaches without fear"
    // Creative boundary-crossing and hybridization
    'creative_type_v1:q30': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q30',
      axisWeights: {
        'originality': 1.3,                    // Primary: Unique combinations
        'flexibility_creative': 1.2,           // Primary: Creative flexibility
        'cognitive_flexibility': 1.0,          // Primary: Mental flexibility
        'novelty_seeking': 0.9,                // High: New combinations
        'risk_taking_creative': 0.8,           // High: Creative boldness
        'divergent_thinking': 0.7,             // Secondary: Alternative thinking
        'self_efficacy': 0.6,                  // Secondary: Creative confidence
        'conformity': -0.5,                    // Moderate: Non-conformity (reversed)
        // Personality Type scales
        'perceiving': 0.4,
        'intuition': 0.4,
      },
      note: 'Creative hybridization: originality + creative flexibility + cognitive flexibility + novelty',
    ),

    // Q31: "My process is chaotic, but it works for me"
    // Spontaneous creative process and tolerance for chaos
    'creative_type_v1:q31': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q31',
      axisWeights: {
        'spontaneity': 1.3,                    // Primary: Unplanned approach
        'order': -1.1,                         // Primary: Low need for order (reversed)
        'flexibility_creative': 0.9,           // High: Adaptive process
        'self_efficacy': 0.8,                  // High: Confidence in own process
        'authenticity': 0.7,                   // Secondary: True to self
        'organization': -0.6,                  // Secondary: Low organization (reversed)
        'impulsivity_behavior': 0.5,           // Secondary: Spontaneous action
        'deliberation': -0.5,                  // Moderate: Low pre-planning (reversed)
        // Personality Type scales
        'perceiving': 0.6,
        'intuition': 0.3,
      },
      note: 'Chaotic process: spontaneity + low order + creative flexibility + self-efficacy',
    ),

    // Q32: "I break rules just to see what happens"
    // Rule-breaking and experimental curiosity
    'creative_type_v1:q32': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q32',
      axisWeights: {
        'risk_taking_creative': 1.3,           // Primary: Creative rule-breaking
        'curiosity': 1.2,                      // Primary: Experimental curiosity
        'conformity': -1.0,                    // Primary: Non-conformity (reversed)
        'novelty_seeking': 0.9,                // High: New experience seeking
        'originality': 0.8,                    // High: Unique approaches
        'flexibility_creative': 0.6,           // Secondary: Creative flexibility
        'harm_avoidance': -0.5,                // Moderate: Low risk aversion (reversed)
        // Personality Type scales
        'perceiving': 0.5,
        'intuition': 0.3,
      },
      note: 'Rule-breaking: creative risk + curiosity + non-conformity + novelty seeking',
    ),

    // Q33: "I start multiple projects simultaneously"
    // Parallel creativity and multi-tasking
    'creative_type_v1:q33': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q33',
      axisWeights: {
        'fluency': 1.2,                        // Primary: Multiple idea generation
        'activity': 1.1,                       // Primary: High energy level
        'excitement_seeking': 0.9,             // High: Stimulation through variety
        'divergent_thinking': 0.8,             // High: Multiple directions
        'impulsivity_behavior': 0.7,           // Secondary: Spontaneous initiation
        'self_discipline': -0.6,               // Secondary: Lower completion focus (reversed)
        'novelty_seeking': 0.6,                // Secondary: Variety seeking
        'attention_control': -0.5,             // Moderate: Divided attention (reversed)
        // Personality Type scales
        'perceiving': 0.5,
        'extraversion': 0.3,
      },
      note: 'Parallel creativity: fluency + activity + excitement seeking + divergent thinking',
    ),

    // Q34: "I find inspiration in randomness and accidents"
    // Serendipitous creativity and openness to chance
    'creative_type_v1:q34': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q34',
      axisWeights: {
        'flexibility_creative': 1.3,           // Primary: Adaptive creativity
        'novelty_seeking': 1.1,                // Primary: Unexpected stimuli seeking
        'curiosity': 1.0,                      // Primary: Exploratory openness
        'cognitive_flexibility': 0.9,          // High: Mental adaptability
        'originality': 0.7,                    // Secondary: Unique interpretations
        'spontaneity': 0.7,                    // Secondary: Spontaneous response
        'actions': 0.6,                        // Secondary: New experiences (Openness)
        'deliberation': -0.5,                  // Moderate: Less pre-planning (reversed)
        // Personality Type scales
        'perceiving': 0.5,
        'intuition': 0.4,
      },
      note: 'Serendipitous creativity: creative flexibility + novelty + curiosity + cognitive flexibility',
    ),

    // Q35: "I prefer improvisation to planning"
    // Improvisational approach and spontaneity
    'creative_type_v1:q35': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q35',
      axisWeights: {
        'spontaneity': 1.4,                    // Primary: Spontaneous action
        'deliberation': -1.1,                  // Primary: Low planning (reversed)
        'flexibility_creative': 1.0,           // Primary: Adaptive creativity
        'impulsivity_behavior': 0.8,           // High: Quick action
        'risk_taking_creative': 0.7,           // Secondary: Creative risk
        'actions': 0.7,                        // Secondary: Behavioral variety (Openness)
        'self_efficacy': 0.6,                  // Secondary: Confidence in improvisation
        'organization': -0.5,                  // Moderate: Low structure (reversed)
        // Personality Type scales
        'perceiving': 0.6,
        'extraversion': 0.3,
      },
      note: 'Improvisational style: spontaneity + low deliberation + creative flexibility + impulsivity',
    ),

    // ========================================================================
    // SOCIAL CREATOR QUESTIONS (q36-40)
    // Collaborative creativity, social inspiration, dialogue-based creation
    // ========================================================================

    // Q36: "I get best ideas during conversations"
    // Dialogical creativity and social stimulation
    'creative_type_v1:q36': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q36',
      axisWeights: {
        'gregariousness': 1.3,                 // Primary: Social engagement
        'verbal_communication': 1.1,           // Primary: Conversational thinking
        'social_perception': 0.9,              // High: Social cue responsiveness
        'fluency': 0.8,                        // High: Idea generation in dialogue
        'expressiveness': 0.7,                 // Secondary: Social expression
        'warmth': 0.6,                         // Secondary: Social connection
        'cognitive_flexibility': 0.6,          // Secondary: Responsive thinking
        'affiliation_motivation': 0.6,         // Secondary: Social drive
        // Personality Type scales
        'extraversion': 0.6,
        'feeling': 0.3,
      },
      note: 'Dialogical creativity: gregariousness + verbal communication + social perception + fluency',
    ),

    // Q37: "I love collaborations and brainstorming"
    // Collaborative creativity and group synergy
    'creative_type_v1:q37': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q37',
      axisWeights: {
        'cooperativeness': 1.3,                // Primary: Collaborative orientation
        'gregariousness': 1.1,                 // Primary: Social engagement
        'team_building': 1.0,                  // Primary: Group work preference
        'fluency': 0.9,                        // High: Collective idea generation
        'warmth': 0.7,                         // Secondary: Social warmth
        'affiliation_motivation': 0.7,         // Secondary: Social connection drive
        'ideas': 0.6,                          // Secondary: Receptivity to others (Openness)
        'expressiveness': 0.6,                 // Secondary: Group expression
        // Personality Type scales
        'extraversion': 0.5,
        'feeling': 0.3,
        'perceiving': 0.2,
      },
      note: 'Collaborative creativity: cooperativeness + gregariousness + teamwork + fluency',
    ),

    // Q38: "Others' feedback significantly influences my work"
    // Social responsiveness and feedback integration
    'creative_type_v1:q38': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q38',
      axisWeights: {
        'social_perception': 1.2,              // Primary: Social feedback sensitivity
        'cognitive_flexibility': 1.0,          // Primary: Adaptive to feedback
        'modesty': 0.9,                        // High: Openness to others' views
        'self_consciousness': 0.8,             // High: Social evaluation awareness
        'cooperativeness': 0.7,                // Secondary: Collaborative orientation
        'affiliation_motivation': 0.6,         // Secondary: Social connection value
        'growth_mindset': 0.6,                 // Secondary: Learning from feedback
        'authenticity': -0.5,                  // Moderate: Less self-focused (reversed)
        // Personality Type scales
        'feeling': 0.4,
        'extraversion': 0.3,
      },
      note: 'Feedback responsiveness: social perception + cognitive flexibility + modesty + self-consciousness',
    ),

    // Q39: "I draw inspiration from people around me"
    // Social inspiration and interpersonal creativity
    'creative_type_v1:q39': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q39',
      axisWeights: {
        'social_perception': 1.3,              // Primary: Social awareness
        'empathy': 1.1,                        // Primary: Interpersonal resonance
        'gregariousness': 0.9,                 // High: Social engagement
        'curiosity': 0.8,                      // High: Interest in people
        'affiliation_motivation': 0.7,         // Secondary: Social connection drive
        'emotional_intelligence': 0.7,         // Secondary: Social-emotional awareness
        'warmth': 0.6,                         // Secondary: Social connection
        'intellectual_curiosity': 0.5,         // Secondary: Understanding people
        // Personality Type scales
        'extraversion': 0.5,
        'feeling': 0.4,
      },
      note: 'Social inspiration: social perception + empathy + gregariousness + curiosity',
    ),

    // Q40: "Creative energy comes from sharing and discussing"
    // Social creative energy and collaborative stimulation
    'creative_type_v1:q40': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q40',
      axisWeights: {
        'gregariousness': 1.3,                 // Primary: Social energy source
        'expressiveness': 1.1,                 // Primary: Social expression
        'affiliation_motivation': 1.0,         // Primary: Social drive
        'verbal_communication': 0.9,           // High: Communicative energy
        'warmth': 0.7,                         // Secondary: Social warmth
        'positive_emotions': 0.7,              // Secondary: Social excitement
        'cooperativeness': 0.6,                // Secondary: Collaborative orientation
        'activity': 0.6,                       // Secondary: Social activity level
        // Personality Type scales
        'extraversion': 0.6,
        'feeling': 0.3,
      },
      note: 'Social creative energy: gregariousness + expressiveness + affiliation + verbal communication',
    ),

    // ========================================================================
    // MULTIPLE CHOICE QUESTIONS (q41-48)
    // These questions have answer-specific weights (see getAnswerWeights() in creative_type_data.dart)
    // Here we map ONLY the underlying psychological constructs being measured
    // NOT the test-specific factors (those are handled via getAnswerWeights())
    // ========================================================================

    // Q41: "When having creative block, I..." (5 options)
    // Assesses coping strategies and creative unblocking approaches
    'creative_type_v1:q41': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q41',
      axisWeights: {
        'problem_focused_coping': 0.8,         // Primary: Active problem-solving
        'cognitive_flexibility': 0.7,          // High: Strategy switching
        'persistence': 0.6,                    // Secondary: Continued effort
        'self_awareness': 0.5,                 // Secondary: Recognizing blocks
        'curiosity': 0.5,                      // Secondary: Exploratory coping
        'resilience_meta': 0.5,                // Secondary: Adaptive resilience
      },
      note: 'Creative unblocking: problem-focused coping + cognitive flexibility + persistence',
    ),

    // Q42: "My ideal project..." (6 options: visual/verbal/systematic/emotional/experimental/social)
    // Assesses preferred creative modality and project characteristics
    'creative_type_v1:q42': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q42',
      axisWeights: {
        'intrinsic_motivation': 1.0,           // Primary: Internal preferences
        'self_awareness': 0.8,                 // High: Self-knowledge
        'values': 0.7,                         // Secondary: Personal values (Openness)
        'authenticity': 0.6,                   // Secondary: True preferences
        'achievement_motivation': 0.6,         // Secondary: Goal alignment
        'passion_vitality': 0.5,               // Secondary: Energizing work
      },
      note: 'Project preferences: intrinsic motivation + self-awareness + values + authenticity',
    ),

    // Q43: "What I notice first in creative works..." (5 options)
    // Assesses perceptual priorities and aesthetic sensitivity
    'creative_type_v1:q43': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q43',
      axisWeights: {
        'attention_control': 1.0,              // Primary: Selective attention
        'aesthetics': 0.9,                     // High: Aesthetic sensitivity (Openness)
        'artistic_appreciation': 0.7,          // Secondary: Art perception
        'social_perception': 0.6,              // Secondary: Perceptual awareness
        'intellectual_curiosity': 0.6,         // Secondary: Exploratory attention
        'mindfulness_coping': 0.5,             // Secondary: Present awareness
      },
      note: 'Perceptual priorities: attention control + aesthetics + artistic appreciation',
    ),

    // Q44: "My work process..." (6 options describing work style)
    // Assesses creative work habits and process preferences
    'creative_type_v1:q44': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q44',
      axisWeights: {
        'self_awareness': 1.0,                 // Primary: Process awareness
        'authenticity': 0.8,                   // High: True to own process
        'self_efficacy': 0.7,                  // Secondary: Confidence in process
        'organization': 0.6,                   // Secondary: Work structuring
        'persistence': 0.6,                    // Secondary: Work commitment
        'flexibility_creative': 0.5,           // Secondary: Adaptive process
      },
      note: 'Work process: self-awareness + authenticity + self-efficacy + organization',
    ),

    // Q45: "I get energy from..." (6 options: various inspiration sources)
    // Assesses sources of creative energy and inspiration
    'creative_type_v1:q45': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q45',
      axisWeights: {
        'intrinsic_motivation': 1.0,           // Primary: Internal energy sources
        'curiosity': 0.9,                      // High: Exploratory drive
        'novelty_seeking': 0.7,                // Secondary: New stimuli seeking
        'ideas': 0.7,                          // Secondary: Receptivity (Openness)
        'passion_vitality': 0.6,               // Secondary: Energizing sources
        'intellectual_curiosity': 0.6,         // Secondary: Mental stimulation
      },
      note: 'Creative energy: intrinsic motivation + curiosity + novelty seeking + openness',
    ),

    // Q46: "If had to create now, I'd..." (6 options: different creation modes)
    // Assesses spontaneous creative response and preferred medium
    'creative_type_v1:q46': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q46',
      axisWeights: {
        'spontaneity': 0.9,                    // Primary: Immediate response
        'self_efficacy': 0.8,                  // High: Creative confidence
        'fluency': 0.7,                        // Secondary: Quick generation
        'originality': 0.6,                    // Secondary: Unique response
        'flexibility_creative': 0.6,           // Secondary: Adaptive creation
        'activity': 0.5,                       // Secondary: Action readiness
      },
      note: 'Spontaneous creation: spontaneity + self-efficacy + fluency + originality',
    ),

    // Q47: "Finished work for me..." (6 options: completion criteria)
    // Assesses completion standards and perfectionism
    'creative_type_v1:q47': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q47',
      axisWeights: {
        'perfectionism': 0.8,                  // High: Quality standards
        'achievement_striving': 0.7,           // Secondary: Completion drive
        'self_awareness': 0.7,                 // Secondary: Internal standards
        'drive_for_excellence': 0.6,           // Secondary: Quality pursuit
        'authenticity': 0.6,                   // Secondary: Personal criteria
        'cognitive_flexibility': 0.5,          // Secondary: Flexible completion
      },
      note: 'Completion standards: perfectionism + achievement striving + self-awareness',
    ),

    // Q48: "Main creative motivation..." (6 options: motivation types)
    // Assesses primary creative drives and motivations
    'creative_type_v1:q48': const QuestionWeight(
      testId: 'creative_type_v1',
      questionId: 'q48',
      axisWeights: {
        'intrinsic_motivation': 1.2,           // Primary: Internal drives
        'achievement_motivation': 0.9,         // High: Accomplishment drive
        'self_awareness': 0.7,                 // Secondary: Motivation awareness
        'values': 0.7,                         // Secondary: Personal values (Openness)
        'meaning_purpose': 0.6,                // Secondary: Purpose-driven
        'passion_vitality': 0.6,               // Secondary: Passionate engagement
      },
      note: 'Creative motivation: intrinsic motivation + achievement + self-awareness + values',
    ),
  };
}
