import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/test_model.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../data/love_profile_data.dart';
import '../utils/app_logger.dart';
import '../utils/theme_utils.dart';
import '../constants/color_constants.dart';

class LoveProfileResultScreen extends StatefulWidget {
  final TestResult result;

  const LoveProfileResultScreen({super.key, required this.result});

  @override
  State<LoveProfileResultScreen> createState() => _LoveProfileResultScreenState();
}

class _LoveProfileResultScreenState extends State<LoveProfileResultScreen> {
  bool _showRecommendations = false;
  String? _selectedFactorForRecommendation;

  /// Shares the test results via the share dialog
  Future<void> _shareResults(String languageCode) async {
    try {
      final isRussian = languageCode == 'ru';
      final result = widget.result;

      // Build share text
      final buffer = StringBuffer();

      // Title
      buffer.writeln(isRussian
          ? '📊 Мой профиль любви'
          : '📊 My Love Profile');
      buffer.writeln();

      // Date
      buffer.writeln(isRussian
          ? 'Дата: ${_formatDate(result.completedAt, isRussian)}'
          : 'Date: ${_formatDate(result.completedAt, isRussian)}');
      buffer.writeln();

      // Factor scores
      if (result.factorScores != null && result.factorScores!.isNotEmpty) {
        buffer.writeln(isRussian ? 'Результаты:' : 'Results:');
        for (final factor in result.factorScores!.values) {
          buffer.writeln('${factor.factorName}: ${factor.score.toStringAsFixed(1)}%');
        }
      } else {
        buffer.writeln(isRussian
            ? 'Общий балл: ${result.percentage.toStringAsFixed(1)}%'
            : 'Overall score: ${result.percentage.toStringAsFixed(1)}%');
      }

      buffer.writeln();
      buffer.writeln(isRussian
          ? '✨ Пройдено в приложении "Психологические тесты"'
          : '✨ Completed in "Psychological Tests" app');

      await Share.share(
        buffer.toString(),
        subject: isRussian ? 'Мой профиль любви' : 'My Love Profile',
      );

      appLogger.i('Test results shared successfully');
    } catch (e, stackTrace) {
      appLogger.e('Failed to share results', error: e, stackTrace: stackTrace);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              languageCode == 'ru'
                  ? 'Не удалось поделиться результатами'
                  : 'Failed to share results',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// Formats a date/time for display
  String _formatDate(DateTime date, bool isRussian) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;
    return '$day.$month.$year';
  }

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
        title: Text(
          languageCode == 'ru' ? 'Результат: Профиль любви' : 'Result: Love Profile',
        ),
        backgroundColor: themeColor,
        foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareResults(languageCode),
            tooltip: languageCode == 'ru' ? 'Поделиться результатами' : 'Share results',
          ),
        ],
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
                      _buildLoveIndexCard(languageCode, themeColor, isDark),
                      const SizedBox(height: 30),
                      _buildDisclaimerCard(languageCode, isDark),
                      const SizedBox(height: 30),
                      _buildFactorsSection(languageCode, themeColor, isDark),
                      const SizedBox(height: 30),
                      _buildRecommendationsSection(languageCode, themeColor, isDark),
                      const SizedBox(height: 30),
                      _buildActionButtons(context, languageCode, isDark),
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

  Widget _buildLoveIndexCard(String languageCode, Color themeColor, bool isDark) {
    // Расчет Итогового индекса любви (ИИЛ) - среднее всех шкал
    double loveIndex = 0;
    if (widget.result.factorScores != null) {
      double totalPercentage = 0;
      widget.result.factorScores!.forEach((key, value) {
        totalPercentage += value.percentage;
      });
      loveIndex = totalPercentage / widget.result.factorScores!.length;
    }

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            themeColor.withOpacity(0.8),
            themeColor,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: themeColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.favorite,
            size: 50,
            color: Colors.white,
          ),
          const SizedBox(height: 15),
          Text(
            languageCode == 'ru' ? 'Итоговый индекс любви' : 'Overall Love Index',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${loveIndex.round()}%',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            LoveProfileData.calculateLoveIndex(widget.result.factorScores!, languageCode),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimerCard(String languageCode, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isDark ? Colors.amber.withOpacity(0.3) : Colors.amber.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: isDark ? Colors.amber[300] : Colors.amber,
            size: 24,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              languageCode == 'ru'
                  ? 'Результаты теста - это ориентиры для саморазвития. Для клинической оценки обращайтесь к специалисту.'
                  : 'Test results are guidelines for self-development. For clinical evaluation, consult a specialist.',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.amber[300] : Colors.amber[800],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFactorsSection(String languageCode, Color themeColor, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          languageCode == 'ru' ? 'Результаты по шкалам' : 'Scale Results',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        ...widget.result.factorScores!.entries.map((entry) {
          return _buildFactorRadarCard(entry.value, languageCode, themeColor, isDark);
        }).toList(),
      ],
    );
  }

  Widget _buildFactorRadarCard(FactorScore factorScore, String languageCode, Color themeColor, bool isDark) {
    return _FactorCard(
      factorScore: factorScore,
      languageCode: languageCode,
      themeColor: themeColor,
      isDark: isDark,
      getFactorScoreColor: _getFactorScoreColor,
    );
  }

  Widget _buildProgressBar(double percentage, Color themeColor, bool isDark) {
    return Stack(
      children: [
        Container(
          height: 20,
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[700] : Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        FractionallySizedBox(
          widthFactor: percentage / 100,
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _getFactorScoreColor(percentage),
                  _getFactorScoreColor(percentage).withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '${percentage.round()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendationsSection(String languageCode, Color themeColor, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          languageCode == 'ru' ? 'Персональные рекомендации' : 'Personal Recommendations',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 15),
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _showRecommendations = !_showRecommendations;
              });
            },
            icon: Icon(_showRecommendations ? Icons.visibility_off : Icons.visibility),
            label: Text(
              _showRecommendations
                  ? (languageCode == 'ru' ? 'Скрыть рекомендации' : 'Hide recommendations')
                  : (languageCode == 'ru' ? 'Показать рекомендации' : 'Show recommendations'),
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
        ),
        if (_showRecommendations) ...[
          const SizedBox(height: 20),
          ...widget.result.factorScores!.entries.map((entry) {
            return _buildRecommendationCard(entry.value, languageCode, themeColor, isDark);
          }).toList(),
        ],
      ],
    );
  }

  Widget _buildRecommendationCard(FactorScore factorScore, String languageCode, Color themeColor, bool isDark) {
    final recommendation = LoveProfileData.getRecommendations(factorScore.factorId, factorScore.percentage);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceHigh : themeColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark ? Colors.grey[600]! : themeColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: themeColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                factorScore.getFactorName(languageCode),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            recommendation[languageCode] ?? '',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white : Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, String languageCode, bool isDark) {
    final themeColor = Provider.of<UserPreferencesProvider>(context).themeColor;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.refresh),
            label: Text(languageCode == 'ru' ? 'Пройти тест заново' : 'Take test again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: const Icon(Icons.home),
            label: Text(languageCode == 'ru' ? 'На главную' : 'Home'),
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? Colors.grey[700] : Colors.grey[600],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ],
    );
  }


  Color _getFactorScoreColor(double percentage) {
    if (percentage >= 67) return Colors.green;
    if (percentage >= 33) return Colors.blue;
    return Colors.orange;
  }
}

// Статeful виджет для карточки фактора с раскрывающимся описанием
class _FactorCard extends StatefulWidget {
  final FactorScore factorScore;
  final String languageCode;
  final Color themeColor;
  final bool isDark;
  final Color Function(double) getFactorScoreColor;

  const _FactorCard({
    required this.factorScore,
    required this.languageCode,
    required this.themeColor,
    required this.isDark,
    required this.getFactorScoreColor,
  });

  @override
  State<_FactorCard> createState() => _FactorCardState();
}

class _FactorCardState extends State<_FactorCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final brightness = widget.isDark ? Brightness.dark : Brightness.light;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeUtils.getCardColor(brightness),
        borderRadius: BorderRadius.circular(15),
        boxShadow: ThemeUtils.getCardShadow(brightness),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.factorScore.getFactorName(widget.languageCode),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: widget.isDark ? Colors.white : widget.themeColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.getFactorScoreColor(widget.factorScore.percentage),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${widget.factorScore.score}/${widget.factorScore.maxScore}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          // Прогресс-бар
          Stack(
            children: [
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: widget.isDark ? Colors.grey[700] : Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                widthFactor: widget.factorScore.percentage / 100,
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        widget.getFactorScoreColor(widget.factorScore.percentage),
                        widget.getFactorScoreColor(widget.factorScore.percentage).withOpacity(0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.factorScore.percentage.round()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          // Интерпретация результата
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: widget.isDark ? AppColors.darkSurfaceHigh : Colors.blue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.isDark ? Colors.grey[600]! : Colors.blue.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: _buildFormattedText(
              widget.factorScore.getInterpretation(widget.languageCode),
            ),
          ),
          const SizedBox(height: 10),
          // Кнопка для раскрытия подробного описания
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: widget.themeColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _isExpanded
                        ? (widget.languageCode == 'ru' ? 'Скрыть подробное описание' : 'Hide detailed description')
                        : (widget.languageCode == 'ru' ? 'Подробное описание фактора' : 'Detailed factor description'),
                    style: TextStyle(
                      color: widget.themeColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Раскрывающееся подробное описание
          if (_isExpanded) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: widget.isDark ? AppColors.darkSurfaceLow : Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: widget.isDark ? Colors.grey[700]! : Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: _buildFormattedText(
                LoveProfileData.getFactorDescription(widget.factorScore.factorId, widget.languageCode),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFormattedText(String text) {
    final parts = text.split('**');
    final List<TextSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      if (i % 2 == 0) {
        // Обычный текст
        spans.add(TextSpan(
          text: parts[i],
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: widget.isDark ? Colors.white : Colors.black87,
          ),
        ));
      } else {
        // Жирный текст (между **)
        spans.add(TextSpan(
          text: parts[i],
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            fontWeight: FontWeight.bold,
            color: widget.isDark ? Colors.white : Colors.black87,
          ),
        ));
      }
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
