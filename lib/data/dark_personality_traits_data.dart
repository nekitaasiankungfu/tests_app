import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data access class for Dark Personality Traits Test
/// Legacy Dart implementation (no JSON dependency)
class DarkPersonalityTraitsData {
  /// Get the complete Dark Personality Traits test
  static TestModel getDarkPersonalityTraitsTest() {
    return TestModel(
      id: 'dark_personality_traits',
      title: {
        'ru': 'Тест «Тёмная сторона личности»',
        'en': 'Dark Personality Traits Test',
      },
      description: {
        'ru':
            'Этот тест измеряет три «тёмные» черты личности, известные как Dark Triad: макиавеллизм (склонность к стратегическим манипуляциям), нарциссизм (завышенная самооценка и потребность в восхищении) и субклиническая психопатия (сниженная эмпатия и импульсивность).\n\n'
            '⚠️ ВАЖНО: это НЕ клиническая диагностика и НЕ говорит о том, что вы «плохой человек». Все мы имеем эти черты в разной степени — они могут быть даже адаптивными в определённых ситуациях.\n\n'
            'Например, умеренный макиавеллизм помогает в переговорах и бизнесе, здоровый нарциссизм даёт уверенность и амбиции, а некоторая психопатическая холодность позволяет принимать рациональные решения под давлением. Проблемы возникают только при крайне высоких показателях.\n\n'
            'Этот тест создан для саморефлексии и понимания своих теневых сторон. Он не заменяет профессиональную психологическую оценку.',
        'en':
            'This test measures three dark personality traits known as Dark Triad: Machiavellianism (tendency toward strategic manipulation), narcissism (inflated self-esteem and need for admiration), and subclinical psychopathy (reduced empathy and impulsivity).\n\n'
            '⚠️ IMPORTANT: this is NOT clinical diagnosis and does NOT mean you\'re a "bad person". We all have these traits to varying degrees — they can even be adaptive in certain situations.\n\n'
            'For example, moderate Machiavellianism helps in negotiations and business, healthy narcissism provides confidence and ambition, and some psychopathic coldness allows rational decision-making under pressure. Problems arise only at extremely high levels.\n\n'
            'This test is created for self-reflection and understanding your shadow sides. It does not replace professional psychological assessment.',
      },
      category: {
        'ru': 'Личность',
        'en': 'Personality',
      },
      categoryId: 'personality',
      disclaimer: {
        'ru':
            '❗ ЭТО НЕ КЛИНИЧЕСКИЙ ДИАГНОЗ. Тест предназначен только для саморефлексии. Наличие тёмных черт не делает вас плохим человеком. Умеренные уровни могут быть адаптивными. При беспокойстве обратитесь к психологу. Не используйте результаты для самостигматизации.',
        'en':
            '❗ THIS IS NOT CLINICAL DIAGNOSIS. Test is for self-reflection only. Having dark traits doesn\'t make you a bad person. Moderate levels can be adaptive. If concerned, consult a psychologist. Don\'t use results for self-stigmatization.',
      },
      estimatedTime: 7,
      type: TestType.multiFactor,
      factorIds: ['machiavellianism', 'narcissism', 'psychopathy'],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'machiavellianism': {
        'ru': 'Макиавеллизм 🎭',
        'en': 'Machiavellianism 🎭',
      },
      'narcissism': {
        'ru': 'Нарциссизм 👑',
        'en': 'Narcissism 👑',
      },
      'psychopathy': {
        'ru': 'Субклиническая психопатия 🧊',
        'en': 'Subclinical Psychopathy 🧊',
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

    // Determine range: 0-35 (low), 36-65 (moderate), 66-100 (high)
    final String level;
    if (percentage <= 35) {
      level = 'low';
    } else if (percentage <= 65) {
      level = 'moderate';
    } else {
      level = 'high';
    }

    switch (factorId) {
      case 'machiavellianism':
        return _getMachiavellianismInterpretation(level);
      case 'narcissism':
        return _getNarcissismInterpretation(level);
      case 'psychopathy':
        return _getPsychopathyInterpretation(level);
      default:
        return {
          'ru': 'Интерпретация недоступна',
          'en': 'Interpretation unavailable',
        };
    }
  }

  static Map<String, String> _getMachiavellianismInterpretation(String level) {
    switch (level) {
      case 'low':
        return {
          'ru':
              'НИЗКИЙ (0-35%): Вы предпочитаете честность и прямоту в отношениях. Вы не склонны к манипуляциям и стратегическому обману. Это хорошо для доверительных отношений, но может делать вас более уязвимым в конкурентных ситуациях. Совет: иногда немного стратегического мышления может помочь в переговорах и защите своих интересов.',
          'en':
              'LOW (0-35%): You prefer honesty and straightforwardness in relationships. You\'re not inclined toward manipulation and strategic deception. This is good for trusting relationships but may make you more vulnerable in competitive situations. Tip: sometimes a bit of strategic thinking can help in negotiations and protecting your interests.',
        };
      case 'moderate':
        return {
          'ru':
              'УМЕРЕННЫЙ (36-65%): У вас сбалансированный подход: вы можете быть стратегическим, когда нужно, но не теряете этических ориентиров. Вы понимаете, что иногда нужна дипломатия, но не переходите к циничным манипуляциям. Этот уровень может быть адаптивным: помогает в бизнесе, переговорах, политике без вреда для отношений.',
          'en':
              'MODERATE (36-65%): You have a balanced approach: you can be strategic when needed but don\'t lose ethical guidelines. You understand sometimes diplomacy is needed but don\'t resort to cynical manipulation. This level can be adaptive: helps in business, negotiations, politics without harming relationships.',
        };
      case 'high':
        return {
          'ru':
              'ВЫСОКИЙ (66-100%): Вы склонны к стратегическому манипулированию и циничному взгляду на отношения. Для вас цель часто оправдывает средства. Это может помогать достигать краткосрочных целей, но вредит глубоким отношениям и доверию. ⚠️ Если вы замечаете, что окружающие не доверяют вам или отношения поверхностны, возможно, стоит поработать над большей искренностью.',
          'en':
              'HIGH (66-100%): You\'re inclined toward strategic manipulation and cynical view of relationships. For you, the end often justifies the means. This may help achieve short-term goals but harms deep relationships and trust. ⚠️ If you notice people don\'t trust you or relationships are superficial, you might want to work on more sincerity.',
        };
      default:
        return {'ru': 'Неизвестный уровень', 'en': 'Unknown level'};
    }
  }

  static Map<String, String> _getNarcissismInterpretation(String level) {
    switch (level) {
      case 'low':
        return {
          'ru':
              'НИЗКИЙ (0-35%): У вас скромная самооценка, вы не ищете постоянного восхищения и не считаете себя особенным. Это может быть как здоровой скромностью, так и заниженной самооценкой. Совет: немного здорового нарциссизма полезно для уверенности в себе и амбиций. Не бойтесь признавать свои достижения.',
          'en':
              'LOW (0-35%): You have modest self-esteem, don\'t seek constant admiration, and don\'t consider yourself special. This can be either healthy modesty or low self-esteem. Tip: a bit of healthy narcissism is useful for self-confidence and ambition. Don\'t be afraid to acknowledge your achievements.',
        };
      case 'moderate':
        return {
          'ru':
              'УМЕРЕННЫЙ (36-65%): У вас здоровая самооценка и уверенность в себе. Вам нравится признание, но вы не зависите от постоянного восхищения. Вы амбициозны, но не высокомерны. Это оптимальный уровень: даёт уверенность, мотивацию и лидерские качества без вреда для отношений.',
          'en':
              'MODERATE (36-65%): You have healthy self-esteem and self-confidence. You enjoy recognition but don\'t depend on constant admiration. You\'re ambitious but not arrogant. This is optimal level: provides confidence, motivation, and leadership without harming relationships.',
        };
      case 'high':
        return {
          'ru':
              'ВЫСОКИЙ (66-100%): Вы считаете себя особенным и требуете постоянного восхищения. Вам нужно быть в центре внимания, и вы можете игнорировать потребности других. Это может вредить близким отношениям. ⚠️ Если окружающие считают вас эгоцентричным или вам трудно поддерживать глубокие отношения, стоит поработать над эмпатией.',
          'en':
              'HIGH (66-100%): You consider yourself special and demand constant admiration. You need to be center of attention and may ignore others\' needs. This can harm close relationships. ⚠️ If people find you self-centered or you struggle maintaining deep relationships, consider working on empathy.',
        };
      default:
        return {'ru': 'Неизвестный уровень', 'en': 'Unknown level'};
    }
  }

  static Map<String, String> _getPsychopathyInterpretation(String level) {
    switch (level) {
      case 'low':
        return {
          'ru':
              'НИЗКИЙ (0-35%): Вы эмпатичны, эмоционально открыты и испытываете угрызения совести. Вы хорошо понимаете чувства других и учитываете их в решениях. Это отлично для отношений, но может делать вас более уязвимым эмоционально.',
          'en':
              'LOW (0-35%): You\'re empathic, emotionally open, and experience remorse. You understand others\' feelings well and consider them in decisions. This is great for relationships but may make you more emotionally vulnerable.',
        };
      case 'moderate':
        return {
          'ru':
              'УМЕРЕННЫЙ (36-65%): Вы способны на эмпатию, но можете сохранять эмоциональную дистанцию, когда нужно. Вы можете принимать рациональные решения под давлением, не теряя человечности. Этот уровень адаптивен для профессий, требующих хладнокровия: хирургия, кризис-менеджмент, правоохранительные органы.',
          'en':
              'MODERATE (36-65%): You\'re capable of empathy but can maintain emotional distance when needed. You can make rational decisions under pressure without losing humanity. This level is adaptive for professions requiring composure: surgery, crisis management, law enforcement.',
        };
      case 'high':
        return {
          'ru':
              'ВЫСОКИЙ (66-100%): Вы эмоционально холодны, импульсивны и редко испытываете угрызения совести. Вам трудно понимать чужие переживания. Это серьёзно вредит близким отношениям и может приводить к безответственному поведению. ⚠️ ВАЖНО: Если вы набрали высокий балл и замечаете проблемы в отношениях или поведении, обратитесь к психологу.',
          'en':
              'HIGH (66-100%): You\'re emotionally cold, impulsive, and rarely feel remorse. You struggle understanding others\' experiences. This seriously harms close relationships and may lead to irresponsible behavior. ⚠️ IMPORTANT: If you scored high and notice relationship or behavior problems, consult a psychologist.',
        };
      default:
        return {'ru': 'Неизвестный уровень', 'en': 'Unknown level'};
    }
  }

  /// Determine profile based on test results
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'balanced';

    final m = percentages['machiavellianism'] ?? 0.0;
    final n = percentages['narcissism'] ?? 0.0;
    final p = percentages['psychopathy'] ?? 0.0;

    final avgPercentage = (m + n + p) / 3;

    // Dark Triad: all three high (≥60%)
    if (m >= 60 && n >= 60 && p >= 60) return 'dark_triad';

    // Specific profiles: one high (≥60%), others not high (<60%)
    if (m >= 60 && n < 60 && p < 60) return 'machiavelli';
    if (n >= 60 && m < 60 && p < 60) return 'narcissus';
    if (p >= 60 && m < 60 && n < 60) return 'cold_calculator';

    // Light Side: all low (≤30%)
    if (avgPercentage <= 30) return 'light_side';

    // Balanced: everything else (moderate levels)
    return 'balanced';
  }

  /// Get profile by ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  // ============================================================================
  // PRIVATE: Questions
  // ============================================================================

  static List<QuestionModel> _getQuestions() {
    return [
      // MACHIAVELLIANISM (q1-q12)
      QuestionModel(
        id: 'q1',
        text: {
          'ru':
              'Я считаю, что иногда нужно говорить людям то, что они хотят услышать, даже если это не совсем правда',
          'en':
              'I believe sometimes you need to tell people what they want to hear, even if it\'s not quite true',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Я всегда говорю правду, даже если это невыгодно мне',
          'en': 'I always tell the truth, even if it\'s disadvantageous to me',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru':
              'В переговорах я стратегически использую информацию, чтобы получить преимущество',
          'en':
              'In negotiations, I strategically use information to gain advantage',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я готов идти на компромисс, даже если это не выгодно мне',
          'en': 'I\'m willing to compromise even if it\'s not beneficial to me',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru':
              'Я считаю, что цель оправдывает средства, если результат того стоит',
          'en':
              'I believe the end justifies the means if the result is worth it',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Я никогда не буду использовать людей в своих интересах',
          'en': 'I would never use people for my own benefit',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я умею читать людей и использовать это знание в своих целях',
          'en': 'I can read people and use this knowledge for my purposes',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я предпочитаю прямоту манипуляциям в любой ситуации',
          'en':
              'I prefer straightforwardness to manipulation in any situation',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'В конкурентной среде важно быть хитрее других',
          'en':
              'In competitive environment, it\'s important to be smarter than others',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я не склонен планировать свои действия наперёд для получения выгоды',
          'en': 'I don\'t tend to plan my actions ahead for gain',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'Я могу притвориться другом человека, если это помогает моим целям',
          'en':
              'I can pretend to be someone\'s friend if it helps my goals',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Я ценю честность выше личной выгоды',
          'en': 'I value honesty above personal gain',
        },
        answers: _getLikert5Answers(),
        factorId: 'machiavellianism',
        isReversed: true,
      ),

      // NARCISSISM (q13-q24)
      QuestionModel(
        id: 'q13',
        text: {
          'ru':
              'Я чувствую, что я особенный человек и заслуживаю большего, чем другие',
          'en': 'I feel I\'m a special person and deserve more than others',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я не считаю себя лучше других людей',
          'en': 'I don\'t consider myself better than other people',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Мне нравится быть в центре внимания',
          'en': 'I like being the center of attention',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я чувствую себя комфортно, когда другие находятся в центре внимания',
          'en': 'I feel comfortable when others are in the spotlight',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я часто фантазирую о том, как добьюсь великих успехов и славы',
          'en':
              'I often fantasize about achieving great success and fame',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Мне не нужно восхищение других, чтобы чувствовать себя хорошо',
          'en': 'I don\'t need others\' admiration to feel good',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Я считаю, что обладаю выдающимися способностями',
          'en': 'I believe I possess outstanding abilities',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я реалистично оцениваю свои способности без преувеличения',
          'en': 'I realistically assess my abilities without exaggeration',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Люди должны признавать мою значимость и успехи',
          'en': 'People should recognize my importance and achievements',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я не ожидаю особого отношения к себе',
          'en': 'I don\'t expect special treatment',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Мне нравится впечатлять других своими достижениями',
          'en': 'I like impressing others with my achievements',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я не нуждаюсь в постоянном подтверждении своей значимости',
          'en': 'I don\'t need constant confirmation of my importance',
        },
        answers: _getLikert5Answers(),
        factorId: 'narcissism',
        isReversed: true,
      ),

      // PSYCHOPATHY (q25-q36)
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Мне трудно понять, почему люди расстраиваются из-за мелочей',
          'en':
              'I find it hard to understand why people get upset over trivial things',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Я легко могу почувствовать боль и переживания других',
          'en': 'I can easily feel others\' pain and experiences',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru':
              'Я могу принимать холодные рациональные решения, не думая о чувствах других',
          'en':
              'I can make cold rational decisions without considering others\' feelings',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Чужие эмоции сильно влияют на мои решения',
          'en': 'Others\' emotions strongly influence my decisions',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я часто действую импульсивно, не думая о последствиях',
          'en': 'I often act impulsively without thinking about consequences',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я всегда тщательно обдумываю последствия своих действий',
          'en': 'I always carefully consider consequences of my actions',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Мне редко бывает стыдно за свои поступки',
          'en': 'I rarely feel ashamed of my actions',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru':
              'Я испытываю сильные угрызения совести, когда делаю что-то не так',
          'en': 'I feel strong remorse when I do something wrong',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Мне нравится рисковать и испытывать острые ощущения',
          'en': 'I like taking risks and experiencing thrills',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Я предпочитаю безопасность и предсказуемость риску',
          'en': 'I prefer safety and predictability to risk',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru':
              'Эмоциональные привязанности не мешают мне делать то, что нужно',
          'en':
              'Emotional attachments don\'t stop me from doing what\'s necessary',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru':
              'Мои близкие отношения очень важны для меня при принятии решений',
          'en':
              'My close relationships are very important in my decision-making',
        },
        answers: _getLikert5Answers(),
        factorId: 'psychopathy',
        isReversed: true,
      ),
    ];
  }

  static List<AnswerModel> _getLikert5Answers() {
    return [
      AnswerModel(
        id: 'strongly_disagree',
        text: {
          'ru': 'Совершенно не согласен',
          'en': 'Strongly disagree',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'disagree',
        text: {
          'ru': 'Скорее не согласен',
          'en': 'Disagree',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'neutral',
        text: {
          'ru': 'Нейтрально',
          'en': 'Neutral',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'agree',
        text: {
          'ru': 'Скорее согласен',
          'en': 'Agree',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'strongly_agree',
        text: {
          'ru': 'Полностью согласен',
          'en': 'Strongly agree',
        },
        score: 4,
      ),
    ];
  }

  // ============================================================================
  // PRIVATE: 6 Profiles with 7 sections each
  // ============================================================================

  static final Map<String, TestProfile> _profiles = {
    'light_side': TestProfile(
      id: 'light_side',
      name: {
        'ru': '😇 Светлая сторона',
        'en': '😇 Light Side',
      },
      description: {
        'ru':
            'У вас низкие показатели по всем тёмным чертам. Вы эмпатичны, честны и скромны. Вы предпочитаете доверие манипуляциям, искренность — самовозвеличиванию, и эмоциональную открытость — холодному расчёту.',
        'en':
            'You have low scores on all dark traits. You\'re empathic, honest, and modest. You prefer trust to manipulation, sincerity to self-aggrandizement, and emotional openness to cold calculation.',
      },
      whyThisProfile: {
        'ru':
            'Ваши показатели по макиавеллизму, нарциссизму и психопатии находятся в нижнем диапазоне (≤30%). Это означает, что вы избегаете манипулятивного поведения, не нуждаетесь в постоянном восхищении и обладаете высокой эмпатией.',
        'en':
            'Your scores on Machiavellianism, narcissism and psychopathy are in the lower range (≤30%). This means you avoid manipulative behavior, don\'t need constant admiration, and possess high empathy.',
      },
      strengths: {
        'ru': [
          'Высокая эмпатия и способность понимать чувства других людей',
          'Честность и прямота в общении — люди вам доверяют',
          'Здоровая скромность без самоуничижения',
          'Способность к глубоким эмоциональным связям',
          'Сильное моральное чувство и ответственность',
          'Стабильные, доверительные отношения',
        ],
        'en': [
          'High empathy and ability to understand others\' feelings',
          'Honesty and straightforwardness — people trust you',
          'Healthy modesty without self-deprecation',
          'Ability for deep emotional connections',
          'Strong moral sense and responsibility',
          'Stable, trusting relationships',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Можете быть слишком доверчивым и уязвимым для манипуляций',
          'Трудности с защитой своих интересов в конкурентных ситуациях',
          'Риск быть использованным более циничными людьми',
          'Возможная заниженная самооценка (слишком низкий нарциссизм)',
          'Эмоциональная уязвимость в стрессовых ситуациях',
        ],
        'en': [
          'May be too trusting and vulnerable to manipulation',
          'Difficulties protecting your interests in competitive situations',
          'Risk of being used by more cynical people',
          'Possible low self-esteem (too low narcissism)',
          'Emotional vulnerability in stressful situations',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте здоровую уверенность в себе — признавайте свои достижения',
          'Учитесь защищать свои границы без потери искренности',
          'Изучите базовые навыки переговоров и стратегического мышления',
          'Оставайтесь эмпатичным, но не позволяйте собой манипулировать',
          'Работайте над самооценкой — немного нарциссизма полезно для амбиций',
          'Помните: доброта — не слабость, это сила',
        ],
        'en': [
          'Develop healthy self-confidence — acknowledge your achievements',
          'Learn to protect your boundaries without losing sincerity',
          'Study basic negotiation and strategic thinking skills',
          'Stay empathic but don\'t let yourself be manipulated',
          'Work on self-esteem — some narcissism is useful for ambition',
          'Remember: kindness is not weakness, it\'s strength',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня назовите три своих достижения, которыми вы можете гордиться. Практикуйте здоровую самооценку без чрезмерной скромности.',
        'en':
            'Today, name three of your achievements you can be proud of. Practice healthy self-esteem without excessive modesty.',
      },
      inspiringConclusion: {
        'ru':
            '💛 Ваша светлая сторона — это дар в циничном мире. Не теряйте её, но и научитесь защищать себя. Доброта с границами — вот истинная мудрость.',
        'en':
            '💛 Your light side is a gift in a cynical world. Don\'t lose it, but also learn to protect yourself. Kindness with boundaries is true wisdom.',
      },
    ),
    'balanced': TestProfile(
      id: 'balanced',
      name: {
        'ru': '⚖️ Сбалансированная личность',
        'en': '⚖️ Balanced Personality',
      },
      description: {
        'ru':
            'У вас сбалансированная личность с умеренными тёмными чертами. Вы можете быть стратегическим, уверенным и рациональным, когда нужно, но не теряете эмпатии и этики. Это здоровый психологический профиль.',
        'en':
            'You have balanced personality with moderate dark traits. You can be strategic, confident, and rational when needed but don\'t lose empathy and ethics. This is healthy psychological profile.',
      },
      whyThisProfile: {
        'ru':
            'Ваши показатели находятся в умеренном диапазоне (31-60%) по большинству или всем трём чертам. Это означает гибкость: вы можете адаптироваться к разным ситуациям, не скатываясь в крайности.',
        'en':
            'Your scores are in moderate range (31-60%) on most or all three traits. This means flexibility: you can adapt to different situations without falling into extremes.',
      },
      strengths: {
        'ru': [
          'Стратегическое мышление без чрезмерного цинизма',
          'Здоровая уверенность в себе без высокомерия',
          'Способность принимать рациональные решения с сохранением эмпатии',
          'Гибкость в социальных ситуациях',
          'Эффективность в переговорах и бизнесе',
          'Баланс между личными интересами и этикой',
        ],
        'en': [
          'Strategic thinking without excessive cynicism',
          'Healthy self-confidence without arrogance',
          'Ability to make rational decisions while maintaining empathy',
          'Flexibility in social situations',
          'Effectiveness in negotiations and business',
          'Balance between personal interests and ethics',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск скатиться в более высокие уровни под стрессом',
          'Возможные периоды самовозвеличивания или манипуляций',
          'Конфликт между прагматизмом и моральными принципами',
          'Окружающие могут иногда воспринимать вас как расчётливого',
        ],
        'en': [
          'Risk of sliding into higher levels under stress',
          'Possible periods of self-aggrandizement or manipulation',
          'Conflict between pragmatism and moral principles',
          'Others may sometimes perceive you as calculating',
        ],
      },
      recommendations: {
        'ru': [
          'Поддерживайте баланс — следите, чтобы не скатиться к крайностям',
          'Используйте стратегическое мышление этично',
          'Развивайте самосознание: замечайте, когда переходите границы',
          'Цените ваши близкие отношения — не жертвуйте ими ради целей',
          'Практикуйте эмпатию регулярно, даже в деловых ситуациях',
          'Помните: умеренность — ключ к долгосрочному успеху',
        ],
        'en': [
          'Maintain balance — watch for sliding into extremes',
          'Use strategic thinking ethically',
          'Develop self-awareness: notice when you cross boundaries',
          'Value your close relationships — don\'t sacrifice them for goals',
          'Practice empathy regularly, even in business situations',
          'Remember: moderation is key to long-term success',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня в одной ситуации примените стратегическое мышление, а в другой — чистую эмпатию. Почувствуйте разницу и уместность обоих подходов.',
        'en':
            'Today, apply strategic thinking in one situation and pure empathy in another. Feel the difference and appropriateness of both approaches.',
      },
      inspiringConclusion: {
        'ru':
            '⚖️ Ваш баланс — это искусство. Вы не святой и не злодей, вы — реалист с совестью. Это редкое и ценное качество.',
        'en':
            '⚖️ Your balance is an art. You\'re neither saint nor villain, you\'re a realist with conscience. This is rare and valuable quality.',
      },
    ),
    'machiavelli': TestProfile(
      id: 'machiavelli',
      name: {
        'ru': '🎭 Стратег (Макиавелли)',
        'en': '🎭 Strategist (Machiavelli)',
      },
      description: {
        'ru':
            'Вы прагматичный стратег с высоким макиавеллизмом. Вы умеете планировать и манипулировать ситуацией, но при этом сохраняете эмпатию и не считаете себя особенным. Цель для вас часто оправдывает средства.',
        'en':
            'You\'re pragmatic strategist with high Machiavellianism. You can plan and manipulate situations while maintaining empathy and not considering yourself special. For you, end often justifies means.',
      },
      whyThisProfile: {
        'ru':
            'Ваш показатель по макиавеллизму высокий (≥60%), в то время как нарциссизм и психопатия остаются на умеренном или низком уровне. Вы стратег, но не высокомерный тиран и не холодный психопат.',
        'en':
            'Your Machiavellianism score is high (≥60%), while narcissism and psychopathy remain at moderate or low levels. You\'re strategist but not arrogant tyrant or cold psychopath.',
      },
      strengths: {
        'ru': [
          'Превосходное стратегическое мышление',
          'Эффективность в переговорах и бизнесе',
          'Способность видеть скрытые мотивы людей',
          'Гибкость в социальных и политических ситуациях',
          'Умение достигать долгосрочных целей',
          'Практичность и прагматизм',
        ],
        'en': [
          'Excellent strategic thinking',
          'Effectiveness in negotiations and business',
          'Ability to see hidden motives of people',
          'Flexibility in social and political situations',
          'Skill in achieving long-term goals',
          'Practicality and pragmatism',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Репутация манипулятора может повредить долгосрочным отношениям',
          'Окружающие могут не доверять вам',
          'Риск стать слишком циничным',
          'Этические конфликты — цель не всегда оправдывает средства',
          'Одиночество из-за поверхностных отношений',
          'Стресс от постоянного «игры в шахматы» с людьми',
        ],
        'en': [
          'Reputation as manipulator can damage long-term relationships',
          'Others may not trust you',
          'Risk of becoming too cynical',
          'Ethical conflicts — end doesn\'t always justify means',
          'Loneliness due to superficial relationships',
          'Stress from constant "chess playing" with people',
        ],
      },
      recommendations: {
        'ru': [
          'Используйте стратегическое мышление этично — не во вред людям',
          'Инвестируйте в несколько искренних отношений',
          'Помните о долгосрочной репутации, а не только краткосрочных целях',
          'Практикуйте прямоту хотя бы с близкими людьми',
          'Спросите себя: «Цель действительно оправдывает эти средства?»',
          'Найдите сферы, где ваш талант полезен: бизнес, дипломатия, переговоры',
        ],
        'en': [
          'Use strategic thinking ethically — not to harm people',
          'Invest in few sincere relationships',
          'Remember long-term reputation, not just short-term goals',
          'Practice straightforwardness at least with close people',
          'Ask yourself: "Does end truly justify these means?"',
          'Find areas where your talent is useful: business, diplomacy, negotiations',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня в одной ситуации будьте полностью честны — без стратегии, без манипуляций. Заметьте, как это влияет на доверие.',
        'en':
            'Today, be completely honest in one situation — no strategy, no manipulation. Notice how it affects trust.',
      },
      inspiringConclusion: {
        'ru':
            '🎭 Вы — мастер игры, но не забывайте: самая большая победа — это когда вам не нужно играть. Стратегия с душой сильнее циничной манипуляции.',
        'en':
            '🎭 You\'re master of the game, but don\'t forget: greatest victory is when you don\'t need to play. Strategy with soul is stronger than cynical manipulation.',
      },
    ),
    'narcissus': TestProfile(
      id: 'narcissus',
      name: {
        'ru': '👑 Нарцисс (Звезда)',
        'en': '👑 Narcissus (Star)',
      },
      description: {
        'ru':
            'Вы уверенный в себе лидер с высокой самооценкой и потребностью в признании. Вы харизматичны и амбициозны, но не склонны к холодным манипуляциям. Вам нужно быть в центре внимания.',
        'en':
            'You\'re confident leader with high self-esteem and need for recognition. You\'re charismatic and ambitious but not inclined toward cold manipulation. You need to be center of attention.',
      },
      whyThisProfile: {
        'ru':
            'Ваш показатель по нарциссизму высокий (≥60%), в то время как макиавеллизм и психопатия умеренные или низкие. Вы любите себя и восхищение, но не холодный манипулятор.',
        'en':
            'Your narcissism score is high (≥60%), while Machiavellianism and psychopathy are moderate or low. You love yourself and admiration but aren\'t cold manipulator.',
      },
      strengths: {
        'ru': [
          'Высокая уверенность в себе',
          'Харизма и способность вдохновлять других',
          'Амбициозность и стремление к достижениям',
          'Лидерские качества',
          'Энергия и оптимизм',
          'Способность мотивировать себя и других',
        ],
        'en': [
          'High self-confidence',
          'Charisma and ability to inspire others',
          'Ambitiousness and achievement drive',
          'Leadership qualities',
          'Energy and optimism',
          'Ability to motivate yourself and others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Зависимость от постоянного восхищения и подтверждения',
          'Трудности с критикой — воспринимаете её как личную атаку',
          'Игнорирование потребностей других в погоне за вниманием',
          'Поверхностные отношения — люди вам нужны как зеркала',
          'Хрупкая самооценка под маской грандиозности',
          'Эмоциональная нестабильность при отсутствии признания',
        ],
        'en': [
          'Dependence on constant admiration and validation',
          'Difficulties with criticism — perceive it as personal attack',
          'Ignoring others\' needs in pursuit of attention',
          'Superficial relationships — you need people as mirrors',
          'Fragile self-esteem under mask of grandiosity',
          'Emotional instability without recognition',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте эмпатию — интересуйтесь другими не только как аудиторией',
          'Учитесь ценить себя без внешнего подтверждения',
          'Практикуйте скромность — делитесь вниманием с другими',
          'Принимайте критику как возможность роста, а не угрозу',
          'Стройте глубокие отношения, а не только поклонников',
          'Используйте харизму для помощи другим, не только для самовозвеличивания',
        ],
        'en': [
          'Develop empathy — be interested in others not just as audience',
          'Learn to value yourself without external validation',
          'Practice modesty — share attention with others',
          'Accept criticism as growth opportunity, not threat',
          'Build deep relationships, not just followers',
          'Use charisma to help others, not just for self-aggrandizement',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня уделите внимание кому-то другому: искренне выслушайте их историю, не перебивая и не переводя разговор на себя.',
        'en':
            'Today, give attention to someone else: sincerely listen to their story without interrupting or turning conversation to yourself.',
      },
      inspiringConclusion: {
        'ru':
            '👑 Вы — звезда, но помните: самые яркие звёзды светят не только себе, но и другим. Истинное величие — в том, чтобы поднимать людей, а не стоять на них.',
        'en':
            '👑 You\'re star, but remember: brightest stars shine not just for themselves but for others. True greatness is lifting people up, not standing on them.',
      },
    ),
    'cold_calculator': TestProfile(
      id: 'cold_calculator',
      name: {
        'ru': '🧊 Холодный калькулятор',
        'en': '🧊 Cold Calculator',
      },
      description: {
        'ru':
            'Вы эмоционально холодны и рациональны. Можете принимать сложные решения без эмоций, но не склонны к манипуляциям или высокомерию. Ваша эмпатия снижена, но вы не используете это для причинения вреда.',
        'en':
            'You\'re emotionally cold and rational. Can make tough decisions without emotions but not inclined toward manipulation or arrogance. Your empathy is reduced but you don\'t use this to cause harm.',
      },
      whyThisProfile: {
        'ru':
            'Ваш показатель по психопатии высокий (≥60%), в то время как макиавеллизм и нарциссизм умеренные или низкие. Вы холодны эмоционально, но не манипулятор и не самовлюблённый.',
        'en':
            'Your psychopathy score is high (≥60%), while Machiavellianism and narcissism are moderate or low. You\'re emotionally cold but not manipulator or self-obsessed.',
      },
      strengths: {
        'ru': [
          'Способность принимать рациональные решения под давлением',
          'Эмоциональная устойчивость в кризисах',
          'Не поддаётесь панике или эмоциональным манипуляциям',
          'Эффективны в профессиях, требующих хладнокровия',
          'Можете делать то, что нужно, без колебаний',
          'Не зависите от эмоций при принятии решений',
        ],
        'en': [
          'Ability to make rational decisions under pressure',
          'Emotional stability in crises',
          'Don\'t succumb to panic or emotional manipulation',
          'Effective in professions requiring composure',
          'Can do what\'s necessary without hesitation',
          'Don\'t depend on emotions in decision-making',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Трудности с эмпатией и пониманием чужих чувств',
          'Импульсивность и склонность к риску',
          'Холодность в отношениях — людям с вами некомфортно',
          'Отсутствие угрызений совести может привести к безответственным поступкам',
          'Поверхностные эмоциональные связи',
          'Риск социальной изоляции',
        ],
        'en': [
          'Difficulties with empathy and understanding others\' feelings',
          'Impulsivity and risk-taking tendency',
          'Coldness in relationships — people uncomfortable with you',
          'Lack of remorse may lead to irresponsible actions',
          'Superficial emotional connections',
          'Risk of social isolation',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте эмпатию осознанно — учитесь понимать чувства других',
          'Найдите профессию, где холодность — преимущество: хирургия, кризис-менеджмент',
          'Работайте над импульсивностью — думайте о последствиях',
          'Заводите близкие отношения постепенно — они вам нужны',
          'Если вредите людям своей холодностью — обратитесь к психологу',
          'Используйте рациональность для помощи, а не для вреда',
        ],
        'en': [
          'Practice empathy consciously — learn to understand others\' feelings',
          'Find profession where coldness is advantage: surgery, crisis management',
          'Work on impulsivity — think about consequences',
          'Build close relationships gradually — you need them',
          'If you harm people with coldness — consult psychologist',
          'Use rationality to help, not to harm',
        ],
      },
      tryToday: {
        'ru':
            'Сегодня, когда кто-то поделится эмоциями, постарайтесь сознательно представить себя на их месте. Спросите: «Что бы я чувствовал?»',
        'en':
            'Today, when someone shares emotions, consciously try to imagine yourself in their place. Ask: "What would I feel?"',
      },
      inspiringConclusion: {
        'ru':
            '🧊 Ваша холодность — инструмент, не проклятие. Используйте её для спасения жизней, решения кризисов, принятия сложных решений. Но не забывайте, что вы всё ещё человек.',
        'en':
            '🧊 Your coldness is tool, not curse. Use it to save lives, resolve crises, make tough decisions. But don\'t forget you\'re still human.',
      },
    ),
    'dark_triad': TestProfile(
      id: 'dark_triad',
      name: {
        'ru': '🌑 Тёмная триада',
        'en': '🌑 Dark Triad',
      },
      description: {
        'ru':
            'У вас высокие показатели по всем трём тёмным чертам: макиавеллизм, нарциссизм и психопатия. Это редкий профиль, который может быть очень проблематичным для отношений и этики.',
        'en':
            'You have high scores on all three dark traits: Machiavellianism, narcissism, and psychopathy. This is rare profile that can be very problematic for relationships and ethics.',
      },
      whyThisProfile: {
        'ru':
            'Все три ваши показателя высоки (≥60%): вы стратегический манипулятор, ищущий восхищения, с низкой эмпатией. Это тревожная комбинация, требующая серьёзной саморефлексии.',
        'en':
            'All three scores are high (≥60%): you\'re strategic manipulator seeking admiration with low empathy. This is concerning combination requiring serious self-reflection.',
      },
      strengths: {
        'ru': [
          'Способность достигать целей любой ценой',
          'Харизма и уверенность в конкурентных ситуациях',
          'Эмоциональная устойчивость',
          'Стратегическое мышление',
          'Не поддаётесь эмоциональным манипуляциям',
          'Возможный успех в бизнесе или политике (краткосрочно)',
        ],
        'en': [
          'Ability to achieve goals at any cost',
          'Charisma and confidence in competitive situations',
          'Emotional stability',
          'Strategic thinking',
          'Don\'t succumb to emotional manipulation',
          'Possible success in business or politics (short-term)',
        ],
      },
      vulnerabilities: {
        'ru': [
          '⚠️ Серьёзные проблемы с близкими отношениями',
          '⚠️ Репутационные риски — люди вас избегают',
          '⚠️ Этические нарушения и возможные правовые проблемы',
          '⚠️ Хроническое одиночество под маской успеха',
          '⚠️ Риск деструктивного поведения',
          '⚠️ Долгосрочная неудовлетворённость жизнью',
        ],
        'en': [
          '⚠️ Serious problems with close relationships',
          '⚠️ Reputational risks — people avoid you',
          '⚠️ Ethical violations and possible legal problems',
          '⚠️ Chronic loneliness under mask of success',
          '⚠️ Risk of destructive behavior',
          '⚠️ Long-term life dissatisfaction',
        ],
      },
      recommendations: {
        'ru': [
          '🚨 НАСТОЯТЕЛЬНО РЕКОМЕНДУЕМ: обратитесь к психологу или психотерапевту',
          'Если вы замечаете проблемы в отношениях, на работе или с законом — это сигнал',
          'Работайте над эмпатией с профессионалом',
          'Осознайте долгосрочные последствия своего поведения',
          'Найдите этичные способы использования ваших способностей',
          'Помните: краткосрочный успех не стоит долгосрочного одиночества',
        ],
        'en': [
          '🚨 STRONGLY RECOMMENDED: consult psychologist or psychotherapist',
          'If you notice relationship, work, or legal problems — this is signal',
          'Work on empathy with professional',
          'Realize long-term consequences of your behavior',
          'Find ethical ways to use your abilities',
          'Remember: short-term success not worth long-term loneliness',
        ],
      },
      tryToday: {
        'ru':
            '🚨 Сегодня не «попробуйте что-то», а ЗАПИШИТЕСЬ к психологу. Это не слабость — это мудрость. Ваш профиль требует профессиональной помощи.',
        'en':
            '🚨 Today, don\'t "try something" — BOOK appointment with psychologist. This is not weakness — it\'s wisdom. Your profile requires professional help.',
      },
      inspiringConclusion: {
        'ru':
            '🌑 Тёмная триада — не приговор, но это тревожный звонок. Вы можете изменить паттерны, но только с профессиональной помощью. Самый сильный поступок — признать проблему.',
        'en':
            '🌑 Dark Triad is not sentence, but it\'s warning bell. You can change patterns, but only with professional help. Strongest action is admitting problem.',
      },
    ),
  };
}
