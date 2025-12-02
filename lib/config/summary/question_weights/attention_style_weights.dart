import 'question_weight_models.dart';

/// Question weights for Attention Style Test.
///
/// Maps 40 questions to psychological scales:
/// - Inattention (Q1-8) → attention_control, working_memory, organization, distractibility
/// - Hyperfocus (Q9-16) → cognitive_flexibility, attention_control, time_management
/// - Impulsivity (Q17-24) → impulsiveness, self_discipline, emotional_regulation
/// - Task Completion (Q25-32) → persistence, procrastination, self_discipline
/// - Task Switching (Q33-40) → cognitive_flexibility, attention_control, organization
///
/// All scales use existing hierarchical scales.
/// Scores: 0-4 (frequency scale: Never to Constantly)
class AttentionStyleWeights {
  static final Map<String, QuestionWeight> weights = {
    // Inattention (Q1-8)
    'attention_style:q1': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q1',
      axisWeights: {
        'attention_control': -0.9, // Easily distracted
        'concentration': -0.85,
        'focus': -0.8,
      },
    ),
    'attention_style:q2': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q2',
      axisWeights: {
        'working_memory': -0.9, // Forgetfulness
        'attention_control': -0.7,
        'organization': -0.6,
      },
    ),
    'attention_style:q3': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q3',
      axisWeights: {
        'attention_control': -0.85, // Can't follow long conversations
        'concentration': -0.85,
        'active_listening': -0.7,
      },
    ),
    'attention_style:q4': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q4',
      axisWeights: {
        'organization': -0.9, // Losing things
        'working_memory': -0.8,
        'attention_control': -0.7,
      },
    ),
    'attention_style:q5': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q5',
      axisWeights: {
        'attention_control': -0.85, // Missing details, careless mistakes
        'conscientiousness': -0.8,
        'attention_to_detail': -0.9,
      },
    ),
    'attention_style:q6': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q6',
      axisWeights: {
        'concentration': -0.85, // Hard to focus on boring tasks
        'self_discipline': -0.75,
        'attention_control': -0.8,
      },
    ),
    'attention_style:q7': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q7',
      axisWeights: {
        'attention_control': -0.8, // Daydreaming
        'focus': -0.8,
        'imagination': 0.6,
      },
    ),
    'attention_style:q8': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q8',
      axisWeights: {
        'working_memory': -0.9, // Forgetting meetings, deadlines
        'organization': -0.85,
        'reliability': -0.8,
      },
    ),

    // Hyperfocus (Q9-16)
    'attention_style:q9': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q9',
      axisWeights: {
        'concentration': 0.9, // Working for hours when interested
        'focus': 0.9,
        'passion': 0.7,
      },
    ),
    'attention_style:q10': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q10',
      axisWeights: {
        'concentration': 0.9, // Absorbed in task
        'focus': 0.9,
        'cognitive_flexibility': -0.6,
      },
    ),
    'attention_style:q11': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q11',
      axisWeights: {
        'concentration': 0.85, // Losing track of time
        'focus': 0.85,
        'time_management': -0.7,
      },
    ),
    'attention_style:q12': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q12',
      axisWeights: {
        'concentration': 0.85, // Hard to break away from interesting activity
        'focus': 0.8,
        'cognitive_flexibility': -0.7,
      },
    ),
    'attention_style:q13': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q13',
      axisWeights: {
        'concentration': 0.9, // Forgetting basic needs
        'focus': 0.85,
        'self_care': -0.7,
      },
    ),
    'attention_style:q14': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q14',
      axisWeights: {
        'concentration': 0.9, // Flow state
        'focus': 0.9,
        'absorption': 0.8,
      },
    ),
    'attention_style:q15': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q15',
      axisWeights: {
        'concentration': 0.85, // Working all night
        'passion': 0.8,
        'self_care': -0.7,
      },
    ),
    'attention_style:q16': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q16',
      axisWeights: {
        'concentration': 0.9, // Laser-like focus
        'focus': 0.95,
        'cognitive_flexibility': -0.6,
      },
    ),

    // Impulsivity (Q17-24)
    'attention_style:q17': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q17',
      axisWeights: {
        'impulsiveness': 0.9, // Acting without thinking
        'self_control': -0.85,
        'reflection': -0.7,
      },
    ),
    'attention_style:q18': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q18',
      axisWeights: {
        'impulsiveness': 0.85, // Interrupting others
        'self_control': -0.8,
        'active_listening': -0.75,
      },
    ),
    'attention_style:q19': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q19',
      axisWeights: {
        'impulsiveness': 0.9, // Impulse purchases
        'self_control': -0.85,
        'financial_discipline': -0.8,
      },
    ),
    'attention_style:q20': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q20',
      axisWeights: {
        'impulsiveness': 0.8, // Not rereading messages
        'self_control': -0.7,
        'attention_to_detail': -0.75,
      },
    ),
    'attention_style:q21': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q21',
      axisWeights: {
        'impulsiveness': 0.85, // Struggle to hold back emotions
        'emotional_regulation': -0.9,
        'self_control': -0.85,
      },
    ),
    'attention_style:q22': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q22',
      axisWeights: {
        'impulsiveness': 0.8, // Starting new without finishing

        'persistence': -0.85,
        'project_completion': -0.8,
      },
    ),
    'attention_style:q23': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q23',
      axisWeights: {
        'impulsiveness': 0.85, // Spontaneous decisions
        'planning': -0.7,
        'cognitive_flexibility': 0.5,
      },
    ),
    'attention_style:q24': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q24',
      axisWeights: {
        'impulsiveness': 0.75, // Can't sit still, fidgeting
        'self_control': -0.7,
        'restlessness': 0.8,
      },
    ),

    // Task Completion (Q25-32)
    'attention_style:q25': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q25',
      axisWeights: {
        'project_completion': -0.9, // Many unfinished projects
        'persistence': -0.85,
        'follow_through': -0.9,
      },
    ),
    'attention_style:q26': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q26',
      axisWeights: {
        'persistence': -0.85, // Hard to complete boring tasks
        'self_discipline': -0.8,
        'task_persistence': -0.85,
      },
    ),
    'attention_style:q27': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q27',
      axisWeights: {
        'procrastination': 0.9, // Postponing until last moment
        'self_discipline': -0.8,
        'time_management': -0.75,
      },
    ),
    'attention_style:q28': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q28',
      axisWeights: {
        'persistence': -0.85, // Hardest part is last 20%
        'project_completion': -0.8,
        'follow_through': -0.85,
      },
    ),
    'attention_style:q29': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q29',
      axisWeights: {
        'persistence': -0.85, // Losing interest when enthusiasm passes
        'passion': -0.6,
        'project_completion': -0.8,
      },
    ),
    'attention_style:q30': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q30',
      axisWeights: {
        'self_discipline': -0.85, // Need external pressure
        'intrinsic_motivation': -0.8,
        'persistence': -0.7,
      },
    ),
    'attention_style:q31': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q31',
      axisWeights: {
        'project_completion': -0.9, // Starting many things, finishing none
        'focus': -0.8,
        'persistence': -0.85,
      },
    ),
    'attention_style:q32': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q32',
      axisWeights: {
        'persistence': -0.8, // Hard to follow instructions
        'attention_to_detail': -0.75,
        'follow_through': -0.8,
      },
    ),

    // Task Switching (Q33-40)
    'attention_style:q33': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q33',
      axisWeights: {
        'cognitive_flexibility': 0.7, // Frequently switching tasks
        'attention_control': -0.6,
        'multitasking': 0.8,
      },
    ),
    'attention_style:q34': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q34',
      axisWeights: {
        'cognitive_flexibility': -0.7, // Hard to return after break
        'attention_control': -0.75,
        'working_memory': -0.6,
      },
    ),
    'attention_style:q35': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q35',
      axisWeights: {
        'multitasking': 0.9, // Doing several things simultaneously
        'attention_control': -0.7,
        'cognitive_flexibility': 0.6,
      },
    ),
    'attention_style:q36': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q36',
      axisWeights: {
        'attention_control': -0.85, // Constantly checking phone
        'self_discipline': -0.75,
        'digital_distraction': 0.9,
      },
    ),
    'attention_style:q37': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q37',
      axisWeights: {
        'cognitive_flexibility': 0.7, // Want variety
        'novelty_seeking': 0.8,
        'persistence': -0.6,
      },
    ),
    'attention_style:q38': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q38',
      axisWeights: {
        'attention_control': -0.8, // Starting new without finishing
        'working_memory': -0.7,
        'project_completion': -0.75,
      },
    ),
    'attention_style:q39': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q39',
      axisWeights: {
        'multitasking': 0.85, // 20+ browser tabs
        'organization': -0.7,
        'digital_distraction': 0.8,
      },
    ),
    'attention_style:q40': QuestionWeight(
      testId: 'attention_style',
      questionId: 'q40',
      axisWeights: {
        'attention_control': -0.85, // Brain flits like bee
        'focus': -0.85,
        'cognitive_flexibility': 0.6,
      },
    ),
  };
}
