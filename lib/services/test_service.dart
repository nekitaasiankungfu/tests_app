import 'dart:math' as math;
import '../models/test_model.dart';
import '../data/test_data.dart';
import '../data/ipip_big_five_data.dart';
import '../data/fisher_temperament_data.dart';
import '../data/love_profile_data.dart';
import '../data/sixteen_types_data.dart';
import '../data/temperament_profile_test_data.dart';
import '../data/digital_detox_data.dart' as digital_detox;
import '../data/burnout_diagnostic_data.dart' as burnout;
import '../data/social_battery_data.dart';
import '../data/disc_personality_data.dart';
import '../data/holland_code_data.dart';
import '../data/love_languages_data.dart';
import '../data/anxiety_symptoms_inventory_data.dart';
import '../data/depression_symptoms_inventory_data.dart';
import '../data/wellbeing_happiness_inventory_data.dart';
import '../data/digital_career_fit_data.dart' as digital_career;
import '../data/self_confidence_multiscale_data.dart';
import '../data/romantic_potential_data.dart';
import '../data/cognitive_ability_data.dart';
import '../data/relationship_compatibility_data.dart';
import '../data/friendship_psychology_data.dart';
import '../data/adhd_attention_profile_data.dart';
import '../data/perfectionism_fear_of_error_data.dart';
import '../data/values_priorities_data.dart';
import '../data/attachment_style_data.dart';
import '../data/motivational_strategies_data.dart';
import '../data/conflict_communication_style_data.dart';
import '../data/emotional_intelligence_data.dart';
import '../data/imposter_syndrome_data.dart';
import '../data/sleep_recovery_data.dart';
import '../data/procrastination_productivity_data.dart';
import '../data/boundaries_people_pleasing_data.dart';
import '../data/fomo_social_comparison_data.dart';
import '../data/creative_type_data.dart';
import '../data/friendship_red_flags_data.dart';
import '../config/summary_config.dart';
import '../config/summary/personality_type_scales.dart';
import '../utils/app_logger.dart';

/// Service class for handling test business logic including:
/// - Answer validation
/// - Score calculation for different test types
/// - Result generation
/// - Quality validation
class TestService {
  /// Helper class to accumulate weighted scores for hierarchical scales
  final ScaleScoreAccumulator _scaleAccumulator = ScaleScoreAccumulator();

  /// Validates that all questions have been answered
  /// Returns a list of unanswered question IDs
  List<String> validateAllQuestionsAnswered(
    TestModel test,
    Map<String, String> answers,
  ) {
    final unansweredQuestions = <String>[];
    for (final question in test.questions) {
      if (!answers.containsKey(question.id)) {
        unansweredQuestions.add(question.id);
      }
    }
    return unansweredQuestions;
  }

  /// Completes a test and generates the result based on test type
  /// Returns TestResult with calculated scores and interpretations
  Future<TestResult> completeTest(
    TestModel test,
    Map<String, String> answers,
    String languageCode,
  ) async {
    appLogger.d('===== completeTest() CALLED =====');
    appLogger.d('testId: ${test.id}');
    appLogger.d('type: ${test.type}');
    appLogger.d('isBipolar: ${test.isBipolar}');
    appLogger.d('bipolarDimensions: ${test.bipolarDimensions}');

    // For multi-factor tests
    if (test.type == TestType.multiFactor && test.factorIds != null) {
      appLogger.d('Multi-factor test detected');
      // Bipolar tests (16 personality types / Personality Type-style)
      if (test.isBipolar && test.bipolarDimensions != null) {
        appLogger.d('Calling _completeBipolarTest()');
        return _completeBipolarTest(test, answers, languageCode);
      } else {
        appLogger.d('Calling _completeMultiFactorTest()');
        // Regular multi-factor (IPIP, Fisher, Love Profile)
        return _completeMultiFactorTest(test, answers);
      }
    } else {
      appLogger.d('Calling _completeSimpleTest()');
      return _completeSimpleTest(test, answers);
    }
  }

  /// Completes a multi-factor test (IPIP Big Five, Fisher, Love Profile)
  Future<TestResult> _completeMultiFactorTest(
    TestModel test,
    Map<String, String> answers,
  ) async {
    // Calculate scores by factors
    Map<String, int> factorScores = {};
    Map<String, int> factorMaxScores = {};

    // Initialize counters
    for (String factorId in test.factorIds!) {
      factorScores[factorId] = 0;
      factorMaxScores[factorId] = 0;
    }

    // Calculate scores
    int totalScore = 0;
    int maxScore = 0;

    // Determine max question score depending on test
    final int maxQuestionScore = test.id == 'fisher_temperament'
        ? 3
        : test.id == 'anxiety_symptoms_inventory_v1'
            ? 3  // Anxiety Symptoms Inventory uses 0-3 scoring (4-point intensity scale)
            : test.id == 'depression_symptoms_inventory_v1'
                ? 3  // Depression Symptoms Inventory uses 0-3 scoring (4-point frequency scale)
                : test.id == 'cognitive_ability_v1'
                    ? 1  // Cognitive Ability uses binary 0-1 scoring (correct/incorrect)
                    : test.id == 'disc_personality_v1'
                        ? 4  // DISC uses 0-4 scoring
                        : test.id == 'holland_code_v1'
                            ? 4  // Holland Code uses 0-4 scoring
                            : test.id == 'love_languages_v1'
                                ? 4  // Love Languages uses 0-4 scoring
                                : test.id == 'self_confidence_multiscale_v1'
                                    ? 4  // Self-Confidence Multiscale uses 0-4 scoring (5-point Likert)
                                    : test.id == 'relationship_compatibility_v1'
                                        ? 4  // Relationship Compatibility uses 0-4 scoring (5-point Likert)
                                        : test.id == 'friendship_psychology_v1'
                                            ? 4  // Friendship Psychology uses 0-4 scoring (5-point Likert)
                                            : test.id == 'perfectionism_fear_of_error_v1'
                                                ? 4  // Perfectionism Fear of Error uses 0-4 scoring (5-point Likert)
                                                : test.id == 'values_priorities_v1'
                                                    ? 4  // Values and Priorities uses 0-4 scoring (5-point Likert)
                                                    : test.id == 'attachment_styles_v1'
                                                        ? 4  // Attachment Styles uses 0-4 scoring (5-point Likert)
                                                        : test.id == 'motivational_strategies_v1'
                                                            ? 4  // Motivational Strategies uses 0-4 scoring (5-point Likert)
                                                            : test.id == 'wellbeing_happiness_inventory_v1'
                                                    ? 5  // Wellbeing Happiness Inventory uses 0-5 scoring (6-point Likert)
                                                    : test.id == 'digital_career_fit_v1'
                                                        ? 5  // Digital Career Fit uses 0-5 scoring (6 career directions)
                                                        : test.id == 'adhd_attention_profile_v2'
                                                            ? 4  // ADHD Attention Profile uses 0-4 scoring (5-point frequency scale)
                                                            : test.id == 'emotional_intelligence'
                                                                ? 4  // Emotional Intelligence uses 0-4 scoring (5-point frequency scale)
                                                                : test.id == 'imposter_syndrome'
                                                                    ? 4  // Imposter Syndrome uses 0-4 scoring (5-point Likert scale)
                                                                    : test.id == 'sleep_recovery_v1'
                                                                        ? 4  // Sleep Recovery uses 0-4 scoring (5-point frequency scale)
                                                                        : test.id == 'procrastination_productivity_style_v1'
                                                                            ? 4  // Procrastination Productivity uses 0-4 scoring (5-point frequency scale)
                                                                            : test.id == 'boundaries_people_pleasing'
                                                                                ? 4  // Boundaries People-Pleasing uses 0-4 scoring (5-point frequency scale)
                                                                                : test.id == 'fomo_social_comparison_v1'
                                                                                    ? 4  // FOMO Social Comparison uses 0-4 scoring (5-point frequency scale)
                                                                                    : test.id == 'creative_type_v1'
                                                                                        ? 4  // Creative Type uses 0-4 scoring for frequency questions (questions 1-40)
                                                                                        : test.id == 'friendship_red_flags_v1'
                                                                                            ? 4  // Friendship Red Flags uses 0-4 scoring (5-point frequency scale)
                                                                                            : 5;

    for (final question in test.questions) {
      final selectedAnswerId = answers[question.id];
      if (selectedAnswerId != null) {
        final selectedAnswer = question.answers.firstWhere(
          (answer) => answer.id == selectedAnswerId,
          orElse: () => question.answers.first, // Fallback if answer not found
        );

        // Handle reversed questions depending on test type
        int score = selectedAnswer.score;
        if (question.isReversed) {
          if (test.id == 'ipip_big_five') {
            // Invert scores: 1->5, 2->4, 3->3, 4->2, 5->1
            score = 6 - selectedAnswer.score;
          } else if (test.id == 'love_profile') {
            // For Love Profile test: invert scores: 1->5, 2->4, 3->3, 4->2, 5->1
            score = 6 - selectedAnswer.score;
          }
        }

        totalScore += score;

        // Add score to corresponding factor
        if (question.factorId != null) {
          // Special handling for Creative Type Test multiple choice questions (q41-48)
          if (test.id == 'creative_type_v1' && question.factorId == 'multiple') {
            // Use answer-specific weights from getAnswerWeights()
            final answerWeights = CreativeTypeData.getAnswerWeights();
            final weights = answerWeights[selectedAnswerId];
            if (weights != null) {
              // Add weights to each affected factor
              weights.forEach((factorId, weight) {
                factorScores[factorId] = (factorScores[factorId] ?? 0) + weight.toInt();
                // Note: maxScore is handled separately for creative_type
              });
            }
          }
          // Special handling for other multi-choice tests (Digital Career Fit, Conflict Communication Style)
          else if ((test.id == 'digital_career_fit_v1' || test.id == 'conflict_communication_style_v1') && question.factorId == 'multi_choice') {
            // Map score to factor using factorOrder
            final factorOrder = test.id == 'digital_career_fit_v1'
                ? digital_career.DigitalCareerFitData.factorOrder
                : ConflictCommunicationStyleData.factorOrder;
            if (score >= 0 && score < factorOrder.length) {
              final selectedFactor = factorOrder[score];
              // Each question adds 1 point to the chosen factor
              factorScores[selectedFactor] = (factorScores[selectedFactor] ?? 0) + 1;
              // Max score per factor = number of questions
              factorMaxScores[selectedFactor] = (factorMaxScores[selectedFactor] ?? 0) + 0; // Will set max later
            }
          } else {
            factorScores[question.factorId!] =
                (factorScores[question.factorId!] ?? 0) + score;
            factorMaxScores[question.factorId!] =
                (factorMaxScores[question.factorId!] ?? 0) + maxQuestionScore;
          }
        }
      }

      // For Love Profile test, max is 50 points per factor, not per question
      final questionMaxScore = test.id == 'love_profile' ? 5 : maxQuestionScore;
      maxScore += questionMaxScore;
    }

    // Calculate hierarchical scale scores using per-question weights (v2)
    final scaleAccumulator = ScaleScoreAccumulator();
    final Map<String, int> userAnswersMap = {}; // For migration support

    for (final question in test.questions) {
      final selectedAnswerId = answers[question.id];
      if (selectedAnswerId == null) continue;

      final selectedAnswer = question.answers.firstWhere(
        (answer) => answer.id == selectedAnswerId,
        orElse: () => question.answers.first, // Fallback if answer not found
      );

      // Get answer score with reversal logic
      int answerScore = selectedAnswer.score;
      if (question.isReversed) {
        if (test.id == 'ipip_big_five' || test.id == 'love_profile') {
          answerScore = 6 - selectedAnswer.score; // 1->5, 2->4, 3->3, 4->2, 5->1
        }
      }

      // Store for migration
      // Now we store ALL answers including multi-choice tests
      userAnswersMap[question.id] = answerScore;

      // Get min and max answer scores for this question (dynamic range detection)
      final minAnswerScore =
          question.answers.map((a) => a.score).reduce((a, b) => a < b ? a : b);
      final maxAnswerScore =
          question.answers.map((a) => a.score).reduce((a, b) => a > b ? a : b);

      // Get question weights from config
      final questionWeight =
          QuestionWeightsConfig.getWeights(test.id, question.id);

      if (questionWeight != null) {
        // Apply weighted scoring to each axis
        questionWeight.axisWeights.forEach((scaleId, weight) {
          final direction = questionWeight.getDirection(scaleId); // Get direction for this scale
          scaleAccumulator.addScore(
            scaleId,
            answerScore.toDouble(),
            minAnswerScore.toDouble(), // Pass min score for proper normalization
            maxAnswerScore.toDouble(),
            weight.abs(), // Use absolute value - direction is handled separately
            question,
            answerScore,
            direction, // Pass direction (1 = direct, -1 = inverted)
          );
        });
      }
    }

    // For Creative Type Test: handle frequency questions (q1-40) with multiple axisWeights
    // These questions have axisWeights defined directly in QuestionModel
    if (test.id == 'creative_type_v1') {
      appLogger.d('Processing Creative Type frequency questions with axisWeights');
      for (final question in test.questions) {
        // Skip multiple choice questions (q41-48), they are handled separately below
        if (question.factorId == 'multiple') continue;

        final selectedAnswerId = answers[question.id];
        if (selectedAnswerId == null) continue;

        final selectedAnswer = question.answers.firstWhere(
          (answer) => answer.id == selectedAnswerId,
          orElse: () => question.answers.first,
        );

        int answerScore = selectedAnswer.score;

        // If question has axisWeights, apply them to factor scores
        if (question.axisWeights != null && question.axisWeights!.isNotEmpty) {
          question.axisWeights!.forEach((factorId, weight) {
            // Add weighted score to factor
            factorScores[factorId] = (factorScores[factorId] ?? 0) + (answerScore * weight).toInt();
            // Max score per question contribution
            factorMaxScores[factorId] = (factorMaxScores[factorId] ?? 0) + (maxQuestionScore * weight).toInt();
          });
        }
      }

      // Handle multiple choice questions (q41-48) with getAnswerWeights()
      // These already processed in main loop above, but we need maxScores
      final answerWeights = CreativeTypeData.getAnswerWeights();
      // Calculate max possible scores for each factor based on answer weights
      for (final question in test.questions) {
        if (question.factorId == 'multiple') {
          // Find the maximum possible weight for each factor from this question's answers
          for (final answer in question.answers) {
            final weights = answerWeights[answer.id];
            if (weights != null) {
              weights.forEach((factorId, weight) {
                // Track maximum possible contribution from this answer choice
                final currentMax = factorMaxScores[factorId] ?? 0;
                // We take the max weight available for this factor across all answers
                factorMaxScores[factorId] = math.max(currentMax, (factorMaxScores[factorId] ?? 0) + weight.toInt());
              });
            }
          }
        }
      }
    }

    // For multi-choice tests: apply weights for each individual question
    // (not aggregated factor scores, to show real question texts)
    else if ((test.id == 'digital_career_fit_v1' || test.id == 'conflict_communication_style_v1')) {
      appLogger.d('Processing multi-choice test questions for scales');

      // Get factor order to map answers to factors
      final factorOrder = test.id == 'digital_career_fit_v1'
          ? digital_career.DigitalCareerFitData.factorOrder
          : ConflictCommunicationStyleData.factorOrder;

      // Process each question
      for (final question in test.questions) {
        final selectedAnswerId = answers[question.id];
        if (selectedAnswerId == null) continue;

        final selectedAnswer = question.answers.firstWhere(
          (answer) => answer.id == selectedAnswerId,
          orElse: () => question.answers.first,
        );

        // Get the selected factor based on answer score
        int score = selectedAnswer.score;
        if (score < 0 || score >= factorOrder.length) continue;

        final selectedFactor = factorOrder[score];

        // Get weights for this factor
        final factorKey = 'factor_$selectedFactor';
        final questionWeight = QuestionWeightsConfig.getWeights(test.id, factorKey);

        if (questionWeight != null) {
          // Each question contributes 1 point to its selected factor
          // Max score per question = 1 (since each question picks one factor)
          final contribution = 1.0;
          final maxContribution = 1.0;

          // Apply weighted scoring to each scale
          questionWeight.axisWeights.forEach((scaleId, weight) {
            final direction = questionWeight.getDirection(scaleId);
            scaleAccumulator.addScore(
              scaleId,
              contribution,
              0.0,
              maxContribution,
              weight.abs(),
              question,  // Use real question instead of pseudo-question
              score,     // Store the answer score (which factor was selected)
              direction,
            );
          });
        }
      }
    }

    // Get normalized scale scores (0-100)
    final Map<String, double> scaleScores =
        scaleAccumulator.getNormalizedScores();

    // Get question contributions for transparency
    final Map<String, List<QuestionContribution>> questionContributions =
        scaleAccumulator.getContributions();

    // DEBUG: Log contributions
    appLogger.d('Multi-factor test - Created ${scaleScores.length} scale scores');
    appLogger.d(
        'Multi-factor test - Created ${questionContributions.length} scales with contributions');
    questionContributions.forEach((scaleId, contribs) {
      appLogger.d('  - Scale $scaleId: ${contribs.length} questions');
    });

    // Create FactorScore for each factor
    Map<String, FactorScore> factorScoresMap = {};
    Map<String, Map<String, String>> factorNames;
    dynamic factorInterpretations; // Can be different types depending on test

    // Choose data depending on test
    if (test.id == 'fisher_temperament') {
      factorNames = FisherTemperamentData.getFactorNames();
      factorInterpretations = FisherTemperamentData.getFactorInterpretations();
    } else if (test.id == 'love_profile') {
      factorNames = LoveProfileData.getFactorNames();
      factorInterpretations = LoveProfileData.getFactorInterpretations();
    } else if (test.id == 'temperament_profile_test') {
      factorNames = TemperamentProfileTestData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'digital_detox_test') {
      factorNames = digital_detox.DigitalDetoxTestData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'burnout_diagnostic_v1') {
      factorNames = burnout.BurnoutDiagnosticData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'social_battery_v1') {
      factorNames = SocialBatteryData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'disc_personality_v1') {
      factorNames = DISCPersonalityData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'holland_code_v1') {
      factorNames = HollandCodeData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'love_languages_v1') {
      factorNames = LoveLanguagesData.getFactorNames();
      factorInterpretations = {};
    } else if (test.id == 'anxiety_symptoms_inventory_v1') {
      factorNames = AnxietySymptomsInventoryData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'depression_symptoms_inventory_v1') {
      factorNames = DepressionSymptomsInventoryData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'wellbeing_happiness_inventory_v1') {
      factorNames = WellbeingHappinessInventoryData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'digital_career_fit_v1') {
      factorNames = digital_career.DigitalCareerFitData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'self_confidence_multiscale_v1') {
      factorNames = SelfConfidenceMultiscaleData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'romantic_potential_v1') {
      factorNames = RomanticPotentialData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'cognitive_ability_v1') {
      factorNames = CognitiveAbilityData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'relationship_compatibility_v1') {
      factorNames = RelationshipCompatibilityData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'friendship_psychology_v1') {
      factorNames = FriendshipPsychologyData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'adhd_attention_profile_v2') {
      factorNames = ADHDAttentionProfileData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'perfectionism_fear_of_error_v1') {
      factorNames = PerfectionismFearOfErrorData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'values_priorities_v1') {
      factorNames = ValuesPrioritiesData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'attachment_styles_v1') {
      factorNames = AttachmentStyleData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'motivational_strategies_v1') {
      factorNames = MotivationalStrategiesData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'conflict_communication_style_v1') {
      factorNames = {}; // Will use getFactorName method
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'emotional_intelligence') {
      factorNames = EmotionalIntelligenceData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'imposter_syndrome') {
      factorNames = ImposterSyndromeData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'sleep_recovery_v1') {
      factorNames = SleepRecoveryData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'procrastination_productivity_style_v1') {
      factorNames = ProcrastinationProductivityData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'fomo_social_comparison_v1') {
      factorNames = FomoSocialComparisonData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'creative_type_v1') {
      factorNames = CreativeTypeData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'friendship_red_flags_v1') {
      factorNames = FriendshipRedFlagsData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else if (test.id == 'boundaries_people_pleasing') {
      factorNames = BoundariesPeoplePleasingData.getFactorNames();
      factorInterpretations = {}; // Will use percentage-based interpretation
    } else {
      factorNames = IPIPBigFiveData.getFactorNames();
      factorInterpretations = {};
    }

    // For multi-choice tests (Conflict Communication Style), save factor scores
    // as pseudo-questions for summary_service compatibility
    if (test.id == 'conflict_communication_style_v1') {
      for (String factorId in test.factorIds!) {
        final score = factorScores[factorId] ?? 0;
        userAnswersMap['factor_$factorId'] = score;
      }
    }

    for (String factorId in test.factorIds!) {
      final score = factorScores[factorId] ?? 0;
      // For Love Profile test max is 50 points per factor (10 questions × 5 points)
      // For Digital Career Fit test max is 18 (total questions, since each adds 1 to chosen factor)
      // For Conflict Communication Style test max is 45 (each question gives 1 point to chosen style)
      int maxFactorScore;
      if (test.id == 'love_profile') {
        maxFactorScore = 50;
      } else if (test.id == 'digital_career_fit_v1') {
        maxFactorScore = test.questions.length; // 18 questions
      } else if (test.id == 'conflict_communication_style_v1') {
        maxFactorScore = test.questions.length; // 45 questions
      } else {
        maxFactorScore = factorMaxScores[factorId] ?? 50;
      }
      // Protect against division by zero
      if (maxFactorScore <= 0) {
        maxFactorScore = 1;
      }

      Map<String, String> interpretation;
      if (test.id == 'fisher_temperament') {
        // For Fisher test interpretations are ready
        interpretation = factorInterpretations[factorId] ??
            {'ru': 'Нет интерпретации', 'en': 'No interpretation'};
      } else if (test.id == 'love_profile') {
        // For Love Profile test choose interpretation by levels
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            LoveProfileData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'temperament_profile_test') {
        // For Temperament Profile test use percentage-based interpretation
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            TemperamentProfileTestData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'digital_detox_test') {
        // For Digital Detox test use percentage-based interpretation
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            digital_detox.DigitalDetoxTestData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'burnout_diagnostic_v1') {
        // For Burnout Diagnostic test use percentage-based interpretation
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            burnout.BurnoutDiagnosticData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'social_battery_v1') {
        // For Social Battery test use percentage-based interpretation
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            SocialBatteryData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'disc_personality_v1') {
        // For DISC Personality test use percentage-based interpretation
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            DISCPersonalityData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'holland_code_v1') {
        // For Holland Code test use percentage-based interpretation
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            HollandCodeData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'love_languages_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            LoveLanguagesData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'anxiety_symptoms_inventory_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            AnxietySymptomsInventoryData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'depression_symptoms_inventory_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            DepressionSymptomsInventoryData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'wellbeing_happiness_inventory_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            WellbeingHappinessInventoryData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'digital_career_fit_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            digital_career.DigitalCareerFitData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'self_confidence_multiscale_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            SelfConfidenceMultiscaleData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'romantic_potential_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            RomanticPotentialData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'cognitive_ability_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            CognitiveAbilityData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'relationship_compatibility_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            RelationshipCompatibilityData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'friendship_psychology_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            FriendshipPsychologyData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'adhd_attention_profile_v2') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            ADHDAttentionProfileData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'perfectionism_fear_of_error_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            PerfectionismFearOfErrorData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'values_priorities_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            ValuesPrioritiesData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'attachment_styles_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            AttachmentStyleData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'motivational_strategies_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            MotivationalStrategiesData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'conflict_communication_style_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            ConflictCommunicationStyleData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'emotional_intelligence') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            EmotionalIntelligenceData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'imposter_syndrome') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            ImposterSyndromeData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'sleep_recovery_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            SleepRecoveryData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'procrastination_productivity_style_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            ProcrastinationProductivityData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'fomo_social_comparison_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            FomoSocialComparisonData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'creative_type_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            CreativeTypeData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'friendship_red_flags_v1') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            FriendshipRedFlagsData.getFactorInterpretation(factorId, percentage);
      } else if (test.id == 'boundaries_people_pleasing') {
        final percentage = (score / maxFactorScore) * 100;
        interpretation =
            BoundariesPeoplePleasingData.getFactorInterpretation(factorId, percentage);
      } else {
        interpretation = IPIPBigFiveData.getFactorInterpretation(factorId, score);
      }

      factorScoresMap[factorId] = FactorScore(
        factorId: factorId,
        factorName: (test.id == 'conflict_communication_style_v1')
            ? ConflictCommunicationStyleData.getFactorName(factorId)
            : (factorNames[factorId] ??
                {'ru': 'Неизвестный фактор', 'en': 'Unknown factor'}),
        score: score,
        maxScore: maxFactorScore,
        interpretation: interpretation,
      );
    }

    // Create result
    final result = TestResult(
      testId: test.id,
      totalScore: totalScore,
      maxScore: maxScore,
      interpretation:
          'Multi-factor test', // Will show detailed analysis by factors
      completedAt: DateTime.now(),
      factorScores: factorScoresMap, // v1 legacy factor scores (for backward compatibility)
      version: 2, // v2 scoring with per-question weights
      userAnswers: userAnswersMap, // For future recalculation/migration
      scaleScores: scaleScores, // v2 hierarchical scale scores (0-100 normalized)
      questionContributions:
          questionContributions, // v2 question-level transparency
    );

    // DEBUG: Verify questionContributions
    appLogger.d('Created TestResult for ${test.id}');
    appLogger.d(
        '  - questionContributions is ${result.questionContributions == null ? "null" : "not null (${result.questionContributions!.length} scales)"}');

    return result;
  }

  /// Completes a simple test (stress test, self-esteem test)
  Future<TestResult> _completeSimpleTest(
    TestModel test,
    Map<String, String> answers,
  ) async {
    // Calculate result for simple tests
    int totalScore = 0;
    int maxScore = 0;

    for (final question in test.questions) {
      final selectedAnswerId = answers[question.id];
      if (selectedAnswerId != null) {
        final selectedAnswer = question.answers.firstWhere(
          (answer) => answer.id == selectedAnswerId,
          orElse: () => question.answers.first, // Fallback if answer not found
        );
        totalScore += selectedAnswer.score;
      }

      // Maximum score for question
      maxScore +=
          question.answers.map((a) => a.score).reduce((a, b) => a > b ? a : b);
    }

    // Calculate hierarchical scale scores using per-question weights (v2)
    final scaleAccumulator = ScaleScoreAccumulator();
    final Map<String, int> userAnswersMap = {}; // For migration support

    for (final question in test.questions) {
      final selectedAnswerId = answers[question.id];
      if (selectedAnswerId == null) continue;

      final selectedAnswer = question.answers.firstWhere(
        (answer) => answer.id == selectedAnswerId,
        orElse: () => question.answers.first, // Fallback if answer not found
      );

      final answerScore = selectedAnswer.score;
      userAnswersMap[question.id] = answerScore;

      // Get min and max answer scores for this question (dynamic range detection)
      final minAnswerScore =
          question.answers.map((a) => a.score).reduce((a, b) => a < b ? a : b);
      final maxAnswerScore =
          question.answers.map((a) => a.score).reduce((a, b) => a > b ? a : b);

      // Get question weights from config
      final questionWeight =
          QuestionWeightsConfig.getWeights(test.id, question.id);

      if (questionWeight != null) {
        // Apply weighted scoring to each axis
        questionWeight.axisWeights.forEach((scaleId, weight) {
          final direction = questionWeight.getDirection(scaleId); // Get direction for this scale
          scaleAccumulator.addScore(
            scaleId,
            answerScore.toDouble(),
            minAnswerScore.toDouble(), // Pass min score for proper normalization
            maxAnswerScore.toDouble(),
            weight.abs(), // Use absolute value - direction is handled separately
            question,
            answerScore,
            direction, // Pass direction (1 = direct, -1 = inverted)
          );
        });
      }
    }

    final Map<String, double> scaleScores =
        scaleAccumulator.getNormalizedScores();

    // Get question contributions for transparency
    final Map<String, List<QuestionContribution>> questionContributions =
        scaleAccumulator.getContributions();

    // DEBUG: Log contributions
    appLogger.d('Simple test - Created ${scaleScores.length} scale scores');
    appLogger.d(
        'Simple test - Created ${questionContributions.length} scales with contributions');
    questionContributions.forEach((scaleId, contribs) {
      appLogger.d('  - Scale $scaleId: ${contribs.length} questions');
    });

    // Get interpretation
    String interpretation;
    if (test.id == 'stress_test') {
      interpretation = TestData.getStressInterpretation(totalScore);
    } else if (test.id == 'self_esteem_test') {
      interpretation = TestData.getSelfEsteemInterpretation(totalScore);
    } else {
      interpretation = 'Результат: $totalScore из $maxScore баллов';
    }

    // Create result
    final result = TestResult(
      testId: test.id,
      totalScore: totalScore,
      maxScore: maxScore,
      interpretation: interpretation,
      completedAt: DateTime.now(),
      version: 2, // v2 scoring with per-question weights
      userAnswers: userAnswersMap, // For future recalculation/migration
      scaleScores: scaleScores, // v2 hierarchical scale scores (0-100 normalized)
      questionContributions:
          questionContributions, // v2 question-level transparency
    );

    return result;
  }

  /// Completes a bipolar test (16 personality types / Personality Type-style)
  /// Now uses 8 unipolar scales instead of 4 bipolar scales for better granularity
  Future<TestResult> _completeBipolarTest(
    TestModel test,
    Map<String, String> answers,
    String languageCode,
  ) async {
    appLogger.d('===== START _completeBipolarTest() (UNIPOLAR V2 ALGORITHM) =====');
    appLogger.d('Total questions in test: ${test.questions.length}');
    appLogger.d('Total answers: ${answers.length}');

    // NEW ALGORITHM: 8 UNIPOLAR SCALES
    // Each question contributes to ONE of 8 scales with positive scores (1-5)
    // Scales: extraversion, introversion, sensing, intuition, thinking, feeling, judging, perceiving

    Map<String, int> userAnswersScores = {}; // questionId -> answerScore

    // Accumulate scores for each of the 8 scales
    Map<String, int> scaleRawScores = {
      'extraversion': 0,
      'introversion': 0,
      'sensing': 0,
      'intuition': 0,
      'thinking': 0,
      'feeling': 0,
      'judging': 0,
      'perceiving': 0,
    };

    Map<String, int> scaleMaxScores = {
      'extraversion': 0,
      'introversion': 0,
      'sensing': 0,
      'intuition': 0,
      'thinking': 0,
      'feeling': 0,
      'judging': 0,
      'perceiving': 0,
    };

    // Calculate scores for each scale
    appLogger.d('Starting question loop with targetScale method...');
    int skippedQuestions = 0;
    int processedQuestions = 0;

    for (final question in test.questions) {
      final selectedAnswerId = answers[question.id];

      if (selectedAnswerId != null) {
        final selectedAnswer = question.answers.firstWhere(
          (answer) => answer.id == selectedAnswerId,
          orElse: () => question.answers.first, // Fallback if answer not found
        );
        final answerScore = selectedAnswer.score; // 1-5

        // Save score for all answered questions
        userAnswersScores[question.id] = answerScore;

        // NEW: Use targetScale to determine which scale this question contributes to
        if (question.targetScale != null) {
          final targetScale = question.targetScale!;

          if (scaleRawScores.containsKey(targetScale)) {
            scaleRawScores[targetScale] = scaleRawScores[targetScale]! + answerScore;
            scaleMaxScores[targetScale] = scaleMaxScores[targetScale]! + 5; // Max answer is 5
            processedQuestions++;

            appLogger.d('Q${question.id}: targetScale=$targetScale, score=$answerScore');
          } else {
            appLogger.w('WARNING: Unknown targetScale: $targetScale for question ${question.id}');
          }
        } else {
          // Fallback to old bipolarPole method for backward compatibility
          if (question.bipolarDimension != null && question.bipolarPole != null) {
            final pole = question.bipolarPole!;

            // Map bipolar poles to new scale names
            String? targetScale;
            switch (pole) {
              case 'E': targetScale = 'extraversion'; break;
              case 'I': targetScale = 'introversion'; break;
              case 'S': targetScale = 'sensing'; break;
              case 'N': targetScale = 'intuition'; break;
              case 'T': targetScale = 'thinking'; break;
              case 'F': targetScale = 'feeling'; break;
              case 'J': targetScale = 'judging'; break;
              case 'P': targetScale = 'perceiving'; break;
            }

            if (targetScale != null) {
              scaleRawScores[targetScale] = scaleRawScores[targetScale]! + answerScore;
              scaleMaxScores[targetScale] = scaleMaxScores[targetScale]! + 5;
              processedQuestions++;

              appLogger.d('Q${question.id}: bipolarPole=$pole -> targetScale=$targetScale, score=$answerScore');
            }
          } else {
            appLogger.w('WARNING: Question ${question.id} has no targetScale or bipolarPole');
          }
        }
      } else {
        // Answer not found for question
        skippedQuestions++;
        appLogger.w('WARNING: Question ${question.id} skipped (no answer)');
      }
    }

    appLogger.d('End of loop. Processed questions: $processedQuestions');
    appLogger.d('Skipped questions: $skippedQuestions');
    appLogger.d('Answered questions: ${userAnswersScores.length}');
    appLogger.d('Raw scale scores: $scaleRawScores');

    // Normalize scale scores to 0-100
    Map<String, double> typeScales = {};
    for (final scaleId in scaleRawScores.keys) {
      final rawScore = scaleRawScores[scaleId] ?? 0;
      final maxScore = scaleMaxScores[scaleId] ?? 1;

      if (maxScore > 0) {
        typeScales[scaleId] = (rawScore / maxScore) * 100.0;
      } else {
        typeScales[scaleId] = 0.0;
      }

      appLogger.d('Scale $scaleId: $rawScore/$maxScore = ${typeScales[scaleId]?.toStringAsFixed(1)}%');
    }

    // Convert 8 unipolar scales to 4 bipolar scores for backward compatibility
    final bipolarPercentages = PersonalityTypeScales.convertToBipolarScores(typeScales);
    appLogger.d('Bipolar percentages (for UI): $bipolarPercentages');

    // Determine personality type code using the new method
    final personalityTypeCode = PersonalityTypeScales.determineTypeCode(typeScales);
    appLogger.d('Personality type code: $personalityTypeCode');

    // Create BipolarDimensionScore objects for backward compatibility with UI
    Map<String, BipolarDimensionScore> bipolarScoresMap = {};
    const WEAK_THRESHOLD = 10.0; // Threshold for weak manifestation

    final dimensionMapping = {
      'personality_type_ei': 'EI',
      'personality_type_sn': 'SN',
      'personality_type_tf': 'TF',
      'personality_type_jp': 'JP',
    };

    for (final entry in dimensionMapping.entries) {
      final dimensionId = entry.key;
      final shortId = entry.value;
      final dimension = SummaryConfig.getBipolarScale(dimensionId);

      if (dimension == null) continue;

      final bipolarPercentage = bipolarPercentages[shortId] ?? 50.0;

      // Determine dominant pole
      final diffPercentage = (bipolarPercentage - 50.0).abs() * 2; // Convert to 0-100 scale
      final String dominantPole;

      if (diffPercentage < WEAK_THRESHOLD) {
        // Weak manifestation - show dominant letter
        dominantPole = bipolarPercentage >= 50.0 ? dimension.positiveEnd : dimension.negativeEnd;
      } else {
        dominantPole = bipolarPercentage > 50.0
            ? dimension.positiveEnd
            : bipolarPercentage < 50.0
                ? dimension.negativeEnd
                : dimension.positiveEnd; // If exactly 50, choose positive
      }

      // Get raw scores from the corresponding scales
      int positiveScore = 0;
      int negativeScore = 0;
      int positiveMax = 0;
      int negativeMax = 0;

      switch (shortId) {
        case 'EI':
          positiveScore = scaleRawScores['extraversion'] ?? 0;
          negativeScore = scaleRawScores['introversion'] ?? 0;
          positiveMax = scaleMaxScores['extraversion'] ?? 1;
          negativeMax = scaleMaxScores['introversion'] ?? 1;
          break;
        case 'SN':
          positiveScore = scaleRawScores['sensing'] ?? 0;
          negativeScore = scaleRawScores['intuition'] ?? 0;
          positiveMax = scaleMaxScores['sensing'] ?? 1;
          negativeMax = scaleMaxScores['intuition'] ?? 1;
          break;
        case 'TF':
          positiveScore = scaleRawScores['thinking'] ?? 0;
          negativeScore = scaleRawScores['feeling'] ?? 0;
          positiveMax = scaleMaxScores['thinking'] ?? 1;
          negativeMax = scaleMaxScores['feeling'] ?? 1;
          break;
        case 'JP':
          positiveScore = scaleRawScores['judging'] ?? 0;
          negativeScore = scaleRawScores['perceiving'] ?? 0;
          positiveMax = scaleMaxScores['judging'] ?? 1;
          negativeMax = scaleMaxScores['perceiving'] ?? 1;
          break;
      }

      // Calculate confidence interval (±5% standard error of measurement)
      const double confidenceInterval = 5.0; // ±5%

      bipolarScoresMap[dimensionId] = BipolarDimensionScore(
        dimensionId: dimensionId,
        positiveScore: positiveScore,
        negativeScore: negativeScore,
        positiveMaxScore: positiveMax,
        negativeMaxScore: negativeMax,
        dominantPole: dominantPole,
        normalizedScore: bipolarPercentage,
        confidenceInterval: confidenceInterval,
      );

      appLogger.d(
          '$dimensionId: normalized=${bipolarPercentage.toStringAsFixed(1)}%, dominant=$dominantPole, CI=±$confidenceInterval%');
    }

    // Get description for personality type
    final typeDescriptions = SixteenTypesData.getTypeDescriptions();
    final typeDescription = typeDescriptions[personalityTypeCode]?[languageCode] ??
        typeDescriptions[personalityTypeCode]?['ru'] ??
        'Description for type $personalityTypeCode is not yet available.';

    // Calculate total score (sum of all raw scores)
    int totalScore = scaleRawScores.values.reduce((a, b) => a + b);
    int maxScore = scaleMaxScores.values.reduce((a, b) => a + b);

    appLogger.d('userAnswersScores contains ${userAnswersScores.length} answers');
    appLogger.d('Total questions in test: ${test.questions.length}');
    appLogger.d('Expected 80 answers, received: ${userAnswersScores.length}');
    appLogger.d(
        'First 5 answers: ${userAnswersScores.entries.take(5).map((e) => '${e.key}:${e.value}').join(', ')}');
    if (userAnswersScores.length >= 5) {
      appLogger.d(
          'Last 5 answers: ${userAnswersScores.entries.skip(userAnswersScores.length - 5).map((e) => '${e.key}:${e.value}').join(', ')}');
    }

    // RESPONSE QUALITY VALIDATION
    appLogger.d('===== START QUALITY VALIDATION =====');
    final qualityValidation =
        validateResponseQuality(userAnswersScores, test, languageCode);
    appLogger.d('Response quality: ${qualityValidation.qualityLevel}');
    appLogger.d('Detected issues: ${qualityValidation.issues.length}');

    final result = TestResult(
      testId: test.id,
      totalScore: totalScore,
      maxScore: maxScore,
      interpretation: typeDescription,
      completedAt: DateTime.now(),
      version: 2,
      userAnswers: userAnswersScores, // Save answer scores for display in summary
      bipolarScores: bipolarScoresMap, // For backward compatibility with UI
      personalityType: personalityTypeCode,
      typeScales: typeScales, // NEW: 8 unipolar scale scores (0-100)
      qualityValidation: qualityValidation,
    );

    appLogger.d('Created 16 types test result with typeScales');
    appLogger.d('result.userAnswers contains ${result.userAnswers?.length ?? 0} answers');
    appLogger.d('result.typeScales contains ${result.typeScales?.length ?? 0} scales');

    return result;
  }

  /// Validates the quality of test responses
  /// Returns TestQualityValidation with metrics and issues
  TestQualityValidation validateResponseQuality(
    Map<String, int> userAnswers,
    TestModel test,
    String languageCode,
  ) {
    appLogger.d('Starting validation of ${userAnswers.length} answers');

    final List<String> issues = [];
    final answers = userAnswers.values.toList();

    // 1. Calculate variance (standard deviation)
    final mean = answers.reduce((a, b) => a + b) / answers.length;
    final variance = answers
            .map((a) => (a - mean) * (a - mean))
            .reduce((a, b) => a + b) /
        answers.length;
    final stdDev = math.sqrt(variance);

    appLogger.d('Answer mean: ${mean.toStringAsFixed(2)}');
    appLogger.d('Standard deviation: ${stdDev.toStringAsFixed(2)}');

    // Check 1: Low variability (all answers too similar)
    if (stdDev < 0.5) {
      final issue = languageCode == 'ru'
          ? 'Очень низкая вариативность ответов (${stdDev.toStringAsFixed(2)}). Возможно, вы отвечали не вдумываясь.'
          : 'Very low response variance (${stdDev.toStringAsFixed(2)}). You may not have been thoughtful.';
      issues.add(issue);
      appLogger.w('ISSUE: $issue');
    } else if (stdDev < 0.8) {
      final issue = languageCode == 'ru'
          ? 'Низкая вариативность ответов (${stdDev.toStringAsFixed(2)}). Рекомендуется больше разнообразия в ответах.'
          : 'Low response variance (${stdDev.toStringAsFixed(2)}). More variety recommended.';
      issues.add(issue);
      appLogger.w('WARNING: $issue');
    }

    // 2. Calculate neutral response rate
    final neutralCount = answers.where((a) => a == 3).length;
    final neutralRate = (neutralCount / answers.length) * 100;

    appLogger.d(
        'Neutral answers: $neutralCount of ${answers.length} (${neutralRate.toStringAsFixed(1)}%)');

    // Check 2: Too many neutral answers
    if (neutralRate > 50) {
      final issue = languageCode == 'ru'
          ? 'Слишком много нейтральных ответов (${neutralRate.toStringAsFixed(0)}%). Попробуйте быть более определённым.'
          : 'Too many neutral answers (${neutralRate.toStringAsFixed(0)}%). Try to be more decisive.';
      issues.add(issue);
      appLogger.w('ISSUE: $issue');
    } else if (neutralRate > 35) {
      final issue = languageCode == 'ru'
          ? 'Много нейтральных ответов (${neutralRate.toStringAsFixed(0)}%). Результаты могут быть неточными.'
          : 'Many neutral answers (${neutralRate.toStringAsFixed(0)}%). Results may be imprecise.';
      issues.add(issue);
      appLogger.w('WARNING: $issue');
    }

    // 3. Calculate extreme response rate
    final extremeCount = answers.where((a) => a == 1 || a == 5).length;
    final extremeRate = (extremeCount / answers.length) * 100;

    appLogger.d(
        'Extreme answers: $extremeCount of ${answers.length} (${extremeRate.toStringAsFixed(1)}%)');

    // Check 3: Too many extreme answers
    if (extremeRate > 60) {
      final issue = languageCode == 'ru'
          ? 'Слишком много крайних ответов (${extremeRate.toStringAsFixed(0)}%). Возможна социальная желательность.'
          : 'Too many extreme answers (${extremeRate.toStringAsFixed(0)}%). Social desirability possible.';
      issues.add(issue);
      appLogger.w('ISSUE: $issue');
    } else if (extremeRate > 40) {
      final issue = languageCode == 'ru'
          ? 'Много крайних ответов (${extremeRate.toStringAsFixed(0)}%). Попробуйте быть более сбалансированным.'
          : 'Many extreme answers (${extremeRate.toStringAsFixed(0)}%). Try to be more balanced.';
      issues.add(issue);
      appLogger.w('WARNING: $issue');
    }

    // 4. Consistency check - compare answers to opposite poles of same dimension
    // For 16 types test: each dimension has 10+10 questions
    double consistencyScore = 0.0;
    int consistencyPairs = 0;

    // Group questions by dimension
    final dimensionQuestions = <String, List<MapEntry<String, int>>>{};
    for (final question in test.questions) {
      if (question.bipolarDimension != null) {
        final dimensionId = question.bipolarDimension!;
        final answer = userAnswers[question.id];
        if (answer != null) {
          dimensionQuestions.putIfAbsent(dimensionId, () => []);
          dimensionQuestions[dimensionId]!.add(MapEntry(question.id, answer));
        }
      }
    }

    // Calculate consistency within each dimension
    for (final dimension in dimensionQuestions.entries) {
      final dimAnswers = dimension.value.map((e) => e.value).toList();
      if (dimAnswers.length >= 2) {
        // Check if answers within same dimension are reasonably consistent
        final dimMean = dimAnswers.reduce((a, b) => a + b) / dimAnswers.length;
        final dimVariance = dimAnswers
                .map((a) => (a - dimMean) * (a - dimMean))
                .reduce((a, b) => a + b) /
            dimAnswers.length;

        // Lower variance = higher consistency
        // Max variance would be if half answers are 1 and half are 5: variance = 4
        // We normalize: consistency = 1 - (variance / 4)
        final dimConsistency = 1 - (dimVariance / 4).clamp(0.0, 1.0);
        consistencyScore += dimConsistency;
        consistencyPairs++;
      }
    }

    if (consistencyPairs > 0) {
      consistencyScore /= consistencyPairs;
    }

    appLogger.d(
        'Consistency score: ${(consistencyScore * 100).toStringAsFixed(1)}%');

    // Check 4: Low consistency
    if (consistencyScore < 0.4) {
      final issue = languageCode == 'ru'
          ? 'Очень низкая согласованность ответов (${(consistencyScore * 100).toStringAsFixed(0)}%). Возможно, вы отвечали случайно.'
          : 'Very low answer consistency (${(consistencyScore * 100).toStringAsFixed(0)}%). You may have answered randomly.';
      issues.add(issue);
      appLogger.w('ISSUE: $issue');
    } else if (consistencyScore < 0.6) {
      final issue = languageCode == 'ru'
          ? 'Низкая согласованность ответов (${(consistencyScore * 100).toStringAsFixed(0)}%). Результаты могут быть ненадёжными.'
          : 'Low answer consistency (${(consistencyScore * 100).toStringAsFixed(0)}%). Results may be unreliable.';
      issues.add(issue);
      appLogger.w('WARNING: $issue');
    }

    // Determine overall quality level
    final String qualityLevel;
    if (issues.isEmpty) {
      qualityLevel = 'success';
      appLogger.d('OVERALL QUALITY: EXCELLENT');
    } else if (issues.any((i) =>
        i.contains('Очень') ||
        i.contains('Very') ||
        i.contains('Слишком') ||
        i.contains('Too'))) {
      qualityLevel = 'error';
      appLogger.w('OVERALL QUALITY: CRITICAL');
    } else {
      qualityLevel = 'warning';
      appLogger.w('OVERALL QUALITY: WARNING');
    }

    return TestQualityValidation(
      responseVariance: stdDev,
      neutralRate: neutralRate,
      consistencyScore: consistencyScore,
      extremeRate: extremeRate,
      qualityLevel: qualityLevel,
      issues: issues,
    );
  }
}

/// Helper class to accumulate weighted scores for hierarchical scales
/// Made public for testing purposes
class ScaleScoreAccumulator {
  final Map<String, double> _weightedScores = {};
  final Map<String, double> _maxWeightedScores = {};
  final Map<String, List<QuestionContribution>> _contributions = {};

  /// Add a weighted score contribution for a scale
  void addScore(
    String scaleId,
    double answerScore,
    double minAnswerScore, // Minimum possible score for this question
    double maxAnswerScore, // Maximum possible score for this question
    double weight,
    QuestionModel question,
    int selectedAnswerScore,
    int direction, // 1 = direct, -1 = inverted
  ) {
    // Step 1: Normalize answer to 0-1 range using (answer - min) / (max - min)
    // This maps: min → 0.0, middle → 0.5, max → 1.0
    // Works for any range: 0-4, 1-5, etc.
    final double normalizedAnswer = maxAnswerScore > minAnswerScore
        ? (answerScore - minAnswerScore) / (maxAnswerScore - minAnswerScore)
        : 0.0; // If all answers have same score, return 0

    // Step 2: Apply direction (invert if needed)
    // direction = 1: high answer → high scale (direct)
    // direction = -1: high answer → low scale (inverted)
    final double directedScore =
        direction == -1 ? (1.0 - normalizedAnswer) : normalizedAnswer;

    // Step 3: Apply weight and accumulate
    // We accumulate normalized scores (0-1), then convert to 0-100 later
    _weightedScores[scaleId] =
        (_weightedScores[scaleId] ?? 0.0) + (directedScore * weight);
    _maxWeightedScores[scaleId] =
        (_maxWeightedScores[scaleId] ?? 0.0) + weight; // Max is now just sum of weights

    // Store contribution details
    if (!_contributions.containsKey(scaleId)) {
      _contributions[scaleId] = [];
    }

    // Calculate this question's contribution to the final 0-100 scale score
    final totalMaxWeightedScore = _maxWeightedScores[scaleId]!;
    double questionContribution = 0.0;
    if (totalMaxWeightedScore > 0.0) {
      questionContribution =
          (directedScore * weight / totalMaxWeightedScore) * 100.0;
    }

    // Protect against NaN
    if (questionContribution.isNaN || questionContribution.isInfinite) {
      questionContribution = 0.0;
    }

    _contributions[scaleId]!.add(QuestionContribution(
      questionId: question.id,
      questionText: question.text,
      answerScore: selectedAnswerScore,
      maxAnswerScore: maxAnswerScore.toInt(),
      weight: weight,
      normalizedContribution: questionContribution,
    ));
  }

  /// Get normalized scores (0-100) for all scales
  Map<String, double> getNormalizedScores() {
    final Map<String, double> normalized = {};
    for (final scaleId in _weightedScores.keys) {
      final weightedScore = _weightedScores[scaleId] ?? 0.0;
      final maxWeightedScore =
          _maxWeightedScores[scaleId] ?? 1.0; // Avoid division by zero

      // Calculate normalized score
      double score = 0.0;
      if (maxWeightedScore > 0.0) {
        score = (weightedScore / maxWeightedScore) * 100.0;
      }

      // Protect against NaN and Infinity
      if (score.isNaN || score.isInfinite) {
        appLogger.w('Invalid score for scale $scaleId: $score (weighted=$weightedScore, max=$maxWeightedScore). Setting to 0.0');
        score = 0.0;
      }

      // Clamp to 0-100 range
      score = score.clamp(0.0, 100.0);

      normalized[scaleId] = score;
    }
    return normalized;
  }

  /// Get question contributions for all scales
  Map<String, List<QuestionContribution>> getContributions() {
    return _contributions;
  }
}
