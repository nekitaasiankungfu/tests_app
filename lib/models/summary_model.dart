import '../config/summary_config.dart';
import 'test_model.dart';
import '../data/test_data.dart';
import '../data/test_registry.dart';
import '../exceptions/validation_exceptions.dart';
import '../utils/app_logger.dart';

/// Баллы по одной шкале саммари
class SummaryScore {
  final String axisId;
  final double score;           // Нормализованный балл (0-100)
  final double rawScore;        // Сырой балл до нормализации
  final double confidence;      // Уверенность в балле (0-1)
  final List<TestContribution> contributions; // Вклады от разных тестов

  SummaryScore({
    required this.axisId,
    required this.score,
    required this.rawScore,
    required this.confidence,
    required this.contributions,
  });

  Map<String, dynamic> toJson() {
    return {
      'axisId': axisId,
      'score': score,
      'rawScore': rawScore,
      'confidence': confidence,
      'contributions': contributions.map((c) => c.toJson()).toList(),
    };
  }

  /// Deserialize SummaryScore from JSON with validation
  factory SummaryScore.fromJson(Map<String, dynamic> json) {
    try {
      // Validate required fields
      final axisId = _validateString(json, 'axisId', required: true);

      // Validate score fields (0-100 range)
      final score = _validateDouble(json, 'score', required: true, min: 0.0, max: 100.0);
      final rawScore = _validateDouble(json, 'rawScore', required: true);
      final confidence = _validateDouble(json, 'confidence', required: true, min: 0.0, max: 1.0);

      // Validate contributions list
      List<TestContribution> contributions;
      try {
        if (json['contributions'] == null) {
          throw MissingFieldException('contributions');
        }
        if (json['contributions'] is! List) {
          throw InvalidTypeException('contributions', List, actualType: json['contributions'].runtimeType);
        }
        contributions = (json['contributions'] as List)
            .map((c) => TestContribution.fromJson(c))
            .toList();
      } catch (e) {
        appLogger.e('SummaryScore.fromJson: Invalid contributions list', error: e);
        rethrow;
      }

      return SummaryScore(
        axisId: axisId,
        score: score,
        rawScore: rawScore,
        confidence: confidence,
        contributions: contributions,
      );
    } catch (e, stackTrace) {
      appLogger.e('SummaryScore.fromJson: Validation failure', error: e, stackTrace: stackTrace);
      if (e is ValidationException) {
        rethrow;
      }
      throw MalformedJsonException('Failed to parse SummaryScore: ${e.toString()}', value: json);
    }
  }

  // Helper validation methods
  static String _validateString(Map<String, dynamic> json, String field, {required bool required}) {
    final value = json[field];
    if (value == null) {
      if (required) throw MissingFieldException(field);
      return '';
    }
    if (value is! String) {
      throw InvalidTypeException(field, String, actualType: value.runtimeType, value: value);
    }
    return value;
  }

  static double _validateDouble(
    Map<String, dynamic> json,
    String field, {
    required bool required,
    double? min,
    double? max,
  }) {
    final value = json[field];
    if (value == null) {
      if (required) throw MissingFieldException(field);
      return 0.0;
    }

    double doubleValue;
    if (value is double) {
      doubleValue = value;
    } else if (value is int) {
      doubleValue = value.toDouble();
    } else if (value is String) {
      doubleValue = double.tryParse(value) ?? (throw InvalidTypeException(field, double, value: value));
    } else {
      throw InvalidTypeException(field, double, actualType: value.runtimeType, value: value);
    }

    if (min != null && doubleValue < min) {
      appLogger.w('SummaryScore: Field "$field" value $doubleValue below min $min, clamping');
      doubleValue = min;
    }
    if (max != null && doubleValue > max) {
      appLogger.w('SummaryScore: Field "$field" value $doubleValue above max $max, clamping');
      doubleValue = max;
    }

    return doubleValue;
  }
}

/// Вклад конкретного теста в шкалу
class TestContribution {
  final String testId;
  final String testName;
  final String scale;
  final double score;           // Балл теста по шкале
  final double weight;          // Вес вклада
  final int direction;          // Направление (1 или -1)
  final double contribution;    // Итоговый вклад в шкалу

  TestContribution({
    required this.testId,
    required this.testName,
    required this.scale,
    required this.score,
    required this.weight,
    required this.direction,
    required this.contribution,
  });

  Map<String, dynamic> toJson() {
    return {
      'testId': testId,
      'testName': testName,
      'scale': scale,
      'score': score,
      'weight': weight,
      'direction': direction,
      'contribution': contribution,
    };
  }

  /// Deserialize TestContribution from JSON with validation
  factory TestContribution.fromJson(Map<String, dynamic> json) {
    try {
      final testId = SummaryScore._validateString(json, 'testId', required: true);
      final testName = SummaryScore._validateString(json, 'testName', required: true);
      final scale = SummaryScore._validateString(json, 'scale', required: true);
      final score = SummaryScore._validateDouble(json, 'score', required: true, min: 0.0, max: 100.0);
      final weight = SummaryScore._validateDouble(json, 'weight', required: true, min: 0.0);
      final contribution = SummaryScore._validateDouble(json, 'contribution', required: true);

      // Validate direction (should be 1 or -1)
      final directionValue = json['direction'];
      if (directionValue == null) {
        throw MissingFieldException('direction');
      }
      int direction;
      if (directionValue is int) {
        direction = directionValue;
      } else if (directionValue is double) {
        direction = directionValue.toInt();
      } else {
        throw InvalidTypeException('direction', int, actualType: directionValue.runtimeType, value: directionValue);
      }
      if (direction != 1 && direction != -1) {
        appLogger.w('TestContribution.fromJson: direction ($direction) is not 1 or -1, using 1 as default');
        direction = 1;
      }

      return TestContribution(
        testId: testId,
        testName: testName,
        scale: scale,
        score: score,
        weight: weight,
        direction: direction,
        contribution: contribution,
      );
    } catch (e, stackTrace) {
      appLogger.e('TestContribution.fromJson: Validation failure', error: e, stackTrace: stackTrace);
      if (e is ValidationException) {
        rethrow;
      }
      throw MalformedJsonException('Failed to parse TestContribution: ${e.toString()}', value: json);
    }
  }
}

/// Полные данные саммари
class SummaryData {
  final Map<String, SummaryScore> axisScores;  // Баллы по всем шкалам
  final ConfidenceLevel confidence;            // Общий уровень уверенности
  final String summaryText;                    // Текстовое саммари
  final List<String> advice;                   // Советы
  final List<String> strengths;                // Сильные стороны
  final List<String> developmentAreas;         // Зоны развития
  final List<TestInfluence> testInfluences;    // Влияние тестов
  final DateTime generatedAt;                  // Время генерации

  SummaryData({
    required this.axisScores,
    required this.confidence,
    required this.summaryText,
    required this.advice,
    required this.strengths,
    required this.developmentAreas,
    required this.testInfluences,
    required this.generatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'axisScores': axisScores.map((key, value) => MapEntry(key, value.toJson())),
      'confidence': confidence.index,
      'summaryText': summaryText,
      'advice': advice,
      'strengths': strengths,
      'developmentAreas': developmentAreas,
      'testInfluences': testInfluences.map((t) => t.toJson()).toList(),
      'generatedAt': generatedAt.toIso8601String(),
    };
  }

  /// Deserialize SummaryData from JSON with validation
  factory SummaryData.fromJson(Map<String, dynamic> json) {
    try {
      // Validate axisScores map
      Map<String, SummaryScore> axisScores;
      try {
        if (json['axisScores'] == null) {
          throw MissingFieldException('axisScores');
        }
        if (json['axisScores'] is! Map<String, dynamic>) {
          throw InvalidTypeException('axisScores', Map, actualType: json['axisScores'].runtimeType);
        }
        axisScores = (json['axisScores'] as Map<String, dynamic>)
            .map((key, value) => MapEntry(key, SummaryScore.fromJson(value)));
      } catch (e) {
        appLogger.e('SummaryData.fromJson: Invalid axisScores', error: e);
        rethrow;
      }

      // Validate confidence enum
      ConfidenceLevel confidence;
      try {
        if (json['confidence'] == null) {
          throw MissingFieldException('confidence');
        }
        final confidenceIndex = json['confidence'];
        if (confidenceIndex is! int) {
          throw InvalidTypeException('confidence', int, actualType: confidenceIndex.runtimeType, value: confidenceIndex);
        }
        if (confidenceIndex < 0 || confidenceIndex >= ConfidenceLevel.values.length) {
          throw InvalidEnumException('confidence', confidenceIndex, ConfidenceLevel.values.map((e) => e.index).toList());
        }
        confidence = ConfidenceLevel.values[confidenceIndex];
      } catch (e) {
        appLogger.e('SummaryData.fromJson: Invalid confidence level, defaulting to low', error: e);
        confidence = ConfidenceLevel.low; // Safe fallback
      }

      // Validate string fields
      final summaryText = SummaryScore._validateString(json, 'summaryText', required: true);

      // Validate string lists
      final advice = _validateStringList(json, 'advice');
      final strengths = _validateStringList(json, 'strengths');
      final developmentAreas = _validateStringList(json, 'developmentAreas');

      // Validate testInfluences list
      List<TestInfluence> testInfluences;
      try {
        if (json['testInfluences'] == null) {
          throw MissingFieldException('testInfluences');
        }
        if (json['testInfluences'] is! List) {
          throw InvalidTypeException('testInfluences', List, actualType: json['testInfluences'].runtimeType);
        }
        testInfluences = (json['testInfluences'] as List)
            .map((t) => TestInfluence.fromJson(t))
            .toList();
      } catch (e) {
        appLogger.e('SummaryData.fromJson: Invalid testInfluences', error: e);
        rethrow;
      }

      // Validate generatedAt
      DateTime generatedAt;
      try {
        if (json['generatedAt'] == null) {
          throw MissingFieldException('generatedAt');
        }
        if (json['generatedAt'] is! String) {
          throw InvalidTypeException('generatedAt', String, actualType: json['generatedAt'].runtimeType);
        }
        generatedAt = DateTime.parse(json['generatedAt']);
      } catch (e) {
        if (e is ValidationException) {
          rethrow;
        }
        throw DateTimeParseException('generatedAt', json['generatedAt']?.toString() ?? 'null');
      }

      return SummaryData(
        axisScores: axisScores,
        confidence: confidence,
        summaryText: summaryText,
        advice: advice,
        strengths: strengths,
        developmentAreas: developmentAreas,
        testInfluences: testInfluences,
        generatedAt: generatedAt,
      );
    } catch (e, stackTrace) {
      appLogger.e('SummaryData.fromJson: Validation failure', error: e, stackTrace: stackTrace);
      if (e is ValidationException) {
        rethrow;
      }
      throw MalformedJsonException('Failed to parse SummaryData: ${e.toString()}', value: json);
    }
  }

  /// Helper to validate string lists
  static List<String> _validateStringList(Map<String, dynamic> json, String field) {
    try {
      if (json[field] == null) {
        throw MissingFieldException(field);
      }
      if (json[field] is! List) {
        throw InvalidTypeException(field, List, actualType: json[field].runtimeType);
      }
      return List<String>.from(json[field]);
    } catch (e) {
      appLogger.e('SummaryData._validateStringList: Invalid $field', error: e);
      rethrow;
    }
  }
}

/// Влияние тестов на результат
class TestInfluence {
  final String testId;
  final String testName;
  final int questionsCount;     // Количество вопросов
  final double totalInfluence;  // Общее влияние на все шкалы
  final List<String> influencedAxes; // Влияемые шкалы

  TestInfluence({
    required this.testId,
    required this.testName,
    required this.questionsCount,
    required this.totalInfluence,
    required this.influencedAxes,
  });

  Map<String, dynamic> toJson() {
    return {
      'testId': testId,
      'testName': testName,
      'questionsCount': questionsCount,
      'totalInfluence': totalInfluence,
      'influencedAxes': influencedAxes,
    };
  }

  /// Deserialize TestInfluence from JSON with validation
  factory TestInfluence.fromJson(Map<String, dynamic> json) {
    try {
      final testId = SummaryScore._validateString(json, 'testId', required: true);
      final testName = SummaryScore._validateString(json, 'testName', required: true);

      // Validate questionsCount (should be positive)
      final questionsCountValue = json['questionsCount'];
      if (questionsCountValue == null) {
        throw MissingFieldException('questionsCount');
      }
      int questionsCount;
      if (questionsCountValue is int) {
        questionsCount = questionsCountValue;
      } else if (questionsCountValue is double) {
        questionsCount = questionsCountValue.toInt();
      } else {
        throw InvalidTypeException('questionsCount', int, actualType: questionsCountValue.runtimeType, value: questionsCountValue);
      }
      if (questionsCount < 0) {
        appLogger.w('TestInfluence.fromJson: questionsCount ($questionsCount) is negative, using 0');
        questionsCount = 0;
      }

      // Validate totalInfluence
      final totalInfluence = SummaryScore._validateDouble(json, 'totalInfluence', required: true, min: 0.0);

      // Validate influencedAxes list
      List<String> influencedAxes;
      try {
        if (json['influencedAxes'] == null) {
          throw MissingFieldException('influencedAxes');
        }
        if (json['influencedAxes'] is! List) {
          throw InvalidTypeException('influencedAxes', List, actualType: json['influencedAxes'].runtimeType);
        }
        influencedAxes = List<String>.from(json['influencedAxes']);
      } catch (e) {
        appLogger.e('TestInfluence.fromJson: Invalid influencedAxes', error: e);
        rethrow;
      }

      return TestInfluence(
        testId: testId,
        testName: testName,
        questionsCount: questionsCount,
        totalInfluence: totalInfluence,
        influencedAxes: influencedAxes,
      );
    } catch (e, stackTrace) {
      appLogger.e('TestInfluence.fromJson: Validation failure', error: e, stackTrace: stackTrace);
      if (e is ValidationException) {
        rethrow;
      }
      throw MalformedJsonException('Failed to parse TestInfluence: ${e.toString()}', value: json);
    }
  }
}

/// Калькулятор для расчёта саммари
class SummaryCalculator {
  final List<TestResult> testResults;
  // Cache for test question counts
  static final Map<String, int> _questionCountsCache = {};

  SummaryCalculator(this.testResults);

  /// Рассчитать полное саммари
  SummaryData calculateSummary(String languageCode) {
    // Рассчитать баллы по шкалам
    final axisScores = _calculateAxisScores(languageCode);

    // Определить уровень уверенности
    final confidence = _calculateConfidence(axisScores);

    // Сгенерировать текстовое описание
    final summaryText = _generateSummaryText(axisScores, confidence, languageCode);

    // Сгенерировать советы
    final advice = _generateAdvice(axisScores, languageCode);

    // Определить сильные стороны и зоны развития
    final strengths = _getStrengths(axisScores, languageCode);
    final developmentAreas = _getDevelopmentAreas(axisScores, languageCode);

    // Проанализировать влияние тестов
    final testInfluences = _analyzeTestInfluences(axisScores);

    return SummaryData(
      axisScores: axisScores,
      confidence: confidence,
      summaryText: summaryText,
      advice: advice,
      strengths: strengths,
      developmentAreas: developmentAreas,
      testInfluences: testInfluences,
      generatedAt: DateTime.now(),
    );
  }

  /// Рассчитать баллы по всем шкалам
  Map<String, SummaryScore> _calculateAxisScores(String languageCode) {
    // Check if we have any v2 results with hierarchical scale scores
    final hasV2Results = testResults.any((r) => r.version >= 2 && r.scaleScores != null);

    // DEBUG: Log test results info
    appLogger.d('=== _calculateAxisScores DEBUG ===');
    appLogger.d('Total test results: ${testResults.length}');
    for (final result in testResults) {
      appLogger.d('  - ${result.testId}: version=${result.version}, scaleScores=${result.scaleScores != null ? "${result.scaleScores!.length} scales" : "null"}');
    }
    appLogger.d('hasV2Results: $hasV2Results');

    if (hasV2Results) {
      // Use new v2 hierarchical scoring
      appLogger.d('Using v2 hierarchical scoring');
      return _calculateHierarchicalScaleScores(languageCode);
    } else {
      // Fallback to v1 legacy scoring for backward compatibility
      appLogger.d('Using v1 legacy scoring');
      return _calculateLegacyAxisScores(languageCode);
    }
  }

  /// NEW v2: Calculate scores using hierarchical scale scores
  Map<String, SummaryScore> _calculateHierarchicalScaleScores(String languageCode) {
    final scaleScores = <String, SummaryScore>{};

    // Collect all unique scale IDs from all test results
    final allScaleIds = <String>{};
    for (final result in testResults) {
      if (result.version >= 2 && result.scaleScores != null) {
        appLogger.d('  Adding ${result.scaleScores!.length} scales from ${result.testId}');
        allScaleIds.addAll(result.scaleScores!.keys);
      }
    }

    appLogger.d('Total unique scale IDs collected: ${allScaleIds.length}');

    // For each scale, aggregate scores from all tests
    for (final scaleId in allScaleIds) {
      final contributions = <TestContribution>[];
      var totalScore = 0.0;
      var count = 0;

      for (final result in testResults) {
        if (result.version >= 2 && result.scaleScores != null) {
          final score = result.scaleScores![scaleId];
          if (score != null) {
            totalScore += score;
            count++;

            contributions.add(TestContribution(
              testId: result.testId,
              testName: _getTestName(result.testId, languageCode),
              scale: scaleId,
              score: score,
              weight: 1.0, // Equal weight for now
              direction: 1,
              contribution: score,
            ));
          }
        }
      }

      if (count > 0) {
        final avgScore = totalScore / count;
        final confidence = _calculateScaleConfidence(count, contributions.length);

        scaleScores[scaleId] = SummaryScore(
          axisId: scaleId,
          score: avgScore, // Already normalized 0-100
          rawScore: avgScore,
          confidence: confidence,
          contributions: contributions,
        );
      }
    }

    appLogger.d('Calculated ${scaleScores.length} scale scores (v2 hierarchical)');
    return scaleScores;
  }

  /// Calculate confidence for a hierarchical scale based on test coverage
  double _calculateScaleConfidence(int testCount, int contributionCount) {
    // Confidence increases with more tests measuring this scale
    if (testCount >= 3) return 0.9;
    if (testCount >= 2) return 0.7;
    if (testCount >= 1) return 0.5;
    return 0.0;
  }

  /// LEGACY v1: Calculate scores using old axis mapping system
  Map<String, SummaryScore> _calculateLegacyAxisScores(String languageCode) {
    final axisScores = <String, SummaryScore>{};

    for (final axis in SummaryConfig.axes.values) {
      final contributions = <TestContribution>[];
      var totalWeightedScore = 0.0;
      var totalWeight = 0.0;

      // Найти все соответствия для этой шкалы
      for (final testResult in testResults) {
        final mappings = SummaryConfig.testMappings[testResult.testId];
        if (mappings == null) continue;

        for (final mapping in mappings) {
          if (mapping.targetAxis != axis.id) continue;

          // Получить балл по шкале теста
          double scaleScore = _getScaleScore(testResult, mapping.scale);
          if (scaleScore.isNaN) continue;

          // Применить направление и вес
          final contribution = scaleScore * mapping.direction * mapping.weight;
          totalWeightedScore += contribution;
          totalWeight += mapping.weight;

          // Добавить вклад для отображения
          contributions.add(TestContribution(
            testId: testResult.testId,
            testName: _getTestName(testResult.testId, languageCode),
            scale: mapping.scale,
            score: scaleScore,
            weight: mapping.weight,
            direction: mapping.direction,
            contribution: contribution,
          ));
        }
      }

      // Если нет вкладов, создаем пустой score
      if (contributions.isEmpty) {
        axisScores[axis.id] = SummaryScore(
          axisId: axis.id,
          score: 0.0, // или можно использовать null
          rawScore: 0.0,
          confidence: 0.0,
          contributions: [],
        );
      } else {
        // Рассчитать итоговый балл
        final rawScore = totalWeightedScore / totalWeight;
        final normalizedScore = _normalizeScore(rawScore);
        final confidence = _calculateAxisConfidence(contributions);

        axisScores[axis.id] = SummaryScore(
          axisId: axis.id,
          score: normalizedScore,
          rawScore: rawScore,
          confidence: confidence,
          contributions: contributions,
        );
      }
    }

    return axisScores;
  }

  /// Получить балл по шкале теста
  double _getScaleScore(TestResult testResult, String scale) {
    // Для простых тестов используем общий балл
    if (testResult.factorScores == null) {
      return testResult.percentage;
    }

    // Для многофакторных тестов найти нужную шкалу
    final factorScore = testResult.factorScores![scale];
    return factorScore?.percentage ?? double.nan;
  }

  /// Нормализовать балл к шкале 0-100
  /// rawScore находится в диапазоне примерно от -100 до 100
  /// (взвешенные проценты с учётом direction)
  double _normalizeScore(double rawScore) {
    // Простая линейная трансформация из диапазона [-100, 100] в [0, 100]
    // Формула: (rawScore + 100) / 2
    //
    // Примеры:
    // - rawScore = 100  → (100 + 100) / 2 = 100
    // - rawScore = 0    → (0 + 100) / 2 = 50
    // - rawScore = -100 → (-100 + 100) / 2 = 0
    final normalized = (rawScore + 100) / 2;
    return normalized.clamp(0.0, 100.0);
  }

  /// Рассчитать уверенность для шкалы
  double _calculateAxisConfidence(List<TestContribution> contributions) {
    if (contributions.isEmpty) return 0.0;

    // Уверенность зависит от количества вкладов и их веса
    var totalConfidence = 0.0;
    var totalWeight = 0.0;

    for (final contribution in contributions) {
      totalConfidence += contribution.weight;
      totalWeight += contribution.weight;
    }

    return totalWeight > 0 ? (totalConfidence / contributions.length) : 0.0;
  }

  /// Определить общий уровень уверенности
  ConfidenceLevel _calculateConfidence(Map<String, SummaryScore> axisScores) {
    final testCount = testResults.length;
    final uniqueTests = testResults.map((r) => r.testId).toSet().length;

    // Базовая уверенность по количеству тестов
    var baseConfidence = 0.0;
    if (uniqueTests >= 3) {
      baseConfidence = SummaryConfig.confidenceThresholds.high;
    } else if (uniqueTests >= 2) {
      baseConfidence = SummaryConfig.confidenceThresholds.medium;
    } else {
      baseConfidence = SummaryConfig.confidenceThresholds.low;
    }

    // Учитываем среднюю уверенность по шкалам
    double finalConfidence = baseConfidence;

    if (axisScores.isNotEmpty) {
      final avgAxisConfidence = axisScores.values
          .map((score) => score.confidence)
          .reduce((a, b) => a + b) / axisScores.length;

      // Финальная уверенность - среднее между базовой и средней по шкалам
      finalConfidence = (baseConfidence + avgAxisConfidence) / 2;
    }

    if (finalConfidence >= SummaryConfig.confidenceThresholds.high) {
      return ConfidenceLevel.high;
    } else if (finalConfidence >= SummaryConfig.confidenceThresholds.medium) {
      return ConfidenceLevel.medium;
    } else {
      return ConfidenceLevel.low;
    }
  }

  /// Шаблоны описаний для шкал
  static const Map<String, Map<String, Map<String, String>>> _axisTemplates = {
    'emotional_balance': {
      'high': {
        'ru': 'Вы эмоционально стабильны и спокойны — стресс не выбивает вас из колеи, и вы умеете сохранять внутреннее равновесие даже в сложных ситуациях',
        'en': 'You are emotionally stable and calm — stress doesn\'t throw you off balance, and you know how to maintain inner equilibrium even in difficult situations',
      },
      'medium': {
        'ru': 'Вы обычно справляетесь со стрессом, хотя иногда эмоции берут верх',
        'en': 'You usually cope with stress, although sometimes emotions take over',
      },
      'low': {
        'ru': 'Вы чувствительный человек, который глубоко переживает события — это делает вас отзывчивым, хотя иногда стресс может влиять на ваше настроение',
        'en': 'You are a sensitive person who deeply experiences events — this makes you responsive, although sometimes stress can affect your mood',
      },
    },
    'self_control': {
      'high': {
        'ru': 'Вы дисциплинированы и организованны — умеете планировать, доводить дела до конца и следовать своим целям',
        'en': 'You are disciplined and organized — you know how to plan, follow through, and stick to your goals',
      },
      'medium': {
        'ru': 'Вы способны к самоорганизации, когда это действительно важно',
        'en': 'You are capable of self-organization when it really matters',
      },
      'low': {
        'ru': 'Вы цените свободу и спонтанность — предпочитаете гибкий подход к делам, хотя иногда это может усложнять планирование',
        'en': 'You value freedom and spontaneity — you prefer a flexible approach to tasks, although this can sometimes complicate planning',
      },
    },
    'sociability': {
      'high': {
        'ru': 'Вы общительный и эмпатичный человек — легко находите общий язык с людьми, умеете поддержать и понять чувства других',
        'en': 'You are sociable and empathetic — you easily find common ground with people, know how to support and understand the feelings of others',
      },
      'medium': {
        'ru': 'Вы комфортно чувствуете себя в компании, но цените и личное пространство',
        'en': 'You feel comfortable in company, but also value personal space',
      },
      'low': {
        'ru': 'Вы цените глубокие связи с близкими людьми больше, чем широкий круг знакомств — предпочитаете качество общения количеству',
        'en': 'You value deep connections with close people more than a wide circle of acquaintances — you prefer quality of communication over quantity',
      },
    },
    'mindfulness': {
      'high': {
        'ru': 'Вы склонны к самоанализу и рефлексии — внимательно относитесь к своим мыслям и чувствам, стремитесь понять себя глубже',
        'en': 'You are inclined to self-analysis and reflection — you pay close attention to your thoughts and feelings, striving to understand yourself deeper',
      },
      'medium': {
        'ru': 'Вы периодически задумываетесь о себе и своих переживаниях',
        'en': 'You periodically think about yourself and your experiences',
      },
      'low': {
        'ru': 'Вы живёте настоящим моментом и предпочитаете действовать, а не размышлять — это помогает вам быть практичным и решительным',
        'en': 'You live in the present moment and prefer to act rather than contemplate — this helps you be practical and decisive',
      },
    },
    'motivation': {
      'high': {
        'ru': 'Вы полны энергии и мотивации — активно стремитесь к целям, полны энтузиазма и внутренней силы',
        'en': 'You are full of energy and motivation — you actively pursue goals, full of enthusiasm and inner strength',
      },
      'medium': {
        'ru': 'Ваша мотивация зависит от интереса к задаче и обстоятельств',
        'en': 'Your motivation depends on interest in the task and circumstances',
      },
      'low': {
        'ru': 'Вы спокойный человек, который предпочитает размеренный темп жизни — это помогает вам избегать выгорания и сохранять баланс',
        'en': 'You are a calm person who prefers a measured pace of life — this helps you avoid burnout and maintain balance',
      },
    },
    'creativity': {
      'high': {
        'ru': 'Вы креативны и открыты новому — любите экспериментировать, легко адаптируетесь к переменам и находите нестандартные решения',
        'en': 'You are creative and open to new things — you love to experiment, easily adapt to changes and find unconventional solutions',
      },
      'medium': {
        'ru': 'Вы открыты новым идеям, когда они кажутся практичными и полезными',
        'en': 'You are open to new ideas when they seem practical and useful',
      },
      'low': {
        'ru': 'Вы цените проверенные подходы и стабильность — предпочитаете надёжность экспериментам, что помогает вам быть последовательным',
        'en': 'You value proven approaches and stability — you prefer reliability over experiments, which helps you be consistent',
      },
    },
  };

  /// Получить уровень шкалы по баллу
  String _getAxisLevel(double score) {
    if (score >= 70) return 'high';
    if (score >= 30) return 'medium';
    return 'low';
  }

  /// Сгенерировать текстовое саммари
  String _generateSummaryText(Map<String, SummaryScore> axisScores, ConfidenceLevel confidence, String languageCode) {
    final isRussian = languageCode == 'ru';
    final descriptions = <String>[];

    // Собираем описания по всем шкалам, сортируем по значимости (высокие и низкие первыми)
    final sortedAxes = axisScores.entries.toList()
      ..sort((a, b) {
        final aDistance = (a.value.score - 50).abs();
        final bDistance = (b.value.score - 50).abs();
        return bDistance.compareTo(aDistance); // Самые экстремальные первыми
      });

    // Берём до 3 самых выраженных шкал
    final significantAxes = sortedAxes.take(3).where((entry) {
      final score = entry.value.score;
      return score >= 60 || score <= 40; // Только если шкала достаточно выражена
    }).toList();

    // Собираем описания
    for (final entry in significantAxes) {
      final axisId = entry.key;
      final score = entry.value.score;
      final level = _getAxisLevel(score);

      final template = _axisTemplates[axisId];
      if (template != null && template[level] != null) {
        final description = template[level]![languageCode];
        if (description != null) {
          descriptions.add(description);
        }
      }
    }

    // Если нет значимых шкал, добавляем общее описание
    if (descriptions.isEmpty) {
      descriptions.add(isRussian
          ? 'Ваш профиль показывает сбалансированные характеристики по всем шкалам — вы гармоничная личность, которая умеет адаптироваться к разным ситуациям'
          : 'Your profile shows balanced characteristics across all scales — you are a harmonious personality who knows how to adapt to different situations');
    }

    // Соединяем описания в текст
    var text = '';

    if (descriptions.length == 1) {
      text = descriptions[0];
    } else if (descriptions.length == 2) {
      text = descriptions.join(isRussian ? '. ' : '. ');
    } else {
      // Три и более описания
      text = descriptions[0];
      for (int i = 1; i < descriptions.length; i++) {
        if (i == descriptions.length - 1) {
          // Последнее описание
          text += isRussian ? '. При этом ' : '. Additionally, ';
          text += descriptions[i][0].toLowerCase() + descriptions[i].substring(1);
        } else {
          text += '. ';
          text += descriptions[i];
        }
      }
    }

    // Добавляем заключение в зависимости от уверенности
    if (confidence == ConfidenceLevel.high) {
      text += isRussian
          ? '. Это достаточно полная картина вашей личности!'
          : '. This is a fairly complete picture of your personality!';
    } else if (confidence == ConfidenceLevel.medium) {
      text += isRussian
          ? '. Пройдите ещё тесты, чтобы узнать о себе больше!'
          : '. Take more tests to learn more about yourself!';
    } else {
      text += isRussian
          ? '. Пройдите больше тестов для более точного профиля!'
          : '. Take more tests for a more accurate profile!';
    }

    return text.trim();
  }

  /// Сгенерировать советы
  List<String> _generateAdvice(Map<String, SummaryScore> axisScores, String languageCode) {
    final advice = <String>[];
    final isRussian = languageCode == 'ru';

    // Совет по сильным сторонам
    final topAxes = axisScores.entries
        .where((entry) => entry.value.score >= 70)
        .toList()
      ..sort((a, b) => b.value.score.compareTo(a.value.score));

    if (topAxes.isNotEmpty) {
      final topAxis = topAxes.first;
      // v2: Try to get hierarchical scale, fallback to v1 axis
      final axis = SummaryConfig.axes[topAxis.key];

      if (axis == null) {
        // v2: hierarchical scale - use generic advice
        final scale = SummaryConfig.getScale(topAxis.key);
        if (scale != null) {
          final scaleName = scale.getName(languageCode);
          advice.add(isRussian
              ? 'Ваш высокий уровень по шкале "$scaleName" (${topAxis.value.score.round()}%) — это замечательно! Это одна из ваших сильных сторон.'
              : 'Your high level in "$scaleName" (${topAxis.value.score.round()}%) is wonderful! This is one of your strengths.');
        }
      } else {
        // v1: use old axis-specific advice
        // Персонализированные советы для каждой шкалы
        final tips = {
          'emotional_balance': {
            'ru': 'Ваша эмоциональная стабильность — настоящий дар! Используйте её, чтобы поддерживать других в трудные моменты и сохранять спокойствие в стрессовых ситуациях.',
            'en': 'Your emotional stability is a real gift! Use it to support others in difficult moments and stay calm in stressful situations.',
          },
          'self_control': {
            'ru': 'Ваша дисциплина и организованность помогают достигать целей! Продолжайте использовать это качество для реализации больших проектов.',
            'en': 'Your discipline and organization help you achieve goals! Continue to use this quality to realize big projects.',
          },
          'sociability': {
            'ru': 'Ваша способность находить общий язык с людьми — это ценный навык! Используйте его для построения крепких отношений и командной работы.',
            'en': 'Your ability to find common ground with people is a valuable skill! Use it to build strong relationships and teamwork.',
          },
          'mindfulness': {
            'ru': 'Ваша склонность к рефлексии помогает глубоко понимать себя! Это отличная основа для личностного роста и осознанных решений.',
            'en': 'Your inclination for reflection helps you deeply understand yourself! This is a great foundation for personal growth and conscious decisions.',
          },
          'motivation': {
            'ru': 'Ваша энергия и мотивация заразительны! Направляйте их на важные для вас цели и вдохновляйте окружающих своим энтузиазмом.',
            'en': 'Your energy and motivation are contagious! Direct them toward goals that are important to you and inspire those around you with your enthusiasm.',
          },
          'creativity': {
            'ru': 'Ваша креативность и открытость новому — это источник инноваций! Не бойтесь экспериментировать и предлагать нестандартные решения.',
            'en': 'Your creativity and openness to new things are a source of innovation! Don\'t be afraid to experiment and offer unconventional solutions.',
          },
        };

        final tip = tips[topAxis.key];
        if (tip != null) {
          advice.add(tip[languageCode]!);
        } else {
          final name = axis.getGenitiveCase(languageCode);
          advice.add(isRussian
              ? 'Ваш высокий уровень $name — это замечательно! Используйте это качество для достижения своих целей.'
              : 'Your high level of $name is wonderful! Use this quality to achieve your goals.');
        }
      }
    }

    // Совет по зонам развития (мягкий и позитивный)
    final lowAxes = axisScores.entries
        .where((entry) => entry.value.score <= 30)
        .toList()
      ..sort((a, b) => a.value.score.compareTo(b.value.score));

    if (lowAxes.isNotEmpty) {
      final lowAxis = lowAxes.first;
      // v2: Try to get hierarchical scale, fallback to v1 axis
      final axis = SummaryConfig.axes[lowAxis.key];

      if (axis == null) {
        // v2: hierarchical scale - use generic advice
        final scale = SummaryConfig.getScale(lowAxis.key);
        if (scale != null) {
          final scaleName = scale.getName(languageCode);
          advice.add(isRussian
              ? 'Если захотите, можете поработать над шкалой "$scaleName" — это может открыть новые возможности и сделать жизнь ещё интереснее!'
              : 'If you wish, you can work on "$scaleName" — it can open up new opportunities and make life even more interesting!');
        }
      } else {
        // v1: use old axis-specific advice
        final name = axis.getInstrumentalCase(languageCode);
        advice.add(isRussian
            ? 'Если захотите, можете поработать над $name — это может открыть новые возможности и сделать жизнь ещё интереснее!'
            : 'If you wish, you can work on $name — it can open up new opportunities and make life even more interesting!');
      }
    }

    // Общий совет (позитивный и поддерживающий)
    advice.add(isRussian
        ? 'Помните: вы уникальны, и каждая ваша черта делает вас особенным. Принимайте себя таким, какой вы есть, и развивайтесь в том направлении, которое приносит вам радость!'
        : 'Remember: you are unique, and each of your traits makes you special. Accept yourself as you are and develop in the direction that brings you joy!');

    return advice;
  }

  /// Получить сильные стороны
  List<String> _getStrengths(Map<String, SummaryScore> axisScores, String languageCode) {
    return axisScores.entries
        .where((entry) => entry.value.score >= 70)
        .map((entry) {
          // v2: Try hierarchical scale first, fallback to v1 axis
          final axis = SummaryConfig.axes[entry.key];
          if (axis != null) {
            return axis.getName(languageCode);
          }
          final scale = SummaryConfig.getScale(entry.key);
          return scale?.getName(languageCode) ?? entry.key;
        })
        .take(3)
        .toList();
  }

  /// Получить зоны развития
  List<String> _getDevelopmentAreas(Map<String, SummaryScore> axisScores, String languageCode) {
    return axisScores.entries
        .where((entry) => entry.value.score <= 30)
        .map((entry) {
          // v2: Try hierarchical scale first, fallback to v1 axis
          final axis = SummaryConfig.axes[entry.key];
          if (axis != null) {
            return axis.getName(languageCode);
          }
          final scale = SummaryConfig.getScale(entry.key);
          return scale?.getName(languageCode) ?? entry.key;
        })
        .take(2)
        .toList();
  }

  /// Проанализировать влияние тестов
  List<TestInfluence> _analyzeTestInfluences(Map<String, SummaryScore> axisScores) {
    final influences = <String, TestInfluence>{};

    for (final axisScore in axisScores.values) {
      for (final contribution in axisScore.contributions) {
        if (influences.containsKey(contribution.testId)) {
          // Создать новый объект с обновлёнными данными
          final existing = influences[contribution.testId]!;
          influences[contribution.testId] = TestInfluence(
            testId: existing.testId,
            testName: existing.testName,
            questionsCount: existing.questionsCount,
            totalInfluence: existing.totalInfluence + contribution.contribution.abs(),
            influencedAxes: {...existing.influencedAxes, axisScore.axisId}.toList(),
          );
        } else {
          influences[contribution.testId] = TestInfluence(
            testId: contribution.testId,
            testName: contribution.testName,
            questionsCount: _getTestQuestionsCount(contribution.testId),
            totalInfluence: contribution.contribution.abs(),
            influencedAxes: [axisScore.axisId],
          );
        }
      }
    }

    return influences.values.toList()
      ..sort((a, b) => b.totalInfluence.compareTo(a.totalInfluence));
  }

  /// Получить название теста
  String _getTestName(String testId, String languageCode) {
    switch (testId) {
      case 'ipip_big_five':
        return languageCode == 'ru' ? 'Большая Пятёрка' : 'Big Five';
      case 'fisher_temperament':
        return languageCode == 'ru' ? 'Темперамент Фишер' : 'Fisher Temperament';
      case 'love_profile':
        return languageCode == 'ru' ? 'Профиль любви' : 'Love Profile';
      case 'stress_test':
        return languageCode == 'ru' ? 'Тест на стресс' : 'Stress Test';
      case 'self_esteem_test':
        return languageCode == 'ru' ? 'Тест на самооценку' : 'Self-Esteem Test';
      default:
        return testId;
    }
  }

  /// Получить количество вопросов в тесте
  int _getTestQuestionsCount(String testId) {
    // Check cache first
    if (_questionCountsCache.containsKey(testId)) {
      return _questionCountsCache[testId]!;
    }

    // Load from test registry (synchronous)
    try {
      final testStub = TestRegistry.getTest(testId);
      if (testStub == null) {
        return 0;
      }
      final count = testStub.questionCount;
      _questionCountsCache[testId] = count;
      return count;
    } catch (e) {
      // Return 0 if test not found
      return 0;
    }
  }
}
