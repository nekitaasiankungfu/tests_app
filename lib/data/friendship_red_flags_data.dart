import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data access class for Friendship Red Flags Test
/// Legacy Dart implementation (no JSON dependency)
class FriendshipRedFlagsData {
  /// Get the complete Friendship Red Flags test
  static TestModel getFriendshipRedFlagsTest() {
    return TestModel(
      id: 'friendship_red_flags_v1',
      title: {
        'ru': 'Дружба и красные флажки',
        'en': 'Friendship and Red Flags',
      },
      description: {
        'ru':
            'Для подростков и молодых взрослых дружба часто важнее романтики. Друзья могут быть поддержкой, домом и опорой — а могут тянуть в драму, выматывать и незаметно бить по самооценке. Не всегда легко отличить «сложного, но близкого человека» от реально токсичных паттернов, особенно когда вы к ним привыкли с детства.\n\nЭтот тест исследует, какие типы друзей вы чаще выбираете, насколько вы замечаете тревожные звоночки в их поведении, терпите ли неуважение и умеете ли ставить здоровые границы в дружбе. Вопросы построены вокруг реальных повседневных ситуаций: кто пишет первым, кто извиняется, что вы чувствуете после общения и какие истории про друзей вы рассказываете чаще всего.\n\nРезультат покажет, насколько вы уязвимы к токсичным дружеским сценариям и в каких местах вы сами можете сделать дружбу безопаснее и теплее для себя — без морали и обвинений, а с фокусом на осознанность и заботу о себе.',
        'en':
            'For teenagers and young adults, friendship is often more important than romance. Friends can be your support and safe place – or they can pull you into drama, drain your energy, and quietly damage your self-esteem. It\'s not always easy to distinguish a \'complex but close person\' from genuinely toxic patterns, especially if you grew used to them early in life.\n\nThis test explores what kinds of friends you are drawn to, how well you notice red flags in their behavior, how much disrespect you tolerate, and how you set (or don\'t set) healthy boundaries in friendship. Items focus on everyday situations: who texts first, who apologizes, how you feel after hanging out, and what kinds of stories about friends you tell most often.\n\nYour results will show how vulnerable you are to toxic friendship dynamics and where you can make your friendships safer and kinder for yourself – without moralizing or blame, but with an emphasis on awareness and self-care.',
      },
      category: {
        'ru': 'Межличностные отношения',
        'en': 'Interpersonal Relationships',
      },
      categoryId: 'relationships',
      disclaimer: {
        'ru':
            'Тест основан на исследованиях межличностных отношений и дружбы, теории привязанности, концепции личных границ и моделях созависимого поведения. Он предназначен для самопознания и не является медицинской диагностикой. Отвечайте честно для получения наиболее точных результатов.',
        'en':
            'The test is based on research on interpersonal relationships and friendship, attachment theory, the concept of personal boundaries, and models of codependent behavior. It is for self-awareness and not a medical diagnosis. Answer honestly for the most accurate results.',
      },
      estimatedTime: 7,
      type: TestType.multiFactor,
      factorIds: [
        'friendship_boundaries_difficulty',
        'blindness_to_red_flags',
        'tolerance_of_disrespect',
        'drama_attraction'
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'friendship_boundaries_difficulty': {
        'ru': 'Границы в дружбе: трудности',
        'en': 'Friendship Boundaries: Difficulties',
      },
      'blindness_to_red_flags': {
        'ru': 'Слепота к тревожным звоночкам',
        'en': 'Blindness to Red Flags',
      },
      'tolerance_of_disrespect': {
        'ru': 'Толерантность к неуважению',
        'en': 'Tolerance of Disrespect',
      },
      'drama_attraction': {
        'ru': 'Тяга к драме в дружбе',
        'en': 'Attraction to Drama in Friendship',
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

    // Determine range: 0-40 (low), 41-70 (medium), 71-100 (high)
    final String level;
    if (percentage <= 40) {
      level = 'low';
    } else if (percentage <= 70) {
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

  /// Determine profile based on test results
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_low_risk';

    // Calculate composite risk index (average of all 4 factors)
    final avgPercentage = percentages.values.reduce((a, b) => a + b) / percentages.length;

    if (avgPercentage >= 75) return 'profile_high_risk';
    if (avgPercentage >= 50) return 'profile_elevated_risk';
    if (avgPercentage >= 25) return 'profile_moderate_risk';
    return 'profile_low_risk';
  }

  /// Get profile by ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Get all 24 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1 - friendship_boundaries_difficulty
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я соглашаюсь встретиться с друзьями, даже когда очень устал(а), лишь бы никого не расстраивать.',
          'en': 'I agree to meet up with friends even when I\'m really tired, just so I don\'t upset anyone.',
        },
        factorId: 'friendship_boundaries_difficulty',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q2 - blindness_to_red_flags
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Когда шутки друга меня задевают, я чаще думаю, что это «у меня нет чувства юмора», а не что он перегибает.',
          'en': 'When a friend\'s jokes hurt my feelings, I\'m more likely to think I \'have no sense of humor\' than that they\'re crossing a line.',
        },
        factorId: 'blindness_to_red_flags',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q3 - tolerance_of_disrespect
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Если друг(подруга) может накричать на меня, а потом списать всё на усталость, я в итоге это принимаю.',
          'en': 'If a friend yells at me and later blames it on being tired, I usually end up accepting it.',
        },
        factorId: 'tolerance_of_disrespect',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q4 - drama_attraction
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Спокойные и предсказуемые люди в дружбе кажутся мне скучноватыми по сравнению с теми, у кого «бурный характер».',
          'en': 'Calm, predictable people often seem a bit boring to me compared to friends with a \'stormy personality\'.',
        },
        factorId: 'drama_attraction',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q5 - friendship_boundaries_difficulty
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Я легко отменяю свои планы ради друга, даже если ситуация не срочная.',
          'en': 'I easily cancel my own plans for a friend, even if nothing is truly urgent.',
        },
        factorId: 'friendship_boundaries_difficulty',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q6 - blindness_to_red_flags
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'В начале общения с человеком я часто игнорирую лёгкий дискомфорт, если он кажется интересным.',
          'en': 'At the start of getting to know someone, I often ignore mild discomfort if they seem interesting.',
        },
        factorId: 'blindness_to_red_flags',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q7 - tolerance_of_disrespect
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я продолжаю дружить с людьми, которые иногда жестко шутят обо мне при других.',
          'en': 'I stay friends with people who sometimes make harsh jokes about me in front of others.',
        },
        factorId: 'tolerance_of_disrespect',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q8 - drama_attraction
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Многие мои истории про друзей – это про конфликты, ссоры и бурные примирения.',
          'en': 'Many of my friendship stories are about conflicts, fights, and dramatic reconciliations.',
        },
        factorId: 'drama_attraction',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q9 - friendship_boundaries_difficulty
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Мне сложно сказать другу, что мне некомфортно обсуждать какую-то личную тему.',
          'en': 'It\'s hard for me to tell a friend that I\'m uncomfortable discussing a certain personal topic.',
        },
        factorId: 'friendship_boundaries_difficulty',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q10 - blindness_to_red_flags (REVERSED)
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Если человек постоянно отменяет встречи в последний момент или долго не отвечает, я воспринимаю это как сигнал о его отношении ко мне.',
          'en': 'If someone constantly cancels plans last minute or takes ages to reply, I see it as a signal about how much they value me.',
        },
        factorId: 'blindness_to_red_flags',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q11 - tolerance_of_disrespect
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я часто первым(первой) иду мириться, даже если объективно не я был(а) неправ(а).',
          'en': 'I\'m often the first one to make peace, even when I wasn\'t really the one who was wrong.',
        },
        factorId: 'tolerance_of_disrespect',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q12 - drama_attraction
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Я чувствую себя более живым(ой), когда дружба напоминает американские горки, а не ровную линию.',
          'en': 'I feel more alive when a friendship feels like a roller coaster rather than a smooth, steady line.',
        },
        factorId: 'drama_attraction',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q13 - friendship_boundaries_difficulty (REVERSED)
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Если я вымотан(а), я могу честно сказать друзьям, что сейчас мне нужен отдых и время для себя.',
          'en': 'When I\'m exhausted, I can honestly tell my friends that I need rest and some time for myself.',
        },
        factorId: 'friendship_boundaries_difficulty',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q14 - blindness_to_red_flags
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Ревность, контроль и желание всё знать о моей жизни я скорее воспринимаю как заботу, чем как проблему.',
          'en': 'Jealousy, control, and wanting to know everything about my life seem more like care than a problem to me.',
        },
        factorId: 'blindness_to_red_flags',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q15 - tolerance_of_disrespect
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я остаюсь рядом с людьми, которые регулярно отпускают неприятные комментарии в мой адрес, если в остальном они «нормальные».',
          'en': 'I stay close to people who regularly make unpleasant comments about me as long as they\'re \'normal\' in other ways.',
        },
        factorId: 'tolerance_of_disrespect',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q16 - drama_attraction (REVERSED)
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я особенно ценю дружбу, в которой всё спокойно, без постоянных скандалов и качелей.',
          'en': 'I especially value friendships that are calm and stable, without constant fights and emotional swings.',
        },
        factorId: 'drama_attraction',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q17 - friendship_boundaries_difficulty
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я стараюсь отвечать друзьям максимально быстро, даже если мне неудобно, лишь бы не показаться грубым(ой).',
          'en': 'I try to reply to friends as quickly as possible, even when it\'s inconvenient, just so I don\'t seem rude.',
        },
        factorId: 'friendship_boundaries_difficulty',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q18 - blindness_to_red_flags
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Если друг часто плохо говорит о других за глаза, я скорее надеюсь, что со мной он так не поступит.',
          'en': 'If a friend often speaks badly about others behind their back, I tend to hope they just won\'t do that with me.',
        },
        factorId: 'blindness_to_red_flags',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q19 - tolerance_of_disrespect (REVERSED)
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Если друг открыто смеётся над моими чувствами, я серьёзно задумываюсь, стоит ли продолжать такую близость.',
          'en': 'If a friend openly laughs at my feelings, I seriously reconsider whether I want to stay that close to them.',
        },
        factorId: 'tolerance_of_disrespect',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q20 - drama_attraction
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Мне быстро становится скучно в компаниях, где нет сплетен, обсуждений чужих драм и «жарких» историй.',
          'en': 'I quickly get bored in groups where there\'s no gossip, no drama, and no \'juicy\' stories.',
        },
        factorId: 'drama_attraction',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q21 - friendship_boundaries_difficulty (REVERSED)
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Если я замечаю, что дружба стала односторонней, я могу постепенно уменьшить общение.',
          'en': 'If I notice a friendship has become one-sided, I can gradually reduce contact.',
        },
        factorId: 'friendship_boundaries_difficulty',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q22 - blindness_to_red_flags (REVERSED)
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я довольно быстро замечаю мелкие изменения в отношении друзей ко мне и задумываюсь, не появился ли тревожный сигнал.',
          'en': 'I usually notice small changes in how friends treat me and wonder if it might be an early warning sign.',
        },
        factorId: 'blindness_to_red_flags',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q23 - tolerance_of_disrespect
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я привык(ла) терпеть лёгкое неуважение от друзей, лишь бы не остаться одному(одной).',
          'en': 'I\'m used to tolerating mild disrespect from friends just so I don\'t end up alone.',
        },
        factorId: 'tolerance_of_disrespect',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q24 - drama_attraction
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Большинство моих близких друзей — люди с непростым характером и очень бурной биографией.',
          'en': 'Most of my closest friends are people with complicated personalities and very turbulent life stories.',
        },
        factorId: 'drama_attraction',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
    ];
  }

  /// Frequency answers (0-4 scale)
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

  /// Factor interpretations
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'friendship_boundaries_difficulty': {
        'low': {
          'title_ru': 'Здоровые границы в дружбе',
          'title_en': 'Healthy Friendship Boundaries',
          'description_ru':
              'Вы довольно хорошо умеете говорить "нет", отстаивать свои интересы и не жертвовать собой ради дружбы. Вы понимаете, что настоящая близость не требует самоотречения.',
          'description_en':
              'You are quite good at saying "no", standing up for yourself, and not sacrificing yourself for friendship. You understand that true closeness does not require self-denial.',
        },
        'medium': {
          'title_ru': 'Границы иногда размываются',
          'title_en': 'Boundaries Sometimes Blur',
          'description_ru':
              'В некоторых ситуациях вам сложно отказать друзьям или защитить своё пространство. Возможно, вы боитесь обидеть или быть "плохим другом". Это частично мешает вам заботиться о себе.',
          'description_en':
              'In some situations, it\'s hard for you to say no to friends or protect your space. You may fear hurting them or being a "bad friend". This partially prevents you from taking care of yourself.',
        },
        'high': {
          'title_ru': 'Трудности с границами',
          'title_en': 'Difficulty with Boundaries',
          'description_ru':
              'Вам очень сложно говорить "нет" друзьям, защищать своё время и энергию. Вы часто жертвуете собой, чтобы не расстраивать других. Это истощает вас и может приводить к односторонним отношениям.',
          'description_en':
              'It\'s very difficult for you to say "no" to friends, protect your time and energy. You often sacrifice yourself to avoid upsetting others. This drains you and can lead to one-sided relationships.',
        },
      },
      'blindness_to_red_flags': {
        'low': {
          'title_ru': 'Хорошо замечаете тревожные сигналы',
          'title_en': 'Good at Noticing Warning Signs',
          'description_ru':
              'Вы внимательны к поведению друзей и быстро замечаете, когда что-то идёт не так. Вы доверяете своей интуиции и не игнорируете дискомфорт.',
          'description_en':
              'You are attentive to friends\' behavior and quickly notice when something is wrong. You trust your intuition and don\'t ignore discomfort.',
        },
        'medium': {
          'title_ru': 'Иногда пропускаете красные флажки',
          'title_en': 'Sometimes Miss Red Flags',
          'description_ru':
              'В некоторых ситуациях вы склонны оправдывать неприятное поведение друзей или игнорировать лёгкий дискомфорт. Это может быть защитным механизмом или привычкой с детства.',
          'description_en':
              'In some situations, you tend to justify friends\' unpleasant behavior or ignore mild discomfort. This may be a defense mechanism or a childhood habit.',
        },
        'high': {
          'title_ru': 'Слепота к тревожным звоночкам',
          'title_en': 'Blindness to Warning Signs',
          'description_ru':
              'Вы часто игнорируете или рационализируете неприятные сигналы в поведении друзей. Знакомые паттерны кажутся "нормальными", даже если они вам вредят. Это может приводить к токсичным дружбам.',
          'description_en':
              'You often ignore or rationalize uncomfortable signals in friends\' behavior. Familiar patterns seem "normal" even when they harm you. This can lead to toxic friendships.',
        },
      },
      'tolerance_of_disrespect': {
        'low': {
          'title_ru': 'Не терпите неуважение',
          'title_en': 'Don\'t Tolerate Disrespect',
          'description_ru':
              'Вы быстро замечаете, когда к вам относятся неуважительно, и готовы защищать себя. Вы понимаете, что настоящая дружба не включает унижение.',
          'description_en':
              'You quickly notice when you are being treated disrespectfully and are ready to defend yourself. You understand that true friendship does not include humiliation.',
        },
        'medium': {
          'title_ru': 'Иногда терпите неуважение',
          'title_en': 'Sometimes Tolerate Disrespect',
          'description_ru':
              'В некоторых ситуациях вы склонны терпеть шутки на свой счёт, обесценивание или нарушенные договорённости. Возможно, вы боитесь потерять дружбу или считаете, что "так все делают".',
          'description_en':
              'In some situations, you tend to tolerate jokes at your expense, devaluation, or broken agreements. You may fear losing friendship or think "everyone does that".',
        },
        'high': {
          'title_ru': 'Высокая толерантность к неуважению',
          'title_en': 'High Tolerance of Disrespect',
          'description_ru':
              'Вы привыкли терпеть шутки, обесценивание и нарушенные договорённости вместо того, чтобы защищать себя. Это может быть связано с убеждением "я должен терпеть" или страхом одиночества.',
          'description_en':
              'You are used to tolerating jokes, devaluation, and broken agreements instead of protecting yourself. This may be related to the belief "I must endure" or fear of loneliness.',
        },
      },
      'drama_attraction': {
        'low': {
          'title_ru': 'Цените спокойные отношения',
          'title_en': 'Value Calm Relationships',
          'description_ru':
              'Вы цените стабильные, предсказуемые дружеские отношения без постоянных конфликтов и драмы. Вам комфортно с людьми, которые не создают "американских горок".',
          'description_en':
              'You value stable, predictable friendships without constant conflicts and drama. You are comfortable with people who don\'t create "roller coasters".',
        },
        'medium': {
          'title_ru': 'Иногда привлекает интенсивность',
          'title_en': 'Sometimes Attracted to Intensity',
          'description_ru':
              'В некоторых ситуациях вам может быть скучно со спокойными людьми, и вас привлекают более интенсивные, конфликтные отношения. Это может быть поиском стимуляции или повторением знакомых сценариев.',
          'description_en':
              'In some situations, you may find calm people boring and be attracted to more intense, conflictual relationships. This may be seeking stimulation or repeating familiar scripts.',
        },
        'high': {
          'title_ru': 'Тяга к драме в дружбе',
          'title_en': 'Attraction to Drama in Friendship',
          'description_ru':
              'Вам привычны и притягательны интенсивные, конфликтные "американские горки" в дружеских отношениях. Спокойные люди кажутся скучными. Это может быть связано с убеждением, что близость обязательно включает драму.',
          'description_en':
              'You are drawn to intense, conflictual "roller coaster" friendships. Calm people seem boring. This may be related to the belief that closeness must involve drama.',
        },
      },
    };
  }

  /// Test profiles (4 profiles based on risk index)
  static final Map<String, TestProfile> _profiles = {
    'profile_low_risk': TestProfile(
      id: 'profile_low_risk',
      name: {
        'ru': 'Низкий риск токсичных дружеских сценариев',
        'en': 'Low Risk of Toxic Friendship Patterns',
      },
      description: {
        'ru':
            'Вы достаточно внимательно относитесь к себе в дружбе и редко надолго застреваете в явно нездоровых отношениях. У вас есть внутренний фильтр, который помогает отличать здоровую дружбу от изматывающих сценариев.',
        'en':
            'You generally treat yourself with care in friendships and rarely stay stuck in clearly unhealthy relationships for long. You have an inner filter that helps you distinguish healthy friendships from exhausting ones.',
      },
      whyThisProfile: {
        'ru':
            'Ваш индекс риска показывает, что вы в целом умеете замечать тревожные звоночки, не терпите откровенное неуважение и способны ставить границы.',
        'en':
            'Your risk index suggests that you\'re quite attentive to yourself in friendships: you notice warning signs, don\'t tolerate blatant disrespect for long, and can set boundaries.',
      },
      strengths: {
        'ru': [
          'Умеете замечать тревожные звоночки',
          'Можете постепенно дистанцироваться от токсичных людей',
          'Цените спокойные, надёжные связи',
          'Понимаете разницу между здоровыми конфликтами и хронической токсичностью',
        ],
        'en': [
          'You notice warning signs',
          'Can gradually distance from toxic people',
          'Appreciate calm, reliable connections',
          'Understand the difference between healthy conflicts and chronic toxicity',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Иногда можете быть слишком жёстким к людям',
          'Риск перфекционизма в отношениях',
        ],
        'en': [
          'Sometimes may be too strict with people',
          'Risk of perfectionism in relationships',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте опираться на свои критерии уважительного отношения',
          'Иногда проверяйте: не стали ли вы слишком жёстким к людям и себе',
          'Позволяйте отношениям быть живыми и неидеальными',
          'Поделитесь своим опытом с теми, кто хуже различает red flags',
        ],
        'en': [
          'Keep trusting your criteria for respectful behavior',
          'Occasionally check whether you\'ve become too strict',
          'Allow relationships to be alive and imperfect',
          'Share your experience with those who struggle to see red flags',
        ],
      },
      tryToday: {
        'ru':
            'Проанализируйте одну дружбу: что именно делает её безопасной и приятной для вас? Запишите эти критерии.',
        'en':
            'Analyze one friendship: what exactly makes it safe and enjoyable for you? Write down these criteria.',
      },
      inspiringConclusion: {
        'ru':
            'У вас есть ценный навык — умение выбирать здоровых друзей. Доверяйте себе и продолжайте заботиться о своих границах!',
        'en':
            'You have a valuable skill — the ability to choose healthy friends. Trust yourself and continue to care for your boundaries!',
      },
    ),
    'profile_moderate_risk': TestProfile(
      id: 'profile_moderate_risk',
      name: {
        'ru': 'Умеренный риск токсичных дружеских сценариев',
        'en': 'Moderate Risk of Toxic Friendship Patterns',
      },
      description: {
        'ru':
            'Иногда вы выбираете не самых здоровых друзей или терпите лишнее, но у вас уже есть ресурсы, чтобы менять эту ситуацию. В дружбе у вас есть как здоровые, так и рискованные паттерны.',
        'en':
            'At times you choose less-than-healthy friends or tolerate too much, but you already have resources to change that. Your friendships show a mix of healthy and risky patterns.',
      },
      whyThisProfile: {
        'ru':
            'В одних ситуациях вы замечаете, что что-то не ок, и можете отойти, в других — остаётесь там, где вас задевают, обесценивают или втягивают в бесконечную драму.',
        'en':
            'In some situations, you notice that something is off and can step back; in others, you stay where you feel hurt, devalued, or pulled into endless drama.',
      },
      strengths: {
        'ru': [
          'Есть понимание, что такое здоровая дружба',
          'Способны анализировать свои отношения',
          'Готовы к изменениям',
          'Уже умеете защищать себя в некоторых ситуациях',
        ],
        'en': [
          'Understanding of what healthy friendship is',
          'Able to analyze your relationships',
          'Ready for changes',
          'Already know how to protect yourself in some situations',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Старые сценарии "надо терпеть" и "не быть одиночкой"',
          'Иногда игнорируете тревожные сигналы',
          'Трудности с постановкой границ в некоторых ситуациях',
        ],
        'en': [
          'Old scripts "I must endure" and "better than being alone"',
          'Sometimes ignore warning signs',
          'Difficulty setting boundaries in some situations',
        ],
      },
      recommendations: {
        'ru': [
          'Выберите одну конкретную ситуацию в дружбе и потренируйтесь мягко обозначать там свои границы',
          'Обратите внимание, после каких людей вы чувствуете себя опустошённым, а после каких — живым',
          'Запишите 3-4 признака здоровой дружбы и периодически сверяйтесь с ними',
          'Читайте книги о границах и созависимости',
        ],
        'en': [
          'Pick one specific friendship situation and practice gently stating your boundaries there',
          'Notice after which people you feel drained and after which you feel alive',
          'Write down 3-4 signs of healthy friendship and check against them periodically',
          'Read books about boundaries and codependency',
        ],
      },
      tryToday: {
        'ru':
            'Выберите одну ситуацию, где вы обычно говорите "да", хотя хотите сказать "нет". Попробуйте мягко отказать.',
        'en':
            'Choose one situation where you usually say "yes" when you want to say "no". Try to gently decline.',
      },
      inspiringConclusion: {
        'ru':
            'Вы на правильном пути! Небольшие, осознанные изменения уже могут заметно повысить качество дружбы в вашей жизни.',
        'en':
            'You\'re on the right track! Small, intentional changes can already noticeably upgrade the quality of friendships in your life.',
      },
    ),
    'profile_elevated_risk': TestProfile(
      id: 'profile_elevated_risk',
      name: {
        'ru': 'Повышенный риск токсичных дружеских сценариев',
        'en': 'Elevated Risk of Toxic Friendship Patterns',
      },
      description: {
        'ru':
            'Похоже, вы довольно часто оказываетесь в дружбе, где вам больно или неуважительно, и не всегда успеваете себя защитить. Вы заметно уязвимы к нездоровым дружеским сценариям.',
        'en':
            'It seems you often end up in friendships that hurt you or feel disrespectful, and you don\'t always manage to protect yourself. You\'re quite vulnerable to unhealthy friendship patterns.',
      },
      whyThisProfile: {
        'ru':
            'Возможно, вы выбираете людей с бурным характером, склонны оправдывать их поведение, долго терпите неуважение и редко ставите жёсткие границы, когда вам плохо.',
        'en':
            'You may be drawn to intense personalities, tend to justify their behavior, tolerate disrespect for a long time, and rarely set firm boundaries when you are hurt.',
      },
      strengths: {
        'ru': [
          'Способность к глубокой привязанности',
          'Готовность давать людям второй шанс',
          'Эмпатия и понимание сложности людей',
        ],
        'en': [
          'Ability for deep attachment',
          'Willingness to give people a second chance',
          'Empathy and understanding of people\'s complexity',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Выбор людей с бурным характером',
          'Оправдание токсичного поведения',
          'Долгое терпение неуважения',
          'Трудности с постановкой жёстких границ',
          'Убеждение, что драма = норма близости',
        ],
        'en': [
          'Choosing people with intense personalities',
          'Justifying toxic behavior',
          'Long tolerance of disrespect',
          'Difficulty setting firm boundaries',
          'Belief that drama equals closeness',
        ],
      },
      recommendations: {
        'ru': [
          'Составьте список конкретных "красных флажков", которые вы больше не готовы терпеть',
          'Потренируйтесь выбирать себя: сократить общение, не писать первым, честно сказать о чувствах',
          'Подумайте о поддержке психолога для разбора старых сценариев',
          'Читайте о созависимости и границах',
          'Найдите сообщество людей, работающих над похожими темами',
        ],
        'en': [
          'Make a list of specific red flags you\'re no longer willing to tolerate',
          'Practice choosing yourself: reduce contact, stop texting first, honestly share how you feel',
          'Consider getting support from a therapist to unpack old scripts',
          'Read about codependency and boundaries',
          'Find a community of people working on similar themes',
        ],
      },
      tryToday: {
        'ru':
            'Напишите список из 3 "красных флажков", которые вы больше не готовы терпеть. Повесьте его на видное место.',
        'en':
            'Write a list of 3 red flags you\'re no longer willing to tolerate. Put it somewhere visible.',
      },
      inspiringConclusion: {
        'ru':
            'У вас есть право на дружбу без постоянной боли и унижения. Маленькие шаги в сторону осознанности уже могут сильно повлиять на вашу жизнь!',
        'en':
            'You deserve friendships without constant pain and humiliation. Small steps toward awareness can significantly impact your life!',
      },
    ),
    'profile_high_risk': TestProfile(
      id: 'profile_high_risk',
      name: {
        'ru': 'Высокий риск токсичных дружеских сценариев',
        'en': 'High Risk of Toxic Friendship Patterns',
      },
      description: {
        'ru':
            'Судя по результатам, дружба часто приносит вам боль, драму и ощущение, что вы постоянно предаёте себя ради других. Вы можете регулярно выбирать друзей, рядом с которыми вам небезопасно.',
        'en':
            'Your results suggest that friendship often brings you pain, drama, and the feeling that you constantly betray yourself for others. You may frequently choose friends who don\'t feel emotionally safe.',
      },
      whyThisProfile: {
        'ru':
            'Вы часто терпите неуважение, игнорируете тревожные сигналы и жертвуете собой ради сохранения связи. Образ "токсичных друзей" для вас слишком знаком и даже кажется нормой.',
        'en':
            'You often tolerate disrespect, ignore warning signs, and sacrifice yourself to keep the connection. The image of "toxic friends" might feel very familiar to you and even seem like the norm.',
      },
      strengths: {
        'ru': [
          'Готовность работать над собой (раз вы прошли этот тест)',
          'Глубокая способность к привязанности',
          'Эмпатия и понимание',
        ],
        'en': [
          'Willingness to work on yourself (since you took this test)',
          'Deep capacity for attachment',
          'Empathy and understanding',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Регулярный выбор небезопасных друзей',
          'Частое терпение неуважения',
          'Игнорирование тревожных сигналов',
          'Жертва собой ради сохранения связи',
          'Убеждение "меня можно любить только, если я терплю всё"',
        ],
        'en': [
          'Frequently choosing unsafe friends',
          'Often tolerating disrespect',
          'Ignoring warning signs',
          'Sacrificing yourself to keep connections',
          'Belief "I can only be loved if I put up with everything"',
        ],
      },
      recommendations: {
        'ru': [
          'Найдите хотя бы одного человека, с которым можно честно поговорить о ваших дружеских сценариях',
          'Начните с мини-границ: не отвечать сразу, не оправдываться за отказ, замечать где больно',
          'ОБЯЗАТЕЛЬНО рассмотрите регулярную психотерапию для изменения глубинных убеждений',
          'Найдите группу поддержки или сообщество людей с похожим опытом',
          'Читайте книги о созависимости и границах',
          'Будьте готовы к тому, что некоторые "друзья" уйдут — и это нормально',
        ],
        'en': [
          'Find at least one person with whom you can honestly discuss your friendship patterns',
          'Start with micro-boundaries: don\'t reply immediately, don\'t over-explain your "no", notice where you\'re hurt',
          'DEFINITELY consider regular therapy to shift deep beliefs',
          'Find a support group or community of people with similar experiences',
          'Read books about codependency and boundaries',
          'Be prepared that some "friends" will leave — and that\'s okay',
        ],
      },
      tryToday: {
        'ru':
            'Найдите один ресурс о созависимости или границах (книга, видео, статья). Начните изучать эту тему.',
        'en':
            'Find one resource about codependency or boundaries (book, video, article). Start learning about this topic.',
      },
      inspiringConclusion: {
        'ru':
            'Это не приговор и не повод для стыда. Многие ваши стратегии когда-то помогали выживать. Сейчас главный шаг — перестать оставаться с этим в одиночестве. Вы заслуживаете дружбы, где вам не больно.',
        'en':
            'This is not a verdict or a reason for shame. Many of your strategies once helped you survive. The key step now is not to stay alone with this. You deserve friendships where you don\'t hurt.',
      },
    ),
  };
}
