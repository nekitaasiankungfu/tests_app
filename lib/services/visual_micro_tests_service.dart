import '../models/visual_micro_tests_model.dart';
import '../data/visual_micro_tests_data.dart';

/// Service for scoring Visual Micro Tests
///
/// Accumulates trait scores and generates top-5 results
///
/// @version: 1.0.0
class VisualMicroTestsService {
  final TraitProfile _traitProfile = TraitProfile();
  final Map<String, String> _selectedOptions = {}; // microTestId -> optionId

  /// Process user's answer for a micro-test
  void processAnswer(String microTestId, MicroTestOption selectedOption) {
    _selectedOptions[microTestId] = selectedOption.id;
    _traitProfile.addScores(selectedOption.traits);
  }

  /// Check if all 10 micro-tests are completed
  bool isComplete() => _selectedOptions.length >= 10;

  /// Get current progress (0.0 to 1.0)
  double getProgress() => _selectedOptions.length / 10.0;

  /// Get number of completed micro-tests
  int getCompletedCount() => _selectedOptions.length;

  /// Generate final result with top-5 traits
  VisualMicroTestsResult generateResult() {
    if (!isComplete()) {
      throw StateError('Cannot generate result: test not complete');
    }

    // Get top 5 traits
    final topTraits = _traitProfile.getTopTraits(5);

    // Convert to TraitInfo with names and descriptions
    final traitInfos = topTraits.map((entry) {
      final traitNames = VisualMicroTestsData.getTraitNames();
      final traitDescs = VisualMicroTestsData.getTraitDescriptions();

      return TraitInfo(
        key: entry.key,
        name: traitNames[entry.key] ?? {'ru': entry.key, 'en': entry.key},
        description: traitDescs[entry.key] ?? traitDescs['default']!,
        score: entry.value,
        icon: VisualMicroTestsData.getTraitIcon(entry.key),
      );
    }).toList();

    // Generate overall portrait
    final portrait = VisualMicroTestsData.generateOverallPortrait(traitInfos);

    return VisualMicroTestsResult(
      testId: VisualMicroTestsConfig.testId,
      microTestIds: List.from(_selectedOptions.keys),
      selectedOptions: Map.from(_selectedOptions),
      traitProfile: _traitProfile,
      topTraits: traitInfos,
      overallPortrait: portrait,
    );
  }

  /// Reset service for new test session
  void reset() {
    _traitProfile.traits.clear();
    _selectedOptions.clear();
  }

  /// Get selected option for a micro-test (if any)
  String? getSelectedOption(String microTestId) => _selectedOptions[microTestId];

  /// Check if specific micro-test is completed
  bool isMicroTestCompleted(String microTestId) => _selectedOptions.containsKey(microTestId);
}
