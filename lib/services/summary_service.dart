import '../models/test_model.dart';
import '../models/summary_model.dart';
import '../config/summary_config.dart';
import '../config/summary/personality_type_scales.dart';
import '../data/sixteen_types_data.dart';
import '../config/summary/question_weights/ipip_big_five_weights.dart';
import '../config/summary/question_weights/fisher_temperament_weights.dart';
import '../config/summary/question_weights/love_profile_weights.dart';
import '../config/summary/question_weights/simple_tests_weights.dart';
import '../config/summary/question_weights/sixteen_types_weights.dart';
import '../config/summary/question_weights/temperament_profile_test_weights.dart';
import '../config/summary/question_weights/digital_detox_weights.dart';
import '../config/summary/question_weights/burnout_diagnostic_weights.dart';
import '../config/summary/question_weights/social_battery_weights.dart';
import '../config/summary/question_weights/disc_personality_weights.dart';
import '../config/summary/question_weights/holland_code_weights.dart';
import '../config/summary/question_weights/love_languages_weights.dart';
import '../config/summary/question_weights/anxiety_symptoms_inventory_weights.dart';
import '../config/summary/question_weights/depression_symptoms_inventory_weights.dart';
import '../config/summary/question_weights/career_compass_weights.dart';
import '../config/summary/question_weights/wellbeing_happiness_inventory_weights.dart';
import '../config/summary/question_weights/digital_career_fit_weights.dart';
import '../config/summary/question_weights/self_confidence_multiscale_weights.dart';
import '../config/summary/question_weights/romantic_potential_weights.dart';
import '../config/summary/question_weights/cognitive_ability_weights.dart';
import '../utils/app_logger.dart';
// NOTE: QuestionWeight is already exported by summary_config.dart

/// Service class that handles all business logic for summary calculations
/// and personality type analysis.
///
/// This service separates data processing from UI presentation, making the
/// code more maintainable and testable.
class SummaryService {
  /// Calculates personality type based on ALL completed tests with personality type weights.
  ///
  /// This method aggregates scores from:
  /// - 16 Personality Types test (80 questions)
  /// - IPIP Big Five test (questions with personality type weights)
  /// - Fisher Temperament test (questions with personality type weights)
  /// - Love Profile test (questions with personality type weights)
  ///
  /// Returns a map containing:
  /// - 'personalityType': String (e.g., 'ENFP', 'ISTJ')
  /// - 'typeName': String (localized type name)
  /// - 'bipolarScores': Map<String, BipolarDimensionScore>
  ///
  /// Returns null if no tests with Personality Type data are found.
  Map<String, dynamic>? calculateAveragedPersonalityType(
    List<TestResult> completedTests,
    String languageCode,
  ) {
    appLogger.d('Calculating personality type from ${completedTests.length} completed tests');

    // Calculate personality type scale scores using weights from ALL tests
    final typeScores = _calculatePersonalityTypeScalesFromAllTests(completedTests);

    if (typeScores.isEmpty) {
      appLogger.d('No personality type scale data found');
      return null;
    }

    appLogger.d('Personality type scale scores calculated: ${typeScores.keys.join(", ")}');

    // Convert unipolar scores to bipolar percentages
    // typeScores contains normalized 0-100 scores for each of 8 scales
    final bipolarPercentages = <String, double>{};

    // Calculate bipolar percentages: E vs I, S vs N, T vs F, J vs P
    final eiPercentage = _calculateBipolarPercentage(
      typeScores['extraversion'] ?? 0.0,
      typeScores['introversion'] ?? 0.0,
    );
    final snPercentage = _calculateBipolarPercentage(
      typeScores['sensing'] ?? 0.0,
      typeScores['intuition'] ?? 0.0,
    );
    final tfPercentage = _calculateBipolarPercentage(
      typeScores['thinking'] ?? 0.0,
      typeScores['feeling'] ?? 0.0,
    );
    final jpPercentage = _calculateBipolarPercentage(
      typeScores['judging'] ?? 0.0,
      typeScores['perceiving'] ?? 0.0,
    );

    bipolarPercentages['EI'] = eiPercentage;
    bipolarPercentages['SN'] = snPercentage;
    bipolarPercentages['TF'] = tfPercentage;
    bipolarPercentages['JP'] = jpPercentage;

    // Determine personality type based on dominant poles
    final personalityType = _determinePersonalityType(bipolarPercentages);

    // Create bipolar scores for UI display
    final bipolarScores = <String, BipolarDimensionScore>{};

    // Convert percentages to bipolar scores for UI
    for (final dimension in ['EI', 'SN', 'TF', 'JP']) {
      final percentage = bipolarPercentages[dimension] ?? 50.0;
      final isPositiveDominant = percentage > 50;

      // Create score that matches old format
      bipolarScores['personality_type_${dimension.toLowerCase()}'] = BipolarDimensionScore(
        dimensionId: 'personality_type_${dimension.toLowerCase()}',
        positiveScore: isPositiveDominant ? (percentage / 100 * 40).round() : ((100 - percentage) / 100 * 20).round(),
        negativeScore: isPositiveDominant ? ((100 - percentage) / 100 * 20).round() : (percentage / 100 * 40).round(),
        positiveMaxScore: 40,
        negativeMaxScore: 40,
        dominantPole: isPositiveDominant ? dimension[0] : dimension[1],
        normalizedScore: percentage,
      );
    }

    appLogger.d('Personality type determined: $personalityType');

    return {
      'personalityType': personalityType,
      'typeName': getTypeName(personalityType, languageCode),
      'bipolarScores': bipolarScores,
      'typeScales': typeScores, // Include raw scale scores
    };
  }

  /// Calculate personality type scale scores from ALL completed tests using question weights
  Map<String, double> _calculatePersonalityTypeScalesFromAllTests(List<TestResult> completedTests) {
    // Load all personality type question weights
    final allWeights = <String, QuestionWeight>{
      ...IPIPBigFiveWeights.weights,
      ...FisherTemperamentWeights.weights,
      ...LoveProfileWeights.weights,
      ...SimpleTestsWeights.weights,
      ...SixteenTypesWeights.weights,
      ...TemperamentProfileTestWeights.weights,
      ...DISCPersonalityWeights.weights,
      ...HollandCodeWeights.weights,
      ...LoveLanguagesWeights.weights,
      ...AnxietySymptomsInventoryWeights.weights,
      ...DepressionSymptomsInventoryWeights.weights,
      ...CareerCompassWeights.weights,
      ...WellbeingHappinessInventoryWeights.weights,
      ...DigitalCareerFitWeights.weights,
      ...SelfConfidenceMultiscaleWeights.weights,
      ...RomanticPotentialWeights.weights,
      ...CognitiveAbilityWeights.weights,
    };

    // 8 personality type scales
    final scaleIds = ['extraversion', 'introversion', 'sensing', 'intuition',
                      'thinking', 'feeling', 'judging', 'perceiving'];

    // Accumulate weighted scores for each scale
    final scaleScores = <String, double>{};
    final scaleWeights = <String, double>{}; // Track total weights per scale

    for (final scale in scaleIds) {
      scaleScores[scale] = 0.0;
      scaleWeights[scale] = 0.0;
    }

    // Process each completed test
    for (final testResult in completedTests) {
      if (testResult.userAnswers == null || testResult.userAnswers!.isEmpty) {
        continue; // Skip tests without answers
      }

      final testId = testResult.testId;
      appLogger.d('Processing $testId for personality type scales');

      // For each question in this test
      testResult.userAnswers!.forEach((questionId, answerScore) {
        final weightKey = '$testId:$questionId';
        final questionWeight = allWeights[weightKey];

        if (questionWeight == null) {
          return; // Skip questions without weights
        }

        // Check if this question contributes to any personality type scale
        questionWeight.axisWeights.forEach((scaleId, weight) {
          if (scaleIds.contains(scaleId)) {
            // Found personality type scale contribution
            // Normalize answer score (0-4 scale -> 0-1 range)
            final normalizedAnswer = answerScore / 4.0; // 0-4 -> 0-1
            final weightedContribution = normalizedAnswer * weight.abs();

            scaleScores[scaleId] = (scaleScores[scaleId] ?? 0.0) + weightedContribution;
            scaleWeights[scaleId] = (scaleWeights[scaleId] ?? 0.0) + weight.abs();
          }
        });
      });
    }

    // Normalize scores to 0-100 scale
    final normalizedScores = <String, double>{};
    for (final scale in scaleIds) {
      final totalWeight = scaleWeights[scale] ?? 0.0;
      if (totalWeight > 0) {
        // Average weighted score (0-1) then convert to percentage
        final averageScore = (scaleScores[scale] ?? 0.0) / totalWeight;
        normalizedScores[scale] = averageScore * 100;
        appLogger.d('$scale: score=${normalizedScores[scale]?.toStringAsFixed(1)}% (weight=$totalWeight)');
      } else {
        normalizedScores[scale] = 0.0;
      }
    }

    return normalizedScores;
  }

  /// Calculate bipolar percentage from two unipolar scores
  /// Returns percentage favoring positive pole (0-100, where >50 means positive dominant)
  ///
  /// Special handling: If only one pole has data, we assume the opposite pole
  /// should get the inverse contribution (e.g., low Feeling score = high Thinking score)
  double _calculateBipolarPercentage(double positiveScore, double negativeScore) {
    // If both poles have data, use standard formula
    if (positiveScore > 0 && negativeScore > 0) {
      final total = positiveScore + negativeScore;
      return (positiveScore / total) * 100;
    }

    // If only positive pole has data
    if (positiveScore > 0 && negativeScore == 0) {
      // positiveScore is already 0-100, return it directly
      return positiveScore;
    }

    // If only negative pole has data
    if (negativeScore > 0 && positiveScore == 0) {
      // Invert: high negative score = low positive percentage
      return 100 - negativeScore;
    }

    // If no data at all
    return 50.0; // Neutral
  }

  /// Determine personality type code from bipolar percentages
  String _determinePersonalityType(Map<String, double> bipolarPercentages) {
    String type = '';

    // E vs I
    final eiPercent = bipolarPercentages['EI'] ?? 50.0;
    type += eiPercent > 50 ? 'E' : (eiPercent < 50 ? 'I' : 'X');

    // S vs N
    final snPercent = bipolarPercentages['SN'] ?? 50.0;
    type += snPercent > 50 ? 'S' : (snPercent < 50 ? 'N' : 'X');

    // T vs F
    final tfPercent = bipolarPercentages['TF'] ?? 50.0;
    type += tfPercent > 50 ? 'T' : (tfPercent < 50 ? 'F' : 'X');

    // J vs P
    final jpPercent = bipolarPercentages['JP'] ?? 50.0;
    type += jpPercent > 50 ? 'J' : (jpPercent < 50 ? 'P' : 'X');

    return type;
  }

  /// Gets the localized name for a personality type code.
  ///
  /// Example: 'ENFP' -> 'Энтузиаст' (ru) or 'Enthusiast' (en)
  String getTypeName(String typeCode, String languageCode) {
    final Map<String, String> typeNames = {
      'ISTJ': languageCode == 'ru' ? 'Администратор' : 'Administrator',
      'ISFJ': languageCode == 'ru' ? 'Защитник' : 'Defender',
      'INFJ': languageCode == 'ru' ? 'Советник' : 'Counselor',
      'INTJ': languageCode == 'ru' ? 'Архитектор' : 'Architect',
      'ISTP': languageCode == 'ru' ? 'Мастер' : 'Craftsperson',
      'ISFP': languageCode == 'ru' ? 'Художник' : 'Artist',
      'INFP': languageCode == 'ru' ? 'Мечтатель' : 'Dreamer',
      'INTP': languageCode == 'ru' ? 'Аналитик' : 'Analyst',
      'ESTP': languageCode == 'ru' ? 'Предприниматель' : 'Entrepreneur',
      'ESFP': languageCode == 'ru' ? 'Исполнитель' : 'Entertainer',
      'ENFP': languageCode == 'ru' ? 'Энтузиаст' : 'Enthusiast',
      'ENTP': languageCode == 'ru' ? 'Изобретатель' : 'Inventor',
      'ESTJ': languageCode == 'ru' ? 'Организатор' : 'Executive',
      'ESFJ': languageCode == 'ru' ? 'Наставник' : 'Consul',
      'ENFJ': languageCode == 'ru' ? 'Гуманист' : 'Protagonist',
      'ENTJ': languageCode == 'ru' ? 'Командир' : 'Commander',
    };

    return typeNames[typeCode] ?? typeCode;
  }

  /// Filters test results to include only 16 Types tests.
  List<TestResult> getSixteenTypesResults(List<TestResult> completedTests) {
    return completedTests
        .where((r) => r.testId == 'sixteen_types')
        .toList();
  }

  /// Gets questions for a specific bipolar dimension.
  ///
  /// Returns questions that measure the specified dimension (e.g., 'personality_type_ei').
  List<QuestionModel> getQuestionsForDimension(String dimensionId) {
    final testData = SixteenTypesData.getSixteenTypesTest();
    return testData.questions
        .where((q) => q.bipolarDimension == dimensionId)
        .toList();
  }

  /// Gets localized test name by test ID.
  String getTestName(String testId, String languageCode) {
    final testNames = {
      'ipip_big_five': {'ru': 'Большая пятерка IPIP', 'en': 'IPIP Big Five'},
      'fisher_temperament': {
        'ru': 'Темперамент Фишера',
        'en': 'Fisher Temperament'
      },
      'love_profile': {'ru': 'Профиль любви', 'en': 'Love Profile'},
      'stress_test': {'ru': 'Тест на стресс', 'en': 'Stress Test'},
      'self_esteem_test': {'ru': 'Самооценка', 'en': 'Self-Esteem'},
      'sixteen_types': {'ru': 'Тест 16 типов', 'en': '16 Types Test'},
      'temperament_profile_test': {'ru': 'Профиль темперамента', 'en': 'Temperament Profile'},
      'digital_detox_test': {'ru': 'Цифровой детокс', 'en': 'Digital Detox'},
      'burnout_diagnostic_v1': {'ru': 'Диагностика выгорания', 'en': 'Burnout Diagnostic'},
      'social_battery_v1': {'ru': 'Социальная батарея', 'en': 'Social Battery'},
      'disc_personality_v1': {'ru': 'DISC Личность', 'en': 'DISC Personality'},
      'holland_code_v1': {'ru': 'Код Холланда RIASEC', 'en': 'Holland Code RIASEC'},
      'love_languages_v1': {'ru': 'Языки любви', 'en': 'Love Languages'},
      'anxiety_symptoms_inventory_v1': {'ru': 'Инвентарь симптомов тревоги', 'en': 'Anxiety Symptoms Inventory'},
      'career_compass_v1': {'ru': 'Карьерный компас', 'en': 'Career Compass'},
      'color_psychology_v1': {'ru': 'Психология цвета', 'en': 'Color Psychology'},
      'wellbeing_happiness_inventory_v1': {'ru': 'Индекс субъективного благополучия', 'en': 'Wellbeing Happiness Inventory'},
      'digital_career_fit_v1': {'ru': 'Какая цифровая профессия вам подходит?', 'en': 'Digital Career Fit'},
    };

    return testNames[testId]?[languageCode] ?? testId;
  }

  /// Calculates bipolar dimension data for a specific test result.
  ///
  /// Returns data about how the user scored on this dimension in a single test attempt.
  Map<String, dynamic> getBipolarDimensionData(
    TestResult result,
    String dimensionId,
    String languageCode,
  ) {
    final bipolarScore = result.bipolarScores?[dimensionId];
    if (bipolarScore == null) {
      return {};
    }

    final dimension = SummaryConfig.getBipolarScale(dimensionId);
    if (dimension == null) {
      return {};
    }

    final positiveName = dimension.getPositiveName(languageCode);
    final negativeName = dimension.getNegativeName(languageCode);

    return {
      'positiveEnd': dimension.positiveEnd,
      'negativeEnd': dimension.negativeEnd,
      'positiveName': positiveName,
      'negativeName': negativeName,
      'positiveScore': bipolarScore.positiveScore,
      'negativeScore': bipolarScore.negativeScore,
      'positiveMaxScore': bipolarScore.positiveMaxScore,
      'negativeMaxScore': bipolarScore.negativeMaxScore,
      'normalizedScore': bipolarScore.normalizedScore,
      'dominantPole': bipolarScore.dominantPole,
    };
  }

  /// Analyzes bipolar dimension scores to determine dominant characteristics.
  ///
  /// Returns analysis including:
  /// - isDominantPositive: bool
  /// - isDominantNegative: bool
  /// - isBalanced: bool
  /// - dominantPercentage: int
  /// - dominantName: String
  Map<String, dynamic> analyzeBipolarScore(
    BipolarDimensionScore score,
    String positiveEnd,
    String negativeEnd,
  ) {
    final normalizedScore = score.normalizedScore;
    final percentage = normalizedScore.round();

    final isDominantPositive = normalizedScore > 50;
    final isDominantNegative = normalizedScore < 50;
    final isBalanced = normalizedScore == 50 || score.dominantPole == 'X';

    final dominantPercentage =
        isDominantPositive ? percentage : (100 - percentage);
    final dominantName = isDominantPositive
        ? positiveEnd
        : (isDominantNegative ? negativeEnd : 'X');

    return {
      'isDominantPositive': isDominantPositive,
      'isDominantNegative': isDominantNegative,
      'isBalanced': isBalanced,
      'dominantPercentage': dominantPercentage,
      'dominantName': dominantName,
      'percentage': percentage,
    };
  }

  /// Sorts test results by completion date (newest first).
  List<TestResult> sortTestResultsByDate(List<TestResult> results) {
    final sorted = List<TestResult>.from(results);
    sorted.sort((a, b) => b.completedAt.compareTo(a.completedAt));
    return sorted;
  }

  /// Formats a date for display.
  String formatTestDate(DateTime date, String languageCode) {
    return '${date.day}.${date.month}.${date.year}';
  }

  /// Gets user's answer for a specific question in a test result.
  ///
  /// Returns the answer score, or null if not found.
  int? getUserAnswer(TestResult result, String questionId) {
    return result.userAnswers?[questionId];
  }

  /// Finds the answer model that matches the given score for a question.
  ///
  /// Returns null if no matching answer is found.
  AnswerModel? getAnswerByScore(QuestionModel question, int score) {
    try {
      return question.answers.firstWhere(
        (a) => a.score == score,
        orElse: () => question.answers.first,
      );
    } catch (e) {
      return null;
    }
  }

  /// Checks if a test result has answer data available.
  bool hasAnswerData(TestResult result) {
    return result.userAnswers != null && result.userAnswers!.isNotEmpty;
  }

  /// Gets confidence level color based on the level.
  Map<String, dynamic> getConfidenceLevelInfo(
    ConfidenceLevel confidence,
    String languageCode,
  ) {
    String name;
    String description;

    switch (confidence) {
      case ConfidenceLevel.high:
        name = languageCode == 'ru' ? 'Высокая' : 'High';
        description = languageCode == 'ru'
            ? 'Данных достаточно для надёжных выводов'
            : 'Sufficient data for reliable conclusions';
        break;
      case ConfidenceLevel.medium:
        name = languageCode == 'ru' ? 'Средняя' : 'Medium';
        description = languageCode == 'ru'
            ? 'Пройдите ещё тесты для повышения точности'
            : 'Take more tests to increase accuracy';
        break;
      case ConfidenceLevel.low:
        name = languageCode == 'ru' ? 'Низкая' : 'Low';
        description = languageCode == 'ru'
            ? 'Недостаточно данных, пройдите больше тестов'
            : 'Insufficient data, take more tests';
        break;
    }

    return {
      'name': name,
      'description': description,
    };
  }

  /// Calculates statistics about test completion.
  Map<String, dynamic> getTestStatistics(List<TestResult> completedTests) {
    final totalTests = completedTests.length;
    final uniqueTestIds = completedTests.map((t) => t.testId).toSet().length;

    return {
      'totalTests': totalTests,
      'uniqueTests': uniqueTestIds,
      'hasMultipleAttempts': totalTests > uniqueTestIds,
    };
  }

  /// Validates if there is sufficient data for personality type calculation.
  bool hasSufficientDataForPersonalityType(List<TestResult> completedTests) {
    return getSixteenTypesResults(completedTests).isNotEmpty;
  }

  /// Gets the pole color for a bipolar dimension pole.
  ///
  /// Returns the color with appropriate opacity based on whether it's dominant.
  Map<String, dynamic> getPoleColorInfo(
    String pole,
    String dimensionPositiveEnd,
    bool isDominant,
  ) {
    final isPositivePole = pole == dimensionPositiveEnd;
    return {
      'isPositivePole': isPositivePole,
      'shouldHighlight': isDominant,
    };
  }

  /// Gets all questions from all tests that have personality type weights for specified scales.
  ///
  /// Returns a map of {testId_attemptIndex: {scaleId: [questions]}}.
  /// Each test attempt is tracked separately to show all answers from multiple completions.
  /// Useful for displaying questions that contribute to personality type scales.
  Map<String, Map<String, List<Map<String, dynamic>>>> getQuestionsWithPersonalityTypeWeights(
    List<TestResult> completedTests,
    List<String> scaleIds, // e.g., ['extraversion', 'introversion']
  ) {
    appLogger.d('getQuestionsWithPersonalityTypeWeights called with ${completedTests.length} completed tests for scales: $scaleIds');

    // Combine all weights from different tests
    final allWeights = <String, QuestionWeight>{
      ...IPIPBigFiveWeights.weights,
      ...FisherTemperamentWeights.weights,
      ...LoveProfileWeights.weights,
      ...SimpleTestsWeights.weights,
      ...SixteenTypesWeights.weights,
      ...TemperamentProfileTestWeights.weights,
      ...DigitalDetoxWeights.weights,
      ...BurnoutDiagnosticWeights.weights,
      ...SocialBatteryWeights.weights,
      ...DISCPersonalityWeights.weights,
      ...HollandCodeWeights.weights,
      ...LoveLanguagesWeights.weights,
      ...AnxietySymptomsInventoryWeights.weights,
      ...DepressionSymptomsInventoryWeights.weights,
      ...CareerCompassWeights.weights,
      ...WellbeingHappinessInventoryWeights.weights,
      ...DigitalCareerFitWeights.weights,
      ...SelfConfidenceMultiscaleWeights.weights,
      ...RomanticPotentialWeights.weights,
      ...CognitiveAbilityWeights.weights,
    };

    appLogger.d('Total weights loaded: ${allWeights.length}');

    // Result structure: {testId_attemptIndex: {scaleId: [questions with weights]}}
    // We need to track each test attempt separately
    final result = <String, Map<String, List<Map<String, dynamic>>>>{};

    // Group test results by testId to count attempts
    final testAttempts = <String, int>{};

    // For each completed test
    for (final testResult in completedTests) {
      final testId = testResult.testId;

      // Track attempt number for this test
      final attemptNumber = (testAttempts[testId] ?? 0) + 1;
      testAttempts[testId] = attemptNumber;

      appLogger.d('Processing test: $testId (attempt #$attemptNumber), answers: ${testResult.userAnswers?.length ?? 0}');

      // Skip if this test hasn't been completed
      if (testResult.userAnswers == null || testResult.userAnswers!.isEmpty) {
        appLogger.d('Skipping $testId attempt #$attemptNumber - no answers');
        continue;
      }

      // Find questions from this test that have Personality Type weights
      final testQuestions = <String, List<Map<String, dynamic>>>{};

      for (final scale in scaleIds) {
        testQuestions[scale] = [];
      }

      // Search through all weights to find questions from this test
      int questionsChecked = 0;
      int questionsWithTypeWeight = 0;

      allWeights.forEach((key, weight) {
        // Key format: 'test_id:question_id'
        if (!key.startsWith('$testId:')) {
          return; // Skip questions from other tests
        }

        questionsChecked++;
        final questionId = key.split(':')[1];

        // Check if this question has weights on any of our target scales
        bool hasAnyTypeWeight = false;
        for (final scale in scaleIds) {
          if (weight.axisWeights.containsKey(scale)) {
            hasAnyTypeWeight = true;
            final weightValue = weight.axisWeights[scale]!;

            testQuestions[scale]!.add({
              'questionId': questionId,
              'weight': weightValue,
              'testId': testId,
              'testResult': testResult,
              'attemptNumber': attemptNumber,
            });
          }
        }

        if (hasAnyTypeWeight) {
          questionsWithTypeWeight++;
        }
      });

      appLogger.d('Test $testId attempt #$attemptNumber: checked $questionsChecked questions, found $questionsWithTypeWeight with personality type weights');

      // Only add test to result if it has questions for at least one scale
      bool hasQuestions = testQuestions.values.any((list) => list.isNotEmpty);
      if (hasQuestions) {
        // Use unique key combining testId and attempt number
        final uniqueKey = attemptNumber > 1 ? '${testId}_attempt_$attemptNumber' : testId;
        result[uniqueKey] = testQuestions;
        appLogger.d('Added $uniqueKey to results');
      } else {
        appLogger.d('No personality type questions found for $testId attempt #$attemptNumber');
      }
    }

    appLogger.d('Final result: ${result.keys.length} test attempts with personality type questions');
    return result;
  }
}
