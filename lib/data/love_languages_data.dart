import '../models/test_model.dart';
import '../models/test_profile_model.dart';

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

  /// Определить профиль на основе процентов по шкалам
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_balanced';

    // Сортируем языки по убыванию процентов
    final sorted = percentages.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final highest = sorted.first;
    final secondHighest = sorted.length > 1 ? sorted[1] : null;

    // Если разница между топ-2 маленькая (< 10%), это комбинация или баланс
    if (secondHighest != null) {
      final diff = highest.value - secondHighest.value;

      // Если все языки близки (разброс < 15%), это сбалансированный профиль
      final range = sorted.first.value - sorted.last.value;
      if (range < 15) {
        return 'profile_balanced';
      }

      // Если топ-2 близки, определяем комбинированный профиль
      if (diff < 10) {
        return _getComboProfile(highest.key, secondHighest.key);
      }
    }

    // Иначе возвращаем доминирующий язык
    return _getSingleProfile(highest.key);
  }

  static String _getSingleProfile(String language) {
    switch (language) {
      case 'words_of_affirmation':
        return 'profile_words';
      case 'quality_time':
        return 'profile_time';
      case 'receiving_gifts':
        return 'profile_gifts';
      case 'acts_of_service':
        return 'profile_service';
      case 'physical_touch':
        return 'profile_touch';
      default:
        return 'profile_balanced';
    }
  }

  static String _getComboProfile(String first, String second) {
    // Нормализуем порядок для консистентности
    final languages = [first, second]..sort();
    final combo = '${languages[0]}_${languages[1]}';

    switch (combo) {
      case 'quality_time_words_of_affirmation':
        return 'profile_words_time';
      case 'acts_of_service_words_of_affirmation':
        return 'profile_words_service';
      case 'physical_touch_words_of_affirmation':
        return 'profile_words_touch';
      case 'acts_of_service_quality_time':
        return 'profile_time_service';
      case 'physical_touch_quality_time':
        return 'profile_time_touch';
      case 'acts_of_service_physical_touch':
        return 'profile_service_touch';
      case 'quality_time_receiving_gifts':
        return 'profile_time_gifts';
      case 'receiving_gifts_words_of_affirmation':
        return 'profile_words_gifts';
      default:
        return 'profile_balanced';
    }
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  static const Map<String, TestProfile> _profiles = {
    // === 5 основных языков любви ===
    'profile_words': TestProfile(
      id: 'profile_words',
      name: {
        'ru': '💬 Мастер Слов',
        'en': '💬 Words Master',
      },
      description: {
        'ru': 'Для вас слова — это не просто звуки, а настоящее волшебство. Комплименты, признания, слова поддержки наполняют вашу душу любовью.',
        'en': 'For you, words are not just sounds, but real magic. Compliments, confessions, words of support fill your soul with love.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали, что вы особенно чувствительны к вербальному выражению любви и признания.',
        'en': 'Your answers showed that you are especially sensitive to verbal expressions of love and appreciation.',
      },
      strengths: {
        'ru': [
          'Умеете выражать чувства словами',
          'Чувствительны к нюансам общения',
          'Цените искренность и открытость',
          'Замечаете и помните приятные слова',
          'Создаёте атмосферу тепла словами',
        ],
        'en': [
          'Can express feelings with words',
          'Sensitive to communication nuances',
          'Value sincerity and openness',
          'Notice and remember pleasant words',
          'Create warmth through words',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Критика ранит особенно сильно',
          'Можете недооценивать невербальные знаки',
          'Нужно регулярное вербальное подтверждение',
        ],
        'en': [
          'Criticism hurts especially hard',
          'May undervalue non-verbal signs',
          'Need regular verbal confirmation',
        ],
      },
      recommendations: {
        'ru': [
          'Сообщите партнёру о важности слов для вас',
          'Не стесняйтесь просить комплименты',
          'Записывайте приятные слова в дневник',
          'Учитесь принимать комплименты с благодарностью',
          'Говорите партнёру то, что хотели бы слышать сами',
        ],
        'en': [
          'Tell your partner about the importance of words for you',
          'Don\'t hesitate to ask for compliments',
          'Write pleasant words in a journal',
          'Learn to accept compliments with gratitude',
          'Tell your partner what you would like to hear yourself',
        ],
      },
      tryToday: {
        'ru': 'Напишите партнёру 3 вещи, которые вы в нём цените, и попросите его сделать то же',
        'en': 'Write your partner 3 things you appreciate about them and ask them to do the same',
      },
      inspiringConclusion: {
        'ru': 'Ваш дар — слышать любовь в словах. Помогите близким научиться говорить на вашем языке!',
        'en': 'Your gift is hearing love in words. Help loved ones learn to speak your language!',
      },
    ),

    'profile_time': TestProfile(
      id: 'profile_time',
      name: {
        'ru': '⏰ Ценитель Присутствия',
        'en': '⏰ Presence Appreciator',
      },
      description: {
        'ru': 'Для вас нет ничего ценнее, чем безраздельное внимание любимого человека. Время вместе — главная валюта любви.',
        'en': 'For you, nothing is more valuable than your loved one\'s undivided attention. Time together is the main currency of love.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали, что качественное время наедине — ваш главный способ почувствовать любовь.',
        'en': 'Your answers showed that quality alone time is your main way to feel loved.',
      },
      strengths: {
        'ru': [
          'Умеете быть полностью присутствующим',
          'Цените глубину общения над количеством',
          'Создаёте особые моменты близости',
          'Замечаете, когда партнёр отвлекается',
          'Инвестируете время в отношения',
        ],
        'en': [
          'Can be fully present',
          'Value depth of communication over quantity',
          'Create special moments of intimacy',
          'Notice when partner is distracted',
          'Invest time in relationships',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Отвлечённость партнёра ранит глубоко',
          'Сложно понять занятых партнёров',
          'Можете чувствовать отвержение при отмене планов',
        ],
        'en': [
          'Partner\'s distraction hurts deeply',
          'Hard to understand busy partners',
          'May feel rejected when plans are cancelled',
        ],
      },
      recommendations: {
        'ru': [
          'Планируйте регулярное время только вдвоём',
          'Установите правило "без телефонов" во время общения',
          'Придумайте свои особенные ритуалы',
          'Обсудите с партнёром важность присутствия',
          'Качество важнее количества — цените каждый момент',
        ],
        'en': [
          'Schedule regular time just for two',
          'Set a "no phones" rule during conversations',
          'Create your own special rituals',
          'Discuss the importance of presence with your partner',
          'Quality over quantity — cherish every moment',
        ],
      },
      tryToday: {
        'ru': 'Организуйте вечер без гаджетов — только вы двое и интересное занятие',
        'en': 'Organize an evening without gadgets — just the two of you and an interesting activity',
      },
      inspiringConclusion: {
        'ru': 'Ваш дар — создавать глубокую связь через присутствие. Время — самый ценный подарок!',
        'en': 'Your gift is creating deep connection through presence. Time is the most valuable gift!',
      },
    ),

    'profile_gifts': TestProfile(
      id: 'profile_gifts',
      name: {
        'ru': '🎁 Любитель Символов',
        'en': '🎁 Symbol Lover',
      },
      description: {
        'ru': 'Для вас подарки — это не материализм, а символы любви. Каждый презент говорит: "Я думал о тебе".',
        'en': 'For you, gifts are not materialism but symbols of love. Each present says: "I was thinking of you."',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали, что вы особенно цените материальные символы любви и внимания.',
        'en': 'Your answers showed that you especially value material symbols of love and attention.',
      },
      strengths: {
        'ru': [
          'Видите смысл и заботу за подарками',
          'Помните историю каждого презента',
          'Умеете выбирать значимые подарки',
          'Цените внимание к деталям',
          'Находите радость в сюрпризах',
        ],
        'en': [
          'See meaning and care behind gifts',
          'Remember the story of each present',
          'Know how to choose meaningful gifts',
          'Appreciate attention to detail',
          'Find joy in surprises',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Забытые праздники ранят глубоко',
          'Можете чувствовать себя непонятым',
          'Подарки "для галочки" обесценивают чувства',
        ],
        'en': [
          'Forgotten holidays hurt deeply',
          'May feel misunderstood',
          'Gifts "just because" devalue feelings',
        ],
      },
      recommendations: {
        'ru': [
          'Объясните партнёру символическое значение подарков',
          'Создайте wishlist для партнёра',
          'Цените мысль, а не стоимость',
          'Делайте маленькие сюрпризы сами',
          'Сохраняйте особенные подарки как память',
        ],
        'en': [
          'Explain the symbolic meaning of gifts to your partner',
          'Create a wishlist for your partner',
          'Value the thought, not the cost',
          'Make small surprises yourself',
          'Keep special gifts as memories',
        ],
      },
      tryToday: {
        'ru': 'Подарите партнёру что-то маленькое, но значимое — покажите, как работает ваш язык любви',
        'en': 'Give your partner something small but meaningful — show how your love language works',
      },
      inspiringConclusion: {
        'ru': 'Ваш дар — видеть любовь в символах. Каждый подарок — это история ваших отношений!',
        'en': 'Your gift is seeing love in symbols. Each gift is a story of your relationship!',
      },
    ),

    'profile_service': TestProfile(
      id: 'profile_service',
      name: {
        'ru': '🤝 Ценитель Дел',
        'en': '🤝 Actions Appreciator',
      },
      description: {
        'ru': 'Для вас "дела говорят громче слов". Когда партнёр делает что-то, чтобы облегчить вашу жизнь — это и есть любовь.',
        'en': 'For you, "actions speak louder than words." When your partner does something to make your life easier — that\'s love.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали, что практическая помощь и забота — ваш главный язык любви.',
        'en': 'Your answers showed that practical help and care is your main love language.',
      },
      strengths: {
        'ru': [
          'Цените практическую заботу',
          'Видите любовь в ежедневных делах',
          'Умеете заботиться о партнёре делами',
          'Надёжны и ответственны',
          'Замечаете усилия партнёра',
        ],
        'en': [
          'Appreciate practical care',
          'See love in daily actions',
          'Know how to care for partner through deeds',
          'Reliable and responsible',
          'Notice partner\'s efforts',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Невыполненные обещания ранят глубоко',
          'Лень партнёра воспринимается как нелюбовь',
          'Можете перегружать себя заботой о других',
        ],
        'en': [
          'Broken promises hurt deeply',
          'Partner\'s laziness feels like lack of love',
          'May overload yourself caring for others',
        ],
      },
      recommendations: {
        'ru': [
          'Составьте список дел, которые для вас важны',
          'Научитесь просить о помощи конкретно',
          'Благодарите партнёра за каждое дело',
          'Не копите обиды — обсуждайте ожидания',
          'Помните: просить помощь — это нормально',
        ],
        'en': [
          'Make a list of tasks that matter to you',
          'Learn to ask for help specifically',
          'Thank your partner for every action',
          'Don\'t accumulate resentment — discuss expectations',
          'Remember: asking for help is normal',
        ],
      },
      tryToday: {
        'ru': 'Попросите партнёра сделать одну конкретную вещь, которая облегчит вашу жизнь',
        'en': 'Ask your partner to do one specific thing that will make your life easier',
      },
      inspiringConclusion: {
        'ru': 'Ваш дар — видеть любовь в заботливых действиях. Каждое дело — это признание в любви!',
        'en': 'Your gift is seeing love in caring actions. Every deed is a declaration of love!',
      },
    ),

    'profile_touch': TestProfile(
      id: 'profile_touch',
      name: {
        'ru': '🤗 Мастер Прикосновений',
        'en': '🤗 Touch Master',
      },
      description: {
        'ru': 'Для вас физический контакт — главный способ почувствовать любовь. Объятия, поцелуи, прикосновения говорят больше любых слов.',
        'en': 'For you, physical contact is the main way to feel loved. Hugs, kisses, touches speak louder than any words.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали, что физическая близость — ваш главный язык любви.',
        'en': 'Your answers showed that physical closeness is your main love language.',
      },
      strengths: {
        'ru': [
          'Чувствуете связь через прикосновения',
          'Умеете передавать тепло телесно',
          'Цените физическое присутствие',
          'Интуитивно чувствуете состояние партнёра',
          'Создаёте комфорт через близость',
        ],
        'en': [
          'Feel connection through touch',
          'Can convey warmth physically',
          'Value physical presence',
          'Intuitively sense partner\'s state',
          'Create comfort through closeness',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Отвержение прикосновений ранит глубоко',
          'Физическая дистанция воспринимается как холодность',
          'Можете чувствовать себя нелюбимым без контакта',
        ],
        'en': [
          'Rejection of touch hurts deeply',
          'Physical distance feels like coldness',
          'May feel unloved without contact',
        ],
      },
      recommendations: {
        'ru': [
          'Объясните партнёру важность прикосновений',
          'Инициируйте контакт первым',
          'Находите моменты для спонтанных объятий',
          'Уважайте границы партнёра',
          'Помните: Physical Touch ≠ только секс',
        ],
        'en': [
          'Explain the importance of touch to your partner',
          'Initiate contact first',
          'Find moments for spontaneous hugs',
          'Respect your partner\'s boundaries',
          'Remember: Physical Touch ≠ only sex',
        ],
      },
      tryToday: {
        'ru': 'Обнимите партнёра просто так, без повода — подарите 20-секундное объятие',
        'en': 'Hug your partner just because — give a 20-second hug',
      },
      inspiringConclusion: {
        'ru': 'Ваш дар — создавать связь через тепло прикосновений. Объятия лечат душу!',
        'en': 'Your gift is creating connection through the warmth of touch. Hugs heal the soul!',
      },
    ),

    // === Комбинированные профили ===
    'profile_words_time': TestProfile(
      id: 'profile_words_time',
      name: {
        'ru': '💬⏰ Ценитель Глубокого Общения',
        'en': '💬⏰ Deep Communication Appreciator',
      },
      description: {
        'ru': 'Вам важны и слова, и время. Идеал — долгие душевные разговоры наедине с партнёром.',
        'en': 'Both words and time matter to you. The ideal is long heartfelt conversations alone with your partner.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали равную важность слов одобрения и качественного времени.',
        'en': 'Your answers showed equal importance of words of affirmation and quality time.',
      },
      strengths: {
        'ru': [
          'Цените глубокие разговоры',
          'Создаёте эмоциональную близость',
          'Умеете слушать и говорить',
          'Инвестируете в качество общения',
        ],
        'en': [
          'Value deep conversations',
          'Create emotional intimacy',
          'Can listen and speak',
          'Invest in communication quality',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Поверхностное общение разочаровывает',
          'Нужны оба элемента для удовлетворённости',
        ],
        'en': [
          'Superficial communication disappoints',
          'Need both elements for satisfaction',
        ],
      },
      recommendations: {
        'ru': [
          'Создавайте ритуалы глубокого общения',
          'Выключайте телефоны во время разговоров',
          'Задавайте открытые вопросы партнёру',
        ],
        'en': [
          'Create rituals of deep communication',
          'Turn off phones during conversations',
          'Ask open questions to your partner',
        ],
      },
      tryToday: {
        'ru': 'Устройте вечер "без экранов" с душевным разговором за чашкой чая',
        'en': 'Have a "screen-free" evening with a heartfelt conversation over tea',
      },
      inspiringConclusion: {
        'ru': 'Ваша сила — в глубине общения. Слова + время = настоящая близость!',
        'en': 'Your strength is in deep communication. Words + time = true intimacy!',
      },
    ),

    'profile_words_service': TestProfile(
      id: 'profile_words_service',
      name: {
        'ru': '💬🤝 Практичный Романтик',
        'en': '💬🤝 Practical Romantic',
      },
      description: {
        'ru': 'Вам нужны и слова любви, и дела. "Я тебя люблю" + помытая посуда = идеальная формула.',
        'en': 'You need both words of love and actions. "I love you" + washed dishes = perfect formula.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали важность как словесного выражения, так и практической заботы.',
        'en': 'Your answers showed importance of both verbal expression and practical care.',
      },
      strengths: {
        'ru': [
          'Цените и слова, и действия',
          'Сбалансированный подход к любви',
          'Понимаете разные проявления заботы',
        ],
        'en': [
          'Value both words and actions',
          'Balanced approach to love',
          'Understand different expressions of care',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Слова без дел кажутся пустыми',
          'Дела без слов — недостаточными',
        ],
        'en': [
          'Words without actions feel empty',
          'Actions without words seem insufficient',
        ],
      },
      recommendations: {
        'ru': [
          'Просите партнёра совмещать слова с делами',
          'Сами показывайте пример',
          'Благодарите за оба типа проявлений',
        ],
        'en': [
          'Ask your partner to combine words with actions',
          'Set an example yourself',
          'Thank for both types of expressions',
        ],
      },
      tryToday: {
        'ru': 'Сделайте что-то приятное для партнёра и скажите, почему вы это сделали',
        'en': 'Do something nice for your partner and tell them why you did it',
      },
      inspiringConclusion: {
        'ru': 'Вы знаете: любовь — это и слова, и дела. Показывайте любовь полно!',
        'en': 'You know: love is both words and deeds. Show love fully!',
      },
    ),

    'profile_words_touch': TestProfile(
      id: 'profile_words_touch',
      name: {
        'ru': '💬🤗 Чувственный Романтик',
        'en': '💬🤗 Sensual Romantic',
      },
      description: {
        'ru': 'Слова и прикосновения — ваш дуэт любви. "Я тебя люблю" + объятие = счастье.',
        'en': 'Words and touch are your love duet. "I love you" + a hug = happiness.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали важность как словесного выражения, так и физического контакта.',
        'en': 'Your answers showed importance of both verbal expression and physical contact.',
      },
      strengths: {
        'ru': [
          'Чувствуете любовь многомерно',
          'Создаёте глубокую эмоциональную связь',
          'Выражаете любовь целостно',
        ],
        'en': [
          'Feel love multidimensionally',
          'Create deep emotional connection',
          'Express love holistically',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Нужны оба элемента одновременно',
          'Холодность ранит особенно сильно',
        ],
        'en': [
          'Need both elements simultaneously',
          'Coldness hurts especially hard',
        ],
      },
      recommendations: {
        'ru': [
          'Просите партнёра говорить ласковые слова при объятиях',
          'Сами практикуйте такое выражение любви',
        ],
        'en': [
          'Ask your partner to say sweet words during hugs',
          'Practice this expression of love yourself',
        ],
      },
      tryToday: {
        'ru': 'Обнимите партнёра и прошепчите три вещи, которые вы в нём любите',
        'en': 'Hug your partner and whisper three things you love about them',
      },
      inspiringConclusion: {
        'ru': 'Вы чувствуете любовь всем телом и душой. Это прекрасный дар!',
        'en': 'You feel love with your whole body and soul. This is a wonderful gift!',
      },
    ),

    'profile_time_service': TestProfile(
      id: 'profile_time_service',
      name: {
        'ru': '⏰🤝 Практичный Компаньон',
        'en': '⏰🤝 Practical Companion',
      },
      description: {
        'ru': 'Время вместе + совместные дела = ваша формула любви. Идеал — делать что-то полезное вдвоём.',
        'en': 'Time together + joint activities = your love formula. The ideal is doing something useful together.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали важность как качественного времени, так и практической помощи.',
        'en': 'Your answers showed importance of both quality time and practical help.',
      },
      strengths: {
        'ru': [
          'Цените совместную деятельность',
          'Видите любовь в командной работе',
          'Создаёте практичные традиции',
        ],
        'en': [
          'Value joint activities',
          'See love in teamwork',
          'Create practical traditions',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сложно, когда партнёр делает всё один',
          'Разочаровывает время "рядом, но не вместе"',
        ],
        'en': [
          'Difficult when partner does everything alone',
          'Disappointed by time "nearby but not together"',
        ],
      },
      recommendations: {
        'ru': [
          'Находите дела, которые можно делать вдвоём',
          'Превращайте рутину в качественное время',
        ],
        'en': [
          'Find activities you can do together',
          'Turn routine into quality time',
        ],
      },
      tryToday: {
        'ru': 'Сделайте домашние дела вместе — готовьте ужин или убирайте как команда',
        'en': 'Do household chores together — cook dinner or clean as a team',
      },
      inspiringConclusion: {
        'ru': 'Вы знаете секрет: любовь укрепляется в совместных делах!',
        'en': 'You know the secret: love strengthens through joint activities!',
      },
    ),

    'profile_time_touch': TestProfile(
      id: 'profile_time_touch',
      name: {
        'ru': '⏰🤗 Нежный Присутствующий',
        'en': '⏰🤗 Tender Present One',
      },
      description: {
        'ru': 'Время рядом с прикосновениями — ваш идеал. Смотреть фильм в обнимку лучше любых подарков.',
        'en': 'Time together with touches is your ideal. Watching a movie cuddled up is better than any gifts.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали важность как качественного времени, так и физического контакта.',
        'en': 'Your answers showed importance of both quality time and physical contact.',
      },
      strengths: {
        'ru': [
          'Создаёте уютную атмосферу близости',
          'Цените физическое присутствие',
          'Умеете наслаждаться моментом',
        ],
        'en': [
          'Create a cozy atmosphere of closeness',
          'Value physical presence',
          'Can enjoy the moment',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Время на расстоянии недостаточно',
          'Нужен физический контакт во время общения',
        ],
        'en': [
          'Distance time is not enough',
          'Need physical contact during interaction',
        ],
      },
      recommendations: {
        'ru': [
          'Создавайте ритуалы близкого времени',
          'Всегда сидите рядом, не напротив',
        ],
        'en': [
          'Create rituals of close time',
          'Always sit next to, not across from',
        ],
      },
      tryToday: {
        'ru': 'Посмотрите фильм, обнимаясь на диване — полное присутствие + физический контакт',
        'en': 'Watch a movie cuddling on the couch — full presence + physical contact',
      },
      inspiringConclusion: {
        'ru': 'Ваша любовь живёт в моментах близости. Цените каждое объятие!',
        'en': 'Your love lives in moments of closeness. Cherish every hug!',
      },
    ),

    'profile_service_touch': TestProfile(
      id: 'profile_service_touch',
      name: {
        'ru': '🤝🤗 Заботливый Нежный',
        'en': '🤝🤗 Caring Tender One',
      },
      description: {
        'ru': 'Практическая забота + физическая нежность — ваш язык любви. Массаж уставших плеч партнёра — идеал.',
        'en': 'Practical care + physical tenderness is your love language. Massaging your tired partner\'s shoulders is the ideal.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали важность как практической помощи, так и физического контакта.',
        'en': 'Your answers showed importance of both practical help and physical contact.',
      },
      strengths: {
        'ru': [
          'Заботитесь практично и нежно',
          'Чувствуете потребности партнёра',
          'Выражаете любовь телесно и делами',
        ],
        'en': [
          'Care practically and tenderly',
          'Sense partner\'s needs',
          'Express love physically and through deeds',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Холодная практичность недостаточна',
          'Нежность без помощи тоже не хватает',
        ],
        'en': [
          'Cold practicality is not enough',
          'Tenderness without help is also lacking',
        ],
      },
      recommendations: {
        'ru': [
          'Совмещайте заботу с прикосновениями',
          'Делайте массаж после тяжёлого дня',
        ],
        'en': [
          'Combine care with touches',
          'Give massages after a hard day',
        ],
      },
      tryToday: {
        'ru': 'Приготовьте партнёру ужин, а потом сделайте расслабляющий массаж',
        'en': 'Cook dinner for your partner, then give a relaxing massage',
      },
      inspiringConclusion: {
        'ru': 'Ваш дар — заботиться телом и делами. Это мощная комбинация любви!',
        'en': 'Your gift is caring through body and actions. This is a powerful love combination!',
      },
    ),

    'profile_time_gifts': TestProfile(
      id: 'profile_time_gifts',
      name: {
        'ru': '⏰🎁 Ценитель Особых Моментов',
        'en': '⏰🎁 Special Moments Appreciator',
      },
      description: {
        'ru': 'Время вместе + символические подарки создают для вас магию. Идеал — особенный день с сюрпризом.',
        'en': 'Time together + symbolic gifts create magic for you. The ideal is a special day with a surprise.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали важность как качественного времени, так и символических подарков.',
        'en': 'Your answers showed importance of both quality time and symbolic gifts.',
      },
      strengths: {
        'ru': [
          'Создаёте незабываемые моменты',
          'Цените продуманные сюрпризы',
          'Помните особенные события',
        ],
        'en': [
          'Create unforgettable moments',
          'Value thoughtful surprises',
          'Remember special events',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Пропущенные праздники ранят',
          'Нужны оба элемента для счастья',
        ],
        'en': [
          'Missed celebrations hurt',
          'Need both elements for happiness',
        ],
      },
      recommendations: {
        'ru': [
          'Планируйте особенные даты',
          'Маленькие подарки + время = большое счастье',
        ],
        'en': [
          'Plan special dates',
          'Small gifts + time = big happiness',
        ],
      },
      tryToday: {
        'ru': 'Организуйте мини-свидание с маленьким сюрпризом для партнёра',
        'en': 'Organize a mini-date with a small surprise for your partner',
      },
      inspiringConclusion: {
        'ru': 'Вы умеете создавать волшебство из моментов и символов!',
        'en': 'You know how to create magic from moments and symbols!',
      },
    ),

    'profile_words_gifts': TestProfile(
      id: 'profile_words_gifts',
      name: {
        'ru': '💬🎁 Романтичный Ценитель',
        'en': '💬🎁 Romantic Appreciator',
      },
      description: {
        'ru': 'Слова любви + символические подарки — ваша формула счастья. Открытка с признанием — идеальный дар.',
        'en': 'Words of love + symbolic gifts are your happiness formula. A card with a confession is the perfect gift.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали важность как словесного выражения, так и материальных символов любви.',
        'en': 'Your answers showed importance of both verbal expression and material symbols of love.',
      },
      strengths: {
        'ru': [
          'Цените вдумчивые жесты',
          'Храните любовные записки',
          'Создаёте романтическую атмосферу',
        ],
        'en': [
          'Value thoughtful gestures',
          'Keep love notes',
          'Create romantic atmosphere',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Подарки без слов кажутся холодными',
          'Слова без жестов — пустыми',
        ],
        'en': [
          'Gifts without words feel cold',
          'Words without gestures feel empty',
        ],
      },
      recommendations: {
        'ru': [
          'Пишите записки к подаркам',
          'Просите партнёра делать то же',
        ],
        'en': [
          'Write notes with gifts',
          'Ask your partner to do the same',
        ],
      },
      tryToday: {
        'ru': 'Подарите партнёру что-то маленькое с любовной запиской',
        'en': 'Give your partner something small with a love note',
      },
      inspiringConclusion: {
        'ru': 'Ваш дар — видеть любовь в словах и символах. Это настоящий романтизм!',
        'en': 'Your gift is seeing love in words and symbols. This is true romanticism!',
      },
    ),

    // === Сбалансированный профиль ===
    'profile_balanced': TestProfile(
      id: 'profile_balanced',
      name: {
        'ru': '⚖️ Универсальный Любящий',
        'en': '⚖️ Universal Lover',
      },
      description: {
        'ru': 'Вы воспринимаете любовь через все пять языков примерно одинаково. Это редкий и ценный дар — гибкость в любви.',
        'en': 'You perceive love through all five languages roughly equally. This is a rare and valuable gift — flexibility in love.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали сбалансированную чувствительность ко всем языкам любви.',
        'en': 'Your answers showed balanced sensitivity to all love languages.',
      },
      strengths: {
        'ru': [
          'Чувствуете любовь многими способами',
          'Легко адаптируетесь к партнёру',
          'Понимаете разные проявления любви',
          'Гибки в выражении чувств',
          'Не зависите от одного способа',
        ],
        'en': [
          'Feel love in many ways',
          'Easily adapt to your partner',
          'Understand different expressions of love',
          'Flexible in expressing feelings',
          'Not dependent on one method',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может быть сложно объяснить свои потребности',
          'Партнёру труднее угадать, что вам нужно',
          'Можете не замечать свои предпочтения',
        ],
        'en': [
          'May be hard to explain your needs',
          'Partner finds it harder to guess what you need',
          'May not notice your own preferences',
        ],
      },
      recommendations: {
        'ru': [
          'Изучите язык любви вашего партнёра',
          'Экспериментируйте с разными способами',
          'Говорите о своих текущих потребностях',
          'Цените свою гибкость как дар',
          'Обращайте внимание, что работает лучше в разные моменты',
        ],
        'en': [
          'Learn your partner\'s love language',
          'Experiment with different methods',
          'Talk about your current needs',
          'Value your flexibility as a gift',
          'Notice what works better at different times',
        ],
      },
      tryToday: {
        'ru': 'Попробуйте выразить любовь партнёру всеми пятью способами за один день',
        'en': 'Try expressing love to your partner in all five ways in one day',
      },
      inspiringConclusion: {
        'ru': 'Ваша универсальность — редкий дар. Вы можете любить и быть любимым множеством способов!',
        'en': 'Your universality is a rare gift. You can love and be loved in many ways!',
      },
    ),
  };
}
