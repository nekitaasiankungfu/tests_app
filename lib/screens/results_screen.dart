import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/test_provider.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../providers/summary_provider.dart';
import '../models/test_model.dart';
import '../models/career_compass_model.dart';
import '../models/color_psychology_model.dart';
import '../models/visual_micro_tests_model.dart';
import '../utils/theme_utils.dart';
import '../utils/app_logger.dart';
import '../constants/color_constants.dart';
import '../data/test_registry.dart';
import 'test_result_screen.dart';
import 'sixteen_types_result_screen.dart';
import 'career_compass_result_screen.dart';
import 'color_psychology_result_screen.dart';
import 'visual_micro_tests_result_screen.dart';
import 'summary_screen.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  bool _sortNewestFirst = true; // true - от новых к старым, false - от старых к новым

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final prefsProvider = Provider.of<UserPreferencesProvider>(context);
    final languageCode = localeProvider.locale.languageCode;
    final themeColor = prefsProvider.themeColor;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(languageCode == 'ru' ? 'Результаты тестов' : 'Test Results'),
        backgroundColor: themeColor,
        foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
        elevation: 0,
      ),
      body: Consumer<TestProvider>(
        builder: (context, testProvider, child) {
          if (testProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final completedTests = testProvider.completedTests;

          if (completedTests.isEmpty) {
            return _buildEmptyState(context, languageCode, themeColor);
          }

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: ThemeUtils.getScreenGradient(themeColor, brightness),
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        _buildHeader(completedTests.length, languageCode, themeColor, context),
                        const SizedBox(height: 10),
                        _buildSortButton(languageCode, isDark),
                        Expanded(
                          child: _buildResultsList(context, testProvider, completedTests, languageCode, themeColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, String languageCode, Color themeColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark ? [
            themeColor.withOpacity(0.8),
            themeColor.withOpacity(0.4),
            const Color(0xFF121212),
          ] : [
            themeColor,
            themeColor.withOpacity(0.7),
            Colors.white,
          ],
          stops: const [0.0, 0.2, 0.2],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.quiz_outlined,
                size: 80,
                color: isDark ? Colors.grey[400] : Colors.grey,
              ),
              const SizedBox(height: 20),
              Text(
                languageCode == 'ru' ? 'Пока нет результатов' : 'No results yet',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                languageCode == 'ru'
                    ? 'Пройдите тесты, чтобы увидеть результаты здесь'
                    : 'Take tests to see results here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.grey[300] : Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  foregroundColor: ThemeUtils.getButtonTextColor(themeColor),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  languageCode == 'ru' ? 'Перейти к тестам' : 'Go to tests',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(int count, String languageCode, Color themeColor, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.analytics,
              color: themeColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageCode == 'ru' ? 'Ваши результаты' : 'Your Results',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: themeColor,
                  ),
                ),
                Text(
                  '${languageCode == 'ru' ? 'Пройдено тестов' : 'Tests completed'}: $count',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Кнопка саммари
          Consumer<SummaryProvider>(
            builder: (context, summaryProvider, child) {
              final hasEnoughTests = count >= 2; // Минимум 2 теста для саммари
              final isDark = Theme.of(context).brightness == Brightness.dark;

              return ElevatedButton.icon(
                onPressed: hasEnoughTests
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SummaryScreen(),
                          ),
                        );
                      }
                    : null,
                icon: const Icon(
                  Icons.insights,
                  size: 16,
                ),
                label: Text(
                  languageCode == 'ru' ? 'Саммари' : 'Summary',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: hasEnoughTests
                      ? themeColor
                      : Colors.grey.withOpacity(0.3),
                  foregroundColor: hasEnoughTests
                      ? ThemeUtils.getButtonTextColor(themeColor)
                      : Colors.grey,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: hasEnoughTests ? 2 : 0,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSortButton(String languageCode, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            size: 20,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              languageCode == 'ru' ? 'Сортировка:' : 'Sort by:',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SegmentedButton<bool>(
            segments: [
              ButtonSegment<bool>(
                value: true,
                label: Text(
                  languageCode == 'ru' ? 'Новые' : 'Newest',
                  style: const TextStyle(fontSize: 12),
                ),
                icon: const Icon(Icons.arrow_downward, size: 16),
              ),
              ButtonSegment<bool>(
                value: false,
                label: Text(
                  languageCode == 'ru' ? 'Старые' : 'Oldest',
                  style: const TextStyle(fontSize: 12),
                ),
                icon: const Icon(Icons.arrow_upward, size: 16),
              ),
            ],
            selected: {_sortNewestFirst},
            onSelectionChanged: (Set<bool> newSelection) {
              setState(() {
                _sortNewestFirst = newSelection.first;
              });
            },
            style: ButtonStyle(
              textStyle: WidgetStateProperty.all(
                const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList(
    BuildContext context,
    TestProvider testProvider,
    List<TestResult> completedTests,
    String languageCode,
    Color themeColor,
  ) {
    // Сортируем результаты в зависимости от выбранного порядка
    final sortedTests = List<TestResult>.from(completedTests);
    sortedTests.sort((a, b) {
      if (_sortNewestFirst) {
        // От новых к старым (по убыванию даты)
        return b.completedAt.compareTo(a.completedAt);
      } else {
        // От старых к новым (по возрастанию даты)
        return a.completedAt.compareTo(b.completedAt);
      }
    });

    // Если есть достаточно тестов, показать карточку саммари в начале списка
    final showSummaryCard = completedTests.length >= 1;

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: showSummaryCard ? sortedTests.length + 1 : sortedTests.length,
      itemBuilder: (context, index) {
        // Показать карточку саммари первой
        if (showSummaryCard && index == 0) {
          return _buildSummaryCard(context, languageCode, themeColor);
        }

        // Скорректировать индекс для реальных результатов
        final resultIndex = showSummaryCard ? index - 1 : index;
        final result = sortedTests[resultIndex];

        // Try to get test from TestProvider first (for regular tests)
        final test = testProvider.getTestById(result.testId);
        appLogger.d('TestProvider.getTestById(${result.testId}): ${test != null ? "found" : "null"}');

        // If not found in TestProvider, check TestRegistry (for special tests)
        final testStub = test == null ? TestRegistry.getTest(result.testId) : null;
        appLogger.d('TestRegistry.getTest(${result.testId}): ${testStub != null ? "found (${testStub.name})" : "null"}');

        // If test not found in either place, skip it
        if (test == null && testStub == null) {
          appLogger.w('Test not found in both TestProvider and TestRegistry: ${result.testId}');
          return const SizedBox.shrink();
        }

        final brightness = Theme.of(context).brightness;
        final isDark = brightness == Brightness.dark;

        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Card(
            elevation: 3,
            color: ThemeUtils.getCardColor(brightness),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                // Для теста 16 типов используем специальный экран с биполярными шкалами
                if (result.testId == 'sixteen_types') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SixteenTypesResultScreen(result: result),
                    ),
                  );
                } else if (result.testId == 'career_compass_v1') {
                  // Для Career Compass используем специальный экран
                  final careerResult = _createCareerCompassResult(result);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CareerCompassResultScreen(
                        result: careerResult,
                        fromHistory: true, // Don't save again when viewing from history
                      ),
                    ),
                  );
                } else if (result.testId == 'color_psychology_v1') {
                  // Для Color Psychology используем специальный экран
                  final colorResult = _createColorPsychologyResult(result);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ColorPsychologyResultScreen(
                        result: colorResult,
                        fromHistory: true, // Don't save again when viewing from history
                      ),
                    ),
                  );
                } else if (result.testId == 'visual_micro_tests_v1') {
                  // Restore Visual Micro Tests result from JSON and navigate
                  try {
                    final resultJson = jsonDecode(result.interpretation) as Map<String, dynamic>;
                    final visualResult = VisualMicroTestsResult.fromJson(resultJson);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VisualMicroTestsResultScreen(result: visualResult),
                      ),
                    );
                  } catch (e, stackTrace) {
                    appLogger.e('Failed to restore Visual Micro Tests result', error: e, stackTrace: stackTrace);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          languageCode == 'ru'
                              ? 'Ошибка загрузки результатов'
                              : 'Failed to load results',
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestResultScreen(result: result),
                    ),
                  );
                }
              },
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _getScoreColor(result.percentage),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              '${result.percentage.round()}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                test?.getTitle(languageCode) ?? testStub?.getTitle(languageCode) ?? result.testId,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                test?.getCategory(languageCode) ?? _getCategoryName(testStub?.categoryId ?? '', languageCode),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isDark ? Colors.grey[300] : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                            size: 24,
                          ),
                          onPressed: () => _showDeleteConfirmation(
                            context,
                            result,
                            test,
                            testStub,
                            testProvider,
                            languageCode,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: _buildResultItem(
                            languageCode == 'ru' ? 'Баллы' : 'Score',
                            '${result.totalScore}/${result.maxScore}',
                            themeColor,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 30,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        Expanded(
                          child: _buildResultItem(
                            languageCode == 'ru' ? 'Дата' : 'Date',
                            _formatDate(result.completedAt),
                            Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: result.percentage / 100,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getScoreColor(result.percentage),
                      ),
                      minHeight: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildResultItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(BuildContext context, String languageCode, Color themeColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardTextColor = isDark ? themeColor : ThemeUtils.getButtonTextColor(themeColor);
    final cardBgColor = isDark ? themeColor.withOpacity(0.15) : themeColor;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Card(
        elevation: 3,
        color: cardBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SummaryScreen(),
              ),
            );
          },
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isDark ? themeColor : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.insights,
                    color: isDark ? Colors.white : themeColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageCode == 'ru' ? 'Общее саммари' : 'Overall Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: cardTextColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        languageCode == 'ru'
                            ? 'Анализ всех пройденных тестов в едином отчёте'
                            : 'Analysis of all completed tests in one report',
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark ? Colors.grey[600] : cardTextColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: cardTextColor,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getScoreColor(double percentage) {
    if (percentage >= 80) return Colors.green;
    if (percentage >= 60) return Colors.orange;
    if (percentage >= 40) return Colors.amber;
    return Colors.red;
  }

  /// Creates CareerCompassResult from saved TestResult
  CareerCompassResult _createCareerCompassResult(TestResult result) {
    // Extract scale scores from factorScores
    final scaleScores = <String, int>{};
    final scalePercentages = <String, double>{};

    if (result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        scaleScores[entry.key] = entry.value.score;
        scalePercentages[entry.key] = entry.value.percentage;
      }
    }

    // Fallback to scaleScores if available
    if (scaleScores.isEmpty && result.scaleScores != null) {
      for (final entry in result.scaleScores!.entries) {
        scalePercentages[entry.key] = entry.value;
        // Convert percentage back to raw score (approximate)
        scaleScores[entry.key] = ((entry.value / 100) * CareerCompassConfig.maxScaleScore).round();
      }
    }

    return CareerCompassResult.fromSavedResult(
      scaleScores: scaleScores,
      scalePercentages: scalePercentages,
      completedAt: result.completedAt,
    );
  }

  /// Creates ColorPsychologyResult from saved TestResult
  ColorPsychologyResult _createColorPsychologyResult(TestResult result) {
    // Extract scale scores
    final scaleScores = <String, double>{};
    final interpretations = <String, String>{};
    final patterns = <String>[];

    // Use scaleScores if available
    if (result.scaleScores != null) {
      for (final entry in result.scaleScores!.entries) {
        scaleScores[entry.key] = entry.value;
      }
    }

    // Fallback to factorScores if scaleScores empty
    if (scaleScores.isEmpty && result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        scaleScores[entry.key] = entry.value.percentage;
        // Extract interpretation from factorScores
        final interp = entry.value.getInterpretation('ru');
        if (interp.isNotEmpty) {
          interpretations[entry.key] = interp;
        }
      }
    }

    // Try to extract patterns from interpretation string
    if (result.interpretation.isNotEmpty && result.interpretation != 'Анализ завершён') {
      patterns.addAll(result.interpretation.split(', ').map((name) => _patternNameToId(name)));
    }

    return ColorPsychologyResult(
      testId: result.testId,
      scaleScores: scaleScores,
      interpretations: interpretations,
      patterns: patterns,
      completedAt: result.completedAt,
    );
  }

  /// Convert pattern name back to ID
  String _patternNameToId(String name) {
    switch (name) {
      case 'Выгорание':
        return 'burnout_pattern';
      case 'Компенсация стресса':
        return 'stress_compensation';
      case 'Эмоциональное отключение':
        return 'emotional_shutdown';
      case 'Тревожность':
        return 'anxiety_pattern';
      case 'Депрессивные признаки':
        return 'depression_indicators';
      case 'Гармония':
        return 'healthy_balance';
      case 'Потребность в заботе':
        return 'need_for_warmth';
      default:
        return name;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year}';
  }

  /// Get category name from category ID
  String _getCategoryName(String categoryId, String languageCode) {
    // Map category IDs to localized names
    const categoryNames = {
      'visual': {'ru': 'Визуальное', 'en': 'Visual'},
      'personality': {'ru': 'Личность', 'en': 'Personality'},
      'emotional': {'ru': 'Эмоциональное', 'en': 'Emotional'},
      'professional': {'ru': 'Профессиональное', 'en': 'Professional'},
      'cognitive': {'ru': 'Когнитивное', 'en': 'Cognitive'},
      'relationships': {'ru': 'Отношения', 'en': 'Relationships'},
      'creativity': {'ru': 'Креативность', 'en': 'Creativity'},
    };

    final names = categoryNames[categoryId];
    if (names != null) {
      return names[languageCode] ?? names['en'] ?? categoryId;
    }
    return categoryId;
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    TestResult result,
    TestModel? test,
    dynamic testStub,
    TestProvider testProvider,
    String languageCode,
  ) async {
    final testTitle = test?.getTitle(languageCode) ?? testStub?.getTitle(languageCode) ?? result.testId;

    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          languageCode == 'ru' ? 'Удалить результат?' : 'Delete Result?',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          languageCode == 'ru'
              ? 'Вы уверены, что хотите удалить результат теста "$testTitle"?'
              : 'Are you sure you want to delete the result of "$testTitle"?',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              languageCode == 'ru' ? 'Отмена' : 'Cancel',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              languageCode == 'ru' ? 'Удалить' : 'Delete',
            ),
          ),
        ],
      ),
    );

    if (shouldDelete == true) {
      await testProvider.deleteTestResult(result);
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              languageCode == 'ru'
                  ? 'Результат удален'
                  : 'Result deleted',
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    }
  }
}
