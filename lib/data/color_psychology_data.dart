import '../models/color_psychology_model.dart';

/// Данные для цветового психологического теста
///
/// Содержит:
/// - Определения всех 10 цветов
/// - Вопросы для этапа ассоциаций
/// - Психологические шкалы
/// - Паттерны и их интерпретации
///
/// @author: Color Psychology Research Institute
/// @version: 1.0.0

class ColorPsychologyData {
  /// Список всех цветов теста
  static const List<ColorInfo> colors = [
    ColorInfo(
      id: 'red',
      name: {'ru': 'Красный', 'en': 'Red'},
      hex: '#D32F2F',
      psychologicalMeaning: {
        'ru': 'Энергия, активность, агрессия, страсть, сила воли',
        'en': 'Energy, activity, aggression, passion, willpower',
      },
      positiveAssociations: {
        'ru': 'витальность, уверенность, лидерство, страсть',
        'en': 'vitality, confidence, leadership, passion',
      },
      negativeAssociations: {
        'ru': 'агрессия, импульсивность, стресс, гнев',
        'en': 'aggression, impulsivity, stress, anger',
      },
    ),
    ColorInfo(
      id: 'blue',
      name: {'ru': 'Синий', 'en': 'Blue'},
      hex: '#1976D2',
      psychologicalMeaning: {
        'ru': 'Спокойствие, контроль, рациональность, дистанция, стабильность',
        'en': 'Calmness, control, rationality, distance, stability',
      },
      positiveAssociations: {
        'ru': 'мир, контроль, глубина, надёжность',
        'en': 'peace, control, depth, reliability',
      },
      negativeAssociations: {
        'ru': 'холодность, отстранённость, депрессия, ригидность',
        'en': 'coldness, detachment, depression, rigidity',
      },
    ),
    ColorInfo(
      id: 'green',
      name: {'ru': 'Зелёный', 'en': 'Green'},
      hex: '#388E3C',
      psychologicalMeaning: {
        'ru': 'Баланс, рост, стабильность, упрямство, самоутверждение',
        'en': 'Balance, growth, stability, stubbornness, self-assertion',
      },
      positiveAssociations: {
        'ru': 'гармония, природа, рост, безопасность',
        'en': 'harmony, nature, growth, safety',
      },
      negativeAssociations: {
        'ru': 'упрямство, застой, жёсткость, сопротивление',
        'en': 'stubbornness, stagnation, rigidity, resistance',
      },
    ),
    ColorInfo(
      id: 'yellow',
      name: {'ru': 'Жёлтый', 'en': 'Yellow'},
      hex: '#FBC02D',
      psychologicalMeaning: {
        'ru': 'Оптимизм, лёгкость, общительность, тревожность, нестабильность',
        'en': 'Optimism, lightness, sociability, anxiety, instability',
      },
      positiveAssociations: {
        'ru': 'радость, оптимизм, креативность, лёгкость',
        'en': 'joy, optimism, creativity, lightness',
      },
      negativeAssociations: {
        'ru': 'поверхностность, тревога, нестабильность, избегание',
        'en': 'superficiality, anxiety, instability, avoidance',
      },
    ),
    ColorInfo(
      id: 'violet',
      name: {'ru': 'Фиолетовый', 'en': 'Violet'},
      hex: '#7B1FA2',
      psychologicalMeaning: {
        'ru': 'Трансформация, духовность, уникальность, внутренний конфликт',
        'en': 'Transformation, spirituality, uniqueness, inner conflict',
      },
      positiveAssociations: {
        'ru': 'интуиция, креативность, глубина, мистика',
        'en': 'intuition, creativity, depth, mysticism',
      },
      negativeAssociations: {
        'ru': 'нереалистичность, эскапизм, нестабильность, конфликт',
        'en': 'unrealistic, escapism, instability, conflict',
      },
    ),
    ColorInfo(
      id: 'brown',
      name: {'ru': 'Коричневый', 'en': 'Brown'},
      hex: '#5D4037',
      psychologicalMeaning: {
        'ru': 'Безопасность, комфорт, материальность, истощение, потребность в отдыхе',
        'en': 'Security, comfort, materiality, exhaustion, need for rest',
      },
      positiveAssociations: {
        'ru': 'надёжность, стабильность, заземлённость, комфорт',
        'en': 'reliability, stability, grounding, comfort',
      },
      negativeAssociations: {
        'ru': 'усталость, истощение, депрессия, регрессия',
        'en': 'fatigue, exhaustion, depression, regression',
      },
    ),
    ColorInfo(
      id: 'black',
      name: {'ru': 'Чёрный', 'en': 'Black'},
      hex: '#212121',
      psychologicalMeaning: {
        'ru': 'Отрицание, протест, защита, тайна, сила или капитуляция',
        'en': 'Denial, protest, protection, mystery, power or capitulation',
      },
      positiveAssociations: {
        'ru': 'элегантность, тайна, глубина, защита',
        'en': 'elegance, mystery, depth, protection',
      },
      negativeAssociations: {
        'ru': 'отрицание, протест, депрессия, капитуляция',
        'en': 'denial, protest, depression, capitulation',
      },
    ),
    ColorInfo(
      id: 'gray',
      name: {'ru': 'Серый', 'en': 'Gray'},
      hex: '#757575',
      psychologicalMeaning: {
        'ru': 'Нейтральность, дистанция, защита от стимулов, эмоциональное истощение',
        'en': 'Neutrality, distance, protection from stimuli, emotional exhaustion',
      },
      positiveAssociations: {
        'ru': 'нейтральность, баланс, дипломатичность',
        'en': 'neutrality, balance, diplomacy',
      },
      negativeAssociations: {
        'ru': 'апатия, отстранённость, эмоциональная пустота, истощение',
        'en': 'apathy, detachment, emotional emptiness, exhaustion',
      },
    ),
    ColorInfo(
      id: 'orange',
      name: {'ru': 'Оранжевый', 'en': 'Orange'},
      hex: '#F57C00',
      psychologicalMeaning: {
        'ru': 'Общительность, энтузиазм, тепло, поверхностная активность',
        'en': 'Sociability, enthusiasm, warmth, superficial activity',
      },
      positiveAssociations: {
        'ru': 'дружелюбие, тепло, энтузиазм, общительность',
        'en': 'friendliness, warmth, enthusiasm, sociability',
      },
      negativeAssociations: {
        'ru': 'поверхностность, навязчивость, гиперактивность',
        'en': 'superficiality, intrusiveness, hyperactivity',
      },
    ),
    ColorInfo(
      id: 'pink',
      name: {'ru': 'Розовый', 'en': 'Pink'},
      hex: '#E91E63',
      psychologicalMeaning: {
        'ru': 'Нежность, потребность в заботе, инфантильность, уязвимость',
        'en': 'Tenderness, need for care, infantilism, vulnerability',
      },
      positiveAssociations: {
        'ru': 'нежность, забота, мягкость, романтика',
        'en': 'tenderness, care, softness, romance',
      },
      negativeAssociations: {
        'ru': 'инфантильность, зависимость, слабость, уязвимость',
        'en': 'infantilism, dependence, weakness, vulnerability',
      },
    ),
  ];

  /// Эмоции для этапа 4 (эмоциональные ассоциации)
  static const List<Map<String, String>> emotionalAssociations = [
    {'id': 'joy', 'ru': 'Радость', 'en': 'Joy'},
    {'id': 'fear', 'ru': 'Страх', 'en': 'Fear'},
    {'id': 'anger', 'ru': 'Гнев', 'en': 'Anger'},
    {'id': 'sadness', 'ru': 'Грусть', 'en': 'Sadness'},
    {'id': 'calm', 'ru': 'Спокойствие', 'en': 'Calm'},
    {'id': 'excitement', 'ru': 'Возбуждение', 'en': 'Excitement'},
    {'id': 'love', 'ru': 'Любовь', 'en': 'Love'},
    {'id': 'confidence', 'ru': 'Уверенность', 'en': 'Confidence'},
  ];

  /// Вопросы для этапа 5 (жизненные сферы)
  static const List<Map<String, dynamic>> lifeDomainQuestions = [
    // Сферы жизни
    {
      'id': 'family',
      'type': 'domain',
      'ru': 'Семья и близкие отношения',
      'en': 'Family and close relationships',
    },
    {
      'id': 'career',
      'type': 'domain',
      'ru': 'Карьера и профессиональный рост',
      'en': 'Career and professional growth',
    },
    {
      'id': 'health',
      'type': 'domain',
      'ru': 'Здоровье и физическое состояние',
      'en': 'Health and physical condition',
    },
    {
      'id': 'leisure',
      'type': 'domain',
      'ru': 'Досуг и развлечения',
      'en': 'Leisure and entertainment',
    },
    {
      'id': 'personal_growth',
      'type': 'domain',
      'ru': 'Личностный рост и развитие',
      'en': 'Personal growth and development',
    },
    {
      'id': 'finances',
      'type': 'domain',
      'ru': 'Финансы и материальное благополучие',
      'en': 'Finances and material well-being',
    },
    // Ситуации
    {
      'id': 'success',
      'type': 'situation',
      'ru': 'Когда вы достигаете успеха',
      'en': 'When you achieve success',
    },
    {
      'id': 'conflict',
      'type': 'situation',
      'ru': 'В конфликтной ситуации',
      'en': 'In a conflict situation',
    },
    {
      'id': 'rest',
      'type': 'situation',
      'ru': 'Когда вы отдыхаете',
      'en': 'When you rest',
    },
    {
      'id': 'decision',
      'type': 'situation',
      'ru': 'При принятии важного решения',
      'en': 'When making an important decision',
    },
  ];

  /// Временные перспективы для этапа 6
  static const List<Map<String, String>> temporalPerspectives = [
    {'id': 'past', 'ru': 'Ваше прошлое', 'en': 'Your past'},
    {'id': 'present', 'ru': 'Ваше настоящее', 'en': 'Your present'},
    {'id': 'future', 'ru': 'Ваше будущее', 'en': 'Your future'},
    {'id': 'ideal_self', 'ru': 'Ваше идеальное "Я"', 'en': 'Your ideal self'},
    {'id': 'fear_self', 'ru': 'То, чем вы боитесь стать', 'en': 'What you fear becoming'},
  ];

  /// Психологические шкалы теста (расширенная версия - 12 шкал)
  static const List<ColorPsychologyScale> scales = [
    ColorPsychologyScale(
      id: 'energy_level',
      name: {'ru': 'Энергетический уровень', 'en': 'Energy Level'},
      description: {
        'ru': 'Активация, витальность, готовность к действию',
        'en': 'Activation, vitality, readiness for action',
      },
    ),
    ColorPsychologyScale(
      id: 'stress_level',
      name: {'ru': 'Уровень стресса', 'en': 'Stress Level'},
      description: {
        'ru': 'Напряжение, тревога, психологическое давление',
        'en': 'Tension, anxiety, psychological pressure',
      },
    ),
    ColorPsychologyScale(
      id: 'emotional_balance',
      name: {'ru': 'Эмоциональный баланс', 'en': 'Emotional Balance'},
      description: {
        'ru': 'Гармония, стабильность эмоционального состояния',
        'en': 'Harmony, stability of emotional state',
      },
    ),
    ColorPsychologyScale(
      id: 'openness',
      name: {'ru': 'Открытость', 'en': 'Openness'},
      description: {
        'ru': 'Готовность к контакту, общению, новому опыту',
        'en': 'Readiness for contact, communication, new experience',
      },
    ),
    ColorPsychologyScale(
      id: 'control_need',
      name: {'ru': 'Потребность в контроле', 'en': 'Need for Control'},
      description: {
        'ru': 'Стремление к порядку, рациональности, структуре',
        'en': 'Striving for order, rationality, structure',
      },
    ),
    ColorPsychologyScale(
      id: 'satisfaction',
      name: {'ru': 'Удовлетворённость', 'en': 'Satisfaction'},
      description: {
        'ru': 'Чувство удовлетворения жизнью, самореализация',
        'en': 'Sense of life satisfaction, self-realization',
      },
    ),
    ColorPsychologyScale(
      id: 'defensiveness',
      name: {'ru': 'Защитные механизмы', 'en': 'Defense Mechanisms'},
      description: {
        'ru': 'Активация психологических защит',
        'en': 'Activation of psychological defenses',
      },
    ),
    ColorPsychologyScale(
      id: 'need_for_change',
      name: {'ru': 'Потребность в изменениях', 'en': 'Need for Change'},
      description: {
        'ru': 'Желание перемен, неудовлетворённость текущим',
        'en': 'Desire for change, dissatisfaction with the current',
      },
    ),
    // 4 новые шкалы
    ColorPsychologyScale(
      id: 'optimism',
      name: {'ru': 'Оптимизм', 'en': 'Optimism'},
      description: {
        'ru': 'Позитивный взгляд на будущее, вера в лучшее',
        'en': 'Positive outlook on the future, belief in the better',
      },
    ),
    ColorPsychologyScale(
      id: 'social_connection',
      name: {'ru': 'Социальная связанность', 'en': 'Social Connection'},
      description: {
        'ru': 'Чувство связи с другими, социальная поддержка',
        'en': 'Feeling of connection with others, social support',
      },
    ),
    ColorPsychologyScale(
      id: 'self_esteem',
      name: {'ru': 'Самооценка', 'en': 'Self-Esteem'},
      description: {
        'ru': 'Уверенность в себе, самопринятие, самоценность',
        'en': 'Self-confidence, self-acceptance, self-worth',
      },
    ),
    ColorPsychologyScale(
      id: 'future_orientation',
      name: {'ru': 'Ориентация на будущее', 'en': 'Future Orientation'},
      description: {
        'ru': 'Планирование, целеустремлённость, видение перспектив',
        'en': 'Planning, goal-orientation, vision of perspectives',
      },
    ),
  ];

  /// Получить цвет по ID
  static ColorInfo? getColorById(String id) {
    try {
      return colors.firstWhere((color) => color.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Получить шкалу по ID
  static ColorPsychologyScale? getScaleById(String id) {
    try {
      return scales.firstWhere((scale) => scale.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Получить интерпретацию для уровня шкалы
  static Map<String, String> getScaleInterpretation(
    String scaleId,
    double value,
    String locale,
  ) {
    // Защита от NaN
    if (value.isNaN || value.isInfinite) {
      value = 0.0;
    }
    value = value.clamp(0.0, 100.0);

    final Map<String, Map<String, Map<String, String>>> interpretations = {
      'energy_level': {
        'very_low': {
          'ru': 'Критически низкая энергия. Вы находитесь в состоянии значительного истощения.',
          'en': 'Critically low energy. You are in a state of significant exhaustion.',
        },
        'low': {
          'ru': 'Низкая энергия. Вы чувствуете усталость и нуждаетесь в отдыхе.',
          'en': 'Low energy. You feel tired and need rest.',
        },
        'moderate': {
          'ru': 'Умеренная энергия. Ваш энергетический уровень в норме.',
          'en': 'Moderate energy. Your energy level is normal.',
        },
        'high': {
          'ru': 'Высокая энергия. У вас много сил и мотивации.',
          'en': 'High energy. You have a lot of strength and motivation.',
        },
        'very_high': {
          'ru': 'Очень высокая энергия. Ваша энергия на пике.',
          'en': 'Very high energy. Your energy is at its peak.',
        },
      },
      'stress_level': {
        'low': {
          'ru': 'Низкий стресс. Вы находитесь в спокойном состоянии.',
          'en': 'Low stress. You are in a calm state.',
        },
        'moderate': {
          'ru': 'Умеренный стресс. Некоторое напряжение, что нормально.',
          'en': 'Moderate stress. Some tension, which is normal.',
        },
        'high': {
          'ru': 'Высокий стресс. Вы находитесь под значительным напряжением.',
          'en': 'High stress. You are under significant pressure.',
        },
        'critical': {
          'ru': 'Критический стресс. Требуется немедленное внимание к вашему состоянию.',
          'en': 'Critical stress. Immediate attention to your condition is required.',
        },
      },
      // Добавить интерпретации для остальных шкал...
    };

    String level;
    if (scaleId == 'energy_level') {
      if (value <= 20) level = 'very_low';
      else if (value <= 40) level = 'low';
      else if (value <= 60) level = 'moderate';
      else if (value <= 80) level = 'high';
      else level = 'very_high';
    } else if (scaleId == 'stress_level') {
      if (value <= 25) level = 'low';
      else if (value <= 50) level = 'moderate';
      else if (value <= 75) level = 'high';
      else level = 'critical';
    } else {
      // Для остальных шкал
      if (value <= 40) level = 'low';
      else if (value <= 70) level = 'moderate';
      else level = 'high';
    }

    final scaleInterpretations = interpretations[scaleId];
    if (scaleInterpretations != null && scaleInterpretations[level] != null) {
      return {
        'label': level,
        'text': scaleInterpretations[level]![locale] ?? scaleInterpretations[level]!['ru']!,
      };
    }

    // Дефолтная интерпретация
    return {
      'label': level,
      'text': locale == 'en'
          ? 'Your score is ${value.toStringAsFixed(1)}%'
          : 'Ваш результат ${value.toStringAsFixed(1)}%',
    };
  }
}