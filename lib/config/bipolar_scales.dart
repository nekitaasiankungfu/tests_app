import 'package:flutter/material.dart';

/// Represents a bipolar dimension in personality testing (e.g., E/I, S/N, T/F, J/P)
/// A bipolar scale measures two opposite poles rather than a single trait
class BipolarScale {
  final String id;                              // e.g., 'personality_type_ei'
  final String positiveEnd;                     // e.g., 'E'
  final String negativeEnd;                     // e.g., 'I'
  final Map<String, String> positiveName;       // {'ru': 'Экстраверсия', 'en': 'Extraversion'}
  final Map<String, String> negativeName;       // {'ru': 'Интроверсия', 'en': 'Introversion'}
  final Map<String, String> positiveDescription;
  final Map<String, String> negativeDescription;
  final Color color;
  final IconData icon;

  const BipolarScale({
    required this.id,
    required this.positiveEnd,
    required this.negativeEnd,
    required this.positiveName,
    required this.negativeName,
    required this.positiveDescription,
    required this.negativeDescription,
    required this.color,
    required this.icon,
  });

  String getPositiveName(String languageCode) => positiveName[languageCode] ?? positiveName['en'] ?? '';
  String getNegativeName(String languageCode) => negativeName[languageCode] ?? negativeName['en'] ?? '';
  String getPositiveDescription(String languageCode) => positiveDescription[languageCode] ?? positiveDescription['en'] ?? '';
  String getNegativeDescription(String languageCode) => negativeDescription[languageCode] ?? negativeDescription['en'] ?? '';

  /// Determine which pole is dominant based on score (0-100)
  /// Returns 'E', 'I', 'S', 'N', etc.
  String getDominantPole(double score) {
    return score >= 50 ? positiveEnd : negativeEnd;
  }

  /// Get percentage strength of dominant pole
  /// Score 75 → 75% (E dominant)
  /// Score 30 → 70% (I dominant, because 100-30=70)
  int getDominantPercentage(double score) {
    if (score >= 50) {
      return score.round();
    } else {
      return (100 - score).round();
    }
  }
}

/// Bipolar scales configuration for personality tests (Jung/Type Theory style)
class BipolarScalesConfig {
  static const Map<String, BipolarScale> scales = {
    'personality_type_ei': BipolarScale(
      id: 'personality_type_ei',
      positiveEnd: 'E',
      negativeEnd: 'I',
      positiveName: {'ru': 'Экстраверсия', 'en': 'Extraversion'},
      negativeName: {'ru': 'Интроверсия', 'en': 'Introversion'},
      positiveDescription: {
        'ru': 'Черпает энергию из внешнего мира, общения, активности. Мыслит вслух, предпочитает широкий круг знакомств.',
        'en': 'Draws energy from the outer world, communication, activity. Thinks out loud, prefers a wide circle of acquaintances.',
      },
      negativeDescription: {
        'ru': 'Черпает энергию из внутреннего мира, размышлений, уединения. Мыслит про себя, предпочитает глубокие связи.',
        'en': 'Draws energy from the inner world, reflection, solitude. Thinks internally, prefers deep connections.',
      },
      color: Colors.orange,
      icon: Icons.people,
    ),

    'personality_type_sn': BipolarScale(
      id: 'personality_type_sn',
      positiveEnd: 'S',
      negativeEnd: 'N',
      positiveName: {'ru': 'Сенсорика', 'en': 'Sensing'},
      negativeName: {'ru': 'Интуиция', 'en': 'Intuition'},
      positiveDescription: {
        'ru': 'Опирается на факты, конкретику, опыт. Внимателен к деталям, живёт в настоящем моменте.',
        'en': 'Relies on facts, specifics, experience. Attentive to details, lives in the present moment.',
      },
      negativeDescription: {
        'ru': 'Опирается на интуицию, возможности, будущее. Видит скрытые связи, мыслит абстрактно.',
        'en': 'Relies on intuition, possibilities, future. Sees hidden connections, thinks abstractly.',
      },
      color: Colors.teal,
      icon: Icons.lightbulb,
    ),

    'personality_type_tf': BipolarScale(
      id: 'personality_type_tf',
      positiveEnd: 'T',
      negativeEnd: 'F',
      positiveName: {'ru': 'Логика', 'en': 'Thinking'},
      negativeName: {'ru': 'Эмоции', 'en': 'Feeling'},
      positiveDescription: {
        'ru': 'Принимает решения на основе логики, объективности, справедливости. Ценит истину выше комфорта.',
        'en': 'Makes decisions based on logic, objectivity, fairness. Values truth over comfort.',
      },
      negativeDescription: {
        'ru': 'Принимает решения на основе ценностей, эмпатии, гармонии. Ценит чувства людей и отношения.',
        'en': 'Makes decisions based on values, empathy, harmony. Values people\'s feelings and relationships.',
      },
      color: Colors.pink,
      icon: Icons.favorite,
    ),

    'personality_type_jp': BipolarScale(
      id: 'personality_type_jp',
      positiveEnd: 'J',
      negativeEnd: 'P',
      positiveName: {'ru': 'Рациональность', 'en': 'Judging'},
      negativeName: {'ru': 'Импровизация', 'en': 'Perceiving'},
      positiveDescription: {
        'ru': 'Предпочитает структуру, планирование, завершённость. Ценит порядок и определённость.',
        'en': 'Prefers structure, planning, closure. Values order and certainty.',
      },
      negativeDescription: {
        'ru': 'Предпочитает гибкость, спонтанность, открытость. Ценит адаптивность и свободу выбора.',
        'en': 'Prefers flexibility, spontaneity, openness. Values adaptability and freedom of choice.',
      },
      color: Colors.green,
      icon: Icons.self_improvement,
    ),
  };

  /// Get a bipolar scale by ID
  static BipolarScale? getScale(String scaleId) {
    return scales[scaleId];
  }

  /// Get all bipolar scale IDs
  static List<String> get scaleIds => scales.keys.toList();
}
