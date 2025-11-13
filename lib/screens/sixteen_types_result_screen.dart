import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/test_model.dart';
import '../providers/test_provider.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../config/summary_config.dart';
import '../config/bipolar_scales.dart';
import '../data/sixteen_types_data.dart';
import '../utils/theme_utils.dart';
import '../utils/app_logger.dart';
import '../constants/color_constants.dart';

class SixteenTypesResultScreen extends StatelessWidget {
  final TestResult result;

  const SixteenTypesResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final prefsProvider = Provider.of<UserPreferencesProvider>(context);
    final languageCode = localeProvider.locale.languageCode;
    final themeColor = prefsProvider.themeColor;
    final testProvider = Provider.of<TestProvider>(context, listen: false);
    final test = testProvider.getTestById(result.testId);
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    if (test == null || result.bipolarScores == null || result.personalityType == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(languageCode == 'ru' ? 'Ошибка' : 'Error'),
          backgroundColor: themeColor,
          foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
        ),
        body: Center(
          child: Text(languageCode == 'ru' ? 'Результаты теста не найдены' : 'Test results not found'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(languageCode == 'ru' ? 'Ваш тип личности' : 'Your Personality Type'),
        backgroundColor: themeColor,
        foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
        elevation: 0,
      ),
      body: Container(
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      // Personality type card
                      _buildPersonalityTypeCard(result, languageCode, themeColor, isDark),
                      const SizedBox(height: 20),
                      // Quality validation card
                      if (result.qualityValidation != null)
                        _buildQualityValidationCard(result.qualityValidation!, languageCode, isDark),
                      const SizedBox(height: 30),
                      // 4 bipolar scales
                      _buildBipolarScalesSection(result, languageCode, themeColor, isDark),
                      const SizedBox(height: 30),
                      // Description
                      _buildDescriptionCard(result, languageCode, isDark),
                      const SizedBox(height: 30),
                      // Actions
                      _buildActionButtons(context, result, languageCode, themeColor, isDark),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalityTypeCard(TestResult result, String languageCode, Color themeColor, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            themeColor.withOpacity(0.2),
            themeColor.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: themeColor.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            languageCode == 'ru' ? 'Ваш тип личности' : 'Your Personality Type',
            style: TextStyle(
              fontSize: 18,
              color: isDark ? Colors.white70 : Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            result.personalityType!,
            style: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: themeColor,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _getTypeName(result.personalityType!, languageCode),
            style: TextStyle(
              fontSize: 20,
              color: isDark ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildQualityValidationCard(TestQualityValidation validation, String languageCode, bool isDark) {
    // Determine color based on quality level
    Color cardColor;
    Color iconColor;
    IconData iconData;
    String title;

    switch (validation.qualityLevel) {
      case 'success':
        cardColor = Colors.green.withOpacity(0.1);
        iconColor = Colors.green;
        iconData = Icons.check_circle;
        title = languageCode == 'ru' ? 'Отличное качество ответов!' : 'Excellent Response Quality!';
        break;
      case 'warning':
        cardColor = Colors.orange.withOpacity(0.1);
        iconColor = Colors.orange;
        iconData = Icons.warning;
        title = languageCode == 'ru' ? 'Предупреждение о качестве' : 'Quality Warning';
        break;
      case 'error':
        cardColor = Colors.red.withOpacity(0.1);
        iconColor = Colors.red;
        iconData = Icons.error;
        title = languageCode == 'ru' ? 'Низкое качество ответов' : 'Low Response Quality';
        break;
      default:
        cardColor = Colors.grey.withOpacity(0.1);
        iconColor = Colors.grey;
        iconData = Icons.info;
        title = languageCode == 'ru' ? 'Информация о качестве' : 'Quality Information';
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? cardColor.withOpacity(0.3) : cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: iconColor.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(iconData, color: iconColor, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                  ),
                ),
              ),
            ],
          ),
          if (validation.issues.isNotEmpty) ...[
            const SizedBox(height: 15),
            ...validation.issues.map((issue) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_right, color: iconColor, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      issue,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
          if (validation.qualityLevel == 'error') ...[
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.refresh, color: Colors.red, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      languageCode == 'ru'
                          ? 'Рекомендуется пройти тест заново, отвечая более вдумчиво.'
                          : 'We recommend retaking the test with more thoughtful responses.',
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (validation.issues.isEmpty) ...[
            const SizedBox(height: 10),
            Text(
              languageCode == 'ru'
                  ? 'Ваши ответы показывают хорошую вариативность и согласованность. Результаты надёжны.'
                  : 'Your responses show good variance and consistency. Results are reliable.',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBipolarScalesSection(TestResult result, String languageCode, Color themeColor, bool isDark) {
    final bipolarScores = result.bipolarScores!;
    final orderedDimensions = ['mbti_ei', 'mbti_sn', 'mbti_tf', 'mbti_jp'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          languageCode == 'ru' ? 'Ваш профиль' : 'Your Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        ...orderedDimensions.map((dimensionId) {
          final score = bipolarScores[dimensionId];
          if (score == null) return const SizedBox.shrink();

          final dimension = SummaryConfig.getBipolarScale(dimensionId);
          if (dimension == null) return const SizedBox.shrink();

          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: _BipolarScaleExpandableResult(
              dimension: dimension,
              score: score,
              result: result,
              languageCode: languageCode,
              isDark: isDark,
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildDescriptionCard(TestResult result, String languageCode, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.05) : Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageCode == 'ru' ? 'Описание' : 'Description',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            result.interpretation,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: isDark ? Colors.white.withOpacity(0.9) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, TestResult result, String languageCode, Color themeColor, bool isDark) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // Один pop, т.к. TestScreen был заменён через pushReplacement
              Navigator.pop(context);
            },
            icon: const Icon(Icons.home),
            label: Text(languageCode == 'ru' ? 'На главную' : 'Home'),
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColor,
              foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, Brightness.light),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getTypeName(String typeCode, String languageCode) {
    // Extract type name from full description (first line before —)
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
}

// ============================================================
// Раскрывающийся виджет для биполярной шкалы с вопросами
// ============================================================

class _BipolarScaleExpandableResult extends StatefulWidget {
  final BipolarScale dimension;
  final BipolarDimensionScore score;
  final TestResult result;
  final String languageCode;
  final bool isDark;

  const _BipolarScaleExpandableResult({
    required this.dimension,
    required this.score,
    required this.result,
    required this.languageCode,
    required this.isDark,
  });

  @override
  State<_BipolarScaleExpandableResult> createState() => _BipolarScaleExpandableResultState();
}

class _BipolarScaleExpandableResultState extends State<_BipolarScaleExpandableResult> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final dimension = widget.dimension;
    final score = widget.score;
    final languageCode = widget.languageCode;
    final isDark = widget.isDark;

    final positiveName = dimension.positiveName[languageCode] ?? dimension.positiveName['ru'] ?? '';
    final negativeName = dimension.negativeName[languageCode] ?? dimension.negativeName['ru'] ?? '';

    final normalizedScore = score.normalizedScore;
    final percentage = normalizedScore.round();

    final isDominantPositive = normalizedScore > 50;
    final isDominantNegative = normalizedScore < 50;
    final isBalanced = normalizedScore == 50 || score.dominantPole == 'X';

    final dominantPercentage = isDominantPositive ? percentage : (100 - percentage);
    final dominantName = isDominantPositive ? dimension.positiveEnd : (isDominantNegative ? dimension.negativeEnd : 'X');

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
                  Text(
                    '$positiveName (${dimension.positiveEnd})',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDominantPositive ? dimension.color : (isDark ? Colors.white60 : Colors.black45),
                    ),
                  ),
                  Text(
                    '$negativeName (${dimension.negativeEnd})',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDominantNegative ? dimension.color : (isDark ? Colors.white60 : Colors.black45),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
                  final barWidth = isBalanced ? 0.0 : (dominantPercentage / 100) * (maxWidth / 2);

                  return Stack(
                    children: [
                      Container(
                        height: 24,
                        decoration: BoxDecoration(
                          color: isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Positioned.fill(
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
            const Divider(height: 16),
            _buildQuestionsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionsList() {
    final dimensionId = widget.dimension.id;
    final userAnswers = widget.result.userAnswers ?? {};

    appLogger.d('Dimension: $dimensionId, userAnswers.length: ${userAnswers.length}');
    if (userAnswers.isEmpty) {
      appLogger.w('WARNING: userAnswers пуст! Это старый результат без сохраненных ответов.');
    }

    // Получаем вопросы для этого измерения
    final testData = SixteenTypesData.getSixteenTypesTest();
    final questions = testData.questions.where((q) => q.bipolarDimension == dimensionId).toList();

    appLogger.d('Найдено вопросов для $dimensionId: ${questions.length}');

    if (questions.isEmpty) {
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

    // Показываем сводку по баллам
    final bipolarScore = widget.result.bipolarScores?[dimensionId];
    Widget scoreInfo = const SizedBox.shrink();
    if (bipolarScore != null) {
      final positiveName = widget.dimension.getPositiveName(widget.languageCode);
      final negativeName = widget.dimension.getNegativeName(widget.languageCode);
      scoreInfo = Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          '${widget.dimension.positiveEnd} ($positiveName): ${bipolarScore.positiveScore}/${bipolarScore.positiveMaxScore}, '
          '${widget.dimension.negativeEnd} ($negativeName): ${bipolarScore.negativeScore}/${bipolarScore.negativeMaxScore}',
          style: TextStyle(
            fontSize: 11,
            color: widget.isDark ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        scoreInfo,
        // Показываем все вопросы
        ...questions.map((question) {
          final answerScore = userAnswers[question.id];

          // DEBUG: Проверим каждый вопрос
          if (answerScore == null) {
            appLogger.w('Вопрос ${question.id} НЕ НАЙДЕН в userAnswers!');
            appLogger.d('Доступные ключи: ${userAnswers.keys.take(5).join(", ")}...');
          }

          // Находим ответ по баллу (если есть)
          AnswerModel? answer;
          String answerText = '';

          if (answerScore != null) {
            answer = question.answers.firstWhere(
              (a) => a.score == answerScore,
              orElse: () => question.answers.first
            );
            answerText = answer.getText(widget.languageCode);
          } else {
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
    );
  }
}
