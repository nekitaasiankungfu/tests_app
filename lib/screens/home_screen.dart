import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/test_provider.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../providers/category_provider.dart';
import '../models/test_category.dart';
import '../utils/theme_utils.dart';
import '../utils/app_logger.dart';
import '../constants/color_constants.dart';
import 'test_screen.dart';
import 'test_disclaimer_screen.dart';
import 'results_screen.dart';
import 'settings_screen.dart';
import 'color_psychology_test_screen.dart';
import 'career_compass_test_screen.dart';
import 'text_conflict_communication_test_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    appLogger.d('Начало построения HomeScreen');
    final localeProvider = Provider.of<LocaleProvider>(context);
    final prefsProvider = Provider.of<UserPreferencesProvider>(context);
    final languageCode = localeProvider.locale.languageCode;
    final themeColor = prefsProvider.themeColor;
    final brightness = Theme.of(context).brightness;
    appLogger.d('Providers загружены');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          languageCode == 'ru' ? 'Психологические тесты' : 'Psychological Tests',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
          ),
        ),
        backgroundColor: themeColor,
        foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
        elevation: 0,
        centerTitle: true,
        actions: [
          // Кнопка настроек
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<TestProvider>(
        builder: (context, testProvider, child) {
          if (testProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final isDark = brightness == Brightness.dark;
          final backgroundColor = isDark ? AppColors.darkBackground : AppColors.lightBackground;
          final surfaceColor = ThemeUtils.getCardColor(brightness);

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
                        const SizedBox(height: 20),
                        _buildWelcomeCard(context, languageCode, prefsProvider),
                        const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        _buildSectionTitle(
                          languageCode == 'ru' ? 'Доступные тесты' : 'Available Tests',
                          themeColor,
                        ),
                        Expanded(
                          child: _buildTestsList(context, testProvider, languageCode, themeColor),
                        ),
                        _buildBottomNavigation(context, testProvider, languageCode, themeColor),
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

  Widget _buildWelcomeCard(BuildContext context, String languageCode, UserPreferencesProvider prefsProvider) {
    final userName = prefsProvider.userName ?? (languageCode == 'ru' ? 'Друг' : 'Friend');
    final themeColor = prefsProvider.themeColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.psychology,
            size: 50,
            color: themeColor,
          ),
          const SizedBox(height: 10),
          Text(
            '${languageCode == 'ru' ? 'Привет' : 'Hello'}, $userName!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: themeColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            languageCode == 'ru'
                ? 'Пройдите психологические тесты для лучшего понимания себя'
                : 'Take psychological tests for better self-understanding',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.grey[300] : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color themeColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: themeColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTestsList(BuildContext context, TestProvider testProvider, String languageCode, Color themeColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final categoryProvider = Provider.of<CategoryProvider>(context);

    // Group tests by category
    final testsByCategory = <String, List<dynamic>>{};
    for (final test in testProvider.tests) {
      final categoryId = test.categoryId;
      if (!testsByCategory.containsKey(categoryId)) {
        testsByCategory[categoryId] = [];
      }
      testsByCategory[categoryId]!.add(test);
    }

    // Get categories in order
    final categories = TestCategories.getAll();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: categories.length,
      itemBuilder: (context, categoryIndex) {
        final category = categories[categoryIndex];
        final testsInCategory = testsByCategory[category.id] ?? [];

        if (testsInCategory.isEmpty) {
          return const SizedBox.shrink(); // Skip empty categories
        }

        final isExpanded = categoryProvider.isCategoryExpanded(category.id);

        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category header
              _buildCategoryHeader(
                context,
                category,
                testsInCategory.length,
                isExpanded,
                () => categoryProvider.toggleCategory(category.id),
                languageCode,
                themeColor,
                isDark,
              ),

              // Tests list (animated)
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: isExpanded
                    ? Column(
                        children: testsInCategory.map((test) {
                          return _buildTestCard(
                            context,
                            test,
                            testProvider,
                            languageCode,
                            themeColor,
                            isDark,
                          );
                        }).toList(),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Build category header with expand/collapse button
  Widget _buildCategoryHeader(
    BuildContext context,
    TestCategory category,
    int testCount,
    bool isExpanded,
    VoidCallback onToggle,
    String languageCode,
    Color themeColor,
    bool isDark,
  ) {
    return InkWell(
      onTap: onToggle,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: themeColor.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            // Category icon
            Text(
              category.icon,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 12),

            // Category name and description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.getName(languageCode),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: themeColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${languageCode == 'ru' ? 'Тестов' : 'Tests'}: $testCount',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            // Expand/collapse icon
            AnimatedRotation(
              turns: isExpanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: themeColor,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build individual test card
  Widget _buildTestCard(
    BuildContext context,
    dynamic test,
    TestProvider testProvider,
    String languageCode,
    Color themeColor,
    bool isDark,
  ) {
    final isCompleted = testProvider.getTestResult(test.id) != null;

    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Card(
        elevation: 2,
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            // Проверяем, является ли это специальным тестом
            if (test.id == 'color_psychology_v1') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ColorPsychologyTestScreen(),
                ),
              );
            } else if (test.id == 'career_compass_v1') {
              // Специальный тест с forced_choice форматом
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CareerCompassTestScreen(),
                ),
              );
            } else if (test.id == 'text_conflict_communication') {
              // Специальный тест с scenario-based форматом
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TextConflictCommunicationTestScreen(),
                ),
              );
            } else if (test.disclaimer != null) {
              // Если есть дисклеймер, показываем его
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestDisclaimerScreen(test: test),
                ),
              );
            } else {
              // Обычный тест
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestScreen(test: test),
                ),
              );
            }
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
                    color: isCompleted ? Colors.green : themeColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    isCompleted ? Icons.check : Icons.quiz,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        test.getTitle(languageCode),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        test.getDescription(languageCode),
                        style: TextStyle(
                          fontSize: 13,
                          color: isDark ? Colors.grey[300] : Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 14,
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${test.estimatedTime} ${languageCode == 'ru' ? 'мин' : 'min'}',
                            style: TextStyle(
                              fontSize: 11,
                              color: isDark ? Colors.grey[400] : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (isCompleted)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      languageCode == 'ru' ? 'Пройден' : 'Done',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context, TestProvider testProvider, String languageCode, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResultsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.analytics),
            label: Text(languageCode == 'ru' ? 'Результаты' : 'Results'),
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              _showAboutDialog(context, languageCode);
            },
            icon: const Icon(Icons.info),
            label: Text(languageCode == 'ru' ? 'О приложении' : 'About'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[600],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _showAboutDialog(BuildContext context, String languageCode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(languageCode == 'ru' ? 'О приложении' : 'About'),
          content: Text(
            languageCode == 'ru'
                ? 'Психологические тесты - это приложение для самоанализа и понимания себя. '
                    'Пройдите тесты, чтобы узнать больше о своем психологическом состоянии.'
                : 'Psychological Tests is an app for self-analysis and self-understanding. '
                    'Take tests to learn more about your psychological state.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(languageCode == 'ru' ? 'Закрыть' : 'Close'),
            ),
          ],
        );
      },
    );
  }
}
