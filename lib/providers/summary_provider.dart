import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/summary_model.dart';
import '../models/test_model.dart';
import '../config/summary_config.dart';
import '../config/summary/hierarchical_scales.dart' show HierarchicalScalesConfig;
import '../utils/app_logger.dart';

// Export classes for UI use
export '../config/summary_config.dart' show ScaleCategory;
export '../config/summary/hierarchical_scales.dart' show HierarchicalScalesConfig, HierarchicalScale;

class SummaryProvider with ChangeNotifier {
  SummaryData? _currentSummary;
  bool _isLoading = false;
  bool _isCalculating = false;
  String? _lastError;
  List<TestResult> _testResults = []; // Store test results for question contributions

  SummaryData? get currentSummary => _currentSummary;
  bool get isLoading => _isLoading;
  bool get isCalculating => _isCalculating;
  bool get hasSummary => _currentSummary != null;
  String? get lastError => _lastError;

  // Слушатель для изменений языка
  Future<void> onLocaleChanged() async {
    // Очистить текущее саммари и кэш при изменении языка
    _currentSummary = null;
    await _clearSavedSummary();
    appLogger.i('Summary cleared due to locale change');
    notifyListeners();
  }

  /// Рассчитать новое саммари на основе результатов тестов
  Future<bool> calculateSummary(List<TestResult> testResults, String languageCode) async {
    if (testResults.isEmpty) {
      _currentSummary = null;
      _testResults = [];
      appLogger.d('No test results available for summary calculation');
      notifyListeners();
      return true;
    }

    _isCalculating = true;
    notifyListeners();

    try {
      final calculator = SummaryCalculator(testResults);
      final summary = calculator.calculateSummary(languageCode);

      _currentSummary = summary;
      _testResults = testResults; // Store for question contributions access

      // Сохранить в SharedPreferences
      await _saveSummary(summary);

      _lastError = null;
      appLogger.i('Summary calculated successfully: ${testResults.length} tests analyzed');
      notifyListeners();
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to calculate summary', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось рассчитать саммари';
      _currentSummary = null;
      return false;
    } finally {
      _isCalculating = false;
      notifyListeners();
    }
  }

  /// Загрузить сохранённое саммари
  Future<bool> loadSummary() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final summaryJson = prefs.getString('user_summary');

      if (summaryJson != null) {
        final summaryData = json.decode(summaryJson);
        _currentSummary = SummaryData.fromJson(summaryData);
        _lastError = null;
        appLogger.i('Summary loaded from cache');
        return true;
      } else {
        appLogger.d('No cached summary found');
        return true; // Not an error, just no data
      }
    } catch (e, stackTrace) {
      appLogger.e('Failed to load summary', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось загрузить саммари';
      _currentSummary = null;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Сохранить саммари в SharedPreferences
  Future<bool> _saveSummary(SummaryData summary) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final summaryJson = json.encode(summary.toJson());
      await prefs.setString('user_summary', summaryJson);
      appLogger.d('Summary saved to cache');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to save summary', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  /// Обновить саммари на основе всех результатов тестов
  Future<bool> refreshSummary(List<TestResult> completedTests, String languageCode) async {
    // Всегда очищаем кэш, чтобы пересчитать с новым языком
    _currentSummary = null;
    await _clearSavedSummary();

    if (completedTests.isEmpty) {
      appLogger.d('No completed tests to refresh summary');
      notifyListeners();
      return true;
    }

    return await calculateSummary(completedTests, languageCode);
  }

  /// Очистить сохранённое саммари
  Future<bool> clearSummary() async {
    _currentSummary = null;
    _testResults = [];
    final success = await _clearSavedSummary();
    appLogger.i('Summary cleared');
    notifyListeners();
    return success;
  }

  Future<bool> _clearSavedSummary() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_summary');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to clear summary cache', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  /// Clears the last error message
  void clearError() {
    _lastError = null;
    notifyListeners();
  }

  /// Получить баллы по шкале
  SummaryScore? getAxisScore(String axisId) {
    return _currentSummary?.axisScores[axisId];
  }

  /// Получить все шкалы с их баллами
  List<AxisScoreData> getAllAxisScores() {
    if (_currentSummary == null) return [];

    // Use hierarchical scales from currentSummary (v2) instead of old axes (v1)
    return _currentSummary!.axisScores.entries.map((entry) {
      final scaleId = entry.key;
      final score = entry.value;

      // Get scale definition from HierarchicalScalesConfig
      final hierarchicalScale = HierarchicalScalesConfig.hierarchicalScales[scaleId];

      // Create a SummaryAxis from HierarchicalScale for compatibility
      final axis = hierarchicalScale != null
          ? SummaryAxis(
              id: hierarchicalScale.id,
              name: hierarchicalScale.name,
              description: hierarchicalScale.description,
              // Use default cases for backward compatibility
              instrumentalCase: hierarchicalScale.name,
              genitiveCase: hierarchicalScale.name,
              color: Colors.blue, // Default color
              icon: Icons.psychology, // Default icon
            )
          : SummaryAxis(
              id: scaleId,
              name: {'en': scaleId, 'ru': scaleId},
              description: {'en': '', 'ru': ''},
              instrumentalCase: {'en': scaleId, 'ru': scaleId},
              genitiveCase: {'en': scaleId, 'ru': scaleId},
              color: Colors.grey,
              icon: Icons.help,
            );

      return AxisScoreData(
        axis: axis,
        score: score,
      );
    }).toList();
  }

  /// Получить сильные стороны (баллы > 70)
  List<AxisScoreData> getStrengths() {
    return getAllAxisScores()
        .where((data) => data.score != null && data.score!.score >= 70)
        .toList();
  }

  /// Получить зоны развития (баллы < 30)
  List<AxisScoreData> getDevelopmentAreas() {
    return getAllAxisScores()
        .where((data) => data.score != null && data.score!.score <= 30)
        .toList();
  }

  /// Получить статистику по тестам
  TestStatistics getTestStatistics() {
    if (_currentSummary == null) {
      return TestStatistics.empty();
    }

    final uniqueTests = _currentSummary!.testInfluences
        .map((influence) => influence.testId)
        .toSet()
        .length;

    final totalInfluence = _currentSummary!.testInfluences
        .fold(0.0, (sum, influence) => sum + influence.totalInfluence);

    return TestStatistics(
      uniqueTestsCount: uniqueTests,
      totalInfluence: totalInfluence,
      testInfluences: _currentSummary!.testInfluences,
    );
  }

  /// NEW v2: Get hierarchical categories with subscales (only measured ones)
  List<CategoryScoreData> getHierarchicalCategories({bool includeEmpty = false}) {
    final categories = <CategoryScoreData>[];

    for (final category in SummaryConfig.categories.values) {
      // Get all scales in this category
      final subscaleScores = <ScaleScoreData>[];
      var totalScore = 0.0;
      var count = 0;

      for (final scaleId in category.subscaleIds) {
        final score = _currentSummary?.axisScores[scaleId];
        final hasData = score != null && score.contributions.isNotEmpty;

        // Include scale if it has data OR if includeEmpty is true
        if (hasData || includeEmpty) {
          subscaleScores.add(ScaleScoreData(
            scaleId: scaleId,
            scale: SummaryConfig.getScale(scaleId),
            score: score,
            hasData: hasData,
          ));
          if (hasData) {
            totalScore += score.score;
            count++;
          }
        }
      }

      // Include category if it has subscales
      if (subscaleScores.isNotEmpty) {
        final avgScore = count > 0 ? totalScore / count : 0.0;
        categories.add(CategoryScoreData(
          category: category,
          averageScore: avgScore,
          subscales: subscaleScores,
          measuredCount: count,
          totalCount: subscaleScores.length,
        ));
      }
    }

    // Sort by score (highest first) for better UX, but categories without data go last
    categories.sort((a, b) {
      // Categories with no measurements go to the bottom
      if (a.measuredCount == 0 && b.measuredCount > 0) return 1;
      if (b.measuredCount == 0 && a.measuredCount > 0) return -1;
      // Otherwise sort by average score
      return b.averageScore.compareTo(a.averageScore);
    });

    return categories;
  }

  /// Get question contributions for a specific scale from all tests
  /// Returns map: testId_attemptN -> List<QuestionContribution>
  /// Each test attempt is tracked separately with unique key
  Map<String, List<QuestionContribution>> getQuestionContributions(String scaleId) {
    final Map<String, List<QuestionContribution>> contributions = {};
    final Map<String, int> testAttempts = {}; // Track attempt numbers per test

    appLogger.d('DEBUG: Getting contributions for scale $scaleId from ${_testResults.length} test results');

    for (final result in _testResults) {
      // Track attempt number for this test
      final attemptNumber = (testAttempts[result.testId] ?? 0) + 1;
      testAttempts[result.testId] = attemptNumber;

      appLogger.d('  - Test ${result.testId} (attempt #$attemptNumber): questionContributions is ${result.questionContributions == null ? "null" : "not null"}');
      if (result.questionContributions != null) {
        appLogger.d('    - Has ${result.questionContributions!.length} scales');
        final scaleContributions = result.questionContributions![scaleId];
        if (scaleContributions != null && scaleContributions.isNotEmpty) {
          appLogger.d('    - Scale $scaleId has ${scaleContributions.length} questions');

          // Create unique key for this attempt
          final uniqueKey = attemptNumber > 1 ? '${result.testId}_attempt_$attemptNumber' : result.testId;
          contributions[uniqueKey] = scaleContributions;
        }
      }
    }

    appLogger.d('DEBUG: Returning ${contributions.length} test attempts with contributions for scale $scaleId');
    return contributions;
  }
}

/// Category with subscale scores (for hierarchical display)
class CategoryScoreData {
  final ScaleCategory category;
  final double averageScore;
  final List<ScaleScoreData> subscales;
  final int measuredCount; // Number of subscales with data
  final int totalCount; // Total number of subscales in category

  CategoryScoreData({
    required this.category,
    required this.averageScore,
    required this.subscales,
    this.measuredCount = 0,
    this.totalCount = 0,
  });

  bool get hasData => measuredCount > 0;

  String getScoreText() {
    if (measuredCount == 0) return '—';
    return '${averageScore.round()}%';
  }

  String getCountText() => '$measuredCount/$totalCount';

  Color getScoreColor() {
    if (measuredCount == 0) return Colors.grey;
    if (averageScore >= 70) return Colors.green;
    if (averageScore >= 50) return Colors.orange;
    if (averageScore >= 30) return Colors.amber;
    return Colors.red;
  }
}

/// Individual scale score data (for hierarchical display)
class ScaleScoreData {
  final String scaleId;
  final HierarchicalScale? scale;
  final SummaryScore? score; // Nullable for scales without data
  final bool hasData; // Whether this scale has measurement data

  ScaleScoreData({
    required this.scaleId,
    this.scale,
    this.score,
    this.hasData = true,
  });

  String getName(String languageCode) =>
      scale?.getName(languageCode) ?? scaleId;

  String getScoreText() {
    if (!hasData || score == null) return '—';
    return '${score!.score.round()}%';
  }

  Color getScoreColor() {
    if (!hasData || score == null) return Colors.grey;
    if (score!.score >= 70) return Colors.green;
    if (score!.score >= 50) return Colors.orange;
    if (score!.score >= 30) return Colors.amber;
    return Colors.red;
  }
}

/// Данные о шкале с баллом
class AxisScoreData {
  final SummaryAxis axis;
  final SummaryScore? score;

  AxisScoreData({
    required this.axis,
    this.score,
  });

  bool get hasScore => score != null && score!.contributions.isNotEmpty;
  double get scoreValue => score?.score ?? 0.0;
  double get confidence => score?.confidence ?? 0.0;

  String getScoreText() {
    if (score == null) return '?';
    return '${score!.score.round()}%';
  }

  String getDisplayText(String languageCode) {
    if (score == null || score!.contributions.isEmpty) {
      return languageCode == 'ru' ? '? нет данных' : '? no data';
    }
    return '${score!.score.round()}%';
  }

  Color getScoreColor() {
    if (score == null || score!.contributions.isEmpty) return Colors.grey;
    final value = score!.score;
    if (value >= 70) return Colors.green;
    if (value >= 50) return Colors.orange;
    if (value >= 30) return Colors.amber;
    return Colors.red;
  }

  String getScoreDescription(String languageCode) {
    if (score == null || score!.contributions.isEmpty) {
      return languageCode == 'ru'
          ? 'Нет данных. Пройдите больше тестов для получения оценки по этой шкале.'
          : 'No data available. Take more tests to get an assessment for this scale.';
    }
    return axis.getDescription(languageCode);
  }
}

/// Статистика по тестам
class TestStatistics {
  final int uniqueTestsCount;
  final double totalInfluence;
  final List<TestInfluence> testInfluences;

  TestStatistics({
    required this.uniqueTestsCount,
    required this.totalInfluence,
    required this.testInfluences,
  });

  factory TestStatistics.empty() {
    return TestStatistics(
      uniqueTestsCount: 0,
      totalInfluence: 0.0,
      testInfluences: [],
    );
  }

  String getConfidenceText(String languageCode) {
    final isRussian = languageCode == 'ru';

    if (uniqueTestsCount >= 3) {
      return isRussian ? 'Высокая' : 'High';
    } else if (uniqueTestsCount >= 2) {
      return isRussian ? 'Средняя' : 'Medium';
    } else {
      return isRussian ? 'Низкая' : 'Low';
    }
  }

  String getDescription(String languageCode) {
    final isRussian = languageCode == 'ru';

    if (uniqueTestsCount == 0) {
      return isRussian
          ? 'Пройдите тесты, чтобы получить персональное саммари'
          : 'Take tests to get a personal summary';
    }

    return isRussian
        ? 'На основе $uniqueTestsCount ${uniqueTestsCount == 1 ? "теста" : "тестов"}'
        : 'Based on $uniqueTestsCount ${uniqueTestsCount == 1 ? "test" : "tests"}';
  }
}
