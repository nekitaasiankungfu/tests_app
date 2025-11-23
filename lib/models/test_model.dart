import '../exceptions/validation_exceptions.dart';
import '../utils/app_logger.dart';

class TestModel {
  final String id;
  final Map<String, String> title; // Поддержка нескольких языков
  final Map<String, String> description;
  final Map<String, String> category;
  final String categoryId; // NEW: Category ID for grouping tests
  final List<QuestionModel> questions;
  final int estimatedTime; // в минутах
  final TestType type; // Тип теста (простой или многофакторный)
  final List<String>? factorIds; // ID факторов для многофакторных тестов
  final Map<String, String>? disclaimer; // Дисклеймер перед тестом

  // NEW: Bipolar test support (for personality type tests)
  final bool isBipolar; // true для биполярных тестов (типология личности)
  final List<String>? bipolarDimensions; // ['personality_type_ei', 'personality_type_sn', 'personality_type_tf', 'personality_type_jp']

  TestModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.categoryId,
    required this.questions,
    required this.estimatedTime,
    this.type = TestType.simple,
    this.factorIds,
    this.disclaimer,
    this.isBipolar = false,
    this.bipolarDimensions,
  });

  String getTitle(String languageCode) => title[languageCode] ?? title['ru'] ?? '';
  String getDescription(String languageCode) => description[languageCode] ?? description['ru'] ?? '';
  String getCategory(String languageCode) => category[languageCode] ?? category['ru'] ?? '';
  String? getDisclaimer(String languageCode) => disclaimer?[languageCode] ?? disclaimer?['ru'];

  /// Convert TestModel to JSON for export
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'version': '1.0.0',
      'type': type == TestType.multiFactor ? 'multi_factor' : 'simple',
      if (factorIds != null) 'factors': factorIds,
      if (isBipolar) 'is_bipolar': isBipolar,
      if (bipolarDimensions != null) 'bipolar_dimensions': bipolarDimensions,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}

enum TestType {
  simple, // Простой тест с одним общим результатом
  multiFactor, // Многофакторный тест (например, Big Five)
}

class QuestionModel {
  final String id;
  final Map<String, String> text; // Поддержка нескольких языков
  final List<AnswerModel> answers;
  final String? factorId; // ID фактора для многофакторных тестов
  final bool isReversed; // Обратный вопрос (для IPIP теста)

  // NEW: Per-question axis weights for granular scoring
  // Map format: {'axis_id': weight_value}
  // Example: {'sociability': 1.0, 'motivation': 0.4}
  // Weights typically range from 0.1 (minimal) to 1.0 (primary)
  // This field is optional and used for advanced psychometric analysis
  final Map<String, double>? axisWeights;

  // NEW: Bipolar test support
  // For personality type questions: which pole does this question measure?
  // Example: 'E' (Extraversion), 'I' (Introversion), 'S', 'N', 'T', 'F', 'J', 'P'
  final String? bipolarPole;
  // Which dimension does this belong to: 'personality_type_ei', 'personality_type_sn', 'personality_type_tf', 'personality_type_jp'
  final String? bipolarDimension;

  // NEW: Unipolar personality type scale (for 16 types test v2)
  // Specifies which of the 8 scales this question contributes to
  // Example: 'extraversion', 'introversion', 'sensing', 'intuition', 'thinking', 'feeling', 'judging', 'perceiving'
  final String? targetScale;

  QuestionModel({
    required this.id,
    required this.text,
    required this.answers,
    this.factorId,
    this.isReversed = false,
    this.axisWeights,
    this.bipolarPole,
    this.bipolarDimension,
    this.targetScale,
  });

  String getText(String languageCode) => text[languageCode] ?? text['ru'] ?? '';

  /// Returns true if this question has specific axis weights defined
  bool get hasAxisWeights => axisWeights != null && axisWeights!.isNotEmpty;

  /// Get weight for a specific axis, returns 0.0 if not defined
  double getAxisWeight(String axisId) => axisWeights?[axisId] ?? 0.0;

  /// Get all axes this question contributes to
  List<String> getContributingAxes() => axisWeights?.keys.toList() ?? [];

  /// Convert QuestionModel to JSON for export
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      if (factorId != null) 'factor': factorId,
      if (isReversed) 'is_reversed': isReversed,
      if (axisWeights != null && axisWeights!.isNotEmpty) 'axis_weights': axisWeights,
      if (bipolarPole != null) 'bipolar_pole': bipolarPole,
      if (bipolarDimension != null) 'bipolar_dimension': bipolarDimension,
      if (targetScale != null) 'target_scale': targetScale,
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }
}

class AnswerModel {
  final String id;
  final Map<String, String> text; // Поддержка нескольких языков
  final int score;

  AnswerModel({
    required this.id,
    required this.text,
    required this.score,
  });

  String getText(String languageCode) => text[languageCode] ?? text['ru'] ?? '';

  /// Convert AnswerModel to JSON for export
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'score': score,
    };
  }
}

class TestResult {
  final String testId;
  final int totalScore;
  final int maxScore;
  final String interpretation;
  final DateTime completedAt;
  final Map<String, FactorScore>? factorScores; // Для многофакторных тестов (legacy v1)

  // NEW: Version tracking for data migration
  // v1: Original factor-level scoring (before per-question weights)
  // v2: Per-question weighted scoring (current implementation)
  final int version;

  // NEW: Store user answers for recalculation during migration
  // Map format: {'question_id': selected_answer_score}
  final Map<String, int>? userAnswers;

  // NEW v2: Hierarchical scale scores
  // Map format: {'scale_id': normalized_score_0_to_100}
  // Used for per-question weighted scoring with 196 hierarchical scales
  // Example: {'anxiety': 65.5, 'extraversion': 72.3, 'empathy': 88.1}
  final Map<String, double>? scaleScores;

  // NEW v2: Detailed question contributions per scale
  // Map format: {'scale_id': [QuestionContribution, ...]}
  // Shows which specific questions contributed to each scale score
  final Map<String, List<QuestionContribution>>? questionContributions;

  // NEW: Bipolar test results (for personality type tests)
  // Map format: {'personality_type_ei': BipolarDimensionScore(...), ...}
  final Map<String, BipolarDimensionScore>? bipolarScores;
  // Personality type (e.g., 'ENFP', 'ISTJ')
  final String? personalityType;

  // NEW: Type scales for personality tests (8 unipolar scales)
  // Map format: {'extraversion': 75.0, 'introversion': 25.0, ...}
  // Used for 16 personality types test with separate positive scales
  final Map<String, double>? typeScales;

  // NEW: Quality validation for test responses
  final TestQualityValidation? qualityValidation;

  TestResult({
    required this.testId,
    required this.totalScore,
    required this.maxScore,
    required this.interpretation,
    required this.completedAt,
    this.factorScores,
    this.version = 2, // Default to v2 (per-question weights)
    this.userAnswers,
    this.scaleScores,
    this.questionContributions,
    this.bipolarScores,
    this.personalityType,
    this.typeScales,
    this.qualityValidation,
  });

  double get percentage => (totalScore / maxScore) * 100;

  /// Returns true if this result needs migration to v2 scoring
  bool get needsMigration => version < 2;

  Map<String, dynamic> toJson() {
    return {
      'testId': testId,
      'totalScore': totalScore,
      'maxScore': maxScore,
      'interpretation': interpretation,
      'completedAt': completedAt.toIso8601String(),
      'factorScores': factorScores?.map((key, value) => MapEntry(key, value.toJson())),
      'version': version,
      'userAnswers': userAnswers,
      'scaleScores': scaleScores,
      'questionContributions': questionContributions?.map(
        (key, value) => MapEntry(key, value.map((c) => c.toJson()).toList()),
      ),
      'bipolarScores': bipolarScores?.map((key, value) => MapEntry(key, value.toJson())),
      'personalityType': personalityType,
      'typeScales': typeScales,
      'qualityValidation': qualityValidation?.toJson(),
    };
  }

  /// Deserialize TestResult from JSON with comprehensive validation
  /// Throws [ValidationException] if data is invalid
  factory TestResult.fromJson(Map<String, dynamic> json) {
    try {
      // Validate required string fields
      final testId = _validateString(json, 'testId', required: true);
      final interpretation = _validateString(json, 'interpretation', required: true);

      // Validate required numeric fields with range checks
      final totalScore = _validateInt(json, 'totalScore', required: true, min: 0);
      final maxScore = _validateInt(json, 'maxScore', required: true, min: 1);

      // Validate score relationship
      if (totalScore > maxScore) {
        appLogger.w('TestResult.fromJson: totalScore ($totalScore) exceeds maxScore ($maxScore), clamping to maxScore');
        // Don't throw, just clamp the value for backward compatibility
      }

      // Validate and parse date/time
      final completedAt = _validateDateTime(json, 'completedAt', required: true);

      // Validate optional version field (default to v1 for old data)
      final version = _validateInt(json, 'version', required: false, min: 1, max: 10, defaultValue: 1);

      // Validate and parse complex nested structures
      Map<String, FactorScore>? factorScores;
      if (json['factorScores'] != null) {
        try {
          final factorScoresData = json['factorScores'];
          if (factorScoresData is! Map<String, dynamic>) {
            throw InvalidTypeException('factorScores', Map, actualType: factorScoresData.runtimeType);
          }
          factorScores = factorScoresData.map(
            (key, value) => MapEntry(key, FactorScore.fromJson(value)),
          );
        } catch (e, stackTrace) {
          appLogger.e('TestResult.fromJson: Failed to parse factorScores', error: e, stackTrace: stackTrace);
          factorScores = null; // Gracefully handle corrupted data
        }
      }

      // Validate userAnswers map
      Map<String, int>? userAnswers;
      if (json['userAnswers'] != null) {
        try {
          final userAnswersData = json['userAnswers'];
          if (userAnswersData is! Map) {
            throw InvalidTypeException('userAnswers', Map, actualType: userAnswersData.runtimeType);
          }
          userAnswers = {};
          for (final entry in userAnswersData.entries) {
            final key = entry.key.toString();
            final value = entry.value;
            if (value is! int) {
              appLogger.w('TestResult.fromJson: userAnswers[$key] is not int, skipping');
              continue;
            }
            userAnswers[key] = value;
          }
        } catch (e, stackTrace) {
          appLogger.e('TestResult.fromJson: Failed to parse userAnswers', error: e, stackTrace: stackTrace);
          userAnswers = null;
        }
      }

      // Validate scaleScores map
      Map<String, double>? scaleScores;
      if (json['scaleScores'] != null) {
        try {
          final scaleScoresData = json['scaleScores'];
          if (scaleScoresData is! Map) {
            throw InvalidTypeException('scaleScores', Map, actualType: scaleScoresData.runtimeType);
          }
          scaleScores = {};
          for (final entry in scaleScoresData.entries) {
            final key = entry.key.toString();
            final value = entry.value;
            final doubleValue = _toDouble(value);
            if (doubleValue == null) {
              appLogger.w('TestResult.fromJson: scaleScores[$key] is not numeric, skipping');
              continue;
            }
            // Validate score range (0-100)
            if (doubleValue < 0 || doubleValue > 100) {
              appLogger.w('TestResult.fromJson: scaleScores[$key] = $doubleValue out of range [0, 100], clamping');
              scaleScores[key] = doubleValue.clamp(0.0, 100.0);
            } else {
              scaleScores[key] = doubleValue;
            }
          }
        } catch (e, stackTrace) {
          appLogger.e('TestResult.fromJson: Failed to parse scaleScores', error: e, stackTrace: stackTrace);
          scaleScores = null;
        }
      }

      // Validate questionContributions map
      Map<String, List<QuestionContribution>>? questionContributions;
      if (json['questionContributions'] != null) {
        try {
          final contributionsData = json['questionContributions'];
          if (contributionsData is! Map<String, dynamic>) {
            throw InvalidTypeException('questionContributions', Map, actualType: contributionsData.runtimeType);
          }
          questionContributions = {};
          for (final entry in contributionsData.entries) {
            try {
              if (entry.value is! List) {
                appLogger.w('TestResult.fromJson: questionContributions[${entry.key}] is not a List, skipping');
                continue;
              }
              questionContributions[entry.key] = (entry.value as List)
                  .map((c) => QuestionContribution.fromJson(c))
                  .toList();
            } catch (e) {
              appLogger.w('TestResult.fromJson: Failed to parse questionContributions[${entry.key}], skipping: $e');
            }
          }
        } catch (e, stackTrace) {
          appLogger.e('TestResult.fromJson: Failed to parse questionContributions', error: e, stackTrace: stackTrace);
          questionContributions = null;
        }
      }

      // Validate bipolarScores map
      Map<String, BipolarDimensionScore>? bipolarScores;
      if (json['bipolarScores'] != null) {
        try {
          final bipolarData = json['bipolarScores'];
          if (bipolarData is! Map<String, dynamic>) {
            throw InvalidTypeException('bipolarScores', Map, actualType: bipolarData.runtimeType);
          }
          bipolarScores = {};
          for (final entry in bipolarData.entries) {
            try {
              bipolarScores[entry.key] = BipolarDimensionScore.fromJson(entry.value);
            } catch (e) {
              appLogger.w('TestResult.fromJson: Failed to parse bipolarScores[${entry.key}], skipping: $e');
            }
          }
        } catch (e, stackTrace) {
          appLogger.e('TestResult.fromJson: Failed to parse bipolarScores', error: e, stackTrace: stackTrace);
          bipolarScores = null;
        }
      }

      // Validate typeScales map (8 unipolar personality scales)
      Map<String, double>? typeScales;
      if (json['typeScales'] != null) {
        try {
          final typeScalesData = json['typeScales'];
          if (typeScalesData is! Map) {
            throw InvalidTypeException('typeScales', Map, actualType: typeScalesData.runtimeType);
          }
          typeScales = {};
          for (final entry in typeScalesData.entries) {
            final key = entry.key.toString();
            final value = entry.value;
            final doubleValue = _toDouble(value);
            if (doubleValue == null) {
              appLogger.w('TestResult.fromJson: typeScales[$key] is not numeric, skipping');
              continue;
            }
            // Validate score range (0-100)
            if (doubleValue < 0 || doubleValue > 100) {
              appLogger.w('TestResult.fromJson: typeScales[$key] = $doubleValue out of range [0, 100], clamping');
              typeScales[key] = doubleValue.clamp(0.0, 100.0);
            } else {
              typeScales[key] = doubleValue;
            }
          }
        } catch (e, stackTrace) {
          appLogger.e('TestResult.fromJson: Failed to parse typeScales', error: e, stackTrace: stackTrace);
          typeScales = null;
        }
      }

      // Validate personalityType (optional string with format check)
      String? personalityType;
      if (json['personalityType'] != null) {
        personalityType = json['personalityType'].toString();
        // Basic validation: Personality types are 4 uppercase letters
        if (personalityType.isNotEmpty && personalityType.length != 4) {
          appLogger.w('TestResult.fromJson: personalityType "$personalityType" has unusual format');
        }
      }

      // Validate qualityValidation object
      TestQualityValidation? qualityValidation;
      if (json['qualityValidation'] != null) {
        try {
          qualityValidation = TestQualityValidation.fromJson(json['qualityValidation']);
        } catch (e, stackTrace) {
          appLogger.e('TestResult.fromJson: Failed to parse qualityValidation', error: e, stackTrace: stackTrace);
          qualityValidation = null;
        }
      }

      return TestResult(
        testId: testId,
        totalScore: totalScore,
        maxScore: maxScore,
        interpretation: interpretation,
        completedAt: completedAt,
        factorScores: factorScores,
        version: version,
        userAnswers: userAnswers,
        scaleScores: scaleScores,
        questionContributions: questionContributions,
        bipolarScores: bipolarScores,
        personalityType: personalityType,
        typeScales: typeScales,
        qualityValidation: qualityValidation,
      );
    } catch (e, stackTrace) {
      appLogger.e('TestResult.fromJson: Critical validation failure', error: e, stackTrace: stackTrace);
      // Re-throw validation exceptions
      if (e is ValidationException) {
        rethrow;
      }
      // Wrap other exceptions
      throw MalformedJsonException('Failed to parse TestResult: ${e.toString()}', value: json);
    }
  }

  // Validation helper methods

  /// Validate and extract a required or optional string field
  static String _validateString(
    Map<String, dynamic> json,
    String field, {
    required bool required,
    String? defaultValue,
  }) {
    final value = json[field];

    if (value == null) {
      if (required) {
        throw MissingFieldException(field);
      }
      return defaultValue ?? '';
    }

    if (value is! String) {
      throw InvalidTypeException(field, String, actualType: value.runtimeType, value: value);
    }

    return value;
  }

  /// Validate and extract an integer field with optional range checking
  static int _validateInt(
    Map<String, dynamic> json,
    String field, {
    required bool required,
    int? min,
    int? max,
    int? defaultValue,
  }) {
    final value = json[field];

    if (value == null) {
      if (required) {
        throw MissingFieldException(field);
      }
      return defaultValue ?? 0;
    }

    int intValue;
    if (value is int) {
      intValue = value;
    } else if (value is double) {
      intValue = value.toInt();
      appLogger.w('TestResult.fromJson: Field "$field" is double, converting to int');
    } else if (value is String) {
      intValue = int.tryParse(value) ?? (throw InvalidTypeException(field, int, value: value));
    } else {
      throw InvalidTypeException(field, int, actualType: value.runtimeType, value: value);
    }

    // Range validation
    if (min != null && intValue < min) {
      throw RangeValidationException(field, intValue, min, max ?? double.infinity);
    }
    if (max != null && intValue > max) {
      throw RangeValidationException(field, intValue, min ?? double.negativeInfinity, max);
    }

    return intValue;
  }

  /// Validate and parse a DateTime field
  static DateTime _validateDateTime(
    Map<String, dynamic> json,
    String field, {
    required bool required,
    DateTime? defaultValue,
  }) {
    final value = json[field];

    if (value == null) {
      if (required) {
        throw MissingFieldException(field);
      }
      return defaultValue ?? DateTime.now();
    }

    if (value is! String) {
      throw InvalidTypeException(field, String, actualType: value.runtimeType, value: value);
    }

    try {
      return DateTime.parse(value);
    } catch (e) {
      throw DateTimeParseException(field, value);
    }
  }

  /// Convert value to double safely
  static double? _toDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}

// Модель для хранения баллов по фактору
class FactorScore {
  final String factorId;
  final Map<String, String> factorName;
  final int score;
  final int maxScore;
  final Map<String, String> interpretation;

  FactorScore({
    required this.factorId,
    required this.factorName,
    required this.score,
    required this.maxScore,
    required this.interpretation,
  });

  double get percentage => (score / maxScore) * 100;

  String getFactorName(String languageCode) => factorName[languageCode] ?? factorName['ru'] ?? '';
  String getInterpretation(String languageCode) => interpretation[languageCode] ?? interpretation['ru'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'factorId': factorId,
      'factorName': factorName,
      'score': score,
      'maxScore': maxScore,
      'interpretation': interpretation,
    };
  }

  /// Deserialize FactorScore from JSON with validation
  factory FactorScore.fromJson(Map<String, dynamic> json) {
    try {
      // Validate required string field
      final factorId = TestResult._validateString(json, 'factorId', required: true);

      // Validate required numeric fields
      final score = TestResult._validateInt(json, 'score', required: true, min: 0);
      // Allow maxScore = 0 from old data, but fix it to 1 to prevent division by zero
      var maxScore = TestResult._validateInt(json, 'maxScore', required: true, min: 0);
      if (maxScore <= 0) {
        appLogger.w('FactorScore.fromJson: maxScore was $maxScore, fixing to 1');
        maxScore = 1;
      }

      // Validate score relationship
      if (score > maxScore) {
        appLogger.w('FactorScore.fromJson: score ($score) exceeds maxScore ($maxScore)');
      }

      // Validate factorName map
      Map<String, String> factorName;
      try {
        if (json['factorName'] == null) {
          throw MissingFieldException('factorName');
        }
        if (json['factorName'] is! Map) {
          throw InvalidTypeException('factorName', Map, actualType: json['factorName'].runtimeType);
        }
        factorName = Map<String, String>.from(json['factorName']);
        if (factorName.isEmpty) {
          throw EmptyCollectionException('factorName');
        }
      } catch (e) {
        appLogger.e('FactorScore.fromJson: Invalid factorName', error: e);
        rethrow;
      }

      // Validate interpretation map
      Map<String, String> interpretation;
      try {
        if (json['interpretation'] == null) {
          throw MissingFieldException('interpretation');
        }
        if (json['interpretation'] is! Map) {
          throw InvalidTypeException('interpretation', Map, actualType: json['interpretation'].runtimeType);
        }
        interpretation = Map<String, String>.from(json['interpretation']);
        if (interpretation.isEmpty) {
          throw EmptyCollectionException('interpretation');
        }
      } catch (e) {
        appLogger.e('FactorScore.fromJson: Invalid interpretation', error: e);
        rethrow;
      }

      return FactorScore(
        factorId: factorId,
        factorName: factorName,
        score: score,
        maxScore: maxScore,
        interpretation: interpretation,
      );
    } catch (e, stackTrace) {
      appLogger.e('FactorScore.fromJson: Validation failure', error: e, stackTrace: stackTrace);
      if (e is ValidationException) {
        rethrow;
      }
      throw MalformedJsonException('Failed to parse FactorScore: ${e.toString()}', value: json);
    }
  }
}

/// Represents contribution of a specific question to a scale score
/// Used for transparency - shows which questions influenced which scales
class QuestionContribution {
  final String questionId;
  final Map<String, String> questionText; // Multilingual
  final int answerScore; // User's answer score
  final int maxAnswerScore; // Maximum possible score for this question
  final double weight; // Weight applied to this question for this scale
  final double normalizedContribution; // Contribution to final 0-100 scale score

  QuestionContribution({
    required this.questionId,
    required this.questionText,
    required this.answerScore,
    required this.maxAnswerScore,
    required this.weight,
    required this.normalizedContribution,
  });

  String getQuestionText(String languageCode) =>
      questionText[languageCode] ?? questionText['ru'] ?? questionId;

  /// Get percentage of max possible score for this question
  double get answerPercentage => (answerScore / maxAnswerScore) * 100;

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'questionText': questionText,
      'answerScore': answerScore,
      'maxAnswerScore': maxAnswerScore,
      'weight': weight,
      'normalizedContribution': normalizedContribution,
    };
  }

  /// Deserialize QuestionContribution from JSON with validation
  factory QuestionContribution.fromJson(Map<String, dynamic> json) {
    try {
      // Validate required fields
      final questionId = TestResult._validateString(json, 'questionId', required: true);
      final answerScore = TestResult._validateInt(json, 'answerScore', required: true, min: 0);
      final maxAnswerScore = TestResult._validateInt(json, 'maxAnswerScore', required: true, min: 1);

      // Validate score relationship
      if (answerScore > maxAnswerScore) {
        appLogger.w('QuestionContribution.fromJson: answerScore ($answerScore) exceeds maxAnswerScore ($maxAnswerScore)');
      }

      // Validate weight (typically 0.0-1.0, but can be higher)
      final weightValue = json['weight'];
      double weight;
      if (weightValue == null) {
        throw MissingFieldException('weight');
      }
      final parsedWeight = TestResult._toDouble(weightValue);
      if (parsedWeight == null) {
        throw InvalidTypeException('weight', double, actualType: weightValue.runtimeType, value: weightValue);
      }
      // Negative weights are ALLOWED for non-personality-type scales (e.g., vitality: -0.9 means reverse correlation)
      // Only personality type bipolar scales (extraversion, introversion, etc.) must use positive weights
      weight = parsedWeight;

      // Validate normalizedContribution (typically 0-100)
      final contributionValue = json['normalizedContribution'];
      double normalizedContribution;
      if (contributionValue == null) {
        throw MissingFieldException('normalizedContribution');
      }
      final parsedContribution = TestResult._toDouble(contributionValue);
      if (parsedContribution == null) {
        throw InvalidTypeException('normalizedContribution', double, actualType: contributionValue.runtimeType, value: contributionValue);
      }
      normalizedContribution = parsedContribution;

      // Validate questionText map
      Map<String, String> questionText;
      try {
        if (json['questionText'] == null) {
          throw MissingFieldException('questionText');
        }
        if (json['questionText'] is! Map) {
          throw InvalidTypeException('questionText', Map, actualType: json['questionText'].runtimeType);
        }
        questionText = Map<String, String>.from(json['questionText']);
        if (questionText.isEmpty) {
          appLogger.w('QuestionContribution.fromJson: questionText is empty');
        }
      } catch (e) {
        appLogger.e('QuestionContribution.fromJson: Invalid questionText', error: e);
        rethrow;
      }

      return QuestionContribution(
        questionId: questionId,
        questionText: questionText,
        answerScore: answerScore,
        maxAnswerScore: maxAnswerScore,
        weight: weight,
        normalizedContribution: normalizedContribution,
      );
    } catch (e, stackTrace) {
      appLogger.e('QuestionContribution.fromJson: Validation failure', error: e, stackTrace: stackTrace);
      if (e is ValidationException) {
        rethrow;
      }
      throw MalformedJsonException('Failed to parse QuestionContribution: ${e.toString()}', value: json);
    }
  }
}

/// Bipolar dimension score for personality type tests
/// Represents the score on one bipolar dimension (e.g., E/I, S/N, T/F, J/P)
class BipolarDimensionScore {
  final String dimensionId;          // 'personality_type_ei', 'personality_type_sn', etc.
  final int positiveScore;          // Raw score for positive pole (E, S, T, J)
  final int negativeScore;          // Raw score for negative pole (I, N, F, P)
  final int positiveMaxScore;       // Max possible score for positive pole
  final int negativeMaxScore;       // Max possible score for negative pole
  final String dominantPole;        // 'E', 'I', 'S', 'N', 'T', 'F', 'J', 'P'
  final double normalizedScore;     // Normalized to 0-100 scale
  final double? confidenceInterval; // ±% confidence interval (e.g., 5.0 for ±5%)

  BipolarDimensionScore({
    required this.dimensionId,
    required this.positiveScore,
    required this.negativeScore,
    required this.positiveMaxScore,
    required this.negativeMaxScore,
    required this.dominantPole,
    required this.normalizedScore,
    this.confidenceInterval,
  });

  /// Get percentage for the positive pole (E, S, T, J)
  double get positivePercentage => (positiveScore / positiveMaxScore) * 100;

  /// Get percentage for the negative pole (I, N, F, P)
  double get negativePercentage => (negativeScore / negativeMaxScore) * 100;

  /// Get percentage strength of the dominant pole
  int get dominantPercentage {
    if (normalizedScore >= 50) {
      return normalizedScore.round();
    } else {
      return (100 - normalizedScore).round();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'dimensionId': dimensionId,
      'positiveScore': positiveScore,
      'negativeScore': negativeScore,
      'positiveMaxScore': positiveMaxScore,
      'negativeMaxScore': negativeMaxScore,
      'dominantPole': dominantPole,
      'normalizedScore': normalizedScore,
      'confidenceInterval': confidenceInterval,
    };
  }

  /// Deserialize BipolarDimensionScore from JSON with validation
  factory BipolarDimensionScore.fromJson(Map<String, dynamic> json) {
    try {
      // Validate required fields
      final dimensionId = TestResult._validateString(json, 'dimensionId', required: true);
      final dominantPole = TestResult._validateString(json, 'dominantPole', required: true);

      // Validate dominantPole format (should be single uppercase letter)
      if (dominantPole.length != 1 || !RegExp(r'^[A-Z]$').hasMatch(dominantPole)) {
        appLogger.w('BipolarDimensionScore.fromJson: dominantPole "$dominantPole" has unusual format (expected single uppercase letter)');
      }

      // Validate required numeric fields
      final positiveScore = TestResult._validateInt(json, 'positiveScore', required: true, min: 0);
      final negativeScore = TestResult._validateInt(json, 'negativeScore', required: true, min: 0);
      final positiveMaxScore = TestResult._validateInt(json, 'positiveMaxScore', required: true, min: 1);
      final negativeMaxScore = TestResult._validateInt(json, 'negativeMaxScore', required: true, min: 1);

      // Validate score relationships
      if (positiveScore > positiveMaxScore) {
        appLogger.w('BipolarDimensionScore.fromJson: positiveScore ($positiveScore) exceeds positiveMaxScore ($positiveMaxScore)');
      }
      if (negativeScore > negativeMaxScore) {
        appLogger.w('BipolarDimensionScore.fromJson: negativeScore ($negativeScore) exceeds negativeMaxScore ($negativeMaxScore)');
      }

      // Validate normalizedScore (0-100)
      final normalizedValue = json['normalizedScore'];
      double normalizedScore;
      if (normalizedValue == null) {
        throw MissingFieldException('normalizedScore');
      }
      final parsedNormalized = TestResult._toDouble(normalizedValue);
      if (parsedNormalized == null) {
        throw InvalidTypeException('normalizedScore', double, actualType: normalizedValue.runtimeType, value: normalizedValue);
      }
      if (parsedNormalized < 0 || parsedNormalized > 100) {
        appLogger.w('BipolarDimensionScore.fromJson: normalizedScore ($parsedNormalized) out of range [0, 100], clamping');
        normalizedScore = parsedNormalized.clamp(0.0, 100.0);
      } else {
        normalizedScore = parsedNormalized;
      }

      // Validate optional confidenceInterval
      double? confidenceInterval;
      if (json['confidenceInterval'] != null) {
        final intervalValue = json['confidenceInterval'];
        confidenceInterval = TestResult._toDouble(intervalValue);
        if (confidenceInterval == null) {
          appLogger.w('BipolarDimensionScore.fromJson: confidenceInterval is not numeric, ignoring');
        } else if (confidenceInterval < 0 || confidenceInterval > 100) {
          appLogger.w('BipolarDimensionScore.fromJson: confidenceInterval ($confidenceInterval) out of range [0, 100]');
        }
      }

      return BipolarDimensionScore(
        dimensionId: dimensionId,
        positiveScore: positiveScore,
        negativeScore: negativeScore,
        positiveMaxScore: positiveMaxScore,
        negativeMaxScore: negativeMaxScore,
        dominantPole: dominantPole,
        normalizedScore: normalizedScore,
        confidenceInterval: confidenceInterval,
      );
    } catch (e, stackTrace) {
      appLogger.e('BipolarDimensionScore.fromJson: Validation failure', error: e, stackTrace: stackTrace);
      if (e is ValidationException) {
        rethrow;
      }
      throw MalformedJsonException('Failed to parse BipolarDimensionScore: ${e.toString()}', value: json);
    }
  }
}

/// Quality validation results for test responses
/// Used to assess reliability and validity of test results
class TestQualityValidation {
  // Variance check: standard deviation of responses
  final double responseVariance;

  // Neutral response rate: percentage of neutral answers (score 3)
  final double neutralRate;

  // Consistency check: correlation between similar questions
  // 0.0 = completely inconsistent, 1.0 = perfectly consistent
  final double consistencyScore;

  // Extreme response rate: percentage of extreme answers (score 1 or 5)
  final double extremeRate;

  // Overall quality level: 'success', 'warning', 'error'
  final String qualityLevel;

  // Human-readable issues found
  final List<String> issues;

  TestQualityValidation({
    required this.responseVariance,
    required this.neutralRate,
    required this.consistencyScore,
    required this.extremeRate,
    required this.qualityLevel,
    required this.issues,
  });

  Map<String, dynamic> toJson() {
    return {
      'responseVariance': responseVariance,
      'neutralRate': neutralRate,
      'consistencyScore': consistencyScore,
      'extremeRate': extremeRate,
      'qualityLevel': qualityLevel,
      'issues': issues,
    };
  }

  /// Deserialize TestQualityValidation from JSON with validation
  factory TestQualityValidation.fromJson(Map<String, dynamic> json) {
    try {
      // Validate and parse double fields (0.0-1.0 or 0.0-100.0 depending on field)
      final responseVarianceValue = json['responseVariance'];
      if (responseVarianceValue == null) {
        throw MissingFieldException('responseVariance');
      }
      final responseVariance = TestResult._toDouble(responseVarianceValue);
      if (responseVariance == null) {
        throw InvalidTypeException('responseVariance', double, actualType: responseVarianceValue.runtimeType, value: responseVarianceValue);
      }
      if (responseVariance < 0) {
        appLogger.w('TestQualityValidation.fromJson: responseVariance ($responseVariance) is negative');
      }

      // Validate rates (should be 0.0-1.0 or 0.0-100.0)
      final neutralRateValue = json['neutralRate'];
      if (neutralRateValue == null) {
        throw MissingFieldException('neutralRate');
      }
      final neutralRate = TestResult._toDouble(neutralRateValue);
      if (neutralRate == null) {
        throw InvalidTypeException('neutralRate', double, actualType: neutralRateValue.runtimeType, value: neutralRateValue);
      }
      if (neutralRate < 0 || neutralRate > 100) {
        appLogger.w('TestQualityValidation.fromJson: neutralRate ($neutralRate) out of expected range [0, 100]');
      }

      // Validate consistency score (0.0-1.0)
      final consistencyValue = json['consistencyScore'];
      if (consistencyValue == null) {
        throw MissingFieldException('consistencyScore');
      }
      final consistencyScore = TestResult._toDouble(consistencyValue);
      if (consistencyScore == null) {
        throw InvalidTypeException('consistencyScore', double, actualType: consistencyValue.runtimeType, value: consistencyValue);
      }
      if (consistencyScore < 0 || consistencyScore > 1) {
        appLogger.w('TestQualityValidation.fromJson: consistencyScore ($consistencyScore) out of expected range [0, 1]');
      }

      // Validate extreme rate (0.0-1.0 or 0.0-100.0)
      final extremeRateValue = json['extremeRate'];
      if (extremeRateValue == null) {
        throw MissingFieldException('extremeRate');
      }
      final extremeRate = TestResult._toDouble(extremeRateValue);
      if (extremeRate == null) {
        throw InvalidTypeException('extremeRate', double, actualType: extremeRateValue.runtimeType, value: extremeRateValue);
      }
      if (extremeRate < 0 || extremeRate > 100) {
        appLogger.w('TestQualityValidation.fromJson: extremeRate ($extremeRate) out of expected range [0, 100]');
      }

      // Validate qualityLevel (should be 'success', 'warning', or 'error')
      final qualityLevel = TestResult._validateString(json, 'qualityLevel', required: true);
      final validLevels = ['success', 'warning', 'error'];
      if (!validLevels.contains(qualityLevel)) {
        appLogger.w('TestQualityValidation.fromJson: qualityLevel "$qualityLevel" is not one of $validLevels');
      }

      // Validate issues list
      List<String> issues;
      try {
        if (json['issues'] == null) {
          throw MissingFieldException('issues');
        }
        if (json['issues'] is! List) {
          throw InvalidTypeException('issues', List, actualType: json['issues'].runtimeType);
        }
        issues = List<String>.from(json['issues']);
      } catch (e) {
        appLogger.e('TestQualityValidation.fromJson: Invalid issues list', error: e);
        rethrow;
      }

      return TestQualityValidation(
        responseVariance: responseVariance,
        neutralRate: neutralRate,
        consistencyScore: consistencyScore,
        extremeRate: extremeRate,
        qualityLevel: qualityLevel,
        issues: issues,
      );
    } catch (e, stackTrace) {
      appLogger.e('TestQualityValidation.fromJson: Validation failure', error: e, stackTrace: stackTrace);
      if (e is ValidationException) {
        rethrow;
      }
      throw MalformedJsonException('Failed to parse TestQualityValidation: ${e.toString()}', value: json);
    }
  }
}
