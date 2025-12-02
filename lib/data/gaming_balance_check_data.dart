import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data access class for Gaming Balance Check Test
/// Legacy Dart implementation (no JSON dependency)
class GamingBalanceCheckData {
  /// Get the complete Gaming Balance Check test
  static TestModel getGamingBalanceCheckTest() {
    return TestModel(
      id: 'gaming_balance_check_v1',
      title: {
        'ru': 'Игровая зависимость и баланс гейминга',
        'en': 'Gaming Addiction & Balance Check',
      },
      description: {
        'ru':
            'Гейминг стал важной частью культуры: игры — это отдых, общение, соревнование и способ проживать сильные эмоции. Но иногда «ещё один матч» незаметно превращается в привычку жертвовать сном, делами и живым общением ради игры. Важно не стыдиться этого, а честно посмотреть, как именно игры встроены в вашу жизнь сейчас.\n\nЭтот тест не ставит диагнозы и не делит людей на «зависимых» и «нормальных». Он мягко исследует четыре аспекта: сколько места игры занимают в вашем времени, насколько сложно вам остановиться, как сильно гейминг влияет на настроение и не страдают ли от него учёба, работа и отношения. Вопросы описывают реальные повседневные ситуации, а не оценивают вас как «хорошего» или «плохого» геймера.\n\nРезультат покажет ваш текущий баланс: где всё ок, а где игры начинают перетягивать на себя слишком много энергии. Это отправная точка, чтобы при желании чуть-чуть перенастроить привычки — так, чтобы и удовольствие от гейминга сохранить, и свою жизнь не превращать в бесконечный «ещё поиграю и спать».',
        'en':
            'Gaming is a big part of modern culture: games are rest, socializing, competition, and a way to experience strong emotions. But sometimes "one more match" quietly turns into a habit of sacrificing sleep, responsibilities, and face-to-face connection for the sake of the game. The goal is not to feel ashamed of this, but to honestly look at how exactly gaming fits into your life right now.\n\nThis test does not diagnose you or split people into "addicted" vs "normal". Instead, it gently explores four aspects: how much time gaming takes, how hard it is to stop, how strongly it affects your mood, and whether study, work, or relationships suffer. The items describe real everyday situations rather than judging you as a "good" or "bad" gamer.\n\nYour results show your current balance: what is fine, and where games may be pulling in too much of your energy. It\'s a starting point for adjusting your habits, if you want to — to keep the fun of gaming without turning your life into a never-ending "just a bit more and then I\'ll sleep".',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      disclaimer: {
        'ru':
            'Этот тест опирается на исследования цифровых привычек и гейминга, а также на модели поведенческих зависимостей и саморегуляции. Он предназначен для самооценки и не является медицинской диагностикой. Отвечайте честно для получения наиболее точных результатов.',
        'en':
            'This test draws on research on digital habits and gaming, as well as models of behavioral addictions and self-regulation. It is for self-assessment and not a medical diagnosis. Answer honestly for the most accurate results.',
      },
      estimatedTime: 7,
      type: TestType.multiFactor,
      factorIds: [
        'time_intrusion',
        'loss_of_control',
        'mood_regulation',
        'balance_disruption'
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'time_intrusion': {
        'ru': 'Игровое время и вторжение в другие сферы',
        'en': 'Gaming Time & Life Intrusion',
      },
      'loss_of_control': {
        'ru': 'Потеря контроля и навязчивое влечение к играм',
        'en': 'Loss of Control & Gaming Urges',
      },
      'mood_regulation': {
        'ru': 'Игры как способ регулировать настроение',
        'en': 'Gaming as Mood Regulation',
      },
      'balance_disruption': {
        'ru': 'Нарушение жизненного баланса из-за гейминга',
        'en': 'Life Balance Disruption from Gaming',
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

  /// Profile determination based on gaming_balance_risk_index
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'low_risk';

    // Calculate gaming_balance_risk_index as average of all 4 factors
    final avgPercentage =
        percentages.values.reduce((a, b) => a + b) / percentages.length;

    if (avgPercentage >= 75) return 'high_risk';
    if (avgPercentage >= 50) return 'elevated_risk';
    if (avgPercentage >= 25) return 'moderate_risk';
    return 'low_risk';
  }

  /// Get profile by ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Get all 24 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1 - time_intrusion
      QuestionModel(
        id: 'q1',
        text: {
          'ru':
              'Бывало, что я планировал(а) поиграть «ещё чуть-чуть», а в итоге застревал(а) на несколько часов.',
          'en':
              'I\'ve planned to play "just a little bit more" and ended up gaming for several hours.',
        },
        factorId: 'time_intrusion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q2 - time_intrusion
      QuestionModel(
        id: 'q2',
        text: {
          'ru':
              'Из-за игр я иногда ложусь спать заметно позже, чем собирался(лась).',
          'en':
              'Because of gaming, I sometimes go to bed much later than I intended.',
        },
        factorId: 'time_intrusion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q3 - time_intrusion
      QuestionModel(
        id: 'q3',
        text: {
          'ru':
              'Бывало, что я опаздывал(а) или срывал(а) планы из-за того, что не мог(ла) вовремя остановить игру.',
          'en':
              'I\'ve been late or messed up plans because I couldn\'t stop playing on time.',
        },
        factorId: 'time_intrusion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q4 - time_intrusion (REVERSED)
      QuestionModel(
        id: 'q4',
        text: {
          'ru':
              'В дни, когда у меня много дел, я без проблем могу не играть вообще.',
          'en':
              'On days when I have a lot to do, I can easily go without gaming at all.',
        },
        factorId: 'time_intrusion',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q5 - time_intrusion
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Игры часто занимают почти всё моё свободное время.',
          'en': 'Games often take up almost all of my free time.',
        },
        factorId: 'time_intrusion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q6 - time_intrusion
      QuestionModel(
        id: 'q6',
        text: {
          'ru':
              'Даже когда у меня есть всего полчаса, я часто предпочитаю запустить игру, а не заняться чем-то другим.',
          'en':
              'Even when I only have half an hour, I often prefer to launch a game rather than do something else.',
        },
        factorId: 'time_intrusion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q7 - loss_of_control
      QuestionModel(
        id: 'q7',
        text: {
          'ru':
              'Когда я играю, мне сложно остановиться на одном матче/уровне — хочется «ещё и ещё».',
          'en':
              'When I\'m playing, it\'s hard to stop after one match/level — I want "one more and one more".',
        },
        factorId: 'loss_of_control',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q8 - loss_of_control
      QuestionModel(
        id: 'q8',
        text: {
          'ru':
              'Я часто даю себе обещание играть меньше, но не придерживаюсь его.',
          'en': 'I often promise myself to play less but don\'t stick to it.',
        },
        factorId: 'loss_of_control',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q9 - loss_of_control (REVERSED)
      QuestionModel(
        id: 'q9',
        text: {
          'ru':
              'Если я заранее решаю, сколько буду играть, я обычно укладываюсь в этот предел.',
          'en':
              'If I decide in advance how long I\'ll play, I usually stick to that limit.',
        },
        factorId: 'loss_of_control',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q10 - loss_of_control
      QuestionModel(
        id: 'q10',
        text: {
          'ru':
              'Я часто думаю об играх, даже когда занят(а) учёбой, работой или другими делами.',
          'en':
              'I often think about games even when I\'m busy with studying, work, or other tasks.',
        },
        factorId: 'loss_of_control',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q11 - loss_of_control
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'Бывает, что после игры я чувствую раздражение на себя, потому что снова провёл(провела) за ней больше времени, чем хотел(а).',
          'en':
              'Sometimes after playing I feel annoyed with myself because I spent more time on it than I wanted to.',
        },
        factorId: 'loss_of_control',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q12 - loss_of_control
      QuestionModel(
        id: 'q12',
        text: {
          'ru':
              'Если несколько дней подряд не получается поиграть, я становлюсь заметно более нервным(ой) или раздражительным(ой).',
          'en':
              'If I can\'t play for several days in a row, I become noticeably more nervous or irritable.',
        },
        factorId: 'loss_of_control',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q13 - mood_regulation
      QuestionModel(
        id: 'q13',
        text: {
          'ru':
              'Я часто использую игры, чтобы отвлечься от неприятных мыслей, проблем или чувств.',
          'en':
              'I often use games to distract myself from unpleasant thoughts, problems, or feelings.',
        },
        factorId: 'mood_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q14 - mood_regulation
      QuestionModel(
        id: 'q14',
        text: {
          'ru':
              'Настроение сильно падает, если игра не идёт: проигрыши, лаги или тиммейты могут вывести меня из себя надолго.',
          'en':
              'My mood drops a lot when a game goes badly: losses, lags, or teammates can put me in a bad mood for a long time.',
        },
        factorId: 'mood_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q15 - mood_regulation
      QuestionModel(
        id: 'q15',
        text: {
          'ru':
              'После нескольких часов игры я чувствую себя скорее уставшим(ой) и опустошённым(ой), чем отдохнувшим(ой).',
          'en':
              'After several hours of gaming I feel more tired and drained than rested.',
        },
        factorId: 'mood_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q16 - mood_regulation (REVERSED)
      QuestionModel(
        id: 'q16',
        text: {
          'ru':
              'У меня есть и другие способы расслабиться, кроме игр, и я периодически ими пользуюсь.',
          'en':
              'I have other ways to relax besides games, and I actually use them from time to time.',
        },
        factorId: 'mood_regulation',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q17 - mood_regulation
      QuestionModel(
        id: 'q17',
        text: {
          'ru':
              'Бывает, что игры постепенно заменяют мне живое общение или занятия, которые раньше приносили радость.',
          'en':
              'Sometimes games gradually replace face-to-face communication or activities that used to bring me joy.',
        },
        factorId: 'mood_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q18 - mood_regulation
      QuestionModel(
        id: 'q18',
        text: {
          'ru':
              'Моё общее настроение за день заметно зависит от того, удалось ли мне нормально поиграть.',
          'en':
              'My overall mood for the day strongly depends on whether I managed to play properly.',
        },
        factorId: 'mood_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q19 - balance_disruption
      QuestionModel(
        id: 'q19',
        text: {
          'ru':
              'Из-за игр я иногда забываю поесть вовремя или сделать базовые дела по дому и для себя.',
          'en':
              'Because of gaming, I sometimes forget to eat on time or do basic chores and self-care tasks.',
        },
        factorId: 'balance_disruption',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q20 - balance_disruption
      QuestionModel(
        id: 'q20',
        text: {
          'ru':
              'Друзья или близкие иногда жалуются, что я слишком много времени провожу в играх.',
          'en':
              'Friends or family sometimes complain that I spend too much time gaming.',
        },
        factorId: 'balance_disruption',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q21 - balance_disruption (REVERSED)
      QuestionModel(
        id: 'q21',
        text: {
          'ru':
              'Если кто-то из близких просит меня о помощи или общении, я могу спокойно отложить игру.',
          'en':
              'If someone close asks for my help or wants to talk, I can put the game aside without much trouble.',
        },
        factorId: 'balance_disruption',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q22 - balance_disruption
      QuestionModel(
        id: 'q22',
        text: {
          'ru':
              'Мне бывает легче отменить встречу или созвон, чем отказаться от запланированной игровой сессии.',
          'en':
              'It\'s sometimes easier for me to cancel a meetup or call than to cancel a planned gaming session.',
        },
        factorId: 'balance_disruption',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q23 - balance_disruption
      QuestionModel(
        id: 'q23',
        text: {
          'ru':
              'Учёба или работа иногда страдают из-за того, что я играл(а) до поздней ночи или думал(а) об играх вместо заданий.',
          'en':
              'My study or work sometimes suffers because I gamed late into the night or thought about games instead of tasks.',
        },
        factorId: 'balance_disruption',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q24 - balance_disruption (REVERSED)
      QuestionModel(
        id: 'q24',
        text: {
          'ru':
              'Я воспринимаю игры как одну из частей жизни, а не как единственно важную активность.',
          'en':
              'I see games as just one part of my life, not as the only activity that really matters.',
        },
        factorId: 'balance_disruption',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
    ];
  }

  /// Frequency scale answers (0-4)
  static List<AnswerModel> _getFrequencyAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Никогда',
          'en': 'Never',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Редко',
          'en': 'Rarely',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Иногда',
          'en': 'Sometimes',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Часто',
          'en': 'Often',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Всегда',
          'en': 'Always',
        },
        score: 4,
      ),
    ];
  }

  /// Interpretations for each factor
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'time_intrusion': {
        'low': {
          'title_ru': '✅ Здоровое управление временем',
          'title_en': '✅ Healthy Time Management',
          'description_ru':
              'Вы хорошо контролируете игровое время. Игры не вытесняют сон, дела и другие активности. Вы способны останавливаться, когда нужно.',
          'description_en':
              'You manage your gaming time well. Games don\'t displace sleep, tasks, or other activities. You can stop when needed.',
        },
        'medium': {
          'title_ru': '⚠️ Периодические перекосы',
          'title_en': '⚠️ Occasional Imbalance',
          'description_ru':
              'Иногда игры забирают больше времени, чем планировалось. Бывают "просиживания" до поздней ночи или срыв планов, но это не системная проблема.',
          'description_en':
              'Sometimes games take more time than planned. There are occasions of late-night gaming or missed plans, but it\'s not a systemic problem.',
        },
        'high': {
          'title_ru': '🚨 Серьёзное вторжение в жизнь',
          'title_en': '🚨 Serious Life Intrusion',
          'description_ru':
              'Игры регулярно забирают время у сна, дел и других активностей. Вам сложно ограничить игровое время, даже когда это нужно. Рекомендуется установить чёткие временные границы.',
          'description_en':
              'Games regularly take time away from sleep, tasks, and other activities. It\'s hard for you to limit gaming time even when necessary. Setting clear time boundaries is recommended.',
        },
      },
      'loss_of_control': {
        'low': {
          'title_ru': '✅ Хороший самоконтроль',
          'title_en': '✅ Good Self-Control',
          'description_ru':
              'Вы способны останавливаться, придерживаться лимитов и не зацикливаться на играх вне игровых сессий. У вас здоровое отношение к гейминг-привычкам.',
          'description_en':
              'You can stop, stick to limits, and don\'t obsess about games outside gaming sessions. You have a healthy relationship with gaming habits.',
        },
        'medium': {
          'title_ru': '⚠️ Периодическая потеря контроля',
          'title_en': '⚠️ Occasional Loss of Control',
          'description_ru':
              'Иногда "ещё один матч" превращается в несколько часов. Вы даёте себе обещания играть меньше, но не всегда выполняете их. Стоит поработать над стратегиями остановки.',
          'description_en':
              '"One more match" sometimes turns into several hours. You promise yourself to play less but don\'t always follow through. Working on stopping strategies would help.',
        },
        'high': {
          'title_ru': '🚨 Навязчивое влечение к играм',
          'title_en': '🚨 Compulsive Gaming Urges',
          'description_ru':
              'Вам очень сложно остановиться. Вы часто думаете об играх, даже когда заняты другим. Без гейминга становитесь раздражительным. Это признаки потери контроля — важно обратиться за помощью.',
          'description_en':
              'It\'s very hard for you to stop. You often think about games even when busy with other things. Without gaming, you become irritable. These are signs of loss of control — seeking help is important.',
        },
      },
      'mood_regulation': {
        'low': {
          'title_ru': '✅ Здоровая эмоциональная регуляция',
          'title_en': '✅ Healthy Emotional Regulation',
          'description_ru':
              'Ваше настроение не зависит от игр. У вас есть другие способы отдыха и совладания со стрессом. Игры — один из источников удовольствия, но не единственный.',
          'description_en':
              'Your mood doesn\'t depend on gaming. You have other ways to relax and cope with stress. Games are one source of pleasure, but not the only one.',
        },
        'medium': {
          'title_ru': '⚠️ Умеренная зависимость настроения',
          'title_en': '⚠️ Moderate Mood Dependence',
          'description_ru':
              'Игры часто используются для ухода от проблем или поднятия настроения. Неудачи в игре сильно влияют на эмоциональное состояние. Стоит развивать другие стратегии копинга.',
          'description_en':
              'Games are often used to escape problems or boost mood. In-game failures strongly affect emotional state. Developing other coping strategies would help.',
        },
        'high': {
          'title_ru': '🚨 Игры как основной регулятор эмоций',
          'title_en': '🚨 Gaming as Primary Emotion Regulator',
          'description_ru':
              'Ваше настроение сильно зависит от гейминга. Игры стали главным способом справляться с негативом, вытесняя другие занятия. После игры часто чувствуете опустошение. Это нездоровый паттерн — важна профессиональная поддержка.',
          'description_en':
              'Your mood strongly depends on gaming. Games have become the main way to cope with negativity, displacing other activities. You often feel drained after playing. This is an unhealthy pattern — professional support is important.',
        },
      },
      'balance_disruption': {
        'low': {
          'title_ru': '✅ Хороший баланс жизни',
          'title_en': '✅ Good Life Balance',
          'description_ru':
              'Игры не мешают учёбе, работе, отношениям и самообслуживанию. Вы можете отложить игру ради важных дел и людей. Здоровый баланс гейминга и жизни.',
          'description_en':
              'Games don\'t interfere with study, work, relationships, or self-care. You can put games aside for important matters and people. Healthy gaming-life balance.',
        },
        'medium': {
          'title_ru': '⚠️ Периодические конфликты с жизнью',
          'title_en': '⚠️ Occasional Life Conflicts',
          'description_ru':
              'Иногда игры мешают учёбе, работе или общению. Близкие жалуются на чрезмерное время в играх. Стоит расставить приоритеты и защитить важные сферы жизни от гейминга.',
          'description_en':
              'Sometimes games interfere with study, work, or socializing. Close ones complain about excessive gaming time. Setting priorities and protecting important life areas from gaming would help.',
        },
        'high': {
          'title_ru': '🚨 Серьёзное нарушение баланса',
          'title_en': '🚨 Serious Balance Disruption',
          'description_ru':
              'Игры серьёзно мешают учёбе, работе, отношениям и базовому самообслуживанию. Вы часто предпочитаете игру важным делам и людям. Это критический уровень — необходима помощь специалиста.',
          'description_en':
              'Games seriously interfere with study, work, relationships, and basic self-care. You often prefer gaming over important matters and people. This is a critical level — professional help is necessary.',
        },
      },
    };
  }

  /// 4 profiles based on gaming_balance_risk_index thresholds
  static final Map<String, TestProfile> _profiles = {
    'low_risk': TestProfile(
      id: 'low_risk',
      name: {
        'ru': 'Здоровый баланс гейминга и жизни',
        'en': 'Healthy Gaming-Life Balance',
      },
      description: {
        'ru':
            'Ваш результат говорит о том, что в целом вы удерживаете гейминг в разумных рамках. Игры могут быть важной частью вашего досуга, общения и хобби, но при этом сон, учёба/работа и отношения не выглядят систематически «слитыми» ради очередной игровой сессии.\n\nВы, вероятно, умеете останавливаться, когда это нужно, можете переключаться на другие активности и не полностью завязываете настроение на том, удалось ли поиграть. Такой профиль скорее говорит о гибком, осознанном отношении к играм, где вы остаётесь у руля.',
        'en':
            'Your score suggests you maintain gaming within reasonable limits. Games may be an important part of your leisure, social life, and hobbies, but sleep, study/work, and relationships do not seem to be systematically sacrificed for "just one more game".\n\nYou probably can stop when needed, switch to other activities, and your mood is not entirely dependent on whether you played. This profile points to a flexible, conscious relationship with gaming where you stay in charge.',
      },
      whyThisProfile: {
        'ru':
            'Ваш индекс риска нарушения баланса составляет менее 25%. Все четыре показателя (время, контроль, настроение, баланс) находятся в здоровом диапазоне.',
        'en':
            'Your gaming balance risk index is below 25%. All four indicators (time, control, mood, balance) are in the healthy range.',
      },
      strengths: {
        'ru': [
          'Способность останавливаться, когда нужно',
          'Игры не вытесняют сон и важные дела',
          'Настроение не зависит от гейминга',
          'Сохранены другие источники удовольствия',
          'Здоровый самоконтроль и гибкость'
        ],
        'en': [
          'Ability to stop when needed',
          'Games don\'t displace sleep or important matters',
          'Mood doesn\'t depend on gaming',
          'Other sources of pleasure are maintained',
          'Healthy self-control and flexibility'
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск незаметного роста игрового времени',
          'В периоды стресса игры могут стать единственным отдыхом',
          'Важно не терять бдительность и замечать изменения'
        ],
        'en': [
          'Risk of unnoticed growth in gaming time',
          'During stress, games might become the only rest',
          'Important to stay vigilant and notice changes'
        ],
      },
      recommendations: {
        'ru': [
          'Сохраняйте уже существующие границы: время сна, учёба/работа и важные люди остаются приоритетом',
          'Иногда проверяйте, не растёт ли время гейминга незаметно за счёт других приятных занятий',
          'Используйте своё отношение к играм как пример осознанного баланса для друзей, избегая морализаторства',
          'Продолжайте развивать другие хобби и способы отдыха наряду с гейминг',
          'Если заметите изменения в балансе — не игнорируйте сигналы'
        ],
        'en': [
          'Keep your existing boundaries: sleep, study/work, and important people stay priority',
          'Occasionally check whether your gaming time is quietly growing at the expense of other enjoyable activities',
          'Use your approach to gaming as an example of balanced habits for friends, without moralizing',
          'Continue developing other hobbies and ways to relax alongside gaming',
          'If you notice changes in balance — don\'t ignore the signals'
        ],
      },
      tryToday: {
        'ru':
            'Поблагодарите себя за здоровый баланс. Запланируйте одну нон-гейминг активность, которая приносит радость.',
        'en':
            'Thank yourself for maintaining healthy balance. Plan one non-gaming activity that brings joy.',
      },
      inspiringConclusion: {
        'ru':
            'Вы доказываете, что гейминг может быть частью полноценной, сбалансированной жизни. Продолжайте в том же духе!',
        'en':
            'You prove that gaming can be part of a full, balanced life. Keep it up!',
      },
    ),
    'moderate_risk': TestProfile(
      id: 'moderate_risk',
      name: {
        'ru': 'Умеренные перекосы в пользу гейминга',
        'en': 'Moderate Gaming Imbalance',
      },
      description: {
        'ru':
            'Ваш индекс показывает, что в теме гейминга у вас есть и здоровые элементы, и зоны риска. В одних периодах вы хорошо контролируете время в игре, в других — жертвуете сном, делами или общением ради «ещё чуть-чуть».\n\nТакая картина характерна для многих игроков: то вы играете в кайф и без последствий, то внезапно обнаруживаете, что два-три вечера подряд всё остальное ушло на второй план. Важно не ругать себя, а честно заметить, где именно игры чаще всего начинают забирать больше, чем возвращают.',
        'en':
            'Your index indicates a mix of healthy elements and risk zones around gaming. In some periods you manage your playtime well; in others you sacrifice sleep, tasks, or social life for "just a bit more".\n\nThis pattern is common: sometimes you game for fun with no consequences, and then suddenly realize that for several evenings in a row everything else was pushed aside. The key is not self-blame but honestly noticing where games tend to take more than they give you.',
      },
      whyThisProfile: {
        'ru':
            'Ваш индекс риска нарушения баланса составляет 25-49%. Один или несколько показателей находятся в зоне внимания.',
        'en':
            'Your gaming balance risk index is 25-49%. One or more indicators are in the attention zone.',
      },
      strengths: {
        'ru': [
          'Осознаёте, что есть перекосы',
          'Способны контролировать время в некоторые периоды',
          'Не игнорируете проблему',
          'Есть ресурсы для изменений'
        ],
        'en': [
          'Aware that imbalances exist',
          'Can control time in some periods',
          'Don\'t ignore the problem',
          'Have resources for change'
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск перехода в elevated_risk без вмешательства',
          'Периодическое жертвование сном и делами',
          'Настроение может сильно зависеть от игр',
          'Нужна работа над стратегиями самоконтроля'
        ],
        'en': [
          'Risk of moving to elevated_risk without intervention',
          'Occasional sacrifice of sleep and tasks',
          'Mood may strongly depend on games',
          'Need to work on self-control strategies'
        ],
      },
      recommendations: {
        'ru': [
          'Выберите одну сферу, которую хотелось бы чуть больше защитить от игр (сон, учёба/работа, общение) и поставьте там мягкие правила',
          'Попробуйте заранее планировать, сколько времени вы играете в будни, и отмечать, как вы себя чувствуете, когда придерживаетесь плана',
          'Обратите внимание, в какие моменты вы чаще всего уходите в игры (скука, стресс, одиночество) — это подскажет, какие потребности можно закрывать более экологично',
          'Установите "безигровые окна" перед сном или в загруженное время',
          'Попросите близких мягко напоминать, когда время игры затягивается'
        ],
        'en': [
          'Pick one area you\'d like to protect a bit more from gaming (sleep, study/work, social life) and set gentle rules there',
          'Try planning in advance how long you\'ll game on weekdays and note how you feel when you actually stick to that plan',
          'Notice in what emotional states you most often dive into games (boredom, stress, loneliness) — this hints at needs that might be met in more sustainable ways',
          'Set "no-gaming windows" before sleep or during busy times',
          'Ask close ones to gently remind you when gaming time is stretching'
        ],
      },
      tryToday: {
        'ru':
            'Установите таймер на 1 час игры сегодня. Когда он прозвучит — остановитесь и похвалите себя за самоконтроль.',
        'en':
            'Set a 1-hour gaming timer today. When it goes off — stop and praise yourself for self-control.',
      },
      inspiringConclusion: {
        'ru':
            'Вы на развилке, где можно вернуть баланс небольшими усилиями. Это хороший момент для перемен!',
        'en':
            'You\'re at a crossroads where you can restore balance with small efforts. It\'s a good moment for change!',
      },
    ),
    'elevated_risk': TestProfile(
      id: 'elevated_risk',
      name: {
        'ru': 'Повышенный риск проблем с геймингом',
        'en': 'Elevated Risk of Gaming-Related Problems',
      },
      description: {
        'ru':
            'Ваш результат говорит о том, что гейминг стал фактором, который существенно влияет на повседневную жизнь. Сон, учёба/работа или отношения могут регулярно страдать, остановиться бывает трудно, а настроение сильно привязано к тому, как прошла игра.\n\nЭто не значит, что с вами «что-то не так» как с человеком. Скорее, так ваша психика сейчас справляется со стрессом, скукой или неприятными чувствами. Проблема в том, что такая стратегия со временем начинает работать против вас: энергии меньше, дел больше, а чувство контроля снижается.',
        'en':
            'Your score suggests that gaming has become a factor that significantly affects your everyday life. Sleep, study/work, or relationships may be suffering regularly; it\'s hard to stop; and your mood is tightly tied to how gaming goes.\n\nThis doesn\'t mean there is "something wrong with you" as a person. Rather, this is how your mind currently copes with stress, boredom, or difficult emotions. The issue is that over time this strategy starts working against you: less energy, more unfinished tasks, and a reduced sense of control.',
      },
      whyThisProfile: {
        'ru':
            'Ваш индекс риска нарушения баланса составляет 50-74%. Несколько показателей находятся в зоне риска.',
        'en':
            'Your gaming balance risk index is 50-74%. Several indicators are in the risk zone.',
      },
      strengths: {
        'ru': [
          'Вы прошли тест — значит, осознаёте проблему',
          'Есть мотивация к изменениям',
          'Способность честно посмотреть на ситуацию'
        ],
        'en': [
          'You took the test — meaning you\'re aware of the problem',
          'There\'s motivation for change',
          'Ability to honestly look at the situation'
        ],
      },
      vulnerabilities: {
        'ru': [
          'Высокий риск перехода в high_risk',
          'Регулярное нарушение сна, дел и отношений',
          'Потеря контроля над временем игры',
          'Настроение сильно зависит от гейминга',
          'Игры стали основным копинг-механизмом'
        ],
        'en': [
          'High risk of moving to high_risk',
          'Regular disruption of sleep, tasks, and relationships',
          'Loss of control over gaming time',
          'Mood strongly depends on gaming',
          'Games have become primary coping mechanism'
        ],
      },
      recommendations: {
        'ru': [
          'Начните с небольших изменений: например, введение «безигровых окон» перед сном или в самое загруженное время дня',
          'Отслеживайте, после каких игровых сессий вы чувствуете себя хуже, чем до них, и экспериментируйте с другим форматом (меньше времени, другой жанр, перерывы)',
          'Подумайте о том, чтобы обсудить тему гейминга с человеком, которому доверяете, или со специалистом — взгляд со стороны может помочь заметить паттерны, которые изнутри не так очевидны',
          'Установите физические барьеры: таймеры, блокировщики, перенос консоли/ПК в менее доступное место',
          'Верните в жизнь хотя бы одну активность вне игр (спорт, хобби, офлайн-общение)'
        ],
        'en': [
          'Start with small changes: for example, introduce "no-gaming windows" before sleep or during your busiest time of day',
          'Track what kinds of gaming sessions leave you feeling worse than before and experiment with different formats (shorter time, different genre, more breaks)',
          'Consider discussing your gaming habits with someone you trust or with a professional — an outside view can help you see patterns that are hard to notice from inside',
          'Set up physical barriers: timers, blockers, moving console/PC to less accessible location',
          'Gently try to bring back at least one non-gaming activity (sports, hobbies, offline socializing)'
        ],
      },
      tryToday: {
        'ru':
            'Свяжитесь с одним человеком из реальной жизни (не в игре). Короткий звонок или встреча. Замечайте, как вы себя чувствуете после.',
        'en':
            'Reach out to one person from real life (not in-game). A short call or meetup. Notice how you feel afterward.',
      },
      inspiringConclusion: {
        'ru':
            'Вы на пороге важных изменений. Обращение за поддержкой — не слабость, а сила. Вы можете вернуть баланс!',
        'en':
            'You\'re on the threshold of important changes. Seeking support is not weakness but strength. You can restore balance!',
      },
    ),
    'high_risk': TestProfile(
      id: 'high_risk',
      name: {
        'ru': 'Высокий риск потери баланса в гейминге',
        'en': 'High Risk of Losing Gaming-Life Balance',
      },
      description: {
        'ru':
            'Ваш профиль указывает на высокий риск того, что гейминг выходит за рамки здорового увлечения. Игры, вероятно, занимают большую часть свободного времени, мешают сну, учёбе/работе и общению, а попытки ограничить себя часто оказываются неуспешными. Настроение и самооценка могут сильно зависеть от того, как и сколько вы играете.\n\nТакой результат — не приговор, а важный сигнал. Часто за ним стоят накопившийся стресс, чувство одиночества, скука или опыт, в котором игры стали главным безопасным пространством. Это понятно, но со временем цена такого способа «выживания» становится слишком высокой.',
        'en':
            'Your profile points to a high risk that gaming has moved beyond a healthy hobby. Games likely take up most of your free time, interfere with sleep, study/work, and relationships, and attempts to limit yourself often don\'t work. Your mood and self-esteem may strongly depend on how and how much you play.\n\nThis result is not a sentence but an important signal. It often reflects accumulated stress, loneliness, boredom, or experiences where games became your main safe space. That\'s understandable, but over time the cost of this survival strategy becomes too high.',
      },
      whyThisProfile: {
        'ru':
            'Ваш индекс риска нарушения баланса составляет 75-100%. Большинство или все показатели находятся в критической зоне.',
        'en':
            'Your gaming balance risk index is 75-100%. Most or all indicators are in the critical zone.',
      },
      strengths: {
        'ru': [
          'Вы прошли тест до конца — это требует смелости',
          'Способность признать проблему — первый шаг к решению',
          'В вас есть часть, которая хочет изменений'
        ],
        'en': [
          'You completed the test — that takes courage',
          'Ability to acknowledge the problem is the first step to solution',
          'There\'s a part of you that wants change'
        ],
      },
      vulnerabilities: {
        'ru': [
          'Критическое нарушение жизненного баланса',
          'Потеря контроля над игровым временем',
          'Риск серьёзных последствий для здоровья и жизни',
          'Игры как единственный источник удовольствия',
          'Высокий уровень тревоги, депрессии или чувства "жизнь проходит мимо"'
        ],
        'en': [
          'Critical disruption of life balance',
          'Loss of control over gaming time',
          'Risk of serious consequences for health and life',
          'Games as the only source of pleasure',
          'High level of anxiety, depression, or feeling "life is passing by"'
        ],
      },
      recommendations: {
        'ru': [
          '🚨 ОЧЕНЬ ВАЖНО не оставаться с этим в одиночестве: подумайте о разговоре с психологом или другим специалистом, который знаком с темой гейминга и цифровых привычек',
          'Попробуйте мягко вернуть в жизнь хотя бы одну активность вне игр (спорт, хобби, офлайн-общение), не пытаясь сразу «обрубить» гейминг полностью',
          'Если вы замечаете, что из-за игр растёт тревога, депрессия или мысли, что «жизнь проходит мимо», это серьёзный повод обратиться за профессиональной помощью',
          'Рассмотрите программы поддержки для игровой зависимости (онлайн-группы, форумы, терапия)',
          'Установите техническое ограничение времени игры через родительский контроль или приложения'
        ],
        'en': [
          '🚨 It\'s VERY IMPORTANT not to stay alone with this: consider talking to a psychologist or other professional familiar with gaming and digital habits',
          'Gently try to bring back at least one non-gaming activity (sports, hobbies, offline socializing) without trying to "cut off" gaming completely at once',
          'If you notice growing anxiety, depression, or thoughts like "life is passing me by" because of gaming, that\'s a serious reason to seek professional help',
          'Consider support programs for gaming addiction (online groups, forums, therapy)',
          'Set up technical time limits through parental controls or apps'
        ],
      },
      tryToday: {
        'ru':
            'Найдите контакт психолога или специалиста по цифровым зависимостям. Даже если не позвоните сегодня — это уже первый шаг.',
        'en':
            'Find contact info for a psychologist or digital addiction specialist. Even if you don\'t call today — it\'s already the first step.',
      },
      inspiringConclusion: {
        'ru':
            'Вы достойны жизни, где игры — это удовольствие, а не побег. Помощь существует, и вы можете её получить. Начните сегодня.',
        'en':
            'You deserve a life where games are pleasure, not escape. Help exists, and you can get it. Start today.',
      },
    ),
  };
}
