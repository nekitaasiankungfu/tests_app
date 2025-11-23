/// Модели данных для теста "Карьерный компас"
///
/// Содержит структуры данных для:
/// - Вопросов forced_choice (парные сравнения)
/// - Результатов теста
/// - Карьерных профилей
///
/// @version: 1.0.0

/// Вариант ответа в парном сравнении
class ForcedChoiceOption {
  final String text;
  final String scaleId;

  const ForcedChoiceOption({
    required this.text,
    required this.scaleId,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'scaleId': scaleId,
    };
  }
}

/// Вопрос forced_choice (парное сравнение)
class ForcedChoiceQuestion {
  final int id;
  final Map<String, String> instruction;
  final ForcedChoiceOption optionA;
  final ForcedChoiceOption optionB;

  const ForcedChoiceQuestion({
    required this.id,
    required this.instruction,
    required this.optionA,
    required this.optionB,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'instruction': instruction,
      'optionA': optionA.toJson(),
      'optionB': optionB.toJson(),
    };
  }
}

/// Ответ пользователя на вопрос
class ForcedChoiceAnswer {
  final int questionId;
  final String chosenScaleId;
  final int responseTimeMs;
  final DateTime timestamp;

  ForcedChoiceAnswer({
    required this.questionId,
    required this.chosenScaleId,
    required this.responseTimeMs,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'chosenScaleId': chosenScaleId,
      'responseTimeMs': responseTimeMs,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Шкала карьерных интересов
class CareerScale {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final String icon;
  final String color;
  final List<String> keywords;

  const CareerScale({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    this.keywords = const [],
  });
}

/// Уровень интерпретации шкалы
class ScaleInterpretation {
  final String level; // 'low', 'medium', 'high'
  final int minScore;
  final int maxScore;
  final Map<String, String> label;
  final Map<String, String> shortDescription;
  final Map<String, String> detailedDescription;
  final List<String> suitableProfessions;
  final List<String> recommendations;

  const ScaleInterpretation({
    required this.level,
    required this.minScore,
    required this.maxScore,
    required this.label,
    required this.shortDescription,
    required this.detailedDescription,
    this.suitableProfessions = const [],
    this.recommendations = const [],
  });
}

/// Карьерный профиль
class CareerProfile {
  final String id;
  final Map<String, String> name;
  final String emoji;
  final Map<String, String> description;
  final List<String> topScales;
  final List<String> suitableIndustries;
  final List<String> keyProfessions;
  final List<String> strengths;
  final List<String> developmentAreas;

  const CareerProfile({
    required this.id,
    required this.name,
    required this.emoji,
    required this.description,
    required this.topScales,
    this.suitableIndustries = const [],
    this.keyProfessions = const [],
    this.strengths = const [],
    this.developmentAreas = const [],
  });
}

/// Результат теста "Карьерный компас"
class CareerCompassResult {
  final String testId;
  final List<ForcedChoiceAnswer> answers;
  final Map<String, int> scaleScores; // Raw scores (0-14)
  final Map<String, double> scalePercentages; // Normalized (0-100)
  final List<String> topScales; // Top 3 scales
  final String? profileId; // Matched career profile
  final Map<String, String> interpretations;
  final List<String> recommendations;
  final int totalTimeMs;
  final double averageResponseTimeMs;
  final DateTime completedAt;

  CareerCompassResult({
    required this.testId,
    required this.answers,
    required this.scaleScores,
    required this.scalePercentages,
    required this.topScales,
    this.profileId,
    required this.interpretations,
    required this.recommendations,
    required this.totalTimeMs,
    required this.averageResponseTimeMs,
    DateTime? completedAt,
  }) : completedAt = completedAt ?? DateTime.now();

  /// Factory constructor to create CareerCompassResult from saved TestResult
  /// Used when viewing saved results from history
  factory CareerCompassResult.fromSavedResult({
    required Map<String, int> scaleScores,
    required Map<String, double> scalePercentages,
    required DateTime completedAt,
    String? profileId,
    Map<String, String>? interpretations,
    List<String>? recommendations,
  }) {
    // Calculate top scales from scores
    final sortedScales = scaleScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topScales = sortedScales.take(3).map((e) => e.key).toList();

    // Determine profile from top 2 scales if not provided
    String? matchedProfile = profileId;
    if (matchedProfile == null && topScales.length >= 2) {
      // Profile matching logic based on career_compass_data.dart profiles
      // Each profile has topScales that define the combination
      final top2 = topScales.take(2).toSet();
      final profileMatches = {
        {'people', 'care'}: 'helper',        // Помощник
        {'analysis', 'order'}: 'analyst',    // Аналитик
        {'creation', 'people'}: 'creator',   // Творец
        {'technology', 'analysis'}: 'engineer', // Инженер
        {'business', 'people'}: 'leader',    // Лидер
        {'nature', 'care'}: 'practitioner',  // Практик
        {'order', 'analysis'}: 'organizer',  // Организатор
        {'care', 'nature'}: 'protector',     // Защитник
      };
      for (final entry in profileMatches.entries) {
        if (entry.key.containsAll(top2) || top2.containsAll(entry.key)) {
          matchedProfile = entry.value;
          break;
        }
      }
      // Fallback to first scale - map scale to most likely profile
      if (matchedProfile == null && topScales.isNotEmpty) {
        final fallbackProfiles = {
          'people': 'helper',       // People -> Помощник
          'analysis': 'analyst',    // Analysis -> Аналитик
          'creation': 'creator',    // Creation -> Творец
          'technology': 'engineer', // Technology -> Инженер
          'business': 'leader',     // Business -> Лидер
          'nature': 'practitioner', // Nature -> Практик
          'order': 'organizer',     // Order -> Организатор
          'care': 'helper',         // Care -> Помощник
        };
        matchedProfile = fallbackProfiles[topScales[0]];
      }
    }

    return CareerCompassResult(
      testId: CareerCompassConfig.testId,
      answers: [], // No answers stored in history
      scaleScores: scaleScores,
      scalePercentages: scalePercentages,
      topScales: topScales,
      profileId: matchedProfile,
      interpretations: interpretations ?? {},
      recommendations: recommendations ?? [],
      totalTimeMs: 0, // Not stored in history
      averageResponseTimeMs: 0, // Not stored in history
      completedAt: completedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'testId': testId,
      'answers': answers.map((a) => a.toJson()).toList(),
      'scaleScores': scaleScores,
      'scalePercentages': scalePercentages,
      'topScales': topScales,
      'profileId': profileId,
      'interpretations': interpretations,
      'recommendations': recommendations,
      'totalTimeMs': totalTimeMs,
      'averageResponseTimeMs': averageResponseTimeMs,
      'completedAt': completedAt.toIso8601String(),
    };
  }
}

/// Конфигурация теста
class CareerCompassConfig {
  // Количество вопросов
  static const int questionCount = 56;

  // Количество шкал
  static const int scaleCount = 8;

  // Максимальный балл на шкалу (каждая шкала появляется в ~14 вопросах)
  static const int maxScaleScore = 14;

  // ID теста
  static const String testId = 'career_compass_v1';

  // Время на вопрос (нет ограничения)
  static const int? questionTimeLimit = null;
}
