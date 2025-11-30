import 'package:flutter/material.dart';
import 'bipolar_scales.dart';
import 'summary/question_weights/question_weight_models.dart';
import 'summary/question_weights/ipip_big_five_weights.dart';
import 'summary/question_weights/fisher_temperament_weights.dart';
import 'summary/question_weights/love_profile_weights.dart';
import 'summary/question_weights/simple_tests_weights.dart';
import 'summary/question_weights/sixteen_types_weights.dart';
import 'summary/question_weights/temperament_profile_test_weights.dart';
import 'summary/question_weights/digital_detox_weights.dart';
import 'summary/question_weights/burnout_diagnostic_weights.dart';
import 'summary/question_weights/social_battery_weights.dart';
import 'summary/question_weights/disc_personality_weights.dart';
import 'summary/question_weights/holland_code_weights.dart';
import 'summary/question_weights/love_languages_weights.dart';
import 'summary/question_weights/anxiety_symptoms_inventory_weights.dart';
import 'summary/question_weights/depression_symptoms_inventory_weights.dart';
import 'summary/question_weights/career_compass_weights.dart';
import 'summary/question_weights/wellbeing_happiness_inventory_weights.dart';
import 'summary/question_weights/digital_career_fit_weights.dart';
import 'summary/question_weights/self_confidence_multiscale_weights.dart';
import 'summary/question_weights/romantic_potential_weights.dart';
import 'summary/question_weights/cognitive_ability_weights.dart';
import 'summary/question_weights/relationship_compatibility_weights.dart';
import 'summary/question_weights/friendship_psychology_weights.dart';
import 'summary/question_weights/perfectionism_fear_of_error_weights.dart';

// Re-export for convenience
export 'bipolar_scales.dart';
export 'summary/question_weights/question_weight_models.dart';

/// Конфигурация для расчёта общего саммари по всем тестам
/// Определяет иерархическую структуру ~200 психологических шкал
///
/// АРХИТЕКТУРА V2.0: Иерархическая система шкал
/// - Категории верхнего уровня (Big Five, Relationships, Cognitive, etc.)
/// - Подшкалы (детальные психологические конструкты)
/// - Поддержка 3-10 весов на вопрос в зависимости от сложности
/// - Агрегация баллов от подшкал к категориям

// ============================================================================
// HIERARCHICAL SCALE SYSTEM
// ============================================================================

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

/// Represents a hierarchical psychological scale (can be standalone or part of category)
/// Supports parent-child relationships for multi-level hierarchies
class HierarchicalScale {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final String? categoryId;  // Parent category
  final String? parentScaleId;  // Parent scale (for nested hierarchies)
  final Color? color;  // Inherits from category if null
  final IconData? icon;  // Inherits from category if null
  final Map<String, String>? instrumentalCase;
  final Map<String, String>? genitiveCase;

  const HierarchicalScale({
    required this.id,
    required this.name,
    required this.description,
    this.categoryId,
    this.parentScaleId,
    this.color,
    this.icon,
    this.instrumentalCase,
    this.genitiveCase,
  });

  String getName(String languageCode) => name[languageCode] ?? name['en'] ?? '';
  String getDescription(String languageCode) => description[languageCode] ?? description['en'] ?? '';
  String getInstrumentalCase(String languageCode) =>
      instrumentalCase?[languageCode] ?? name[languageCode]?.toLowerCase() ?? name['en']?.toLowerCase() ?? '';
  String getGenitiveCase(String languageCode) =>
      genitiveCase?[languageCode] ?? name[languageCode]?.toLowerCase() ?? name['en']?.toLowerCase() ?? '';

  bool get isTopLevel => categoryId == null && parentScaleId == null;
  bool get hasParent => categoryId != null || parentScaleId != null;
}

class SummaryConfig {
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
      name: {'ru': 'Экстраверсия и социальность', 'en': 'Extraversion & Sociability'},
      description: {'ru': 'Социальная энергия и взаимодействие', 'en': 'Social energy and interaction'},
      color: Colors.orange,
      icon: Icons.people,
      subscaleIds: [
        'warmth', 'gregariousness', 'assertiveness', 'activity', 'excitement_seeking',
        'positive_emotions', 'social_boldness', 'liveliness', 'dominance',
        'social_confidence', 'expressiveness',
      ],
    ),

    'cat_agreeableness': ScaleCategory(
      id: 'cat_agreeableness',
      name: {'ru': 'Доброжелательность', 'en': 'Agreeableness'},
      description: {'ru': 'Сотрудничество и эмпатия', 'en': 'Cooperation and empathy'},
      color: Colors.pink,
      icon: Icons.favorite,
      subscaleIds: [
        'trust', 'straightforwardness', 'altruism', 'compliance', 'modesty',
        'tender_mindedness', 'empathy', 'compassion', 'politeness',
        'cooperativeness', 'forgiveness',
      ],
    ),

    'cat_conscientiousness': ScaleCategory(
      id: 'cat_conscientiousness',
      name: {'ru': 'Добросовестность', 'en': 'Conscientiousness'},
      description: {'ru': 'Организованность и самоконтроль', 'en': 'Organization and self-control'},
      color: Colors.green,
      icon: Icons.self_improvement,
      subscaleIds: [
        'competence', 'order', 'dutifulness', 'achievement_striving', 'self_discipline',
        'deliberation', 'organization', 'diligence', 'perfectionism',
        'prudence', 'responsibility', 'punctuality',
      ],
    ),

    'cat_openness': ScaleCategory(
      id: 'cat_openness',
      name: {'ru': 'Открытость опыту', 'en': 'Openness to Experience'},
      description: {'ru': 'Креативность и гибкость мышления', 'en': 'Creativity and flexible thinking'},
      color: Colors.teal,
      icon: Icons.lightbulb,
      subscaleIds: [
        'fantasy', 'aesthetics', 'feelings', 'actions', 'ideas', 'values',
        'creativity', 'curiosity', 'artistic_appreciation', 'intellectual_curiosity',
      ],
    ),

    // === RELATIONSHIPS ===
    'cat_relationships': ScaleCategory(
      id: 'cat_relationships',
      name: {'ru': 'Качество отношений', 'en': 'Relationship Quality'},
      description: {'ru': 'Характеристики близких отношений', 'en': 'Characteristics of close relationships'},
      color: Color(0xFFE91E63),
      icon: Icons.favorite_border,
      subscaleIds: [
        'relationship_security', 'emotional_intimacy', 'passion_vitality', 'reliability_partnership',
        'secure_attachment', 'anxious_attachment', 'avoidant_attachment', 'trust_in_relationships',
        'jealousy', 'fear_of_abandonment', 'intimacy_comfort', 'emotional_openness',
        'vulnerability_sharing', 'communication_quality', 'conflict_resolution', 'affection_expression',
        'physical_intimacy', 'playfulness', 'spontaneity', 'commitment',
        'shared_goals', 'loyalty', 'dependability', 'support_giving',
      ],
    ),

    // === COGNITIVE & PRODUCTIVITY ===
    'cat_cognitive': ScaleCategory(
      id: 'cat_cognitive',
      name: {'ru': 'Когнитивные способности', 'en': 'Cognitive Abilities'},
      description: {'ru': 'Интеллектуальные и когнитивные функции', 'en': 'Intellectual and cognitive functions'},
      color: Colors.deepPurple,
      icon: Icons.psychology,
      subscaleIds: [
        'analytical_thinking', 'abstract_reasoning', 'verbal_intelligence', 'numerical_ability',
        'spatial_reasoning', 'processing_speed', 'working_memory', 'attention_control',
        'cognitive_flexibility', 'problem_solving', 'critical_thinking', 'learning_ability',
      ],
    ),

    // === MOTIVATION ===
    'cat_motivation': ScaleCategory(
      id: 'cat_motivation',
      name: {'ru': 'Мотивация и драйв', 'en': 'Motivation & Drive'},
      description: {'ru': 'Внутренняя энергия и целеустремлённость', 'en': 'Inner energy and goal orientation'},
      color: Colors.red,
      icon: Icons.flash_on,
      subscaleIds: [
        'intrinsic_motivation', 'extrinsic_motivation', 'achievement_motivation', 'power_motivation',
        'affiliation_motivation', 'autonomy_need', 'competence_need', 'relatedness_need',
        'persistence', 'ambition', 'drive_for_excellence',
      ],
    ),

    // === SOCIAL SKILLS ===
    'cat_social_skills': ScaleCategory(
      id: 'cat_social_skills',
      name: {'ru': 'Социальные навыки', 'en': 'Social Skills'},
      description: {'ru': 'Межличностные и коммуникационные умения', 'en': 'Interpersonal and communication abilities'},
      color: Colors.amber,
      icon: Icons.connect_without_contact,
      subscaleIds: [
        'social_perception', 'emotional_intelligence', 'conflict_management', 'negotiation',
        'persuasion', 'active_listening', 'verbal_communication', 'nonverbal_communication',
        'humor', 'charisma', 'networking', 'boundary_setting',
      ],
    ),

    // === DARK TRIAD ===
    'cat_dark_triad': ScaleCategory(
      id: 'cat_dark_triad',
      name: {'ru': 'Темная триада', 'en': 'Dark Triad'},
      description: {'ru': 'Макиавеллизм, нарциссизм, психопатия', 'en': 'Machiavellianism, narcissism, psychopathy'},
      color: Colors.grey,
      icon: Icons.warning,
      subscaleIds: [
        'machiavellianism', 'narcissism', 'psychopathy', 'manipulation',
        'entitlement', 'grandiosity', 'callousness', 'impulsivity_dark',
      ],
    ),

    // === LEADERSHIP ===
    'cat_leadership': ScaleCategory(
      id: 'cat_leadership',
      name: {'ru': 'Лидерство', 'en': 'Leadership'},
      description: {'ru': 'Лидерские качества и управленческие навыки', 'en': 'Leadership qualities and management skills'},
      color: Colors.indigo,
      icon: Icons.groups,
      subscaleIds: [
        'strategic_thinking', 'vision', 'decisiveness', 'delegation',
        'mentoring', 'team_building', 'inspirational_motivation', 'confidence_building',
        'accountability', 'adaptability_leadership',
      ],
    ),

    // === VALUES ===
    'cat_values': ScaleCategory(
      id: 'cat_values',
      name: {'ru': 'Ценности', 'en': 'Values'},
      description: {'ru': 'Жизненные ценности и приоритеты', 'en': 'Life values and priorities'},
      color: Colors.brown,
      icon: Icons.auto_awesome,
      subscaleIds: [
        'achievement_value', 'power_value', 'hedonism', 'stimulation',
        'self_direction', 'universalism', 'benevolence', 'tradition',
        'conformity', 'security_value',
      ],
    ),

    // === WELL-BEING ===
    'cat_wellbeing': ScaleCategory(
      id: 'cat_wellbeing',
      name: {'ru': 'Благополучие', 'en': 'Well-being'},
      description: {'ru': 'Психологическое и эмоциональное благополучие', 'en': 'Psychological and emotional well-being'},
      color: Colors.lightGreen,
      icon: Icons.spa,
      subscaleIds: [
        'life_satisfaction', 'happiness', 'meaning_purpose', 'self_acceptance',
        'personal_growth', 'autonomy_wellbeing', 'environmental_mastery', 'positive_relations',
        'vitality',
      ],
    ),

    // === SELF-IDENTITY ===
    'cat_identity': ScaleCategory(
      id: 'cat_identity',
      name: {'ru': 'Самоидентичность', 'en': 'Self-Identity'},
      description: {'ru': 'Самовосприятие и идентичность', 'en': 'Self-perception and identity'},
      color: Colors.cyan,
      icon: Icons.person,
      subscaleIds: [
        'self_esteem', 'self_efficacy', 'self_monitoring', 'self_awareness',
        'self_compassion', 'authenticity', 'identity_clarity', 'identity_flexibility',
        'body_image', 'gender_identity_comfort',
      ],
    ),

    // === STRESS & COPING ===
    'cat_stress_coping': ScaleCategory(
      id: 'cat_stress_coping',
      name: {'ru': 'Стресс и копинг', 'en': 'Stress & Coping'},
      description: {'ru': 'Реакция на стресс и стратегии преодоления', 'en': 'Stress response and coping strategies'},
      color: Colors.blueGrey,
      icon: Icons.healing,
      subscaleIds: [
        'problem_focused_coping', 'emotion_focused_coping', 'avoidant_coping', 'social_support_seeking',
        'mindfulness_coping', 'rumination', 'catastrophizing', 'cognitive_reappraisal',
        'acceptance',
      ],
    ),

    // === CREATIVITY (Expanded) ===
    'cat_creativity': ScaleCategory(
      id: 'cat_creativity',
      name: {'ru': 'Креативность', 'en': 'Creativity'},
      description: {'ru': 'Творческое мышление и инновации', 'en': 'Creative thinking and innovation'},
      color: Colors.purple,
      icon: Icons.brush,
      subscaleIds: [
        'divergent_thinking', 'convergent_thinking', 'originality', 'fluency',
        'elaboration', 'flexibility_creative', 'risk_taking_creative',
      ],
    ),

    // === BEHAVIORAL STYLES ===
    'cat_behavioral_styles': ScaleCategory(
      id: 'cat_behavioral_styles',
      name: {'ru': 'Поведенческие стили', 'en': 'Behavioral Styles'},
      description: {'ru': 'Характерные паттерны поведения', 'en': 'Characteristic behavior patterns'},
      color: Colors.lime,
      icon: Icons.timeline,
      subscaleIds: [
        'type_a_behavior', 'risk_taking', 'sensation_seeking', 'novelty_seeking',
        'harm_avoidance', 'reward_dependence', 'procrastination', 'decisiveness_behavior',
        'impulsivity_behavior', 'patience',
      ],
    ),

    // === META-INDICATORS ===
    'cat_meta_indicators': ScaleCategory(
      id: 'cat_meta_indicators',
      name: {'ru': 'Мета-индикаторы', 'en': 'Meta-Indicators'},
      description: {'ru': 'Интегративные показатели личности', 'en': 'Integrative personality indicators'},
      color: Colors.deepOrange,
      icon: Icons.insights,
      subscaleIds: [
        'overall_adjustment', 'maturity', 'resilience_meta', 'growth_mindset',
        'wisdom',
      ],
    ),
  };

  // ============================================================================
  // HIERARCHICAL SCALES (~200 scales organized by category)
  // ============================================================================

  static const Map<String, HierarchicalScale> hierarchicalScales = {
    // === EMOTIONAL STABILITY SUBSCALES (15) ===
    'anxiety': HierarchicalScale(
      id: 'anxiety',
      name: {'ru': 'Тревожность', 'en': 'Anxiety'},
      description: {'ru': 'Склонность к беспокойству и тревоге', 'en': 'Tendency toward worry and anxiety'},
      categoryId: 'cat_emotional_stability',
    ),
    'anger': HierarchicalScale(
      id: 'anger',
      name: {'ru': 'Гневливость', 'en': 'Anger'},
      description: {'ru': 'Склонность к раздражению и гневу', 'en': 'Tendency toward irritation and anger'},
      categoryId: 'cat_emotional_stability',
    ),
    'depression': HierarchicalScale(
      id: 'depression',
      name: {'ru': 'Депрессивность', 'en': 'Depression'},
      description: {'ru': 'Склонность к грусти и подавленности', 'en': 'Tendency toward sadness and low mood'},
      categoryId: 'cat_emotional_stability',
    ),
    'self_consciousness': HierarchicalScale(
      id: 'self_consciousness',
      name: {'ru': 'Застенчивость', 'en': 'Self-Consciousness'},
      description: {'ru': 'Чувствительность к социальной оценке', 'en': 'Sensitivity to social evaluation'},
      categoryId: 'cat_emotional_stability',
    ),
    'impulsiveness': HierarchicalScale(
      id: 'impulsiveness',
      name: {'ru': 'Импульсивность', 'en': 'Impulsiveness'},
      description: {'ru': 'Склонность действовать без обдумывания', 'en': 'Tendency to act without thinking'},
      categoryId: 'cat_emotional_stability',
    ),
    'vulnerability': HierarchicalScale(
      id: 'vulnerability',
      name: {'ru': 'Уязвимость', 'en': 'Vulnerability'},
      description: {'ru': 'Неустойчивость под давлением стресса', 'en': 'Instability under stress'},
      categoryId: 'cat_emotional_stability',
    ),
    'stress_tolerance': HierarchicalScale(
      id: 'stress_tolerance',
      name: {'ru': 'Стрессоустойчивость', 'en': 'Stress Tolerance'},
      description: {'ru': 'Способность справляться со стрессом', 'en': 'Ability to cope with stress'},
      categoryId: 'cat_emotional_stability',
    ),
    'emotional_resilience': HierarchicalScale(
      id: 'emotional_resilience',
      name: {'ru': 'Эмоциональная устойчивость', 'en': 'Emotional Resilience'},
      description: {'ru': 'Быстрое восстановление после трудностей', 'en': 'Quick recovery after difficulties'},
      categoryId: 'cat_emotional_stability',
    ),
    'mood_stability': HierarchicalScale(
      id: 'mood_stability',
      name: {'ru': 'Стабильность настроения', 'en': 'Mood Stability'},
      description: {'ru': 'Постоянство эмоционального состояния', 'en': 'Consistency of emotional state'},
      categoryId: 'cat_emotional_stability',
    ),
    'frustration_tolerance': HierarchicalScale(
      id: 'frustration_tolerance',
      name: {'ru': 'Толерантность к фрустрации', 'en': 'Frustration Tolerance'},
      description: {'ru': 'Устойчивость к разочарованиям', 'en': 'Resilience to disappointments'},
      categoryId: 'cat_emotional_stability',
    ),
    'worry_tendency': HierarchicalScale(
      id: 'worry_tendency',
      name: {'ru': 'Склонность к беспокойству', 'en': 'Worry Tendency'},
      description: {'ru': 'Частота навязчивых тревожных мыслей', 'en': 'Frequency of intrusive anxious thoughts'},
      categoryId: 'cat_emotional_stability',
    ),
    'panic_tendency': HierarchicalScale(
      id: 'panic_tendency',
      name: {'ru': 'Склонность к панике', 'en': 'Panic Tendency'},
      description: {'ru': 'Предрасположенность к паническим реакциям', 'en': 'Predisposition to panic reactions'},
      categoryId: 'cat_emotional_stability',
    ),
    'emotional_reactivity': HierarchicalScale(
      id: 'emotional_reactivity',
      name: {'ru': 'Эмоциональная реактивность', 'en': 'Emotional Reactivity'},
      description: {'ru': 'Интенсивность эмоциональных реакций', 'en': 'Intensity of emotional reactions'},
      categoryId: 'cat_emotional_stability',
    ),
    'calmness': HierarchicalScale(
      id: 'calmness',
      name: {'ru': 'Спокойствие', 'en': 'Calmness'},
      description: {'ru': 'Базовое состояние умиротворённости', 'en': 'Baseline state of tranquility'},
      categoryId: 'cat_emotional_stability',
    ),
    'composure': HierarchicalScale(
      id: 'composure',
      name: {'ru': 'Самообладание', 'en': 'Composure'},
      description: {'ru': 'Контроль над эмоциями в стрессовых ситуациях', 'en': 'Emotional control in stressful situations'},
      categoryId: 'cat_emotional_stability',
    ),

    // Continue with remaining ~185 scales...
    // (I'll add a representative sample from each category to demonstrate the structure)

    // === EXTRAVERSION SUBSCALES (11) ===
    'warmth': HierarchicalScale(
      id: 'warmth',
      name: {'ru': 'Теплота', 'en': 'Warmth'},
      description: {'ru': 'Дружелюбие и сердечность в общении', 'en': 'Friendliness and warmth in communication'},
      categoryId: 'cat_extraversion',
    ),
    'gregariousness': HierarchicalScale(
      id: 'gregariousness',
      name: {'ru': 'Общительность', 'en': 'Gregariousness'},
      description: {'ru': 'Предпочтение компании других людей', 'en': 'Preference for company of others'},
      categoryId: 'cat_extraversion',
    ),
    'assertiveness': HierarchicalScale(
      id: 'assertiveness',
      name: {'ru': 'Ассертивность', 'en': 'Assertiveness'},
      description: {'ru': 'Уверенное отстаивание своих интересов', 'en': 'Confident advocacy of own interests'},
      categoryId: 'cat_extraversion',
    ),
    'activity': HierarchicalScale(
      id: 'activity',
      name: {'ru': 'Активность', 'en': 'Activity'},
      description: {'ru': 'Уровень энергии и темп жизни', 'en': 'Energy level and pace of life'},
      categoryId: 'cat_extraversion',
    ),
    'excitement_seeking': HierarchicalScale(
      id: 'excitement_seeking',
      name: {'ru': 'Поиск впечатлений', 'en': 'Excitement Seeking'},
      description: {'ru': 'Стремление к стимуляции и приключениям', 'en': 'Drive for stimulation and adventure'},
      categoryId: 'cat_extraversion',
    ),
    'positive_emotions': HierarchicalScale(
      id: 'positive_emotions',
      name: {'ru': 'Позитивные эмоции', 'en': 'Positive Emotions'},
      description: {'ru': 'Склонность к радости и энтузиазму', 'en': 'Tendency toward joy and enthusiasm'},
      categoryId: 'cat_extraversion',
    ),
    'social_boldness': HierarchicalScale(
      id: 'social_boldness',
      name: {'ru': 'Социальная смелость', 'en': 'Social Boldness'},
      description: {'ru': 'Отсутствие страха перед социальными ситуациями', 'en': 'Lack of fear in social situations'},
      categoryId: 'cat_extraversion',
    ),
    'liveliness': HierarchicalScale(
      id: 'liveliness',
      name: {'ru': 'Живость', 'en': 'Liveliness'},
      description: {'ru': 'Энергичность и оживлённость', 'en': 'Energetic and animated nature'},
      categoryId: 'cat_extraversion',
    ),
    'dominance': HierarchicalScale(
      id: 'dominance',
      name: {'ru': 'Доминантность', 'en': 'Dominance'},
      description: {'ru': 'Стремление к лидерству и контролю', 'en': 'Drive for leadership and control'},
      categoryId: 'cat_extraversion',
    ),
    'social_confidence': HierarchicalScale(
      id: 'social_confidence',
      name: {'ru': 'Социальная уверенность', 'en': 'Social Confidence'},
      description: {'ru': 'Уверенность в социальных взаимодействиях', 'en': 'Confidence in social interactions'},
      categoryId: 'cat_extraversion',
    ),
    'expressiveness': HierarchicalScale(
      id: 'expressiveness',
      name: {'ru': 'Выразительность', 'en': 'Expressiveness'},
      description: {'ru': 'Открытое выражение эмоций и мыслей', 'en': 'Open expression of emotions and thoughts'},
      categoryId: 'cat_extraversion',
    ),

    // === AGREEABLENESS SUBSCALES (11) ===
    'trust': HierarchicalScale(
      id: 'trust',
      name: {'ru': 'Доверие к людям', 'en': 'Trust'},
      description: {'ru': 'Вера в честность и добрые намерения других', 'en': 'Belief in honesty and good intentions of others'},
      categoryId: 'cat_agreeableness',
    ),
    'straightforwardness': HierarchicalScale(
      id: 'straightforwardness',
      name: {'ru': 'Прямота', 'en': 'Straightforwardness'},
      description: {'ru': 'Честность и откровенность в общении', 'en': 'Honesty and frankness in communication'},
      categoryId: 'cat_agreeableness',
    ),
    'altruism': HierarchicalScale(
      id: 'altruism',
      name: {'ru': 'Альтруизм', 'en': 'Altruism'},
      description: {'ru': 'Готовность помогать другим бескорыстно', 'en': 'Willingness to help others selflessly'},
      categoryId: 'cat_agreeableness',
    ),
    'compliance': HierarchicalScale(
      id: 'compliance',
      name: {'ru': 'Уступчивость', 'en': 'Compliance'},
      description: {'ru': 'Избегание конфликтов, готовность к компромиссу', 'en': 'Conflict avoidance, willingness to compromise'},
      categoryId: 'cat_agreeableness',
    ),
    'modesty': HierarchicalScale(
      id: 'modesty',
      name: {'ru': 'Скромность', 'en': 'Modesty'},
      description: {'ru': 'Отсутствие тщеславия и самовозвеличивания', 'en': 'Absence of vanity and self-aggrandizement'},
      categoryId: 'cat_agreeableness',
    ),
    'tender_mindedness': HierarchicalScale(
      id: 'tender_mindedness',
      name: {'ru': 'Мягкосердечность', 'en': 'Tender-Mindedness'},
      description: {'ru': 'Чувствительность к страданиям других', 'en': 'Sensitivity to suffering of others'},
      categoryId: 'cat_agreeableness',
    ),
    'empathy': HierarchicalScale(
      id: 'empathy',
      name: {'ru': 'Эмпатия', 'en': 'Empathy'},
      description: {'ru': 'Способность понимать и разделять чувства других', 'en': 'Ability to understand and share feelings of others'},
      categoryId: 'cat_agreeableness',
    ),
    'compassion': HierarchicalScale(
      id: 'compassion',
      name: {'ru': 'Сострадание', 'en': 'Compassion'},
      description: {'ru': 'Глубокая забота о благополучии других', 'en': 'Deep concern for well-being of others'},
      categoryId: 'cat_agreeableness',
    ),
    'politeness': HierarchicalScale(
      id: 'politeness',
      name: {'ru': 'Вежливость', 'en': 'Politeness'},
      description: {'ru': 'Уважительное и тактичное поведение', 'en': 'Respectful and tactful behavior'},
      categoryId: 'cat_agreeableness',
    ),
    'cooperativeness': HierarchicalScale(
      id: 'cooperativeness',
      name: {'ru': 'Кооперативность', 'en': 'Cooperativeness'},
      description: {'ru': 'Способность работать вместе с другими', 'en': 'Ability to work together with others'},
      categoryId: 'cat_agreeableness',
    ),
    'forgiveness': HierarchicalScale(
      id: 'forgiveness',
      name: {'ru': 'Способность прощать', 'en': 'Forgiveness'},
      description: {'ru': 'Готовность отпускать обиды и прощать', 'en': 'Willingness to let go of grudges and forgive'},
      categoryId: 'cat_agreeableness',
    ),

    // === CONSCIENTIOUSNESS SUBSCALES (12) ===
    'competence': HierarchicalScale(
      id: 'competence',
      name: {'ru': 'Компетентность', 'en': 'Competence'},
      description: {'ru': 'Уверенность в своих способностях', 'en': 'Confidence in own abilities'},
      categoryId: 'cat_conscientiousness',
    ),
    'order': HierarchicalScale(
      id: 'order',
      name: {'ru': 'Порядок', 'en': 'Order'},
      description: {'ru': 'Предпочтение организованности и структуры', 'en': 'Preference for organization and structure'},
      categoryId: 'cat_conscientiousness',
    ),
    'dutifulness': HierarchicalScale(
      id: 'dutifulness',
      name: {'ru': 'Чувство долга', 'en': 'Dutifulness'},
      description: {'ru': 'Следование обязательствам и правилам', 'en': 'Adherence to obligations and rules'},
      categoryId: 'cat_conscientiousness',
    ),
    'achievement_striving': HierarchicalScale(
      id: 'achievement_striving',
      name: {'ru': 'Стремление к достижениям', 'en': 'Achievement Striving'},
      description: {'ru': 'Постановка высоких целей и работа над их достижением', 'en': 'Setting high goals and working toward achievement'},
      categoryId: 'cat_conscientiousness',
    ),
    'self_discipline': HierarchicalScale(
      id: 'self_discipline',
      name: {'ru': 'Самодисциплина', 'en': 'Self-Discipline'},
      description: {'ru': 'Способность начинать и завершать задачи', 'en': 'Ability to begin and complete tasks'},
      categoryId: 'cat_conscientiousness',
    ),
    'deliberation': HierarchicalScale(
      id: 'deliberation',
      name: {'ru': 'Рассудительность', 'en': 'Deliberation'},
      description: {'ru': 'Обдумывание перед действием', 'en': 'Thinking before acting'},
      categoryId: 'cat_conscientiousness',
    ),
    'organization': HierarchicalScale(
      id: 'organization',
      name: {'ru': 'Организованность', 'en': 'Organization'},
      description: {'ru': 'Систематичность в работе и жизни', 'en': 'Systematic approach to work and life'},
      categoryId: 'cat_conscientiousness',
    ),
    'diligence': HierarchicalScale(
      id: 'diligence',
      name: {'ru': 'Трудолюбие', 'en': 'Diligence'},
      description: {'ru': 'Усердие и старательность в работе', 'en': 'Hard work and thoroughness'},
      categoryId: 'cat_conscientiousness',
    ),
    'perfectionism': HierarchicalScale(
      id: 'perfectionism',
      name: {'ru': 'Перфекционизм', 'en': 'Perfectionism'},
      description: {'ru': 'Стремление к безупречности', 'en': 'Striving for flawlessness'},
      categoryId: 'cat_conscientiousness',
    ),
    'prudence': HierarchicalScale(
      id: 'prudence',
      name: {'ru': 'Осмотрительность', 'en': 'Prudence'},
      description: {'ru': 'Осторожность и предусмотрительность', 'en': 'Cautiousness and foresight'},
      categoryId: 'cat_conscientiousness',
    ),
    'responsibility': HierarchicalScale(
      id: 'responsibility',
      name: {'ru': 'Ответственность', 'en': 'Responsibility'},
      description: {'ru': 'Принятие на себя обязательств', 'en': 'Taking on obligations'},
      categoryId: 'cat_conscientiousness',
    ),
    'punctuality': HierarchicalScale(
      id: 'punctuality',
      name: {'ru': 'Пунктуальность', 'en': 'Punctuality'},
      description: {'ru': 'Своевременность и точность', 'en': 'Timeliness and precision'},
      categoryId: 'cat_conscientiousness',
    ),

    // === OPENNESS SUBSCALES (10) ===
    'fantasy': HierarchicalScale(
      id: 'fantasy',
      name: {'ru': 'Фантазия', 'en': 'Fantasy'},
      description: {'ru': 'Богатое воображение и внутренний мир', 'en': 'Rich imagination and inner world'},
      categoryId: 'cat_openness',
    ),
    'aesthetics': HierarchicalScale(
      id: 'aesthetics',
      name: {'ru': 'Эстетическое восприятие', 'en': 'Aesthetics'},
      description: {'ru': 'Восприимчивость к красоте и искусству', 'en': 'Receptivity to beauty and art'},
      categoryId: 'cat_openness',
    ),
    'feelings': HierarchicalScale(
      id: 'feelings',
      name: {'ru': 'Глубина чувств', 'en': 'Feelings'},
      description: {'ru': 'Доступ к широкому спектру эмоций', 'en': 'Access to wide range of emotions'},
      categoryId: 'cat_openness',
    ),
    'actions': HierarchicalScale(
      id: 'actions',
      name: {'ru': 'Готовность к новым действиям', 'en': 'Actions'},
      description: {'ru': 'Желание пробовать новые виды активности', 'en': 'Willingness to try new activities'},
      categoryId: 'cat_openness',
    ),
    'ideas': HierarchicalScale(
      id: 'ideas',
      name: {'ru': 'Интеллектуальная любознательность', 'en': 'Ideas'},
      description: {'ru': 'Интерес к абстрактным идеям', 'en': 'Interest in abstract ideas'},
      categoryId: 'cat_openness',
    ),
    'values': HierarchicalScale(
      id: 'values',
      name: {'ru': 'Готовность пересматривать ценности', 'en': 'Values'},
      description: {'ru': 'Открытость к пересмотру социальных и политических ценностей', 'en': 'Openness to reconsidering social and political values'},
      categoryId: 'cat_openness',
    ),
    'curiosity': HierarchicalScale(
      id: 'curiosity',
      name: {'ru': 'Любопытство', 'en': 'Curiosity'},
      description: {'ru': 'Желание узнавать новое', 'en': 'Desire to learn new things'},
      categoryId: 'cat_openness',
    ),
    'artistic_appreciation': HierarchicalScale(
      id: 'artistic_appreciation',
      name: {'ru': 'Художественное восприятие', 'en': 'Artistic Appreciation'},
      description: {'ru': 'Способность ценить искусство', 'en': 'Ability to appreciate art'},
      categoryId: 'cat_openness',
    ),
    'intellectual_curiosity': HierarchicalScale(
      id: 'intellectual_curiosity',
      name: {'ru': 'Интеллектуальное любопытство', 'en': 'Intellectual Curiosity'},
      description: {'ru': 'Интерес к интеллектуальным вызовам', 'en': 'Interest in intellectual challenges'},
      categoryId: 'cat_openness',
    ),

    // === RELATIONSHIP SUBSCALES (24) ===
    'relationship_security': HierarchicalScale(
      id: 'relationship_security',
      name: {'ru': 'Безопасность в отношениях', 'en': 'Relationship Security'},
      description: {'ru': 'Ощущение стабильности и защищённости', 'en': 'Feeling of stability and safety'},
      categoryId: 'cat_relationships',
    ),
    'emotional_intimacy': HierarchicalScale(
      id: 'emotional_intimacy',
      name: {'ru': 'Эмоциональная близость', 'en': 'Emotional Intimacy'},
      description: {'ru': 'Глубокая эмоциональная связь', 'en': 'Deep emotional connection'},
      categoryId: 'cat_relationships',
    ),
    'passion_vitality': HierarchicalScale(
      id: 'passion_vitality',
      name: {'ru': 'Страсть и витальность', 'en': 'Passion & Vitality'},
      description: {'ru': 'Энергия и страсть в отношениях', 'en': 'Energy and passion in relationships'},
      categoryId: 'cat_relationships',
    ),
    'reliability_partnership': HierarchicalScale(
      id: 'reliability_partnership',
      name: {'ru': 'Надёжность и партнёрство', 'en': 'Reliability & Partnership'},
      description: {'ru': 'Надёжность и совместное партнёрство', 'en': 'Reliability and collaborative partnership'},
      categoryId: 'cat_relationships',
    ),
    'secure_attachment': HierarchicalScale(
      id: 'secure_attachment',
      name: {'ru': 'Надёжная привязанность', 'en': 'Secure Attachment'},
      description: {'ru': 'Комфорт с близостью и независимостью', 'en': 'Comfort with intimacy and independence'},
      categoryId: 'cat_relationships',
    ),
    'anxious_attachment': HierarchicalScale(
      id: 'anxious_attachment',
      name: {'ru': 'Тревожная привязанность', 'en': 'Anxious Attachment'},
      description: {'ru': 'Страх отвержения, потребность в подтверждении', 'en': 'Fear of rejection, need for reassurance'},
      categoryId: 'cat_relationships',
    ),
    'avoidant_attachment': HierarchicalScale(
      id: 'avoidant_attachment',
      name: {'ru': 'Избегающая привязанность', 'en': 'Avoidant Attachment'},
      description: {'ru': 'Дискомфорт с близостью, ценность независимости', 'en': 'Discomfort with closeness, valuing independence'},
      categoryId: 'cat_relationships',
    ),
    'trust_in_relationships': HierarchicalScale(
      id: 'trust_in_relationships',
      name: {'ru': 'Доверие в отношениях', 'en': 'Trust in Relationships'},
      description: {'ru': 'Вера в партнёра', 'en': 'Faith in partner'},
      categoryId: 'cat_relationships',
    ),
    'jealousy': HierarchicalScale(
      id: 'jealousy',
      name: {'ru': 'Ревность', 'en': 'Jealousy'},
      description: {'ru': 'Склонность к ревности', 'en': 'Tendency toward jealousy'},
      categoryId: 'cat_relationships',
    ),
    'fear_of_abandonment': HierarchicalScale(
      id: 'fear_of_abandonment',
      name: {'ru': 'Страх покинутости', 'en': 'Fear of Abandonment'},
      description: {'ru': 'Тревога быть оставленным', 'en': 'Anxiety about being left'},
      categoryId: 'cat_relationships',
    ),
    'intimacy_comfort': HierarchicalScale(
      id: 'intimacy_comfort',
      name: {'ru': 'Комфорт с близостью', 'en': 'Intimacy Comfort'},
      description: {'ru': 'Лёгкость в глубоких отношениях', 'en': 'Ease in deep relationships'},
      categoryId: 'cat_relationships',
    ),
    'emotional_openness': HierarchicalScale(
      id: 'emotional_openness',
      name: {'ru': 'Эмоциональная открытость', 'en': 'Emotional Openness'},
      description: {'ru': 'Готовность делиться чувствами', 'en': 'Willingness to share feelings'},
      categoryId: 'cat_relationships',
    ),
    'vulnerability_sharing': HierarchicalScale(
      id: 'vulnerability_sharing',
      name: {'ru': 'Готовность к уязвимости', 'en': 'Vulnerability Sharing'},
      description: {'ru': 'Способность показать уязвимость', 'en': 'Ability to show vulnerability'},
      categoryId: 'cat_relationships',
    ),
    'communication_quality': HierarchicalScale(
      id: 'communication_quality',
      name: {'ru': 'Качество коммуникации', 'en': 'Communication Quality'},
      description: {'ru': 'Эффективность общения с партнёром', 'en': 'Effectiveness of communication with partner'},
      categoryId: 'cat_relationships',
    ),
    'conflict_resolution': HierarchicalScale(
      id: 'conflict_resolution',
      name: {'ru': 'Разрешение конфликтов', 'en': 'Conflict Resolution'},
      description: {'ru': 'Способность конструктивно решать разногласия', 'en': 'Ability to constructively resolve disagreements'},
      categoryId: 'cat_relationships',
    ),
    'affection_expression': HierarchicalScale(
      id: 'affection_expression',
      name: {'ru': 'Выражение привязанности', 'en': 'Affection Expression'},
      description: {'ru': 'Способность показывать любовь и заботу', 'en': 'Ability to show love and care'},
      categoryId: 'cat_relationships',
    ),
    'physical_intimacy': HierarchicalScale(
      id: 'physical_intimacy',
      name: {'ru': 'Физическая близость', 'en': 'Physical Intimacy'},
      description: {'ru': 'Комфорт с физической близостью', 'en': 'Comfort with physical closeness'},
      categoryId: 'cat_relationships',
    ),
    'playfulness': HierarchicalScale(
      id: 'playfulness',
      name: {'ru': 'Игривость', 'en': 'Playfulness'},
      description: {'ru': 'Способность к игре и веселью в отношениях', 'en': 'Ability to play and have fun in relationships'},
      categoryId: 'cat_relationships',
    ),
    'spontaneity': HierarchicalScale(
      id: 'spontaneity',
      name: {'ru': 'Спонтанность', 'en': 'Spontaneity'},
      description: {'ru': 'Непосредственность и импульсивность в отношениях', 'en': 'Spontaneity and impulsiveness in relationships'},
      categoryId: 'cat_relationships',
    ),
    'commitment': HierarchicalScale(
      id: 'commitment',
      name: {'ru': 'Готовность к обязательствам', 'en': 'Commitment'},
      description: {'ru': 'Готовность к долгосрочным обязательствам', 'en': 'Readiness for long-term commitment'},
      categoryId: 'cat_relationships',
    ),
    'shared_goals': HierarchicalScale(
      id: 'shared_goals',
      name: {'ru': 'Общие цели', 'en': 'Shared Goals'},
      description: {'ru': 'Совместное планирование будущего', 'en': 'Joint planning of future'},
      categoryId: 'cat_relationships',
    ),
    'loyalty': HierarchicalScale(
      id: 'loyalty',
      name: {'ru': 'Лояльность', 'en': 'Loyalty'},
      description: {'ru': 'Верность партнёру', 'en': 'Faithfulness to partner'},
      categoryId: 'cat_relationships',
    ),
    'dependability': HierarchicalScale(
      id: 'dependability',
      name: {'ru': 'Надёжность', 'en': 'Dependability'},
      description: {'ru': 'Возможность положиться на партнёра', 'en': 'Ability to rely on partner'},
      categoryId: 'cat_relationships',
    ),
    'support_giving': HierarchicalScale(
      id: 'support_giving',
      name: {'ru': 'Оказание поддержки', 'en': 'Support Giving'},
      description: {'ru': 'Способность поддерживать партнёра', 'en': 'Ability to support partner'},
      categoryId: 'cat_relationships',
    ),

    // === COGNITIVE SUBSCALES (12) ===
    'analytical_thinking': HierarchicalScale(
      id: 'analytical_thinking',
      name: {'ru': 'Аналитическое мышление', 'en': 'Analytical Thinking'},
      description: {'ru': 'Способность разбирать проблемы логически', 'en': 'Ability to break down problems logically'},
      categoryId: 'cat_cognitive',
    ),
    'abstract_reasoning': HierarchicalScale(
      id: 'abstract_reasoning',
      name: {'ru': 'Абстрактное мышление', 'en': 'Abstract Reasoning'},
      description: {'ru': 'Работа с абстрактными концепциями', 'en': 'Working with abstract concepts'},
      categoryId: 'cat_cognitive',
    ),
    'verbal_intelligence': HierarchicalScale(
      id: 'verbal_intelligence',
      name: {'ru': 'Вербальный интеллект', 'en': 'Verbal Intelligence'},
      description: {'ru': 'Языковые способности и словарный запас', 'en': 'Language abilities and vocabulary'},
      categoryId: 'cat_cognitive',
    ),
    'numerical_ability': HierarchicalScale(
      id: 'numerical_ability',
      name: {'ru': 'Числовые способности', 'en': 'Numerical Ability'},
      description: {'ru': 'Работа с числами и математикой', 'en': 'Working with numbers and mathematics'},
      categoryId: 'cat_cognitive',
    ),
    'spatial_reasoning': HierarchicalScale(
      id: 'spatial_reasoning',
      name: {'ru': 'Пространственное мышление', 'en': 'Spatial Reasoning'},
      description: {'ru': 'Визуализация и манипуляция объектами в пространстве', 'en': 'Visualizing and manipulating objects in space'},
      categoryId: 'cat_cognitive',
    ),
    'processing_speed': HierarchicalScale(
      id: 'processing_speed',
      name: {'ru': 'Скорость обработки', 'en': 'Processing Speed'},
      description: {'ru': 'Быстрота умственной обработки информации', 'en': 'Speed of mental information processing'},
      categoryId: 'cat_cognitive',
    ),
    'working_memory': HierarchicalScale(
      id: 'working_memory',
      name: {'ru': 'Рабочая память', 'en': 'Working Memory'},
      description: {'ru': 'Удержание информации в уме', 'en': 'Holding information in mind'},
      categoryId: 'cat_cognitive',
    ),
    'attention_control': HierarchicalScale(
      id: 'attention_control',
      name: {'ru': 'Контроль внимания', 'en': 'Attention Control'},
      description: {'ru': 'Способность фокусировать и удерживать внимание', 'en': 'Ability to focus and sustain attention'},
      categoryId: 'cat_cognitive',
    ),
    'cognitive_flexibility': HierarchicalScale(
      id: 'cognitive_flexibility',
      name: {'ru': 'Когнитивная гибкость', 'en': 'Cognitive Flexibility'},
      description: {'ru': 'Переключение между разными задачами и перспективами', 'en': 'Switching between different tasks and perspectives'},
      categoryId: 'cat_cognitive',
    ),
    'problem_solving': HierarchicalScale(
      id: 'problem_solving',
      name: {'ru': 'Решение проблем', 'en': 'Problem Solving'},
      description: {'ru': 'Нахождение решений сложных задач', 'en': 'Finding solutions to complex problems'},
      categoryId: 'cat_cognitive',
    ),
    'critical_thinking': HierarchicalScale(
      id: 'critical_thinking',
      name: {'ru': 'Критическое мышление', 'en': 'Critical Thinking'},
      description: {'ru': 'Оценка информации и аргументов', 'en': 'Evaluating information and arguments'},
      categoryId: 'cat_cognitive',
    ),
    'learning_ability': HierarchicalScale(
      id: 'learning_ability',
      name: {'ru': 'Способность к обучению', 'en': 'Learning Ability'},
      description: {'ru': 'Скорость и лёгкость усвоения нового', 'en': 'Speed and ease of acquiring new knowledge'},
      categoryId: 'cat_cognitive',
    ),

    // === MOTIVATION SUBSCALES (11) ===
    'intrinsic_motivation': HierarchicalScale(
      id: 'intrinsic_motivation',
      name: {'ru': 'Внутренняя мотивация', 'en': 'Intrinsic Motivation'},
      description: {'ru': 'Мотивация от удовольствия и интереса', 'en': 'Motivation from enjoyment and interest'},
      categoryId: 'cat_motivation',
    ),
    'extrinsic_motivation': HierarchicalScale(
      id: 'extrinsic_motivation',
      name: {'ru': 'Внешняя мотивация', 'en': 'Extrinsic Motivation'},
      description: {'ru': 'Мотивация от внешних вознаграждений', 'en': 'Motivation from external rewards'},
      categoryId: 'cat_motivation',
    ),
    'achievement_motivation': HierarchicalScale(
      id: 'achievement_motivation',
      name: {'ru': 'Мотивация достижения', 'en': 'Achievement Motivation'},
      description: {'ru': 'Стремление к успеху и мастерству', 'en': 'Drive for success and mastery'},
      categoryId: 'cat_motivation',
    ),
    'power_motivation': HierarchicalScale(
      id: 'power_motivation',
      name: {'ru': 'Мотивация власти', 'en': 'Power Motivation'},
      description: {'ru': 'Желание влиять на других', 'en': 'Desire to influence others'},
      categoryId: 'cat_motivation',
    ),
    'affiliation_motivation': HierarchicalScale(
      id: 'affiliation_motivation',
      name: {'ru': 'Мотивация принадлежности', 'en': 'Affiliation Motivation'},
      description: {'ru': 'Желание социальной связи', 'en': 'Desire for social connection'},
      categoryId: 'cat_motivation',
    ),
    'autonomy_need': HierarchicalScale(
      id: 'autonomy_need',
      name: {'ru': 'Потребность в автономии', 'en': 'Autonomy Need'},
      description: {'ru': 'Желание самостоятельности', 'en': 'Desire for self-direction'},
      categoryId: 'cat_motivation',
    ),
    'competence_need': HierarchicalScale(
      id: 'competence_need',
      name: {'ru': 'Потребность в компетентности', 'en': 'Competence Need'},
      description: {'ru': 'Желание быть эффективным', 'en': 'Desire to be effective'},
      categoryId: 'cat_motivation',
    ),
    'relatedness_need': HierarchicalScale(
      id: 'relatedness_need',
      name: {'ru': 'Потребность в связи', 'en': 'Relatedness Need'},
      description: {'ru': 'Желание значимых отношений', 'en': 'Desire for meaningful relationships'},
      categoryId: 'cat_motivation',
    ),
    'persistence': HierarchicalScale(
      id: 'persistence',
      name: {'ru': 'Настойчивость', 'en': 'Persistence'},
      description: {'ru': 'Продолжение усилий несмотря на препятствия', 'en': 'Continuing effort despite obstacles'},
      categoryId: 'cat_motivation',
    ),
    'ambition': HierarchicalScale(
      id: 'ambition',
      name: {'ru': 'Амбициозность', 'en': 'Ambition'},
      description: {'ru': 'Стремление к высоким целям', 'en': 'Striving for high goals'},
      categoryId: 'cat_motivation',
    ),
    'drive_for_excellence': HierarchicalScale(
      id: 'drive_for_excellence',
      name: {'ru': 'Стремление к совершенству', 'en': 'Drive for Excellence'},
      description: {'ru': 'Желание выдающихся результатов', 'en': 'Desire for outstanding results'},
      categoryId: 'cat_motivation',
    ),

    // === SOCIAL SKILLS SUBSCALES (12) ===
    'social_perception': HierarchicalScale(
      id: 'social_perception',
      name: {'ru': 'Социальная перцепция', 'en': 'Social Perception'},
      description: {'ru': 'Понимание социальных сигналов и ситуаций', 'en': 'Understanding social cues and situations'},
      categoryId: 'cat_social_skills',
    ),
    'emotional_intelligence': HierarchicalScale(
      id: 'emotional_intelligence',
      name: {'ru': 'Эмоциональный интеллект', 'en': 'Emotional Intelligence'},
      description: {'ru': 'Способность понимать и управлять эмоциями', 'en': 'Ability to understand and manage emotions'},
      categoryId: 'cat_social_skills',
    ),
    'conflict_management': HierarchicalScale(
      id: 'conflict_management',
      name: {'ru': 'Управление конфликтами', 'en': 'Conflict Management'},
      description: {'ru': 'Эффективное разрешение разногласий', 'en': 'Effective resolution of disagreements'},
      categoryId: 'cat_social_skills',
    ),
    'negotiation': HierarchicalScale(
      id: 'negotiation',
      name: {'ru': 'Навыки переговоров', 'en': 'Negotiation'},
      description: {'ru': 'Способность достигать взаимовыгодных соглашений', 'en': 'Ability to reach mutually beneficial agreements'},
      categoryId: 'cat_social_skills',
    ),
    'persuasion': HierarchicalScale(
      id: 'persuasion',
      name: {'ru': 'Убеждение', 'en': 'Persuasion'},
      description: {'ru': 'Влияние на мнения и решения других', 'en': 'Influencing opinions and decisions of others'},
      categoryId: 'cat_social_skills',
    ),
    'active_listening': HierarchicalScale(
      id: 'active_listening',
      name: {'ru': 'Активное слушание', 'en': 'Active Listening'},
      description: {'ru': 'Внимательное и эмпатичное восприятие собеседника', 'en': 'Attentive and empathic reception of speaker'},
      categoryId: 'cat_social_skills',
    ),
    'verbal_communication': HierarchicalScale(
      id: 'verbal_communication',
      name: {'ru': 'Вербальная коммуникация', 'en': 'Verbal Communication'},
      description: {'ru': 'Эффективное словесное выражение мыслей', 'en': 'Effective verbal expression of thoughts'},
      categoryId: 'cat_social_skills',
    ),
    'nonverbal_communication': HierarchicalScale(
      id: 'nonverbal_communication',
      name: {'ru': 'Невербальная коммуникация', 'en': 'Nonverbal Communication'},
      description: {'ru': 'Использование жестов, мимики, языка тела', 'en': 'Use of gestures, facial expressions, body language'},
      categoryId: 'cat_social_skills',
    ),
    'humor': HierarchicalScale(
      id: 'humor',
      name: {'ru': 'Юмор', 'en': 'Humor'},
      description: {'ru': 'Способность использовать юмор социально', 'en': 'Ability to use humor socially'},
      categoryId: 'cat_social_skills',
    ),
    'charisma': HierarchicalScale(
      id: 'charisma',
      name: {'ru': 'Харизма', 'en': 'Charisma'},
      description: {'ru': 'Личная привлекательность и влияние', 'en': 'Personal appeal and influence'},
      categoryId: 'cat_social_skills',
    ),
    'networking': HierarchicalScale(
      id: 'networking',
      name: {'ru': 'Нетворкинг', 'en': 'Networking'},
      description: {'ru': 'Построение и поддержание связей', 'en': 'Building and maintaining connections'},
      categoryId: 'cat_social_skills',
    ),
    'boundary_setting': HierarchicalScale(
      id: 'boundary_setting',
      name: {'ru': 'Установка границ', 'en': 'Boundary Setting'},
      description: {'ru': 'Способность защищать личные границы', 'en': 'Ability to protect personal boundaries'},
      categoryId: 'cat_social_skills',
    ),

    // === DARK TRIAD SUBSCALES (8) ===
    'machiavellianism': HierarchicalScale(
      id: 'machiavellianism',
      name: {'ru': 'Макиавеллизм', 'en': 'Machiavellianism'},
      description: {'ru': 'Манипулятивность и цинизм', 'en': 'Manipulativeness and cynicism'},
      categoryId: 'cat_dark_triad',
    ),
    'narcissism': HierarchicalScale(
      id: 'narcissism',
      name: {'ru': 'Нарциссизм', 'en': 'Narcissism'},
      description: {'ru': 'Грандиозность и потребность в восхищении', 'en': 'Grandiosity and need for admiration'},
      categoryId: 'cat_dark_triad',
    ),
    'psychopathy': HierarchicalScale(
      id: 'psychopathy',
      name: {'ru': 'Психопатия', 'en': 'Psychopathy'},
      description: {'ru': 'Бесчувственность и импульсивность', 'en': 'Callousness and impulsivity'},
      categoryId: 'cat_dark_triad',
    ),
    'manipulation': HierarchicalScale(
      id: 'manipulation',
      name: {'ru': 'Манипулятивность', 'en': 'Manipulation'},
      description: {'ru': 'Использование других для своих целей', 'en': 'Using others for own purposes'},
      categoryId: 'cat_dark_triad',
    ),
    'entitlement': HierarchicalScale(
      id: 'entitlement',
      name: {'ru': 'Чувство особых прав', 'en': 'Entitlement'},
      description: {'ru': 'Ожидание особого отношения', 'en': 'Expectation of special treatment'},
      categoryId: 'cat_dark_triad',
    ),
    'grandiosity': HierarchicalScale(
      id: 'grandiosity',
      name: {'ru': 'Грандиозность', 'en': 'Grandiosity'},
      description: {'ru': 'Преувеличенное чувство собственной важности', 'en': 'Exaggerated sense of self-importance'},
      categoryId: 'cat_dark_triad',
    ),
    'callousness': HierarchicalScale(
      id: 'callousness',
      name: {'ru': 'Бесчувственность', 'en': 'Callousness'},
      description: {'ru': 'Отсутствие сочувствия к другим', 'en': 'Lack of sympathy for others'},
      categoryId: 'cat_dark_triad',
    ),
    'impulsivity_dark': HierarchicalScale(
      id: 'impulsivity_dark',
      name: {'ru': 'Импульсивность (тёмная)', 'en': 'Impulsivity (Dark)'},
      description: {'ru': 'Безрассудное поведение без учёта последствий', 'en': 'Reckless behavior without considering consequences'},
      categoryId: 'cat_dark_triad',
    ),

    // === LEADERSHIP SUBSCALES (10) ===
    'strategic_thinking': HierarchicalScale(
      id: 'strategic_thinking',
      name: {'ru': 'Стратегическое мышление', 'en': 'Strategic Thinking'},
      description: {'ru': 'Долгосрочное планирование и предвидение', 'en': 'Long-term planning and foresight'},
      categoryId: 'cat_leadership',
    ),
    'vision': HierarchicalScale(
      id: 'vision',
      name: {'ru': 'Видение', 'en': 'Vision'},
      description: {'ru': 'Способность создавать вдохновляющее будущее', 'en': 'Ability to create inspiring future'},
      categoryId: 'cat_leadership',
    ),
    'decisiveness': HierarchicalScale(
      id: 'decisiveness',
      name: {'ru': 'Решительность', 'en': 'Decisiveness'},
      description: {'ru': 'Способность принимать твёрдые решения', 'en': 'Ability to make firm decisions'},
      categoryId: 'cat_leadership',
    ),
    'delegation': HierarchicalScale(
      id: 'delegation',
      name: {'ru': 'Делегирование', 'en': 'Delegation'},
      description: {'ru': 'Эффективное распределение задач', 'en': 'Effective task distribution'},
      categoryId: 'cat_leadership',
    ),
    'mentoring': HierarchicalScale(
      id: 'mentoring',
      name: {'ru': 'Наставничество', 'en': 'Mentoring'},
      description: {'ru': 'Развитие и поддержка других', 'en': 'Developing and supporting others'},
      categoryId: 'cat_leadership',
    ),
    'team_building': HierarchicalScale(
      id: 'team_building',
      name: {'ru': 'Формирование команды', 'en': 'Team Building'},
      description: {'ru': 'Создание сплочённых команд', 'en': 'Creating cohesive teams'},
      categoryId: 'cat_leadership',
    ),
    'inspirational_motivation': HierarchicalScale(
      id: 'inspirational_motivation',
      name: {'ru': 'Вдохновляющая мотивация', 'en': 'Inspirational Motivation'},
      description: {'ru': 'Вдохновление других на действие', 'en': 'Inspiring others to action'},
      categoryId: 'cat_leadership',
    ),
    'confidence_building': HierarchicalScale(
      id: 'confidence_building',
      name: {'ru': 'Укрепление уверенности', 'en': 'Confidence Building'},
      description: {'ru': 'Развитие уверенности в команде', 'en': 'Developing confidence in team'},
      categoryId: 'cat_leadership',
    ),
    'accountability': HierarchicalScale(
      id: 'accountability',
      name: {'ru': 'Подотчётность', 'en': 'Accountability'},
      description: {'ru': 'Принятие ответственности за результаты', 'en': 'Taking responsibility for results'},
      categoryId: 'cat_leadership',
    ),
    'adaptability_leadership': HierarchicalScale(
      id: 'adaptability_leadership',
      name: {'ru': 'Адаптивность в лидерстве', 'en': 'Leadership Adaptability'},
      description: {'ru': 'Гибкость стиля лидерства', 'en': 'Flexibility of leadership style'},
      categoryId: 'cat_leadership',
    ),

    // === VALUES SUBSCALES (10) ===
    'achievement_value': HierarchicalScale(
      id: 'achievement_value',
      name: {'ru': 'Ценность достижения', 'en': 'Achievement Value'},
      description: {'ru': 'Значимость личного успеха', 'en': 'Importance of personal success'},
      categoryId: 'cat_values',
    ),
    'power_value': HierarchicalScale(
      id: 'power_value',
      name: {'ru': 'Ценность власти', 'en': 'Power Value'},
      description: {'ru': 'Значимость статуса и контроля', 'en': 'Importance of status and control'},
      categoryId: 'cat_values',
    ),
    'hedonism': HierarchicalScale(
      id: 'hedonism',
      name: {'ru': 'Гедонизм', 'en': 'Hedonism'},
      description: {'ru': 'Ценность удовольствия и наслаждения', 'en': 'Value of pleasure and enjoyment'},
      categoryId: 'cat_values',
    ),
    'stimulation': HierarchicalScale(
      id: 'stimulation',
      name: {'ru': 'Стимуляция', 'en': 'Stimulation'},
      description: {'ru': 'Ценность новизны и возбуждения', 'en': 'Value of novelty and excitement'},
      categoryId: 'cat_values',
    ),
    'self_direction': HierarchicalScale(
      id: 'self_direction',
      name: {'ru': 'Самостоятельность', 'en': 'Self-Direction'},
      description: {'ru': 'Ценность независимого мышления и действия', 'en': 'Value of independent thought and action'},
      categoryId: 'cat_values',
    ),
    'universalism': HierarchicalScale(
      id: 'universalism',
      name: {'ru': 'Универсализм', 'en': 'Universalism'},
      description: {'ru': 'Ценность справедливости и заботы о мире', 'en': 'Value of justice and care for world'},
      categoryId: 'cat_values',
    ),
    'benevolence': HierarchicalScale(
      id: 'benevolence',
      name: {'ru': 'Благожелательность', 'en': 'Benevolence'},
      description: {'ru': 'Ценность заботы о близких', 'en': 'Value of caring for close ones'},
      categoryId: 'cat_values',
    ),
    'tradition': HierarchicalScale(
      id: 'tradition',
      name: {'ru': 'Традиция', 'en': 'Tradition'},
      description: {'ru': 'Уважение к культурным обычаям', 'en': 'Respect for cultural customs'},
      categoryId: 'cat_values',
    ),
    'conformity': HierarchicalScale(
      id: 'conformity',
      name: {'ru': 'Конформность', 'en': 'Conformity'},
      description: {'ru': 'Следование социальным нормам', 'en': 'Following social norms'},
      categoryId: 'cat_values',
    ),
    'security_value': HierarchicalScale(
      id: 'security_value',
      name: {'ru': 'Ценность безопасности', 'en': 'Security Value'},
      description: {'ru': 'Значимость стабильности и порядка', 'en': 'Importance of stability and order'},
      categoryId: 'cat_values',
    ),

    // === WELL-BEING SUBSCALES (9) ===
    'life_satisfaction': HierarchicalScale(
      id: 'life_satisfaction',
      name: {'ru': 'Удовлетворённость жизнью', 'en': 'Life Satisfaction'},
      description: {'ru': 'Общая удовлетворённость жизнью', 'en': 'Overall life satisfaction'},
      categoryId: 'cat_wellbeing',
    ),
    'happiness': HierarchicalScale(
      id: 'happiness',
      name: {'ru': 'Счастье', 'en': 'Happiness'},
      description: {'ru': 'Субъективное благополучие', 'en': 'Subjective well-being'},
      categoryId: 'cat_wellbeing',
    ),
    'meaning_purpose': HierarchicalScale(
      id: 'meaning_purpose',
      name: {'ru': 'Смысл и цель', 'en': 'Meaning & Purpose'},
      description: {'ru': 'Ощущение цели и смысла в жизни', 'en': 'Sense of purpose and meaning in life'},
      categoryId: 'cat_wellbeing',
    ),
    'self_acceptance': HierarchicalScale(
      id: 'self_acceptance',
      name: {'ru': 'Самопринятие', 'en': 'Self-Acceptance'},
      description: {'ru': 'Принятие себя таким, какой есть', 'en': 'Accepting oneself as is'},
      categoryId: 'cat_wellbeing',
    ),
    'personal_growth': HierarchicalScale(
      id: 'personal_growth',
      name: {'ru': 'Личностный рост', 'en': 'Personal Growth'},
      description: {'ru': 'Постоянное развитие и самосовершенствование', 'en': 'Continuous development and self-improvement'},
      categoryId: 'cat_wellbeing',
    ),
    'autonomy_wellbeing': HierarchicalScale(
      id: 'autonomy_wellbeing',
      name: {'ru': 'Автономия (благополучие)', 'en': 'Autonomy (Well-being)'},
      description: {'ru': 'Самостоятельность в принятии решений', 'en': 'Self-determination in decision making'},
      categoryId: 'cat_wellbeing',
    ),
    'environmental_mastery': HierarchicalScale(
      id: 'environmental_mastery',
      name: {'ru': 'Контроль над окружением', 'en': 'Environmental Mastery'},
      description: {'ru': 'Способность управлять жизненными обстоятельствами', 'en': 'Ability to manage life circumstances'},
      categoryId: 'cat_wellbeing',
    ),
    'positive_relations': HierarchicalScale(
      id: 'positive_relations',
      name: {'ru': 'Позитивные отношения', 'en': 'Positive Relations'},
      description: {'ru': 'Качество межличностных отношений', 'en': 'Quality of interpersonal relationships'},
      categoryId: 'cat_wellbeing',
    ),
    'vitality': HierarchicalScale(
      id: 'vitality',
      name: {'ru': 'Жизненная энергия', 'en': 'Vitality'},
      description: {'ru': 'Чувство жизненной силы и энергии', 'en': 'Feeling of aliveness and energy'},
      categoryId: 'cat_wellbeing',
    ),

    // === IDENTITY SUBSCALES (10) ===
    'self_esteem': HierarchicalScale(
      id: 'self_esteem',
      name: {'ru': 'Самооценка', 'en': 'Self-Esteem'},
      description: {'ru': 'Общая оценка своей ценности', 'en': 'Overall evaluation of own worth'},
      categoryId: 'cat_identity',
    ),
    'self_efficacy': HierarchicalScale(
      id: 'self_efficacy',
      name: {'ru': 'Самоэффективность', 'en': 'Self-Efficacy'},
      description: {'ru': 'Вера в свои способности', 'en': 'Belief in own capabilities'},
      categoryId: 'cat_identity',
    ),
    'self_monitoring': HierarchicalScale(
      id: 'self_monitoring',
      name: {'ru': 'Самомониторинг', 'en': 'Self-Monitoring'},
      description: {'ru': 'Отслеживание социального поведения', 'en': 'Tracking social behavior'},
      categoryId: 'cat_identity',
    ),
    'self_awareness': HierarchicalScale(
      id: 'self_awareness',
      name: {'ru': 'Самосознание', 'en': 'Self-Awareness'},
      description: {'ru': 'Понимание себя и своих мотивов', 'en': 'Understanding self and own motives'},
      categoryId: 'cat_identity',
    ),
    'self_compassion': HierarchicalScale(
      id: 'self_compassion',
      name: {'ru': 'Сострадание к себе', 'en': 'Self-Compassion'},
      description: {'ru': 'Доброта к себе в трудные моменты', 'en': 'Kindness to self in difficult times'},
      categoryId: 'cat_identity',
    ),
    'authenticity': HierarchicalScale(
      id: 'authenticity',
      name: {'ru': 'Аутентичность', 'en': 'Authenticity'},
      description: {'ru': 'Жизнь в соответствии с истинным Я', 'en': 'Living in accordance with true self'},
      categoryId: 'cat_identity',
    ),
    'identity_clarity': HierarchicalScale(
      id: 'identity_clarity',
      name: {'ru': 'Ясность идентичности', 'en': 'Identity Clarity'},
      description: {'ru': 'Чёткое понимание себя', 'en': 'Clear understanding of self'},
      categoryId: 'cat_identity',
    ),
    'identity_flexibility': HierarchicalScale(
      id: 'identity_flexibility',
      name: {'ru': 'Гибкость идентичности', 'en': 'Identity Flexibility'},
      description: {'ru': 'Способность адаптировать самопонимание', 'en': 'Ability to adapt self-understanding'},
      categoryId: 'cat_identity',
    ),
    'body_image': HierarchicalScale(
      id: 'body_image',
      name: {'ru': 'Образ тела', 'en': 'Body Image'},
      description: {'ru': 'Восприятие своей внешности', 'en': 'Perception of own appearance'},
      categoryId: 'cat_identity',
    ),
    'gender_identity_comfort': HierarchicalScale(
      id: 'gender_identity_comfort',
      name: {'ru': 'Комфорт с гендерной идентичностью', 'en': 'Gender Identity Comfort'},
      description: {'ru': 'Комфорт с гендерным самоопределением', 'en': 'Comfort with gender self-identification'},
      categoryId: 'cat_identity',
    ),

    // === STRESS & COPING SUBSCALES (9) ===
    'problem_focused_coping': HierarchicalScale(
      id: 'problem_focused_coping',
      name: {'ru': 'Проблемно-ориентированный копинг', 'en': 'Problem-Focused Coping'},
      description: {'ru': 'Решение проблемы напрямую', 'en': 'Addressing problem directly'},
      categoryId: 'cat_stress_coping',
    ),
    'emotion_focused_coping': HierarchicalScale(
      id: 'emotion_focused_coping',
      name: {'ru': 'Эмоционально-ориентированный копинг', 'en': 'Emotion-Focused Coping'},
      description: {'ru': 'Регуляция эмоциональной реакции', 'en': 'Regulating emotional response'},
      categoryId: 'cat_stress_coping',
    ),
    'avoidant_coping': HierarchicalScale(
      id: 'avoidant_coping',
      name: {'ru': 'Избегающий копинг', 'en': 'Avoidant Coping'},
      description: {'ru': 'Избегание стрессора', 'en': 'Avoiding stressor'},
      categoryId: 'cat_stress_coping',
    ),
    'social_support_seeking': HierarchicalScale(
      id: 'social_support_seeking',
      name: {'ru': 'Поиск социальной поддержки', 'en': 'Social Support Seeking'},
      description: {'ru': 'Обращение к другим за помощью', 'en': 'Turning to others for help'},
      categoryId: 'cat_stress_coping',
    ),
    'mindfulness_coping': HierarchicalScale(
      id: 'mindfulness_coping',
      name: {'ru': 'Осознанность как копинг', 'en': 'Mindfulness Coping'},
      description: {'ru': 'Присутствие в моменте без суждения', 'en': 'Being present without judgment'},
      categoryId: 'cat_stress_coping',
    ),
    'rumination': HierarchicalScale(
      id: 'rumination',
      name: {'ru': 'Руминация', 'en': 'Rumination'},
      description: {'ru': 'Навязчивое обдумывание проблем', 'en': 'Obsessive pondering of problems'},
      categoryId: 'cat_stress_coping',
    ),
    'catastrophizing': HierarchicalScale(
      id: 'catastrophizing',
      name: {'ru': 'Катастрофизация', 'en': 'Catastrophizing'},
      description: {'ru': 'Преувеличение негативных последствий', 'en': 'Exaggerating negative consequences'},
      categoryId: 'cat_stress_coping',
    ),
    'cognitive_reappraisal': HierarchicalScale(
      id: 'cognitive_reappraisal',
      name: {'ru': 'Когнитивная переоценка', 'en': 'Cognitive Reappraisal'},
      description: {'ru': 'Переосмысление ситуации в позитивном ключе', 'en': 'Reframing situation in positive light'},
      categoryId: 'cat_stress_coping',
    ),
    'acceptance': HierarchicalScale(
      id: 'acceptance',
      name: {'ru': 'Принятие', 'en': 'Acceptance'},
      description: {'ru': 'Принятие реальности как она есть', 'en': 'Accepting reality as it is'},
      categoryId: 'cat_stress_coping',
    ),

    // === CREATIVITY SUBSCALES (7) ===
    'divergent_thinking': HierarchicalScale(
      id: 'divergent_thinking',
      name: {'ru': 'Дивергентное мышление', 'en': 'Divergent Thinking'},
      description: {'ru': 'Генерация множества идей', 'en': 'Generating multiple ideas'},
      categoryId: 'cat_creativity',
    ),
    'convergent_thinking': HierarchicalScale(
      id: 'convergent_thinking',
      name: {'ru': 'Конвергентное мышление', 'en': 'Convergent Thinking'},
      description: {'ru': 'Нахождение единственного правильного решения', 'en': 'Finding single correct solution'},
      categoryId: 'cat_creativity',
    ),
    'originality': HierarchicalScale(
      id: 'originality',
      name: {'ru': 'Оригинальность', 'en': 'Originality'},
      description: {'ru': 'Необычность и уникальность идей', 'en': 'Unusualness and uniqueness of ideas'},
      categoryId: 'cat_creativity',
    ),
    'fluency': HierarchicalScale(
      id: 'fluency',
      name: {'ru': 'Беглость идей', 'en': 'Fluency'},
      description: {'ru': 'Количество генерируемых идей', 'en': 'Quantity of generated ideas'},
      categoryId: 'cat_creativity',
    ),
    'elaboration': HierarchicalScale(
      id: 'elaboration',
      name: {'ru': 'Проработанность', 'en': 'Elaboration'},
      description: {'ru': 'Детализация и развитие идей', 'en': 'Detailing and developing ideas'},
      categoryId: 'cat_creativity',
    ),
    'flexibility_creative': HierarchicalScale(
      id: 'flexibility_creative',
      name: {'ru': 'Гибкость (креативная)', 'en': 'Flexibility (Creative)'},
      description: {'ru': 'Разнообразие категорий идей', 'en': 'Variety of idea categories'},
      categoryId: 'cat_creativity',
    ),
    'risk_taking_creative': HierarchicalScale(
      id: 'risk_taking_creative',
      name: {'ru': 'Принятие рисков (креативное)', 'en': 'Risk-Taking (Creative)'},
      description: {'ru': 'Готовность к творческому риску', 'en': 'Willingness for creative risk'},
      categoryId: 'cat_creativity',
    ),

    // === BEHAVIORAL STYLES SUBSCALES (10) ===
    'type_a_behavior': HierarchicalScale(
      id: 'type_a_behavior',
      name: {'ru': 'Поведение типа А', 'en': 'Type A Behavior'},
      description: {'ru': 'Конкурентность, срочность, амбициозность', 'en': 'Competitiveness, urgency, ambitiousness'},
      categoryId: 'cat_behavioral_styles',
    ),
    'risk_taking': HierarchicalScale(
      id: 'risk_taking',
      name: {'ru': 'Принятие рисков', 'en': 'Risk-Taking'},
      description: {'ru': 'Готовность к рискованным решениям', 'en': 'Willingness for risky decisions'},
      categoryId: 'cat_behavioral_styles',
    ),
    'sensation_seeking': HierarchicalScale(
      id: 'sensation_seeking',
      name: {'ru': 'Поиск ощущений', 'en': 'Sensation Seeking'},
      description: {'ru': 'Стремление к интенсивным переживаниям', 'en': 'Drive for intense experiences'},
      categoryId: 'cat_behavioral_styles',
    ),
    'novelty_seeking': HierarchicalScale(
      id: 'novelty_seeking',
      name: {'ru': 'Поиск новизны', 'en': 'Novelty Seeking'},
      description: {'ru': 'Стремление к новому опыту', 'en': 'Drive for new experiences'},
      categoryId: 'cat_behavioral_styles',
    ),
    'harm_avoidance': HierarchicalScale(
      id: 'harm_avoidance',
      name: {'ru': 'Избегание вреда', 'en': 'Harm Avoidance'},
      description: {'ru': 'Избегание опасности и риска', 'en': 'Avoiding danger and risk'},
      categoryId: 'cat_behavioral_styles',
    ),
    'reward_dependence': HierarchicalScale(
      id: 'reward_dependence',
      name: {'ru': 'Зависимость от вознаграждения', 'en': 'Reward Dependence'},
      description: {'ru': 'Чувствительность к вознаграждениям', 'en': 'Sensitivity to rewards'},
      categoryId: 'cat_behavioral_styles',
    ),
    'procrastination': HierarchicalScale(
      id: 'procrastination',
      name: {'ru': 'Прокрастинация', 'en': 'Procrastination'},
      description: {'ru': 'Откладывание задач на потом', 'en': 'Delaying tasks'},
      categoryId: 'cat_behavioral_styles',
    ),
    'decisiveness_behavior': HierarchicalScale(
      id: 'decisiveness_behavior',
      name: {'ru': 'Решительность (поведенческая)', 'en': 'Decisiveness (Behavioral)'},
      description: {'ru': 'Скорость принятия решений', 'en': 'Speed of decision making'},
      categoryId: 'cat_behavioral_styles',
    ),
    'impulsivity_behavior': HierarchicalScale(
      id: 'impulsivity_behavior',
      name: {'ru': 'Импульсивность (поведенческая)', 'en': 'Impulsivity (Behavioral)'},
      description: {'ru': 'Действие без обдумывания', 'en': 'Acting without thinking'},
      categoryId: 'cat_behavioral_styles',
    ),
    'patience': HierarchicalScale(
      id: 'patience',
      name: {'ru': 'Терпеливость', 'en': 'Patience'},
      description: {'ru': 'Способность ждать и терпеть', 'en': 'Ability to wait and endure'},
      categoryId: 'cat_behavioral_styles',
    ),

    // === META-INDICATORS SUBSCALES (5) ===
    'overall_adjustment': HierarchicalScale(
      id: 'overall_adjustment',
      name: {'ru': 'Общая адаптированность', 'en': 'Overall Adjustment'},
      description: {'ru': 'Общий уровень психологической адаптации', 'en': 'General level of psychological adaptation'},
      categoryId: 'cat_meta_indicators',
    ),
    'maturity': HierarchicalScale(
      id: 'maturity',
      name: {'ru': 'Зрелость', 'en': 'Maturity'},
      description: {'ru': 'Психологическая зрелость', 'en': 'Psychological maturity'},
      categoryId: 'cat_meta_indicators',
    ),
    'resilience_meta': HierarchicalScale(
      id: 'resilience_meta',
      name: {'ru': 'Жизнестойкость', 'en': 'Resilience'},
      description: {'ru': 'Способность преодолевать трудности', 'en': 'Ability to overcome difficulties'},
      categoryId: 'cat_meta_indicators',
    ),
    'growth_mindset': HierarchicalScale(
      id: 'growth_mindset',
      name: {'ru': 'Установка на рост', 'en': 'Growth Mindset'},
      description: {'ru': 'Вера в развитие способностей', 'en': 'Belief in development of abilities'},
      categoryId: 'cat_meta_indicators',
    ),
    'wisdom': HierarchicalScale(
      id: 'wisdom',
      name: {'ru': 'Мудрость', 'en': 'Wisdom'},
      description: {'ru': 'Глубокое понимание жизни и людей', 'en': 'Deep understanding of life and people'},
      categoryId: 'cat_meta_indicators',
    ),
  };

  // ============================================================================
  // LEGACY COMPATIBILITY: Keep old flat axes structure for backward compatibility
  // ============================================================================

  /// 6 основных шкал личности (LEGACY - для обратной совместимости)
  /// Используйте hierarchicalScales для новой системы
  @deprecated
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

  // ============================================================================
  // HIERARCHICAL NAVIGATION UTILITIES
  // ============================================================================

  /// Get all scales belonging to a category
  static List<HierarchicalScale> getScalesInCategory(String categoryId) {
    return hierarchicalScales.values
        .where((scale) => scale.categoryId == categoryId)
        .toList();
  }

  /// Get category for a scale
  static ScaleCategory? getCategoryForScale(String scaleId) {
    final scale = hierarchicalScales[scaleId];
    if (scale == null || scale.categoryId == null) return null;
    return categories[scale.categoryId];
  }

  /// Get all top-level scales (no parent)
  static List<HierarchicalScale> getTopLevelScales() {
    return hierarchicalScales.values
        .where((scale) => scale.isTopLevel)
        .toList();
  }

  /// Get all child scales of a parent scale
  static List<HierarchicalScale> getChildScales(String parentScaleId) {
    return hierarchicalScales.values
        .where((scale) => scale.parentScaleId == parentScaleId)
        .toList();
  }

  /// Check if a scale exists
  static bool hasScale(String scaleId) {
    return hierarchicalScales.containsKey(scaleId);
  }

  /// Get scale by ID
  static HierarchicalScale? getScale(String scaleId) {
    return hierarchicalScales[scaleId];
  }

  /// Get category by ID
  static ScaleCategory? getCategory(String categoryId) {
    return categories[categoryId];
  }

  /// Get all category IDs
  static List<String> getAllCategoryIds() {
    return categories.keys.toList();
  }

  /// Get all scale IDs
  static List<String> getAllScaleIds() {
    return hierarchicalScales.keys.toList();
  }

  /// Get total number of defined categories
  static int get totalCategories => categories.length;

  /// Get total number of defined scales
  static int get totalScales => hierarchicalScales.length;

  /// Get color for a scale (inherits from category if not set)
  static Color? getScaleColor(String scaleId) {
    final scale = hierarchicalScales[scaleId];
    if (scale == null) return null;

    if (scale.color != null) return scale.color;

    // Inherit from category
    if (scale.categoryId != null) {
      final category = categories[scale.categoryId];
      return category?.color;
    }

    return null;
  }

  /// Get icon for a scale (inherits from category if not set)
  static IconData? getScaleIcon(String scaleId) {
    final scale = hierarchicalScales[scaleId];
    if (scale == null) return null;

    if (scale.icon != null) return scale.icon;

    // Inherit from category
    if (scale.categoryId != null) {
      final category = categories[scale.categoryId];
      return category?.icon;
    }

    return null;
  }

  /// Get breadcrumb path for a scale (for UI navigation)
  /// Returns list like: ["Category Name", "Parent Scale Name", "Scale Name"]
  static List<String> getScaleBreadcrumb(String scaleId, String languageCode) {
    final breadcrumb = <String>[];
    final scale = hierarchicalScales[scaleId];

    if (scale == null) return breadcrumb;

    // Add category
    if (scale.categoryId != null) {
      final category = categories[scale.categoryId];
      if (category != null) {
        breadcrumb.add(category.getName(languageCode));
      }
    }

    // Add parent scale (if exists)
    if (scale.parentScaleId != null) {
      final parentScale = hierarchicalScales[scale.parentScaleId];
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
    return hierarchicalScales.containsKey(scaleId);
  }

  /// Get all "on reserve" scales for a category (defined in category but not yet implemented)
  static List<String> getReserveScalesForCategory(String categoryId) {
    final category = categories[categoryId];
    if (category == null) return [];

    return category.subscaleIds
        .where((scaleId) => !hierarchicalScales.containsKey(scaleId))
        .toList();
  }

  /// Get implementation statistics
  static Map<String, dynamic> getImplementationStats() {
    int totalExpectedScales = 0;
    int implementedScales = hierarchicalScales.length;

    // Count all expected scales from categories
    for (final category in categories.values) {
      totalExpectedScales += category.subscaleIds.length;
    }

    return {
      'totalCategories': categories.length,
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

/// Описание шкалы (оси) саммари
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

/// Уровень уверенности профиля
enum ConfidenceLevel {
  low,
  medium,
  high,
}

extension ConfidenceLevelExtension on ConfidenceLevel {
  String getLocalizedName(String languageCode) {
    switch (this) {
      case ConfidenceLevel.low:
        return languageCode == 'ru' ? 'Низкая' : 'Low';
      case ConfidenceLevel.medium:
        return languageCode == 'ru' ? 'Средняя' : 'Medium';
      case ConfidenceLevel.high:
        return languageCode == 'ru' ? 'Высокая' : 'High';
    }
  }

  String getDescription(String languageCode) {
    switch (this) {
      case ConfidenceLevel.low:
        return languageCode == 'ru'
            ? 'Данные предварительные. Рекомендуется пройти больше тестов для более точной картины.'
            : 'Data is preliminary. It is recommended to take more tests for a more accurate picture.';
      case ConfidenceLevel.medium:
        return languageCode == 'ru'
            ? 'Данные достаточно репрезентативны. Можно доверять основным тенденциям.'
            : 'Data is sufficiently representative. You can trust the main trends.';
      case ConfidenceLevel.high:
        return languageCode == 'ru'
            ? 'Данные очень репрезентативны. Профиль отражает вашу личность с высокой точностью.'
            : 'Data is highly representative. The profile reflects your personality with high accuracy.';
    }
  }
}

// ============================================================================
// PER-QUESTION WEIGHTING SYSTEM (v2.0)
// ============================================================================

/// Per-question axis weighting configuration
///
/// This system allows each question to contribute to multiple personality axes
/// with different weights, providing more nuanced and accurate personality analysis.
///
/// Weight Guidelines:
/// - 1.0: Primary measurement (direct construct)
/// - 0.6-0.8: Strong secondary measurement
/// - 0.3-0.5: Moderate secondary measurement
/// - 0.1-0.2: Tertiary/weak measurement
///
/// Psychometric Principles:
/// - Questions can measure multiple constructs simultaneously
/// - Weights reflect the theoretical strength of each measurement
/// - Total weight per question typically sums to 1.5-3.0 across all axes
/// - Reversed questions use positive weights (reversal handled in scoring)
///
/// NOTE: QuestionWeight class is now defined in question_weight_models.dart
/// and re-exported by this file for backward compatibility.

/// Central repository of per-question weights (DEPRECATED)
///
/// IMPORTANT: This is the psychometric core of the v2.0 scoring system.
/// Weights are determined based on:
/// 1. Theoretical construct validity (what the question measures)
/// 2. Cross-construct relationships (how traits interact)
/// 3. Psychometric literature and Big Five research
/// 4. Clinical/research consensus on personality structure
class QuestionWeightsConfig {
  /// Lookup table: "testId:questionId" → QuestionWeight
  static final Map<String, QuestionWeight> _weights = {
    // Import all weights from separate files
    ...IPIPBigFiveWeights.weights,
    ...FisherTemperamentWeights.weights,
    ...LoveProfileWeights.weights,
    ...SimpleTestsWeights.weights,
    ...SixteenTypesWeights.weights,
    ...TemperamentProfileTestWeights.weights,
    ...DigitalDetoxWeights.weights,
    ...BurnoutDiagnosticWeights.weights,
    ...SocialBatteryWeights.weights,
    ...DISCPersonalityWeights.weights,
    ...HollandCodeWeights.weights,
    ...LoveLanguagesWeights.weights,
    ...AnxietySymptomsInventoryWeights.weights,
    ...DepressionSymptomsInventoryWeights.weights,
    ...CareerCompassWeights.weights,
    ...WellbeingHappinessInventoryWeights.weights,
    ...DigitalCareerFitWeights.weights,
    ...SelfConfidenceMultiscaleWeights.weights,
    ...RomanticPotentialWeights.weights,
    ...CognitiveAbilityWeights.weights,
    ...RelationshipCompatibilityWeights.weights,
    ...FriendshipPsychologyWeights.weights,
    ...PerfectionismFearOfErrorWeights.weights,

    // ========================================================================
    // WEIGHTS NOW LOADED FROM SEPARATE FILES
    // ========================================================================
    // - ipip_big_five_weights.dart (50 questions)
    // - fisher_temperament_weights.dart (56 questions)
    // - love_profile_weights.dart (60 questions)
    // - simple_tests_weights.dart (stress + self-esteem)
    // - sixteen_types_weights.dart (80 questions)
    // - temperament_profile_test_weights.dart (60 questions)
    // - digital_detox_weights.dart (50 questions)
    // - burnout_diagnostic_weights.dart (54 questions)
    // - social_battery_weights.dart (40 questions)
    // - disc_personality_weights.dart (56 questions, 45 unipolar + 7 bipolar poles)
    // - holland_code_weights.dart (60 questions)
    // - love_languages_weights.dart (30 questions)
    // - career_compass_weights.dart (8 scale scores) ⭐ NEW
    // ========================================================================
    //
    // Old inline weights removed - now imported from separate files
    //
  };

  /// Get weights for a specific question
  static QuestionWeight? getWeights(String testId, String questionId) {
    return _weights['$testId:$questionId'];
  }

  /// Get all weights for a test
  static List<QuestionWeight> getTestWeights(String testId) {
    return _weights.values
        .where((w) => w.testId == testId)
        .toList();
  }

  /// Check if per-question weights are defined for a test
  static bool hasWeights(String testId, String questionId) {
    return _weights.containsKey('$testId:$questionId');
  }

  /// Get unique scales affected by a test
  /// Returns a Set of scale IDs that this test contributes to
  static Set<String> getAffectedScales(String testId) {
    final scaleIds = <String>{};
    for (final weight in _weights.values) {
      if (weight.testId == testId) {
        scaleIds.addAll(weight.axisWeights.keys);
      }
    }
    return scaleIds;
  }

  /// Get scale count for a test
  static int getScaleCount(String testId) {
    return getAffectedScales(testId).length;
  }

  /// Get total number of configured questions
  static int get totalConfiguredQuestions => _weights.length;
}
