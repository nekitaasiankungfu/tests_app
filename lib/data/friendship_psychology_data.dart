import '../models/test_model.dart';

/// Data access class for Friendship Psychology Test
/// Legacy Dart implementation (no JSON dependency)
///
/// 24 вопроса, 6 аспектов дружбы, 12 профилей дружбы
class FriendshipPsychologyData {
  /// Список ID факторов в порядке
  static const List<String> factorOrder = [
    'emotional_closeness',
    'communication_style',
    'trust_and_loyalty',
    'boundaries_and_space',
    'supportive_behavior',
    'friendship_expectations',
  ];

  /// Get the complete Friendship Psychology test
  static TestModel getFriendshipPsychologyTest() {
    return TestModel(
      id: 'friendship_psychology_v1',
      title: {
        'ru': 'Психология дружбы: глубина, стиль и потенциал',
        'en': 'Friendship Psychology: Depth, Style & Potential',
      },
      description: {
        'ru':
            'Этот тест исследует ключевые аспекты того, как вы строите дружбу: '
            'вашу способность формировать эмоциональную близость, стиль общения, '
            'уровень доверия, личные границы, поддерживающее поведение и ожидания '
            'от дружественных отношений.\n\n'
            'Он помогает понять, как вы создаёте и поддерживаете связи, какие '
            'сильные стороны проявляете и какие модели взаимодействия являются '
            'для вас естественными.\n\n'
            '**6 аспектов дружбы:**\n\n'
            '**1. ЭМОЦИОНАЛЬНАЯ БЛИЗОСТЬ** 💗\n'
            '• Способность открываться и делиться чувствами\n'
            '• Создание глубокой дружеской связи\n\n'
            '**2. СТИЛЬ ОБЩЕНИЯ** 💬\n'
            '• Как вы взаимодействуете с друзьями\n'
            '• Открытость, уверенность или сдержанность\n\n'
            '**3. ДОВЕРИЕ И НАДЁЖНОСТЬ** 🤝\n'
            '• Готовность доверять и соблюдать обещания\n'
            '• Надёжность как друг\n\n'
            '**4. ГРАНИЦЫ И ЛИЧНОЕ ПРОСТРАНСТВО** 🛡️\n'
            '• Уважение к границам других\n'
            '• Умение отстаивать свои\n\n'
            '**5. ПОДДЕРЖИВАЮЩЕЕ ПОВЕДЕНИЕ** 🌟\n'
            '• Активная помощь друзьям\n'
            '• Эмоциональная поддержка\n\n'
            '**6. ОЖИДАНИЯ ОТ ДРУЖБЫ** 🎯\n'
            '• Какие роли и потребности вы связываете с дружбой',
        'en':
            'This test explores key aspects of how you build friendships: '
            'your ability to form emotional closeness, communication style, '
            'level of trust, personal boundaries, supportive behavior, and expectations '
            'from friendships.\n\n'
            'It helps you understand how you create and maintain connections, what '
            'strengths you demonstrate, and what interaction patterns are natural '
            'for you.\n\n'
            '**6 friendship aspects:**\n\n'
            '**1. EMOTIONAL CLOSENESS** 💗\n'
            '• Ability to open up and share feelings\n'
            '• Creating deep friendship bonds\n\n'
            '**2. COMMUNICATION STYLE** 💬\n'
            '• How you interact with friends\n'
            '• Openness, confidence, or reserve\n\n'
            '**3. TRUST AND LOYALTY** 🤝\n'
            '• Willingness to trust and keep promises\n'
            '• Reliability as a friend\n\n'
            '**4. BOUNDARIES AND SPACE** 🛡️\n'
            '• Respecting others\' boundaries\n'
            '• Standing up for your own\n\n'
            '**5. SUPPORTIVE BEHAVIOR** 🌟\n'
            '• Actively helping friends\n'
            '• Emotional support\n\n'
            '**6. FRIENDSHIP EXPECTATIONS** 🎯\n'
            '• What roles and needs you associate with friendship',
      },
      category: {
        'ru': 'Отношения',
        'en': 'Relationships',
      },
      categoryId: 'relationships',
      disclaimer: {
        'ru':
            'Этот тест основан на модели межличностной близости и психологии привязанности. '
            'Он предназначен для самопознания. Результаты показывают '
            'ваши предпочтения и не являются психологической диагностикой.',
        'en':
            'This test is based on the interpersonal closeness model and attachment psychology. '
            'It is designed for self-discovery. Results show '
            'your preferences and are not a psychological diagnosis.',
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
      'emotional_closeness': {
        'ru': '💗 Эмоциональная близость',
        'en': '💗 Emotional Closeness',
      },
      'communication_style': {
        'ru': '💬 Стиль общения',
        'en': '💬 Communication Style',
      },
      'trust_and_loyalty': {
        'ru': '🤝 Доверие и надёжность',
        'en': '🤝 Trust & Loyalty',
      },
      'boundaries_and_space': {
        'ru': '🛡️ Границы и личное пространство',
        'en': '🛡️ Boundaries & Space',
      },
      'supportive_behavior': {
        'ru': '🌟 Поддерживающее поведение',
        'en': '🌟 Supportive Behavior',
      },
      'friendship_expectations': {
        'ru': '🎯 Ожидания от дружбы',
        'en': '🎯 Friendship Expectations',
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

    // Determine range: 0-39 (low), 40-69 (medium), 70-100 (high)
    final String level;
    if (percentage < 40) {
      level = 'low';
    } else if (percentage < 70) {
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
      // ===== EMOTIONAL CLOSENESS (q1, q4, q7, q10) =====
      // Q1
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Мне легко делиться переживаниями с близким другом.',
          'en': 'It is easy for me to share my feelings with a close friend.',
        },
        factorId: 'emotional_closeness',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q2 - communication_style
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Мне легко говорить о том, что мне нравится или не нравится в общении.',
          'en': 'It is easy for me to talk about what I like or dislike in communication.',
        },
        factorId: 'communication_style',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q3 - trust_and_loyalty
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Если я что-то пообещал другу, я обязательно выполню.',
          'en': 'If I promise something to a friend, I will definitely follow through.',
        },
        factorId: 'trust_and_loyalty',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q4 - emotional_closeness
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Когда у меня проблемы, я обычно рассказываю об этом друзьям.',
          'en': 'When I have problems, I usually tell my friends about them.',
        },
        factorId: 'emotional_closeness',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q5 - communication_style
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'В конфликте я стараюсь объяснить свою позицию спокойно.',
          'en': 'In a conflict, I try to explain my position calmly.',
        },
        factorId: 'communication_style',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q6 - trust_and_loyalty
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Я считаю, что дружба невозможна без полного доверия.',
          'en': 'I believe that friendship is impossible without complete trust.',
        },
        factorId: 'trust_and_loyalty',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q7 - emotional_closeness (REVERSED)
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Мне сложно эмоционально сблизиться с кем-либо.',
          'en': 'It is difficult for me to emotionally connect with anyone.',
        },
        factorId: 'emotional_closeness',
        isReversed: true,
        answers: _getAgreementAnswers(),
      ),
      // Q8 - communication_style (REVERSED)
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Мне трудно говорить о том, что меня задевает.',
          'en': 'It is difficult for me to talk about what hurts me.',
        },
        factorId: 'communication_style',
        isReversed: true,
        answers: _getAgreementAnswers(),
      ),
      // Q9 - trust_and_loyalty (REVERSED)
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Мне трудно полностью довериться даже близкому другу.',
          'en': 'It is difficult for me to fully trust even a close friend.',
        },
        factorId: 'trust_and_loyalty',
        isReversed: true,
        answers: _getAgreementAnswers(),
      ),
      // Q10 - emotional_closeness
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я ценю глубокие разговоры и эмоциональную поддержку в дружбе.',
          'en': 'I value deep conversations and emotional support in friendship.',
        },
        factorId: 'emotional_closeness',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q11 - communication_style
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я умею слушать и понимать чувства другого человека.',
          'en': 'I know how to listen and understand another person\'s feelings.',
        },
        factorId: 'communication_style',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q12 - trust_and_loyalty
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Я могу положиться на друзей, и они — на меня.',
          'en': 'I can rely on my friends, and they can rely on me.',
        },
        factorId: 'trust_and_loyalty',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q13 - boundaries_and_space
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Мне важно, чтобы друзья уважали моё личное пространство.',
          'en': 'It is important for me that friends respect my personal space.',
        },
        factorId: 'boundaries_and_space',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q14 - boundaries_and_space
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я стараюсь уважать границы других людей.',
          'en': 'I try to respect other people\'s boundaries.',
        },
        factorId: 'boundaries_and_space',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q15 - boundaries_and_space (REVERSED)
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Когда друг слишком навязчив, мне сложно об этом сказать.',
          'en': 'When a friend is too pushy, it is difficult for me to say so.',
        },
        factorId: 'boundaries_and_space',
        isReversed: true,
        answers: _getAgreementAnswers(),
      ),
      // Q16 - boundaries_and_space
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'В дружбе важно сохранять баланс близости и автономии.',
          'en': 'In friendship, it is important to maintain a balance of closeness and autonomy.',
        },
        factorId: 'boundaries_and_space',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q17 - supportive_behavior
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я стараюсь поддерживать друзей в трудные моменты.',
          'en': 'I try to support my friends during difficult times.',
        },
        factorId: 'supportive_behavior',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q18 - supportive_behavior
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Когда у друга проблемы, я стараюсь помочь, насколько могу.',
          'en': 'When a friend has problems, I try to help as much as I can.',
        },
        factorId: 'supportive_behavior',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q19 - supportive_behavior (REVERSED)
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Я редко проявляю инициативу, чтобы поддержать друга.',
          'en': 'I rarely take initiative to support a friend.',
        },
        factorId: 'supportive_behavior',
        isReversed: true,
        answers: _getAgreementAnswers(),
      ),
      // Q20 - supportive_behavior
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я умею заметить, когда другу нужна помощь, даже если он об этом не говорит.',
          'en': 'I can notice when a friend needs help, even if they don\'t say it.',
        },
        factorId: 'supportive_behavior',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q21 - friendship_expectations
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я ожидаю, что друзья будут рядом, когда мне плохо.',
          'en': 'I expect friends to be there when I feel bad.',
        },
        factorId: 'friendship_expectations',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q22 - friendship_expectations
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Мне важно, чтобы друг уважал мои приоритеты и цели.',
          'en': 'It is important for me that a friend respects my priorities and goals.',
        },
        factorId: 'friendship_expectations',
        isReversed: false,
        answers: _getAgreementAnswers(),
      ),
      // Q23 - friendship_expectations (REVERSED)
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я считаю, что друзья должны общаться каждый день.',
          'en': 'I believe that friends should communicate every day.',
        },
        factorId: 'friendship_expectations',
        isReversed: true,
        answers: _getAgreementAnswers(),
      ),
      // Q24 - friendship_expectations
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Для меня дружба — это взаимность, а не обязанность.',
          'en': 'For me, friendship is about reciprocity, not obligation.',
        },
        factorId: 'friendship_expectations',
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
      'emotional_closeness': {
        'low': {
          'title_ru': 'Сдержанная эмоциональная близость',
          'title_en': 'Reserved Emotional Closeness',
          'description_ru':
              'Вам может быть сложно открываться и делиться переживаниями с друзьями. Это не плохо — возможно, вы предпочитаете более независимый стиль дружбы или вам нужно больше времени для сближения.',
          'description_en':
              'You may find it difficult to open up and share your experiences with friends. This is not bad — you may prefer a more independent friendship style or need more time to get closer.',
        },
        'medium': {
          'title_ru': 'Умеренная эмоциональная близость',
          'title_en': 'Moderate Emotional Closeness',
          'description_ru':
              'Вы способны создавать эмоциональные связи, но делаете это избирательно. Вам важно чувствовать безопасность, прежде чем открываться.',
          'description_en':
              'You are able to create emotional connections but do so selectively. It is important for you to feel safe before opening up.',
        },
        'high': {
          'title_ru': 'Глубокая эмоциональная близость',
          'title_en': 'Deep Emotional Closeness',
          'description_ru':
              'Вы легко создаёте глубокие эмоциональные связи с друзьями. Открытость и искренность — ваши сильные стороны в дружбе.',
          'description_en':
              'You easily create deep emotional connections with friends. Openness and sincerity are your strengths in friendship.',
        },
      },
      'communication_style': {
        'low': {
          'title_ru': 'Сдержанный стиль общения',
          'title_en': 'Reserved Communication Style',
          'description_ru':
              'Вам может быть сложно выражать свои мысли и чувства в общении с друзьями. Развитие навыков коммуникации поможет укрепить дружеские связи.',
          'description_en':
              'You may find it difficult to express your thoughts and feelings when communicating with friends. Developing communication skills will help strengthen friendships.',
        },
        'medium': {
          'title_ru': 'Сбалансированный стиль общения',
          'title_en': 'Balanced Communication Style',
          'description_ru':
              'Вы способны выражать свои мысли, хотя иногда можете избегать сложных разговоров. У вас хороший базис для конструктивного диалога.',
          'description_en':
              'You are able to express your thoughts, although you may sometimes avoid difficult conversations. You have a good foundation for constructive dialogue.',
        },
        'high': {
          'title_ru': 'Открытый стиль общения',
          'title_en': 'Open Communication Style',
          'description_ru':
              'Вы легко говорите о своих чувствах и умеете слушать друзей. Открытая коммуникация — ваша сильная сторона.',
          'description_en':
              'You easily talk about your feelings and know how to listen to friends. Open communication is your strength.',
        },
      },
      'trust_and_loyalty': {
        'low': {
          'title_ru': 'Осторожность в доверии',
          'title_en': 'Caution in Trust',
          'description_ru':
              'Вам сложно полностью доверять даже близким друзьям. Это может быть связано с прошлым опытом. Постепенное развитие доверия поможет укрепить дружбу.',
          'description_en':
              'You find it difficult to fully trust even close friends. This may be related to past experiences. Gradually developing trust will help strengthen friendships.',
        },
        'medium': {
          'title_ru': 'Умеренное доверие',
          'title_en': 'Moderate Trust',
          'description_ru':
              'Вы доверяете друзьям, но с определённой долей осторожности. Вы надёжный друг, который выполняет обещания.',
          'description_en':
              'You trust friends but with a certain amount of caution. You are a reliable friend who keeps promises.',
        },
        'high': {
          'title_ru': 'Высокое доверие и надёжность',
          'title_en': 'High Trust and Reliability',
          'description_ru':
              'Доверие — фундамент вашей дружбы. Вы надёжный друг, на которого можно положиться, и ожидаете того же от других.',
          'description_en':
              'Trust is the foundation of your friendship. You are a reliable friend who can be counted on, and you expect the same from others.',
        },
      },
      'boundaries_and_space': {
        'low': {
          'title_ru': 'Размытые границы',
          'title_en': 'Blurred Boundaries',
          'description_ru':
              'Вам может быть сложно отстаивать свои границы или говорить, когда что-то не подходит. Развитие навыков установления границ поможет в дружбе.',
          'description_en':
              'You may find it difficult to assert your boundaries or say when something doesn\'t suit you. Developing boundary-setting skills will help in friendships.',
        },
        'medium': {
          'title_ru': 'Сбалансированные границы',
          'title_en': 'Balanced Boundaries',
          'description_ru':
              'Вы уважаете границы других и способны отстаивать свои, хотя иногда это даётся с трудом.',
          'description_en':
              'You respect others\' boundaries and are able to assert your own, although sometimes it is difficult.',
        },
        'high': {
          'title_ru': 'Здоровые границы',
          'title_en': 'Healthy Boundaries',
          'description_ru':
              'Вы умеете поддерживать баланс близости и автономии в дружбе. Уважение к личному пространству — ваша сильная сторона.',
          'description_en':
              'You know how to maintain a balance of closeness and autonomy in friendship. Respect for personal space is your strength.',
        },
      },
      'supportive_behavior': {
        'low': {
          'title_ru': 'Сдержанная поддержка',
          'title_en': 'Reserved Support',
          'description_ru':
              'Вы не всегда проявляете инициативу в поддержке друзей. Это может быть связано с неуверенностью или предпочтением не вмешиваться.',
          'description_en':
              'You don\'t always take initiative in supporting friends. This may be due to uncertainty or preference not to interfere.',
        },
        'medium': {
          'title_ru': 'Умеренная поддержка',
          'title_en': 'Moderate Support',
          'description_ru':
              'Вы готовы поддержать друзей, когда они просят или когда ситуация очевидна. Вы внимательны к близким.',
          'description_en':
              'You are ready to support friends when they ask or when the situation is obvious. You are attentive to loved ones.',
        },
        'high': {
          'title_ru': 'Активная поддержка',
          'title_en': 'Active Support',
          'description_ru':
              'Вы активно поддерживаете друзей и умеете замечать, когда им нужна помощь. Забота о близких — ваша сильная сторона.',
          'description_en':
              'You actively support friends and know how to notice when they need help. Caring for loved ones is your strength.',
        },
      },
      'friendship_expectations': {
        'low': {
          'title_ru': 'Минимальные ожидания',
          'title_en': 'Minimal Expectations',
          'description_ru':
              'У вас невысокие ожидания от друзей. Вы предпочитаете естественное развитие дружбы без давления.',
          'description_en':
              'You have low expectations of friends. You prefer natural friendship development without pressure.',
        },
        'medium': {
          'title_ru': 'Сбалансированные ожидания',
          'title_en': 'Balanced Expectations',
          'description_ru':
              'Ваши ожидания от дружбы реалистичны. Вы понимаете, что дружба — это взаимность и гибкость.',
          'description_en':
              'Your friendship expectations are realistic. You understand that friendship is about reciprocity and flexibility.',
        },
        'high': {
          'title_ru': 'Высокие ожидания',
          'title_en': 'High Expectations',
          'description_ru':
              'У вас чёткое представление о том, какой должна быть дружба. Важно помнить, что люди разные, и ожидания могут не совпадать.',
          'description_en':
              'You have a clear idea of what friendship should be. Remember that people are different, and expectations may not always match.',
        },
      },
    };
  }

  // ============================================================================
  // ПРОФИЛИ ДРУЖБЫ (12 профилей из документации)
  // ============================================================================

  /// Данные профилей дружбы
  static const Map<String, FriendshipProfile> profiles = {
    'warm_empathic_friend': FriendshipProfile(
      id: 'warm_empathic_friend',
      name: {
        'ru': 'Тёплый эмпатичный друг',
        'en': 'Warm Empathic Friend',
      },
      description: {
        'ru': 'Вы создаёте атмосферу доверия и принятия. Друзья чувствуют себя рядом с вами в безопасности.',
        'en': 'You create an atmosphere of trust and acceptance. Friends feel safe around you.',
      },
      characteristics: {
        'ru': [
          'Высокая эмпатия — вы чувствуете эмоции других',
          'Способность поддержать в трудный момент',
          'Глубокая эмоциональная связь с близкими',
          'Умение слушать без осуждения',
          'Создание тёплой и безопасной атмосферы',
        ],
        'en': [
          'High empathy — you feel others\' emotions',
          'Ability to support in difficult times',
          'Deep emotional connection with loved ones',
          'Ability to listen without judgment',
          'Creating a warm and safe atmosphere',
        ],
      },
      recommendations: {
        'ru': [
          'Укрепляйте личные границы, чтобы не перегружаться',
          'Уделяйте время себе и своим потребностям',
          'Учитесь говорить «нет» когда это необходимо',
          'Следите за своим эмоциональным состоянием',
          'Не забывайте просить о поддержке сами',
        ],
        'en': [
          'Strengthen personal boundaries to avoid overload',
          'Make time for yourself and your needs',
          'Learn to say "no" when necessary',
          'Monitor your emotional state',
          'Don\'t forget to ask for support yourself',
        ],
      },
      suitableRoles: {
        'ru': [
          'Эмоциональная опора в группе друзей',
          'Человек, к которому обращаются за советом',
          'Медиатор в конфликтах',
        ],
        'en': [
          'Emotional support in a friend group',
          'Person people turn to for advice',
          'Mediator in conflicts',
        ],
      },
      tryToday: {
        'ru': 'Спросите друга, как он себя чувствует, и просто выслушайте.',
        'en': 'Ask a friend how they feel and just listen.',
      },
      inspiringMessage: {
        'ru': 'Ваша способность создавать глубокие связи — это дар. Берегите свою энергию, делясь ею с другими.',
        'en': 'Your ability to create deep connections is a gift. Take care of your energy while sharing it with others.',
      },
      vulnerabilities: {
        'ru': ['Склонность к выгоранию', 'Перегрузка эмоциональными обязанностями'],
        'en': ['Tendency to burnout', 'Emotional responsibility overload'],
      },
    ),
    'reliable_stable_friend': FriendshipProfile(
      id: 'reliable_stable_friend',
      name: {
        'ru': 'Надёжный стабильный друг',
        'en': 'Reliable Stable Friend',
      },
      description: {
        'ru': 'Вы создаёте чувство устойчивости в отношениях. На вас можно положиться в любой ситуации.',
        'en': 'You create a sense of stability in relationships. You can be relied upon in any situation.',
      },
      characteristics: {
        'ru': [
          'Высокая ответственность и надёжность',
          'Предсказуемость и стабильность',
          'Честность и прямота',
          'Выполнение обещаний',
          'Постоянство в дружбе',
        ],
        'en': [
          'High responsibility and reliability',
          'Predictability and stability',
          'Honesty and directness',
          'Keeping promises',
          'Consistency in friendship',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте эмоциональную открытость',
          'Делитесь своими чувствами чаще',
          'Позволяйте себе быть уязвимым',
          'Не бойтесь спонтанности',
        ],
        'en': [
          'Practice emotional openness',
          'Share your feelings more often',
          'Allow yourself to be vulnerable',
          'Don\'t be afraid of spontaneity',
        ],
      },
      suitableRoles: {
        'ru': [
          'Опора и якорь в группе друзей',
          'Человек, которому доверяют секреты',
          'Надёжный партнёр в совместных делах',
        ],
        'en': [
          'Support and anchor in friend group',
          'Person trusted with secrets',
          'Reliable partner in joint activities',
        ],
      },
      tryToday: {
        'ru': 'Расскажите другу о чём-то личном, чем обычно не делитесь.',
        'en': 'Tell a friend something personal that you usually don\'t share.',
      },
      inspiringMessage: {
        'ru': 'Ваша надёжность — это фундамент крепкой дружбы. Добавьте немного эмоциональной открытости.',
        'en': 'Your reliability is the foundation of strong friendship. Add some emotional openness.',
      },
      vulnerabilities: {
        'ru': ['Трудности в выражении чувств'],
        'en': ['Difficulties expressing feelings'],
      },
    ),
    'communication_bridge': FriendshipProfile(
      id: 'communication_bridge',
      name: {
        'ru': 'Коммуникационный мост',
        'en': 'Communication Bridge',
      },
      description: {
        'ru': 'Вы умеете договариваться и помогаете другим общаться. Вы — связующее звено.',
        'en': 'You know how to negotiate and help others communicate. You are the connecting link.',
      },
      characteristics: {
        'ru': [
          'Дипломатичность и такт',
          'Активное слушание',
          'Гибкость в общении',
          'Способность видеть разные точки зрения',
          'Умение разрешать конфликты',
        ],
        'en': [
          'Diplomacy and tact',
          'Active listening',
          'Flexibility in communication',
          'Ability to see different viewpoints',
          'Conflict resolution skills',
        ],
      },
      recommendations: {
        'ru': [
          'Отражайте свои чувства, а не только чужие',
          'Не забывайте о собственных потребностях',
          'Иногда позволяйте другим решать свои проблемы',
          'Выражайте своё мнение чаще',
        ],
        'en': [
          'Reflect your own feelings, not just others\'',
          'Don\'t forget about your own needs',
          'Sometimes let others solve their own problems',
          'Express your opinion more often',
        ],
      },
      suitableRoles: {
        'ru': [
          'Посредник между друзьями',
          'Организатор общения в группе',
          'Голос разума в конфликтах',
        ],
        'en': [
          'Mediator between friends',
          'Communication organizer in the group',
          'Voice of reason in conflicts',
        ],
      },
      tryToday: {
        'ru': 'Выскажите своё мнение, даже если оно отличается от мнения группы.',
        'en': 'Express your opinion, even if it differs from the group\'s.',
      },
      inspiringMessage: {
        'ru': 'Ваша способность соединять людей бесценна. Не забывайте соединяться и с собой.',
        'en': 'Your ability to connect people is priceless. Don\'t forget to connect with yourself too.',
      },
      vulnerabilities: {
        'ru': ['Избегание собственных эмоций'],
        'en': ['Avoiding own emotions'],
      },
    ),
    'motivator_inspirer': FriendshipProfile(
      id: 'motivator_inspirer',
      name: {
        'ru': 'Заряженный вдохновитель',
        'en': 'Energizing Inspirer',
      },
      description: {
        'ru': 'С вами дружба наполнена энергией и движением. Вы вдохновляете на новое.',
        'en': 'With you, friendship is filled with energy and movement. You inspire new things.',
      },
      characteristics: {
        'ru': [
          'Креативность и идейность',
          'Высокая энергия',
          'Способность мотивировать других',
          'Оптимизм и энтузиазм',
          'Любовь к приключениям',
        ],
        'en': [
          'Creativity and ideas',
          'High energy',
          'Ability to motivate others',
          'Optimism and enthusiasm',
          'Love for adventure',
        ],
      },
      recommendations: {
        'ru': [
          'Тренируйте стабильность и постоянство',
          'Учитесь быть рядом в тихие моменты',
          'Развивайте глубину в отношениях',
          'Не забывайте о долгосрочных обязательствах',
        ],
        'en': [
          'Train stability and consistency',
          'Learn to be present in quiet moments',
          'Develop depth in relationships',
          'Don\'t forget about long-term commitments',
        ],
      },
      suitableRoles: {
        'ru': [
          'Генератор идей в компании',
          'Организатор приключений',
          'Источник позитива',
        ],
        'en': [
          'Idea generator in the group',
          'Adventure organizer',
          'Source of positivity',
        ],
      },
      tryToday: {
        'ru': 'Позвоните другу и просто поболтайте, без планов и идей.',
        'en': 'Call a friend and just chat, without plans or ideas.',
      },
      inspiringMessage: {
        'ru': 'Ваша энергия заразительна! Добавьте немного стабильности, и дружба станет ещё крепче.',
        'en': 'Your energy is contagious! Add some stability and friendships will become even stronger.',
      },
      vulnerabilities: {
        'ru': ['Непостоянство'],
        'en': ['Inconsistency'],
      },
    ),
    'philosophical_deep_friend': FriendshipProfile(
      id: 'philosophical_deep_friend',
      name: {
        'ru': 'Глубокий философский друг',
        'en': 'Deep Philosophical Friend',
      },
      description: {
        'ru': 'Вы создаёте интеллектуальную и мудрую атмосферу общения.',
        'en': 'You create an intellectual and wise atmosphere of communication.',
      },
      characteristics: {
        'ru': [
          'Рефлексия и самоанализ',
          'Мудрость и глубина мысли',
          'Интерес к смыслам и значениям',
          'Способность видеть суть вещей',
          'Ценность качества над количеством',
        ],
        'en': [
          'Reflection and self-analysis',
          'Wisdom and depth of thought',
          'Interest in meanings and values',
          'Ability to see the essence of things',
          'Quality over quantity',
        ],
      },
      recommendations: {
        'ru': [
          'Добавляйте лёгкость в общение',
          'Позволяйте себе просто веселиться',
          'Не перегружайте друзей глубокими темами',
          'Учитесь ценить поверхностные, но тёплые моменты',
        ],
        'en': [
          'Add lightness to communication',
          'Allow yourself to just have fun',
          'Don\'t overload friends with deep topics',
          'Learn to appreciate superficial but warm moments',
        ],
      },
      suitableRoles: {
        'ru': [
          'Советчик по жизненным вопросам',
          'Партнёр для глубоких разговоров',
          'Источник мудрости',
        ],
        'en': [
          'Life advisor',
          'Partner for deep conversations',
          'Source of wisdom',
        ],
      },
      tryToday: {
        'ru': 'Предложите другу просто погулять без разговоров о смысле жизни.',
        'en': 'Suggest a friend just take a walk without talking about the meaning of life.',
      },
      inspiringMessage: {
        'ru': 'Ваша глубина мысли — редкий дар. Иногда лёгкость тоже бывает глубокой.',
        'en': 'Your depth of thought is a rare gift. Sometimes lightness can also be deep.',
      },
      vulnerabilities: {
        'ru': ['Эмоциональная дистанция'],
        'en': ['Emotional distance'],
      },
    ),
    'independent_free_friend': FriendshipProfile(
      id: 'independent_free_friend',
      name: {
        'ru': 'Свободолюбивый автономный друг',
        'en': 'Freedom-Loving Independent Friend',
      },
      description: {
        'ru': 'Вы цените свободу и уважаете границы. Дружба для вас — это пространство.',
        'en': 'You value freedom and respect boundaries. Friendship for you is space.',
      },
      characteristics: {
        'ru': [
          'Автономность и независимость',
          'Уважение к чужому пространству',
          'Отсутствие навязчивости',
          'Ценность личной свободы',
          'Спокойное принятие расстояния',
        ],
        'en': [
          'Autonomy and independence',
          'Respect for others\' space',
          'Not being intrusive',
          'Value of personal freedom',
          'Calm acceptance of distance',
        ],
      },
      recommendations: {
        'ru': [
          'Проявляйте участие небольшими жестами',
          'Иногда инициируйте контакт первым',
          'Показывайте, что вы цените дружбу',
          'Не бойтесь сближаться',
        ],
        'en': [
          'Show care with small gestures',
          'Sometimes initiate contact first',
          'Show that you value friendship',
          'Don\'t be afraid to get closer',
        ],
      },
      suitableRoles: {
        'ru': [
          'Друг, который не давит',
          'Партнёр для независимых людей',
          'Человек, уважающий границы',
        ],
        'en': [
          'Friend who doesn\'t pressure',
          'Partner for independent people',
          'Person who respects boundaries',
        ],
      },
      tryToday: {
        'ru': 'Напишите другу тёплое сообщение просто так.',
        'en': 'Send a friend a warm message just because.',
      },
      inspiringMessage: {
        'ru': 'Ваше уважение к свободе — это зрелость. Добавьте немного тепла, и дружба засияет.',
        'en': 'Your respect for freedom is maturity. Add some warmth and friendship will shine.',
      },
      vulnerabilities: {
        'ru': ['Дистанция, которую могут воспринимать как холод'],
        'en': ['Distance that may be perceived as coldness'],
      },
    ),
    'adventure_partner': FriendshipProfile(
      id: 'adventure_partner',
      name: {
        'ru': 'Друг-партнёр по приключениям',
        'en': 'Adventure Partner Friend',
      },
      description: {
        'ru': 'Ваша дружба строится на совместных активностях и приключениях.',
        'en': 'Your friendship is built on shared activities and adventures.',
      },
      characteristics: {
        'ru': [
          'Драйв и активность',
          'Командность и сплочённость',
          'Любовь к новым впечатлениям',
          'Надёжность в экстремальных ситуациях',
          'Способность организовать активность',
        ],
        'en': [
          'Drive and activity',
          'Teamwork and cohesion',
          'Love for new experiences',
          'Reliability in extreme situations',
          'Ability to organize activities',
        ],
      },
      recommendations: {
        'ru': [
          'Добавляйте эмоциональные разговоры',
          'Учитесь быть рядом в тихие моменты',
          'Развивайте эмоциональную сторону дружбы',
          'Не забывайте спрашивать о чувствах',
        ],
        'en': [
          'Add emotional conversations',
          'Learn to be present in quiet moments',
          'Develop the emotional side of friendship',
          'Don\'t forget to ask about feelings',
        ],
      },
      suitableRoles: {
        'ru': [
          'Организатор активного отдыха',
          'Партнёр по хобби',
          'Надёжный товарищ в путешествиях',
        ],
        'en': [
          'Active leisure organizer',
          'Hobby partner',
          'Reliable travel companion',
        ],
      },
      tryToday: {
        'ru': 'Спросите друга о его переживаниях, а не только о планах.',
        'en': 'Ask a friend about their feelings, not just their plans.',
      },
      inspiringMessage: {
        'ru': 'Ваша энергия создаёт незабываемые моменты. Добавьте глубину — и дружба станет вечной.',
        'en': 'Your energy creates unforgettable moments. Add depth — and friendship will become eternal.',
      },
      vulnerabilities: {
        'ru': ['Сложности с обсуждением чувств'],
        'en': ['Difficulties discussing feelings'],
      },
    ),
    'caring_guardian': FriendshipProfile(
      id: 'caring_guardian',
      name: {
        'ru': 'Сверхзаботливый хранитель',
        'en': 'Over-Caring Guardian',
      },
      description: {
        'ru': 'Вы много отдаёте в дружбе и заботитесь о людях больше, чем о себе.',
        'en': 'You give a lot in friendship and care for people more than yourself.',
      },
      characteristics: {
        'ru': [
          'Забота и внимательность',
          'Щедрость души и времени',
          'Готовность помочь в любой момент',
          'Способность предугадывать потребности',
          'Преданность друзьям',
        ],
        'en': [
          'Care and attentiveness',
          'Generosity of soul and time',
          'Willingness to help at any moment',
          'Ability to anticipate needs',
          'Devotion to friends',
        ],
      },
      recommendations: {
        'ru': [
          'Учитывайте свои потребности',
          'Просите о помощи сами',
          'Установите здоровые границы',
          'Не забывайте о балансе «давать-получать»',
        ],
        'en': [
          'Consider your own needs',
          'Ask for help yourself',
          'Set healthy boundaries',
          'Don\'t forget about the give-receive balance',
        ],
      },
      suitableRoles: {
        'ru': [
          'Опора и защитник в группе',
          'Человек, который всегда поможет',
          'Эмоциональный якорь',
        ],
        'en': [
          'Support and protector in the group',
          'Person who always helps',
          'Emotional anchor',
        ],
      },
      tryToday: {
        'ru': 'Попросите друга о небольшой услуге и примите помощь.',
        'en': 'Ask a friend for a small favor and accept help.',
      },
      inspiringMessage: {
        'ru': 'Ваша забота согревает. Помните: вы тоже заслуживаете заботы.',
        'en': 'Your care warms others. Remember: you deserve care too.',
      },
      vulnerabilities: {
        'ru': ['Эмоциональная зависимость'],
        'en': ['Emotional dependency'],
      },
    ),
    'intuitive_feel_reader': FriendshipProfile(
      id: 'intuitive_feel_reader',
      name: {
        'ru': 'Интуитивный читатель настроений',
        'en': 'Intuitive Mood Reader',
      },
      description: {
        'ru': 'Вы чувствуете эмоции людей почти сразу, без слов.',
        'en': 'You sense people\'s emotions almost immediately, without words.',
      },
      characteristics: {
        'ru': [
          'Высокая чувствительность',
          'Интуитивная эмпатия',
          'Способность «читать» людей',
          'Понимание невербальных сигналов',
          'Быстрая эмоциональная настройка',
        ],
        'en': [
          'High sensitivity',
          'Intuitive empathy',
          'Ability to "read" people',
          'Understanding nonverbal signals',
          'Quick emotional attunement',
        ],
      },
      recommendations: {
        'ru': [
          'Спрашивайте, а не угадывайте',
          'Защищайте себя от эмоциональной перегрузки',
          'Проверяйте свои интерпретации',
          'Не забывайте о своих чувствах',
        ],
        'en': [
          'Ask, don\'t guess',
          'Protect yourself from emotional overload',
          'Verify your interpretations',
          'Don\'t forget about your own feelings',
        ],
      },
      suitableRoles: {
        'ru': [
          'Эмоциональный барометр группы',
          'Человек, который понимает без слов',
          'Поддержка в молчании',
        ],
        'en': [
          'Emotional barometer of the group',
          'Person who understands without words',
          'Support in silence',
        ],
      },
      tryToday: {
        'ru': 'Вместо того чтобы угадывать, спросите друга напрямую о его чувствах.',
        'en': 'Instead of guessing, ask a friend directly about their feelings.',
      },
      inspiringMessage: {
        'ru': 'Ваша интуиция — суперсила. Используйте её мудро и заботьтесь о себе.',
        'en': 'Your intuition is a superpower. Use it wisely and take care of yourself.',
      },
      vulnerabilities: {
        'ru': ['Гиперэмпатия'],
        'en': ['Hyperempathy'],
      },
    ),
    'social_circle_builder': FriendshipProfile(
      id: 'social_circle_builder',
      name: {
        'ru': 'Созидательный организатор круга',
        'en': 'Social Circle Builder',
      },
      description: {
        'ru': 'Вы объединяете людей вокруг себя и создаёте сообщества.',
        'en': 'You unite people around you and create communities.',
      },
      characteristics: {
        'ru': [
          'Лидерство в социальном плане',
          'Инициативность в организации',
          'Способность объединять разных людей',
          'Талант к созданию атмосферы',
          'Умение поддерживать много связей',
        ],
        'en': [
          'Social leadership',
          'Initiative in organizing',
          'Ability to unite different people',
          'Talent for creating atmosphere',
          'Ability to maintain many connections',
        ],
      },
      recommendations: {
        'ru': [
          'Делегируйте организационные роли',
          'Уделяйте время глубоким связям',
          'Не забывайте об отдыхе',
          'Развивайте близкие отношения, а не только широкие',
        ],
        'en': [
          'Delegate organizational roles',
          'Make time for deep connections',
          'Don\'t forget about rest',
          'Develop close relationships, not just wide ones',
        ],
      },
      suitableRoles: {
        'ru': [
          'Организатор встреч и мероприятий',
          'Центр социального круга',
          'Связующее звено между группами',
        ],
        'en': [
          'Organizer of gatherings and events',
          'Center of social circle',
          'Link between groups',
        ],
      },
      tryToday: {
        'ru': 'Проведите время один на один с близким другом без группы.',
        'en': 'Spend one-on-one time with a close friend without the group.',
      },
      inspiringMessage: {
        'ru': 'Вы создаёте миры, где люди находят друг друга. Не забывайте найти время для себя.',
        'en': 'You create worlds where people find each other. Don\'t forget to find time for yourself.',
      },
      vulnerabilities: {
        'ru': ['Перегрузка ответственностью'],
        'en': ['Responsibility overload'],
      },
    ),
    'calm_observer': FriendshipProfile(
      id: 'calm_observer',
      name: {
        'ru': 'Спокойный наблюдатель',
        'en': 'Calm Observer',
      },
      description: {
        'ru': 'Вы тихо, но устойчиво присутствуете в жизни друзей.',
        'en': 'You quietly but steadily present in friends\' lives.',
      },
      characteristics: {
        'ru': [
          'Принятие и терпимость',
          'Стабильность и спокойствие',
          'Отсутствие давления',
          'Мудрое наблюдение',
          'Способность быть рядом без слов',
        ],
        'en': [
          'Acceptance and tolerance',
          'Stability and calm',
          'No pressure',
          'Wise observation',
          'Ability to be present without words',
        ],
      },
      recommendations: {
        'ru': [
          'Иногда делайте первый шаг',
          'Проявляйте инициативу в общении',
          'Не бойтесь предлагать встречи',
          'Выражайте свои чувства чаще',
        ],
        'en': [
          'Sometimes take the first step',
          'Show initiative in communication',
          'Don\'t be afraid to suggest meetings',
          'Express your feelings more often',
        ],
      },
      suitableRoles: {
        'ru': [
          'Тихая поддержка',
          'Спокойное присутствие',
          'Надёжный фон дружбы',
        ],
        'en': [
          'Quiet support',
          'Calm presence',
          'Reliable friendship background',
        ],
      },
      tryToday: {
        'ru': 'Напишите другу первым и предложите встретиться.',
        'en': 'Message a friend first and suggest meeting up.',
      },
      inspiringMessage: {
        'ru': 'Ваше спокойное присутствие — это якорь для многих. Иногда позвольте себе быть более заметным.',
        'en': 'Your calm presence is an anchor for many. Sometimes allow yourself to be more visible.',
      },
      vulnerabilities: {
        'ru': ['Низкая инициативность'],
        'en': ['Low initiative'],
      },
    ),
    'emotional_dramatic_friend': FriendshipProfile(
      id: 'emotional_dramatic_friend',
      name: {
        'ru': 'Драматичный эмоциональный друг',
        'en': 'Dramatic Emotional Friend',
      },
      description: {
        'ru': 'Ваши отношения яркие и насыщенные эмоциями. С вами не бывает скучно.',
        'en': 'Your relationships are bright and full of emotions. It\'s never boring with you.',
      },
      characteristics: {
        'ru': [
          'Искренность и страстность',
          'Эмоциональность и выразительность',
          'Яркость переживаний',
          'Способность делать жизнь интересной',
          'Полная отдача в отношениях',
        ],
        'en': [
          'Sincerity and passion',
          'Emotionality and expressiveness',
          'Intensity of experiences',
          'Ability to make life interesting',
          'Full commitment in relationships',
        ],
      },
      recommendations: {
        'ru': [
          'Тренируйте эмоциональную регуляцию',
          'Учитесь успокаиваться перед реакцией',
          'Развивайте стабильность в эмоциях',
          'Не пугайте друзей резкими переменами',
        ],
        'en': [
          'Practice emotional regulation',
          'Learn to calm down before reacting',
          'Develop emotional stability',
          'Don\'t scare friends with sudden changes',
        ],
      },
      suitableRoles: {
        'ru': [
          'Источник ярких эмоций',
          'Человек, с которым интересно',
          'Искренний и страстный друг',
        ],
        'en': [
          'Source of bright emotions',
          'Person who makes things interesting',
          'Sincere and passionate friend',
        ],
      },
      tryToday: {
        'ru': 'Перед реакцией на что-то возьмите паузу и подышите.',
        'en': 'Before reacting to something, take a pause and breathe.',
      },
      inspiringMessage: {
        'ru': 'Ваша искренность — это редкость. Добавьте немного спокойствия, и отношения станут глубже.',
        'en': 'Your sincerity is rare. Add some calm and relationships will deepen.',
      },
      vulnerabilities: {
        'ru': ['Резкие перепады настроения'],
        'en': ['Sudden mood swings'],
      },
    ),
    'profile_mixed': FriendshipProfile(
      id: 'profile_mixed',
      name: {
        'ru': 'Сбалансированный друг',
        'en': 'Balanced Friend',
      },
      description: {
        'ru': 'У вас нет одного ярко выраженного стиля дружбы — вы гибко адаптируетесь к разным людям и ситуациям.',
        'en': 'You don\'t have one pronounced friendship style — you flexibly adapt to different people and situations.',
      },
      characteristics: {
        'ru': [
          'Гибкость в общении',
          'Адаптивность к разным людям',
          'Баланс разных качеств',
          'Способность находить общий язык со всеми',
          'Разносторонность в дружбе',
        ],
        'en': [
          'Flexibility in communication',
          'Adaptability to different people',
          'Balance of different qualities',
          'Ability to find common ground with everyone',
          'Versatility in friendship',
        ],
      },
      recommendations: {
        'ru': [
          'Определите, какой стиль дружбы вам ближе',
          'Развивайте свои сильные стороны',
          'Не теряйте себя, адаптируясь к другим',
          'Найдите баланс между гибкостью и аутентичностью',
        ],
        'en': [
          'Determine which friendship style is closer to you',
          'Develop your strengths',
          'Don\'t lose yourself while adapting to others',
          'Find balance between flexibility and authenticity',
        ],
      },
      suitableRoles: {
        'ru': [
          'Универсальный друг',
          'Адаптивный партнёр',
          'Человек для любой компании',
        ],
        'en': [
          'Universal friend',
          'Adaptive partner',
          'Person for any company',
        ],
      },
      tryToday: {
        'ru': 'Подумайте, какой стиль дружбы приносит вам больше радости.',
        'en': 'Think about which friendship style brings you more joy.',
      },
      inspiringMessage: {
        'ru': 'Ваша гибкость — это сила. Оставайтесь собой, адаптируясь к миру.',
        'en': 'Your flexibility is strength. Stay yourself while adapting to the world.',
      },
      vulnerabilities: {
        'ru': ['Риск потерять свою идентичность'],
        'en': ['Risk of losing your identity'],
      },
    ),
  };

  /// Определить профиль на основе процентов по шкалам
  /// Использует алгоритм на основе доминирующих шкал
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) {
      return 'profile_mixed';
    }

    // Находим доминирующие шкалы (sorted by percentage)
    final sortedScales = percentages.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final topScale = sortedScales[0].key;
    final topValue = sortedScales[0].value;

    // Если разрыв между топ шкалой и второй < 10%, это смешанный профиль
    if (sortedScales.length >= 2 && topValue - sortedScales[1].value < 10) {
      return 'profile_mixed';
    }

    // Определяем профиль по комбинации топ-шкал
    // High emotional_closeness + high supportive_behavior → warm_empathic_friend
    final emotionalCloseness = percentages['emotional_closeness'] ?? 0;
    final communicationStyle = percentages['communication_style'] ?? 0;
    final trustAndLoyalty = percentages['trust_and_loyalty'] ?? 0;
    final boundariesAndSpace = percentages['boundaries_and_space'] ?? 0;
    final supportiveBehavior = percentages['supportive_behavior'] ?? 0;
    final friendshipExpectations = percentages['friendship_expectations'] ?? 0;

    // Тёплый эмпатичный друг: высокая эмоц. близость + поддержка
    if (emotionalCloseness >= 70 && supportiveBehavior >= 70) {
      return 'warm_empathic_friend';
    }

    // Надёжный стабильный друг: высокое доверие + умеренная эмоц. близость
    if (trustAndLoyalty >= 70 && emotionalCloseness < 70) {
      return 'reliable_stable_friend';
    }

    // Коммуникационный мост: высокий стиль общения
    if (communicationStyle >= 75 && topScale == 'communication_style') {
      return 'communication_bridge';
    }

    // Сверхзаботливый хранитель: очень высокая поддержка
    if (supportiveBehavior >= 80 && emotionalCloseness >= 60) {
      return 'caring_guardian';
    }

    // Свободолюбивый автономный друг: высокие границы + низкие ожидания
    if (boundariesAndSpace >= 70 && friendshipExpectations < 50) {
      return 'independent_free_friend';
    }

    // Глубокий философский друг: высокая эмоц. близость + высокие границы
    if (emotionalCloseness >= 70 && boundariesAndSpace >= 70) {
      return 'philosophical_deep_friend';
    }

    // Интуитивный читатель настроений: высокая поддержка + высокая коммуникация
    if (supportiveBehavior >= 70 && communicationStyle >= 70) {
      return 'intuitive_feel_reader';
    }

    // Созидательный организатор: высокие ожидания + высокая коммуникация
    if (friendshipExpectations >= 70 && communicationStyle >= 65) {
      return 'social_circle_builder';
    }

    // Друг-партнёр по приключениям: высокие ожидания + умеренная эмоц. близость
    if (friendshipExpectations >= 65 && supportiveBehavior >= 60 && emotionalCloseness < 70) {
      return 'adventure_partner';
    }

    // Заряженный вдохновитель: высокие ожидания + высокая поддержка
    if (friendshipExpectations >= 70 && supportiveBehavior >= 65) {
      return 'motivator_inspirer';
    }

    // Спокойный наблюдатель: высокие границы + низкая коммуникация
    if (boundariesAndSpace >= 65 && communicationStyle < 60) {
      return 'calm_observer';
    }

    // Драматичный эмоциональный друг: высокая эмоц. близость + высокие ожидания
    if (emotionalCloseness >= 70 && friendshipExpectations >= 70) {
      return 'emotional_dramatic_friend';
    }

    // По умолчанию - смешанный профиль
    return 'profile_mixed';
  }

  /// Получить профиль по ID
  static FriendshipProfile? getProfile(String profileId) {
    return profiles[profileId];
  }
}

/// Модель профиля дружбы
class FriendshipProfile {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, List<String>> characteristics;
  final Map<String, List<String>> recommendations;
  final Map<String, List<String>> suitableRoles;
  final Map<String, String> tryToday;
  final Map<String, String> inspiringMessage;
  final Map<String, List<String>> vulnerabilities;

  const FriendshipProfile({
    required this.id,
    required this.name,
    required this.description,
    required this.characteristics,
    required this.recommendations,
    required this.suitableRoles,
    required this.tryToday,
    required this.inspiringMessage,
    required this.vulnerabilities,
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
  List<String> getVulnerabilities(String languageCode) =>
      vulnerabilities[languageCode] ?? vulnerabilities['ru'] ?? [];
}
