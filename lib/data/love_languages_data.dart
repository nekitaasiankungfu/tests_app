import '../models/test_model.dart';

/// Data access class for Love Languages Test
/// Legacy Dart implementation (no JSON dependency)
class LoveLanguagesData {
  /// Get the complete Love Languages test
  static TestModel getLoveLanguagesTest() {
    return TestModel(
      id: 'love_languages_v1',
      title: {
        'ru': 'Языки любви: Как вы даёте и получаете любовь',
        'en': 'Love Languages: How You Give and Receive Love',
      },
      description: {
        'ru':
            'Языки любви — это концепция, которая объясняет, что разные люди выражают и воспринимают любовь по-разному. То, что заставляет одного человека чувствовать себя любимым, может совершенно не работать для другого. Понимание своего языка любви и языка партнёра — ключ к крепким, счастливым отношениям.\n\nИсследования показывают, что пары, которые понимают языки любви друг друга, демонстрируют:\n• Более высокую удовлетворённость отношениями\n• Меньше конфликтов и недопонимания\n• Более глубокую эмоциональную близость\n• Большую стабильность отношений\n• Более эффективное разрешение проблем\n\nПять языков любви:\n\n**1. СЛОВА ПОДТВЕРЖДЕНИЯ (Words of Affirmation)** 💬\n• Вербальные комплименты, похвала, благодарность\n• Поддержка словами, ободрение\n• Для вас важны: комплименты, признание, словесная поддержка\n\n**2. ВРЕМЯ ВМЕСТЕ (Quality Time)** ⏰\n• Безраздельное внимание, совместная активность\n• Глубокие разговоры без отвлечений\n• Для вас важны: внимание, совместное время, активное слушание\n\n**3. ПОЛУЧЕНИЕ ПОДАРКОВ (Receiving Gifts)** 🎁\n• Материальные символы любви и заботы\n• Продуманные, значимые подарки\n• Для вас важны: подарки, сюрпризы, символы любви\n\n**4. АКТЫ СЛУЖЕНИЯ (Acts of Service)** 🤝\n• Действия, облегчающие жизнь партнёра\n• Помощь с делами, поддержка действиями\n• Для вас важны: помощь, забота через действия, поддержка делом\n\n**5. ФИЗИЧЕСКОЕ ПРИКОСНОВЕНИЕ (Physical Touch)** 🤗\n• Физическая близость, объятия, прикосновения\n• Невербальное выражение любви\n• Для вас важны: объятия, близость, физический контакт',
        'en':
            'Love languages is a concept that explains that different people express and perceive love in different ways. What makes one person feel loved may not work at all for another. Understanding your love language and your partner\'s language is key to strong, happy relationships.\n\nResearch shows that couples who understand each other\'s love languages demonstrate:\n• Higher relationship satisfaction\n• Less conflict and misunderstanding\n• Deeper emotional intimacy\n• Greater relationship stability\n• More effective problem solving\n\nFive love languages:\n\n**1. WORDS OF AFFIRMATION** 💬\n• Verbal compliments, praise, gratitude\n• Support through words, encouragement\n• Important for you: compliments, recognition, verbal support\n\n**2. QUALITY TIME** ⏰\n• Undivided attention, shared activities\n• Deep conversations without distractions\n• Important for you: attention, quality time, active listening\n\n**3. RECEIVING GIFTS** 🎁\n• Material symbols of love and care\n• Thoughtful, meaningful gifts\n• Important for you: gifts, surprises, symbols of love\n\n**4. ACTS OF SERVICE** 🤝\n• Actions that make partner\'s life easier\n• Help with tasks, support through actions\n• Important for you: help, care through actions, support by deed\n\n**5. PHYSICAL TOUCH** 🤗\n• Physical intimacy, hugs, touches\n• Non-verbal expression of love\n• Important for you: hugs, closeness, physical contact',
      },
      category: {
        'ru': 'Отношения',
        'en': 'Relationships',
      },
      categoryId: 'relationships',
      disclaimer: {
        'ru':
            'Этот тест основан на концепции "5 языков любви" и предназначен для самопознания и улучшения отношений. Результаты показывают ваши предпочтения в выражении и восприятии любви. Люди могут выражать любовь всеми языками в разной степени, и языки любви могут меняться со временем. Тест не является психологической диагностикой.',
        'en':
            'This test is based on the "5 Love Languages" concept and is designed for self-discovery and relationship improvement. Results show your preferences in expressing and receiving love. People can express love in all languages to varying degrees, and love languages may change over time. This test is not a psychological diagnosis.',
      },
      estimatedTime: 8,
      type: TestType.multiFactor,
      factorIds: [
        'words_of_affirmation',
        'quality_time',
        'receiving_gifts',
        'acts_of_service',
        'physical_touch',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'words_of_affirmation': {
        'ru': '💬 Слова подтверждения',
        'en': '💬 Words of Affirmation',
      },
      'quality_time': {
        'ru': '⏰ Время вместе',
        'en': '⏰ Quality Time',
      },
      'receiving_gifts': {
        'ru': '🎁 Получение подарков',
        'en': '🎁 Receiving Gifts',
      },
      'acts_of_service': {
        'ru': '🤝 Акты служения',
        'en': '🤝 Acts of Service',
      },
      'physical_touch': {
        'ru': '🤗 Физическое прикосновение',
        'en': '🤗 Physical Touch',
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
      'ru': '${interpretation['title_ru']}\n\n${interpretation['description_ru']}',
      'en': '${interpretation['title_en']}\n\n${interpretation['description_en']}',
    };
  }

  /// Get all 30 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1 - words_of_affirmation
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Когда партнёр говорит мне комплименты или хвалит меня',
          'en': 'When my partner gives me compliments or praises me',
        },
        factorId: 'words_of_affirmation',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q2 - quality_time
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Когда партнёр откладывает всё в сторону, чтобы провести время со мной',
          'en': 'When my partner puts everything aside to spend time with me',
        },
        factorId: 'quality_time',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q3 - receiving_gifts
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Когда партнёр дарит мне подарки или сюрпризы',
          'en': 'When my partner gives me gifts or surprises',
        },
        factorId: 'receiving_gifts',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q4 - acts_of_service
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Когда партнёр помогает мне с делами или задачами',
          'en': 'When my partner helps me with chores or tasks',
        },
        factorId: 'acts_of_service',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q5 - physical_touch
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Когда партнёр обнимает меня или прикасается ко мне',
          'en': 'When my partner hugs me or touches me',
        },
        factorId: 'physical_touch',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q6 - words_of_affirmation
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Слышать "Я люблю тебя" от партнёра',
          'en': 'Hearing "I love you" from my partner',
        },
        factorId: 'words_of_affirmation',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q7 - quality_time
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Когда партнёр активно слушает меня без отвлечений',
          'en': 'When my partner actively listens to me without distractions',
        },
        factorId: 'quality_time',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q8 - receiving_gifts
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Когда партнёр запоминает важные для меня даты и дарит подарки',
          'en': 'When my partner remembers important dates and gives gifts',
        },
        factorId: 'receiving_gifts',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q9 - acts_of_service
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Когда партнёр делает что-то, чтобы облегчить мою жизнь',
          'en': 'When my partner does something to make my life easier',
        },
        factorId: 'acts_of_service',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q10 - physical_touch
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Когда партнёр держит меня за руку на публике',
          'en': 'When my partner holds my hand in public',
        },
        factorId: 'physical_touch',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q11 - words_of_affirmation
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Получать записки или сообщения с тёплыми словами от партнёра',
          'en': 'Receiving notes or messages with warm words from my partner',
        },
        factorId: 'words_of_affirmation',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q12 - quality_time
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Когда мы с партнёром занимаемся чем-то вместе, что нравится нам обоим',
          'en': 'When my partner and I do something together that we both enjoy',
        },
        factorId: 'quality_time',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q13 - receiving_gifts
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Когда партнёр приносит мне что-то, что показывает, что он думал обо мне',
          'en': 'When my partner brings me something that shows they were thinking of me',
        },
        factorId: 'receiving_gifts',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q14 - acts_of_service
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Когда партнёр берёт на себя задачи, которые я не люблю',
          'en': 'When my partner takes on tasks that I don\'t like',
        },
        factorId: 'acts_of_service',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q15 - physical_touch
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Когда партнёр обнимает меня после тяжёлого дня',
          'en': 'When my partner hugs me after a hard day',
        },
        factorId: 'physical_touch',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q16 - words_of_affirmation
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Когда партнёр говорит мне, что гордится мной',
          'en': 'When my partner tells me they are proud of me',
        },
        factorId: 'words_of_affirmation',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q17 - quality_time
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Когда партнёр планирует особенное свидание или время для нас двоих',
          'en': 'When my partner plans a special date or time for just us',
        },
        factorId: 'quality_time',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q18 - receiving_gifts
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Когда партнёр дарит мне подарок без повода',
          'en': 'When my partner gives me a gift for no reason',
        },
        factorId: 'receiving_gifts',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q19 - acts_of_service
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Когда партнёр готовит для меня еду',
          'en': 'When my partner cooks for me',
        },
        factorId: 'acts_of_service',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q20 - physical_touch
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Когда партнёр делает мне массаж',
          'en': 'When my partner gives me a massage',
        },
        factorId: 'physical_touch',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q21 - words_of_affirmation
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Когда партнёр публично выражает благодарность или признательность мне',
          'en': 'When my partner publicly expresses gratitude or appreciation to me',
        },
        factorId: 'words_of_affirmation',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q22 - quality_time
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Когда партнёр откладывает телефон и даёт мне безраздельное внимание',
          'en': 'When my partner puts away their phone and gives me undivided attention',
        },
        factorId: 'quality_time',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q23 - receiving_gifts
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Видеть, что партнёр хранит подарки, которые я ему дарил(а)',
          'en': 'Seeing that my partner keeps the gifts I gave them',
        },
        factorId: 'receiving_gifts',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q24 - acts_of_service
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Когда партнёр делает что-то практичное, чтобы помочь мне',
          'en': 'When my partner does something practical to help me',
        },
        factorId: 'acts_of_service',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q25 - physical_touch
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Когда партнёр сидит рядом со мной на диване и касается меня',
          'en': 'When my partner sits next to me on the couch and touches me',
        },
        factorId: 'physical_touch',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q26 - words_of_affirmation
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Когда партнёр поддерживает меня словами в трудных ситуациях',
          'en': 'When my partner supports me with words in difficult situations',
        },
        factorId: 'words_of_affirmation',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q27 - quality_time
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Когда мы с партнёром ведём глубокие, значимые разговоры',
          'en': 'When my partner and I have deep, meaningful conversations',
        },
        factorId: 'quality_time',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q28 - receiving_gifts
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Когда партнёр покупает мне что-то, что я давно хотел(а)',
          'en': 'When my partner buys me something I\'ve wanted for a long time',
        },
        factorId: 'receiving_gifts',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q29 - acts_of_service
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Когда партнёр замечает, что нужно сделать, и делает это без напоминания',
          'en': 'When my partner notices what needs to be done and does it without being reminded',
        },
        factorId: 'acts_of_service',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
      // Q30 - physical_touch
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Когда партнёр целует меня спонтанно',
          'en': 'When my partner kisses me spontaneously',
        },
        factorId: 'physical_touch',
        isReversed: false,
        answers: _getImportanceAnswers(),
      ),
    ];
  }

  /// Get importance answers (Совсем не важно - Критически важно)
  /// Using scores 0-4 (RULE #1)
  static List<AnswerModel> _getImportanceAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совсем не важно',
          'en': 'Not important at all',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Мало важно',
          'en': 'Slightly important',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Умеренно важно',
          'en': 'Moderately important',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Очень важно',
          'en': 'Very important',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Критически важно',
          'en': 'Extremely important',
        },
        score: 4,
      ),
    ];
  }

  /// Interpretations for all 5 love languages
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'words_of_affirmation': {
        'low': {
          'title_ru': '💬 Слова подтверждения — не ваш основной язык',
          'title_en': '💬 Words of Affirmation — not your primary language',
          'description_ru':
              'Для вас слова имеют меньшее значение, чем действия или другие формы выражения любви. Вы цените искренность больше, чем красноречие. Это не значит, что комплименты вам не приятны, просто они не главное в отношениях.',
          'description_en':
              'For you, words matter less than actions or other forms of expressing love. You value sincerity more than eloquence. This doesn\'t mean compliments aren\'t pleasant, they just aren\'t the most important thing in relationships.',
        },
        'medium': {
          'title_ru': '💬 Слова подтверждения — умеренно важны',
          'title_en': '💬 Words of Affirmation — moderately important',
          'description_ru':
              'Вам приятно слышать слова любви и признания, но они не единственный способ почувствовать себя любимым. Вы цените баланс между словами и другими проявлениями заботы.',
          'description_en':
              'You enjoy hearing words of love and recognition, but they\'re not the only way to feel loved. You value a balance between words and other expressions of care.',
        },
        'high': {
          'title_ru': '💬 Слова подтверждения — ваш основной язык любви',
          'title_en': '💬 Words of Affirmation — your primary love language',
          'description_ru':
              'Для вас слова имеют огромную силу. Вы чувствуете себя любимым(ой), когда слышите "Я люблю тебя", комплименты, слова поддержки и благодарности. Критика и грубые слова ранят вас глубоко.\n\n**Что вам нужно:**\n• Регулярно слышать "Я люблю тебя"\n• Искренние комплименты о внешности и личности\n• Слова поддержки в трудные моменты\n• Публичная похвала и признание\n\n**Совет партнёру:**\nГоворите любовь словами. Пишите записки, отправляйте тёплые сообщения, выражайте благодарность вербально.',
          'description_en':
              'For you, words have tremendous power. You feel loved when you hear "I love you", compliments, words of support and gratitude. Criticism and harsh words hurt you deeply.\n\n**What you need:**\n• Regularly hear "I love you"\n• Sincere compliments about appearance and personality\n• Words of support in difficult moments\n• Public praise and recognition\n\n**Advice for partner:**\nSpeak love with words. Write notes, send warm messages, express gratitude verbally.',
        },
      },
      'quality_time': {
        'low': {
          'title_ru': '⏰ Время вместе — не ваш основной язык',
          'title_en': '⏰ Quality Time — not your primary language',
          'description_ru':
              'Для вас важнее качество взаимодействия, чем количество времени вместе. Вы цените другие формы близости больше, чем просто присутствие рядом.',
          'description_en':
              'For you, quality of interaction matters more than quantity of time together. You value other forms of intimacy more than just being present.',
        },
        'medium': {
          'title_ru': '⏰ Время вместе — умеренно важно',
          'title_en': '⏰ Quality Time — moderately important',
          'description_ru':
              'Вам нравится проводить время с партнёром, но это не единственный способ почувствовать близость. Вы цените баланс между совместным временем и личным пространством.',
          'description_en':
              'You enjoy spending time with your partner, but it\'s not the only way to feel close. You value balance between togetherness and personal space.',
        },
        'high': {
          'title_ru': '⏰ Время вместе — ваш основной язык любви',
          'title_en': '⏰ Quality Time — your primary love language',
          'description_ru':
              'Для вас ничто не говорит "Я люблю тебя" сильнее, чем безраздельное внимание партнёра. Вы чувствуете любовь, когда партнёр откладывает телефон и действительно ПРИСУТСТВУЕТ с вами.\n\n**Что вам нужно:**\n• Безраздельное внимание без отвлечений\n• Глубокие, значимые разговоры\n• Запланированные свидания\n• Совместные активности и хобби\n\n**Совет партнёру:**\nОткладывайте телефон, планируйте регулярные свидания, слушайте активно, создавайте традиции времени вместе.',
          'description_en':
              'For you, nothing says "I love you" more than undivided attention from your partner. You feel love when your partner puts away the phone and is truly PRESENT with you.\n\n**What you need:**\n• Undivided attention without distractions\n• Deep, meaningful conversations\n• Planned dates\n• Shared activities and hobbies\n\n**Advice for partner:**\nPut away the phone, plan regular dates, listen actively, create traditions of time together.',
        },
      },
      'receiving_gifts': {
        'low': {
          'title_ru': '🎁 Получение подарков — не ваш основной язык',
          'title_en': '🎁 Receiving Gifts — not your primary language',
          'description_ru':
              'Подарки для вас не так важны, как другие проявления любви. Вы цените мысль, но сам подарок не является главным показателем любви.',
          'description_en':
              'Gifts are not as important to you as other expressions of love. You appreciate the thought, but the gift itself is not the main indicator of love.',
        },
        'medium': {
          'title_ru': '🎁 Получение подарков — умеренно важно',
          'title_en': '🎁 Receiving Gifts — moderately important',
          'description_ru':
              'Вам приятно получать подарки, особенно продуманные, но они не единственный способ почувствовать любовь. Вы цените символизм подарка.',
          'description_en':
              'You enjoy receiving gifts, especially thoughtful ones, but they\'re not the only way to feel love. You appreciate the symbolism of the gift.',
        },
        'high': {
          'title_ru': '🎁 Получение подарков — ваш основной язык любви',
          'title_en': '🎁 Receiving Gifts — your primary love language',
          'description_ru':
              'Для вас подарок — это не о материализме, а о символе любви и внимания. Вы цените, что партнёр думал о вас. Подарок может быть маленьким или самодельным — важна мысль.\n\n**Что вам нужно:**\n• Продуманные подарки, показывающие знание вас\n• Сюрпризы без повода\n• Подарки на важные даты\n• Маленькие сувениры и символы\n\n**Совет партнёру:**\nЗапоминайте важные даты, делайте сюрпризы, дарите с душой. Это не о цене — о внимании и мысли.',
          'description_en':
              'For you, a gift is not about materialism, but about a symbol of love and attention. You appreciate that your partner was thinking of you. A gift can be small or handmade — the thought matters.\n\n**What you need:**\n• Thoughtful gifts showing knowledge of you\n• Surprises for no reason\n• Gifts on important dates\n• Small souvenirs and symbols\n\n**Advice for partner:**\nRemember important dates, make surprises, give with heart. It\'s not about price — it\'s about attention and thought.',
        },
      },
      'acts_of_service': {
        'low': {
          'title_ru': '🤝 Акты служения — не ваш основной язык',
          'title_en': '🤝 Acts of Service — not your primary language',
          'description_ru':
              'Для вас действия партнёра менее значимы, чем другие формы выражения любви. Вы цените самостоятельность и другие проявления заботы.',
          'description_en':
              'For you, your partner\'s actions are less significant than other forms of expressing love. You value independence and other expressions of care.',
        },
        'medium': {
          'title_ru': '🤝 Акты служения — умеренно важны',
          'title_en': '🤝 Acts of Service — moderately important',
          'description_ru':
              'Вам приятно, когда партнёр помогает, но это не единственный способ почувствовать любовь. Вы цените баланс между помощью и самостоятельностью.',
          'description_en':
              'You appreciate when your partner helps, but it\'s not the only way to feel love. You value balance between help and independence.',
        },
        'high': {
          'title_ru': '🤝 Акты служения — ваш основной язык любви',
          'title_en': '🤝 Acts of Service — your primary love language',
          'description_ru':
              'Для вас "дела говорят громче слов". Вы чувствуете любовь, когда партнёр ДЕЛАЕТ что-то, чтобы облегчить вашу жизнь. Важна инициатива — когда партнёр замечает и делает без просьбы.\n\n**Что вам нужно:**\n• Помощь с делами без напоминания\n• Приготовление еды, забота о быте\n• Взятие на себя неприятных задач\n• Выполнение обещаний надёжно\n\n**Совет партнёру:**\nПомогайте активно, берите инициативу, выполняйте обещания. Облегчайте жизнь партнёра практически.',
          'description_en':
              'For you, "actions speak louder than words". You feel love when your partner DOES something to make your life easier. Initiative matters — when your partner notices and does without being asked.\n\n**What you need:**\n• Help with tasks without reminders\n• Cooking, household care\n• Taking on unpleasant tasks\n• Reliably keeping promises\n\n**Advice for partner:**\nHelp actively, take initiative, keep promises. Make your partner\'s life easier practically.',
        },
      },
      'physical_touch': {
        'low': {
          'title_ru': '🤗 Физическое прикосновение — не ваш основной язык',
          'title_en': '🤗 Physical Touch — not your primary language',
          'description_ru':
              'Для вас физический контакт менее важен, чем другие формы близости. Вы цените личное пространство и другие проявления любви.',
          'description_en':
              'For you, physical contact is less important than other forms of intimacy. You value personal space and other expressions of love.',
        },
        'medium': {
          'title_ru': '🤗 Физическое прикосновение — умеренно важно',
          'title_en': '🤗 Physical Touch — moderately important',
          'description_ru':
              'Вам приятны объятия и прикосновения, но это не единственный способ почувствовать близость. Вы цените баланс между физическим контактом и личным пространством.',
          'description_en':
              'You enjoy hugs and touches, but they\'re not the only way to feel close. You value balance between physical contact and personal space.',
        },
        'high': {
          'title_ru': '🤗 Физическое прикосновение — ваш основной язык любви',
          'title_en': '🤗 Physical Touch — your primary love language',
          'description_ru':
              'Для вас физическое прикосновение — основной язык любви. Вы чувствуете связь через объятия, поцелуи, держание за руку. Физическое присутствие рядом критично. Отвержение прикосновений ранит вас глубоко.\n\n**Что вам нужно:**\n• Частые объятия и поцелуи\n• Держание за руку на публике\n• Массаж и физическая забота\n• Спонтанные прикосновения\n\n**Важно:** Physical Touch ≠ только секс. Это про все формы прикосновений: объятия, держание за руку, массаж.\n\n**Совет партнёру:**\nОбнимайте регулярно, держите за руку, делайте массаж, проявляйте спонтанную физическую любовь.',
          'description_en':
              'For you, physical touch is the primary love language. You feel connection through hugs, kisses, holding hands. Physical presence nearby is critical. Rejection of touch hurts you deeply.\n\n**What you need:**\n• Frequent hugs and kisses\n• Holding hands in public\n• Massage and physical care\n• Spontaneous touches\n\n**Important:** Physical Touch ≠ only sex. It\'s about all forms of touch: hugs, holding hands, massage.\n\n**Advice for partner:**\nHug regularly, hold hands, give massages, show spontaneous physical love.',
        },
      },
    };
  }
}
