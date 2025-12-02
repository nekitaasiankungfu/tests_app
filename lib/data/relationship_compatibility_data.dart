import '../models/test_model.dart';

/// Data access class for Relationship Compatibility Test
/// Legacy Dart implementation (no JSON dependency)
///
/// 24 вопроса, 6 аспектов совместимости, 3 профиля
class RelationshipCompatibilityData {
  /// Список ID факторов в порядке
  static const List<String> factorOrder = [
    'emotional_connection',
    'communication_style',
    'values_alignment',
    'relationship_expectations',
    'conflict_management',
    'intimacy_and_romance',
  ];

  /// Get the complete Relationship Compatibility test
  static TestModel getRelationshipCompatibilityTest() {
    return TestModel(
      id: 'relationship_compatibility_v1',
      title: {
        'ru': 'Тест «Совместимость и идеальные отношения»',
        'en': 'Relationship Compatibility Test',
      },
      description: {
        'ru':
            'Этот тест помогает определить ваш индивидуальный стиль партнёрских отношений '
            'и выявляет ключевые аспекты совместимости с потенциальным или текущим партнёром. '
            'Он оценивает, насколько ваши эмоциональные потребности, стиль общения, ожидания, '
            'ценности и ролевые предпочтения совпадают с типичными моделями поведения в отношениях.\n\n'
            'Тест не даёт универсального рецепта любви, но помогает лучше понимать себя — '
            'свои сильные стороны, уязвимости и особенности, которые влияют на качество и гармонию отношений.\n\n'
            '**6 аспектов совместимости:**\n\n'
            '**1. ЭМОЦИОНАЛЬНАЯ БЛИЗОСТЬ** ❤️\n'
            '• Насколько важны доверие, открытость и поддержка\n'
            '• Эмоциональная стабильность в отношениях\n\n'
            '**2. СТИЛЬ ОБЩЕНИЯ** 💬\n'
            '• Как вы формулируете просьбы и реагируете на конфликты\n'
            '• Умение вести диалог\n\n'
            '**3. СОВПАДЕНИЕ ЦЕННОСТЕЙ** ⚖️\n'
            '• Важность общих жизненных приоритетов\n'
            '• Честность, ответственность, свобода, развитие\n\n'
            '**4. ОЖИДАНИЯ ОТ ОТНОШЕНИЙ** 🎯\n'
            '• Автономность vs поддержка\n'
            '• Динамика, романтика, предсказуемость\n\n'
            '**5. СТИЛЬ РЕШЕНИЯ КОНФЛИКТОВ** 🤝\n'
            '• Избегание, диалог, напор или компромисс\n'
            '• Реакция на напряжение\n\n'
            '**6. БЛИЗОСТЬ И РОМАНТИКА** 💕\n'
            '• Потребность в тактильности и романтических жестах\n'
            '• Чувственное взаимодействие',
        'en':
            'This test helps determine your individual partnership style '
            'and identifies key compatibility aspects with a potential or current partner. '
            'It evaluates how well your emotional needs, communication style, expectations, '
            'values and role preferences align with typical relationship behavior patterns.\n\n'
            'The test doesn\'t provide a universal recipe for love, but helps you better understand yourself — '
            'your strengths, vulnerabilities and characteristics that affect relationship quality and harmony.\n\n'
            '**6 compatibility aspects:**\n\n'
            '**1. EMOTIONAL CONNECTION** ❤️\n'
            '• How important trust, openness and support are\n'
            '• Emotional stability in relationships\n\n'
            '**2. COMMUNICATION STYLE** 💬\n'
            '• How you formulate requests and react to conflicts\n'
            '• Ability to maintain dialogue\n\n'
            '**3. VALUES ALIGNMENT** ⚖️\n'
            '• Importance of shared life priorities\n'
            '• Honesty, responsibility, freedom, growth\n\n'
            '**4. RELATIONSHIP EXPECTATIONS** 🎯\n'
            '• Autonomy vs support\n'
            '• Dynamics, romance, predictability\n\n'
            '**5. CONFLICT MANAGEMENT** 🤝\n'
            '• Avoidance, dialogue, pressure or compromise\n'
            '• Response to tension\n\n'
            '**6. INTIMACY AND ROMANCE** 💕\n'
            '• Need for touch and romantic gestures\n'
            '• Sensual interaction',
      },
      category: {
        'ru': 'Отношения',
        'en': 'Relationships',
      },
      categoryId: 'relationships',
      disclaimer: {
        'ru':
            'Этот тест основан на теории привязанности и моделях межличностного общения. '
            'Он предназначен для самопознания и улучшения отношений. Результаты показывают '
            'ваши предпочтения и не являются психологической диагностикой. Совместимость '
            'в отношениях зависит от многих факторов и может меняться со временем.',
        'en':
            'This test is based on attachment theory and interpersonal communication models. '
            'It is designed for self-discovery and relationship improvement. Results show '
            'your preferences and are not a psychological diagnosis. Relationship compatibility '
            'depends on many factors and may change over time.',
      },
      estimatedTime: 7,
      type: TestType.multiFactor,
      factorIds: factorOrder,
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'emotional_connection': {
        'ru': '❤️ Эмоциональная близость',
        'en': '❤️ Emotional Connection',
      },
      'communication_style': {
        'ru': '💬 Стиль общения',
        'en': '💬 Communication Style',
      },
      'values_alignment': {
        'ru': '⚖️ Совпадение ценностей',
        'en': '⚖️ Values Alignment',
      },
      'relationship_expectations': {
        'ru': '🎯 Ожидания от отношений',
        'en': '🎯 Relationship Expectations',
      },
      'conflict_management': {
        'ru': '🤝 Стиль решения конфликтов',
        'en': '🤝 Conflict Management',
      },
      'intimacy_and_romance': {
        'ru': '💕 Близость и романтика',
        'en': '💕 Intimacy & Romance',
      },
    };
  }

  /// Get factor interpretation based on percentage score
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Handle NaN or invalid percentage (RULE #5)
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }

    // Clamp percentage to 0-100 range
    percentage = percentage.clamp(0.0, 100.0);

    // Determine range: 0-44 (low), 45-74 (medium), 75-100 (high)
    final String level;
    if (percentage < 45) {
      level = 'low';
    } else if (percentage < 75) {
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
      'ru': '${interpretation['title_ru']}\n\n${interpretation['description_ru']}',
      'en': '${interpretation['title_en']}\n\n${interpretation['description_en']}',
    };
  }

  /// Get all 24 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // ===== EMOTIONAL CONNECTION (q1, q4, q7, q10) =====
      // Q1
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Мне важно чувствовать эмоциональную поддержку от партнёра.',
          'en': 'It is important for me to feel emotional support from my partner.',
        },
        factorId: 'emotional_connection',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q2 - communication_style
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Мне легко говорить о своих потребностях партнёру.',
          'en': 'It is easy for me to talk about my needs to my partner.',
        },
        factorId: 'communication_style',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q3 - values_alignment
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Наши ценности — ключевой элемент совместимости.',
          'en': 'Our values are a key element of compatibility.',
        },
        factorId: 'values_alignment',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q4 - emotional_connection
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я быстро привязываюсь к человеку, если чувствую тепло и заботу.',
          'en': 'I quickly become attached to a person if I feel warmth and care.',
        },
        factorId: 'emotional_connection',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q5 - communication_style
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'В конфликте я стараюсь объяснить, что чувствую и почему.',
          'en': 'In conflict, I try to explain what I feel and why.',
        },
        factorId: 'communication_style',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q6 - values_alignment
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Для гармонии важно совпадать во взглядах на семью, работу и будущее.',
          'en': 'For harmony, it is important to share views on family, work and future.',
        },
        factorId: 'values_alignment',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q7 - emotional_connection
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я чувствую себя ближе к человеку, когда он делится со мной переживаниями.',
          'en': 'I feel closer to a person when they share their experiences with me.',
        },
        factorId: 'emotional_connection',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q8 - communication_style (REVERSED)
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Мне сложно открыто говорить, что меня тревожит.',
          'en': 'It is difficult for me to openly say what worries me.',
        },
        factorId: 'communication_style',
        isReversed: true,
        answers: _getAgreementAnswers(),
      ),
      // Q9 - values_alignment
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Мне важно, чтобы партнёр разделял мои жизненные приоритеты.',
          'en': 'It is important for me that my partner shares my life priorities.',
        },
        factorId: 'values_alignment',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q10 - emotional_connection
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я стремлюсь поддерживать партнёра эмоционально даже в мелочах.',
          'en': 'I strive to support my partner emotionally even in small things.',
        },
        factorId: 'emotional_connection',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q11 - communication_style
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я умею слушать и не перебивать, даже если эмоции сильные.',
          'en': 'I can listen without interrupting, even when emotions are strong.',
        },
        factorId: 'communication_style',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q12 - values_alignment
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Ценности оказывают влияние на то, насколько я сближаюсь с человеком.',
          'en': 'Values influence how close I get to a person.',
        },
        factorId: 'values_alignment',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q13 - relationship_expectations
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я ожидаю, что партнёр будет инициативным в развитии отношений.',
          'en': 'I expect my partner to be proactive in developing the relationship.',
        },
        factorId: 'relationship_expectations',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q14 - relationship_expectations
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я предпочитаю отношения, где каждый сохраняет личное пространство.',
          'en': 'I prefer relationships where everyone maintains personal space.',
        },
        factorId: 'relationship_expectations',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q15 - relationship_expectations
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Мне важно, чтобы отношения развивались равномерно и предсказуемо.',
          'en': 'It is important to me that relationships develop evenly and predictably.',
        },
        factorId: 'relationship_expectations',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q16 - relationship_expectations
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я ожидаю много романтики и эмоциональных жестов в отношениях.',
          'en': 'I expect a lot of romance and emotional gestures in relationships.',
        },
        factorId: 'relationship_expectations',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q17 - conflict_management
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'В конфликте я стараюсь искать компромисс и спокойное обсуждение.',
          'en': 'In conflict, I try to find compromise and calm discussion.',
        },
        factorId: 'conflict_management',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q18 - conflict_management (REVERSED)
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Когда конфликт становится сильным, я предпочитаю отдалиться.',
          'en': 'When conflict becomes intense, I prefer to distance myself.',
        },
        factorId: 'conflict_management',
        isReversed: true,
        answers: _getAgreementAnswers(),
      ),
      // Q19 - conflict_management
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Во время разногласий мне важно быть услышанным.',
          'en': 'During disagreements, it is important for me to be heard.',
        },
        factorId: 'conflict_management',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q20 - conflict_management (REVERSED)
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я могу резко реагировать, если чувствую несправедливость.',
          'en': 'I can react sharply if I feel injustice.',
        },
        factorId: 'conflict_management',
        isReversed: true,
        answers: _getAgreementAnswers(),
      ),
      // Q21 - intimacy_and_romance
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Мне важна тактильность в отношениях (объятия, прикосновения, жесты).',
          'en': 'Tactility is important to me in relationships (hugs, touches, gestures).',
        },
        factorId: 'intimacy_and_romance',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q22 - intimacy_and_romance
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Романтические жесты помогают мне чувствовать связь с партнёром.',
          'en': 'Romantic gestures help me feel connected to my partner.',
        },
        factorId: 'intimacy_and_romance',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q23 - intimacy_and_romance
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я воспринимаю романтику как важную часть отношений.',
          'en': 'I perceive romance as an important part of relationships.',
        },
        factorId: 'intimacy_and_romance',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q24 - intimacy_and_romance
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я чувствую себя ближе к партнёру через совместные тёплые жесты.',
          'en': 'I feel closer to my partner through shared warm gestures.',
        },
        factorId: 'intimacy_and_romance',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
    ];
  }

  /// Get agreement-based answers (5-point Likert scale, scores 0-4)
  static List<AnswerModel> _getAgreementAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совершенно не согласен(на)',
          'en': 'Strongly disagree',
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
          'ru': 'Затрудняюсь ответить',
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
          'en': 'Strongly agree',
        },
        score: 4,
      ),
    ];
  }

  /// Get interpretations for all factors
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'emotional_connection': {
        'low': {
          'title_ru': 'Сдержанная эмоциональная связь',
          'title_en': 'Reserved Emotional Connection',
          'description_ru':
              'Вы предпочитаете более независимый стиль отношений и не нуждаетесь в постоянной эмоциональной поддержке. Это может быть связано с высокой самодостаточностью или предпочтением сохранять эмоциональную автономию.',
          'description_en':
              'You prefer a more independent relationship style and don\'t need constant emotional support. This may be related to high self-sufficiency or a preference for maintaining emotional autonomy.',
        },
        'medium': {
          'title_ru': 'Умеренная эмоциональная связь',
          'title_en': 'Moderate Emotional Connection',
          'description_ru':
              'Вы цените эмоциональную близость, но также способны сохранять здоровую дистанцию. Вам важен баланс между поддержкой и личным пространством.',
          'description_en':
              'You value emotional closeness but are also able to maintain healthy distance. Balance between support and personal space is important to you.',
        },
        'high': {
          'title_ru': 'Глубокая эмоциональная связь',
          'title_en': 'Deep Emotional Connection',
          'description_ru':
              'Эмоциональная близость является фундаментом ваших отношений. Вы стремитесь к глубокому пониманию, взаимной поддержке и открытости с партнёром.',
          'description_en':
              'Emotional closeness is the foundation of your relationships. You strive for deep understanding, mutual support and openness with your partner.',
        },
      },
      'communication_style': {
        'low': {
          'title_ru': 'Сдержанный стиль общения',
          'title_en': 'Reserved Communication Style',
          'description_ru':
              'Вам может быть сложно открыто выражать свои потребности и чувства. Развитие навыков коммуникации поможет улучшить взаимопонимание в отношениях.',
          'description_en':
              'You may find it difficult to openly express your needs and feelings. Developing communication skills will help improve mutual understanding in relationships.',
        },
        'medium': {
          'title_ru': 'Сбалансированный стиль общения',
          'title_en': 'Balanced Communication Style',
          'description_ru':
              'Вы способны выражать свои мысли и чувства, хотя иногда можете избегать сложных разговоров. В целом у вас хороший базис для конструктивного диалога.',
          'description_en':
              'You are able to express your thoughts and feelings, although you may sometimes avoid difficult conversations. Overall, you have a good foundation for constructive dialogue.',
        },
        'high': {
          'title_ru': 'Открытый стиль общения',
          'title_en': 'Open Communication Style',
          'description_ru':
              'Вы легко говорите о своих потребностях и умеете слушать партнёра. Открытая коммуникация — ваша сильная сторона в построении здоровых отношений.',
          'description_en':
              'You easily talk about your needs and can listen to your partner. Open communication is your strength in building healthy relationships.',
        },
      },
      'values_alignment': {
        'low': {
          'title_ru': 'Гибкий подход к ценностям',
          'title_en': 'Flexible Approach to Values',
          'description_ru':
              'Совпадение ценностей не является для вас ключевым фактором в отношениях. Вы более гибки в принятии различий и готовы к компромиссам.',
          'description_en':
              'Shared values are not a key factor for you in relationships. You are more flexible in accepting differences and ready for compromises.',
        },
        'medium': {
          'title_ru': 'Умеренная важность ценностей',
          'title_en': 'Moderate Importance of Values',
          'description_ru':
              'Вы цените некоторое совпадение в ключевых жизненных приоритетах, но также готовы принять различия в менее важных областях.',
          'description_en':
              'You value some alignment in key life priorities but are also ready to accept differences in less important areas.',
        },
        'high': {
          'title_ru': 'Высокая важность общих ценностей',
          'title_en': 'High Importance of Shared Values',
          'description_ru':
              'Для вас критически важно, чтобы партнёр разделял ваши жизненные приоритеты и взгляды. Это создаёт прочный фундамент для долгосрочных отношений.',
          'description_en':
              'It is critically important for you that your partner shares your life priorities and views. This creates a solid foundation for long-term relationships.',
        },
      },
      'relationship_expectations': {
        'low': {
          'title_ru': 'Минимальные ожидания',
          'title_en': 'Minimal Expectations',
          'description_ru':
              'У вас невысокие ожидания от партнёра в плане инициативы и романтики. Вы предпочитаете естественное развитие отношений без давления.',
          'description_en':
              'You have low expectations of your partner in terms of initiative and romance. You prefer natural relationship development without pressure.',
        },
        'medium': {
          'title_ru': 'Сбалансированные ожидания',
          'title_en': 'Balanced Expectations',
          'description_ru':
              'Ваши ожидания от отношений реалистичны и гибки. Вы цените как стабильность, так и спонтанность в отношениях.',
          'description_en':
              'Your relationship expectations are realistic and flexible. You value both stability and spontaneity in relationships.',
        },
        'high': {
          'title_ru': 'Высокие ожидания',
          'title_en': 'High Expectations',
          'description_ru':
              'Вы имеете чёткое представление о желаемых отношениях и ожидаете от партнёра активного участия в их развитии и поддержании романтики.',
          'description_en':
              'You have a clear vision of desired relationships and expect your partner to actively participate in developing and maintaining romance.',
        },
      },
      'conflict_management': {
        'low': {
          'title_ru': 'Избегание конфликтов',
          'title_en': 'Conflict Avoidance',
          'description_ru':
              'Вы склонны избегать конфликтов или реагировать на них эмоционально. Развитие навыков конструктивного разрешения разногласий поможет улучшить отношения.',
          'description_en':
              'You tend to avoid conflicts or react to them emotionally. Developing constructive conflict resolution skills will help improve relationships.',
        },
        'medium': {
          'title_ru': 'Умеренные навыки разрешения конфликтов',
          'title_en': 'Moderate Conflict Resolution Skills',
          'description_ru':
              'Вы способны справляться с разногласиями, хотя некоторые ситуации могут вызывать затруднения. В целом вы стремитесь к конструктивному диалогу.',
          'description_en':
              'You are able to handle disagreements, although some situations may cause difficulties. Overall, you strive for constructive dialogue.',
        },
        'high': {
          'title_ru': 'Зрелое разрешение конфликтов',
          'title_en': 'Mature Conflict Resolution',
          'description_ru':
              'Вы умеете находить компромисс и вести спокойный диалог даже в напряжённых ситуациях. Это важный навык для построения здоровых долгосрочных отношений.',
          'description_en':
              'You can find compromise and have calm dialogue even in tense situations. This is an important skill for building healthy long-term relationships.',
        },
      },
      'intimacy_and_romance': {
        'low': {
          'title_ru': 'Сдержанное отношение к романтике',
          'title_en': 'Reserved Approach to Romance',
          'description_ru':
              'Романтические жесты и физическая близость не являются для вас первостепенными в отношениях. Вы можете ценить другие формы проявления любви.',
          'description_en':
              'Romantic gestures and physical closeness are not primary for you in relationships. You may value other forms of expressing love.',
        },
        'medium': {
          'title_ru': 'Умеренная потребность в романтике',
          'title_en': 'Moderate Need for Romance',
          'description_ru':
              'Вы цените романтику и близость, но не нуждаетесь в них постоянно. Периодические проявления любви и нежности важны для вас.',
          'description_en':
              'You value romance and closeness but don\'t need them constantly. Periodic expressions of love and tenderness are important to you.',
        },
        'high': {
          'title_ru': 'Высокая потребность в близости',
          'title_en': 'High Need for Intimacy',
          'description_ru':
              'Романтика, тактильность и эмоциональные жесты играют центральную роль в ваших отношениях. Вы чувствуете себя любимым через физическую близость и романтические проявления.',
          'description_en':
              'Romance, tactility and emotional gestures play a central role in your relationships. You feel loved through physical closeness and romantic expressions.',
        },
      },
    };
  }

  // ============================================================================
  // ПРОФИЛИ СОВМЕСТИМОСТИ
  // ============================================================================

  /// Данные профилей совместимости
  static const Map<String, CompatibilityProfile> profiles = {
    'profile_perfect_match': CompatibilityProfile(
      id: 'profile_perfect_match',
      name: {
        'ru': 'Высокая совместимость',
        'en': 'High Compatibility',
      },
      description: {
        'ru':
            'Ваши потребности, стиль общения, ценности и ожидания в отношениях формируют '
            'основу для гармоничной, зрелой и насыщенной связи. Вы умеете создавать '
            'эмоциональную близость, поддерживать диалог и вкладываться в отношения. '
            'Такой тип совместимости позволяет строить устойчивые отношения, где оба '
            'партнёра чувствуют себя в безопасности.',
        'en':
            'Your needs, communication style, values and expectations in relationships form '
            'the basis for a harmonious, mature and fulfilling connection. You know how to create '
            'emotional closeness, maintain dialogue and invest in relationships. '
            'This type of compatibility allows you to build stable relationships where both '
            'partners feel safe.',
      },
      characteristics: {
        'ru': [
          'Гармоничный баланс чувств и логики',
          'Высокая эмоциональная осознанность',
          'Умение поддерживать и принимать поддержку',
          'Зрелый стиль решения конфликтов',
          'Открытость к диалогу и компромиссам',
        ],
        'en': [
          'Harmonious balance of feelings and logic',
          'High emotional awareness',
          'Ability to support and accept support',
          'Mature conflict resolution style',
          'Openness to dialogue and compromise',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте развивать открытый диалог с партнёром',
          'Укрепляйте совместные ритуалы и привычки',
          'Не забывайте про личные границы и взаимное уважение',
          'Поддерживайте эмоциональную близость через регулярные разговоры',
          'Празднуйте маленькие победы и достижения вместе',
        ],
        'en': [
          'Continue developing open dialogue with your partner',
          'Strengthen shared rituals and habits',
          'Don\'t forget about personal boundaries and mutual respect',
          'Maintain emotional closeness through regular conversations',
          'Celebrate small victories and achievements together',
        ],
      },
      suitableRoles: {
        'ru': [
          'Отношения с высоким уровнем доверия и взаимного вклада',
          'Долгосрочные партнёрства с глубокой эмоциональной связью',
          'Совместное планирование будущего и общие цели',
        ],
        'en': [
          'Relationships with high trust and mutual investment',
          'Long-term partnerships with deep emotional connection',
          'Joint future planning and shared goals',
        ],
      },
      tryToday: {
        'ru': 'Выразите благодарность партнёру за что-то конкретное, что он сделал для вас на этой неделе.',
        'en': 'Express gratitude to your partner for something specific they did for you this week.',
      },
      inspiringMessage: {
        'ru': 'Ваша способность строить глубокие и гармоничные отношения — это настоящий дар. Продолжайте ценить и развивать эту связь.',
        'en': 'Your ability to build deep and harmonious relationships is a true gift. Continue to cherish and develop this connection.',
      },
    ),
    'profile_good_potential': CompatibilityProfile(
      id: 'profile_good_potential',
      name: {
        'ru': 'Средний уровень совместимости',
        'en': 'Medium Compatibility Level',
      },
      description: {
        'ru':
            'У вас есть сильные стороны в построении отношений, но некоторые области '
            'могут требовать дополнительного внимания. Иногда ваши потребности могут '
            'расходиться, но при желании обеих сторон отношения способны стать '
            'глубокими и гармоничными.',
        'en':
            'You have strengths in building relationships, but some areas '
            'may require additional attention. Sometimes your needs may '
            'diverge, but with both parties\' willingness, relationships can become '
            'deep and harmonious.',
      },
      characteristics: {
        'ru': [
          'Готовность работать над отношениями',
          'Умение договариваться',
          'Желание понимать партнёра',
          'Способность к компромиссам',
          'Осознание зон роста в коммуникации',
        ],
        'en': [
          'Willingness to work on relationships',
          'Ability to negotiate',
          'Desire to understand partner',
          'Capacity for compromise',
          'Awareness of growth areas in communication',
        ],
      },
      recommendations: {
        'ru': [
          'Чаще проговаривайте ожидания друг от друга',
          'Учитесь регулировать эмоции в конфликте',
          'Проводите больше качественного времени вместе',
          'Практикуйте активное слушание без осуждения',
          'Обсуждайте различия в ценностях открыто и с уважением',
        ],
        'en': [
          'Discuss expectations of each other more often',
          'Learn to regulate emotions during conflict',
          'Spend more quality time together',
          'Practice active listening without judgment',
          'Discuss differences in values openly and respectfully',
        ],
      },
      suitableRoles: {
        'ru': [
          'Партнёрства с открытой коммуникацией и взаимным желанием развиваться',
          'Отношения, где оба готовы работать над собой',
          'Связи с потенциалом для углубления понимания',
        ],
        'en': [
          'Partnerships with open communication and mutual desire to grow',
          'Relationships where both are ready to work on themselves',
          'Connections with potential for deeper understanding',
        ],
      },
      tryToday: {
        'ru': 'Спросите партнёра: «Что я могу сделать, чтобы ты почувствовал(а) себя более любимым(ой)?»',
        'en': 'Ask your partner: "What can I do to make you feel more loved?"',
      },
      inspiringMessage: {
        'ru': 'Отношения — это не конечная точка, а путешествие. У вас есть всё необходимое, чтобы сделать его прекрасным.',
        'en': 'Relationships are not a destination but a journey. You have everything you need to make it beautiful.',
      },
    ),
    'profile_needs_alignment': CompatibilityProfile(
      id: 'profile_needs_alignment',
      name: {
        'ru': 'Низкий уровень совместимости',
        'en': 'Low Compatibility Level',
      },
      description: {
        'ru':
            'Ваши стили общения, ожидания или потребности в эмоциональной близости '
            'могут заметно отличаться. Это не значит, что отношения невозможны — '
            'но для стабильности потребуется много осознанности, терпения '
            'и готовности к изменениям.',
        'en':
            'Your communication styles, expectations or needs for emotional closeness '
            'may differ significantly. This doesn\'t mean relationships are impossible — '
            'but stability will require a lot of awareness, patience '
            'and willingness to change.',
      },
      characteristics: {
        'ru': [
          'Различия в скорости эмоционального сближения',
          'Сложности в диалоге или выражении чувств',
          'Разное видение будущего',
          'Потенциальные точки напряжения в ценностях',
          'Необходимость работы над коммуникацией',
        ],
        'en': [
          'Differences in emotional connection speed',
          'Difficulties in dialogue or expressing feelings',
          'Different vision of the future',
          'Potential tension points in values',
          'Need to work on communication',
        ],
      },
      recommendations: {
        'ru': [
          'Уточняйте ожидания друг друга регулярно, а не только в кризис',
          'Работайте над навыками ненасильственного общения',
          'Учитесь уважать индивидуальные различия',
          'Рассмотрите консультацию с семейным психологом',
          'Начните с малого: один откровенный разговор в неделю',
        ],
        'en': [
          'Clarify expectations of each other regularly, not just during crisis',
          'Work on nonviolent communication skills',
          'Learn to respect individual differences',
          'Consider consulting with a family psychologist',
          'Start small: one honest conversation per week',
        ],
      },
      suitableRoles: {
        'ru': [
          'Отношения, где партнёры готовы к серьёзной работе над взаимодействием',
          'Связи, требующие значительной адаптации и терпения',
          'Партнёрства с осознанным выбором в пользу развития',
        ],
        'en': [
          'Relationships where partners are ready for serious work on interaction',
          'Connections requiring significant adaptation and patience',
          'Partnerships with conscious choice for growth',
        ],
      },
      tryToday: {
        'ru': 'Запишите три качества партнёра, которые вы цените, и поделитесь этим списком с ним/ней.',
        'en': 'Write down three qualities of your partner that you appreciate and share this list with them.',
      },
      inspiringMessage: {
        'ru': 'Осознание зон роста — это уже первый шаг к изменениям. Каждый день даёт новую возможность стать ближе.',
        'en': 'Awareness of growth areas is already the first step towards change. Every day gives a new opportunity to become closer.',
      },
    ),
  };

  /// Определить профиль на основе процентов по шкалам
  /// Использует среднее значение по всем шкалам
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) {
      return 'profile_good_potential';
    }

    // Вычисляем среднее по всем шкалам
    double sum = 0;
    for (final value in percentages.values) {
      sum += value;
    }
    final average = sum / percentages.length;

    // Определяем профиль по среднему значению
    // 75-100%: High Compatibility
    // 45-74%: Medium Compatibility
    // 0-44%: Low Compatibility
    if (average >= 75) {
      return 'profile_perfect_match';
    } else if (average >= 45) {
      return 'profile_good_potential';
    } else {
      return 'profile_needs_alignment';
    }
  }

  /// Получить профиль по ID
  static CompatibilityProfile? getProfile(String profileId) {
    return profiles[profileId];
  }
}

/// Модель профиля совместимости
class CompatibilityProfile {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, List<String>> characteristics;
  final Map<String, List<String>> recommendations;
  final Map<String, List<String>> suitableRoles;
  final Map<String, String> tryToday;
  final Map<String, String> inspiringMessage;

  const CompatibilityProfile({
    required this.id,
    required this.name,
    required this.description,
    required this.characteristics,
    required this.recommendations,
    required this.suitableRoles,
    required this.tryToday,
    required this.inspiringMessage,
  });

  String getName(String languageCode) => name[languageCode] ?? name['ru'] ?? '';
  String getDescription(String languageCode) =>
      description[languageCode] ?? description['ru'] ?? '';
  List<String> getCharacteristics(String languageCode) =>
      characteristics[languageCode] ?? characteristics['ru'] ?? [];
  List<String> getRecommendations(String languageCode) =>
      recommendations[languageCode] ?? recommendations['ru'] ?? [];
  List<String> getSuitableRoles(String languageCode) =>
      suitableRoles[languageCode] ?? suitableRoles['ru'] ?? [];
  String getTryToday(String languageCode) =>
      tryToday[languageCode] ?? tryToday['ru'] ?? '';
  String getInspiringMessage(String languageCode) =>
      inspiringMessage[languageCode] ?? inspiringMessage['ru'] ?? '';
}
