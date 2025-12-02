import 'package:flutter/material.dart';
import 'scale_categories.dart';
import 'hierarchical_scales.dart';
import 'bipolar_scales.dart';

/// Test mappings and legacy V1.0 compatibility layer
///
/// This file contains:
/// 1. TestMapping class - Maps test scales to summary axes with weights
/// 2. Legacy test mappings configuration (V1.0 compatibility)
/// 3. Normalization settings for score calculations
/// 4. Confidence thresholds for profile reliability
/// 5. Utility methods for hierarchical scale navigation

// ============================================================================
// TEST MAPPING MODELS
// ============================================================================

/// Соответствие теста шкале
class TestMapping {
  final String testId;
  final String scale;        // Шкала в рамках теста (например, 'emotional_stability', 'total')
  final String targetAxis;   // Целевая шкала саммари
  final double weight;       // Вес вклада (0.0-1.0)
  final int direction;       // Направление: 1 (прямое), -1 (инвертированное)

  const TestMapping({
    required this.testId,
    required this.scale,
    required this.targetAxis,
    required this.weight,
    required this.direction,
  });
}

/// Настройки нормализации
class NormalizationSettings {
  final double minScore;
  final double maxScore;
  final double defaultScore;

  const NormalizationSettings({
    required this.minScore,
    required this.maxScore,
    required this.defaultScore,
  });
}

/// Пороги уверенности профиля
class ConfidenceThresholds {
  final double high;
  final double medium;
  final double low;

  const ConfidenceThresholds({
    required this.high,
    required this.medium,
    required this.low,
  });
}

// ============================================================================
// LEGACY TEST MAPPINGS (V1.0 COMPATIBILITY)
// ============================================================================

/// Legacy test mappings configuration for V1.0 compatibility
///
/// Maps test results to the 10 legacy axes:
/// - 6 personality axes (emotional_balance, self_control, sociability, mindfulness, motivation, creativity)
/// - 4 relationship axes (relationship_security, emotional_intimacy, passion_vitality, reliability_partnership)
class TestMappingsConfig {
  /// Соответствие тестов шкалам с весами и направлениями
  static const Map<String, List<TestMapping>> testMappings = {
    // Big Five (IPIP) - основные соответствия
    'ipip_big_five': [
      // Эмоциональный баланс - обратная связь с нейротизмом
      TestMapping(
        testId: 'ipip_big_five',
        scale: 'emotional_stability',
        targetAxis: 'emotional_balance',
        weight: 1.0,
        direction: -1, // Инвертируем, т.к. высокая стабильность = низкий нейротизм
      ),
      // Самоконтроль - добросовестность
      TestMapping(
        testId: 'ipip_big_five',
        scale: 'conscientiousness',
        targetAxis: 'self_control',
        weight: 1.0,
        direction: 1,
      ),
      // Социальность - доброжелательность + экстраверсия
      TestMapping(
        testId: 'ipip_big_five',
        scale: 'agreeableness',
        targetAxis: 'sociability',
        weight: 0.7,
        direction: 1,
      ),
      TestMapping(
        testId: 'ipip_big_five',
        scale: 'extraversion',
        targetAxis: 'sociability',
        weight: 0.3,
        direction: 1,
      ),
      // Осознанность - интеллект/воображение
      TestMapping(
        testId: 'ipip_big_five',
        scale: 'intellect',
        targetAxis: 'mindfulness',
        weight: 0.6,
        direction: 1,
      ),
      TestMapping(
        testId: 'ipip_big_five',
        scale: 'intellect',
        targetAxis: 'creativity',
        weight: 0.4,
        direction: 1,
      ),
      // Мотивация - добросовестность + экстраверсия
      TestMapping(
        testId: 'ipip_big_five',
        scale: 'conscientiousness',
        targetAxis: 'motivation',
        weight: 0.6,
        direction: 1,
      ),
      TestMapping(
        testId: 'ipip_big_five',
        scale: 'extraversion',
        targetAxis: 'motivation',
        weight: 0.4,
        direction: 1,
      ),
    ],

    // Fisher Temperament - темпераментные характеристики
    'fisher_temperament': [
      // Эмоциональный баланс - осторожность (cautious_compliant)
      TestMapping(
        testId: 'fisher_temperament',
        scale: 'cautious_compliant',
        targetAxis: 'emotional_balance',
        weight: 0.6,
        direction: 1, // Высокая осторожность = высокий баланс
      ),
      TestMapping(
        testId: 'fisher_temperament',
        scale: 'prosocial_empathetic',
        targetAxis: 'emotional_balance',
        weight: 0.4,
        direction: 1, // Высокая эмпатия = высокий баланс
      ),
      // Самоконтроль - осторожность (cautious_compliant)
      TestMapping(
        testId: 'fisher_temperament',
        scale: 'cautious_compliant',
        targetAxis: 'self_control',
        weight: 1.0,
        direction: 1, // Высокая осторожность = высокий самоконтроль
      ),
      // Социальность - просоциальность + любопытство
      TestMapping(
        testId: 'fisher_temperament',
        scale: 'prosocial_empathetic',
        targetAxis: 'sociability',
        weight: 0.7,
        direction: 1, // Высокая эмпатия = высокая социальность
      ),
      TestMapping(
        testId: 'fisher_temperament',
        scale: 'curious_energetic',
        targetAxis: 'sociability',
        weight: 0.3,
        direction: 1, // Любопытство = социальность
      ),
      // Осознанность - просоциальность (эмпатия, интроспекция)
      TestMapping(
        testId: 'fisher_temperament',
        scale: 'prosocial_empathetic',
        targetAxis: 'mindfulness',
        weight: 1.0,
        direction: 1, // Высокая эмпатия = высокая осознанность
      ),
      // Мотивация - аналитичность + любопытство
      TestMapping(
        testId: 'fisher_temperament',
        scale: 'analytical_tough',
        targetAxis: 'motivation',
        weight: 0.6,
        direction: 1, // Аналитичность = мотивация
      ),
      TestMapping(
        testId: 'fisher_temperament',
        scale: 'curious_energetic',
        targetAxis: 'motivation',
        weight: 0.4,
        direction: 1, // Любопытство = мотивация
      ),
      // Креативность - любопытство + просоциальность
      TestMapping(
        testId: 'fisher_temperament',
        scale: 'curious_energetic',
        targetAxis: 'creativity',
        weight: 0.7,
        direction: 1, // Любопытство = креативность
      ),
      TestMapping(
        testId: 'fisher_temperament',
        scale: 'prosocial_empathetic',
        targetAxis: 'creativity',
        weight: 0.3,
        direction: 1, // Эмпатия = креативность (воображение)
      ),
    ],

    // Тест на стресс - прямое соответствие эмоциональному балансу
    'stress_test': [
      TestMapping(
        testId: 'stress_test',
        scale: 'total',
        targetAxis: 'emotional_balance',
        weight: 1.0,
        direction: -1, // Инвертируем: высокий стресс = низкий баланс
      ),
      TestMapping(
        testId: 'stress_test',
        scale: 'total',
        targetAxis: 'self_control',
        weight: 0.3,
        direction: -1, // Высокий стресс может влиять на самоконтроль
      ),
    ],

    // Тест на самооценку - влияет на осознанность и эмоциональный баланс
    'self_esteem_test': [
      TestMapping(
        testId: 'self_esteem_test',
        scale: 'total',
        targetAxis: 'emotional_balance',
        weight: 0.7,
        direction: 1, // Высокая самооценка = высокий эмоциональный баланс
      ),
      TestMapping(
        testId: 'self_esteem_test',
        scale: 'total',
        targetAxis: 'mindfulness',
        weight: 0.8,
        direction: 1, // Высокая самооценка = высокая осознанность
      ),
      TestMapping(
        testId: 'self_esteem_test',
        scale: 'total',
        targetAxis: 'motivation',
        weight: 0.5,
        direction: 1, // Самооценка влияет на мотивацию
      ),
    ],

    // Профиль любви - 6 шкал отношений
    'love_profile': [
      // === Основные оси отношений ===

      // Безопасность в отношениях - комбинация безопасной привязанности и доверия
      TestMapping(
        testId: 'love_profile',
        scale: 'BP', // Безопасная привязанность
        targetAxis: 'relationship_security',
        weight: 0.6,
        direction: 1,
      ),
      TestMapping(
        testId: 'love_profile',
        scale: 'DR', // Доверие и ревность (обратная)
        targetAxis: 'relationship_security',
        weight: 0.4,
        direction: 1,
      ),

      // Эмоциональная близость - интимность + коммуникация
      TestMapping(
        testId: 'love_profile',
        scale: 'IU', // Интимность и уязвимость
        targetAxis: 'emotional_intimacy',
        weight: 0.6,
        direction: 1,
      ),
      TestMapping(
        testId: 'love_profile',
        scale: 'KK', // Коммуникация и конфликт
        targetAxis: 'emotional_intimacy',
        weight: 0.4,
        direction: 1,
      ),

      // Страсть и витальность - прямое соответствие
      TestMapping(
        testId: 'love_profile',
        scale: 'ST', // Страсть и телесность
        targetAxis: 'passion_vitality',
        weight: 1.0,
        direction: 1,
      ),

      // Надёжность и партнёрство - обязательства
      TestMapping(
        testId: 'love_profile',
        scale: 'OG', // Обязательства и совместные цели
        targetAxis: 'reliability_partnership',
        weight: 1.0,
        direction: 1,
      ),

      // === Кросс-влияния на личностные оси ===

      // Коммуникация влияет на осознанность
      TestMapping(
        testId: 'love_profile',
        scale: 'KK', // Коммуникация
        targetAxis: 'mindfulness',
        weight: 0.3,
        direction: 1,
      ),

      // Страсть влияет на мотивацию/энергию
      TestMapping(
        testId: 'love_profile',
        scale: 'ST', // Страсть
        targetAxis: 'motivation',
        weight: 0.3,
        direction: 1,
      ),

      // Обязательства влияют на самоконтроль
      TestMapping(
        testId: 'love_profile',
        scale: 'OG', // Обязательства
        targetAxis: 'self_control',
        weight: 0.3,
        direction: 1,
      ),
    ],
  };

  /// Настройки нормализации баллов (0-100 шкала)
  static const NormalizationSettings normalizationSettings = NormalizationSettings(
    minScore: 0,
    maxScore: 100,
    defaultScore: 50,
  );

  /// Пороги уверенности профиля
  static const ConfidenceThresholds confidenceThresholds = ConfidenceThresholds(
    high: 0.8,    // >= 3 разных тестов
    medium: 0.5,  // >= 2 разных тестов
    low: 0.3,     // < 2 тестов
  );
}

// ============================================================================
// HIERARCHICAL NAVIGATION UTILITIES
// ============================================================================

/// Utility class for navigating and querying the hierarchical scale system
class HierarchicalScaleUtils {
  /// Get all scales belonging to a category
  static List<HierarchicalScale> getScalesInCategory(String categoryId) {
    return HierarchicalScalesConfig.hierarchicalScales.values
        .where((scale) => scale.categoryId == categoryId)
        .toList();
  }

  /// Get category for a scale
  static ScaleCategory? getCategoryForScale(String scaleId) {
    final scale = HierarchicalScalesConfig.hierarchicalScales[scaleId];
    if (scale == null || scale.categoryId == null) return null;
    return ScaleCategoriesConfig.categories[scale.categoryId];
  }

  /// Get all top-level scales (no parent)
  static List<HierarchicalScale> getTopLevelScales() {
    return HierarchicalScalesConfig.hierarchicalScales.values
        .where((scale) => scale.isTopLevel)
        .toList();
  }

  /// Get all child scales of a parent scale
  static List<HierarchicalScale> getChildScales(String parentScaleId) {
    return HierarchicalScalesConfig.hierarchicalScales.values
        .where((scale) => scale.parentScaleId == parentScaleId)
        .toList();
  }

  /// Check if a scale exists
  static bool hasScale(String scaleId) {
    return HierarchicalScalesConfig.hierarchicalScales.containsKey(scaleId);
  }

  /// Get scale by ID
  static HierarchicalScale? getScale(String scaleId) {
    return HierarchicalScalesConfig.hierarchicalScales[scaleId];
  }

  /// Get category by ID
  static ScaleCategory? getCategory(String categoryId) {
    return ScaleCategoriesConfig.categories[categoryId];
  }

  /// Get all category IDs
  static List<String> getAllCategoryIds() {
    return ScaleCategoriesConfig.categories.keys.toList();
  }

  /// Get all scale IDs
  static List<String> getAllScaleIds() {
    return HierarchicalScalesConfig.hierarchicalScales.keys.toList();
  }

  /// Get total number of defined categories
  static int get totalCategories => ScaleCategoriesConfig.categories.length;

  /// Get total number of defined scales
  static int get totalScales => HierarchicalScalesConfig.hierarchicalScales.length;

  /// Get color for a scale (inherits from category if not set)
  static Color? getScaleColor(String scaleId) {
    final scale = HierarchicalScalesConfig.hierarchicalScales[scaleId];
    if (scale == null) return null;

    if (scale.color != null) return scale.color;

    // Inherit from category
    if (scale.categoryId != null) {
      final category = ScaleCategoriesConfig.categories[scale.categoryId];
      return category?.color;
    }

    return null;
  }

  /// Get icon for a scale (inherits from category if not set)
  static IconData? getScaleIcon(String scaleId) {
    final scale = HierarchicalScalesConfig.hierarchicalScales[scaleId];
    if (scale == null) return null;

    if (scale.icon != null) return scale.icon;

    // Inherit from category
    if (scale.categoryId != null) {
      final category = ScaleCategoriesConfig.categories[scale.categoryId];
      return category?.icon;
    }

    return null;
  }

  /// Get breadcrumb path for a scale (for UI navigation)
  /// Returns list like: ["Category Name", "Parent Scale Name", "Scale Name"]
  static List<String> getScaleBreadcrumb(String scaleId, String languageCode) {
    final breadcrumb = <String>[];
    final scale = HierarchicalScalesConfig.hierarchicalScales[scaleId];

    if (scale == null) return breadcrumb;

    // Add category
    if (scale.categoryId != null) {
      final category = ScaleCategoriesConfig.categories[scale.categoryId];
      if (category != null) {
        breadcrumb.add(category.getName(languageCode));
      }
    }

    // Add parent scale (if exists)
    if (scale.parentScaleId != null) {
      final parentScale = HierarchicalScalesConfig.hierarchicalScales[scale.parentScaleId];
      if (parentScale != null) {
        breadcrumb.add(parentScale.getName(languageCode));
      }
    }

    // Add current scale
    breadcrumb.add(scale.getName(languageCode));

    return breadcrumb;
  }

  /// Check if scale is implemented (has definition vs "on reserve")
  /// Scale is considered "on reserve" if it's in category's subscaleIds but not in hierarchicalScales
  static bool isScaleImplemented(String scaleId) {
    return HierarchicalScalesConfig.hierarchicalScales.containsKey(scaleId);
  }

  /// Get all "on reserve" scales for a category (defined in category but not yet implemented)
  static List<String> getReserveScalesForCategory(String categoryId) {
    final category = ScaleCategoriesConfig.categories[categoryId];
    if (category == null) return [];

    return category.subscaleIds
        .where((scaleId) => !HierarchicalScalesConfig.hierarchicalScales.containsKey(scaleId))
        .toList();
  }

  /// Get implementation statistics
  static Map<String, dynamic> getImplementationStats() {
    int totalExpectedScales = 0;
    int implementedScales = HierarchicalScalesConfig.hierarchicalScales.length;

    // Count all expected scales from categories
    for (final category in ScaleCategoriesConfig.categories.values) {
      totalExpectedScales += category.subscaleIds.length;
    }

    return {
      'totalCategories': ScaleCategoriesConfig.categories.length,
      'totalExpectedScales': totalExpectedScales,
      'implementedScales': implementedScales,
      'reserveScales': totalExpectedScales - implementedScales,
      'implementationPercentage': (implementedScales / totalExpectedScales * 100).toStringAsFixed(1),
    };
  }

  /// Get a bipolar scale by ID
  static BipolarScale? getBipolarScale(String scaleId) {
    return BipolarScalesConfig.getScale(scaleId);
  }

  /// Get all bipolar scale IDs
  static List<String> get bipolarScaleIds => BipolarScalesConfig.scaleIds;
}
