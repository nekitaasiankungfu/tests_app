import '../models/career_compass_model.dart';
import '../data/career_compass_data.dart';

/// Сервис для обработки результатов теста "Карьерный компас"
///
/// Вычисляет:
/// - Баллы по 8 шкалам карьерных интересов
/// - Топ-3 шкалы
/// - Карьерный профиль
/// - Интерпретации и рекомендации
///
/// @version: 1.0.0

class CareerCompassService {
  /// Рассчитать результат теста
  CareerCompassResult calculateResult({
    required List<ForcedChoiceAnswer> answers,
  }) {
    // Подсчёт баллов по шкалам
    final scaleScores = _calculateScaleScores(answers);

    // Нормализация к процентам
    final scalePercentages = _calculatePercentages(scaleScores);

    // Топ-3 шкалы
    final topScales = _getTopScales(scaleScores, 3);

    // Определение профиля
    final profileId = _matchProfile(topScales);

    // Интерпретации
    final interpretations = _getInterpretations(scaleScores);

    // Рекомендации
    final recommendations = _generateRecommendations(topScales, scaleScores, profileId);

    // Статистика времени
    final totalTimeMs = answers.fold<int>(0, (sum, a) => sum + a.responseTimeMs);
    final averageResponseTimeMs = answers.isEmpty ? 0.0 : totalTimeMs / answers.length;

    return CareerCompassResult(
      testId: CareerCompassConfig.testId,
      answers: answers,
      scaleScores: scaleScores,
      scalePercentages: scalePercentages,
      topScales: topScales,
      profileId: profileId,
      interpretations: interpretations,
      recommendations: recommendations,
      totalTimeMs: totalTimeMs,
      averageResponseTimeMs: averageResponseTimeMs,
    );
  }

  /// Подсчёт сырых баллов по шкалам
  Map<String, int> _calculateScaleScores(List<ForcedChoiceAnswer> answers) {
    final scores = <String, int>{
      'people': 0,
      'analysis': 0,
      'creation': 0,
      'technology': 0,
      'business': 0,
      'nature': 0,
      'order': 0,
      'care': 0,
    };

    for (final answer in answers) {
      if (scores.containsKey(answer.chosenScaleId)) {
        scores[answer.chosenScaleId] = scores[answer.chosenScaleId]! + 1;
      }
    }

    return scores;
  }

  /// Нормализация баллов к процентам (0-100)
  Map<String, double> _calculatePercentages(Map<String, int> scores) {
    final percentages = <String, double>{};

    for (final entry in scores.entries) {
      // Максимум 7 баллов на шкалу
      final percentage = (entry.value / CareerCompassConfig.maxScaleScore) * 100;
      percentages[entry.key] = percentage.clamp(0.0, 100.0);
    }

    return percentages;
  }

  /// Получить топ-N шкал по баллам
  List<String> _getTopScales(Map<String, int> scores, int n) {
    final sortedEntries = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedEntries.take(n).map((e) => e.key).toList();
  }

  /// Сопоставить с карьерным профилем
  String? _matchProfile(List<String> topScales) {
    if (topScales.length < 2) return null;

    final top2 = topScales.take(2).toSet();

    // Ищем профиль, у которого обе топ-шкалы совпадают
    for (final profile in CareerCompassData.profiles) {
      final profileScales = profile.topScales.toSet();
      if (top2.containsAll(profileScales) || profileScales.containsAll(top2)) {
        return profile.id;
      }
    }

    // Если точного совпадения нет, ищем частичное
    for (final profile in CareerCompassData.profiles) {
      if (profile.topScales.contains(topScales[0])) {
        return profile.id;
      }
    }

    return null;
  }

  /// Получить интерпретации для всех шкал
  Map<String, String> _getInterpretations(Map<String, int> scores) {
    final interpretations = <String, String>{};

    for (final entry in scores.entries) {
      final interp = CareerCompassData.getScaleInterpretation(entry.key, entry.value, true);
      interpretations[entry.key] = interp['shortDescription'] ?? '';
    }

    return interpretations;
  }

  /// Генерация персонализированных рекомендаций
  List<String> _generateRecommendations(
    List<String> topScales,
    Map<String, int> scores,
    String? profileId,
  ) {
    final recommendations = <String>[];

    // Рекомендации на основе топ-шкал
    if (topScales.isNotEmpty) {
      final topScale = CareerCompassData.getScaleById(topScales[0]);
      if (topScale != null) {
        recommendations.add(
          'Ваша главная склонность — ${topScale.name['ru']}. '
          'Ищите профессии, где эта склонность будет востребована.',
        );
      }
    }

    // Рекомендации на основе профиля
    if (profileId != null) {
      final profile = CareerCompassData.getProfileById(profileId);
      if (profile != null) {
        recommendations.add(
          'Ваш карьерный профиль — ${profile.name['ru']} ${profile.emoji}. '
          '${profile.description['ru']}',
        );

        if (profile.keyProfessions.isNotEmpty) {
          recommendations.add(
            'Рекомендуемые профессии: ${profile.keyProfessions.take(5).join(", ")}.',
          );
        }

        if (profile.developmentAreas.isNotEmpty) {
          recommendations.add(
            'Области для развития: ${profile.developmentAreas.join(", ")}.',
          );
        }
      }
    }

    // Рекомендации по низким шкалам (0-3 баллов из 14 = низкий интерес)
    final lowScales = scores.entries
        .where((e) => e.value <= 3)
        .map((e) => e.key)
        .toList();

    if (lowScales.isNotEmpty && lowScales.length <= 2) {
      final lowScale = CareerCompassData.getScaleById(lowScales[0]);
      if (lowScale != null) {
        recommendations.add(
          'Профессии в сфере "${lowScale.name['ru']}" могут не приносить вам удовлетворения.',
        );
      }
    }

    // Общие рекомендации
    recommendations.add(
      'Помните: тест измеряет ИНТЕРЕСЫ, а не способности. '
      'Успех в профессии зависит также от навыков, образования и практики.',
    );

    return recommendations;
  }
}
