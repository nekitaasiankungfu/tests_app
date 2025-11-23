/// Модель данных для цветового психологического теста
///
/// Содержит структуры данных для:
/// - Информации о цветах
/// - Результатов выбора на каждом этапе
/// - Психологических шкал
///
/// @author: Color Psychology Research Institute
/// @version: 1.0.0

class ColorInfo {
  final String id;
  final Map<String, String> name; // ru, en
  final String hex;
  final Map<String, String> psychologicalMeaning; // ru, en
  final Map<String, String> positiveAssociations; // ru, en
  final Map<String, String> negativeAssociations; // ru, en

  const ColorInfo({
    required this.id,
    required this.name,
    required this.hex,
    required this.psychologicalMeaning,
    required this.positiveAssociations,
    required this.negativeAssociations,
  });
}

/// Результат первого этапа - быстрый выбор
class QuickChoiceResult {
  final List<String> likedColors; // 3 цвета
  final List<String> dislikedColors; // 3 цвета
  final DateTime timestamp;

  QuickChoiceResult({
    required this.likedColors,
    required this.dislikedColors,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'likedColors': likedColors,
      'dislikedColors': dislikedColors,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Результат второго этапа - ранжирование
class ColorRankingResult {
  final List<String> rankedColors; // Все 10 цветов в порядке предпочтения
  final DateTime timestamp;

  ColorRankingResult({
    required this.rankedColors,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'rankedColors': rankedColors,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Результат третьего этапа - ассоциации
class ColorAssociationResult {
  final Map<String, String> associations; // questionId -> colorId
  final DateTime timestamp;

  ColorAssociationResult({
    required this.associations,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'associations': associations,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Вопрос для этапа ассоциаций
class AssociationQuestion {
  final String id;
  final Map<String, String> text; // ru, en
  final String category; // mood, work, relationships, need, stress

  const AssociationQuestion({
    required this.id,
    required this.text,
    required this.category,
  });
}

/// Результат парных сравнений (stage 3 в расширенной версии)
class PairedComparisonResult {
  final List<PairedComparison> comparisons;
  final Map<String, int> wins; // colorId -> количество побед
  final DateTime timestamp;

  PairedComparisonResult({
    required this.comparisons,
    required this.wins,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'comparisons': comparisons.map((c) => c.toJson()).toList(),
      'wins': wins,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Одно парное сравнение
class PairedComparison {
  final String color1;
  final String color2;
  final String chosen;
  final int responseTimeMs;

  const PairedComparison({
    required this.color1,
    required this.color2,
    required this.chosen,
    required this.responseTimeMs,
  });

  Map<String, dynamic> toJson() {
    return {
      'color1': color1,
      'color2': color2,
      'chosen': chosen,
      'responseTimeMs': responseTimeMs,
    };
  }
}

/// Результат эмоциональных ассоциаций (stage 4)
class EmotionalAssociationResult {
  final Map<String, String> emotions; // emotion -> colorId
  final Map<String, int> responseTimesMs;
  final DateTime timestamp;

  EmotionalAssociationResult({
    required this.emotions,
    required this.responseTimesMs,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'emotions': emotions,
      'responseTimesMs': responseTimesMs,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Результат жизненных сфер (stage 5)
class LifeDomainResult {
  final Map<String, String> domains; // domain -> colorId
  final Map<String, String> situations; // situation -> colorId
  final DateTime timestamp;

  LifeDomainResult({
    required this.domains,
    required this.situations,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'domains': domains,
      'situations': situations,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Результат временной перспективы (stage 6)
class TemporalPerspectiveResult {
  final String past;
  final String present;
  final String future;
  final String idealSelf;
  final String fearSelf;
  final DateTime timestamp;

  TemporalPerspectiveResult({
    required this.past,
    required this.present,
    required this.future,
    required this.idealSelf,
    required this.fearSelf,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'past': past,
      'present': present,
      'future': future,
      'idealSelf': idealSelf,
      'fearSelf': fearSelf,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Полный результат цветового теста (расширенная версия)
class ColorPsychologyResult {
  final String testId;
  final QuickChoiceResult? quickChoice;
  final ColorRankingResult? ranking;
  final PairedComparisonResult? pairedComparisons;
  final EmotionalAssociationResult? emotionalAssociations;
  final LifeDomainResult? lifeDomains;
  final TemporalPerspectiveResult? temporalPerspective;
  final Map<String, double> scaleScores; // 12 шкал вместо 8
  final Map<String, String> interpretations;
  final List<String> patterns;
  final Map<String, double> consistencyMetrics; // Метрики согласованности
  final DateTime completedAt;

  ColorPsychologyResult({
    required this.testId,
    this.quickChoice,
    this.ranking,
    this.pairedComparisons,
    this.emotionalAssociations,
    this.lifeDomains,
    this.temporalPerspective,
    required this.scaleScores,
    required this.interpretations,
    required this.patterns,
    Map<String, double>? consistencyMetrics,
    DateTime? completedAt,
  }) : consistencyMetrics = consistencyMetrics ?? {},
        completedAt = completedAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'testId': testId,
      'quickChoice': quickChoice?.toJson(),
      'ranking': ranking?.toJson(),
      'pairedComparisons': pairedComparisons?.toJson(),
      'emotionalAssociations': emotionalAssociations?.toJson(),
      'lifeDomains': lifeDomains?.toJson(),
      'temporalPerspective': temporalPerspective?.toJson(),
      'scaleScores': scaleScores,
      'interpretations': interpretations,
      'patterns': patterns,
      'consistencyMetrics': consistencyMetrics,
      'completedAt': completedAt.toIso8601String(),
    };
  }
}

/// Психологическая шкала теста
class ColorPsychologyScale {
  final String id;
  final Map<String, String> name; // ru, en
  final Map<String, String> description; // ru, en
  final double minValue;
  final double maxValue;

  const ColorPsychologyScale({
    required this.id,
    required this.name,
    required this.description,
    this.minValue = 0.0,
    this.maxValue = 100.0,
  });
}

/// Паттерн - определенная комбинация цветов
class ColorPattern {
  final String id;
  final Map<String, String> name; // ru, en
  final Map<String, String> description; // ru, en
  final Map<String, String> meaning; // ru, en
  final List<Map<String, String>> recommendations; // ru, en
  final String? warning; // Предупреждение для критических паттернов

  const ColorPattern({
    required this.id,
    required this.name,
    required this.description,
    required this.meaning,
    required this.recommendations,
    this.warning,
  });
}

/// Конфигурация теста (расширенная версия)
class ColorPsychologyTestConfig {
  // Временные лимиты для этапов (в секундах)
  static const int stage1TimeLimit = 30;  // Быстрый выбор
  static const int stage2TimeLimit = 60;  // Ранжирование
  static const int stage3TimeLimit = 120; // Парные сравнения (20 пар)
  static const int stage4TimeLimit = 0;   // Эмоциональные ассоциации (без лимита)
  static const int stage5TimeLimit = 0;   // Жизненные сферы (без лимита)
  static const int stage6TimeLimit = 0;   // Временная перспектива (без лимита)

  // Количество цветов для выбора
  static const int quickChoiceLikedCount = 3;
  static const int quickChoiceDislikedCount = 3;
  static const int totalColors = 10;

  // Количество взаимодействий
  static const int pairedComparisonsCount = 20; // из 45 возможных пар
  static const int emotionalAssociationsCount = 8;
  static const int lifeDomainItemsCount = 10; // 6 сфер + 4 ситуации
  static const int temporalPerspectiveCount = 5;

  // Веса для scoring
  static const double likedColorWeight = 3.0;
  static const double dislikedColorWeight = -3.0;

  // Веса позиций при ранжировании
  static const List<double> rankingWeights = [
    10.0, // 1 место
    9.0,  // 2 место
    8.0,  // 3 место
    7.0,  // 4 место
    6.0,  // 5 место
    5.0,  // 6 место
    4.0,  // 7 место
    3.0,  // 8 место
    2.0,  // 9 место
    1.0,  // 10 место
  ];

  // Метрики согласованности
  static const double consistencyThreshold = 0.7; // 70% согласованность считается хорошей
}