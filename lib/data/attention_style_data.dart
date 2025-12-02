import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data for the Attention Style Test.
///
/// Measures 5 attention factors through 40 behavioral questions.
/// - Test ID: attention_style
/// - Questions: 40 (8 per factor)
/// - Scoring: 0-4 (frequency scale: Never to Constantly)
/// - No reversed questions (all measure attention patterns)
/// - 5 factors: inattention, hyperfocus, impulsivity, task_completion, task_switching
/// - 5 "brain type" profiles based on pattern combinations
///
/// IMPORTANT: This test is NOT a diagnostic tool for ADHD.
class AttentionStyleData {
  /// Get the complete test model
  static TestModel getAttentionStyleTest() {
    return TestModel(
      id: 'attention_style',
      title: {
        'ru': 'Тест «Стиль внимания: мозг-пчёлка или лазер»',
        'en': 'Attention Style Test: Bee Brain or Laser Brain',
      },
      description: {
        'ru':
            'Узнайте, как работает ваше внимание: мозг-лазер, мозг-пчёлка или мозг-бабочка',
        'en':
            'Discover how your attention works: laser brain, bee brain, or butterfly brain',
      },
      category: {
        'ru': 'Интеллект и способности',
        'en': 'Intelligence and Abilities',
      },
      categoryId: 'intelligence',
      questions: _buildQuestions(),
      estimatedTime: 7,
      type: TestType.multiFactor,
      factorIds: [
        'inattention',
        'hyperfocus',
        'impulsivity',
        'task_completion',
        'task_switching',
      ],
      disclaimer: {
        'ru':
            '🚨 ВАЖНО: Этот тест НЕ является диагностическим инструментом и НЕ может диагностировать СДВГ. СДВГ может диагностировать ТОЛЬКО врач-психиатр. Тест измеряет ваш стиль внимания, не расстройство. Высокие баллы могут означать особенности вашего стиля внимания, стресс, недосып, тревожность или другие факторы. Если симптомы серьёзно мешают жизни — обратитесь к специалисту.',
        'en':
            '🚨 IMPORTANT: This test is NOT diagnostic tool and CANNOT diagnose ADHD. ADHD can be diagnosed ONLY by psychiatrist. Test measures your attention style, not disorder. High scores may mean features of your attention style, stress, sleep deprivation, anxiety, or other factors. If symptoms seriously interfere with life — consult specialist.',
      },
    );
  }

  /// Build all 40 questions
  static List<QuestionModel> _buildQuestions() {
    return [
      // Inattention (Q1-8)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я легко отвлекаюсь на посторонние звуки, движения или мысли',
          'en': 'I easily get distracted by external sounds, movements, or thoughts',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'inattention',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Я забываю, что собирался сделать, пока шёл к другой комнате',
          'en': 'I forget what I was going to do while walking to another room',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'inattention',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Мне трудно следить за длинными разговорами или лекциями',
          'en': 'I find it hard to follow long conversations or lectures',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'inattention',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru':
              'Я теряю вещи (ключи, телефон, кошелёк) или не могу вспомнить, куда их положил',
          'en': 'I lose things (keys, phone, wallet) or can\'t remember where I put them',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'inattention',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Я пропускаю детали или делаю ошибки по невнимательности',
          'en': 'I miss details or make careless mistakes',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'inattention',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Мне сложно концентрироваться на скучных или рутинных задачах',
          'en': 'I struggle to concentrate on boring or routine tasks',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'inattention',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я часто \'витаю в облаках\' или погружаюсь в свои мысли',
          'en': 'I often \'daydream\' or get lost in my thoughts',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'inattention',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я забываю о важных встречах, дедлайнах или обещаниях',
          'en': 'I forget important meetings, deadlines, or promises',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'inattention',
        isReversed: false,
      ),

      // Hyperfocus (Q9-16)
      QuestionModel(
        id: 'q9',
        text: {
          'ru':
              'Когда меня что-то увлекает, я могу часами работать над этим, забывая обо всём',
          'en': 'When something interests me, I can work on it for hours, forgetting everything',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'hyperfocus',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я так погружаюсь в задачу, что не слышу, когда меня зовут',
          'en': 'I get so absorbed in a task that I don\'t hear when called',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'hyperfocus',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я теряю счёт времени, когда занимаюсь чем-то интересным',
          'en': 'I lose track of time when doing something interesting',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'hyperfocus',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Мне трудно оторваться от интересного дела, даже если нужно',
          'en': 'I find it hard to break away from interesting activity, even when needed',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'hyperfocus',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я могу забыть поесть или поспать, когда увлечён проектом',
          'en': 'I can forget to eat or sleep when absorbed in a project',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'hyperfocus',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Когда я в \'потоке\', мне кажется, что весь мир исчезает',
          'en': 'When I\'m in \'flow\', it feels like the whole world disappears',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'hyperfocus',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я могу работать над любимым делом всю ночь напролёт',
          'en': 'I can work on favorite activity all night long',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'hyperfocus',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Моя концентрация на интересном — как лазер, всё остальное не существует',
          'en': 'My concentration on interesting things is like laser, everything else doesn\'t exist',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'hyperfocus',
        isReversed: false,
      ),

      // Impulsivity (Q17-24)
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я говорю или делаю что-то, не подумав о последствиях',
          'en': 'I say or do things without thinking about consequences',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsivity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Мне трудно ждать своей очереди в разговоре, я перебиваю других',
          'en': 'I find it hard to wait my turn in conversation, I interrupt others',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsivity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Я делаю импульсивные покупки, которые потом жалею',
          'en': 'I make impulse purchases that I later regret',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsivity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я отправляю сообщения или emails, не перечитав их',
          'en': 'I send messages or emails without rereading them',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsivity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Мне сложно сдерживать эмоции или реакции',
          'en': 'I struggle to hold back emotions or reactions',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsivity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru':
              'Я начинаю новое дело, не закончив предыдущее, потому что оно кажется интереснее',
          'en': 'I start new thing without finishing previous one because it seems more interesting',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsivity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я принимаю спонтанные решения, которые меняют мои планы',
          'en': 'I make spontaneous decisions that change my plans',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsivity',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Мне трудно сидеть спокойно, я постоянно ёрзаю или двигаюсь',
          'en': 'I find it hard to sit still, I constantly fidget or move',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsivity',
        isReversed: false,
      ),

      // Task Completion (Q25-32)
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'У меня много начатых, но незавершённых проектов',
          'en': 'I have many started but unfinished projects',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_completion',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Мне сложно доводить скучные задачи до конца',
          'en': 'I struggle to complete boring tasks',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_completion',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Я откладываю дела до последнего момента',
          'en': 'I postpone things until the last moment',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_completion',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Самая сложная часть задачи для меня — это последние 20%',
          'en': 'The hardest part of task for me is the last 20%',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_completion',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я теряю интерес к проекту, когда проходит начальный энтузиазм',
          'en': 'I lose interest in project when initial enthusiasm passes',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_completion',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Мне нужны дедлайны и внешнее давление, чтобы закончить дело',
          'en': 'I need deadlines and external pressure to finish things',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_completion',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Я начинаю много дел одновременно и не могу закончить ни одно',
          'en': 'I start many things simultaneously and can\'t finish any',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_completion',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Мне трудно следовать пошаговым инструкциям от начала до конца',
          'en': 'I find it hard to follow step-by-step instructions from start to finish',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_completion',
        isReversed: false,
      ),

      // Task Switching (Q33-40)
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Я часто переключаюсь между разными задачами в течение дня',
          'en': 'I frequently switch between different tasks during the day',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_switching',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Мне трудно вернуться к задаче после перерыва',
          'en': 'I find it hard to return to task after break',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_switching',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Я делаю несколько дел одновременно (читаю и смотрю видео, например)',
          'en': 'I do several things simultaneously (read and watch video, for example)',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_switching',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Я постоянно проверяю телефон, даже когда работаю над важным',
          'en': 'I constantly check phone even when working on important task',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_switching',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Мне скучно делать одно и то же долго, хочется разнообразия',
          'en': 'I get bored doing same thing for long, want variety',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_switching',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Я начинаю новую задачу, не закончив текущую, потому что вспомнил о ней',
          'en': 'I start new task without finishing current one because I remembered it',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_switching',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'У меня открыто 20+ вкладок в браузере одновременно',
          'en': 'I have 20+ browser tabs open simultaneously',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_switching',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'Мне сложно сосредоточиться на чём-то одном — мой мозг порхает как пчела',
          'en': 'I struggle to focus on one thing — my brain flits like a bee',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'task_switching',
        isReversed: false,
      ),
    ];
  }

  /// Build standard frequency answers (0-4: Never to Constantly)
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
        text: {'ru': 'Постоянно', 'en': 'Constantly'},
        score: 4,
      ),
    ];
  }

  /// Get factor names in both languages
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'inattention': {
        'ru': '🦋 Рассеянность',
        'en': '🦋 Inattention',
      },
      'hyperfocus': {
        'ru': '🔬 Гиперфокус',
        'en': '🔬 Hyperfocus',
      },
      'impulsivity': {
        'ru': '⚡ Импульсивность',
        'en': '⚡ Impulsivity',
      },
      'task_completion': {
        'ru': '📋 Завершение задач',
        'en': '📋 Task Completion',
      },
      'task_switching': {
        'ru': '🔄 Переключение между задачами',
        'en': '🔄 Task Switching',
      },
    };
  }

  /// Get factor interpretation based on percentage score
  static Map<String, String> getFactorInterpretation(
    String factorId,
    double percentage,
  ) {
    // Защита от NaN
    if (percentage.isNaN || percentage.isInfinite) {
      return {
        'ru': 'Недостаточно данных для интерпретации',
        'en': 'Insufficient data for interpretation',
      };
    }

    final level = percentage <= 40
        ? 'low'
        : percentage <= 65
            ? 'moderate'
            : 'high';

    final interpretations = {
      'inattention': {
        'low': {
          'ru': 'Низкая рассеянность. Вы хорошо удерживаете внимание на задачах.',
          'en': 'Low inattention. You maintain attention on tasks well.',
        },
        'moderate': {
          'ru':
              'Умеренная рассеянность. Иногда отвлекаетесь, но в целом справляетесь.',
          'en': 'Moderate inattention. Sometimes distracted but generally manage.',
        },
        'high': {
          'ru':
              'Высокая рассеянность. Вам часто сложно удерживать внимание, легко отвлекаетесь.',
          'en': 'High inattention. Often difficult to maintain attention, easily distracted.',
        },
      },
      'hyperfocus': {
        'low': {
          'ru': 'Низкий гиперфокус. Вы редко погружаетесь в задачи настолько глубоко.',
          'en': 'Low hyperfocus. You rarely immerse in tasks so deeply.',
        },
        'moderate': {
          'ru':
              'Умеренный гиперфокус. Иногда полностью погружаетесь в интересные задачи.',
          'en': 'Moderate hyperfocus. Sometimes fully immerse in interesting tasks.',
        },
        'high': {
          'ru':
              'Высокий гиперфокус. Когда что-то увлекает, мир вокруг перестаёт существовать.',
          'en': 'High hyperfocus. When something interests, world around ceases to exist.',
        },
      },
      'impulsivity': {
        'low': {
          'ru': 'Низкая импульсивность. Вы обдумываете действия перед тем, как их совершить.',
          'en': 'Low impulsivity. You think through actions before doing them.',
        },
        'moderate': {
          'ru': 'Умеренная импульсивность. Иногда действуете спонтанно.',
          'en': 'Moderate impulsivity. Sometimes act spontaneously.',
        },
        'high': {
          'ru':
              'Высокая импульсивность. Часто действуете или говорите, не подумав о последствиях.',
          'en': 'High impulsivity. Often act or speak without thinking about consequences.',
        },
      },
      'task_completion': {
        'low': {
          'ru': 'Хорошее завершение задач. Вы обычно доводите начатое до конца.',
          'en': 'Good task completion. You usually finish what you start.',
        },
        'moderate': {
          'ru':
              'Умеренные трудности с завершением. Иногда бросаете проекты незавершёнными.',
          'en': 'Moderate completion difficulties. Sometimes leave projects unfinished.',
        },
        'high': {
          'ru':
              'Серьёзные трудности с завершением. Много начатых, но незавершённых дел.',
          'en': 'Serious completion difficulties. Many started but unfinished things.',
        },
      },
      'task_switching': {
        'low': {
          'ru':
              'Низкое переключение. Вы предпочитаете фокусироваться на одной задаче.',
          'en': 'Low switching. You prefer focusing on one task.',
        },
        'moderate': {
          'ru': 'Умеренное переключение. Иногда меняете задачи в течение дня.',
          'en': 'Moderate switching. Sometimes change tasks during day.',
        },
        'high': {
          'ru':
              'Высокое переключение. Ваш мозг постоянно переключается между разными делами.',
          'en': 'High switching. Your brain constantly switches between different things.',
        },
      },
    };

    return interpretations[factorId]?[level] ??
        {
          'ru': 'Интерпретация недоступна',
          'en': 'Interpretation unavailable',
        };
  }

  /// All profiles (5 "brain type" profiles)
  static final Map<String, TestProfile> _profiles = {
    'balanced_brain': TestProfile(
      id: 'balanced_brain',
      name: {
        'ru': '⚖️ Мозг-баланс',
        'en': '⚖️ Balanced Brain',
      },
      description: {
        'ru':
            'У вас сбалансированный стиль внимания. Вы можете фокусироваться, когда нужно, но и гибко переключаться между задачами. Это здоровый паттерн работы мозга, который позволяет вам эффективно справляться с разными типами задач.',
        'en':
            'You have balanced attention style. You can focus when needed but also flexibly switch between tasks. This is healthy brain pattern that allows you to effectively handle different types of tasks.',
      },
      whyThisProfile: {
        'ru':
            'Ваши баллы по всем шкалам находятся в умеренном диапазоне. Вы не испытываете значительных проблем с вниманием, концентрацией или импульсивностью. Это говорит о здоровом балансе между способностью фокусироваться и гибкостью мышления.',
        'en':
            'Your scores across all scales are in moderate range. You don\'t experience significant problems with attention, concentration, or impulsivity. This indicates healthy balance between ability to focus and mental flexibility.',
      },
      strengths: {
        'ru': [
          '✅ Можете концентрироваться на важных задачах',
          '✅ Гибкость в переключении между делами',
          '✅ Завершаете начатые проекты',
          '✅ Контролируете импульсы',
          '✅ Адаптивность к разным ситуациям',
        ],
        'en': [
          '✅ Can concentrate on important tasks',
          '✅ Flexibility in switching between tasks',
          '✅ Complete started projects',
          '✅ Control impulses',
          '✅ Adaptability to different situations',
        ],
      },
      vulnerabilities: {
        'ru': [
          '⚠️ В стрессе баланс может нарушиться',
          '⚠️ Недосып снижает вашу эффективность',
          '⚠️ Слишком много задач может перегрузить систему',
        ],
        'en': [
          '⚠️ Balance may be disrupted under stress',
          '⚠️ Sleep deprivation reduces your effectiveness',
          '⚠️ Too many tasks can overload system',
        ],
      },
      recommendations: {
        'ru': [
          '🌱 Продолжайте поддерживать здоровый режим сна (7-8 часов)',
          '📅 Используйте планирование для оптимизации продуктивности',
          '⏸️ Балансируйте работу и отдых',
          '🎯 Ставьте приоритеты для важных задач',
          '💪 Поддерживайте физическую активность для здоровья мозга',
        ],
        'en': [
          '🌱 Continue maintaining healthy sleep schedule (7-8 hours)',
          '📅 Use planning to optimize productivity',
          '⏸️ Balance work and rest',
          '🎯 Set priorities for important tasks',
          '💪 Maintain physical activity for brain health',
        ],
      },
      tryToday: {
        'ru':
            '💡 **Попробуйте сегодня:** Проведите аудит своего рабочего дня — отметьте, когда вы наиболее продуктивны, и планируйте важные задачи на это время.',
        'en':
            '💡 **Try today:** Audit your work day — note when you\'re most productive and plan important tasks for this time.',
      },
      inspiringConclusion: {
        'ru':
            '🌟 **Ваш баланс — это ценный навык.** В мире, где многие борются с концентрацией или гиперфокусом, вы обладаете гибкостью. Цените это, поддерживайте здоровые привычки (сон, отдых, питание), и ваш мозг будет служить вам верой и правдой. Помните: баланс — это не данность, а то, что нужно поддерживать осознанно! ⚖️',
        'en':
            '🌟 **Your balance is valuable skill.** In world where many struggle with concentration or hyperfocus, you have flexibility. Value this, maintain healthy habits (sleep, rest, nutrition), and your brain will serve you well. Remember: balance is not given, but something to maintain consciously! ⚖️',
      },
    ),
    'bee_brain': TestProfile(
      id: 'bee_brain',
      name: {
        'ru': '🐝 Мозг-пчёлка',
        'en': '🐝 Bee Brain',
      },
      description: {
        'ru':
            'Ваш мозг постоянно порхает между разными мыслями и задачами, как пчела между цветами. Вам сложно долго фокусироваться на чём-то одном, вы любите разнообразие и легко отвлекаетесь. Это НЕ плохо — это просто ваш стиль работы мозга.',
        'en':
            'Your brain constantly flits between different thoughts and tasks, like bee between flowers. You struggle to focus on one thing for long, you love variety and get easily distracted. This is NOT bad — it\'s just your brain\'s working style.',
      },
      whyThisProfile: {
        'ru':
            'У вас высокие баллы по рассеянности (inattention) и переключению между задачами (task switching), при относительно низком гиперфокусе. Это классический паттерн "мозга-пчёлки" — ваше внимание естественным образом ищет новизну и разнообразие.',
        'en':
            'You have high scores in inattention and task switching, with relatively low hyperfocus. This is classic "bee brain" pattern — your attention naturally seeks novelty and variety.',
      },
      strengths: {
        'ru': [
          '✅ Креативность и нестандартное мышление',
          '✅ Умение видеть связи между разными идеями',
          '✅ Гибкость и адаптивность',
          '✅ Энергичность и любознательность',
          '✅ Способность генерировать много идей',
        ],
        'en': [
          '✅ Creativity and non-standard thinking',
          '✅ Ability to see connections between ideas',
          '✅ Flexibility and adaptability',
          '✅ Energy and curiosity',
          '✅ Ability to generate many ideas',
        ],
      },
      vulnerabilities: {
        'ru': [
          '⚠️ Трудно завершать длинные проекты',
          '⚠️ Легко отвлекаетесь на новые стимулы',
          '⚠️ Много начатого, мало завершённого',
          '⚠️ Рутинные задачи — ваш кошмар',
          '⚠️ Может быть сложно в традиционных рабочих средах',
        ],
        'en': [
          '⚠️ Hard to complete long projects',
          '⚠️ Easily distracted by new stimuli',
          '⚠️ Much started, little finished',
          '⚠️ Routine tasks are your nightmare',
          '⚠️ May be difficult in traditional work environments',
        ],
      },
      recommendations: {
        'ru': [
          '⏱️ Используйте таймер Pomodoro (25 минут работы, 5 минут перерыв)',
          '📝 Разбивайте большие задачи на маленькие, выполнимые шаги',
          '🎧 Работайте в тихом месте или используйте белый шум',
          '📋 Создавайте визуальные списки дел и напоминания',
          '👥 Найдите "body doubling" партнёра (работать рядом с кем-то)',
          '🎮 Геймифицируйте скучные задачи',
          '💚 Принимайте свою пчелиную природу — это не плохо!',
        ],
        'en': [
          '⏱️ Use Pomodoro timer (25 minutes work, 5 minutes break)',
          '📝 Break big tasks into small, achievable steps',
          '🎧 Work in quiet place or use white noise',
          '📋 Create visual to-do lists and reminders',
          '👥 Find "body doubling" partner (work alongside someone)',
          '🎮 Gamify boring tasks',
          '💚 Accept your bee nature — it\'s not bad!',
        ],
      },
      tryToday: {
        'ru':
            '💡 **Попробуйте сегодня:** Выберите одну скучную задачу и работайте над ней 25 минут с таймером. Награждайте себя после каждого "помидора". Важна не продолжительность, а регулярность.',
        'en':
            '💡 **Try today:** Choose one boring task and work on it for 25 minutes with timer. Reward yourself after each "pomodoro". Duration is not important, regularity is.',
      },
      inspiringConclusion: {
        'ru':
            '🌟 **Ваш мозг-пчёлка — это дар, а не недостаток.** Многие великие изобретатели и художники были "пчёлками" — они опыляли идеи между разными областями, создавая что-то новое. Ваша задача — не "исправить" себя, а создать систему, которая работает ДЛЯ вашего мозга, а не против него. Если симптомы серьёзно мешают жизни с детства — проконсультируйтесь с психиатром насчёт СДВГ. Но помните: быть пчёлкой — это нормально! 🐝',
        'en':
            '🌟 **Your bee brain is gift, not flaw.** Many great inventors and artists were "bees" — they cross-pollinated ideas between different fields, creating something new. Your task is not to "fix" yourself but create system that works FOR your brain, not against it. If symptoms seriously interfere with life since childhood — consult psychiatrist about ADHD. But remember: being bee is normal! 🐝',
      },
    ),
    'laser_brain': TestProfile(
      id: 'laser_brain',
      name: {
        'ru': '🔬 Мозг-лазер',
        'en': '🔬 Laser Brain',
      },
      description: {
        'ru':
            'Когда вас что-то увлекает, вы погружаетесь в это полностью, как лазерный луч. Мир вокруг перестаёт существовать. Это ваша суперсила, но иногда может быть проблемой — вы можете забыть о базовых потребностях или не услышать, что вас зовут.',
        'en':
            'When something interests you, you immerse completely, like laser beam. World around ceases to exist. This is your superpower, but sometimes can be problem — you may forget basic needs or not hear when called.',
      },
      whyThisProfile: {
        'ru':
            'У вас высокий гиперфокус (65%+) при относительно низкой рассеянности (до 40%). Это означает, что когда задача вас интересует, вы можете работать над ней часами, полностью погружаясь. Но скучные задачи даются с трудом.',
        'en':
            'You have high hyperfocus (65%+) with relatively low inattention (up to 40%). This means when task interests you, you can work on it for hours, fully immersing. But boring tasks are difficult.',
      },
      strengths: {
        'ru': [
          '✅ Невероятная продуктивность в интересных задачах',
          '✅ Способность к глубокой работе (deep work)',
          '✅ Мастерство в любимых областях',
          '✅ Состояние "потока" (flow state)',
          '✅ Высокая концентрация на важном',
        ],
        'en': [
          '✅ Incredible productivity in interesting tasks',
          '✅ Ability for deep work',
          '✅ Mastery in favorite areas',
          '✅ "Flow" state',
          '✅ High concentration on important things',
        ],
      },
      vulnerabilities: {
        'ru': [
          '⚠️ Трудно переключиться, даже когда нужно',
          '⚠️ Можете забыть о базовых потребностях (еда, сон, туалет)',
          '⚠️ Скучные задачи — настоящая пытка',
          '⚠️ Дисбаланс жизни (работа vs отдых)',
          '⚠️ Социальные обязательства могут страдать',
        ],
        'en': [
          '⚠️ Hard to switch even when needed',
          '⚠️ May forget basic needs (food, sleep, bathroom)',
          '⚠️ Boring tasks are real torture',
          '⚠️ Life imbalance (work vs rest)',
          '⚠️ Social obligations may suffer',
        ],
      },
      recommendations: {
        'ru': [
          '⏰ Ставьте будильники для напоминаний (поесть, встать, закончить работу)',
          '🎯 Используйте гиперфокус стратегически для самых важных задач',
          '👥 Создайте "интерфейс" между собой и миром (партнёр, который напомнит)',
          '🎨 Для скучных задач: геймификация, музыка, смена обстановки',
          '⚖️ Балансируйте: после гиперфокуса ОБЯЗАТЕЛЕН отдых',
          '🏃 Следите за здоровьем — не забывайте про тело!',
          '📱 Используйте приложения для напоминаний о базовых нуждах',
        ],
        'en': [
          '⏰ Set alarms for reminders (eat, stand up, finish work)',
          '🎯 Use hyperfocus strategically for most important tasks',
          '👥 Create "interface" between you and world (partner who reminds)',
          '🎨 For boring tasks: gamification, music, change of scenery',
          '⚖️ Balance: after hyperfocus rest is MANDATORY',
          '🏃 Monitor health — don\'t forget body!',
          '📱 Use reminder apps for basic needs',
        ],
      },
      tryToday: {
        'ru':
            '💡 **Попробуйте сегодня:** Поставьте 3 будильника на телефоне: через 2 часа работы — встать и размяться, через 4 часа — поесть, через 6 часов — закончить работу. Следуйте им ОБЯЗАТЕЛЬНО, даже если "в потоке".',
        'en':
            '💡 **Try today:** Set 3 phone alarms: after 2 hours work — stand and stretch, after 4 hours — eat, after 6 hours — finish work. Follow them NECESSARILY, even if "in flow".',
      },
      inspiringConclusion: {
        'ru':
            '🌟 **Ваш гиперфокус — это редкий дар.** В мире, где все отвлекаются каждые 40 секунд, вы способны на глубокую работу. Используйте это! Но помните: ваше тело — не опция, а необходимость. Лучшие произведения создаются не на износ, а в балансе. Калибруйте свой лазер на важные цели, а для остального — создавайте системы напоминаний. Вы не "зацикливаетесь" — вы погружаетесь. Это сила! 🔬',
        'en':
            '🌟 **Your hyperfocus is rare gift.** In world where everyone gets distracted every 40 seconds, you\'re capable of deep work. Use this! But remember: your body is not option, but necessity. Best works are created not through burnout, but in balance. Calibrate your laser on important goals, and for rest — create reminder systems. You don\'t "get stuck" — you immerse. This is power! 🔬',
      },
    ),
    'butterfly_brain': TestProfile(
      id: 'butterfly_brain',
      name: {
        'ru': '🦋 Мозг-бабочка',
        'en': '🦋 Butterfly Brain',
      },
      description: {
        'ru':
            'Ваш мозг как бабочка — красивый, но непредсказуемый. Вы легко отвлекаетесь, действуете импульсивно и с трудом завершаете задачи. Жизнь с таким мозгом может быть хаотичной, но это также источник креативности и спонтанности.',
        'en':
            'Your brain is like butterfly — beautiful but unpredictable. You easily get distracted, act impulsively, and struggle to complete tasks. Life with such brain can be chaotic, but it\'s also source of creativity and spontaneity.',
      },
      whyThisProfile: {
        'ru':
            'У вас высокие баллы по рассеянности (60%+), импульсивности (50%+) и трудностям с завершением задач (50%+). Это комбинация трёх факторов, которая может серьёзно влиять на повседневную жизнь. Важно: это может быть вашим стилем, но также может быть признаком СДВГ — если симптомы с детства и серьёзно мешают, обратитесь к специалисту.',
        'en':
            'You have high scores in inattention (60%+), impulsivity (50%+), and task completion difficulties (50%+). This is combination of three factors that can seriously affect daily life. Important: this may be your style, but may also be sign of ADHD — if symptoms since childhood and seriously interfere, consult specialist.',
      },
      strengths: {
        'ru': [
          '✅ Спонтанность и живость',
          '✅ Способность видеть красоту в мелочах',
          '✅ Креативность',
          '✅ Эмоциональная выразительность',
        ],
        'en': [
          '✅ Spontaneity and liveliness',
          '✅ Ability to see beauty in details',
          '✅ Creativity',
          '✅ Emotional expressiveness',
        ],
      },
      vulnerabilities: {
        'ru': [
          '🚨 Серьёзные трудности с концентрацией',
          '🚨 Импульсивные решения с последствиями',
          '🚨 Много незавершённых проектов',
          '🚨 Хаос в жизни, работе, делах',
          '🚨 Может быть эмоциональная дисрегуляция',
          '🚨 Проблемы в отношениях из-за импульсивности',
        ],
        'en': [
          '🚨 Serious concentration difficulties',
          '🚨 Impulsive decisions with consequences',
          '🚨 Many unfinished projects',
          '🚨 Chaos in life, work, affairs',
          '🚨 May be emotional dysregulation',
          '🚨 Relationship problems due to impulsivity',
        ],
      },
      recommendations: {
        'ru': [
          '🚨 ПРИОРИТЕТ: Проконсультируйтесь с психиатром для оценки СДВГ',
          '📋 Создайте жёсткую внешнюю структуру (напоминания, списки, рутины)',
          '🚫 Минимизируйте отвлекающие факторы максимально',
          '🎯 Используйте "метод одной вещи": фокус только на одном деле',
          '👥 Найдите accountability партнёра',
          '💊 Если это СДВГ — есть эффективное лечение (терапия + возможно медикаменты)',
          '🧘 Практикуйте mindfulness для импульс-контроля',
          '📱 Используйте технологии: приложения для фокуса, блокировщики соцсетей',
        ],
        'en': [
          '🚨 PRIORITY: Consult psychiatrist for ADHD assessment',
          '📋 Create rigid external structure (reminders, lists, routines)',
          '🚫 Minimize distracting factors maximally',
          '🎯 Use "one thing method": focus on only one thing',
          '👥 Find accountability partner',
          '💊 If it\'s ADHD — effective treatment exists (therapy + possibly medication)',
          '🧘 Practice mindfulness for impulse control',
          '📱 Use technology: focus apps, social media blockers',
        ],
      },
      tryToday: {
        'ru':
            '💡 **Попробуйте сегодня:** Выберите ОДНУ задачу. Уберите телефон в другую комнату. Закройте все вкладки, кроме нужной. Поставьте таймер на 15 минут. Работайте только над этой задачей. Это ваш первый шаг к контролю.',
        'en':
            '💡 **Try today:** Choose ONE task. Put phone in another room. Close all tabs except needed one. Set timer for 15 minutes. Work only on this task. This is your first step to control.',
      },
      inspiringConclusion: {
        'ru':
            '⚠️ **Это серьёзно, но это НЕ приговор.** Если эти симптомы были у вас с детства (до 12 лет), проявляются в разных ситуациях и СЕРЬЁЗНО мешают жизни, учёбе или работе — это может быть СДВГ. И это ХОРОШАЯ НОВОСТЬ, потому что СДВГ лечится! Комбинация терапии, стратегий и (если нужно) медикаментов может кардинально изменить жизнь. Тысячи людей с СДВГ живут полноценной, успешной жизнью — они просто получили правильную поддержку. Первый шаг — обратиться к психиатру. Не игнорируйте это! 🦋',
        'en':
            '⚠️ **This is serious but NOT verdict.** If these symptoms have been since childhood (before age 12), manifest in different situations, and SERIOUSLY interfere with life, studies, or work — this may be ADHD. And this is GOOD NEWS because ADHD is treatable! Combination of therapy, strategies, and (if needed) medication can radically change life. Thousands of people with ADHD live full, successful lives — they just got right support. First step — see psychiatrist. Don\'t ignore this! 🦋',
      },
    ),
    'scanner_brain': TestProfile(
      id: 'scanner_brain',
      name: {
        'ru': '📡 Мозг-сканер',
        'en': '📡 Scanner Brain',
      },
      description: {
        'ru':
            'Ваш мозг постоянно сканирует окружение в поисках нового и интересного. Вы мультипотенциал — у вас множество интересов, но трудно углубиться в что-то одно надолго. Это не недостаток — это особый тип личности.',
        'en':
            'Your brain constantly scans environment for new and interesting things. You\'re multipotentialite — you have many interests but hard to go deep into one for long. This is not flaw — it\'s special personality type.',
      },
      whyThisProfile: {
        'ru':
            'У вас высокое переключение между задачами (65%+) при относительно низком гиперфокусе (до 40%). Вы "сканер" или "мультипотенциал" — человек с разнообразными интересами и талантами, который не хочет выбирать одно. Это описано Барбарой Шер в книге "Отказываюсь выбирать".',
        'en':
            'You have high task switching (65%+) with relatively low hyperfocus (up to 40%). You\'re "scanner" or "multipotentialite" — person with diverse interests and talents who doesn\'t want to choose one. This is described by Barbara Sher in "Refuse to Choose".',
      },
      strengths: {
        'ru': [
          '✅ Широкий кругозор',
          '✅ Умение видеть общую картину',
          '✅ Адаптивность к изменениям',
          '✅ Интерес к множеству областей',
          '✅ Способность синтезировать знания из разных сфер',
          '✅ Быстрое обучение новому',
        ],
        'en': [
          '✅ Broad horizons',
          '✅ Ability to see big picture',
          '✅ Adaptability to changes',
          '✅ Interest in many areas',
          '✅ Ability to synthesize knowledge from different fields',
          '✅ Quick learning',
        ],
      },
      vulnerabilities: {
        'ru': [
          '⚠️ Трудно выбрать одну карьеру',
          '⚠️ "Я не могу решить, кем хочу быть"',
          '⚠️ Давление общества "выбрать что-то одно"',
          '⚠️ Много начатых, незавершённых проектов',
          '⚠️ Чувство, что вы "дилетант во всём"',
        ],
        'en': [
          '⚠️ Hard to choose one career',
          '⚠️ "I can\'t decide what I want to be"',
          '⚠️ Society pressure to "choose one thing"',
          '⚠️ Many started, unfinished projects',
          '⚠️ Feeling like you\'re "dilettante in everything"',
        ],
      },
      recommendations: {
        'ru': [
          '💚 ГЛАВНОЕ: Примите свою мультипотенциальность — это ОК и даже здорово!',
          '🎨 Ищите работу, где нужно разнообразие (проект-менеджмент, консалтинг, журналистика)',
          '🔄 Используйте "метод ротации" для проектов (2-3 проекта в ротации)',
          '📚 Читайте: "Отказываюсь выбирать" (Барбара Шер)',
          '🌐 Ищите "slash careers" (дизайнер/программист/писатель)',
          '👥 Общайтесь с другими мультипотенциалами',
          '🎯 Создайте "зонтичный бренд" для всех ваших интересов',
        ],
        'en': [
          '💚 MAIN: Accept your multipotentiality — it\'s OK and even great!',
          '🎨 Look for work requiring variety (project management, consulting, journalism)',
          '🔄 Use "rotation method" for projects (2-3 projects in rotation)',
          '📚 Read: "Refuse to Choose" (Barbara Sher)',
          '🌐 Look for "slash careers" (designer/programmer/writer)',
          '👥 Connect with other multipotentialites',
          '🎯 Create "umbrella brand" for all your interests',
        ],
      },
      tryToday: {
        'ru':
            '💡 **Попробуйте сегодня:** Составьте список ВСЕХ ваших интересов. Не пытайтесь выбрать один — просто запишите все. Теперь подумайте: есть ли работа, которая объединяет 2-3 из них? Или вы можете заниматься несколькими параллельно?',
        'en':
            '💡 **Try today:** Make list of ALL your interests. Don\'t try to choose one — just write all. Now think: is there work that combines 2-3 of them? Or can you do several in parallel?',
      },
      inspiringConclusion: {
        'ru':
            '🌟 **Вы не "не определились" — вы мультипотенциал.** Это не баг, это фича! Мир нужны люди, которые видят связи между разными областями. Леонардо да Винчи был сканером. Стив Джобс был сканером. Они не выбрали одно — они объединили много. Перестаньте пытаться "найти своё призвание" — у вас их несколько, и это нормально. Ваша задача — создать жизнь, где есть место для разнообразия. Это возможно! 📡',
        'en':
            '🌟 **You didn\'t "not decide" — you\'re multipotentialite.** This is not bug, it\'s feature! World needs people who see connections between different fields. Leonardo da Vinci was scanner. Steve Jobs was scanner. They didn\'t choose one — they combined many. Stop trying to "find your calling" — you have several, and that\'s normal. Your task — create life with room for variety. It\'s possible! 📡',
      },
    ),
  };

  /// Determine profile based on scale percentages
  static String determineProfile(Map<String, double> percentages) {
    // Extract percentages with NaN protection
    final inattention = percentages['inattention']?.isFinite == true
        ? percentages['inattention']!
        : 0.0;
    final hyperfocus = percentages['hyperfocus']?.isFinite == true
        ? percentages['hyperfocus']!
        : 0.0;
    final impulsivity = percentages['impulsivity']?.isFinite == true
        ? percentages['impulsivity']!
        : 0.0;
    final taskCompletion = percentages['task_completion']?.isFinite == true
        ? percentages['task_completion']!
        : 0.0;
    final taskSwitching = percentages['task_switching']?.isFinite == true
        ? percentages['task_switching']!
        : 0.0;

    // Butterfly Brain: High inattention + impulsivity + task completion issues
    if (inattention >= 60 && impulsivity >= 50 && taskCompletion >= 50) {
      return 'butterfly_brain';
    }

    // Laser Brain: High hyperfocus, low inattention
    if (hyperfocus >= 65 && inattention <= 40) {
      return 'laser_brain';
    }

    // Bee Brain: High inattention + task switching, low hyperfocus
    if (inattention >= 50 && taskSwitching >= 50 && hyperfocus <= 50) {
      return 'bee_brain';
    }

    // Scanner Brain: High task switching, low hyperfocus
    if (taskSwitching >= 65 && hyperfocus <= 40) {
      return 'scanner_brain';
    }

    // Balanced Brain: Everything in moderate range
    if (inattention <= 40 &&
        hyperfocus <= 60 &&
        impulsivity <= 40 &&
        taskCompletion <= 40 &&
        taskSwitching <= 40) {
      return 'balanced_brain';
    }

    // Default to balanced if no clear pattern
    return 'balanced_brain';
  }

  /// Get profile by ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Get all profiles
  static Map<String, TestProfile> getAllProfiles() {
    return Map.unmodifiable(_profiles);
  }
}
