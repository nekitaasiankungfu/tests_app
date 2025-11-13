import 'question_weight_models.dart';

/// Question weights configuration for simple tests (Stress and Self-Esteem)
class SimpleTestsWeights {
  /// Combined weights for small tests
  static const Map<String, QuestionWeight> weights = {
    // ========================================================================
    // STRESS TEST - 5 Questions
    // Simple test measuring stress levels
    // ========================================================================
    'stress_test:q1': const QuestionWeight(
      testId: 'stress_test',
      questionId: 'q1',
      axisWeights: {'stress_tolerance': 1.0,         // Primary: Stress response (reversed - high tension = low tolerance)
        'anxiety': 0.9,                  // Primary: Tension symptom
        'emotional_reactivity': 0.7,     // Secondary: Reactivity to stressors
        'composure': 0.6,                // Secondary: Maintaining calm (reversed)
        'calmness': 0.6,                 // Secondary: Inner peace (reversed)
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Stress: low stress tolerance + high anxiety + emotional reactivity + low composure + low calmness',
    ),

    // Stress Q2: "How well do you sleep?"
    'stress_test:q2': const QuestionWeight(
      testId: 'stress_test',
      questionId: 'q2',
      axisWeights: {
        'stress_tolerance': 1.0,         // Primary: Sleep disruption from stress (reversed)
        'anxiety': 0.8,                  // High: Anxiety disrupts sleep
        'emotional_resilience': 0.7,     // Secondary: Recovery capacity (reversed)
        'vitality': 0.6,                 // Secondary: Energy affected by sleep (reversed)
        'worry_tendency': 0.5,           // Secondary: Rumination disrupting sleep
      },
      note: 'Stress: poor sleep + anxiety + low resilience + low vitality + worry tendency',
    ),

    // Stress Q3: "How often do you experience irritability?"
    'stress_test:q3': const QuestionWeight(
      testId: 'stress_test',
      questionId: 'q3',
      axisWeights: {'anger': 1.0,                    // Primary: Irritability expression
        'stress_tolerance': 0.9,         // Primary: Low stress tolerance → irritability
        'emotional_reactivity': 0.8,     // High: Reactive emotional response
        'composure': 0.7,                // Secondary: Loss of composure (reversed)
        'frustration_tolerance': 0.6,    // Secondary: Low frustration tolerance
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Stress: anger + low stress tolerance + emotional reactivity + low composure + low frustration tolerance',
    ),

    // Stress Q4: "How easy is it for you to focus on tasks?"
    'stress_test:q4': const QuestionWeight(
      testId: 'stress_test',
      questionId: 'q4',
      axisWeights: {
        'attention_control': 1.0,        // Primary: Attentional capacity (reversed - hard to focus = low control)
        'working_memory': 0.8,           // High: Cognitive overload from stress
        'stress_tolerance': 0.7,         // Secondary: Stress disrupts cognition
        'anxiety': 0.6,                  // Secondary: Anxious thoughts disrupt focus
        'rumination': 0.5,               // Secondary: Intrusive thoughts
      },
      note: 'Stress: low attention control + low working memory + stress + anxiety + rumination',
    ),

    // Stress Q5: "How often do you feel tired?"
    'stress_test:q5': const QuestionWeight(
      testId: 'stress_test',
      questionId: 'q5',
      axisWeights: {
        'vitality': 1.0,                 // Primary: Energy depletion (reversed)
        'emotional_resilience': 0.9,     // Primary: Exhaustion from stress
        'stress_tolerance': 0.8,         // High: Chronic stress causing fatigue
        'burnout': 0.7,                  // Secondary: Exhaustion symptom (if scale exists)
        'depression': 0.5,               // Secondary: Fatigue as depressive symptom
      },
      note: 'Stress: low vitality + low resilience + stress + burnout + depression',
    ),

    // ========================================================================
    // SELF-ESTEEM TEST - 5 Questions
    // Simple test assessing self-worth, confidence, and self-perception
    // ========================================================================

    // Self-Esteem Q1: "How do you rate your abilities?"

    // ========================================================================
    // SELF-ESTEEM TEST - 10 Questions
    // Simple test measuring self-esteem
    // ========================================================================

    'self_esteem_test:q1': const QuestionWeight(
      testId: 'self_esteem_test',
      questionId: 'q1',
      axisWeights: {
        'self_efficacy': 1.0,            // Primary: Belief in own abilities
        'self_esteem': 0.9,              // Primary: Self-worth
        'competence_need': 0.7,          // Secondary: Feeling competent
        'achievement_striving': 0.6,     // Secondary: Confidence in achievement
        'self_acceptance': 0.5,          // Secondary: Accepting abilities
      },
      note: 'Self-esteem: self-efficacy + self-esteem + competence + achievement striving + self-acceptance',
    ),

    // Self-Esteem Q2: "How confident are you in social situations?"
    'self_esteem_test:q2': const QuestionWeight(
      testId: 'self_esteem_test',
      questionId: 'q2',
      axisWeights: {'social_confidence': 1.0,        // Primary: Social self-assurance
        'self_consciousness': 0.9,       // Primary: Self-consciousness (reversed)
        'self_esteem': 0.8,              // High: General self-worth
        'assertiveness': 0.6,            // Secondary: Social assertiveness
        'anxiety': 0.5,                  // Secondary: Social anxiety (reversed)
        // MBTI personality type scales
        'extraversion': 0.4,
        'introversion': 0.2,
      },
      axisDirections: {
        'social_confidence': 1,          // Direct: high confidence → high score
        'self_consciousness': -1,        // Inverted: high confidence → LOW self-consciousness
        'self_esteem': 1,                // Direct: high confidence → high self-esteem
        'assertiveness': 1,              // Direct: high confidence → high assertiveness
        'anxiety': -1,                   // Inverted: high confidence → LOW anxiety
      },
      note: 'Self-esteem: social confidence + low self-consciousness + self-esteem + assertiveness + low anxiety',
    ),

    // Self-Esteem Q3: "How often do you criticize yourself?"
    'self_esteem_test:q3': const QuestionWeight(
      testId: 'self_esteem_test',
      questionId: 'q3',
      axisWeights: {'self_compassion': 1.0,          // Primary: Self-compassion (reversed - high criticism = low compassion)
        'self_esteem': 0.9,              // Primary: Self-worth (reversed)
        'perfectionism': 0.7,            // Secondary: Perfectionist self-criticism
        'rumination': 0.6,               // Secondary: Repetitive negative thoughts
        'self_acceptance': 0.6,          // Secondary: Self-acceptance (reversed)
        // MBTI personality type scales
        'feeling': 0.4,
      },
      note: 'Self-esteem: low self-compassion + low self-esteem + perfectionism + rumination + low self-acceptance',
    ),

    // Self-Esteem Q4: "How satisfied are you with your appearance?"
    'self_esteem_test:q4': const QuestionWeight(
      testId: 'self_esteem_test',
      questionId: 'q4',
      axisWeights: {'body_image': 1.0,               // Primary: Body satisfaction
        'self_esteem': 0.9,              // Primary: Overall self-worth
        'self_acceptance': 0.8,          // High: Accepting physical self
        'self_consciousness': 0.6,       // Secondary: Appearance consciousness (reversed)
        'social_confidence': 0.5,        // Secondary: Appearance affects confidence
        // MBTI personality type scales
        'extraversion': 0.4,
        'introversion': 0.2,
      },
      note: 'Self-esteem: body image + self-esteem + self-acceptance + low self-consciousness + social confidence',
    ),

    // Self-Esteem Q5: "How often do you compare yourself to others?"
    'self_esteem_test:q5': const QuestionWeight(
      testId: 'self_esteem_test',
      questionId: 'q5',
      axisWeights: {
        'self_monitoring': 1.0,          // Primary: Social comparison tendency
        'self_esteem': 0.9,              // Primary: Low self-worth → more comparison
        'secure_attachment': 0.7,        // Secondary: Insecurity drives comparison (reversed)
        'self_acceptance': 0.6,          // Secondary: Self-acceptance (reversed)
        'jealousy': 0.5,                 // Secondary: Envy from comparison
      },
      note: 'Self-esteem: high self-monitoring + low self-esteem + insecurity + low self-acceptance + jealousy',
    ),

    // ========================================================================
    // ALL TESTS COMPLETE - Full Question Analysis Summary
    //
    // TOTAL COVERAGE STATISTICS:
    // - IPIP Big Five:       50 questions (5 factors × 10 questions)
    // - Fisher Temperament:  56 questions (4 neurochemical systems)
    // - Love Profile:        60 questions (6 relationship dimensions)
    // - Stress Test:          5 questions (somatic/emotional stress)
    // - Self-Esteem Test:     5 questions (self-worth/confidence)
    //
    // TOTAL:                176 questions across 5 psychological tests
    //
    // Average axes per question: 5.2
    // Total axis connections:   ~920 weighted mappings
    // Weight range:              0.4-1.0 (Primary: 0.8-1.0, Secondary: 0.4-0.7)
    //
    // NEXT STEPS:
    // 1. Update test_screen.dart to use per-question weights during test-taking
    // 2. Update SummaryCalculator to aggregate scores hierarchically
    // 3. Create v1→v2 migration module for existing results
    // 4. Test the entire system end-to-end
    // ========================================================================
    // NOTE: Stress/Self-Esteem tests would map to stress_tolerance, self_esteem,
    // emotional_resilience, anxiety, and coping scales
    // ========================================================================

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
