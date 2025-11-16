import '../models/test_model.dart';

/// Data access class for Holland Code Career Test
/// Legacy Dart implementation (no JSON dependency)
class HollandCodeData {
  /// Get the complete Holland Code test
  static TestModel getHollandCodeTest() {
    return TestModel(
      id: 'holland_code_v1',
      title: {
        'ru': 'Holland Code: Профессиональные интересы и карьера',
        'en': 'Holland Code: Professional Interests and Career',
      },
      description: {
        'ru':
            'Holland Code (RIASEC) — это научно обоснованная теория профессиональных интересов, разработанная психологом Джоном Холландом в 1950-х годах и используемая во всём мире для профориентации. Теория утверждает, что люди и рабочие среды можно классифицировать по шести типам, и наибольшее удовлетворение от карьеры достигается при соответствии типа личности и типа рабочей среды.\n\nИсследования показывают, что люди, работающие в средах, соответствующих их типу Холланда, демонстрируют более высокую удовлетворённость работой, лучшие результаты и производительность, меньший уровень стресса и выгорания, большую вовлечённость и мотивацию, более длительное пребывание в профессии.\n\nВаш Holland Code — это комбинация трёх наиболее выраженных типов (например, IAS, RIE, SEC), которая указывает на наиболее подходящие для вас профессии и рабочие среды.',
        'en':
            'Holland Code (RIASEC) is a scientifically-based theory of professional interests developed by psychologist John Holland in the 1950s and used worldwide for career guidance. The theory states that people and work environments can be classified into six types, and the greatest career satisfaction is achieved when personality type and work environment type match.\n\nResearch shows that people working in environments that match their Holland type demonstrate higher job satisfaction, better performance and productivity, lower stress and burnout levels, greater engagement and motivation, and longer tenure in the profession.\n\nYour Holland Code is a combination of your three most prominent types (e.g., IAS, RIE, SEC), which indicates the most suitable professions and work environments for you.',
      },
      category: {
        'ru': 'Карьера и профориентация',
        'en': 'Career and Vocational Guidance',
      },
      categoryId: 'career',
      disclaimer: {
        'ru':
            'Этот тест основан на теории профессиональных интересов Джона Холланда (RIASEC). Он предназначен для профессиональной ориентации и самопознания. Результаты носят рекомендательный характер. Для детального карьерного консультирования рекомендуется обратиться к специалисту.',
        'en':
            'This test is based on John Holland\'s theory of professional interests (RIASEC). It is designed for career guidance and self-discovery. The results are for guidance only. For detailed career counseling, please consult a specialist.',
      },
      estimatedTime: 12,
      type: TestType.multiFactor,
      factorIds: [
        'realistic',
        'investigative',
        'artistic',
        'social',
        'enterprising',
        'conventional',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'realistic': {
        'ru': 'Реалистичный (R)',
        'en': 'Realistic (R)',
      },
      'investigative': {
        'ru': 'Исследовательский (I)',
        'en': 'Investigative (I)',
      },
      'artistic': {
        'ru': 'Артистичный (A)',
        'en': 'Artistic (A)',
      },
      'social': {
        'ru': 'Социальный (S)',
        'en': 'Social (S)',
      },
      'enterprising': {
        'ru': 'Предпринимательский (E)',
        'en': 'Enterprising (E)',
      },
      'conventional': {
        'ru': 'Конвенциональный (C)',
        'en': 'Conventional (C)',
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

    // Determine range: 0-40 (low), 41-70 (medium), 71-100 (high)
    final String level;
    if (percentage <= 40) {
      level = 'low';
    } else if (percentage <= 70) {
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

  /// Get all 60 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Realistic questions (1, 7, 13, 19, 25, 31, 37, 43, 49, 55)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Работать с инструментами и механизмами',
          'en': 'Work with tools and machinery',
        },
        factorId: 'realistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Проводить научные эксперименты и исследования',
          'en': 'Conduct scientific experiments and research',
        },
        factorId: 'investigative',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Создавать художественные или дизайнерские работы',
          'en': 'Create artistic or design works',
        },
        factorId: 'artistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Помогать людям решать их проблемы',
          'en': 'Help people solve their problems',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Управлять проектами и руководить людьми',
          'en': 'Manage projects and lead people',
        },
        factorId: 'enterprising',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Организовывать данные и создавать системы учёта',
          'en': 'Organize data and create accounting systems',
        },
        factorId: 'conventional',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Строить или ремонтировать что-то своими руками',
          'en': 'Build or repair things with your hands',
        },
        factorId: 'realistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Анализировать данные и искать закономерности',
          'en': 'Analyze data and look for patterns',
        },
        factorId: 'investigative',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Писать творческие тексты или музыку',
          'en': 'Write creative texts or music',
        },
        factorId: 'artistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Обучать или наставлять других людей',
          'en': 'Teach or mentor other people',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Продавать идеи, продукты или услуги',
          'en': 'Sell ideas, products or services',
        },
        factorId: 'enterprising',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Вести учёт финансов и документов',
          'en': 'Keep financial records and documents',
        },
        factorId: 'conventional',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Работать на открытом воздухе с природой или животными',
          'en': 'Work outdoors with nature or animals',
        },
        factorId: 'realistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Решать сложные математические или научные задачи',
          'en': 'Solve complex mathematical or scientific problems',
        },
        factorId: 'investigative',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Играть на музыкальном инструменте или петь',
          'en': 'Play a musical instrument or sing',
        },
        factorId: 'artistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Консультировать людей по личным вопросам',
          'en': 'Counsel people on personal matters',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Начинать собственный бизнес или проект',
          'en': 'Start your own business or project',
        },
        factorId: 'enterprising',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Работать по чётким инструкциям и процедурам',
          'en': 'Work according to clear instructions and procedures',
        },
        factorId: 'conventional',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Управлять транспортными средствами или машинами',
          'en': 'Operate vehicles or machinery',
        },
        factorId: 'realistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Читать научные статьи и книги',
          'en': 'Read scientific articles and books',
        },
        factorId: 'investigative',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Создавать оригинальные визуальные образы',
          'en': 'Create original visual images',
        },
        factorId: 'artistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Заботиться о больных или пожилых людях',
          'en': 'Care for sick or elderly people',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Убеждать других в своей точке зрения',
          'en': 'Persuade others to your point of view',
        },
        factorId: 'enterprising',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Проверять правильность информации и данных',
          'en': 'Verify the accuracy of information and data',
        },
        factorId: 'conventional',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Работать с электроникой или компьютерным оборудованием',
          'en': 'Work with electronics or computer hardware',
        },
        factorId: 'realistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Изучать новые теории и концепции',
          'en': 'Study new theories and concepts',
        },
        factorId: 'investigative',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Выступать на сцене или перед камерой',
          'en': 'Perform on stage or in front of a camera',
        },
        factorId: 'artistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Работать с детьми или подростками',
          'en': 'Work with children or teenagers',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Принимать важные бизнес-решения',
          'en': 'Make important business decisions',
        },
        factorId: 'enterprising',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Сортировать и классифицировать информацию',
          'en': 'Sort and classify information',
        },
        factorId: 'conventional',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      // Continue with q31-q60...
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Заниматься физической работой или спортом',
          'en': 'Engage in physical work or sports',
        },
        factorId: 'realistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Проводить лабораторные исследования',
          'en': 'Conduct laboratory research',
        },
        factorId: 'investigative',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Создавать что-то уникальное и необычное',
          'en': 'Create something unique and unusual',
        },
        factorId: 'artistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Вдохновлять и мотивировать других людей',
          'en': 'Inspire and motivate other people',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Организовывать крупные мероприятия',
          'en': 'Organize large events',
        },
        factorId: 'enterprising',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Следовать установленным правилам и стандартам',
          'en': 'Follow established rules and standards',
        },
        factorId: 'conventional',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Собирать или разбирать механизмы',
          'en': 'Assemble or disassemble mechanisms',
        },
        factorId: 'realistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Разрабатывать новые методы решения проблем',
          'en': 'Develop new methods for solving problems',
        },
        factorId: 'investigative',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Работать над фильмом или театральной постановкой',
          'en': 'Work on a film or theatrical production',
        },
        factorId: 'artistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'Работать в благотворительной или социальной организации',
          'en': 'Work in a charitable or social organization',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Вести переговоры и заключать сделки',
          'en': 'Negotiate and close deals',
        },
        factorId: 'enterprising',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Составлять подробные отчёты и документацию',
          'en': 'Prepare detailed reports and documentation',
        },
        factorId: 'conventional',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Работать с сельскохозяйственной или строительной техникой',
          'en': 'Work with agricultural or construction equipment',
        },
        factorId: 'realistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Изучать причины природных явлений',
          'en': 'Study the causes of natural phenomena',
        },
        factorId: 'investigative',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Разрабатывать модный дизайн или интерьер',
          'en': 'Develop fashion design or interior design',
        },
        factorId: 'artistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Организовывать групповые занятия или тренинги',
          'en': 'Organize group sessions or training',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Развивать стратегию развития компании',
          'en': 'Develop company development strategy',
        },
        factorId: 'enterprising',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Работать с базами данных и электронными таблицами',
          'en': 'Work with databases and spreadsheets',
        },
        factorId: 'conventional',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q49',
        text: {
          'ru': 'Чинить сломанную технику или оборудование',
          'en': 'Repair broken equipment or machinery',
        },
        factorId: 'realistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q50',
        text: {
          'ru': 'Разрабатывать компьютерные программы или алгоритмы',
          'en': 'Develop computer programs or algorithms',
        },
        factorId: 'investigative',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q51',
        text: {
          'ru': 'Фотографировать или снимать видео художественного характера',
          'en': 'Take artistic photos or videos',
        },
        factorId: 'artistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q52',
        text: {
          'ru': 'Проводить психологические консультации',
          'en': 'Provide psychological counseling',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q53',
        text: {
          'ru': 'Управлять инвестициями и финансовыми активами',
          'en': 'Manage investments and financial assets',
        },
        factorId: 'enterprising',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q54',
        text: {
          'ru': 'Обеспечивать соблюдение правовых норм и стандартов',
          'en': 'Ensure compliance with legal norms and standards',
        },
        factorId: 'conventional',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q55',
        text: {
          'ru': 'Заниматься техническим обслуживанием зданий и сооружений',
          'en': 'Perform technical maintenance of buildings and structures',
        },
        factorId: 'realistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q56',
        text: {
          'ru': 'Исследовать новые медицинские препараты или технологии',
          'en': 'Research new medical drugs or technologies',
        },
        factorId: 'investigative',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q57',
        text: {
          'ru': 'Создавать сценарии или литературные произведения',
          'en': 'Create scripts or literary works',
        },
        factorId: 'artistic',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q58',
        text: {
          'ru': 'Разрабатывать образовательные программы',
          'en': 'Develop educational programs',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q59',
        text: {
          'ru': 'Представлять интересы компании на встречах и презентациях',
          'en': 'Represent the company at meetings and presentations',
        },
        factorId: 'enterprising',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
      QuestionModel(
        id: 'q60',
        text: {
          'ru': 'Вести архивы и систематизировать документы',
          'en': 'Maintain archives and systematize documents',
        },
        factorId: 'conventional',
        isReversed: false,
        answers: _getInterestAnswers(),
      ),
    ];
  }

  /// Get interest level answers (0-4 scale according to Rule #1)
  static List<AnswerModel> _getInterestAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совсем не интересно',
          'en': 'Not interesting at all',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Мало интересно',
          'en': 'Slightly interesting',
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
          'ru': 'Интересно',
          'en': 'Interesting',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Очень интересно',
          'en': 'Very interesting',
        },
        score: 4,
      ),
    ];
  }

  /// Get interpretations for each factor and level
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'realistic': {
        'low': {
          'title_ru': 'Низкий уровень реалистичных интересов',
          'title_en': 'Low level of realistic interests',
          'description_ru':
              'Вы предпочитаете работу с идеями, людьми или абстрактными концепциями, а не с физическими объектами и инструментами. '
              'Практическая, техническая работа может казаться вам скучной или утомительной. '
              'Вам больше подходят профессии, связанные с интеллектуальной, социальной или творческой деятельностью.',
          'description_en':
              'You prefer working with ideas, people, or abstract concepts rather than physical objects and tools. '
              'Practical, technical work may seem boring or tiring to you. '
              'Professions related to intellectual, social, or creative activities are more suitable for you.',
        },
        'medium': {
          'title_ru': 'Средний уровень реалистичных интересов',
          'title_en': 'Medium level of realistic interests',
          'description_ru':
              'У вас есть некоторый интерес к практической и технической работе, но это не является вашим основным предпочтением. '
              'Вы можете успешно работать в профессиях, сочетающих практические навыки с другими видами деятельности. '
              'Рассмотрите карьеры, где технические навыки дополняют основную деятельность.',
          'description_en':
              'You have some interest in practical and technical work, but it is not your main preference. '
              'You can successfully work in professions that combine practical skills with other activities. '
              'Consider careers where technical skills complement the main activity.',
        },
        'high': {
          'title_ru': 'Высокий уровень реалистичных интересов',
          'title_en': 'High level of realistic interests',
          'description_ru':
              'Вы предпочитаете практическую работу с конкретными результатами. Вам нравится работать руками, с инструментами, машинами или природой. '
              'Подходящие профессии: инженер, механик, строитель, пилот, фермер, электрик, плотник, хирург, спортивный тренер, геолог. '
              'Вы цените конкретные, видимые результаты своего труда и предпочитаете действие размышлениям.',
          'description_en':
              'You prefer practical work with concrete results. You enjoy working with your hands, tools, machines, or nature. '
              'Suitable professions: engineer, mechanic, builder, pilot, farmer, electrician, carpenter, surgeon, sports coach, geologist. '
              'You value concrete, visible results of your work and prefer action to reflection.',
        },
      },
      'investigative': {
        'low': {
          'title_ru': 'Низкий уровень исследовательских интересов',
          'title_en': 'Low level of investigative interests',
          'description_ru':
              'Научная и аналитическая работа не является вашим приоритетом. Вы предпочитаете практические, социальные или творческие задачи. '
              'Длительные исследования и анализ данных могут казаться вам утомительными. '
              'Вам больше подходят профессии с быстрыми результатами и конкретными действиями.',
          'description_en':
              'Scientific and analytical work is not your priority. You prefer practical, social, or creative tasks. '
              'Long research and data analysis may seem tedious to you. '
              'Professions with quick results and concrete actions are more suitable for you.',
        },
        'medium': {
          'title_ru': 'Средний уровень исследовательских интересов',
          'title_en': 'Medium level of investigative interests',
          'description_ru':
              'У вас есть умеренный интерес к научной и аналитической работе. Вы можете заниматься исследованиями, когда это необходимо. '
              'Вам подходят профессии, где аналитические навыки сочетаются с другими видами деятельности. '
              'Рассмотрите карьеры в прикладных науках, бизнес-анализе или технических областях.',
          'description_en':
              'You have a moderate interest in scientific and analytical work. You can engage in research when necessary. '
              'Professions where analytical skills are combined with other activities suit you. '
              'Consider careers in applied sciences, business analysis, or technical fields.',
        },
        'high': {
          'title_ru': 'Высокий уровень исследовательских интересов',
          'title_en': 'High level of investigative interests',
          'description_ru':
              'Вы любите исследовать, анализировать и решать сложные интеллектуальные задачи. Научное мышление - ваша сильная сторона. '
              'Подходящие профессии: учёный, врач, программист, аналитик данных, психолог, экономист, математик, биолог, химик, археолог. '
              'Вы стремитесь к глубокому пониманию явлений и предпочитаете работу, требующую интеллектуальных усилий.',
          'description_en':
              'You love to research, analyze, and solve complex intellectual problems. Scientific thinking is your strength. '
              'Suitable professions: scientist, doctor, programmer, data analyst, psychologist, economist, mathematician, biologist, chemist, archaeologist. '
              'You strive for a deep understanding of phenomena and prefer work that requires intellectual effort.',
        },
      },
      'artistic': {
        'low': {
          'title_ru': 'Низкий уровень артистичных интересов',
          'title_en': 'Low level of artistic interests',
          'description_ru':
              'Творческая и художественная деятельность не является вашим основным интересом. Вы предпочитаете структурированные, практические задачи. '
              'Самовыражение через искусство может казаться вам несущественным. '
              'Вам больше подходят профессии с чёткими правилами и конкретными результатами.',
          'description_en':
              'Creative and artistic activities are not your main interest. You prefer structured, practical tasks. '
              'Self-expression through art may seem insignificant to you. '
              'Professions with clear rules and concrete results are more suitable for you.',
        },
        'medium': {
          'title_ru': 'Средний уровень артистичных интересов',
          'title_en': 'Medium level of artistic interests',
          'description_ru':
              'У вас есть умеренный интерес к творческой деятельности. Вы цените эстетику и креативность, но это не главное в вашей работе. '
              'Вам подходят профессии, где творческий подход дополняет основную деятельность. '
              'Рассмотрите карьеры в маркетинге, рекламе, архитектуре или веб-дизайне.',
          'description_en':
              'You have a moderate interest in creative activities. You value aesthetics and creativity, but it\'s not the main thing in your work. '
              'Professions where a creative approach complements the main activity suit you. '
              'Consider careers in marketing, advertising, architecture, or web design.',
        },
        'high': {
          'title_ru': 'Высокий уровень артистичных интересов',
          'title_en': 'High level of artistic interests',
          'description_ru':
              'Творчество и самовыражение - ваша страсть. Вам важна эстетика, оригинальность и возможность создавать что-то новое. '
              'Подходящие профессии: художник, дизайнер, музыкант, писатель, актёр, режиссёр, фотограф, архитектор, стилист, хореограф. '
              'Вы стремитесь к самовыражению и предпочитаете работу, где можете проявить свою индивидуальность.',
          'description_en':
              'Creativity and self-expression are your passion. Aesthetics, originality, and the ability to create something new are important to you. '
              'Suitable professions: artist, designer, musician, writer, actor, director, photographer, architect, stylist, choreographer. '
              'You strive for self-expression and prefer work where you can show your individuality.',
        },
      },
      'social': {
        'low': {
          'title_ru': 'Низкий уровень социальных интересов',
          'title_en': 'Low level of social interests',
          'description_ru':
              'Работа с людьми и помощь другим не являются вашими приоритетами. Вы предпочитаете работать самостоятельно или с объектами, данными. '
              'Интенсивное социальное взаимодействие может утомлять вас. '
              'Вам больше подходят профессии с минимальным межличностным взаимодействием.',
          'description_en':
              'Working with people and helping others are not your priorities. You prefer to work independently or with objects, data. '
              'Intensive social interaction can tire you. '
              'Professions with minimal interpersonal interaction are more suitable for you.',
        },
        'medium': {
          'title_ru': 'Средний уровень социальных интересов',
          'title_en': 'Medium level of social interests',
          'description_ru':
              'У вас есть умеренный интерес к работе с людьми. Вы можете успешно взаимодействовать с другими, когда это необходимо. '
              'Вам подходят профессии с балансом между работой с людьми и самостоятельной деятельностью. '
              'Рассмотрите карьеры в управлении проектами, HR, продажах или консультировании.',
          'description_en':
              'You have a moderate interest in working with people. You can successfully interact with others when necessary. '
              'Professions with a balance between working with people and independent activities suit you. '
              'Consider careers in project management, HR, sales, or consulting.',
        },
        'high': {
          'title_ru': 'Высокий уровень социальных интересов',
          'title_en': 'High level of social interests',
          'description_ru':
              'Помощь людям и работа в команде - ваше призвание. Вы эмпатичны, заботливы и стремитесь улучшить жизнь других. '
              'Подходящие профессии: учитель, психолог, врач, медсестра, социальный работник, HR-специалист, тренер, консультант, терапевт, воспитатель. '
              'Вы находите смысл в служении другим и предпочитаете работу, связанную с развитием и поддержкой людей.',
          'description_en':
              'Helping people and teamwork is your calling. You are empathetic, caring, and strive to improve the lives of others. '
              'Suitable professions: teacher, psychologist, doctor, nurse, social worker, HR specialist, coach, consultant, therapist, educator. '
              'You find meaning in serving others and prefer work related to the development and support of people.',
        },
      },
      'enterprising': {
        'low': {
          'title_ru': 'Низкий уровень предпринимательских интересов',
          'title_en': 'Low level of enterprising interests',
          'description_ru':
              'Лидерство и управление не входят в сферу ваших интересов. Вы предпочитаете быть исполнителем, а не руководителем. '
              'Риск и конкуренция могут вызывать у вас дискомфорт. '
              'Вам больше подходят стабильные позиции с чёткими обязанностями и минимальной ответственностью за других.',
          'description_en':
              'Leadership and management are not in your area of interest. You prefer to be a performer rather than a manager. '
              'Risk and competition can cause you discomfort. '
              'Stable positions with clear responsibilities and minimal responsibility for others are more suitable for you.',
        },
        'medium': {
          'title_ru': 'Средний уровень предпринимательских интересов',
          'title_en': 'Medium level of enterprising interests',
          'description_ru':
              'У вас есть умеренные лидерские амбиции. Вы можете брать на себя ответственность, когда это необходимо. '
              'Вам подходят позиции среднего звена или роли, сочетающие управление с экспертной деятельностью. '
              'Рассмотрите карьеры в проектном менеджменте, координации или командном лидерстве.',
          'description_en':
              'You have moderate leadership ambitions. You can take responsibility when necessary. '
              'Mid-level positions or roles that combine management with expert activities suit you. '
              'Consider careers in project management, coordination, or team leadership.',
        },
        'high': {
          'title_ru': 'Высокий уровень предпринимательских интересов',
          'title_en': 'High level of enterprising interests',
          'description_ru':
              'Вы прирождённый лидер с предпринимательским духом. Вам нравится влиять на других, принимать решения и брать на себя риски. '
              'Подходящие профессии: предприниматель, CEO, менеджер по продажам, юрист, политик, продюсер, маркетолог, инвестор, консультант по управлению. '
              'Вы стремитесь к власти, достижениям и предпочитаете работу, где можете реализовать свои амбиции.',
          'description_en':
              'You are a born leader with an entrepreneurial spirit. You enjoy influencing others, making decisions, and taking risks. '
              'Suitable professions: entrepreneur, CEO, sales manager, lawyer, politician, producer, marketer, investor, management consultant. '
              'You strive for power, achievements, and prefer work where you can realize your ambitions.',
        },
      },
      'conventional': {
        'low': {
          'title_ru': 'Низкий уровень конвенциональных интересов',
          'title_en': 'Low level of conventional interests',
          'description_ru':
              'Рутинная работа и следование процедурам не привлекают вас. Вы предпочитаете гибкость и разнообразие. '
              'Детальная работа с документами может казаться вам скучной. '
              'Вам больше подходят динамичные профессии с творческой свободой и минимальной бюрократией.',
          'description_en':
              'Routine work and following procedures do not attract you. You prefer flexibility and variety. '
              'Detailed work with documents may seem boring to you. '
              'Dynamic professions with creative freedom and minimal bureaucracy are more suitable for you.',
        },
        'medium': {
          'title_ru': 'Средний уровень конвенциональных интересов',
          'title_en': 'Medium level of conventional interests',
          'description_ru':
              'У вас есть умеренная склонность к организованной и структурированной работе. Вы цените порядок, но не зацикливаетесь на деталях. '
              'Вам подходят профессии с балансом между структурой и гибкостью. '
              'Рассмотрите карьеры в администрировании, финансах или управлении качеством.',
          'description_en':
              'You have a moderate inclination towards organized and structured work. You value order but don\'t get fixated on details. '
              'Professions with a balance between structure and flexibility suit you. '
              'Consider careers in administration, finance, or quality management.',
        },
        'high': {
          'title_ru': 'Высокий уровень конвенциональных интересов',
          'title_en': 'High level of conventional interests',
          'description_ru':
              'Вы цените порядок, структуру и точность. Детальная работа и следование процедурам - ваши сильные стороны. '
              'Подходящие профессии: бухгалтер, аудитор, администратор, секретарь, банковский служащий, нотариус, архивариус, логист, контролёр качества. '
              'Вы предпочитаете стабильную среду с чёткими правилами и ожиданиями.',
          'description_en':
              'You value order, structure, and accuracy. Detailed work and following procedures are your strengths. '
              'Suitable professions: accountant, auditor, administrator, secretary, bank clerk, notary, archivist, logistician, quality controller. '
              'You prefer a stable environment with clear rules and expectations.',
        },
      },
    };
  }
}