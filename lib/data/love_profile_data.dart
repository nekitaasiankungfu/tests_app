import '../models/test_model.dart';
import '../models/test_profile_model.dart';

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

  /// Определяет профиль на основе процентов по шкалам
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_developing';

    // Находим средний процент
    final avgPercentage = percentages.values.reduce((a, b) => a + b) / percentages.length;

    // Находим самый высокий и низкий факторы
    String? highestFactor;
    String? lowestFactor;
    double highestValue = 0;
    double lowestValue = 100;

    for (final entry in percentages.entries) {
      if (entry.value > highestValue) {
        highestValue = entry.value;
        highestFactor = entry.key;
      }
      if (entry.value < lowestValue) {
        lowestValue = entry.value;
        lowestFactor = entry.key;
      }
    }

    // Проверяем гармоничный профиль (все факторы >= 70%)
    final allHigh = percentages.values.every((v) => v >= 70);
    if (allHigh) return 'profile_harmonious';

    // Проверяем сбалансированный профиль (все факторы 50-70%)
    final allBalanced = percentages.values.every((v) => v >= 50 && v < 70);
    if (allBalanced) return 'profile_balanced';

    // Определяем профиль по доминирующему фактору
    if (highestValue >= 70 && highestFactor != null) {
      switch (highestFactor) {
        case 'BP':
          return 'profile_secure_base';
        case 'IU':
          return 'profile_deep_connector';
        case 'ST':
          return 'profile_passionate_lover';
        case 'OG':
          return 'profile_committed_partner';
        case 'DR':
          return 'profile_trustful_soul';
        case 'KK':
          return 'profile_skilled_communicator';
      }
    }

    // Определяем профиль по слабому месту
    if (lowestValue < 40 && lowestFactor != null) {
      switch (lowestFactor) {
        case 'BP':
          return 'profile_attachment_seeker';
        case 'IU':
          return 'profile_guarded_heart';
        case 'ST':
          return 'profile_intimacy_shy';
        case 'OG':
          return 'profile_freedom_lover';
        case 'DR':
          return 'profile_trust_builder';
        case 'KK':
          return 'profile_conflict_avoider';
      }
    }

    // По среднему уровню
    if (avgPercentage >= 60) return 'profile_growing';
    if (avgPercentage >= 40) return 'profile_developing';
    return 'profile_early_stage';
  }

  /// Возвращает профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  static final Map<String, TestProfile> _profiles = {
    // === Гармоничные профили ===
    'profile_harmonious': TestProfile(
      id: 'profile_harmonious',
      name: {
        'ru': 'Гармоничный партнёр',
        'en': 'Harmonious Partner',
      },
      description: {
        'ru': 'Вы демонстрируете высокий уровень развития во всех аспектах отношений. Ваша способность сочетать близость, страсть, доверие и коммуникацию создаёт прочный фундамент для счастливых отношений.',
        'en': 'You demonstrate a high level of development in all aspects of relationships. Your ability to combine intimacy, passion, trust, and communication creates a solid foundation for happy relationships.',
      },
      whyThisProfile: {
        'ru': 'Все ваши показатели находятся на высоком уровне (70%+), что говорит о зрелом подходе к отношениям.',
        'en': 'All your scores are at a high level (70%+), indicating a mature approach to relationships.',
      },
      strengths: {
        'ru': [
          'Глубокое понимание себя и партнёра',
          'Умение создавать безопасное пространство',
          'Баланс между близостью и автономией',
          'Эффективное разрешение конфликтов',
          'Поддержание страсти в долгосрочных отношениях',
        ],
        'en': [
          'Deep understanding of self and partner',
          'Ability to create safe space',
          'Balance between closeness and autonomy',
          'Effective conflict resolution',
          'Maintaining passion in long-term relationships',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Высокие ожидания от партнёра',
          'Риск идеализации отношений',
        ],
        'en': [
          'High expectations of partner',
          'Risk of idealizing relationships',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте развивать осознанность в отношениях',
          'Делитесь опытом с другими парами',
          'Поддерживайте баланс между "мы" и "я"',
          'Регулярно обновляйте совместные цели',
        ],
        'en': [
          'Continue developing relationship awareness',
          'Share experience with other couples',
          'Maintain balance between "we" and "I"',
          'Regularly update shared goals',
        ],
      },
      tryToday: {
        'ru': 'Поблагодарите партнёра за конкретный вклад в ваши отношения.',
        'en': 'Thank your partner for a specific contribution to your relationship.',
      },
      inspiringConclusion: {
        'ru': 'Ваша способность любить — это дар, который вы можете передавать дальше. Вы вдохновляете других своим примером.',
        'en': 'Your ability to love is a gift you can pass on. You inspire others by your example.',
      },
    ),

    'profile_balanced': TestProfile(
      id: 'profile_balanced',
      name: {
        'ru': 'Сбалансированный партнёр',
        'en': 'Balanced Partner',
      },
      description: {
        'ru': 'У вас хороший баланс между различными аспектами отношений. Вы демонстрируете стабильность и есть потенциал для дальнейшего роста.',
        'en': 'You have a good balance between different aspects of relationships. You demonstrate stability with potential for further growth.',
      },
      whyThisProfile: {
        'ru': 'Ваши показатели находятся в среднем диапазоне (50-70%), что указывает на стабильную базу.',
        'en': 'Your scores are in the middle range (50-70%), indicating a stable foundation.',
      },
      strengths: {
        'ru': [
          'Стабильный эмоциональный фон',
          'Готовность к развитию',
          'Здоровые базовые навыки общения',
          'Способность к компромиссам',
        ],
        'en': [
          'Stable emotional background',
          'Readiness for development',
          'Healthy basic communication skills',
          'Ability to compromise',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможна зона комфорта без развития',
          'Недостаточная глубина в некоторых аспектах',
        ],
        'en': [
          'Possible comfort zone without growth',
          'Insufficient depth in some aspects',
        ],
      },
      recommendations: {
        'ru': [
          'Определите области для целенаправленного развития',
          'Практикуйте более глубокое эмоциональное раскрытие',
          'Экспериментируйте с новыми формами близости',
          'Регулярно обсуждайте состояние отношений',
        ],
        'en': [
          'Identify areas for targeted development',
          'Practice deeper emotional disclosure',
          'Experiment with new forms of intimacy',
          'Regularly discuss relationship status',
        ],
      },
      tryToday: {
        'ru': 'Выберите один аспект отношений и уделите ему особое внимание сегодня.',
        'en': 'Choose one aspect of relationships and give it special attention today.',
      },
      inspiringConclusion: {
        'ru': 'У вас есть всё необходимое для глубоких, счастливых отношений. Каждый шаг к осознанности делает вас ближе к партнёру.',
        'en': 'You have everything needed for deep, happy relationships. Every step toward awareness brings you closer to your partner.',
      },
    ),

    // === Профили по доминирующему фактору ===
    'profile_secure_base': TestProfile(
      id: 'profile_secure_base',
      name: {
        'ru': 'Надёжная опора',
        'en': 'Secure Base',
      },
      description: {
        'ru': 'Ваша сила — в способности создавать чувство безопасности и стабильности. Вы умеете быть рядом, не теряя себя, и поддерживать партнёра без созависимости.',
        'en': 'Your strength lies in the ability to create a sense of safety and stability. You can be close without losing yourself and support your partner without codependency.',
      },
      whyThisProfile: {
        'ru': 'Высокий показатель безопасной привязанности выделяет вас как надёжного партнёра.',
        'en': 'High secure attachment score makes you stand out as a reliable partner.',
      },
      strengths: {
        'ru': [
          'Эмоциональная устойчивость',
          'Умение давать пространство',
          'Спокойствие в конфликтах',
          'Здоровая самооценка',
        ],
        'en': [
          'Emotional stability',
          'Ability to give space',
          'Calmness in conflicts',
          'Healthy self-esteem',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может казаться эмоционально отстранённым',
          'Риск недооценивать потребности партнёра в близости',
        ],
        'en': [
          'May seem emotionally distant',
          'Risk of underestimating partner\'s intimacy needs',
        ],
      },
      recommendations: {
        'ru': [
          'Активнее проявляйте тёплые эмоции',
          'Инициируйте разговоры о чувствах',
          'Показывайте уязвимость партнёру',
        ],
        'en': [
          'More actively express warm emotions',
          'Initiate conversations about feelings',
          'Show vulnerability to your partner',
        ],
      },
      tryToday: {
        'ru': 'Расскажите партнёру о своих переживаниях — даже если они кажутся незначительными.',
        'en': 'Tell your partner about your feelings — even if they seem insignificant.',
      },
      inspiringConclusion: {
        'ru': 'Ваша внутренняя стабильность — это дар для любых отношений. Не бойтесь открываться глубже.',
        'en': 'Your inner stability is a gift for any relationship. Don\'t be afraid to open up deeper.',
      },
    ),

    'profile_deep_connector': TestProfile(
      id: 'profile_deep_connector',
      name: {
        'ru': 'Глубокий соединитель',
        'en': 'Deep Connector',
      },
      description: {
        'ru': 'Вы обладаете даром глубокой эмоциональной связи. Ваша открытость и способность делиться уязвимостью создают особенную близость в отношениях.',
        'en': 'You have the gift of deep emotional connection. Your openness and ability to share vulnerability create special intimacy in relationships.',
      },
      whyThisProfile: {
        'ru': 'Высокий показатель интимности и уязвимости указывает на вашу эмоциональную зрелость.',
        'en': 'High intimacy and vulnerability score indicates your emotional maturity.',
      },
      strengths: {
        'ru': [
          'Эмоциональная открытость',
          'Глубокое понимание чувств',
          'Способность слушать и сопереживать',
          'Аутентичность в общении',
        ],
        'en': [
          'Emotional openness',
          'Deep understanding of feelings',
          'Ability to listen and empathize',
          'Authenticity in communication',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Чувствительность к отвержению',
          'Риск эмоционального истощения',
        ],
        'en': [
          'Sensitivity to rejection',
          'Risk of emotional exhaustion',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте навыки эмоциональной саморегуляции',
          'Учитесь восстанавливаться после глубоких разговоров',
          'Балансируйте открытость с самозащитой',
        ],
        'en': [
          'Develop emotional self-regulation skills',
          'Learn to recover after deep conversations',
          'Balance openness with self-protection',
        ],
      },
      tryToday: {
        'ru': 'Практикуйте технику "контейнирования" — примите эмоции партнёра, не неся их как свои.',
        'en': 'Practice the "containing" technique — accept your partner\'s emotions without carrying them as your own.',
      },
      inspiringConclusion: {
        'ru': 'Ваша способность к глубокой связи — редкий дар. Берегите себя, продолжая дарить близость.',
        'en': 'Your ability for deep connection is a rare gift. Take care of yourself while continuing to offer intimacy.',
      },
    ),

    'profile_passionate_lover': TestProfile(
      id: 'profile_passionate_lover',
      name: {
        'ru': 'Страстный любовник',
        'en': 'Passionate Lover',
      },
      description: {
        'ru': 'Ваша сила — в способности поддерживать огонь страсти и физической близости. Вы умеете выражать желания и создавать атмосферу игры и флирта.',
        'en': 'Your strength lies in the ability to keep the fire of passion and physical intimacy alive. You can express desires and create an atmosphere of play and flirtation.',
      },
      whyThisProfile: {
        'ru': 'Высокий показатель страсти и телесности выделяет вас как чувственного партнёра.',
        'en': 'High passion and physicality score makes you stand out as a sensual partner.',
      },
      strengths: {
        'ru': [
          'Телесная осознанность',
          'Способность поддерживать влечение',
          'Спонтанность и игривость',
          'Открытость к экспериментам',
        ],
        'en': [
          'Body awareness',
          'Ability to maintain attraction',
          'Spontaneity and playfulness',
          'Openness to experiments',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может недооценивать эмоциональную близость',
          'Риск фокусироваться только на физическом',
        ],
        'en': [
          'May underestimate emotional intimacy',
          'Risk of focusing only on physical aspects',
        ],
      },
      recommendations: {
        'ru': [
          'Интегрируйте эмоциональную близость с физической',
          'Практикуйте разговоры о чувствах вне спальни',
          'Развивайте другие формы близости',
        ],
        'en': [
          'Integrate emotional intimacy with physical',
          'Practice talking about feelings outside the bedroom',
          'Develop other forms of intimacy',
        ],
      },
      tryToday: {
        'ru': 'Проведите вечер нежности без секса — массаж, объятия, разговоры.',
        'en': 'Spend an evening of tenderness without sex — massage, hugging, talking.',
      },
      inspiringConclusion: {
        'ru': 'Ваша страсть — это энергия любви. Направляйте её во все аспекты отношений.',
        'en': 'Your passion is the energy of love. Direct it into all aspects of your relationship.',
      },
    ),

    'profile_committed_partner': TestProfile(
      id: 'profile_committed_partner',
      name: {
        'ru': 'Преданный партнёр',
        'en': 'Committed Partner',
      },
      description: {
        'ru': 'Ваша сила — в надёжности и способности строить долгосрочные планы. Вы умеете держать слово и вкладываться в будущее отношений.',
        'en': 'Your strength lies in reliability and the ability to build long-term plans. You know how to keep your word and invest in the future of the relationship.',
      },
      whyThisProfile: {
        'ru': 'Высокий показатель обязательств и совместных целей выделяет вас как надёжного партнёра.',
        'en': 'High commitment and shared goals score makes you stand out as a reliable partner.',
      },
      strengths: {
        'ru': [
          'Надёжность и последовательность',
          'Умение планировать вместе',
          'Ответственность за обещания',
          'Видение долгосрочной перспективы',
        ],
        'en': [
          'Reliability and consistency',
          'Ability to plan together',
          'Responsibility for promises',
          'Long-term perspective vision',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск жёсткости в планах',
          'Может упускать момент "здесь и сейчас"',
        ],
        'en': [
          'Risk of rigidity in plans',
          'May miss the "here and now" moment',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте спонтанность в отношениях',
          'Оставляйте пространство для импровизации',
          'Балансируйте планирование с гибкостью',
        ],
        'en': [
          'Practice spontaneity in relationships',
          'Leave room for improvisation',
          'Balance planning with flexibility',
        ],
      },
      tryToday: {
        'ru': 'Сделайте что-то спонтанное для партнёра — без планирования.',
        'en': 'Do something spontaneous for your partner — without planning.',
      },
      inspiringConclusion: {
        'ru': 'Ваша преданность — фундамент крепких отношений. Добавьте немного игривости, и баланс будет идеальным.',
        'en': 'Your dedication is the foundation of strong relationships. Add a bit of playfulness, and the balance will be perfect.',
      },
    ),

    'profile_trustful_soul': TestProfile(
      id: 'profile_trustful_soul',
      name: {
        'ru': 'Доверяющая душа',
        'en': 'Trustful Soul',
      },
      description: {
        'ru': 'Ваша сила — в способности доверять и уважать границы. Вы не испытываете навязчивой ревности и умеете давать партнёру свободу.',
        'en': 'Your strength lies in the ability to trust and respect boundaries. You don\'t experience obsessive jealousy and can give your partner freedom.',
      },
      whyThisProfile: {
        'ru': 'Высокий показатель доверия выделяет вас как эмоционально зрелого партнёра.',
        'en': 'High trust score makes you stand out as an emotionally mature partner.',
      },
      strengths: {
        'ru': [
          'Базовое доверие к партнёру',
          'Уважение личного пространства',
          'Эмоциональная зрелость',
          'Способность к самоуспокоению',
        ],
        'en': [
          'Basic trust in partner',
          'Respect for personal space',
          'Emotional maturity',
          'Self-soothing ability',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск не замечать реальные проблемы',
          'Может избегать необходимых разговоров',
        ],
        'en': [
          'Risk of not noticing real problems',
          'May avoid necessary conversations',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте навыки конструктивного диалога',
          'Не путайте доверие с избеганием',
          'Обсуждайте беспокойства открыто',
        ],
        'en': [
          'Develop constructive dialogue skills',
          'Don\'t confuse trust with avoidance',
          'Discuss concerns openly',
        ],
      },
      tryToday: {
        'ru': 'Поделитесь с партнёром одним беспокойством — даже если оно кажется незначительным.',
        'en': 'Share one concern with your partner — even if it seems insignificant.',
      },
      inspiringConclusion: {
        'ru': 'Ваше доверие — драгоценный дар. Оно создаёт пространство, где любовь может расцветать.',
        'en': 'Your trust is a precious gift. It creates space where love can flourish.',
      },
    ),

    'profile_skilled_communicator': TestProfile(
      id: 'profile_skilled_communicator',
      name: {
        'ru': 'Мастер общения',
        'en': 'Skilled Communicator',
      },
      description: {
        'ru': 'Ваша сила — в способности эффективно общаться и разрешать конфликты. Вы используете "Я-сообщения", умеете слушать и находить компромиссы.',
        'en': 'Your strength lies in the ability to communicate effectively and resolve conflicts. You use "I-messages", know how to listen and find compromises.',
      },
      whyThisProfile: {
        'ru': 'Высокий показатель коммуникации выделяет вас как человека с развитыми навыками общения.',
        'en': 'High communication score makes you stand out as a person with developed communication skills.',
      },
      strengths: {
        'ru': [
          'Эффективное выражение потребностей',
          'Активное слушание',
          'Умение разрешать конфликты',
          'Конструктивная обратная связь',
        ],
        'en': [
          'Effective expression of needs',
          'Active listening',
          'Conflict resolution skills',
          'Constructive feedback',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск чрезмерного анализа',
          'Может уставать от постоянного "проговаривания"',
        ],
        'en': [
          'Risk of over-analysis',
          'May get tired of constant "talking through"',
        ],
      },
      recommendations: {
        'ru': [
          'Балансируйте разговоры с действиями',
          'Давайте место невербальному общению',
          'Практикуйте тишину как форму близости',
        ],
        'en': [
          'Balance talking with actions',
          'Make room for non-verbal communication',
          'Practice silence as a form of intimacy',
        ],
      },
      tryToday: {
        'ru': 'Проведите час в молчании с партнёром — просто будьте рядом.',
        'en': 'Spend an hour in silence with your partner — just be together.',
      },
      inspiringConclusion: {
        'ru': 'Ваше умение общаться — ключ к пониманию. Помните: иногда молчание говорит громче слов.',
        'en': 'Your communication skills are the key to understanding. Remember: sometimes silence speaks louder than words.',
      },
    ),

    // === Профили по слабому месту ===
    'profile_attachment_seeker': TestProfile(
      id: 'profile_attachment_seeker',
      name: {
        'ru': 'Ищущий привязанность',
        'en': 'Attachment Seeker',
      },
      description: {
        'ru': 'Вам важно чувствовать безопасность в отношениях. Работа над внутренней опорой поможет вам строить более спокойные и удовлетворяющие связи.',
        'en': 'It\'s important for you to feel safe in relationships. Working on inner support will help you build calmer and more satisfying connections.',
      },
      whyThisProfile: {
        'ru': 'Показатель безопасной привязанности указывает на зону развития.',
        'en': 'Secure attachment score indicates an area for development.',
      },
      strengths: {
        'ru': [
          'Глубокое желание близости',
          'Чувствительность к партнёру',
          'Готовность работать над отношениями',
        ],
        'en': [
          'Deep desire for closeness',
          'Sensitivity to partner',
          'Readiness to work on relationships',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Тревога в отношениях',
          'Страх потери партнёра',
          'Зависимость от подтверждения',
        ],
        'en': [
          'Relationship anxiety',
          'Fear of losing partner',
          'Dependence on confirmation',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте техники заземления',
          'Работайте с терапевтом над привязанностью',
          'Развивайте внутреннюю опору через самопомощь',
          'Ведите дневник позитивных моментов в отношениях',
        ],
        'en': [
          'Practice grounding techniques',
          'Work with a therapist on attachment',
          'Develop inner support through self-help',
          'Keep a journal of positive relationship moments',
        ],
      },
      tryToday: {
        'ru': 'Назовите три вещи, которые вы цените в себе — независимо от отношений.',
        'en': 'Name three things you value about yourself — regardless of relationships.',
      },
      inspiringConclusion: {
        'ru': 'Безопасность начинается внутри. Каждый шаг к себе — это шаг к более здоровой любви.',
        'en': 'Security starts within. Every step toward yourself is a step toward healthier love.',
      },
    ),

    'profile_guarded_heart': TestProfile(
      id: 'profile_guarded_heart',
      name: {
        'ru': 'Охраняющий сердце',
        'en': 'Guarded Heart',
      },
      description: {
        'ru': 'Эмоциональная открытость — ваша зона роста. Научившись быть уязвимым, вы откроете доступ к более глубоким отношениям.',
        'en': 'Emotional openness is your growth area. Learning to be vulnerable will open access to deeper relationships.',
      },
      whyThisProfile: {
        'ru': 'Показатель интимности указывает на защитную позицию в эмоциях.',
        'en': 'Intimacy score indicates a defensive position in emotions.',
      },
      strengths: {
        'ru': [
          'Самодостаточность',
          'Эмоциональная независимость',
          'Способность справляться самостоятельно',
        ],
        'en': [
          'Self-sufficiency',
          'Emotional independence',
          'Ability to cope independently',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сложности с раскрытием',
          'Избегание глубоких разговоров',
          'Страх уязвимости',
        ],
        'en': [
          'Difficulty opening up',
          'Avoiding deep conversations',
          'Fear of vulnerability',
        ],
      },
      recommendations: {
        'ru': [
          'Начните с маленьких актов открытости',
          'Практикуйте называние эмоций',
          'Ищите безопасное пространство для раскрытия',
          'Работайте с терапевтом над страхом близости',
        ],
        'en': [
          'Start with small acts of openness',
          'Practice naming emotions',
          'Find a safe space to open up',
          'Work with a therapist on fear of intimacy',
        ],
      },
      tryToday: {
        'ru': 'Поделитесь с партнёром одним переживанием, которое обычно держите в себе.',
        'en': 'Share with your partner one feeling you usually keep to yourself.',
      },
      inspiringConclusion: {
        'ru': 'За каждой защитой скрывается способность любить. Маленькие шаги открытости ведут к большой близости.',
        'en': 'Behind every defense hides the ability to love. Small steps of openness lead to great intimacy.',
      },
    ),

    'profile_intimacy_shy': TestProfile(
      id: 'profile_intimacy_shy',
      name: {
        'ru': 'Застенчивый в близости',
        'en': 'Intimacy Shy',
      },
      description: {
        'ru': 'Физическая близость и страсть — ваша зона развития. Исследуя эту область, вы можете обогатить отношения.',
        'en': 'Physical intimacy and passion is your development area. Exploring this area can enrich your relationships.',
      },
      whyThisProfile: {
        'ru': 'Показатель страсти указывает на дискомфорт с телесностью.',
        'en': 'Passion score indicates discomfort with physicality.',
      },
      strengths: {
        'ru': [
          'Уважение к границам',
          'Развитые другие формы близости',
          'Осторожность в отношениях',
        ],
        'en': [
          'Respect for boundaries',
          'Developed other forms of intimacy',
          'Caution in relationships',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Избегание темы секса',
          'Стыд вокруг желаний',
          'Сложности с инициативой',
        ],
        'en': [
          'Avoiding the topic of sex',
          'Shame around desires',
          'Difficulty with initiative',
        ],
      },
      recommendations: {
        'ru': [
          'Изучите свою телесность через танец или йогу',
          'Обсудите с партнёром желания в безопасной обстановке',
          'Работайте со стыдом через терапию',
          'Начните с несексуальных прикосновений',
        ],
        'en': [
          'Explore your physicality through dance or yoga',
          'Discuss desires with your partner in a safe setting',
          'Work on shame through therapy',
          'Start with non-sexual touch',
        ],
      },
      tryToday: {
        'ru': 'Практикуйте 10 минут осознанного прикосновения с партнёром.',
        'en': 'Practice 10 minutes of mindful touch with your partner.',
      },
      inspiringConclusion: {
        'ru': 'Тело — это инструмент любви. Постепенно знакомясь с ним, вы открываете новые грани близости.',
        'en': 'The body is an instrument of love. Gradually getting to know it, you discover new facets of intimacy.',
      },
    ),

    'profile_freedom_lover': TestProfile(
      id: 'profile_freedom_lover',
      name: {
        'ru': 'Любитель свободы',
        'en': 'Freedom Lover',
      },
      description: {
        'ru': 'Обязательства — ваша зона развития. Научившись брать на себя долгосрочные обязательства, вы откроете новый уровень отношений.',
        'en': 'Commitment is your development area. Learning to take on long-term commitments will open a new level of relationships.',
      },
      whyThisProfile: {
        'ru': 'Показатель обязательств указывает на предпочтение гибкости.',
        'en': 'Commitment score indicates a preference for flexibility.',
      },
      strengths: {
        'ru': [
          'Гибкость и адаптивность',
          'Ценность личной свободы',
          'Способность жить в моменте',
        ],
        'en': [
          'Flexibility and adaptability',
          'Value of personal freedom',
          'Ability to live in the moment',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сложности с планированием будущего',
          'Избегание определённости',
          'Откладывание важных решений',
        ],
        'en': [
          'Difficulty planning for the future',
          'Avoiding certainty',
          'Postponing important decisions',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте маленькие обязательства и выполняйте их',
          'Обсудите страхи вокруг обязательств',
          'Найдите баланс свободы и стабильности',
          'Создайте один совместный ритуал',
        ],
        'en': [
          'Practice small commitments and follow through',
          'Discuss fears around commitment',
          'Find a balance of freedom and stability',
          'Create one shared ritual',
        ],
      },
      tryToday: {
        'ru': 'Запланируйте что-то с партнёром на месяц вперёд — и держите слово.',
        'en': 'Plan something with your partner a month ahead — and keep your word.',
      },
      inspiringConclusion: {
        'ru': 'Свобода и обязательства не противоречат друг другу. Настоящая свобода — это выбор быть рядом.',
        'en': 'Freedom and commitment don\'t contradict each other. True freedom is choosing to be together.',
      },
    ),

    'profile_trust_builder': TestProfile(
      id: 'profile_trust_builder',
      name: {
        'ru': 'Строитель доверия',
        'en': 'Trust Builder',
      },
      description: {
        'ru': 'Доверие — ваша зона развития. Работая над своими страхами и контролем, вы сможете строить более свободные отношения.',
        'en': 'Trust is your development area. Working on your fears and control, you can build freer relationships.',
      },
      whyThisProfile: {
        'ru': 'Показатель доверия указывает на тревогу в отношениях.',
        'en': 'Trust score indicates relationship anxiety.',
      },
      strengths: {
        'ru': [
          'Внимательность к деталям',
          'Желание защитить отношения',
          'Готовность работать над проблемами',
        ],
        'en': [
          'Attention to details',
          'Desire to protect relationships',
          'Readiness to work on problems',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Ревность и подозрительность',
          'Потребность в контроле',
          'Сложности с самоуспокоением',
        ],
        'en': [
          'Jealousy and suspiciousness',
          'Need for control',
          'Difficulty self-soothing',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте различение фактов и интерпретаций',
          'Работайте с терапевтом над ревностью',
          'Развивайте навыки саморегуляции',
          'Создайте договор о прозрачности с партнёром',
        ],
        'en': [
          'Practice distinguishing facts from interpretations',
          'Work with a therapist on jealousy',
          'Develop self-regulation skills',
          'Create a transparency agreement with your partner',
        ],
      },
      tryToday: {
        'ru': 'Когда возникнет триггер ревности, сделайте паузу и спросите себя: "Это факт или моя интерпретация?"',
        'en': 'When a jealousy trigger arises, pause and ask yourself: "Is this a fact or my interpretation?"',
      },
      inspiringConclusion: {
        'ru': 'Доверие строится постепенно. Каждый шаг к внутреннему спокойствию — это шаг к свободным отношениям.',
        'en': 'Trust is built gradually. Every step toward inner peace is a step toward free relationships.',
      },
    ),

    'profile_conflict_avoider': TestProfile(
      id: 'profile_conflict_avoider',
      name: {
        'ru': 'Избегающий конфликтов',
        'en': 'Conflict Avoider',
      },
      description: {
        'ru': 'Коммуникация в конфликтах — ваша зона развития. Научившись выражать недовольство конструктивно, вы углубите отношения.',
        'en': 'Communication in conflicts is your development area. Learning to express dissatisfaction constructively will deepen your relationships.',
      },
      whyThisProfile: {
        'ru': 'Показатель коммуникации указывает на сложности с конфликтами.',
        'en': 'Communication score indicates difficulty with conflicts.',
      },
      strengths: {
        'ru': [
          'Желание гармонии',
          'Терпимость',
          'Способность адаптироваться',
        ],
        'en': [
          'Desire for harmony',
          'Tolerance',
          'Ability to adapt',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Накопление обид',
          'Пассивная агрессия',
          'Взрывы после долгого молчания',
        ],
        'en': [
          'Accumulation of grievances',
          'Passive aggression',
          'Explosions after long silence',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте "Я-сообщения" ежедневно',
          'Выражайте маленькие недовольства сразу',
          'Изучите техники ненасильного общения',
          'Используйте правило "не ложиться спать в ссоре"',
        ],
        'en': [
          'Practice "I-messages" daily',
          'Express small dissatisfactions immediately',
          'Study non-violent communication techniques',
          'Use the rule "don\'t go to bed angry"',
        ],
      },
      tryToday: {
        'ru': 'Скажите партнёру о чём-то, что вас беспокоит — используя "Я чувствую... когда..."',
        'en': 'Tell your partner about something that bothers you — using "I feel... when..."',
      },
      inspiringConclusion: {
        'ru': 'Конфликты — это возможность для роста. Каждый честный разговор делает отношения крепче.',
        'en': 'Conflicts are an opportunity for growth. Every honest conversation makes relationships stronger.',
      },
    ),

    // === Профили по уровню развития ===
    'profile_growing': TestProfile(
      id: 'profile_growing',
      name: {
        'ru': 'Растущий в любви',
        'en': 'Growing in Love',
      },
      description: {
        'ru': 'Вы на хорошем пути развития в отношениях. Есть области для роста, но фундамент уже заложен.',
        'en': 'You\'re on a good path of relationship development. There are areas for growth, but the foundation is already laid.',
      },
      whyThisProfile: {
        'ru': 'Ваш средний показатель (60-70%) указывает на стабильное развитие.',
        'en': 'Your average score (60-70%) indicates stable development.',
      },
      strengths: {
        'ru': [
          'Хорошая база для развития',
          'Осознанность в отношениях',
          'Готовность к росту',
        ],
        'en': [
          'Good foundation for development',
          'Relationship awareness',
          'Readiness for growth',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможна неравномерность развития',
          'Есть зоны для углубления',
        ],
        'en': [
          'Possible uneven development',
          'Areas for deepening exist',
        ],
      },
      recommendations: {
        'ru': [
          'Определите 1-2 области для фокуса',
          'Регулярно обсуждайте отношения с партнёром',
          'Празднуйте маленькие победы',
        ],
        'en': [
          'Identify 1-2 areas to focus on',
          'Regularly discuss the relationship with your partner',
          'Celebrate small victories',
        ],
      },
      tryToday: {
        'ru': 'Спросите партнёра: "Что я могу сделать, чтобы наши отношения стали ещё лучше?"',
        'en': 'Ask your partner: "What can I do to make our relationship even better?"',
      },
      inspiringConclusion: {
        'ru': 'Рост в любви — это путешествие. Каждый день предлагает возможности стать ближе.',
        'en': 'Growing in love is a journey. Every day offers opportunities to become closer.',
      },
    ),

    'profile_developing': TestProfile(
      id: 'profile_developing',
      name: {
        'ru': 'Развивающийся партнёр',
        'en': 'Developing Partner',
      },
      description: {
        'ru': 'Вы в процессе развития навыков отношений. Это требует времени и практики, но результаты того стоят.',
        'en': 'You\'re in the process of developing relationship skills. This takes time and practice, but the results are worth it.',
      },
      whyThisProfile: {
        'ru': 'Ваш средний показатель (40-60%) указывает на активную фазу развития.',
        'en': 'Your average score (40-60%) indicates an active development phase.',
      },
      strengths: {
        'ru': [
          'Осознание необходимости роста',
          'Потенциал для развития',
          'Открытость к изменениям',
        ],
        'en': [
          'Awareness of need for growth',
          'Potential for development',
          'Openness to change',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Недостаток навыков в некоторых областях',
          'Возможные паттерны из прошлого',
        ],
        'en': [
          'Lack of skills in some areas',
          'Possible patterns from the past',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите работу с терапевтом',
          'Читайте книги об отношениях',
          'Практикуйте новые навыки постепенно',
          'Будьте терпеливы к себе',
        ],
        'en': [
          'Consider working with a therapist',
          'Read books about relationships',
          'Practice new skills gradually',
          'Be patient with yourself',
        ],
      },
      tryToday: {
        'ru': 'Выберите одну рекомендацию из теста и начните применять её сегодня.',
        'en': 'Choose one recommendation from the test and start applying it today.',
      },
      inspiringConclusion: {
        'ru': 'Каждый эксперт когда-то был новичком. Ваше желание расти — уже половина успеха.',
        'en': 'Every expert was once a beginner. Your desire to grow is already half the success.',
      },
    ),

    'profile_early_stage': TestProfile(
      id: 'profile_early_stage',
      name: {
        'ru': 'На ранней стадии',
        'en': 'Early Stage',
      },
      description: {
        'ru': 'Навыки отношений находятся на начальной стадии развития. Это не приговор — это начало пути.',
        'en': 'Relationship skills are at an early stage of development. This is not a verdict — it\'s the beginning of a journey.',
      },
      whyThisProfile: {
        'ru': 'Ваши показатели указывают на необходимость целенаправленной работы.',
        'en': 'Your scores indicate the need for targeted work.',
      },
      strengths: {
        'ru': [
          'Честность в оценке себя',
          'Потенциал для трансформации',
          'Возможность начать с чистого листа',
        ],
        'en': [
          'Honesty in self-assessment',
          'Potential for transformation',
          'Opportunity to start fresh',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможные травмы привязанности',
          'Недостаток опыта здоровых отношений',
          'Паттерны избегания или тревоги',
        ],
        'en': [
          'Possible attachment trauma',
          'Lack of healthy relationship experience',
          'Avoidance or anxiety patterns',
        ],
      },
      recommendations: {
        'ru': [
          'Настоятельно рекомендуется терапия',
          'Работайте над собой до/параллельно с отношениями',
          'Изучайте теорию привязанности',
          'Практикуйте самосострадание',
        ],
        'en': [
          'Therapy is strongly recommended',
          'Work on yourself before/alongside relationships',
          'Study attachment theory',
          'Practice self-compassion',
        ],
      },
      tryToday: {
        'ru': 'Напишите себе письмо поддержки — как бы вы поддержали друга в такой ситуации?',
        'en': 'Write yourself a support letter — how would you support a friend in this situation?',
      },
      inspiringConclusion: {
        'ru': 'Исцеление возможно. Тысячи людей прошли этот путь. Первый шаг — признание, и вы его уже сделали.',
        'en': 'Healing is possible. Thousands of people have walked this path. The first step is recognition, and you\'ve already taken it.',
      },
    ),
  };

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
