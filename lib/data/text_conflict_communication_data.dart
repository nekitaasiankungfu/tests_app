import '../models/text_conflict_communication_model.dart';
import '../models/test_profile_model.dart';

/// Данные для теста "Конфликт в переписке: какой ты собеседник"
///
/// @version: 1.0.0

class TextConflictCommunicationData {
  // Список всех вопросов теста
  static final List<ScenarioQuestion> questions = [
    // Вопрос 1
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 1,
        situation: {
          'ru': 'Твой друг пишет за час до встречи:\n\n«Слушай, не могу сегодня, извини 🙈 Что-то внезапно навалилось»',
          'en': 'Your friend texts an hour before meeting:\n\n\'Hey, can\'t make it today, sorry 🙈 Something suddenly came up\'',
        },
        context: {
          'ru': 'Это уже третий раз за месяц, когда он отменяет встречу в последний момент',
          'en': 'This is the third time this month they cancel last minute',
        },
        question: {
          'ru': 'Как ты ответишь?',
          'en': 'How do you respond?',
        },
      ),
      options: [
        ScenarioOption(
          id: '1a',
          text: {
            'ru': '«Окей 👌» (но злюсь внутри и ничего не говорю)',
            'en': '\'Okay 👌\' (but angry inside and say nothing)',
          },
          scales: {
            'avoidance': 3,
            'passive_revenge': 1,
          },
        ),
        ScenarioOption(
          id: '1b',
          text: {
            'ru': '«Да ты чё вообще??? Это уже третий раз! Ты совсем охренел что ли?!»',
            'en': '\'Are you kidding me??? This is the third time! What\'s wrong with you?!\'',
          },
          scales: {
            'aggression': 4,
          },
        ),
        ScenarioOption(
          id: '1c',
          text: {
            'ru': 'Оставлю на прочитанном и не отвечу',
            'en': 'Leave on read and don\'t reply',
          },
          scales: {
            'avoidance': 2,
            'passive_revenge': 3,
          },
        ),
        ScenarioOption(
          id: '1d',
          text: {
            'ru': '«Понимаю, что бывают обстоятельства. Но меня расстраивает, что это уже третий раз. Я планирую свой день и чувствую, что моё время не ценят. Давай договоримся заранее предупреждать, если не уверен?»',
            'en': '\'I understand circumstances happen. But I\'m upset this is third time. I plan my day and feel my time isn\'t valued. Let\'s agree to warn in advance if uncertain?\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 2
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 2,
        situation: {
          'ru': 'В групповом чате с друзьями кто-то шутит:\n\n«Лол, [твоё имя] опять опоздал, как всегда 😂 У него вечно проблемы со временем»',
          'en': 'In group chat with friends someone jokes:\n\n\'Lol, [your name] late again, as always 😂 They always have time issues\'',
        },
        context: {
          'ru': 'Тебя это задевает, потому что ты правда стараешься не опаздывать',
          'en': 'This hurts because you really try not to be late',
        },
        question: {
          'ru': 'Твой ответ?',
          'en': 'Your response?',
        },
      ),
      options: [
        ScenarioOption(
          id: '2a',
          text: {
            'ru': 'Ничего не пишу, но выхожу из чата (или мьючу его)',
            'en': 'Say nothing but leave chat (or mute it)',
          },
          scales: {
            'avoidance': 4,
          },
        ),
        ScenarioOption(
          id: '2b',
          text: {
            'ru': '«А ты вечно тупишь и говоришь хуйню, но я молчу 🙂»',
            'en': '\'And you\'re always stupid and say bs, but I stay quiet 🙂\'',
          },
          scales: {
            'aggression': 3,
            'passive_revenge': 2,
          },
        ),
        ScenarioOption(
          id: '2c',
          text: {
            'ru': '«Ахаха, ну да 😅» (делаю вид, что не задевает, но обижен)',
            'en': '\'Haha, yeah 😅\' (pretend not hurt but offended)',
          },
          scales: {
            'avoidance': 2,
            'passive_revenge': 1,
          },
        ),
        ScenarioOption(
          id: '2d',
          text: {
            'ru': '«Знаю, что ты пошутил, но мне правда неприятно. Я стараюсь быть вовремя, и такие комментарии обесценивают мои усилия. Давай без личных шуток?»',
            'en': '\'I know you joked, but I\'m really uncomfortable. I try to be on time, and such comments devalue my efforts. How about no personal jokes?\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 3
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 3,
        situation: {
          'ru': 'Твой партнёр не отвечает на важное сообщение уже 3 часа, хотя был онлайн',
          'en': 'Your partner hasn\'t replied to important message for 3 hours, though was online',
        },
        context: {
          'ru': 'Ты видишь, что он/она читает сообщения, постит сторис, но твоё сообщение игнорирует',
          'en': 'You see they read messages, post stories, but ignore yours',
        },
        question: {
          'ru': 'Что делаешь?',
          'en': 'What do you do?',
        },
      ),
      options: [
        ScenarioOption(
          id: '3a',
          text: {
            'ru': 'Ничего. Буду ждать, когда ответит (но буду накручивать себя)',
            'en': 'Nothing. Will wait for reply (but will overthink)',
          },
          scales: {
            'avoidance': 3,
          },
        ),
        ScenarioOption(
          id: '3b',
          text: {
            'ru': '«Серьёзно?? Ты постишь сторис, но мне не можешь ответить??? Это вообще неуважение!»',
            'en': '\'Seriously?? You post stories but can\'t reply to me??? This is disrespectful!\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '3c',
          text: {
            'ru': 'Тоже начну игнорировать его/её сообщения специально',
            'en': 'Will also start ignoring their messages on purpose',
          },
          scales: {
            'passive_revenge': 4,
          },
        ),
        ScenarioOption(
          id: '3d',
          text: {
            'ru': '«Эй, я вижу что ты онлайн. Мой вопрос важный для меня, и молчание тревожит. Всё ок? Если не можешь сейчас говорить — дай знать, когда сможем обсудить»',
            'en': '\'Hey, I see you\'re online. My question is important to me, and silence worries me. Everything ok? If can\'t talk now — let me know when we can discuss\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 4
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 4,
        situation: {
          'ru': 'Ты в ссоре с партнёром. Он/она пишет:\n\n«Ты всегда так реагируешь! Это просто невозможно!»',
          'en': 'You\'re arguing with partner. They text:\n\n\'You always react like this! It\'s just impossible!\'',
        },
        context: {
          'ru': 'Это обобщение задевает тебя',
          'en': 'This generalization hurts you',
        },
        question: {
          'ru': 'Твоя реакция?',
          'en': 'Your reaction?',
        },
      ),
      options: [
        ScenarioOption(
          id: '4a',
          text: {
            'ru': 'Печатаю длинный гневный текст... и удаляю. Пишу короткое «Ладно», но на самом деле не ладно',
            'en': 'Type long angry text... and delete it. Write short \'Fine\' but actually not fine',
          },
          scales: {
            'avoidance': 2,
            'passive_revenge': 2,
          },
        ),
        ScenarioOption(
          id: '4b',
          text: {
            'ru': '«А ТЫ ВСЕГДА ВСЁ ПРЕУВЕЛИЧИВАЕШЬ! Я НЕ \'ВСЕГДА\', ТЫ ПРОСТО НЕ ХОЧЕШЬ СЛЫШАТЬ!»',
            'en': '\'AND YOU ALWAYS EXAGGERATE EVERYTHING! I DON\'T \'ALWAYS\', YOU JUST DON\'T WANT TO HEAR!\'',
          },
          scales: {
            'aggression': 4,
          },
        ),
        ScenarioOption(
          id: '4c',
          text: {
            'ru': '«Ну да, я такой ужасный. Всё, я всё понял 🙂» (и перестаю отвечать)',
            'en': '\'Yeah, I\'m so terrible. Got it, understood everything 🙂\' (and stop replying)',
          },
          scales: {
            'passive_revenge': 3,
            'avoidance': 1,
          },
        ),
        ScenarioOption(
          id: '4d',
          text: {
            'ru': '«Мне больно слышать \'всегда\'. Я не идеален, но обобщения обесценивают мои попытки. Давай говорить о конкретной ситуации? Что именно тебя расстроило сейчас?»',
            'en': '\'It hurts to hear \'always\'. I\'m not perfect, but generalizations devalue my efforts. Let\'s talk about specific situation? What exactly upset you now?\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 5
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 5,
        situation: {
          'ru': 'Друг постоянно пишет тебе поздно ночью с драмами и проблемами, когда ты уже спишь',
          'en': 'Friend constantly texts you late at night with dramas and problems when you\'re sleeping',
        },
        context: {
          'ru': 'Ты просыпаешься от уведомлений и это начинает раздражать',
          'en': 'You wake up from notifications and it\'s starting to annoy',
        },
        question: {
          'ru': 'Как поступишь?',
          'en': 'What do you do?',
        },
      ),
      options: [
        ScenarioOption(
          id: '5a',
          text: {
            'ru': 'Ничего не скажу, но буду злиться и отключу уведомления',
            'en': 'Won\'t say anything but will be angry and turn off notifications',
          },
          scales: {
            'avoidance': 3,
            'passive_revenge': 1,
          },
        ),
        ScenarioOption(
          id: '5b',
          text: {
            'ru': '«Блин, хватит уже писать ночью! Мне завтра рано вставать! У тебя что, нет других друзей?!»',
            'en': '\'Damn, stop texting at night! I have to wake up early! Don\'t you have other friends?!\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '5c',
          text: {
            'ru': 'Прочитаю утром и буду игнорировать специально несколько часов',
            'en': 'Will read in morning and ignore on purpose for several hours',
          },
          scales: {
            'passive_revenge': 3,
          },
        ),
        ScenarioOption(
          id: '5d',
          text: {
            'ru': '«Привет! Я понимаю, что тебе бывает тяжело, и я хочу поддержать. Но ночные сообщения нарушают мой сон, и мне нужна граница. Можем договориться писать после 8 утра, если не срочно? В реально критических случаях — звони»',
            'en': '\'Hi! I understand it\'s hard for you sometimes, and I want to support. But night messages disrupt my sleep, and I need boundary. Can we agree to text after 8am if not urgent? In really critical cases — call\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 6
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 6,
        situation: {
          'ru': 'Коллега пишет в рабочий чат в 22:00:\n\n«Можешь глянуть этот документ до завтра?»',
          'en': 'Colleague texts in work chat at 10pm:\n\n\'Can you check this document by tomorrow?\'',
        },
        context: {
          'ru': 'Ты уже закончил работу и отдыхаешь',
          'en': 'You already finished work and are relaxing',
        },
        question: {
          'ru': 'Твоё действие?',
          'en': 'Your action?',
        },
      ),
      options: [
        ScenarioOption(
          id: '6a',
          text: {
            'ru': 'Прочитаю и не отвечу до утра (надеясь, что он забудет)',
            'en': 'Read and don\'t reply until morning (hoping they forget)',
          },
          scales: {
            'avoidance': 3,
          },
        ),
        ScenarioOption(
          id: '6b',
          text: {
            'ru': '«Может тебе нормальный тайм-менеджмент выучить, а не в 22:00 всех доставать?»',
            'en': '\'Maybe you should learn normal time management instead of bothering everyone at 10pm?\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '6c',
          text: {
            'ru': 'Поставлю лайк на сообщение, но не отвечу и не сделаю',
            'en': 'React with like to message but don\'t reply and don\'t do it',
          },
          scales: {
            'passive_revenge': 3,
          },
        ),
        ScenarioOption(
          id: '6d',
          text: {
            'ru': '«Я уже закончил рабочий день. Смогу посмотреть завтра к обеду. Если это реально срочно — давай обсудим приоритеты с утра»',
            'en': '\'I already finished work day. Can check it tomorrow by noon. If really urgent — let\'s discuss priorities in morning\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 7
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 7,
        situation: {
          'ru': 'Друг пишет:\n\n«Погнали завтра в кино на новый фильм!»',
          'en': 'Friend texts:\n\n\'Let\'s go to cinema tomorrow for new movie!\'',
        },
        context: {
          'ru': 'Ты не хочешь, но он очень настаивает',
          'en': 'You don\'t want to but they\'re really insisting',
        },
        question: {
          'ru': 'Как ответишь?',
          'en': 'How do you reply?',
        },
      ),
      options: [
        ScenarioOption(
          id: '7a',
          text: {
            'ru': '«Ну ладно, давай» (хотя не хочу совсем)',
            'en': '\'Well okay, let\'s go\' (though don\'t want at all)',
          },
          scales: {
            'avoidance': 4,
          },
        ),
        ScenarioOption(
          id: '7b',
          text: {
            'ru': '«Не, не хочу смотреть эту фигню»',
            'en': '\'Nah, don\'t want to watch this crap\'',
          },
          scales: {
            'aggression': 2,
          },
        ),
        ScenarioOption(
          id: '7c',
          text: {
            'ru': '«Посмотрю, как будет настроение завтра 🤷‍♂️» (уже знаю что не пойду)',
            'en': '\'Will see how I feel tomorrow 🤷‍♂️\' (already know won\'t go)',
          },
          scales: {
            'avoidance': 2,
            'passive_revenge': 1,
          },
        ),
        ScenarioOption(
          id: '7d',
          text: {
            'ru': '«Спасибо за приглашение! Но завтра мне нужен вечер для себя. Может в другой раз на что-то другое?»',
            'en': '\'Thanks for invitation! But tomorrow I need evening for myself. Maybe another time for something else?\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 8
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 8,
        situation: {
          'ru': 'Партнёр в ссоре пишет:\n\n«Ты меня просто не любишь, это очевидно»',
          'en': 'Partner in argument texts:\n\n\'You just don\'t love me, it\'s obvious\'',
        },
        context: {
          'ru': 'Это манипуляция, которая тебя триггерит',
          'en': 'This is manipulation that triggers you',
        },
        question: {
          'ru': 'Твоя реакция?',
          'en': 'Your reaction?',
        },
      ),
      options: [
        ScenarioOption(
          id: '8a',
          text: {
            'ru': '«Нет, люблю...» (хотя чувствую что это манипуляция, но боюсь конфликта)',
            'en': '\'No, I love you...\' (though feel it\'s manipulation but afraid of conflict)',
          },
          scales: {
            'avoidance': 3,
          },
        ),
        ScenarioOption(
          id: '8b',
          text: {
            'ru': '«Блин, опять эта манипулятивная фигня! Если не веришь — уходи!»',
            'en': '\'Damn, this manipulative bs again! If don\'t believe — leave!\'',
          },
          scales: {
            'aggression': 4,
          },
        ),
        ScenarioOption(
          id: '8c',
          text: {
            'ru': '«Окей, если ты так думаешь 🙂» (и перестаю отвечать)',
            'en': '\'Okay, if you think so 🙂\' (and stop replying)',
          },
          scales: {
            'passive_revenge': 3,
          },
        ),
        ScenarioOption(
          id: '8d',
          text: {
            'ru': '«Когда ты говоришь так, мне больно. Я люблю тебя, но такие фразы чувствуются как манипуляция. Давай говорить о конкретных действиях, которые тебя расстроили, а не о моих чувствах?»',
            'en': '\'When you say that, it hurts me. I love you, but such phrases feel like manipulation. Let\'s talk about specific actions that upset you, not about my feelings?\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 9
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 9,
        situation: {
          'ru': 'Мама пишет в 10-й раз за день:\n\n«Почему не отвечаешь? Ты где? С тобой всё в порядке?»',
          'en': 'Mom texts for 10th time today:\n\n\'Why aren\'t you replying? Where are you? Are you okay?\'',
        },
        context: {
          'ru': 'Ты просто был занят, но её тревожность начинает душить',
          'en': 'You were just busy but her anxiety is starting to suffocate',
        },
        question: {
          'ru': 'Что делаешь?',
          'en': 'What do you do?',
        },
      ),
      options: [
        ScenarioOption(
          id: '9a',
          text: {
            'ru': '«Всё нормально» (и продолжаю игнорировать остальные сообщения)',
            'en': '\'Everything\'s fine\' (and continue ignoring other messages)',
          },
          scales: {
            'avoidance': 3,
          },
        ),
        ScenarioOption(
          id: '9b',
          text: {
            'ru': '«МАМ, ХВАТИТ УЖЕ! Я ВЗРОСЛЫЙ ЧЕЛОВЕК! ОТСТАНЬ!»',
            'en': '\'MOM, ENOUGH ALREADY! I\'M AN ADULT! LEAVE ME ALONE!\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '9c',
          text: {
            'ru': 'Читаю но не отвечаю специально, пусть поволнуется',
            'en': 'Read but don\'t reply on purpose, let her worry',
          },
          scales: {
            'passive_revenge': 3,
          },
        ),
        ScenarioOption(
          id: '9d',
          text: {
            'ru': '«Мам, я понимаю твоё беспокойство, и я люблю тебя. Но мне нужна граница. Я взрослый и часто бываю занят. Давай я буду писать раз в день, что всё ок? В экстренной ситуации звони»',
            'en': '\'Mom, I understand your worry, and I love you. But I need boundary. I\'m adult and often busy. How about I text once a day that I\'m ok? In emergency — call\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 10
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 10,
        situation: {
          'ru': 'В групповом чате планируют встречу в неудобное для тебя время, но все уже согласились',
          'en': 'In group chat planning meeting at inconvenient time for you, but everyone already agreed',
        },
        context: {
          'ru': 'Тебе неудобно, но ты не хочешь быть «тем самым»',
          'en': 'It\'s inconvenient but you don\'t want to be \'that person\'',
        },
        question: {
          'ru': 'Твои действия?',
          'en': 'Your actions?',
        },
      ),
      options: [
        ScenarioOption(
          id: '10a',
          text: {
            'ru': '«Окей, буду» (но потом просто не приду)',
            'en': '\'Okay, I\'ll be there\' (but then just won\'t show up)',
          },
          scales: {
            'avoidance': 3,
            'passive_revenge': 1,
          },
        ),
        ScenarioOption(
          id: '10b',
          text: {
            'ru': '«А почему никто не спросил удобно ли мне?! Вы всегда так!»',
            'en': '\'And why didn\'t anyone ask if it\'s convenient for me?! You always do this!\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '10c',
          text: {
            'ru': 'Ничего не пишу, просто читаю (пусть думают что приду)',
            'en': 'Don\'t write anything, just read (let them think I\'ll come)',
          },
          scales: {
            'avoidance': 4,
          },
        ),
        ScenarioOption(
          id: '10d',
          text: {
            'ru': '«Ребят, мне неудобно в это время. Могу во вторник или четверг вечером. Если только это время — жаль, но не смогу. Встретимся в следующий раз!»',
            'en': '\'Guys, this time doesn\'t work for me. I can do Tuesday or Thursday evening. If only this time — sorry, can\'t make it. See you next time!\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 11
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 11,
        situation: {
          'ru': 'Знакомый просит одолжить денег в личке:\n\n«Друг, можешь закинуть 5к до зарплаты? Выручи 🙏»',
          'en': 'Acquaintance asks to borrow money in DM:\n\n\'Dude, can you lend 5k until payday? Help me out 🙏\'',
        },
        context: {
          'ru': 'Ты не близки настолько, и прошлый раз он не вернул',
          'en': 'You\'re not that close, and last time they didn\'t return',
        },
        question: {
          'ru': 'Как поступишь?',
          'en': 'What do you do?',
        },
      ),
      options: [
        ScenarioOption(
          id: '11a',
          text: {
            'ru': 'Читаю и не отвечаю вообще',
            'en': 'Read and don\'t reply at all',
          },
          scales: {
            'avoidance': 4,
          },
        ),
        ScenarioOption(
          id: '11b',
          text: {
            'ru': '«Ты серьёзно? В прошлый раз не вернул, а теперь опять попрошайничаешь?»',
            'en': '\'Seriously? Didn\'t return last time, and now begging again?\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '11c',
          text: {
            'ru': '«Эх, сам в жопе сейчас, извини 😬» (хотя это неправда)',
            'en': '\'Eh, broke myself right now, sorry 😬\' (though not true)',
          },
          scales: {
            'avoidance': 2,
            'passive_revenge': 1,
          },
        ),
        ScenarioOption(
          id: '11d',
          text: {
            'ru': '«Не могу одолжить. В прошлый раз деньги не вернулись, и я больше не даю в долг. Но могу посоветовать [ресурс для микрозаймов/помощи]»',
            'en': '\'Can\'t lend. Last time money wasn\'t returned, and I don\'t lend anymore. But can recommend [resource for microloans/help]\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 12
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 12,
        situation: {
          'ru': 'Партнёр постоянно пишет «где ты?», «с кем?», «почему не отвечаешь?» каждые 15 минут',
          'en': 'Partner constantly texts \'where are you?\', \'with whom?\', \'why not replying?\' every 15 minutes',
        },
        context: {
          'ru': 'Это начинает душить и чувствуется как контроль',
          'en': 'This is starting to suffocate and feels like control',
        },
        question: {
          'ru': 'Твои действия?',
          'en': 'Your actions?',
        },
      ),
      options: [
        ScenarioOption(
          id: '12a',
          text: {
            'ru': 'Отвечаю каждый раз (хотя раздражён)',
            'en': 'Reply every time (though annoyed)',
          },
          scales: {
            'avoidance': 3,
          },
        ),
        ScenarioOption(
          id: '12b',
          text: {
            'ru': '«Ты чё, офигел контролировать меня?! Я не твоя собственность!»',
            'en': '\'Have you lost it controlling me?! I\'m not your property!\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '12c',
          text: {
            'ru': 'Специально перестаю отвечать вообще на несколько часов',
            'en': 'Purposely stop replying completely for several hours',
          },
          scales: {
            'passive_revenge': 4,
          },
        ),
        ScenarioOption(
          id: '12d',
          text: {
            'ru': '«Мне нужно поговорить о нашей переписке. Постоянные вопросы \'где ты\' давят на меня. Я понимаю что ты беспокоишься, но мне нужно пространство. Давай договоримся о комфортной частоте связи для нас обоих?»',
            'en': '\'I need to talk about our texting. Constant \'where are you\' questions pressure me. I understand you worry, but I need space. Let\'s agree on comfortable contact frequency for both of us?\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 13
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 13,
        situation: {
          'ru': 'Друг пишет:\n\n«Слышал новость про твоего бывшего? 😏 Он уже с новой, лол»',
          'en': 'Friend texts:\n\n\'Heard news about your ex? 😏 He\'s already with someone new, lol\'',
        },
        context: {
          'ru': 'Тебе больно, и ты не понимаешь зачем он это написал',
          'en': 'It hurts, and you don\'t understand why they wrote this',
        },
        question: {
          'ru': 'Как отреагируешь?',
          'en': 'How do you react?',
        },
      ),
      options: [
        ScenarioOption(
          id: '13a',
          text: {
            'ru': '«Ахаха, пофиг 😅» (но мне больно)',
            'en': '\'Haha, don\'t care 😅\' (but it hurts)',
          },
          scales: {
            'avoidance': 3,
          },
        ),
        ScenarioOption(
          id: '13b',
          text: {
            'ru': '«А тебе какая разница? Занимайся своей жизнью!»',
            'en': '\'Why do you care? Mind your own business!\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '13c',
          text: {
            'ru': '«Ну ок 🙂» (и мысленно вычёркиваю друга из близких)',
            'en': '\'Well ok 🙂\' (and mentally cross friend out of close ones)',
          },
          scales: {
            'passive_revenge': 3,
          },
        ),
        ScenarioOption(
          id: '13d',
          text: {
            'ru': '«Знаю, что ты хотел поделиться новостью, но мне сейчас больно это слышать. Давай не будем обсуждать моего бывшего? Ценю твою заботу, но это не помогает»',
            'en': '\'I know you wanted to share news, but it\'s painful for me to hear now. Let\'s not discuss my ex? I appreciate your care, but it doesn\'t help\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 14
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 14,
        situation: {
          'ru': 'В рабочем чате коллега публично критикует твою идею:\n\n«Это не сработает по 100 причинам. Думаю, это очевидно всем»',
          'en': 'In work chat colleague publicly criticizes your idea:\n\n\'This won\'t work for 100 reasons. I think it\'s obvious to everyone\'',
        },
        context: {
          'ru': 'Тебя задевает публичность критики',
          'en': 'You\'re hurt by public criticism',
        },
        question: {
          'ru': 'Твой ответ?',
          'en': 'Your response?',
        },
      ),
      options: [
        ScenarioOption(
          id: '14a',
          text: {
            'ru': 'Ничего не отвечаю (но чувствую себя униженным)',
            'en': 'Don\'t reply anything (but feel humiliated)',
          },
          scales: {
            'avoidance': 4,
          },
        ),
        ScenarioOption(
          id: '14b',
          text: {
            'ru': '«А твои идеи всегда идеальны? Может сначала сам что-то предложишь?»',
            'en': '\'And your ideas are always perfect? Maybe suggest something yourself first?\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '14c',
          text: {
            'ru': '«Ну ок, раз \'очевидно всем\' 🙂» (и запоминаю это)',
            'en': '\'Well ok, if \'obvious to everyone\' 🙂\' (and remember this)',
          },
          scales: {
            'passive_revenge': 3,
          },
        ),
        ScenarioOption(
          id: '14d',
          text: {
            'ru': '«Ценю обратную связь. Можем обсудить конкретные проблемы лично или в отдельном треде? Хочу понять твои аргументы и доработать предложение»',
            'en': '\'I appreciate feedback. Can we discuss specific issues privately or in separate thread? I want to understand your arguments and improve proposal\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 15
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 15,
        situation: {
          'ru': 'Друг \'забыл\' про твой день рождения, хотя ты помнишь про его',
          'en': 'Friend \'forgot\' your birthday though you remember theirs',
        },
        context: {
          'ru': 'Тебе обидно и хочется как-то на это отреагировать',
          'en': 'You\'re hurt and want to somehow react',
        },
        question: {
          'ru': 'Что делаешь?',
          'en': 'What do you do?',
        },
      ),
      options: [
        ScenarioOption(
          id: '15a',
          text: {
            'ru': 'Ничего не говорю (но запомню это)',
            'en': 'Say nothing (but will remember this)',
          },
          scales: {
            'avoidance': 3,
            'passive_revenge': 1,
          },
        ),
        ScenarioOption(
          id: '15b',
          text: {
            'ru': '«Прикольно, да? Я твой помню, а ты мой нет»',
            'en': '\'Cool, right? I remember yours but you don\'t mine\'',
          },
          scales: {
            'aggression': 2,
            'passive_revenge': 2,
          },
        ),
        ScenarioOption(
          id: '15c',
          text: {
            'ru': 'Забуду про его следующий день рождения специально',
            'en': 'Will forget their next birthday on purpose',
          },
          scales: {
            'passive_revenge': 4,
          },
        ),
        ScenarioOption(
          id: '15d',
          text: {
            'ru': '«Эй, сегодня мой день рождения 😊 Я понимаю, что все забывчивы иногда. Но мне было бы приятно, если бы ты помнил — это важно для меня»',
            'en': '\'Hey, it\'s my birthday today 😊 I understand everyone is forgetful sometimes. But I\'d appreciate if you remembered — it\'s important to me\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 16
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 16,
        situation: {
          'ru': 'Партнёр пишет после ссоры:\n\n«Я просто не буду больше с тобой об этом говорить»',
          'en': 'Partner texts after argument:\n\n\'I just won\'t talk to you about this anymore\'',
        },
        context: {
          'ru': 'Это чувствуется как уход от решения проблемы',
          'en': 'This feels like avoiding problem resolution',
        },
        question: {
          'ru': 'Твоя реакция?',
          'en': 'Your reaction?',
        },
      ),
      options: [
        ScenarioOption(
          id: '16a',
          text: {
            'ru': '«Ладно» (и больше не поднимаю тему, хотя проблема не решена)',
            'en': '\'Fine\' (and don\'t bring up topic again, though problem unsolved)',
          },
          scales: {
            'avoidance': 4,
          },
        ),
        ScenarioOption(
          id: '16b',
          text: {
            'ru': '«Как удобно! Так ты всегда делаешь! Бежишь от проблем!»',
            'en': '\'How convenient! You always do this! Run from problems!\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '16c',
          text: {
            'ru': '«Окей, не говорим 🙂» (и тоже закрываюсь)',
            'en': '\'Okay, won\'t talk 🙂\' (and close off too)',
          },
          scales: {
            'passive_revenge': 3,
          },
        ),
        ScenarioOption(
          id: '16d',
          text: {
            'ru': '«Мне важно решить этот вопрос, потому что он влияет на наши отношения. Понимаю, что сейчас тяжело, но избегание не решит проблему. Может возьмём паузу и вернёмся к разговору завтра?»',
            'en': '\'It\'s important to me to resolve this because it affects our relationship. I understand it\'s hard now, but avoidance won\'t solve problem. Maybe take break and return to conversation tomorrow?\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 17
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 17,
        situation: {
          'ru': 'В групповом чате твою шутку никто не понял и начали осуждать',
          'en': 'In group chat nobody understood your joke and started judging',
        },
        context: {
          'ru': 'Ты чувствуешь себя неловко и не знаешь как выйти из ситуации',
          'en': 'You feel awkward and don\'t know how to handle situation',
        },
        question: {
          'ru': 'Как поступишь?',
          'en': 'What do you do?',
        },
      ),
      options: [
        ScenarioOption(
          id: '17a',
          text: {
            'ru': 'Удалю сообщение и больше ничего не напишу',
            'en': 'Delete message and won\'t write anything else',
          },
          scales: {
            'avoidance': 4,
          },
        ),
        ScenarioOption(
          id: '17b',
          text: {
            'ru': '«Вы просто тупые и не понимаете юмор»',
            'en': '\'You\'re just dumb and don\'t understand humor\'',
          },
          scales: {
            'aggression': 4,
          },
        ),
        ScenarioOption(
          id: '17c',
          text: {
            'ru': '«Ладно, забейте 🙄» (и обижусь)',
            'en': '\'Fine, forget it 🙄\' (and get offended)',
          },
          scales: {
            'passive_revenge': 2,
            'avoidance': 1,
          },
        ),
        ScenarioOption(
          id: '17d',
          text: {
            'ru': '«Ой, извините, это была неудачная шутка 😅 Я имел в виду [объяснение]. Понимаю что прозвучало не так»',
            'en': '\'Oh, sorry, that was bad joke 😅 I meant [explanation]. Understand it sounded wrong\'',
          },
          scales: {
            'assertiveness': 3,
          },
        ),
      ],
    ),

    // Вопрос 18
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 18,
        situation: {
          'ru': 'Сосед по комнате/квартире постоянно оставляет грязную посуду',
          'en': 'Roommate constantly leaves dirty dishes',
        },
        context: {
          'ru': 'Ты уже устал это терпеть',
          'en': 'You\'re already tired of tolerating this',
        },
        question: {
          'ru': 'Как напишешь?',
          'en': 'How do you text?',
        },
      ),
      options: [
        ScenarioOption(
          id: '18a',
          text: {
            'ru': 'Ничего не пишу, просто мою за ним (и злюсь)',
            'en': 'Don\'t write anything, just wash after them (and angry)',
          },
          scales: {
            'avoidance': 4,
          },
        ),
        ScenarioOption(
          id: '18b',
          text: {
            'ru': '«Блин, ты вообще свинья! Сколько можно уже?!»',
            'en': '\'Damn, you\'re such a pig! How long can this go on?!\'',
          },
          scales: {
            'aggression': 4,
          },
        ),
        ScenarioOption(
          id: '18c',
          text: {
            'ru': 'Оставлю всю грязную посуду в его комнате',
            'en': 'Will leave all dirty dishes in their room',
          },
          scales: {
            'passive_revenge': 4,
          },
        ),
        ScenarioOption(
          id: '18d',
          text: {
            'ru': '«Привет! Мне нужно поговорить о посуде. Я устал мыть за двоих. Давай договоримся: каждый моет сразу после еды? Или сделаем график?»',
            'en': '\'Hi! I need to talk about dishes. I\'m tired of washing for two. Let\'s agree: everyone washes right after eating? Or make schedule?\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 19
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 19,
        situation: {
          'ru': 'Друг \'случайно\' рассказал твой секрет другим',
          'en': 'Friend \'accidentally\' told your secret to others',
        },
        context: {
          'ru': 'Ты чувствуешь предательство',
          'en': 'You feel betrayed',
        },
        question: {
          'ru': 'Как напишешь?',
          'en': 'How do you text?',
        },
      ),
      options: [
        ScenarioOption(
          id: '19a',
          text: {
            'ru': 'Ничего не скажу, но дистанцируюсь (больше не буду доверять)',
            'en': 'Won\'t say anything but distance myself (won\'t trust anymore)',
          },
          scales: {
            'avoidance': 3,
            'passive_revenge': 2,
          },
        ),
        ScenarioOption(
          id: '19b',
          text: {
            'ru': '«Ты предатель! После этого мы не друзья!»',
            'en': '\'You\'re a traitor! We\'re not friends after this!\'',
          },
          scales: {
            'aggression': 4,
          },
        ),
        ScenarioOption(
          id: '19c',
          text: {
            'ru': '«Ахаха, всё норм 😅» (но внутри бешусь и расскажу его секрет)',
            'en': '\'Haha, all good 😅\' (but furious inside and will tell their secret)',
          },
          scales: {
            'avoidance': 1,
            'passive_revenge': 4,
          },
        ),
        ScenarioOption(
          id: '19d',
          text: {
            'ru': '«Мне больно, что мой секрет рассказали. Я доверял тебе. Понимаю что могла быть случайность, но для меня это важно. Можем поговорить об этом?»',
            'en': '\'I\'m hurt that my secret was told. I trusted you. I understand it might be accident, but it\'s important to me. Can we talk about this?\'',
          },
          scales: {
            'assertiveness': 4,
          },
        ),
      ],
    ),

    // Вопрос 20
    ScenarioQuestion(
      scenario: ConflictScenario(
        id: 20,
        situation: {
          'ru': 'Партнёр пишет в 3 часа ночи после вечеринки:\n\n«ты лутший я так тя лублю»',
          'en': 'Partner texts at 3am after party:\n\n\'ur the best i luv u so much\'',
        },
        context: {
          'ru': 'Ты проснулся от уведомления и злишься, что он/она напился и беспокоит',
          'en': 'You woke up from notification and angry they got drunk and disturb',
        },
        question: {
          'ru': 'Твоя реакция?',
          'en': 'Your reaction?',
        },
      ),
      options: [
        ScenarioOption(
          id: '20a',
          text: {
            'ru': 'Не отвечу (буду злиться молча до утра)',
            'en': 'Won\'t reply (will be silently angry until morning)',
          },
          scales: {
            'avoidance': 2,
            'passive_revenge': 2,
          },
        ),
        ScenarioOption(
          id: '20b',
          text: {
            'ru': '«Заебал! Я сплю! Иди спать тоже!»',
            'en': '\'Fed up! I\'m sleeping! Go sleep too!\'',
          },
          scales: {
            'aggression': 3,
          },
        ),
        ScenarioOption(
          id: '20c',
          text: {
            'ru': '«👍» (и проигнорирую его с утра специально)',
            'en': '\'👍\' (and will ignore them in morning on purpose)',
          },
          scales: {
            'passive_revenge': 3,
          },
        ),
        ScenarioOption(
          id: '20d',
          text: {
            'ru': '«Люблю тебя тоже 😊 Но сейчас 3 ночи и я сплю. Поговорим утром, окей? Спокойной ночи»',
            'en': '\'Love you too 😊 But it\'s 3am and I\'m sleeping. Let\'s talk in morning, okay? Good night\'',
          },
          scales: {
            'assertiveness': 3,
          },
        ),
      ],
    ),
  ];

  /// Определение профиля на основе процентов по шкалам
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'the_mixed';

    final avoidance = percentages['avoidance'] ?? 0.0;
    final aggression = percentages['aggression'] ?? 0.0;
    final passiveRevenge = percentages['passive_revenge'] ?? 0.0;
    final assertiveness = percentages['assertiveness'] ?? 0.0;

    // Определение доминирующего профиля (порог: 60%)
    if (assertiveness >= 60) return 'the_assertive';
    if (avoidance >= 60) return 'the_ghoster';
    if (aggression >= 60) return 'the_exploder';
    if (passiveRevenge >= 60) return 'the_passive_avenger';

    return 'the_mixed';
  }

  /// Получение профиля по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Профили коммуникации
  static final Map<String, TestProfile> _profiles = {
    'the_ghoster': TestProfile(
      id: 'the_ghoster',
      name: {
        'ru': 'Призрак 👻',
        'en': 'The Ghoster 👻',
      },
      description: {
        'ru': 'Твой основной стиль — избегание. Ты оставляешь на прочитанном, удаляешь тексты, не отвечаешь на неудобные вопросы. Ты боишься конфликтов настолько, что предпочитаешь исчезнуть, чем разговаривать о проблемах.',
        'en': 'Your main style is avoidance. You leave on read, delete texts, don\'t reply to uncomfortable questions. You fear conflicts so much you\'d rather disappear than talk about problems.',
      },
      whyThisProfile: {
        'ru': 'Обычно избегание идёт из страха конфликтов, низкой самооценки или опыта, где твоё мнение игнорировали. Тебе кажется, что молчание безопаснее, чем говорить.',
        'en': 'Usually avoidance comes from fear of conflicts, low self-esteem, or experience where your opinion was ignored. You think silence is safer than speaking.',
      },
      strengths: {
        'ru': [],
        'en': [],
      },
      vulnerabilities: {
        'ru': [
          'Проблемы не решаются, а накапливаются',
          'Люди не знают что ты чувствуешь',
          'Отношения становятся поверхностными',
          'Тебя могут считать равнодушным',
          'Накапливается обида и злость',
        ],
        'en': [
          'Problems don\'t get solved, they accumulate',
          'People don\'t know what you feel',
          'Relationships become superficial',
          'You may be seen as indifferent',
          'Resentment and anger accumulate',
        ],
      },
      recommendations: {
        'ru': [
          'Начни с малого: отвечай на простые сообщения сразу',
          'Практикуй фразу: \'Мне нужно время подумать\'',
          'Помни: конфликт ≠ конец отношений',
          'Пробуй голосовые — они менее стрессовые чем текст',
          'Работай над страхом конфликтов с психологом',
        ],
        'en': [
          'Start small: reply to simple messages immediately',
          'Practice phrase: \'I need time to think\'',
          'Remember: conflict ≠ end of relationship',
          'Try voice messages — they\'re less stressful than text',
          'Work on conflict fear with therapist',
        ],
      },
      tryToday: {
        'ru': 'Сегодня ответь на одно сообщение, на которое давно откладываешь ответ. Просто напиши «Привет, извини за долгое молчание».',
        'en': 'Today reply to one message you\'ve been putting off. Just write "Hi, sorry for long silence".',
      },
      inspiringConclusion: {
        'ru': 'Твой голос важен. Мир не рухнет, если ты скажешь что чувствуешь. Начни с малого — и ты увидишь, как отношения станут честнее.',
        'en': 'Your voice matters. The world won\'t collapse if you say what you feel. Start small — and you\'ll see relationships become more honest.',
      },
    ),

    'the_exploder': TestProfile(
      id: 'the_exploder',
      name: {
        'ru': 'Бомба 💥',
        'en': 'The Bomb 💥',
      },
      description: {
        'ru': 'Ты взрываешься в переписке. КАПС, восклицательные знаки, обвинения, оскорбления — твои инструменты. Ты быстро переходишь в атаку, когда что-то не так.',
        'en': 'You explode in chats. CAPS, exclamation marks, accusations, insults — your tools. You quickly go on attack when something\'s wrong.',
      },
      whyThisProfile: {
        'ru': 'Агрессия часто маскирует боль, страх или беспомощность. Ты не научился выражать эмоции по-другому, и атака кажется способом защитить себя.',
        'en': 'Aggression often masks pain, fear, or helplessness. You didn\'t learn to express emotions differently, and attack seems like way to protect yourself.',
      },
      strengths: {
        'ru': [],
        'en': [],
      },
      vulnerabilities: {
        'ru': [
          'Люди боятся с тобой общаться',
          'Отношения разрушаются',
          'Твои слова могут ранить глубоко',
          'Ты не можешь вернуть написанное',
          'Тебя считают токсичным',
        ],
        'en': [
          'People are afraid to communicate with you',
          'Relationships get destroyed',
          'Your words can hurt deeply',
          'You can\'t take back what\'s written',
          'You\'re seen as toxic',
        ],
      },
      recommendations: {
        'ru': [
          'КРИТИЧНО: пауза перед отправкой. Считай до 10',
          'Правило: злой текст = сохранить в черновиках на час',
          'Переводи КАПС в спокойный тон',
          'Практикуй \'я-сообщения\': \'Я чувствую...\' вместо \'Ты...\'',
          'Работай с психологом над управлением гневом',
          'Используй функцию \'отложенная отправка\'',
        ],
        'en': [
          'CRITICAL: pause before sending. Count to 10',
          'Rule: angry text = save in drafts for hour',
          'Convert CAPS to calm tone',
          'Practice \'I-statements\': \'I feel...\' instead of \'You...\'',
          'Work with therapist on anger management',
          'Use \'delayed send\' feature',
        ],
      },
      tryToday: {
        'ru': 'Сегодня, если почувствуешь гнев в переписке — сохрани сообщение в черновиках. Вернись к нему через час. Перепиши спокойно.',
        'en': 'Today, if you feel anger in chat — save message in drafts. Return to it in hour. Rewrite calmly.',
      },
      inspiringConclusion: {
        'ru': 'За твоей злостью — боль. За болью — желание быть услышанным. Научись говорить о боли без взрывов — и тебя услышат.',
        'en': 'Behind your anger — pain. Behind pain — desire to be heard. Learn to speak about pain without explosions — and you\'ll be heard.',
      },
    ),

    'the_passive_avenger': TestProfile(
      id: 'the_passive_avenger',
      name: {
        'ru': 'Тихий мститель 😒',
        'en': 'Silent Avenger 😒',
      },
      description: {
        'ru': 'Ты не взрываешься напрямую, но мстишь тонко: сарказм, игнор как наказание, \'лайки\' без ответа, намёки. Ты даёшь понять что недоволен, но не говоришь прямо.',
        'en': 'You don\'t explode directly but revenge subtly: sarcasm, ignoring as punishment, \'likes\' without replies, hints. You make it clear you\'re displeased but don\'t say directly.',
      },
      whyThisProfile: {
        'ru': 'Пассивная агрессия — это когда ты злишься, но боишься конфликта. Это способ наказать, оставаясь \'хорошим\'.',
        'en': 'Passive aggression is when you\'re angry but fear conflict. It\'s way to punish while staying \'nice\'.',
      },
      strengths: {
        'ru': [],
        'en': [],
      },
      vulnerabilities: {
        'ru': [
          'Люди не понимают что ты хочешь',
          'Это форма манипуляции',
          'Создаёт токсичную атмосферу',
          'Проблемы не решаются',
          'Ты кажешься фальшивым',
        ],
        'en': [
          'People don\'t understand what you want',
          'It\'s form of manipulation',
          'Creates toxic atmosphere',
          'Problems don\'t get solved',
          'You seem fake',
        ],
      },
      recommendations: {
        'ru': [
          'Замени сарказм на прямоту: \'Меня это задевает\'',
          'Не используй молчание как оружие',
          'Если злишься — скажи об этом словами',
          'Практикуй честную коммуникацию',
          'Читай про ассертивность',
        ],
        'en': [
          'Replace sarcasm with directness: \'This hurts me\'',
          'Don\'t use silence as weapon',
          'If angry — say it with words',
          'Practice honest communication',
          'Read about assertiveness',
        ],
      },
      tryToday: {
        'ru': 'Сегодня, если захочешь ответить сарказмом или игнором — остановись. Напиши прямо: «Мне обидно/больно/неприятно».',
        'en': 'Today, if you want to reply with sarcasm or ignore — stop. Write directly: "I\'m hurt/offended/uncomfortable".',
      },
      inspiringConclusion: {
        'ru': 'Честность — это не слабость. Говорить прямо — это смелость. Твоё настоящее мнение достойно быть услышанным.',
        'en': 'Honesty is not weakness. Speaking directly is courage. Your real opinion deserves to be heard.',
      },
    ),

    'the_assertive': TestProfile(
      id: 'the_assertive',
      name: {
        'ru': 'Ассертивный собеседник 🎯',
        'en': 'Assertive Communicator 🎯',
      },
      description: {
        'ru': 'Ты умеешь общаться здорово! Ты прямо выражаешь чувства и границы, используешь \'я-сообщения\', сохраняешь спокойный тон и конструктивность даже в конфликтах.',
        'en': 'You communicate well! You directly express feelings and boundaries, use \'I-statements\', maintain calm tone and constructiveness even in conflicts.',
      },
      whyThisProfile: {
        'ru': 'Ты научился балансировать между защитой своих границ и уважением к другим. Это редкий навык!',
        'en': 'You learned to balance between protecting your boundaries and respecting others. This is rare skill!',
      },
      strengths: {
        'ru': [
          'Люди понимают тебя',
          'Конфликты решаются конструктивно',
          'Отношения строятся на честности',
          'Ты защищаешь границы без агрессии',
          'Тебя уважают',
        ],
        'en': [
          'People understand you',
          'Conflicts are resolved constructively',
          'Relationships built on honesty',
          'You defend boundaries without aggression',
          'You\'re respected',
        ],
      },
      vulnerabilities: {
        'ru': [],
        'en': [],
      },
      recommendations: {
        'ru': [
          'Продолжай быть примером',
          'Помогай другим учиться ассертивности',
          'Следи за балансом между твёрдостью и эмпатией',
          'Не забывай про заботу о себе',
        ],
        'en': [
          'Continue being example',
          'Help others learn assertiveness',
          'Monitor balance between firmness and empathy',
          'Don\'t forget self-care',
        ],
      },
      tryToday: {
        'ru': 'Сегодня поделись своим навыком: помоги другу выразить чувства конструктивно вместо агрессии или молчания.',
        'en': 'Today share your skill: help friend express feelings constructively instead of aggression or silence.',
      },
      inspiringConclusion: {
        'ru': 'Ты — пример здоровой коммуникации. Твой навык говорить честно и мирно делает мир лучше. Продолжай!',
        'en': 'You are example of healthy communication. Your skill to speak honestly and peacefully makes world better. Keep going!',
      },
    ),

    'the_mixed': TestProfile(
      id: 'the_mixed',
      name: {
        'ru': 'Смешанный стиль 🌈',
        'en': 'Mixed Style 🌈',
      },
      description: {
        'ru': 'У тебя нет одного доминирующего стиля — ты используешь разные подходы в зависимости от ситуации. Это может быть как гибкостью, так и непоследовательностью.',
        'en': 'You don\'t have one dominant style — you use different approaches depending on situation. This can be both flexibility and inconsistency.',
      },
      whyThisProfile: {
        'ru': 'Твои реакции зависят от контекста: с кем, когда, в какой ситуации. Возможно, ты всё ещё ищешь свой стиль или адаптируешься под разных людей.',
        'en': 'Your reactions depend on context: with whom, when, in what situation. Perhaps you\'re still finding your style or adapting to different people.',
      },
      strengths: {
        'ru': [
          'Ты гибкий в общении',
          'Можешь адаптироваться под разных людей',
          'У тебя есть навыки разных стилей',
        ],
        'en': [
          'You\'re flexible in communication',
          'Can adapt to different people',
          'You have skills of different styles',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Непоследовательность может сбивать других с толку',
          'Сложно предсказать твою реакцию',
          'Возможна внутренняя противоречивость',
        ],
        'en': [
          'Inconsistency can confuse others',
          'Hard to predict your reaction',
          'Possible internal contradictions',
        ],
      },
      recommendations: {
        'ru': [
          'Посмотри на конкретные шкалы в результатах',
          'Определи, какой стиль тебе ближе',
          'Работай над развитием ассертивности',
          'Стремись к последовательности в важных отношениях',
        ],
        'en': [
          'Look at specific scales in results',
          'Determine which style is closer to you',
          'Work on developing assertiveness',
          'Strive for consistency in important relationships',
        ],
      },
      tryToday: {
        'ru': 'Сегодня отследи свои реакции в переписках. С кем ты агрессивен? С кем избегаешь? С кем ассертивен? Найди паттерн.',
        'en': 'Today track your reactions in chats. With whom are you aggressive? With whom avoid? With whom assertive? Find pattern.',
      },
      inspiringConclusion: {
        'ru': 'Разнообразие — это потенциал. Теперь твоя задача — выбрать, каким собеседником ты хочешь быть, и двигаться в этом направлении.',
        'en': 'Diversity is potential. Now your task — choose what kind of communicator you want to be, and move in that direction.',
      },
    ),
  };
}
