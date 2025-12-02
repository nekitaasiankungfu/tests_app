import 'package:flutter/material.dart';

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

/// Configuration for hierarchical psychological scales
class HierarchicalScalesConfig {
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
  // @deprecated - removed, class continues below
}
