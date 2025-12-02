import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../models/text_conflict_communication_model.dart';
import '../models/test_profile_model.dart';
import '../data/text_conflict_communication_data.dart';
import '../services/text_conflict_communication_service.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../providers/test_provider.dart';
import '../models/test_model.dart';
import '../utils/app_logger.dart';

/// Экран результатов теста коммуникации в текстовых конфликтах
///
/// Отображает:
/// - Профиль коммуникации с описанием
/// - 4 шкалы (avoidance, aggression, passive_revenge, assertiveness)
/// - Проблемы и рекомендации
/// - Советы по улучшению коммуникации
///
/// @version: 1.0.0

class TextConflictCommunicationResultScreen extends StatefulWidget {
  final TextConflictTestResult result;
  final bool fromHistory;

  const TextConflictCommunicationResultScreen({
    super.key,
    required this.result,
    this.fromHistory = false,
  });

  @override
  State<TextConflictCommunicationResultScreen> createState() =>
      _TextConflictCommunicationResultScreenState();
}

class _TextConflictCommunicationResultScreenState
    extends State<TextConflictCommunicationResultScreen> {
  final TextConflictCommunicationService _service =
      TextConflictCommunicationService();
  bool _resultSaved = false;

  @override
  void initState() {
    super.initState();
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
      final testResult = _convertToTestResult(widget.result);
      final success = await testProvider.saveTestResult(testResult);
      if (success) {
        setState(() {
          _resultSaved = true;
        });
        appLogger.i('Text Conflict result saved successfully');
      }
    } catch (e, stackTrace) {
      appLogger.e('Error saving Text Conflict result',
          error: e, stackTrace: stackTrace);
    }
  }

  TestResult _convertToTestResult(TextConflictTestResult result) {
    // Средний балл по всем шкалам
    final avgScore = result.scalePercentages.values.isEmpty
        ? 50.0
        : result.scalePercentages.values.reduce((a, b) => a + b) /
            result.scalePercentages.length;

    // Factor scores для каждой шкалы
    final factorScores = <String, FactorScore>{};
    for (final entry in result.scalePercentages.entries) {
      final scaleName = _service.getScaleName(entry.key);
      final interpretation =
          _service.getScaleInterpretation(entry.key, entry.value);

      factorScores[entry.key] = FactorScore(
        factorId: entry.key,
        factorName: scaleName,
        score: entry.value.round(),
        maxScore: 100,
        interpretation: interpretation,
      );
    }

    return TestResult(
      testId: 'text_conflict_communication',
      totalScore: avgScore.round(),
      maxScore: 100,
      interpretation: result.profileId,
      completedAt: result.completedAt,
      factorScores: factorScores,
      userAnswers: {},
      version: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    final isRussian = localeProvider.isRussian;
    final userPrefs = context.watch<UserPreferencesProvider>();
    final profile =
        TextConflictCommunicationData.getProfile(widget.result.profileId);

    return Scaffold(
      backgroundColor: userPrefs.isDarkMode
          ? const Color(0xFF1A1A2E)
          : const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: userPrefs.isDarkMode
            ? const Color(0xFF16213E)
            : userPrefs.themeColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isRussian ? 'Результаты теста' : 'Test Results',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Профиль
              if (profile != null) _buildProfileCard(profile, isRussian, userPrefs),

              const SizedBox(height: 24),

              // Шкалы
              _buildScalesSection(isRussian, userPrefs),

              const SizedBox(height: 24),

              // Проблемы
              if (profile != null &&
                  profile.vulnerabilities[isRussian ? 'ru' : 'en']?.isNotEmpty == true)
                _buildProblemsSection(profile, isRussian, userPrefs),

              const SizedBox(height: 24),

              // Рекомендации
              if (profile != null)
                _buildRecommendationsSection(profile, isRussian, userPrefs),

              const SizedBox(height: 24),

              // Попробуйте сегодня
              if (profile != null)
                _buildTryTodaySection(profile, isRussian, userPrefs),

              const SizedBox(height: 24),

              // Вдохновляющий вывод
              if (profile != null)
                _buildConclusionSection(profile, isRussian, userPrefs),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(
      TestProfile profile, bool isRussian, UserPreferencesProvider userPrefs) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: userPrefs.isDarkMode
              ? [const Color(0xFF2E3A59), const Color(0xFF1F2937)]
              : [Colors.white, const Color(0xFFF8F9FA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
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
          // Название профиля
          Text(
            isRussian ? profile.name['ru']! : profile.name['en']!,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: userPrefs.isDarkMode ? Colors.white : Colors.black87,
            ),
          ),

          const SizedBox(height: 16),

          // Описание
          Text(
            isRussian
                ? profile.description['ru']!
                : profile.description['en']!,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: userPrefs.isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),

          const SizedBox(height: 20),

          // Почему этот профиль
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: userPrefs.isDarkMode
                  ? Colors.white.withOpacity(0.05)
                  : Colors.blue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.help_outline,
                      size: 20,
                      color: userPrefs.isDarkMode
                          ? Colors.white70
                          : Colors.blue[700],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isRussian ? 'Почему этот профиль?' : 'Why this profile?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: userPrefs.isDarkMode
                            ? Colors.white70
                            : Colors.blue[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  isRussian
                      ? profile.whyThisProfile['ru']!
                      : profile.whyThisProfile['en']!,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: userPrefs.isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScalesSection(bool isRussian, UserPreferencesProvider userPrefs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isRussian ? 'Ваши шкалы' : 'Your Scales',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: userPrefs.isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        ...widget.result.scalePercentages.entries.map((entry) {
          final scaleId = entry.key;
          final percentage = entry.value;
          final scaleName = _service.getScaleName(scaleId);
          final icon = _service.getScaleIcon(scaleId);

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildScaleBar(
              label: isRussian ? scaleName['ru']! : scaleName['en']!,
              percentage: percentage,
              icon: icon,
              userPrefs: userPrefs,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildScaleBar({
    required String label,
    required double percentage,
    required String icon,
    required UserPreferencesProvider userPrefs,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: userPrefs.isDarkMode ? const Color(0xFF2E3A59) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                icon,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: userPrefs.isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ),
              Text(
                '${percentage.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: userPrefs.themeColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 8,
              backgroundColor: userPrefs.isDarkMode
                  ? Colors.white.withOpacity(0.1)
                  : Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                userPrefs.themeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProblemsSection(
      TestProfile profile, bool isRussian, UserPreferencesProvider userPrefs) {
    final problems = profile.vulnerabilities[isRussian ? 'ru' : 'en']!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: Colors.orange[700],
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              isRussian ? 'Проблемы' : 'Problems',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: userPrefs.isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...problems.map((problem) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.red[400],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      problem,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color:
                            userPrefs.isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildRecommendationsSection(
      TestProfile profile, bool isRussian, UserPreferencesProvider userPrefs) {
    final recommendations = profile.recommendations[isRussian ? 'ru' : 'en']!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.lightbulb_outline,
              color: Colors.amber[700],
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              isRussian ? 'Рекомендации' : 'Recommendations',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: userPrefs.isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...recommendations.map((recommendation) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 16,
                      color: Colors.green[400],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      recommendation,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color:
                            userPrefs.isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildTryTodaySection(
      TestProfile profile, bool isRussian, UserPreferencesProvider userPrefs) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            userPrefs.themeColor.withOpacity(0.1),
            userPrefs.themeColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: userPrefs.themeColor.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.today,
                color: userPrefs.themeColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                isRussian ? 'Попробуйте сегодня' : 'Try Today',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: userPrefs.isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            isRussian ? profile.tryToday['ru']! : profile.tryToday['en']!,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: userPrefs.isDarkMode ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConclusionSection(
      TestProfile profile, bool isRussian, UserPreferencesProvider userPrefs) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: userPrefs.isDarkMode
              ? [const Color(0xFF6B46C1), const Color(0xFF805AD5)]
              : [const Color(0xFF9F7AEA), const Color(0xFFB794F4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.auto_awesome,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(height: 12),
          Text(
            isRussian
                ? profile.inspiringConclusion['ru']!
                : profile.inspiringConclusion['en']!,
            style: const TextStyle(
              fontSize: 17,
              height: 1.6,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
