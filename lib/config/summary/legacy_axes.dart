import 'package:flutter/material.dart';

/// Legacy axes configuration for backward compatibility with V1.0 system
///
/// This file contains the original 10 personality axes used in the V1.0 system:
/// - 6 core personality axes (emotional balance, self-control, sociability, mindfulness, motivation, creativity)
/// - 4 relationship quality axes (security, intimacy, passion, reliability)
///
/// These axes are maintained for backward compatibility and can be used alongside
/// the new hierarchical scale system introduced in V2.0.

/// Represents a legacy personality axis (V1.0 compatibility)
class SummaryAxis {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Color color;
  final IconData icon;
  final Map<String, String>? instrumentalCase; // Творительный падеж (над чем?)
  final Map<String, String>? genitiveCase; // Родительный падеж (чего?)

  const SummaryAxis({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
    this.instrumentalCase,
    this.genitiveCase,
  });

  String getName(String languageCode) => name[languageCode] ?? name['en'] ?? '';
  String getDescription(String languageCode) => description[languageCode] ?? description['en'] ?? '';
  String getInstrumentalCase(String languageCode) =>
      instrumentalCase?[languageCode] ?? name[languageCode]?.toLowerCase() ?? name['en']?.toLowerCase() ?? '';
  String getGenitiveCase(String languageCode) =>
      genitiveCase?[languageCode] ?? name[languageCode]?.toLowerCase() ?? name['en']?.toLowerCase() ?? '';
}

/// Legacy axes configuration - Original V1.0 system
/// Contains 10 axes:
/// - 6 core personality dimensions
/// - 4 relationship quality dimensions
class LegacyAxesConfig {
  /// Legacy personality axes (V1.0 system)
  ///
  /// Core personality axes:
  /// - emotional_balance: Emotional stability, stress resilience
  /// - self_control: Willpower, discipline, responsibility
  /// - sociability: Social skills, empathy, friendliness
  /// - mindfulness: Self-awareness, reflection capabilities
  /// - motivation: Drive, energy, goal pursuit
  /// - creativity: Innovation, openness to experience, adaptability
  ///
  /// Relationship quality axes:
  /// - relationship_security: Trust, security in relationships
  /// - emotional_intimacy: Deep connection, openness
  /// - passion_vitality: Energy, spontaneity, physical intimacy
  /// - reliability_partnership: Long-term commitment, reliability
  static const Map<String, SummaryAxis> axes = {
    'emotional_balance': SummaryAxis(
      id: 'emotional_balance',
      name: {'en': 'Emotional Balance', 'ru': 'Эмоциональный баланс'},
      description: {
        'en': 'Resilience to stress, emotional stability, ability to cope with anxiety',
        'ru': 'Устойчивость к стрессу, эмоциональная стабильность, способность справляться с тревогой'
      },
      instrumentalCase: {'en': 'emotional balance', 'ru': 'эмоциональным балансом'},
      genitiveCase: {'en': 'emotional balance', 'ru': 'эмоционального баланса'},
      color: Colors.blue,
      icon: Icons.balance,
    ),
    'self_control': SummaryAxis(
      id: 'self_control',
      name: {'en': 'Self-Control & Discipline', 'ru': 'Самоконтроль и дисциплина'},
      description: {
        'en': 'Willpower, responsibility, ability to follow plans, resist procrastination',
        'ru': 'Воля, ответственность, умение следовать планам, противостоять прокрастинации'
      },
      instrumentalCase: {'en': 'self-control & discipline', 'ru': 'самоконтролем и дисциплиной'},
      genitiveCase: {'en': 'self-control & discipline', 'ru': 'самоконтроля и дисциплины'},
      color: Colors.green,
      icon: Icons.self_improvement,
    ),
    'sociability': SummaryAxis(
      id: 'sociability',
      name: {'en': 'Sociability & Empathy', 'ru': 'Социальность и эмпатия'},
      description: {
        'en': 'Sociability, friendliness, contactability, ability to understand others',
        'ru': 'Общительность, доброжелательность, контактность, умение понимать других'
      },
      instrumentalCase: {'en': 'sociability & empathy', 'ru': 'социальностью и эмпатией'},
      genitiveCase: {'en': 'sociability & empathy', 'ru': 'социальности и эмпатии'},
      color: Colors.orange,
      icon: Icons.people,
    ),
    'mindfulness': SummaryAxis(
      id: 'mindfulness',
      name: {'en': 'Mindfulness & Reflection', 'ru': 'Осознанность и рефлексия'},
      description: {
        'en': 'Self-analysis, attentiveness to oneself, ability for reflection and self-discovery',
        'ru': 'Самоанализ, внимательность к себе, способность к рефлексии и самопознанию'
      },
      instrumentalCase: {'en': 'mindfulness & reflection', 'ru': 'осознанностью и рефлексией'},
      genitiveCase: {'en': 'mindfulness & reflection', 'ru': 'осознанности и рефлексии'},
      color: Colors.purple,
      icon: Icons.psychology,
    ),
    'motivation': SummaryAxis(
      id: 'motivation',
      name: {'en': 'Motivation & Energy', 'ru': 'Мотивация и энергия'},
      description: {
        'en': 'Drive, goal pursuit, inner strength, enthusiasm and energy',
        'ru': 'Драйв, стремление к целям, внутренняя сила, энтузиазм и энергичность'
      },
      instrumentalCase: {'en': 'motivation & energy', 'ru': 'мотивацией и энергией'},
      genitiveCase: {'en': 'motivation & energy', 'ru': 'мотивации и энергии'},
      color: Colors.red,
      icon: Icons.flash_on,
    ),
    'creativity': SummaryAxis(
      id: 'creativity',
      name: {'en': 'Creativity & Flexible Thinking', 'ru': 'Креативность и гибкость мышления'},
      description: {
        'en': 'Curiosity, openness to new things, adaptability, creative thinking',
        'ru': 'Любопытство, открытость новому, адаптивность, творческое мышление'
      },
      instrumentalCase: {'en': 'creativity & flexible thinking', 'ru': 'креативностью и гибкостью мышления'},
      genitiveCase: {'en': 'creativity & flexible thinking', 'ru': 'креативности и гибкости мышления'},
      color: Colors.teal,
      icon: Icons.lightbulb,
    ),
    // === Оси качества отношений ===
    'relationship_security': SummaryAxis(
      id: 'relationship_security',
      name: {'en': 'Security and Trust', 'ru': 'Безопасность и доверие'},
      description: {
        'en': 'Feeling secure and stable in close relationships, ability to trust, freedom from jealousy and abandonment anxiety',
        'ru': 'Ощущение защищенности и стабильности в близких отношениях, способность доверять, свобода от ревности и тревоги покинутости'
      },
      instrumentalCase: {'en': 'security and trust', 'ru': 'безопасностью и доверием'},
      genitiveCase: {'en': 'security and trust', 'ru': 'безопасности и доверия'},
      color: Color(0xFFE91E63), // Pink
      icon: Icons.favorite_border,
    ),
    'emotional_intimacy': SummaryAxis(
      id: 'emotional_intimacy',
      name: {'en': 'Intimacy and Openness', 'ru': 'Близость и открытость'},
      description: {
        'en': 'Ability to deep emotional connection, openness in communication, willingness to share feelings and vulnerabilities',
        'ru': 'Способность к глубокой эмоциональной связи, открытость в общении, готовность делиться чувствами и уязвимостью'
      },
      instrumentalCase: {'en': 'intimacy and openness', 'ru': 'близостью и открытостью'},
      genitiveCase: {'en': 'intimacy and openness', 'ru': 'близости и открытости'},
      color: Color(0xFF673AB7), // Deep Purple
      icon: Icons.connect_without_contact,
    ),
    'passion_vitality': SummaryAxis(
      id: 'passion_vitality',
      name: {'en': 'Passion and Vitality', 'ru': 'Страсть и витальность'},
      description: {
        'en': 'Energy in relationships, spontaneity, playfulness, physical intimacy, passion',
        'ru': 'Энергия в отношениях, спонтанность, игривость, физическая близость, страстность'
      },
      instrumentalCase: {'en': 'passion and vitality', 'ru': 'страстью и витальностью'},
      genitiveCase: {'en': 'passion and vitality', 'ru': 'страсти и витальности'},
      color: Color(0xFFFF5722), // Deep Orange
      icon: Icons.local_fire_department,
    ),
    'reliability_partnership': SummaryAxis(
      id: 'reliability_partnership',
      name: {'en': 'Reliability and Partnership', 'ru': 'Надёжность и партнёрство'},
      description: {
        'en': 'Ability to long-term commitment, reliability, shared goal planning, responsibility in relationships',
        'ru': 'Способность к долгосрочным обязательствам, надёжность, совместное планирование целей, ответственность в отношениях'
      },
      instrumentalCase: {'en': 'reliability and partnership', 'ru': 'надёжностью и партнёрством'},
      genitiveCase: {'en': 'reliability and partnership', 'ru': 'надёжности и партнёрства'},
      color: Color(0xFF795548), // Brown
      icon: Icons.handshake,
    ),
  };
}
