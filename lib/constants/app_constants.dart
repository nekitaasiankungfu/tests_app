/// Application-wide constants
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // Storage Keys
  static const String completedTestsKey = 'completedTests';
  static const String userNameKey = 'userName';
  static const String themeColorKey = 'themeColor';
  static const String isDarkModeKey = 'isDarkMode';
  static const String languageKey = 'language';
  static const String isFirstLaunchKey = 'isFirstLaunch';
  static const String lastMoodCheckDateKey = 'lastMoodCheckDate';

  // Language Codes
  static const String languageRussian = 'ru';
  static const String languageEnglish = 'en';

  // Summary Calculation Constants
  static const double summaryMinTestsRequired = 2;
  static const double summaryScoreMin = 0.0;
  static const double summaryScoreMax = 100.0;

  // Color Swatch Constants
  static const int colorSwatchStrengthMultiplier = 1000;
  static const double colorSwatchBaseline = 0.5;

  // Chart Constants
  static const double chartBarWidth = 30.0;
  static const double chartAxisLineWidth = 2.0;
  static const double chartLabelFontSize = 12.0;
  static const double chartValueFontSize = 14.0;
  static const int chartAnimationDurationMs = 1000;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const double cardElevation = 2.0;

  // Answer Scale Constants (for Likert scales)
  static const int likertScaleMin = 1;
  static const int likertScaleMax = 5;

  // Default User Name
  static const String defaultUserName = 'Пользователь';
}
