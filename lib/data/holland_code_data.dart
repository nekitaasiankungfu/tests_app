import '../models/test_model.dart';
import '../models/test_profile_model.dart';

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

  /// Определить профиль на основе процентов по шкалам Holland Code (RIASEC)
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_balanced';

    final r = percentages['realistic'] ?? 0;
    final i = percentages['investigative'] ?? 0;
    final a = percentages['artistic'] ?? 0;
    final s = percentages['social'] ?? 0;
    final e = percentages['enterprising'] ?? 0;
    final c = percentages['conventional'] ?? 0;

    // Сортируем по убыванию
    final scores = {'R': r, 'I': i, 'A': a, 'S': s, 'E': e, 'C': c};
    final sorted = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final primary = sorted[0].key;
    final secondary = sorted[1].key;
    final primaryScore = sorted[0].value;
    final secondaryScore = sorted[1].value;

    // Если все показатели близки — balanced
    final range = sorted[0].value - sorted[5].value;
    if (range < 20) {
      return 'profile_balanced';
    }

    // Если один явно доминирует
    if (primaryScore - secondaryScore > 15) {
      switch (primary) {
        case 'R':
          return 'profile_realistic';
        case 'I':
          return 'profile_investigative';
        case 'A':
          return 'profile_artistic';
        case 'S':
          return 'profile_social';
        case 'E':
          return 'profile_enterprising';
        case 'C':
          return 'profile_conventional';
      }
    }

    // Комбинированные профили (топ-2)
    final combo = '$primary$secondary';
    switch (combo) {
      case 'RI':
      case 'IR':
        return 'profile_ri_technical';
      case 'IA':
      case 'AI':
        return 'profile_ia_creative_research';
      case 'AS':
      case 'SA':
        return 'profile_as_helping_arts';
      case 'SE':
      case 'ES':
        return 'profile_se_social_leader';
      case 'EC':
      case 'CE':
        return 'profile_ec_business';
      case 'RC':
      case 'CR':
        return 'profile_rc_technical_admin';
      default:
        // Возвращаем профиль по первому типу
        switch (primary) {
          case 'R':
            return 'profile_realistic';
          case 'I':
            return 'profile_investigative';
          case 'A':
            return 'profile_artistic';
          case 'S':
            return 'profile_social';
          case 'E':
            return 'profile_enterprising';
          case 'C':
            return 'profile_conventional';
          default:
            return 'profile_balanced';
        }
    }
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Все доступные профили Holland Code
  static const Map<String, TestProfile> _profiles = {
    'profile_realistic': TestProfile(
      id: 'profile_realistic',
      name: {
        'ru': 'Реалист (R)',
        'en': 'Realistic (R)',
      },
      description: {
        'ru': 'Вы практичный человек, который любит работать руками и с механизмами. Вам нравится физическая активность и конкретные результаты.',
        'en': 'You are a practical person who likes to work with hands and machines. You enjoy physical activity and tangible results.',
      },
      whyThisProfile: {
        'ru': 'Ваш показатель Реалистичного типа значительно выше других в модели RIASEC.',
        'en': 'Your Realistic type score is significantly higher than others in the RIASEC model.',
      },
      strengths: {
        'ru': [
          'Практические навыки',
          'Работа с инструментами и механизмами',
          'Физическая выносливость',
          'Решение конкретных проблем',
          'Техническое мышление',
        ],
        'en': [
          'Practical skills',
          'Working with tools and machines',
          'Physical endurance',
          'Solving concrete problems',
          'Technical thinking',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Могут быть трудности с абстрактным мышлением',
          'Дискомфорт в социальных ситуациях',
          'Предпочтение действий разговорам',
        ],
        'en': [
          'May have difficulties with abstract thinking',
          'Discomfort in social situations',
          'Preference for action over talk',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: инженер, механик, электрик, строитель',
          'Развивайте навыки работы с технологиями',
          'Ищите работу с конкретными, измеримыми результатами',
          'Обучайтесь новым техническим навыкам',
        ],
        'en': [
          'Consider careers: engineer, mechanic, electrician, builder',
          'Develop technology skills',
          'Seek work with concrete, measurable results',
          'Learn new technical skills',
        ],
      },
      tryToday: {
        'ru': 'Изучите вакансии в технических специальностях, которые вас интересуют.',
        'en': 'Explore job openings in technical specialties that interest you.',
      },
      inspiringConclusion: {
        'ru': 'Ваши практические навыки создают реальные вещи! Мир нуждается в людях, которые умеют делать.',
        'en': 'Your practical skills create real things! The world needs people who can do.',
      },
    ),

    'profile_investigative': TestProfile(
      id: 'profile_investigative',
      name: {
        'ru': 'Исследователь (I)',
        'en': 'Investigative (I)',
      },
      description: {
        'ru': 'Вы любознательный аналитик, который стремится понять, как устроен мир. Исследования и анализ данных — ваша стихия.',
        'en': 'You are a curious analyst who seeks to understand how the world works. Research and data analysis are your forte.',
      },
      whyThisProfile: {
        'ru': 'Ваш показатель Исследовательского типа значительно выше других в модели RIASEC.',
        'en': 'Your Investigative type score is significantly higher than others in the RIASEC model.',
      },
      strengths: {
        'ru': [
          'Аналитическое мышление',
          'Научный подход',
          'Интеллектуальная любознательность',
          'Способность решать сложные задачи',
          'Независимость мышления',
        ],
        'en': [
          'Analytical thinking',
          'Scientific approach',
          'Intellectual curiosity',
          'Ability to solve complex problems',
          'Independent thinking',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть сложно работать в команде',
          'Иногда слишком погружён в детали',
          'Может откладывать действия ради анализа',
        ],
        'en': [
          'May find it difficult to work in teams',
          'Sometimes too focused on details',
          'May delay action for analysis',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: учёный, аналитик, программист, врач',
          'Продолжайте образование в интересующей области',
          'Ищите работу с интеллектуальными вызовами',
          'Развивайте навыки коммуникации результатов',
        ],
        'en': [
          'Consider careers: scientist, analyst, programmer, doctor',
          'Continue education in your area of interest',
          'Seek work with intellectual challenges',
          'Develop skills in communicating results',
        ],
      },
      tryToday: {
        'ru': 'Начните небольшой исследовательский проект в интересующей вас области.',
        'en': 'Start a small research project in an area that interests you.',
      },
      inspiringConclusion: {
        'ru': 'Ваше стремление к знаниям двигает науку и прогресс! Продолжайте исследовать.',
        'en': 'Your quest for knowledge drives science and progress! Keep exploring.',
      },
    ),

    'profile_artistic': TestProfile(
      id: 'profile_artistic',
      name: {
        'ru': 'Художник (A)',
        'en': 'Artistic (A)',
      },
      description: {
        'ru': 'Вы творческая личность, которая ценит самовыражение и оригинальность. Искусство и креативность — ваш язык.',
        'en': 'You are a creative person who values self-expression and originality. Art and creativity are your language.',
      },
      whyThisProfile: {
        'ru': 'Ваш показатель Артистичного типа значительно выше других в модели RIASEC.',
        'en': 'Your Artistic type score is significantly higher than others in the RIASEC model.',
      },
      strengths: {
        'ru': [
          'Креативность и воображение',
          'Эстетическое чутьё',
          'Оригинальность мышления',
          'Способность к самовыражению',
          'Эмоциональная глубина',
        ],
        'en': [
          'Creativity and imagination',
          'Aesthetic sense',
          'Originality of thought',
          'Ability for self-expression',
          'Emotional depth',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть сложно с рутинной работой',
          'Иногда трудности со структурой',
          'Чувствительность к критике',
        ],
        'en': [
          'May struggle with routine work',
          'Sometimes difficulties with structure',
          'Sensitivity to criticism',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: дизайнер, писатель, музыкант, художник',
          'Развивайте свой творческий стиль',
          'Ищите работу с творческой свободой',
          'Создавайте портфолио своих работ',
        ],
        'en': [
          'Consider careers: designer, writer, musician, artist',
          'Develop your creative style',
          'Seek work with creative freedom',
          'Build a portfolio of your work',
        ],
      },
      tryToday: {
        'ru': 'Посвятите час творческому проекту — без критики, только создание.',
        'en': 'Dedicate an hour to a creative project — no criticism, just creation.',
      },
      inspiringConclusion: {
        'ru': 'Ваша креативность делает мир красивее и интереснее! Творите!',
        'en': 'Your creativity makes the world more beautiful and interesting! Create!',
      },
    ),

    'profile_social': TestProfile(
      id: 'profile_social',
      name: {
        'ru': 'Социальный (S)',
        'en': 'Social (S)',
      },
      description: {
        'ru': 'Вы человек, ориентированный на людей. Помощь другим и социальное взаимодействие приносят вам удовлетворение.',
        'en': 'You are a people-oriented person. Helping others and social interaction bring you satisfaction.',
      },
      whyThisProfile: {
        'ru': 'Ваш показатель Социального типа значительно выше других в модели RIASEC.',
        'en': 'Your Social type score is significantly higher than others in the RIASEC model.',
      },
      strengths: {
        'ru': [
          'Эмпатия и понимание людей',
          'Коммуникативные навыки',
          'Желание помогать',
          'Умение работать в команде',
          'Создание позитивной атмосферы',
        ],
        'en': [
          'Empathy and understanding people',
          'Communication skills',
          'Desire to help',
          'Ability to work in teams',
          'Creating positive atmosphere',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть сложно говорить "нет"',
          'Риск эмоционального выгорания',
          'Иногда пренебрежение собственными потребностями',
        ],
        'en': [
          'May find it difficult to say "no"',
          'Risk of emotional burnout',
          'Sometimes neglecting own needs',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: учитель, психолог, врач, социальный работник',
          'Развивайте навыки самозаботы',
          'Устанавливайте здоровые границы',
          'Ищите работу с командной атмосферой',
        ],
        'en': [
          'Consider careers: teacher, psychologist, doctor, social worker',
          'Develop self-care skills',
          'Establish healthy boundaries',
          'Seek work with team atmosphere',
        ],
      },
      tryToday: {
        'ru': 'Помогите кому-то, но также выделите время для себя.',
        'en': 'Help someone, but also set aside time for yourself.',
      },
      inspiringConclusion: {
        'ru': 'Ваша забота о людях делает мир добрее! Не забывайте заботиться и о себе.',
        'en': 'Your care for people makes the world kinder! Don\'t forget to take care of yourself too.',
      },
    ),

    'profile_enterprising': TestProfile(
      id: 'profile_enterprising',
      name: {
        'ru': 'Предприниматель (E)',
        'en': 'Enterprising (E)',
      },
      description: {
        'ru': 'Вы лидер и организатор. Управление, влияние и достижение целей — ваши главные мотиваторы.',
        'en': 'You are a leader and organizer. Management, influence, and achieving goals are your main motivators.',
      },
      whyThisProfile: {
        'ru': 'Ваш показатель Предпринимательского типа значительно выше других в модели RIASEC.',
        'en': 'Your Enterprising type score is significantly higher than others in the RIASEC model.',
      },
      strengths: {
        'ru': [
          'Лидерские качества',
          'Убедительность и влияние',
          'Амбициозность',
          'Способность принимать решения',
          'Энергичность',
        ],
        'en': [
          'Leadership qualities',
          'Persuasiveness and influence',
          'Ambition',
          'Decision-making ability',
          'Energy',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть нетерпелив',
          'Риск слишком высоких амбиций',
          'Иногда пренебрежение деталями',
        ],
        'en': [
          'May be impatient',
          'Risk of too high ambitions',
          'Sometimes neglecting details',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: менеджер, предприниматель, продавец, юрист',
          'Развивайте навыки делегирования',
          'Окружайте себя людьми с дополняющими навыками',
          'Учитесь слушать и учитывать мнение других',
        ],
        'en': [
          'Consider careers: manager, entrepreneur, salesperson, lawyer',
          'Develop delegation skills',
          'Surround yourself with people with complementary skills',
          'Learn to listen and consider others\' opinions',
        ],
      },
      tryToday: {
        'ru': 'Определите одну бизнес-идею, которую можно развить.',
        'en': 'Identify one business idea that can be developed.',
      },
      inspiringConclusion: {
        'ru': 'Ваше лидерство создаёт возможности! Ведите с мудростью и эмпатией.',
        'en': 'Your leadership creates opportunities! Lead with wisdom and empathy.',
      },
    ),

    'profile_conventional': TestProfile(
      id: 'profile_conventional',
      name: {
        'ru': 'Конвенционал (C)',
        'en': 'Conventional (C)',
      },
      description: {
        'ru': 'Вы цените порядок, точность и организованность. Структурированная работа и следование процедурам — ваш стиль.',
        'en': 'You value order, accuracy, and organization. Structured work and following procedures are your style.',
      },
      whyThisProfile: {
        'ru': 'Ваш показатель Конвенционального типа значительно выше других в модели RIASEC.',
        'en': 'Your Conventional type score is significantly higher than others in the RIASEC model.',
      },
      strengths: {
        'ru': [
          'Организованность и точность',
          'Внимание к деталям',
          'Надёжность',
          'Умение работать с данными',
          'Следование правилам',
        ],
        'en': [
          'Organization and accuracy',
          'Attention to detail',
          'Reliability',
          'Ability to work with data',
          'Following rules',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть сложно с неопределённостью',
          'Иногда недостаточная гибкость',
          'Дискомфорт с быстрыми изменениями',
        ],
        'en': [
          'May struggle with uncertainty',
          'Sometimes insufficient flexibility',
          'Discomfort with rapid changes',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: бухгалтер, администратор, банкир, аудитор',
          'Развивайте навыки работы с программами и системами',
          'Ищите работу со стабильной средой',
          'Практикуйте гибкость в новых ситуациях',
        ],
        'en': [
          'Consider careers: accountant, administrator, banker, auditor',
          'Develop software and systems skills',
          'Seek work with stable environment',
          'Practice flexibility in new situations',
        ],
      },
      tryToday: {
        'ru': 'Организуйте что-то, что давно требовало порядка.',
        'en': 'Organize something that has long needed order.',
      },
      inspiringConclusion: {
        'ru': 'Ваша организованность создаёт порядок из хаоса! Это бесценный навык.',
        'en': 'Your organization creates order from chaos! This is an invaluable skill.',
      },
    ),

    'profile_ri_technical': TestProfile(
      id: 'profile_ri_technical',
      name: {
        'ru': 'Технический исследователь (RI)',
        'en': 'Technical Researcher (RI)',
      },
      description: {
        'ru': 'Вы сочетаете практические навыки с аналитическим мышлением. Инженерия и прикладная наука — ваша сфера.',
        'en': 'You combine practical skills with analytical thinking. Engineering and applied science are your domain.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Реалистичного и Исследовательского типов.',
        'en': 'You have high scores in Realistic and Investigative types.',
      },
      strengths: {
        'ru': [
          'Сочетание теории и практики',
          'Техническое и аналитическое мышление',
          'Решение прикладных задач',
        ],
        'en': [
          'Combination of theory and practice',
          'Technical and analytical thinking',
          'Solving applied problems',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть сложно с социальными аспектами',
          'Иногда слишком погружён в технические детали',
        ],
        'en': [
          'May struggle with social aspects',
          'Sometimes too focused on technical details',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: инженер-исследователь, разработчик, техноло́г',
          'Участвуйте в R&D проектах',
        ],
        'en': [
          'Consider careers: research engineer, developer, technologist',
          'Participate in R&D projects',
        ],
      },
      tryToday: {
        'ru': 'Найдите техническую проблему и предложите исследовательское решение.',
        'en': 'Find a technical problem and propose a research-based solution.',
      },
      inspiringConclusion: {
        'ru': 'Вы создаёте мосты между наукой и практикой! Это редкий и ценный навык.',
        'en': 'You build bridges between science and practice! This is a rare and valuable skill.',
      },
    ),

    'profile_ia_creative_research': TestProfile(
      id: 'profile_ia_creative_research',
      name: {
        'ru': 'Креативный исследователь (IA)',
        'en': 'Creative Researcher (IA)',
      },
      description: {
        'ru': 'Вы сочетаете аналитический ум с творческим видением. Инновации и нестандартные решения — ваша сила.',
        'en': 'You combine analytical mind with creative vision. Innovation and unconventional solutions are your strength.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Исследовательского и Артистичного типов.',
        'en': 'You have high scores in Investigative and Artistic types.',
      },
      strengths: {
        'ru': [
          'Творческий подход к исследованиям',
          'Инновационное мышление',
          'Способность видеть нестандартные решения',
        ],
        'en': [
          'Creative approach to research',
          'Innovative thinking',
          'Ability to see unconventional solutions',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть сложно с рутиной',
          'Иногда слишком много идей',
        ],
        'en': [
          'May struggle with routine',
          'Sometimes too many ideas',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: UX-исследователь, архитектор, научный писатель',
          'Ищите инновационные проекты',
        ],
        'en': [
          'Consider careers: UX researcher, architect, science writer',
          'Seek innovative projects',
        ],
      },
      tryToday: {
        'ru': 'Примените креативный подход к научной или аналитической задаче.',
        'en': 'Apply a creative approach to a scientific or analytical task.',
      },
      inspiringConclusion: {
        'ru': 'Ваше сочетание логики и творчества рождает инновации!',
        'en': 'Your combination of logic and creativity breeds innovation!',
      },
    ),

    'profile_as_helping_arts': TestProfile(
      id: 'profile_as_helping_arts',
      name: {
        'ru': 'Помогающий художник (AS)',
        'en': 'Helping Artist (AS)',
      },
      description: {
        'ru': 'Вы сочетаете творчество с желанием помогать людям. Арт-терапия и социальное искусство — ваша сфера.',
        'en': 'You combine creativity with a desire to help people. Art therapy and social art are your domain.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Артистичного и Социального типов.',
        'en': 'You have high scores in Artistic and Social types.',
      },
      strengths: {
        'ru': [
          'Использование творчества для помощи',
          'Эмоциональная глубина',
          'Способность вдохновлять других',
        ],
        'en': [
          'Using creativity to help',
          'Emotional depth',
          'Ability to inspire others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск эмоционального выгорания',
          'Может быть сложно с бизнес-аспектами',
        ],
        'en': [
          'Risk of emotional burnout',
          'May struggle with business aspects',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: арт-терапевт, преподаватель искусств, социальный художник',
          'Используйте искусство для социального воздействия',
        ],
        'en': [
          'Consider careers: art therapist, arts educator, social artist',
          'Use art for social impact',
        ],
      },
      tryToday: {
        'ru': 'Проведите творческое занятие для кого-то, кому это нужно.',
        'en': 'Lead a creative session for someone who needs it.',
      },
      inspiringConclusion: {
        'ru': 'Ваше творчество исцеляет и вдохновляет!',
        'en': 'Your creativity heals and inspires!',
      },
    ),

    'profile_se_social_leader': TestProfile(
      id: 'profile_se_social_leader',
      name: {
        'ru': 'Социальный лидер (SE)',
        'en': 'Social Leader (SE)',
      },
      description: {
        'ru': 'Вы сочетаете лидерские качества с заботой о людях. Управление с человеческим лицом — ваш стиль.',
        'en': 'You combine leadership qualities with care for people. Human-centered management is your style.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Социального и Предпринимательского типов.',
        'en': 'You have high scores in Social and Enterprising types.',
      },
      strengths: {
        'ru': [
          'Лидерство с эмпатией',
          'Умение мотивировать команды',
          'Создание позитивной рабочей культуры',
        ],
        'en': [
          'Leadership with empathy',
          'Ability to motivate teams',
          'Creating positive work culture',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сложность с непопулярными решениями',
          'Баланс между заботой и результатами',
        ],
        'en': [
          'Difficulty with unpopular decisions',
          'Balance between care and results',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: HR-менеджер, директор школы, руководитель НКО',
          'Развивайте навыки сложных разговоров',
        ],
        'en': [
          'Consider careers: HR manager, school principal, NGO leader',
          'Develop difficult conversation skills',
        ],
      },
      tryToday: {
        'ru': 'Возьмите на себя лидерство в социальном проекте.',
        'en': 'Take leadership in a social project.',
      },
      inspiringConclusion: {
        'ru': 'Вы лидер, который заботится о людях — это редкое сочетание!',
        'en': 'You are a leader who cares about people — a rare combination!',
      },
    ),

    'profile_ec_business': TestProfile(
      id: 'profile_ec_business',
      name: {
        'ru': 'Бизнес-организатор (EC)',
        'en': 'Business Organizer (EC)',
      },
      description: {
        'ru': 'Вы сочетаете предпринимательство с организованностью. Бизнес-администрирование — ваша сила.',
        'en': 'You combine entrepreneurship with organization. Business administration is your strength.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Предпринимательского и Конвенционального типов.',
        'en': 'You have high scores in Enterprising and Conventional types.',
      },
      strengths: {
        'ru': [
          'Организованное управление',
          'Внимание к финансам и процессам',
          'Способность масштабировать',
        ],
        'en': [
          'Organized management',
          'Attention to finances and processes',
          'Ability to scale',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть слишком сфокусирован на процессах',
          'Иногда недостаточно творчества',
        ],
        'en': [
          'May be too focused on processes',
          'Sometimes insufficient creativity',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: финансовый директор, операционный менеджер, аудитор',
          'Балансируйте стратегию и исполнение',
        ],
        'en': [
          'Consider careers: CFO, operations manager, auditor',
          'Balance strategy and execution',
        ],
      },
      tryToday: {
        'ru': 'Оптимизируйте один бизнес-процесс.',
        'en': 'Optimize one business process.',
      },
      inspiringConclusion: {
        'ru': 'Вы создаёте устойчивые бизнес-системы!',
        'en': 'You create sustainable business systems!',
      },
    ),

    'profile_rc_technical_admin': TestProfile(
      id: 'profile_rc_technical_admin',
      name: {
        'ru': 'Технический администратор (RC)',
        'en': 'Technical Administrator (RC)',
      },
      description: {
        'ru': 'Вы сочетаете практические навыки с организованностью. Техническое администрирование — ваша сфера.',
        'en': 'You combine practical skills with organization. Technical administration is your domain.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Реалистичного и Конвенционального типов.',
        'en': 'You have high scores in Realistic and Conventional types.',
      },
      strengths: {
        'ru': [
          'Практичность и организованность',
          'Умение поддерживать технические системы',
          'Надёжность',
        ],
        'en': [
          'Practicality and organization',
          'Ability to maintain technical systems',
          'Reliability',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть сложно с абстрактными задачами',
          'Иногда сопротивление изменениям',
        ],
        'en': [
          'May struggle with abstract tasks',
          'Sometimes resistance to change',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите карьеры: системный администратор, техник, логист',
          'Развивайте навыки новых технологий',
        ],
        'en': [
          'Consider careers: system administrator, technician, logistician',
          'Develop new technology skills',
        ],
      },
      tryToday: {
        'ru': 'Настройте и оптимизируйте техническую систему.',
        'en': 'Set up and optimize a technical system.',
      },
      inspiringConclusion: {
        'ru': 'Вы поддерживаете технические системы в работе — это фундамент современного мира!',
        'en': 'You keep technical systems running — the foundation of the modern world!',
      },
    ),

    'profile_balanced': TestProfile(
      id: 'profile_balanced',
      name: {
        'ru': 'Универсальный профиль',
        'en': 'Universal Profile',
      },
      description: {
        'ru': 'У вас сбалансированные интересы по всем шести направлениям RIASEC. Вы универсальны и адаптивны.',
        'en': 'You have balanced interests across all six RIASEC directions. You are versatile and adaptive.',
      },
      whyThisProfile: {
        'ru': 'Ваши показатели по всем шести типам Holland Code близки друг к другу.',
        'en': 'Your scores across all six Holland Code types are close to each other.',
      },
      strengths: {
        'ru': [
          'Универсальность',
          'Способность работать в разных областях',
          'Гибкость карьерного выбора',
          'Понимание разных профессий',
        ],
        'en': [
          'Versatility',
          'Ability to work in different fields',
          'Career choice flexibility',
          'Understanding different professions',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть сложно определить приоритеты',
          'Риск "распыления" интересов',
          'Трудности с выбором специализации',
        ],
        'en': [
          'May find it difficult to set priorities',
          'Risk of spreading interests too thin',
          'Difficulties choosing specialization',
        ],
      },
      recommendations: {
        'ru': [
          'Экспериментируйте с разными областями',
          'Ищите роли, требующие универсальности',
          'Рассмотрите проектную работу или консалтинг',
          'Развивайте T-shaped навыки (глубина + ширина)',
        ],
        'en': [
          'Experiment with different fields',
          'Seek roles requiring versatility',
          'Consider project work or consulting',
          'Develop T-shaped skills (depth + breadth)',
        ],
      },
      tryToday: {
        'ru': 'Попробуйте что-то новое в области, которую ещё не исследовали.',
        'en': 'Try something new in an area you haven\'t explored yet.',
      },
      inspiringConclusion: {
        'ru': 'Ваша универсальность — уникальное преимущество в меняющемся мире!',
        'en': 'Your versatility is a unique advantage in a changing world!',
      },
    ),
  };
}