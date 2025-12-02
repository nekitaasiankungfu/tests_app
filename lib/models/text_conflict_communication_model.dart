/// Модель данных для теста коммуникации в текстовых конфликтах
///
/// Содержит структуры данных для:
/// - Сценариев конфликтных ситуаций
/// - Вариантов ответов с весами по стилям
/// - Результатов теста
///
/// @version: 1.0.0

/// Сценарий конфликтной ситуации
class ConflictScenario {
  final int id;
  final Map<String, String> situation; // Описание ситуации
  final Map<String, String> context; // Контекст (дополнительная информация)
  final Map<String, String> question; // Вопрос пользователю

  const ConflictScenario({
    required this.id,
    required this.situation,
    required this.context,
    required this.question,
  });

  factory ConflictScenario.fromJson(Map<String, dynamic> json) {
    return ConflictScenario(
      id: json['id'] as int,
      situation: Map<String, String>.from(json['situation'] as Map),
      context: Map<String, String>.from(json['context'] as Map),
      question: Map<String, String>.from(json['question'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'situation': situation,
      'context': context,
      'question': question,
    };
  }
}

/// Вариант ответа на сценарий
class ScenarioOption {
  final String id;
  final Map<String, String> text;
  final Map<String, int> scales; // avoidance, aggression, passive_revenge, assertiveness

  const ScenarioOption({
    required this.id,
    required this.text,
    required this.scales,
  });

  factory ScenarioOption.fromJson(Map<String, dynamic> json) {
    return ScenarioOption(
      id: json['id'] as String,
      text: Map<String, String>.from(json['text'] as Map),
      scales: Map<String, int>.from(json['scales'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'scales': scales,
    };
  }
}

/// Вопрос теста (сценарий + варианты ответов)
class ScenarioQuestion {
  final ConflictScenario scenario;
  final List<ScenarioOption> options;

  const ScenarioQuestion({
    required this.scenario,
    required this.options,
  });

  factory ScenarioQuestion.fromJson(Map<String, dynamic> json) {
    return ScenarioQuestion(
      scenario: ConflictScenario.fromJson(json['scenario'] as Map<String, dynamic>),
      options: (json['options'] as List)
          .map((o) => ScenarioOption.fromJson(o as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'scenario': scenario.toJson(),
      'options': options.map((o) => o.toJson()).toList(),
    };
  }
}

/// Ответ пользователя на вопрос
class ScenarioAnswer {
  final int questionId;
  final String optionId;
  final Map<String, int> scaleContributions; // Веса по шкалам
  final DateTime timestamp;

  ScenarioAnswer({
    required this.questionId,
    required this.optionId,
    required this.scaleContributions,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'optionId': optionId,
      'scaleContributions': scaleContributions,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Результат теста
class TextConflictTestResult {
  final List<ScenarioAnswer> answers;
  final Map<String, double> scalePercentages; // Проценты по 4 шкалам
  final String profileId; // ID определённого профиля
  final DateTime completedAt;

  TextConflictTestResult({
    required this.answers,
    required this.scalePercentages,
    required this.profileId,
    DateTime? completedAt,
  }) : completedAt = completedAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'answers': answers.map((a) => a.toJson()).toList(),
      'scalePercentages': scalePercentages,
      'profileId': profileId,
      'completedAt': completedAt.toIso8601String(),
    };
  }

  factory TextConflictTestResult.fromJson(Map<String, dynamic> json) {
    return TextConflictTestResult(
      answers: (json['answers'] as List)
          .map((a) => ScenarioAnswer(
                questionId: a['questionId'] as int,
                optionId: a['optionId'] as String,
                scaleContributions: Map<String, int>.from(a['scaleContributions'] as Map),
                timestamp: DateTime.parse(a['timestamp'] as String),
              ))
          .toList(),
      scalePercentages: Map<String, double>.from(json['scalePercentages'] as Map),
      profileId: json['profileId'] as String,
      completedAt: DateTime.parse(json['completedAt'] as String),
    );
  }
}

/// Профиль коммуникации
class CommunicationProfile {
  final String id;
  final Map<String, String> name;
  final Map<String, String> emoji;
  final Map<String, String> description;
  final Map<String, String> whyThisProfile;
  final Map<String, List<String>> problems;
  final Map<String, List<String>> howToChange;
  final Map<String, List<String>>? strengths; // Для assertive профиля
  final Map<String, List<String>>? keepItUp; // Для assertive профиля

  const CommunicationProfile({
    required this.id,
    required this.name,
    required this.emoji,
    required this.description,
    required this.whyThisProfile,
    required this.problems,
    required this.howToChange,
    this.strengths,
    this.keepItUp,
  });
}
