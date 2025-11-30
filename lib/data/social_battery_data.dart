import '../models/test_model.dart';
import '../models/test_profile_model.dart';

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

  /// Определить профиль на основе процентов по шкалам
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_balanced';

    // Вычисляем средний процент
    final avgPercentage = percentages.values.reduce((a, b) => a + b) / percentages.length;

    // Определяем доминирующий фактор
    String? dominantFactor;
    double maxValue = 0;
    for (final entry in percentages.entries) {
      if (entry.value > maxValue) {
        maxValue = entry.value;
        dominantFactor = entry.key;
      }
    }

    // Профили на основе уровней
    if (avgPercentage <= 25) {
      return 'profile_extrovert';
    } else if (avgPercentage <= 40) {
      // Смешанный профиль - смотрим доминанту
      if (dominantFactor == 'recharge_method') {
        return 'profile_social_recharger';
      } else if (dominantFactor == 'interaction_preference') {
        return 'profile_group_lover';
      }
      return 'profile_ambivert_social';
    } else if (avgPercentage <= 60) {
      // Сбалансированный профиль
      if (dominantFactor == 'capacity_flexibility' && maxValue > 60) {
        return 'profile_adaptive';
      } else if (dominantFactor == 'social_anxiety' && maxValue > 60) {
        return 'profile_social_anxious';
      }
      return 'profile_balanced';
    } else if (avgPercentage <= 75) {
      // Интровертные тенденции
      if (dominantFactor == 'solitude_need') {
        return 'profile_solitude_seeker';
      } else if (dominantFactor == 'depletion_rate') {
        return 'profile_quick_drainer';
      }
      return 'profile_ambivert_introvert';
    } else if (avgPercentage <= 85) {
      return 'profile_introvert';
    } else {
      return 'profile_deep_introvert';
    }
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Все доступные профили
  static const Map<String, TestProfile> _profiles = {
    'profile_extrovert': TestProfile(
      id: 'profile_extrovert',
      name: {
        'ru': 'Социальный экстраверт',
        'en': 'Social Extrovert',
      },
      description: {
        'ru': 'Вы черпаете энергию из социального взаимодействия. Общение заряжает вашу батарею, а не истощает её.',
        'en': 'You draw energy from social interaction. Socializing charges your battery rather than draining it.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают низкую скорость социального истощения, предпочтение групповой активности и быстрое восстановление через общение.',
        'en': 'Your answers show low social depletion rate, preference for group activities, and quick recharge through socializing.',
      },
      strengths: {
        'ru': [
          'Естественная лёгкость в общении',
          'Способность работать в команде',
          'Быстрое установление контактов',
          'Высокая социальная выносливость',
          'Умение создавать атмосферу',
        ],
        'en': [
          'Natural ease in communication',
          'Ability to work in teams',
          'Quick rapport building',
          'High social endurance',
          'Creating welcoming atmosphere',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Дискомфорт в одиночестве',
          'Риск зависимости от внешней стимуляции',
          'Возможные поверхностные связи',
          'Трудности с глубокой рефлексией',
        ],
        'en': [
          'Discomfort when alone',
          'Risk of dependence on external stimulation',
          'Potentially superficial connections',
          'Difficulty with deep reflection',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте осознанное одиночество 15-30 минут в день',
          'Развивайте глубокие связи, а не только широкие',
          'Уважайте границы интровертов вокруг вас',
          'Учитесь находить удовольствие в тишине',
          'Планируйте время для саморефлексии',
        ],
        'en': [
          'Practice mindful solitude 15-30 minutes daily',
          'Develop deep connections, not just wide ones',
          'Respect boundaries of introverts around you',
          'Learn to enjoy silence',
          'Schedule time for self-reflection',
        ],
      },
      tryToday: {
        'ru': 'Проведите 20 минут в тишине без гаджетов — просто побудьте наедине со своими мыслями.',
        'en': 'Spend 20 minutes in silence without gadgets — just be alone with your thoughts.',
      },
      inspiringConclusion: {
        'ru': 'Ваша социальная энергия — это дар! Используйте её для создания связей, но не забывайте, что глубина важнее ширины.',
        'en': 'Your social energy is a gift! Use it to create connections, but remember that depth matters more than breadth.',
      },
    ),

    'profile_social_recharger': TestProfile(
      id: 'profile_social_recharger',
      name: {
        'ru': 'Социальный подзарядчик',
        'en': 'Social Recharger',
      },
      description: {
        'ru': 'Вы восстанавливаете энергию через социальное взаимодействие. Правильные люди — ваша энергостанция.',
        'en': 'You recharge through social interaction. The right people are your power station.',
      },
      whyThisProfile: {
        'ru': 'Ваш способ восстановления — общение с правильными людьми, а не одиночество.',
        'en': 'Your recharge method is socializing with the right people, not solitude.',
      },
      strengths: {
        'ru': [
          'Ценная способность "питаться" энергией людей',
          'Умение выбирать качественное окружение',
          'Высокая социальная адаптивность',
          'Способность быстро восстанавливаться',
        ],
        'en': [
          'Valuable ability to draw energy from people',
          'Skill in choosing quality environment',
          'High social adaptability',
          'Quick recovery ability',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Зависимость от социальной среды',
          'Трудности в изоляции',
          'Риск истощения от неправильных людей',
        ],
        'en': [
          'Dependence on social environment',
          'Difficulties in isolation',
          'Risk of depletion from wrong people',
        ],
      },
      recommendations: {
        'ru': [
          'Определите своих "энергетических доноров"',
          'Избегайте людей, которые вас истощают',
          'Создайте резервный способ восстановления для изоляции',
          'Инвестируйте в качественные отношения',
        ],
        'en': [
          'Identify your "energy donors"',
          'Avoid people who drain you',
          'Create backup recharge method for isolation',
          'Invest in quality relationships',
        ],
      },
      tryToday: {
        'ru': 'Позвоните человеку, который обычно поднимает вам настроение.',
        'en': 'Call someone who usually lifts your mood.',
      },
      inspiringConclusion: {
        'ru': 'Правильные люди — это лучшая инвестиция в вашу энергию!',
        'en': 'The right people are the best investment in your energy!',
      },
    ),

    'profile_group_lover': TestProfile(
      id: 'profile_group_lover',
      name: {
        'ru': 'Командный игрок',
        'en': 'Group Lover',
      },
      description: {
        'ru': 'Вы предпочитаете групповое общение индивидуальному. В команде вы расцветаете.',
        'en': 'You prefer group interaction to one-on-one. You thrive in teams.',
      },
      whyThisProfile: {
        'ru': 'Ваши предпочтения указывают на комфорт в групповых ситуациях.',
        'en': 'Your preferences indicate comfort in group situations.',
      },
      strengths: {
        'ru': [
          'Умение работать в команде',
          'Навык управления групповой динамикой',
          'Способность объединять людей',
          'Комфорт в публичных выступлениях',
        ],
        'en': [
          'Team collaboration skills',
          'Group dynamics management',
          'Ability to unite people',
          'Comfort in public speaking',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможная потеря глубины связей',
          'Дискомфорт в интимных беседах',
          'Риск "растворения" в группе',
        ],
        'en': [
          'Possible loss of connection depth',
          'Discomfort in intimate conversations',
          'Risk of getting lost in the group',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте глубокие разговоры один на один',
          'Развивайте индивидуальные связи',
          'Сохраняйте свою идентичность в группе',
        ],
        'en': [
          'Practice deep one-on-one conversations',
          'Develop individual connections',
          'Maintain your identity in the group',
        ],
      },
      tryToday: {
        'ru': 'Назначьте встречу один на один с близким другом.',
        'en': 'Schedule a one-on-one meeting with a close friend.',
      },
      inspiringConclusion: {
        'ru': 'Команда — это сила, но глубокие связи — это фундамент!',
        'en': 'Team is power, but deep connections are the foundation!',
      },
    ),

    'profile_ambivert_social': TestProfile(
      id: 'profile_ambivert_social',
      name: {
        'ru': 'Социальный амбиверт',
        'en': 'Social Ambivert',
      },
      description: {
        'ru': 'Вы амбиверт с социальным уклоном. Легко общаетесь, но цените и личное время.',
        'en': 'You\'re an ambivert with a social lean. You socialize easily but also value personal time.',
      },
      whyThisProfile: {
        'ru': 'Ваши результаты показывают баланс с небольшим уклоном к экстраверсии.',
        'en': 'Your results show balance with a slight lean toward extroversion.',
      },
      strengths: {
        'ru': [
          'Гибкость в социальных ситуациях',
          'Способность адаптироваться к разным форматам',
          'Баланс между активностью и отдыхом',
          'Понимание обеих сторон',
        ],
        'en': [
          'Flexibility in social situations',
          'Ability to adapt to different formats',
          'Balance between activity and rest',
          'Understanding both sides',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Иногда трудно понять свои истинные потребности',
          'Риск переоценить свою выносливость',
        ],
        'en': [
          'Sometimes hard to understand true needs',
          'Risk of overestimating endurance',
        ],
      },
      recommendations: {
        'ru': [
          'Следите за сигналами усталости',
          'Не бойтесь отказываться от мероприятий',
          'Используйте свою гибкость осознанно',
        ],
        'en': [
          'Watch for fatigue signals',
          'Don\'t be afraid to decline events',
          'Use your flexibility mindfully',
        ],
      },
      tryToday: {
        'ru': 'Прислушайтесь к себе: чего вам сейчас хочется — общения или тишины?',
        'en': 'Listen to yourself: what do you want now — socializing or quiet?',
      },
      inspiringConclusion: {
        'ru': 'Ваша гибкость — суперсила! Используйте её мудро.',
        'en': 'Your flexibility is a superpower! Use it wisely.',
      },
    ),

    'profile_adaptive': TestProfile(
      id: 'profile_adaptive',
      name: {
        'ru': 'Адаптивный социализатор',
        'en': 'Adaptive Socializer',
      },
      description: {
        'ru': 'У вас высокая гибкость социальной батареи. Вы можете адаптироваться к разным ситуациям.',
        'en': 'You have high social battery flexibility. You can adapt to various situations.',
      },
      whyThisProfile: {
        'ru': 'Ваша высокая гибкость батареи позволяет эффективно функционировать в разных социальных контекстах.',
        'en': 'Your high battery flexibility allows effective functioning in different social contexts.',
      },
      strengths: {
        'ru': [
          'Способность подстраиваться под обстоятельства',
          'Умение находить баланс в любой ситуации',
          'Высокая социальная осознанность',
          'Эффективное управление энергией',
        ],
        'en': [
          'Ability to adjust to circumstances',
          'Finding balance in any situation',
          'High social awareness',
          'Effective energy management',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск чрезмерной адаптации под других',
          'Возможная потеря собственных предпочтений',
        ],
        'en': [
          'Risk of over-adapting to others',
          'Possible loss of own preferences',
        ],
      },
      recommendations: {
        'ru': [
          'Сохраняйте свои базовые потребности',
          'Не забывайте о себе, помогая другим',
          'Используйте адаптивность стратегически',
        ],
        'en': [
          'Maintain your basic needs',
          'Don\'t forget yourself while helping others',
          'Use adaptability strategically',
        ],
      },
      tryToday: {
        'ru': 'Запишите 3 свои истинные социальные предпочтения.',
        'en': 'Write down 3 of your true social preferences.',
      },
      inspiringConclusion: {
        'ru': 'Адаптивность — это искусство! Не теряйте себя в процессе.',
        'en': 'Adaptability is an art! Don\'t lose yourself in the process.',
      },
    ),

    'profile_social_anxious': TestProfile(
      id: 'profile_social_anxious',
      name: {
        'ru': 'Социально тревожный',
        'en': 'Socially Anxious',
      },
      description: {
        'ru': 'Социальная тревожность влияет на вашу энергию. Общение вызывает напряжение.',
        'en': 'Social anxiety affects your energy. Socializing causes tension.',
      },
      whyThisProfile: {
        'ru': 'Высокий уровень социальной тревожности истощает вашу батарею быстрее.',
        'en': 'High social anxiety depletes your battery faster.',
      },
      strengths: {
        'ru': [
          'Глубокая эмпатия',
          'Внимательность к деталям',
          'Способность к глубоким связям',
          'Осторожность в отношениях',
        ],
        'en': [
          'Deep empathy',
          'Attention to details',
          'Capacity for deep connections',
          'Caution in relationships',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Избегание социальных ситуаций',
          'Чрезмерный самоанализ',
          'Истощение от волнения',
          'Трудности с новыми знакомствами',
        ],
        'en': [
          'Avoidance of social situations',
          'Excessive self-analysis',
          'Depletion from worry',
          'Difficulty with new acquaintances',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте техники релаксации перед событиями',
          'Начинайте с небольших групп',
          'Работайте с терапевтом при необходимости',
          'Создавайте "зону комфорта" на мероприятиях',
          'Фокусируйтесь на других, а не на себе',
        ],
        'en': [
          'Practice relaxation techniques before events',
          'Start with small groups',
          'Work with a therapist if needed',
          'Create a comfort zone at events',
          'Focus on others, not yourself',
        ],
      },
      tryToday: {
        'ru': 'Попробуйте технику 4-7-8: вдох 4 сек, задержка 7 сек, выдох 8 сек.',
        'en': 'Try the 4-7-8 technique: inhale 4 sec, hold 7 sec, exhale 8 sec.',
      },
      inspiringConclusion: {
        'ru': 'Тревога — не приговор. Она может стать вашим учителем на пути к уверенности.',
        'en': 'Anxiety is not a sentence. It can become your teacher on the path to confidence.',
      },
    ),

    'profile_balanced': TestProfile(
      id: 'profile_balanced',
      name: {
        'ru': 'Сбалансированный амбиверт',
        'en': 'Balanced Ambivert',
      },
      description: {
        'ru': 'У вас идеальный баланс между потребностью в общении и одиночестве.',
        'en': 'You have an ideal balance between need for socializing and solitude.',
      },
      whyThisProfile: {
        'ru': 'Ваши результаты показывают равномерное распределение по всем шкалам.',
        'en': 'Your results show even distribution across all scales.',
      },
      strengths: {
        'ru': [
          'Естественный баланс социальной энергии',
          'Способность понимать разные типы людей',
          'Гибкость без потери идентичности',
          'Умение отдыхать по-разному',
        ],
        'en': [
          'Natural social energy balance',
          'Ability to understand different types of people',
          'Flexibility without losing identity',
          'Ability to rest in different ways',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Иногда трудно определить приоритеты',
          'Риск распыления между режимами',
        ],
        'en': [
          'Sometimes hard to determine priorities',
          'Risk of spreading between modes',
        ],
      },
      recommendations: {
        'ru': [
          'Доверяйте своим инстинктам',
          'Экспериментируйте с разными режимами',
          'Помогайте другим находить баланс',
        ],
        'en': [
          'Trust your instincts',
          'Experiment with different modes',
          'Help others find balance',
        ],
      },
      tryToday: {
        'ru': 'Выберите то, что интуитивно кажется правильным — общение или тишину.',
        'en': 'Choose what feels intuitively right — socializing or quiet.',
      },
      inspiringConclusion: {
        'ru': 'Ваш баланс — редкий дар! Цените его и помогайте другим найти свой.',
        'en': 'Your balance is a rare gift! Cherish it and help others find theirs.',
      },
    ),

    'profile_solitude_seeker': TestProfile(
      id: 'profile_solitude_seeker',
      name: {
        'ru': 'Искатель одиночества',
        'en': 'Solitude Seeker',
      },
      description: {
        'ru': 'Вы находите силу в одиночестве. Тишина — ваш лучший друг для восстановления.',
        'en': 'You find strength in solitude. Quiet is your best friend for recovery.',
      },
      whyThisProfile: {
        'ru': 'Высокая потребность в одиночестве — ключевая характеристика вашего профиля.',
        'en': 'High need for solitude is a key characteristic of your profile.',
      },
      strengths: {
        'ru': [
          'Глубокая саморефлексия',
          'Независимость',
          'Способность к концентрации',
          'Богатый внутренний мир',
          'Креативность',
        ],
        'en': [
          'Deep self-reflection',
          'Independence',
          'Ability to concentrate',
          'Rich inner world',
          'Creativity',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск изоляции',
          'Возможные трудности с командой',
          'Дискомфорт в шумных компаниях',
        ],
        'en': [
          'Risk of isolation',
          'Possible team difficulties',
          'Discomfort in noisy groups',
        ],
      },
      recommendations: {
        'ru': [
          'Поддерживайте несколько близких связей',
          'Не изолируйтесь полностью',
          'Найдите работу с автономией',
          'Создайте комфортное личное пространство',
        ],
        'en': [
          'Maintain several close connections',
          'Don\'t isolate completely',
          'Find work with autonomy',
          'Create comfortable personal space',
        ],
      },
      tryToday: {
        'ru': 'Напишите сообщение близкому другу — даже интровертам нужны связи.',
        'en': 'Text a close friend — even introverts need connections.',
      },
      inspiringConclusion: {
        'ru': 'Одиночество — ваша суперсила для восстановления. Используйте её мудро!',
        'en': 'Solitude is your superpower for recovery. Use it wisely!',
      },
    ),

    'profile_quick_drainer': TestProfile(
      id: 'profile_quick_drainer',
      name: {
        'ru': 'Быстро истощающийся',
        'en': 'Quick Drainer',
      },
      description: {
        'ru': 'Ваша социальная батарея истощается быстро. Нужны частые перерывы и стратегия.',
        'en': 'Your social battery drains quickly. You need frequent breaks and strategy.',
      },
      whyThisProfile: {
        'ru': 'Высокая скорость истощения — главный фактор вашего социального профиля.',
        'en': 'High depletion rate is the main factor of your social profile.',
      },
      strengths: {
        'ru': [
          'Глубокое погружение в разговоры',
          'Качество общения важнее количества',
          'Осознанный выбор социальных событий',
          'Ценность личного времени',
        ],
        'en': [
          'Deep immersion in conversations',
          'Quality over quantity in socializing',
          'Conscious choice of social events',
          'Value of personal time',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Трудности с длинными мероприятиями',
          'Риск пропускать важные события',
          'Потенциальное непонимание от других',
        ],
        'en': [
          'Difficulty with long events',
          'Risk of missing important events',
          'Potential misunderstanding from others',
        ],
      },
      recommendations: {
        'ru': [
          'Планируйте перерывы заранее',
          'Всегда имейте запасной план ухода',
          'Объясняйте близким свои потребности',
          'Выбирайте качество, а не количество',
          'Используйте стратегию "прийти раньше — уйти раньше"',
        ],
        'en': [
          'Plan breaks in advance',
          'Always have an exit strategy',
          'Explain your needs to close ones',
          'Choose quality over quantity',
          'Use "arrive early — leave early" strategy',
        ],
      },
      tryToday: {
        'ru': 'Запланируйте следующее мероприятие с чётким временем ухода.',
        'en': 'Plan your next event with a clear exit time.',
      },
      inspiringConclusion: {
        'ru': 'Быстрое истощение — не слабость, а особенность. Управляйте ею стратегически!',
        'en': 'Quick drainage is not a weakness but a feature. Manage it strategically!',
      },
    ),

    'profile_ambivert_introvert': TestProfile(
      id: 'profile_ambivert_introvert',
      name: {
        'ru': 'Интровертный амбиверт',
        'en': 'Introverted Ambivert',
      },
      description: {
        'ru': 'Вы амбиверт с интровертным уклоном. Общаться умеете, но предпочитаете тишину.',
        'en': 'You\'re an ambivert with an introvert lean. You can socialize but prefer quiet.',
      },
      whyThisProfile: {
        'ru': 'Ваши результаты показывают баланс с уклоном к интроверсии.',
        'en': 'Your results show balance with a lean toward introversion.',
      },
      strengths: {
        'ru': [
          'Выборочная социализация',
          'Глубокие связи',
          'Способность быть одному и с другими',
          'Хорошее понимание границ',
        ],
        'en': [
          'Selective socializing',
          'Deep connections',
          'Ability to be alone and with others',
          'Good understanding of boundaries',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Иногда недооценка социальной потребности',
          'Риск излишней изоляции',
        ],
        'en': [
          'Sometimes underestimating social need',
          'Risk of excessive isolation',
        ],
      },
      recommendations: {
        'ru': [
          'Планируйте социальные события заранее',
          'Не отменяйте планы в последний момент',
          'Находите комфортные форматы общения',
        ],
        'en': [
          'Plan social events in advance',
          'Don\'t cancel plans at the last moment',
          'Find comfortable communication formats',
        ],
      },
      tryToday: {
        'ru': 'Согласитесь на одно приглашение, которое хотели отклонить.',
        'en': 'Accept one invitation you wanted to decline.',
      },
      inspiringConclusion: {
        'ru': 'Ваш интровертный баланс даёт глубину. Не забывайте иногда выходить на свет!',
        'en': 'Your introverted balance gives depth. Don\'t forget to come into the light sometimes!',
      },
    ),

    'profile_introvert': TestProfile(
      id: 'profile_introvert',
      name: {
        'ru': 'Классический интроверт',
        'en': 'Classic Introvert',
      },
      description: {
        'ru': 'Вы восстанавливаетесь в одиночестве. Социальная батарея требует времени для перезарядки.',
        'en': 'You recover in solitude. Your social battery needs time to recharge.',
      },
      whyThisProfile: {
        'ru': 'Высокие показатели по истощению, потребности в одиночестве и предпочтению малых групп.',
        'en': 'High scores in depletion, solitude need, and preference for small groups.',
      },
      strengths: {
        'ru': [
          'Глубокое мышление',
          'Сильная концентрация',
          'Качественные глубокие связи',
          'Независимость',
          'Творческие способности',
        ],
        'en': [
          'Deep thinking',
          'Strong concentration',
          'Quality deep connections',
          'Independence',
          'Creative abilities',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Трудности с networking',
          'Дискомфорт в больших группах',
          'Возможная недооценка окружающими',
          'Риск упустить возможности',
        ],
        'en': [
          'Networking difficulties',
          'Discomfort in large groups',
          'Possible underestimation by others',
          'Risk of missing opportunities',
        ],
      },
      recommendations: {
        'ru': [
          'Создайте комфортную среду для работы',
          'Выбирайте камерные мероприятия',
          'Готовьтесь к социальным событиям заранее',
          'Найдите свой оптимальный режим общения',
          'Защищайте своё время для восстановления',
        ],
        'en': [
          'Create comfortable work environment',
          'Choose intimate events',
          'Prepare for social events in advance',
          'Find your optimal communication mode',
          'Protect your recovery time',
        ],
      },
      tryToday: {
        'ru': 'Создайте ритуал восстановления после социальных событий.',
        'en': 'Create a recovery ritual after social events.',
      },
      inspiringConclusion: {
        'ru': 'Интроверсия — это не слабость, а источник глубины и силы. Гордитесь собой!',
        'en': 'Introversion is not a weakness but a source of depth and strength. Be proud!',
      },
    ),

    'profile_deep_introvert': TestProfile(
      id: 'profile_deep_introvert',
      name: {
        'ru': 'Глубокий интроверт',
        'en': 'Deep Introvert',
      },
      description: {
        'ru': 'Ваша социальная батарея очень чувствительна. Вам нужно значительное время в тишине.',
        'en': 'Your social battery is very sensitive. You need significant quiet time.',
      },
      whyThisProfile: {
        'ru': 'Очень высокие показатели по всем интровертным шкалам.',
        'en': 'Very high scores across all introvert scales.',
      },
      strengths: {
        'ru': [
          'Глубочайшая рефлексия',
          'Сильнейшая концентрация',
          'Редкие, но очень глубокие связи',
          'Полная независимость',
          'Богатый внутренний мир',
        ],
        'en': [
          'Deepest reflection',
          'Strongest concentration',
          'Rare but very deep connections',
          'Complete independence',
          'Rich inner world',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Высокий риск изоляции',
          'Трудности в современном социальном мире',
          'Потенциальное одиночество',
          'Возможные проблемы с карьерой',
        ],
        'en': [
          'High isolation risk',
          'Difficulties in modern social world',
          'Potential loneliness',
          'Possible career challenges',
        ],
      },
      recommendations: {
        'ru': [
          'Обязательно поддерживайте хотя бы 2-3 близких связи',
          'Найдите удалённую работу или автономную роль',
          'Используйте асинхронное общение (письма, сообщения)',
          'Планируйте минимально необходимые социальные контакты',
          'Рассмотрите консультацию психолога для баланса',
        ],
        'en': [
          'Definitely maintain at least 2-3 close connections',
          'Find remote work or autonomous role',
          'Use asynchronous communication (emails, messages)',
          'Plan minimally necessary social contacts',
          'Consider therapy for balance',
        ],
      },
      tryToday: {
        'ru': 'Отправьте голосовое сообщение близкому человеку вместо текста.',
        'en': 'Send a voice message to a close person instead of text.',
      },
      inspiringConclusion: {
        'ru': 'Ваша глубина — редкий дар. Не теряйте связь с миром, оставаясь верным себе.',
        'en': 'Your depth is a rare gift. Don\'t lose connection with the world while staying true to yourself.',
      },
    ),
  };
}
