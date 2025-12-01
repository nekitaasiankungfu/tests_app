// Procrastination and Productivity Style Test
// 24 вопроса, 4 фактора, ~8 минут

import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Основной класс данных для теста прокрастинации и стиля продуктивности
class ProcrastinationProductivityData {
  /// Получить модель теста
  static TestModel getProcrastinationProductivityTest() {
    return TestModel(
      id: 'procrastination_productivity_style_v1',
      categoryId: 'emotional',
      title: {
        'ru': 'Прокрастинация и стиль продуктивности',
        'en': 'Procrastination and Productivity Style',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional Wellbeing',
      },
      description: {
        'ru': 'Тест помогает понять, почему вы откладываете важные дела, и какой стиль работы лучше поддерживает вашу продуктивность. '
            'Мы разбираем эмоциональные причины (страх неудачи, скука, избегание неприятных задач), организационные факторы '
            '(хаос в делах, отсутствие структуры), перфекционизм и уровень ресурса.\n\n'
            'Результат показывает, какие механизмы прокрастинации у вас ведущие и какие настройки рабочего дня, планирования '
            'и заботы о себе помогут легче переходить от «я знаю, что хочу» к «я действительно делаю». '
            'Тест не является клинической диагностикой, а инструментом саморефлексии и планирования изменений.',
        'en': 'This questionnaire helps you understand why you put off important tasks and which work style best supports your productivity. '
            'It covers emotional reasons (fear of failure, boredom, avoiding unpleasant tasks), organizational factors '
            '(chaos in tasks, lack of structure), perfectionism, and your energy level.\n\n'
            'The result highlights your main procrastination drivers and suggests workday, planning and self-care adjustments '
            'that make it easier to move from "I know what I want" to "I actually do it". '
            'This is not a clinical diagnostic tool but a self-reflection and change-planning instrument.',
      },
      estimatedTime: 15,
      type: TestType.multiFactor,
      factorIds: [
        'emotional_procrastination',
        'organizational_procrastination',
        'perfectionistic_procrastination',
        'energy_resource',
      ],
      questions: _getQuestions(),
    );
  }

  /// Определить профиль на основе процентов факторов (highest score)
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_emotional_driver';

    // Найти фактор с максимальным процентом
    String maxFactor = percentages.keys.first;
    double maxValue = percentages[maxFactor] ?? 0;

    for (final entry in percentages.entries) {
      if (entry.value > maxValue) {
        maxValue = entry.value;
        maxFactor = entry.key;
      }
    }

    // Определить профиль по доминирующему фактору
    switch (maxFactor) {
      case 'emotional_procrastination':
        return 'profile_emotional_driver';
      case 'organizational_procrastination':
        return 'profile_organizational_driver';
      case 'perfectionistic_procrastination':
        return 'profile_perfectionistic_driver';
      case 'energy_resource':
        return 'profile_energy_driver';
      default:
        return 'profile_emotional_driver';
    }
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  // ============================================================
  // PROFILES (4 профиля на основе dominant scale)
  // ============================================================

  static final Map<String, TestProfile> _profiles = {
    'profile_emotional_driver': TestProfile(
      id: 'profile_emotional_driver',
      name: {
        'ru': 'Эмоциональный драйвер прокрастинации',
        'en': 'Emotional Procrastination Driver',
      },
      description: {
        'ru': 'Откладывание дел связано прежде всего с эмоциями: тревогой, страхом неудачи, скукой или избеганием неприятных переживаний. '
            'Вы можете знать, что нужно делать, и даже иметь план, но эмоциональный барьер мешает начать или продолжить работу.',
        'en': 'Procrastination is mainly driven by emotions: anxiety, fear of failure, boredom or avoiding unpleasant feelings. '
            'You may know what needs to be done and even have a plan, but an emotional barrier prevents you from starting or continuing.',
      },
      whyThisProfile: {
        'ru': 'Эмоциональная прокрастинация — ваш доминирующий фактор откладывания дел',
        'en': 'Emotional procrastination is your dominant factor in putting things off',
      },
      strengths: {
        'ru': [
          'Вы чувствительны к эмоциональному состоянию и можете распознавать триггеры',
          'Осознание эмоционального барьера — первый шаг к его преодолению',
          'Вы способны действовать эффективно, когда эмоции поддерживают',
        ],
        'en': [
          'You are sensitive to emotional states and can recognize triggers',
          'Awareness of emotional barriers is the first step to overcoming them',
          'You can act effectively when emotions are supportive',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Тревога или страх оценки могут парализовать даже простые действия',
          'Ожидание «правильного настроения» откладывает старт задач',
          'Скучные или неприятные задачи часто игнорируются',
        ],
        'en': [
          'Anxiety or fear of judgment can paralyze even simple actions',
          'Waiting for the "right mood" delays starting tasks',
          'Boring or unpleasant tasks are often ignored',
        ],
      },
      recommendations: {
        'ru': [
          'Разбивайте задачи на микро-шаги (5-10 минут) чтобы снизить эмоциональный порог',
          'Используйте техники самоподдержки: мягкий внутренний диалог вместо самокритики',
          'Ставьте таймер на 10-15 минут для старта — действие само снижает тревогу',
          'Признавайте эмоции без борьбы: «Да, это неприятно, И я могу сделать шаг»',
          'Работайте с терапевтом/коучем если эмоциональное избегание хроническое',
        ],
        'en': [
          'Break tasks into micro-steps (5-10 min) to lower the emotional barrier',
          'Use self-supportive inner dialogue instead of harsh self-criticism',
          'Set a timer for 10-15 minutes to start — action itself reduces anxiety',
          'Acknowledge emotions without fighting: "Yes, this is unpleasant, AND I can take a step"',
          'Work with a therapist/coach if emotional avoidance is chronic',
        ],
      },
      tryToday: {
        'ru': 'Выберите одну неприятную задачу и поставьте таймер на 10 минут. Просто начните — вы всегда можете остановиться.',
        'en': 'Pick one unpleasant task and set a timer for 10 minutes. Just start — you can always stop.',
      },
      inspiringConclusion: {
        'ru': 'Эмоции — не враги продуктивности. Научитесь действовать С ними, а не вопреки им, и прокрастинация отступит.',
        'en': 'Emotions are not enemies of productivity. Learn to act WITH them, not against them, and procrastination will retreat.',
      },
    ),
    'profile_organizational_driver': TestProfile(
      id: 'profile_organizational_driver',
      name: {
        'ru': 'Организационный драйвер прокрастинации',
        'en': 'Organizational Procrastination Driver',
      },
      description: {
        'ru': 'Откладывание дел связано с отсутствием структуры, приоритизации и понятных шагов. '
            'Хаос в задачах, размытые цели или слишком большие проекты без разбивки создают ощущение перегрузки, '
            'и вместо того чтобы двигаться вперёд, вы застреваете в планировании или переключаетесь между задачами.',
        'en': 'Procrastination is driven by lack of structure, prioritization and clear steps. '
            'Task chaos, vague goals or overly large projects without breakdown create a sense of overload, '
            'and instead of moving forward you get stuck in planning or jump between tasks.',
      },
      whyThisProfile: {
        'ru': 'Организационная прокрастинация — ваш доминирующий фактор откладывания дел',
        'en': 'Organizational procrastination is your dominant factor in putting things off',
      },
      strengths: {
        'ru': [
          'Когда есть чёткая структура и план, вы действуете эффективно',
          'Вы способны быстро двигаться при понятных дедлайнах',
          'Осознание потребности в системе — путь к её созданию',
        ],
        'en': [
          'When there is clear structure and a plan, you act effectively',
          'You can move fast when deadlines are clear',
          'Awareness of the need for a system is the path to creating one',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Большие задачи без разбивки кажутся непреодолимыми',
          'Отсутствие приоритизации ведёт к прыжкам между делами',
          'Забываете задачи, если не записали или не поставили напоминание',
        ],
        'en': [
          'Large tasks without breakdown seem overwhelming',
          'Lack of prioritization leads to jumping between tasks',
          'Forget tasks if you didn\'t write them down or set reminders',
        ],
      },
      recommendations: {
        'ru': [
          'Выберите ОДИН основной инструмент планирования и держите все задачи там',
          'Формулируйте задачи как конкретные действия на 30-60 минут, не абстрактные цели',
          'Начинайте день с расстановки приоритетов: 1-3 ключевые задачи',
          'Разбивайте проекты на этапы с микро-дедлайнами',
          'Используйте техники GTD, Kanban или Bullet Journal для структуры',
        ],
        'en': [
          'Choose ONE main planning tool and keep all tasks there',
          'Formulate tasks as concrete 30-60 minute actions, not abstract goals',
          'Start the day by prioritizing: 1-3 key tasks',
          'Break projects into stages with micro-deadlines',
          'Use GTD, Kanban or Bullet Journal techniques for structure',
        ],
      },
      tryToday: {
        'ru': 'Выберите один крупный проект и разбейте его на 5-7 конкретных шагов по 30-60 минут каждый.',
        'en': 'Pick one large project and break it into 5-7 concrete steps of 30-60 minutes each.',
      },
      inspiringConclusion: {
        'ru': 'Хаос — не ваша судьба. Правильная система планирования превращает прокрастинацию в прогресс.',
        'en': 'Chaos is not your destiny. The right planning system turns procrastination into progress.',
      },
    ),
    'profile_perfectionistic_driver': TestProfile(
      id: 'profile_perfectionistic_driver',
      name: {
        'ru': 'Перфекционистский драйвер прокрастинации',
        'en': 'Perfectionistic Procrastination Driver',
      },
      description: {
        'ru': 'Откладывание связано с завышенными стандартами и страхом сделать «не идеально». '
            'Вы можете застревать на подготовке («ещё не готов(а)»), бесконечных доработках или откладывать старт, '
            'потому что боитесь показать несовершенный результат. Парадокс: стремление к совершенству мешает действию.',
        'en': 'Procrastination is driven by high standards and fear of doing things less than perfectly. '
            'You may get stuck in preparation ("not ready yet"), endless revisions or delay starting '
            'because you fear showing an imperfect result. Paradox: the pursuit of perfection prevents action.',
      },
      whyThisProfile: {
        'ru': 'Перфекционистская прокрастинация — ваш доминирующий фактор откладывания дел',
        'en': 'Perfectionistic procrastination is your dominant factor in putting things off',
      },
      strengths: {
        'ru': [
          'Вы способны создавать качественные результаты когда дела завершены',
          'Высокие стандарты могут быть конкурентным преимуществом',
          'Осознание перфекционизма позволяет научиться гибкости',
        ],
        'en': [
          'You can create high-quality results when things are finished',
          'High standards can be a competitive advantage',
          'Awareness of perfectionism allows learning flexibility',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Страх несовершенства блокирует старт задач',
          'Бесконечные доработки вместо движения вперёд',
          'Слишком много времени на подготовку и сбор информации',
          'Трудно показать промежуточные результаты',
        ],
        'en': [
          'Fear of imperfection blocks starting tasks',
          'Endless revisions instead of moving forward',
          'Too much time spent on preparation and gathering info',
          'Hard to show intermediate results',
        ],
      },
      recommendations: {
        'ru': [
          'Используйте принцип «черновик сначала»: быстрый вариант, затем доработка',
          'Ограничивайте время на задачу таймбоксом — после дедлайна работа считается готовой',
          'Отделяйте ценность результата от самооценки — продукт не равен вам',
          'Практикуйте показ незавершённой работы в безопасной среде',
          'Спрашивайте себя: «Достаточно ли хорошо для текущей цели?» вместо «Идеально ли это?»',
        ],
        'en': [
          'Use "draft first" principle: quick version, then refinement',
          'Limit task time with timeboxing — when time is up, work is considered done',
          'Separate outcome value from self-worth — the product is not you',
          'Practice showing unfinished work in a safe environment',
          'Ask yourself: "Is it good enough for the current goal?" instead of "Is it perfect?"',
        ],
      },
      tryToday: {
        'ru': 'Выберите задачу и установите жёсткий таймбокс 45 минут. Что получится — то и достаточно хорошо.',
        'en': 'Pick a task and set a strict 45-minute timebox. Whatever you get is good enough.',
      },
      inspiringConclusion: {
        'ru': '«Достаточно хорошо» — не компромисс, а мудрость. Прогресс важнее совершенства.',
        'en': '"Good enough" is not a compromise but wisdom. Progress matters more than perfection.',
      },
    ),
    'profile_energy_driver': TestProfile(
      id: 'profile_energy_driver',
      name: {
        'ru': 'Энергетический драйвер прокрастинации',
        'en': 'Energy-Related Procrastination Driver',
      },
      description: {
        'ru': 'Откладывание связано с усталостью, нестабильной энергией и недостатком восстановления. '
            'Вы можете хотеть делать задачи, но физически или ментально чувствуете себя истощённым(ой). '
            'К концу дня (или недели) ресурс падает, и даже простые дела кажутся непреодолимыми.',
        'en': 'Procrastination is driven by fatigue, unstable energy and insufficient recovery. '
            'You may want to do tasks but feel physically or mentally drained. '
            'By the end of the day (or week) your resources drop and even simple tasks feel overwhelming.',
      },
      whyThisProfile: {
        'ru': 'Энергетический фактор — ваш доминирующий драйвер откладывания дел',
        'en': 'Energy factor is your dominant driver in putting things off',
      },
      strengths: {
        'ru': [
          'Когда есть энергия, вы действуете эффективно и продуктивно',
          'Вы способны распознавать свои пиковые часы работоспособности',
          'Осознание роли восстановления — путь к устойчивой продуктивности',
        ],
        'en': [
          'When you have energy, you act efficiently and productively',
          'You can recognize your peak performance hours',
          'Awareness of recovery\'s role is the path to sustainable productivity',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Часто откладываете дела в надежде на будущую энергию',
          'К концу дня выжаты и неспособны на небольшие задачи',
          'Редко делаете паузы, в итоге выгораете',
          'Недостаточно ресурса для личных проектов после работы',
        ],
        'en': [
          'Often delay tasks hoping for future energy',
          'Drained by end of day and unable to do small tasks',
          'Rarely take breaks and eventually burn out',
          'Not enough energy for personal projects after work',
        ],
      },
      recommendations: {
        'ru': [
          'Определите свои «пиковые часы» и ставьте важные задачи на это время',
          'Планируйте короткие перерывы и восстановление, не работайте до истощения',
          'Следите за базовой гигиеной: сон, питание, движение — фундамент продуктивности',
          'Используйте технику Pomodoro для баланса работы и отдыха',
          'Делегируйте или откажитесь от задач в периоды низкой энергии',
        ],
        'en': [
          'Identify your "peak hours" and schedule important tasks there',
          'Plan short breaks and recovery instead of working until exhausted',
          'Take care of basics: sleep, food and movement are productivity foundations',
          'Use Pomodoro technique for work-rest balance',
          'Delegate or decline tasks during low-energy periods',
        ],
      },
      tryToday: {
        'ru': 'Определите свой лучший час сегодня и заблокируйте его для ОДНОЙ важной задачи. Защитите это время.',
        'en': 'Identify your best hour today and block it for ONE important task. Protect that time.',
      },
      inspiringConclusion: {
        'ru': 'Энергия — не бесконечный ресурс. Научитесь управлять ею, и продуктивность станет устойчивой.',
        'en': 'Energy is not an infinite resource. Learn to manage it and productivity becomes sustainable.',
      },
    ),
  };

  // ============================================================
  // FACTOR NAMES
  // ============================================================

  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'emotional_procrastination': {
        'ru': 'Эмоциональная прокрастинация',
        'en': 'Emotional procrastination',
      },
      'organizational_procrastination': {
        'ru': 'Организационная прокрастинация',
        'en': 'Organizational procrastination',
      },
      'perfectionistic_procrastination': {
        'ru': 'Перфекционистская прокрастинация',
        'en': 'Perfectionistic procrastination',
      },
      'energy_resource': {
        'ru': 'Энергия и ресурс',
        'en': 'Energy and resource',
      },
    };
  }

  // ============================================================
  // FACTOR INTERPRETATIONS
  // ============================================================

  static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
    // NaN protection
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    if (percentage >= 70) {
      return _getHighInterpretation(factorId);
    } else if (percentage >= 40) {
      return _getModerateInterpretation(factorId);
    } else {
      return _getLowInterpretation(factorId);
    }
  }

  static Map<String, String> _getLowInterpretation(String factorId) {
    final interpretations = {
      'emotional_procrastination': {
        'ru': 'Эмоции редко тормозят действия. Вы можете действовать даже при тревоге или скуке.',
        'en': 'Emotions rarely block action. You can act even when anxious or bored.',
      },
      'organizational_procrastination': {
        'ru': 'Структура в целом работает. У вас достаточно систем планирования.',
        'en': 'Structure generally works. Your planning systems are usually enough.',
      },
      'perfectionistic_procrastination': {
        'ru': 'Перфекционизм почти не мешает. Вы умеете завершать без излишнего шлифования.',
        'en': 'Perfectionism barely interferes. You can finish without excessive polishing.',
      },
      'energy_resource': {
        'ru': 'Ресурс в целом стабилен. Усталость редко главная причина откладывания.',
        'en': 'Energy is mostly stable. Fatigue rarely the main reason for delay.',
      },
    };
    return interpretations[factorId] ?? {'ru': 'Неизвестный фактор', 'en': 'Unknown factor'};
  }

  static Map<String, String> _getModerateInterpretation(String factorId) {
    final interpretations = {
      'emotional_procrastination': {
        'ru': 'Эмоции иногда мешают делу. Настроение и страх оценки заметно влияют.',
        'en': 'Emotions sometimes get in the way. Mood and fear of evaluation noticeably affect you.',
      },
      'organizational_procrastination': {
        'ru': 'Нужна более чёткая организация. Часть откладывания из-за расплывчатых задач.',
        'en': 'Needs clearer organization. Some delays happen because tasks are vague.',
      },
      'perfectionistic_procrastination': {
        'ru': 'Местами завышенные стандарты. Иногда застреваете на доработках.',
        'en': 'Somewhat high standards. Sometimes get stuck reworking things.',
      },
      'energy_resource': {
        'ru': 'Энергия влияет на продуктивность. Колебания ресурса заметны.',
        'en': 'Energy affects productivity. Energy swings are noticeable.',
      },
    };
    return interpretations[factorId] ?? {'ru': 'Неизвестный фактор', 'en': 'Unknown factor'};
  }

  static Map<String, String> _getHighInterpretation(String factorId) {
    final interpretations = {
      'emotional_procrastination': {
        'ru': 'Эмоции — главный тормоз. Откладывание часто связано с тревогой, стыдом или скукой.',
        'en': 'Emotions are the main brake. Delays often linked to anxiety, shame or boredom.',
      },
      'organizational_procrastination': {
        'ru': 'Хаос сильно тормозит действия. Основная сложность — отсутствие системы.',
        'en': 'Chaos strongly blocks action. Main issue is lack of a clear system.',
      },
      'perfectionistic_procrastination': {
        'ru': 'Перфекционизм — главный тормоз. Страх несовершенства серьёзно мешает.',
        'en': 'Perfectionism is the main brake. Fear of imperfection seriously interferes.',
      },
      'energy_resource': {
        'ru': 'Низкий ресурс — ключевой фактор. Часто откладываете из-за усталости.',
        'en': 'Low energy is a key factor. Often delay due to fatigue.',
      },
    };
    return interpretations[factorId] ?? {'ru': 'Неизвестный фактор', 'en': 'Unknown factor'};
  }

  // ============================================================
  // QUESTIONS (24 questions, 4 factors, 9 reversed)
  // ============================================================

  static List<QuestionModel> _getQuestions() {
    final answers = _getLikertAnswers();

    return [
      // ========================================================================
      // EMOTIONAL_PROCRASTINATION (6 questions: 1-4, 17-18)
      // Reversed: Q3
      // ========================================================================
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я откладываю важные задачи, если они вызывают у меня тревогу или дискомфорт.',
          'en': 'I postpone important tasks when they make me feel anxious or uncomfortable.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Если я в плохом настроении, мне сложно даже начать с простых дел.',
          'en': 'When I\'m in a bad mood, it is hard for me to start even simple tasks.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Даже если боюсь не справиться, я обычно всё равно берусь за задачу довольно быстро.',
          'en': 'Even if I\'m afraid I might fail, I usually still start the task fairly quickly.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я тяну с началом дела, пока не почувствую «правильное» вдохновение или настроение.',
          'en': 'I delay starting tasks until I feel the "right" inspiration or mood.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: false,
      ),

      // ========================================================================
      // ORGANIZATIONAL_PROCRASTINATION (6 questions: 5-8, 19-20)
      // Reversed: Q6, Q8, Q20
      // ========================================================================
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Я часто откладываю задачи, потому что не до конца понимаю, с чего начать.',
          'en': 'I often put tasks off because I don\'t quite understand where to start.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Мой список дел обычно чётко структурирован и помогает двигаться вперёд без откладывания.',
          'en': 'My to-do list is usually well structured and helps me move forward without much procrastination.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я часто перепрыгиваю между задачами и в итоге мало что продвигаю достаточно далеко.',
          'en': 'I often jump between tasks and end up not moving many of them forward enough.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Большие задачи я разбиваю на маленькие шаги, поэтому реже откладываю их.',
          'en': 'I break big tasks into smaller steps, which helps me procrastinate on them less.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: true,
      ),

      // ========================================================================
      // PERFECTIONISTIC_PROCRASTINATION (6 questions: 9-12, 21-22)
      // Reversed: Q11, Q22
      // ========================================================================
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я могу долго откладывать задачу, потому что боюсь сделать её недостаточно хорошо.',
          'en': 'I can delay a task for a long time because I\'m afraid not to do it well enough.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я часто переделываю уже готовую работу, вместо того чтобы двигаться дальше.',
          'en': 'I often rework tasks that are already done instead of moving on.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Даже если результат неидеален, мне проще закончить и перейти к следующему шагу.',
          'en': 'Even if the result is not perfect, it is easier for me to finish and move on.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Перед началом я трачу слишком много времени на подготовку и сбор информации.',
          'en': 'Before starting, I spend too much time preparing and gathering information.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: false,
      ),

      // ========================================================================
      // ENERGY_RESOURCE (6 questions: 13-16, 23-24)
      // Reversed: Q15, Q16, Q24
      // ========================================================================
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я часто откладываю дела в надежде, что позже появится больше сил или энергии.',
          'en': 'I often delay tasks hoping that I will have more strength or energy later.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'К концу дня я настолько выжат(а), что даже небольшие задачи кажутся непреодолимыми.',
          'en': 'By the end of the day I feel so drained that even small tasks seem overwhelming.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я умею планировать важные задачи на те часы, когда чувствую максимум энергии.',
          'en': 'I know how to schedule important tasks for the hours when I have the most energy.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'После рабочего дня у меня остаётся достаточно ресурса на личные проекты.',
          'en': 'After my main workday I still have enough energy left for personal projects.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Когда думаю о возможной неудаче, мне проще заняться чем-то более приятным, чем продолжать работать над задачей.',
          'en': 'When I think about possible failure, it is easier to switch to something pleasant than to keep working on the task.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Скучные или однообразные задачи почти всегда оказываются в конце моего списка дел.',
          'en': 'Boring or repetitive tasks almost always end up at the bottom of my to-do list.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Я часто забываю о задачах, потому что не записал(а) их или не поставил(а) напоминание.',
          'en': 'I often forget tasks because I didn\'t write them down or set a reminder.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Если у задачи есть чёткий дедлайн и понятный план, я почти не тяну с её выполнением.',
          'en': 'If a task has a clear deadline and a clear plan, I almost don\'t procrastinate on it.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Мне трудно показать промежуточный результат, пока он не выглядит достаточно «завершённым».',
          'en': 'It is hard for me to show a draft or intermediate result until it looks "finished enough".',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я спокойно принимаю, что некоторые дела можно сделать «достаточно хорошо», а не идеально.',
          'en': 'I\'m okay with the idea that some things can be done "good enough" and not perfectly.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я редко делаю паузы и в итоге выгораю, после чего резко падает продуктивность.',
          'en': 'I rarely take breaks and eventually burn out, after which my productivity drops sharply.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Регулярный сон, отдых и движение помогают мне сохранять устойчивую работоспособность.',
          'en': 'Regular sleep, rest and physical activity help me maintain stable productivity.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: true,
      ),

      // ========================================================================
      // ДОПОЛНИТЕЛЬНЫЕ ВОПРОСЫ ДЛЯ ДЕТАЛИЗАЦИИ (Q25-Q48)
      // ========================================================================

      // EMOTIONAL_PROCRASTINATION (6 additional: Q25-Q27, Q43-Q45)
      // Reversed: Q27
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Когда передо мной сложная задача, я ищу способы отвлечься (соцсети, сериалы, бытовые дела).',
          'en': 'When faced with a difficult task, I look for ways to distract myself (social media, shows, chores).',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Я боюсь, что не справлюсь, поэтому не начинаю — так кажется безопаснее.',
          'en': 'I\'m afraid I won\'t manage, so I don\'t start — it seems safer that way.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Я легко приступаю к делу, даже если результат пока неясен.',
          'en': 'I easily start tasks even if the outcome is still unclear.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: true,
      ),

      // ORGANIZATIONAL_PROCRASTINATION (6 additional: Q28-Q30, Q46-Q48)
      // Reversed: Q30, Q48
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'У меня нет чёткого плана на день, и я не знаю, с чего начать.',
          'en': 'I don\'t have a clear plan for the day and don\'t know where to start.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Задачи накапливаются, потому что я не расставляю приоритеты.',
          'en': 'Tasks pile up because I don\'t set priorities.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я хорошо веду список дел и регулярно его обновляю.',
          'en': 'I maintain my to-do list well and update it regularly.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: true,
      ),

      // PERFECTIONISTIC_PROCRASTINATION (6 additional: Q31-Q33, Q37-Q39)
      // Reversed: Q32, Q39
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Неприятные эмоции (скука, раздражение, страх) мешают мне взяться за задачу.',
          'en': 'Unpleasant emotions (boredom, irritation, fear) prevent me from tackling a task.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Я могу работать продуктивно, даже если не в настроении.',
          'en': 'I can work productively even when I\'m not in the mood.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Я откладываю, потому что хочу сделать идеально, а это невозможно прямо сейчас.',
          'en': 'I procrastinate because I want to do it perfectly, but that\'s impossible right now.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: false,
      ),

      // ENERGY_RESOURCE (6 additional: Q34-Q36, Q40-Q42)
      // Reversed: Q35, Q40
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Я часто откладываю задачи, потому что не понимаю, как их правильно разбить на шаги.',
          'en': 'I often procrastinate because I don\'t understand how to break tasks into proper steps.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Я быстро справляюсь с задачей, если у меня есть пошаговый алгоритм.',
          'en': 'I handle tasks quickly if I have a step-by-step algorithm.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Мне сложно начать, если я не уверен(а), что результат будет на высоте.',
          'en': 'It\'s hard for me to start if I\'m not sure the result will be excellent.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я критикую себя за ошибки и боюсь, что другие заметят недостатки.',
          'en': 'I criticize myself for mistakes and fear that others will notice flaws.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Я не начинаю, потому что «сейчас не лучшие условия», «не то время дня» и т.д.',
          'en': 'I don\'t start because "conditions aren\'t ideal right now," "wrong time of day," etc.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Я легко принимаю несовершенный результат, если нужно двигаться дальше.',
          'en': 'I easily accept an imperfect result when I need to move forward.',
        },
        answers: answers,
        factorId: 'perfectionistic_procrastination',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'У меня достаточно сил и ресурса, чтобы продуктивно работать.',
          'en': 'I have enough energy and resources to work productively.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Я часто чувствую усталость и не могу заставить себя работать.',
          'en': 'I often feel tired and can\'t make myself work.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Мне трудно сосредоточиться, даже если дело важное.',
          'en': 'It\'s hard for me to concentrate even on important matters.',
        },
        answers: answers,
        factorId: 'energy_resource',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Я ловлю себя на том, что оправдываю откладывание дел внешними причинами.',
          'en': 'I catch myself justifying procrastination with external reasons.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Я спокойно делаю черновик, даже если он далёк от идеала.',
          'en': 'I calmly create drafts even when they\'re far from ideal.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Страх критики или осуждения часто останавливает меня от начала работы.',
          'en': 'Fear of criticism or judgment often stops me from starting work.',
        },
        answers: answers,
        factorId: 'emotional_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Я часто забываю о важных делах, потому что не записываю.',
          'en': 'I often forget important tasks because I don\'t write them down.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Моя работа состоит из множества мелких дел, и я теряюсь в их хаосе.',
          'en': 'My work consists of many small tasks and I get lost in their chaos.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Я регулярно делаю паузы и восстанавливаюсь.',
          'en': 'I regularly take breaks and recover.',
        },
        answers: answers,
        factorId: 'organizational_procrastination',
        isReversed: true,
      ),
    ];
  }

  /// Ответы Likert 5-point (0-4): Никогда - Редко - Иногда - Часто - Всегда
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: '0',
        text: {'ru': 'Никогда', 'en': 'Never'},
        score: 0,
      ),
      AnswerModel(
        id: '1',
        text: {'ru': 'Редко', 'en': 'Rarely'},
        score: 1,
      ),
      AnswerModel(
        id: '2',
        text: {'ru': 'Иногда', 'en': 'Sometimes'},
        score: 2,
      ),
      AnswerModel(
        id: '3',
        text: {'ru': 'Часто', 'en': 'Often'},
        score: 3,
      ),
      AnswerModel(
        id: '4',
        text: {'ru': 'Всегда', 'en': 'Always'},
        score: 4,
      ),
    ];
  }
}
