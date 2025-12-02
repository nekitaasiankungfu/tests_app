import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Money Mindset & Financial Habits Test Data
///
/// Contains 24 questions measuring 5 scales of financial behavior patterns:
/// - Impulsive Spending (Q1-5, reversed: Q5)
/// - Financial Avoidance & Chaos (Q6-10, reversed: Q9)
/// - Rigid Control & Financial Tightness (Q11-15, reversed: Q15)
/// - Fear of Poverty & Ruin (Q16-19, reversed: Q19)
/// - Money Shame & Self-Worth (Q20-24, reversed: Q24)
///
/// Profile is determined by composite money_mindset_risk_index (0-100%)
class MoneyMindsetHabitsData {
  static TestModel getTestData() {
    return TestModel(
      id: 'money_mindset_habits_v1',
      title: {
        'ru': 'Отношение к деньгам и финансовые привычки',
        'en': 'Money Mindset & Financial Habits',
      },
      description: {
        'ru':
            'Тест помогает понять, как вы обращаетесь с деньгами: склонны ли к импульсивным тратам, избеганию финансовых тем, жёсткому контролю, страху бедности и стыду за деньги.',
        'en':
            'This test helps you understand how you relate to money: whether you tend toward impulsive spending, avoiding financial topics, rigid control, fear of poverty, and money shame.',
      },
      category: {
        'ru': 'Карьера и финансы',
        'en': 'Career & Finance',
      },
      categoryId: 'career',
      questions: _buildQuestions(),
      estimatedTime: 7,
      type: TestType.multiFactor,
      factorIds: [
        'impulsive_spending',
        'financial_avoidance',
        'control_strictness',
        'poverty_fear',
        'money_shame',
      ],
      disclaimer: _disclaimer,
    );
  }

  static final Map<String, String> _disclaimer = {
    'ru':
        'Этот тест помогает осознать свои финансовые привычки и установки, но не заменяет консультацию с финансовым специалистом или психологом. Если вы испытываете серьёзные сложности с управлением деньгами, рекомендуем обратиться к профессионалу.',
    'en':
        'This test helps you become aware of your financial habits and beliefs, but does not replace consultation with a financial specialist or psychologist. If you are experiencing serious difficulties with money management, we recommend seeking professional help.',
  };

  static List<QuestionModel> _buildQuestions() {
    return [
      // Impulsive Spending (Q1-5)
      QuestionModel(
        id: 'q1',
        text: {
          'ru':
              'Я часто покупаю что-то просто потому, что увидел(а) скидку или рекламу, хотя заранее этого не планировал(а).',
          'en':
              'I often buy something just because I saw a discount or an ad, even though I hadn\'t planned it before.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsive_spending',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru':
              'Я регулярно добавляю вещи в корзину в приложениях и совершаю покупки «по приколу», а не по необходимости.',
          'en':
              'I regularly add things to my cart in apps and buy them \'for fun\' rather than out of necessity.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsive_spending',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru':
              'Когда мне плохо или скучно, я часто поднимаю себе настроение покупками.',
          'en':
              'When I feel bad or bored, I often cheer myself up by buying things.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsive_spending',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru':
              'Если на карте есть деньги, я часто трачу до почти нулевого остатка.',
          'en':
              'If there is money on my card, I often spend until the balance is almost zero.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsive_spending',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru':
              'Перед непланированной покупкой я обычно несколько раз обдумываю, действительно ли она мне нужна.',
          'en':
              'Before making an unplanned purchase, I usually think several times about whether I really need it.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'impulsive_spending',
        isReversed: true,
      ),

      // Financial Avoidance (Q6-10)
      QuestionModel(
        id: 'q6',
        text: {
          'ru':
              'Я откладываю «на потом» разбор финансовых дел (счета, долги, платежи), потому что это неприятно.',
          'en':
              'I put off dealing with financial stuff (bills, debts, payments) because it feels unpleasant.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'financial_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru':
              'Просматривать историю трат или выписки по счёту для меня так тревожно, что я стараюсь этого не делать.',
          'en':
              'Looking at my spending history or account statements makes me so anxious that I try to avoid it.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'financial_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru':
              'Я часто не представляю точно, сколько денег у меня сейчас есть.',
          'en': 'I often don\'t really know how much money I have right now.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'financial_avoidance',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q9',
        text: {
          'ru':
              'Я спокойно проверяю свои финансовые приложения и понимаю, куда уходят мои деньги.',
          'en':
              'I calmly check my financial apps and understand where my money goes.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'financial_avoidance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru':
              'Я предпочитаю вообще не обсуждать тему денег, даже с близкими людьми.',
          'en':
              'I prefer not to talk about money at all, even with close people.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'financial_avoidance',
        isReversed: false,
      ),

      // Control Strictness (Q11-15)
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'Мне становится напряжённо, когда кто-то предлагает спонтанные траты (походы куда-то, заказы, развлечения).',
          'en':
              'I feel tense when someone suggests spontaneous spending (going out, ordering things, fun activities).',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'control_strictness',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru':
              'Я чувствую вину, если трачу деньги на «приятные мелочи», а не только на полезное и необходимое.',
          'en':
              'I feel guilty if I spend money on \'nice little things\' instead of only on useful or necessary stuff.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'control_strictness',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru':
              'Я подробно отслеживаю свои расходы и редко позволяю себе отклоняться от плана.',
          'en':
              'I track my expenses in detail and rarely let myself deviate from the plan.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'control_strictness',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru':
              'Друзья или близкие иногда считают, что я слишком зажат(а) в теме денег.',
          'en':
              'Friends or loved ones sometimes say I\'m too uptight about money.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'control_strictness',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru':
              'Иногда я могу позволить себе спонтанную покупку просто потому, что очень этого хочу, даже если это не самое рациональное решение.',
          'en':
              'Sometimes I can allow myself a spontaneous purchase just because I really want it, even if it\'s not the most rational decision.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'control_strictness',
        isReversed: true,
      ),

      // Poverty Fear (Q16-19)
      QuestionModel(
        id: 'q16',
        text: {
          'ru':
              'Даже когда с деньгами всё более-менее нормально, я переживаю, что вдруг останусь ни с чем.',
          'en':
              'Even when my finances are more or less okay, I still worry that I might suddenly end up with nothing.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'poverty_fear',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru':
              'Мысли о возможной бедности или сильной нехватке денег меня пугают.',
          'en':
              'Thoughts about possible poverty or severe lack of money scare me.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'poverty_fear',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru':
              'Я часто прокручиваю в голове худшие финансовые сценарии, даже если пока для этого нет явных причин.',
          'en':
              'I often play out worst-case financial scenarios in my head, even when there\'s no clear reason yet.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'poverty_fear',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru':
              'Я верю, что даже если обстоятельства изменятся, я смогу со временем найти способы зарабатывать и адаптироваться.',
          'en':
              'I believe that even if circumstances change, I\'ll eventually be able to find ways to earn and adapt.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'poverty_fear',
        isReversed: true,
      ),

      // Money Shame (Q20-24)
      QuestionModel(
        id: 'q20',
        text: {
          'ru':
              'Когда я сравниваю себя с другими, мне бывает стыдно за то, как я обращаюсь с деньгами.',
          'en':
              'When I compare myself to others, I sometimes feel ashamed of how I handle money.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'money_shame',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru':
              'Я избегаю говорить людям, сколько зарабатываю или трачу, чтобы меня не осуждали.',
          'en':
              'I avoid telling people how much I earn or spend so they don\'t judge me.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'money_shame',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru':
              'Когда у меня больше денег, чем у кого-то из окружения, я чувствую вину или неловкость.',
          'en':
              'When I have more money than some people around me, I feel guilty or uncomfortable.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'money_shame',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru':
              'Когда у меня меньше денег, чем у других, я чувствую себя менее успешным(ой) и «хуже других».',
          'en':
              'When I have less money than others, I feel less successful and \'not as good\' as they are.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'money_shame',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru':
              'Я могу обсуждать тему денег, не чувствуя, что со мной что-то не так.',
          'en':
              'I can talk about money without feeling that there is something wrong with me.',
        },
        answers: _buildFrequencyAnswers(),
        factorId: 'money_shame',
        isReversed: true,
      ),
    ];
  }

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
        text: {'ru': 'Всегда', 'en': 'Always'},
        score: 4,
      ),
    ];
  }

  /// Determines profile based on composite money_mindset_risk_index
  /// Returns profile ID based on average of 5 normalized scales
  static String determineProfile(Map<String, double> percentages) {
    // Calculate composite index as average of 5 scales
    final impulsiveSpending = percentages['impulsive_spending'] ?? 0.0;
    final financialAvoidance = percentages['financial_avoidance'] ?? 0.0;
    final controlStrictness = percentages['control_strictness'] ?? 0.0;
    final povertyFear = percentages['poverty_fear'] ?? 0.0;
    final moneyShame = percentages['money_shame'] ?? 0.0;

    final compositeIndex =
        (impulsiveSpending + financialAvoidance + controlStrictness + povertyFear + moneyShame) / 5;

    // Thresholds: 0-24 = low, 25-49 = moderate, 50-74 = elevated, 75-100 = high
    if (compositeIndex < 25) {
      return 'low_risk';
    } else if (compositeIndex < 50) {
      return 'moderate_risk';
    } else if (compositeIndex < 75) {
      return 'elevated_risk';
    } else {
      return 'high_risk';
    }
  }

  /// Returns factor names in both languages
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'impulsive_spending': {
        'ru': 'Импульсивные траты',
        'en': 'Impulsive Spending',
      },
      'financial_avoidance': {
        'ru': 'Финансовое избегание и хаос',
        'en': 'Financial Avoidance & Chaos',
      },
      'control_strictness': {
        'ru': 'Жёсткий контроль и финансовая зажатость',
        'en': 'Rigid Control & Financial Tightness',
      },
      'poverty_fear': {
        'ru': 'Страх бедности и обнуления',
        'en': 'Fear of Poverty & Ruin',
      },
      'money_shame': {
        'ru': 'Стыд и самооценка, связанные с деньгами',
        'en': 'Money Shame & Self-Worth',
      },
    };
  }

  /// Returns interpretation for a specific factor based on percentage
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    if (factorId == 'impulsive_spending') {
      if (percentage < 30) {
        return {
          'ru': 'Вы контролируете свои спонтанные покупки и редко тратите импульсивно.',
          'en': 'You control your spontaneous purchases and rarely spend impulsively.',
        };
      } else if (percentage < 60) {
        return {
          'ru': 'Иногда вы совершаете импульсивные покупки под влиянием эмоций или рекламы.',
          'en': 'Sometimes you make impulse purchases under the influence of emotions or ads.',
        };
      } else {
        return {
          'ru': 'Импульсивные траты — частая проблема. Вы склонны покупать спонтанно, не планируя заранее.',
          'en': 'Impulsive spending is a frequent issue. You tend to buy spontaneously without planning ahead.',
        };
      }
    } else if (factorId == 'financial_avoidance') {
      if (percentage < 30) {
        return {
          'ru': 'Вы ответственно относитесь к финансам и не избегаете разговоров о деньгах.',
          'en': 'You are responsible with finances and don\'t avoid money talk.',
        };
      } else if (percentage < 60) {
        return {
          'ru': 'Иногда вы откладываете разбор финансовых дел или избегаете неприятных финансовых тем.',
          'en': 'Sometimes you postpone dealing with financial matters or avoid unpleasant money topics.',
        };
      } else {
        return {
          'ru': 'Вы часто избегаете финансовых разговоров и плохо понимаете своё финансовое положение.',
          'en': 'You often avoid financial discussions and have poor awareness of your financial situation.',
        };
      }
    } else if (factorId == 'control_strictness') {
      if (percentage < 30) {
        return {
          'ru': 'Вы умеете балансировать контроль и удовольствия, позволяя себе тратить без лишней вины.',
          'en': 'You balance control and pleasures, allowing yourself to spend without excessive guilt.',
        };
      } else if (percentage < 60) {
        return {
          'ru': 'Вы периодически чувствуете вину за траты на удовольствия или контролируете деньги слишком жёстко.',
          'en': 'You occasionally feel guilty about spending on pleasures or control money too tightly.',
        };
      } else {
        return {
          'ru': 'Жёсткий контроль расходов мешает вам наслаждаться жизнью. Вы часто чувствуете вину за любые траты.',
          'en': 'Rigid expense control prevents you from enjoying life. You often feel guilty about any spending.',
        };
      }
    } else if (factorId == 'poverty_fear') {
      if (percentage < 30) {
        return {
          'ru': 'Вы спокойны в теме денег и верите в свою способность адаптироваться к изменениям.',
          'en': 'You are calm about money and believe in your ability to adapt to changes.',
        };
      } else if (percentage < 60) {
        return {
          'ru': 'Иногда вас беспокоят мысли о финансовой нестабильности или возможной бедности.',
          'en': 'Sometimes you worry about financial instability or possible poverty.',
        };
      } else {
        return {
          'ru': 'Страх бедности сильно влияет на вашу жизнь. Вы часто прокручиваете худшие финансовые сценарии.',
          'en': 'Fear of poverty strongly affects your life. You often imagine worst-case financial scenarios.',
        };
      }
    } else if (factorId == 'money_shame') {
      if (percentage < 30) {
        return {
          'ru': 'Вы не связываете свою самооценку с деньгами и можете спокойно обсуждать финансовые темы.',
          'en': 'You don\'t tie your self-worth to money and can calmly discuss financial topics.',
        };
      } else if (percentage < 60) {
        return {
          'ru': 'Иногда деньги вызывают у вас чувство стыда или сравнения с другими.',
          'en': 'Sometimes money triggers feelings of shame or comparisons with others.',
        };
      } else {
        return {
          'ru': 'Стыд и чувство неполноценности сильно связаны с темой денег. Вы часто сравниваете себя с другими.',
          'en': 'Shame and inadequacy are strongly tied to money. You frequently compare yourself to others.',
        };
      }
    }

    return {
      'ru': 'Нет интерпретации для данной шкалы.',
      'en': 'No interpretation available for this scale.',
    };
  }

  /// Returns the full profile for the given profile ID
  static TestProfile? getProfile(String profileId) {
    try {
      return _profiles.firstWhere((p) => p.id == profileId);
    } catch (e) {
      return null;
    }
  }

  /// All available profiles for this test
  static final List<TestProfile> _profiles = [
    TestProfile(
      id: 'low_risk',
      name: {
        'ru': 'Здоровое и гибкое отношение к деньгам',
        'en': 'Healthy & Flexible Money Mindset',
      },
      description: {
        'ru':
            'Ваш индекс показывает, что у вас в целом здоровое, гибкое отношение к деньгам. Вы не идеальны (и это нормально), но в теме денег вы чаще партнёр себе, а не враг. Вы способны заметить, когда хочется «залить эмоции» покупками, когда тревожно смотреть на баланс, и при этом не полностью уходите ни в хаос, ни в жёсткий контроль.',
        'en':
            'Your index suggests that you have a generally healthy, flexible attitude toward money. You\'re not perfect (and don\'t need to be), but when it comes to money you are more of an ally to yourself than an enemy. You can notice when you want to \'soothe emotions\' with purchases or feel anxious checking your balance, yet you don\'t fully drift into either chaos or rigid control.',
      },
      whyThisProfile: {
        'ru':
            'Вы достаточно осознанно обращаетесь с деньгами: импульсивные траты и страхи есть, но не управляют вашей жизнью. Скорее всего, вы хотя бы примерно понимаете, сколько зарабатываете, тратите и копите, можете обсуждать деньги без сильного стыда и разрешаете себе удовольствия, не разрушая базовую финансовую стабильность.',
        'en':
            'You handle money fairly consciously: impulsive spending and fears may appear, but they don\'t run your life. Most likely, you have at least a rough sense of what you earn, spend, and save, you can talk about money without intense shame, and you allow yourself pleasures without destroying your basic financial stability.',
      },
      strengths: {
        'ru': [
          '✓ Способность к осознанным финансовым решениям',
          '✓ Отсутствие сильного стыда в теме денег',
          '✓ Гибкость между контролем и спонтанностью',
          '✓ Базовое понимание своего финансового состояния',
          '✓ Возможность говорить о деньгах открыто',
        ],
        'en': [
          '✓ Capacity for conscious financial decisions',
          '✓ Absence of strong shame about money',
          '✓ Flexibility between control and spontaneity',
          '✓ Basic understanding of your financial situation',
          '✓ Ability to talk about money openly',
        ],
      },
      vulnerabilities: {
        'ru': [
          '• Небольшие импульсивные покупки всё же случаются',
          '• Периодическая тревога при проверке баланса',
          '• Возможность «расслабиться» и потерять контроль',
        ],
        'en': [
          '• Small impulse purchases still happen occasionally',
          '• Periodic anxiety when checking balance',
          '• Risk of becoming too relaxed and losing track',
        ],
      },
      recommendations: {
        'ru': [
          '→ Продолжайте опираться на уже сформировавшиеся здоровые привычки: базовый учёт трат, разумное планирование, право на удовольствия.',
          '→ Отмечайте, какие решения с деньгами делают вашу жизнь спокойнее, а какие добавляют лишнего стресса.',
          '→ Используйте свой ресурс, чтобы аккуратно поддержать друзей, которые сейчас в более хаотичном состоянии с финансами, не беря на себя роль «спасателя».',
        ],
        'en': [
          '→ Keep building on your existing healthy habits: basic tracking of expenses, reasonable planning, and allowing yourself pleasures.',
          '→ Notice which money decisions make your life calmer and which ones add unnecessary stress.',
          '→ Use your strengths to gently support friends who are more chaotic with money, without taking on a \'rescuer\' role.',
        ],
      },
      tryToday: {
        'ru':
            '💡 Попробуйте сегодня: Отметьте одно финансовое решение, которым вы гордитесь на этой неделе. Позвольте себе признать, что вы справляетесь.',
        'en':
            '💡 Try today: Note one financial decision you\'re proud of this week. Allow yourself to acknowledge that you\'re doing well.',
      },
      inspiringConclusion: {
        'ru':
            'Ваши результаты показывают, что вы на правильном пути. Продолжайте развивать свои сильные стороны и помните: идеальных людей не бывает, важно просто двигаться в сторону большей осознанности.',
        'en':
            'Your results show you\'re on the right track. Keep developing your strengths and remember: nobody is perfect, what matters is moving toward greater awareness.',
      },
    ),
    TestProfile(
      id: 'moderate_risk',
      name: {
        'ru': 'Умеренное напряжение в теме денег',
        'en': 'Moderate Money Tension',
      },
      description: {
        'ru':
            'Ваш результат говорит о том, что в теме денег вы периодически качаетесь между «живу одним днём» и «надо всё контролировать». В одних ситуациях вы действуете очень разумно и осознанно, в других — можете уходить в импульсивные покупки, откладывание финансовых дел, тревогу или чувство вины за любые траты «для себя».',
        'en':
            'Your score shows that around money you sometimes swing between \'living for today\' and \'everything must be controlled\'. In some situations you act reasonably and consciously; in others you may slide into impulse buying, putting off financial tasks, anxiety, or guilt over any spending \'just for yourself\'.',
      },
      whyThisProfile: {
        'ru':
            'У вас есть смесь здоровых привычек и паттернов, которые периодически мешают: то импульсивные траты, то избегание, то лишний контроль. Такой уровень характерен для многих людей: деньги — эмоциональная тема, и старые семейные сценарии, соцсети и давление окружения легко раскачивают внутренние настройки.',
        'en':
            'You have a mix of healthy habits and patterns that sometimes get in the way: impulse spending, avoidance, or extra control. This level is common: money is an emotional topic, and old family patterns, social media, and peer pressure can easily shake your inner settings.',
      },
      strengths: {
        'ru': [
          '✓ В некоторых ситуациях действуете очень осознанно',
          '✓ Способность распознавать проблемные паттерны',
          '✓ Готовность признать свои слабости',
          '✓ Понимание, что деньги — эмоциональная тема',
        ],
        'en': [
          '✓ In some situations you act very consciously',
          '✓ Ability to recognize problematic patterns',
          '✓ Willingness to admit your weaknesses',
          '✓ Understanding that money is an emotional topic',
        ],
      },
      vulnerabilities: {
        'ru': [
          '• Качание между хаосом и гиперконтролем',
          '• Импульсивные покупки под влиянием эмоций',
          '• Избегание финансовых разговоров и планирования',
          '• Чувство вины за траты «для себя»',
          '• Влияние социального сравнения',
        ],
        'en': [
          '• Swinging between chaos and hyper-control',
          '• Impulse purchases driven by emotions',
          '• Avoiding financial conversations and planning',
          '• Guilt over spending \'on yourself\'',
          '• Influence of social comparison',
        ],
      },
      recommendations: {
        'ru': [
          '→ Выберите одну зону фокуса на ближайший месяц: либо импульсивные траты, либо избегание финансов, либо жёсткий контроль.',
          '→ Ведите простой трекер: какие решения с деньгами вызывают больше всего сожаления или стресса — это покажет главные точки роста.',
          '→ Попробуйте привычку «пауз перед действием»: небольшая остановка перед покупкой или финансовым решением, чтобы задать себе вопрос «я сейчас заботюсь о себе или бегу от чувства?».',
        ],
        'en': [
          '→ Choose one focus area for the next month: impulsive spending, financial avoidance, or rigid control.',
          '→ Keep a simple log: which money decisions cause the most regret or stress — this will highlight your key growth points.',
          '→ Try a \'pause before action\' habit: a brief stop before a purchase or financial decision to ask yourself, \'Am I caring for myself right now or running away from a feeling?\'.',
        ],
      },
      tryToday: {
        'ru':
            '💡 Попробуйте сегодня: Перед следующей покупкой сделайте паузу на 10 минут. Спросите себя: «Это про заботу или про бегство от чувства?»',
        'en':
            '💡 Try today: Before your next purchase, pause for 10 minutes. Ask yourself: \"Is this about care or running from a feeling?\"',
      },
      inspiringConclusion: {
        'ru':
            'Не ругайте себя за «неидеальность» — важно просто заметить, какие паттерны чаще всего срабатывают у вас. С осознанностью и практикой вы сможете сделать шаг к более здоровым финансовым привычкам.',
        'en':
            'Don\'t blame yourself for being \'imperfect\' — it\'s important simply to notice which patterns show up most often. With awareness and practice, you can take steps toward healthier financial habits.',
      },
    ),
    TestProfile(
      id: 'elevated_risk',
      name: {
        'ru': 'Выраженные сложности с финансовыми привычками',
        'en': 'Pronounced Difficulties with Financial Habits',
      },
      description: {
        'ru':
            'Ваш индекс указывает на выраженные сложности в теме денег. Это может проявляться в виде частых импульсивных трат, избегания любого финансового учёта, жёсткого контроля, который не даёт нормально жить, или постоянного страха и стыда вокруг денег.',
        'en':
            'Your index suggests notable difficulties in your money life. This may show up as frequent impulse purchases, avoiding any kind of financial tracking, rigid control that makes life feel tight, or constant fear and shame around money.',
      },
      whyThisProfile: {
        'ru':
            'Похоже, ваши установки и привычки вокруг денег заметно мешают вам чувствовать стабильность и спокойствие. Важно понимать, что такие паттерны обычно формируются не случайно: за ними стоят прошлый опыт, семейные сценарии, социальное давление и способы справляться с тревогой.',
        'en':
            'It seems your money beliefs and habits significantly interfere with feeling financially stable and calm. These patterns usually don\'t appear by accident: they are rooted in past experiences, family scripts, social pressure, and ways of coping with anxiety.',
      },
      strengths: {
        'ru': [
          '✓ Осознание проблемы — первый шаг к изменениям',
          '✓ Готовность признать свои сложности',
          '✓ Способность пройти тест до конца',
          '✓ Желание разобраться в своих финансовых привычках',
        ],
        'en': [
          '✓ Awareness of the problem is the first step',
          '✓ Willingness to acknowledge your difficulties',
          '✓ Ability to complete the test',
          '✓ Desire to understand your financial habits',
        ],
      },
      vulnerabilities: {
        'ru': [
          '• Частые импульсивные траты без планирования',
          '• Полное избегание финансового учёта',
          '• Жёсткий контроль, который мешает жить',
          '• Постоянный страх бедности и обнуления',
          '• Сильный стыд, связанный с деньгами',
          '• Связь самооценки с суммой на счету',
        ],
        'en': [
          '• Frequent impulse purchases without planning',
          '• Complete avoidance of financial tracking',
          '• Rigid control that interferes with living',
          '• Constant fear of poverty and ruin',
          '• Strong shame tied to money',
          '• Self-worth linked to account balance',
        ],
      },
      recommendations: {
        'ru': [
          '→ Начните с малого: выберите одну конкретную привычку (например, ночные заказы, игнорирование баланса или тотальный контроль) и поэкспериментируйте с более мягкой альтернативой.',
          '→ Создайте минимальный, но понятный финансовый ритуал: раз в неделю 10–15 минут спокойно смотреть на доходы/расходы без самообвинений.',
          '→ Подумайте о том, чтобы обсудить тему денег с нейтральным человеком (друг, наставник, специалист), который не будет вас стыдить, а поможет увидеть картину объёмнее.',
        ],
        'en': [
          '→ Start small: pick one specific habit (late-night orders, ignoring your balance, or total control) and experiment with a softer alternative.',
          '→ Create a minimal but clear money ritual: once a week, spend 10–15 minutes calmly looking at income/expenses without self-blame.',
          '→ Consider talking about money with a neutral person (friend, mentor, professional) who won\'t shame you but will help you see the bigger picture.',
        ],
      },
      tryToday: {
        'ru':
            '💡 Попробуйте сегодня: Выделите 10 минут, чтобы просто посмотреть на свой банковский баланс без осуждения. Просто посмотрите и скажите себе: «Я вижу цифры. Это не про мою ценность».',
        'en':
            '💡 Try today: Set aside 10 minutes to simply look at your bank balance without judgment. Just look and tell yourself: \"I see the numbers. This is not about my worth.\"',
      },
      inspiringConclusion: {
        'ru':
            'Это не про «я безответственный/жадный человек», а про то, что ваша психика пока выбрала такие стратегии выживания. С поддержкой и практикой вы сможете найти более здоровые способы обращаться с деньгами.',
        'en':
            'This isn\'t about \'I am irresponsible/greedy\' as a personality label, but about the strategies your mind has adopted to get by so far. With support and practice, you can find healthier ways to relate to money.',
      },
    ),
    TestProfile(
      id: 'high_risk',
      name: {
        'ru': 'Высокий риск самоподрыва в теме денег',
        'en': 'High Risk of Self-Sabotage with Money',
      },
      description: {
        'ru':
            'Ваш профиль показывает высокий риск самоподрыва в финансовой сфере. Возможно, вы делаете много импульсивных трат, избегаете смотреть на реальную картину, живёте в постоянном страхе бедности или держите деньги под таким жёстким контролем, что это мешает наслаждаться жизнью. Тема денег может быть тесно связана с ощущением «я недостаточно хороший(ая)».',
        'en':
            'Your profile shows a high risk of self-sabotage in the financial domain. You may be making many impulse purchases, avoiding the real numbers, living in constant fear of poverty, or keeping such rigid control that it spoils your ability to enjoy life. Money may be tightly tied to feelings of \'I\'m not good enough\'.',
      },
      whyThisProfile: {
        'ru':
            'Судя по результатам, деньги сейчас — один из главных источников стресса, тревоги и самокритики. Это не приговор и не повод стыдиться. Такой результат часто означает, что вам долго приходилось справляться с финансовым стрессом в одиночку или с не самой здоровой поддержкой.',
        'en':
            'Your results suggest that money is currently one of the main sources of stress, anxiety, and self-criticism. This is not a verdict and not something to be ashamed of. It often means you\'ve had to deal with financial stress alone or with unhelpful support for a long time.',
      },
      strengths: {
        'ru': [
          '✓ Мужество признать серьёзные сложности',
          '✓ Готовность пройти тест честно',
          '✓ Осознание того, что что-то нужно менять',
          '✓ Способность выживать в сложных условиях',
        ],
        'en': [
          '✓ Courage to admit serious difficulties',
          '✓ Willingness to take the test honestly',
          '✓ Awareness that something needs to change',
          '✓ Ability to survive in difficult conditions',
        ],
      },
      vulnerabilities: {
        'ru': [
          '• Многочисленные импульсивные траты',
          '• Полное избегание реальной финансовой картины',
          '• Постоянный страх бедности и обнуления',
          '• Жёсткий контроль, который не даёт жить',
          '• Сильная связь самооценки с деньгами',
          '• Стыд и чувство неполноценности',
          '• Социальное сравнение как источник боли',
        ],
        'en': [
          '• Numerous impulse purchases',
          '• Complete avoidance of real financial picture',
          '• Constant fear of poverty and ruin',
          '• Rigid control that prevents living',
          '• Strong tie between self-worth and money',
          '• Shame and feelings of inadequacy',
          '• Social comparison as source of pain',
        ],
      },
      recommendations: {
        'ru': [
          '→ Постарайтесь не оставаться с этим в одиночестве: подумайте о поддержке специалиста (финансовый психолог, психотерапевт) или хотя бы одного человека, с которым можно безопасно обсудить деньги.',
          '→ Начните с самого мягкого шага: просто фиксировать ключевые траты или состояния («хочу купить, потому что…») без попытки всё сразу изменить.',
          '→ Отделяйте свою ценность как человека от суммы на счету или размеров трат: запишите себе напоминание, что деньги — ресурс, а не оценка вашей личности.',
        ],
        'en': [
          '→ Try not to stay alone with this: consider getting support from a professional (financial psychologist, therapist) or at least one person with whom you can safely talk about money.',
          '→ Start with the gentlest step: simply log key expenses or states (\'I want to buy because…\') without trying to change everything at once.',
          '→ Separate your worth as a person from the amount in your account or how much you spend: write yourself a reminder that money is a resource, not a measure of who you are.',
        ],
      },
      tryToday: {
        'ru':
            '💡 Попробуйте сегодня: Напишите на листочке: «Деньги — это ресурс, а не моя ценность». Повесьте на видное место и перечитывайте каждый день.',
        'en':
            '💡 Try today: Write on a piece of paper: \"Money is a resource, not my worth.\" Put it somewhere visible and reread it daily.',
      },
      inspiringConclusion: {
        'ru':
            'Ваши реакции — это, по сути, старые способы выживания, которые сейчас начинают слишком дорого обходиться. С поддержкой и практикой вы сможете найти новые, более здоровые пути обращения с деньгами.',
        'en':
            'Your reactions are survival strategies that once helped but now cost you too much. With support and practice, you can find new, healthier ways to relate to money.',
      },
    ),
  ];
}
