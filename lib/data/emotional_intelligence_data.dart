// Emotional Intelligence Test - смешанная модель Salovey-Mayer + Goleman
// 70 вопросов, 7 факторов, ~15 минут

import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Основной класс данных для теста эмоционального интеллекта
class EmotionalIntelligenceData {
  /// Получить модель теста
  static TestModel getEmotionalIntelligenceTest() {
    return TestModel(
      id: 'emotional_intelligence',
      categoryId: 'intelligence',
      title: {
        'ru': 'Эмоциональный интеллект (EQ)',
        'en': 'Emotional Intelligence (EQ)',
      },
      category: {
        'ru': 'Интеллект и способности',
        'en': 'Intelligence and Abilities',
      },
      description: {
        'ru': 'Эмоциональный интеллект — это способность понимать, использовать и управлять своими эмоциями, '
            'а также распознавать и влиять на эмоции других людей. Высокий EQ помогает строить крепкие отношения, '
            'эффективно справляться со стрессом и принимать взвешенные решения.\n\n'
            'Этот тест основан на смешанной модели Саловей-Майер и Гоулмана, оценивая семь ключевых компонентов '
            'эмоционального интеллекта: восприятие эмоций, их понимание, управление собой, использование эмоций '
            'для решения задач, эмпатию, социальные навыки и мотивацию.',
        'en': 'Emotional Intelligence is the ability to understand, use, and manage your own emotions, '
            'as well as recognize and influence the emotions of others. High EQ helps build strong relationships, '
            'effectively cope with stress, and make informed decisions.\n\n'
            'This test is based on the mixed Salovey-Mayer and Goleman model, assessing seven key components '
            'of emotional intelligence: emotional perception, understanding, self-management, emotional facilitation, '
            'empathy, social skills, and motivation.',
      },
      estimatedTime: 15,
      type: TestType.multiFactor,
      factorIds: [
        'emotional_perception',
        'emotional_understanding',
        'self_management',
        'emotional_facilitation',
        'empathy',
        'social_skills',
        'motivation',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'emotional_perception': {
        'ru': 'Восприятие эмоций',
        'en': 'Emotional Perception',
      },
      'emotional_understanding': {
        'ru': 'Понимание эмоций',
        'en': 'Emotional Understanding',
      },
      'self_management': {
        'ru': 'Управление собой',
        'en': 'Self-Management',
      },
      'emotional_facilitation': {
        'ru': 'Использование эмоций',
        'en': 'Emotional Facilitation',
      },
      'empathy': {
        'ru': 'Эмпатия',
        'en': 'Empathy',
      },
      'social_skills': {
        'ru': 'Социальные навыки',
        'en': 'Social Skills',
      },
      'motivation': {
        'ru': 'Мотивация',
        'en': 'Motivation',
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

    // Determine level
    final String level;
    if (percentage <= 20) {
      level = 'very_low';
    } else if (percentage <= 40) {
      level = 'low';
    } else if (percentage <= 60) {
      level = 'medium';
    } else if (percentage <= 80) {
      level = 'high';
    } else {
      level = 'very_high';
    }

    // Simple interpretation based on level
    final levelNames = {
      'very_low': {'ru': 'Очень низкий', 'en': 'Very Low'},
      'low': {'ru': 'Низкий', 'en': 'Low'},
      'medium': {'ru': 'Средний', 'en': 'Medium'},
      'high': {'ru': 'Высокий', 'en': 'High'},
      'very_high': {'ru': 'Очень высокий', 'en': 'Very High'},
    };

    final factorNames = getFactorNames()[factorId] ?? {'ru': factorId, 'en': factorId};
    final levelName = levelNames[level] ?? {'ru': level, 'en': level};

    return {
      'ru': '${levelName['ru']} уровень: ${factorNames['ru']}',
      'en': '${levelName['en']} level: ${factorNames['en']}',
    };
  }

  /// Determine profile based on percentages
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_developing_eq';

    // Calculate average EQ
    final avgEQ = percentages.values.reduce((a, b) => a + b) / percentages.length;

    // Profile based on average EQ level
    if (avgEQ >= 75) return 'profile_eq_master';
    if (avgEQ >= 60) return 'profile_emotionally_intelligent';
    if (avgEQ >= 40) return 'profile_developing_eq';
    if (avgEQ >= 25) return 'profile_low_eq';
    return 'profile_very_low_eq';
  }

  /// Get profile by ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  // ============================================================
  // PROFILES
  // ============================================================

  static final Map<String, TestProfile> _profiles = {
    'profile_eq_master': TestProfile(
      id: 'profile_eq_master',
      name: {
        'ru': 'Мастер эмоционального интеллекта',
        'en': 'EQ Master',
      },
      description: {
        'ru': 'Вы обладаете исключительно высоким уровнем эмоционального интеллекта. '
            'Вы отлично распознаёте эмоции, понимаете их природу, эффективно управляете своими чувствами '
            'и мастерски взаимодействуете с людьми.',
        'en': 'You possess an exceptionally high level of emotional intelligence. '
            'You excel at recognizing emotions, understanding their nature, effectively managing your feelings, '
            'and masterfully interacting with people.',
      },
      whyThisProfile: {
        'ru': 'Ваши результаты показывают высокие баллы по всем компонентам EQ: '
            'от восприятия эмоций до социальных навыков. Вы демонстрируете зрелость '
            'в управлении эмоциональной сферой жизни.',
        'en': 'Your results show high scores across all EQ components: '
            'from emotional perception to social skills. You demonstrate maturity '
            'in managing the emotional sphere of life.',
      },
      strengths: {
        'ru': [
          'Точное распознавание эмоций у себя и других',
          'Глубокое понимание причин и развития эмоций',
          'Отличное управление эмоциональными реакциями',
          'Высокая эмпатия и способность к сопереживанию',
          'Развитые навыки общения и влияния',
          'Умение использовать эмоции для достижения целей',
          'Устойчивая внутренняя мотивация',
        ],
        'en': [
          'Accurate recognition of emotions in yourself and others',
          'Deep understanding of the causes and development of emotions',
          'Excellent management of emotional reactions',
          'High empathy and ability to empathize',
          'Well-developed communication and influence skills',
          'Ability to use emotions to achieve goals',
          'Stable intrinsic motivation',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск эмоционального выгорания из-за высокой чувствительности к чужим эмоциям',
          'Возможность перегрузки от эмоциональных запросов окружающих',
          'Иногда слишком глубокий анализ может замедлять принятие решений',
        ],
        'en': [
          'Risk of emotional burnout due to high sensitivity to others\' emotions',
          'Possibility of overload from emotional demands of others',
          'Sometimes overly deep analysis can slow down decision-making',
        ],
      },
      recommendations: {
        'ru': [
          'Используйте свой дар в профессиях, требующих высокого EQ (психология, коучинг, HR, менеджмент)',
          'Обучайте других развитию эмоционального интеллекта',
          'Устанавливайте здоровые эмоциональные границы',
          'Практикуйте техники эмоциональной саморегуляции для профилактики выгорания',
          'Продолжайте развиваться: изучайте нейробиологию эмоций, культурные особенности',
        ],
        'en': [
          'Use your gift in professions requiring high EQ (psychology, coaching, HR, management)',
          'Teach others to develop emotional intelligence',
          'Establish healthy emotional boundaries',
          'Practice emotional self-regulation techniques to prevent burnout',
          'Continue developing: study neurobiology of emotions, cultural specifics',
        ],
      },
      tryToday: {
        'ru': 'Сегодня помогите кому-то осознать и назвать свою эмоцию. '
            'Используйте фразу: "Мне кажется, ты сейчас чувствуешь... Я прав?"',
        'en': 'Today, help someone become aware of and name their emotion. '
            'Use the phrase: "It seems to me you\'re feeling... Am I right?"',
      },
      inspiringConclusion: {
        'ru': 'Ваш эмоциональный интеллект — это ценный дар. Используйте его для создания '
            'более гармоничных отношений и помощи другим людям в их развитии.',
        'en': 'Your emotional intelligence is a valuable gift. Use it to create '
            'more harmonious relationships and help others in their development.',
      },
    ),

    'profile_emotionally_intelligent': TestProfile(
      id: 'profile_emotionally_intelligent',
      name: {
        'ru': 'Эмоционально развитый',
        'en': 'Emotionally Intelligent',
      },
      description: {
        'ru': 'У вас высокий уровень эмоционального интеллекта. Вы хорошо понимаете свои эмоции '
            'и чувства других людей, умеете управлять своими реакциями и эффективно взаимодействуете в социуме.',
        'en': 'You have a high level of emotional intelligence. You understand your emotions well '
            'and the feelings of others, know how to manage your reactions, and interact effectively in society.',
      },
      whyThisProfile: {
        'ru': 'Ваши результаты демонстрируют развитые навыки во всех областях EQ. '
            'Вы достигли значительного прогресса в эмоциональном развитии.',
        'en': 'Your results demonstrate developed skills in all areas of EQ. '
            'You have made significant progress in emotional development.',
      },
      strengths: {
        'ru': [
          'Хорошее распознавание эмоциональных сигналов',
          'Понимание эмоциональных процессов',
          'Развитая способность к эмпатии',
          'Умение управлять своими эмоциями в большинстве ситуаций',
          'Эффективные социальные навыки',
          'Способность мотивировать себя и других',
        ],
        'en': [
          'Good recognition of emotional signals',
          'Understanding of emotional processes',
          'Developed capacity for empathy',
          'Ability to manage your emotions in most situations',
          'Effective social skills',
          'Ability to motivate yourself and others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'В стрессовых ситуациях контроль эмоций может ослабевать',
          'Некоторые сложные эмоциональные ситуации могут вызывать затруднения',
          'Есть пространство для роста в отдельных компонентах EQ',
        ],
        'en': [
          'In stressful situations, emotional control may weaken',
          'Some complex emotional situations may cause difficulties',
          'There is room for growth in individual EQ components',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте развивать те аспекты EQ, где результаты ниже',
          'Практикуйте осознанность для углубления понимания эмоций',
          'Изучайте продвинутые техники эмоциональной регуляции',
          'Обращайте внимание на культурные различия в эмоциональных проявлениях',
          'Развивайте навыки управления групповой эмоциональной динамикой',
        ],
        'en': [
          'Continue developing those aspects of EQ where results are lower',
          'Practice mindfulness to deepen understanding of emotions',
          'Study advanced emotional regulation techniques',
          'Pay attention to cultural differences in emotional expressions',
          'Develop skills in managing group emotional dynamics',
        ],
      },
      tryToday: {
        'ru': 'Сегодня, столкнувшись с негативной эмоцией, остановитесь и спросите себя: '
            '"Что эта эмоция пытается мне сообщить? Какая потребность не удовлетворена?"',
        'en': 'Today, when facing a negative emotion, pause and ask yourself: '
            '"What is this emotion trying to tell me? What need is unmet?"',
      },
      inspiringConclusion: {
        'ru': 'Вы на правильном пути эмоционального развития. Продолжайте совершенствовать '
            'свои навыки — они делают вашу жизнь богаче и гармоничнее.',
        'en': 'You are on the right path of emotional development. Continue to improve '
            'your skills—they make your life richer and more harmonious.',
      },
    ),

    'profile_developing_eq': TestProfile(
      id: 'profile_developing_eq',
      name: {
        'ru': 'Развивающий эмоциональный интеллект',
        'en': 'Developing Emotional Intelligence',
      },
      description: {
        'ru': 'Вы находитесь на этапе активного развития эмоционального интеллекта. '
            'У вас есть базовое понимание эмоций, но многие аспекты EQ требуют дальнейшего роста.',
        'en': 'You are at the stage of actively developing emotional intelligence. '
            'You have a basic understanding of emotions, but many aspects of EQ require further growth.',
      },
      whyThisProfile: {
        'ru': 'Ваши результаты показывают средний уровень по большинству компонентов EQ. '
            'Это нормальный этап развития с большим потенциалом для роста.',
        'en': 'Your results show an average level across most EQ components. '
            'This is a normal stage of development with great potential for growth.',
      },
      strengths: {
        'ru': [
          'Осознание важности эмоционального интеллекта',
          'Способность распознавать базовые эмоции',
          'Готовность к саморазвитию',
          'Понимание основных эмоциональных механизмов',
        ],
        'en': [
          'Awareness of the importance of emotional intelligence',
          'Ability to recognize basic emotions',
          'Readiness for self-development',
          'Understanding of basic emotional mechanisms',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сложности с распознаванием тонких эмоциональных нюансов',
          'Иногда эмоции могут выходить из-под контроля',
          'Затруднения в понимании сложных эмоциональных состояний',
          'Недостаточное использование эмоций для решения задач',
        ],
        'en': [
          'Difficulties recognizing subtle emotional nuances',
          'Sometimes emotions can get out of control',
          'Difficulties understanding complex emotional states',
          'Insufficient use of emotions for problem-solving',
        ],
      },
      recommendations: {
        'ru': [
          'Начните вести эмоциональный дневник для развития осознанности',
          'Читайте базовую литературу по EQ (Дэниел Гоулман, Пол Экман)',
          'Практикуйте активное слушание в разговорах',
          'Учитесь называть свои эмоции точными словами',
          'Изучайте невербальную коммуникацию',
          'Развивайте эмпатию через чтение художественной литературы',
        ],
        'en': [
          'Start keeping an emotional diary to develop awareness',
          'Read basic EQ literature (Daniel Goleman, Paul Ekman)',
          'Practice active listening in conversations',
          'Learn to name your emotions with precise words',
          'Study nonverbal communication',
          'Develop empathy through reading fiction',
        ],
      },
      tryToday: {
        'ru': 'Сегодня 3 раза в течение дня остановитесь и спросите себя: '
            '"Что я сейчас чувствую?" Попробуйте назвать эмоцию максимально точно.',
        'en': 'Today, pause 3 times throughout the day and ask yourself: '
            '"What am I feeling right now?" Try to name the emotion as precisely as possible.',
      },
      inspiringConclusion: {
        'ru': 'Развитие эмоционального интеллекта — это путешествие длиною в жизнь. '
            'Вы уже сделали первые шаги, продолжайте двигаться вперёд!',
        'en': 'Developing emotional intelligence is a lifelong journey. '
            'You have already taken the first steps, keep moving forward!',
      },
    ),

    'profile_low_eq': TestProfile(
      id: 'profile_low_eq',
      name: {
        'ru': 'Низкий эмоциональный интеллект',
        'en': 'Low Emotional Intelligence',
      },
      description: {
        'ru': 'Ваш эмоциональный интеллект находится на начальном уровне развития. '
            'Вам сложно распознавать и понимать эмоции, что может создавать трудности в общении и отношениях.',
        'en': 'Your emotional intelligence is at an initial level of development. '
            'You find it difficult to recognize and understand emotions, which can create difficulties in communication and relationships.',
      },
      whyThisProfile: {
        'ru': 'Ваши результаты показывают низкие баллы по большинству компонентов EQ. '
            'Это означает, что у вас есть значительное пространство для роста.',
        'en': 'Your results show low scores across most EQ components. '
            'This means you have significant room for growth.',
      },
      strengths: {
        'ru': [
          'Честность в самооценке',
          'Осознание необходимости развития',
          'Потенциал для значительного роста',
          'Возможность начать с чистого листа',
        ],
        'en': [
          'Honesty in self-assessment',
          'Awareness of the need for development',
          'Potential for significant growth',
          'Opportunity to start fresh',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Трудности в распознавании собственных эмоций',
          'Сложности с пониманием чувств других людей',
          'Проблемы с контролем эмоциональных реакций',
          'Недостаточная эмпатия',
          'Затруднения в социальных взаимодействиях',
        ],
        'en': [
          'Difficulties recognizing your own emotions',
          'Difficulties understanding others\' feelings',
          'Problems controlling emotional reactions',
          'Insufficient empathy',
          'Difficulties in social interactions',
        ],
      },
      recommendations: {
        'ru': [
          'НАЧНИТЕ С ОСНОВ: изучите 6 базовых эмоций (радость, грусть, гнев, страх, удивление, отвращение)',
          'Ведите простой дневник эмоций: утро-день-вечер записывайте по одной эмоции',
          'Смотрите обучающие видео по распознаванию эмоций на лице',
          'Обратитесь к психологу для индивидуальной работы над EQ',
          'Читайте "Эмоциональный интеллект" Дэниела Гоулмана',
          'Практикуйте осознанность и медитацию',
        ],
        'en': [
          'START WITH BASICS: learn the 6 basic emotions (joy, sadness, anger, fear, surprise, disgust)',
          'Keep a simple emotion diary: morning-afternoon-evening, record one emotion',
          'Watch educational videos on recognizing emotions on faces',
          'Consult a psychologist for individual EQ work',
          'Read "Emotional Intelligence" by Daniel Goleman',
          'Practice mindfulness and meditation',
        ],
      },
      tryToday: {
        'ru': 'Сегодня каждый час останавливайтесь на минуту и пытайтесь назвать хотя бы одну эмоцию, '
            'которую вы чувствуете. Не важно, правильно или нет — важна практика.',
        'en': 'Today, every hour pause for a minute and try to name at least one emotion '
            'you are feeling. It doesn\'t matter if it\'s right or wrong—practice is what matters.',
      },
      inspiringConclusion: {
        'ru': 'Помните: эмоциональный интеллект не врождённый дар, а навык, который можно развить. '
            'Ваше путешествие только начинается!',
        'en': 'Remember: emotional intelligence is not an innate gift, but a skill that can be developed. '
            'Your journey is just beginning!',
      },
    ),

    'profile_very_low_eq': TestProfile(
      id: 'profile_very_low_eq',
      name: {
        'ru': 'Очень низкий эмоциональный интеллект',
        'en': 'Very Low Emotional Intelligence',
      },
      description: {
        'ru': 'Вам значительно сложно работать с эмоциональной сферой. Распознавание, понимание '
            'и управление эмоциями представляют для вас существенную трудность.',
        'en': 'You find it significantly difficult to work with the emotional sphere. Recognition, understanding, '
            'and management of emotions present substantial difficulty for you.',
      },
      whyThisProfile: {
        'ru': 'Ваши результаты показывают очень низкие баллы по всем компонентам EQ. '
            'Это требует системной работы над развитием эмоционального интеллекта.',
        'en': 'Your results show very low scores across all EQ components. '
            'This requires systematic work on developing emotional intelligence.',
      },
      strengths: {
        'ru': [
          'Вы прошли тест и готовы смотреть правде в глаза',
          'У вас огромный потенциал для роста',
          'Любое улучшение будет очень заметным',
          'Вы можете начать путь трансформации',
        ],
        'en': [
          'You took the test and are ready to face the truth',
          'You have enormous potential for growth',
          'Any improvement will be very noticeable',
          'You can begin a path of transformation',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Серьёзные трудности в распознавании эмоций',
          'Непонимание причин и механизмов эмоций',
          'Слабый контроль эмоциональных реакций',
          'Очень низкая эмпатия',
          'Значительные проблемы в социальных отношениях',
          'Трудности с мотивацией и достижением целей',
        ],
        'en': [
          'Serious difficulties recognizing emotions',
          'Lack of understanding of causes and mechanisms of emotions',
          'Weak control of emotional reactions',
          'Very low empathy',
          'Significant problems in social relationships',
          'Difficulties with motivation and achieving goals',
        ],
      },
      recommendations: {
        'ru': [
          'ВАЖНО: Обратитесь к профессиональному психологу для индивидуальной работы',
          'Начните с самого простого: учитесь различать "хорошо" и "плохо" в своих ощущениях',
          'Смотрите мультфильм "Головоломка" (Inside Out) — он объясняет эмоции просто',
          'Используйте приложения для отслеживания настроения (Daylio, Moodpath)',
          'Читайте детские книги об эмоциях — они объясняют базовые концепции',
          'Практикуйте телесную осознанность: учитесь замечать физические ощущения',
          'Начните групповую терапию для развития социальных навыков',
        ],
        'en': [
          'IMPORTANT: Consult a professional psychologist for individual work',
          'Start with the simplest: learn to distinguish "good" and "bad" in your sensations',
          'Watch the movie "Inside Out"—it explains emotions simply',
          'Use mood tracking apps (Daylio, Moodpath)',
          'Read children\'s books about emotions—they explain basic concepts',
          'Practice body awareness: learn to notice physical sensations',
          'Start group therapy to develop social skills',
        ],
      },
      tryToday: {
        'ru': 'Сегодня перед сном просто запишите: "Мой день был в целом хороший/нейтральный/плохой". '
            'Это первый шаг к осознанию эмоций.',
        'en': 'Today before bed, simply write: "My day was overall good/neutral/bad". '
            'This is the first step toward emotional awareness.',
      },
      inspiringConclusion: {
        'ru': 'Развитие EQ — это долгий путь, но он абсолютно доступен для каждого. '
            'Не бойтесь просить помощи. Первый шаг — признать проблему. Вы его уже сделали!',
        'en': 'Developing EQ is a long journey, but it is absolutely accessible to everyone. '
            'Don\'t be afraid to ask for help. The first step is to acknowledge the problem. You\'ve already done it!',
      },
    ),
  };

  // ============================================================
  // QUESTIONS
  // ============================================================

  static List<QuestionModel> _getQuestions() {
    return [
      // ВОСПРИЯТИЕ ЭМОЦИЙ (Emotional Perception) - 10 вопросов
      QuestionModel(
        id: "q1",
        text: {
          'ru': 'Я легко определяю, в каком настроении находятся окружающие',
          'en': 'I easily identify what mood people around me are in',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_perception',
        isReversed: false,
      ),
      QuestionModel(
        id: "q2",
        text: {
          'ru': 'Мне сложно понять, что я чувствую в данный момент',
          'en': 'I find it difficult to understand what I am feeling at the moment',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_perception',
        isReversed: true,
      ),
      QuestionModel(
        id: "q3",
        text: {
          'ru': 'Я замечаю тонкие изменения в выражении лица собеседника',
          'en': 'I notice subtle changes in my conversation partner\'s facial expressions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_perception',
        isReversed: false,
      ),
      QuestionModel(
        id: "q4",
        text: {
          'ru': 'По интонации голоса я могу определить истинные чувства человека',
          'en': 'I can identify a person\'s true feelings by the tone of their voice',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_perception',
        isReversed: false,
      ),
      QuestionModel(
        id: "q5",
        text: {
          'ru': 'Мне трудно распознать, когда кто-то расстроен или обижен',
          'en': 'I find it hard to recognize when someone is upset or offended',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_perception',
        isReversed: true,
      ),
      QuestionModel(
        id: "q6",
        text: {
          'ru': 'Я быстро осознаю изменения в своём эмоциональном состоянии',
          'en': 'I quickly become aware of changes in my emotional state',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_perception',
        isReversed: false,
      ),
      QuestionModel(
        id: "q7",
        text: {
          'ru': 'Язык тела людей говорит мне больше, чем их слова',
          'en': 'People\'s body language tells me more than their words',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_perception',
        isReversed: false,
      ),
      QuestionModel(
        id: "q8",
        text: {
          'ru': 'Я с трудом могу назвать эмоцию, которую испытываю',
          'en': 'I struggle to name the emotion I am experiencing',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_perception',
        isReversed: true,
      ),
      QuestionModel(
        id: "q9",
        text: {
          'ru': 'Я замечаю эмоциональную атмосферу в группе людей',
          'en': 'I notice the emotional atmosphere in a group of people',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_perception',
        isReversed: false,
      ),
      QuestionModel(
        id: "q10",
        text: {
          'ru': 'Мне легко определить, когда человек неискренен в своих эмоциях',
          'en': 'I easily identify when someone is insincere with their emotions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_perception',
        isReversed: false,
      ),

      // ПОНИМАНИЕ ЭМОЦИЙ (Emotional Understanding) - 10 вопросов
      QuestionModel(
        id: "q11",
        text: {
          'ru': 'Я понимаю, почему у меня возникают определённые эмоции',
          'en': 'I understand why I experience certain emotions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_understanding',
        isReversed: false,
      ),
      QuestionModel(
        id: "q12",
        text: {
          'ru': 'Мне трудно объяснить причины моих чувств',
          'en': 'I find it difficult to explain the reasons for my feelings',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_understanding',
        isReversed: true,
      ),
      QuestionModel(
        id: "q13",
        text: {
          'ru': 'Я знаю, как одна эмоция может перерасти в другую',
          'en': 'I know how one emotion can evolve into another',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_understanding',
        isReversed: false,
      ),
      QuestionModel(
        id: "q14",
        text: {
          'ru': 'Я понимаю взаимосвязь между моими мыслями и эмоциями',
          'en': 'I understand the connection between my thoughts and emotions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_understanding',
        isReversed: false,
      ),
      QuestionModel(
        id: "q15",
        text: {
          'ru': 'Сложные эмоции других людей остаются для меня загадкой',
          'en': 'Complex emotions of other people remain a mystery to me',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_understanding',
        isReversed: true,
      ),
      QuestionModel(
        id: "q16",
        text: {
          'ru': 'Я могу предсказать, как изменятся мои чувства в ближайшем будущем',
          'en': 'I can predict how my feelings will change in the near future',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_understanding',
        isReversed: false,
      ),
      QuestionModel(
        id: "q17",
        text: {
          'ru': 'Я понимаю, какие события вызывают у меня стресс',
          'en': 'I understand which events cause me stress',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_understanding',
        isReversed: false,
      ),
      QuestionModel(
        id: "q18",
        text: {
          'ru': 'Мне сложно разобраться в смешанных эмоциях',
          'en': 'I find it hard to make sense of mixed emotions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_understanding',
        isReversed: true,
      ),
      QuestionModel(
        id: "q19",
        text: {
          'ru': 'Я осознаю, как моё поведение влияет на эмоции окружающих',
          'en': 'I realize how my behavior affects the emotions of those around me',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_understanding',
        isReversed: false,
      ),
      QuestionModel(
        id: "q20",
        text: {
          'ru': 'Я понимаю культурные различия в выражении эмоций',
          'en': 'I understand cultural differences in expressing emotions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_understanding',
        isReversed: false,
      ),

      // УПРАВЛЕНИЕ СОБОЙ (Self-Management) - 10 вопросов
      QuestionModel(
        id: "q21",
        text: {
          'ru': 'Я могу сохранять спокойствие в стрессовых ситуациях',
          'en': 'I can remain calm in stressful situations',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'self_management',
        isReversed: false,
      ),
      QuestionModel(
        id: "q22",
        text: {
          'ru': 'Когда я злюсь, мне трудно контролировать свои реакции',
          'en': 'When I am angry, I find it hard to control my reactions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'self_management',
        isReversed: true,
      ),
      QuestionModel(
        id: "q23",
        text: {
          'ru': 'Я умею быстро восстанавливаться после разочарований',
          'en': 'I know how to recover quickly from disappointments',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'self_management',
        isReversed: false,
      ),
      QuestionModel(
        id: "q24",
        text: {
          'ru': 'Я могу отложить удовольствие ради достижения важной цели',
          'en': 'I can delay gratification to achieve an important goal',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'self_management',
        isReversed: false,
      ),
      QuestionModel(
        id: "q25",
        text: {
          'ru': 'Мои эмоции часто выходят из-под контроля',
          'en': 'My emotions often get out of control',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'self_management',
        isReversed: true,
      ),
      QuestionModel(
        id: "q26",
        text: {
          'ru': 'Я использую техники для управления своим стрессом',
          'en': 'I use techniques to manage my stress',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'self_management',
        isReversed: false,
      ),
      QuestionModel(
        id: "q27",
        text: {
          'ru': 'Я могу сохранить позитивный настрой даже в трудные времена',
          'en': 'I can maintain a positive attitude even in difficult times',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'self_management',
        isReversed: false,
      ),
      QuestionModel(
        id: "q28",
        text: {
          'ru': 'Я часто действую импульсивно под влиянием эмоций',
          'en': 'I often act impulsively under the influence of emotions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'self_management',
        isReversed: true,
      ),
      QuestionModel(
        id: "q29",
        text: {
          'ru': 'Я умею переключаться с негативных мыслей на позитивные',
          'en': 'I know how to switch from negative thoughts to positive ones',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'self_management',
        isReversed: false,
      ),
      QuestionModel(
        id: "q30",
        text: {
          'ru': 'Я контролирую свои эмоциональные реакции в конфликтах',
          'en': 'I control my emotional reactions in conflicts',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'self_management',
        isReversed: false,
      ),

      // ИСПОЛЬЗОВАНИЕ ЭМОЦИЙ (Emotional Facilitation) - 10 вопросов
      QuestionModel(
        id: "q31",
        text: {
          'ru': 'Я использую свои эмоции для повышения креативности',
          'en': 'I use my emotions to enhance creativity',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_facilitation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q32",
        text: {
          'ru': 'Эмоции мешают мне принимать правильные решения',
          'en': 'Emotions prevent me from making the right decisions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_facilitation',
        isReversed: true,
      ),
      QuestionModel(
        id: "q33",
        text: {
          'ru': 'Позитивное настроение помогает мне решать проблемы',
          'en': 'A positive mood helps me solve problems',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_facilitation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q34",
        text: {
          'ru': 'Я знаю, какие эмоции полезны для разных видов задач',
          'en': 'I know which emotions are useful for different types of tasks',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_facilitation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q35",
        text: {
          'ru': 'Мне трудно использовать эмоции в конструктивных целях',
          'en': 'I find it difficult to use emotions for constructive purposes',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_facilitation',
        isReversed: true,
      ),
      QuestionModel(
        id: "q36",
        text: {
          'ru': 'Я могу создать нужное настроение для выполнения задачи',
          'en': 'I can create the right mood to complete a task',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_facilitation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q37",
        text: {
          'ru': 'Эмоции помогают мне расставлять приоритеты в делах',
          'en': 'Emotions help me prioritize tasks',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_facilitation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q38",
        text: {
          'ru': 'Я не понимаю, как можно использовать эмоции для работы',
          'en': 'I don\'t understand how emotions can be used for work',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_facilitation',
        isReversed: true,
      ),
      QuestionModel(
        id: "q39",
        text: {
          'ru': 'Я учитываю своё эмоциональное состояние при планировании дел',
          'en': 'I consider my emotional state when planning tasks',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_facilitation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q40",
        text: {
          'ru': 'Разные эмоции дают мне разные взгляды на проблему',
          'en': 'Different emotions give me different perspectives on a problem',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'emotional_facilitation',
        isReversed: false,
      ),

      // ЭМПАТИЯ (Empathy) - 10 вопросов
      QuestionModel(
        id: "q41",
        text: {
          'ru': 'Я глубоко сопереживаю чувствам других людей',
          'en': 'I deeply empathize with other people\'s feelings',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'empathy',
        isReversed: false,
      ),
      QuestionModel(
        id: "q42",
        text: {
          'ru': 'Мне сложно понять, почему люди реагируют так, а не иначе',
          'en': 'I find it hard to understand why people react the way they do',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'empathy',
        isReversed: true,
      ),
      QuestionModel(
        id: "q43",
        text: {
          'ru': 'Я чувствую боль других людей, как свою собственную',
          'en': 'I feel other people\'s pain as if it were my own',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'empathy',
        isReversed: false,
      ),
      QuestionModel(
        id: "q44",
        text: {
          'ru': 'Я умею поставить себя на место другого человека',
          'en': 'I know how to put myself in another person\'s shoes',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'empathy',
        isReversed: false,
      ),
      QuestionModel(
        id: "q45",
        text: {
          'ru': 'Эмоциональные проблемы других меня не очень волнуют',
          'en': 'Other people\'s emotional problems don\'t concern me much',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'empathy',
        isReversed: true,
      ),
      QuestionModel(
        id: "q46",
        text: {
          'ru': 'Я внимательно выслушиваю людей, когда им плохо',
          'en': 'I listen carefully to people when they are feeling bad',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'empathy',
        isReversed: false,
      ),
      QuestionModel(
        id: "q47",
        text: {
          'ru': 'Я чувствую, когда человеку нужна моя поддержка',
          'en': 'I sense when someone needs my support',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'empathy',
        isReversed: false,
      ),
      QuestionModel(
        id: "q48",
        text: {
          'ru': 'Мне трудно разделять эмоции других людей',
          'en': 'I find it difficult to share other people\'s emotions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'empathy',
        isReversed: true,
      ),
      QuestionModel(
        id: "q49",
        text: {
          'ru': 'Я замечаю, когда кому-то нужна помощь, даже если они не просят',
          'en': 'I notice when someone needs help, even if they don\'t ask',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'empathy',
        isReversed: false,
      ),
      QuestionModel(
        id: "q50",
        text: {
          'ru': 'Я понимаю невысказанные переживания близких мне людей',
          'en': 'I understand the unspoken feelings of people close to me',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'empathy',
        isReversed: false,
      ),

      // СОЦИАЛЬНЫЕ НАВЫКИ (Social Skills) - 10 вопросов
      QuestionModel(
        id: "q51",
        text: {
          'ru': 'Я легко нахожу общий язык с разными людьми',
          'en': 'I easily find common ground with different people',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'social_skills',
        isReversed: false,
      ),
      QuestionModel(
        id: "q52",
        text: {
          'ru': 'Мне сложно разрешать конфликты между людьми',
          'en': 'I find it difficult to resolve conflicts between people',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'social_skills',
        isReversed: true,
      ),
      QuestionModel(
        id: "q53",
        text: {
          'ru': 'Я умею вдохновлять и мотивировать других',
          'en': 'I know how to inspire and motivate others',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'social_skills',
        isReversed: false,
      ),
      QuestionModel(
        id: "q54",
        text: {
          'ru': 'Я эффективно работаю в команде',
          'en': 'I work effectively in a team',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'social_skills',
        isReversed: false,
      ),
      QuestionModel(
        id: "q55",
        text: {
          'ru': 'Мне трудно влиять на мнение других людей',
          'en': 'I find it hard to influence other people\'s opinions',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'social_skills',
        isReversed: true,
      ),
      QuestionModel(
        id: "q56",
        text: {
          'ru': 'Я помогаю людям находить компромиссы в спорах',
          'en': 'I help people find compromises in arguments',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'social_skills',
        isReversed: false,
      ),
      QuestionModel(
        id: "q57",
        text: {
          'ru': 'Я создаю позитивную атмосферу в группе',
          'en': 'I create a positive atmosphere in a group',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'social_skills',
        isReversed: false,
      ),
      QuestionModel(
        id: "q58",
        text: {
          'ru': 'Мне сложно выстраивать долгосрочные отношения',
          'en': 'I find it difficult to build long-term relationships',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'social_skills',
        isReversed: true,
      ),
      QuestionModel(
        id: "q59",
        text: {
          'ru': 'Я умею давать конструктивную обратную связь',
          'en': 'I know how to give constructive feedback',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'social_skills',
        isReversed: false,
      ),
      QuestionModel(
        id: "q60",
        text: {
          'ru': 'Я успешно адаптируюсь к разным социальным ситуациям',
          'en': 'I successfully adapt to different social situations',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'social_skills',
        isReversed: false,
      ),

      // МОТИВАЦИЯ (Motivation) - 10 вопросов
      QuestionModel(
        id: "q61",
        text: {
          'ru': 'Я сохраняю энтузиазм даже при столкновении с трудностями',
          'en': 'I maintain enthusiasm even when facing difficulties',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'motivation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q62",
        text: {
          'ru': 'Мне трудно заставить себя работать над долгосрочными целями',
          'en': 'I find it hard to make myself work on long-term goals',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'motivation',
        isReversed: true,
      ),
      QuestionModel(
        id: "q63",
        text: {
          'ru': 'Я нахожу внутренние ресурсы для преодоления препятствий',
          'en': 'I find internal resources to overcome obstacles',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'motivation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q64",
        text: {
          'ru': 'Я стремлюсь к совершенству в том, что делаю',
          'en': 'I strive for excellence in what I do',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'motivation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q65",
        text: {
          'ru': 'Я быстро теряю интерес к начатым делам',
          'en': 'I quickly lose interest in things I start',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'motivation',
        isReversed: true,
      ),
      QuestionModel(
        id: "q66",
        text: {
          'ru': 'Я использую свои эмоции как источник энергии для действий',
          'en': 'I use my emotions as a source of energy for action',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'motivation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q67",
        text: {
          'ru': 'Я настойчив в достижении важных для меня целей',
          'en': 'I am persistent in achieving goals that are important to me',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'motivation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q68",
        text: {
          'ru': 'Неудачи сильно подрывают мою мотивацию',
          'en': 'Failures severely undermine my motivation',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'motivation',
        isReversed: true,
      ),
      QuestionModel(
        id: "q69",
        text: {
          'ru': 'Я нахожу смысл и удовлетворение в своей деятельности',
          'en': 'I find meaning and satisfaction in my activities',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'motivation',
        isReversed: false,
      ),
      QuestionModel(
        id: "q70",
        text: {
          'ru': 'Я оптимистично смотрю на будущее',
          'en': 'I look at the future with optimism',
        },
        answers: _getFrequencyAnswers(),
        factorId: 'motivation',
        isReversed: false,
      ),
    ];
  }

  /// Helper method to get frequency answers
  static List<AnswerModel> _getFrequencyAnswers() {
    return [
      AnswerModel(
        id: "0",
        text: {'ru': 'Никогда', 'en': 'Never'},
        score: 0,
      ),
      AnswerModel(
        id: "1",
        text: {'ru': 'Редко', 'en': 'Rarely'},
        score: 1,
      ),
      AnswerModel(
        id: "2",
        text: {'ru': 'Иногда', 'en': 'Sometimes'},
        score: 2,
      ),
      AnswerModel(
        id: "3",
        text: {'ru': 'Часто', 'en': 'Often'},
        score: 3,
      ),
      AnswerModel(
        id: "4",
        text: {'ru': 'Всегда', 'en': 'Always'},
        score: 4,
      ),
    ];
  }
}
