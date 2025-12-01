import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Данные для теста "Личные границы и People-Pleasing"
///
/// 48 вопросов, 6 шкал по 8 вопросов:
/// 1. Ассертивность (Q1-8, reversed: 2,4,6,8)
/// 2. Приоритет своих потребностей (Q9-16, reversed: 10,12,14,16)
/// 3. Эмоциональная автономия (Q17-24, reversed: 18,20,22,24)
/// 4. Угождение другим (Q25-32, все прямые)
/// 5. Страх отвержения (Q33-40, все прямые)
/// 6. Ясность границ (Q41-48, reversed: 42,44,46,48)
class BoundariesPeoplePleasingData {
  static TestModel getBoundariesPeoplePleasingTest() {
    return TestModel(
      id: 'boundaries_people_pleasing',
      title: {
        'ru': 'Личные границы и People-Pleasing',
        'en': 'Personal Boundaries and People-Pleasing',
      },
      description: {
        'ru': 'Тест помогает выявить паттерны нарушения личных границ и склонность к угождению другим',
        'en': 'Test helps identify patterns of boundary violations and people-pleasing tendencies',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: [
        'assertiveness',
        'self_prioritization',
        'emotional_autonomy',
        'people_pleasing',
        'fear_of_rejection',
        'boundary_clarity',
      ],
      questions: _getQuestions(),
    );
  }

  static List<QuestionModel> _getQuestions() {
    final answers = _getLikertAnswers();

    return [
      // === ШКАЛА 1: Ассертивность (Q1-8) ===
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я легко выражаю свои потребности и желания.',
          'en': 'I easily express my needs and wants.',
        },
        answers: answers,
        factorId: 'assertiveness',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Мне сложно высказывать несогласие с чужим мнением.',
          'en': 'I find it hard to disagree with others\' opinions.',
        },
        answers: answers,
        factorId: 'assertiveness',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я могу настоять на своём, даже если это вызывает напряжение.',
          'en': 'I can stand my ground even if it creates tension.',
        },
        answers: answers,
        factorId: 'assertiveness',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я избегаю конфликтов, даже когда мои права нарушены.',
          'en': 'I avoid conflicts even when my rights are violated.',
        },
        answers: answers,
        factorId: 'assertiveness',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Я уверенно говорю «нет», когда что-то не подходит мне.',
          'en': 'I confidently say "no" when something doesn\'t suit me.',
        },
        answers: answers,
        factorId: 'assertiveness',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Мне трудно отказать людям, даже если мне неудобно.',
          'en': 'I find it hard to refuse people, even when it\'s inconvenient.',
        },
        answers: answers,
        factorId: 'assertiveness',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я защищаю свои границы, не чувствуя вины.',
          'en': 'I defend my boundaries without feeling guilty.',
        },
        answers: answers,
        factorId: 'assertiveness',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я чувствую себя неуютно, когда приходится отстаивать своё мнение.',
          'en': 'I feel uncomfortable when I have to defend my opinion.',
        },
        answers: answers,
        factorId: 'assertiveness',
        isReversed: true,
      ),

      // === ШКАЛА 2: Приоритет своих потребностей (Q9-16) ===
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я забочусь о своих потребностях так же, как о потребностях других.',
          'en': 'I take care of my needs as much as others\' needs.',
        },
        answers: answers,
        factorId: 'self_prioritization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я жертвую своими интересами ради других.',
          'en': 'I sacrifice my interests for others.',
        },
        answers: answers,
        factorId: 'self_prioritization',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я уделяю время себе, не чувствуя вины.',
          'en': 'I spend time on myself without feeling guilty.',
        },
        answers: answers,
        factorId: 'self_prioritization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Мне кажется эгоистичным ставить свои нужды на первое место.',
          'en': 'I think it\'s selfish to put my needs first.',
        },
        answers: answers,
        factorId: 'self_prioritization',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я позволяю себе отдыхать, когда чувствую усталость.',
          'en': 'I allow myself to rest when I feel tired.',
        },
        answers: answers,
        factorId: 'self_prioritization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я чувствую себя обязанным помогать всем, кто просит.',
          'en': 'I feel obligated to help everyone who asks.',
        },
        answers: answers,
        factorId: 'self_prioritization',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я принимаю решения исходя из своих ценностей, а не ожиданий других.',
          'en': 'I make decisions based on my values, not others\' expectations.',
        },
        answers: answers,
        factorId: 'self_prioritization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я откладываю свои дела ради просьб других людей.',
          'en': 'I postpone my tasks to fulfill others\' requests.',
        },
        answers: answers,
        factorId: 'self_prioritization',
        isReversed: true,
      ),

      // === ШКАЛА 3: Эмоциональная автономия (Q17-24) ===
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я могу сохранять спокойствие, даже если кто-то недоволен мной.',
          'en': 'I can stay calm even if someone is displeased with me.',
        },
        answers: answers,
        factorId: 'emotional_autonomy',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Я сильно переживаю, если чувствую, что разочаровал кого-то.',
          'en': 'I get very upset if I feel I disappointed someone.',
        },
        answers: answers,
        factorId: 'emotional_autonomy',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Моё настроение не зависит от одобрения или критики других.',
          'en': 'My mood doesn\'t depend on others\' approval or criticism.',
        },
        answers: answers,
        factorId: 'emotional_autonomy',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я болезненно реагирую на критику в свой адрес.',
          'en': 'I react painfully to criticism directed at me.',
        },
        answers: answers,
        factorId: 'emotional_autonomy',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я принимаю, что невозможно всем нравиться.',
          'en': 'I accept that it\'s impossible to please everyone.',
        },
        answers: answers,
        factorId: 'emotional_autonomy',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Мне нужно одобрение других, чтобы чувствовать себя уверенно.',
          'en': 'I need others\' approval to feel confident.',
        },
        answers: answers,
        factorId: 'emotional_autonomy',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я сохраняю уверенность в себе, даже когда другие не согласны со мной.',
          'en': 'I maintain self-confidence even when others disagree.',
        },
        answers: answers,
        factorId: 'emotional_autonomy',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Чужое неодобрение сильно влияет на моё эмоциональное состояние.',
          'en': 'Others\' disapproval strongly affects my emotional state.',
        },
        answers: answers,
        factorId: 'emotional_autonomy',
        isReversed: true,
      ),

      // === ШКАЛА 4: Угождение другим (Q25-32) ===
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я стараюсь сделать всё, чтобы другие были довольны мной.',
          'en': 'I try to do everything to make others happy with me.',
        },
        answers: answers,
        factorId: 'people_pleasing',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Я соглашаюсь с другими, чтобы избежать конфликтов.',
          'en': 'I agree with others to avoid conflicts.',
        },
        answers: answers,
        factorId: 'people_pleasing',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Я изменяю своё поведение, чтобы соответствовать ожиданиям других.',
          'en': 'I change my behavior to meet others\' expectations.',
        },
        answers: answers,
        factorId: 'people_pleasing',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Я часто говорю «да», когда хочу сказать «нет».',
          'en': 'I often say "yes" when I want to say "no".',
        },
        answers: answers,
        factorId: 'people_pleasing',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я чувствую себя ответственным за настроение других людей.',
          'en': 'I feel responsible for other people\'s mood.',
        },
        answers: answers,
        factorId: 'people_pleasing',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я извиняюсь даже тогда, когда не виноват.',
          'en': 'I apologize even when I\'m not at fault.',
        },
        answers: answers,
        factorId: 'people_pleasing',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Я стараюсь предугадать желания других и выполнить их.',
          'en': 'I try to anticipate others\' wishes and fulfill them.',
        },
        answers: answers,
        factorId: 'people_pleasing',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Мне трудно делать выбор, если он может кого-то расстроить.',
          'en': 'I find it hard to make choices if they might upset someone.',
        },
        answers: answers,
        factorId: 'people_pleasing',
        isReversed: false,
      ),

      // === ШКАЛА 5: Страх отвержения (Q33-40) ===
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Я боюсь, что люди перестанут общаться со мной, если я буду отказывать.',
          'en': 'I fear people will stop talking to me if I refuse them.',
        },
        answers: answers,
        factorId: 'fear_of_rejection',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Мысль о том, что меня могут отвергнуть, вызывает сильную тревогу.',
          'en': 'The thought of being rejected causes strong anxiety.',
        },
        answers: answers,
        factorId: 'fear_of_rejection',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Я избегаю высказывать своё мнение из страха быть непринятым.',
          'en': 'I avoid expressing my opinion for fear of being rejected.',
        },
        answers: answers,
        factorId: 'fear_of_rejection',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Я часто думаю, что другие могут меня бросить или отвергнуть.',
          'en': 'I often think others might abandon or reject me.',
        },
        answers: answers,
        factorId: 'fear_of_rejection',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я соглашаюсь на вещи, которые мне неприятны, чтобы сохранить отношения.',
          'en': 'I agree to unpleasant things to preserve relationships.',
        },
        answers: answers,
        factorId: 'fear_of_rejection',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Мне тяжело переживать ситуации, где кто-то недоволен мной.',
          'en': 'I find it hard to cope with situations where someone is unhappy with me.',
        },
        answers: answers,
        factorId: 'fear_of_rejection',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Я постоянно беспокоюсь о том, что думают обо мне другие.',
          'en': 'I constantly worry about what others think of me.',
        },
        answers: answers,
        factorId: 'fear_of_rejection',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'Я чувствую панику, если отношения с кем-то напряжены.',
          'en': 'I feel panic when my relationship with someone is strained.',
        },
        answers: answers,
        factorId: 'fear_of_rejection',
        isReversed: false,
      ),

      // === ШКАЛА 6: Ясность границ (Q41-48) ===
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Я чётко понимаю, где проходят мои личные границы.',
          'en': 'I clearly understand where my personal boundaries are.',
        },
        answers: answers,
        factorId: 'boundary_clarity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Мне трудно определить, когда кто-то нарушает мои границы.',
          'en': 'I find it hard to determine when someone violates my boundaries.',
        },
        answers: answers,
        factorId: 'boundary_clarity',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Я знаю, что мне комфортно, а что — нет, в отношениях.',
          'en': 'I know what makes me comfortable and uncomfortable in relationships.',
        },
        answers: answers,
        factorId: 'boundary_clarity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Мне сложно понять, где заканчиваются мои обязанности и начинаются чужие.',
          'en': 'I find it hard to understand where my responsibilities end and others\' begin.',
        },
        answers: answers,
        factorId: 'boundary_clarity',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Я могу объяснить другим, что для меня приемлемо, а что — нет.',
          'en': 'I can explain to others what is acceptable to me and what is not.',
        },
        answers: answers,
        factorId: 'boundary_clarity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Я часто не замечаю, что беру на себя чужие проблемы.',
          'en': 'I often don\'t notice when I take on others\' problems.',
        },
        answers: answers,
        factorId: 'boundary_clarity',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Я осознаю свои эмоциональные и физические пределы.',
          'en': 'I am aware of my emotional and physical limits.',
        },
        answers: answers,
        factorId: 'boundary_clarity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Мне трудно распознать, когда кто-то манипулирует мной.',
          'en': 'I find it hard to recognize when someone is manipulating me.',
        },
        answers: answers,
        factorId: 'boundary_clarity',
        isReversed: true,
      ),
    ];
  }

  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(id: '0', text: {'ru': 'Никогда', 'en': 'Never'}, score: 0),
      AnswerModel(id: '1', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 1),
      AnswerModel(id: '2', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
      AnswerModel(id: '3', text: {'ru': 'Часто', 'en': 'Often'}, score: 3),
      AnswerModel(id: '4', text: {'ru': 'Всегда', 'en': 'Always'}, score: 4),
    ];
  }

  /// Определение профиля границ на основе процентов шкал
  static String determineProfile(Map<String, double> percentages) {
    final peoplePleasing = percentages['people_pleasing'] ?? 0;
    final fearRejection = percentages['fear_of_rejection'] ?? 0;
    final assertiveness = percentages['assertiveness'] ?? 0;
    final selfPrioritization = percentages['self_prioritization'] ?? 0;
    final emotionalAutonomy = percentages['emotional_autonomy'] ?? 0;
    // boundaryClarity не используется в текущей логике определения профиля

    // Критерии профилей согласно JSON
    // People-Pleaser: people_pleasing ≥60% И fear_of_rejection ≥60%
    if (peoplePleasing >= 60 && fearRejection >= 60) {
      return 'people_pleaser';
    }

    // Boundary Master: assertiveness ≥65% И self_prioritization ≥65% И emotional_autonomy ≥65%
    if (assertiveness >= 65 &&
        selfPrioritization >= 65 &&
        emotionalAutonomy >= 65) {
      return 'boundary_master';
    }

    // Boundary Builder (промежуточный профиль)
    return 'boundary_builder';
  }


  /// Получение профиля с 7 секциями
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  static final Map<String, TestProfile> _profiles = {
    'people_pleaser': TestProfile(
      id: 'people_pleaser',
      name: {
        'ru': '🎭 Человек-угодник',
        'en': '🎭 People-Pleaser',
      },
      description: {
        'ru': 'Вы склонны ставить потребности других выше собственных, испытываете сильный страх отвержения и трудности с установлением личных границ.',
        'en': 'You tend to put others\' needs above your own, experience strong fear of rejection, and struggle with establishing personal boundaries.',
      },
      whyThisProfile: {
        'ru': 'Ваш профиль определяется высоким уровнем склонности к угождению другим (≥60%) и сильным страхом отвержения (≥60%).',
        'en': 'Your profile is determined by high levels of people-pleasing (≥60%) and strong fear of rejection (≥60%).',
      },
      strengths: {
        'ru': [
          'Эмпатия: вы хорошо чувствуете эмоции других',
          'Дипломатичность: умеете сглаживать конфликты',
          'Внимательность к потребностям окружающих',
          'Командный игрок: легко адаптируетесь в коллективе',
        ],
        'en': [
          'Empathy: you sense others\' emotions well',
          'Diplomacy: you know how to smooth conflicts',
          'Attentive to others\' needs',
          'Team player: easily adapt in groups',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Эмоциональное истощение от игнорирования своих потребностей',
          'Потеря себя, живя для других',
          'Уязвимость к манипуляциям',
          'Подавленная злость и обида',
          'Низкая самооценка',
        ],
        'en': [
          'Emotional exhaustion from ignoring your needs',
          'Loss of self while living for others',
          'Vulnerability to manipulation',
          'Suppressed anger and resentment',
          'Low self-esteem',
        ],
      },
      recommendations: {
        'ru': [
          'Работа с психологом по паттернам угождения',
          'Практика говорить "нет"',
          'Журналирование ситуаций жертвования собой',
          'Осознанность: замечайте автоматическое "да"',
          'Самосострадание',
          'Установление маленьких границ',
        ],
        'en': [
          'Work with therapist on people-pleasing patterns',
          'Practice saying "no"',
          'Journal situations of self-sacrifice',
          'Mindfulness: notice automatic "yes"',
          'Self-compassion',
          'Set small boundaries',
        ],
      },
      tryToday: {
        'ru': 'Упражнение «Пауза перед "да"»: когда кто-то просит о чём-то, скажите "дай мне подумать" и задайте себе вопросы: 1) Я действительно хочу это делать? 2) У меня есть ресурсы? 3) Я соглашаюсь из желания или страха?',
        'en': 'Exercise "Pause before yes": when someone asks something, say "let me think" and ask yourself: 1) Do I really want to do this? 2) Do I have resources? 3) Am I agreeing from desire or fear?',
      },
      inspiringConclusion: {
        'ru': 'Ваша ценность не зависит от того, сколько вы даёте другим. Установление границ — это не эгоизм, а акт заботы о себе. Люди, которые вас действительно ценят, останутся рядом, даже если вы скажете "нет".',
        'en': 'Your worth doesn\'t depend on how much you give to others. Setting boundaries is not selfishness, but self-care. People who truly value you will stay even if you say "no".',
      },
    ),

    'boundary_builder': TestProfile(
      id: 'boundary_builder',
      name: {
        'ru': '🏗️ Строитель границ',
        'en': '🏗️ Boundary Builder',
      },
      description: {
        'ru': 'Вы находитесь в процессе развития навыков установления здоровых границ. У вас есть понимание важности границ, но в некоторых ситуациях всё ещё сложно их защищать.',
        'en': 'You are developing healthy boundary-setting skills. You understand their importance but still struggle in some situations.',
      },
      whyThisProfile: {
        'ru': 'Вы не попадаете в крайние категории. Вы уже начали работу над границами и имеете моменты успешной защиты своих интересов.',
        'en': 'You don\'t fall into extreme categories. You\'ve started working on boundaries and have moments of successfully defending your interests.',
      },
      strengths: {
        'ru': [
          'Осознанность: замечаете нарушение границ',
          'Мотивация к росту и развитию',
          'Гибкость: адаптируете границы по ситуации',
          'Самоанализ и обучение на опыте',
          'Стремление к балансу',
        ],
        'en': [
          'Awareness: notice boundary violations',
          'Growth motivation',
          'Flexibility: adapt boundaries to situations',
          'Self-reflection and learning from experience',
          'Striving for balance',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Непоследовательность в защите границ',
          'Чувство вины после отказа',
          'Трудности с близкими людьми',
          'Усталость от борьбы',
          'Сомнения в правильности',
        ],
        'en': [
          'Inconsistency in defending boundaries',
          'Guilt after refusing',
          'Difficulty with close people',
          'Battle fatigue',
          'Doubts about correctness',
        ],
      },
      recommendations: {
        'ru': [
          'Практика: чем чаще ставите границы, тем легче',
          'Коммуникация: выражайте границы спокойно',
          'Анализ триггеров сложных ситуаций',
          'Поддержка людей, уважающих границы',
          'Чтение книг по ассертивности',
          'Ролевые игры для подготовки',
        ],
        'en': [
          'Practice: the more you set boundaries, the easier it gets',
          'Communication: express boundaries calmly',
          'Analyze triggers of difficult situations',
          'Support from people who respect boundaries',
          'Read books on assertiveness',
          'Role-play to prepare',
        ],
      },
      tryToday: {
        'ru': 'Упражнение «Карта границ»: создайте таблицу с двумя колонками - где границы удались и где нарушились. Найдите паттерны: где легче защищать границы, где сложнее, что помогает.',
        'en': 'Exercise "Boundary map": create a table with two columns - where boundaries worked and where they were violated. Find patterns: where it\'s easier, where harder, what helps.',
      },
      inspiringConclusion: {
        'ru': 'Вы уже на пути к здоровым границам — продолжайте! Каждый раз, защищая границу, вы укрепляете уверенность. Не бойтесь ошибок — они часть обучения.',
        'en': 'You\'re already on the path to healthy boundaries — keep going! Every time you defend a boundary, you strengthen confidence. Don\'t fear mistakes — they\'re part of learning.',
      },
    ),

    'boundary_master': TestProfile(
      id: 'boundary_master',
      name: {
        'ru': '🛡️ Мастер границ',
        'en': '🛡️ Boundary Master',
      },
      description: {
        'ru': 'Вы обладаете хорошо развитыми навыками установления и защиты личных границ. Вы уверенно выражаете потребности, умеете говорить "нет" без вины и сохраняете эмоциональную автономию.',
        'en': 'You have well-developed boundary-setting and defending skills. You confidently express needs, can say "no" without guilt, and maintain emotional autonomy.',
      },
      whyThisProfile: {
        'ru': 'Высокие показатели ассертивности (≥65%), приоритизации потребностей (≥65%) и эмоциональной автономии (≥65%). Вы проделали большую работу над собой.',
        'en': 'High levels of assertiveness (≥65%), self-prioritization (≥65%), and emotional autonomy (≥65%). You\'ve done significant self-work.',
      },
      strengths: {
        'ru': [
          'Ясная коммуникация потребностей и ожиданий',
          'Эмоциональная стабильность',
          'Самоуважение без манипуляций',
          'Здоровые отношения на взаимном уважении',
          'Уверенность в защите прав',
        ],
        'en': [
          'Clear communication of needs and expectations',
          'Emotional stability',
          'Self-respect without manipulation',
          'Healthy relationships based on mutual respect',
          'Confidence in defending rights',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск изоляции от слишком жёстких границ',
          'Непонимание людей без навыков границ',
          'Потеря гибкости в компромиссах',
          'Одиночество от высоких стандартов',
          'Восприятие как "холодный" или "эгоистичный"',
        ],
        'en': [
          'Isolation risk from too rigid boundaries',
          'Misunderstanding people without boundary skills',
          'Loss of flexibility in compromises',
          'Loneliness from high standards',
          'Perceived as "cold" or "selfish"',
        ],
      },
      recommendations: {
        'ru': [
          'Баланс: практикуйте гибкость где уместно',
          'Эмпатия: не все на вашем уровне',
          'Открытость: показывайте уязвимость доверенным',
          'Делитесь знаниями: помогайте другим',
          'Профилактика: проверяйте жёсткость границ',
          'Поддержка близких в обучении границам',
        ],
        'en': [
          'Balance: practice flexibility where appropriate',
          'Empathy: not everyone is at your level',
          'Openness: show vulnerability to trusted ones',
          'Share knowledge: help others',
          'Prevention: check boundary rigidity',
          'Support loved ones learning boundaries',
        ],
      },
      tryToday: {
        'ru': 'Упражнение «Проверка гибкости»: найдите одну ситуацию для компромисса без ущерба себе. Отследите чувства: комфортно ли? Или нарушило границы? Цель - баланс между твёрдостью и гибкостью.',
        'en': 'Exercise "Flexibility check": find one situation for compromise without self-harm. Track feelings: comfortable? Or violated boundaries? Goal - balance between firmness and flexibility.',
      },
      inspiringConclusion: {
        'ru': 'Вы — образец здоровых границ. Используйте опыт, чтобы помогать другим. Помните: границы — это не стены, а двери. Сохраняйте баланс между защитой себя и открытостью близким.',
        'en': 'You are a model of healthy boundaries. Use experience to help others. Remember: boundaries are not walls, but doors. Maintain balance between self-protection and openness to close ones.',
      },
    ),
  };

  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'assertiveness': {
        'ru': 'Ассертивность',
        'en': 'Assertiveness',
      },
      'self_prioritization': {
        'ru': 'Приоритет своих потребностей',
        'en': 'Self-Prioritization',
      },
      'emotional_autonomy': {
        'ru': 'Эмоциональная автономия',
        'en': 'Emotional Autonomy',
      },
      'people_pleasing': {
        'ru': 'Угождение другим',
        'en': 'People-Pleasing',
      },
      'fear_of_rejection': {
        'ru': 'Страх отвержения',
        'en': 'Fear of Rejection',
      },
      'boundary_clarity': {
        'ru': 'Ясность границ',
        'en': 'Boundary Clarity',
      },
    };
  }

  /// Интерпретация уровня фактора (низкий/средний/высокий)
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Положительные факторы (чем выше, тем лучше)
    if (factorId == 'assertiveness' ||
        factorId == 'self_prioritization' ||
        factorId == 'emotional_autonomy' ||
        factorId == 'boundary_clarity') {
      if (percentage < 35) {
        return {
          'ru': 'Низкий уровень — требует развития',
          'en': 'Low level — needs development',
        };
      } else if (percentage < 65) {
        return {
          'ru': 'Средний уровень — есть потенциал роста',
          'en': 'Medium level — potential for growth',
        };
      } else {
        return {
          'ru': 'Высокий уровень — сильная сторона',
          'en': 'High level — strength',
        };
      }
    }

    // Негативные факторы (чем ниже, тем лучше)
    if (factorId == 'people_pleasing' || factorId == 'fear_of_rejection') {
      if (percentage < 35) {
        return {
          'ru': 'Низкий уровень — здоровые границы',
          'en': 'Low level — healthy boundaries',
        };
      } else if (percentage < 65) {
        return {
          'ru': 'Средний уровень — есть над чем работать',
          'en': 'Medium level — room for improvement',
        };
      } else {
        return {
          'ru': 'Высокий уровень — требует внимания',
          'en': 'High level — needs attention',
        };
      }
    }

    return {
      'ru': 'Результат получен',
      'en': 'Result obtained',
    };
  }
}
