/// Models for Visual Micro Tests
///
/// A package of 10 independent micro-tests based on visual perception
/// that accumulate scores across multiple psychological traits.
///
/// @version: 1.0.0
/// @author: Claude Code

/// Represents a single micro-test within the Visual Micro Tests package
class MicroTest {
  final String id;
  final Map<String, String> title;
  final Map<String, String> instruction;
  final Map<String, String> visualDescription;
  final List<MicroTestOption> options;

  const MicroTest({
    required this.id,
    required this.title,
    required this.instruction,
    required this.visualDescription,
    required this.options,
  });

  String getTitle(String languageCode) =>
      title[languageCode] ?? title['ru'] ?? id;

  String getInstruction(String languageCode) =>
      instruction[languageCode] ?? instruction['ru'] ?? '';

  String getVisualDescription(String languageCode) =>
      visualDescription[languageCode] ?? visualDescription['ru'] ?? '';

  factory MicroTest.fromJson(Map<String, dynamic> json) {
    return MicroTest(
      id: json['id'] as String,
      title: Map<String, String>.from(json['name'] as Map), // JSON uses 'name', not 'title'
      instruction: Map<String, String>.from(json['instruction'] as Map),
      visualDescription: Map<String, String>.from(json['visual_description'] as Map),
      options: (json['options'] as List)
          .map((opt) => MicroTestOption.fromJson(opt as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'instruction': instruction,
      'visual_description': visualDescription,
      'options': options.map((opt) => opt.toJson()).toList(),
    };
  }
}

/// Represents an answer option for a micro-test
class MicroTestOption {
  final String id;
  final Map<String, String> text;
  final Map<String, int> traits;
  final Map<String, String>? interpretation;

  const MicroTestOption({
    required this.id,
    required this.text,
    required this.traits,
    this.interpretation,
  });

  String getText(String languageCode) =>
      text[languageCode] ?? text['ru'] ?? id;

  String? getInterpretation(String languageCode) =>
      interpretation?[languageCode] ?? interpretation?['ru'];

  factory MicroTestOption.fromJson(Map<String, dynamic> json) {
    return MicroTestOption(
      id: json['id'] as String,
      text: Map<String, String>.from(json['text'] as Map),
      traits: Map<String, int>.from(json['traits'] as Map),
      interpretation: json['interpretation'] != null
          ? Map<String, String>.from(json['interpretation'] as Map)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'traits': traits,
      if (interpretation != null) 'interpretation': interpretation,
    };
  }
}

/// Accumulated trait profile across all micro-tests
class TraitProfile {
  final Map<String, int> traits;

  TraitProfile() : traits = {};

  /// Add scores from a selected option
  void addScores(Map<String, int> optionTraits) {
    optionTraits.forEach((trait, score) {
      traits[trait] = (traits[trait] ?? 0) + score;
    });
  }

  /// Get top N traits sorted by score (descending)
  List<MapEntry<String, int>> getTopTraits(int count) {
    final sortedTraits = traits.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sortedTraits.take(count).toList();
  }

  /// Get score for a specific trait
  int getScore(String trait) => traits[trait] ?? 0;

  /// Check if profile has any data
  bool get isEmpty => traits.isEmpty;

  /// Get total number of recorded traits
  int get traitCount => traits.length;

  Map<String, dynamic> toJson() => {'traits': traits};

  factory TraitProfile.fromJson(Map<String, dynamic> json) {
    final profile = TraitProfile();
    final traitsMap = json['traits'] as Map<String, dynamic>;
    traitsMap.forEach((key, value) {
      profile.traits[key] = value as int;
    });
    return profile;
  }
}

/// Information about a trait for display
class TraitInfo {
  final String key;
  final Map<String, String> name;
  final Map<String, String> description;
  final int score;
  final String? icon;

  const TraitInfo({
    required this.key,
    required this.name,
    required this.description,
    required this.score,
    this.icon,
  });

  String getName(String languageCode) =>
      name[languageCode] ?? name['ru'] ?? key;

  String getDescription(String languageCode) =>
      description[languageCode] ?? description['ru'] ?? '';
}

/// Result of the Visual Micro Tests
class VisualMicroTestsResult {
  final String testId;
  final List<String> microTestIds;
  final Map<String, String> selectedOptions; // microTestId -> optionId
  final TraitProfile traitProfile;
  final List<TraitInfo> topTraits;
  final Map<String, String> overallPortrait;
  final DateTime completedAt;

  VisualMicroTestsResult({
    required this.testId,
    required this.microTestIds,
    required this.selectedOptions,
    required this.traitProfile,
    required this.topTraits,
    required this.overallPortrait,
    DateTime? completedAt,
  }) : completedAt = completedAt ?? DateTime.now();

  String getOverallPortrait(String languageCode) =>
      overallPortrait[languageCode] ?? overallPortrait['ru'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'testId': testId,
      'microTestIds': microTestIds,
      'selectedOptions': selectedOptions,
      'traitProfile': traitProfile.toJson(),
      'topTraits': topTraits.map((t) => {
        'key': t.key,
        'name': t.name,
        'description': t.description,
        'score': t.score,
        'icon': t.icon,
      }).toList(),
      'overallPortrait': overallPortrait,
      'completedAt': completedAt.toIso8601String(),
    };
  }

  factory VisualMicroTestsResult.fromJson(Map<String, dynamic> json) {
    return VisualMicroTestsResult(
      testId: json['testId'] as String,
      microTestIds: List<String>.from(json['microTestIds'] as List),
      selectedOptions: Map<String, String>.from(json['selectedOptions'] as Map),
      traitProfile: TraitProfile.fromJson(json['traitProfile'] as Map<String, dynamic>),
      topTraits: (json['topTraits'] as List).map((t) {
        final traitMap = t as Map<String, dynamic>;
        return TraitInfo(
          key: traitMap['key'] as String,
          name: Map<String, String>.from(traitMap['name'] as Map),
          description: Map<String, String>.from(traitMap['description'] as Map),
          score: traitMap['score'] as int,
          icon: traitMap['icon'] as String?,
        );
      }).toList(),
      overallPortrait: Map<String, String>.from(json['overallPortrait'] as Map),
      completedAt: DateTime.parse(json['completedAt'] as String),
    );
  }
}

/// Configuration for Visual Micro Tests
class VisualMicroTestsConfig {
  static const String testId = 'visual_micro_tests_v1';
  static const int microTestCount = 10;
  static const int topTraitsCount = 5;
  static const int estimatedMinutes = 5;

  // Visual element types for each micro-test
  static const Map<String, String> visualTypes = {
    'visual_test_01': 'abstract_composition',
    'visual_test_02': 'geometric_shapes',
    'visual_test_03': 'color_palette',
    'visual_test_04': 'optical_illusion',
    'visual_test_05': 'line_paths',
    'visual_test_06': 'pattern_types',
    'visual_test_07': 'emotional_abstraction',
    'visual_test_08': 'balance_elements',
    'visual_test_09': 'texture_types',
    'visual_test_10': 'perspective_focus',
  };
}
