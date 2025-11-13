import 'question_weight_models.dart';

/// Question weights configuration for 16 Personality Types test
/// Maps 80 questions to 8 MBTI unipolar scales (E/I, S/N, T/F, J/P)
class SixteenTypesWeights {
  /// SIXTEEN TYPES - 80 Questions
  ///
  /// Each question measures one of the 8 unipolar MBTI dimensions:
  /// - Extraversion (E) vs Introversion (I): 20 questions (10 per pole)
  /// - Sensing (S) vs Intuition (N): 20 questions (11 S, 9 N)
  /// - Thinking (T) vs Feeling (F): 20 questions (10 per pole)
  /// - Judging (J) vs Perceiving (P): 20 questions (10 per pole)
  ///
  /// Weight: 1.0 (primary scale) - each question directly measures its target scale
  static const Map<String, QuestionWeight> weights = {
    // ============================================================
    // A. EXTRAVERSION (E) / INTROVERSION (I) - Questions 1-20
    // ============================================================

    // Extraversion questions (E pole)
    'sixteen_types:q1': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q1',
      axisWeights: {'extraversion': 1.0},
      note: 'Direct extraversion measure',
    ),
    'sixteen_types:q2': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q2',
      axisWeights: {'extraversion': 1.0},
      note: 'Direct extraversion measure',
    ),
    'sixteen_types:q3': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q3',
      axisWeights: {'extraversion': 1.0},
      note: 'Direct extraversion measure',
    ),

    // Introversion questions (I pole)
    'sixteen_types:q4': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q4',
      axisWeights: {'introversion': 1.0},
      note: 'Direct introversion measure',
    ),
    'sixteen_types:q5': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q5',
      axisWeights: {'introversion': 1.0},
      note: 'Direct introversion measure',
    ),
    'sixteen_types:q6': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q6',
      axisWeights: {'introversion': 1.0},
      note: 'Direct introversion measure',
    ),

    // Continue E/I pattern
    'sixteen_types:q7': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q7',
      axisWeights: {'extraversion': 1.0},
      note: 'Direct extraversion measure',
    ),
    'sixteen_types:q8': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q8',
      axisWeights: {'extraversion': 1.0},
      note: 'Direct extraversion measure',
    ),
    'sixteen_types:q9': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q9',
      axisWeights: {'introversion': 1.0},
      note: 'Direct introversion measure',
    ),
    'sixteen_types:q10': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q10',
      axisWeights: {'introversion': 1.0},
      note: 'Direct introversion measure',
    ),
    'sixteen_types:q11': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q11',
      axisWeights: {'extraversion': 1.0},
      note: 'Direct extraversion measure',
    ),
    'sixteen_types:q12': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q12',
      axisWeights: {'introversion': 1.0},
      note: 'Direct introversion measure',
    ),
    'sixteen_types:q13': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q13',
      axisWeights: {'extraversion': 1.0},
      note: 'Direct extraversion measure',
    ),
    'sixteen_types:q14': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q14',
      axisWeights: {'introversion': 1.0},
      note: 'Direct introversion measure',
    ),
    'sixteen_types:q15': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q15',
      axisWeights: {'extraversion': 1.0},
      note: 'Direct extraversion measure',
    ),
    'sixteen_types:q16': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q16',
      axisWeights: {'introversion': 1.0},
      note: 'Direct introversion measure',
    ),
    'sixteen_types:q17': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q17',
      axisWeights: {'extraversion': 1.0},
      note: 'Direct extraversion measure',
    ),
    'sixteen_types:q18': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q18',
      axisWeights: {'introversion': 1.0},
      note: 'Direct introversion measure',
    ),
    'sixteen_types:q19': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q19',
      axisWeights: {'extraversion': 1.0},
      note: 'Direct extraversion measure',
    ),
    'sixteen_types:q20': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q20',
      axisWeights: {'introversion': 1.0},
      note: 'Direct introversion measure',
    ),

    // ============================================================
    // B. SENSING (S) / INTUITION (N) - Questions 21-40
    // ============================================================

    'sixteen_types:q21': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q21',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q22': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q22',
      axisWeights: {'intuition': 1.0},
      note: 'Direct intuition measure',
    ),
    'sixteen_types:q23': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q23',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q24': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q24',
      axisWeights: {'intuition': 1.0},
      note: 'Direct intuition measure',
    ),
    'sixteen_types:q25': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q25',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q26': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q26',
      axisWeights: {'intuition': 1.0},
      note: 'Direct intuition measure',
    ),
    'sixteen_types:q27': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q27',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q28': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q28',
      axisWeights: {'intuition': 1.0},
      note: 'Direct intuition measure',
    ),
    'sixteen_types:q29': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q29',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q30': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q30',
      axisWeights: {'intuition': 1.0},
      note: 'Direct intuition measure',
    ),
    'sixteen_types:q31': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q31',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q32': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q32',
      axisWeights: {'intuition': 1.0},
      note: 'Direct intuition measure',
    ),
    'sixteen_types:q33': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q33',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q34': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q34',
      axisWeights: {'intuition': 1.0},
      note: 'Direct intuition measure',
    ),
    'sixteen_types:q35': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q35',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q36': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q36',
      axisWeights: {'intuition': 1.0},
      note: 'Direct intuition measure',
    ),
    'sixteen_types:q37': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q37',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q38': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q38',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q39': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q39',
      axisWeights: {'sensing': 1.0},
      note: 'Direct sensing measure',
    ),
    'sixteen_types:q40': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q40',
      axisWeights: {'intuition': 1.0},
      note: 'Direct intuition measure',
    ),

    // ============================================================
    // C. THINKING (T) / FEELING (F) - Questions 41-60
    // ============================================================

    'sixteen_types:q41': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q41',
      axisWeights: {'thinking': 1.0},
      note: 'Direct thinking measure',
    ),
    'sixteen_types:q42': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q42',
      axisWeights: {'feeling': 1.0},
      note: 'Direct feeling measure',
    ),
    'sixteen_types:q43': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q43',
      axisWeights: {'thinking': 1.0},
      note: 'Direct thinking measure',
    ),
    'sixteen_types:q44': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q44',
      axisWeights: {'feeling': 1.0},
      note: 'Direct feeling measure',
    ),
    'sixteen_types:q45': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q45',
      axisWeights: {'thinking': 1.0},
      note: 'Direct thinking measure',
    ),
    'sixteen_types:q46': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q46',
      axisWeights: {'feeling': 1.0},
      note: 'Direct feeling measure',
    ),
    'sixteen_types:q47': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q47',
      axisWeights: {'thinking': 1.0},
      note: 'Direct thinking measure',
    ),
    'sixteen_types:q48': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q48',
      axisWeights: {'feeling': 1.0},
      note: 'Direct feeling measure',
    ),
    'sixteen_types:q49': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q49',
      axisWeights: {'thinking': 1.0},
      note: 'Direct thinking measure',
    ),
    'sixteen_types:q50': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q50',
      axisWeights: {'feeling': 1.0},
      note: 'Direct feeling measure',
    ),
    'sixteen_types:q51': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q51',
      axisWeights: {'thinking': 1.0},
      note: 'Direct thinking measure',
    ),
    'sixteen_types:q52': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q52',
      axisWeights: {'feeling': 1.0},
      note: 'Direct feeling measure',
    ),
    'sixteen_types:q53': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q53',
      axisWeights: {'thinking': 1.0},
      note: 'Direct thinking measure',
    ),
    'sixteen_types:q54': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q54',
      axisWeights: {'feeling': 1.0},
      note: 'Direct feeling measure',
    ),
    'sixteen_types:q55': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q55',
      axisWeights: {'thinking': 1.0},
      note: 'Direct thinking measure',
    ),
    'sixteen_types:q56': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q56',
      axisWeights: {'feeling': 1.0},
      note: 'Direct feeling measure',
    ),
    'sixteen_types:q57': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q57',
      axisWeights: {'thinking': 1.0},
      note: 'Direct thinking measure',
    ),
    'sixteen_types:q58': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q58',
      axisWeights: {'feeling': 1.0},
      note: 'Direct feeling measure',
    ),
    'sixteen_types:q59': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q59',
      axisWeights: {'thinking': 1.0},
      note: 'Direct thinking measure',
    ),
    'sixteen_types:q60': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q60',
      axisWeights: {'feeling': 1.0},
      note: 'Direct feeling measure',
    ),

    // ============================================================
    // D. JUDGING (J) / PERCEIVING (P) - Questions 61-80
    // ============================================================

    'sixteen_types:q61': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q61',
      axisWeights: {'judging': 1.0},
      note: 'Direct judging measure',
    ),
    'sixteen_types:q62': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q62',
      axisWeights: {'perceiving': 1.0},
      note: 'Direct perceiving measure',
    ),
    'sixteen_types:q63': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q63',
      axisWeights: {'judging': 1.0},
      note: 'Direct judging measure',
    ),
    'sixteen_types:q64': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q64',
      axisWeights: {'perceiving': 1.0},
      note: 'Direct perceiving measure',
    ),
    'sixteen_types:q65': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q65',
      axisWeights: {'judging': 1.0},
      note: 'Direct judging measure',
    ),
    'sixteen_types:q66': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q66',
      axisWeights: {'perceiving': 1.0},
      note: 'Direct perceiving measure',
    ),
    'sixteen_types:q67': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q67',
      axisWeights: {'judging': 1.0},
      note: 'Direct judging measure',
    ),
    'sixteen_types:q68': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q68',
      axisWeights: {'perceiving': 1.0},
      note: 'Direct perceiving measure',
    ),
    'sixteen_types:q69': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q69',
      axisWeights: {'judging': 1.0},
      note: 'Direct judging measure',
    ),
    'sixteen_types:q70': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q70',
      axisWeights: {'perceiving': 1.0},
      note: 'Direct perceiving measure',
    ),
    'sixteen_types:q71': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q71',
      axisWeights: {'judging': 1.0},
      note: 'Direct judging measure',
    ),
    'sixteen_types:q72': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q72',
      axisWeights: {'perceiving': 1.0},
      note: 'Direct perceiving measure',
    ),
    'sixteen_types:q73': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q73',
      axisWeights: {'judging': 1.0},
      note: 'Direct judging measure',
    ),
    'sixteen_types:q74': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q74',
      axisWeights: {'perceiving': 1.0},
      note: 'Direct perceiving measure',
    ),
    'sixteen_types:q75': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q75',
      axisWeights: {'judging': 1.0},
      note: 'Direct judging measure',
    ),
    'sixteen_types:q76': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q76',
      axisWeights: {'perceiving': 1.0},
      note: 'Direct perceiving measure',
    ),
    'sixteen_types:q77': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q77',
      axisWeights: {'judging': 1.0},
      note: 'Direct judging measure',
    ),
    'sixteen_types:q78': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q78',
      axisWeights: {'perceiving': 1.0},
      note: 'Direct perceiving measure',
    ),
    'sixteen_types:q79': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q79',
      axisWeights: {'judging': 1.0},
      note: 'Direct judging measure',
    ),
    'sixteen_types:q80': const QuestionWeight(
      testId: 'sixteen_types',
      questionId: 'q80',
      axisWeights: {'perceiving': 1.0},
      note: 'Direct perceiving measure',
    ),
  };
}
