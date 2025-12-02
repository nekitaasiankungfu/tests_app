import 'question_weight_models.dart';

/// Question weights for Self-Sabotage: How You Get in Your Own Way Test.
///
/// Maps 24 questions to psychological scales:
/// - Procrastination & Avoidance (Q1-6, Q4R) → procrastination, time_management, self_discipline
/// - Toxic Relationship Patterns (Q7-12, Q10R) → relationship_patterns, boundaries, codependency
/// - Self-Devaluation (Q13-18, Q16R) → self_esteem, self_worth, self_criticism
/// - Fear of Success & Failure (Q19-24, Q22R) → fear_of_failure, fear_of_success, perfectionism
///
/// All scales use existing hierarchical scales (NOT bipolar personality type scales).
/// Scores: 0-4 (Frequency scale: Never to Always)
class SelfSabotageWeights {
  static final Map<String, QuestionWeight> weights = {
    // Procrastination & Avoidance (Q1-Q6)
    'self_sabotage_how_you_block_yourself_v1:q1': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q1',
      axisWeights: {
        'procrastination': 0.95, // Postpone important tasks
        'self_discipline': -0.85,
        'time_management': -0.8,
        'awareness_of_consequences': -0.7,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q2': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q2',
      axisWeights: {
        'procrastination': 0.9, // Avoid difficult tasks
        'avoidance': 0.85,
        'task_prioritization': -0.8,
        'challenge_seeking': -0.75,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q3': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q3',
      axisWeights: {
        'persistence': -0.9, // Start but don't finish
        'follow_through': -0.85,
        'commitment': -0.8,
        'impulsiveness': 0.7,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q4': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q4',
      axisWeights: {
        'planning': 0.9, // REVERSED: Plan and complete on time
        'time_management': 0.9,
        'self_discipline': 0.85,
        'procrastination': -0.9,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q5': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q5',
      axisWeights: {
        'avoidance': 0.9, // Seek distractions
        'procrastination': 0.85,
        'focus': -0.85,
        'escapism': 0.8,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q6': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q6',
      axisWeights: {
        'rationalization': 0.9, // Justify inaction
        'self_deception': 0.8,
        'accountability': -0.85,
        'procrastination': 0.75,
      },
    ),

    // Toxic Relationship Patterns (Q7-Q12)
    'self_sabotage_how_you_block_yourself_v1:q7': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q7',
      axisWeights: {
        'unhealthy_relationship_patterns': 0.95, // Choose devaluing partners
        'self_worth': -0.85,
        'relationship_quality': -0.8,
        'self_sabotage_in_relationships': 0.9,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q8': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q8',
      axisWeights: {
        'unhealthy_relationship_patterns': 0.9, // Stay in draining relationships
        'codependency': 0.85,
        'self_respect': -0.85,
        'boundary_setting': -0.8,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q9': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q9',
      axisWeights: {
        'people_pleasing': 0.95, // Sacrifice needs to avoid conflict
        'assertiveness': -0.9,
        'conflict_avoidance': 0.85,
        'self_neglect': 0.8,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q10': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q10',
      axisWeights: {
        'boundary_setting': 0.9, // REVERSED: Set clear boundaries
        'assertiveness': 0.9,
        'self_respect': 0.85,
        'people_pleasing': -0.85,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q11': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q11',
      axisWeights: {
        'self_fulfilling_prophecy': 0.9, // Attract people confirming worst fears
        'self_worth': -0.85,
        'unhealthy_relationship_patterns': 0.85,
        'self_sabotage_in_relationships': 0.8,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q12': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q12',
      axisWeights: {
        'attachment_anxiety': 0.9, // Ruin good relationships
        'self_sabotage_in_relationships': 0.95,
        'fear_of_intimacy': 0.85,
        'trust_issues': 0.8,
      },
    ),

    // Self-Devaluation (Q13-Q18)
    'self_sabotage_how_you_block_yourself_v1:q13': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q13',
      axisWeights: {
        'self_devaluation': 0.95, // Devalue achievements
        'self_worth': -0.9,
        'imposter_syndrome': 0.9,
        'achievement_recognition': -0.85,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q14': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q14',
      axisWeights: {
        'social_comparison': 0.95, // Compare and lose
        'self_esteem': -0.9,
        'envy': 0.75,
        'self_acceptance': -0.85,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q15': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q15',
      axisWeights: {
        'self_devaluation': 0.9, // Ignore/reject compliments
        'self_worth': -0.85,
        'receptivity_to_praise': -0.9,
        'self_acceptance': -0.8,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q16': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q16',
      axisWeights: {
        'self_esteem': 0.9, // REVERSED: Acknowledge strengths
        'self_worth': 0.9,
        'self_acceptance': 0.85,
        'self_devaluation': -0.9,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q17': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q17',
      axisWeights: {
        'negative_self_talk': 0.95, // "Not good enough" belief
        'self_worth': -0.9,
        'self_esteem': -0.9,
        'learned_helplessness': 0.8,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q18': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q18',
      axisWeights: {
        'negativity_bias': 0.9, // Focus on failures
        'self_criticism': 0.9,
        'optimism': -0.85,
        'self_compassion': -0.8,
      },
    ),

    // Fear of Success & Failure (Q19-Q24)
    'self_sabotage_how_you_block_yourself_v1:q19': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q19',
      axisWeights: {
        'fear_of_success': 0.95, // Fear envy/criticism from success
        'fear_of_visibility': 0.9,
        'social_anxiety': 0.75,
        'self_sabotage': 0.85,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q20': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q20',
      axisWeights: {
        'self_sabotage': 0.95, // Sabotage near goal
        'fear_of_success': 0.9,
        'imposter_syndrome': 0.85,
        'readiness_anxiety': 0.8,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q21': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q21',
      axisWeights: {
        'fear_of_failure': 0.95, // Avoid ambitious goals
        'risk_avoidance': 0.9,
        'ambition': -0.85,
        'courage': -0.8,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q22': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q22',
      axisWeights: {
        'growth_mindset': 0.9, // REVERSED: Failures as growth
        'resilience': 0.9,
        'learning_orientation': 0.85,
        'fear_of_failure': -0.9,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q23': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q23',
      axisWeights: {
        'deservingness': -0.95, // Don't deserve success/happiness
        'self_worth': -0.9,
        'self_esteem': -0.9,
        'learned_helplessness': 0.85,
      },
    ),
    'self_sabotage_how_you_block_yourself_v1:q24': QuestionWeight(
      testId: 'self_sabotage_how_you_block_yourself_v1',
      questionId: 'q24',
      axisWeights: {
        'decision_avoidance': 0.9, // Postpone decisions
        'fear_of_failure': 0.85,
        'perfectionism': 0.8,
        'decisiveness': -0.85,
      },
    ),
  };
}
