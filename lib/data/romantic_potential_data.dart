import '../models/test_model.dart';

/// Data access class for Romantic Potential and Love Beliefs Test
/// Legacy Dart implementation (no JSON dependency)
///
/// Based on:
/// - Romantic Beliefs Theory
/// - Love Stories Scale (LSS)
/// - Attachment Psychology
class RomanticPotentialData {
  /// Get the complete Romantic Potential test
  static TestModel getRomanticPotentialTest() {
    return TestModel(
      id: 'romantic_potential_v1',
      title: {
        'ru': 'Романтические представления и потенциал',
        'en': 'Romantic Potential and Love Beliefs',
      },
      description: {
        'ru':
            'Этот тест оценивает три ключевых аспекта романтической сферы:\n\n'
            '• **Романтический потенциал** — ваша готовность к отношениям, способность создавать '
            'эмоциональную связь и открытость чувствам.\n\n'
            '• **Отношение к любви** — какие убеждения формируют вашу модель близости: '
            'рациональные, идеализированные, эмоциональные или динамичные.\n\n'
            '• **Романтические сценарии** — ваши внутренние истории о том, как должна выглядеть любовь: '
            'партнёрство, страсть, забота, драматизм, развитие или независимость.\n\n'
            'Понимание этих аспектов поможет найти более гармоничные отношения и осознать '
            'свои потребности в любви.',
        'en':
            'This test evaluates three key aspects of the romantic sphere:\n\n'
            '• **Romantic Potential** — your readiness for relationships, ability to create '
            'emotional connection and openness to feelings.\n\n'
            '• **Attitudes Toward Love** — what beliefs shape your model of intimacy: '
            'rational, idealized, emotional or dynamic.\n\n'
            '• **Romantic Stories** — your internal narratives about what love should look like: '
            'partnership, passion, care, drama, growth or independence.\n\n'
            'Understanding these aspects will help find more harmonious relationships '
            'and understand your needs in love.',
      },
      category: {
        'ru': 'Отношения',
        'en': 'Relationships',
      },
      categoryId: 'relationships',
      disclaimer: {
        'ru':
            'Этот тест основан на теории романтических убеждений и моделях романтических сценариев. '
            'Он предназначен для самопознания и не является психологическим диагнозом. '
            'Результаты помогут лучше понять ваши романтические модели и убеждения о любви.',
        'en':
            'This test is based on romantic beliefs theory and romantic stories models. '
            'It is for self-awareness and not a psychological diagnosis. '
            'Results will help you better understand your romantic patterns and beliefs about love.',
      },
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: [
        'romantic_potential',
        'love_attitudes',
        'love_stories',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'romantic_potential': {
        'ru': 'Романтический потенциал',
        'en': 'Romantic Potential',
      },
      'love_attitudes': {
        'ru': 'Отношение к любви',
        'en': 'Attitudes Toward Love',
      },
      'love_stories': {
        'ru': 'Романтические сценарии',
        'en': 'Romantic Stories',
      },
    };
  }

  /// Get factor interpretation based on percentage score
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Handle NaN or invalid percentage (ПРАВИЛО #5)
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }

    // Clamp percentage to 0-100 range
    percentage = percentage.clamp(0.0, 100.0);

    // Determine range: 0-44 (low), 45-74 (medium), 75-100 (high)
    final String level;
    if (percentage <= 44) {
      level = 'low';
    } else if (percentage <= 74) {
      level = 'medium';
    } else {
      level = 'high';
    }

    // Get interpretation for factor and level
    final interpretations = _getInterpretations();
    final factorInterpretations = interpretations[factorId];

    if (factorInterpretations == null) {
      return {
        'ru': 'Интерпретация недоступна',
        'en': 'Interpretation unavailable',
      };
    }

    final interpretation = factorInterpretations[level];
    if (interpretation == null) {
      return {
        'ru': 'Интерпретация недоступна',
        'en': 'Interpretation unavailable',
      };
    }

    return {
      'ru':
          '${interpretation['title_ru']}\n\n${interpretation['description_ru']}',
      'en':
          '${interpretation['title_en']}\n\n${interpretation['description_en']}',
    };
  }

  /// Profile model for 7-section result structure
  static RomanticProfile? getProfile(String profileId) {
    return profiles.firstWhere(
      (p) => p.id == profileId,
      orElse: () => profiles.firstWhere((p) => p.id == 'profile_mixed_romantic'),
    );
  }

  /// Determine profile based on average percentage across all factors
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_mixed_romantic';

    // Calculate average across all factors
    double total = 0;
    for (final value in percentages.values) {
      total += value;
    }
    final average = total / percentages.length;

    // Map average to profile
    if (average >= 75) {
      return 'profile_secure_romantic';
    } else if (average >= 45) {
      return 'profile_mixed_romantic';
    } else {
      return 'profile_romantic_challenges';
    }
  }

  /// All profiles with 7-section structure
  static final List<RomanticProfile> profiles = [
    // Profile 1: Secure Romantic (75-100%)
    RomanticProfile(
      id: 'profile_secure_romantic',
      name: {
        'ru': 'Зрелый романтический стиль',
        'en': 'Secure Romantic Style',
      },
      description: {
        'ru':
            'У вас сформирован стабильный и зрелый взгляд на отношения. Вы способны к глубокой близости, '
            'открыты чувствам, умеете вести диалог и при этом сохраняете уважение к границам. '
            'Ваши романтические сценарии поддерживают здоровую динамику отношений.',
        'en':
            'You have developed a stable and mature view of relationships. You are capable of deep intimacy, '
            'open to feelings, know how to communicate and maintain respect for boundaries. '
            'Your romantic scenarios support healthy relationship dynamics.',
      },
      characteristics: {
        'ru': [
          'Высокая готовность к отношениям и эмоциональная зрелость',
          'Гармоничный баланс между эмоциями и разумом',
          'Здоровые ожидания и реалистичные убеждения о любви',
          'Партнёрский сценарий любви с уважением к автономии',
          'Способность к глубокой эмоциональной близости без страха',
        ],
        'en': [
          'High readiness for relationships and emotional maturity',
          'Harmonious balance between emotions and reason',
          'Healthy expectations and realistic beliefs about love',
          'Partnership love scenario with respect for autonomy',
          'Ability for deep emotional intimacy without fear',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте развивать эмоциональный интеллект и навыки коммуникации',
          'Поддерживайте честный и открытый диалог с партнёром',
          'Укрепляйте ритуалы близости и совместные традиции',
          'Не бойтесь показывать уязвимость — это укрепляет связь',
          'Помогайте партнёру расти, оставаясь верным себе',
        ],
        'en': [
          'Continue developing emotional intelligence and communication skills',
          'Maintain honest and open dialogue with your partner',
          'Strengthen intimacy rituals and shared traditions',
          'Don\'t be afraid to show vulnerability — it strengthens the bond',
          'Help your partner grow while staying true to yourself',
        ],
      },
      suitableRoles: {
        'ru': [
          'Надёжный партнёр в долгосрочных отношениях',
          'Эмоциональная опора для близких',
          'Мудрый советчик в вопросах отношений',
          'Создатель гармоничной семейной атмосферы',
        ],
        'en': [
          'Reliable partner in long-term relationships',
          'Emotional support for loved ones',
          'Wise advisor on relationship matters',
          'Creator of harmonious family atmosphere',
        ],
      },
      tryToday: {
        'ru':
            'Напишите партнёру (или близкому человеку) сообщение с благодарностью за конкретный '
            'момент, когда вы почувствовали поддержку и близость.',
        'en':
            'Write your partner (or a close person) a message of gratitude for a specific '
            'moment when you felt support and closeness.',
      },
      inspiringMessage: {
        'ru':
            'Ваша способность любить зрело — это редкий дар. Продолжайте создавать пространство, '
            'где двое могут быть собой и расти вместе. Любовь — это не только чувства, '
            'но и ежедневный выбор быть рядом.',
        'en':
            'Your ability to love maturely is a rare gift. Keep creating a space '
            'where two people can be themselves and grow together. Love is not just feelings, '
            'but a daily choice to be there.',
      },
    ),

    // Profile 2: Mixed Romantic (45-74%)
    RomanticProfile(
      id: 'profile_mixed_romantic',
      name: {
        'ru': 'Смешанный романтический стиль',
        'en': 'Mixed Romantic Style',
      },
      description: {
        'ru':
            'Ваши взгляды на любовь разнообразны: вы стремитесь к близости, но временами сомневаетесь; '
            'цените партнёрство, но иногда поддаётесь драматичным моделям или идеализации. '
            'Это естественно — вы на этапе формирования собственных здоровых подходов к отношениям.',
        'en':
            'Your views on love are diverse: you strive for intimacy but sometimes doubt; '
            'you value partnership but sometimes give in to dramatic patterns or idealization. '
            'This is natural — you are in the process of forming your own healthy relationship approaches.',
      },
      characteristics: {
        'ru': [
          'Комбинация зрелых и идеализированных ожиданий от любви',
          'Иногда сложность в выражении чувств или уязвимости',
          'Потребность в эмоциональной предсказуемости и стабильности',
          'Сценарии любви варьируются от партнёрства до романтизации',
          'Способность к близости с периодическим страхом отвержения',
        ],
        'en': [
          'Combination of mature and idealized expectations from love',
          'Sometimes difficulty expressing feelings or vulnerability',
          'Need for emotional predictability and stability',
          'Love scenarios vary from partnership to romanticization',
          'Ability for intimacy with occasional fear of rejection',
        ],
      },
      recommendations: {
        'ru': [
          'Отслеживайте автоматические сценарии — какие истории о любви вы проигрываете?',
          'Учитесь выражать эмоции конструктивно, без драмы и подавления',
          'Фокусируйтесь на взаимности, а не на идеалах из фильмов',
          'Практикуйте принятие несовершенства — и своего, и партнёра',
          'Развивайте навыки эмоциональной регуляции',
        ],
        'en': [
          'Track automatic scenarios — what love stories are you playing?',
          'Learn to express emotions constructively, without drama or suppression',
          'Focus on reciprocity, not on ideals from movies',
          'Practice acceptance of imperfection — both yours and your partner\'s',
          'Develop emotional regulation skills',
        ],
      },
      suitableRoles: {
        'ru': [
          'Партнёр, готовый к совместному росту',
          'Человек, способный учиться на ошибках',
          'Романтик с потенциалом к зрелости',
          'Искатель гармонии в отношениях',
        ],
        'en': [
          'Partner ready for mutual growth',
          'Person capable of learning from mistakes',
          'Romantic with potential for maturity',
          'Seeker of harmony in relationships',
        ],
      },
      tryToday: {
        'ru':
            'Запишите три убеждения о любви, которые у вас есть. Для каждого спросите себя: '
            '"Это помогает или мешает моим отношениям?"',
        'en':
            'Write down three beliefs about love that you have. For each one ask yourself: '
            '"Does this help or hinder my relationships?"',
      },
      inspiringMessage: {
        'ru':
            'Смешанный стиль — это не недостаток, а этап роста. Вы уже осознаёте свои модели, '
            'а осознание — первый шаг к изменению. Каждые здоровые отношения начинаются '
            'с готовности быть честным с собой.',
        'en':
            'A mixed style is not a flaw, but a stage of growth. You are already aware of your patterns, '
            'and awareness is the first step to change. Every healthy relationship begins '
            'with the willingness to be honest with yourself.',
      },
    ),

    // Profile 3: Romantic Challenges (0-44%)
    RomanticProfile(
      id: 'profile_romantic_challenges',
      name: {
        'ru': 'Романтические трудности',
        'en': 'Romantic Challenges',
      },
      description: {
        'ru':
            'У вас могут существовать сложности с близостью, доверием, реалистичными ожиданиями '
            'или эмоциональной регуляцией в отношениях. Ваши романтические сценарии могут быть '
            'драматичными или завязанными на зависимость. Это не диагноз — это понимание того, где можно расти.',
        'en':
            'You may have difficulties with intimacy, trust, realistic expectations '
            'or emotional regulation in relationships. Your romantic scenarios may be '
            'dramatic or tied to dependency. This is not a diagnosis — it\'s understanding where you can grow.',
      },
      characteristics: {
        'ru': [
          'Стиль избегания близости или эмоциональной зависимости',
          'Тенденция к идеализации или драматизации любви',
          'Сложности с уязвимостью и открытостью',
          'Непоследовательные ожидания от партнёра',
          'Страх близости или страх одиночества',
        ],
        'en': [
          'Avoidant style or emotional dependency',
          'Tendency to idealize or dramatize love',
          'Difficulties with vulnerability and openness',
          'Inconsistent expectations from partner',
          'Fear of intimacy or fear of loneliness',
        ],
      },
      recommendations: {
        'ru': [
          'Исследуйте свои убеждения о любви — откуда они? Семья? Опыт?',
          'Учитесь безопасной коммуникации — говорите о потребностях без обвинений',
          'Работайте над доверием и эмоциональной открытостью постепенно',
          'Рассмотрите работу с психологом для глубинной проработки',
          'Начните с дружеских отношений как практики близости',
        ],
        'en': [
          'Explore your beliefs about love — where do they come from? Family? Experience?',
          'Learn safe communication — talk about needs without blaming',
          'Work on trust and emotional openness gradually',
          'Consider working with a psychologist for deep processing',
          'Start with friendships as practice for intimacy',
        ],
      },
      suitableRoles: {
        'ru': [
          'Человек на пути к самопознанию',
          'Исследователь собственных паттернов',
          'Тот, кто готов меняться ради любви',
          'Будущий мастер здоровых отношений',
        ],
        'en': [
          'Person on the path to self-discovery',
          'Explorer of own patterns',
          'One who is ready to change for love',
          'Future master of healthy relationships',
        ],
      },
      tryToday: {
        'ru':
            'Вспомните одни отношения (любые), которые закончились. Без осуждения запишите: '
            '"Что я делал(а) из страха? Что — из любви?"',
        'en':
            'Remember one relationship (any) that ended. Without judgment, write down: '
            '"What did I do out of fear? What — out of love?"',
      },
      inspiringMessage: {
        'ru':
            'Осознание трудностей — это уже половина пути. Каждый может научиться любить по-другому, '
            'если готов смотреть правде в глаза. Ваши прошлые модели не определяют будущее — '
            'вы можете написать новую историю о любви.',
        'en':
            'Recognizing difficulties is already half the journey. Anyone can learn to love differently '
            'if willing to face the truth. Your past patterns don\'t define the future — '
            'you can write a new story about love.',
      },
    ),
  ];

  /// Get all 36 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // ========================================
      // ROMANTIC POTENTIAL (RPT) - Questions 1-12
      // Reversed: 3, 6, 8, 11
      // ========================================

      // Q1 - romantic_potential
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Мне легко выражать чувства человеку, который мне нравится.',
          'en': 'I find it easy to express my feelings to someone I like.',
        },
        factorId: 'romantic_potential',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q2 - romantic_potential
      QuestionModel(
        id: 'q2',
        text: {
          'ru':
              'Я умею устанавливать эмоциональную близость без страха быть отвергнутым.',
          'en':
              'I can establish emotional intimacy without fear of being rejected.',
        },
        factorId: 'romantic_potential',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q3 - romantic_potential (REVERSED)
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Мне сложно доверять партнёру полностью.',
          'en': 'I find it difficult to fully trust my partner.',
        },
        factorId: 'romantic_potential',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q4 - romantic_potential
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я открыт(а) к новым отношениям и эмоциональному опыту.',
          'en': 'I am open to new relationships and emotional experiences.',
        },
        factorId: 'romantic_potential',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q5 - romantic_potential
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Я умею спокойно обсуждать свои потребности в отношениях.',
          'en': 'I can calmly discuss my needs in relationships.',
        },
        factorId: 'romantic_potential',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q6 - romantic_potential (REVERSED)
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Я часто избегаю разговоров о чувствах.',
          'en': 'I often avoid conversations about feelings.',
        },
        factorId: 'romantic_potential',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q7 - romantic_potential
      QuestionModel(
        id: 'q7',
        text: {
          'ru':
              'Я способен(на) поддерживать эмоциональную стабильность даже в сложные периоды.',
          'en':
              'I am able to maintain emotional stability even during difficult times.',
        },
        factorId: 'romantic_potential',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q8 - romantic_potential (REVERSED)
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Мне трудно начать отношения, даже если человек мне нравится.',
          'en':
              'I find it difficult to start a relationship, even if I like the person.',
        },
        factorId: 'romantic_potential',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q9 - romantic_potential
      QuestionModel(
        id: 'q9',
        text: {
          'ru':
              'Я умею проявлять заботу и внимательность по отношению к партнёру.',
          'en': 'I know how to show care and attention to my partner.',
        },
        factorId: 'romantic_potential',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q10 - romantic_potential
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я чувствую уверенность, когда строю отношения.',
          'en': 'I feel confident when building relationships.',
        },
        factorId: 'romantic_potential',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q11 - romantic_potential (REVERSED)
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'Иногда я закрываюсь, когда отношения становятся слишком близкими.',
          'en': 'Sometimes I shut down when relationships become too close.',
        },
        factorId: 'romantic_potential',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q12 - romantic_potential
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Мне нравится идея стабильных, долгосрочных отношений.',
          'en': 'I like the idea of stable, long-term relationships.',
        },
        factorId: 'romantic_potential',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // ========================================
      // LOVE ATTITUDES (AALS) - Questions 13-24
      // Reversed: 17, 18, 21, 23
      // ========================================

      // Q13 - love_attitudes
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Любовь — это прежде всего доверие и партнёрство.',
          'en': 'Love is primarily about trust and partnership.',
        },
        factorId: 'love_attitudes',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q14 - love_attitudes
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я верю, что истинная любовь всегда иррациональна.',
          'en': 'I believe that true love is always irrational.',
        },
        factorId: 'love_attitudes',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q15 - love_attitudes
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Любовь должна быть страстной, иначе это не любовь.',
          'en': 'Love should be passionate, otherwise it\'s not love.',
        },
        factorId: 'love_attitudes',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q16 - love_attitudes
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Любовь — это ежедневный выбор и работа.',
          'en': 'Love is a daily choice and work.',
        },
        factorId: 'love_attitudes',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q17 - love_attitudes (REVERSED)
      QuestionModel(
        id: 'q17',
        text: {
          'ru':
              'Я считаю, что любовь должна происходить естественно, без усилий.',
          'en': 'I believe that love should happen naturally, without effort.',
        },
        factorId: 'love_attitudes',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q18 - love_attitudes (REVERSED)
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Чем сильнее чувства, тем лучше отношения.',
          'en': 'The stronger the feelings, the better the relationship.',
        },
        factorId: 'love_attitudes',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q19 - love_attitudes
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Настоящая любовь исключает идеализацию партнёра.',
          'en': 'True love excludes idealization of the partner.',
        },
        factorId: 'love_attitudes',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q20 - love_attitudes
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Любовь — это гармония между эмоциями и разумом.',
          'en': 'Love is a harmony between emotions and reason.',
        },
        factorId: 'love_attitudes',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q21 - love_attitudes (REVERSED)
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Настоящая любовь всегда драматична.',
          'en': 'True love is always dramatic.',
        },
        factorId: 'love_attitudes',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q22 - love_attitudes
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Любовь — это пространство, где оба могут быть собой.',
          'en': 'Love is a space where both can be themselves.',
        },
        factorId: 'love_attitudes',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q23 - love_attitudes (REVERSED)
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Любовь требует полной эмоциональной зависимости.',
          'en': 'Love requires complete emotional dependency.',
        },
        factorId: 'love_attitudes',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q24 - love_attitudes
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Любовь — это свобода и взаимное уважение.',
          'en': 'Love is freedom and mutual respect.',
        },
        factorId: 'love_attitudes',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // ========================================
      // LOVE STORIES (LSS) - Questions 25-36
      // Reversed: 29, 31, 33, 35
      // ========================================

      // Q25 - love_stories
      QuestionModel(
        id: 'q25',
        text: {
          'ru':
              'Мне близка идея любви как партнёрства, где двое идут одной дорогой.',
          'en':
              'I relate to the idea of love as a partnership where two walk the same path.',
        },
        factorId: 'love_stories',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q26 - love_stories
      QuestionModel(
        id: 'q26',
        text: {
          'ru':
              'Для меня любовь — это история страсти и эмоциональной интенсивности.',
          'en':
              'For me, love is a story of passion and emotional intensity.',
        },
        factorId: 'love_stories',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q27 - love_stories
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Я воспринимаю любовь как заботу и постоянную поддержку.',
          'en': 'I perceive love as care and constant support.',
        },
        factorId: 'love_stories',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q28 - love_stories
      QuestionModel(
        id: 'q28',
        text: {
          'ru':
              'Любовь — это история личностного роста, где партнёры помогают друг другу развиваться.',
          'en':
              'Love is a story of personal growth where partners help each other develop.',
        },
        factorId: 'love_stories',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q29 - love_stories (REVERSED)
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Любовь — это борьба, преодоление и драматичные повороты.',
          'en': 'Love is struggle, overcoming and dramatic turns.',
        },
        factorId: 'love_stories',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q30 - love_stories
      QuestionModel(
        id: 'q30',
        text: {
          'ru':
              'Мне важно сохранять чувство свободы и автономии даже в любви.',
          'en':
              'It\'s important for me to maintain a sense of freedom and autonomy even in love.',
        },
        factorId: 'love_stories',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q31 - love_stories (REVERSED)
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Любовь — это когда партнёры полностью принадлежат друг другу.',
          'en': 'Love is when partners completely belong to each other.',
        },
        factorId: 'love_stories',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q32 - love_stories
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Любовь должна приносить ощущение спокойствия и надёжности.',
          'en': 'Love should bring a sense of calm and security.',
        },
        factorId: 'love_stories',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q33 - love_stories (REVERSED)
      QuestionModel(
        id: 'q33',
        text: {
          'ru':
              'Любовь — это поиск ярких переживаний и эмоциональных всплесков.',
          'en':
              'Love is the search for vivid experiences and emotional surges.',
        },
        factorId: 'love_stories',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q34 - love_stories
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'В здоровой любви партнёры могут оставаться самостоятельными.',
          'en': 'In healthy love, partners can remain independent.',
        },
        factorId: 'love_stories',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q35 - love_stories (REVERSED)
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Для меня любовь связана с глубокой эмоциональной зависимостью.',
          'en': 'For me, love is associated with deep emotional dependency.',
        },
        factorId: 'love_stories',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q36 - love_stories
      QuestionModel(
        id: 'q36',
        text: {
          'ru':
              'Любовь — это поддержка, развитие и уважение к индивидуальности партнёра.',
          'en':
              'Love is support, growth and respect for the partner\'s individuality.',
        },
        factorId: 'love_stories',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
    ];
  }

  /// Standard Likert scale answers (scores 0-4!)
  /// ПРАВИЛО #1: Scores ДОЛЖНЫ быть 0-4 (НЕ 1-5!)
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совсем не согласен(на)',
          'en': 'Strongly Disagree',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не согласен(на)',
          'en': 'Disagree',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Нейтрально',
          'en': 'Neutral',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Скорее согласен(на)',
          'en': 'Agree',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью согласен(на)',
          'en': 'Strongly Agree',
        },
        score: 4,
      ),
    ];
  }

  /// Get interpretations for all factors
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'romantic_potential': {
        'low': {
          'title_ru': 'Низкий романтический потенциал',
          'title_en': 'Low Romantic Potential',
          'description_ru':
              'Вам может быть сложно открываться в отношениях и устанавливать эмоциональную близость. '
              'Возможно, есть страх отвержения или негативный прошлый опыт. '
              'Рекомендуется работать над доверием и постепенно расширять зону комфорта в близости.',
          'description_en':
              'You may find it difficult to open up in relationships and establish emotional intimacy. '
              'There may be fear of rejection or negative past experiences. '
              'It\'s recommended to work on trust and gradually expand your comfort zone in intimacy.',
        },
        'medium': {
          'title_ru': 'Средний романтический потенциал',
          'title_en': 'Medium Romantic Potential',
          'description_ru':
              'Вы способны к близости, но иногда испытываете трудности с выражением чувств или доверием. '
              'Ваша готовность к отношениям зависит от обстоятельств и партнёра. '
              'Продолжайте развивать эмоциональную открытость и навыки коммуникации.',
          'description_en':
              'You are capable of intimacy but sometimes experience difficulties with expressing feelings or trust. '
              'Your readiness for relationships depends on circumstances and partner. '
              'Continue developing emotional openness and communication skills.',
        },
        'high': {
          'title_ru': 'Высокий романтический потенциал',
          'title_en': 'High Romantic Potential',
          'description_ru':
              'Вы готовы к глубоким отношениям и способны создавать прочную эмоциональную связь. '
              'Вам комфортно выражать чувства и устанавливать близость. '
              'Ваша открытость и зрелость — основа для гармоничных отношений.',
          'description_en':
              'You are ready for deep relationships and able to create strong emotional bonds. '
              'You are comfortable expressing feelings and establishing intimacy. '
              'Your openness and maturity are the foundation for harmonious relationships.',
        },
      },
      'love_attitudes': {
        'low': {
          'title_ru': 'Незрелые убеждения о любви',
          'title_en': 'Immature Love Beliefs',
          'description_ru':
              'Ваши убеждения о любви могут включать идеализацию, драматизацию или зависимость. '
              'Вы можете верить, что любовь должна быть постоянно страстной или что настоящая любовь не требует усилий. '
              'Рекомендуется пересмотреть романтические мифы и развить более реалистичный взгляд на отношения.',
          'description_en':
              'Your beliefs about love may include idealization, dramatization or dependency. '
              'You may believe that love should be constantly passionate or that true love requires no effort. '
              'It\'s recommended to reconsider romantic myths and develop a more realistic view of relationships.',
        },
        'medium': {
          'title_ru': 'Смешанные убеждения о любви',
          'title_en': 'Mixed Love Beliefs',
          'description_ru':
              'Ваши убеждения о любви сочетают зрелые и идеализированные представления. '
              'Вы понимаете, что отношения требуют работы, но иногда поддаётесь романтическим мифам. '
              'Продолжайте развивать осознанный подход к любви.',
          'description_en':
              'Your love beliefs combine mature and idealized notions. '
              'You understand that relationships require work, but sometimes give in to romantic myths. '
              'Continue developing a mindful approach to love.',
        },
        'high': {
          'title_ru': 'Зрелые убеждения о любви',
          'title_en': 'Mature Love Beliefs',
          'description_ru':
              'Ваши убеждения о любви реалистичны и здоровы. Вы понимаете, что любовь — '
              'это баланс эмоций и разума, требующий взаимного уважения и работы. '
              'Вы цените партнёрство и свободу, избегая драматизации и зависимости.',
          'description_en':
              'Your love beliefs are realistic and healthy. You understand that love is '
              'a balance of emotions and reason, requiring mutual respect and effort. '
              'You value partnership and freedom, avoiding dramatization and dependency.',
        },
      },
      'love_stories': {
        'low': {
          'title_ru': 'Деструктивные романтические сценарии',
          'title_en': 'Destructive Romantic Scenarios',
          'description_ru':
              'Ваши внутренние истории о любви могут включать драму, борьбу или зависимость. '
              'Вы можете искать интенсивные эмоции или полное слияние с партнёром. '
              'Рекомендуется переосмыслить, какую историю любви вы хотите проживать.',
          'description_en':
              'Your internal love stories may include drama, struggle or dependency. '
              'You may seek intense emotions or complete merger with your partner. '
              'It\'s recommended to reconsider what love story you want to live.',
        },
        'medium': {
          'title_ru': 'Переходные романтические сценарии',
          'title_en': 'Transitional Romantic Scenarios',
          'description_ru':
              'Ваши романтические сценарии включают как здоровые, так и потенциально проблемные элементы. '
              'Вы цените и партнёрство, и страсть, иногда склоняясь к драматизации. '
              'Осознанность поможет выбирать более здоровые истории.',
          'description_en':
              'Your romantic scenarios include both healthy and potentially problematic elements. '
              'You value both partnership and passion, sometimes leaning toward dramatization. '
              'Mindfulness will help you choose healthier stories.',
        },
        'high': {
          'title_ru': 'Здоровые романтические сценарии',
          'title_en': 'Healthy Romantic Scenarios',
          'description_ru':
              'Ваши романтические сценарии основаны на партнёрстве, взаимном росте и уважении автономии. '
              'Вы цените спокойствие и надёжность в отношениях, сохраняя свою индивидуальность. '
              'Эти истории создают основу для здоровых долгосрочных отношений.',
          'description_en':
              'Your romantic scenarios are based on partnership, mutual growth and respect for autonomy. '
              'You value calm and security in relationships while maintaining your individuality. '
              'These stories create the foundation for healthy long-term relationships.',
        },
      },
    };
  }
}

/// Model for romantic profile with 7-section structure
class RomanticProfile {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, List<String>> characteristics;
  final Map<String, List<String>> recommendations;
  final Map<String, List<String>> suitableRoles;
  final Map<String, String> tryToday;
  final Map<String, String> inspiringMessage;

  const RomanticProfile({
    required this.id,
    required this.name,
    required this.description,
    required this.characteristics,
    required this.recommendations,
    required this.suitableRoles,
    required this.tryToday,
    required this.inspiringMessage,
  });

  String getName(String lang) => name[lang] ?? name['en'] ?? '';
  String getDescription(String lang) => description[lang] ?? description['en'] ?? '';
  List<String> getCharacteristics(String lang) =>
      characteristics[lang] ?? characteristics['en'] ?? [];
  List<String> getRecommendations(String lang) =>
      recommendations[lang] ?? recommendations['en'] ?? [];
  List<String> getSuitableRoles(String lang) =>
      suitableRoles[lang] ?? suitableRoles['en'] ?? [];
  String getTryToday(String lang) => tryToday[lang] ?? tryToday['en'] ?? '';
  String getInspiringMessage(String lang) =>
      inspiringMessage[lang] ?? inspiringMessage['en'] ?? '';
}
