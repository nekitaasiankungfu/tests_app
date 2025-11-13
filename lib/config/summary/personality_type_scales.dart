/// Personality Type Scales Configuration
///
/// Defines 8 unipolar scales for personality type assessment.
/// These scales work in pairs to determine the 4-letter personality type code.
///
/// Instead of bipolar scales (E-I, S-N, T-F, J-P), we use 8 separate positive scales:
/// - extraversion & introversion
/// - sensing & intuition
/// - thinking & feeling
/// - judging & perceiving
///
/// Benefits:
/// - Simpler weight assignment (always positive)
/// - Clearer question mapping (each question affects one scale)
/// - More granular analysis (see strength of each pole separately)
/// - Easier to add new questions and tests

import 'package:flutter/material.dart';

/// Individual personality type scale definition
class PersonalityTypeScale {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final String dimension; // Which of 4 dimensions: EI, SN, TF, JP
  final String pole; // 'positive' or 'negative' pole of dimension
  final Color color;
  final IconData icon;

  const PersonalityTypeScale({
    required this.id,
    required this.name,
    required this.description,
    required this.dimension,
    required this.pole,
    required this.color,
    required this.icon,
  });
}

/// Container for all 8 personality type scales
class PersonalityTypeScales {
  /// All 8 personality type scales
  static const Map<String, PersonalityTypeScale> scales = {
    // ========== Energy Direction (E-I) ==========
    'extraversion': PersonalityTypeScale(
      id: 'extraversion',
      name: {
        'en': 'Extraversion',
        'ru': 'Экстраверсия',
      },
      description: {
        'en': 'Orientation toward the external world, energy from social interaction, breadth of activities',
        'ru': 'Ориентация на внешний мир, энергия от социального взаимодействия, широта деятельности',
      },
      dimension: 'EI',
      pole: 'positive',
      color: Color(0xFFFF6B6B),
      icon: Icons.groups,
    ),

    'introversion': PersonalityTypeScale(
      id: 'introversion',
      name: {
        'en': 'Introversion',
        'ru': 'Интроверсия',
      },
      description: {
        'en': 'Orientation toward the inner world, energy from solitude, depth of concentration',
        'ru': 'Ориентация на внутренний мир, энергия от уединения, глубина концентрации',
      },
      dimension: 'EI',
      pole: 'negative',
      color: Color(0xFF4ECDC4),
      icon: Icons.person,
    ),

    // ========== Information Gathering (S-N) ==========
    'sensing': PersonalityTypeScale(
      id: 'sensing',
      name: {
        'en': 'Sensing',
        'ru': 'Сенсорика',
      },
      description: {
        'en': 'Focus on concrete facts, practical details, present reality, hands-on experience',
        'ru': 'Фокус на конкретных фактах, практических деталях, настоящей реальности, практическом опыте',
      },
      dimension: 'SN',
      pole: 'positive',
      color: Color(0xFF95E77E),
      icon: Icons.touch_app,
    ),

    'intuition': PersonalityTypeScale(
      id: 'intuition',
      name: {
        'en': 'Intuition',
        'ru': 'Интуиция',
      },
      description: {
        'en': 'Focus on patterns, possibilities, future potential, abstract concepts, big picture',
        'ru': 'Фокус на паттернах, возможностях, будущем потенциале, абстрактных концепциях, общей картине',
      },
      dimension: 'SN',
      pole: 'negative',
      color: Color(0xFFB4A7D6),
      icon: Icons.lightbulb_outline,
    ),

    // ========== Decision Making (T-F) ==========
    'thinking': PersonalityTypeScale(
      id: 'thinking',
      name: {
        'en': 'Thinking',
        'ru': 'Мышление',
      },
      description: {
        'en': 'Logical analysis, objective criteria, impersonal decisions, truth and accuracy',
        'ru': 'Логический анализ, объективные критерии, беспристрастные решения, истина и точность',
      },
      dimension: 'TF',
      pole: 'positive',
      color: Color(0xFF6FA8DC),
      icon: Icons.psychology,
    ),

    'feeling': PersonalityTypeScale(
      id: 'feeling',
      name: {
        'en': 'Feeling',
        'ru': 'Чувство',
      },
      description: {
        'en': 'Value-based decisions, personal considerations, harmony and empathy, human impact',
        'ru': 'Решения на основе ценностей, личные соображения, гармония и эмпатия, влияние на людей',
      },
      dimension: 'TF',
      pole: 'negative',
      color: Color(0xFFFFB6C1),
      icon: Icons.favorite,
    ),

    // ========== Lifestyle Orientation (J-P) ==========
    'judging': PersonalityTypeScale(
      id: 'judging',
      name: {
        'en': 'Judging',
        'ru': 'Суждение',
      },
      description: {
        'en': 'Structured approach, planning ahead, closure and decisiveness, organized lifestyle',
        'ru': 'Структурированный подход, планирование заранее, завершенность и решительность, организованный образ жизни',
      },
      dimension: 'JP',
      pole: 'positive',
      color: Color(0xFFFFD966),
      icon: Icons.checklist,
    ),

    'perceiving': PersonalityTypeScale(
      id: 'perceiving',
      name: {
        'en': 'Perceiving',
        'ru': 'Восприятие',
      },
      description: {
        'en': 'Flexible approach, adapting to circumstances, openness to new information, spontaneous lifestyle',
        'ru': 'Гибкий подход, адаптация к обстоятельствам, открытость новой информации, спонтанный образ жизни',
      },
      dimension: 'JP',
      pole: 'negative',
      color: Color(0xFFC9A0DC),
      icon: Icons.explore,
    ),
  };

  /// Get scales for a specific dimension
  static Map<String, PersonalityTypeScale> getScalesForDimension(String dimension) {
    return Map.fromEntries(
      scales.entries.where((entry) => entry.value.dimension == dimension)
    );
  }

  /// Get the positive pole scale for a dimension
  static PersonalityTypeScale? getPositivePole(String dimension) {
    return scales.values.firstWhere(
      (scale) => scale.dimension == dimension && scale.pole == 'positive',
      orElse: () => scales.values.first,
    );
  }

  /// Get the negative pole scale for a dimension
  static PersonalityTypeScale? getNegativePole(String dimension) {
    return scales.values.firstWhere(
      (scale) => scale.dimension == dimension && scale.pole == 'negative',
      orElse: () => scales.values.first,
    );
  }

  /// Convert 8 scale scores to 4 bipolar scores for UI display
  /// Returns map with keys: 'EI', 'SN', 'TF', 'JP'
  /// Values are 0-100 where >50 means positive pole dominates
  static Map<String, double> convertToBipolarScores(Map<String, double> scaleScores) {
    final result = <String, double>{};

    // Calculate E-I dimension
    final e = scaleScores['extraversion'] ?? 0.0;
    final i = scaleScores['introversion'] ?? 0.0;
    if (e + i > 0) {
      result['EI'] = (e / (e + i)) * 100;
    } else {
      result['EI'] = 50.0; // Balanced if no data
    }

    // Calculate S-N dimension
    final s = scaleScores['sensing'] ?? 0.0;
    final n = scaleScores['intuition'] ?? 0.0;
    if (s + n > 0) {
      result['SN'] = (s / (s + n)) * 100;
    } else {
      result['SN'] = 50.0;
    }

    // Calculate T-F dimension
    final t = scaleScores['thinking'] ?? 0.0;
    final f = scaleScores['feeling'] ?? 0.0;
    if (t + f > 0) {
      result['TF'] = (t / (t + f)) * 100;
    } else {
      result['TF'] = 50.0;
    }

    // Calculate J-P dimension
    final j = scaleScores['judging'] ?? 0.0;
    final p = scaleScores['perceiving'] ?? 0.0;
    if (j + p > 0) {
      result['JP'] = (j / (j + p)) * 100;
    } else {
      result['JP'] = 50.0;
    }

    return result;
  }

  /// Determine personality type code from 8 scale scores
  /// Returns 4-letter code like 'ENFP' or 'INTJ'
  static String determineTypeCode(Map<String, double> scaleScores) {
    final bipolar = convertToBipolarScores(scaleScores);

    String code = '';

    // E or I
    if (bipolar['EI']! > 50) {
      code += 'E';
    } else if (bipolar['EI']! < 50) {
      code += 'I';
    } else {
      code += 'X'; // Balanced
    }

    // S or N
    if (bipolar['SN']! > 50) {
      code += 'S';
    } else if (bipolar['SN']! < 50) {
      code += 'N';
    } else {
      code += 'X';
    }

    // T or F
    if (bipolar['TF']! > 50) {
      code += 'T';
    } else if (bipolar['TF']! < 50) {
      code += 'F';
    } else {
      code += 'X';
    }

    // J or P
    if (bipolar['JP']! > 50) {
      code += 'J';
    } else if (bipolar['JP']! < 50) {
      code += 'P';
    } else {
      code += 'X';
    }

    return code;
  }

  /// Get dominant scale and its percentage for a dimension
  /// Returns tuple of (dominant_scale_id, percentage)
  static (String, double) getDominantScale(String dimension, Map<String, double> scaleScores) {
    final dimScales = getScalesForDimension(dimension);

    double maxScore = 0;
    String dominantScale = '';
    double total = 0;

    for (final scale in dimScales.values) {
      final score = scaleScores[scale.id] ?? 0.0;
      total += score;
      if (score > maxScore) {
        maxScore = score;
        dominantScale = scale.id;
      }
    }

    final percentage = total > 0 ? (maxScore / total) * 100 : 50.0;

    return (dominantScale, percentage);
  }

  /// Format display for UI (showing only dominant pole)
  /// Returns map with display information for each dimension
  static Map<String, Map<String, dynamic>> getUIDisplayData(Map<String, double> scaleScores, String languageCode) {
    final displayData = <String, Map<String, dynamic>>{};

    for (final dimension in ['EI', 'SN', 'TF', 'JP']) {
      final (dominantScale, percentage) = getDominantScale(dimension, scaleScores);
      final scale = scales[dominantScale];

      if (scale != null) {
        // Determine which pole is dominant and its letter
        final isPositivePole = scale.pole == 'positive';
        final letter = dimension == 'EI' ? (isPositivePole ? 'E' : 'I') :
                      dimension == 'SN' ? (isPositivePole ? 'S' : 'N') :
                      dimension == 'TF' ? (isPositivePole ? 'T' : 'F') :
                      (isPositivePole ? 'J' : 'P');

        displayData[dimension] = {
          'letter': letter,
          'name': scale.name[languageCode] ?? scale.name['en'],
          'percentage': percentage,
          'color': scale.color,
          'icon': scale.icon,
          'isDominant': true,
        };
      }
    }

    return displayData;
  }
}

/// Utility functions for working with personality type scales
class PersonalityTypeUtils {
  /// Check if a test uses the personality type system
  static bool isPersonalityTypeTest(String testId) {
    return testId == 'sixteen_types';
  }

  /// Get all scale IDs for personality types
  static List<String> getAllScaleIds() {
    return PersonalityTypeScales.scales.keys.toList();
  }

  /// Validate that all required scales have scores
  static bool hasCompleteScores(Map<String, double> scaleScores) {
    for (final scaleId in getAllScaleIds()) {
      if (!scaleScores.containsKey(scaleId) || scaleScores[scaleId] == null) {
        return false;
      }
    }
    return true;
  }
}