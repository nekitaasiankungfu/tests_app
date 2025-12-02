import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/color_psychology_model.dart';
import '../models/test_model.dart';
import '../data/color_psychology_data.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../providers/test_provider.dart';
import '../utils/app_logger.dart';
import '../config/summary/question_weights/color_psychology_weights.dart';

/// Экран результатов цветового психологического теста (расширенная версия)
///
/// Отображает:
/// - 12 психологических шкал (energy, stress, balance, openness, control, satisfaction,
///   defensiveness, change, optimism, social_connection, self_esteem, future_orientation)
/// - Выявленные паттерны
/// - Результаты всех 6 этапов:
///   1. Быстрый выбор (liked/disliked цвета)
///   2. Ранжирование (полная последовательность предпочтений)
///   3. Парные сравнения (топ-5 цветов по победам)
///   4. Эмоциональные ассоциации (8 базовых эмоций)
///   5. Жизненные сферы (6 сфер + 4 ситуации)
///   6. Временная перспектива (прошлое/настоящее/будущее/идеал/страх)
/// - Метрики согласованности выборов
/// - Интерпретации и рекомендации
///
/// @author: Color Psychology Research Institute
/// @version: 2.1.0 (Extended + Save to history)

class ColorPsychologyResultScreen extends StatefulWidget {
  final ColorPsychologyResult result;

  /// If true, viewing from history - don't save again
  final bool fromHistory;

  const ColorPsychologyResultScreen({
    super.key,
    required this.result,
    this.fromHistory = false,
  });

  @override
  State<ColorPsychologyResultScreen> createState() => _ColorPsychologyResultScreenState();
}

class _ColorPsychologyResultScreenState extends State<ColorPsychologyResultScreen> {
  bool _resultSaved = false;

  @override
  void initState() {
    super.initState();
    // Save result after first frame, but only if not viewing from history
    if (!widget.fromHistory) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _saveResult();
      });
    }
  }

  Future<void> _saveResult() async {
    if (_resultSaved || widget.fromHistory) return;

    try {
      final testProvider = context.read<TestProvider>();

      // Convert ColorPsychologyResult to standard TestResult
      final testResult = _convertToTestResult(widget.result);

      final success = await testProvider.saveTestResult(testResult);
      if (success) {
        _resultSaved = true;
        appLogger.i('Color Psychology result saved successfully');
      } else {
        appLogger.e('Failed to save Color Psychology result');
      }
    } catch (e, stackTrace) {
      appLogger.e('Error saving Color Psychology result', error: e, stackTrace: stackTrace);
    }
  }

  /// Convert ColorPsychologyResult to standard TestResult for storage
  TestResult _convertToTestResult(ColorPsychologyResult result) {
    // Calculate total score as average of all scale scores (0-100)
    final totalScore = result.scaleScores.isNotEmpty
        ? (result.scaleScores.values.reduce((a, b) => a + b) / result.scaleScores.length).round()
        : 50;
    const maxScore = 100;

    // Create factor scores for each scale
    final factorScores = <String, FactorScore>{};
    for (final entry in result.scaleScores.entries) {
      final scale = ColorPsychologyData.getScaleById(entry.key);

      factorScores[entry.key] = FactorScore(
        factorId: entry.key,
        factorName: scale?.name ?? {'ru': entry.key, 'en': entry.key},
        score: entry.value.round(),
        maxScore: 100,
        interpretation: {
          'ru': result.interpretations[entry.key] ?? '',
          'en': result.interpretations[entry.key] ?? '',
        },
      );
    }

    // Create userAnswers for summary integration
    // Each scale becomes a "question" with normalized score (0-4)
    // This allows Color Psychology to contribute to personality type calculation
    final userAnswers = <String, int>{};
    for (final entry in result.scaleScores.entries) {
      // Normalize: 0-100 -> 0-4
      final normalizedScore = ((entry.value / 100.0) * 4).round().clamp(0, 4);
      userAnswers['scale_${entry.key}'] = normalizedScore;
    }

    // Calculate hierarchical scale scores using weights
    // This maps Color Psychology's 12 scales to the 195 hierarchical summary scales
    // Also builds questionContributions for Summary screen transparency
    final (hierarchicalScaleScores, questionContributions) = _calculateHierarchicalScaleScoresWithContributions(result.testId, result.scaleScores);
    appLogger.d('Color Psychology: Calculated ${hierarchicalScaleScores.length} hierarchical scale scores');
    appLogger.d('Color Psychology: Created questionContributions for ${questionContributions.length} scales');

    // Create interpretation text based on patterns
    String interpretation;
    if (result.patterns.isNotEmpty) {
      final patternNames = result.patterns.map((p) => _getPatternName(p)).join(', ');
      interpretation = patternNames;
    } else {
      interpretation = 'Анализ завершён';
    }

    return TestResult(
      testId: result.testId,
      totalScore: totalScore,
      maxScore: maxScore,
      interpretation: interpretation,
      completedAt: result.completedAt,
      factorScores: factorScores,
      scaleScores: hierarchicalScaleScores, // Use hierarchical scales for Summary integration
      userAnswers: userAnswers,
      questionContributions: questionContributions, // For Summary screen transparency
      version: 2,
    );
  }

  /// Calculate hierarchical scale scores from Color Psychology scales using weights
  ///
  /// Maps 12 Color Psychology scales (energy_level, stress_level, etc.) to
  /// 195 hierarchical summary scales using weights defined in ColorPsychologyWeights.
  ///
  /// Returns a tuple of (scaleScores, questionContributions) for Summary screen transparency.
  (Map<String, double>, Map<String, List<QuestionContribution>>) _calculateHierarchicalScaleScoresWithContributions(
    String testId,
    Map<String, double> colorPsychologyScales,
  ) {
    final hierarchicalScores = <String, double>{};
    final hierarchicalWeights = <String, double>{};
    final questionContributions = <String, List<QuestionContribution>>{};

    // Process each Color Psychology scale
    for (final entry in colorPsychologyScales.entries) {
      final colorScaleId = entry.key;
      final colorScaleScore = entry.value; // 0-100

      // Normalize to 0-1 range for weight calculation
      final normalizedScore = colorScaleScore / 100.0;

      // Find weights for this Color Psychology scale
      final weightKey = '$testId:scale_$colorScaleId';
      final questionWeight = ColorPsychologyWeights.weights[weightKey];

      if (questionWeight == null) {
        appLogger.w('No weights found for Color Psychology scale: $colorScaleId (key: $weightKey)');
        continue;
      }

      // Get scale name for display
      final scale = ColorPsychologyData.getScaleById(colorScaleId);
      final scaleName = scale?.name ?? {'ru': colorScaleId, 'en': colorScaleId};

      // Apply weights to hierarchical scales
      questionWeight.axisWeights.forEach((hierarchicalScaleId, weight) {
        // Calculate contribution: normalized score * weight
        // If weight is negative, invert the score (e.g., high stress -> low calmness)
        final direction = weight < 0 ? -1 : 1;
        final absWeight = weight.abs();

        double contribution;
        if (direction == -1) {
          // Inverted: high source score -> low target score
          contribution = (1.0 - normalizedScore) * absWeight * 100;
        } else {
          // Direct: high source score -> high target score
          contribution = normalizedScore * absWeight * 100;
        }

        // Accumulate weighted scores
        hierarchicalScores[hierarchicalScaleId] =
            (hierarchicalScores[hierarchicalScaleId] ?? 0.0) + contribution;
        hierarchicalWeights[hierarchicalScaleId] =
            (hierarchicalWeights[hierarchicalScaleId] ?? 0.0) + absWeight;

        // Add to questionContributions for transparency
        // Color Psychology scales are treated as "questions" in the summary
        questionContributions.putIfAbsent(hierarchicalScaleId, () => []);
        questionContributions[hierarchicalScaleId]!.add(QuestionContribution(
          questionId: 'scale_$colorScaleId',
          questionText: scaleName,
          answerScore: colorScaleScore.round(),
          maxAnswerScore: 100,
          weight: weight, // Keep original weight (with sign) for display
          normalizedContribution: contribution / absWeight, // Single contribution before averaging
        ));
      });
    }

    // Normalize by total weight for each scale
    final normalizedScores = <String, double>{};
    hierarchicalScores.forEach((scaleId, totalScore) {
      final totalWeight = hierarchicalWeights[scaleId] ?? 1.0;
      if (totalWeight > 0) {
        normalizedScores[scaleId] = (totalScore / totalWeight).clamp(0.0, 100.0);
      }
    });

    appLogger.d('Mapped ${colorPsychologyScales.length} Color Psychology scales to ${normalizedScores.length} hierarchical scales');

    return (normalizedScores, questionContributions);
  }

  String _getPatternName(String patternId) {
    switch (patternId) {
      case 'burnout_pattern':
        return 'Выгорание';
      case 'stress_compensation':
        return 'Компенсация стресса';
      case 'emotional_shutdown':
        return 'Эмоциональное отключение';
      case 'anxiety_pattern':
        return 'Тревожность';
      case 'depression_indicators':
        return 'Депрессивные признаки';
      case 'healthy_balance':
        return 'Гармония';
      case 'need_for_warmth':
        return 'Потребность в заботе';
      default:
        return patternId;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRussian = context.watch<LocaleProvider>().isRussian;
    final isDarkMode = context.watch<UserPreferencesProvider>().isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isRussian ? 'Результаты теста' : 'Test Results',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO: Implement sharing
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            _buildHeader(context, isRussian),
            const SizedBox(height: 24),

            // Психологические шкалы
            _buildScalesSection(context, isRussian),
            const SizedBox(height: 24),

            // Выявленные паттерны
            if (widget.result.patterns.isNotEmpty) ...[
              _buildPatternsSection(context, isRussian),
              const SizedBox(height: 24),
            ],

            // Цветовые предпочтения
            _buildColorPreferencesSection(context, isRussian),
            const SizedBox(height: 24),

            // Парные сравнения (stage 3)
            if (widget.result.pairedComparisons != null) ...[
              _buildPairedComparisonsSection(context, isRussian),
              const SizedBox(height: 24),
            ],

            // Эмоциональные ассоциации (stage 4)
            if (widget.result.emotionalAssociations != null) ...[
              _buildEmotionalAssociationsSection(context, isRussian),
              const SizedBox(height: 24),
            ],

            // Жизненные сферы (stage 5)
            if (widget.result.lifeDomains != null) ...[
              _buildLifeDomainsSection(context, isRussian),
              const SizedBox(height: 24),
            ],

            // Временная перспектива (stage 6)
            if (widget.result.temporalPerspective != null) ...[
              _buildTemporalPerspectiveSection(context, isRussian),
              const SizedBox(height: 24),
            ],

            // Метрики согласованности
            if (widget.result.consistencyMetrics.isNotEmpty) ...[
              _buildConsistencyMetricsSection(context, isRussian),
              const SizedBox(height: 24),
            ],

            // Рекомендации
            _buildRecommendationsSection(context, isRussian),
            const SizedBox(height: 24),

            // Кнопка завершения
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text(
                  isRussian ? 'Завершить' : 'Finish',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isRussian) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isRussian
                  ? 'Цветовая психология: Диагностика эмоционального состояния'
                  : 'Color Psychology: Emotional State Diagnosis',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              isRussian
                  ? 'Тест пройден: ${_formatDate(widget.result.completedAt, isRussian)}'
                  : 'Test completed: ${_formatDate(widget.result.completedAt, isRussian)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScalesSection(BuildContext context, bool isRussian) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.assessment, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                Text(
                  isRussian ? 'Психологические шкалы' : 'Psychological Scales',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...widget.result.scaleScores.entries.map((entry) {
              final scale = ColorPsychologyData.getScaleById(entry.key);
              if (scale == null) return const SizedBox();

              return _buildScaleItem(
                context,
                scale.name[isRussian ? 'ru' : 'en']!,
                entry.value,
                widget.result.interpretations[entry.key] ?? '',
                _getScaleColor(entry.key, entry.value),
                isRussian,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildScaleItem(
    BuildContext context,
    String name,
    double value,
    String interpretation,
    Color color,
    bool isRussian,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '${value.toStringAsFixed(0)}%',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: value / 100,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
          const SizedBox(height: 4),
          Text(
            interpretation,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Color _getScaleColor(String scaleId, double value) {
    switch (scaleId) {
      case 'energy_level':
        if (value <= 20) return Colors.red;
        if (value <= 40) return Colors.orange;
        if (value <= 60) return Colors.amber;
        if (value <= 80) return Colors.lightGreen;
        return Colors.green;

      case 'stress_level':
        if (value <= 25) return Colors.green;
        if (value <= 50) return Colors.amber;
        if (value <= 75) return Colors.orange;
        return Colors.red;

      case 'emotional_balance':
      case 'satisfaction':
        if (value <= 40) return Colors.red;
        if (value <= 70) return Colors.amber;
        return Colors.green;

      case 'defensiveness':
      case 'need_for_change':
        if (value <= 40) return Colors.green;
        if (value <= 70) return Colors.amber;
        return Colors.orange;

      default:
        if (value <= 40) return Colors.orange;
        if (value <= 70) return Colors.blue;
        return Colors.green;
    }
  }

  Widget _buildPatternsSection(BuildContext context, bool isRussian) {
    return Card(
      color: _getPatternCardColor(context, widget.result.patterns),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.psychology,
                  color: _getPatternIconColor(widget.result.patterns),
                ),
                const SizedBox(width: 12),
                Text(
                  isRussian ? 'Выявленные паттерны' : 'Detected Patterns',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...widget.result.patterns.map((patternId) {
              return _buildPatternItem(context, patternId, isRussian);
            }),
          ],
        ),
      ),
    );
  }

  Color _getPatternCardColor(BuildContext context, List<String> patterns) {
    if (patterns.contains('depression_indicators') ||
        patterns.contains('emotional_shutdown')) {
      return Colors.red.withOpacity(0.1);
    }
    if (patterns.contains('burnout_pattern') ||
        patterns.contains('stress_compensation')) {
      return Colors.orange.withOpacity(0.1);
    }
    if (patterns.contains('anxiety_pattern')) {
      return Colors.amber.withOpacity(0.1);
    }
    if (patterns.contains('healthy_balance')) {
      return Colors.green.withOpacity(0.1);
    }
    return Theme.of(context).cardColor;
  }

  Color _getPatternIconColor(List<String> patterns) {
    if (patterns.contains('depression_indicators') ||
        patterns.contains('emotional_shutdown')) {
      return Colors.red;
    }
    if (patterns.contains('burnout_pattern') ||
        patterns.contains('stress_compensation')) {
      return Colors.orange;
    }
    if (patterns.contains('anxiety_pattern')) {
      return Colors.amber;
    }
    if (patterns.contains('healthy_balance')) {
      return Colors.green;
    }
    return Colors.blue;
  }

  Widget _buildPatternItem(BuildContext context, String patternId, bool isRussian) {
    final patternInfo = _getPatternInfo(patternId, isRussian);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                _getPatternIcon(patternId),
                size: 20,
                color: _getPatternColor(patternId),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patternInfo['name']!,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      patternInfo['description']!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Map<String, String> _getPatternInfo(String patternId, bool isRussian) {
    final patterns = {
      'burnout_pattern': {
        'ru': {
          'name': 'Паттерн выгорания',
          'description':
              'Истощение, эмоциональное опустошение, потребность в отдыхе и восстановлении.',
        },
        'en': {
          'name': 'Burnout Pattern',
          'description': 'Exhaustion, emotional depletion, need for rest and recovery.',
        },
      },
      'stress_compensation': {
        'ru': {
          'name': 'Компенсаторный паттерн',
          'description':
              'Попытка компенсировать истощение активностью. Риск ещё большего истощения.',
        },
        'en': {
          'name': 'Compensatory Pattern',
          'description':
              'Attempting to compensate exhaustion with activity. Risk of further depletion.',
        },
      },
      'emotional_shutdown': {
        'ru': {
          'name': 'Эмоциональное отключение',
          'description':
              'Защита от эмоций через дистанцирование. Может быть признаком депрессии.',
        },
        'en': {
          'name': 'Emotional Shutdown',
          'description':
              'Protection from emotions through distancing. May be a sign of depression.',
        },
      },
      'anxiety_pattern': {
        'ru': {
          'name': 'Тревожный паттерн',
          'description': 'Гиперактивация, возбуждение, тревожность, потеря контроля.',
        },
        'en': {
          'name': 'Anxiety Pattern',
          'description': 'Hyperactivation, agitation, anxiety, loss of control.',
        },
      },
      'depression_indicators': {
        'ru': {
          'name': 'Депрессивные признаки',
          'description':
              'Апатия, эмоциональное опустошение, потеря интереса. Требуется консультация специалиста.',
        },
        'en': {
          'name': 'Depression Indicators',
          'description':
              'Apathy, emotional emptiness, loss of interest. Professional consultation needed.',
        },
      },
      'healthy_balance': {
        'ru': {
          'name': 'Гармоничный паттерн',
          'description': 'Баланс, стабильность, контроль. Здоровое психологическое состояние.',
        },
        'en': {
          'name': 'Healthy Balance',
          'description': 'Balance, stability, control. Healthy psychological state.',
        },
      },
      'need_for_warmth': {
        'ru': {
          'name': 'Потребность в заботе',
          'description': 'Потребность в тепле, заботе, нежности. Возможно, чувство уязвимости.',
        },
        'en': {
          'name': 'Need for Care',
          'description': 'Need for warmth, care, tenderness. Possible feeling of vulnerability.',
        },
      },
    };

    final locale = isRussian ? 'ru' : 'en';
    return patterns[patternId]?[locale] ??
        {
          'name': patternId,
          'description': '',
        };
  }

  IconData _getPatternIcon(String patternId) {
    switch (patternId) {
      case 'burnout_pattern':
        return Icons.battery_alert;
      case 'stress_compensation':
        return Icons.sync_problem;
      case 'emotional_shutdown':
        return Icons.block;
      case 'anxiety_pattern':
        return Icons.warning_amber;
      case 'depression_indicators':
        return Icons.sentiment_very_dissatisfied;
      case 'healthy_balance':
        return Icons.check_circle;
      case 'need_for_warmth':
        return Icons.favorite;
      default:
        return Icons.info;
    }
  }

  Color _getPatternColor(String patternId) {
    switch (patternId) {
      case 'burnout_pattern':
      case 'stress_compensation':
        return Colors.orange;
      case 'emotional_shutdown':
      case 'depression_indicators':
        return Colors.red;
      case 'anxiety_pattern':
        return Colors.amber;
      case 'healthy_balance':
        return Colors.green;
      case 'need_for_warmth':
        return Colors.pink;
      default:
        return Colors.blue;
    }
  }

  Widget _buildColorPreferencesSection(BuildContext context, bool isRussian) {
    if (widget.result.ranking == null) return const SizedBox();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.palette, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                Text(
                  isRussian ? 'Цветовые предпочтения' : 'Color Preferences',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Топ-3 любимых
            Text(
              isRussian ? 'Предпочитаемые цвета (топ-3):' : 'Preferred colors (top 3):',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            _buildColorList(
              context,
              widget.result.ranking!.rankedColors.take(3).toList(),
              isRussian,
              true,
            ),
            const SizedBox(height: 16),
            // Топ-3 нелюбимых
            Text(
              isRussian ? 'Отвергаемые цвета (последние 3):' : 'Rejected colors (last 3):',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            _buildColorList(
              context,
              widget.result.ranking!.rankedColors
                  .skip(widget.result.ranking!.rankedColors.length - 3)
                  .toList(),
              isRussian,
              false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorList(
    BuildContext context,
    List<String> colorIds,
    bool isRussian,
    bool isPositive,
  ) {
    return Column(
      children: colorIds.map((colorId) {
        final color = ColorPsychologyData.getColorById(colorId);
        if (color == null) return const SizedBox();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Color(int.parse(color.hex.replaceFirst('#', '0xFF'))),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      color.name[isRussian ? 'ru' : 'en']!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      isPositive
                          ? color.positiveAssociations[isRussian ? 'ru' : 'en']!
                          : color.negativeAssociations[isRussian ? 'ru' : 'en']!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPairedComparisonsSection(BuildContext context, bool isRussian) {
    final pairedComparisons = widget.result.pairedComparisons!;

    // Сортируем цвета по количеству побед
    final sortedWins = pairedComparisons.wins.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.compare, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                Text(
                  isRussian ? 'Парные сравнения' : 'Paired Comparisons',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              isRussian
                  ? 'Результаты выбора предпочитаемого цвета из 20 пар:'
                  : 'Results of choosing preferred color from 20 pairs:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ...sortedWins.take(5).map((entry) {
              final color = ColorPsychologyData.getColorById(entry.key);
              if (color == null) return const SizedBox();

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(int.parse(color.hex.replaceFirst('#', '0xFF'))),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        color.name[isRussian ? 'ru' : 'en']!,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${entry.value} ${isRussian ? 'побед' : 'wins'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildEmotionalAssociationsSection(BuildContext context, bool isRussian) {
    final emotionalAssociations = widget.result.emotionalAssociations!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.sentiment_satisfied, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                Text(
                  isRussian ? 'Эмоциональные ассоциации' : 'Emotional Associations',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              isRussian
                  ? 'Цвета, которые вы ассоциируете с базовыми эмоциями:'
                  : 'Colors you associate with basic emotions:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ...emotionalAssociations.emotions.entries.map((entry) {
              final emotionData = ColorPsychologyData.emotionalAssociations
                  .firstWhere((e) => e['id'] == entry.key);
              final color = ColorPsychologyData.getColorById(entry.value);
              if (color == null) return const SizedBox();

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  children: [
                    Icon(
                      _getEmotionIcon(entry.key),
                      size: 24,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        emotionData[isRussian ? 'ru' : 'en']!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(int.parse(color.hex.replaceFirst('#', '0xFF'))),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      color.name[isRussian ? 'ru' : 'en']!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  IconData _getEmotionIcon(String emotionId) {
    switch (emotionId) {
      case 'joy':
        return Icons.sentiment_very_satisfied;
      case 'sadness':
        return Icons.sentiment_very_dissatisfied;
      case 'anger':
        return Icons.local_fire_department;
      case 'fear':
        return Icons.warning_amber;
      case 'surprise':
        return Icons.star;
      case 'disgust':
        return Icons.block;
      case 'love':
        return Icons.favorite;
      case 'calm':
        return Icons.spa;
      default:
        return Icons.circle;
    }
  }

  Widget _buildLifeDomainsSection(BuildContext context, bool isRussian) {
    final lifeDomains = widget.result.lifeDomains!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_tree, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                Text(
                  isRussian ? 'Жизненные сферы' : 'Life Domains',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Сферы жизни
            Text(
              isRussian ? 'Сферы жизни:' : 'Life domains:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...lifeDomains.domains.entries.map((entry) {
              final domainData = ColorPsychologyData.lifeDomainQuestions
                  .firstWhere((q) => q['id'] == entry.key);
              final color = ColorPsychologyData.getColorById(entry.value);
              if (color == null) return const SizedBox();

              return _buildDomainItem(context, domainData, color, isRussian);
            }),

            const SizedBox(height: 16),

            // Ситуации
            Text(
              isRussian ? 'Ситуации:' : 'Situations:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...lifeDomains.situations.entries.map((entry) {
              final situationData = ColorPsychologyData.lifeDomainQuestions
                  .firstWhere((q) => q['id'] == entry.key);
              final color = ColorPsychologyData.getColorById(entry.value);
              if (color == null) return const SizedBox();

              return _buildDomainItem(context, situationData, color, isRussian);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDomainItem(
    BuildContext context,
    Map<String, dynamic> domainData,
    ColorInfo color,
    bool isRussian,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            _getDomainIcon(domainData['id'] as String),
            size: 20,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              domainData[isRussian ? 'ru' : 'en']!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Color(int.parse(color.hex.replaceFirst('#', '0xFF'))),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            color.name[isRussian ? 'ru' : 'en']!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  IconData _getDomainIcon(String domainId) {
    switch (domainId) {
      case 'family':
        return Icons.family_restroom;
      case 'career':
        return Icons.work;
      case 'relationships':
        return Icons.favorite;
      case 'health':
        return Icons.favorite_border;
      case 'creativity':
        return Icons.palette;
      case 'leisure':
        return Icons.sports_esports;
      case 'success':
        return Icons.emoji_events;
      case 'conflict':
        return Icons.warning;
      case 'change':
        return Icons.autorenew;
      case 'loneliness':
        return Icons.person_outline;
      default:
        return Icons.circle;
    }
  }

  Widget _buildTemporalPerspectiveSection(BuildContext context, bool isRussian) {
    final temporalPerspective = widget.result.temporalPerspective!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.timeline, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                Text(
                  isRussian ? 'Временная перспектива' : 'Temporal Perspective',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              isRussian
                  ? 'Как вы воспринимаете различные временные периоды:'
                  : 'How you perceive different time periods:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            _buildTemporalItem(
              context,
              'past',
              isRussian ? 'Ваше прошлое' : 'Your past',
              temporalPerspective.past,
              Icons.history,
              Colors.grey,
              isRussian,
            ),
            _buildTemporalItem(
              context,
              'present',
              isRussian ? 'Ваше настоящее' : 'Your present',
              temporalPerspective.present,
              Icons.circle,
              Colors.blue,
              isRussian,
            ),
            _buildTemporalItem(
              context,
              'future',
              isRussian ? 'Ваше будущее' : 'Your future',
              temporalPerspective.future,
              Icons.arrow_forward,
              Colors.green,
              isRussian,
            ),
            _buildTemporalItem(
              context,
              'ideal_self',
              isRussian ? 'Идеальное "Я"' : 'Ideal self',
              temporalPerspective.idealSelf,
              Icons.star,
              Colors.amber,
              isRussian,
            ),
            _buildTemporalItem(
              context,
              'fear_self',
              isRussian ? 'Чего боитесь стать' : 'What you fear becoming',
              temporalPerspective.fearSelf,
              Icons.warning,
              Colors.red,
              isRussian,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemporalItem(
    BuildContext context,
    String perspectiveId,
    String label,
    String colorId,
    IconData icon,
    Color iconColor,
    bool isRussian,
  ) {
    final color = ColorPsychologyData.getColorById(colorId);
    if (color == null) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 24, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color(int.parse(color.hex.replaceFirst('#', '0xFF'))),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            color.name[isRussian ? 'ru' : 'en']!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildConsistencyMetricsSection(BuildContext context, bool isRussian) {
    return Card(
      color: Colors.purple.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.analytics, color: Colors.purple),
                const SizedBox(width: 12),
                Text(
                  isRussian ? 'Согласованность выборов' : 'Choice Consistency',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              isRussian
                  ? 'Насколько последовательны ваши ответы в разных этапах:'
                  : 'How consistent your answers are across different stages:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ...widget.result.consistencyMetrics.entries.map((entry) {
              return _buildConsistencyItem(
                context,
                _getConsistencyLabel(entry.key, isRussian),
                entry.value,
                isRussian,
              );
            }),
          ],
        ),
      ),
    );
  }

  String _getConsistencyLabel(String metricId, bool isRussian) {
    final labels = {
      'quick_vs_ranking': {
        'ru': 'Быстрый выбор ↔ Ранжирование',
        'en': 'Quick choice ↔ Ranking',
      },
      'ranking_vs_paired': {
        'ru': 'Ранжирование ↔ Парные сравнения',
        'en': 'Ranking ↔ Paired comparisons',
      },
      'overall_consistency': {
        'ru': 'Общая согласованность',
        'en': 'Overall consistency',
      },
    };

    return labels[metricId]?[isRussian ? 'ru' : 'en'] ?? metricId;
  }

  Widget _buildConsistencyItem(
    BuildContext context,
    String label,
    double value,
    bool isRussian,
  ) {
    final color = value >= 0.7
        ? Colors.green
        : value >= 0.5
            ? Colors.amber
            : Colors.orange;

    final interpretation = value >= 0.7
        ? (isRussian ? 'Высокая' : 'High')
        : value >= 0.5
            ? (isRussian ? 'Средняя' : 'Medium')
            : (isRussian ? 'Низкая' : 'Low');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Text(
                '${(value * 100).toStringAsFixed(0)}% ($interpretation)',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: value,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationsSection(BuildContext context, bool isRussian) {
    final recommendations = _getRecommendations(widget.result, isRussian);

    return Card(
      color: Colors.blue.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.lightbulb, color: Colors.amber),
                const SizedBox(width: 12),
                Text(
                  isRussian ? 'Рекомендации' : 'Recommendations',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...recommendations.map((rec) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle, size: 20, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        rec,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  List<String> _getRecommendations(ColorPsychologyResult result, bool isRussian) {
    final recommendations = <String>[];

    // Основываясь на паттернах
    if (result.patterns.contains('burnout_pattern')) {
      recommendations.add(
        isRussian
            ? 'Срочно необходим отдых и восстановление'
            : 'Urgent rest and recovery needed',
      );
    }

    if (result.patterns.contains('anxiety_pattern')) {
      recommendations.add(
        isRussian
            ? 'Практикуйте техники релаксации и mindfulness'
            : 'Practice relaxation and mindfulness techniques',
      );
    }

    if (result.patterns.contains('depression_indicators')) {
      recommendations.add(
        isRussian
            ? 'Рекомендуется консультация с психологом или психотерапевтом'
            : 'Consultation with a psychologist or psychotherapist is recommended',
      );
    }

    // Основываясь на шкалах
    if (result.scaleScores['energy_level']! < 30) {
      recommendations.add(
        isRussian
            ? 'Обратите внимание на качество сна и питания'
            : 'Pay attention to sleep quality and nutrition',
      );
    }

    if (result.scaleScores['stress_level']! > 70) {
      recommendations.add(
        isRussian
            ? 'Снизьте нагрузку и введите ежедневные практики релаксации'
            : 'Reduce workload and introduce daily relaxation practices',
      );
    }

    if (result.scaleScores['emotional_balance']! < 40) {
      recommendations.add(
        isRussian
            ? 'Практикуйте эмоциональную регуляцию и журналирование'
            : 'Practice emotional regulation and journaling',
      );
    }

    // Если все хорошо
    if (result.patterns.contains('healthy_balance')) {
      recommendations.add(
        isRussian
            ? 'Поддерживайте текущий баланс и практики благополучия'
            : 'Maintain current balance and well-being practices',
      );
    }

    // Дефолтная рекомендация
    if (recommendations.isEmpty) {
      recommendations.add(
        isRussian
            ? 'Регулярно отслеживайте своё состояние и обращайтесь за помощью при необходимости'
            : 'Regularly monitor your state and seek help when needed',
      );
    }

    return recommendations;
  }

  String _formatDate(DateTime date, bool isRussian) {
    final months = isRussian
        ? [
            'января',
            'февраля',
            'марта',
            'апреля',
            'мая',
            'июня',
            'июля',
            'августа',
            'сентября',
            'октября',
            'ноября',
            'декабря'
          ]
        : [
            'January',
            'February',
            'March',
            'April',
            'May',
            'June',
            'July',
            'August',
            'September',
            'October',
            'November',
            'December'
          ];

    if (isRussian) {
      return '${date.day} ${months[date.month - 1]} ${date.year} г., ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } else {
      return '${months[date.month - 1]} ${date.day}, ${date.year}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    }
  }
}