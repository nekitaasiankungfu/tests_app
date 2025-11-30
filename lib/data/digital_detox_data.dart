import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data access class for Digital Detox Test
/// Legacy Dart implementation (no JSON dependency)
class DigitalDetoxTestData {
  /// Get the complete Digital Detox test
  static TestModel getDigitalDetoxTest() {
    return TestModel(
      id: 'digital_detox_test',
      title: {
        'ru': 'Цифровой детокс',
        'en': 'Digital Detox',
      },
      description: {
        'ru':
            'Диагностика технологической зависимости: оцените влияние гаджетов на зависимость, внимание, социальную жизнь, здоровье, продуктивность и эмоции',
        'en':
            'Digital addiction diagnosis: assess the impact of devices on dependency, attention, social life, health, productivity and emotions',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      disclaimer: {
        'ru':
            'Этот тест основан на исследованиях цифрового благополучия, концепции номофобии и теории когнитивной перегрузки. Он предназначен для самооценки и не является медицинской диагностикой. Отвечайте честно для получения наиболее точных результатов.',
        'en':
            'This test is based on research in digital wellbeing, nomophobia concept and cognitive load theory. It is for self-assessment and not a medical diagnosis. Answer honestly for the most accurate results.',
      },
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: [
        'dependency_level',
        'attention_control',
        'social_impact',
        'physical_health',
        'productivity_loss',
        'emotional_state',
        'usage_patterns'
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'dependency_level': {
        'ru': 'Уровень зависимости',
        'en': 'Dependency Level',
      },
      'attention_control': {
        'ru': 'Контроль внимания',
        'en': 'Attention Control',
      },
      'social_impact': {
        'ru': 'Социальное влияние',
        'en': 'Social Impact',
      },
      'physical_health': {
        'ru': 'Физическое здоровье',
        'en': 'Physical Health',
      },
      'productivity_loss': {
        'ru': 'Потеря продуктивности',
        'en': 'Productivity Loss',
      },
      'emotional_state': {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      'usage_patterns': {
        'ru': 'Паттерны использования',
        'en': 'Usage Patterns',
      },
    };
  }

  /// Get factor interpretation based on percentage score
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Determine range: 0-35 (low), 36-65 (medium), 66-100 (high)
    final String level;
    if (percentage <= 35) {
      level = 'low';
    } else if (percentage <= 65) {
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

  /// Get all 50 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1 - dependency_level
      QuestionModel(
        id: 'q1',
        text: {
          'ru':
              'Я чувствую беспокойство или тревогу, когда не могу проверить свой телефон',
          'en': 'I feel anxious or worried when I cannot check my phone',
        },
        factorId: 'dependency_level',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q2 - attention_control (reversed)
      QuestionModel(
        id: 'q2',
        text: {
          'ru':
              'Я могу читать длинные тексты или статьи без желания отвлечься на телефон',
          'en':
              'I can read long texts or articles without wanting to check my phone',
        },
        factorId: 'attention_control',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q3 - social_impact
      QuestionModel(
        id: 'q3',
        text: {
          'ru':
              'Я использую телефон во время общения с друзьями или семьёй',
          'en': 'I use my phone while communicating with friends or family',
        },
        factorId: 'social_impact',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q4 - physical_health
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'У меня устают или болят глаза от работы с экранами',
          'en': 'My eyes get tired or hurt from working with screens',
        },
        factorId: 'physical_health',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q5 - productivity_loss
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Гаджеты отвлекают меня от выполнения важных задач',
          'en': 'Gadgets distract me from completing important tasks',
        },
        factorId: 'productivity_loss',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q6 - emotional_state
      QuestionModel(
        id: 'q6',
        text: {
          'ru':
              'Я боюсь упустить что-то важное, если не буду постоянно проверять телефон (FOMO)',
          'en':
              'I fear missing something important if I do not constantly check my phone (FOMO)',
        },
        factorId: 'emotional_state',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q7 - usage_patterns
      QuestionModel(
        id: 'q7',
        text: {
          'ru':
              'Сколько часов в день вы проводите перед экранами (телефон, компьютер, планшет)?',
          'en':
              'How many hours per day do you spend in front of screens (phone, computer, tablet)?',
        },
        factorId: 'usage_patterns',
        isReversed: false,
        answers: _getScreenTimeAnswers(),
      ),
      // Q8 - dependency_level
      QuestionModel(
        id: 'q8',
        text: {
          'ru':
              'Я проверяю телефон в течение первых 5 минут после пробуждения',
          'en': 'I check my phone within the first 5 minutes after waking up',
        },
        factorId: 'dependency_level',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q9 - attention_control (reversed)
      QuestionModel(
        id: 'q9',
        text: {
          'ru':
              'Я могу сосредоточиться на одной задаче более 30 минут без проверки телефона',
          'en':
              'I can focus on one task for more than 30 minutes without checking my phone',
        },
        factorId: 'attention_control',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q10 - social_impact
      QuestionModel(
        id: 'q10',
        text: {
          'ru':
              'Близкие люди жалуются, что я слишком много времени провожу в телефоне',
          'en':
              'People close to me complain that I spend too much time on my phone',
        },
        factorId: 'social_impact',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q11 - physical_health
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'У меня проблемы с засыпанием из-за использования экранов перед сном',
          'en':
              'I have trouble falling asleep due to using screens before bed',
        },
        factorId: 'physical_health',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q12 - productivity_loss
      QuestionModel(
        id: 'q12',
        text: {
          'ru':
              'Я откладываю важные дела, чтобы провести время в социальных сетях или приложениях',
          'en':
              'I postpone important tasks to spend time on social media or apps',
        },
        factorId: 'productivity_loss',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q13 - emotional_state
      QuestionModel(
        id: 'q13',
        text: {
          'ru':
              'Я чувствую раздражение или злость, когда кто-то прерывает меня во время использования гаджетов',
          'en':
              'I feel irritation or anger when someone interrupts me while using gadgets',
        },
        factorId: 'emotional_state',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q14 - usage_patterns
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Как часто вы проверяете телефон в течение дня?',
          'en': 'How often do you check your phone during the day?',
        },
        factorId: 'usage_patterns',
        isReversed: false,
        answers: _getCheckFrequencyAnswers(),
      ),
      // Q15 - dependency_level
      QuestionModel(
        id: 'q15',
        text: {
          'ru':
              'Я пытался(лась) сократить время использования гаджетов, но не смог(ла)',
          'en':
              'I tried to reduce gadget usage time, but could not',
        },
        factorId: 'dependency_level',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q16 - attention_control
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я автоматически открываю приложения, даже не осознавая зачем',
          'en':
              'I automatically open apps without even realizing why',
        },
        factorId: 'attention_control',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q17 - social_impact
      QuestionModel(
        id: 'q17',
        text: {
          'ru':
              'Я предпочитаю написать сообщение, а не встретиться или позвонить',
          'en': 'I prefer to text rather than meet or call',
        },
        factorId: 'social_impact',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q18 - physical_health
      QuestionModel(
        id: 'q18',
        text: {
          'ru':
              'У меня болит шея, спина или запястья из-за использования гаджетов',
          'en':
              'My neck, back or wrists hurt from using gadgets',
        },
        factorId: 'physical_health',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q19 - productivity_loss
      QuestionModel(
        id: 'q19',
        text: {
          'ru':
              'Я замечаю, что моя продуктивность снизилась из-за гаджетов',
          'en': 'I notice that my productivity has decreased due to gadgets',
        },
        factorId: 'productivity_loss',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q20 - emotional_state
      QuestionModel(
        id: 'q20',
        text: {
          'ru':
              'Я сравниваю свою жизнь с тем, что вижу в социальных сетях, и это влияет на моё настроение',
          'en':
              'I compare my life to what I see on social media, and it affects my mood',
        },
        factorId: 'emotional_state',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q21 - usage_patterns
      QuestionModel(
        id: 'q21',
        text: {
          'ru':
              'Сколько времени проходит с момента, когда вы берёте телефон в руки до момента, когда убираете его?',
          'en':
              'How much time passes from when you pick up your phone until you put it away?',
        },
        factorId: 'usage_patterns',
        isReversed: false,
        answers: _getSessionDurationAnswers(),
      ),
      // Q22 - dependency_level
      QuestionModel(
        id: 'q22',
        text: {
          'ru':
              'Я чувствую себя беспокойно, когда батарея моего телефона садится',
          'en': 'I feel anxious when my phone battery is low',
        },
        factorId: 'dependency_level',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q23 - attention_control
      QuestionModel(
        id: 'q23',
        text: {
          'ru':
              'Я забываю, что только что прочитал(а) или посмотрел(а) в телефоне',
          'en': 'I forget what I just read or saw on my phone',
        },
        factorId: 'attention_control',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q24 - social_impact
      QuestionModel(
        id: 'q24',
        text: {
          'ru':
              'Я чувствую себя одиноко, несмотря на активное общение онлайн',
          'en': 'I feel lonely despite active online communication',
        },
        factorId: 'social_impact',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q25 - physical_health
      QuestionModel(
        id: 'q25',
        text: {
          'ru':
              'Я чувствую постоянную усталость, которую связываю с использованием экранов',
          'en':
              'I feel constant fatigue that I attribute to screen usage',
        },
        factorId: 'physical_health',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q26 - productivity_loss
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Я трачу больше времени в гаджетах, чем планировал(а)',
          'en': 'I spend more time on gadgets than I planned',
        },
        factorId: 'productivity_loss',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q27 - emotional_state
      QuestionModel(
        id: 'q27',
        text: {
          'ru':
              'Я испытываю тревогу, когда не могу получить доступ к интернету',
          'en': 'I feel anxious when I cannot access the internet',
        },
        factorId: 'emotional_state',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q28 - usage_patterns
      QuestionModel(
        id: 'q28',
        text: {
          'ru':
              'Как быстро после получения уведомления вы его проверяете?',
          'en': 'How quickly after receiving a notification do you check it?',
        },
        factorId: 'usage_patterns',
        isReversed: false,
        answers: _getNotificationResponseAnswers(),
      ),
      // Q29 - dependency_level
      QuestionModel(
        id: 'q29',
        text: {
          'ru':
              'Мне кажется, что телефон вибрирует, хотя это не так (фантомная вибрация)',
          'en':
              'I feel like my phone is vibrating when it is not (phantom vibration)',
        },
        factorId: 'dependency_level',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q30 - attention_control (reversed)
      QuestionModel(
        id: 'q30',
        text: {
          'ru':
              'Я могу удержаться от проверки телефона во время важного разговора или встречи',
          'en':
              'I can refrain from checking my phone during an important conversation or meeting',
        },
        factorId: 'attention_control',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q31 - social_impact
      QuestionModel(
        id: 'q31',
        text: {
          'ru':
              'Я трачу меньше времени на личные встречи из-за онлайн-активности',
          'en':
              'I spend less time on personal meetings due to online activity',
        },
        factorId: 'social_impact',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q32 - physical_health
      QuestionModel(
        id: 'q32',
        text: {
          'ru':
              'Качество моего сна ухудшилось из-за использования гаджетов',
          'en': 'The quality of my sleep has worsened due to gadget use',
        },
        factorId: 'physical_health',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q33 - productivity_loss
      QuestionModel(
        id: 'q33',
        text: {
          'ru':
              'Я замечаю, что откладываю дедлайны из-за отвлечений на гаджеты',
          'en': 'I notice that I miss deadlines due to gadget distractions',
        },
        factorId: 'productivity_loss',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q34 - emotional_state
      QuestionModel(
        id: 'q34',
        text: {
          'ru':
              'Я чувствую зависть или неудовлетворённость, глядя на жизнь других в соцсетях',
          'en':
              'I feel envy or dissatisfaction looking at other people\'s lives on social media',
        },
        factorId: 'emotional_state',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q35 - usage_patterns
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Вы используете телефон во время еды?',
          'en': 'Do you use your phone while eating?',
        },
        factorId: 'usage_patterns',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q36 - dependency_level
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Я беру телефон с собой даже в туалет',
          'en': 'I take my phone with me even to the bathroom',
        },
        factorId: 'dependency_level',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q37 - attention_control
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я начинаю задачу, но быстро отвлекаюсь на уведомления',
          'en': 'I start a task but quickly get distracted by notifications',
        },
        factorId: 'attention_control',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q38 - social_impact (reversed)
      QuestionModel(
        id: 'q38',
        text: {
          'ru':
              'У меня есть хобби и интересы, не связанные с экранами, которым я регулярно уделяю время',
          'en':
              'I have hobbies and interests not related to screens that I regularly spend time on',
        },
        factorId: 'social_impact',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q39 - physical_health
      QuestionModel(
        id: 'q39',
        text: {
          'ru':
              'У меня бывают головные боли, которые я связываю с использованием экранов',
          'en': 'I have headaches that I attribute to screen usage',
        },
        factorId: 'physical_health',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q40 - productivity_loss (reversed)
      QuestionModel(
        id: 'q40',
        text: {
          'ru':
              'Я могу оценить свою продуктивность как высокую, несмотря на использование гаджетов',
          'en':
              'I can rate my productivity as high despite using gadgets',
        },
        factorId: 'productivity_loss',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q41 - emotional_state
      QuestionModel(
        id: 'q41',
        text: {
          'ru':
              'Мысль об отключении уведомлений вызывает у меня беспокойство',
          'en': 'The thought of turning off notifications makes me anxious',
        },
        factorId: 'emotional_state',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q42 - usage_patterns
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Вы берёте телефон в постель перед сном?',
          'en': 'Do you take your phone to bed before sleep?',
        },
        factorId: 'usage_patterns',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q43 - dependency_level
      QuestionModel(
        id: 'q43',
        text: {
          'ru':
              'Если бы мне пришлось провести целый день без телефона, это было бы очень трудно',
          'en':
              'If I had to spend a whole day without my phone, it would be very difficult',
        },
        factorId: 'dependency_level',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q44 - attention_control (reversed)
      QuestionModel(
        id: 'q44',
        text: {
          'ru':
              'Я могу провести свободный вечер без использования гаджетов',
          'en': 'I can spend a free evening without using gadgets',
        },
        factorId: 'attention_control',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q45 - social_impact
      QuestionModel(
        id: 'q45',
        text: {
          'ru':
              'Я использую телефон во время прогулок или поездок вместо того, чтобы наблюдать за окружающим',
          'en':
              'I use my phone during walks or trips instead of observing my surroundings',
        },
        factorId: 'social_impact',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q46 - physical_health
      QuestionModel(
        id: 'q46',
        text: {
          'ru':
              'Я замечаю ухудшение осанки из-за использования гаджетов (\'текстовая шея\')',
          'en':
              'I notice worsening posture due to gadget use (\'text neck\')',
        },
        factorId: 'physical_health',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q47 - productivity_loss
      QuestionModel(
        id: 'q47',
        text: {
          'ru':
              'Я откладываю важные задачи, чтобы \'просто быстро проверить\' социальные сети',
          'en':
              'I postpone important tasks to \'just quickly check\' social media',
        },
        factorId: 'productivity_loss',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q48 - emotional_state
      QuestionModel(
        id: 'q48',
        text: {
          'ru':
              'После использования социальных сетей я чувствую себя хуже, чем до этого',
          'en': 'After using social media I feel worse than before',
        },
        factorId: 'emotional_state',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q49 - usage_patterns
      QuestionModel(
        id: 'q49',
        text: {
          'ru':
              'Сколько приложений вы проверяете каждое утро в первые 30 минут после пробуждения?',
          'en':
              'How many apps do you check each morning in the first 30 minutes after waking up?',
        },
        factorId: 'usage_patterns',
        isReversed: false,
        answers: _getMorningAppsAnswers(),
      ),
      // Q50 - usage_patterns
      QuestionModel(
        id: 'q50',
        text: {
          'ru':
              'Как часто вы проверяете телефон, когда ждёте кого-то или что-то (в очереди, на остановке)?',
          'en':
              'How often do you check your phone when waiting for someone or something (in line, at a bus stop)?',
        },
        factorId: 'usage_patterns',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
    ];
  }

  /// Standard 5-point Likert scale answers
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совершенно не согласен',
          'en': 'Strongly Disagree',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не согласен',
          'en': 'Disagree',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Нейтрально',
          'en': 'Neutral',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Скорее согласен',
          'en': 'Agree',
        },
        score: 4,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью согласен',
          'en': 'Strongly Agree',
        },
        score: 5,
      ),
    ];
  }

  /// Frequency scale answers
  static List<AnswerModel> _getFrequencyAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Никогда',
          'en': 'Never',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Редко',
          'en': 'Rarely',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Иногда',
          'en': 'Sometimes',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Часто',
          'en': 'Often',
        },
        score: 4,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Постоянно',
          'en': 'Constantly',
        },
        score: 5,
      ),
    ];
  }

  /// Q7 - Screen time answers
  static List<AnswerModel> _getScreenTimeAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Менее 2 часов',
          'en': 'Less than 2 hours',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': '2-4 часа',
          'en': '2-4 hours',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': '4-6 часов',
          'en': '4-6 hours',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': '6-8 часов',
          'en': '6-8 hours',
        },
        score: 4,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Более 8 часов',
          'en': 'More than 8 hours',
        },
        score: 5,
      ),
    ];
  }

  /// Q14 - Check frequency answers
  static List<AnswerModel> _getCheckFrequencyAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Менее 20 раз',
          'en': 'Less than 20 times',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': '20-50 раз',
          'en': '20-50 times',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': '50-100 раз',
          'en': '50-100 times',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': '100-150 раз',
          'en': '100-150 times',
        },
        score: 4,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Более 150 раз или постоянно',
          'en': 'More than 150 times or constantly',
        },
        score: 5,
      ),
    ];
  }

  /// Q21 - Session duration answers
  static List<AnswerModel> _getSessionDurationAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': '1-5 минут',
          'en': '1-5 minutes',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': '5-15 минут',
          'en': '5-15 minutes',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': '15-30 минут',
          'en': '15-30 minutes',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': '30-60 минут',
          'en': '30-60 minutes',
        },
        score: 4,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Более 1 часа',
          'en': 'More than 1 hour',
        },
        score: 5,
      ),
    ];
  }

  /// Q28 - Notification response answers
  static List<AnswerModel> _getNotificationResponseAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Не сразу, когда удобно',
          'en': 'Not immediately, when convenient',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'В течение 10-30 минут',
          'en': 'Within 10-30 minutes',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'В течение 5-10 минут',
          'en': 'Within 5-10 minutes',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'В течение 1-5 минут',
          'en': 'Within 1-5 minutes',
        },
        score: 4,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Немедленно',
          'en': 'Immediately',
        },
        score: 5,
      ),
    ];
  }

  /// Q49 - Morning apps answers
  static List<AnswerModel> _getMorningAppsAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Не проверяю или 1 приложение',
          'en': 'Do not check or 1 app',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': '2-3 приложения',
          'en': '2-3 apps',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': '4-5 приложений',
          'en': '4-5 apps',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': '6-8 приложений',
          'en': '6-8 apps',
        },
        score: 4,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Более 8 приложений',
          'en': 'More than 8 apps',
        },
        score: 5,
      ),
    ];
  }

  /// Get all interpretations for all factors and levels
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'dependency_level': {
        'low': {
          'title_ru': 'Здоровые отношения с технологиями',
          'title_en': 'Healthy Relationship with Technology',
          'description_ru':
              'Вы поддерживаете здоровый баланс в использовании технологий. Гаджеты служат вам эффективным инструментом, не контролируя вашу жизнь. У вас нет признаков цифровой зависимости.',
          'description_en':
              'You maintain a healthy balance in technology use. Gadgets serve as effective tools without controlling your life. You show no signs of digital addiction.',
        },
        'medium': {
          'title_ru': 'Первые признаки зависимости',
          'title_en': 'Early Signs of Dependency',
          'description_ru':
              'У вас появляются первые признаки зависимости от устройств. Вы периодически чувствуете беспокойство без телефона и автоматически проверяете его. Рекомендуется установить границы использования и отключить часть уведомлений.',
          'description_en':
              'You are showing early signs of device dependency. You periodically feel anxious without your phone and automatically check it. Setting usage boundaries and disabling some notifications is recommended.',
        },
        'high': {
          'title_ru': 'Выраженная зависимость',
          'title_en': 'Strong Dependency',
          'description_ru':
              'У вас сформировалась серьезная зависимость от устройств. Вы испытываете значительную тревогу без телефона, проверяете его немедленно после пробуждения и не можете сократить время использования. Рекомендуется обратиться к психологу и провести цифровой детокс.',
          'description_en':
              'You have developed a serious device dependency. You experience significant anxiety without your phone, check it immediately upon waking, and cannot reduce usage time. Consulting a psychologist and doing a digital detox is recommended.',
        },
      },
      'attention_control': {
        'low': {
          'title_ru': 'Серьезные проблемы с концентрацией',
          'title_en': 'Serious Concentration Problems',
          'description_ru':
              'Технологии серьезно влияют на вашу способность концентрироваться. Вы автоматически открываете приложения, не можете долго фокусироваться на одной задаче и постоянно отвлекаетесь. Рекомендуется: отключить уведомления, практиковать медитацию осознанности, использовать технику Pomodoro.',
          'description_en':
              'Technology seriously affects your ability to concentrate. You automatically open apps, cannot focus on one task for long, and are constantly distracted. Recommended: disable notifications, practice mindfulness meditation, use the Pomodoro technique.',
        },
        'medium': {
          'title_ru': 'Умеренные трудности с вниманием',
          'title_en': 'Moderate Attention Difficulties',
          'description_ru':
              'У вас есть трудности с контролем внимания, но они еще не критичны. Вы иногда отвлекаетесь на уведомления и проверяете телефон во время важных дел. Рекомендуется создать зоны без телефона и установить режим фокусировки.',
          'description_en':
              'You have attention control difficulties, but they are not yet critical. You sometimes get distracted by notifications and check your phone during important tasks. Creating phone-free zones and setting focus mode is recommended.',
        },
        'high': {
          'title_ru': 'Хороший контроль внимания',
          'title_en': 'Good Attention Control',
          'description_ru':
              'Вы хорошо контролируете свое внимание и не позволяете технологиям отвлекать вас от важных задач. Вы можете долго концентрироваться без проверки телефона. Продолжайте поддерживать эти здоровые привычки.',
          'description_en':
              'You control your attention well and do not let technology distract you from important tasks. You can concentrate for long periods without checking your phone. Continue maintaining these healthy habits.',
        },
      },
      'social_impact': {
        'low': {
          'title_ru': 'Минимальное влияние на социальную жизнь',
          'title_en': 'Minimal Impact on Social Life',
          'description_ru':
              'Технологии не мешают вашим реальным отношениям. Вы не используете телефон во время общения, предпочитаете личные встречи онлайн-общению и имеете интересы вне экранов. Это здоровая социальная позиция.',
          'description_en':
              'Technology does not interfere with your real relationships. You do not use your phone during communication, prefer personal meetings to online communication, and have interests beyond screens. This is a healthy social position.',
        },
        'medium': {
          'title_ru': 'Умеренное влияние на отношения',
          'title_en': 'Moderate Impact on Relationships',
          'description_ru':
              'Технологии начинают влиять на качество ваших отношений. Вы иногда используете телефон во время общения, предпочитаете написать вместо встречи. Рекомендуется установить правила "без телефона" во время общения с близкими.',
          'description_en':
              'Technology is beginning to affect the quality of your relationships. You sometimes use your phone during communication and prefer texting to meeting. Setting "no phone" rules during communication with loved ones is recommended.',
        },
        'high': {
          'title_ru': 'Серьезное влияние на социальную жизнь',
          'title_en': 'Serious Impact on Social Life',
          'description_ru':
              'Цифровой мир серьезно вытеснил реальные отношения. Вы предпочитаете онлайн-общение личным встречам, чувствуете одиночество несмотря на активность в соцсетях. Близкие жалуются на ваше время в телефоне. Рекомендуется: удалить соцсети на 60-90 дней, присоединиться к реальному сообществу, проводить время с людьми без гаджетов.',
          'description_en':
              'The digital world has seriously displaced real relationships. You prefer online communication to personal meetings, feel lonely despite social media activity. Loved ones complain about your phone time. Recommended: delete social media for 60-90 days, join a real community, spend time with people without gadgets.',
        },
      },
      'physical_health': {
        'low': {
          'title_ru': 'Нет физических симптомов',
          'title_en': 'No Physical Symptoms',
          'description_ru':
              'У вас нет заметных физических проблем от использования экранов. Вы не испытываете усталости глаз, головных болей или проблем со сном. Продолжайте придерживаться правила 20-20-20 (каждые 20 минут смотреть 20 секунд на расстояние 20 футов).',
          'description_en':
              'You have no noticeable physical problems from screen use. You do not experience eye strain, headaches, or sleep problems. Continue following the 20-20-20 rule (every 20 minutes look 20 seconds at 20 feet distance).',
        },
        'medium': {
          'title_ru': 'Умеренные физические симптомы',
          'title_en': 'Moderate Physical Symptoms',
          'description_ru':
              'Вы начинаете испытывать физические последствия: усталость глаз, легкие проблемы со сном, периодические боли в шее. Рекомендуется: сократить экранное время на 30%, использовать фильтр синего света, делать перерывы каждый час, улучшить эргономику рабочего места.',
          'description_en':
              'You are beginning to experience physical consequences: eye strain, mild sleep problems, occasional neck pain. Recommended: reduce screen time by 30%, use blue light filter, take breaks every hour, improve workplace ergonomics.',
        },
        'high': {
          'title_ru': 'Серьезные физические последствия',
          'title_en': 'Serious Physical Consequences',
          'description_ru':
              'У вас серьезные физические проблемы от использования экранов: хроническая усталость глаз, регулярные головные боли, проблемы со сном, боли в шее/спине/запястьях, ухудшение осанки. СРОЧНО требуется: консультация врача, сокращение экранного времени на 50%, эргономичное рабочее место, физические упражнения, рассмотрите e-ink устройства.',
          'description_en':
              'You have serious physical problems from screen use: chronic eye strain, regular headaches, sleep problems, neck/back/wrist pain, worsening posture. URGENTLY required: doctor consultation, 50% screen time reduction, ergonomic workplace, physical exercise, consider e-ink devices.',
        },
      },
      'productivity_loss': {
        'low': {
          'title_ru': 'Гаджеты не влияют на продуктивность',
          'title_en': 'Gadgets Do Not Affect Productivity',
          'description_ru':
              'Вы эффективно используете технологии как инструмент работы, не позволяя им отвлекать от важных задач. Вы не откладываете дела из-за соцсетей и поддерживаете высокую продуктивность. Отличный результат!',
          'description_en':
              'You effectively use technology as a work tool without letting it distract from important tasks. You do not procrastinate due to social media and maintain high productivity. Excellent result!',
        },
        'medium': {
          'title_ru': 'Умеренная потеря продуктивности',
          'title_en': 'Moderate Productivity Loss',
          'description_ru':
              'Гаджеты периодически отвлекают вас от работы. Вы иногда откладываете задачи, чтобы "быстро проверить" соцсети, и замечаете снижение эффективности. Рекомендуется: блокировщики приложений во время работы, метод Deep Work, работа без WiFi для важных задач.',
          'description_en':
              'Gadgets periodically distract you from work. You sometimes postpone tasks to "quickly check" social media and notice decreased efficiency. Recommended: app blockers during work, Deep Work method, work without WiFi for important tasks.',
        },
        'high': {
          'title_ru': 'Серьезная потеря продуктивности',
          'title_en': 'Serious Productivity Loss',
          'description_ru':
              'Гаджеты серьезно вредят вашей продуктивности. Вы постоянно откладываете важные дела, пропускаете дедлайны, тратите больше времени в гаджетах, чем планировали. Это влияет на карьеру и достижения. СРОЧНО: используйте блокировщики (Freedom, Cold Turkey), практикуйте 4 часа Deep Work без гаджетов, найдите accountability partner.',
          'description_en':
              'Gadgets seriously harm your productivity. You constantly postpone important tasks, miss deadlines, spend more time on gadgets than planned. This affects career and achievements. URGENT: use blockers (Freedom, Cold Turkey), practice 4 hours Deep Work without gadgets, find an accountability partner.',
        },
      },
      'emotional_state': {
        'low': {
          'title_ru': 'Эмоциональная стабильность',
          'title_en': 'Emotional Stability',
          'description_ru':
              'Технологии не влияют на ваше эмоциональное состояние. Вы не испытываете FOMO (страх упустить), не сравниваете себя с другими в соцсетях, не чувствуете тревоги без интернета. Это здоровая эмоциональная позиция.',
          'description_en':
              'Technology does not affect your emotional state. You do not experience FOMO (fear of missing out), do not compare yourself to others on social media, do not feel anxious without internet. This is a healthy emotional position.',
        },
        'medium': {
          'title_ru': 'Умеренное эмоциональное влияние',
          'title_en': 'Moderate Emotional Impact',
          'description_ru':
              'Технологии начинают влиять на ваши эмоции. Вы иногда чувствуете FOMO, сравниваете себя с другими, испытываете раздражение при прерывании. Рекомендуется: практиковать JOMO (радость упущенного), вести дневник благодарности, ограничить время в соцсетях.',
          'description_en':
              'Technology is beginning to affect your emotions. You sometimes feel FOMO, compare yourself to others, feel irritated when interrupted. Recommended: practice JOMO (joy of missing out), keep a gratitude journal, limit social media time.',
        },
        'high': {
          'title_ru': 'Серьезное эмоциональное влияние',
          'title_en': 'Serious Emotional Impact',
          'description_ru':
              'Технологии серьезно влияют на ваше эмоциональное благополучие. Вы постоянно испытываете FOMO, тревогу без интернета, зависть к жизни других, чувствуете себя хуже после соцсетей. Это может привести к депрессии и низкой самооценке. СРОЧНО: удалите соцсети на 60 дней, работайте с психологом над тревожностью, практикуйте mindfulness.',
          'description_en':
              'Technology seriously affects your emotional wellbeing. You constantly experience FOMO, anxiety without internet, envy of others\' lives, feel worse after social media. This can lead to depression and low self-esteem. URGENT: delete social media for 60 days, work with psychologist on anxiety, practice mindfulness.',
        },
      },
      'usage_patterns': {
        'low': {
          'title_ru': 'Умеренное использование',
          'title_en': 'Moderate Usage',
          'description_ru':
              'Ваши паттерны использования технологий здоровые. Вы проводите умеренное время перед экранами, не проверяете телефон сотни раз в день, не берете его в постель. Продолжайте поддерживать эти привычки.',
          'description_en':
              'Your technology usage patterns are healthy. You spend moderate time in front of screens, do not check your phone hundreds of times a day, do not take it to bed. Continue maintaining these habits.',
        },
        'medium': {
          'title_ru': 'Повышенное использование',
          'title_en': 'Increased Usage',
          'description_ru':
              'Ваши паттерны использования начинают становиться проблемными. Вы проводите 4-6 часов перед экранами, проверяете телефон 50-100 раз в день, используете его во время еды и перед сном. Рекомендуется установить лимиты времени и создать зоны без телефона.',
          'description_en':
              'Your usage patterns are becoming problematic. You spend 4-6 hours in front of screens, check your phone 50-100 times a day, use it during meals and before bed. Setting time limits and creating phone-free zones is recommended.',
        },
        'high': {
          'title_ru': 'Чрезмерное использование',
          'title_en': 'Excessive Usage',
          'description_ru':
              'Ваши паттерны использования указывают на серьезную зависимость. Вы проводите 6-8+ часов перед экранами, проверяете телефон более 100 раз в день или постоянно, берете его везде (в туалет, постель, во время еды). СРОЧНО: используйте физические блокировщики (kSafe), замените смартфон на простой телефон на 1-2 месяца, обратитесь к специалисту.',
          'description_en':
              'Your usage patterns indicate serious addiction. You spend 6-8+ hours in front of screens, check your phone more than 100 times a day or constantly, take it everywhere (bathroom, bed, during meals). URGENT: use physical blockers (kSafe), replace smartphone with basic phone for 1-2 months, consult a specialist.',
        },
      },
    };
  }

  /// Определить профиль на основе процентов по шкалам
  static String determineProfile(Map<String, double> percentages) {
    final factors = [
      'dependency_level',
      'attention_control',
      'social_impact',
      'physical_health',
      'productivity_loss',
      'emotional_state',
      'usage_patterns'
    ];

    double total = 0;
    int count = 0;
    for (final factor in factors) {
      if (percentages.containsKey(factor)) {
        total += percentages[factor]!;
        count++;
      }
    }

    final averageLevel = count > 0 ? total / count : 0.0;

    if (averageLevel <= 25) {
      return 'profile_healthy';
    } else if (averageLevel <= 45) {
      return 'profile_moderate_use';
    } else if (averageLevel <= 65) {
      // Определяем доминирующий фактор
      String? dominantFactor;
      double maxValue = 0;
      for (final factor in factors) {
        final value = percentages[factor] ?? 0;
        if (value > maxValue) {
          maxValue = value;
          dominantFactor = factor;
        }
      }

      switch (dominantFactor) {
        case 'dependency_level':
          return 'profile_addiction_focus';
        case 'attention_control':
          return 'profile_attention_focus';
        case 'social_impact':
          return 'profile_social_focus';
        case 'physical_health':
          return 'profile_health_focus';
        case 'productivity_loss':
          return 'profile_productivity_focus';
        case 'emotional_state':
          return 'profile_emotional_focus';
        case 'usage_patterns':
          return 'profile_usage_focus';
        default:
          return 'profile_problematic';
      }
    } else if (averageLevel <= 80) {
      return 'profile_severe';
    } else {
      return 'profile_critical';
    }
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Все профили для теста цифрового детокса
  static final Map<String, TestProfile> _profiles = {
    'profile_healthy': TestProfile(
      id: 'profile_healthy',
      name: {
        'ru': 'Здоровые отношения с технологиями',
        'en': 'Healthy Technology Relationship',
      },
      description: {
        'ru': 'У вас здоровые отношения с цифровыми устройствами. Вы контролируете технологии, а не они вас.',
        'en': 'You have a healthy relationship with digital devices. You control technology, not the other way around.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают низкий уровень зависимости по всем показателям: использование гаджетов, внимание, социальные связи, здоровье и продуктивность в норме.',
        'en': 'Your answers show low dependency levels across all indicators: device usage, attention, social connections, health and productivity are normal.',
      },
      strengths: {
        'ru': [
          'Контроль над использованием устройств',
          'Сохранённое внимание и концентрация',
          'Здоровые социальные связи оффлайн',
          'Хороший режим сна и физическое здоровье',
          'Высокая продуктивность',
        ],
        'en': [
          'Control over device usage',
          'Preserved attention and concentration',
          'Healthy offline social connections',
          'Good sleep and physical health',
          'High productivity',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможно недооцениваете время в телефоне',
          'Стресс может повысить использование',
        ],
        'en': [
          'May underestimate phone time',
          'Stress can increase usage',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте практики цифровой гигиены',
          'Периодически проверяйте экранное время',
          'Помогайте близким с их цифровыми привычками',
        ],
        'en': [
          'Continue digital hygiene practices',
          'Periodically check screen time',
          'Help loved ones with their digital habits',
        ],
      },
      tryToday: {
        'ru': 'Проведите один час без телефона, осознанно наслаждаясь моментом.',
        'en': 'Spend one hour without your phone, consciously enjoying the moment.',
      },
      inspiringConclusion: {
        'ru': 'Ваш контроль над технологиями — это суперсила в современном мире. Продолжайте быть хозяином своего внимания!',
        'en': 'Your control over technology is a superpower in the modern world. Keep being the master of your attention!',
      },
    ),

    'profile_moderate_use': TestProfile(
      id: 'profile_moderate_use',
      name: {
        'ru': 'Умеренное использование',
        'en': 'Moderate Use',
      },
      description: {
        'ru': 'У вас есть некоторые признаки чрезмерного использования технологий, но ситуация управляема. Небольшие изменения могут значительно улучшить качество жизни.',
        'en': 'You have some signs of excessive technology use, but the situation is manageable. Small changes can significantly improve quality of life.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают умеренное повышение некоторых показателей. Вы ещё контролируете ситуацию, но есть зоны роста.',
        'en': 'Your answers show moderate elevation in some indicators. You still control the situation, but there are areas for improvement.',
      },
      strengths: {
        'ru': [
          'Базовый контроль над использованием',
          'Осознание потенциальных проблем',
          'Ресурсы для изменений доступны',
        ],
        'en': [
          'Basic control over usage',
          'Awareness of potential problems',
          'Resources for change available',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Периодическая потеря времени в телефоне',
          'Иногда проверяете телефон машинально',
          'Небольшое влияние на сон или внимание',
        ],
        'en': [
          'Periodic time loss on phone',
          'Sometimes check phone automatically',
          'Slight impact on sleep or attention',
        ],
      },
      recommendations: {
        'ru': [
          'Установите лимиты экранного времени (приложения Screen Time, Digital Wellbeing)',
          'Создайте "зоны без телефона" (спальня, обеденный стол)',
          'Отключите несрочные уведомления',
          'Практикуйте "первый час без телефона" утром',
          'Замените бездумный скроллинг на конкретные активности',
        ],
        'en': [
          'Set screen time limits (Screen Time, Digital Wellbeing apps)',
          'Create "phone-free zones" (bedroom, dining table)',
          'Disable non-urgent notifications',
          'Practice "first hour without phone" in the morning',
          'Replace mindless scrolling with specific activities',
        ],
      },
      tryToday: {
        'ru': 'Отключите уведомления от 3 приложений, которые чаще всего отвлекают вас.',
        'en': 'Disable notifications from 3 apps that distract you most often.',
      },
      inspiringConclusion: {
        'ru': 'Маленькие изменения сейчас предотвратят большие проблемы потом. Вы уже на правильном пути к цифровому балансу!',
        'en': 'Small changes now will prevent big problems later. You are already on the right path to digital balance!',
      },
    ),

    'profile_addiction_focus': TestProfile(
      id: 'profile_addiction_focus',
      name: {
        'ru': 'Зависимость от устройств',
        'en': 'Device Dependency',
      },
      description: {
        'ru': 'Ваш основной симптом — зависимость от цифровых устройств. Вы испытываете дискомфорт без телефона, постоянно проверяете его, чувствуете тревогу при низком заряде.',
        'en': 'Your main symptom is digital device dependency. You experience discomfort without your phone, constantly check it, feel anxiety when battery is low.',
      },
      whyThisProfile: {
        'ru': 'Среди всех показателей у вас доминирует уровень зависимости от устройств.',
        'en': 'Among all indicators, device dependency level dominates.',
      },
      strengths: {
        'ru': [
          'Осознание проблемы — первый шаг',
          'Понимание механизмов зависимости',
          'Возможность постепенного снижения',
        ],
        'en': [
          'Problem awareness — first step',
          'Understanding dependency mechanisms',
          'Possibility of gradual reduction',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Номофобия — страх остаться без телефона',
          'Постоянная проверка телефона (100+ раз в день)',
          'Тревога при низком заряде батареи',
          'Фантомные вибрации',
        ],
        'en': [
          'Nomophobia — fear of being without phone',
          'Constant phone checking (100+ times a day)',
          'Anxiety when battery is low',
          'Phantom vibrations',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте "цифровые паузы" — 1 час без телефона в день',
          'Используйте физические блокировщики (kSafe) для телефона',
          'Переведите телефон в чёрно-белый режим (снижает привлекательность)',
          'Удалите самые "затягивающие" приложения на неделю',
          'Замените смартфон на простой телефон на выходные',
          'Носите наручные часы — уберите повод доставать телефон',
        ],
        'en': [
          'Practice "digital pauses" — 1 hour without phone daily',
          'Use physical blockers (kSafe) for phone',
          'Switch phone to grayscale mode (reduces attractiveness)',
          'Delete most addictive apps for a week',
          'Replace smartphone with basic phone on weekends',
          'Wear wristwatch — remove reason to take out phone',
        ],
      },
      tryToday: {
        'ru': 'Оставьте телефон в другой комнате на 2 часа. Заметьте, как часто вы хотите его проверить.',
        'en': 'Leave your phone in another room for 2 hours. Notice how often you want to check it.',
      },
      inspiringConclusion: {
        'ru': 'Зависимость от телефона — это не слабость, а результат дизайна приложений. Осознав это, вы можете взять контроль в свои руки.',
        'en': 'Phone addiction is not weakness, but a result of app design. Realizing this, you can take back control.',
      },
    ),

    'profile_attention_focus': TestProfile(
      id: 'profile_attention_focus',
      name: {
        'ru': 'Проблемы с вниманием',
        'en': 'Attention Problems',
      },
      description: {
        'ru': 'Ваш основной симптом — нарушение внимания. Вам сложно концентрироваться, вы постоянно отвлекаетесь на телефон, с трудом читаете длинные тексты.',
        'en': 'Your main symptom is attention impairment. You have difficulty concentrating, constantly get distracted by phone, struggle to read long texts.',
      },
      whyThisProfile: {
        'ru': 'Среди всех показателей у вас доминируют проблемы с контролем внимания.',
        'en': 'Among all indicators, attention control problems dominate.',
      },
      strengths: {
        'ru': [
          'Способность замечать отвлечения',
          'Понимание влияния на продуктивность',
          'Внимание поддаётся тренировке',
        ],
        'en': [
          'Ability to notice distractions',
          'Understanding impact on productivity',
          'Attention can be trained',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Фрагментированное внимание',
          'Трудности с длительной концентрацией',
          'Постоянные переключения между задачами',
          '"Мозг гуглера" — неспособность удержать информацию',
        ],
        'en': [
          'Fragmented attention',
          'Difficulty with sustained concentration',
          'Constant task switching',
          '"Google brain" — inability to retain information',
        ],
      },
      recommendations: {
        'ru': [
          'Техника Помодоро: 25 минут работы без телефона, 5 минут перерыв',
          'Режим "Не беспокоить" во время важных задач',
          'Читайте бумажные книги по 15 минут в день для тренировки внимания',
          'Медитация осознанности (10 минут в день) восстанавливает концентрацию',
          'Уберите телефон из поля зрения во время работы',
          'Одна задача за раз — никакой многозадачности',
        ],
        'en': [
          'Pomodoro technique: 25 minutes work without phone, 5 minutes break',
          '"Do Not Disturb" mode during important tasks',
          'Read paper books for 15 minutes daily to train attention',
          'Mindfulness meditation (10 minutes daily) restores concentration',
          'Remove phone from sight during work',
          'One task at a time — no multitasking',
        ],
      },
      tryToday: {
        'ru': 'Поработайте 25 минут над одной задачей без телефона рядом. Заметьте, как это влияет на качество работы.',
        'en': 'Work on one task for 25 minutes without phone nearby. Notice how it affects work quality.',
      },
      inspiringConclusion: {
        'ru': 'Внимание — это мышца, которую можно натренировать. Каждый момент концентрации укрепляет её. Вы можете вернуть контроль над своим разумом.',
        'en': 'Attention is a muscle that can be trained. Every moment of concentration strengthens it. You can regain control over your mind.',
      },
    ),

    'profile_social_focus': TestProfile(
      id: 'profile_social_focus',
      name: {
        'ru': 'Социальное влияние',
        'en': 'Social Impact',
      },
      description: {
        'ru': 'Ваш основной симптом — влияние технологий на социальные связи. Онлайн-общение заменяет реальное, вы сравниваете себя с другими в соцсетях, чувствуете FOMO.',
        'en': 'Your main symptom is technology impact on social connections. Online communication replaces real, you compare yourself to others on social media, feel FOMO.',
      },
      whyThisProfile: {
        'ru': 'Среди всех показателей у вас доминирует социальное влияние технологий.',
        'en': 'Among all indicators, social impact of technology dominates.',
      },
      strengths: {
        'ru': [
          'Ценность реальных отношений',
          'Понимание иллюзорности соцсетей',
          'Способность к реальным связям',
        ],
        'en': [
          'Value of real relationships',
          'Understanding illusion of social media',
          'Capacity for real connections',
        ],
      },
      vulnerabilities: {
        'ru': [
          'FOMO — страх упустить что-то',
          'Сравнение себя с "идеальными" жизнями',
          'Предпочтение онлайн-общения реальному',
          'Одиночество при наличии 1000 "друзей"',
        ],
        'en': [
          'FOMO — fear of missing out',
          'Comparing yourself to "perfect" lives',
          'Preferring online to real communication',
          'Loneliness despite 1000 "friends"',
        ],
      },
      recommendations: {
        'ru': [
          'Сократите подписки в соцсетях до людей, которых знаете лично',
          'Отключите ленту новостей в Facebook/Instagram (расширения браузера)',
          'Замените время в соцсетях на один реальный контакт в день',
          'Удалите приложения соцсетей — заходите только через браузер',
          'Помните: в соцсетях люди показывают лучшие моменты, не реальность',
          'Практикуйте JOMO — радость от пропущенного',
        ],
        'en': [
          'Reduce social media subscriptions to people you know personally',
          'Disable news feed on Facebook/Instagram (browser extensions)',
          'Replace social media time with one real contact daily',
          'Delete social media apps — access only through browser',
          'Remember: people show best moments on social media, not reality',
          'Practice JOMO — joy of missing out',
        ],
      },
      tryToday: {
        'ru': 'Позвоните или встретьтесь с одним человеком вместо лайков и комментариев.',
        'en': 'Call or meet one person instead of likes and comments.',
      },
      inspiringConclusion: {
        'ru': 'Реальные связи — это то, что делает жизнь осмысленной. Ни один лайк не заменит настоящий разговор. Инвестируйте в реальность!',
        'en': 'Real connections are what makes life meaningful. No like can replace a real conversation. Invest in reality!',
      },
    ),

    'profile_health_focus': TestProfile(
      id: 'profile_health_focus',
      name: {
        'ru': 'Влияние на здоровье',
        'en': 'Health Impact',
      },
      description: {
        'ru': 'Ваш основной симптом — физическое влияние технологий. Нарушения сна, боли в шее/спине, усталость глаз, малоподвижность.',
        'en': 'Your main symptom is physical impact of technology. Sleep disturbances, neck/back pain, eye strain, sedentary lifestyle.',
      },
      whyThisProfile: {
        'ru': 'Среди всех показателей у вас доминирует влияние на физическое здоровье.',
        'en': 'Among all indicators, physical health impact dominates.',
      },
      strengths: {
        'ru': [
          'Тело сигнализирует о проблеме',
          'Конкретные симптомы легче отслеживать',
          'Физические изменения быстро дают результат',
        ],
        'en': [
          'Body signals the problem',
          'Specific symptoms easier to track',
          'Physical changes quickly show results',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Нарушения сна из-за синего света',
          'Боли в шее и спине ("текстовая шея")',
          'Синдром сухого глаза, усталость глаз',
          'Малоподвижный образ жизни',
        ],
        'en': [
          'Sleep disturbances from blue light',
          'Neck and back pain ("text neck")',
          'Dry eye syndrome, eye strain',
          'Sedentary lifestyle',
        ],
      },
      recommendations: {
        'ru': [
          'Никаких экранов за час до сна — синий свет нарушает мелатонин',
          'Правило 20-20-20: каждые 20 минут смотрите на 20 метров 20 секунд',
          'Упражнения для шеи и спины каждый час',
          'Ночной режим на всех устройствах',
          'Не используйте телефон в постели',
          'Регулярная физическая активность компенсирует сидение',
        ],
        'en': [
          'No screens an hour before bed — blue light disrupts melatonin',
          '20-20-20 rule: every 20 minutes look at 20 meters for 20 seconds',
          'Neck and back exercises every hour',
          'Night mode on all devices',
          'Don\'t use phone in bed',
          'Regular physical activity compensates for sitting',
        ],
      },
      tryToday: {
        'ru': 'Установите ночной режим на телефоне и не используйте его в постели сегодня вечером.',
        'en': 'Set night mode on phone and don\'t use it in bed tonight.',
      },
      inspiringConclusion: {
        'ru': 'Ваше тело — ваш союзник. Слушайте его сигналы, и оно отплатит вам энергией и здоровьем для того, что действительно важно.',
        'en': 'Your body is your ally. Listen to its signals, and it will reward you with energy and health for what really matters.',
      },
    ),

    'profile_productivity_focus': TestProfile(
      id: 'profile_productivity_focus',
      name: {
        'ru': 'Потеря продуктивности',
        'en': 'Productivity Loss',
      },
      description: {
        'ru': 'Ваш основной симптом — потеря продуктивности из-за технологий. Прокрастинация в телефоне, "кроличьи норы" YouTube, невыполненные задачи.',
        'en': 'Your main symptom is productivity loss due to technology. Phone procrastination, YouTube rabbit holes, incomplete tasks.',
      },
      whyThisProfile: {
        'ru': 'Среди всех показателей у вас доминирует влияние на продуктивность.',
        'en': 'Among all indicators, productivity impact dominates.',
      },
      strengths: {
        'ru': [
          'Осознание потерянного времени',
          'Желание быть продуктивным',
          'Продуктивность восстанавливается быстро',
        ],
        'en': [
          'Awareness of lost time',
          'Desire to be productive',
          'Productivity recovers quickly',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Часы теряются в бездумном скроллинге',
          '"Кроличьи норы" YouTube и соцсетей',
          'Прокрастинация важных задач',
          'Переключение между телефоном и работой',
        ],
        'en': [
          'Hours lost in mindless scrolling',
          'YouTube and social media rabbit holes',
          'Procrastination of important tasks',
          'Switching between phone and work',
        ],
      },
      recommendations: {
        'ru': [
          'Блокировщики сайтов и приложений во время работы (Cold Turkey, Freedom)',
          'Телефон в другой комнате во время важных задач',
          'Утренняя работа ДО проверки телефона',
          'Установите конкретное "время для телефона" (например, 12:00 и 18:00)',
          'Отслеживайте экранное время — осознание уменьшает использование',
          'Замените "убийцы времени" на полезные приложения (аудиокниги, подкасты)',
        ],
        'en': [
          'Site and app blockers during work (Cold Turkey, Freedom)',
          'Phone in another room during important tasks',
          'Morning work BEFORE checking phone',
          'Set specific "phone time" (e.g., 12:00 and 18:00)',
          'Track screen time — awareness reduces usage',
          'Replace "time killers" with useful apps (audiobooks, podcasts)',
        ],
      },
      tryToday: {
        'ru': 'Установите блокировщик и заблокируйте отвлекающие сайты на 4 рабочих часа.',
        'en': 'Install a blocker and block distracting sites for 4 work hours.',
      },
      inspiringConclusion: {
        'ru': 'Каждый час, сэкономленный на скроллинге — это час на то, что действительно важно: проекты, отношения, здоровье. Верните себе своё время!',
        'en': 'Every hour saved from scrolling is an hour for what really matters: projects, relationships, health. Reclaim your time!',
      },
    ),

    'profile_emotional_focus': TestProfile(
      id: 'profile_emotional_focus',
      name: {
        'ru': 'Эмоциональное влияние',
        'en': 'Emotional Impact',
      },
      description: {
        'ru': 'Ваш основной симптом — эмоциональное влияние технологий. Тревога, раздражительность, зависимость от лайков, эмоциональные "качели" от соцсетей.',
        'en': 'Your main symptom is emotional impact of technology. Anxiety, irritability, like dependency, emotional "swings" from social media.',
      },
      whyThisProfile: {
        'ru': 'Среди всех показателей у вас доминирует влияние на эмоциональное состояние.',
        'en': 'Among all indicators, emotional state impact dominates.',
      },
      strengths: {
        'ru': [
          'Эмоциональная чувствительность',
          'Способность замечать триггеры',
          'Эмоции быстро восстанавливаются при детоксе',
        ],
        'en': [
          'Emotional sensitivity',
          'Ability to notice triggers',
          'Emotions recover quickly with detox',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Зависимость настроения от лайков и реакций',
          'Тревога при отключении от сети',
          'Раздражительность при невозможности проверить телефон',
          'Эмоциональное "выгорание" от соцсетей',
        ],
        'en': [
          'Mood dependency on likes and reactions',
          'Anxiety when disconnected',
          'Irritability when unable to check phone',
          'Emotional "burnout" from social media',
        ],
      },
      recommendations: {
        'ru': [
          'Осознанное использование: спрашивайте себя "зачем я открываю это приложение?"',
          'Отключите счётчики лайков (настройки Instagram)',
          'Практикуйте "эмоциональный детокс" — день без соцсетей',
          'Ведите дневник настроения до и после использования телефона',
          'Замените скроллинг на практики саморегуляции (дыхание, прогулка)',
          'Помните: ваша ценность не измеряется лайками',
        ],
        'en': [
          'Mindful usage: ask yourself "why am I opening this app?"',
          'Disable like counts (Instagram settings)',
          'Practice "emotional detox" — a day without social media',
          'Keep mood diary before and after phone use',
          'Replace scrolling with self-regulation practices (breathing, walking)',
          'Remember: your worth is not measured by likes',
        ],
      },
      tryToday: {
        'ru': 'Перед каждым открытием соцсетей спросите себя: "Что я хочу получить?" Если нет ответа — не открывайте.',
        'en': 'Before each social media opening ask: "What do I want to get?" If no answer — don\'t open.',
      },
      inspiringConclusion: {
        'ru': 'Ваши эмоции принадлежат вам, а не алгоритмам. Освободите их от дофаминовых ловушек, и вы обретёте настоящее эмоциональное благополучие.',
        'en': 'Your emotions belong to you, not algorithms. Free them from dopamine traps, and you will find true emotional well-being.',
      },
    ),

    'profile_usage_focus': TestProfile(
      id: 'profile_usage_focus',
      name: {
        'ru': 'Чрезмерное использование',
        'en': 'Excessive Usage',
      },
      description: {
        'ru': 'Ваш основной симптом — чрезмерные паттерны использования. Много часов экранного времени, использование в неподходящих местах (постель, туалет, еда).',
        'en': 'Your main symptom is excessive usage patterns. Many hours of screen time, use in inappropriate places (bed, bathroom, meals).',
      },
      whyThisProfile: {
        'ru': 'Среди всех показателей у вас доминируют проблемные паттерны использования устройств.',
        'en': 'Among all indicators, problematic device usage patterns dominate.',
      },
      strengths: {
        'ru': [
          'Конкретные паттерны легко изменить',
          'Осознание количества использования',
          'Возможность установить чёткие правила',
        ],
        'en': [
          'Specific patterns easy to change',
          'Awareness of usage amount',
          'Ability to set clear rules',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Экранное время 6+ часов в день',
          'Использование телефона в постели',
          'Телефон первым утром и последним вечером',
          'Использование во время еды и в туалете',
        ],
        'en': [
          'Screen time 6+ hours daily',
          'Phone use in bed',
          'Phone first in morning and last at night',
          'Use during meals and in bathroom',
        ],
      },
      recommendations: {
        'ru': [
          'Создайте "священные зоны" без телефона: спальня, обеденный стол, туалет',
          'Купите будильник — уберите телефон из спальни',
          'Правило "первый час без телефона" утром',
          'Правило "последний час без телефона" перед сном',
          'Физические ограничители: оставляйте телефон в определённом месте дома',
          'Отслеживайте экранное время и ставьте еженедельные цели снижения',
        ],
        'en': [
          'Create "sacred zones" without phone: bedroom, dining table, bathroom',
          'Buy alarm clock — remove phone from bedroom',
          '"First hour without phone" rule in morning',
          '"Last hour without phone" rule before bed',
          'Physical limiters: leave phone in specific place at home',
          'Track screen time and set weekly reduction goals',
        ],
      },
      tryToday: {
        'ru': 'Уберите телефон из спальни на ночь. Используйте обычный будильник.',
        'en': 'Remove phone from bedroom for the night. Use a regular alarm clock.',
      },
      inspiringConclusion: {
        'ru': 'Паттерны — это привычки, а привычки можно менять. Шаг за шагом вы создадите новые, здоровые привычки использования технологий.',
        'en': 'Patterns are habits, and habits can be changed. Step by step, you will create new, healthy technology habits.',
      },
    ),

    'profile_problematic': TestProfile(
      id: 'profile_problematic',
      name: {
        'ru': 'Проблемное использование',
        'en': 'Problematic Use',
      },
      description: {
        'ru': 'У вас проблемное использование технологий по нескольким показателям. Это требует комплексного подхода к изменениям.',
        'en': 'You have problematic technology use across several indicators. This requires a comprehensive approach to change.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают повышение по нескольким компонентам цифровой зависимости.',
        'en': 'Your answers show elevation across several digital dependency components.',
      },
      strengths: {
        'ru': [
          'Готовность к изменениям',
          'Осознание проблемы',
          'Комплексный подход даёт лучшие результаты',
        ],
        'en': [
          'Readiness for change',
          'Problem awareness',
          'Comprehensive approach gives better results',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Множественные симптомы цифровой зависимости',
          'Влияние на разные сферы жизни',
          'Риск ухудшения без изменений',
        ],
        'en': [
          'Multiple digital dependency symptoms',
          'Impact on different life areas',
          'Risk of worsening without changes',
        ],
      },
      recommendations: {
        'ru': [
          'Начните с 30-дневного цифрового детокса (книга "Digital Minimalism")',
          'Удалите все соцсети на месяц — оцените, чего вам не хватает',
          'Установите жёсткие лимиты экранного времени (2-3 часа в день)',
          'Создайте "день без телефона" раз в неделю',
          'Найдите оффлайн-хобби, которое заменит время в телефоне',
          'Рассмотрите консультацию со специалистом по цифровой зависимости',
        ],
        'en': [
          'Start with 30-day digital detox (book "Digital Minimalism")',
          'Delete all social media for a month — assess what you miss',
          'Set strict screen time limits (2-3 hours daily)',
          'Create "phone-free day" once a week',
          'Find offline hobby to replace phone time',
          'Consider consultation with digital addiction specialist',
        ],
      },
      tryToday: {
        'ru': 'Удалите одно приложение, которое больше всего крадёт ваше время. Оцените через неделю.',
        'en': 'Delete one app that steals most of your time. Evaluate in a week.',
      },
      inspiringConclusion: {
        'ru': 'Вы осознали проблему — это уже победа. Комплексные изменения требуют времени, но они возможны. Шаг за шагом вы вернёте контроль над своей жизнью.',
        'en': 'You recognized the problem — this is already a victory. Comprehensive changes take time, but they are possible. Step by step, you will regain control over your life.',
      },
    ),

    'profile_severe': TestProfile(
      id: 'profile_severe',
      name: {
        'ru': 'Серьёзная зависимость',
        'en': 'Severe Dependency',
      },
      description: {
        'ru': 'У вас серьёзная цифровая зависимость. Технологии значительно влияют на здоровье, отношения и продуктивность. Требуются активные меры.',
        'en': 'You have serious digital dependency. Technology significantly affects health, relationships and productivity. Active measures required.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают высокий уровень по большинству компонентов цифровой зависимости.',
        'en': 'Your answers show high levels across most digital dependency components.',
      },
      strengths: {
        'ru': [
          'Честность с собой о серьёзности',
          'Готовность к радикальным изменениям',
          'Даже серьёзная зависимость преодолима',
        ],
        'en': [
          'Honesty with yourself about seriousness',
          'Readiness for radical changes',
          'Even serious dependency is overcomable',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Серьёзное влияние на все сферы жизни',
          'Физические и эмоциональные проблемы',
          'Нарушенные социальные связи',
          'Потеря продуктивности',
        ],
        'en': [
          'Serious impact on all life areas',
          'Physical and emotional problems',
          'Disrupted social connections',
          'Lost productivity',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите полный 30-60 дневный детокс от смартфона',
          'Замените смартфон на простой телефон на 1-2 месяца',
          'Используйте физические блокировщики (kSafe, router settings)',
          'Обратитесь к психологу — зависимость требует профессиональной помощи',
          'Расскажите близким — вам нужна поддержка',
          'Создайте среду, где технологии физически недоступны',
        ],
        'en': [
          'Consider full 30-60 day smartphone detox',
          'Replace smartphone with basic phone for 1-2 months',
          'Use physical blockers (kSafe, router settings)',
          'See psychologist — addiction requires professional help',
          'Tell loved ones — you need support',
          'Create environment where technology is physically unavailable',
        ],
      },
      tryToday: {
        'ru': 'Попросите близкого человека помочь вам установить ограничения и контролировать их соблюдение.',
        'en': 'Ask a loved one to help you set limits and monitor compliance.',
      },
      inspiringConclusion: {
        'ru': 'Зависимость — это не приговор. Тысячи людей преодолели её и нашли баланс. С правильной помощью и поддержкой вы тоже сможете.',
        'en': 'Addiction is not a sentence. Thousands of people have overcome it and found balance. With proper help and support, you can too.',
      },
    ),

    'profile_critical': TestProfile(
      id: 'profile_critical',
      name: {
        'ru': 'Критическая зависимость',
        'en': 'Critical Dependency',
      },
      description: {
        'ru': 'У вас критический уровень цифровой зависимости. Это состояние требует немедленного и серьёзного вмешательства.',
        'en': 'You have critical level of digital dependency. This condition requires immediate and serious intervention.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают экстремально высокий уровень по большинству или всем компонентам.',
        'en': 'Your answers show extremely high levels across most or all components.',
      },
      strengths: {
        'ru': [
          'Вы прошли этот тест — значит, осознаёте проблему',
          'Даже критическая зависимость преодолима',
          'Радикальные меры дают быстрый результат',
        ],
        'en': [
          'You took this test — meaning you recognize the problem',
          'Even critical dependency is overcomable',
          'Radical measures give quick results',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Критическое влияние на здоровье',
          'Серьёзные проблемы с отношениями',
          'Полная потеря продуктивности',
          'Эмоциональная дисрегуляция',
        ],
        'en': [
          'Critical health impact',
          'Serious relationship problems',
          'Complete productivity loss',
          'Emotional dysregulation',
        ],
      },
      recommendations: {
        'ru': [
          'НЕМЕДЛЕННО: полный отказ от смартфона на 30 дней',
          'Обратитесь к специалисту по поведенческим зависимостям',
          'Рассмотрите программы цифрового детокса с проживанием',
          'Физическая изоляция от устройств (отдайте родственникам)',
          'Замените все цифровые развлечения на физические активности',
          'Создайте систему подотчётности с близкими',
        ],
        'en': [
          'IMMEDIATELY: complete smartphone rejection for 30 days',
          'See behavioral addiction specialist',
          'Consider residential digital detox programs',
          'Physical isolation from devices (give to relatives)',
          'Replace all digital entertainment with physical activities',
          'Create accountability system with loved ones',
        ],
      },
      tryToday: {
        'ru': 'Отдайте смартфон родственнику или другу на хранение. Используйте простой телефон для звонков.',
        'en': 'Give smartphone to relative or friend for safekeeping. Use basic phone for calls.',
      },
      inspiringConclusion: {
        'ru': 'Вы в точке, где изменения необходимы. Но каждый день без зависимости — это шаг к свободе. Вы заслуживаете жизнь, где вы управляете технологиями, а не они вами.',
        'en': 'You are at a point where change is necessary. But every day without addiction is a step toward freedom. You deserve a life where you control technology, not vice versa.',
      },
    ),
  };
}
