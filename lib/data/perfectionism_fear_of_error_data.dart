import '../models/test_model.dart';

/// Data access class for Perfectionism and Fear of Error Test
/// Legacy Dart implementation (no JSON dependency)
class PerfectionismFearOfErrorData {
  /// Get the complete Perfectionism and Fear of Error test
  static TestModel getPerfectionismFearOfErrorTest() {
    return TestModel(
      id: 'perfectionism_fear_of_error_v1',
      title: {
        'ru': 'Перфекционизм и страх ошибки',
        'en': 'Perfectionism and Fear of Error',
      },
      description: {
        'ru':
            'Этот опросник помогает оценить, как вы обращаетесь со своей требовательностью к себе: где перфекционизм поддерживает качество и развитие, а где превращается в источник стресса, самокритики и откладывания важных дел. Тест показывает баланс между здоровыми стандартами и деструктивными установками, связанными со страхом ошибки и оценкой окружающих.\n\nРезультаты помогут понять, почему вы иногда «загоняете» себя, из-за чего можете выгорать или откладывать задачи до последнего, а также какие элементы перфекционизма уже работают в вашу пользу. Опросник не является клинической диагностикой, но может служить отправной точкой для самонаблюдения, личной работы или обсуждения с психологом.',
        'en':
            'This questionnaire helps assess how you handle your self-demands: where perfectionism supports quality and development, and where it becomes a source of stress, self-criticism and procrastination. The test shows the balance between healthy standards and destructive attitudes related to fear of error and evaluation by others.\n\nThe results will help understand why you sometimes "drive" yourself, why you may burn out or procrastinate, and which elements of perfectionism already work in your favor. The questionnaire is not a clinical diagnosis, but can serve as a starting point for self-observation, personal work or discussion with a psychologist.',
      },
      category: {
        'ru': 'Карьера и профессиональное развитие',
        'en': 'Career and Professional Development',
      },
      categoryId: 'career',
      disclaimer: {
        'ru':
            'Этот тест основан на моделях адаптивного и дезадаптивного перфекционизма (Frost et al.; Hewitt & Flett) и когнитивно-поведенческих моделях тревоги и страха оценки. Он предназначен для самооценки и не является медицинской диагностикой. Отвечайте честно для получения наиболее точных результатов.',
        'en':
            'This test is based on models of adaptive and maladaptive perfectionism (Frost et al.; Hewitt & Flett) and cognitive-behavioral models of anxiety and fear of evaluation. It is for self-assessment and not a medical diagnosis. Answer honestly for the most accurate results.',
      },
      estimatedTime: 8,
      type: TestType.multiFactor,
      factorIds: [
        'healthy_perfectionism',
        'maladaptive_perfectionism',
        'fear_of_evaluation',
        'procrastination_due_to_ideal'
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'healthy_perfectionism': {
        'ru': 'Здоровый перфекционизм',
        'en': 'Healthy Perfectionism',
      },
      'maladaptive_perfectionism': {
        'ru': 'Деструктивный перфекционизм',
        'en': 'Maladaptive Perfectionism',
      },
      'fear_of_evaluation': {
        'ru': 'Страх оценки',
        'en': 'Fear of Evaluation',
      },
      'procrastination_due_to_ideal': {
        'ru': 'Прокрастинация из-за идеала',
        'en': 'Procrastination Due to Ideal',
      },
    };
  }

  /// Get factor interpretation based on percentage score
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Handle NaN or invalid percentage (ПРАВИЛО #5)
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }

    // Clamp percentage to 0-100 range
    percentage = percentage.clamp(0.0, 100.0);

    // Determine range: very_low (0-20), low (21-40), medium (41-60), high (61-80), very_high (81-100)
    final String level;
    if (percentage <= 20) {
      level = 'very_low';
    } else if (percentage <= 40) {
      level = 'low';
    } else if (percentage <= 60) {
      level = 'medium';
    } else if (percentage <= 80) {
      level = 'high';
    } else {
      level = 'very_high';
    }

    // Return interpretation based on factor and level
    return _getInterpretation(factorId, level);
  }

  /// Get all questions for the test
  static List<QuestionModel> _getQuestions() {
    // Standard 5-point Likert scale answers (ПРАВИЛО #1: scores 0-4!)
    final likert5Answers = [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совершенно не согласен(а)',
          'en': 'Strongly Disagree',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не согласен(а)',
          'en': 'Disagree',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Нейтрально',
          'en': 'Neutral',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Скорее согласен(а)',
          'en': 'Agree',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью согласен(а)',
          'en': 'Strongly Agree',
        },
        score: 4,
      ),
    ];

    return [
      // HEALTHY PERFECTIONISM (9 questions: 1, 5, 9, 13R, 17, 21R, 25, 29R, 33R)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Мне важно выполнять задачи качественно, даже если никто этого не заметит.',
          'en': 'It is important for me to perform tasks with quality, even if no one notices.',
        },
        answers: likert5Answers,
        factorId: 'healthy_perfectionism',
        isReversed: false,
      ),

      // MALADAPTIVE PERFECTIONISM (9 questions: 2, 6R, 10, 14, 18R, 22, 26R, 30, 34R)
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Если я допускаю ошибку, я долго прокручиваю её в голове.',
          'en': 'If I make a mistake, I replay it in my mind for a long time.',
        },
        answers: likert5Answers,
        factorId: 'maladaptive_perfectionism',
        isReversed: false,
      ),

      // FEAR OF EVALUATION (9 questions: 3, 7, 11R, 15, 19, 23R, 27, 31R, 35R)
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я боюсь, что другие осудят меня, если узнают о моих ошибках.',
          'en': 'I am afraid that others will judge me if they find out about my mistakes.',
        },
        answers: likert5Answers,
        factorId: 'fear_of_evaluation',
        isReversed: false,
      ),

      // PROCRASTINATION DUE TO IDEAL (9 questions: 4, 8, 12R, 16, 20R, 24, 28R, 32, 36R)
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я откладываю выполнение задач, пока не почувствую, что готов(а) сделать всё идеально.',
          'en': 'I postpone tasks until I feel ready to do everything perfectly.',
        },
        answers: likert5Answers,
        factorId: 'procrastination_due_to_ideal',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Высокие стандарты помогают мне расти и развиваться.',
          'en': 'High standards help me grow and develop.',
        },
        answers: likert5Answers,
        factorId: 'healthy_perfectionism',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Я легко прощаю себе мелкие недочёты.',
          'en': 'I easily forgive myself for minor flaws.',
        },
        answers: likert5Answers,
        factorId: 'maladaptive_perfectionism',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Мне трудно попросить обратную связь, потому что боюсь услышать критику.',
          'en': 'It is difficult for me to ask for feedback because I fear criticism.',
        },
        answers: likert5Answers,
        factorId: 'fear_of_evaluation',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Иногда я так долго дорабатываю детали, что не успеваю сдать работу вовремя.',
          'en': 'Sometimes I refine details for so long that I miss deadlines.',
        },
        answers: likert5Answers,
        factorId: 'procrastination_due_to_ideal',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я чувствую удовлетворение, когда сделал(а) всё максимально хорошо в рамках разумного.',
          'en': 'I feel satisfaction when I have done everything as well as reasonably possible.',
        },
        answers: likert5Answers,
        factorId: 'healthy_perfectionism',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Если результат не идеален, я считаю, что провалился(ась).',
          'en': 'If the result is not perfect, I consider it a failure.',
        },
        answers: likert5Answers,
        factorId: 'maladaptive_perfectionism',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Замечания других людей я в основном воспринимаю как помощь, а не как угрозу.',
          'en': 'I mostly perceive others\' feedback as help, not as a threat.',
        },
        answers: likert5Answers,
        factorId: 'fear_of_evaluation',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Я предпочитаю завершить задачу на хорошем уровне, чем бесконечно доводить её до идеала.',
          'en': 'I prefer to complete a task at a good level rather than endlessly refining it to perfection.',
        },
        answers: likert5Answers,
        factorId: 'procrastination_due_to_ideal',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Мне трудно остановиться, даже когда результат уже достаточно хорош.',
          'en': 'It is hard for me to stop, even when the result is already good enough.',
        },
        answers: likert5Answers,
        factorId: 'healthy_perfectionism',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я часто сравниваю свои достижения с другими и чувствую, что должен(на) быть лучше.',
          'en': 'I often compare my achievements with others and feel I should be better.',
        },
        answers: likert5Answers,
        factorId: 'maladaptive_perfectionism',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я переживаю, что одно неверное действие испортит впечатление обо мне.',
          'en': 'I worry that one wrong action will ruin the impression of me.',
        },
        answers: likert5Answers,
        factorId: 'fear_of_evaluation',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я откладываю начало сложных задач, потому что заранее боюсь не справиться на нужном уровне.',
          'en': 'I postpone starting difficult tasks because I fear I won\'t handle them at the required level.',
        },
        answers: likert5Answers,
        factorId: 'procrastination_due_to_ideal',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я умею ставить реалистичные цели и планировать шаги к ним.',
          'en': 'I can set realistic goals and plan steps toward them.',
        },
        answers: likert5Answers,
        factorId: 'healthy_perfectionism',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Я могу признать ошибку и идти дальше, не зацикливаясь на ней.',
          'en': 'I can acknowledge a mistake and move on without dwelling on it.',
        },
        answers: likert5Answers,
        factorId: 'maladaptive_perfectionism',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Я сильно переживаю, если кто-то видит, как я учусь и допускаю ошибки.',
          'en': 'I am very upset if someone sees me learning and making mistakes.',
        },
        answers: likert5Answers,
        factorId: 'fear_of_evaluation',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Даже если условия не идеальны, я всё равно стараюсь двигаться вперёд по задаче.',
          'en': 'Even if conditions are not ideal, I still try to move forward with the task.',
        },
        answers: likert5Answers,
        factorId: 'procrastination_due_to_ideal',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Мне сложно радоваться результату, если он не идеален во всех деталях.',
          'en': 'It is hard for me to be happy with a result if it is not perfect in all details.',
        },
        answers: likert5Answers,
        factorId: 'healthy_perfectionism',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Часто мои внутренние требования ко мне выше, чем ожидания окружающих.',
          'en': 'Often my internal demands on myself are higher than others\' expectations.',
        },
        answers: likert5Answers,
        factorId: 'maladaptive_perfectionism',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Мне относительно комфортно показывать другим незавершённый или черновой результат.',
          'en': 'I am relatively comfortable showing others an unfinished or draft result.',
        },
        answers: likert5Answers,
        factorId: 'fear_of_evaluation',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Иногда я тяну с началом дела, потому что сначала ищу «идеальный момент».',
          'en': 'Sometimes I delay starting because I am looking for the "perfect moment".',
        },
        answers: likert5Answers,
        factorId: 'procrastination_due_to_ideal',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я могу отличить важные детали от второстепенных и распределять усилия соответственно.',
          'en': 'I can distinguish important details from secondary ones and allocate effort accordingly.',
        },
        answers: likert5Answers,
        factorId: 'healthy_perfectionism',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Если я сделал(а) ошибку, это не означает, что я плохой специалист или человек.',
          'en': 'If I made a mistake, it does not mean I am a bad professional or person.',
        },
        answers: likert5Answers,
        factorId: 'maladaptive_perfectionism',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Мне трудно принимать похвалу — я думаю, что люди переоценивают меня и «раскроют» при первой ошибке.',
          'en': 'It is hard for me to accept praise — I think people overestimate me and will "expose" me at the first mistake.',
        },
        answers: likert5Answers,
        factorId: 'fear_of_evaluation',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Я стараюсь завершить задачи даже тогда, когда не уверен(а), что сделаю их идеально.',
          'en': 'I try to complete tasks even when I am not sure I will do them perfectly.',
        },
        answers: likert5Answers,
        factorId: 'procrastination_due_to_ideal',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я часто чувствую, что должен(на) работать больше других, чтобы заслужить право на отдых.',
          'en': 'I often feel I must work more than others to earn the right to rest.',
        },
        answers: likert5Answers,
        factorId: 'healthy_perfectionism',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я часто испытываю стыд, вспоминая о своих прошлых промахах.',
          'en': 'I often feel shame when recalling my past mistakes.',
        },
        answers: likert5Answers,
        factorId: 'maladaptive_perfectionism',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Даже если меня оценивают, я всё равно могу позволить себе экспериментировать и пробовать новое.',
          'en': 'Even if I am being evaluated, I can still allow myself to experiment and try new things.',
        },
        answers: likert5Answers,
        factorId: 'fear_of_evaluation',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Иногда я так долго обдумываю, как сделать лучше, что почти не перехожу к действиям.',
          'en': 'Sometimes I think so long about how to do better that I barely start acting.',
        },
        answers: likert5Answers,
        factorId: 'procrastination_due_to_ideal',
        isReversed: false,
      ),

      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Когда я не справляюсь на высшем уровне, мне кажется, что вся моя ценность снижается.',
          'en': 'When I do not perform at the highest level, I feel my entire value decreases.',
        },
        answers: likert5Answers,
        factorId: 'healthy_perfectionism',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Я могу быть к себе доброжелателен(ьна), даже когда что-то не получилось.',
          'en': 'I can be kind to myself even when something did not work out.',
        },
        answers: likert5Answers,
        factorId: 'maladaptive_perfectionism',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Мне не нужно казаться безупречным(ой), чтобы чувствовать себя принят(ой) другими.',
          'en': 'I do not need to appear flawless to feel accepted by others.',
        },
        answers: likert5Answers,
        factorId: 'fear_of_evaluation',
        isReversed: true,
      ),

      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Даже если работа ещё далека от идеала, я всё равно предпочитаю сдавать её в срок.',
          'en': 'Even if the work is far from ideal, I still prefer to submit it on time.',
        },
        answers: likert5Answers,
        factorId: 'procrastination_due_to_ideal',
        isReversed: true,
      ),
    ];
  }

  /// Get interpretation text for a specific factor and level
  static Map<String, String> _getInterpretation(String factorId, String level) {
    final interpretations = {
      'healthy_perfectionism': {
        'very_low': {
          'ru':
              'Очень низкий уровень здорового перфекционизма. Вы, вероятно, не склонны опираться на высокие стандарты как на ресурс. Чаще всего вы можете действовать по принципу «и так сойдёт» или снижать планку, чтобы избежать напряжения. Это может уменьшать стресс, но в долгосрочной перспективе иногда мешать реализации потенциала и чувству профессиональной гордости.',
          'en':
              'Very low level of healthy perfectionism. You probably do not tend to rely on high standards as a resource. Most often you may act on the principle of "good enough" or lower the bar to avoid tension. This can reduce stress, but in the long run sometimes hinders the realization of potential and a sense of professional pride.',
        },
        'low': {
          'ru':
              'Низкий уровень здорового перфекционизма. Вы можете ценить качество, но не всегда используете высокие стандарты как внутренний ориентир. Важные задачи иногда выполняются на минимально достаточном уровне, без ощущения вовлечённости и профессиональной гордости. Такой профиль может сопровождаться относительно низким стрессом, но и меньшим чувством достижения.',
          'en':
              'Low level of healthy perfectionism. You may value quality, but do not always use high standards as an internal guide. Important tasks are sometimes performed at a minimally sufficient level, without a sense of involvement and professional pride. This profile may be accompanied by relatively low stress, but also a lower sense of achievement.',
        },
        'medium': {
          'ru':
              'Средний уровень здорового перфекционизма. Вы достаточно требовательны к себе, чтобы поддерживать качество и развитие, но при этом чаще всего умеете останавливаться и признавать результат «достаточно хорошим». Вы можете планировать, ставить реалистичные цели и получать удовольствие от хорошо выполненной работы.',
          'en':
              'Medium level of healthy perfectionism. You are demanding enough to maintain quality and development, but at the same time you mostly know how to stop and recognize the result as "good enough". You can plan, set realistic goals and enjoy a job well done.',
        },
        'high': {
          'ru':
              'Высокий уровень здорового перфекционизма. Вы склонны задавать себе высокие, но в основном реалистичные стандарты. Скорее всего, вы аккуратно планируете работу, цените качество и умеете выделять важные детали. Это может помогать в карьере и учёбе, усиливать чувство компетентности и профессионализма.',
          'en':
              'High level of healthy perfectionism. You tend to set high but mostly realistic standards for yourself. Most likely, you plan your work carefully, value quality and know how to highlight important details. This can help in your career and studies, enhance a sense of competence and professionalism.',
        },
        'very_high': {
          'ru':
              'Очень высокий уровень здорового перфекционизма. Вы задаёте себе очень высокие стандарты и серьёзно относитесь к качеству почти во всём, за что беретесь. Это может приносить впечатляющие результаты, но также повышает риск переутомления, выгорания и трудностей с отдыхом. Иногда становится сложно снижать планку даже там, где это было бы разумно.',
          'en':
              'Very high level of healthy perfectionism. You set very high standards for yourself and take quality seriously in almost everything you undertake. This can bring impressive results, but also increases the risk of overwork, burnout and difficulties with rest. Sometimes it becomes difficult to lower the bar even where it would be reasonable.',
        },
      },
      'maladaptive_perfectionism': {
        'very_low': {
          'ru':
              'Очень низкий уровень деструктивного перфекционизма. Вы, скорее всего, не склонны жёстко ругать себя за ошибки и реже испытываете стыд или ощущение провала, если что-то идёт не идеально. Вы можете признавать недочёты и идти дальше, сохраняя уважение к себе. Такой профиль обычно связан с более устойчивой самооценкой и меньшим уровнем внутреннего давления.',
          'en':
              'Very low level of maladaptive perfectionism. You are most likely not inclined to harshly criticize yourself for mistakes and less likely to experience shame or a sense of failure if something does not go perfectly. You can acknowledge shortcomings and move on while maintaining self-respect. This profile is usually associated with more stable self-esteem and lower levels of internal pressure.',
        },
        'low': {
          'ru':
              'Низкий уровень деструктивного перфекционизма. Иногда вы можете быть к себе строже, чем необходимо, но это не становится постоянным фоном. Ошибки вызывают неприятные чувства, однако вы в целом способны их интегрировать и двигаться дальше. При повышении нагрузки или ответственности тенденция к самокритике может усиливаться.',
          'en':
              'Low level of maladaptive perfectionism. Sometimes you may be stricter with yourself than necessary, but this does not become a constant background. Mistakes cause unpleasant feelings, but you are generally able to integrate them and move on. With increased workload or responsibility, the tendency to self-criticism may intensify.',
        },
        'medium': {
          'ru':
              'Средний уровень деструктивного перфекционизма. Вы нередко предъявляете себе высокие и жёсткие требования, можете долго переживать из-за ошибок или несоответствия собственным стандартам. При этом у вас, скорее всего, есть и ресурсы — моменты, когда вы умеете быть к себе мягче. Такой профиль часто сопровождается периодическими всплесками самокритики.',
          'en':
              'Medium level of maladaptive perfectionism. You often make high and strict demands on yourself, may worry for a long time about mistakes or non-compliance with your own standards. At the same time, you most likely have resources - moments when you know how to be softer with yourself. This profile is often accompanied by periodic bursts of self-criticism.',
        },
        'high': {
          'ru':
              'Высокий уровень деструктивного перфекционизма. Вы часто предъявляете к себе завышенные требования и можете оценивать свою ценность через безошибочность и достижения. Ошибки и недочёты нередко воспринимаются как серьёзный личный провал, что усиливает стыд, тревогу и напряжение. Такой уровень повышает риск выгорания и хронического чувства «я недостаточно хорош(а)».',
          'en':
              'High level of maladaptive perfectionism. You often make excessive demands on yourself and may evaluate your worth through flawlessness and achievements. Mistakes and shortcomings are often perceived as a serious personal failure, which increases shame, anxiety and tension. This level increases the risk of burnout and chronic feeling of "I am not good enough".',
        },
        'very_high': {
          'ru':
              'Очень высокий уровень деструктивного перфекционизма. Возможно, вы живёте под постоянным давлением внутреннего критика, считая, что обязаны быть лучше, чем есть сейчас. Ошибки могут приводить к сильному стыду, ощущению несостоятельности и даже к самонаказанию. Такой профиль часто связан с высоким уровнем стресса, риском выгорания и эмоционального истощения.',
          'en':
              'Very high level of maladaptive perfectionism. Perhaps you live under constant pressure from an internal critic, believing that you must be better than you are now. Mistakes can lead to strong shame, a sense of inadequacy and even self-punishment. This profile is often associated with high levels of stress, risk of burnout and emotional exhaustion.',
        },
      },
      'fear_of_evaluation': {
        'very_low': {
          'ru':
              'Очень низкий уровень страха оценки. Вы довольно спокойно относитесь к тому, что другие могут видеть ваши ошибки, черновики и процесс обучения. Критика и обратная связь чаще воспринимаются как ресурс, а не как угроза. Такой профиль поддерживает гибкость, способность учиться и пробовать новое, снижая тревогу в социальных и рабочих ситуациях.',
          'en':
              'Very low level of fear of evaluation. You are quite calm about the fact that others may see your mistakes, drafts and learning process. Criticism and feedback are more often perceived as a resource, not as a threat. This profile supports flexibility, the ability to learn and try new things, reducing anxiety in social and work situations.',
        },
        'low': {
          'ru':
              'Низкий уровень страха оценки. Иногда вы можете волноваться о том, как вас воспримут, но это редко становится главным фактором в поведении. Вы способны просить обратную связь и показывать незавершённый результат, хотя в некоторых ситуациях это вызывает напряжение. В целом такой уровень не мешает учиться и проявляться.',
          'en':
              'Low level of fear of evaluation. Sometimes you may worry about how you will be perceived, but this rarely becomes the main factor in behavior. You are able to ask for feedback and show unfinished results, although in some situations this causes tension. In general, this level does not interfere with learning and manifestation.',
        },
        'medium': {
          'ru':
              'Средний уровень страха оценки. Вы достаточно чувствительны к чужому мнению и можете переживать, как вас оценят. Это может сдерживать от того, чтобы показывать незавершённый результат или пробовать новые форматы. Однако в ряде ситуаций вы всё же проявляетесь и ищете контакт. Такой уровень часто встречается у людей с высокими стандартами и ответственностью.',
          'en':
              'Medium level of fear of evaluation. You are quite sensitive to the opinions of others and may worry about how you will be evaluated. This may deter you from showing unfinished results or trying new formats. However, in a number of situations you still manifest yourself and seek contact. This level is often found in people with high standards and responsibility.',
        },
        'high': {
          'ru':
              'Высокий уровень страха оценки. Вы часто переживаете, как вас видят и оценивают другие. Возможность совершить ошибку на виду вызывает сильное напряжение, из-за чего вы можете избегать новых задач, публичных выступлений, просьб о помощи или обратной связи. Это может мешать карьерному росту и личному развитию, усиливая чувство зажатости и тревоги.',
          'en':
              'High level of fear of evaluation. You often worry about how you are seen and evaluated by others. The possibility of making a mistake in public causes strong tension, which is why you may avoid new tasks, public speaking, requests for help or feedback. This can hinder career growth and personal development, increasing feelings of constraint and anxiety.',
        },
        'very_high': {
          'ru':
              'Очень высокий уровень страха оценки. Вероятно, вы часто выбираете «не высовываться», избегаете ситуаций, где вас могут оценивать, критиковать или замечать ошибки. Любая возможность публичного промаха может ощущаться как серьёзная угроза самооценке и отношениям. Такой уровень страха оценки часто связан с выраженной тревогой и ощущением внутренней уязвимости.',
          'en':
              'Very high level of fear of evaluation. Probably you often choose "not to stick out", avoid situations where you can be evaluated, criticized or noticed mistakes. Any possibility of a public failure can be felt as a serious threat to self-esteem and relationships. This level of fear of evaluation is often associated with pronounced anxiety and a sense of internal vulnerability.',
        },
      },
      'procrastination_due_to_ideal': {
        'very_low': {
          'ru':
              'Очень низкий уровень прокрастинации из-за идеала. Вы редко откладываете дела именно из-за стремления к идеалу. Скорее всего, вы способны приступать к задачам и завершать их даже в неидеальных условиях и без полной уверенности в результате. Это создаёт хороший ресурс для продуктивности и снижает риск застревания в бесконечном планировании или доработках.',
          'en':
              'Very low level of procrastination due to ideal. You rarely postpone things precisely because of the pursuit of the ideal. Most likely, you are able to start tasks and complete them even in non-ideal conditions and without full confidence in the result. This creates a good resource for productivity and reduces the risk of getting stuck in endless planning or refinement.',
        },
        'low': {
          'ru':
              'Низкий уровень прокрастинации из-за идеала. Иногда вы можете откладывать задачи, пока не почувствуете себя достаточно готовым(ой) или пока условия не станут «подходящими», но это не превращается в устойчивый паттерн. В большинстве случаев вам удаётся стартовать и завершать дела вовремя.',
          'en':
              'Low level of procrastination due to ideal. Sometimes you may postpone tasks until you feel ready enough or until conditions become "suitable", but this does not turn into a stable pattern. In most cases you manage to start and complete tasks on time.',
        },
        'medium': {
          'ru':
              'Средний уровень прокрастинации из-за идеала. Вы нередко откладываете начало или завершение задач, потому что хотите сделать всё максимально хорошо или боитесь, что результат окажется недостаточно качественным. Это может приводить к давлению сроков и внутреннему напряжению. При этом у вас, вероятно, есть и моменты продуктивности.',
          'en':
              'Medium level of procrastination due to ideal. You often postpone the start or completion of tasks because you want to do everything as well as possible or are afraid that the result will not be good enough. This can lead to deadline pressure and internal tension. At the same time, you probably have moments of productivity.',
        },
        'high': {
          'ru':
              'Высокий уровень прокрастинации из-за идеала. Вы часто откладываете задачи, особенно важные, ожидая идеального момента, настроения или состояния. Стремление к безупречности может приводить к затягиванию сроков, ночным авралам и постоянному чувству вины. Такой профиль повышает риск хронического стресса и снижает удовлетворённость собой.',
          'en':
              'High level of procrastination due to ideal. You often postpone tasks, especially important ones, waiting for the perfect moment, mood or state. The pursuit of perfection can lead to dragging deadlines, night rushes and a constant feeling of guilt. This profile increases the risk of chronic stress and reduces self-satisfaction.',
        },
        'very_high': {
          'ru':
              'Очень высокий уровень прокрастинации из-за идеала. Стремление к идеальному результату может настолько усиливать страх ошибки и несоответствия, что вы часто вообще не начинаете задачи или откладываете их до предельных сроков. Это может сопровождаться самокритикой, стыдом и ощущением, что «со мной что-то не так». В результате вы можете недополучать возможности и чувствовать себя менее компетентным(ой), чем есть на самом деле.',
          'en':
              'Very high level of procrastination due to ideal. The pursuit of an ideal result can so increase the fear of error and non-compliance that you often do not start tasks at all or postpone them until the deadline. This may be accompanied by self-criticism, shame and a feeling that "something is wrong with me". As a result, you may miss opportunities and feel less competent than you really are.',
        },
      },
    };

    return interpretations[factorId]?[level] ??
        {
          'ru': 'Интерпретация недоступна',
          'en': 'Interpretation not available',
        };
  }
}
