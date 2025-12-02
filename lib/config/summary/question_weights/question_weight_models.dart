/// Models for question weight configuration system
/// Used to map test questions to psychological scales with specific weights

/// Represents how a single question maps to psychological scales
class QuestionWeight {
  final String testId;
  final String questionId;
  final Map<String, double> axisWeights;

  /// Direction of contribution for each axis
  /// 1 = direct (high answer = high scale score)
  /// -1 = inverted (high answer = low scale score)
  /// If not specified for an axis, defaults to 1 (direct)
  final Map<String, int>? axisDirections;

  /// Optional note explaining the question's contribution logic
  final String? note;

  const QuestionWeight({
    required this.testId,
    required this.questionId,
    required this.axisWeights,
    this.axisDirections,
    this.note,
  });

  /// Get direction for a specific axis
  /// Returns -1 for inverted (negative weight), 1 for direct (positive weight)
  int getDirection(String axisId) {
    // First check if direction is explicitly set in axisDirections
    if (axisDirections != null && axisDirections!.containsKey(axisId)) {
      return axisDirections![axisId]!;
    }

    // Otherwise, determine direction from weight sign
    final weight = axisWeights[axisId];
    if (weight != null && weight < 0) {
      return -1; // Negative weight = inverted (high answer → low scale)
    }

    return 1; // Positive weight = direct (high answer → high scale)
  }
}

/// Legacy v1: Maps test factors to personality axes (for backward compatibility)
class TestMapping {
  final String testId;
  final String scale;         // Source test factor
  final String targetAxis;     // Target personality axis
  final double weight;         // Weight of contribution
  final int direction;         // 1 or -1 (inverted)

  const TestMapping({
    required this.testId,
    required this.scale,
    required this.targetAxis,
    required this.weight,
    required this.direction,
  });
}

/// Legacy v1: Summary axis definition (for backward compatibility)
class SummaryAxis {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, String> lowDescription;
  final Map<String, String> highDescription;

  const SummaryAxis({
    required this.id,
    required this.name,
    required this.description,
    required this.lowDescription,
    required this.highDescription,
  });

  String getName(String languageCode) => name[languageCode] ?? name['ru'] ?? '';
  String getDescription(String languageCode) => description[languageCode] ?? description['ru'] ?? '';
  String getLowDescription(String languageCode) => lowDescription[languageCode] ?? lowDescription['ru'] ?? '';
  String getHighDescription(String languageCode) => highDescription[languageCode] ?? highDescription['ru'] ?? '';
}

/// Base class for question weights configuration
abstract class BaseQuestionWeightsConfig {
  /// Get weight for specific question
  static QuestionWeight? getQuestionWeight(String testId, String questionId) {
    final key = '$testId:$questionId';
    return _allWeights[key];
  }

  /// Combined weights from all test configs
  static final Map<String, QuestionWeight> _allWeights = {};

  /// Register weights from a specific test config
  static void registerWeights(Map<String, QuestionWeight> weights) {
    _allWeights.addAll(weights);
  }
}