import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/test_model.dart';
import '../providers/test_provider.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../data/ipip_big_five_data.dart';
import '../data/love_profile_data.dart';
import '../data/digital_career_fit_data.dart';
import '../data/romantic_potential_data.dart';
import '../data/relationship_compatibility_data.dart';
import '../data/friendship_psychology_data.dart';
import '../utils/theme_utils.dart';
import '../constants/color_constants.dart';
import '../config/summary_config.dart';
import '../services/profile_service.dart';
import '../models/test_profile_model.dart';

class TestResultScreen extends StatefulWidget {
  final TestResult result;

  const TestResultScreen({super.key, required this.result});

  @override
  State<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  bool _showRecommendations = false;
  bool _showAllScales = false; // Показывать все шкалы или только примеры

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final prefsProvider = Provider.of<UserPreferencesProvider>(context);
    final languageCode = localeProvider.locale.languageCode;
    final themeColor = prefsProvider.themeColor;
    final testProvider = Provider.of<TestProvider>(context, listen: false);
    final test = testProvider.getTestById(widget.result.testId);
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    if (test == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(languageCode == 'ru' ? 'Ошибка' : 'Error'),
          backgroundColor: themeColor,
          foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
        ),
        body: Center(
          child: Text(languageCode == 'ru' ? 'Тест не найден' : 'Test not found'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${languageCode == 'ru' ? 'Результат' : 'Result'}: ${test.getTitle(languageCode)}',
        ),
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
                      // Для Love Profile показываем специальную карточку с индексом любви
                      if (widget.result.testId == 'love_profile') ...[
                        _buildLoveIndexCard(widget.result, languageCode, themeColor, isDark),
                        const SizedBox(height: 30),
                        _buildDisclaimerCard(languageCode, isDark),
                      ] else if (widget.result.testId == 'digital_career_fit_v1') ...[
                        // Digital Career Fit - показываем карточку профиля
                        _buildDigitalCareerProfileCard(widget.result, languageCode, themeColor, isDark),
                      ] else if (widget.result.testId == 'romantic_potential_v1') ...[
                        // Romantic Potential - показываем карточку профиля
                        _buildRomanticProfileCard(widget.result, languageCode, themeColor, isDark),
                      ] else if (widget.result.testId == 'relationship_compatibility_v1') ...[
                        // Relationship Compatibility - показываем карточку профиля совместимости
                        _buildRelationshipCompatibilityProfileCard(widget.result, languageCode, themeColor, isDark),
                      ] else if (widget.result.testId == 'friendship_psychology_v1') ...[
                        // Friendship Psychology - показываем карточку профиля дружбы
                        _buildFriendshipPsychologyProfileCard(widget.result, languageCode, themeColor, isDark),
                      ] else
                        _buildResultCard(widget.result, languageCode, themeColor, isDark),
                      const SizedBox(height: 30),
                      // Если это многофакторный тест, показываем шкалы
                      if (widget.result.factorScores != null) ...[
                        _buildFactorScoresSection(widget.result, languageCode, themeColor, isDark),
                        // Персональные рекомендации для Love Profile
                        if (widget.result.testId == 'love_profile') ...[
                          const SizedBox(height: 30),
                          _buildRecommendationsSection(widget.result, languageCode, themeColor, isDark),
                        ],
                        // Расширенный профиль для Digital Career Fit
                        if (widget.result.testId == 'digital_career_fit_v1') ...[
                          const SizedBox(height: 30),
                          _buildDigitalCareerExtendedSection(widget.result, languageCode, themeColor, isDark),
                        ],
                        // Расширенный профиль для Romantic Potential
                        if (widget.result.testId == 'romantic_potential_v1') ...[
                          const SizedBox(height: 30),
                          _buildRomanticExtendedSection(widget.result, languageCode, themeColor, isDark),
                        ],
                        // Расширенный профиль для Relationship Compatibility
                        if (widget.result.testId == 'relationship_compatibility_v1') ...[
                          const SizedBox(height: 30),
                          _buildRelationshipCompatibilityExtendedSection(widget.result, languageCode, themeColor, isDark),
                        ],
                        // Расширенный профиль для Friendship Psychology
                        if (widget.result.testId == 'friendship_psychology_v1') ...[
                          const SizedBox(height: 30),
                          _buildFriendshipPsychologyExtendedSection(widget.result, languageCode, themeColor, isDark),
                        ],
                      ] else
                        ...[
                          _buildScoreCard(widget.result, languageCode, themeColor, isDark),
                          const SizedBox(height: 30),
                          _buildInterpretationCard(widget.result, languageCode, isDark),
                        ],
                      const SizedBox(height: 30),
                      // Универсальная секция профиля для тестов, которые поддерживают ProfileService
                      // (кроме тех, у которых уже есть специальная визуализация выше)
                      if (_shouldShowUniversalProfile(widget.result.testId))
                        _buildUniversalProfileSection(widget.result, languageCode, themeColor, isDark),
                      const SizedBox(height: 30),
                      // Показываем информацию о шкалах
                      _buildAffectedScalesSection(widget.result.testId, languageCode, themeColor, isDark),
                      const SizedBox(height: 30),
                      _buildActionButtons(context, languageCode, test, isDark),
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

  /// Проверяет, нужно ли показывать универсальную секцию профиля
  /// Исключаем тесты, у которых уже есть специальная визуализация
  bool _shouldShowUniversalProfile(String testId) {
    // Тесты со специальной визуализацией (уже обрабатываются выше)
    const specialTests = {
      'love_profile',
      'digital_career_fit_v1',
      'romantic_potential_v1',
      'relationship_compatibility_v1',
      'friendship_psychology_v1',
    };

    if (specialTests.contains(testId)) {
      return false;
    }

    // Показываем только если тест поддерживает профили
    return ProfileService.supportsProfiles(testId);
  }

  /// Универсальная секция профиля для всех тестов с поддержкой ProfileService
  Widget _buildUniversalProfileSection(TestResult result, String languageCode, Color themeColor, bool isDark) {
    // Определяем профиль
    final profileId = ProfileService.determineProfileId(result);
    if (profileId == null) {
      return const SizedBox.shrink();
    }

    // Получаем профиль
    final profile = ProfileService.getProfile(result.testId, profileId);
    if (profile == null) {
      return const SizedBox.shrink();
    }

    // Получаем иконку для профиля
    final profileIcon = ProfileService.getProfileIcon(result.testId, profileId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок секции профиля
        _buildProfileHeader(profile, profileIcon, languageCode, themeColor, isDark),
        const SizedBox(height: 20),

        // Секция 2: Почему этот профиль
        if (profile.whyThisProfile[languageCode]?.isNotEmpty == true)
          _buildProfileInfoCard(
            title: languageCode == 'ru' ? '🎯 Почему этот профиль' : '🎯 Why This Profile',
            content: profile.whyThisProfile[languageCode]!,
            themeColor: themeColor,
            isDark: isDark,
          ),

        // Секция 3: Сильные стороны
        if (profile.strengths[languageCode]?.isNotEmpty == true) ...[
          const SizedBox(height: 16),
          _buildProfileListCard(
            title: languageCode == 'ru' ? '💪 Сильные стороны' : '💪 Strengths',
            items: profile.strengths[languageCode]!,
            icon: Icons.star_outline,
            themeColor: themeColor,
            isDark: isDark,
          ),
        ],

        // Секция 4: Уязвимости (если есть)
        if (profile.vulnerabilities[languageCode]?.isNotEmpty == true) ...[
          const SizedBox(height: 16),
          _buildProfileListCard(
            title: languageCode == 'ru' ? '⚠️ На что обратить внимание' : '⚠️ Areas to Watch',
            items: profile.vulnerabilities[languageCode]!,
            icon: Icons.warning_amber_outlined,
            themeColor: Colors.orange,
            isDark: isDark,
          ),
        ],

        // Секция 5: Рекомендации
        if (profile.recommendations[languageCode]?.isNotEmpty == true) ...[
          const SizedBox(height: 16),
          _buildProfileListCard(
            title: languageCode == 'ru' ? '📚 Рекомендации' : '📚 Recommendations',
            items: profile.recommendations[languageCode]!,
            icon: Icons.lightbulb_outline,
            themeColor: themeColor,
            isDark: isDark,
          ),
        ],

        // Секция 6: Что попробовать сегодня
        if (profile.tryToday[languageCode]?.isNotEmpty == true) ...[
          const SizedBox(height: 16),
          _buildProfileInfoCard(
            title: languageCode == 'ru' ? '🎯 Попробуйте сегодня' : '🎯 Try Today',
            content: profile.tryToday[languageCode]!,
            themeColor: themeColor,
            isDark: isDark,
            icon: Icons.today,
          ),
        ],

        // Секция 7: Вдохновляющий вывод
        if (profile.inspiringConclusion[languageCode]?.isNotEmpty == true) ...[
          const SizedBox(height: 16),
          _buildInspiringCard(
            profile.inspiringConclusion[languageCode]!,
            themeColor,
            isDark,
          ),
        ],
      ],
    );
  }

  /// Заголовок профиля с иконкой и названием
  Widget _buildProfileHeader(TestProfile profile, IconData icon, String languageCode, Color themeColor, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark ? [
            themeColor.withOpacity(0.2),
            themeColor.withOpacity(0.1),
          ] : [
            themeColor.withOpacity(0.15),
            themeColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: themeColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Иконка
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: themeColor.withOpacity(isDark ? 0.3 : 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 40,
              color: isDark ? Colors.white : themeColor,
            ),
          ),
          const SizedBox(height: 16),
          // Подзаголовок
          Text(
            languageCode == 'ru' ? 'Ваш профиль' : 'Your Profile',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          // Название профиля
          Text(
            profile.name[languageCode] ?? '',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : themeColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // Описание
          Text(
            profile.description[languageCode] ?? '',
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Карточка с текстовой информацией
  Widget _buildProfileInfoCard({
    required String title,
    required String content,
    required Color themeColor,
    required bool isDark,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: isDark ? null : [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
              if (icon != null) ...[
                Icon(icon, color: themeColor, size: 20),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : themeColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  /// Карточка со списком элементов
  Widget _buildProfileListCard({
    required String title,
    required List<String> items,
    required IconData icon,
    required Color themeColor,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: isDark ? null : [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
              Icon(icon, color: themeColor, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : themeColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: themeColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: isDark ? Colors.grey[300] : Colors.grey[700],
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

  /// Вдохновляющая карточка
  Widget _buildInspiringCard(String text, Color themeColor, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark ? [
            themeColor.withOpacity(0.15),
            themeColor.withOpacity(0.08),
          ] : [
            themeColor.withOpacity(0.1),
            themeColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: themeColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.auto_awesome,
            color: themeColor,
            size: 28,
          ),
          const SizedBox(height: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildResultCard(TestResult result, String languageCode, Color themeColor, bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark ? [
            AppColors.darkCard,
            AppColors.darkSurfaceHigh,
          ] : [
            themeColor.withOpacity(0.1),
            themeColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : themeColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.analytics,
            size: 60,
            color: isDark ? Colors.white : themeColor,
          ),
          const SizedBox(height: 15),
          Text(
            languageCode == 'ru' ? 'Тест завершен!' : 'Test completed!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : themeColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${languageCode == 'ru' ? 'Завершено' : 'Completed'}: ${_formatDate(result.completedAt, languageCode)}',
            style: TextStyle(
              fontSize: 14,
              color: ThemeUtils.getSecondaryTextColor(brightness),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoveIndexCard(TestResult result, String languageCode, Color themeColor, bool isDark) {
    // Расчет Итогового индекса любви (ИИЛ) - среднее всех шкал
    double loveIndex = 0;
    if (result.factorScores != null) {
      double totalPercentage = 0;
      result.factorScores!.forEach((key, value) {
        totalPercentage += value.percentage;
      });
      loveIndex = totalPercentage / result.factorScores!.length;
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
            LoveProfileData.calculateLoveIndex(result.factorScores!, languageCode),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 15),
          // Дата и время прохождения теста
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _formatDate(result.completedAt, languageCode),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
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

  Widget _buildFactorScoresSection(TestResult result, String languageCode, Color themeColor, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          languageCode == 'ru' ? 'Ваши результаты по факторам' : 'Your Factor Scores',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        ...result.factorScores!.entries.map((entry) {
          return _buildFactorCard(entry.value, languageCode, isDark);
        }).toList(),
      ],
    );
  }

  Widget _buildFactorCard(FactorScore factorScore, String languageCode, bool isDark) {
    return _FactorCard(
      factorScore: factorScore,
      languageCode: languageCode,
      isDark: isDark,
      testId: widget.result.testId,
      getFactorScoreColor: _getFactorScoreColor,
    );
  }

  Widget _buildScoreCard(TestResult result, String languageCode, Color themeColor, bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeUtils.getCardColor(brightness),
        borderRadius: BorderRadius.circular(15),
        boxShadow: ThemeUtils.getCardShadow(brightness),
      ),
      child: Column(
        children: [
          Text(
            languageCode == 'ru' ? 'Ваш результат' : 'Your Result',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildScoreItem(
                languageCode == 'ru' ? 'Баллы' : 'Score',
                '${result.totalScore}',
                '${languageCode == 'ru' ? 'из' : 'of'} ${result.maxScore}',
                themeColor,
                isDark,
              ),
              Container(
                width: 1,
                height: 60,
                color: isDark ? Colors.grey[600] : Colors.grey.withOpacity(0.3),
              ),
              _buildScoreItem(
                languageCode == 'ru' ? 'Процент' : 'Percent',
                '${result.percentage.round()}%',
                languageCode == 'ru' ? 'выполнения' : 'completion',
                Colors.green,
                isDark,
              ),
            ],
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            value: result.percentage / 100,
            backgroundColor: isDark ? Colors.grey[700] : Colors.grey.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(
              _getScoreColor(result.percentage),
            ),
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildScoreItem(String title, String value, String subtitle, Color color, bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: ThemeUtils.getSecondaryTextColor(brightness),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildInterpretationCard(TestResult result, String languageCode, bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.blue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.psychology,
                color: isDark ? Colors.blue[300] : Colors.blue,
                size: 24,
              ),
              const SizedBox(width: 10),
              Text(
                languageCode == 'ru' ? 'Интерпретация' : 'Interpretation',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.blue[300] : Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            result.interpretation,
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.white : Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, String languageCode, TestModel test, bool isDark) {
    final themeColor = Provider.of<UserPreferencesProvider>(context).themeColor;
    final backgroundColor = isDark ? AppColors.darkCard : themeColor;
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
              backgroundColor: backgroundColor,
              foregroundColor: isDark ? Colors.white : ThemeUtils.getButtonTextColor(themeColor),
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

  Widget _buildRecommendationsSection(TestResult result, String languageCode, Color themeColor, bool isDark) {
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
          ...result.factorScores!.entries.map((entry) {
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

  Color _getScoreColor(double percentage) {
    if (percentage >= 80) return Colors.green;
    if (percentage >= 60) return Colors.orange;
    if (percentage >= 40) return Colors.amber;
    return Colors.red;
  }

  Color _getFactorScoreColor(double percentage) {
    if (percentage >= 70) return Colors.green;
    if (percentage >= 50) return Colors.blue;
    if (percentage >= 30) return Colors.orange;
    return Colors.red;
  }

  String _formatDate(DateTime date, String languageCode) {
    if (languageCode == 'ru') {
      return '${date.day}.${date.month}.${date.year} в ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } else {
      return '${date.month}/${date.day}/${date.year} at ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    }
  }

  /// Build affected scales section showing which psychological scales this test influences
  Widget _buildAffectedScalesSection(String testId, String languageCode, Color themeColor, bool isDark) {
    final scaleCount = QuestionWeightsConfig.getScaleCount(testId);

    // Если тест не влияет на шкалы (или нет весов), не показываем секцию
    if (scaleCount == 0) {
      return const SizedBox.shrink();
    }

    final affectedScales = QuestionWeightsConfig.getAffectedScales(testId);
    final sortedScales = affectedScales.toList()..sort();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : themeColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.psychology_outlined,
                color: themeColor,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  languageCode == 'ru'
                      ? 'Влияние на психологические шкалы'
                      : 'Impact on Psychological Scales',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            languageCode == 'ru'
                ? 'Этот тест влияет на $scaleCount психологических шкал из 195 доступных. Результаты учитываются при расчёте общего профиля личности.'
                : 'This test affects $scaleCount psychological scales out of 195 available. Results are used to calculate your overall personality profile.',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurfaceHigh : themeColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageCode == 'ru' ? 'Примеры шкал:' : 'Example scales:',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: (_showAllScales ? sortedScales : sortedScales.take(10)).map((scaleId) {
                    final scaleName = _getScaleDisplayName(scaleId, languageCode);
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.grey[800] : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDark ? Colors.grey[700]! : themeColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        scaleName,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                if (sortedScales.length > 10) ...[
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _showAllScales = !_showAllScales;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.grey[800] : themeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: themeColor.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _showAllScales
                                ? (languageCode == 'ru' ? 'Скрыть' : 'Hide')
                                : (languageCode == 'ru'
                                    ? 'Показать все ${sortedScales.length} шкал'
                                    : 'Show all ${sortedScales.length} scales'),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: themeColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            _showAllScales ? Icons.expand_less : Icons.expand_more,
                            color: themeColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Get display name for a scale (simplified translation)
  String _getScaleDisplayName(String scaleId, String languageCode) {
    // Простые переводы основных шкал
    final translations = {
      // Эмоциональные шкалы
      'anxiety': {'ru': 'Тревожность', 'en': 'Anxiety'},
      'stress_tolerance': {'ru': 'Стрессоустойчивость', 'en': 'Stress Tolerance'},
      'depression': {'ru': 'Депрессия', 'en': 'Depression'},
      'vitality': {'ru': 'Жизненная энергия', 'en': 'Vitality'},
      'emotional_resilience': {'ru': 'Эмоц. устойчивость', 'en': 'Emotional Resilience'},
      'mood_stability': {'ru': 'Стабильность настр.', 'en': 'Mood Stability'},
      'positive_emotions': {'ru': 'Позитивные эмоции', 'en': 'Positive Emotions'},
      'calmness': {'ru': 'Спокойствие', 'en': 'Calmness'},

      // Мотивационные шкалы
      'motivation': {'ru': 'Мотивация', 'en': 'Motivation'},
      'work_satisfaction': {'ru': 'Удовл. работой', 'en': 'Work Satisfaction'},
      'self_efficacy': {'ru': 'Самоэффективность', 'en': 'Self-Efficacy'},
      'competence': {'ru': 'Компетентность', 'en': 'Competence'},

      // Социальные шкалы
      'empathy': {'ru': 'Эмпатия', 'en': 'Empathy'},
      'warmth': {'ru': 'Теплота', 'en': 'Warmth'},
      'activity': {'ru': 'Активность', 'en': 'Activity'},
      'values': {'ru': 'Ценности', 'en': 'Values'},

      // Personality Type шкалы (8 униполярных)
      'extraversion': {'ru': 'Экстраверсия', 'en': 'Extraversion'},
      'introversion': {'ru': 'Интроверсия', 'en': 'Introversion'},
      'sensing': {'ru': 'Сенсорика', 'en': 'Sensing'},
      'intuition': {'ru': 'Интуиция', 'en': 'Intuition'},
      'thinking': {'ru': 'Мышление', 'en': 'Thinking'},
      'feeling': {'ru': 'Чувства', 'en': 'Feeling'},
      'judging': {'ru': 'Суждение', 'en': 'Judging'},
      'perceiving': {'ru': 'Восприятие', 'en': 'Perceiving'},
    };

    if (translations.containsKey(scaleId)) {
      return translations[scaleId]![languageCode] ?? scaleId;
    }

    // Если перевода нет, форматируем snake_case в читаемый вид
    return scaleId
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  // ============================================================================
  // DIGITAL CAREER FIT - Карточка профиля
  // ============================================================================

  Widget _buildDigitalCareerProfileCard(TestResult result, String languageCode, Color themeColor, bool isDark) {
    // Вычисляем проценты по шкалам
    final percentages = <String, double>{};
    if (result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        final factor = entry.value;
        final percentage = factor.maxScore > 0
            ? (factor.score / factor.maxScore) * 100
            : 0.0;
        percentages[entry.key] = percentage;
      }
    }

    // Определяем профиль
    final profileId = DigitalCareerFitData.determineProfile(percentages);
    final profile = DigitalCareerFitData.getProfile(profileId);

    if (profile == null) {
      return _buildResultCard(result, languageCode, themeColor, isDark);
    }

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark ? [
            AppColors.darkCard,
            AppColors.darkSurfaceHigh,
          ] : [
            themeColor.withOpacity(0.15),
            themeColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : themeColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Иконка профиля
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: themeColor.withOpacity(isDark ? 0.3 : 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getProfileIcon(profileId),
              size: 50,
              color: isDark ? Colors.white : themeColor,
            ),
          ),
          const SizedBox(height: 20),
          // Название профиля
          Text(
            languageCode == 'ru' ? 'Ваш цифровой профиль' : 'Your Digital Profile',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            profile.getName(languageCode),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : themeColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Описание профиля
          Text(
            profile.getDescription(languageCode),
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _getProfileIcon(String profileId) {
    switch (profileId) {
      case 'profile_product_manager':
        return Icons.lightbulb_outline;
      case 'profile_data_analyst':
        return Icons.analytics_outlined;
      case 'profile_ux_designer':
        return Icons.brush_outlined;
      case 'profile_content_marketer':
        return Icons.campaign_outlined;
      case 'profile_project_manager':
        return Icons.people_outline;
      case 'profile_developer':
        return Icons.code;
      case 'profile_mixed':
        return Icons.hub_outlined;
      default:
        return Icons.work_outline;
    }
  }

  Widget _buildDigitalCareerExtendedSection(TestResult result, String languageCode, Color themeColor, bool isDark) {
    // Вычисляем проценты по шкалам
    final percentages = <String, double>{};
    if (result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        final factor = entry.value;
        final percentage = factor.maxScore > 0
            ? (factor.score / factor.maxScore) * 100
            : 0.0;
        percentages[entry.key] = percentage;
      }
    }

    // Определяем профиль
    final profileId = DigitalCareerFitData.determineProfile(percentages);
    final profile = DigitalCareerFitData.getProfile(profileId);

    if (profile == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Характеристики
        _buildSectionCard(
          title: languageCode == 'ru' ? 'Ваши сильные стороны' : 'Your Strengths',
          icon: Icons.star_outline,
          items: profile.getCharacteristics(languageCode),
          themeColor: themeColor,
          isDark: isDark,
        ),
        const SizedBox(height: 20),
        // Подходящие роли
        _buildSectionCard(
          title: languageCode == 'ru' ? 'Подходящие направления' : 'Suitable Directions',
          icon: Icons.work_outline,
          items: profile.getSuitableRoles(languageCode),
          themeColor: themeColor,
          isDark: isDark,
        ),
        const SizedBox(height: 20),
        // Рекомендации
        _buildSectionCard(
          title: languageCode == 'ru' ? 'Как развиваться' : 'How to Develop',
          icon: Icons.trending_up,
          items: profile.getRecommendations(languageCode),
          themeColor: themeColor,
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<String> items,
    required Color themeColor,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: isDark ? null : [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
                icon,
                color: themeColor,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: themeColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: isDark ? Colors.grey[300] : Colors.grey[700],
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

  // ============================================================================
  // ROMANTIC POTENTIAL - Карточка профиля (7 секций)
  // ============================================================================

  Widget _buildRomanticProfileCard(TestResult result, String languageCode, Color themeColor, bool isDark) {
    // Вычисляем проценты по шкалам
    final percentages = <String, double>{};
    if (result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        final factor = entry.value;
        final percentage = factor.maxScore > 0
            ? (factor.score / factor.maxScore) * 100
            : 0.0;
        percentages[entry.key] = percentage;
      }
    }

    // Определяем профиль
    final profileId = RomanticPotentialData.determineProfile(percentages);
    final profile = RomanticPotentialData.getProfile(profileId);

    if (profile == null) {
      return _buildResultCard(result, languageCode, themeColor, isDark);
    }

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark ? [
            AppColors.darkCard,
            AppColors.darkSurfaceHigh,
          ] : [
            themeColor.withOpacity(0.15),
            themeColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : themeColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Иконка профиля
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: themeColor.withOpacity(isDark ? 0.3 : 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getRomanticProfileIcon(profileId),
              size: 50,
              color: isDark ? Colors.white : themeColor,
            ),
          ),
          const SizedBox(height: 20),
          // Название профиля
          Text(
            languageCode == 'ru' ? 'Ваш романтический профиль' : 'Your Romantic Profile',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            profile.getName(languageCode),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : themeColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Описание профиля (секция 2: Почему именно он)
          Text(
            profile.getDescription(languageCode),
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _getRomanticProfileIcon(String profileId) {
    switch (profileId) {
      case 'profile_secure_romantic':
        return Icons.favorite;
      case 'profile_mixed_romantic':
        return Icons.favorite_border;
      case 'profile_romantic_challenges':
        return Icons.healing;
      default:
        return Icons.favorite_outline;
    }
  }

  Widget _buildRomanticExtendedSection(TestResult result, String languageCode, Color themeColor, bool isDark) {
    // Вычисляем проценты по шкалам
    final percentages = <String, double>{};
    if (result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        final factor = entry.value;
        final percentage = factor.maxScore > 0
            ? (factor.score / factor.maxScore) * 100
            : 0.0;
        percentages[entry.key] = percentage;
      }
    }

    // Определяем профиль
    final profileId = RomanticPotentialData.determineProfile(percentages);
    final profile = RomanticPotentialData.getProfile(profileId);

    if (profile == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Секция 3: Характеристики
        _buildRomanticSection(
          languageCode == 'ru' ? '💪 Ваши характеристики' : '💪 Your Characteristics',
          profile.getCharacteristics(languageCode),
          themeColor,
          isDark,
        ),
        const SizedBox(height: 20),
        // Секция 4: Подходящие роли
        _buildRomanticSection(
          languageCode == 'ru' ? '💼 Подходящие роли' : '💼 Suitable Roles',
          profile.getSuitableRoles(languageCode),
          themeColor,
          isDark,
        ),
        const SizedBox(height: 20),
        // Секция 5: Рекомендации
        _buildRomanticSection(
          languageCode == 'ru' ? '📚 Рекомендации' : '📚 Recommendations',
          profile.getRecommendations(languageCode),
          themeColor,
          isDark,
        ),
        const SizedBox(height: 20),
        // Секция 6: Что попробовать сегодня
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCard : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                languageCode == 'ru' ? '🎯 Что попробовать сегодня' : '🎯 What to Try Today',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : themeColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                profile.getTryToday(languageCode),
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: isDark ? Colors.grey[300] : Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Секция 7: Вдохновляющий вывод
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: themeColor.withOpacity(isDark ? 0.2 : 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            profile.getInspiringMessage(languageCode),
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              fontStyle: FontStyle.italic,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildRomanticSection(String title, List<String> items, Color themeColor, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : themeColor,
            ),
          ),
          const SizedBox(height: 10),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 18,
                  color: themeColor,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: isDark ? Colors.grey[300] : Colors.grey[700],
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

  // ============================================================================
  // RELATIONSHIP COMPATIBILITY - Карточка профиля совместимости
  // ============================================================================

  Widget _buildRelationshipCompatibilityProfileCard(TestResult result, String languageCode, Color themeColor, bool isDark) {
    // Вычисляем проценты по шкалам
    final percentages = <String, double>{};
    if (result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        final factor = entry.value;
        final percentage = factor.maxScore > 0
            ? (factor.score / factor.maxScore) * 100
            : 0.0;
        percentages[entry.key] = percentage;
      }
    }

    // Определяем профиль
    final profileId = RelationshipCompatibilityData.determineProfile(percentages);
    final profile = RelationshipCompatibilityData.getProfile(profileId);

    if (profile == null) {
      return _buildResultCard(result, languageCode, themeColor, isDark);
    }

    // Определяем цвет профиля
    final profileColor = _getRelationshipProfileColor(profileId);

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark ? [
            AppColors.darkCard,
            AppColors.darkSurfaceHigh,
          ] : [
            profileColor.withOpacity(0.15),
            profileColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : profileColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Иконка профиля
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: profileColor.withOpacity(isDark ? 0.3 : 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getRelationshipProfileIcon(profileId),
              size: 50,
              color: isDark ? Colors.white : profileColor,
            ),
          ),
          const SizedBox(height: 20),
          // Название профиля
          Text(
            languageCode == 'ru' ? 'Ваш профиль совместимости' : 'Your Compatibility Profile',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            profile.getName(languageCode),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : profileColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Описание профиля
          Text(
            profile.getDescription(languageCode),
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _getRelationshipProfileIcon(String profileId) {
    switch (profileId) {
      case 'profile_perfect_match':
        return Icons.favorite;
      case 'profile_good_potential':
        return Icons.thumb_up_outlined;
      case 'profile_needs_alignment':
        return Icons.sync_problem_outlined;
      default:
        return Icons.favorite_border;
    }
  }

  Color _getRelationshipProfileColor(String profileId) {
    switch (profileId) {
      case 'profile_perfect_match':
        return Colors.green;
      case 'profile_good_potential':
        return Colors.blue;
      case 'profile_needs_alignment':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Widget _buildRelationshipCompatibilityExtendedSection(TestResult result, String languageCode, Color themeColor, bool isDark) {
    // Вычисляем проценты по шкалам
    final percentages = <String, double>{};
    if (result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        final factor = entry.value;
        final percentage = factor.maxScore > 0
            ? (factor.score / factor.maxScore) * 100
            : 0.0;
        percentages[entry.key] = percentage;
      }
    }

    // Определяем профиль
    final profileId = RelationshipCompatibilityData.determineProfile(percentages);
    final profile = RelationshipCompatibilityData.getProfile(profileId);

    if (profile == null) {
      return const SizedBox.shrink();
    }

    final profileColor = _getRelationshipProfileColor(profileId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Сильные стороны (характеристики)
        _buildSectionCard(
          title: languageCode == 'ru' ? 'Ваши сильные стороны' : 'Your Strengths',
          icon: Icons.star_outline,
          items: profile.getCharacteristics(languageCode),
          themeColor: profileColor,
          isDark: isDark,
        ),
        const SizedBox(height: 20),
        // Подходящие типы отношений (роли)
        _buildSectionCard(
          title: languageCode == 'ru' ? 'Подходящие типы отношений' : 'Suitable Relationship Types',
          icon: Icons.favorite_outline,
          items: profile.getSuitableRoles(languageCode),
          themeColor: profileColor,
          isDark: isDark,
        ),
        const SizedBox(height: 20),
        // Рекомендации по развитию
        _buildSectionCard(
          title: languageCode == 'ru' ? 'Рекомендации по развитию' : 'Development Recommendations',
          icon: Icons.trending_up,
          items: profile.getRecommendations(languageCode),
          themeColor: profileColor,
          isDark: isDark,
        ),
        const SizedBox(height: 20),
        // Что попробовать сегодня
        _buildTryTodayCard(
          profile.getTryToday(languageCode),
          profileColor,
          isDark,
          languageCode,
        ),
        const SizedBox(height: 20),
        // Вдохновляющее сообщение
        _buildInspiringMessageCard(
          profile.getInspiringMessage(languageCode),
          profileColor,
          isDark,
          languageCode,
        ),
      ],
    );
  }

  Widget _buildTryTodayCard(String text, Color themeColor, bool isDark, String languageCode) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : themeColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : themeColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.today,
                color: themeColor,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  languageCode == 'ru' ? 'Попробуйте сегодня' : 'Try Today',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInspiringMessageCard(String text, Color themeColor, bool isDark, String languageCode) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark ? [
            themeColor.withOpacity(0.2),
            themeColor.withOpacity(0.1),
          ] : [
            themeColor.withOpacity(0.15),
            themeColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: themeColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_awesome,
                color: themeColor,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  languageCode == 'ru' ? 'Вдохновляющая мысль' : 'Inspiring Thought',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // FRIENDSHIP PSYCHOLOGY - Карточка профиля дружбы
  // ============================================================================

  Widget _buildFriendshipPsychologyProfileCard(TestResult result, String languageCode, Color themeColor, bool isDark) {
    // Вычисляем проценты по шкалам
    final percentages = <String, double>{};
    if (result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        final factor = entry.value;
        final percentage = factor.maxScore > 0
            ? (factor.score / factor.maxScore) * 100
            : 0.0;
        percentages[entry.key] = percentage;
      }
    }

    // Определяем профиль
    final profileId = FriendshipPsychologyData.determineProfile(percentages);
    final profile = FriendshipPsychologyData.profiles[profileId];

    if (profile == null) {
      return _buildResultCard(result, languageCode, themeColor, isDark);
    }

    // Определяем цвет профиля
    final profileColor = _getFriendshipProfileColor(profileId);

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark ? [
            AppColors.darkCard,
            AppColors.darkSurfaceHigh,
          ] : [
            profileColor.withOpacity(0.15),
            profileColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : profileColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Иконка профиля
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: profileColor.withOpacity(isDark ? 0.3 : 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getFriendshipProfileIcon(profileId),
              size: 50,
              color: isDark ? Colors.white : profileColor,
            ),
          ),
          const SizedBox(height: 20),
          // Название профиля
          Text(
            languageCode == 'ru' ? 'Ваш стиль дружбы' : 'Your Friendship Style',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            profile.getName(languageCode),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : profileColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Описание профиля
          Text(
            profile.getDescription(languageCode),
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDark ? Colors.grey[300] : Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _getFriendshipProfileIcon(String profileId) {
    switch (profileId) {
      case 'profile_deep_intimate':
        return Icons.favorite;
      case 'profile_loyal_classic':
        return Icons.handshake;
      case 'profile_social_butterfly':
        return Icons.groups;
      case 'profile_free_independent':
        return Icons.directions_run;
      case 'profile_support_giver':
        return Icons.volunteer_activism;
      case 'profile_activity_partner':
        return Icons.sports_tennis;
      case 'profile_mentor_guide':
        return Icons.school;
      case 'profile_equal_balance':
        return Icons.balance;
      case 'profile_cautious_observer':
        return Icons.visibility;
      case 'profile_crisis_helper':
        return Icons.local_hospital;
      case 'profile_emotional_anchor':
        return Icons.anchor;
      case 'profile_growth_partner':
        return Icons.trending_up;
      case 'profile_mixed':
        return Icons.diversity_3;
      default:
        return Icons.people_outline;
    }
  }

  Color _getFriendshipProfileColor(String profileId) {
    switch (profileId) {
      case 'profile_deep_intimate':
        return Colors.pink;
      case 'profile_loyal_classic':
        return Colors.blue;
      case 'profile_social_butterfly':
        return Colors.orange;
      case 'profile_free_independent':
        return Colors.teal;
      case 'profile_support_giver':
        return Colors.green;
      case 'profile_activity_partner':
        return Colors.amber;
      case 'profile_mentor_guide':
        return Colors.purple;
      case 'profile_equal_balance':
        return Colors.indigo;
      case 'profile_cautious_observer':
        return Colors.blueGrey;
      case 'profile_crisis_helper':
        return Colors.red;
      case 'profile_emotional_anchor':
        return Colors.cyan;
      case 'profile_growth_partner':
        return Colors.lime;
      case 'profile_mixed':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  Widget _buildFriendshipPsychologyExtendedSection(TestResult result, String languageCode, Color themeColor, bool isDark) {
    // Вычисляем проценты по шкалам
    final percentages = <String, double>{};
    if (result.factorScores != null) {
      for (final entry in result.factorScores!.entries) {
        final factor = entry.value;
        final percentage = factor.maxScore > 0
            ? (factor.score / factor.maxScore) * 100
            : 0.0;
        percentages[entry.key] = percentage;
      }
    }

    // Определяем профиль
    final profileId = FriendshipPsychologyData.determineProfile(percentages);
    final profile = FriendshipPsychologyData.profiles[profileId];

    if (profile == null) {
      return const SizedBox.shrink();
    }

    final profileColor = _getFriendshipProfileColor(profileId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Сильные стороны (характеристики)
        _buildSectionCard(
          title: languageCode == 'ru' ? 'Ваши сильные стороны в дружбе' : 'Your Friendship Strengths',
          icon: Icons.star_outline,
          items: profile.getCharacteristics(languageCode),
          themeColor: profileColor,
          isDark: isDark,
        ),
        const SizedBox(height: 20),
        // Уязвимости (если есть)
        if (profile.vulnerabilities != null && profile.vulnerabilities!.isNotEmpty)
          ...[
            _buildSectionCard(
              title: languageCode == 'ru' ? 'На что обратить внимание' : 'Areas to Watch',
              icon: Icons.warning_amber_outlined,
              items: profile.getVulnerabilities(languageCode),
              themeColor: Colors.orange,
              isDark: isDark,
            ),
            const SizedBox(height: 20),
          ],
        // Подходящие роли в дружбе
        _buildSectionCard(
          title: languageCode == 'ru' ? 'Подходящие роли в дружбе' : 'Suitable Friendship Roles',
          icon: Icons.people_outline,
          items: profile.getSuitableRoles(languageCode),
          themeColor: profileColor,
          isDark: isDark,
        ),
        const SizedBox(height: 20),
        // Рекомендации по развитию
        _buildSectionCard(
          title: languageCode == 'ru' ? 'Рекомендации по развитию' : 'Development Recommendations',
          icon: Icons.trending_up,
          items: profile.getRecommendations(languageCode),
          themeColor: profileColor,
          isDark: isDark,
        ),
        const SizedBox(height: 20),
        // Что попробовать сегодня
        _buildTryTodayCard(
          profile.getTryToday(languageCode),
          profileColor,
          isDark,
          languageCode,
        ),
        const SizedBox(height: 20),
        // Вдохновляющее сообщение
        _buildInspiringMessageCard(
          profile.getInspiringMessage(languageCode),
          profileColor,
          isDark,
          languageCode,
        ),
      ],
    );
  }
}

// Статeful виджет для карточки фактора с раскрывающимся описанием
class _FactorCard extends StatefulWidget {
  final FactorScore factorScore;
  final String languageCode;
  final bool isDark;
  final String testId;
  final Color Function(double) getFactorScoreColor;

  const _FactorCard({
    required this.factorScore,
    required this.languageCode,
    required this.isDark,
    required this.testId,
    required this.getFactorScoreColor,
  });

  @override
  State<_FactorCard> createState() => _FactorCardState();
}

class _FactorCardState extends State<_FactorCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<UserPreferencesProvider>(context).themeColor;
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
                child:                   Text(
                    widget.factorScore.getFactorName(widget.languageCode),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: widget.isDark ? Colors.white : themeColor,
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
                    color: themeColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _isExpanded
                        ? (widget.languageCode == 'ru' ? 'Скрыть подробное описание' : 'Hide detailed description')
                        : (widget.languageCode == 'ru' ? 'Подробное описание фактора' : 'Detailed factor description'),
                    style: TextStyle(
                      color: themeColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Подробное описание (раскрывающееся)
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: widget.isDark ? AppColors.darkSurfaceHigh : themeColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.isDark ? Colors.grey[600]! : themeColor.withOpacity(0.2),
                width: 1,
              ),
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: themeColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.languageCode == 'ru' ? 'О факторе' : 'About this factor',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: themeColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildFormattedText(
                    widget.testId == 'love_profile'
                        ? LoveProfileData.getFactorDescription(widget.factorScore.factorId, widget.languageCode)
                        : (IPIPBigFiveData.getFactorDetailedDescription(widget.factorScore.factorId)[widget.languageCode] ?? ''),
                  ),
                ],
              ),
            ),
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
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
