import 'package:flutter/material.dart';

/// Represents a category of psychological scales (top-level grouping)
/// Examples: "Big Five - Emotional Stability", "Relationship Quality", etc.
class ScaleCategory {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Color color;
  final IconData icon;
  final List<String> subscaleIds;  // IDs of scales in this category

  const ScaleCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
    required this.subscaleIds,
  });

  String getName(String languageCode) => name[languageCode] ?? name['en'] ?? '';
  String getDescription(String languageCode) => description[languageCode] ?? description['en'] ?? '';
}

/// Configuration for scale categories
class ScaleCategoriesConfig {
  // ============================================================================
  // CATEGORIES (Top-level groupings)
  // ============================================================================

  static const Map<String, ScaleCategory> categories = {
    // === BIG FIVE EXPANDED ===
    'cat_emotional_stability': ScaleCategory(
      id: 'cat_emotional_stability',
      name: {'ru': 'Эмоциональная стабильность', 'en': 'Emotional Stability'},
      description: {'ru': 'Устойчивость к стрессу и эмоциональная регуляция', 'en': 'Stress resilience and emotional regulation'},
      color: Colors.blue,
      icon: Icons.balance,
      subscaleIds: [
        'anxiety', 'anger', 'depression', 'self_consciousness', 'impulsiveness',
        'vulnerability', 'stress_tolerance', 'emotional_resilience', 'mood_stability',
        'frustration_tolerance', 'worry_tendency', 'panic_tendency', 'emotional_reactivity',
        'calmness', 'composure',
      ],
    ),

    'cat_extraversion': ScaleCategory(
      id: 'cat_extraversion',
      name: {'ru': 'Экстраверсия и общительность', 'en': 'Extraversion & Sociability'},
      description: {'ru': 'Социальная энергия и взаимодействие', 'en': 'Social energy and interaction'},
      color: Colors.orange,
      icon: Icons.people,
      subscaleIds: [
        'warmth', 'gregariousness', 'assertiveness', 'activity_level', 'excitement_seeking',
        'positive_emotions', 'social_confidence', 'social_boldness', 'liveliness',
        'enthusiasm', 'expressiveness',
      ],
    ),

    'cat_agreeableness': ScaleCategory(
      id: 'cat_agreeableness',
      name: {'ru': 'Доброжелательность', 'en': 'Agreeableness'},
      description: {'ru': 'Сотрудничество и эмпатия', 'en': 'Cooperation and empathy'},
      color: Colors.green,
      icon: Icons.favorite,
      subscaleIds: [
        'trust', 'straightforwardness', 'altruism', 'cooperation', 'modesty',
        'sympathy', 'empathy', 'compassion', 'kindness', 'generosity', 'forgiveness',
      ],
    ),

    'cat_conscientiousness': ScaleCategory(
      id: 'cat_conscientiousness',
      name: {'ru': 'Добросовестность', 'en': 'Conscientiousness'},
      description: {'ru': 'Организованность и самодисциплина', 'en': 'Organization and self-discipline'},
      color: Colors.purple,
      icon: Icons.task_alt,
      subscaleIds: [
        'competence', 'order', 'dutifulness', 'achievement_striving', 'self_discipline',
        'deliberation', 'organization', 'goal_orientation', 'persistence', 'reliability',
        'responsibility', 'punctuality',
      ],
    ),

    'cat_openness': ScaleCategory(
      id: 'cat_openness',
      name: {'ru': 'Открытость опыту', 'en': 'Openness to Experience'},
      description: {'ru': 'Креативность и любознательность', 'en': 'Creativity and curiosity'},
      color: Colors.indigo,
      icon: Icons.lightbulb,
      subscaleIds: [
        'imagination', 'artistic_interests', 'emotionality', 'adventurousness',
        'intellect', 'psychological_liberalism', 'creativity', 'curiosity',
        'aesthetic_appreciation', 'intellectual_flexibility',
      ],
    ),

    // === RELATIONSHIPS ===
    'cat_relationship_quality': ScaleCategory(
      id: 'cat_relationship_quality',
      name: {'ru': 'Качество отношений', 'en': 'Relationship Quality'},
      description: {'ru': 'Близость и привязанность', 'en': 'Intimacy and attachment'},
      color: Colors.pink,
      icon: Icons.favorite_border,
      subscaleIds: [
        'intimacy', 'romance', 'passion', 'commitment', 'attachment_security',
        'relationship_satisfaction', 'partner_support', 'shared_activities',
        'relationship_harmony', 'secure_attachment', 'anxious_attachment',
        'avoidant_attachment', 'relationship_maintenance', 'sexual_satisfaction',
        'trust_in_relationships', 'interdependence', 'relationship_growth',
        'vulnerability_in_relationships', 'forgiveness_in_relationships',
        'love_expression', 'caring', 'loyalty', 'devotion', 'partnership',
      ],
    ),

    // === COGNITIVE ABILITIES ===
    'cat_cognitive': ScaleCategory(
      id: 'cat_cognitive',
      name: {'ru': 'Когнитивные способности', 'en': 'Cognitive Abilities'},
      description: {'ru': 'Мышление и решение проблем', 'en': 'Thinking and problem-solving'},
      color: Colors.cyan,
      icon: Icons.psychology,
      subscaleIds: [
        'analytical_thinking', 'critical_thinking', 'problem_solving', 'decision_making',
        'strategic_thinking', 'cognitive_flexibility', 'abstract_thinking', 'logical_reasoning',
        'pattern_recognition', 'information_processing', 'attention_to_detail', 'memory',
      ],
    ),

    // === MOTIVATION & DRIVE ===
    'cat_motivation': ScaleCategory(
      id: 'cat_motivation',
      name: {'ru': 'Мотивация и стремления', 'en': 'Motivation & Drive'},
      description: {'ru': 'Достижения и упорство', 'en': 'Achievement and persistence'},
      color: Colors.amber,
      icon: Icons.trending_up,
      subscaleIds: [
        'achievement_motivation', 'intrinsic_motivation', 'extrinsic_motivation',
        'growth_mindset', 'mastery_orientation', 'performance_orientation',
        'goal_commitment', 'ambition', 'drive', 'competitiveness', 'self_improvement',
      ],
    ),

    // === SOCIAL SKILLS ===
    'cat_social_skills': ScaleCategory(
      id: 'cat_social_skills',
      name: {'ru': 'Социальные навыки', 'en': 'Social Skills'},
      description: {'ru': 'Эмоциональный интеллект и коммуникация', 'en': 'Emotional intelligence and communication'},
      color: Colors.teal,
      icon: Icons.groups,
      subscaleIds: [
        'emotional_awareness', 'emotional_expression', 'emotional_regulation',
        'emotional_understanding', 'social_awareness', 'social_influence',
        'conflict_resolution', 'negotiation', 'persuasion', 'active_listening',
        'verbal_communication', 'nonverbal_communication', 'public_speaking',
        'networking', 'team_collaboration',
      ],
    ),

    // === DARK TRIAD ===
    'cat_dark_triad': ScaleCategory(
      id: 'cat_dark_triad',
      name: {'ru': 'Темная триада', 'en': 'Dark Triad'},
      description: {'ru': 'Негативные черты личности', 'en': 'Negative personality traits'},
      color: Colors.grey,
      icon: Icons.warning_amber,
      subscaleIds: [
        'narcissism', 'machiavellianism', 'psychopathy', 'manipulation',
        'entitlement', 'exploitation', 'grandiosity', 'lack_of_empathy',
        'moral_disengagement', 'callousness',
      ],
    ),

    // === LEADERSHIP ===
    'cat_leadership': ScaleCategory(
      id: 'cat_leadership',
      name: {'ru': 'Лидерство', 'en': 'Leadership'},
      description: {'ru': 'Влияние и управление командой', 'en': 'Influence and team management'},
      color: Colors.deepPurple,
      icon: Icons.emoji_events,
      subscaleIds: [
        'visionary_leadership', 'transformational_leadership', 'servant_leadership',
        'authentic_leadership', 'strategic_leadership', 'team_building',
        'delegation', 'mentoring', 'inspiring_others', 'decision_authority',
      ],
    ),

    // === VALUES ===
    'cat_values': ScaleCategory(
      id: 'cat_values',
      name: {'ru': 'Ценности', 'en': 'Values'},
      description: {'ru': 'Моральные принципы и убеждения', 'en': 'Moral principles and beliefs'},
      color: Colors.blueGrey,
      icon: Icons.account_balance,
      subscaleIds: [
        'honesty', 'integrity', 'fairness', 'justice', 'respect',
        'humility', 'gratitude', 'spirituality', 'tradition',
        'universalism', 'benevolence', 'conformity',
      ],
    ),

    // === WELL-BEING ===
    'cat_wellbeing': ScaleCategory(
      id: 'cat_wellbeing',
      name: {'ru': 'Благополучие', 'en': 'Well-being'},
      description: {'ru': 'Счастье и удовлетворенность жизнью', 'en': 'Happiness and life satisfaction'},
      color: Colors.lightGreen,
      icon: Icons.sentiment_satisfied,
      subscaleIds: [
        'life_satisfaction', 'happiness', 'optimism', 'hope', 'flow',
        'meaning', 'purpose', 'flourishing', 'vitality', 'gratification',
      ],
    ),

    // === IDENTITY ===
    'cat_identity': ScaleCategory(
      id: 'cat_identity',
      name: {'ru': 'Идентичность', 'en': 'Identity'},
      description: {'ru': 'Самопонимание и аутентичность', 'en': 'Self-understanding and authenticity'},
      color: Colors.deepOrange,
      icon: Icons.person,
      subscaleIds: [
        'self_esteem', 'self_concept', 'self_awareness', 'authenticity',
        'identity_clarity', 'self_acceptance', 'self_compassion',
        'self_consistency', 'personal_growth', 'autonomy',
      ],
    ),

    // === STRESS & COPING ===
    'cat_stress_coping': ScaleCategory(
      id: 'cat_stress_coping',
      name: {'ru': 'Стресс и совладание', 'en': 'Stress & Coping'},
      description: {'ru': 'Стратегии управления стрессом', 'en': 'Stress management strategies'},
      color: Colors.lightBlue,
      icon: Icons.self_improvement,
      subscaleIds: [
        'stress_resilience', 'coping_flexibility', 'problem_focused_coping',
        'emotion_focused_coping', 'social_support_seeking', 'mindfulness',
        'relaxation', 'reappraisal', 'acceptance', 'avoidance_coping',
      ],
    ),

    // === CREATIVITY ===
    'cat_creativity': ScaleCategory(
      id: 'cat_creativity',
      name: {'ru': 'Креативность', 'en': 'Creativity'},
      description: {'ru': 'Творческое мышление и инновации', 'en': 'Creative thinking and innovation'},
      color: Colors.deepPurpleAccent,
      icon: Icons.palette,
      subscaleIds: [
        'divergent_thinking', 'originality', 'flexibility', 'fluency',
        'elaboration', 'innovation', 'artistic_creativity', 'scientific_creativity',
        'everyday_creativity', 'creative_confidence',
      ],
    ),

    // === BEHAVIORAL STYLES ===
    'cat_behavioral': ScaleCategory(
      id: 'cat_behavioral',
      name: {'ru': 'Поведенческие стили', 'en': 'Behavioral Styles'},
      description: {'ru': 'Паттерны поведения и привычки', 'en': 'Behavior patterns and habits'},
      color: Colors.brown,
      icon: Icons.directions_walk,
      subscaleIds: [
        'proactivity', 'reactivity', 'impulsivity', 'planning',
        'spontaneity', 'routine_preference', 'variety_seeking',
        'risk_taking', 'caution', 'time_management',
      ],
    ),

    // === META-INDICATORS ===
    'cat_meta': ScaleCategory(
      id: 'cat_meta',
      name: {'ru': 'Мета-индикаторы', 'en': 'Meta-Indicators'},
      description: {'ru': 'Качество и достоверность ответов', 'en': 'Response quality and validity'},
      color: Colors.grey,
      icon: Icons.analytics,
      subscaleIds: [
        'response_consistency', 'social_desirability', 'acquiescence',
        'extreme_responding', 'central_tendency', 'random_responding',
      ],
    ),
  };

  /// Get category by ID
  static ScaleCategory? getCategory(String categoryId) => categories[categoryId];

  /// Get all categories
  static List<ScaleCategory> getAllCategories() => categories.values.toList();

  /// Get categories for specific scale IDs
  static List<ScaleCategory> getCategoriesForScales(List<String> scaleIds) {
    return categories.values.where((category) {
      return category.subscaleIds.any((subscaleId) => scaleIds.contains(subscaleId));
    }).toList();
  }
}