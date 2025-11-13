import '../models/test_model.dart';

class LoveProfileData {
  static TestModel getLoveProfileTest() {
    return TestModel(
      id: 'love_profile',
      title: {
        'ru': 'Профиль любви',
        'en': 'Love Profile',
      },
      description: {
        'ru': 'Комплексный тест для оценки ваших романтических отношений. Оценивает 6 ключевых измерений любви.',
        'en': 'Comprehensive test to assess your romantic relationships. Evaluates 6 key dimensions of love.',
      },
      category: {
        'ru': 'Отношения',
        'en': 'Relationships',
      },
      categoryId: 'relationships',
      disclaimer: {
        'ru': 'В каждом утверждении выберите, насколько оно описывает вас в большинстве ваших романтических отношений за последние 12 месяцев. Отвечайте быстро, первое впечатление часто точнее. Тест не заменяет помощь специалиста.',
        'en': 'For each statement, choose how much it describes you in most of your romantic relationships over the past 12 months. Answer quickly, first impression is often more accurate. This test does not replace professional help.',
      },
      estimatedTime: 15,
      type: TestType.multiFactor,
      factorIds: ['BP', 'IU', 'ST', 'OG', 'DR', 'KK'],
      questions: [
        // Безопасная привязанность (BP) - 10 вопросов
        QuestionModel(
          id: 'BP_01',
          text: {
            'ru': 'В отношениях я чувствую, что могу быть собой.',
            'en': 'In relationships, I feel like I can be myself.',
          },
          answers: _getAnswerOptions(),
          factorId: 'BP',
          isReversed: false,
        ),
        QuestionModel(
          id: 'BP_02',
          text: {
            'ru': 'Мне комфортно и близко, даже когда партнёр на расстоянии.',
            'en': 'I feel comfortable and close even when my partner is away.',
          },
          answers: _getAnswerOptions(),
          factorId: 'BP',
          isReversed: false,
        ),
        QuestionModel(
          id: 'BP_03',
          text: {
            'ru': 'Я спокойно прошу о поддержке, когда она нужна.',
            'en': 'I calmly ask for support when I need it.',
          },
          answers: _getAnswerOptions(),
          factorId: 'BP',
          isReversed: false,
        ),
        QuestionModel(
          id: 'BP_04',
          text: {
            'ru': 'Я верю, что мои потребности в близости важны.',
            'en': 'I believe my needs for closeness are important.',
          },
          answers: _getAnswerOptions(),
          factorId: 'BP',
          isReversed: false,
        ),
        QuestionModel(
          id: 'BP_05',
          text: {
            'ru': 'Я умею оставаться в контакте со своими чувствами.',
            'en': 'I know how to stay in touch with my feelings.',
          },
          answers: _getAnswerOptions(),
          factorId: 'BP',
          isReversed: false,
        ),
        QuestionModel(
          id: 'BP_06',
          text: {
            'ru': 'Мне не требуется постоянное подтверждение любви.',
            'en': 'I don\'t need constant confirmation of love.',
          },
          answers: _getAnswerOptions(),
          factorId: 'BP',
          isReversed: true, // Обратный вопрос
        ),
        QuestionModel(
          id: 'BP_07',
          text: {
            'ru': 'Я сохраняю ощущение внутренней опоры даже во время конфликтов.',
            'en': 'I maintain a sense of inner support even during conflicts.',
          },
          answers: _getAnswerOptions(),
          factorId: 'BP',
          isReversed: false,
        ),
        QuestionModel(
          id: 'BP_08',
          text: {
            'ru': 'Мне удаётся сочетать близость и личные границы.',
            'en': 'I manage to combine closeness and personal boundaries.',
          },
          answers: _getAnswerOptions(),
          factorId: 'BP',
          isReversed: false,
        ),
        QuestionModel(
          id: 'BP_09',
          text: {
            'ru': 'Я чувствую, что достоин(на) любви и уважения.',
            'en': 'I feel that I deserve love and respect.',
          },
          answers: _getAnswerOptions(),
          factorId: 'BP',
          isReversed: false,
        ),
        QuestionModel(
          id: 'BP_10',
          text: {
            'ru': 'Разлука на время не вызывает у меня паники.',
            'en': 'Temporary separation doesn\'t cause panic in me.',
          },
          answers: _getAnswerOptions(),
          factorId: 'BP',
          isReversed: true, // Обратный вопрос
        ),

        // Интимность и уязвимость (IU) - 10 вопросов
        QuestionModel(
          id: 'IU_11',
          text: {
            'ru': 'Я могу открыто говорить о своих страхах.',
            'en': 'I can openly talk about my fears.',
          },
          answers: _getAnswerOptions(),
          factorId: 'IU',
          isReversed: false,
        ),
        QuestionModel(
          id: 'IU_12',
          text: {
            'ru': 'Я делюсь не только успехами, но и слабостями.',
            'en': 'I share not only successes but also weaknesses.',
          },
          answers: _getAnswerOptions(),
          factorId: 'IU',
          isReversed: false,
        ),
        QuestionModel(
          id: 'IU_13',
          text: {
            'ru': 'Я умею просить о нежности и поддержке.',
            'en': 'I know how to ask for tenderness and support.',
          },
          answers: _getAnswerOptions(),
          factorId: 'IU',
          isReversed: false,
        ),
        QuestionModel(
          id: 'IU_14',
          text: {
            'ru': 'Мне легко признавать свою ошибку и извиняться.',
            'en': 'It\'s easy for me to admit my mistake and apologize.',
          },
          answers: _getAnswerOptions(),
          factorId: 'IU',
          isReversed: false,
        ),
        QuestionModel(
          id: 'IU_15',
          text: {
            'ru': 'Я могу обсуждать прошлые травмирующие опыты, когда это уместно.',
            'en': 'I can discuss past traumatic experiences when appropriate.',
          },
          answers: _getAnswerOptions(),
          factorId: 'IU',
          isReversed: false,
        ),
        QuestionModel(
          id: 'IU_16',
          text: {
            'ru': 'Я избегаю разговоров о чувствах.',
            'en': 'I avoid talking about feelings.',
          },
          answers: _getAnswerOptions(),
          factorId: 'IU',
          isReversed: true, // Обратный вопрос
        ),
        QuestionModel(
          id: 'IU_17',
          text: {
            'ru': 'Я с уважением слушаю, когда партнёр делится переживаниями.',
            'en': 'I listen respectfully when my partner shares experiences.',
          },
          answers: _getAnswerOptions(),
          factorId: 'IU',
          isReversed: false,
        ),
        QuestionModel(
          id: 'IU_18',
          text: {
            'ru': 'Я не стыжусь своих слёз или растерянности.',
            'en': 'I\'m not ashamed of my tears or confusion.',
          },
          answers: _getAnswerOptions(),
          factorId: 'IU',
          isReversed: false,
        ),
        QuestionModel(
          id: 'IU_19',
          text: {
            'ru': 'Я могу назвать свои потребности словами.',
            'en': 'I can name my needs in words.',
          },
          answers: _getAnswerOptions(),
          factorId: 'IU',
          isReversed: false,
        ),
        QuestionModel(
          id: 'IU_20',
          text: {
            'ru': 'Я закрываюсь, когда разговор заходит о глубоком.',
            'en': 'I close up when the conversation gets deep.',
          },
          answers: _getAnswerOptions(),
          factorId: 'IU',
          isReversed: true, // Обратный вопрос
        ),

        // Страсть и телесность (ST) - 10 вопросов
        QuestionModel(
          id: 'ST_21',
          text: {
            'ru': 'В наших отношениях есть место игре и флирту.',
            'en': 'There is room for play and flirtation in our relationship.',
          },
          answers: _getAnswerOptions(),
          factorId: 'ST',
          isReversed: false,
        ),
        QuestionModel(
          id: 'ST_22',
          text: {
            'ru': 'Я проявляю инициативу в близости.',
            'en': 'I take initiative in intimacy.',
          },
          answers: _getAnswerOptions(),
          factorId: 'ST',
          isReversed: false,
        ),
        QuestionModel(
          id: 'ST_23',
          text: {
            'ru': 'Я открыт(а) к обсуждению желаний и фантазий.',
            'en': 'I\'m open to discussing desires and fantasies.',
          },
          answers: _getAnswerOptions(),
          factorId: 'ST',
          isReversed: false,
        ),
        QuestionModel(
          id: 'ST_24',
          text: {
            'ru': 'Мне удаётся поддерживать новизну и спонтанность.',
            'en': 'I manage to maintain novelty and spontaneity.',
          },
          answers: _getAnswerOptions(),
          factorId: 'ST',
          isReversed: false,
        ),
        QuestionModel(
          id: 'ST_25',
          text: {
            'ru': 'Я замечаю и ценю телесные сигналы партнёра.',
            'en': 'I notice and appreciate my partner\'s body signals.',
          },
          answers: _getAnswerOptions(),
          factorId: 'ST',
          isReversed: false,
        ),
        QuestionModel(
          id: 'ST_26',
          text: {
            'ru': 'Тема сексуальности меня смущает и я её избегаю.',
            'en': 'The topic of sexuality embarrasses me and I avoid it.',
          },
          answers: _getAnswerOptions(),
          factorId: 'ST',
          isReversed: true, // Обратный вопрос
        ),
        QuestionModel(
          id: 'ST_27',
          text: {
            'ru': 'Я уделяю внимание своему телу и энергии.',
            'en': 'I pay attention to my body and energy.',
          },
          answers: _getAnswerOptions(),
          factorId: 'ST',
          isReversed: false,
        ),
        QuestionModel(
          id: 'ST_28',
          text: {
            'ru': 'Я уважаю согласие и комфорт обоих.',
            'en': 'I respect the consent and comfort of both.',
          },
          answers: _getAnswerOptions(),
          factorId: 'ST',
          isReversed: false,
        ),
        QuestionModel(
          id: 'ST_29',
          text: {
            'ru': 'Я поддерживаю регулярную, желанную близость.',
            'en': 'I maintain regular, desired intimacy.',
          },
          answers: _getAnswerOptions(),
          factorId: 'ST',
          isReversed: false,
        ),
        QuestionModel(
          id: 'ST_30',
          text: {
            'ru': 'Я часто подавляю собственное влечение из страха быть отвергнутым(ой).',
            'en': 'I often suppress my own attraction out of fear of being rejected.',
          },
          answers: _getAnswerOptions(),
          factorId: 'ST',
          isReversed: true, // Обратный вопрос
        ),

        // Обязательства и совместные цели (OG) - 10 вопросов
        QuestionModel(
          id: 'OG_31',
          text: {
            'ru': 'Мы обсуждаем и согласуем ожидания друг друга.',
            'en': 'We discuss and agree on each other\'s expectations.',
          },
          answers: _getAnswerOptions(),
          factorId: 'OG',
          isReversed: false,
        ),
        QuestionModel(
          id: 'OG_32',
          text: {
            'ru': 'Я выполняю обещания или заранее пересогласовываю.',
            'en': 'I keep promises or renegotiate in advance.',
          },
          answers: _getAnswerOptions(),
          factorId: 'OG',
          isReversed: false,
        ),
        QuestionModel(
          id: 'OG_33',
          text: {
            'ru': 'У нас есть совместные ритуалы и планы.',
            'en': 'We have shared rituals and plans.',
          },
          answers: _getAnswerOptions(),
          factorId: 'OG',
          isReversed: false,
        ),
        QuestionModel(
          id: 'OG_34',
          text: {
            'ru': 'Я умею вести бюджет/быт без конфликтов.',
            'en': 'I know how to manage budget/household without conflicts.',
          },
          answers: _getAnswerOptions(),
          factorId: 'OG',
          isReversed: false,
        ),
        QuestionModel(
          id: 'OG_35',
          text: {
            'ru': 'Я устойчив(а) к трудностям и не склонен(на) «сбегать».',
            'en': 'I\'m resilient to difficulties and not prone to "running away".',
          },
          answers: _getAnswerOptions(),
          factorId: 'OG',
          isReversed: false,
        ),
        QuestionModel(
          id: 'OG_36',
          text: {
            'ru': 'Я часто откладываю важные разговоры «на потом».',
            'en': 'I often postpone important conversations "for later".',
          },
          answers: _getAnswerOptions(),
          factorId: 'OG',
          isReversed: true, // Обратный вопрос
        ),
        QuestionModel(
          id: 'OG_37',
          text: {
            'ru': 'Я готов(а) вкладываться в долгосрочные проекты пары.',
            'en': 'I\'m ready to invest in long-term couple projects.',
          },
          answers: _getAnswerOptions(),
          factorId: 'OG',
          isReversed: false,
        ),
        QuestionModel(
          id: 'OG_38',
          text: {
            'ru': 'Я умею разделять ответственность.',
            'en': 'I know how to share responsibility.',
          },
          answers: _getAnswerOptions(),
          factorId: 'OG',
          isReversed: false,
        ),
        QuestionModel(
          id: 'OG_39',
          text: {
            'ru': 'Я стараюсь учитывать ценности и жизненные цели партнёра.',
            'en': 'I try to consider my partner\'s values and life goals.',
          },
          answers: _getAnswerOptions(),
          factorId: 'OG',
          isReversed: false,
        ),
        QuestionModel(
          id: 'OG_40',
          text: {
            'ru': 'Я избегаю определённости и предпочитаю неопределённые отношения.',
            'en': 'I avoid certainty and prefer undefined relationships.',
          },
          answers: _getAnswerOptions(),
          factorId: 'OG',
          isReversed: true, // Обратный вопрос
        ),

        // Доверие и ревность (DR) - 10 вопросов
        QuestionModel(
          id: 'DR_41',
          text: {
            'ru': 'Я доверяю партнёру, даже когда мы не вместе.',
            'en': 'I trust my partner even when we\'re not together.',
          },
          answers: _getAnswerOptions(),
          factorId: 'DR',
          isReversed: false,
        ),
        QuestionModel(
          id: 'DR_42',
          text: {
            'ru': 'Я умею различать факты и свои фантазии.',
            'en': 'I know how to distinguish facts from my fantasies.',
          },
          answers: _getAnswerOptions(),
          factorId: 'DR',
          isReversed: false,
        ),
        QuestionModel(
          id: 'DR_43',
          text: {
            'ru': 'Я могу прямо обсудить, что меня ранит.',
            'en': 'I can directly discuss what hurts me.',
          },
          answers: _getAnswerOptions(),
          factorId: 'DR',
          isReversed: false,
        ),
        QuestionModel(
          id: 'DR_44',
          text: {
            'ru': 'Я не контролирую переписки и соцсети партнёра.',
            'en': 'I don\'t control my partner\'s messages and social media.',
          },
          answers: _getAnswerOptions(),
          factorId: 'DR',
          isReversed: false,
        ),
        QuestionModel(
          id: 'DR_45',
          text: {
            'ru': 'Я уважаю границы и личное пространство.',
            'en': 'I respect boundaries and personal space.',
          },
          answers: _getAnswerOptions(),
          factorId: 'DR',
          isReversed: false,
        ),
        QuestionModel(
          id: 'DR_46',
          text: {
            'ru': 'Любое опоздание вызывает у меня бурю подозрений.',
            'en': 'Any delay causes a storm of suspicion in me.',
          },
          answers: _getAnswerOptions(),
          factorId: 'DR',
          isReversed: true, // Обратный вопрос
        ),
        QuestionModel(
          id: 'DR_47',
          text: {
            'ru': 'Я не сравниваю себя с бывшими партнёра.',
            'en': 'I don\'t compare myself to my partner\'s exes.',
          },
          answers: _getAnswerOptions(),
          factorId: 'DR',
          isReversed: false,
        ),
        QuestionModel(
          id: 'DR_48',
          text: {
            'ru': 'Я умею успокаивать себя при триггерах ревности.',
            'en': 'I know how to calm myself during jealousy triggers.',
          },
          answers: _getAnswerOptions(),
          factorId: 'DR',
          isReversed: false,
        ),
        QuestionModel(
          id: 'DR_49',
          text: {
            'ru': 'Я верю, что мы можем прояснить недопонимания.',
            'en': 'I believe we can clarify misunderstandings.',
          },
          answers: _getAnswerOptions(),
          factorId: 'DR',
          isReversed: false,
        ),
        QuestionModel(
          id: 'DR_50',
          text: {
            'ru': 'Мне сложно доверять, даже без повода.',
            'en': 'It\'s hard for me to trust even without reason.',
          },
          answers: _getAnswerOptions(),
          factorId: 'DR',
          isReversed: true, // Обратный вопрос
        ),

        // Коммуникация и конфликт (KK) - 10 вопросов
        QuestionModel(
          id: 'KK_51',
          text: {
            'ru': 'Я говорю о себе, используя «я-сообщения».',
            'en': 'I talk about myself using "I-messages".',
          },
          answers: _getAnswerOptions(),
          factorId: 'KK',
          isReversed: false,
        ),
        QuestionModel(
          id: 'KK_52',
          text: {
            'ru': 'В конфликте я стараюсь понять, а не победить.',
            'en': 'In conflict, I try to understand rather than win.',
          },
          answers: _getAnswerOptions(),
          factorId: 'KK',
          isReversed: false,
        ),
        QuestionModel(
          id: 'KK_53',
          text: {
            'ru': 'Я умею делать паузу и возвращаться к теме позже.',
            'en': 'I know how to take a break and return to the topic later.',
          },
          answers: _getAnswerOptions(),
          factorId: 'KK',
          isReversed: false,
        ),
        QuestionModel(
          id: 'KK_54',
          text: {
            'ru': 'Я пересказываю своими словами, чтобы проверить понимание.',
            'en': 'I rephrase in my own words to check understanding.',
          },
          answers: _getAnswerOptions(),
          factorId: 'KK',
          isReversed: false,
        ),
        QuestionModel(
          id: 'KK_55',
          text: {
            'ru': 'Я замечаю и выражаю благодарность партнёру.',
            'en': 'I notice and express gratitude to my partner.',
          },
          answers: _getAnswerOptions(),
          factorId: 'KK',
          isReversed: false,
        ),
        QuestionModel(
          id: 'KK_56',
          text: {
            'ru': 'В споре я часто перехожу на личности.',
            'en': 'In arguments, I often attack the person.',
          },
          answers: _getAnswerOptions(),
          factorId: 'KK',
          isReversed: true, // Обратный вопрос
        ),
        QuestionModel(
          id: 'KK_57',
          text: {
            'ru': 'Я могу просить о том, что мне нужно, конкретно и ясно.',
            'en': 'I can ask for what I need specifically and clearly.',
          },
          answers: _getAnswerOptions(),
          factorId: 'KK',
          isReversed: false,
        ),
        QuestionModel(
          id: 'KK_58',
          text: {
            'ru': 'Я отличаю критику поведения от критики личности.',
            'en': 'I distinguish criticism of behavior from criticism of personality.',
          },
          answers: _getAnswerOptions(),
          factorId: 'KK',
          isReversed: false,
        ),
        QuestionModel(
          id: 'KK_59',
          text: {
            'ru': 'Я умею завершать конфликт договорённостью.',
            'en': 'I know how to end conflicts with agreement.',
          },
          answers: _getAnswerOptions(),
          factorId: 'KK',
          isReversed: false,
        ),
        QuestionModel(
          id: 'KK_60',
          text: {
            'ru': 'Я часто молчу, коплю и взрываюсь позже.',
            'en': 'I often stay silent, accumulate, and explode later.',
          },
          answers: _getAnswerOptions(),
          factorId: 'KK',
          isReversed: true, // Обратный вопрос
        ),
      ],
    );
  }

  static List<AnswerModel> _getAnswerOptions() {
    return [
      AnswerModel(id: '1', text: {'ru': 'Совсем не согласен(на)', 'en': 'Completely disagree'}, score: 1),
      AnswerModel(id: '2', text: {'ru': 'Скорее не согласен(на)', 'en': 'Rather disagree'}, score: 2),
      AnswerModel(id: '3', text: {'ru': 'И да, и нет', 'en': 'Neither agree nor disagree'}, score: 3),
      AnswerModel(id: '4', text: {'ru': 'Скорее согласен(на)', 'en': 'Rather agree'}, score: 4),
      AnswerModel(id: '5', text: {'ru': 'Полностью согласен(на)', 'en': 'Completely agree'}, score: 5),
    ];
  }

  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'BP': {
        'ru': 'Безопасная привязанность',
        'en': 'Secure Attachment',
      },
      'IU': {
        'ru': 'Интимность и уязвимость',
        'en': 'Intimacy and Vulnerability',
      },
      'ST': {
        'ru': 'Страсть и телесность',
        'en': 'Passion and Physicality',
      },
      'OG': {
        'ru': 'Обязательства и совместные цели',
        'en': 'Commitment and Shared Goals',
      },
      'DR': {
        'ru': 'Доверие и ревность',
        'en': 'Trust and Jealousy',
      },
      'KK': {
        'ru': 'Коммуникация и конфликт',
        'en': 'Communication and Conflict',
      },
    };
  }

  static Map<String, Map<String, Map<String, String>>> getFactorInterpretations() {
    return {
      'BP': {
        'high': {
          'ru': '**Высоко**: устойчивость, автономия, доброжелательная близость.',
          'en': '**High**: stability, autonomy, benevolent closeness.',
        },
        'low': {
          'ru': '**Низко**: страх близости/покинутости, колебания самоценности.',
          'en': '**Low**: fear of intimacy/abandonment, self-worth fluctuations.',
        },
        'medium': {
          'ru': '**Средний уровень**: стабильная база, есть точки развития.',
          'en': '**Medium level**: stable foundation, areas for development.',
        },
      },
      'IU': {
        'high': {
          'ru': '**Высоко**: эмоциональная открытость, зрелая уязвимость.',
          'en': '**High**: emotional openness, mature vulnerability.',
        },
        'low': {
          'ru': '**Низко**: избегание тем чувств, стыд/страх откровенности.',
          'en': '**Low**: avoidance of feelings topics, shame/fear of openness.',
        },
        'medium': {
          'ru': '**Средний уровень**: стабильная база, есть точки развития.',
          'en': '**Medium level**: stable foundation, areas for development.',
        },
      },
      'ST': {
        'high': {
          'ru': '**Высоко**: тепло, игра, согласованная сексуальность.',
          'en': '**High**: warmth, play, consensual sexuality.',
        },
        'low': {
          'ru': '**Низко**: застенчивость, подавление желаний, избегание темы секса.',
          'en': '**Low**: shyness, suppression of desires, avoidance of sex topics.',
        },
        'medium': {
          'ru': '**Средний уровень**: стабильная база, есть точки развития.',
          'en': '**Medium level**: stable foundation, areas for development.',
        },
      },
      'OG': {
        'high': {
          'ru': '**Высоко**: надёжность, совместное планирование, договорённости.',
          'en': '**High**: reliability, joint planning, agreements.',
        },
        'low': {
          'ru': '**Низко**: прокрастинация важных разговоров, неопределённость.',
          'en': '**Low**: procrastination of important conversations, uncertainty.',
        },
        'medium': {
          'ru': '**Средний уровень**: стабильная база, есть точки развития.',
          'en': '**Medium level**: stable foundation, areas for development.',
        },
      },
      'DR': {
        'high': {
          'ru': '**Высоко**: базовое доверие, регулирование ревности, уважение границ.',
          'en': '**High**: basic trust, jealousy regulation, respect for boundaries.',
        },
        'low': {
          'ru': '**Низко**: подозрительность, контроль, трудности самоуспокоения.',
          'en': '**Low**: suspiciousness, control, difficulty self-soothing.',
        },
        'medium': {
          'ru': '**Средний уровень**: стабильная база, есть точки развития.',
          'en': '**Medium level**: stable foundation, areas for development.',
        },
      },
      'KK': {
        'high': {
          'ru': '**Высоко**: экологичная коммуникация, восстановление после конфликтов.',
          'en': '**High**: ecological communication, recovery after conflicts.',
        },
        'low': {
          'ru': '**Низко**: эскалация, пассивная агрессия, «накопление» обид.',
          'en': '**Low**: escalation, passive aggression, "accumulation" of grievances.',
        },
        'medium': {
          'ru': '**Средний уровень**: стабильная база, есть точки развития.',
          'en': '**Medium level**: stable foundation, areas for development.',
        },
      },
    };
  }

  static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
    final interpretations = getFactorInterpretations();

    if (percentage >= 67) {
      return interpretations[factorId]?['high'] ?? {'ru': '', 'en': ''};
    } else if (percentage <= 32) {
      return interpretations[factorId]?['low'] ?? {'ru': '', 'en': ''};
    } else {
      return interpretations[factorId]?['medium'] ?? {'ru': '**Средний уровень**: стабильная база, есть точки развития.', 'en': '**Medium level**: stable foundation, areas for development.'};
    }
  }

  static Map<String, String> getRecommendations(String factorId, double percentage) {
    // Определяем уровень развития
    String level;
    if (percentage >= 67) {
      level = 'high';
    } else if (percentage <= 32) {
      level = 'low';
    } else {
      level = 'medium';
    }

    switch (factorId) {
      case 'BP':
        if (level == 'low') {
          return {
            'ru': 'Начните с создания "безопасного места" - ведите дневник поддерживающих отношений. Практикуйте упражнение "заземление 5-4-3-2-1" для снижения тревоги. Ищите терапию для работы с привязанностью.',
            'en': 'Start by creating a "safe place" - keep a journal of supportive relationships. Practice the "grounding 5-4-3-2-1" exercise to reduce anxiety. Seek therapy to work on attachment.',
          };
        } else if (level == 'medium') {
          return {
            'ru': 'Укрепляйте баланс между близостью и автономией. Практикуйте осознанность в отношениях для поддержания эмоциональной стабильности.',
            'en': 'Strengthen the balance between closeness and autonomy. Practice mindfulness in relationships to maintain emotional stability.',
          };
        } else {
          return {
            'ru': 'Продолжайте развивать здоровую автономию. Попробуйте практики осознанности для поддержания эмоционального баланса.',
            'en': 'Continue developing healthy autonomy. Try mindfulness practices to maintain emotional balance.',
          };
        }

      case 'IU':
        if (level == 'low') {
          return {
            'ru': 'Попробуйте "письмо без отправки" - напишите о чувствах, которые сложно выразить. Практикуйте называние эмоций: "Я чувствую... потому что...". Начните с малого - делитесь с близкими друзьями.',
            'en': 'Try "unsent letter" - write about feelings that are difficult to express. Practice naming emotions: "I feel... because...". Start small - share with close friends.',
          };
        } else if (level == 'medium') {
          return {
            'ru': 'Развивайте навыки эмоциональной грамотности. Регулярно делитесь чувствами в безопасной обстановке для углубления близости.',
            'en': 'Develop emotional literacy skills. Regularly share feelings in a safe environment to deepen intimacy.',
          };
        } else {
          return {
            'ru': 'Ваша открытость - ценный ресурс. Рассмотрите практики активного слушания для углубления связей.',
            'en': 'Your openness is a valuable resource. Consider active listening practices to deepen connections.',
          };
        }

      case 'ST':
        if (level == 'low') {
          return {
            'ru': 'Начните с "15 минут нежности" ежедневно. Обсудите "карту желаний" и установите безопасные слова для комфортного общения о близости. Исследуйте причины дискомфорта с сексуальностью.',
            'en': 'Start with "15 minutes of tenderness" daily. Discuss a "desire map" and establish safe words for comfortable intimacy communication. Explore reasons for discomfort with sexuality.',
          };
        } else if (level == 'medium') {
          return {
            'ru': 'Поддерживайте баланс между нежностью и страстью. Экспериментируйте с новыми формами близости для сохранения интереса.',
            'en': 'Maintain balance between tenderness and passion. Experiment with new forms of intimacy to keep interest alive.',
          };
        } else {
          return {
            'ru': 'Поддерживайте игривость и спонтанность. Регулярно обсуждайте желания для поддержания близости.',
            'en': 'Maintain playfulness and spontaneity. Regularly discuss desires to maintain intimacy.',
          };
        }

      case 'OG':
        if (level == 'low') {
          return {
            'ru': 'Проводите еженедельный "совет семьи" для обсуждения планов. Используйте SMART-цели для совместных проектов и создайте календарь ритуалов. Работайте над последовательностью.',
            'en': 'Hold a weekly "family council" to discuss plans. Use SMART goals for joint projects and create a calendar of rituals. Work on consistency.',
          };
        } else if (level == 'medium') {
          return {
            'ru': 'Развивайте совместные цели и традиции. Регулярно пересматривайте договорённости для поддержания взаимопонимания.',
            'en': 'Develop shared goals and traditions. Regularly review agreements to maintain mutual understanding.',
          };
        } else {
          return {
            'ru': 'Ваша надёжность - основа крепких отношений. Планируйте совместные цели для дальнейшего роста.',
            'en': 'Your reliability is the foundation of strong relationships. Plan shared goals for further growth.',
          };
        }

      case 'DR':
        if (level == 'low') {
          return {
            'ru': 'Практикуйте "стоп-кадр" при триггерах ревности. Создайте договор о прозрачности и составьте список "красных/зелёных" флагов в отношениях. Работайте над самоуспокоением.',
            'en': 'Practice "stop-frame" during jealousy triggers. Create a transparency agreement and make a list of "red/green" flags in relationships. Work on self-soothing.',
          };
        } else if (level == 'medium') {
          return {
            'ru': 'Работайте над открытостью и доверием. Обсуждайте триггеры и способы их преодоления для укрепления отношений.',
            'en': 'Work on openness and trust. Discuss triggers and ways to overcome them to strengthen the relationship.',
          };
        } else {
          return {
            'ru': 'Базовое доверие - ваша сила. Продолжайте открытые разговоры о границах и ожиданиях.',
            'en': 'Basic trust is your strength. Continue open conversations about boundaries and expectations.',
          };
        }

      case 'KK':
        if (level == 'low') {
          return {
            'ru': 'Применяйте правило "20-20-20" (говорю-слушаю-итог). Делайте тайм-аут 30 минут при эскалации. Создайте чек-лист уважительного общения. Изучите техники ненасильного общения.',
            'en': 'Apply the "20-20-20" rule (speak-listen-summarize). Take a 30-minute time-out during escalation. Create a respectful communication checklist. Study non-violent communication techniques.',
          };
        } else if (level == 'medium') {
          return {
            'ru': 'Улучшайте навыки конструктивного диалога. Практикуйте активное слушание и эмпатию для разрешения конфликтов.',
            'en': 'Improve constructive dialogue skills. Practice active listening and empathy for conflict resolution.',
          };
        } else {
          return {
            'ru': 'Эффективная коммуникация - ваш талант. Развивайте навыки медиации для помощи другим парам.',
            'en': 'Effective communication is your talent. Develop mediation skills to help other couples.',
          };
        }

      default:
        return {
          'ru': 'Работайте над развитием этого аспекта отношений.',
          'en': 'Work on developing this aspect of relationships.'
        };
    }
  }

  static String getFactorDescription(String factorId, String languageCode) {
    final descriptions = {
      'BP': {
        'ru': 'Безопасная привязанность — это способность чувствовать себя защищенным и стабильным в отношениях. Люди с высокой безопасной привязанностью умеют доверять партнёру, не испытывают чрезмерной тревоги разлуки, комфортно чувствуют себя как в близости, так и на расстоянии. Они спокойно просят о поддержке и могут оставаться в контакте со своими чувствами даже в конфликтах.',
        'en': 'Secure attachment is the ability to feel safe and stable in relationships. People with high secure attachment can trust their partner, don\'t experience excessive separation anxiety, feel comfortable both in closeness and at distance. They calmly ask for support and can stay in touch with their feelings even during conflicts.',
      },
      'IU': {
        'ru': 'Интимность и уязвимость — это способность открываться эмоционально, делиться своими страхами и слабостями с партнёром. Это готовность быть увиденным таким, какой вы есть, и принимать уязвимость партнёра. Люди с развитой интимностью могут обсуждать сложные чувства, говорить о потребностях без стыда и создавать глубокую эмоциональную связь.',
        'en': 'Intimacy and vulnerability is the ability to open up emotionally, to share your fears and weaknesses with your partner. It\'s a willingness to be seen as you are, and to accept your partner\'s vulnerability. People with developed intimacy can discuss difficult feelings, talk about needs without shame, and create a deep emotional connection.',
      },
      'ST': {
        'ru': 'Страсть и телесность — это способность переживать физическую близость, сексуальное влечение, спонтанность и игривость в отношениях. Это комфорт с собственным телом и телом партнёра, готовность экспериментировать и выражать свои желания. Люди с высокой страстью поддерживают физическое влечение, умеют расслабляться в близости и наслаждаться телесным контактом.',
        'en': 'Passion and physicality is the ability to experience physical intimacy, sexual attraction, spontaneity and playfulness in relationships. It\'s comfort with your own body and your partner\'s body, willingness to experiment and express your desires. People with high passion maintain physical attraction, can relax in intimacy and enjoy physical contact.',
      },
      'OG': {
        'ru': 'Обязательства и совместные цели — это способность брать долгосрочные обязательства, планировать будущее вместе и реализовывать общие планы. Это надежность, ответственность и готовность вкладываться в развитие отношений. Люди с развитыми обязательствами выполняют обещания, поддерживают партнёра в достижении целей и видят себя вместе в перспективе.',
        'en': 'Commitment and shared goals is the ability to make long-term commitments, plan the future together and implement common plans. It\'s reliability, responsibility and willingness to invest in relationship development. People with developed commitment keep promises, support their partner in achieving goals and see themselves together in perspective.',
      },
      'DR': {
        'ru': 'Доверие и ревность — это базовое доверие к партнёру, способность регулировать ревность и уважать личные границы. Люди с высоким доверием не испытывают постоянной потребности в контроле, могут самоуспокаиваться и не переживают из-за внимания партнёра к другим. Они уверены в своей ценности и ценности отношений.',
        'en': 'Trust and jealousy is basic trust in your partner, the ability to regulate jealousy and respect personal boundaries. People with high trust don\'t experience constant need for control, can self-soothe and don\'t worry about their partner\'s attention to others. They are confident in their own value and the value of the relationship.',
      },
      'KK': {
        'ru': 'Коммуникация и конфликт — это способность экологично общаться, разрешать конфликты, использовать "Я-сообщения" и практиковать активное слушание. Люди с развитой коммуникацией умеют выражать недовольство без обвинений, слушать партнёра без перебивания, искать компромиссы и восстанавливать контакт после ссор.',
        'en': 'Communication and conflict is the ability to communicate ecologically, resolve conflicts, use "I-messages" and practice active listening. People with developed communication can express dissatisfaction without accusations, listen to their partner without interrupting, seek compromises and restore contact after quarrels.',
      },
    };

    return descriptions[factorId]?[languageCode] ?? '';
  }

  static String calculateLoveIndex(Map<String, FactorScore> factorScores, String languageCode) {
    double totalPercentage = 0;
    factorScores.forEach((key, value) {
      totalPercentage += value.percentage;
    });
    double average = totalPercentage / factorScores.length;

    if (average >= 80) {
      return {
        'ru': 'Ваши отношения демонстрируют высокий уровень гармонии и зрелости. Продолжайте развивать все аспекты любви.',
        'en': 'Your relationship demonstrates a high level of harmony and maturity. Continue developing all aspects of love.',
      }[languageCode]!;
    } else if (average >= 60) {
      return {
        'ru': 'У вас хорошая основа для отношений. Есть области для развития, но в целом баланс сохранён.',
        'en': 'You have a good foundation for relationships. There are areas for development, but overall balance is maintained.',
      }[languageCode]!;
    } else if (average >= 40) {
      return {
        'ru': 'В отношениях есть как сильные стороны, так и области для роста. Рекомендуется работа над развитием.',
        'en': 'There are both strengths and areas for growth in the relationship. Development work is recommended.',
      }[languageCode]!;
    } else {
      return {
        'ru': 'Отношения требуют внимания и работы. Обратитесь к специалисту для поддержки в развитии.',
        'en': 'The relationship requires attention and work. Seek professional support for development.',
      }[languageCode]!;
    }
  }
}
