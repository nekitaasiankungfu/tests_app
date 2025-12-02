import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data access class for Creative Type Test
/// Legacy Dart implementation (no JSON dependency)
///
/// IMPORTANT: This test uses multiple scoring approaches:
/// 1. Frequency questions (1-40): Use axisWeights in QuestionModel with fractional weights (0.5, 1.0)
/// 2. Multiple choice questions (41-48): Use answer-specific weights (1, 2, 3) via getAnswerWeights()
class CreativeTypeData {
  /// Get the complete Creative Type test
  static TestModel getCreativeTypeTest() {
    return TestModel(
      id: 'creative_type_v1',
      title: {
        'ru': 'Тест типа креативности',
        'en': 'Creative Type Test',
      },
      description: {
        'ru':
            'Этот тест помогает понять, как именно вы создаёте — через какие каналы восприятия, процессы и подходы проявляется ваша креативность. В отличие от общих тестов на творческий потенциал, мы фокусируемся на вашем уникальном креативном языке: кто-то мыслит образами и визуальными метафорами, кто-то создаёт через слова и концепции, а кто-то находит вдохновение в структуре и системном мышлении.\n\nПонимание своего типа креативности даёт вам суперсилу: вы перестаёте сравнивать себя с другими и начинаете работать в своём естественном режиме. Это не про «хороший» или «плохой» креатив — это про то, как найти свой поток, понять, что вас блокирует и где искать вдохновение.\n\nТест также выявляет ваши основные блокаторы креативности и главные источники вдохновения — эта информация поможет создать персональную экосистему для творчества.',
        'en':
            'This test helps you understand exactly how you create — through which channels of perception, processes, and approaches your creativity manifests. Unlike general creative potential tests, we focus on your unique creative language: some people think in images and visual metaphors, others create through words and concepts, while others find inspiration in structure and systems thinking.\n\nUnderstanding your creative type gives you a superpower: you stop comparing yourself to others and start working in your natural mode. This isn\'t about "good" or "bad" creativity — it\'s about finding your flow, understanding what blocks you, and knowing where to look for inspiration.\n\nThe test also identifies your main creativity blockers and primary sources of inspiration — this information will help you create a personalized ecosystem for creativity.',
      },
      category: {
        'ru': 'Креативность',
        'en': 'Creativity',
      },
      categoryId: 'creativity',
      disclaimer: {
        'ru':
            'Тест основан на современных когнитивных теориях креативности (Guilford, Torrance), теории множественного интеллекта Гарднера и концепции flow-состояния Чиксентмихайи. Предназначен для самопознания и развития креативных навыков. Не является клиническим инструментом.',
        'en':
            'The test is based on modern cognitive theories of creativity (Guilford, Torrance), Gardner\'s theory of multiple intelligences, and Csikszentmihalyi\'s flow state concept. Intended for self-knowledge and creative skill development. Not a clinical instrument.',
      },
      estimatedTime: 8,
      type: TestType.multiFactor,
      factorIds: [
        'visual_creator',
        'verbal_creator',
        'systematic_creator',
        'emotional_creator',
        'experimental_creator',
        'social_creator',
        'blockers',
        'inspiration_sources',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get answer-specific weights for multiple choice questions (41-48)
  /// Returns Map<String, Map<String, double>> where:
  /// - Key: answer ID (e.g., 'q41_a1')
  /// - Value: Map of factor weights (e.g., {'visual_creator': 2.0, 'inspiration_sources': 1.0})
  static Map<String, Map<String, double>> getAnswerWeights() {
    return {
      // Question 41: When having creative block
      'q41_a1': {'visual_creator': 2.0, 'inspiration_sources': 1.0},
      'q41_a2': {'verbal_creator': 2.0, 'social_creator': 1.0},
      'q41_a3': {'systematic_creator': 1.0, 'experimental_creator': 1.0},
      'q41_a4': {'emotional_creator': 2.0, 'inspiration_sources': 1.0},
      'q41_a5': {'experimental_creator': 3.0},

      // Question 42: Ideal project
      'q42_a1': {'visual_creator': 3.0},
      'q42_a2': {'verbal_creator': 3.0},
      'q42_a3': {'systematic_creator': 3.0},
      'q42_a4': {'emotional_creator': 3.0},
      'q42_a5': {'experimental_creator': 3.0},
      'q42_a6': {'social_creator': 3.0},

      // Question 43: What you notice first
      'q43_a1': {'visual_creator': 2.0},
      'q43_a2': {'verbal_creator': 2.0},
      'q43_a3': {'systematic_creator': 2.0},
      'q43_a4': {'emotional_creator': 2.0},
      'q43_a5': {'experimental_creator': 2.0},

      // Question 44: Work process
      'q44_a1': {'visual_creator': 2.0},
      'q44_a2': {'verbal_creator': 2.0},
      'q44_a3': {'systematic_creator': 2.0},
      'q44_a4': {'emotional_creator': 2.0},
      'q44_a5': {'experimental_creator': 2.0},
      'q44_a6': {'social_creator': 2.0},

      // Question 45: Energy source
      'q45_a1': {'visual_creator': 2.0, 'inspiration_sources': 1.0},
      'q45_a2': {'verbal_creator': 2.0, 'inspiration_sources': 1.0},
      'q45_a3': {'systematic_creator': 2.0},
      'q45_a4': {'emotional_creator': 2.0, 'inspiration_sources': 1.0},
      'q45_a5': {'experimental_creator': 2.0},
      'q45_a6': {'social_creator': 2.0, 'inspiration_sources': 1.0},

      // Question 46: If had to create now
      'q46_a1': {'visual_creator': 2.0},
      'q46_a2': {'verbal_creator': 2.0},
      'q46_a3': {'systematic_creator': 2.0},
      'q46_a4': {'emotional_creator': 2.0},
      'q46_a5': {'experimental_creator': 2.0},
      'q46_a6': {'social_creator': 2.0},

      // Question 47: Finished work definition
      'q47_a1': {'visual_creator': 2.0},
      'q47_a2': {'verbal_creator': 2.0},
      'q47_a3': {'systematic_creator': 2.0},
      'q47_a4': {'emotional_creator': 2.0},
      'q47_a5': {'experimental_creator': 2.0},
      'q47_a6': {'social_creator': 2.0},

      // Question 48: Main motivation
      'q48_a1': {'visual_creator': 2.0},
      'q48_a2': {'verbal_creator': 2.0},
      'q48_a3': {'systematic_creator': 2.0},
      'q48_a4': {'emotional_creator': 2.0},
      'q48_a5': {'experimental_creator': 2.0},
      'q48_a6': {'social_creator': 2.0},
    };
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'visual_creator': {
        'ru': 'Визуальный креатор',
        'en': 'Visual Creator',
      },
      'verbal_creator': {
        'ru': 'Вербальный креатор',
        'en': 'Verbal Creator',
      },
      'systematic_creator': {
        'ru': 'Системный креатор',
        'en': 'Systematic Creator',
      },
      'emotional_creator': {
        'ru': 'Эмоциональный креатор',
        'en': 'Emotional Creator',
      },
      'experimental_creator': {
        'ru': 'Экспериментальный креатор',
        'en': 'Experimental Creator',
      },
      'social_creator': {
        'ru': 'Социальный креатор',
        'en': 'Social Creator',
      },
      'blockers': {
        'ru': 'Блокаторы креативности',
        'en': 'Creativity Blockers',
      },
      'inspiration_sources': {
        'ru': 'Источники вдохновения',
        'en': 'Inspiration Sources',
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

    // Different interpretation logic for different factor types
    if (factorId == 'blockers') {
      return _getBlockersInterpretation(percentage);
    } else if (factorId == 'inspiration_sources') {
      return _getInspirationInterpretation(percentage);
    } else {
      return _getCreativityTypeInterpretation(factorId, percentage);
    }
  }

  /// Creativity types interpretation (visual, verbal, systematic, emotional, experimental, social)
  static Map<String, String> _getCreativityTypeInterpretation(
      String factorId, double percentage) {
    final String level;
    if (percentage >= 35) {
      level = 'very_strong';
    } else if (percentage >= 25) {
      level = 'strong';
    } else if (percentage >= 18) {
      level = 'moderate';
    } else {
      level = 'balanced';
    }

    final interpretations = {
      'visual_creator': {
        'very_strong': {
          'ru':
              'Очень сильный визуальный тип. Вы мыслите образами, цветами и композицией. Визуальная эстетика — ваш основной креативный язык.',
          'en':
              'Very strong visual type. You think in images, colors and composition. Visual aesthetics is your primary creative language.',
        },
        'strong': {
          'ru':
              'Выраженный визуальный тип. Вы хорошо работаете с визуальными метафорами и эстетикой, хотя используете и другие каналы креативности.',
          'en':
              'Strong visual type. You work well with visual metaphors and aesthetics, though you use other creative channels too.',
        },
        'moderate': {
          'ru':
              'Умеренный визуальный компонент. Визуальное мышление — один из нескольких ваших креативных инструментов.',
          'en':
              'Moderate visual component. Visual thinking is one of several of your creative tools.',
        },
        'balanced': {
          'ru':
              'Визуальный канал не доминирует. Вы можете его развить, если захотите усилить визуальную креативность.',
          'en':
              'Visual channel doesn\'t dominate. You can develop it if you want to strengthen visual creativity.',
        },
      },
      'verbal_creator': {
        'very_strong': {
          'ru':
              'Очень сильный вербальный тип. Вы создаёте через слова, концепции и истории. Язык — ваш основной креативный инструмент.',
          'en':
              'Very strong verbal type. You create through words, concepts and stories. Language is your primary creative tool.',
        },
        'strong': {
          'ru':
              'Выраженный вербальный тип. Вы сильны в сторителлинге и работе с концепциями, сочетая это с другими формами творчества.',
          'en':
              'Strong verbal type. You excel at storytelling and working with concepts, combining this with other forms of creativity.',
        },
        'moderate': {
          'ru':
              'Умеренный вербальный компонент. Работа со словами и идеями — важная, но не единственная часть вашей креативности.',
          'en':
              'Moderate verbal component. Working with words and ideas is important but not the only part of your creativity.',
        },
        'balanced': {
          'ru':
              'Вербальный канал не доминирует. Вы можете развить навыки сторителлинга и работы с текстом при желании.',
          'en':
              'Verbal channel doesn\'t dominate. You can develop storytelling and text skills if desired.',
        },
      },
      'systematic_creator': {
        'very_strong': {
          'ru':
              'Очень сильный системный тип. Вы находите креативность в структуре, паттернах и логике. Создание систем — ваша стихия.',
          'en':
              'Very strong systematic type. You find creativity in structure, patterns and logic. Creating systems is your element.',
        },
        'strong': {
          'ru':
              'Выраженный системный тип. Вы хорошо создаёте фреймворки и находите логические связи, дополняя это другими подходами.',
          'en':
              'Strong systematic type. You excel at creating frameworks and finding logical connections, complementing with other approaches.',
        },
        'moderate': {
          'ru':
              'Умеренный системный компонент. Структурное мышление играет заметную, но не доминирующую роль в вашем творчестве.',
          'en':
              'Moderate systematic component. Structured thinking plays a notable but not dominant role in your creativity.',
        },
        'balanced': {
          'ru':
              'Системный подход не доминирует. Вы можете развить навыки структурирования и оптимизации процессов.',
          'en':
              'Systematic approach doesn\'t dominate. You can develop skills in structuring and process optimization.',
        },
      },
      'emotional_creator': {
        'very_strong': {
          'ru':
              'Очень сильный эмоциональный тип. Вы творите через чувства, настроение и атмосферу. Эмоции — ваш главный креативный канал.',
          'en':
              'Very strong emotional type. You create through feelings, mood and atmosphere. Emotions are your main creative channel.',
        },
        'strong': {
          'ru':
              'Выраженный эмоциональный тип. Вы сильны в передаче настроения и создании вайба, комбинируя с другими формами.',
          'en':
              'Strong emotional type. You excel at conveying mood and creating vibes, combining with other forms.',
        },
        'moderate': {
          'ru':
              'Умеренный эмоциональный компонент. Работа с чувствами и атмосферой важна для вас, но не единственный подход.',
          'en':
              'Moderate emotional component. Working with feelings and atmosphere matters to you, but isn\'t the only approach.',
        },
        'balanced': {
          'ru':
              'Эмоциональный канал не доминирует. Вы можете развить способность работать с настроением и атмосферой.',
          'en':
              'Emotional channel doesn\'t dominate. You can develop ability to work with mood and atmosphere.',
        },
      },
      'experimental_creator': {
        'very_strong': {
          'ru':
              'Очень сильный экспериментальный тип. Вы создаёте через хаос, спонтанность и эксперименты. Нарушение правил — ваш метод.',
          'en':
              'Very strong experimental type. You create through chaos, spontaneity and experiments. Breaking rules is your method.',
        },
        'strong': {
          'ru':
              'Выраженный экспериментальный тип. Вы любите пробовать новое и миксовать стили, сочетая с более структурными подходами.',
          'en':
              'Strong experimental type. You love trying new things and mixing styles, combining with more structured approaches.',
        },
        'moderate': {
          'ru':
              'Умеренный экспериментальный компонент. Эксперименты присутствуют в вашем творчестве, но не доминируют.',
          'en':
              'Moderate experimental component. Experiments are present in your creativity but don\'t dominate.',
        },
        'balanced': {
          'ru':
              'Экспериментальный подход не доминирует. Вы можете развить смелость в экспериментах и импровизации.',
          'en':
              'Experimental approach doesn\'t dominate. You can develop boldness in experiments and improvisation.',
        },
      },
      'social_creator': {
        'very_strong': {
          'ru':
              'Очень сильный социальный тип. Вы черпаете энергию из взаимодействия и коллабораций. Диалог — основа вашей креативности.',
          'en':
              'Very strong social type. You draw energy from interaction and collaborations. Dialogue is the foundation of your creativity.',
        },
        'strong': {
          'ru':
              'Выраженный социальный тип. Вы хорошо работаете в коллаборациях и черпаете энергию из обмена, дополняя сольной работой.',
          'en':
              'Strong social type. You work well in collaborations and draw energy from exchange, complementing with solo work.',
        },
        'moderate': {
          'ru':
              'Умеренный социальный компонент. Взаимодействие с другими важно для вас, но вы можете работать и в одиночку.',
          'en':
              'Moderate social component. Interaction with others matters to you, but you can work solo too.',
        },
        'balanced': {
          'ru':
              'Социальный канал не доминирует. Вы можете развить навыки коллаборации и нетворкинга.',
          'en':
              'Social channel doesn\'t dominate. You can develop collaboration and networking skills.',
        },
      },
    };

    return interpretations[factorId]?[level] ?? {'ru': '', 'en': ''};
  }

  /// Blockers interpretation
  static Map<String, String> _getBlockersInterpretation(double percentage) {
    // Convert percentage to absolute score range (0-20 points for 5 questions × 4 max score)
    final score = (percentage / 100 * 20).round();

    if (score <= 8) {
      return {
        'ru':
            'Низкий уровень блокаторов ($score/20). Ваша креативность течёт свободно. '
            'У вас минимальные внутренние препятствия для творчества.',
        'en':
            'Low blockers level ($score/20). Your creativity flows freely. '
            'You have minimal internal obstacles to creativity.',
      };
    } else if (score <= 14) {
      return {
        'ru':
            'Средний уровень блокаторов ($score/20). Периодически внутренние барьеры мешают вашему креативному процессу. '
            'Стоит обратить внимание на перфекционизм, страх оценки или прокрастинацию.',
        'en':
            'Moderate blockers level ($score/20). Internal barriers occasionally hinder your creative process. '
            'Consider addressing perfectionism, fear of judgment, or procrastination.',
      };
    } else {
      return {
        'ru':
            'Высокий уровень блокаторов ($score/20). Значительные внутренние препятствия мешают вашей креативности. '
            'Рекомендуется поработать над страхом критики, перфекционизмом и прокрастинацией. Это важно для раскрытия вашего потенциала.',
        'en':
            'High blockers level ($score/20). Significant internal obstacles hinder your creativity. '
            'Recommended to work on fear of criticism, perfectionism and procrastination. This is important for unlocking your potential.',
      };
    }
  }

  /// Inspiration sources interpretation
  static Map<String, String> _getInspirationInterpretation(double percentage) {
    // Convert percentage to absolute score range (0-28 points for 7 questions × 4 max score)
    final score = (percentage / 100 * 28).round();

    if (score <= 12) {
      return {
        'ru':
            'Ограниченные источники вдохновения ($score/28). Вам стоит расширить экосистему креативного питания. '
            'Попробуйте новые места, контент, людей — это зарядит ваше творчество.',
        'en':
            'Limited inspiration sources ($score/28). You should expand your creative nourishment ecosystem. '
            'Try new places, content, people — this will energize your creativity.',
      };
    } else if (score <= 20) {
      return {
        'ru':
            'Хороший набор источников вдохновения ($score/28). У вас есть несколько каналов, откуда вы черпаете креативную энергию. '
            'Продолжайте развивать разнообразие источников.',
        'en':
            'Good set of inspiration sources ($score/28). You have several channels from which you draw creative energy. '
            'Continue developing diversity of sources.',
      };
    } else {
      return {
        'ru':
            'Богатая экосистема вдохновения ($score/28). У вас разнообразные источники креативной энергии: медиа, люди, природа, случайности. '
            'Это сильная база для постоянного творческого потока.',
        'en':
            'Rich inspiration ecosystem ($score/28). You have diverse sources of creative energy: media, people, nature, randomness. '
            'This is a strong foundation for continuous creative flow.',
      };
    }
  }

  /// Determine profile based on test results
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'visual_creator'; // fallback

    // Find dominant type (excluding blockers and inspiration_sources)
    final creativeTypes = [
      'visual_creator',
      'verbal_creator',
      'systematic_creator',
      'emotional_creator',
      'experimental_creator',
      'social_creator'
    ];

    final typeScores = <String, double>{};
    for (var type in creativeTypes) {
      typeScores[type] = percentages[type] ?? 0.0;
    }

    // Sort by percentage descending
    final sorted = typeScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final dominantType = sorted.first.key;
    final dominantPercentage = sorted.first.value;

    // If no clear winner, return first type as fallback
    if (dominantPercentage < 10) {
      return 'visual_creator'; // fallback to first type
    }

    // Return dominant type (no 'profile_' prefix!)
    return dominantType;
  }

  /// Get profile by ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// All test profiles - 6 creative types
  static final Map<String, TestProfile> _profiles = {
    'visual_creator': TestProfile(
      id: 'visual_creator',
      name: {
        'ru': 'Визуальный креатор',
        'en': 'Visual Creator',
      },
      description: {
        'ru':
            'Вы мыслите образами, цветами и композицией. Визуальная эстетика — ваш основной язык самовыражения.',
        'en':
            'You think in images, colors and composition. Visual aesthetics is your primary language of self-expression.',
      },
      whyThisProfile: {
        'ru':
            'Визуальный креатор — ваш доминирующий тип (≥35% от общего креативного профиля).',
        'en':
            'Visual Creator is your dominant type (≥35% of total creative profile).',
      },
      strengths: {
        'ru': [
          'Сильное визуальное восприятие и память',
          'Способность видеть красоту в деталях',
          'Естественное чувство композиции и баланса',
          'Быстрое создание ментальных визуализаций',
          'Внимание к цвету, форме и пространству',
          'Умение передавать идеи через визуальные метафоры',
          'Интуитивное понимание визуальной иерархии',
        ],
        'en': [
          'Strong visual perception and memory',
          'Ability to see beauty in details',
          'Natural sense of composition and balance',
          'Quick creation of mental visualizations',
          'Attention to color, form and space',
          'Ability to convey ideas through visual metaphors',
          'Intuitive understanding of visual hierarchy',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Перфекционизм в визуальных деталях может замедлять работу',
          'Сложность вербализации визуальных идей',
          'Риск зацикливания на эстетике в ущерб содержанию',
          'Чувствительность к визуальному хаосу и беспорядку',
          'Может быть сложно работать с ограниченными визуальными ресурсами',
        ],
        'en': [
          'Perfectionism in visual details can slow down work',
          'Difficulty verbalizing visual ideas',
          'Risk of obsessing over aesthetics at the expense of content',
          'Sensitivity to visual chaos and disorder',
          'Can be difficult to work with limited visual resources',
        ],
      },
      recommendations: {
        'ru': [
          'Создайте визуальную библиотеку вдохновения: Pinterest-доски, mood boards',
          'Практикуйте быстрые визуальные скетчи идей без перфекционизма',
          'Изучайте теорию цвета и композиции системно',
          'Экспериментируйте с разными визуальными медиа: фото, иллюстрация, 3D',
          'Учитесь объяснять визуальные решения словами для работы в команде',
          'Посещайте музеи и галереи регулярно',
          'Попробуйте вести визуальный дневник',
          'Изучите работы визуальных художников разных эпох',
        ],
        'en': [
          'Create a visual inspiration library: Pinterest boards, mood boards',
          'Practice quick visual sketches of ideas without perfectionism',
          'Study color theory and composition systematically',
          'Experiment with different visual media: photo, illustration, 3D',
          'Learn to explain visual decisions in words for teamwork',
          'Visit museums and galleries regularly',
          'Try keeping a visual diary',
          'Study works of visual artists from different eras',
        ],
      },
      tryToday: {
        'ru':
            'Сделайте 10-минутный mood board на тему, которая вас волнует. Используйте только визуалы, никаких слов.',
        'en':
            'Create a 10-minute mood board on a topic you care about. Use only visuals, no words.',
      },
      inspiringConclusion: {
        'ru':
            'Ваш визуальный язык — это мост между идеями и людьми. Продолжайте создавать красоту, которая говорит без слов.',
        'en':
            'Your visual language is a bridge between ideas and people. Continue creating beauty that speaks without words.',
      },
    ),
    'verbal_creator': TestProfile(
      id: 'verbal_creator',
      name: {
        'ru': 'Вербальный креатор',
        'en': 'Verbal Creator',
      },
      description: {
        'ru':
            'Вы играете словами, концепциями и идеями. Сторителлинг и нарративы — ваша стихия.',
        'en':
            'You play with words, concepts and ideas. Storytelling and narratives are your element.',
      },
      whyThisProfile: {
        'ru':
            'Вербальный креатор — ваш доминирующий тип (≥35% от общего креативного профиля).',
        'en':
            'Verbal Creator is your dominant type (≥35% of total creative profile).',
      },
      strengths: {
        'ru': [
          'Богатый словарный запас и языковая гибкость',
          'Естественная способность к сторителлингу',
          'Умение находить точные слова для любой идеи',
          'Игра с метафорами и концептуальными связями',
          'Создание захватывающих нарративов',
          'Чувствительность к ритму и звучанию языка',
          'Способность убеждать и вдохновлять через слова',
        ],
        'en': [
          'Rich vocabulary and linguistic flexibility',
          'Natural ability for storytelling',
          'Skill in finding precise words for any idea',
          'Playing with metaphors and conceptual connections',
          'Creating compelling narratives',
          'Sensitivity to rhythm and sound of language',
          'Ability to persuade and inspire through words',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Overthinking и чрезмерная редактура текстов',
          'Сложность визуализации идей',
          'Риск словесной перегруженности вместо простоты',
          'Может быть сложно работать с визуальным контентом',
          'Тенденция к многословности',
        ],
        'en': [
          'Overthinking and excessive editing of texts',
          'Difficulty visualizing ideas',
          'Risk of verbal overload instead of simplicity',
          'Can be difficult to work with visual content',
          'Tendency to verbosity',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте разные стили письма: от минимализма до барокко',
          'Читайте вслух свои тексты — слышьте ритм',
          'Изучайте риторику и техники storytelling',
          'Создайте банк интересных слов, фраз, метафор',
          'Экспериментируйте с жанрами: от поэзии до копирайтинга',
          'Научитесь работать с constraint writing (ограничения развивают креативность)',
          'Попробуйте написать историю в 6 словах',
          'Изучайте мастеров слова: от Хемингуэя до современных авторов',
        ],
        'en': [
          'Practice different writing styles: from minimalism to baroque',
          'Read your texts aloud — hear the rhythm',
          'Study rhetoric and storytelling techniques',
          'Create a bank of interesting words, phrases, metaphors',
          'Experiment with genres: from poetry to copywriting',
          'Learn to work with constraint writing (constraints develop creativity)',
          'Try writing a story in 6 words',
          'Study masters of words: from Hemingway to modern authors',
        ],
      },
      tryToday: {
        'ru':
            'Напишите 3 разных описания одного предмета: в стиле Хемингуэя, в стиле рекламы, в стиле поэзии.',
        'en':
            'Write 3 different descriptions of one object: in Hemingway style, in advertising style, in poetry style.',
      },
      inspiringConclusion: {
        'ru':
            'Слова — ваше оружие и магия. Каждое предложение может изменить мир. Пишите смело.',
        'en':
            'Words are your weapon and magic. Every sentence can change the world. Write boldly.',
      },
    ),
    'systematic_creator': TestProfile(
      id: 'systematic_creator',
      name: {
        'ru': 'Системный креатор',
        'en': 'Systematic Creator',
      },
      description: {
        'ru':
            'Вы находите креативность в структуре, паттернах и логических связях. Создаёте системы и фреймворки.',
        'en':
            'You find creativity in structure, patterns and logical connections. You create systems and frameworks.',
      },
      whyThisProfile: {
        'ru':
            'Системный креатор — ваш доминирующий тип (≥35% от общего креативного профиля).',
        'en':
            'Systematic Creator is your dominant type (≥35% of total creative profile).',
      },
      strengths: {
        'ru': [
          'Видение паттернов и взаимосвязей',
          'Способность создавать эффективные системы',
          'Логическое и стратегическое мышление',
          'Умение оптимизировать процессы',
          'Создание framework для сложных задач',
          'Архитектурное мышление',
          'Способность упрощать сложное через структуру',
        ],
        'en': [
          'Vision of patterns and interconnections',
          'Ability to create efficient systems',
          'Logical and strategic thinking',
          'Skill in optimizing processes',
          'Creating frameworks for complex tasks',
          'Architectural thinking',
          'Ability to simplify complexity through structure',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может показаться "недостаточно креативным" традиционным художникам',
          'Риск чрезмерного усложнения простых вещей',
          'Сложность с хаотичными или эмоциональными процессами',
          'Может быть жёстким к нестандартным подходам',
          'Tendency к over-engineering',
        ],
        'en': [
          'May seem "not creative enough" to traditional artists',
          'Risk of overcomplicating simple things',
          'Difficulty with chaotic or emotional processes',
          'Can be rigid toward non-standard approaches',
          'Tendency to over-engineering',
        ],
      },
      recommendations: {
        'ru': [
          'Изучайте системное мышление и теорию сложности',
          'Практикуйте создание mental models для разных областей',
          'Исследуйте design patterns, архитектурные паттерны',
          'Учитесь визуализировать системы через диаграммы',
          'Экспериментируйте с методологиями: от Agile до Design Thinking',
          'Балансируйте структуру с гибкостью — системы должны дышать',
          'Изучайте работы системных мыслителей: Рассел Акофф, Донелла Медоуз',
          'Применяйте системный подход к личной жизни: привычки, цели, рост',
        ],
        'en': [
          'Study systems thinking and complexity theory',
          'Practice creating mental models for different domains',
          'Explore design patterns, architectural patterns',
          'Learn to visualize systems through diagrams',
          'Experiment with methodologies: from Agile to Design Thinking',
          'Balance structure with flexibility — systems must breathe',
          'Study works of systems thinkers: Russell Ackoff, Donella Meadows',
          'Apply systems approach to personal life: habits, goals, growth',
        ],
      },
      tryToday: {
        'ru':
            'Выберите область жизни и создайте простую систему для её улучшения. Нарисуйте диаграмму связей.',
        'en':
            'Choose an area of life and create a simple system to improve it. Draw a connection diagram.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша способность видеть невидимые связи — это суперсила. Создавайте системы, которые работают на людей.',
        'en':
            'Your ability to see invisible connections is a superpower. Create systems that work for people.',
      },
    ),
    'emotional_creator': TestProfile(
      id: 'emotional_creator',
      name: {
        'ru': 'Эмоциональный креатор',
        'en': 'Emotional Creator',
      },
      description: {
        'ru':
            'Вы творите через чувства, настроение и атмосферу. Передаёте эмоции и создаёте вайб.',
        'en':
            'You create through feelings, mood and atmosphere. You convey emotions and create vibes.',
      },
      whyThisProfile: {
        'ru':
            'Эмоциональный креатор — ваш доминирующий тип (≥35% от общего креативного профиля).',
        'en':
            'Emotional Creator is your dominant type (≥35% of total creative profile).',
      },
      strengths: {
        'ru': [
          'Глубокое эмоциональное восприятие',
          'Способность создавать атмосферу и настроение',
          'Высокая эмпатия и чувствительность',
          'Умение передавать эмоции через творчество',
          'Интуитивное понимание эмоционального резонанса',
          'Создание подлинного и уязвимого контента',
          'Способность трогать сердца людей',
        ],
        'en': [
          'Deep emotional perception',
          'Ability to create atmosphere and mood',
          'High empathy and sensitivity',
          'Skill in conveying emotions through creativity',
          'Intuitive understanding of emotional resonance',
          'Creating authentic and vulnerable content',
          'Ability to touch people\'s hearts',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Зависимость креативности от эмоционального состояния',
          'Эмоциональное выгорание и истощение',
          'Сложность разделения личных эмоций и творчества',
          'Чувствительность к критике',
          'Риск создавать только "в настроении"',
          'Может быть сложно работать с рациональными проектами',
        ],
        'en': [
          'Dependence of creativity on emotional state',
          'Emotional burnout and exhaustion',
          'Difficulty separating personal emotions and creativity',
          'Sensitivity to criticism',
          'Risk of creating only "when in the mood"',
          'Can be difficult to work on rational projects',
        ],
      },
      recommendations: {
        'ru': [
          'Создайте эмоциональный дневник: фиксируйте, что вызывает какие чувства',
          'Практикуйте эмоциональную саморегуляцию: медитация, дыхание',
          'Изучайте психологию эмоций: что стоит за каждым чувством',
          'Создавайте в разных эмоциональных состояниях — расширяйте палитру',
          'Учитесь трансформировать тяжёлые эмоции в творчество',
          'Балансируйте эмоциональную открытость с границами',
          'Работайте с music therapy, art therapy техниками',
          'Изучайте эмоциональных художников: Кало, Ротко, Кандинский',
        ],
        'en': [
          'Create an emotional diary: record what evokes which feelings',
          'Practice emotional self-regulation: meditation, breathing',
          'Study psychology of emotions: what\'s behind each feeling',
          'Create in different emotional states — expand the palette',
          'Learn to transform heavy emotions into creativity',
          'Balance emotional openness with boundaries',
          'Work with music therapy, art therapy techniques',
          'Study emotional artists: Kahlo, Rothko, Kandinsky',
        ],
      },
      tryToday: {
        'ru':
            'Создайте плейлист из 5 треков, каждый — для одной базовой эмоции: радость, грусть, гнев, страх, удивление.',
        'en':
            'Create a playlist of 5 tracks, each for one basic emotion: joy, sadness, anger, fear, surprise.',
      },
      inspiringConclusion: {
        'ru':
            'Ваши эмоции — это не слабость, а источник силы. Продолжайте создавать с сердцем.',
        'en':
            'Your emotions are not weakness, but a source of strength. Continue creating with heart.',
      },
    ),
    'experimental_creator': TestProfile(
      id: 'experimental_creator',
      name: {
        'ru': 'Экспериментальный креатор',
        'en': 'Experimental Creator',
      },
      description: {
        'ru':
            'Вы пробуете всё подряд, миксуете стили и ломаете правила. Креативность через хаос и спонтанность.',
        'en':
            'You try everything, mix styles and break rules. Creativity through chaos and spontaneity.',
      },
      whyThisProfile: {
        'ru':
            'Экспериментальный креатор — ваш доминирующий тип (≥35% от общего креативного профиля).',
        'en':
            'Experimental Creator is your dominant type (≥35% of total creative profile).',
      },
      strengths: {
        'ru': [
          'Бесстрашие в экспериментах',
          'Способность находить неочевидные решения',
          'Устойчивость к неудачам — "fail fast, learn faster"',
          'Гибкость и адаптивность',
          'Создание уникальных миксов и гибридов',
          'Высокая креативная продуктивность',
          'Готовность выходить за границы комфорта',
        ],
        'en': [
          'Fearlessness in experiments',
          'Ability to find non-obvious solutions',
          'Resilience to failures — "fail fast, learn faster"',
          'Flexibility and adaptability',
          'Creating unique mixes and hybrids',
          'High creative productivity',
          'Willingness to go beyond comfort zone',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сложность доводить проекты до конца',
          'Риск хаотичности без структуры',
          'Может быть сложно работать в рамках и ограничениях',
          'Перегрузка одновременными экспериментами',
          'Сложность фокусировки на одном направлении',
          'Может быть непонятным для традиционной аудитории',
        ],
        'en': [
          'Difficulty finishing projects',
          'Risk of chaos without structure',
          'Can be difficult to work within frameworks and constraints',
          'Overload of simultaneous experiments',
          'Difficulty focusing on one direction',
          'May be incomprehensible to traditional audience',
        ],
      },
      recommendations: {
        'ru': [
          'Создайте "экспериментальную лабораторию" — пространство для проб',
          'Документируйте эксперименты: что сработало, что нет, почему',
          'Балансируйте эксперименты с завершением проектов',
          'Изучайте методологию экспериментов: A/B testing, rapid prototyping',
          'Находите сообщество экспериментаторов — вместе веселее',
          'Практикуйте constraint creativity — ограничения стимулируют инновации',
          'Учитесь различать ценные эксперименты от отвлечений',
          'Изучайте работы экспериментальных художников и новаторов',
        ],
        'en': [
          'Create an "experimental lab" — space for trials',
          'Document experiments: what worked, what didn\'t, why',
          'Balance experiments with project completion',
          'Study experiment methodology: A/B testing, rapid prototyping',
          'Find a community of experimenters — more fun together',
          'Practice constraint creativity — limitations stimulate innovations',
          'Learn to distinguish valuable experiments from distractions',
          'Study works of experimental artists and innovators',
        ],
      },
      tryToday: {
        'ru':
            'Выберите 2 несовместимые техники/стиля и создайте гибрид. Например: классическая живопись + мемы.',
        'en':
            'Choose 2 incompatible techniques/styles and create a hybrid. For example: classical painting + memes.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша готовность ломать правила — это путь к инновациям. Продолжайте экспериментировать смело.',
        'en':
            'Your willingness to break rules is the path to innovation. Continue experimenting boldly.',
      },
    ),
    'social_creator': TestProfile(
      id: 'social_creator',
      name: {
        'ru': 'Социальный креатор',
        'en': 'Social Creator',
      },
      description: {
        'ru':
            'Вы черпаете энергию из взаимодействия, коллаборации и диалога. Креативность рождается в обмене.',
        'en':
            'You draw energy from interaction, collaboration and dialogue. Creativity is born in exchange.',
      },
      whyThisProfile: {
        'ru':
            'Социальный креатор — ваш доминирующий тип (≥35% от общего креативного профиля).',
        'en':
            'Social Creator is your dominant type (≥35% of total creative profile).',
      },
      strengths: {
        'ru': [
          'Естественная способность к коллаборации',
          'Генерация идей в диалоге и обсуждении',
          'Умение объединять людей вокруг проекта',
          'Высокая коммуникативность',
          'Способность создавать синергию в командах',
          'Чувствительность к групповой динамике',
          'Создание сообществ и движений',
        ],
        'en': [
          'Natural ability to collaborate',
          'Idea generation in dialogue and discussion',
          'Skill in uniting people around a project',
          'High communicativeness',
          'Ability to create synergy in teams',
          'Sensitivity to group dynamics',
          'Creating communities and movements',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сложность создавать в одиночку',
          'Зависимость от социального feedback',
          'Риск потери собственного голоса в коллективе',
          'Может быть сложно отстаивать индивидуальное видение',
          'Перегрузка социальными взаимодействиями',
          'Сложность работы с конфликтами',
        ],
        'en': [
          'Difficulty creating alone',
          'Dependence on social feedback',
          'Risk of losing own voice in collective',
          'Can be difficult to defend individual vision',
          'Overload from social interactions',
          'Difficulty working with conflicts',
        ],
      },
      recommendations: {
        'ru': [
          'Находите creative communities — онлайн и офлайн',
          'Практикуйте разные форматы коллабораций: парные, групповые, open source',
          'Изучайте facilitation и модерацию групп',
          'Балансируйте коллективную работу с сольными проектами',
          'Создавайте структуры для продуктивного brainstorming',
          'Учитесь давать и принимать конструктивную критику',
          'Развивайте навыки conflict resolution',
          'Попробуйте co-creation форматы: jam sessions, hackathons, workshops',
        ],
        'en': [
          'Find creative communities — online and offline',
          'Practice different collaboration formats: pair, group, open source',
          'Study facilitation and group moderation',
          'Balance collective work with solo projects',
          'Create structures for productive brainstorming',
          'Learn to give and receive constructive criticism',
          'Develop conflict resolution skills',
          'Try co-creation formats: jam sessions, hackathons, workshops',
        ],
      },
      tryToday: {
        'ru':
            'Позовите друга на 30-минутную creative session: берёте одну идею и развиваете её вместе без критики.',
        'en':
            'Invite a friend for a 30-minute creative session: take one idea and develop it together without criticism.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша способность создавать вместе — это редкий дар. Продолжайте строить мосты между людьми.',
        'en':
            'Your ability to create together is a rare gift. Continue building bridges between people.',
      },
    ),
  };

  /// Get all questions for the test
  static List<QuestionModel> _getQuestions() {
    return [
      // FREQUENCY QUESTIONS (1-40): 5-point Likert scale (0-4)
      // Questions use axisWeights for multiple factor scoring

      // Visual Creator questions (1-5)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Когда я объясняю идею, я рисую схемы, диаграммы или скетчи',
          'en': 'When explaining an idea, I draw diagrams, charts, or sketches',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'visual_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru':
              'Я сохраняю скриншоты или картинки, которые вызывают какое-то чувство, даже если не знаю зачем',
          'en':
              'I save screenshots or images that evoke some feeling, even if I don\'t know why',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'visual_creator': 1.0, 'emotional_creator': 0.5},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Мне легче запомнить лицо человека, чем его имя',
          'en': 'It\'s easier for me to remember a person\'s face than their name',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'visual_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я замечаю шрифты на вывесках и упаковках',
          'en': 'I notice fonts on signs and packaging',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'visual_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru':
              'Когда я в плохом настроении, я меняю обои на телефоне или переставляю вещи на столе',
          'en':
              'When I\'m in a bad mood, I change my phone wallpaper or rearrange things on my desk',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'visual_creator': 1.0, 'emotional_creator': 0.5},
        isReversed: false,
      ),

      // Verbal Creator questions (6-10)
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Я долго подбираю слова, чтобы точно выразить мысль',
          'en':
              'I take time to find the right words to express a thought precisely',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'verbal_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru':
              'Мне нравится придумывать названия для плейлистов, папок или заметок',
          'en':
              'I enjoy coming up with names for playlists, folders, or notes',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'verbal_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru':
              'Я замечаю интересные обороты речи в разговорах или текстах',
          'en':
              'I notice interesting turns of phrase in conversations or texts',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'verbal_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Когда мне нравится песня, я читаю её текст',
          'en': 'When I like a song, I read its lyrics',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'verbal_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru':
              'Я придумываю истории или сценарии в голове, пока иду куда-то',
          'en':
              'I make up stories or scenarios in my head while walking somewhere',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'verbal_creator': 1.0},
        isReversed: false,
      ),

      // Systematic Creator questions (11-15)
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я сортирую файлы, папки или закладки по категориям',
          'en': 'I sort files, folders, or bookmarks into categories',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'systematic_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru':
              'Мне нравится находить паттерны или связи между разными вещами',
          'en':
              'I enjoy finding patterns or connections between different things',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'systematic_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Перед началом проекта я составляю план или список шагов',
          'en': 'Before starting a project, I make a plan or list of steps',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'systematic_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru':
              'Я люблю оптимизировать процессы — найти способ сделать что-то быстрее или эффективнее',
          'en':
              'I love optimizing processes — finding ways to do things faster or more efficiently',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'systematic_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru':
              'Мне легко объяснить сложную тему через аналогии или простые схемы',
          'en':
              'I can easily explain complex topics through analogies or simple schemes',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'systematic_creator': 1.0, 'verbal_creator': 0.5},
        isReversed: false,
      ),

      // Emotional Creator questions (16-20)
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Музыка сильно влияет на моё настроение и продуктивность',
          'en': 'Music strongly affects my mood and productivity',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'emotional_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru':
              'Я создаю разные плейлисты под разное настроение или задачу',
          'en': 'I create different playlists for different moods or tasks',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'emotional_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Я чувствую энергию или атмосферу места, как только захожу',
          'en': 'I feel the energy or atmosphere of a place as soon as I enter',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'emotional_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru':
              'Мне важно, чтобы моё окружение (комната, рабочее место) отражало моё текущее состояние',
          'en':
              'It\'s important to me that my surroundings (room, workspace) reflect my current state',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'emotional_creator': 1.0, 'visual_creator': 0.5},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru':
              'Я легко понимаю, что чувствует другой человек, даже если он не говорит об этом',
          'en':
              'I easily understand what another person is feeling, even if they don\'t say it',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'emotional_creator': 1.0, 'social_creator': 0.5},
        isReversed: false,
      ),

      // Experimental Creator questions (21-25)
      QuestionModel(
        id: 'q21',
        text: {
          'ru':
              'Я пробую новые функции приложений или настройки, не читая инструкцию',
          'en':
              'I try new app features or settings without reading instructions',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'experimental_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru':
              'Мне нравится комбинировать стили, жанры или форматы, которые обычно не смешивают',
          'en':
              'I enjoy combining styles, genres, or formats that aren\'t usually mixed',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'experimental_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru':
              'Я меняю планы на ходу, если появляется более интересная идея',
          'en': 'I change plans on the go if a more interesting idea appears',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'experimental_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Мне скучно делать что-то одним и тем же способом дважды',
          'en': 'I get bored doing something the same way twice',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'experimental_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q25',
        text: {
          'ru':
              'Я использую вещи не по их прямому назначению (например, приложения или инструменты)',
          'en':
              'I use things not for their intended purpose (like apps or tools)',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'experimental_creator': 1.0},
        isReversed: false,
      ),

      // Social Creator questions (26-30)
      QuestionModel(
        id: 'q26',
        text: {
          'ru':
              'Обсуждение идеи с кем-то помогает мне её развить лучше, чем размышление в одиночку',
          'en':
              'Discussing an idea with someone helps me develop it better than thinking alone',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'social_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru':
              'Я сохраняю интересные посты или идеи, чтобы поделиться ими с определёнными людьми',
          'en':
              'I save interesting posts or ideas to share them with specific people',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'social_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru':
              'Мне нравится делать коллаборации или работать над чем-то вместе с другими',
          'en':
              'I enjoy collaborations or working on something together with others',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'social_creator': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru':
              'Я часто получаю вдохновение от разговоров или наблюдения за людьми',
          'en':
              'I often get inspiration from conversations or observing people',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'social_creator': 1.0, 'inspiration_sources': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Мне важна реакция других на то, что я создаю',
          'en': 'Other people\'s reactions to what I create are important to me',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'social_creator': 1.0},
        isReversed: false,
      ),

      // Blockers questions (31-35)
      QuestionModel(
        id: 'q31',
        text: {
          'ru':
              'Я откладываю публикацию или показ своей работы, потому что она кажется недостаточно хорошей',
          'en':
              'I postpone publishing or showing my work because it doesn\'t seem good enough',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'blockers': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Я начинаю много проектов, но мало доделываю до конца',
          'en': 'I start many projects but finish few',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'blockers': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Я сравниваю свою работу с работой других и это демотивирует',
          'en': 'I compare my work to others\' and it demotivates me',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'blockers': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Страх критики останавливает меня от экспериментов',
          'en': 'Fear of criticism stops me from experimenting',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'blockers': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru':
              'Я трачу больше времени на подготовку/планирование, чем на само создание',
          'en':
              'I spend more time preparing/planning than actually creating',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'blockers': 1.0},
        isReversed: false,
      ),

      // Inspiration Sources questions (36-40)
      QuestionModel(
        id: 'q36',
        text: {
          'ru':
              'Я получаю вдохновение от случайных вещей: подслушанного разговора, странной вывески, необычного сочетания предметов',
          'en':
              'I get inspiration from random things: overheard conversations, weird signs, unusual combinations of objects',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'inspiration_sources': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Прогулки или движение помогают мне думать и придумывать идеи',
          'en': 'Walks or movement help me think and come up with ideas',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'inspiration_sources': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru':
              'Я черпаю идеи из разного контента: фильмов, книг, подкастов, соцсетей',
          'en':
              'I draw ideas from different content: movies, books, podcasts, social media',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'inspiration_sources': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Природа или тишина перезагружают моё креативное мышление',
          'en': 'Nature or silence reboots my creative thinking',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'inspiration_sources': 1.0},
        isReversed: false,
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru':
              'Я замечаю детали в окружающем мире, которые другие пропускают',
          'en': 'I notice details in the world around me that others miss',
        },
        answers: _getFrequencyAnswers(),
        axisWeights: {'inspiration_sources': 1.0, 'visual_creator': 0.5},
        isReversed: false,
      ),

      // MULTIPLE CHOICE QUESTIONS (41-48)
      // For these questions, use getAnswerWeights() method to get factor weights per answer
      // factorId is set to 'multiple' to indicate special handling needed

      // Question 41: When having creative block
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Когда у меня творческий ступор, я:',
          'en': 'When I have creative block, I:',
        },
        answers: [
          AnswerModel(
            id: 'q41_a1',
            text: {
              'ru': 'Скроллю Pinterest, Behance или сохранённые посты',
              'en': 'Scroll through Pinterest, Behance, or saved posts',
            },
            score: 0, // Not used for multiple choice - weights defined in getAnswerWeights()
          ),
          AnswerModel(
            id: 'q41_a2',
            text: {
              'ru': 'Пишу поток мыслей в заметки или разговариваю с кем-то',
              'en': 'Write stream of consciousness in notes or talk to someone',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q41_a3',
            text: {
              'ru': 'Переключаюсь на другую задачу или проект',
              'en': 'Switch to another task or project',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q41_a4',
            text: {
              'ru': 'Слушаю музыку или иду гулять, чтобы перезагрузиться',
              'en': 'Listen to music or go for a walk to reboot',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q41_a5',
            text: {
              'ru':
                  'Начинаю экспериментировать со случайными идеями, даже глупыми',
              'en': 'Start experimenting with random ideas, even silly ones',
            },
            score: 0,
          ),
        ],
        factorId: 'multiple',
        isReversed: false,
      ),

      // Question 42: Ideal project
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Идеальный проект для меня — это:',
          'en': 'The ideal project for me is:',
        },
        answers: [
          AnswerModel(
            id: 'q42_a1',
            text: {
              'ru': 'Что-то визуально красивое: дизайн, арт, эстетика',
              'en': 'Something visually beautiful: design, art, aesthetics',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q42_a2',
            text: {
              'ru': 'История, текст, концепция — что-то, что можно рассказать',
              'en': 'A story, text, concept — something that can be told',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q42_a3',
            text: {
              'ru': 'Система, которую можно улучшить или оптимизировать',
              'en': 'A system that can be improved or optimized',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q42_a4',
            text: {
              'ru': 'Что-то, что вызывает эмоции и создаёт настроение',
              'en': 'Something that evokes emotions and creates a mood',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q42_a5',
            text: {
              'ru': 'Эксперимент: что-то новое, что никто ещё не делал',
              'en': 'An experiment: something new that no one has done yet',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q42_a6',
            text: {
              'ru': 'Коллаборация с интересными людьми',
              'en': 'Collaboration with interesting people',
            },
            score: 0,
          ),
        ],
        factorId: 'multiple',
        isReversed: false,
      ),

      // Question 43: What you notice first
      QuestionModel(
        id: 'q43',
        text: {
          'ru':
              'Когда я смотрю на работу другого человека, первое, что я замечаю:',
          'en': 'When I look at someone else\'s work, the first thing I notice:',
        },
        answers: [
          AnswerModel(
            id: 'q43_a1',
            text: {
              'ru': 'Цвета, композицию, визуальную гармонию',
              'en': 'Colors, composition, visual harmony',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q43_a2',
            text: {
              'ru': 'Идею, месседж, то, что автор хотел сказать',
              'en': 'The idea, message, what the author wanted to say',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q43_a3',
            text: {
              'ru': 'Структуру, логику, как это сделано технически',
              'en': 'Structure, logic, how it\'s technically done',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q43_a4',
            text: {
              'ru': 'Какие чувства это вызывает, общий вайб',
              'en': 'What feelings it evokes, overall vibe',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q43_a5',
            text: {
              'ru': 'Насколько это оригинально и неожиданно',
              'en': 'How original and unexpected it is',
            },
            score: 0,
          ),
        ],
        factorId: 'multiple',
        isReversed: false,
      ),

      // Question 44: Work process
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Мой рабочий процесс обычно выглядит так:',
          'en': 'My work process usually looks like:',
        },
        answers: [
          AnswerModel(
            id: 'q44_a1',
            text: {
              'ru': 'Сначала визуализирую в голове или делаю мудборд',
              'en': 'First visualize in my head or make a moodboard',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q44_a2',
            text: {
              'ru': 'Записываю мысли, делаю брейншторм на бумаге',
              'en': 'Write down thoughts, brainstorm on paper',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q44_a3',
            text: {
              'ru': 'Разбиваю на этапы, делаю структуру или план',
              'en': 'Break into stages, make structure or plan',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q44_a4',
            text: {
              'ru': 'Ловлю нужное настроение и работаю в потоке',
              'en': 'Catch the right mood and work in flow',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q44_a5',
            text: {
              'ru': 'Просто начинаю что-то делать и смотрю, куда это приведёт',
              'en': 'Just start doing something and see where it leads',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q44_a6',
            text: {
              'ru': 'Обсуждаю с кем-то, получаю фидбек по ходу',
              'en': 'Discuss with someone, get feedback along the way',
            },
            score: 0,
          ),
        ],
        factorId: 'multiple',
        isReversed: false,
      ),

      // Question 45: Energy source
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Что даёт мне больше всего энергии для творчества:',
          'en': 'What gives me the most energy for creativity:',
        },
        answers: [
          AnswerModel(
            id: 'q45_a1',
            text: {
              'ru': 'Красивые визуальные референсы и вдохновляющая эстетика',
              'en': 'Beautiful visual references and inspiring aesthetics',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q45_a2',
            text: {
              'ru': 'Интересные книги, подкасты, статьи — новые идеи',
              'en': 'Interesting books, podcasts, articles — new ideas',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q45_a3',
            text: {
              'ru': 'Задача с чёткой целью, которую можно решить',
              'en': 'A task with a clear goal that can be solved',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q45_a4',
            text: {
              'ru': 'Сильные эмоции или атмосферные места',
              'en': 'Strong emotions or atmospheric places',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q45_a5',
            text: {
              'ru': 'Свобода экспериментировать без ограничений',
              'en': 'Freedom to experiment without limits',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q45_a6',
            text: {
              'ru': 'Общение с креативными людьми',
              'en': 'Communication with creative people',
            },
            score: 0,
          ),
        ],
        factorId: 'multiple',
        isReversed: false,
      ),

      // Question 46: If had to create now
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Если бы мне нужно было создать что-то прямо сейчас, я бы скорее всего:',
          'en': 'If I had to create something right now, I would most likely:',
        },
        answers: [
          AnswerModel(
            id: 'q46_a1',
            text: {
              'ru': 'Открыл Figma/Photoshop или начал бы рисовать',
              'en': 'Open Figma/Photoshop or start drawing',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q46_a2',
            text: {
              'ru': 'Начал писать: текст, историю, концепцию',
              'en': 'Start writing: text, story, concept',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q46_a3',
            text: {
              'ru': 'Набросал бы схему или план в Notion/Miro',
              'en': 'Sketch out a scheme or plan in Notion/Miro',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q46_a4',
            text: {
              'ru': 'Включил музыку и начал что-то делать по настроению',
              'en': 'Turn on music and start doing something based on mood',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q46_a5',
            text: {
              'ru': 'Попробовал бы что-то новое, чего раньше не делал',
              'en': 'Try something new I haven\'t done before',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q46_a6',
            text: {
              'ru': 'Написал бы кому-то: \'Давай сделаем что-то вместе\'',
              'en': 'Message someone: \'Let\'s make something together\'',
            },
            score: 0,
          ),
        ],
        factorId: 'multiple',
        isReversed: false,
      ),

      // Question 47: Finished work definition
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Для меня \'завершённая работа\' — это когда:',
          'en': 'For me \'finished work\' is when:',
        },
        answers: [
          AnswerModel(
            id: 'q47_a1',
            text: {
              'ru': 'Визуально всё гармонично и красиво',
              'en': 'Everything is visually harmonious and beautiful',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q47_a2',
            text: {
              'ru': 'Идея ясно передана и понятна',
              'en': 'The idea is clearly conveyed and understandable',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q47_a3',
            text: {
              'ru': 'Всё работает логично и эффективно',
              'en': 'Everything works logically and efficiently',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q47_a4',
            text: {
              'ru': 'Это вызывает нужное чувство или эмоцию',
              'en': 'It evokes the right feeling or emotion',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q47_a5',
            text: {
              'ru':
                  'Я попробовал всё, что хотел, даже если результат неидеален',
              'en':
                  'I tried everything I wanted, even if the result isn\'t perfect',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q47_a6',
            text: {
              'ru': 'Другие люди дали положительную реакцию',
              'en': 'Other people gave positive feedback',
            },
            score: 0,
          ),
        ],
        factorId: 'multiple',
        isReversed: false,
      ),

      // Question 48: Main motivation
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Моя главная мотивация в творчестве:',
          'en': 'My main motivation in creativity:',
        },
        answers: [
          AnswerModel(
            id: 'q48_a1',
            text: {
              'ru': 'Создавать красивые, эстетичные вещи',
              'en': 'Create beautiful, aesthetic things',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q48_a2',
            text: {
              'ru': 'Делиться идеями и историями',
              'en': 'Share ideas and stories',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q48_a3',
            text: {
              'ru': 'Решать проблемы и улучшать процессы',
              'en': 'Solve problems and improve processes',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q48_a4',
            text: {
              'ru': 'Передавать эмоции и создавать атмосферу',
              'en': 'Convey emotions and create atmosphere',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q48_a5',
            text: {
              'ru': 'Пробовать новое и ломать границы',
              'en': 'Try new things and break boundaries',
            },
            score: 0,
          ),
          AnswerModel(
            id: 'q48_a6',
            text: {
              'ru': 'Сотрудничать и создавать вместе с другими',
              'en': 'Collaborate and create together with others',
            },
            score: 0,
          ),
        ],
        factorId: 'multiple',
        isReversed: false,
      ),
    ];
  }

  /// Standard 5-point frequency scale (Never - Always)
  /// Scores: 0-4 (RULE #1: MUST start from 0!)
  static List<AnswerModel> _getFrequencyAnswers() {
    return [
      AnswerModel(
        id: 'never',
        text: {
          'ru': 'Никогда',
          'en': 'Never',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'rarely',
        text: {
          'ru': 'Редко',
          'en': 'Rarely',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'sometimes',
        text: {
          'ru': 'Иногда',
          'en': 'Sometimes',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'often',
        text: {
          'ru': 'Часто',
          'en': 'Often',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'always',
        text: {
          'ru': 'Всегда',
          'en': 'Always',
        },
        score: 4,
      ),
    ];
  }
}
