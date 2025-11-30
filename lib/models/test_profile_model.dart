/// Универсальная модель профиля для результатов тестов
///
/// Эта модель обеспечивает единообразную структуру для отображения
/// детальных результатов теста с 7 секциями:
/// 1. Профиль (название и описание)
/// 2. Почему этот профиль (обоснование)
/// 3. Сильные стороны
/// 4. Зоны роста (уязвимости)
/// 5. Рекомендации
/// 6. Что попробовать сегодня
/// 7. Вдохновляющее заключение
class TestProfile {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, String> whyThisProfile;
  final Map<String, List<String>> strengths;
  final Map<String, List<String>> vulnerabilities;
  final Map<String, List<String>> recommendations;
  final Map<String, String> tryToday;
  final Map<String, String> inspiringConclusion;
  final String? icon; // Emoji или иконка для профиля

  const TestProfile({
    required this.id,
    required this.name,
    required this.description,
    required this.whyThisProfile,
    required this.strengths,
    required this.vulnerabilities,
    required this.recommendations,
    required this.tryToday,
    required this.inspiringConclusion,
    this.icon,
  });

  String getName(String languageCode) => name[languageCode] ?? name['ru'] ?? '';
  String getDescription(String languageCode) =>
      description[languageCode] ?? description['ru'] ?? '';
  String getWhyThisProfile(String languageCode) =>
      whyThisProfile[languageCode] ?? whyThisProfile['ru'] ?? '';
  List<String> getStrengths(String languageCode) =>
      strengths[languageCode] ?? strengths['ru'] ?? [];
  List<String> getVulnerabilities(String languageCode) =>
      vulnerabilities[languageCode] ?? vulnerabilities['ru'] ?? [];
  List<String> getRecommendations(String languageCode) =>
      recommendations[languageCode] ?? recommendations['ru'] ?? [];
  String getTryToday(String languageCode) =>
      tryToday[languageCode] ?? tryToday['ru'] ?? '';
  String getInspiringConclusion(String languageCode) =>
      inspiringConclusion[languageCode] ?? inspiringConclusion['ru'] ?? '';
}

/// Интерфейс для классов данных тестов, которые поддерживают профили
abstract class ProfileableTestData {
  /// Определить профиль на основе процентов по шкалам
  static String determineProfile(Map<String, double> percentages) {
    throw UnimplementedError('Subclasses must implement determineProfile');
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    throw UnimplementedError('Subclasses must implement getProfile');
  }

  /// Получить все доступные профили
  static Map<String, TestProfile> get profiles {
    throw UnimplementedError('Subclasses must implement profiles');
  }
}
