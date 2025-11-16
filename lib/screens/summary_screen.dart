import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../providers/summary_provider.dart';
import '../providers/locale_provider.dart';
import '../providers/test_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../widgets/summary_charts.dart';
import '../config/summary_config.dart';
import '../config/bipolar_scales.dart';
import '../models/summary_model.dart';
import '../models/test_model.dart';
import '../utils/theme_utils.dart';
import '../utils/app_logger.dart';
import '../constants/color_constants.dart';
import '../data/sixteen_types_data.dart';
import '../data/ipip_big_five_data.dart';
import '../data/fisher_temperament_data.dart';
import '../data/love_profile_data.dart';
import '../data/stress_test_data.dart';
import '../data/self_esteem_test_data.dart';
import '../data/temperament_profile_test_data.dart';
import '../data/digital_detox_data.dart' as digital_detox;
import '../data/burnout_diagnostic_data.dart' as burnout;
import '../data/social_battery_data.dart';
import '../data/disc_personality_data.dart';
import '../data/holland_code_data.dart';
import '../data/love_languages_data.dart';
import '../data/test_data.dart';
import '../services/summary_service.dart';
import 'test_screen.dart';

/// Helper function to get answer text from test data
String _getAnswerText(String testId, String questionId, int answerScore, String languageCode) {
  try {
    // Get the test data
    TestModel? testModel;

    switch (testId) {
      case 'ipip_big_five':
        testModel = IPIPBigFiveData.getIPIPBigFiveTest();
        break;
      case 'fisher_temperament':
        testModel = FisherTemperamentData.getFisherTemperamentTest();
        break;
      case 'love_profile':
        testModel = LoveProfileData.getLoveProfileTest();
        break;
      case 'sixteen_types':
        testModel = SixteenTypesData.getSixteenTypesTest();
        break;
      case 'stress_test':
        testModel = StressTestData.getStressTest();
        break;
      case 'self_esteem_test':
        testModel = SelfEsteemTestData.getSelfEsteemTest();
        break;
      case 'temperament_profile_test':
        testModel = TemperamentProfileTestData.getTemperamentProfileTest();
        break;
      case 'digital_detox_test':
        testModel = digital_detox.DigitalDetoxTestData.getDigitalDetoxTest();
        break;
      case 'burnout_diagnostic_v1':
        testModel = burnout.BurnoutDiagnosticData.getBurnoutDiagnosticTest();
        break;
      case 'social_battery_v1':
        testModel = SocialBatteryData.getSocialBatteryTest();
        break;
      case 'disc_personality_v1':
        testModel = DISCPersonalityData.getDISCPersonalityTest();
        break;
      case 'holland_code_v1':
        testModel = HollandCodeData.getHollandCodeTest();
        break;
      case 'love_languages_v1':
        testModel = LoveLanguagesData.getLoveLanguagesTest();
        break;
      default:
        appLogger.w('Unknown testId: $testId');
        return answerScore.toString();
    }

    // Find the question by ID
    if (testModel == null) {
      return answerScore.toString();
    }

    final question = testModel.questions.firstWhere(
      (q) => q.id == questionId,
      orElse: () => throw Exception('Question not found: $questionId'),
    );

    // Find the answer by score
    final answer = question.answers.firstWhere(
      (a) => a.score == answerScore,
      orElse: () => throw Exception('Answer not found for score: $answerScore'),
    );

    // Return the text in the current language
    return answer.text[languageCode] ??
           answer.text['ru'] ??
           answerScore.toString();
  } catch (e) {
    appLogger.e('Error loading answer text for $testId:$questionId:$answerScore: $e');
    return answerScore.toString();
  }
}

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  bool _showDetails = false;
  bool _showAllScales = false; // Show all 196 scales including unmeasured ones

  // Service instance for business logic
  final _summaryService = SummaryService();

  @override
  void initState() {
    super.initState();
    // Загрузить саммари при инициализации экрана
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSummary();

      // Добавить слушатель изменения языка
      final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
      localeProvider.addListener(_loadSummary);
    });
  }

  void _loadSummary() {
    final summaryProvider = Provider.of<SummaryProvider>(context, listen: false);
    final testProvider = Provider.of<TestProvider>(context, listen: false);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    // Всегда пересчитываем саммари с текущим языком
    summaryProvider.refreshSummary(testProvider.completedTests, localeProvider.languageCode);
  }

  @override
  void dispose() {
    // Удалить слушатель при уничтожении виджета
    try {
      final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
      localeProvider.removeListener(_loadSummary);
    } catch (e) {
      // Игнорируем ошибки при очистке
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        final languageCode = localeProvider.languageCode;
        final brightness = Theme.of(context).brightness;
        final isDark = brightness == Brightness.dark;
        final themeColor = Theme.of(context).primaryColor;

        // Слушаем изменения языка только один раз в initState

        return Scaffold(
          appBar: AppBar(
            title: Text(languageCode == 'ru' ? 'Общее саммари' : 'Overall Summary'),
            backgroundColor: themeColor,
            foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(_showDetails ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _showDetails = !_showDetails;
                  });
                },
                tooltip: languageCode == 'ru' ? 'Подробности' : 'Details',
              ),
              IconButton(
                icon: const Icon(Icons.code),
                onPressed: () => _showDebugData(context),
                tooltip: 'Debug: Export JSON',
              ),
            ],
          ),
          body: Consumer<SummaryProvider>(
        builder: (context, summaryProvider, child) {
          if (summaryProvider.isLoading || summaryProvider.isCalculating) {
            return _buildLoadingState(languageCode, isDark);
          }

          if (!summaryProvider.hasSummary) {
            return _buildNoSummaryState(languageCode, isDark);
          }

          return _buildSummaryContent(summaryProvider, languageCode, isDark);
        },
      ),
    );
      },
    );
  }

  Widget _buildLoadingState(String languageCode, bool isDark) {
    final themeColor = Theme.of(context).primaryColor;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [themeColor.withOpacity(0.8), themeColor.withOpacity(0.4), AppColors.darkBackground]
              : [AppColors.getLighterShade(themeColor, 0.4), Colors.white.withOpacity(0.95), Colors.white],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(
              languageCode == 'ru' ? 'Рассчитываем саммари...' : 'Calculating summary...',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoSummaryState(String languageCode, bool isDark) {
    final themeColor = Theme.of(context).primaryColor;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [themeColor.withOpacity(0.8), themeColor.withOpacity(0.4), AppColors.darkBackground]
              : [AppColors.getLighterShade(themeColor, 0.4), Colors.white.withOpacity(0.95), Colors.white],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.analytics_outlined,
                size: 80,
                color: isDark ? Colors.grey[400] : Colors.grey,
              ),
              const SizedBox(height: 20),
              Text(
                languageCode == 'ru' ? 'Недостаточно данных' : 'Insufficient data',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                languageCode == 'ru'
                    ? 'Пройдите хотя бы 2 теста, чтобы получить персональное саммари'
                    : 'Take at least 2 tests to get a personal summary',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.grey[300] : Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              Builder(
                builder: (context) {
                  final themeColor = Theme.of(context).primaryColor;
                  return ElevatedButton(
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
                      languageCode == 'ru' ? 'Пройти тесты' : 'Take tests',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryContent(SummaryProvider summaryProvider, String languageCode, bool isDark) {
    final themeColor = Theme.of(context).primaryColor;
    final summary = summaryProvider.currentSummary!;
    final axisScores = summaryProvider.getAllAxisScores();
    final statistics = summaryProvider.getTestStatistics();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [themeColor.withOpacity(0.8), themeColor.withOpacity(0.4), AppColors.darkBackground]
              : [AppColors.getLighterShade(themeColor, 0.4), Colors.white.withOpacity(0.95), Colors.white],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Consumer<TestProvider>(
        builder: (context, testProvider, child) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Заголовок с уверенностью
              _buildHeader(summary, statistics, languageCode, isDark),
              const SizedBox(height: 20),

              // НОВОЕ: Секция типа личности 16 типов
              _buildPersonalityTypeSection(testProvider, languageCode, isDark),
              const SizedBox(height: 20),

              // NEW v2: Hierarchical categories (if available)
              _buildHierarchicalScales(summaryProvider, languageCode, isDark),
              const SizedBox(height: 20),

          // OLD v1: Визуализация (радар + мини-шкалы) - показываем только если нет v2 данных
          if (summaryProvider.getHierarchicalCategories().isEmpty)
            ...[
              SummaryVisualization(
                axisScores: axisScores,
                languageCode: languageCode,
                radarSize: 220,
              ),
              const SizedBox(height: 20),
            ],

          // Текстовое саммари
          _buildSummaryText(summary, languageCode, isDark),
          const SizedBox(height: 20),

          // Советы
          _buildAdviceSection(summary, languageCode, isDark),
          const SizedBox(height: 20),

          // Сильные стороны и зоны развития
          _buildStrengthsAndAreas(summary, languageCode, isDark),
          const SizedBox(height: 20),

          // Подробности (если включены)
          if (_showDetails) ...[
            _buildDetailsSection(summary, languageCode, isDark),
            const SizedBox(height: 20),
          ],

          // Кнопка обновления
          _buildRefreshButton(languageCode, isDark),
          const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(SummaryData summary, TestStatistics statistics, String languageCode, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.insights,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      languageCode == 'ru' ? 'Личностный профиль' : 'Personality Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      statistics.getDescription(languageCode),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getConfidenceColor(summary.confidence).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: _getConfidenceColor(summary.confidence),
                    width: 1,
                  ),
                ),
                child: Text(
                  summary.confidence.getLocalizedName(languageCode),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: _getConfidenceColor(summary.confidence),
                  ),
                ),
              ),
            ],
          ),
          if (summary.confidence == ConfidenceLevel.low) ...[
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber, width: 1),
              ),
              child: Text(
                summary.confidence.getDescription(languageCode),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.amber,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryText(SummaryData summary, String languageCode, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.description,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                languageCode == 'ru' ? 'О вас' : 'About you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            summary.summaryText,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdviceSection(SummaryData summary, String languageCode, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                languageCode == 'ru' ? 'Рекомендации' : 'Recommendations',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...summary.advice.map((advice) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    advice,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildStrengthsAndAreas(SummaryData summary, String languageCode, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageCode == 'ru' ? 'Ключевые аспекты' : 'Key aspects',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              // Сильные стороны
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            languageCode == 'ru' ? 'Сильные стороны' : 'Strengths',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ...summary.strengths.map((strength) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '• $strength',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 100,
                color: Colors.grey.withOpacity(0.3),
              ),
              const SizedBox(width: 20),
              // Зоны развития
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.trending_up,
                          color: Colors.orange,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            languageCode == 'ru' ? 'Зоны развития' : 'Development areas',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ...summary.developmentAreas.map((area) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '• $area',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(SummaryData summary, String languageCode, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                languageCode == 'ru' ? 'На основе тестов' : 'Based on tests',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...summary.testInfluences.map((influence) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  influence.testName,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  languageCode == 'ru'
                      ? 'Влияние: ${(influence.totalInfluence * 100).round()}% • Затронуто шкал: ${influence.influencedAxes.length}'
                      : 'Influence: ${(influence.totalInfluence * 100).round()}% • Axes affected: ${influence.influencedAxes.length}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  /// NEW v2: Build hierarchical categories with expandable subscales
  Widget _buildHierarchicalScales(SummaryProvider summaryProvider, String languageCode, bool isDark) {
    final categories = summaryProvider.getHierarchicalCategories(includeEmpty: _showAllScales);

    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    // Calculate total measured vs unmeasured scales
    final totalMeasured = categories.fold<int>(0, (sum, cat) => sum + cat.measuredCount);
    final totalScales = categories.fold<int>(0, (sum, cat) => sum + cat.totalCount);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.psychology,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        languageCode == 'ru' ? 'Психологический профиль' : 'Psychological Profile',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      languageCode == 'ru'
                          ? 'Измерено: $totalMeasured из $totalScales шкал'
                          : 'Measured: $totalMeasured of $totalScales scales',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Spacer(),
                    // Toggle button for showing all scales
                    InkWell(
                      onTap: () {
                        setState(() {
                          _showAllScales = !_showAllScales;
                        });
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: _showAllScales
                              ? Theme.of(context).primaryColor.withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).primaryColor.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _showAllScales ? Icons.visibility_off : Icons.visibility,
                              size: 16,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              languageCode == 'ru'
                                  ? (_showAllScales ? 'Скрыть пустые' : 'Показать все')
                                  : (_showAllScales ? 'Hide empty' : 'Show all'),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Categories list
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const Divider(height: 1, indent: 16),
            itemBuilder: (context, index) {
              final categoryData = categories[index];
              return _buildCategoryTile(categoryData, languageCode, isDark);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTile(CategoryScoreData categoryData, String languageCode, bool isDark) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: categoryData.category.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            categoryData.category.icon,
            color: categoryData.category.color,
            size: 20,
          ),
        ),
        title: Text(
          categoryData.category.getName(languageCode),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          _showAllScales
              ? '${categoryData.measuredCount}/${categoryData.totalCount} ${languageCode == 'ru' ? 'измерено' : 'measured'}'
              : '${categoryData.subscales.length} ${languageCode == 'ru' ? 'шкал' : 'scales'}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: categoryData.getScoreColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: categoryData.getScoreColor().withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Text(
                categoryData.getScoreText(),
                style: TextStyle(
                  color: categoryData.getScoreColor(),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.expand_more,
              color: Colors.grey[600],
            ),
          ],
        ),
        // OPTIMIZATION: Build subscales lazily using ListView.builder
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categoryData.subscales.length,
            itemBuilder: (context, index) {
              return _buildSubscaleTile(
                categoryData.subscales[index],
                languageCode,
                isDark,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSubscaleTile(ScaleScoreData subscaleData, String languageCode, bool isDark) {
    // If no data for this scale
    if (!subscaleData.hasData) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                subscaleData.getName(languageCode),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              languageCode == 'ru' ? 'Нет данных' : 'No data',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 45,
              child: Text(
                '—',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );
    }

    // OPTIMIZATION: Build subscale tile without fetching question contributions upfront
    // Only fetch them when the ExpansionTile is expanded
    return _SubscaleExpansionTile(
      subscaleData: subscaleData,
      languageCode: languageCode,
      isDark: isDark,
    );
  }

  Widget _buildScoreBar(ScaleScoreData subscaleData) {
    // Calculate width factor safely
    final widthFactor = (subscaleData.hasData && subscaleData.score != null)
        ? subscaleData.score!.score / 100
        : 0.0;

    return SizedBox(
      width: 80,
      child: Stack(
        children: [
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          if (widthFactor > 0)
            FractionallySizedBox(
              widthFactor: widthFactor,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: subscaleData.getScoreColor(),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildScoreText(ScaleScoreData subscaleData) {
    return SizedBox(
      width: 45,
      child: Text(
        subscaleData.getScoreText(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: subscaleData.getScoreColor(),
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _buildTestContributions(
    String testId,
    List<QuestionContribution> contributions,
    String languageCode,
    bool isDark,
  ) {
    // Get test name from service
    final testName = _summaryService.getTestName(testId, languageCode);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 4),
          child: Text(
            testName,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ),
        ...contributions.map((contribution) {
          return _buildQuestionContribution(testId, contribution, languageCode, isDark);
        }).toList(),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildQuestionContribution(
    String testId,
    QuestionContribution contribution,
    String languageCode,
    bool isDark,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[50],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contribution.getQuestionText(languageCode),
            style: TextStyle(
              fontSize: 11,
              color: isDark ? Colors.grey[300] : Colors.grey[800],
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                languageCode == 'ru' ? 'Ответ:' : 'Answer:',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  '${contribution.answerScore}/${contribution.maxAnswerScore} (${_getAnswerText(testId, contribution.questionId, contribution.answerScore, languageCode)})',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                languageCode == 'ru' ? 'Вес:' : 'Weight:',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 4),
              Text(
                contribution.weight.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                '${contribution.answerPercentage.round()}%',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: contribution.answerPercentage >= 70
                      ? Colors.green
                      : contribution.answerPercentage >= 50
                          ? Colors.orange
                          : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRefreshButton(String languageCode, bool isDark) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () async {
          final summaryProvider = Provider.of<SummaryProvider>(context, listen: false);
          final testProvider = Provider.of<TestProvider>(context, listen: false);
          final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

          await summaryProvider.refreshSummary(testProvider.completedTests, localeProvider.languageCode);

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  languageCode == 'ru' ? 'Саммари обновлено' : 'Summary updated',
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        icon: const Icon(Icons.refresh),
        label: Text(languageCode == 'ru' ? 'Обновить саммари' : 'Update summary'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  Color _getConfidenceColor(ConfidenceLevel confidence) {
    switch (confidence) {
      case ConfidenceLevel.high:
        return Colors.green;
      case ConfidenceLevel.medium:
        return Colors.orange;
      case ConfidenceLevel.low:
        return Colors.amber;
    }
  }

  void _showDebugData(BuildContext context) {
    final summaryProvider = Provider.of<SummaryProvider>(context, listen: false);
    final testProvider = Provider.of<TestProvider>(context, listen: false);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    // Собираем данные для экспорта
    final debugData = {
      'language': localeProvider.languageCode,
      'timestamp': DateTime.now().toIso8601String(),
      'completedTests': testProvider.completedTests.map((test) {
        return {
          'testId': test.testId,
          'totalScore': test.totalScore,
          'maxScore': test.maxScore,
          'percentage': test.percentage,
          'completedAt': test.completedAt.toIso8601String(),
          'factorScores': test.factorScores?.map((key, value) => MapEntry(key, {
            'factorId': value.factorId,
            'score': value.score,
            'maxScore': value.maxScore,
            'percentage': value.percentage,
          })),
        };
      }).toList(),
      'summary': summaryProvider.currentSummary != null ? {
        'axisScores': summaryProvider.currentSummary!.axisScores.map((key, value) => MapEntry(key, {
          'axisId': value.axisId,
          'score': value.score,
          'rawScore': value.rawScore,
          'confidence': value.confidence,
          'contributions': value.contributions.map((c) => {
            'testId': c.testId,
            'testName': c.testName,
            'scale': c.scale,
            'score': c.score,
            'weight': c.weight,
            'direction': c.direction,
            'contribution': c.contribution,
          }).toList(),
        })),
        'confidence': summaryProvider.currentSummary!.confidence.name,
        'strengths': summaryProvider.currentSummary!.strengths,
        'developmentAreas': summaryProvider.currentSummary!.developmentAreas,
      } : null,
      'config': {
        'testMappings': SummaryConfig.testMappings.map((testId, mappings) => MapEntry(testId, mappings.map((m) => {
          'scale': m.scale,
          'targetAxis': m.targetAxis,
          'weight': m.weight,
          'direction': m.direction,
        }).toList())),
      },
    };

    final jsonString = const JsonEncoder.withIndent('  ').convert(debugData);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.bug_report, color: Colors.orange),
            SizedBox(width: 8),
            Text('Debug Data Export'),
          ],
        ),
        content: Container(
          width: double.maxFinite,
          constraints: const BoxConstraints(maxHeight: 500),
          child: SingleChildScrollView(
            child: SelectableText(
              jsonString,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: jsonString));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('JSON copied to clipboard!'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.copy),
            label: const Text('Copy JSON'),
          ),
        ],
      ),
    );
  }

  // ========== МЕТОДЫ ДЛЯ СЕКЦИИ 16 ТИПОВ ЛИЧНОСТИ ==========

  /// Вычисляет усреднённый тип личности на основе всех прохождений теста 16 типов
  Map<String, dynamic>? _calculateAveragedPersonalityType(List<TestResult> completedTests, String languageCode) {
    return _summaryService.calculateAveragedPersonalityType(completedTests, languageCode);
  }

  /// Строит секцию типа личности 16 типов
  Widget _buildPersonalityTypeSection(TestProvider testProvider, String languageCode, bool isDark) {
    final completedTests = testProvider.completedTests;
    final typeData = _calculateAveragedPersonalityType(completedTests, languageCode);

    if (typeData == null) {
      return _buildPersonalityTypePlaceholder(languageCode, isDark);
    }

    final personalityType = typeData['personalityType'] as String;
    final typeName = typeData['typeName'] as String;
    final bipolarScores = typeData['bipolarScores'] as Map<String, BipolarDimensionScore>;

    return Card(
      elevation: 3,
      color: isDark ? Colors.grey[850] : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              languageCode == 'ru' ? 'Ваш тип личности:' : 'Your Personality Type:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey[300] : Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                personalityType,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  letterSpacing: 8,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                typeName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.grey[300] : Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildBipolarScales(bipolarScores, languageCode, isDark),
          ],
        ),
      ),
    );
  }

  /// Строит заглушку когда тест 16 типов не пройден
  Widget _buildPersonalityTypePlaceholder(String languageCode, bool isDark) {
    final themeColor = Theme.of(context).primaryColor;

    return Card(
      elevation: 3,
      color: isDark ? Colors.grey[850] : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              Icons.help_outline,
              size: 60,
              color: isDark ? Colors.grey[600] : Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              languageCode == 'ru'
                ? 'Ваш тип личности пока неизвестен'
                : 'Your personality type is unknown',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey[300] : Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                final testProvider = Provider.of<TestProvider>(context, listen: false);
                final sixteenTypesTest = testProvider.getTestById('sixteen_types');

                if (sixteenTypesTest != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestScreen(test: sixteenTypesTest),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.psychology),
              label: Text(
                languageCode == 'ru' ? 'Пройти тест 16 типов' : 'Take 16 Types Test',
                style: const TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                foregroundColor: ThemeUtils.getButtonTextColor(themeColor),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Строит 4 биполярные шкалы (E/I, S/N, T/F, J/P)
  Widget _buildBipolarScales(Map<String, BipolarDimensionScore> bipolarScores, String languageCode, bool isDark) {
    final testProvider = Provider.of<TestProvider>(context, listen: false);
    final dimensions = ['personality_type_ei', 'personality_type_sn', 'personality_type_tf', 'personality_type_jp'];

    return Column(
      children: dimensions.map((dimensionId) {
        final score = bipolarScores[dimensionId];
        final dimension = SummaryConfig.getBipolarScale(dimensionId);

        if (score == null || dimension == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _BipolarScaleExpandable(
            dimension: dimension,
            score: score,
            testProvider: testProvider,
            languageCode: languageCode,
            isDark: isDark,
          ),
        );
      }).toList(),
    );
  }

  /// Строит одну биполярную шкалу с горизонтальной полоской
  Widget _buildBipolarScaleBar(BipolarScale dimension, BipolarDimensionScore score, String languageCode, bool isDark) {
    final positiveName = dimension.positiveName[languageCode] ?? dimension.positiveName['ru'] ?? '';
    final negativeName = dimension.negativeName[languageCode] ?? dimension.negativeName['ru'] ?? '';

    // Use service to analyze bipolar score
    final analysis = _summaryService.analyzeBipolarScore(
      score,
      dimension.positiveEnd,
      dimension.negativeEnd,
    );

    final isDominantPositive = analysis['isDominantPositive'] as bool;
    final isDominantNegative = analysis['isDominantNegative'] as bool;
    final isBalanced = analysis['isBalanced'] as bool;
    final dominantPercentage = analysis['dominantPercentage'] as int;
    final dominantName = analysis['dominantName'] as String;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '$positiveName (${dimension.positiveEnd})',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isDominantPositive ? FontWeight.bold : FontWeight.normal,
                  color: isDominantPositive ? dimension.color : (isDark ? Colors.grey[400] : Colors.grey[600]),
                ),
              ),
            ),
            Expanded(
              child: Text(
                '$negativeName (${dimension.negativeEnd})',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isDominantNegative ? FontWeight.bold : FontWeight.normal,
                  color: isDominantNegative ? dimension.color : (isDark ? Colors.grey[400] : Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            final barWidth = availableWidth * 0.5 * (dominantPercentage / 100);

            return Stack(
              children: [
                Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[800] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      width: 2,
                      height: 24,
                      color: isDark ? Colors.grey[600] : Colors.grey[400],
                    ),
                  ),
                ),
                if (!isBalanced)
                  Positioned(
                    left: isDominantPositive ? 0 : null,
                    right: isDominantNegative ? 0 : null,
                    child: Container(
                      width: barWidth,
                      height: 24,
                      decoration: BoxDecoration(
                        color: dimension.color.withOpacity(0.7),
                        borderRadius: BorderRadius.horizontal(
                          left: isDominantPositive ? const Radius.circular(12) : Radius.zero,
                          right: isDominantNegative ? const Radius.circular(12) : Radius.zero,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: 6),
        Center(
          child: Text(
            isBalanced
              ? (languageCode == 'ru' ? 'Баланс' : 'Balance')
              : '$dominantPercentage% $dominantName',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isBalanced ? (isDark ? Colors.grey[400] : Colors.grey[600]) : dimension.color,
            ),
          ),
        ),
      ],
    );
  }
}

/// Optimized subscale tile that loads question contributions only when expanded
class _SubscaleExpansionTile extends StatefulWidget {
  final ScaleScoreData subscaleData;
  final String languageCode;
  final bool isDark;

  const _SubscaleExpansionTile({
    required this.subscaleData,
    required this.languageCode,
    required this.isDark,
  });

  @override
  State<_SubscaleExpansionTile> createState() => _SubscaleExpansionTileState();
}

class _SubscaleExpansionTileState extends State<_SubscaleExpansionTile> {
  bool _isExpanded = false;

  void _loadContributions() {
    // Contributions will be loaded on-demand when expanded
  }

  @override
  Widget build(BuildContext context) {
    final subscaleData = widget.subscaleData;

    if (!subscaleData.hasData || subscaleData.score == null) {
      return Card(
        margin: const EdgeInsets.only(bottom: 8),
        elevation: 1,
        color: widget.isDark ? Colors.grey[850] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            subscaleData.getName(widget.languageCode),
            style: TextStyle(
              fontSize: 14,
              color: widget.isDark ? Colors.grey[500] : Colors.grey[400],
            ),
          ),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      color: widget.isDark ? Colors.grey[850] : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
          title: Text(
            subscaleData.getName(widget.languageCode),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: widget.isDark ? Colors.white : Colors.black87,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: subscaleData.score!.score / 100,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getScoreColor(subscaleData.score!.score),
                    ),
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  subscaleData.getScoreText(),
                  style: TextStyle(
                    fontSize: 13,
                    color: _getScoreColor(subscaleData.score!.score),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: [
            if (_isExpanded) ...[
              const Divider(height: 16),
              _buildQuestionsList(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionsList() {
    final summaryProvider = Provider.of<SummaryProvider>(context, listen: false);
    final contributions = summaryProvider.getQuestionContributions(widget.subscaleData.scaleId);

    if (contributions.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          widget.languageCode == 'ru'
              ? 'Нет вопросов для отображения'
              : 'No questions to display',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.languageCode == 'ru' ? 'Вклад вопросов:' : 'Question Contributions:',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: widget.isDark ? Colors.grey[400] : Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        ...contributions.entries.map((entry) {
          final testKey = entry.key;
          final questions = entry.value;

          // Parse testId and attempt number from key (format: "testId" or "testId_attempt_N")
          String displayName;
          if (testKey.contains('_attempt_')) {
            final parts = testKey.split('_attempt_');
            final testId = parts[0];
            final attemptNumber = int.tryParse(parts[1]) ?? 1;
            displayName = '$testId (${widget.languageCode == 'ru' ? 'попытка' : 'attempt'} #$attemptNumber)';
          } else {
            displayName = testKey;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (contributions.length > 1) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: Text(
                    displayName,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: widget.isDark ? Colors.grey[300] : Colors.grey[600],
                    ),
                  ),
                ),
              ],
              ...questions.map((q) => _buildQuestionContribution(testKey, q)),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildQuestionContribution(String testKey, QuestionContribution contribution) {
    // Extract testId from testKey (format: "testId" or "testId_attempt_N")
    final testId = testKey.contains('_attempt_')
        ? testKey.split('_attempt_')[0]
        : testKey;

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.isDark ? Colors.grey[800] : Colors.grey[50],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contribution.getQuestionText(widget.languageCode),
            style: TextStyle(
              fontSize: 11,
              color: widget.isDark ? Colors.grey[300] : Colors.grey[800],
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                widget.languageCode == 'ru' ? 'Ответ:' : 'Answer:',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  '${contribution.answerScore}/${contribution.maxAnswerScore} (${_getAnswerText(testId, contribution.questionId, contribution.answerScore, widget.languageCode)})',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                widget.languageCode == 'ru' ? 'Вес:' : 'Weight:',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 4),
              Text(
                contribution.weight.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                '${contribution.answerPercentage.round()}%',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: contribution.answerPercentage >= 70
                      ? Colors.green
                      : contribution.answerPercentage >= 50
                          ? Colors.orange
                          : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getScoreColor(double score) {
    if (score >= 70) return Colors.green;
    if (score >= 50) return Colors.orange;
    if (score >= 30) return Colors.amber;
    return Colors.red;
  }
}

/// Раскрывающаяся биполярная шкала с вопросами
class _BipolarScaleExpandable extends StatefulWidget {
  final BipolarScale dimension;
  final BipolarDimensionScore score;
  final TestProvider testProvider;
  final String languageCode;
  final bool isDark;

  const _BipolarScaleExpandable({
    required this.dimension,
    required this.score,
    required this.testProvider,
    required this.languageCode,
    required this.isDark,
  });

  @override
  State<_BipolarScaleExpandable> createState() => _BipolarScaleExpandableState();
}

class _BipolarScaleExpandableState extends State<_BipolarScaleExpandable> {
  bool _isExpanded = false;
  final _summaryService = SummaryService();

  @override
  Widget build(BuildContext context) {
    final dimension = widget.dimension;
    final score = widget.score;
    final languageCode = widget.languageCode;
    final isDark = widget.isDark;

    final positiveName = dimension.positiveName[languageCode] ?? dimension.positiveName['ru'] ?? '';
    final negativeName = dimension.negativeName[languageCode] ?? dimension.negativeName['ru'] ?? '';

    // Use service to analyze bipolar score
    final analysis = _summaryService.analyzeBipolarScore(
      score,
      dimension.positiveEnd,
      dimension.negativeEnd,
    );

    final isDominantPositive = analysis['isDominantPositive'] as bool;
    final isDominantNegative = analysis['isDominantNegative'] as bool;
    final isBalanced = analysis['isBalanced'] as bool;
    final dominantPercentage = analysis['dominantPercentage'] as int;
    final dominantName = analysis['dominantName'] as String;

    return Card(
      elevation: 2,
      color: isDark ? Colors.grey[850] : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '$positiveName (${dimension.positiveEnd})',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isDominantPositive ? FontWeight.bold : FontWeight.normal,
                        color: isDominantPositive ? dimension.color : (isDark ? Colors.grey[400] : Colors.grey[600]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '$negativeName (${dimension.negativeEnd})',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isDominantNegative ? FontWeight.bold : FontWeight.normal,
                        color: isDominantNegative ? dimension.color : (isDark ? Colors.grey[400] : Colors.grey[600]),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              LayoutBuilder(
                builder: (context, constraints) {
                  final availableWidth = constraints.maxWidth;
                  final barWidth = availableWidth * 0.5 * (dominantPercentage / 100);

                  return Stack(
                    children: [
                      Container(
                        height: 24,
                        decoration: BoxDecoration(
                          color: isDark ? Colors.grey[800] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Container(
                            width: 2,
                            height: 24,
                            color: isDark ? Colors.grey[600] : Colors.grey[400],
                          ),
                        ),
                      ),
                      if (!isBalanced)
                        Positioned(
                          left: isDominantPositive ? 0 : null,
                          right: isDominantNegative ? 0 : null,
                          child: Container(
                            width: barWidth,
                            height: 24,
                            decoration: BoxDecoration(
                              color: dimension.color.withOpacity(0.7),
                              borderRadius: BorderRadius.horizontal(
                                left: isDominantPositive ? const Radius.circular(12) : Radius.zero,
                                right: isDominantNegative ? const Radius.circular(12) : Radius.zero,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 6),
              Center(
                child: Text(
                  isBalanced
                    ? (languageCode == 'ru' ? 'Баланс' : 'Balance')
                    : '$dominantPercentage% $dominantName',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isBalanced ? (isDark ? Colors.grey[400] : Colors.grey[600]) : dimension.color,
                  ),
                ),
              ),
            ],
          ),
          children: [
            if (_isExpanded) ...[
              const Divider(height: 16),
              _buildQuestionsList(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionsList() {
    // Map bipolar dimension ID to the two unipolar scale IDs
    final scaleIds = _getScaleIdsForDimension(widget.dimension.id);

    if (scaleIds.isEmpty) {
      return Text(
        widget.languageCode == 'ru'
            ? 'Неизвестное измерение'
            : 'Unknown dimension',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
          fontStyle: FontStyle.italic,
        ),
      );
    }

    // Get all completed tests (not just 16 types)
    final completedTests = widget.testProvider.completedTests;

    if (completedTests.isEmpty) {
      return Text(
        widget.languageCode == 'ru'
            ? 'Нет данных для отображения'
            : 'No data to display',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
          fontStyle: FontStyle.italic,
        ),
      );
    }

    // Use service to get questions with Personality Type weights from ALL tests
    appLogger.d('Загрузка вопросов для шкал $scaleIds');
    final questionsData = _summaryService.getQuestionsWithPersonalityTypeWeights(
      completedTests,
      scaleIds,
    );
    appLogger.d('Найдено тестов с Personality Type весами: ${questionsData.keys.length}');

    if (questionsData.isEmpty) {
      return Text(
        widget.languageCode == 'ru'
            ? 'Нет вопросов с влиянием на эти шкалы'
            : 'No questions affecting these scales',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
          fontStyle: FontStyle.italic,
        ),
      );
    }

    // Build sections for each pole (scale)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Info text explaining the percentages
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 4),
          child: Text(
            widget.languageCode == 'ru'
                ? 'Ваши результаты по двум полюсам шкалы:'
                : 'Your results for both poles of the scale:',
            style: TextStyle(
              fontSize: 12,
              color: widget.isDark ? Colors.grey[400] : Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
        ),

        // Section for positive pole (e.g., Extraversion)
        _buildScaleSection(
          scaleIds[0],
          questionsData,
          widget.dimension.positiveEnd,
          widget.dimension.positiveName[widget.languageCode] ?? widget.dimension.positiveName['ru'] ?? scaleIds[0],
          widget.dimension.color,
          isPositivePole: true,
        ),

        const SizedBox(height: 16),

        // Section for negative pole (e.g., Introversion)
        _buildScaleSection(
          scaleIds[1],
          questionsData,
          widget.dimension.negativeEnd,
          widget.dimension.negativeName[widget.languageCode] ?? widget.dimension.negativeName['ru'] ?? scaleIds[1],
          widget.dimension.color.withOpacity(0.7),
          isPositivePole: false,
        ),
      ],
    );
  }

  /// Maps bipolar dimension ID to the two unipolar scale IDs
  List<String> _getScaleIdsForDimension(String dimensionId) {
    switch (dimensionId) {
      case 'personality_type_ei':
        return ['extraversion', 'introversion'];
      case 'personality_type_sn':
        return ['sensing', 'intuition'];
      case 'personality_type_tf':
        return ['thinking', 'feeling'];
      case 'personality_type_jp':
        return ['judging', 'perceiving'];
      default:
        appLogger.w('Unknown dimension ID: $dimensionId');
        return [];
    }
  }

  /// Builds a section for one pole (scale) showing questions from all tests
  Widget _buildScaleSection(
    String scaleId,
    Map<String, Map<String, List<Map<String, dynamic>>>> questionsData,
    String pole,
    String poleName,
    Color poleColor,
    {required bool isPositivePole}
  ) {
    // Calculate percentage for this pole
    // normalizedScore is 0-100, where >50 means positive pole is dominant
    final polePercentage = isPositivePole
        ? widget.score.normalizedScore
        : (100 - widget.score.normalizedScore);

    // Section header
    final header = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: poleColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: poleColor, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: poleColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              pole,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              poleName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: widget.isDark ? Colors.grey[200] : Colors.grey[800],
              ),
            ),
          ),
          // Percentage badge for this pole
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: poleColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${polePercentage.round()}%',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

    // First, calculate total weight for this scale across all questions
    double totalWeight = 0.0;
    questionsData.forEach((testId, scalesMap) {
      final questionsForScale = scalesMap[scaleId] ?? [];
      for (final questionData in questionsForScale) {
        totalWeight += questionData['weight'] as double;
      }
    });

    // Collect all questions for this scale from all tests
    final allQuestions = <Widget>[];

    questionsData.forEach((testKey, scalesMap) {
      final questionsForScale = scalesMap[scaleId] ?? [];

      if (questionsForScale.isEmpty) {
        return; // Skip tests without questions for this scale
      }

      // Sort questions by questionId
      questionsForScale.sort((a, b) => (a['questionId'] as String).compareTo(b['questionId'] as String));

      // Parse testId and attempt number from key (format: "testId" or "testId_attempt_N")
      String testId;
      int? attemptNumber;

      if (testKey.contains('_attempt_')) {
        final parts = testKey.split('_attempt_');
        testId = parts[0];
        attemptNumber = int.tryParse(parts[1]);
      } else {
        testId = testKey;
        attemptNumber = 1;
      }

      // Add test name header with attempt number
      final testNameMap = {
        'ipip_big_five': widget.languageCode == 'ru' ? 'IPIP Big Five' : 'IPIP Big Five',
        'fisher_temperament': widget.languageCode == 'ru' ? 'Темперамент Фишера' : 'Fisher Temperament',
        'love_profile': widget.languageCode == 'ru' ? 'Профиль любви' : 'Love Profile',
        'stress_test': widget.languageCode == 'ru' ? 'Стресс-тест' : 'Stress Test',
        'self_esteem_test': widget.languageCode == 'ru' ? 'Тест самооценки' : 'Self-Esteem Test',
        'sixteen_types': widget.languageCode == 'ru' ? '16 типов личности' : '16 Personality Types',
      };

      final baseName = testNameMap[testId] ?? testId;
      final testName = attemptNumber != null && attemptNumber > 1
          ? '$baseName (${widget.languageCode == 'ru' ? 'попытка' : 'attempt'} #$attemptNumber)'
          : baseName;

      allQuestions.add(
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 8),
          child: Text(
            testName,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: widget.isDark ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
        ),
      );

      // Add questions from this test
      for (final questionData in questionsForScale) {
        final questionId = questionData['questionId'] as String;
        final weight = questionData['weight'] as double;
        final testResult = questionData['testResult'] as TestResult;

        allQuestions.add(_buildQuestionItem(
          testResult,
          questionId,
          weight,
          totalWeight,
          pole,
          poleColor,
        ));
      }
    });

    if (allQuestions.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.languageCode == 'ru'
                  ? 'Нет вопросов для этой шкалы'
                  : 'No questions for this scale',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header,
        ...allQuestions,
      ],
    );
  }

  /// Builds a single question item with answer
  Widget _buildQuestionItem(
    TestResult testResult,
    String questionId,
    double weight,
    double totalWeight,
    String pole,
    Color poleColor,
  ) {
    // Get question text from test data
    String questionText = _getQuestionText(testResult.testId, questionId);

    // Get user answer
    final answerScore = testResult.userAnswers?[questionId];
    String answerText = '';

    if (answerScore != null) {
      answerText = _getAnswerText(testResult.testId, questionId, answerScore, widget.languageCode);
    }

    if (answerText.isEmpty) {
      answerText = widget.languageCode == 'ru' ? 'Нет ответа' : 'No answer';
    }

    // Calculate answer percentage (how much user answered out of max)
    // Get max score for this question from test data
    int maxAnswerScore = 5; // Default for most tests (Likert 1-5 scale)
    double answerPercentage = 0.0;

    if (answerScore != null) {
      // Get the actual question model to find max score
      try {
        TestModel? testModel;
        switch (testResult.testId) {
          case 'ipip_big_five':
            testModel = IPIPBigFiveData.getIPIPBigFiveTest();
            break;
          case 'fisher_temperament':
            testModel = FisherTemperamentData.getFisherTemperamentTest();
            break;
          case 'love_profile':
            testModel = LoveProfileData.getLoveProfileTest();
            break;
          case 'sixteen_types':
            testModel = SixteenTypesData.getSixteenTypesTest();
            break;
          case 'stress_test':
            testModel = StressTestData.getStressTest();
            break;
          case 'self_esteem_test':
            testModel = SelfEsteemTestData.getSelfEsteemTest();
            break;
        }

        if (testModel != null) {
          final question = testModel.questions.firstWhere((q) => q.id == questionId);
          // Find max score from answers
          maxAnswerScore = question.answers.map((a) => a.score).reduce((a, b) => a > b ? a : b);
        }
      } catch (e) {
        appLogger.w('Could not determine max score for $questionId, using default');
      }

      answerPercentage = (answerScore / maxAnswerScore) * 100;
    }

    // Calculate influence percentage (what portion of total weight this question has)
    final influencePercentage = totalWeight > 0 ? (weight / totalWeight * 100) : 0.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.isDark ? Colors.grey[700] : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: widget.isDark ? Colors.grey[600]! : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question text
          Text(
            questionText,
            style: TextStyle(
              fontSize: 12,
              color: widget.isDark ? Colors.grey[200] : Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          // Answer and metrics
          Row(
            children: [
              Expanded(
                child: Text(
                  '${widget.languageCode == 'ru' ? 'Ответ' : 'Answer'}: $answerText',
                  style: TextStyle(
                    fontSize: 11,
                    color: widget.isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Answer percentage badge (how much user answered)
              if (answerScore != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: _getAnswerPercentageColor(answerPercentage).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: _getAnswerPercentageColor(answerPercentage),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    '${answerPercentage.round()}%',
                    style: TextStyle(
                      fontSize: 10,
                      color: _getAnswerPercentageColor(answerPercentage),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const SizedBox(width: 4),
              // Influence badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: poleColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${widget.languageCode == 'ru' ? 'Вклад' : 'Impact'}: ${influencePercentage.toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 10,
                    color: poleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Get color for answer percentage (green for high, red for low)
  Color _getAnswerPercentageColor(double percentage) {
    if (percentage >= 75) return Colors.green;
    if (percentage >= 50) return Colors.orange;
    if (percentage >= 25) return Colors.amber;
    return Colors.red;
  }

  /// Gets question text from test data
  String _getQuestionText(String testId, String questionId) {
    try {
      // Get the test data
      TestModel? testModel;

      switch (testId) {
        case 'ipip_big_five':
          testModel = IPIPBigFiveData.getIPIPBigFiveTest();
          break;
        case 'fisher_temperament':
          testModel = FisherTemperamentData.getFisherTemperamentTest();
          break;
        case 'love_profile':
          testModel = LoveProfileData.getLoveProfileTest();
          break;
        case 'sixteen_types':
          testModel = SixteenTypesData.getSixteenTypesTest();
          break;
        case 'stress_test':
          testModel = StressTestData.getStressTest();
          break;
        case 'self_esteem_test':
          testModel = SelfEsteemTestData.getSelfEsteemTest();
          break;
        case 'temperament_profile_test':
          testModel = TemperamentProfileTestData.getTemperamentProfileTest();
          break;
        case 'digital_detox_test':
          testModel = digital_detox.DigitalDetoxTestData.getDigitalDetoxTest();
          break;
        case 'burnout_diagnostic_v1':
          testModel = burnout.BurnoutDiagnosticData.getBurnoutDiagnosticTest();
          break;
        case 'social_battery_v1':
          testModel = SocialBatteryData.getSocialBatteryTest();
          break;
        case 'disc_personality_v1':
          testModel = DISCPersonalityData.getDISCPersonalityTest();
          break;
        case 'holland_code_v1':
          testModel = HollandCodeData.getHollandCodeTest();
          break;
        case 'love_languages_v1':
          testModel = LoveLanguagesData.getLoveLanguagesTest();
          break;
        default:
          appLogger.w('Unknown testId: $testId');
          return widget.languageCode == 'ru'
              ? 'Неизвестный тест: $testId'
              : 'Unknown test: $testId';
      }

      // Find the question by ID
      if (testModel == null) {
        return widget.languageCode == 'ru'
            ? 'Тест не найден: $testId'
            : 'Test not found: $testId';
      }

      final question = testModel.questions.firstWhere(
        (q) => q.id == questionId,
        orElse: () => throw Exception('Question not found: $questionId'),
      );

      // Return the text in the current language
      return question.text[widget.languageCode] ??
             question.text['ru'] ??
             'Question $questionId';
    } catch (e) {
      appLogger.e('Error loading question text for $testId:$questionId: $e');
      return widget.languageCode == 'ru'
          ? 'Вопрос $questionId'
          : 'Question $questionId';
    }
  }

  Widget _buildTestAttempt(TestResult result, List<QuestionModel> questions) {
    // Use service to format date
    final dateStr = _summaryService.formatTestDate(result.completedAt, widget.languageCode);
    final dimensionId = widget.dimension.id;

    // Get answer data using service
    final hasAnswers = _summaryService.hasAnswerData(result);
    final userAnswers = result.userAnswers ?? {};

    appLogger.d('Тест от $dateStr: userAnswers содержит ${userAnswers.length} ответов для ${questions.length} вопросов');
    if (!hasAnswers) {
      appLogger.w('WARNING: userAnswers пустая! Это старый результат теста.');
    }

    // Use service to get bipolar dimension data
    final dimensionData = _summaryService.getBipolarDimensionData(
      result,
      dimensionId,
      widget.languageCode,
    );

    String scoreInfo = '';
    if (dimensionData.isNotEmpty) {
      final positiveName = dimensionData['positiveName'];
      final negativeName = dimensionData['negativeName'];
      final positiveEnd = dimensionData['positiveEnd'];
      final negativeEnd = dimensionData['negativeEnd'];
      final positiveScore = dimensionData['positiveScore'];
      final negativeScore = dimensionData['negativeScore'];
      final positiveMaxScore = dimensionData['positiveMaxScore'];
      final negativeMaxScore = dimensionData['negativeMaxScore'];

      scoreInfo = '$positiveEnd ($positiveName): $positiveScore/$positiveMaxScore, '
                  '$negativeEnd ($negativeName): $negativeScore/$negativeMaxScore';
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: widget.isDark ? Colors.grey[800] : Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.languageCode == 'ru' ? 'Прохождение от' : 'Attempt from'} $dateStr',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: widget.isDark ? Colors.grey[300] : Colors.grey[700],
              ),
            ),
            if (scoreInfo.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                scoreInfo,
                style: TextStyle(
                  fontSize: 11,
                  color: widget.isDark ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
            ],
            const SizedBox(height: 12),
            // Показываем ВСЕ вопросы, которые влияют на эту шкалу (даже без ответа)
            ...questions.map((question) {
              // Use service to get user answer
              final answerScore = _summaryService.getUserAnswer(result, question.id);

              // Use service to find answer by score
              AnswerModel? answer;
              String answerText = '';

              if (answerScore != null) {
                answer = _summaryService.getAnswerByScore(question, answerScore);
                answerText = answer?.getText(widget.languageCode) ?? '';
              }

              if (answerText.isEmpty) {
                // Если ответа нет - показываем "Нет ответа"
                answerText = widget.languageCode == 'ru' ? 'Нет ответа' : 'No answer';
              }

              final questionText = question.getText(widget.languageCode);

              // Определяем к какому полюсу относится вопрос
              final pole = question.bipolarPole ?? '?';
              final poleColor = pole == widget.dimension.positiveEnd
                ? widget.dimension.color
                : widget.dimension.color.withOpacity(0.6);

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: widget.isDark ? Colors.grey[700] : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: widget.isDark ? Colors.grey[600]! : Colors.grey[300]!,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Заголовок с полюсом
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: poleColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: poleColor, width: 1),
                          ),
                          child: Text(
                            pole,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: poleColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            questionText,
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.isDark ? Colors.grey[200] : Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Ответ и балл
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: answer != null ? widget.dimension.color : Colors.grey,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            answerText,
                            style: TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                              color: answer != null
                                  ? (widget.isDark ? Colors.grey[400] : Colors.grey[600])
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        if (answer != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: widget.dimension.color.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${answer.score}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: widget.dimension.color,
                              ),
                            ),
                          )
                        else
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '-',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
