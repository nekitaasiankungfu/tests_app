/// Consolidated Summary Configuration Module
///
/// This file serves as the main entry point for all summary-related configurations.
/// It imports and re-exports all the modularized components that were previously
/// contained in a single 5,068-line GOD file.
///
/// Refactored on: 2025-11-04
/// Original file size: 5,068 lines
/// After refactoring: 8 files, ~4,433 lines total
///
/// ## Module Organization:
///
/// 1. **Scale Categories** (scale_categories.dart)
///    - 18 top-level psychological categories
///    - Color and icon definitions for UI
///
/// 2. **Hierarchical Scales** (hierarchical_scales.dart)
///    - 195 psychological scales organized hierarchically
///    - Subscales grouped under parent categories
///
/// 3. **Legacy Axes** (legacy_axes.dart)
///    - 10 V1.0 compatibility axes for backward compatibility
///    - 6 personality axes + 4 relationship axes
///
/// 4. **Test Mappings** (test_mappings.dart)
///    - Maps test results to summary axes
///    - Contains normalization settings and confidence thresholds
///
/// 5. **Question Weights** (question_weights/)
///    - Per-question weight configurations for all tests
///    - Separate files for each test type
///
/// ## Usage:
///
/// Instead of importing individual modules, other parts of the app can import
/// this single file to access all summary configuration:
///
/// ```dart
/// import 'package:psycho_app/config/summary_config.dart';
///
/// // All exports are available:
/// final category = ScaleCategories.categories['emotional_stability'];
/// final scale = HierarchicalScales.scales['anxiety'];
/// final axis = LegacyAxes.axes['emotional_balance'];
/// final mapping = TestMappings.testMappings['ipip_big_five'];
/// ```

library summary_config;

// Core model imports
export 'summary/scale_categories.dart';
export 'summary/hierarchical_scales.dart';
export 'summary/legacy_axes.dart';
export 'summary/test_mappings.dart';

// Question weight configurations
export 'summary/question_weights/question_weight_models.dart';
export 'summary/question_weights/ipip_big_five_weights.dart';
export 'summary/question_weights/fisher_temperament_weights.dart';
export 'summary/question_weights/simple_tests_weights.dart';

// Import app logger for error logging
import '../utils/app_logger.dart';

// Re-export commonly used classes for backward compatibility
// This ensures existing code that imports summary_config.dart continues to work

/// Main Summary Configuration class
/// Provides static access to all configuration data
class SummaryConfig {
  // Private constructor to prevent instantiation
  SummaryConfig._();

  /// Version identifier for the configuration system
  static const String version = '2.0.0';

  /// Date of last major refactoring
  static const String refactoredDate = '2025-11-04';

  /// Original file statistics (before refactoring)
  static const Map<String, dynamic> originalFileStats = {
    'lines': 5068,
    'size': '235 KB',
    'issues': [
      'GOD file anti-pattern',
      'Single Responsibility Principle violation',
      'Difficult to maintain and test',
      'High cognitive complexity',
    ],
  };

  /// Refactored file statistics
  static const Map<String, dynamic> refactoredStats = {
    'files': 8,
    'total_lines': 4433,
    'modules': {
      'scale_categories': {'lines': 297, 'purpose': '18 top-level categories'},
      'hierarchical_scales': {'lines': 1259, 'purpose': '195 psychological scales'},
      'legacy_axes': {'lines': 183, 'purpose': '10 V1.0 compatibility axes'},
      'test_mappings': {'lines': 531, 'purpose': 'Test-to-axis mappings'},
      'question_weights': {'lines': 2163, 'purpose': 'Per-question weights'},
    },
    'benefits': [
      'Improved maintainability',
      'Better separation of concerns',
      'Easier to test individual modules',
      'Reduced cognitive load',
      'Better code organization',
    ],
  };

  /// Get configuration summary for debugging
  static Map<String, dynamic> getConfigurationSummary() {
    return {
      'version': version,
      'categories_count': 18,
      'hierarchical_scales_count': 195,
      'legacy_axes_count': 10,
      'test_mappings_count': 5,
      'total_question_weights': 176,
      'supported_tests': [
        'ipip_big_five',
        'fisher_temperament',
        'love_profile',
        'stress_test',
        'self_esteem_test',
      ],
    };
  }

  /// Validate configuration integrity
  /// Returns true if all required components are properly loaded
  static bool validateConfiguration() {
    try {
      // Check if all critical data structures are accessible
      final categoriesLoaded = ScaleCategories.categories.isNotEmpty;
      final scalesLoaded = HierarchicalScales.scales.isNotEmpty;
      final axesLoaded = LegacyAxes.axes.isNotEmpty;
      final mappingsLoaded = TestMappings.testMappings.isNotEmpty;

      return categoriesLoaded && scalesLoaded && axesLoaded && mappingsLoaded;
    } catch (e, stackTrace) {
      appLogger.e('Configuration validation failed', e, stackTrace);
      return false;
    }
  }

  /// Migration helper for transitioning from V1.0 to V2.0 scoring system
  static Map<String, dynamic> getMigrationInfo() {
    return {
      'from_version': '1.0.0',
      'to_version': '2.0.0',
      'changes': [
        'Moved from 6 simple axes to 195 hierarchical scales',
        'Added 18 top-level categories for better organization',
        'Introduced per-question weight system',
        'Maintained backward compatibility via legacy axes',
      ],
      'migration_required': true,
      'data_loss': false,
      'backward_compatible': true,
    };
  }
}

/// Utility class for working with the summary configuration
class SummaryConfigUtils {
  /// Get all available test IDs
  static List<String> getAvailableTests() {
    return TestMappings.testMappings.keys.toList();
  }

  /// Get all scale IDs for a given category
  static List<String> getScalesForCategory(String categoryId) {
    final category = ScaleCategories.categories[categoryId];
    if (category == null) return [];
    return category.subscaleIds;
  }

  /// Check if a test has per-question weights defined
  static bool hasQuestionWeights(String testId) {
    switch (testId) {
      case 'ipip_big_five':
        return IPIPBigFiveWeights.weights.isNotEmpty;
      case 'fisher_temperament':
        return FisherTemperamentWeights.weights.isNotEmpty;
      case 'stress_test':
      case 'self_esteem_test':
        return SimpleTestsWeights.weights.isNotEmpty;
      default:
        return false;
    }
  }

  /// Get total number of questions with weight mappings
  static int getTotalWeightedQuestions() {
    return IPIPBigFiveWeights.weights.length +
           FisherTemperamentWeights.weights.length +
           SimpleTestsWeights.weights.length;
  }

  /// Generate a configuration report for debugging
  static String generateConfigReport() {
    final buffer = StringBuffer();
    buffer.writeln('=== Summary Configuration Report ===');
    buffer.writeln('Version: ${SummaryConfig.version}');
    buffer.writeln('Refactored: ${SummaryConfig.refactoredDate}');
    buffer.writeln('');
    buffer.writeln('Components:');
    buffer.writeln('  - Categories: ${ScaleCategories.categories.length}');
    buffer.writeln('  - Hierarchical Scales: ${HierarchicalScales.scales.length}');
    buffer.writeln('  - Legacy Axes: ${LegacyAxes.axes.length}');
    buffer.writeln('  - Test Mappings: ${TestMappings.testMappings.length}');
    buffer.writeln('  - Weighted Questions: ${getTotalWeightedQuestions()}');
    buffer.writeln('');
    buffer.writeln('Validation: ${SummaryConfig.validateConfiguration() ? "PASSED" : "FAILED"}');
    return buffer.toString();
  }
}