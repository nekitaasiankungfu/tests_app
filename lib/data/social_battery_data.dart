import '../models/test_model.dart';

/// Data access class for Social Battery Test
/// ⚠️ IMPORTANT: Class name is SocialBatteryData (WITHOUT "Test" suffix)
class SocialBatteryData {
  /// Get the complete Social Battery test
  static TestModel getSocialBatteryTest() {
    return TestModel(
      id: 'social_battery_v1',
      title: {
        'ru': 'Социальная батарея: Диагностика социальной энергии',
        'en': 'Social Battery: Social Energy Diagnostic',
      },
      description: {
        'ru':
            'Социальная батарея — это метафора, описывающая индивидуальную способность человека к социальному взаимодействию и его потребность в восстановлении после общения. Тест измеряет скорость истощения, способы восстановления, социальную тревожность, потребность в одиночестве, предпочтения в общении и гибкость социальной батареи.',
        'en':
            'Social battery is a metaphor describing an individual\'s capacity for social interaction and need for recovery after socializing. The test measures depletion rate, recharge methods, social anxiety, solitude needs, interaction preferences, and battery flexibility.',
      },
      category: {
        'ru': 'Типология личности',
        'en': 'Personality Typology',
      },
      categoryId: 'personality',
      questions: _getQuestions(),
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: [
        'depletion_rate',
        'recharge_method',
        'social_anxiety',
        'solitude_need',
        'interaction_preference',
        'capacity_flexibility',
      ],
      disclaimer: {
        'ru':
            'Этот тест предназначен для самопознания и оптимизации социальной жизни. Не является медицинским диагнозом. Помните: интроверсия, экстраверсия и амбиверсия — это нормальные типы личности.',
        'en':
            'This test is for self-awareness and social life optimization. Not a medical diagnosis. Remember: introversion, extraversion, and ambiversion are all normal personality types.',
      },
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'depletion_rate': {
        'ru': 'Скорость истощения',
        'en': 'Depletion Rate',
      },
      'recharge_method': {
        'ru': 'Способ восстановления',
        'en': 'Recharge Method',
      },
      'social_anxiety': {
        'ru': 'Социальная тревожность',
        'en': 'Social Anxiety',
      },
      'solitude_need': {
        'ru': 'Потребность в одиночестве',
        'en': 'Solitude Need',
      },
      'interaction_preference': {
        'ru': 'Предпочтения в общении',
        'en': 'Interaction Preference',
      },
      'capacity_flexibility': {
        'ru': 'Гибкость батареи',
        'en': 'Capacity Flexibility',
      },
    };
  }

  /// Get factor interpretation based on percentage (0-100)
  /// ⚠️ CRITICAL: NaN protection (RULE #4)
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // NaN protection
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    switch (factorId) {
      case 'depletion_rate':
        if (percentage <= 35) {
          return {
            'ru':
                'Низкая скорость истощения\n\nСоциальное взаимодействие не истощает вас или даже заряжает. Вы можете общаться часами без усталости. Помните, что другие могут истощаться быстрее — давайте им пространство.',
            'en':
                'Low Depletion Rate\n\nSocial interaction doesn\'t drain you or even energizes you. You can socialize for hours without fatigue. Remember others may deplete faster — give them space.',
          };
        } else if (percentage <= 65) {
          return {
            'ru':
                'Средняя скорость истощения\n\nВы истощаетесь от социального взаимодействия умеренно. После 2-4 часов общения нужен перерыв. Планируйте перерывы между социальными событиями. Чередуйте активные и спокойные дни.',
            'en':
                'Medium Depletion Rate\n\nYou deplete moderately from social interaction. After 2-4 hours you need a break. Plan breaks between social events. Alternate active and quiet days.',
          };
        } else {
          return {
            'ru':
                'Высокая скорость истощения\n\nВы истощаетесь очень быстро. Даже 1-2 часа общения требуют восстановления. Микро-дозируйте общение. Планируйте короткие встречи с большими промежутками. Не вините себя за потребность в восстановлении.',
            'en':
                'High Depletion Rate\n\nYou deplete very quickly. Even 1-2 hours require recovery. Micro-dose socializing. Plan short meetings with long gaps. Don\'t blame yourself for needing recovery.',
          };
        }

      case 'recharge_method':
        if (percentage <= 35) {
          return {
            'ru':
                'Восстановление через одиночество\n\nВы восстанавливаетесь только в одиночестве. Больше людей = больше истощения. Защищайте своё личное время. Создайте ритуалы восстановления в одиночестве.',
            'en':
                'Recharge Through Solitude\n\nYou recharge only in solitude. More people = more depletion. Protect your personal time. Create solo recovery rituals.',
          };
        } else if (percentage <= 65) {
          return {
            'ru':
                'Смешанный способ восстановления\n\nВы можете восстанавливаться и через одиночество, и через спокойное общение с близкими. Экспериментируйте с разными способами в зависимости от типа истощения.',
            'en':
                'Mixed Recharge Method\n\nYou can recharge through both solitude and calm interaction with close ones. Experiment with different methods depending on depletion type.',
          };
        } else {
          return {
            'ru':
                'Восстановление через общение\n\nВы восстанавливаетесь через взаимодействие с людьми. Одиночество истощает вас. Планируйте регулярные социальные активности для поддержания энергии. Найдите баланс между стимуляцией и перегрузкой.',
            'en':
                'Recharge Through Interaction\n\nYou recharge through interaction with people. Solitude depletes you. Plan regular social activities to maintain energy. Find balance between stimulation and overload.',
          };
        }

      case 'social_anxiety':
        if (percentage <= 35) {
          return {
            'ru':
                'Низкая социальная тревожность\n\nВы комфортно чувствуете себя в социальных ситуациях без значительной тревоги. Продолжайте наслаждаться общением!',
            'en':
                'Low Social Anxiety\n\nYou feel comfortable in social situations without significant anxiety. Keep enjoying socializing!',
          };
        } else if (percentage <= 65) {
          return {
            'ru':
                'Средняя социальная тревожность\n\nВы испытываете некоторую тревогу в социальных ситуациях, особенно с незнакомцами. Практики осознанности, постепенная экспозиция, когнитивное переструктурирование могут помочь.',
            'en':
                'Medium Social Anxiety\n\nYou experience some anxiety in social situations, especially with strangers. Mindfulness practices, gradual exposure, cognitive restructuring can help.',
          };
        } else {
          return {
            'ru':
                'Высокая социальная тревожность\n\nУ вас значительная социальная тревожность, которая может мешать социальной жизни. ОБЯЗАТЕЛЬНО рассмотрите терапию (КПТ очень эффективна для социальной тревожности). Это не просто интроверсия — это поддающееся лечению состояние.',
            'en':
                'High Social Anxiety\n\nYou have significant social anxiety that may interfere with social life. DEFINITELY consider therapy (CBT is very effective for social anxiety). This is not just introversion — it\'s a treatable condition.',
          };
        }

      case 'solitude_need':
        if (percentage <= 35) {
          return {
            'ru':
                'Низкая потребность в одиночестве\n\nВам практически не нужно время в одиночестве. Вы комфортно чувствуете себя в постоянном окружении людей.',
            'en':
                'Low Solitude Need\n\nYou practically don\'t need alone time. You feel comfortable in constant company.',
          };
        } else if (percentage <= 65) {
          return {
            'ru':
                'Средняя потребность в одиночестве\n\nВам нужно 1-3 часа в день для себя для нормального функционирования. Планируйте это время как важную встречу — защищайте его.',
            'en':
                'Medium Solitude Need\n\nYou need 1-3 hours per day for yourself to function normally. Schedule this time as an important meeting — protect it.',
          };
        } else {
          return {
            'ru':
                'Высокая потребность в одиночестве\n\nВам необходимо значительное количество времени в одиночестве (4+ часа в день). Это не эгоизм — это необходимость. Выбирайте работу и жизненные условия, позволяющие это.',
            'en':
                'High Solitude Need\n\nYou need significant alone time (4+ hours daily). This is not selfishness — it\'s a necessity. Choose work and life conditions that allow this.',
          };
        }

      case 'interaction_preference':
        if (percentage <= 35) {
          return {
            'ru':
                'Предпочтение глубины\n\nВы предпочитаете глубокие, осмысленные беседы один на один. Избегайте поверхностного общения и больших групп.',
            'en':
                'Depth Preference\n\nYou prefer deep, meaningful one-on-one conversations. Avoid superficial interaction and large groups.',
          };
        } else if (percentage <= 65) {
          return {
            'ru':
                'Сбалансированные предпочтения\n\nВы цените и глубину, и лёгкость в зависимости от контекста. Адаптируйте свой стиль общения к ситуации.',
            'en':
                'Balanced Preferences\n\nYou value both depth and lightness depending on context. Adapt your communication style to the situation.',
          };
        } else {
          return {
            'ru':
                'Предпочтение лёгкости\n\nВы предпочитаете лёгкое, поверхностное общение и большие группы. Наслаждайтесь энергией толпы!',
            'en':
                'Lightness Preference\n\nYou prefer light, superficial interaction and large groups. Enjoy the crowd energy!',
          };
        }

      case 'capacity_flexibility':
        if (percentage <= 35) {
          return {
            'ru':
                'Низкая гибкость\n\nВаша социальная батарея стабильна и предсказуема. Вы знаете свои потребности и можете легко их планировать.',
            'en':
                'Low Flexibility\n\nYour social battery is stable and predictable. You know your needs and can easily plan them.',
          };
        } else if (percentage <= 65) {
          return {
            'ru':
                'Средняя гибкость\n\nВаши потребности умеренно гибкие. Учитесь читать свои сигналы и адаптироваться к изменениям.',
            'en':
                'Medium Flexibility\n\nYour needs are moderately flexible. Learn to read your signals and adapt to changes.',
          };
        } else {
          return {
            'ru':
                'Высокая гибкость (амбивертные черты)\n\nВаша социальная батарея очень изменчива. Учитесь читать свои сигналы. Коммуницируйте об изменчивости своих потребностей. Это ваша сильная сторона!',
            'en':
                'High Flexibility (Ambivert Traits)\n\nYour social battery is very variable. Learn to read your signals. Communicate about your changing needs. This is your strength!',
          };
        }

      default:
        return {
          'ru': 'Интерпретация недоступна',
          'en': 'Interpretation unavailable',
        };
    }
  }

  /// Private method to create all 48 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1: Depletion Rate
      QuestionModel(
        id: 'q1',
        text: {
          'ru':
              'После социального мероприятия (вечеринка, встреча с друзьями) я чувствую себя истощённым(ой)',
          'en':
              'After a social event (party, meeting with friends) I feel exhausted',
        },
        factorId: 'depletion_rate',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q2: Recharge Method (REVERSED)
      QuestionModel(
        id: 'q2',
        text: {
          'ru':
              'Я лучше всего восстанавливаю энергию, когда провожу время в одиночестве',
          'en': 'I best recharge energy when I spend time alone',
        },
        factorId: 'recharge_method',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),

      // Q3: Social Anxiety
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я беспокоюсь о том, что подумают обо мне другие люди',
          'en': 'I worry about what other people will think of me',
        },
        factorId: 'social_anxiety',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q4: Solitude Need
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Мне НЕОБХОДИМО время наедине с собой каждый день',
          'en': 'I NEED time alone every day',
        },
        factorId: 'solitude_need',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q5: Interaction Preference (REVERSED)
      QuestionModel(
        id: 'q5',
        text: {
          'ru':
              'Я предпочитаю глубокие разговоры один на один, а не групповые беседы',
          'en':
              'I prefer deep one-on-one conversations over group discussions',
        },
        factorId: 'interaction_preference',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),

      // Q6: Capacity Flexibility
      QuestionModel(
        id: 'q6',
        text: {
          'ru':
              'Моя потребность в общении меняется в зависимости от настроения и обстоятельств',
          'en':
              'My need for communication changes depending on mood and circumstances',
        },
        factorId: 'capacity_flexibility',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q7: Depletion Rate
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Даже короткое общение (15-30 минут) может утомить меня',
          'en': 'Even brief interaction (15-30 minutes) can tire me',
        },
        factorId: 'depletion_rate',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q8: Recharge Method
      QuestionModel(
        id: 'q8',
        text: {
          'ru':
              'После стрессового дня я хочу встретиться с друзьями, чтобы расслабиться',
          'en':
              'After a stressful day I want to meet friends to relax',
        },
        factorId: 'recharge_method',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q9: Social Anxiety
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я чувствую тревогу перед социальными мероприятиями',
          'en': 'I feel anxious before social events',
        },
        factorId: 'social_anxiety',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q10: Solitude Need
      QuestionModel(
        id: 'q10',
        text: {
          'ru':
              'Я не могу нормально функционировать без регулярного времени в одиночестве',
          'en':
              'I cannot function normally without regular alone time',
        },
        factorId: 'solitude_need',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q11: Interaction Preference
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Мне нравится лёгкий small talk и поверхностное общение',
          'en': 'I enjoy light small talk and superficial interaction',
        },
        factorId: 'interaction_preference',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q12: Capacity Flexibility
      QuestionModel(
        id: 'q12',
        text: {
          'ru':
              'Иногда я могу быть очень общительным(ой), а иногда мне нужно полное уединение',
          'en':
              'Sometimes I can be very sociable, sometimes I need complete isolation',
        },
        factorId: 'capacity_flexibility',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q13: Depletion Rate (multiple choice)
      QuestionModel(
        id: 'q13',
        text: {
          'ru':
              'Как долго вы можете активно общаться, прежде чем почувствуете усталость?',
          'en':
              'How long can you actively socialize before feeling tired?',
        },
        factorId: 'depletion_rate',
        isReversed: false,
        answers: _getDurationAnswers(),
      ),

      // Q14: Recharge Method
      QuestionModel(
        id: 'q14',
        text: {
          'ru':
              'Когда я чувствую себя подавленным(ой), я ищу компанию людей',
          'en': 'When I feel down, I seek company of people',
        },
        factorId: 'recharge_method',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q15: Social Anxiety
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я боюсь сказать что-то неловкое в разговоре',
          'en': 'I\'m afraid to say something awkward in conversation',
        },
        factorId: 'social_anxiety',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q16: Solitude Need
      QuestionModel(
        id: 'q16',
        text: {
          'ru':
              'Я чувствую себя перегруженным(ой), если у меня нет времени побыть одному/одной',
          'en': 'I feel overwhelmed if I don\'t have time to be alone',
        },
        factorId: 'solitude_need',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q17: Interaction Preference
      QuestionModel(
        id: 'q17',
        text: {
          'ru':
              'Большие группы людей (10+ человек) более комфортны для меня, чем интимные беседы',
          'en':
              'Large groups (10+ people) are more comfortable for me than intimate conversations',
        },
        factorId: 'interaction_preference',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q18: Capacity Flexibility
      QuestionModel(
        id: 'q18',
        text: {
          'ru':
              'Моя социальная энергия зависит от того, с кем именно я общаюсь',
          'en':
              'My social energy depends on who exactly I\'m interacting with',
        },
        factorId: 'capacity_flexibility',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q19: Depletion Rate
      QuestionModel(
        id: 'q19',
        text: {
          'ru':
              'Я чувствую необходимость \'восстановиться\' даже после встречи с близкими друзьями',
          'en':
              'I feel the need to \'recover\' even after meeting close friends',
        },
        factorId: 'depletion_rate',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q20: Recharge Method
      QuestionModel(
        id: 'q20',
        text: {
          'ru':
              'Я восстанавливаю энергию быстрее в компании, чем в одиночестве',
          'en': 'I recharge faster in company than alone',
        },
        factorId: 'recharge_method',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q21: Social Anxiety
      QuestionModel(
        id: 'q21',
        text: {
          'ru':
              'Я анализирую свои социальные взаимодействия и переживаю о них после',
          'en':
              'I analyze my social interactions and worry about them afterwards',
        },
        factorId: 'social_anxiety',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q22: Solitude Need
      QuestionModel(
        id: 'q22',
        text: {
          'ru':
              'Если бы я мог(ла) выбирать, я бы проводил(а) большую часть времени один/одна',
          'en':
              'If I could choose, I would spend most of my time alone',
        },
        factorId: 'solitude_need',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q23: Interaction Preference (REVERSED)
      QuestionModel(
        id: 'q23',
        text: {
          'ru':
              'Я предпочитаю текстовые сообщения живому общению или звонкам',
          'en':
              'I prefer text messages to live communication or phone calls',
        },
        factorId: 'interaction_preference',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),

      // Q24: Capacity Flexibility
      QuestionModel(
        id: 'q24',
        text: {
          'ru':
              'Некоторые дни я могу общаться часами, а в другие дни мне нужна тишина',
          'en':
              'Some days I can socialize for hours, other days I need silence',
        },
        factorId: 'capacity_flexibility',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q25: Depletion Rate
      QuestionModel(
        id: 'q25',
        text: {
          'ru':
              'Работа, требующая много социального взаимодействия, истощает меня',
          'en':
              'Work requiring lots of social interaction exhausts me',
        },
        factorId: 'depletion_rate',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q26: Recharge Method
      QuestionModel(
        id: 'q26',
        text: {
          'ru':
              'Когда я один/одна долгое время, я чувствую себя одиноким(ой) и ищу общения',
          'en':
              'When I\'m alone for a long time, I feel lonely and seek interaction',
        },
        factorId: 'recharge_method',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q27: Social Anxiety
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Я боюсь быть в центре внимания',
          'en': 'I\'m afraid to be the center of attention',
        },
        factorId: 'social_anxiety',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q28: Solitude Need (multiple choice)
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Сколько часов в день вам нужно для себя (без общения)?',
          'en': 'How many hours per day do you need for yourself (without interaction)?',
        },
        factorId: 'solitude_need',
        isReversed: false,
        answers: _getSolitudeHoursAnswers(),
      ),

      // Q29: Interaction Preference
      QuestionModel(
        id: 'q29',
        text: {
          'ru':
              'Я получаю удовольствие от спонтанных встреч и неожиданных социальных ситуаций',
          'en':
              'I enjoy spontaneous meetings and unexpected social situations',
        },
        factorId: 'interaction_preference',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q30: Capacity Flexibility
      QuestionModel(
        id: 'q30',
        text: {
          'ru':
              'С некоторыми людьми я не теряю энергию, даже после долгого общения',
          'en':
              'With some people I don\'t lose energy, even after long interaction',
        },
        factorId: 'capacity_flexibility',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q31: Depletion Rate
      QuestionModel(
        id: 'q31',
        text: {
          'ru':
              'После рабочей недели, включающей много общения, мне нужны выходные в одиночестве',
          'en':
              'After a work week with lots of interaction, I need a weekend alone',
        },
        factorId: 'depletion_rate',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q32: Recharge Method
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Я чувствую прилив энергии от разговоров с новыми людьми',
          'en': 'I feel energized by conversations with new people',
        },
        factorId: 'recharge_method',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q33: Social Anxiety
      QuestionModel(
        id: 'q33',
        text: {
          'ru':
              'Я избегаю социальных событий, потому что они вызывают у меня стресс',
          'en': 'I avoid social events because they cause me stress',
        },
        factorId: 'social_anxiety',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q34: Solitude Need
      QuestionModel(
        id: 'q34',
        text: {
          'ru':
              'Одиночество не пугает меня, а скорее приносит облегчение',
          'en': 'Solitude doesn\'t scare me, but rather brings relief',
        },
        factorId: 'solitude_need',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q35: Interaction Preference
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Я наслаждаюсь активностью на вечеринках и энергией толпы',
          'en': 'I enjoy party activities and crowd energy',
        },
        factorId: 'interaction_preference',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q36: Capacity Flexibility
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Моя потребность в общении непредсказуема',
          'en': 'My need for interaction is unpredictable',
        },
        factorId: 'capacity_flexibility',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q37: Depletion Rate
      QuestionModel(
        id: 'q37',
        text: {
          'ru':
              'Мне нужно много времени, чтобы восстановиться после больших социальных событий',
          'en':
              'I need a lot of time to recover after large social events',
        },
        factorId: 'depletion_rate',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q38: Recharge Method
      QuestionModel(
        id: 'q38',
        text: {
          'ru':
              'Тишина и одиночество утомляют меня больше, чем социальное взаимодействие',
          'en':
              'Silence and solitude tire me more than social interaction',
        },
        factorId: 'recharge_method',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q39: Social Anxiety
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Мне трудно расслабиться в присутствии других людей',
          'en': 'I find it difficult to relax in the presence of others',
        },
        factorId: 'social_anxiety',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q40: Solitude Need
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'Я активно защищаю своё личное время и пространство',
          'en': 'I actively protect my personal time and space',
        },
        factorId: 'solitude_need',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q41: Interaction Preference
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Я легко начинаю разговор с незнакомыми людьми',
          'en': 'I easily start conversations with strangers',
        },
        factorId: 'interaction_preference',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q42: Capacity Flexibility
      QuestionModel(
        id: 'q42',
        text: {
          'ru':
              'Я могу адаптировать свою социальную энергию к требованиям ситуации',
          'en':
              'I can adapt my social energy to situational demands',
        },
        factorId: 'capacity_flexibility',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q43: Depletion Rate
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Даже приятное общение истощает мою энергию',
          'en': 'Even pleasant interaction depletes my energy',
        },
        factorId: 'depletion_rate',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q44: Recharge Method
      QuestionModel(
        id: 'q44',
        text: {
          'ru':
              'Я чувствую подъём настроения после времени, проведённого с людьми',
          'en': 'I feel mood lift after time spent with people',
        },
        factorId: 'recharge_method',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q45: Social Anxiety
      QuestionModel(
        id: 'q45',
        text: {
          'ru':
              'Я переживаю о том, понравился(лась) ли я людям после встречи',
          'en': 'I worry whether people liked me after a meeting',
        },
        factorId: 'social_anxiety',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q46: Solitude Need
      QuestionModel(
        id: 'q46',
        text: {
          'ru':
              'Мне нужно планировать \'дни восстановления\' без общения',
          'en': 'I need to plan \'recovery days\' without interaction',
        },
        factorId: 'solitude_need',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // Q47: Interaction Preference
      QuestionModel(
        id: 'q47',
        text: {
          'ru':
              'Мне комфортнее в шумной обстановке (кафе, бары), чем в тихих местах',
          'en':
              'I\'m more comfortable in noisy environments (cafes, bars) than quiet places',
        },
        factorId: 'interaction_preference',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Q48: Capacity Flexibility
      QuestionModel(
        id: 'q48',
        text: {
          'ru':
              'Есть люди, с которыми я могу общаться бесконечно, и другие, которые истощают меня быстро',
          'en':
              'There are people I can talk to endlessly, and others who deplete me quickly',
        },
        factorId: 'capacity_flexibility',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
    ];
  }

  /// Standard 5-point Likert scale answers
  /// ⚠️ CRITICAL: Scores MUST be 0-4 (NOT 1-5)! See RULE #1.
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совершенно не согласен(на)',
          'en': 'Strongly Disagree',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не согласен(на)',
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
          'ru': 'Скорее согласен(на)',
          'en': 'Agree',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью согласен(на)',
          'en': 'Strongly Agree',
        },
        score: 4,
      ),
    ];
  }

  /// Frequency scale answers
  /// ⚠️ CRITICAL: Scores MUST be 0-4 (NOT 1-5)! See RULE #1.
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

  /// Duration answers for Q13
  /// ⚠️ CRITICAL: Scores MUST be 0-4 (NOT 1-5)! See RULE #1.
  static List<AnswerModel> _getDurationAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Более 6 часов',
          'en': 'More than 6 hours',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': '4-6 часов',
          'en': '4-6 hours',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': '2-4 часа',
          'en': '2-4 hours',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': '1-2 часа',
          'en': '1-2 hours',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Менее 1 часа',
          'en': 'Less than 1 hour',
        },
        score: 4,
      ),
    ];
  }

  /// Solitude hours answers for Q28
  /// ⚠️ CRITICAL: Scores MUST be 0-4 (NOT 1-5)! See RULE #1.
  static List<AnswerModel> _getSolitudeHoursAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Менее 1 часа или не нужно',
          'en': 'Less than 1 hour or not needed',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': '1-2 часа',
          'en': '1-2 hours',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': '2-4 часа',
          'en': '2-4 hours',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': '4-6 часов',
          'en': '4-6 hours',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Большую часть дня',
          'en': 'Most of the day',
        },
        score: 4,
      ),
    ];
  }
}
