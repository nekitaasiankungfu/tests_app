import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data access class for Motivational Strategies Test
/// Legacy Dart implementation (no JSON dependency)
class MotivationalStrategiesData {
  /// Get the complete Motivational Strategies test
  static TestModel getMotivationalStrategiesTest() {
    return TestModel(
      id: 'motivational_strategies_v1',
      title: {
        'ru': 'Тест мотивационных стратегий',
        'en': 'Motivational Strategies Assessment',
      },
      description: {
        'ru':
            'Этот тест помогает определить ваш доминирующий мотивационный паттерн — то, что движет вашими действиями, решениями и реакциями на жизненные ситуации. Основываясь на теории базовых психологических потребностей и современных исследованиях мотивации, тест выявляет 9 основных стратегий, которые люди используют для достижения удовлетворенности и преодоления жизненных вызовов.\n\nПонимание своей мотивационной стратегии поможет вам лучше осознать свои сильные стороны, области роста и оптимальные пути самореализации. Тест также покажет ваш вторичный тип мотивации, что даст более полную картину вашей личности.',
        'en':
            'This test helps identify your dominant motivational pattern — what drives your actions, decisions, and reactions to life situations. Based on the theory of basic psychological needs and modern motivation research, the test reveals 9 core strategies that people use to achieve satisfaction and overcome life challenges.\n\nUnderstanding your motivational strategy will help you better recognize your strengths, growth areas, and optimal paths for self-realization. The test also shows your secondary motivation type, providing a more complete picture of your personality.',
      },
      category: {
        'ru': 'Типология личности',
        'en': 'Personality Typology',
      },
      categoryId: 'personality',
      disclaimer: {
        'ru':
            'Этот тест основан на теории самодетерминации (Deci & Ryan, 1985) и концепции мотивационных систем (McClelland). Он предназначен для самопознания и личностного развития. Отвечайте честно для получения наиболее точных результатов.',
        'en':
            'This test is based on Self-Determination Theory (Deci & Ryan, 1985) and Motivational Systems Concept (McClelland). It is designed for self-knowledge and personal development. Answer honestly for the most accurate results.',
      },
      estimatedTime: 20,
      type: TestType.multiFactor,
      factorIds: [
        'idealist',
        'altruist',
        'achiever',
        'creator',
        'analyst',
        'guardian',
        'optimist',
        'leader',
        'harmonizer',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'idealist': {
        'ru': 'Идеалист',
        'en': 'Idealist',
      },
      'altruist': {
        'ru': 'Альтруист',
        'en': 'Altruist',
      },
      'achiever': {
        'ru': 'Достигатель',
        'en': 'Achiever',
      },
      'creator': {
        'ru': 'Созидатель',
        'en': 'Creator',
      },
      'analyst': {
        'ru': 'Аналитик',
        'en': 'Analyst',
      },
      'guardian': {
        'ru': 'Защитник',
        'en': 'Guardian',
      },
      'optimist': {
        'ru': 'Оптимист',
        'en': 'Optimist',
      },
      'leader': {
        'ru': 'Лидер',
        'en': 'Leader',
      },
      'harmonizer': {
        'ru': 'Гармонизатор',
        'en': 'Harmonizer',
      },
    };
  }

  /// Get factor interpretation based on percentage score
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Handle NaN or invalid percentage
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }

    // Clamp percentage to 0-100 range
    percentage = percentage.clamp(0.0, 100.0);

    // Determine range: 0-40 (low), 40-70 (medium), 70-100 (high)
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
      'ru': interpretation['ru']!,
      'en': interpretation['en']!,
    };
  }

  /// Profile determination logic
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'harmonizer'; // Default fallback

    // Find highest and second highest scores
    final sortedEntries = percentages.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final primaryType = sortedEntries.first.key;
    final primaryScore = sortedEntries.first.value;

    // Check if difference between first and second is less than 5%
    if (sortedEntries.length > 1) {
      final secondaryScore = sortedEntries[1].value;
      final difference = primaryScore - secondaryScore;

      if (difference < 5) {
        return 'balanced'; // Mixed profile
      }
    }

    // Return primary type as profile
    return primaryType;
  }

  /// Get profile by ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// All 90 questions (10 per motivation type)
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1 - idealist
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Для меня важно делать все правильно, даже в мелочах',
          'en': 'It\'s important for me to do everything correctly, even in small details',
        },
        factorId: 'idealist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q2 - altruist
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Я чувствую удовлетворение, когда помогаю другим решать их проблемы',
          'en': 'I feel satisfied when I help others solve their problems',
        },
        factorId: 'altruist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q3 - achiever
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Достижение видимых результатов мотивирует меня больше всего',
          'en': 'Achieving visible results motivates me the most',
        },
        factorId: 'achiever',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q4 - creator
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я часто чувствую, что отличаюсь от большинства людей в своем восприятии мира',
          'en': 'I often feel that I differ from most people in my perception of the world',
        },
        factorId: 'creator',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q5 - analyst
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Мне нужно глубоко понять вопрос, прежде чем принять решение',
          'en': 'I need to deeply understand an issue before making a decision',
        },
        factorId: 'analyst',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q6 - guardian
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Я предпочитаю иметь четкий план и знать, что меня ждет впереди',
          'en': 'I prefer to have a clear plan and know what lies ahead',
        },
        factorId: 'guardian',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q7 - optimist
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я всегда ищу новые впечатления и возможности для веселья',
          'en': 'I\'m always looking for new experiences and opportunities for fun',
        },
        factorId: 'optimist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q8 - leader
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я не боюсь противостоять другим, когда уверен в своей правоте',
          'en': 'I\'m not afraid to confront others when I\'m sure I\'m right',
        },
        factorId: 'leader',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q9 - harmonizer
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я предпочитаю избегать конфликтов и сохранять спокойную атмосферу',
          'en': 'I prefer to avoid conflicts and maintain a calm atmosphere',
        },
        factorId: 'harmonizer',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q10 - idealist
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Меня расстраивает, когда люди действуют неэтично или несправедливо',
          'en': 'It upsets me when people act unethically or unfairly',
        },
        factorId: 'idealist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q11 - altruist
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я часто забываю о своих потребностях, заботясь о других',
          'en': 'I often forget about my own needs while caring for others',
        },
        factorId: 'altruist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q12 - achiever
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Признание моих достижений другими людьми для меня очень важно',
          'en': 'Recognition of my achievements by others is very important to me',
        },
        factorId: 'achiever',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q13 - creator
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я глубоко переживаю свои эмоции и часто рефлексирую',
          'en': 'I deeply experience my emotions and often reflect',
        },
        factorId: 'creator',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q14 - analyst
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я предпочитаю наблюдать и анализировать, а не сразу действовать',
          'en': 'I prefer to observe and analyze rather than act immediately',
        },
        factorId: 'analyst',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q15 - guardian
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Неопределенность вызывает у меня тревогу',
          'en': 'Uncertainty causes me anxiety',
        },
        factorId: 'guardian',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q16 - optimist
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я с трудом переношу скуку и однообразие',
          'en': 'I have difficulty tolerating boredom and monotony',
        },
        factorId: 'optimist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q17 - leader
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я ценю силу и уверенность в себе больше, чем мягкость',
          'en': 'I value strength and self-confidence more than gentleness',
        },
        factorId: 'leader',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q18 - harmonizer
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Я легко адаптируюсь к мнению других, чтобы не создавать напряжения',
          'en': 'I easily adapt to others\' opinions to avoid creating tension',
        },
        factorId: 'harmonizer',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q19 - idealist
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Я стремлюсь к самосовершенствованию и работе над своими недостатками',
          'en': 'I strive for self-improvement and working on my flaws',
        },
        factorId: 'idealist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q20 - altruist
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Мне трудно просить о помощи, я привык помогать другим',
          'en': 'It\'s hard for me to ask for help, I\'m used to helping others',
        },
        factorId: 'altruist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q21 - achiever
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я всегда устанавливаю амбициозные цели для себя',
          'en': 'I always set ambitious goals for myself',
        },
        factorId: 'achiever',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q22 - creator
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Меня привлекает все необычное и артистичное',
          'en': 'I\'m attracted to everything unusual and artistic',
        },
        factorId: 'creator',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q23 - analyst
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я предпочитаю минимизировать социальные контакты, чтобы сосредоточиться на своих интересах',
          'en': 'I prefer to minimize social contacts to focus on my interests',
        },
        factorId: 'analyst',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q24 - guardian
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я ценю надежность и последовательность в людях',
          'en': 'I value reliability and consistency in people',
        },
        factorId: 'guardian',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q25 - optimist
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я предпочитаю держать несколько вариантов открытыми, а не фокусироваться на одном',
          'en': 'I prefer to keep several options open rather than focus on one',
        },
        factorId: 'optimist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q26 - leader
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Я естественно беру на себя роль лидера в группе',
          'en': 'I naturally take on the role of leader in a group',
        },
        factorId: 'leader',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q27 - harmonizer
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Мне легче согласиться с другими, чем отстаивать свою позицию',
          'en': 'It\'s easier for me to agree with others than to defend my position',
        },
        factorId: 'harmonizer',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q28 - idealist
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Я часто критикую себя за ошибки и несовершенства',
          'en': 'I often criticize myself for mistakes and imperfections',
        },
        factorId: 'idealist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q29 - altruist
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я чувствую себя ценным, когда другие нуждаются во мне',
          'en': 'I feel valuable when others need me',
        },
        factorId: 'altruist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q30 - achiever
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я адаптирую свое поведение в зависимости от ситуации для достижения успеха',
          'en': 'I adapt my behavior depending on the situation to achieve success',
        },
        factorId: 'achiever',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q31 - creator
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Я часто чувствую, что мне чего-то не хватает в жизни',
          'en': 'I often feel that something is missing in my life',
        },
        factorId: 'creator',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q32 - analyst
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Мне нужно время в одиночестве, чтобы восстановить энергию',
          'en': 'I need time alone to restore my energy',
        },
        factorId: 'analyst',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q33 - guardian
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Я часто сомневаюсь в своих решениях и ищу дополнительные подтверждения',
          'en': 'I often doubt my decisions and seek additional confirmation',
        },
        factorId: 'guardian',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q34 - optimist
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Я нахожу способы сделать даже рутинные задачи интересными',
          'en': 'I find ways to make even routine tasks interesting',
        },
        factorId: 'optimist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q35 - leader
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Я защищаю слабых и несправедливо обиженных',
          'en': 'I defend the weak and unfairly offended',
        },
        factorId: 'leader',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q36 - harmonizer
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Я склонен откладывать принятие решений, чтобы сохранить покой',
          'en': 'I tend to postpone making decisions to maintain peace',
        },
        factorId: 'harmonizer',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q37 - idealist
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'У меня есть четкие представления о том, что правильно и что неправильно',
          'en': 'I have clear ideas about what is right and what is wrong',
        },
        factorId: 'idealist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q38 - altruist
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Я интуитивно чувствую эмоциональные потребности других людей',
          'en': 'I intuitively sense the emotional needs of others',
        },
        factorId: 'altruist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q39 - achiever
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Неудача воспринимается мной болезненно и снижает мою самооценку',
          'en': 'Failure is perceived by me painfully and lowers my self-esteem',
        },
        factorId: 'achiever',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q40 - creator
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'Я ценю красоту и эстетику во всех проявлениях жизни',
          'en': 'I appreciate beauty and aesthetics in all manifestations of life',
        },
        factorId: 'creator',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q41 - analyst
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Я собираю информацию и знания, даже если не планирую их использовать',
          'en': 'I collect information and knowledge, even if I don\'t plan to use them',
        },
        factorId: 'analyst',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q42 - guardian
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Я лоялен к людям и организациям, которые заслужили мое доверие',
          'en': 'I am loyal to people and organizations that have earned my trust',
        },
        factorId: 'guardian',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q43 - optimist
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Я нетерпелив и хочу все попробовать прямо сейчас',
          'en': 'I am impatient and want to try everything right now',
        },
        factorId: 'optimist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q44 - leader
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Я говорю прямо и не скрываю свое мнение',
          'en': 'I speak directly and don\'t hide my opinion',
        },
        factorId: 'leader',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q45 - harmonizer
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Мне сложно сказать \'нет\', даже когда это в моих интересах',
          'en': 'It\'s difficult for me to say \'no\', even when it\'s in my best interest',
        },
        factorId: 'harmonizer',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q46 - idealist
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Я верю, что всегда можно найти лучший способ сделать что-то',
          'en': 'I believe there\'s always a better way to do something',
        },
        factorId: 'idealist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q47 - altruist
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Я получаю энергию от возможности заботиться о близких',
          'en': 'I get energy from the opportunity to care for loved ones',
        },
        factorId: 'altruist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q48 - achiever
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Я ориентируюсь на результат больше, чем на процесс',
          'en': 'I focus on results more than on the process',
        },
        factorId: 'achiever',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q49 - creator
      QuestionModel(
        id: 'q49',
        text: {
          'ru': 'Мне нравится выражать себя через творчество или уникальный стиль',
          'en': 'I like to express myself through creativity or unique style',
        },
        factorId: 'creator',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q50 - analyst
      QuestionModel(
        id: 'q50',
        text: {
          'ru': 'Я чувствую себя комфортно в роли эксперта или специалиста',
          'en': 'I feel comfortable in the role of expert or specialist',
        },
        factorId: 'analyst',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q51 - guardian
      QuestionModel(
        id: 'q51',
        text: {
          'ru': 'Я тщательно оцениваю риски перед принятием решений',
          'en': 'I carefully assess risks before making decisions',
        },
        factorId: 'guardian',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q52 - optimist
      QuestionModel(
        id: 'q52',
        text: {
          'ru': 'Я фокусируюсь на позитивных возможностях, а не на ограничениях',
          'en': 'I focus on positive possibilities rather than limitations',
        },
        factorId: 'optimist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q53 - leader
      QuestionModel(
        id: 'q53',
        text: {
          'ru': 'Я уважаю силу и могу проявлять жесткость, когда это необходимо',
          'en': 'I respect strength and can show toughness when necessary',
        },
        factorId: 'leader',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q54 - harmonizer
      QuestionModel(
        id: 'q54',
        text: {
          'ru': 'Я ценю комфорт и стабильность больше, чем амбиции',
          'en': 'I value comfort and stability more than ambition',
        },
        factorId: 'harmonizer',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q55 - idealist
      QuestionModel(
        id: 'q55',
        text: {
          'ru': 'Я замечаю ошибки и недочеты там, где другие их не видят',
          'en': 'I notice mistakes and flaws where others don\'t see them',
        },
        factorId: 'idealist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q56 - altruist
      QuestionModel(
        id: 'q56',
        text: {
          'ru': 'Я склонен гордиться собой через успехи тех, кому помог',
          'en': 'I tend to take pride in myself through the success of those I\'ve helped',
        },
        factorId: 'altruist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q57 - achiever
      QuestionModel(
        id: 'q57',
        text: {
          'ru': 'Я определяю свою ценность через достижения и успехи',
          'en': 'I define my worth through achievements and successes',
        },
        factorId: 'achiever',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q58 - creator
      QuestionModel(
        id: 'q58',
        text: {
          'ru': 'Я испытываю сильную тягу к тому, что кажется недостижимым или утраченным',
          'en': 'I feel a strong pull toward what seems unattainable or lost',
        },
        factorId: 'creator',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q59 - analyst
      QuestionModel(
        id: 'q59',
        text: {
          'ru': 'Я предпочитаю думать о проблеме, а не сразу действовать эмоционально',
          'en': 'I prefer to think about a problem rather than act emotionally immediately',
        },
        factorId: 'analyst',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q60 - guardian
      QuestionModel(
        id: 'q60',
        text: {
          'ru': 'Я ищу руководства и поддержки у авторитетных фигур',
          'en': 'I seek guidance and support from authority figures',
        },
        factorId: 'guardian',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q61 - optimist
      QuestionModel(
        id: 'q61',
        text: {
          'ru': 'Мне трудно фокусироваться на одной задаче, когда вокруг столько интересного',
          'en': 'It\'s hard for me to focus on one task when there\'s so much interesting around',
        },
        factorId: 'optimist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q62 - leader
      QuestionModel(
        id: 'q62',
        text: {
          'ru': 'Я не боюсь конфронтации и могу проявлять агрессию для защиты своих интересов',
          'en': 'I\'m not afraid of confrontation and can show aggression to protect my interests',
        },
        factorId: 'leader',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q63 - harmonizer
      QuestionModel(
        id: 'q63',
        text: {
          'ru': 'Я могу потерять связь со своими истинными желаниями, подстраиваясь под других',
          'en': 'I can lose touch with my true desires by adapting to others',
        },
        factorId: 'harmonizer',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q64 - idealist
      QuestionModel(
        id: 'q64',
        text: {
          'ru': 'Я испытываю внутреннее напряжение от осознания несовершенства мира',
          'en': 'I experience inner tension from awareness of the world\'s imperfection',
        },
        factorId: 'idealist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q65 - altruist
      QuestionModel(
        id: 'q65',
        text: {
          'ru': 'Я манипулирую ситуациями, чтобы другие нуждались во мне',
          'en': 'I manipulate situations so that others need me',
        },
        factorId: 'altruist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q66 - achiever
      QuestionModel(
        id: 'q66',
        text: {
          'ru': 'Я боюсь выглядеть неудачником в глазах других',
          'en': 'I\'m afraid of looking like a failure in others\' eyes',
        },
        factorId: 'achiever',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q67 - creator
      QuestionModel(
        id: 'q67',
        text: {
          'ru': 'Я склонен идеализировать то, чего у меня нет',
          'en': 'I tend to idealize what I don\'t have',
        },
        factorId: 'creator',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q68 - analyst
      QuestionModel(
        id: 'q68',
        text: {
          'ru': 'Я могу отстраняться от эмоций, чтобы сохранить ясность мышления',
          'en': 'I can detach from emotions to maintain clarity of thinking',
        },
        factorId: 'analyst',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q69 - guardian
      QuestionModel(
        id: 'q69',
        text: {
          'ru': 'Я проецирую свои страхи на внешний мир, видя опасности повсюду',
          'en': 'I project my fears onto the external world, seeing dangers everywhere',
        },
        factorId: 'guardian',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q70 - optimist
      QuestionModel(
        id: 'q70',
        text: {
          'ru': 'Я избегаю негативных эмоций, переключаясь на что-то приятное',
          'en': 'I avoid negative emotions by switching to something pleasant',
        },
        factorId: 'optimist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q71 - leader
      QuestionModel(
        id: 'q71',
        text: {
          'ru': 'Я могу быть чрезмерно контролирующим и доминирующим',
          'en': 'I can be overly controlling and dominating',
        },
        factorId: 'leader',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q72 - harmonizer
      QuestionModel(
        id: 'q72',
        text: {
          'ru': 'Я склонен к пассивности и прокрастинации в важных вопросах',
          'en': 'I tend toward passivity and procrastination on important matters',
        },
        factorId: 'harmonizer',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q73 - idealist
      QuestionModel(
        id: 'q73',
        text: {
          'ru': 'Я требую от себя и других высоких стандартов',
          'en': 'I demand high standards from myself and others',
        },
        factorId: 'idealist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q74 - altruist
      QuestionModel(
        id: 'q74',
        text: {
          'ru': 'Я подавляю свои собственные нужды ради других',
          'en': 'I suppress my own needs for the sake of others',
        },
        factorId: 'altruist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q75 - achiever
      QuestionModel(
        id: 'q75',
        text: {
          'ru': 'Я ставлю работу и достижения выше отношений',
          'en': 'I put work and achievements above relationships',
        },
        factorId: 'achiever',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q76 - creator
      QuestionModel(
        id: 'q76',
        text: {
          'ru': 'Я могу чрезмерно погружаться в свои эмоциональные переживания',
          'en': 'I can become overly absorbed in my emotional experiences',
        },
        factorId: 'creator',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q77 - analyst
      QuestionModel(
        id: 'q77',
        text: {
          'ru': 'Я минимизирую контакты с внешним миром, чувствуя истощение от людей',
          'en': 'I minimize contact with the outside world, feeling drained by people',
        },
        factorId: 'analyst',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q78 - guardian
      QuestionModel(
        id: 'q78',
        text: {
          'ru': 'Я испытываю постоянную тревогу о будущем',
          'en': 'I experience constant anxiety about the future',
        },
        factorId: 'guardian',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q79 - optimist
      QuestionModel(
        id: 'q79',
        text: {
          'ru': 'Я импульсивно принимаю решения, чтобы избежать дискомфорта',
          'en': 'I impulsively make decisions to avoid discomfort',
        },
        factorId: 'optimist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q80 - leader
      QuestionModel(
        id: 'q80',
        text: {
          'ru': 'Я скрываю свою уязвимость за маской силы',
          'en': 'I hide my vulnerability behind a mask of strength',
        },
        factorId: 'leader',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q81 - harmonizer
      QuestionModel(
        id: 'q81',
        text: {
          'ru': 'Я забываю о своих приоритетах, растворяясь в потоке жизни',
          'en': 'I forget about my priorities, dissolving in the flow of life',
        },
        factorId: 'harmonizer',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q82 - idealist
      QuestionModel(
        id: 'q82',
        text: {
          'ru': 'Я испытываю праведный гнев, когда сталкиваюсь с несправедливостью',
          'en': 'I experience righteous anger when confronted with injustice',
        },
        factorId: 'idealist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q83 - altruist
      QuestionModel(
        id: 'q83',
        text: {
          'ru': 'Мне трудно принимать помощь, я привык давать, а не получать',
          'en': 'It\'s hard for me to accept help, I\'m used to giving, not receiving',
        },
        factorId: 'altruist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q84 - achiever
      QuestionModel(
        id: 'q84',
        text: {
          'ru': 'Я стремлюсь быть лучшим в том, чем занимаюсь',
          'en': 'I strive to be the best at what I do',
        },
        factorId: 'achiever',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q85 - creator
      QuestionModel(
        id: 'q85',
        text: {
          'ru': 'Я чувствую себя непонятым большинством людей',
          'en': 'I feel misunderstood by most people',
        },
        factorId: 'creator',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q86 - analyst
      QuestionModel(
        id: 'q86',
        text: {
          'ru': 'Я исследую темы глубже, чем это необходимо для практических целей',
          'en': 'I explore topics deeper than necessary for practical purposes',
        },
        factorId: 'analyst',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q87 - guardian
      QuestionModel(
        id: 'q87',
        text: {
          'ru': 'Я чувствую себя комфортнее в структурированной и предсказуемой среде',
          'en': 'I feel more comfortable in a structured and predictable environment',
        },
        factorId: 'guardian',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q88 - optimist
      QuestionModel(
        id: 'q88',
        text: {
          'ru': 'Я вижу жизнь как приключение, полное возможностей',
          'en': 'I see life as an adventure full of possibilities',
        },
        factorId: 'optimist',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q89 - leader
      QuestionModel(
        id: 'q89',
        text: {
          'ru': 'Я предпочитаю контролировать ситуацию, а не быть контролируемым',
          'en': 'I prefer to control the situation rather than be controlled',
        },
        factorId: 'leader',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q90 - harmonizer
      QuestionModel(
        id: 'q90',
        text: {
          'ru': 'Я ценю мир и гармонию превыше всего',
          'en': 'I value peace and harmony above all else',
        },
        factorId: 'harmonizer',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
    ];
  }

  /// 5-point Likert scale (scores 0-4)
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совершенно не согласен',
          'en': 'Strongly disagree',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не согласен',
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
          'ru': 'Скорее согласен',
          'en': 'Agree',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью согласен',
          'en': 'Strongly agree',
        },
        score: 4,
      ),
    ];
  }

  /// Interpretations for all 9 motivation types
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'idealist': {
        'low': {
          'ru':
              'Вы не слишком ориентированы на перфекционизм и правила. Вы принимаете несовершенство и можете быть гибким в своих стандартах.',
          'en':
              'You are not overly focused on perfectionism and rules. You accept imperfection and can be flexible in your standards.',
        },
        'medium': {
          'ru':
              'У вас сбалансированное отношение к правильности и совершенству. Вы стремитесь к качеству, но не становитесь слишком критичным.',
          'en':
              'You have a balanced attitude toward correctness and perfection. You strive for quality but don\'t become overly critical.',
        },
        'high': {
          'ru':
              'Идеалист — ваша основная мотивация. Вы движимы стремлением к совершенству, правильности и улучшению себя и мира. Важно практиковать самосострадание и принятие несовершенства.',
          'en':
              'Idealist is your primary motivation. You are driven by the pursuit of perfection, correctness, and improving yourself and the world. It\'s important to practice self-compassion and accept imperfection.',
        },
      },
      'altruist': {
        'low': {
          'ru':
              'Вы больше фокусируетесь на своих потребностях, чем на нуждах других. Вы можете устанавливать здоровые границы.',
          'en':
              'You focus more on your own needs than on others\' needs. You can set healthy boundaries.',
        },
        'medium': {
          'ru':
              'У вас здоровый баланс между заботой о себе и помощью другим. Вы способны поддерживать, но не забываете о своих потребностях.',
          'en':
              'You have a healthy balance between self-care and helping others. You can support but don\'t forget your own needs.',
        },
        'high': {
          'ru':
              'Альтруист — ваша основная мотивация. Вы получаете энергию от заботы о других и желания быть нужным. Важно помнить о своих потребностях и учиться принимать помощь.',
          'en':
              'Altruist is your primary motivation. You get energy from caring for others and the desire to be needed. It\'s important to remember your own needs and learn to accept help.',
        },
      },
      'achiever': {
        'low': {
          'ru':
              'Вы не слишком ориентированы на достижения и признание. Вы цените процесс больше, чем результат.',
          'en':
              'You are not overly achievement-oriented. You value the process more than the result.',
        },
        'medium': {
          'ru':
              'У вас здоровое стремление к достижениям. Вы мотивированы успехом, но не определяете себя только через него.',
          'en':
              'You have a healthy drive for achievement. You are motivated by success but don\'t define yourself only through it.',
        },
        'high': {
          'ru':
              'Достигатель — ваша основная мотивация. Вы ориентированы на результат и признание своих успехов. Важно ценить свою внутреннюю ценность независимо от достижений.',
          'en':
              'Achiever is your primary motivation. You are results-oriented and seek recognition for your successes. It\'s important to value your intrinsic worth independent of achievements.',
        },
      },
      'creator': {
        'low': {
          'ru':
              'Вы не слишком сфокусированы на уникальности и глубине эмоций. Вы комфортно чувствуете себя в обыденном.',
          'en':
              'You are not overly focused on uniqueness and emotional depth. You feel comfortable with the ordinary.',
        },
        'medium': {
          'ru':
              'У вас здоровое стремление к самовыражению и аутентичности. Вы цените красоту, но не погружаетесь чрезмерно в эмоции.',
          'en':
              'You have a healthy drive for self-expression and authenticity. You value beauty but don\'t become overly absorbed in emotions.',
        },
        'high': {
          'ru':
              'Созидатель — ваша основная мотивация. Вы ищете уникальность, глубину и аутентичность. Важно ценить то, что у вас есть, и не идеализировать недостижимое.',
          'en':
              'Creator is your primary motivation. You seek uniqueness, depth, and authenticity. It\'s important to appreciate what you have and not idealize the unattainable.',
        },
      },
      'analyst': {
        'low': {
          'ru':
              'Вы не слишком ориентированы на накопление знаний и анализ. Вы предпочитаете действовать, а не размышлять.',
          'en':
              'You are not overly focused on knowledge accumulation and analysis. You prefer action over contemplation.',
        },
        'medium': {
          'ru':
              'У вас здоровое стремление к пониманию и компетентности. Вы балансируете между размышлением и действием.',
          'en':
              'You have a healthy drive for understanding and competence. You balance between contemplation and action.',
        },
        'high': {
          'ru':
              'Аналитик — ваша основная мотивация. Вы движимы жаждой знаний и глубокого понимания. Важно оставаться связанным с миром и переходить от анализа к действию.',
          'en':
              'Analyst is your primary motivation. You are driven by thirst for knowledge and deep understanding. It\'s important to stay connected with the world and move from analysis to action.',
        },
      },
      'guardian': {
        'low': {
          'ru':
              'Вы не слишком беспокоитесь о безопасности и структуре. Вы комфортно чувствуете себя с неопределенностью.',
          'en':
              'You don\'t worry excessively about security and structure. You feel comfortable with uncertainty.',
        },
        'medium': {
          'ru':
              'У вас здоровая потребность в безопасности. Вы цените надежность, но можете справляться с неопределенностью.',
          'en':
              'You have a healthy need for security. You value reliability but can handle uncertainty.',
        },
        'high': {
          'ru':
              'Защитник — ваша основная мотивация. Вы ищете безопасность, надежность и структуру. Важно развивать доверие к себе и принимать неопределенность.',
          'en':
              'Guardian is your primary motivation. You seek security, reliability, and structure. It\'s important to develop self-trust and accept uncertainty.',
        },
      },
      'optimist': {
        'low': {
          'ru':
              'Вы не слишком ориентированы на поиск новизны и удовольствий. Вы можете справляться с рутиной и дискомфортом.',
          'en':
              'You are not overly focused on seeking novelty and pleasure. You can handle routine and discomfort.',
        },
        'medium': {
          'ru':
              'У вас здоровое стремление к радости и новым возможностям. Вы балансируете между удовольствием и ответственностью.',
          'en':
              'You have a healthy drive for joy and new possibilities. You balance between pleasure and responsibility.',
        },
        'high': {
          'ru':
              'Оптимист — ваша основная мотивация. Вы ищете радость, новизну и избегаете боли. Важно учиться справляться с дискомфортом и завершать начатое.',
          'en':
              'Optimist is your primary motivation. You seek joy, novelty, and avoid pain. It\'s important to learn to deal with discomfort and complete what you start.',
        },
      },
      'leader': {
        'low': {
          'ru':
              'Вы не слишком ориентированы на контроль и власть. Вы комфортно чувствуете себя в роли последователя.',
          'en':
              'You are not overly focused on control and power. You feel comfortable in a follower role.',
        },
        'medium': {
          'ru':
              'У вас здоровое стремление к силе и контролю. Вы можете быть лидером, но также признаете свою уязвимость.',
          'en':
              'You have a healthy drive for strength and control. You can be a leader but also acknowledge your vulnerability.',
        },
        'high': {
          'ru':
              'Лидер — ваша основная мотивация. Вы стремитесь к силе, контролю и защите. Важно практиковать уязвимость и развивать эмпатию.',
          'en':
              'Leader is your primary motivation. You strive for strength, control, and protection. It\'s important to practice vulnerability and develop empathy.',
        },
      },
      'harmonizer': {
        'low': {
          'ru':
              'Вы не слишком избегаете конфликтов и напряжения. Вы можете отстаивать свою позицию.',
          'en':
              'You don\'t excessively avoid conflicts and tension. You can stand your ground.',
        },
        'medium': {
          'ru':
              'У вас здоровое стремление к гармонии. Вы цените мир, но можете справляться с конфликтами.',
          'en':
              'You have a healthy drive for harmony. You value peace but can handle conflicts.',
        },
        'high': {
          'ru':
              'Гармонизатор — ваша основная мотивация. Вы стремитесь к миру, комфорту и избегаете конфликтов. Важно развивать ассертивность и определять свои приоритеты.',
          'en':
              'Harmonizer is your primary motivation. You strive for peace, comfort, and avoid conflicts. It\'s important to develop assertiveness and define your priorities.',
        },
      },
    };
  }

  /// All 9 profiles + balanced
  static final Map<String, TestProfile> _profiles = {
    'idealist': TestProfile(
      id: 'idealist',
      name: {
        'ru': 'Идеалист',
        'en': 'Idealist',
      },
      description: {
        'ru':
            'Вы движимы глубоким стремлением к совершенству и правильности. Ваша жизнь — это постоянный процесс самосовершенствования и улучшения мира вокруг вас. Вы обладаете сильным внутренним компасом этики и морали, который направляет все ваши действия. Вы замечаете несоответствия и ошибки там, где другие их не видят, и чувствуете ответственность за их исправление.\n\nВаша внутренняя критика может быть очень требовательной, заставляя вас постоянно оценивать себя и свои действия. Вы верите, что всегда есть «правильный» способ делать вещи, и стремитесь найти его. Ваша дисциплина, честность и приверженность принципам делают вас надежным и уважаемым человеком.',
        'en':
            'You are driven by a deep desire for perfection and correctness. Your life is a constant process of self-improvement and making the world around you better. You possess a strong internal compass of ethics and morality that guides all your actions. You notice inconsistencies and errors where others don\'t see them, and feel responsible for correcting them.\n\nYour inner critic can be very demanding, constantly making you evaluate yourself and your actions. You believe there\'s always a \'right\' way to do things and strive to find it. Your discipline, honesty, and commitment to principles make you a reliable and respected person.',
      },
      whyThisProfile: {
        'ru':
            'Этот профиль определён потому, что вы набрали наивысшие баллы по шкале Идеалиста. Ваши ответы показывают, что для вас критически важны высокие стандарты, правильность действий и стремление к совершенству.',
        'en':
            'This profile is determined because you scored highest on the Idealist scale. Your answers show that high standards, correct actions, and striving for perfection are critically important to you.',
      },
      strengths: {
        'ru': [
          'Целостность и принципиальность',
          'Способность видеть и исправлять ошибки',
          'Высокая работоспособность',
          'Честность и прямота',
          'Стремление улучшить мир',
        ],
        'en': [
          'Integrity and principles',
          'Ability to see and correct errors',
          'High work capacity',
          'Honesty and directness',
          'Desire to improve the world',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Чрезмерная самокритика',
          'Перфекционизм, мешающий завершению задач',
          'Критичность к другим',
          'Подавленный гнев и раздражение',
          'Трудности с принятием несовершенства',
        ],
        'en': [
          'Excessive self-criticism',
          'Perfectionism hindering task completion',
          'Being critical of others',
          'Suppressed anger and irritation',
          'Difficulty accepting imperfection',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте самосострадание и принятие себя',
          'Учитесь видеть «достаточно хорошо» как приемлемый результат',
          'Разрешите себе ошибаться',
          'Развивайте спонтанность и гибкость',
          'Признавайте свой гнев и выражайте его конструктивно',
        ],
        'en': [
          'Practice self-compassion and self-acceptance',
          'Learn to see \'good enough\' as acceptable',
          'Allow yourself to make mistakes',
          'Develop spontaneity and flexibility',
          'Acknowledge your anger and express it constructively',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня сделайте что-то «достаточно хорошо» вместо «идеально» и заметьте, что мир не рухнул. Отпустите перфекционизм хотя бы на один час.',
        'en':
            'Today do something \'good enough\' instead of \'perfect\' and notice that the world didn\'t collapse. Let go of perfectionism for at least one hour.',
      },
      inspiringConclusion: {
        'ru':
            'Ваше стремление к совершенству — это дар, но помните: вы уже достаточно хороши именно такими, какие вы есть. Несовершенство — это часть человечности.',
        'en':
            'Your pursuit of perfection is a gift, but remember: you are already good enough just as you are. Imperfection is part of being human.',
      },
    ),
    'altruist': TestProfile(
      id: 'altruist',
      name: {
        'ru': 'Альтруист',
        'en': 'Altruist',
      },
      description: {
        'ru':
            'Вы ориентированы на отношения и глубоко мотивированы желанием быть полезным и любимым. Ваша эмпатия и способность чувствовать потребности других делают вас незаменимым другом и помощником. Вы получаете удовлетворение от того, что помогаете людям решать их проблемы, и часто ставите нужды других выше собственных.\n\nВаша щедрость и теплота создают вокруг вас атмосферу заботы и поддержки. Вы интуитивно понимаете, что нужно другим, иногда даже раньше, чем они сами. Однако вам важно помнить о собственных потребностях и не растворяться полностью в заботе о других.',
        'en':
            'You are relationship-oriented and deeply motivated by the desire to be helpful and loved. Your empathy and ability to sense others\' needs make you an indispensable friend and helper. You gain satisfaction from helping people solve their problems and often put others\' needs above your own.\n\nYour generosity and warmth create an atmosphere of care and support around you. You intuitively understand what others need, sometimes even before they do. However, it\'s important for you to remember your own needs and not dissolve completely in caring for others.',
      },
      whyThisProfile: {
        'ru':
            'Этот профиль определён потому, что вы набрали наивысшие баллы по шкале Альтруиста. Ваши ответы показывают, что забота о других и желание быть нужным — ключевые движущие силы вашей личности.',
        'en':
            'This profile is determined because you scored highest on the Altruist scale. Your answers show that caring for others and the desire to be needed are key driving forces of your personality.',
      },
      strengths: {
        'ru': [
          'Способность создавать глубокие связи',
          'Понимание эмоциональных потребностей',
          'Щедрость и великодушие',
          'Навыки поддержки и утешения',
          'Умение мотивировать других',
        ],
        'en': [
          'Ability to create deep connections',
          'Understanding emotional needs',
          'Generosity and magnanimity',
          'Support and comfort skills',
          'Ability to motivate others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Игнорирование собственных потребностей',
          'Манипуляция через заботу',
          'Зависимость от признания',
          'Трудности с границами',
          'Подавление собственных чувств',
        ],
        'en': [
          'Ignoring own needs',
          'Manipulation through care',
          'Dependence on recognition',
          'Difficulty with boundaries',
          'Suppression of own feelings',
        ],
      },
      recommendations: {
        'ru': [
          'Учитесь распознавать и выражать свои потребности',
          'Развивайте способность принимать помощь',
          'Устанавливайте здоровые границы',
          'Практикуйте заботу о себе',
          'Осознавайте свою ценность независимо от помощи другим',
        ],
        'en': [
          'Learn to recognize and express your needs',
          'Develop ability to accept help',
          'Set healthy boundaries',
          'Practice self-care',
          'Recognize your worth independent of helping others',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня скажите «нет» одной просьбе и посвятите это время себе. Заметьте, что отношения не разрушились.',
        'en':
            'Today say \'no\' to one request and dedicate that time to yourself. Notice that relationships didn\'t collapse.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша забота — это дар миру, но помните: вы ценны не только тем, что даете другим. Вы достойны любви просто за то, что вы есть.',
        'en':
            'Your care is a gift to the world, but remember: you are valuable not only for what you give to others. You are worthy of love simply for being who you are.',
      },
    ),
    'achiever': TestProfile(
      id: 'achiever',
      name: {
        'ru': 'Достигатель',
        'en': 'Achiever',
      },
      description: {
        'ru':
            'Вы ориентированы на результат и мотивированы достижением видимых успехов. Ваша энергия, целеустремленность и способность адаптироваться помогают вам эффективно достигать поставленных целей. Вы знаете, как произвести впечатление и представить себя в лучшем свете, что делает вас успешным в карьере и социальных ситуациях.\n\nВы измеряете свою ценность через достижения и признание других. Ваша продуктивность и способность к многозадачности впечатляют окружающих. Однако важно помнить, что ваша истинная ценность не зависит только от внешних успехов.',
        'en':
            'You are results-oriented and motivated by achieving visible success. Your energy, determination, and ability to adapt help you effectively reach your goals. You know how to make an impression and present yourself in the best light, making you successful in career and social situations.\n\nYou measure your worth through achievements and others\' recognition. Your productivity and multitasking ability impress those around you. However, it\'s important to remember that your true worth doesn\'t depend only on external success.',
      },
      whyThisProfile: {
        'ru':
            'Этот профиль определён потому, что вы набрали наивысшие баллы по шкале Достигателя. Ваши ответы показывают, что достижение целей и признание успехов — главные драйверы вашей мотивации.',
        'en':
            'This profile is determined because you scored highest on the Achiever scale. Your answers show that achieving goals and recognition of success are the main drivers of your motivation.',
      },
      strengths: {
        'ru': [
          'Способность достигать целей',
          'Мотивация и энергичность',
          'Навыки самопрезентации',
          'Практичность',
          'Вдохновение для других',
        ],
        'en': [
          'Ability to achieve goals',
          'Motivation and energy',
          'Self-presentation skills',
          'Practicality',
          'Inspiration for others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Отождествление себя с достижениями',
          'Поверхностность в отношениях',
          'Трудоголизм',
          'Страх неудачи',
          'Обман для достижения успеха',
        ],
        'en': [
          'Identifying self with achievements',
          'Superficiality in relationships',
          'Workaholism',
          'Fear of failure',
          'Deception to achieve success',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте аутентичность',
          'Цените процесс, а не только результат',
          'Осознайте свою ценность вне достижений',
          'Углубляйте эмоциональные связи',
          'Практикуйте уязвимость',
        ],
        'en': [
          'Develop authenticity',
          'Value process, not just result',
          'Recognize your worth beyond achievements',
          'Deepen emotional connections',
          'Practice vulnerability',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня проведите время с близкими без цели «достичь» чего-то. Просто будьте, не делайте.',
        'en':
            'Today spend time with loved ones without the goal of \'achieving\' something. Just be, don\'t do.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша способность достигать вдохновляет, но помните: вы ценны не за свои успехи, а за то, кто вы есть. Позвольте себе просто быть.',
        'en':
            'Your ability to achieve inspires, but remember: you are valuable not for your successes, but for who you are. Allow yourself to simply be.',
      },
    ),
    'creator': TestProfile(
      id: 'creator',
      name: {
        'ru': 'Созидатель',
        'en': 'Creator',
      },
      description: {
        'ru':
            'Вы глубоко эмоциональны и мотивированы поиском уникальности и смысла. Ваша способность к глубокой рефлексии и эмоциональная восприимчивость позволяют вам создавать что-то по-настоящему оригинальное. Вы цените красоту, аутентичность и глубину во всех аспектах жизни.\n\nВы часто чувствуете, что отличаетесь от других, и эта особенность может быть как источником вдохновения, так и одиночества. Ваша богатая внутренняя жизнь и способность к творческому самовыражению делают вас уникальным. Однако важно не идеализировать то, чего у вас нет, и ценить то, что есть.',
        'en':
            'You are deeply emotional and motivated by seeking uniqueness and meaning. Your capacity for deep reflection and emotional sensitivity allow you to create something truly original. You value beauty, authenticity, and depth in all aspects of life.\n\nYou often feel different from others, and this particularity can be both a source of inspiration and loneliness. Your rich inner life and ability for creative self-expression make you unique. However, it\'s important not to idealize what you don\'t have and value what you do.',
      },
      whyThisProfile: {
        'ru':
            'Этот профиль определён потому, что вы набрали наивысшие баллы по шкале Созидателя. Ваши ответы показывают, что уникальность, глубина и аутентичность — центральные темы вашей жизни.',
        'en':
            'This profile is determined because you scored highest on the Creator scale. Your answers show that uniqueness, depth, and authenticity are central themes of your life.',
      },
      strengths: {
        'ru': [
          'Творческое мышление',
          'Эмоциональная честность',
          'Способность видеть красоту',
          'Глубина понимания',
          'Аутентичность',
        ],
        'en': [
          'Creative thinking',
          'Emotional honesty',
          'Ability to see beauty',
          'Depth of understanding',
          'Authenticity',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Меланхолия и депрессия',
          'Зависть к другим',
          'Идеализация недостижимого',
          'Эмоциональная нестабильность',
          'Самопоглощенность',
        ],
        'en': [
          'Melancholy and depression',
          'Envy of others',
          'Idealizing the unattainable',
          'Emotional instability',
          'Self-absorption',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте принятие обыденного',
          'Цените то, что у вас есть',
          'Развивайте эмоциональную стабильность',
          'Баланс между внутренним миром и внешней реальностью',
          'Превращайте эмоции в конструктивное творчество',
        ],
        'en': [
          'Practice accepting the ordinary',
          'Appreciate what you have',
          'Develop emotional stability',
          'Balance between inner world and external reality',
          'Transform emotions into constructive creativity',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня найдите красоту в чем-то обыденном. Позвольте обычному стать особенным через ваш взгляд.',
        'en':
            'Today find beauty in something ordinary. Allow the common to become special through your gaze.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша уникальность — это дар, но помните: вы особенны не потому, что отличаетесь, а просто потому, что вы есть.',
        'en':
            'Your uniqueness is a gift, but remember: you are special not because you are different, but simply because you exist.',
      },
    ),
    'analyst': TestProfile(
      id: 'analyst',
      name: {
        'ru': 'Аналитик',
        'en': 'Analyst',
      },
      description: {
        'ru':
            'Вы интеллектуально любознательны и мотивированы глубоким пониманием. Ваша способность к анализу и накоплению знаний делает вас экспертом в выбранных областях. Вы цените независимость, уединение и время для размышлений.\n\nВы предпочитаете наблюдать и анализировать, прежде чем действовать. Ваша потребность в понимании и компетентности движет вашим постоянным стремлением к знаниям. Вы можете отстраняться от эмоций, чтобы сохранить ясность мышления, но важно также оставаться связанным с миром и людьми.',
        'en':
            'You are intellectually curious and motivated by deep understanding. Your analytical ability and knowledge accumulation make you an expert in chosen fields. You value independence, solitude, and time for reflection.\n\nYou prefer to observe and analyze before acting. Your need for understanding and competence drives your constant pursuit of knowledge. You can detach from emotions to maintain mental clarity, but it\'s also important to stay connected with the world and people.',
      },
      whyThisProfile: {
        'ru':
            'Этот профиль определён потому, что вы набрали наивысшие баллы по шкале Аналитика. Ваши ответы показывают, что понимание, компетентность и накопление знаний — ваши главные мотиваторы.',
        'en':
            'This profile is determined because you scored highest on the Analyst scale. Your answers show that understanding, competence, and knowledge accumulation are your main motivators.',
      },
      strengths: {
        'ru': [
          'Глубокие знания',
          'Объективность',
          'Способность к концентрации',
          'Инновационное мышление',
          'Самодостаточность',
        ],
        'en': [
          'Deep knowledge',
          'Objectivity',
          'Concentration ability',
          'Innovative thinking',
          'Self-sufficiency',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Социальная изоляция',
          'Эмоциональная отстраненность',
          'Паралич анализа',
          'Скупость (эмоциональная и материальная)',
          'Высокомерие знания',
        ],
        'en': [
          'Social isolation',
          'Emotional detachment',
          'Analysis paralysis',
          'Stinginess (emotional and material)',
          'Knowledge arrogance',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте эмоциональную связь',
          'Делитесь знаниями с другими',
          'Переходите от анализа к действию',
          'Развивайте щедрость',
          'Баланс между размышлением и участием в жизни',
        ],
        'en': [
          'Practice emotional connection',
          'Share knowledge with others',
          'Move from analysis to action',
          'Develop generosity',
          'Balance between reflection and life participation',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня поделитесь своими знаниями с кем-то или начните действовать, не дожидаясь полного понимания.',
        'en':
            'Today share your knowledge with someone or start acting without waiting for complete understanding.',
      },
      inspiringConclusion: {
        'ru':
            'Ваше понимание — это сокровище, но помните: жизнь не требует полного знания, чтобы быть прожитой. Иногда действие важнее анализа.',
        'en':
            'Your understanding is a treasure, but remember: life doesn\'t require complete knowledge to be lived. Sometimes action is more important than analysis.',
      },
    ),
    'guardian': TestProfile(
      id: 'guardian',
      name: {
        'ru': 'Защитник',
        'en': 'Guardian',
      },
      description: {
        'ru':
            'Вы мотивированы потребностью в безопасности и надежности. Ваша верность, ответственность и способность предвидеть проблемы делают вас надежным партнером и членом команды. Вы цените структуру, последовательность и доверие.\n\nВы внимательно оцениваете риски и тщательно планируете будущее. Ваша лояльность к людям и организациям, заслужившим ваше доверие, непоколебима. Вы можете испытывать тревогу по поводу неопределенности, но эта бдительность также помогает вам и другим избегать опасностей.',
        'en':
            'You are motivated by the need for security and reliability. Your loyalty, responsibility, and ability to foresee problems make you a reliable partner and team member. You value structure, consistency, and trust.\n\nYou carefully assess risks and thoroughly plan for the future. Your loyalty to people and organizations that have earned your trust is unwavering. You may experience anxiety about uncertainty, but this vigilance also helps you and others avoid dangers.',
      },
      whyThisProfile: {
        'ru':
            'Этот профиль определён потому, что вы набрали наивысшие баллы по шкале Защитника. Ваши ответы показывают, что безопасность, надежность и структура — ключевые для вас ценности.',
        'en':
            'This profile is determined because you scored highest on the Guardian scale. Your answers show that security, reliability, and structure are key values for you.',
      },
      strengths: {
        'ru': [
          'Надежность',
          'Способность предвидеть проблемы',
          'Командная работа',
          'Верность принципам',
          'Подготовленность',
        ],
        'en': [
          'Reliability',
          'Ability to foresee problems',
          'Teamwork',
          'Loyalty to principles',
          'Preparedness',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Хроническая тревожность',
          'Чрезмерная зависимость от авторитетов',
          'Параноидальность',
          'Избегание рисков',
          'Прокрастинация из-за страха',
        ],
        'en': [
          'Chronic anxiety',
          'Excessive dependence on authorities',
          'Paranoia',
          'Risk avoidance',
          'Procrastination due to fear',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте доверие к себе',
          'Практикуйте управление тревогой',
          'Отличайте реальные угрозы от воображаемых',
          'Принимайте неопределенность',
          'Развивайте внутренний авторитет',
        ],
        'en': [
          'Develop self-trust',
          'Practice anxiety management',
          'Distinguish real threats from imaginary',
          'Accept uncertainty',
          'Develop internal authority',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня сделайте что-то спонтанное без планирования. Позвольте себе доверять моменту.',
        'en':
            'Today do something spontaneous without planning. Allow yourself to trust the moment.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша осторожность защищает вас и других, но помните: жизнь требует доверия к неизвестному. Вы сильнее, чем думаете.',
        'en':
            'Your caution protects you and others, but remember: life requires trust in the unknown. You are stronger than you think.',
      },
    ),
    'optimist': TestProfile(
      id: 'optimist',
      name: {
        'ru': 'Оптимист',
        'en': 'Optimist',
      },
      description: {
        'ru':
            'Вы мотивированы стремлением к радости, свободе и новизне. Ваш энтузиазм, оптимизм и способность видеть возможности делают вас источником вдохновения для окружающих. Вы ищете разнообразие и приключения во всех сферах жизни.\n\nВы фокусируетесь на позитивных возможностях будущего и избегаете негативных эмоций, переключаясь на что-то приятное. Ваша способность находить радость и превращать обыденное в интересное ценится другими. Однако важно также научиться справляться с трудностями, а не только избегать их.',
        'en':
            'You are motivated by the pursuit of joy, freedom, and novelty. Your enthusiasm, optimism, and ability to see possibilities make you a source of inspiration for others. You seek variety and adventure in all areas of life.\n\nYou focus on positive future possibilities and avoid negative emotions by switching to something pleasant. Your ability to find joy and make the ordinary interesting is valued by others. However, it\'s also important to learn to deal with difficulties rather than just avoid them.',
      },
      whyThisProfile: {
        'ru':
            'Этот профиль определён потому, что вы набрали наивысшие баллы по шкале Оптимиста. Ваши ответы показывают, что радость, новизна и избегание боли — ваши главные мотиваторы.',
        'en':
            'This profile is determined because you scored highest on the Optimist scale. Your answers show that joy, novelty, and pain avoidance are your main motivators.',
      },
      strengths: {
        'ru': [
          'Способность вдохновлять',
          'Креативность и инновации',
          'Адаптивность',
          'Оптимистичный взгляд',
          'Энергичность',
        ],
        'en': [
          'Ability to inspire',
          'Creativity and innovation',
          'Adaptability',
          'Optimistic outlook',
          'Energy',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Поверхностность',
          'Импульсивность',
          'Избегание негативных эмоций',
          'Неспособность завершать проекты',
          'Саморазрушительное поведение под маской веселья',
        ],
        'en': [
          'Superficiality',
          'Impulsiveness',
          'Avoidance of negative emotions',
          'Inability to complete projects',
          'Self-destructive behavior behind mask of fun',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте присутствие в настоящем',
          'Учитесь справляться с дискомфортом',
          'Развивайте глубину вместо широты',
          'Завершайте начатые проекты',
          'Признавайте негативные эмоции',
        ],
        'en': [
          'Practice presence in the moment',
          'Learn to deal with discomfort',
          'Develop depth instead of breadth',
          'Complete started projects',
          'Acknowledge negative emotions',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня позвольте себе почувствовать одну негативную эмоцию, не убегая от неё. Просто посидите с ней.',
        'en':
            'Today allow yourself to feel one negative emotion without running from it. Just sit with it.',
      },
      inspiringConclusion: {
        'ru':
            'Ваш оптимизм освещает мир, но помните: настоящая радость приходит не от избегания боли, а от принятия всей полноты жизни.',
        'en':
            'Your optimism lights up the world, but remember: true joy comes not from avoiding pain, but from accepting the fullness of life.',
      },
    ),
    'leader': TestProfile(
      id: 'leader',
      name: {
        'ru': 'Лидер',
        'en': 'Leader',
      },
      description: {
        'ru':
            'Вы мотивированы силой, контролем и справедливостью. Ваша уверенность, решительность и способность брать на себя ответственность делают вас естественным лидером. Вы не боитесь конфликтов и готовы защищать слабых и отстаивать справедливость.\n\nВы цените прямоту, честность и силу, как в себе, так и в других. Ваша энергия и способность к действию впечатляют. Вы контролируете ситуации, чтобы защитить себя и тех, кто зависит от вас. Однако важно также признавать свою уязвимость и не скрывать ее за маской силы.',
        'en':
            'You are motivated by strength, control, and justice. Your confidence, decisiveness, and ability to take responsibility make you a natural leader. You\'re not afraid of conflicts and ready to defend the weak and uphold justice.\n\nYou value directness, honesty, and strength, both in yourself and others. Your energy and capacity for action are impressive. You control situations to protect yourself and those who depend on you. However, it\'s also important to acknowledge your vulnerability and not hide it behind a mask of strength.',
      },
      whyThisProfile: {
        'ru':
            'Этот профиль определён потому, что вы набрали наивысшие баллы по шкале Лидера. Ваши ответы показывают, что сила, контроль и защита — центральные темы вашей личности.',
        'en':
            'This profile is determined because you scored highest on the Leader scale. Your answers show that strength, control, and protection are central themes of your personality.',
      },
      strengths: {
        'ru': [
          'Лидерские качества',
          'Защита справедливости',
          'Способность к действию',
          'Честность',
          'Сила характера',
        ],
        'en': [
          'Leadership qualities',
          'Justice protection',
          'Action capacity',
          'Honesty',
          'Strength of character',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Доминирование и контроль',
          'Агрессивность',
          'Отрицание уязвимости',
          'Импульсивность',
          'Нечувствительность к другим',
        ],
        'en': [
          'Domination and control',
          'Aggressiveness',
          'Denial of vulnerability',
          'Impulsiveness',
          'Insensitivity to others',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте уязвимость',
          'Развивайте эмпатию',
          'Учитесь делегировать контроль',
          'Канализируйте энергию конструктивно',
          'Признавайте свои слабости',
        ],
        'en': [
          'Practice vulnerability',
          'Develop empathy',
          'Learn to delegate control',
          'Channel energy constructively',
          'Acknowledge your weaknesses',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня поделитесь с кем-то своей уязвимостью. Покажите, что за силой скрывается человек.',
        'en':
            'Today share your vulnerability with someone. Show that behind strength there is a person.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша сила вдохновляет, но помните: настоящая сила — это способность быть уязвимым. Мягкость — это тоже храбрость.',
        'en':
            'Your strength inspires, but remember: true strength is the ability to be vulnerable. Softness is also courage.',
      },
    ),
    'harmonizer': TestProfile(
      id: 'harmonizer',
      name: {
        'ru': 'Гармонизатор',
        'en': 'Harmonizer',
      },
      description: {
        'ru':
            'Вы мотивированы сохранением мира, гармонии и внутреннего покоя. Ваша способность видеть разные точки зрения и создавать атмосферу принятия делает вас отличным медиатором. Вы цените стабильность, комфорт и отсутствие напряжения.\n\nВы легко адаптируетесь к мнению других и предпочитаете избегать конфликтов. Ваше спокойствие и принятие создают безопасное пространство для окружающих. Однако важно также не забывать о своих собственных желаниях и приоритетах, не растворяясь полностью в потоке жизни.',
        'en':
            'You are motivated by maintaining peace, harmony, and inner calm. Your ability to see different perspectives and create an atmosphere of acceptance makes you an excellent mediator. You value stability, comfort, and absence of tension.\n\nYou easily adapt to others\' opinions and prefer to avoid conflicts. Your calmness and acceptance create a safe space for those around you. However, it\'s also important not to forget your own desires and priorities, not dissolving completely in the flow of life.',
      },
      whyThisProfile: {
        'ru':
            'Этот профиль определён потому, что вы набрали наивысшие баллы по шкале Гармонизатора. Ваши ответы показывают, что мир, гармония и избегание конфликтов — ваши главные приоритеты.',
        'en':
            'This profile is determined because you scored highest on the Harmonizer scale. Your answers show that peace, harmony, and conflict avoidance are your main priorities.',
      },
      strengths: {
        'ru': [
          'Создание гармонии',
          'Медиация',
          'Принятие различий',
          'Терпение',
          'Стабилизация группы',
        ],
        'en': [
          'Creating harmony',
          'Mediation',
          'Accepting differences',
          'Patience',
          'Group stabilization',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Пассивность',
          'Прокрастинация',
          'Потеря себя в отношениях',
          'Избегание важных решений',
          'Пассивная агрессия',
        ],
        'en': [
          'Passivity',
          'Procrastination',
          'Losing oneself in relationships',
          'Avoiding important decisions',
          'Passive aggression',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте ассертивность',
          'Определяйте свои приоритеты',
          'Практикуйте принятие решений',
          'Признавайте свои потребности',
          'Учитесь конструктивному конфликту',
        ],
        'en': [
          'Develop assertiveness',
          'Define your priorities',
          'Practice decision-making',
          'Acknowledge your needs',
          'Learn constructive conflict',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня выразите свое мнение, даже если оно противоречит другим. Заметьте, что мир не разрушился.',
        'en':
            'Today express your opinion even if it contradicts others. Notice that the world didn\'t fall apart.',
      },
      inspiringConclusion: {
        'ru':
            'Ваше умиротворение — это дар, но помните: настоящая гармония включает и ваш голос. Вы имеете право занимать место в мире.',
        'en':
            'Your peacefulness is a gift, but remember: true harmony includes your voice too. You have the right to take up space in the world.',
      },
    ),
    'balanced': TestProfile(
      id: 'balanced',
      name: {
        'ru': 'Сбалансированный профиль',
        'en': 'Balanced Profile',
      },
      description: {
        'ru':
            'Ваш профиль показывает сбалансированность мотивационных стратегий. У вас нет явно доминирующего типа мотивации, что означает, что вы гибки и можете адаптироваться к различным ситуациям, используя разные стратегии в зависимости от контекста.\n\nЭто может быть как преимуществом (гибкость, адаптивность), так и вызовом (отсутствие четкого направления, внутренняя противоречивость). Важно развивать осознанность того, какая стратегия работает лучше в каких ситуациях.',
        'en':
            'Your profile shows balanced motivational strategies. You don\'t have a clearly dominant motivation type, which means you are flexible and can adapt to various situations, using different strategies depending on the context.\n\nThis can be both an advantage (flexibility, adaptability) and a challenge (lack of clear direction, internal contradictions). It\'s important to develop awareness of which strategy works best in which situations.',
      },
      whyThisProfile: {
        'ru':
            'Этот профиль определён потому, что разница между вашими высшими баллами менее 5%. Это указывает на то, что несколько мотивационных стратегий играют равную роль в вашей жизни.',
        'en':
            'This profile is determined because the difference between your highest scores is less than 5%. This indicates that several motivational strategies play an equal role in your life.',
      },
      strengths: {
        'ru': [
          'Гибкость и адаптивность',
          'Способность понимать разные перспективы',
          'Многогранность личности',
          'Отсутствие крайностей',
          'Богатый внутренний мир',
        ],
        'en': [
          'Flexibility and adaptability',
          'Ability to understand different perspectives',
          'Multifaceted personality',
          'Absence of extremes',
          'Rich inner world',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Отсутствие четкого направления',
          'Внутренняя противоречивость',
          'Сложность с самоопределением',
          'Распыление энергии',
          'Трудности с выбором приоритетов',
        ],
        'en': [
          'Lack of clear direction',
          'Internal contradictions',
          'Difficulty with self-definition',
          'Energy dispersion',
          'Difficulty choosing priorities',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте осознанность своих мотиваций',
          'Определите, какие стратегии работают в каких ситуациях',
          'Не пытайтесь быть «всем для всех»',
          'Найдите свой уникальный баланс',
          'Цените свою многогранность',
        ],
        'en': [
          'Develop awareness of your motivations',
          'Determine which strategies work in which situations',
          'Don\'t try to be \'everything to everyone\'',
          'Find your unique balance',
          'Appreciate your multifacetedness',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня заметьте, какая мотивационная стратегия естественно проявляется в разных ситуациях. Просто наблюдайте.',
        'en':
            'Today notice which motivational strategy naturally manifests in different situations. Just observe.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша сбалансированность — это не недостаток определенности, а богатство возможностей. Вы можете быть многим, и это ваша сила.',
        'en':
            'Your balance is not a lack of definition, but a richness of possibilities. You can be many things, and that is your strength.',
      },
    ),
  };
}
