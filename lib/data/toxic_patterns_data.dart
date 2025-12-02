import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data for the Toxic Patterns Test.
///
/// Measures 6 toxic relationship patterns through 48 behavioral questions.
/// - Test ID: toxic_patterns
/// - Questions: 48 (8 per pattern)
/// - Scoring: 0-4 (frequency scale: Never to Constantly)
/// - No reversed questions (all measure toxic patterns)
/// - 6 factors (patterns): passive_aggression, silent_treatment, dramatization,
///   devaluation, victim_mentality, manipulation
/// - 5 profiles based on overall toxicity level (Variant A)
class ToxicPatternsData {
  /// Get the complete test model
  static TestModel getToxicPatternsTest() {
    return TestModel(
      id: 'toxic_patterns',
      title: {
        'ru': 'Тест токсичных паттернов',
        'en': 'Toxic Patterns Test',
      },
      description: {
        'ru':
            'Выявите скрытые токсичные паттерны в ваших отношениях и научитесь строить здоровое общение',
        'en':
            'Identify hidden toxic patterns in your relationships and learn to build healthy communication',
      },
      category: {
        'ru': 'Эмоциональное здоровье',
        'en': 'Emotional Health',
      },
      categoryId: 'emotional',
      questions: _buildQuestions(),
      estimatedTime: 8,
      type: TestType.multiFactor,
      factorIds: [
        'passive_aggression',
        'silent_treatment',
        'dramatization',
        'devaluation',
        'victim_mentality',
        'manipulation',
      ],
    );
  }

  /// Build all 48 questions
  static List<QuestionModel> _buildQuestions() {
    return [
      // Passive Aggression (Q1-8)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я говорю \'всё нормально\', когда на самом деле злюсь',
          'en': 'I say \'everything\'s fine\' when I\'m actually angry',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'passive_aggression',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Я использую сарказм, чтобы выразить недовольство',
          'en': 'I use sarcasm to express dissatisfaction',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'passive_aggression',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru':
              'Я \'случайно забываю\' сделать то, о чём меня просили, если я недоволен',
          'en': 'I \'accidentally forget\' to do what I was asked if I\'m displeased',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'passive_aggression',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru':
              'Я делаю двусмысленные комментарии, которые можно трактовать по-разному',
          'en': 'I make ambiguous comments that can be interpreted differently',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'passive_aggression',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Я соглашаюсь на что-то, но потом специально делаю это плохо или медленно',
          'en': 'I agree to something but then intentionally do it poorly or slowly',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'passive_aggression',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Я даю понять человеку, что недоволен, но отказываюсь объяснять почему',
          'en': 'I let the person know I\'m displeased but refuse to explain why',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'passive_aggression',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я вздыхаю, закатываю глаза или показываю невербальное недовольство',
          'en': 'I sigh, roll my eyes, or show nonverbal displeasure',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'passive_aggression',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я делаю язвительные замечания под видом шуток',
          'en': 'I make caustic remarks disguised as jokes',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'passive_aggression',
        isReversed: false,
      ),

      // Silent Treatment (Q9-16)
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я игнорирую человека, когда злюсь на него',
          'en': 'I ignore the person when I\'m angry at them',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'silent_treatment',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я отказываюсь разговаривать с партнёром после конфликта',
          'en': 'I refuse to talk to my partner after a conflict',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'silent_treatment',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я намеренно не отвечаю на сообщения, чтобы наказать человека',
          'en': 'I intentionally don\'t reply to messages to punish the person',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'silent_treatment',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Я устраиваю \'холодную войну\', пока человек не извинится первым',
          'en': 'I wage \'cold war\' until the person apologizes first',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'silent_treatment',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я веду себя так, будто человека не существует',
          'en': 'I act as if the person doesn\'t exist',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'silent_treatment',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я отказываюсь обсуждать проблему, даже когда партнёр просит об этом',
          'en': 'I refuse to discuss the problem even when partner asks',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'silent_treatment',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я использую молчание как способ контроля',
          'en': 'I use silence as a way of control',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'silent_treatment',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я заставляю человека выпрашивать моё внимание',
          'en': 'I make the person beg for my attention',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'silent_treatment',
        isReversed: false,
      ),

      // Dramatization (Q17-24)
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я устраиваю сцены из-за мелочей',
          'en': 'I make scenes over trifles',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'dramatization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Я преувеличиваю проблемы до катастрофических масштабов',
          'en': 'I exaggerate problems to catastrophic proportions',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'dramatization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru':
              'Я использую фразы типа \'это конец\', \'ты всё разрушил\' по любому поводу',
          'en':
              'I use phrases like \'this is the end\', \'you ruined everything\' for any reason',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'dramatization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я устраиваю эмоциональные взрывы в публичных местах',
          'en': 'I have emotional explosions in public places',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'dramatization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я создаю драму, чтобы получить внимание',
          'en': 'I create drama to get attention',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'dramatization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я говорю, что уйду/уеду/расстанусь из-за незначительных конфликтов',
          'en': 'I say I\'ll leave/go away/break up over minor conflicts',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'dramatization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я реагирую на мелкие проблемы так, будто это трагедия',
          'en': 'I react to small problems as if it\'s a tragedy',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'dramatization',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я использую угрозы (разрыва, самоповреждения) для привлечения внимания',
          'en': 'I use threats (breakup, self-harm) to attract attention',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'dramatization',
        isReversed: false,
      ),

      // Devaluation (Q25-32)
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я критикую достижения партнёра или принижаю их значимость',
          'en': 'I criticize partner\'s achievements or belittle their significance',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru':
              'Я высмеиваю чувства других, называя их \'преувеличением\' или \'глупостью\'',
          'en': 'I mock others\' feelings, calling them \'exaggeration\' or \'stupidity\'',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru':
              'Я говорю вещи типа \'ты слишком чувствительный\' или \'не преувеличивай\'',
          'en': 'I say things like \'you\'re too sensitive\' or \'don\'t exaggerate\'',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Я сравниваю партнёра с другими не в его пользу',
          'en': 'I compare partner unfavorably with others',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я игнорирую потребности партнёра, считая их неважными',
          'en': 'I ignore partner\'s needs, considering them unimportant',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я указываю на недостатки других при каждом удобном случае',
          'en': 'I point out others\' flaws at every opportunity',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru':
              'Я обесцениваю усилия партнёра фразами типа \'это мелочь, что особенного\'',
          'en': 'I devalue partner\'s efforts with phrases like \'it\'s nothing, what\'s special\'',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'devaluation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Я делаю замечания о внешности или способностях партнёра в негативном ключе',
          'en': 'I make negative comments about partner\'s appearance or abilities',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'devaluation',
        isReversed: false,
      ),

      // Victim Mentality (Q33-40)
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Я считаю, что со мной всегда обращаются несправедливо',
          'en': 'I believe I\'m always treated unfairly',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'victim_mentality',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Я обвиняю других в своих проблемах и неудачах',
          'en': 'I blame others for my problems and failures',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'victim_mentality',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru':
              'Я говорю \'я всегда жертва\' или \'почему это всегда происходит со мной\'',
          'en': 'I say \'I\'m always the victim\' or \'why does this always happen to me\'',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'victim_mentality',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Я отказываюсь брать ответственность за свои действия',
          'en': 'I refuse to take responsibility for my actions',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'victim_mentality',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я использую свои прошлые травмы как оправдание токсичного поведения',
          'en': 'I use past traumas as excuse for toxic behavior',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'victim_mentality',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Я жду, что другие должны компенсировать мои прошлые страдания',
          'en': 'I expect others to compensate for my past suffering',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'victim_mentality',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Я чувствую, что мир против меня',
          'en': 'I feel the world is against me',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'victim_mentality',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru':
              'Я использую фразу \'после всего, что я для тебя сделал\' для вызова чувства вины',
          'en': 'I use phrase \'after all I\'ve done for you\' to induce guilt',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'victim_mentality',
        isReversed: false,
      ),

      // Manipulation & Gaslighting (Q41-48)
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Я отрицаю, что говорил или делал что-то, хотя это было',
          'en': 'I deny saying or doing something even though I did',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'manipulation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Я перекручиваю слова партнёра, чтобы выставить его виноватым',
          'en': 'I twist partner\'s words to make them guilty',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'manipulation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Я говорю \'ты с ума сошёл\' или \'ты это выдумал\', когда человек прав',
          'en': 'I say \'you\'re crazy\' or \'you made it up\' when person is right',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'manipulation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Я использую чувство вины партнёра для получения желаемого',
          'en': 'I use partner\'s guilt to get what I want',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'manipulation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Я говорю \'если ты меня любишь, ты сделаешь это\'',
          'en': 'I say \'if you love me, you\'ll do this\'',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'manipulation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Я переворачиваю ситуацию так, что виноватым становится другой человек',
          'en': 'I flip the situation so the other person becomes guilty',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'manipulation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Я угрожаю разрывом или уходом, чтобы получить желаемое',
          'en': 'I threaten breakup or leaving to get what I want',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'manipulation',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Я заставляю партнёра сомневаться в его восприятии реальности',
          'en': 'I make partner doubt their perception of reality',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'manipulation',
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
      'passive_aggression': {
        'ru': '😒 Пассивная агрессия',
        'en': '😒 Passive Aggression',
      },
      'silent_treatment': {
        'ru': '🤐 Молчаливое наказание',
        'en': '🤐 Silent Treatment',
      },
      'dramatization': {
        'ru': '🎭 Драматизация',
        'en': '🎭 Dramatization',
      },
      'devaluation': {
        'ru': '🔻 Обесценивание',
        'en': '🔻 Devaluation',
      },
      'victim_mentality': {
        'ru': '😢 Позиция жертвы',
        'en': '😢 Victim Mentality',
      },
      'manipulation': {
        'ru': '🎪 Манипуляции и газлайтинг',
        'en': '🎪 Manipulation & Gaslighting',
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

    final level = percentage <= 30
        ? 'minimal'
        : percentage <= 65
            ? 'moderate'
            : 'high';

    final interpretations = {
      'passive_aggression': {
        'minimal': {
          'ru': 'Минимальная пассивная агрессия. Вы обычно выражаете недовольство прямо.',
          'en': 'Minimal passive aggression. You usually express dissatisfaction directly.',
        },
        'moderate': {
          'ru':
              'Умеренная пассивная агрессия. Иногда вы выражаете злость непрямо, важно работать над прямой коммуникацией.',
          'en':
              'Moderate passive aggression. Sometimes you express anger indirectly, work on direct communication.',
        },
        'high': {
          'ru':
              'Высокая пассивная агрессия. Это ваш основной способ выражения недовольства, что разрушает доверие.',
          'en':
              'High passive aggression. This is your main way of expressing dissatisfaction, destroying trust.',
        },
      },
      'silent_treatment': {
        'minimal': {
          'ru': 'Минимальное молчаливое наказание. Вы не используете молчание как оружие.',
          'en': 'Minimal silent treatment. You don\'t use silence as weapon.',
        },
        'moderate': {
          'ru':
              'Умеренное молчаливое наказание. Иногда вы замолкаете после конфликтов, важно вернуться к разговору.',
          'en':
              'Moderate silent treatment. Sometimes you go silent after conflicts, return to conversation.',
        },
        'high': {
          'ru':
              'Высокое молчаливое наказание. Это одна из самых токсичных форм эмоционального насилия.',
          'en':
              'High silent treatment. This is one of the most toxic forms of emotional abuse.',
        },
      },
      'dramatization': {
        'minimal': {
          'ru': 'Минимальная драматизация. Вы реагируете на проблемы пропорционально.',
          'en': 'Minimal dramatization. You react to problems proportionally.',
        },
        'moderate': {
          'ru':
              'Умеренная драматизация. Иногда вы преувеличиваете проблемы, это может быть способом получить внимание.',
          'en':
              'Moderate dramatization. Sometimes you exaggerate problems, may be way to get attention.',
        },
        'high': {
          'ru':
              'Высокая драматизация. Вы создаёте драму из всего, эмоционально истощая окружающих.',
          'en':
              'High dramatization. You create drama from everything, emotionally exhausting others.',
        },
      },
      'devaluation': {
        'minimal': {
          'ru': 'Минимальное обесценивание. Вы уважаете чувства и достижения партнёра.',
          'en': 'Minimal devaluation. You respect partner\'s feelings and achievements.',
        },
        'moderate': {
          'ru':
              'Умеренное обесценивание. Иногда вы критикуете или принижаете партнёра, важно работать над этим.',
          'en':
              'Moderate devaluation. Sometimes you criticize or belittle partner, work on this.',
        },
        'high': {
          'ru':
              'Высокое обесценивание. Вы систематически критикуете и обесцениваете партнёра, разрушая его самооценку.',
          'en':
              'High devaluation. You systematically criticize and devalue partner, destroying their self-esteem.',
        },
      },
      'victim_mentality': {
        'minimal': {
          'ru': 'Минимальная позиция жертвы. Вы берёте ответственность за свои действия.',
          'en': 'Minimal victim mentality. You take responsibility for your actions.',
        },
        'moderate': {
          'ru':
              'Умеренная позиция жертвы. Иногда вы обвиняете других, важно работать над ответственностью.',
          'en':
              'Moderate victim mentality. Sometimes you blame others, work on responsibility.',
        },
        'high': {
          'ru':
              'Высокая позиция жертвы. Вы постоянно воспринимаете себя как жертву, отказываясь от ответственности.',
          'en':
              'High victim mentality. You constantly perceive yourself as victim, refusing responsibility.',
        },
      },
      'manipulation': {
        'minimal': {
          'ru': 'Минимальные манипуляции. Вы не склонны к манипуляциям и газлайтингу.',
          'en': 'Minimal manipulation. You\'re not inclined toward manipulation and gaslighting.',
        },
        'moderate': {
          'ru':
              'Умеренные манипуляции. Иногда вы манипулируете, важно научиться прямым просьбам.',
          'en':
              'Moderate manipulation. Sometimes you manipulate, learn direct requests.',
        },
        'high': {
          'ru':
              'Высокие манипуляции. Вы систематически манипулируете и искажаете реальность (газлайтинг).',
          'en':
              'High manipulation. You systematically manipulate and distort reality (gaslighting).',
        },
      },
    };

    return interpretations[factorId]?[level] ??
        {
          'ru': 'Интерпретация недоступна',
          'en': 'Interpretation unavailable',
        };
  }

  /// All profiles (5 profiles based on overall toxicity level)
  static final Map<String, TestProfile> _profiles = {
    'healthy_relationships': TestProfile(
      id: 'healthy_relationships',
      name: {
        'ru': '💚 Здоровые отношения',
        'en': '💚 Healthy Relationships',
      },
      description: {
        'ru':
            'Ваши паттерны общения в основном здоровые. Вы умеете выражать недовольство прямо, не манипулируете и берёте ответственность за свои действия. Это признак эмоциональной зрелости и уважения к партнёру.',
        'en':
            'Your communication patterns are mostly healthy. You can express dissatisfaction directly, don\'t manipulate, and take responsibility for your actions. This is sign of emotional maturity and respect for partner.',
      },
      whyThisProfile: {
        'ru':
            'Ваш уровень токсичности составляет 0-25%, что говорит о здоровых коммуникативных навыках. Вы редко проявляете токсичные паттерны, и когда это случается, это скорее исключение, чем правило. Вы способны к конструктивным конфликтам и прямому общению.',
        'en':
            'Your toxicity level is 0-25%, indicating healthy communication skills. You rarely display toxic patterns, and when it happens, it\'s exception rather than rule. You\'re capable of constructive conflicts and direct communication.',
      },
      strengths: {
        'ru': [
          '✅ Прямая коммуникация: Вы говорите о проблемах открыто',
          '✅ Ответственность: Вы не перекладываете вину на других',
          '✅ Эмоциональная честность: Вы не скрываете злость за сарказмом',
          '✅ Уважение границ: Вы не используете молчание как оружие',
          '✅ Эмпатия: Вы не обесцениваете чувства партнёра',
        ],
        'en': [
          '✅ Direct communication: You talk about problems openly',
          '✅ Responsibility: You don\'t shift blame to others',
          '✅ Emotional honesty: You don\'t hide anger behind sarcasm',
          '✅ Boundary respect: You don\'t use silence as weapon',
          '✅ Empathy: You don\'t devalue partner\'s feelings',
        ],
      },
      vulnerabilities: {
        'ru': [
          '⚠️ Иногда можете срываться: Никто не идеален, стресс может спровоцировать токсичное поведение',
          '⚠️ Риск самодовольства: Важно не расслабляться и продолжать работать над собой',
          '⚠️ Влияние окружения: Токсичные партнёры могут провоцировать токсичные реакции',
        ],
        'en': [
          '⚠️ Sometimes can snap: Nobody is perfect, stress can trigger toxic behavior',
          '⚠️ Complacency risk: Important to keep working on yourself',
          '⚠️ Environmental influence: Toxic partners can provoke toxic reactions',
        ],
      },
      recommendations: {
        'ru': [
          '🌱 Продолжайте в том же духе: Ваши навыки — результат работы над собой',
          '📚 Читайте о здоровых отношениях: "Язык любви" (Гэри Чепмен), "Эмоциональный интеллект" (Гоулман)',
          '🛡️ Защищайте свои границы: Не позволяйте токсичным людям манипулировать вами',
          '🗣️ Учитесь у партнёра: Если партнёр токсичен, не копируйте его поведение',
          '💬 Обсуждайте конфликты: Используйте Я-сообщения и активное слушание',
        ],
        'en': [
          '🌱 Keep it up: Your skills are result of self-work',
          '📚 Read about healthy relationships: "5 Love Languages" (Chapman), "Emotional Intelligence" (Goleman)',
          '🛡️ Protect your boundaries: Don\'t let toxic people manipulate you',
          '🗣️ Learn from partner: If partner is toxic, don\'t copy their behavior',
          '💬 Discuss conflicts: Use I-statements and active listening',
        ],
      },
      tryToday: {
        'ru':
            '💡 **Попробуйте сегодня:** Когда возникнет конфликт, используйте формулу: "Меня расстраивает [конкретное действие], потому что [ваше чувство]. Мне нужно [конкретная просьба]". Это модель здоровой коммуникации.',
        'en':
            '💡 **Try today:** When conflict arises, use formula: "I\'m upset by [specific action] because [your feeling]. I need [specific request]". This is healthy communication model.',
      },
      inspiringConclusion: {
        'ru':
            '🌟 **Вы — пример здоровых отношений.** Ваша способность общаться прямо и брать ответственность — это редкий навык. Берегите его, развивайте и помните: вы заслуживаете партнёра, который будет так же здоров эмоционально, как и вы. Не соглашайтесь на меньшее! 💚',
        'en':
            '🌟 **You\'re example of healthy relationships.** Your ability to communicate directly and take responsibility is rare skill. Cherish it, develop it, and remember: you deserve partner who is emotionally healthy as you are. Don\'t settle for less! 💚',
      },
    ),
    'mild_toxicity': TestProfile(
      id: 'mild_toxicity',
      name: {
        'ru': '💛 Лёгкая токсичность',
        'en': '💛 Mild Toxicity',
      },
      description: {
        'ru':
            'Иногда вы проявляете токсичные паттерны, но это не доминирующий стиль общения. У вас есть осознанность для изменений, и вы находитесь на пути к более здоровым отношениям.',
        'en':
            'Sometimes you display toxic patterns, but it\'s not dominant communication style. You have awareness for change and are on path to healthier relationships.',
      },
      whyThisProfile: {
        'ru':
            'Ваш уровень токсичности 26-45%. Это означает, что у вас есть здоровая база, но под стрессом или в конфликтах вы иногда прибегаете к токсичным способам общения. Хорошая новость: вы осознаёте это, а осознание — первый шаг к изменениям.',
        'en':
            'Your toxicity level is 26-45%. This means you have healthy base, but under stress or in conflicts you sometimes resort to toxic communication. Good news: you\'re aware of this, and awareness is first step to change.',
      },
      strengths: {
        'ru': [
          '✅ Базовые здоровые навыки: В спокойном состоянии вы общаетесь конструктивно',
          '✅ Осознанность: Вы замечаете свои токсичные паттерны',
          '✅ Готовность меняться: Прохождение этого теста — доказательство',
          '✅ Эмпатия: Вы понимаете, когда причиняете боль',
        ],
        'en': [
          '✅ Basic healthy skills: When calm you communicate constructively',
          '✅ Awareness: You notice your toxic patterns',
          '✅ Willingness to change: Taking this test is proof',
          '✅ Empathy: You understand when you cause pain',
        ],
      },
      vulnerabilities: {
        'ru': [
          '⚠️ Стресс-триггеры: Под давлением возвращаетесь к токсичным паттернам',
          '⚠️ Выученное поведение: Возможно, копируете токсичность из детства или прошлых отношений',
          '⚠️ Недостаток альтернатив: Не всегда знаете, как по-другому выразить недовольство',
          '⚠️ Риск эскалации: Без работы над собой токсичность может усилиться',
        ],
        'en': [
          '⚠️ Stress triggers: Under pressure return to toxic patterns',
          '⚠️ Learned behavior: May be copying toxicity from childhood or past relationships',
          '⚠️ Lack of alternatives: Don\'t always know other ways to express dissatisfaction',
          '⚠️ Escalation risk: Without self-work toxicity may increase',
        ],
      },
      recommendations: {
        'ru': [
          '🔍 Анализируйте триггеры: Ведите дневник — когда проявляется токсичность?',
          '📖 Читайте: "Эмоциональный интеллект" (Гоулман), "Ненасильственное общение" (Розенберг)',
          '🗣️ Учитесь Я-сообщениям: "Я чувствую X, когда ты делаешь Y"',
          '⏸️ Делайте паузы: При конфликте возьмите тайм-аут, вместо токсичной реакции',
          '💬 Обсуждайте с партнёром: "Когда я так делаю, останови меня и попроси объяснить прямо"',
          '👥 Рассмотрите терапию: Несколько сессий помогут быстрее измениться',
        ],
        'en': [
          '🔍 Analyze triggers: Keep journal — when does toxicity appear?',
          '📖 Read: "Emotional Intelligence" (Goleman), "Nonviolent Communication" (Rosenberg)',
          '🗣️ Learn I-statements: "I feel X when you do Y"',
          '⏸️ Take pauses: During conflict take timeout instead of toxic reaction',
          '💬 Discuss with partner: "When I do this, stop me and ask me to explain directly"',
          '👥 Consider therapy: Few sessions will help change faster',
        ],
      },
      tryToday: {
        'ru':
            '💡 **Попробуйте сегодня:** В момент конфликта, когда чувствуете желание ответить токсично (сарказм, молчание, драма), сделайте 3 глубоких вдоха и скажите: "Мне нужна минута, чтобы ответить конструктивно". Это прерывает автоматическую токсичную реакцию.',
        'en':
            '💡 **Try today:** In moment of conflict, when feeling urge to respond toxically (sarcasm, silence, drama), take 3 deep breaths and say: "I need minute to respond constructively". This interrupts automatic toxic reaction.',
      },
      inspiringConclusion: {
        'ru':
            '🌟 **У вас есть все шансы изменить паттерны.** Вы не глубоко в токсичности, и у вас есть осознанность. Это значит, что с небольшими усилиями вы можете стать ещё более здоровым в общении. Работайте над конкретными паттернами, которые показали высокие баллы, и вы увидите изменения через 2-3 месяца практики. Вы способны на это! 💛',
        'en':
            '🌟 **You have every chance to change patterns.** You\'re not deep in toxicity, and you have awareness. This means with small efforts you can become even healthier in communication. Work on specific patterns that showed high scores, and you\'ll see changes in 2-3 months of practice. You\'re capable of this! 💛',
      },
    ),
    'moderate_toxicity': TestProfile(
      id: 'moderate_toxicity',
      name: {
        'ru': '🧡 Умеренная токсичность',
        'en': '🧡 Moderate Toxicity',
      },
      description: {
        'ru':
            'Токсичные паттерны — частая часть вашего общения. Это вредит отношениям и создаёт эмоциональную дистанцию с партнёром. Хорошо, что вы это осознаёте — это первый шаг. Теперь время активно меняться.',
        'en':
            'Toxic patterns are frequent part of your communication. This harms relationships and creates emotional distance with partner. Good you\'re aware — this is first step. Now time to actively change.',
      },
      whyThisProfile: {
        'ru':
            'Ваш уровень токсичности 46-65%. Это означает, что токсичные способы общения стали вашей привычкой, особенно в конфликтах. Вы не всегда осознаёте, как ваши слова и действия ранят других. Но тот факт, что вы прошли этот тест, показывает: часть вас хочет измениться.',
        'en':
            'Your toxicity level is 46-65%. This means toxic communication has become your habit, especially in conflicts. You don\'t always realize how your words and actions hurt others. But fact you took this test shows: part of you wants to change.',
      },
      strengths: {
        'ru': [
          '✅ Вы ищете ответы: Прохождение теста — акт смелости',
          '✅ У вас есть потенциал: Токсичность — не ваша суть, а выученное поведение',
          '✅ Вы способны на эмпатию: Иначе бы не искали способ измениться',
        ],
        'en': [
          '✅ You\'re seeking answers: Taking test is act of courage',
          '✅ You have potential: Toxicity is not your essence, but learned behavior',
          '✅ You\'re capable of empathy: Otherwise wouldn\'t seek way to change',
        ],
      },
      vulnerabilities: {
        'ru': [
          '⚠️ Автоматические токсичные реакции: Вы не замечаете, как переходите на манипуляции/драму/обесценивание',
          '⚠️ Глубокие корни: Паттерны идут из детства или прошлых травм',
          '⚠️ Партнёры страдают: Ваше поведение причиняет боль близким',
          '⚠️ Риск потери отношений: Если не измениться, партнёры будут уходить',
          '⚠️ Отрицание: Возможно, вы склонны оправдывать своё поведение',
        ],
        'en': [
          '⚠️ Automatic toxic reactions: You don\'t notice how you switch to manipulation/drama/devaluation',
          '⚠️ Deep roots: Patterns come from childhood or past traumas',
          '⚠️ Partners suffer: Your behavior causes pain to loved ones',
          '⚠️ Relationship loss risk: If don\'t change, partners will leave',
          '⚠️ Denial: You may tend to justify your behavior',
        ],
      },
      recommendations: {
        'ru': [
          '🚨 ПРИОРИТЕТ: Начните работу с психологом. Самостоятельно изменить глубокие паттерны очень сложно',
          '📊 Посмотрите на конкретные шкалы: Начните с тех, где балл выше 60%',
          '📚 Обязательно читайте:',
          '   • "Эмоциональное насилие" (Беверли Энжел)',
          '   • "Газлайтинг" (Робин Стерн)',
          '   • "Токсичные люди" (Лилиан Гласс)',
          '🛑 Практикуйте стоп-технику: Перед ответом в конфликте — пауза 10 секунд',
          '🗣️ Замените токсичные фразы:',
          '   • "Всё нормально" (пассивная агрессия) → "Я зол, потому что..."',
          '   • Молчание → "Мне нужно время, поговорим через час"',
          '   • "Ты всё разрушил!" (драма) → "Меня это расстраивает"',
          '💬 Честно поговорите с партнёром: "Я осознаю свою токсичность и работаю над этим. Помоги мне — останавливай, когда я так делаю"',
          '⏱️ Дайте себе время: Изменение глубоких паттернов требует 6-12 месяцев',
        ],
        'en': [
          '🚨 PRIORITY: Start working with therapist. Changing deep patterns alone is very difficult',
          '📊 Look at specific scales: Start with those scoring above 60%',
          '📚 Must read:',
          '   • "The Emotionally Abusive Relationship" (Beverly Engel)',
          '   • "The Gaslight Effect" (Robin Stern)',
          '   • "Toxic People" (Lillian Glass)',
          '🛑 Practice stop technique: Before responding in conflict — pause 10 seconds',
          '🗣️ Replace toxic phrases:',
          '   • "Everything\'s fine" (passive aggression) → "I\'m angry because..."',
          '   • Silence → "I need time, let\'s talk in hour"',
          '   • "You ruined everything!" (drama) → "This upsets me"',
          '💬 Talk honestly with partner: "I realize my toxicity and working on it. Help me — stop me when I do this"',
          '⏱️ Give yourself time: Changing deep patterns requires 6-12 months',
        ],
      },
      tryToday: {
        'ru':
            '💡 **Попробуйте сегодня:** Возьмите тетрадь и напишите: "Мои 3 главных токсичных паттерна: [из теста]". Под каждым напишите альтернативу: "Вместо этого я буду делать...". Держите тетрадь рядом, перечитывайте ежедневно.',
        'en':
            '💡 **Try today:** Take notebook and write: "My 3 main toxic patterns: [from test]". Under each write alternative: "Instead I will...". Keep notebook nearby, reread daily.',
      },
      inspiringConclusion: {
        'ru':
            '🌟 **Изменение возможно, но требует серьёзной работы.** Вы на развилке: продолжить токсичный путь и терять отношения, или взять ответственность и измениться. Это не быстро и не легко, но оно того стоит. Здоровые отношения — это когда партнёры не ранят друг друга намеренно. Вы можете это создать, но только через работу над собой. Начните сегодня. 🧡',
        'en':
            '🌟 **Change is possible but requires serious work.** You\'re at crossroads: continue toxic path and lose relationships, or take responsibility and change. It\'s not fast or easy, but worth it. Healthy relationships are when partners don\'t hurt each other intentionally. You can create this, but only through self-work. Start today. 🧡',
      },
    ),
    'high_toxicity': TestProfile(
      id: 'high_toxicity',
      name: {
        'ru': '🔴 Высокая токсичность',
        'en': '🔴 High Toxicity',
      },
      description: {
        'ru':
            'Токсичность — ваш основной стиль общения. Это серьёзно вредит отношениям и может быть формой эмоционального насилия. Необходима профессиональная помощь. Вы причиняете боль людям, которых, возможно, любите.',
        'en':
            'Toxicity is your main communication style. This seriously harms relationships and may be form of emotional abuse. Professional help necessary. You cause pain to people you possibly love.',
      },
      whyThisProfile: {
        'ru':
            'Ваш уровень токсичности 66-80%. Это высокий показатель. Манипуляции, обесценивание, драма, молчаливое наказание — это ваши основные инструменты в отношениях. Возможно, вы не всегда осознаёте масштаб вреда, который причиняете. Но ваши партнёры чувствуют это каждый день.',
        'en':
            'Your toxicity level is 66-80%. This is high indicator. Manipulation, devaluation, drama, silent treatment — these are your main relationship tools. You may not always realize extent of harm you cause. But your partners feel it every day.',
      },
      strengths: {
        'ru': [
          '✅ Вы прошли тест: Это значит, что часть вас понимает — что-то не так',
          '✅ Вы читаете это: Полное отрицание было бы "это всё ерунда, со мной всё в порядке"',
          '✅ У вас есть потенциал: Даже самые токсичные паттерны можно изменить',
        ],
        'en': [
          '✅ You took test: This means part of you understands — something is wrong',
          '✅ You\'re reading this: Complete denial would be "this is all nonsense, I\'m fine"',
          '✅ You have potential: Even most toxic patterns can be changed',
        ],
      },
      vulnerabilities: {
        'ru': [
          '🚨 Эмоциональное насилие: Ваше поведение причиняет психологический вред партнёрам',
          '🚨 Потеря отношений: Люди уходят или остаются из страха, а не из любви',
          '🚨 Газлайтинг: Вы искажаете реальность, заставляя партнёра сомневаться в себе',
          '🚨 Цикл повторения: Без изменений каждые новые отношения будут такими же',
          '🚨 Ваши собственные травмы: Токсичность часто идёт из детских ран',
        ],
        'en': [
          '🚨 Emotional abuse: Your behavior causes psychological harm to partners',
          '🚨 Relationship loss: People leave or stay from fear, not love',
          '🚨 Gaslighting: You distort reality, making partner doubt themselves',
          '🚨 Repetition cycle: Without changes every new relationship will be same',
          '🚨 Your own traumas: Toxicity often comes from childhood wounds',
        ],
      },
      recommendations: {
        'ru': [
          '🚨 КРИТИЧНО: Обратитесь к психологу НЕМЕДЛЕННО. Выбирайте специалиста по эмоциональному насилию',
          '🛑 Признайте: Ваше поведение — это насилие. Даже если вы не бьёте — вы ломаете психику',
          '⏸️ Возьмите тайм-аут от отношений: Вам нужно поработать над собой, прежде чем быть в паре',
          '📚 ОБЯЗАТЕЛЬНО читайте (в указанном порядке):',
          '   1. "Эмоциональное насилие" (Беверли Энжел) — чтобы понять, что вы делаете',
          '   2. "Газлайтинг" (Робин Стерн) — если манипуляции/газлайтинг высокие',
          '   3. "Почему я это делаю?" (Джо Бурго) — чтобы найти корни',
          '💬 Честно поговорите с партнёром (если он не ушёл):',
          '   "Я осознал, что моё поведение токсично и причиняет тебе боль. Я начинаю терапию. Тебе не обязательно оставаться со мной, пока я меняюсь"',
          '🔄 Работайте над конкретными паттернами:',
          '   • Если высокий газлайтинг — учитесь признавать факты',
          '   • Если высокое молчание — учитесь возвращаться к диалогу',
          '   • Если высокая драма — учитесь эмоциональной регуляции',
          '⚠️ Если партнёр уходит — это последствия. Не манипулируйте, не угрожайте, отпустите',
          '⏱️ Дайте себе 1-2 года: Глубокие изменения требуют времени',
        ],
        'en': [
          '🚨 CRITICAL: See psychologist IMMEDIATELY. Choose specialist in emotional abuse',
          '🛑 Acknowledge: Your behavior is abuse. Even if you don\'t hit — you break psyche',
          '⏸️ Take timeout from relationships: You need to work on yourself before being in couple',
          '📚 MUST read (in this order):',
          '   1. "The Emotionally Abusive Relationship" (Beverly Engel) — to understand what you do',
          '   2. "The Gaslight Effect" (Robin Stern) — if manipulation/gaslighting high',
          '   3. "Why Do I Do That?" (Joseph Burgo) — to find roots',
          '💬 Talk honestly with partner (if they haven\'t left):',
          '   "I realized my behavior is toxic and causes you pain. I\'m starting therapy. You don\'t have to stay with me while I change"',
          '🔄 Work on specific patterns:',
          '   • If high gaslighting — learn to acknowledge facts',
          '   • If high silence — learn to return to dialogue',
          '   • If high drama — learn emotional regulation',
          '⚠️ If partner leaves — these are consequences. Don\'t manipulate, don\'t threaten, let go',
          '⏱️ Give yourself 1-2 years: Deep changes require time',
        ],
      },
      tryToday: {
        'ru':
            '💡 **Попробуйте сегодня:** Не взаимодействуйте токсично хотя бы 24 часа. Когда чувствуете импульс (манипуляция, молчание, драма) — выйдите из комнаты, напишите на бумаге, что хотели сказать/сделать. Через час посмотрите — вы увидите токсичность.',
        'en':
            '💡 **Try today:** Don\'t interact toxically for at least 24 hours. When feeling impulse (manipulation, silence, drama) — leave room, write on paper what you wanted to say/do. Look in hour — you\'ll see toxicity.',
      },
      inspiringConclusion: {
        'ru':
            '🌟 **Это не приговор, но это серьёзно.** Вы стоите на грани: либо измениться, либо продолжать разрушать отношения и людей. Токсичность не делает вас "плохим человеком", но ваши ДЕЙСТВИЯ причиняют вред. Изменение требует мужества признать: "Я был токсичен", и годовой работы с психологом. Но это возможно. Люди меняются. Вопрос: готовы ли вы? Если да — начните сегодня. Если нет — будьте честны с партнёром и отпустите его. 🔴',
        'en':
            '🌟 **This is not verdict, but it\'s serious.** You\'re on edge: either change or continue destroying relationships and people. Toxicity doesn\'t make you "bad person", but your ACTIONS cause harm. Change requires courage to admit: "I was toxic", and year of work with therapist. But it\'s possible. People change. Question: are you ready? If yes — start today. If no — be honest with partner and let them go. 🔴',
      },
    ),
    'severe_toxicity': TestProfile(
      id: 'severe_toxicity',
      name: {
        'ru': '🚨 Крайне токсичные отношения',
        'en': '🚨 Severely Toxic Relationships',
      },
      description: {
        'ru':
            'Ваш стиль общения крайне токсичен и представляет собой эмоциональное насилие. Это разрушает психику партнёров и создаёт глубокие психологические травмы. Требуется интенсивная терапия.',
        'en':
            'Your communication style is extremely toxic and constitutes emotional abuse. This destroys partners\' psyche and creates deep psychological traumas. Intensive therapy required.',
      },
      whyThisProfile: {
        'ru':
            'Ваш уровень токсичности 81-100%. Это критический показатель. Манипуляции, газлайтинг, обесценивание, драматизация, молчаливое наказание, позиция жертвы — всё это ваши ежедневные инструменты. Вы систематически причиняете психологический вред людям рядом с вами.',
        'en':
            'Your toxicity level is 81-100%. This is critical indicator. Manipulation, gaslighting, devaluation, dramatization, silent treatment, victim mentality — all these are your daily tools. You systematically cause psychological harm to people around you.',
      },
      strengths: {
        'ru': [
          '⚠️ Вы прошли тест: Возможно, последний шанс что-то изменить',
          '⚠️ Вы дочитали до этого: Значит, минимальная часть осознанности есть',
        ],
        'en': [
          '⚠️ You took test: Possibly last chance to change something',
          '⚠️ You read this far: Means minimal part of awareness exists',
        ],
      },
      vulnerabilities: {
        'ru': [
          '🚨 НАСИЛИЕ: Ваше поведение — это эмоциональное насилие в чистом виде',
          '🚨 Вы разрушаете психику: Партнёры получают ПТСР, депрессию, тревожность',
          '🚨 Изоляция: Скорее всего, вы потеряли или теряете близких людей',
          '🚨 Газлайтинг на максимуме: Вы заставляете людей сомневаться в реальности',
          '🚨 Риск полного одиночества: Люди уходят или остаются сломленными',
          '🚨 Ваши собственные глубокие травмы: Такая токсичность идёт из серьёзных детских ран',
        ],
        'en': [
          '🚨 ABUSE: Your behavior is pure emotional abuse',
          '🚨 You destroy psyche: Partners get PTSD, depression, anxiety',
          '🚨 Isolation: Likely you lost or losing close people',
          '🚨 Gaslighting at maximum: You make people doubt reality',
          '🚨 Total loneliness risk: People leave or stay broken',
          '🚨 Your own deep traumas: Such toxicity comes from serious childhood wounds',
        ],
      },
      recommendations: {
        'ru': [
          '🚨🚨🚨 ЭКСТРЕННО: Обратитесь к психологу, специализирующемуся на абьюзивном поведении, СЕГОДНЯ',
          '🛑 ПРИЗНАЙТЕ: Вы — абьюзер. Это не оскорбление, это диагноз вашего поведения',
          '💔 Отпустите текущего партнёра: Если он с вами — он либо сломлен, либо боится уйти. Отпустите его ради его здоровья',
          '⏸️ НЕ ВСТУПАЙТЕ В НОВЫЕ ОТНОШЕНИЯ минимум год: Вам нужна интенсивная работа над собой',
          '📚 Читайте (обязательно, не опционально):',
          '   1. "Эмоциональное насилие" (Беверли Энжел)',
          '   2. "Газлайтинг" (Робин Стерн)',
          '   3. "Токсичные родители" (Сьюзен Форвард) — о корнях',
          '   4. "Стыд и вина" (Брене Браун) — о ваших травмах',
          '🔍 Исследуйте своё детство: Такая токсичность не появляется на пустом месте',
          '💊 Рассмотрите медикаменты: Если есть депрессия/тревожность, лечите их параллельно',
          '🚫 НЕ ОПРАВДЫВАЙТЕ СЕБЯ: "У меня было тяжёлое детство" — это объяснение, но не оправдание насилия',
          '⚠️ Будьте готовы к боли: Осознание масштаба вреда, который вы причинили, будет болезненным',
          '⏱️ Минимум 2 года терапии: Это не быстрый процесс',
        ],
        'en': [
          '🚨🚨🚨 URGENT: See psychologist specializing in abusive behavior TODAY',
          '🛑 ACKNOWLEDGE: You\'re abuser. This is not insult, this is diagnosis of your behavior',
          '💔 Let current partner go: If they\'re with you — they\'re either broken or afraid to leave. Let them go for their health',
          '⏸️ DON\'T ENTER NEW RELATIONSHIPS for at least year: You need intensive self-work',
          '📚 Read (mandatory, not optional):',
          '   1. "The Emotionally Abusive Relationship" (Beverly Engel)',
          '   2. "The Gaslight Effect" (Robin Stern)',
          '   3. "Toxic Parents" (Susan Forward) — about roots',
          '   4. "Shame and Guilt" (Brené Brown) — about your traumas',
          '🔍 Explore your childhood: Such toxicity doesn\'t appear from nowhere',
          '💊 Consider medication: If depression/anxiety present, treat parallel',
          '🚫 DON\'T JUSTIFY YOURSELF: "I had difficult childhood" — this is explanation, not excuse for abuse',
          '⚠️ Be ready for pain: Realizing extent of harm you caused will be painful',
          '⏱️ Minimum 2 years therapy: This is not quick process',
        ],
      },
      tryToday: {
        'ru':
            '💡 **Попробуйте сегодня:** НЕ взаимодействуйте с партнёром токсично. Если чувствуете импульс — уйдите физически. Напишите ему: "Я осознал, что причиняю тебе боль. Я начинаю терапию. Тебе не нужно оставаться со мной. Я не буду манипулировать твоим решением".',
        'en':
            '💡 **Try today:** DON\'T interact with partner toxically. If feeling impulse — leave physically. Write them: "I realized I\'m causing you pain. I\'m starting therapy. You don\'t need to stay with me. I won\'t manipulate your decision".',
      },
      inspiringConclusion: {
        'ru':
            '⚠️ **ЭТО СЕРЬЁЗНО.** Вы находитесь на уровне эмоционального насилия. Ваше поведение разрушает людей. Если вы не измените свои паттерны, вы будете одиноки или окружены сломленными людьми. Но — и это важно — ИЗМЕНЕНИЕ ВОЗМОЖНО. Даже на этом уровне. Но только через:\n\n1. Полное признание: "Я был абьюзером"\n2. Интенсивную терапию (1-2 года минимум)\n3. Работу с собственными травмами\n4. Тайм-аут от отношений\n5. Ежедневную практику новых навыков\n\nЭто НЕ БЫСТРО. Это БОЛЬНО. Но это ВОЗМОЖНО.\n\nВопрос один: готовы ли вы взять ответственность?\n\nЕсли да — начните СЕГОДНЯ. Не завтра. Сегодня.\nЕсли нет — будьте честны хотя бы в этом.\n\n🚨 Помните: каждый день без изменений — это ещё один день, когда вы причиняете боль.',
        'en':
            '⚠️ **THIS IS SERIOUS.** You\'re at level of emotional abuse. Your behavior destroys people. If you don\'t change your patterns, you\'ll be alone or surrounded by broken people. But — and this is important — CHANGE IS POSSIBLE. Even at this level. But only through:\n\n1. Complete acknowledgment: "I was abuser"\n2. Intensive therapy (1-2 years minimum)\n3. Work on own traumas\n4. Timeout from relationships\n5. Daily practice of new skills\n\nThis is NOT FAST. This is PAINFUL. But it\'s POSSIBLE.\n\nOne question: are you ready to take responsibility?\n\nIf yes — start TODAY. Not tomorrow. Today.\nIf no — be honest at least in this.\n\n🚨 Remember: every day without change is another day you cause pain.',
      },
    ),
  };

  /// Determine profile based on overall toxicity percentage
  static String determineProfile(Map<String, double> percentages) {
    // Calculate overall toxicity (average of all 6 patterns)
    final values = percentages.values.where((v) => !v.isNaN && !v.isInfinite);
    if (values.isEmpty) {
      return 'healthy_relationships'; // Default if no valid data
    }

    final overallToxicity = values.reduce((a, b) => a + b) / values.length;

    // Determine profile based on overall toxicity level (Variant A)
    if (overallToxicity <= 25) {
      return 'healthy_relationships'; // 0-25%
    } else if (overallToxicity <= 45) {
      return 'mild_toxicity'; // 26-45%
    } else if (overallToxicity <= 65) {
      return 'moderate_toxicity'; // 46-65%
    } else if (overallToxicity <= 80) {
      return 'high_toxicity'; // 66-80%
    } else {
      return 'severe_toxicity'; // 81-100%
    }
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
