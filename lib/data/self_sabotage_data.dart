import '../models/test_model.dart';
import '../models/test_profile_model.dart';

class SelfSabotageData {
  /// Get the complete test model
  static TestModel getTestData() {
    return TestModel(
      id: 'self_sabotage_how_you_block_yourself_v1',
      title: {
        'ru': 'Самосаботаж: в чём ты сам себе ставишь палки в колёса?',
        'en': 'Self-Sabotage: How You Get in Your Own Way',
      },
      description: {
        'ru':
            'Тест помогает выявить паттерны поведения, которые мешают достижению целей: прокрастинация, токсичные отношения, самообесценивание и страх успеха/неудачи',
        'en':
            'This test helps identify behavioral patterns that undermine goal achievement: procrastination, toxic relationships, self-devaluation, and fear of success/failure',
      },
      category: {
        'ru': 'Эмоциональные состояния',
        'en': 'Emotional States',
      },
      categoryId: 'emotional',
      questions: _buildQuestions(),
      estimatedTime: 7,
      type: TestType.multiFactor,
      factorIds: [
        'procrastination_avoidance',
        'toxic_relationship_patterns',
        'self_devaluation',
        'fear_success_failure',
      ],
      disclaimer: _disclaimer,
    );
  }

  static final Map<String, String> _disclaimer = {
    'ru':
        'Этот тест предназначен для самопознания и выявления паттернов поведения, которые могут мешать достижению целей. Он НЕ является клиническим инструментом диагностики. Если вы испытываете серьёзные трудности с мотивацией, самооценкой или отношениями, обратитесь к психологу.',
    'en':
        'This test is designed for self-awareness and identifying behavioral patterns that may hinder goal achievement. It is NOT a clinical diagnostic tool. If you experience serious difficulties with motivation, self-esteem, or relationships, please consult a psychologist.',
  };

  /// Build all 24 questions
  static List<QuestionModel> _buildQuestions() {
    return [
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я часто жду «настроения» или особого вдохновения, чтобы наконец взяться за важное дело.',
          'en': 'I often wait for the \'right mood\' or special inspiration before finally starting an important task.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'procrastination_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'В начале дня я обычно делаю самое лёгкое и приятное, а важные задачи откладываю «на потом».',
          'en': 'At the start of the day, I usually do the easiest and most pleasant things, putting important tasks off \'for later\'.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'procrastination_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я хватаюсь за важные дела только тогда, когда дедлайн уже совсем близко.',
          'en': 'I only really get to important tasks when the deadline is very close.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'procrastination_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Если появляется что-то важное, я могу быстро отложить отвлекающие вещи и перейти к делу.',
          'en': 'When something important comes up, I can quickly put aside distractions and get down to it.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'procrastination_avoidance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Телефон, соцсети или случайные мелочи часто «съедают» время, которое я планировал(а) потратить на важные дела.',
          'en': 'My phone, social media, or random little tasks often \'eat up\' the time I meant to spend on important things.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'procrastination_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'В моих списках дел одни и те же важные пункты могут перекочёвывать из дня в день, не закрываясь.',
          'en': 'On my to-do lists, the same important items can move from day to day without getting done.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'procrastination_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я склонен(на) оправдывать чужое грубое или обесценивающее поведение тем, что «у человека просто тяжёлый период».',
          'en': 'I tend to excuse other people’s rude or demeaning behavior by telling myself they’re \'just going through a tough time\'.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'toxic_relationship_patterns',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я продолжаю общаться с людьми, после которых чувствую себя хуже, лишь бы не устраивать конфликт.',
          'en': 'I keep in touch with people who make me feel worse afterward, just to avoid conflict.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'toxic_relationship_patterns',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'В компании я часто оказываюсь тем, кто выслушивает чужие проблемы, но почти не говорит о своих.',
          'en': 'In groups, I often end up being the one who listens to everyone’s problems but rarely talks about my own.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'toxic_relationship_patterns',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Если человек раз за разом плохо ко мне относится, я могу спокойно дистанцироваться, даже если это неприятно.',
          'en': 'If someone repeatedly treats me badly, I can calmly distance myself from them, even if it feels unpleasant.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'toxic_relationship_patterns',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'После общения с некоторыми людьми я чувствую себя хуже, но всё равно ищу их одобрения.',
          'en': 'After interacting with certain people, I feel worse about myself yet still seek their approval.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'toxic_relationship_patterns',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Мне знакомо чувство, что я снова выбираю людей, которых надо «спасать» или «чинить».',
          'en': 'I often feel like I’m once again choosing people who need to be \'saved\' or \'fixed\'.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'toxic_relationship_patterns',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'После успеха я часто думаю, что мне просто повезло и это не настоящие заслуги.',
          'en': 'After a success, I often think I just got lucky and it’s not real merit.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'self_devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Комплименты в мой адрес вызывают у меня неловкость, и мне хочется их обесценить или перевести в шутку.',
          'en': 'Compliments make me feel awkward and I want to downplay them or turn them into a joke.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'self_devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Когда я сравниваю себя с другими, мои достижения кажутся мне незначительными.',
          'en': 'When I compare myself to others, my achievements seem insignificant.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'self_devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я умею по-настоящему радоваться своим достижениям и принимать их без «но».',
          'en': 'I’m able to genuinely celebrate my achievements and accept them without a \'but\'.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'self_devaluation',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я редко отмечаю свои достижения — чаще просто перехожу к следующей задаче.',
          'en': 'I rarely mark or celebrate my achievements — I usually just move on to the next task.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'self_devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Мне проще вспоминать свои ошибки, чем то, что у меня получилось хорошо.',
          'en': 'It’s easier for me to remember my mistakes than the things I’ve done well.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'self_devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Иногда я не начинаю перспективные проекты, потому что боюсь не справиться.',
          'en': 'Sometimes I don’t start promising projects because I’m afraid I won’t handle them.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'fear_success_failure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Даже приятная мысль об успехе иногда вызывает тревогу: вдруг от меня начнут слишком много ждать.',
          'en': 'Even the pleasant idea of success sometimes makes me anxious: what if people start expecting too much from me?',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'fear_success_failure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Увидев интересную возможность (конкурс, вакансию, совместный проект), я думаю «это не для меня» и прохожу мимо.',
          'en': 'When I see an interesting opportunity (a contest, job opening, or collab), I think \'this is not for me\' and pass it by.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'fear_success_failure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Если важное дело не получается с первого раза, я всё равно готов(а) пробовать ещё.',
          'en': 'If something important doesn’t work out on the first try, I’m still willing to try again.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'fear_success_failure',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Иногда я как будто специально вкладываюсь «не на максимум», чтобы в случае провала можно было списать это на отсутствие усилий.',
          'en': 'Sometimes I deliberately don’t give my best so that, if I fail, I can blame it on not trying hard enough.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'fear_success_failure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Когда я представляю, что у меня получается то, чего я хочу, помимо радости появляется тревога, что «что-то пойдёт не так».',
          'en': 'When I imagine actually getting what I want, I feel not only joy but also anxiety that \'something will go wrong\'.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'fear_success_failure',
        isReversed: false,
      ),
    ];
  }

  /// Build standard frequency answers (0-4: Never to Always)
  static List<AnswerModel> _buildFrequencyAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {'ru': 'Никогда', 'en': 'Never'},
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {'ru': 'Редко', 'en': 'Rarely'},
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {'ru': 'Иногда', 'en': 'Sometimes'},
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {'ru': 'Часто', 'en': 'Often'},
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {'ru': 'Всегда', 'en': 'Always'},
        score: 4,
      ),
    ];
  }

  static final List<TestProfile> _profiles = [
    // Profile 1: Very Low Sabotage (0-24%)
    TestProfile(
      id: 'very_low_sabotage',
      name: {
        'ru': 'Конструктивный путь',
        'en': 'Constructive Path',
      },
      description: {
        'ru':
            'Ваш уровень самосаботажа минимален. Вы способны ставить цели и достигать их, не создавая себе искусственных препятствий.',
        'en':
            'Your self-sabotage level is minimal. You can set goals and achieve them without creating artificial obstacles.',
      },
      whyThisProfile: {
        'ru':
            'Ваш низкий балл по всем 4 шкалам указывает на отсутствие значимых паттернов самосаботажа.',
        'en':
            'Your low scores across all 4 scales indicate absence of significant self-sabotage patterns.',
      },
      strengths: {
        'ru': [
          'Способность доводить начатое до конца',
          'Здоровые отношения с чёткими границами',
          'Реалистичная оценка своих достижений',
        ],
        'en': [
          'Ability to follow through',
          'Healthy relationships with clear boundaries',
          'Realistic assessment of achievements',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск недооценить сложность стоящих задач',
          'Возможное непонимание трудностей других людей',
        ],
        'en': [
          'Risk of underestimating task complexity',
          'Possible lack of understanding others\' struggles',
        ],
      },
      recommendations: {
        'ru': [
          'Используйте свои навыки для помощи другим',
          'Оставайтесь внимательными к эмоциональным потребностям',
          'Развивайте эмпатию к тем, кто борется с прокрастинацией',
        ],
        'en': [
          'Use your skills to help others',
          'Stay attentive to emotional needs',
          'Develop empathy for those struggling with procrastination',
        ],
      },
      tryToday: {
        'ru':
            'Помогите кому-то разобраться с задачей, которую они давно откладывают',
        'en':
            'Help someone tackle a task they\'ve been postponing',
      },
      inspiringConclusion: {
        'ru':
            'Ваша способность не мешать самому себе — это дар. Продолжайте двигаться вперёд!',
        'en':
            'Your ability not to stand in your own way is a gift. Keep moving forward!',
      },
    ),

    // Profile 2: Moderate Sabotage (25-49%)
    TestProfile(
      id: 'moderate_sabotage',
      name: {
        'ru': 'Осознанная борьба',
        'en': 'Conscious Struggle',
      },
      description: {
        'ru':
            'У вас присутствуют некоторые паттерны самосаботажа, но они ещё не стали доминирующими.',
        'en':
            'You have some self-sabotage patterns, but they haven\'t become dominant yet.',
      },
      whyThisProfile: {
        'ru':
            'Ваши баллы находятся в среднем диапазоне, указывая на эпизодический самосаботаж.',
        'en':
            'Your scores are in the moderate range, indicating episodic self-sabotage.',
      },
      strengths: {
        'ru': [
          'Осознанность — вы видите проблему',
          'Гибкость в изменении привычек',
          'Частичный успех в некоторых областях',
        ],
        'en': [
          'Awareness — you see the problem',
          'Flexibility in changing habits',
          'Partial success in some areas',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск застрять на этапе осознания',
          'Склонность оправдывать саботаж',
          'Возможная непоследовательность',
        ],
        'en': [
          'Risk of getting stuck at awareness stage',
          'Tendency to justify sabotage',
          'Possible inconsistency',
        ],
      },
      recommendations: {
        'ru': [
          'Выберите ОДНУ область для фокусировки',
          'Ведите дневник саботажа',
          'Создайте систему раннего предупреждения',
          'Отмечайте маленькие победы',
        ],
        'en': [
          'Choose ONE area to focus on',
          'Keep a sabotage journal',
          'Create an early warning system',
          'Celebrate small victories',
        ],
      },
      tryToday: {
        'ru':
            'Выберите одну задачу, которую откладываете. Разбейте на 3 микрошага и выполните первый',
        'en':
            'Choose one task you\'ve been postponing. Break it into 3 micro-steps and complete the first',
      },
      inspiringConclusion: {
        'ru':
            'Вы на правильном пути. Осознание проблемы — это уже половина решения!',
        'en':
            'You\'re on the right path. Awareness is already half the solution!',
      },
    ),

    // Profile 3: Elevated Sabotage (50-74%)
    TestProfile(
      id: 'elevated_sabotage',
      name: {
        'ru': 'Критическая зона',
        'en': 'Critical Zone',
      },
      description: {
        'ru':
            'Самосаботаж стал значимой частью вашей жизни и серьёзно мешает достижению целей.',
        'en':
            'Self-sabotage has become a significant part of your life and seriously hinders goal achievement.',
      },
      whyThisProfile: {
        'ru':
            'Высокие баллы по большинству шкал указывают на системную проблему.',
        'en':
            'High scores on most scales indicate a systemic problem.',
      },
      strengths: {
        'ru': [
          'Вы прошли этот тест — это акт смелости',
          'У вас есть потенциал для глубоких трансформаций',
          'Ваш опыт может стать ресурсом для других',
        ],
        'en': [
          'You took this test — that\'s an act of courage',
          'You have potential for deep transformations',
          'Your experience can become a resource for others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Высокий риск хронической депрессии и тревоги',
          'Склонность к токсичным отношениям',
          'Низкая самооценка и чувство застревания',
        ],
        'en': [
          'High risk of chronic depression and anxiety',
          'Tendency toward toxic relationships',
          'Low self-esteem and feeling stuck',
        ],
      },
      recommendations: {
        'ru': [
          'СРОЧНО: обратитесь к психотерапевту',
          'Рассмотрите КПТ или схема-терапию',
          'Начните с малого: ежедневные микрошаги',
          'Создайте сеть безопасности из 2-3 человек',
          'Минимизируйте токсичные отношения',
        ],
        'en': [
          'URGENT: consult a psychotherapist',
          'Consider CBT or schema therapy',
          'Start small: daily micro-steps',
          'Create a safety net of 2-3 people',
          'Minimize toxic relationships',
        ],
      },
      tryToday: {
        'ru':
            'Запишите одно убеждение, которое мешает. Найдите доказательство, что это интерпретация, а не факт',
        'en':
            'Write down one belief holding you back. Find proof it\'s interpretation, not fact',
      },
      inspiringConclusion: {
        'ru':
            'То, что вы чувствуете сейчас — не приговор. Это точка, из которой можно начать путь назад.',
        'en':
            'What you feel now is not a sentence. It\'s a point from which you can start the journey back.',
      },
    ),

    // Profile 4: High Sabotage (75-100%)
    TestProfile(
      id: 'high_sabotage',
      name: {
        'ru': 'Срочная помощь',
        'en': 'Urgent Help Needed',
      },
      description: {
        'ru':
            'Уровень самосаботажа критически высокий и требует немедленного вмешательства специалиста.',
        'en':
            'Self-sabotage level is critically high and requires immediate professional intervention.',
      },
      whyThisProfile: {
        'ru':
            'Ваши баллы по всем шкалам находятся в критическом диапазоне.',
        'en':
            'Your scores on all scales are in the critical range.',
      },
      strengths: {
        'ru': [
          'То, что вы дошли до этого теста — огромный акт мужества',
          'Вы ещё ищете ответы',
          'У вас есть потенциал для радикальной трансформации',
        ],
        'en': [
          'That you made it to this test is a huge act of courage',
          'You\'re still seeking answers',
          'You have potential for radical transformation',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Крайне высокий риск суицидальных мыслей',
          'Вероятность зависимостей как способа справиться',
          'Полная социальная изоляция',
          'Чувство безнадёжности',
        ],
        'en': [
          'Extremely high risk of suicidal thoughts',
          'Likelihood of addictions as coping mechanism',
          'Complete social isolation',
          'Feeling of hopelessness',
        ],
      },
      recommendations: {
        'ru': [
          'КРИТИЧЕСКИ ВАЖНО: обратитесь к психотерапевту СЕГОДНЯ',
          'При суицидальных мыслях — позвоните на горячую линию НЕМЕДЛЕННО',
          'Не пытайтесь справиться силой воли',
          'Создайте минимальный распорядок дня',
          'Не сравнивайте себя с другими',
        ],
        'en': [
          'CRITICALLY IMPORTANT: consult a psychotherapist TODAY',
          'If suicidal thoughts — call hotline IMMEDIATELY',
          'Don\'t try to cope by willpower alone',
          'Create minimal daily routine',
          'Don\'t compare yourself to others',
        ],
      },
      tryToday: {
        'ru':
            'Найдите номер кризисной психологической службы и сохраните его',
        'en':
            'Find crisis psychological service number and save it',
      },
      inspiringConclusion: {
        'ru':
            'То, что вы чувствуете — невыносимо. Но вы не одиноки. Обратитесь за помощью.',
        'en':
            'What you feel is unbearable. But you\'re not alone. Seek help.',
      },
    ),
  ];

  /// Determines profile based on composite self_sabotage_index
  static String determineProfile(Map<String, double> percentages) {
    // Calculate composite index (average of 4 normalized scales)
    final procrastination = percentages['procrastination_avoidance'] ?? 0.0;
    final toxicRelationships = percentages['toxic_relationship_patterns'] ?? 0.0;
    final selfDevaluation = percentages['self_devaluation'] ?? 0.0;
    final fearSuccessFailure = percentages['fear_success_failure'] ?? 0.0;

    final selfSabotageIndex =
        (procrastination + toxicRelationships + selfDevaluation + fearSuccessFailure) / 4;

    // Determine profile based on thresholds
    if (selfSabotageIndex < 25) {
      return 'very_low_sabotage'; // 0-24%
    } else if (selfSabotageIndex < 50) {
      return 'moderate_sabotage'; // 25-49%
    } else if (selfSabotageIndex < 75) {
      return 'elevated_sabotage'; // 50-74%
    } else {
      return 'high_sabotage'; // 75-100%
    }
  }

  /// Get factor names for all 4 scales
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'procrastination_avoidance': {
        'ru': 'Прокрастинация и избегание',
        'en': 'Procrastination & Avoidance',
      },
      'toxic_relationship_patterns': {
        'ru': 'Токсичные паттерны в отношениях',
        'en': 'Toxic Relationship Patterns',
      },
      'self_devaluation': {
        'ru': 'Самообесценивание',
        'en': 'Self-Devaluation',
      },
      'fear_success_failure': {
        'ru': 'Страх успеха и неудачи',
        'en': 'Fear of Success & Failure',
      },
    };
  }

  /// Get factor interpretation based on percentage score
  static Map<String, String> getFactorInterpretation(
    String factorId,
    double percentage,
  ) {
    // Thresholds: Low (0-24), Moderate (25-49), Elevated (50-74), High (75-100)
    final level = percentage < 25
        ? 'low'
        : percentage < 50
            ? 'moderate'
            : percentage < 75
                ? 'elevated'
                : 'high';

    final interpretations = {
      'procrastination_avoidance': {
        'low': {
          'ru': 'Вы редко откладываете важные дела',
          'en': 'You rarely postpone important tasks',
        },
        'moderate': {
          'ru': 'Иногда откладываете дела, но это не критично',
          'en': 'You sometimes postpone tasks, but it\'s not critical',
        },
        'elevated': {
          'ru': 'Прокрастинация стала устойчивой привычкой',
          'en': 'Procrastination has become a persistent habit',
        },
        'high': {
          'ru': 'Критический уровень прокрастинации',
          'en': 'Critical procrastination level',
        },
      },
      'toxic_relationship_patterns': {
        'low': {
          'ru': 'Вы выстраиваете здоровые отношения',
          'en': 'You build healthy relationships',
        },
        'moderate': {
          'ru': 'Иногда застреваете в неконструктивных отношениях',
          'en': 'You sometimes get stuck in unconstructive relationships',
        },
        'elevated': {
          'ru': 'Склонны выбирать токсичные отношения',
          'en': 'You tend to choose toxic relationships',
        },
        'high': {
          'ru': 'Критический уровень токсичных паттернов',
          'en': 'Critical level of toxic patterns',
        },
      },
      'self_devaluation': {
        'low': {
          'ru': 'Вы признаёте свои достижения',
          'en': 'You acknowledge your achievements',
        },
        'moderate': {
          'ru': 'Иногда обесцениваете себя',
          'en': 'You sometimes devalue yourself',
        },
        'elevated': {
          'ru': 'Склонны обесценивать достижения',
          'en': 'You tend to devalue achievements',
        },
        'high': {
          'ru': 'Критический уровень самообесценивания',
          'en': 'Critical self-devaluation level',
        },
      },
      'fear_success_failure': {
        'low': {
          'ru': 'Вы не боитесь ни успеха, ни неудачи',
          'en': 'You fear neither success nor failure',
        },
        'moderate': {
          'ru': 'Иногда страх сдерживает вас',
          'en': 'Fear sometimes holds you back',
        },
        'elevated': {
          'ru': 'Страх мешает достигать целей',
          'en': 'Fear prevents achieving goals',
        },
        'high': {
          'ru': 'Критический уровень страха',
          'en': 'Critical fear level',
        },
      },
    };

    return interpretations[factorId]?[level] ??
        {'ru': 'Нет интерпретации', 'en': 'No interpretation'};
  }

  /// Get profile by ID
  static TestProfile? getProfile(String profileId) {
    try {
      return _profiles.firstWhere((profile) => profile.id == profileId);
    } catch (e) {
      return null;
    }
  }
}
