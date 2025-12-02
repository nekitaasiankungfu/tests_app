import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data for the Mental Age: Style of Adulthood Test.
///
/// Measures 4 life-stage patterns through 36 behavioral questions.
/// - Test ID: mental_age_lifespan_styles_v1
/// - Questions: 36 (9 per factor)
/// - Scoring: 0-4 (Likert 5-point: Strongly disagree to Strongly agree)
/// - 4 reversed questions (Q13, Q14, Q15, Q16)
/// - 4 factors: inner_child, teen_rebel, young_adult, inner_elder
/// - 4 profiles based on mental_age_index (composite score)
///
/// IMPORTANT: This test is NOT about chronological age or intelligence.
class MentalAgeLifespanStylesData {
  /// Get the complete test model
  static TestModel getMentalAgeLifespanStylesTest() {
    return TestModel(
      id: 'mental_age_lifespan_styles_v1',
      title: {
        'ru': 'Ментальный возраст: стиль взрослости',
        'en': 'Mental Age: Style of Adulthood',
      },
      description: {
        'ru':
            'Тест помогает оценить ваш условный «ментальный возраст» — то, как вы думаете, принимаете решения и относитесь к жизни: по-детски, по-подростковому, как молодой взрослый или как мудрый старший',
        'en':
            'This test helps you estimate your metaphorical \'mental age\' – how you think, make decisions, and relate to life: more like a child, a teenager, a young adult, or a wise elder',
      },
      category: {
        'ru': 'Типология личности',
        'en': 'Personality Typology',
      },
      categoryId: 'personality',
      questions: _buildQuestions(),
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: [
        'inner_child',
        'teen_rebel',
        'young_adult',
        'inner_elder',
      ],
      disclaimer: {
        'ru':
            '⚠️ ВАЖНО: Этот тест НЕ про календарный возраст и НЕ про интеллект. «Ментальный возраст» здесь — метафора вашего доминирующего жизненного стиля. Результаты предназначены для самонаблюдения и личностного роста, а не для клинической диагностики.',
        'en':
            '⚠️ IMPORTANT: This test is NOT about chronological age or intelligence. \'Mental age\' here is a metaphor for your dominant life-style pattern. Results are for self-reflection and personal growth, not clinical diagnosis.',
      },
    );
  }

  /// Build all 36 questions (9 per factor)
  static List<QuestionModel> _buildQuestions() {
    return [
      // Inner Child (Q1, Q5, Q9, Q13R, Q17, Q21, Q25, Q29, Q33) - 9 questions
      QuestionModel(
        id: 'q1',
        text: {
          'ru':
              'Когда у меня появляется свободный вечер, я чаще выбираю что-то весёлое и спонтанное, а не «полезное».',
          'en':
              'When I have a free evening, I\'m more likely to choose something fun and spontaneous rather than something \'useful\'.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_child',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru':
              'Когда кто-то пытается объяснить мне, как «правильно» жить, внутри сразу появляется желание сделать наоборот.',
          'en':
              'When someone tries to tell me how I \'should\' live, I immediately feel like doing the opposite.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'teen_rebel',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru':
              'У меня есть хотя бы примерный план, чего я хочу добиться в ближайшие несколько лет.',
          'en':
              'I have at least a rough plan of what I want to achieve in the next few years.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'young_adult',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru':
              'Я часто думаю о том, как мои сегодняшние решения скажутся на мне через 5–10 лет.',
          'en':
              'I often think about how my decisions today will affect me in 5–10 years.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_elder',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru':
              'Мне легко увлечься чем-то вроде игр, сериалов или мемов настолько, что я забываю о делах.',
          'en':
              'It\'s easy for me to get so absorbed in games, shows, or memes that I forget about my tasks.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_child',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru':
              'Когда мне ставят жёсткие правила, я сначала думаю, как их можно обойти.',
          'en':
              'When strict rules are imposed on me, my first thought is how I can get around them.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'teen_rebel',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru':
              'Даже если мне лень или страшно, я стараюсь доводить важные дела до конца.',
          'en':
              'Even when I feel lazy or scared, I try to follow through with important things.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'young_adult',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru':
              'Я всё чаще ценю спокойные, предсказуемые дни больше, чем бурные события.',
          'en':
              'More and more, I value calm, predictable days over intense events.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_elder',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q9',
        text: {
          'ru':
              'Мне легко забыть о времени, когда я играю, рисую, что-то мастерю или просто дурачусь.',
          'en':
              'I easily lose track of time when I\'m playing, drawing, crafting, or just goofing around.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_child',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru':
              'Мне сложно спокойно принять ситуацию, когда кто-то «надо мной главный».',
          'en':
              'I find it hard to calmly accept situations where someone is \'in charge of me\'.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'teen_rebel',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'Я регулярно думаю о финансах, работе или учёбе, даже если это не всегда приятно.',
          'en':
              'I regularly think about my finances, work, or studies, even if it\'s not always pleasant.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'young_adult',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru':
              'Я часто ловлю себя на том, что сравниваю нынешнюю жизнь с тем, как всё было «раньше».',
          'en':
              'I often catch myself comparing my current life to how things were \'back then\'.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_elder',
        isReversed: false,
      ),

      // Reversed questions (Q13-Q16)
      QuestionModel(
        id: 'q13',
        text: {
          'ru':
              'Мне проще чувствовать себя серьёзным и собранным, чем позволить себе быть лёгким и игривым.',
          'en':
              'It\'s easier for me to stay serious and composed than to allow myself to be light and playful.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_child',
        isReversed: true, // REVERSED
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru':
              'Внутренний протест у меня почти не возникает, даже если правила кажутся странными.',
          'en':
              'I rarely feel inner protest, even when rules seem strange to me.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'teen_rebel',
        isReversed: true, // REVERSED
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru':
              'Я чаще иду по течению, чем ставлю перед собой конкретные цели.',
          'en':
              'I more often just go with the flow than set specific goals for myself.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'young_adult',
        isReversed: true, // REVERSED
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru':
              'Я редко задумываюсь о том, что оставлю после себя людям или миру.',
          'en':
              'I rarely think about what I will leave behind for people or the world.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_elder',
        isReversed: true, // REVERSED
      ),

      // Continue with normal questions
      QuestionModel(
        id: 'q17',
        text: {
          'ru':
              'Мне важно, чтобы в моей жизни оставалось место для игр, творчества и «глупостей».',
          'en':
              'It\'s important for me to keep space in my life for play, creativity, and \'silly\' things.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_child',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru':
              'Я остро реагирую, когда чувствую несправедливость, даже если это меня почти не касается.',
          'en':
              'I react strongly when I sense injustice, even if it barely affects me directly.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'teen_rebel',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru':
              'У меня есть хотя бы несколько привычек, которые помогают держаться в форме (режим сна, спорт, учёба и т.п.).',
          'en':
              'I have at least a few habits that help me stay on track (sleep routine, exercise, studying, etc.).',
        },
        answers: _buildLikertAnswers(),
        factorId: 'young_adult',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru':
              'Я всё чаще предпочитаю вложиться в несколько близких людей, чем распыляться на огромное количество знакомств.',
          'en':
              'More and more, I prefer investing in a few close people rather than spreading myself across many acquaintances.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_elder',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru':
              'Иногда я веду себя так, будто жизнь — это в первую очередь игра, а потом уже обязанности.',
          'en':
              'Sometimes I act as if life is mostly a game first and responsibilities second.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_child',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru':
              'Я склонен(на) спорить с любыми авторитетами — от родителей и начальников до общественного мнения.',
          'en':
              'I tend to argue with any authority figures – from parents and bosses to public opinion.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'teen_rebel',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru':
              'Мне важно, чтобы за моими решениями стояла какая-то логика и система, а не только эмоции.',
          'en':
              'It matters to me that my decisions are based on some kind of logic and system, not just emotions.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'young_adult',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru':
              'Я стараюсь не тратить силы на лишнюю драму, а сохранять энергию для действительно важного.',
          'en':
              'I try not to spend energy on unnecessary drama and save my strength for what really matters.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_elder',
        isReversed: false,
      ),

      // NEW QUESTIONS (Q25-Q36) - Expansion to 36 questions total

      // Inner Child (Q25, Q29, Q33) - Additional playfulness/spontaneity contexts
      QuestionModel(
        id: 'q25',
        text: {
          'ru':
              'Мне нравится покупать мелочи «просто так», даже если они не особо нужны — просто потому что они симпатичные или весёлые.',
          'en':
              'I like buying little things \'just because\', even if I don\'t really need them – simply because they\'re cute or fun.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_child',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru':
              'Когда я вижу детскую площадку с качелями или каруселью, меня тянет попробовать, даже если рядом нет детей.',
          'en':
              'When I see a playground with swings or a merry-go-round, I feel drawn to try it, even if there are no kids around.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_child',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru':
              'Я могу внезапно изменить планы, если появилось что-то более интересное и весёлое.',
          'en':
              'I can suddenly change my plans if something more interesting and fun comes up.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_child',
        isReversed: false,
      ),

      // Teen Rebel (Q26, Q30, Q34) - Additional rebellion/autonomy contexts
      QuestionModel(
        id: 'q26',
        text: {
          'ru':
              'Если мне говорят «это невозможно» или «так не делают», я сразу хочу проверить, правда ли это.',
          'en':
              'If someone tells me \'that\'s impossible\' or \'nobody does it that way\', I immediately want to test whether that\'s really true.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'teen_rebel',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru':
              'Мне важнее понять, почему я должен следовать правилу, чем просто подчиниться ему.',
          'en':
              'It\'s more important for me to understand why I should follow a rule than to simply obey it.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'teen_rebel',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru':
              'Когда все вокруг думают одинаково, у меня автоматически появляется желание найти другую точку зрения.',
          'en':
              'When everyone around me thinks the same way, I automatically feel the urge to find a different perspective.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'teen_rebel',
        isReversed: false,
      ),

      // Young Adult (Q27, Q31, Q35) - Additional responsibility/planning contexts
      QuestionModel(
        id: 'q27',
        text: {
          'ru':
              'Даже когда устаю, я стараюсь доделать начатое, а не бросать на полпути.',
          'en':
              'Even when I\'m tired, I try to finish what I started rather than abandon it halfway.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'young_adult',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru':
              'Я веду учёт своих финансов: знаю, сколько трачу и на что откладываю.',
          'en':
              'I track my finances: I know how much I spend and what I\'m saving for.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'young_adult',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru':
              'Прежде чем принять важное решение, я собираю информацию и взвешиваю плюсы и минусы.',
          'en':
              'Before making an important decision, I gather information and weigh the pros and cons.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'young_adult',
        isReversed: false,
      ),

      // Inner Elder (Q28, Q32, Q36) - Additional wisdom/reflection contexts
      QuestionModel(
        id: 'q28',
        text: {
          'ru':
              'Я часто задумываюсь о смысле жизни и о том, что хочу оставить после себя.',
          'en':
              'I often think about the meaning of life and what I want to leave behind.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_elder',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru':
              'Мне больше нравится провести время с несколькими близкими людьми, чем с большой шумной компанией.',
          'en':
              'I prefer spending time with a few close people rather than a large noisy crowd.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_elder',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru':
              'Я уже достаточно хорошо знаю себя, чтобы не гнаться за чужими ожиданиями и модными трендами.',
          'en':
              'I know myself well enough not to chase others\' expectations or fashionable trends.',
        },
        answers: _buildLikertAnswers(),
        factorId: 'inner_elder',
        isReversed: false,
      ),
    ];
  }

  /// Build standard Likert 5-point answers (0-4)
  static List<AnswerModel> _buildLikertAnswers() {
    return [
      AnswerModel(
        id: 'a0',
        text: {'ru': 'Совершенно не согласен', 'en': 'Strongly disagree'},
        score: 0,
      ),
      AnswerModel(
        id: 'a1',
        text: {'ru': 'Скорее не согласен', 'en': 'Disagree'},
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {'ru': 'Нейтрально', 'en': 'Neutral'},
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {'ru': 'Скорее согласен', 'en': 'Agree'},
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {'ru': 'Полностью согласен', 'en': 'Strongly agree'},
        score: 4,
      ),
    ];
  }

  /// Get factor names (4 life-stage patterns)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'inner_child': {
        'ru': 'Вечный ребёнок',
        'en': 'Inner Child',
      },
      'teen_rebel': {
        'ru': 'Подросток-бунтарь',
        'en': 'Teen Rebel',
      },
      'young_adult': {
        'ru': 'Молодой взрослый',
        'en': 'Young Adult',
      },
      'inner_elder': {
        'ru': 'Внутренний мудрый старший',
        'en': 'Inner Elder',
      },
    };
  }

  /// Get factor interpretation based on percentage (0-100)
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // NaN protection
    if (percentage.isNaN || percentage.isInfinite) {
      return {
        'ru': 'Недостаточно данных для интерпретации',
        'en': 'Insufficient data for interpretation',
      };
    }

    switch (factorId) {
      case 'inner_child':
        if (percentage >= 75) {
          return {
            'ru':
                'Очень высокий уровень: Вы живёте спонтанностью, игрой и удовольствием «здесь и сейчас». Важные дела могут откладываться.',
            'en':
                'Very high: You live by spontaneity, play, and pleasure in the \'here and now\'. Important tasks may be postponed.',
          };
        } else if (percentage >= 50) {
          return {
            'ru':
                'Высокий уровень: Внутренний ребёнок активно влияет на вашу жизнь, принося креативность и лёгкость.',
            'en':
                'High: Your inner child actively influences your life, bringing creativity and ease.',
          };
        } else if (percentage >= 25) {
          return {
            'ru':
                'Умеренный уровень: Вы сохраняете контакт с игривостью, но не позволяете ей доминировать.',
            'en':
                'Moderate: You maintain contact with playfulness without letting it dominate.',
          };
        } else {
          return {
            'ru':
                'Низкий уровень: Игривость и спонтанность проявляются редко. Возможно, вам не хватает лёгкости.',
            'en':
                'Low: Playfulness and spontaneity rarely show up. You might lack some lightness.',
          };
        }

      case 'teen_rebel':
        if (percentage >= 75) {
          return {
            'ru':
                'Очень высокий уровень: Сильная протестность и чувствительность к ограничениям. Постоянный внутренний бунт.',
            'en':
                'Very high: Strong rebelliousness and sensitivity to constraints. Constant inner rebellion.',
          };
        } else if (percentage >= 50) {
          return {
            'ru':
                'Высокий уровень: Вы цените свободу и независимость, часто оспариваете правила и авторитеты.',
            'en':
                'High: You value freedom and independence, often challenging rules and authorities.',
          };
        } else if (percentage >= 25) {
          return {
            'ru':
                'Умеренный уровень: Вы сохраняете здоровый скептицизм к правилам, но не живёте в постоянном протесте.',
            'en':
                'Moderate: You maintain healthy skepticism toward rules without living in constant protest.',
          };
        } else {
          return {
            'ru':
                'Низкий уровень: Протест возникает редко. Возможно, вам не хватает смелости отстаивать свои границы.',
            'en':
                'Low: Protest rarely emerges. You might lack courage to defend your boundaries.',
          };
        }

      case 'young_adult':
        if (percentage >= 75) {
          return {
            'ru':
                'Очень высокий уровень: Вы живёте в режиме строительства жизни: цели, планы, ответственность доминируют.',
            'en':
                'Very high: You live in \'life-building\' mode: goals, plans, and responsibility dominate.',
          };
        } else if (percentage >= 50) {
          return {
            'ru':
                'Высокий уровень: Вы умеете планировать, брать ответственность и работать на долгосрочную перспективу.',
            'en':
                'High: You can plan, take responsibility, and work toward long-term goals.',
          };
        } else if (percentage >= 25) {
          return {
            'ru':
                'Умеренный уровень: Вы находите баланс между «хочу» и «надо», но иногда колеблетесь.',
            'en':
                'Moderate: You find balance between \'want\' and \'should\', but sometimes waver.',
          };
        } else {
          return {
            'ru':
                'Низкий уровень: Планирование и ответственность даются с трудом. Возможно, вам не хватает структуры.',
            'en':
                'Low: Planning and responsibility are challenging. You might lack structure.',
          };
        }

      case 'inner_elder':
        if (percentage >= 75) {
          return {
            'ru':
                'Очень высокий уровень: Вы смотрите на жизнь с высоты опыта, цените стабильность и простоту.',
            'en':
                'Very high: You view life from the height of experience, valuing stability and simplicity.',
          };
        } else if (percentage >= 50) {
          return {
            'ru':
                'Высокий уровень: Вы склонны к рефлексии, заботе о будущем и долгосрочным последствиям.',
            'en':
                'High: You tend toward reflection, concern for the future, and long-term consequences.',
          };
        } else if (percentage >= 25) {
          return {
            'ru':
                'Умеренный уровень: Вы учитываете последствия, но не зацикливаетесь на осторожности.',
            'en':
                'Moderate: You consider consequences without being overly cautious.',
          };
        } else {
          return {
            'ru':
                'Низкий уровень: Рефлексия и забота о долгосрочном будущем проявляются редко.',
            'en':
                'Low: Reflection and concern for long-term future rarely show up.',
          };
        }

      default:
        return {
          'ru': 'Неизвестный фактор',
          'en': 'Unknown factor',
        };
    }
  }

  /// Determine profile ID based on mental_age_index
  /// Formula: mental_age_raw = (young_adult_raw + inner_elder_raw) - (inner_child_raw + teen_rebel_raw) + 48
  /// Then normalize: 0-96 → 0-100
  static String determineProfile(Map<String, double> percentages) {
    // NaN protection
    final innerChild =
        percentages['inner_child']?.isFinite == true ? percentages['inner_child']! : 50.0;
    final teenRebel =
        percentages['teen_rebel']?.isFinite == true ? percentages['teen_rebel']! : 50.0;
    final youngAdult =
        percentages['young_adult']?.isFinite == true ? percentages['young_adult']! : 50.0;
    final innerElder =
        percentages['inner_elder']?.isFinite == true ? percentages['inner_elder']! : 50.0;

    // Convert percentages (0-100) back to raw scores (0-36)
    // Each factor: 9 questions × 4 max score = 36 max raw score
    final innerChildRaw = (innerChild / 100) * 36;
    final teenRebelRaw = (teenRebel / 100) * 36;
    final youngAdultRaw = (youngAdult / 100) * 36;
    final innerElderRaw = (innerElder / 100) * 36;

    // Apply formula: mental_age_raw = (mature factors) - (immature factors) + center_offset
    // Center offset = 72 (half of max range 144) to shift from [-72, 72] to [0, 144]
    double mentalAgeRaw =
        (youngAdultRaw + innerElderRaw) - (innerChildRaw + teenRebelRaw) + 72;

    // Clamp to 0-144
    if (mentalAgeRaw < 0) mentalAgeRaw = 0;
    if (mentalAgeRaw > 144) mentalAgeRaw = 144;

    // Normalize to 0-100
    final mentalAgeIndex = (mentalAgeRaw / 144) * 100;

    // Determine profile by threshold
    if (mentalAgeIndex <= 24) {
      return 'mental_child';
    } else if (mentalAgeIndex <= 39) {
      return 'mental_teen';
    } else if (mentalAgeIndex <= 64) {
      return 'mental_young_adult';
    } else {
      return 'mental_elder';
    }
  }

  /// Get profile by ID
  static TestProfile? getProfile(String profileId) {
    final profiles = {
      'mental_child': TestProfile(
        id: 'mental_child',
        name: {
          'ru': 'Ментальный возраст: вечный ребёнок',
          'en': 'Mental Age: Eternal Child',
        },
        description: {
          'ru':
              'Ваша психика сейчас живёт в режиме игры, спонтанности и «здесь и сейчас». Ответственность и долгосрочные планы могут казаться скучными или второстепенными.',
          'en':
              'Your psyche is currently living in a mode of play, spontaneity, and \'here and now\'. Responsibility and long-term plans may feel boring or secondary.',
        },
        whyThisProfile: {
          'ru':
              'Ваш условный ментальный возраст смещён в сторону внутреннего ребёнка. Это даёт живость, креативность, способность радоваться мелочам и быстро переключаться с одной идеи на другую. С вами легко и интересно — вы умеете замечать возможности для игры там, где другие видят рутину.\n\nПри этом есть риск, что важные дела, деньги, учёба или работа будут откладываться до последнего. Сложно удерживать скучные задачи, выдерживать ограничения и делать выбор «в пользу будущего». Иногда вы можете чувствовать себя непонятым среди тех, кто живёт по жёсткому расписанию.',
          'en':
              'Your metaphorical mental age leans toward the inner child. This gives you vibrancy, creativity, the ability to enjoy little things, and to switch quickly between ideas. People may find you fun and inspiring – you see opportunities for play where others see routine.\n\nAt the same time, there is a risk of postponing important matters, money issues, studying, or work until the last moment. It can be hard to stick with boring tasks, tolerate constraints, and choose in favor of your future. You might sometimes feel misunderstood by people who live by a strict schedule.',
        },
        strengths: {
          'ru': [
            '✨ **Живость и креативность**: Вы умеете находить радость в простых вещах',
            '✨ **Гибкость мышления**: Легко переключаетесь между идеями',
            '✨ **Игривость**: С вами интересно и весело',
            '✨ **Спонтанность**: Открыты новым возможностям',
          ],
          'en': [
            '✨ **Vibrancy and creativity**: You find joy in simple things',
            '✨ **Mental flexibility**: You switch easily between ideas',
            '✨ **Playfulness**: You\'re fun and interesting to be around',
            '✨ **Spontaneity**: You\'re open to new possibilities',
          ],
        },
        vulnerabilities: {
          'ru': [
            '⚠️ **Откладывание важных дел**: Сложно заниматься «скучными» обязанностями',
            '⚠️ **Трудности с долгосрочным планированием**: Будущее кажется далёким',
            '⚠️ **Ограничения тяжелы**: Правила и рамки вызывают сопротивление',
            '⚠️ **Непонимание окружающих**: Кажется, что другие «слишком серьёзные»',
          ],
          'en': [
            '⚠️ **Postponing important matters**: Hard to deal with \'boring\' obligations',
            '⚠️ **Long-term planning struggles**: The future feels distant',
            '⚠️ **Constraints are heavy**: Rules and limits trigger resistance',
            '⚠️ **Others don\'t understand**: People seem \'too serious\'',
          ],
        },
        recommendations: {
          'ru': [
            '💡 Заведите 1-2 очень простые взрослые привычки и относитесь к ним как к игре с самим собой',
            '💡 Разделяйте время «чистой игры» и время «минимальных обязательств»',
            '💡 Создавайте игровые правила и награды для важных задач',
          ],
          'en': [
            '💡 Introduce 1-2 very simple \'adult\' habits and treat them as a game with yourself',
            '💡 Separate time for \'pure play\' from time for \'minimal obligations\'',
            '💡 Turn important tasks into small games with rules and rewards',
          ],
        },
        tryToday: {
          'ru':
              '🎯 **Попробуйте сегодня**: Выберите одну «взрослую» задачу (оплатить счёт, навести порядок) и превратите её в игру с таймером на 15 минут. Наградите себя чем-то приятным после завершения.',
          'en':
              '🎯 **Try today**: Choose one \'adult\' task (pay a bill, tidy up) and turn it into a 15-minute game with a timer. Reward yourself with something pleasant afterward.',
        },
        inspiringConclusion: {
          'ru':
              '🌟 **Помните**: Ваш внутренний ребёнок — это ценный дар. Задача не в том, чтобы «вырасти насильно», а в том, чтобы добавить рядом заботливого взрослого, который помогает планировать, защищать ресурсы и завершать начатое. Играйте — но не забывайте строить.',
          'en':
              '🌟 **Remember**: Your inner child is a precious gift. The goal is not to \'force yourself to grow up\', but to add a caring inner adult next to them – someone who helps you plan, protect your resources, and finish what you start. Play – but don\'t forget to build.',
        },
      ),
      'mental_teen': TestProfile(
        id: 'mental_teen',
        name: {
          'ru': 'Ментальный возраст: подросток-бунтарь',
          'en': 'Mental Age: Teen Rebel',
        },
        description: {
          'ru':
              'Вы живёте в логике поиска себя, свободы и собственного мнения. Важно идти «по-своему», даже если это идёт вразрез с ожиданиями окружающих.',
          'en':
              'You live in the logic of searching for yourself, freedom, and your own opinion. It\'s important for you to do things \'your way\', even if it conflicts with others\' expectations.',
        },
        whyThisProfile: {
          'ru':
              'Ваш условный ментальный возраст ближе к подростковому этапу. Это время внутреннего бунта, поиска идентичности и проверки границ. Вы чувствительны к несправедливости, любите задавать неудобные вопросы и не готовы просто «жить как все». Это даёт много энергии для изменений и смелых решений.\n\nОбратная сторона — постоянное напряжение в контакте с авторитетами и правилами. Иногда вы можете спорить уже по привычке, даже когда часть ограничений действительно защищает вас. При сильном перекосе жизнь превращается в бесконечный протест, в котором сложно заметить свои настоящие желания.',
          'en':
              'Your metaphorical mental age is close to the teenage stage. This is a time of inner rebellion, identity search, and boundary testing. You\'re sensitive to injustice, like asking uncomfortable questions, and are not willing to \'live like everyone else\'. This brings a lot of energy for change and bold decisions.\n\nThe downside is chronic tension around authorities and rules. Sometimes you may argue out of habit, even when some limits genuinely protect you. If this pattern dominates, life can turn into endless protest where it\'s hard to notice what you actually want.',
        },
        strengths: {
          'ru': [
            '✨ **Чувство справедливости**: Вы замечаете неправду и не молчите',
            '✨ **Смелость**: Не боитесь идти против течения',
            '✨ **Независимость**: Цените свободу и автономию',
            '✨ **Энергия перемен**: Готовы экспериментировать и искать новое',
          ],
          'en': [
            '✨ **Sense of justice**: You notice unfairness and speak up',
            '✨ **Courage**: You\'re not afraid to go against the current',
            '✨ **Independence**: You value freedom and autonomy',
            '✨ **Energy for change**: You\'re ready to experiment and seek new paths',
          ],
        },
        vulnerabilities: {
          'ru': [
            '⚠️ **Постоянное напряжение**: Протест отнимает много сил',
            '⚠️ **Споры по привычке**: Иногда бунт идёт автоматически',
            '⚠️ **Трудно принять ограничения**: Даже полезные правила вызывают сопротивление',
            '⚠️ **Сложно услышать себя**: За протестом можно не заметить свои истинные желания',
          ],
          'en': [
            '⚠️ **Chronic tension**: Protest drains a lot of energy',
            '⚠️ **Arguing by habit**: Sometimes rebellion is automatic',
            '⚠️ **Hard to accept limits**: Even helpful rules trigger resistance',
            '⚠️ **Hard to hear yourself**: Behind the protest, you might miss your true desires',
          ],
        },
        recommendations: {
          'ru': [
            '💡 Перед тем как спорить, спросите себя: «Что я хочу построить вместо этого?»',
            '💡 Ищите сообщества, где свобода сочетается с уважением границ',
            '💡 Отмечайте, когда протест помогает расти, а когда только забирает силы',
          ],
          'en': [
            '💡 Before you argue, ask yourself: \'What do I want to build instead?\'',
            '💡 Look for communities where freedom is combined with respect for boundaries',
            '💡 Notice when your protest helps you grow and when it merely drains your energy',
          ],
        },
        tryToday: {
          'ru':
              '🎯 **Попробуйте сегодня**: Когда почувствуете желание спорить с чьим-то мнением, сделайте паузу на 10 секунд и спросите себя: «Это действительно важно для меня, или я просто реагирую автоматически?»',
          'en':
              '🎯 **Try today**: When you feel like arguing with someone\'s opinion, pause for 10 seconds and ask yourself: \'Is this truly important to me, or am I just reacting automatically?\'',
        },
        inspiringConclusion: {
          'ru':
              '🌟 **Помните**: Ваш внутренний бунтарь — это ценная сила. Сохраните живой протест против того, что вам действительно не подходит, но научитесь выбирать битвы: где бороться, а где направить энергию на создание своей жизни.',
          'en':
              '🌟 **Remember**: Your inner rebel is a valuable force. Preserve your living protest against what truly doesn\'t fit you, but learn to choose your battles: where to stand your ground, and where to channel your energy into building your own life.',
        },
      ),
      'mental_young_adult': TestProfile(
        id: 'mental_young_adult',
        name: {
          'ru': 'Ментальный возраст: молодой взрослый',
          'en': 'Mental Age: Young Adult',
        },
        description: {
          'ru':
              'Вы живёте в логике строительства: ставите цели, планируете и берёте ответственность за свою жизнь, но при этом ещё сохраняете гибкость и эксперимент.',
          'en':
              'You live in a \'builder\' mode: you set goals, plan, and take responsibility for your life while still keeping some flexibility and room for experimentation.',
        },
        whyThisProfile: {
          'ru':
              'Ваш условный ментальный возраст соответствует этапу молодой взрослости. Вы уже достаточно опираетесь на себя, чтобы планировать и действовать в сторону желаемого будущего. Вы можете удерживать баланс между «хочу» и «надо», а также видите смысл в том, чтобы вкладываться в отношения, карьеру, здоровье.\n\nИногда это состояние сопровождается внутренним давлением «надо успеть всё», чувством, что вы постоянно сравниваете себя с другими взрослеющими людьми. Есть риск превратить жизнь в бесконечный список задач, забывая о спонтанности и игре.',
          'en':
              'Your metaphorical mental age corresponds to young adulthood. You rely on yourself enough to plan and act toward the future you want. You can balance \'want\' and \'should\', and you see meaning in investing in relationships, career, and health.\n\nSometimes this state comes with pressure to \'accomplish everything\' and constant comparison with other people growing up around you. There is a risk of turning life into an endless to-do list and forgetting about spontaneity and play.',
        },
        strengths: {
          'ru': [
            '✨ **Планирование**: Вы умеете ставить цели и двигаться к ним',
            '✨ **Ответственность**: Берёте на себя свои решения',
            '✨ **Баланс**: Находите золотую середину между «хочу» и «надо»',
            '✨ **Долгосрочное видение**: Вкладываетесь в будущее',
          ],
          'en': [
            '✨ **Planning**: You can set goals and work toward them',
            '✨ **Responsibility**: You own your decisions',
            '✨ **Balance**: You find the sweet spot between \'want\' and \'should\'',
            '✨ **Long-term vision**: You invest in your future',
          ],
        },
        vulnerabilities: {
          'ru': [
            '⚠️ **Давление «успеть всё»**: Постоянное чувство, что нужно больше',
            '⚠️ **Сравнение с другими**: Мерите себя чужими достижениями',
            '⚠️ **Риск перегрузки**: Жизнь может превратиться в список задач',
            '⚠️ **Потеря спонтанности**: Забываете про игру и удовольствие',
          ],
          'en': [
            '⚠️ **Pressure to \'accomplish everything\'**: Constant feeling that you need more',
            '⚠️ **Comparison with others**: You measure yourself by others\' achievements',
            '⚠️ **Risk of overload**: Life can turn into a to-do list',
            '⚠️ **Loss of spontaneity**: You forget about play and pleasure',
          ],
        },
        recommendations: {
          'ru': [
            '💡 Регулярно выделяйте время без целей и задач — просто для отдыха и игры',
            '💡 Пересматривайте цели из позиции «что мне важно», а не «что я должен»',
            '💡 Следите, чтобы перфекционизм не превращал всё в проект с KPI',
          ],
          'en': [
            '💡 Set aside regular time with no goals or tasks – just for rest and play',
            '💡 Review your goals from \'what truly matters to me\' not \'what I must\'',
            '💡 Watch that perfectionism doesn\'t turn everything into a project with KPIs',
          ],
        },
        tryToday: {
          'ru':
              '🎯 **Попробуйте сегодня**: Выделите 30 минут «без пользы» — сделайте что-то просто так, для удовольствия: послушайте музыку, прогуляйтесь, дурачьтесь. Без цели «отдохнуть эффективно».',
          'en':
              '🎯 **Try today**: Set aside 30 minutes \'without purpose\' – do something just for fun: listen to music, take a walk, goof around. Without the goal to \'rest efficiently\'.',
        },
        inspiringConclusion: {
          'ru':
              '🌟 **Помните**: Ваши взрослые навыки — это сила. Но важно поддерживать связь с внутренним ребёнком и подростком — теми частями, которые напоминают о свободе и удовольствии. Стройте — но не забывайте играть.',
          'en':
              '🌟 **Remember**: Your adult skills are a strength. But it\'s important to stay connected to your inner child and teenager – the parts that remind you about freedom and joy. Build – but don\'t forget to play.',
        },
      ),
      'mental_elder': TestProfile(
        id: 'mental_elder',
        name: {
          'ru': 'Ментальный возраст: мудрый старший',
          'en': 'Mental Age: Wise Elder',
        },
        description: {
          'ru':
              'В вашей психике много спокойствия, рефлексии и заботы о долгосрочных последствиях. Вы склонны смотреть на жизнь из более широкой перспективы.',
          'en':
              'Your psyche has a lot of calm, reflection, and concern for long-term consequences. You tend to view life from a wider perspective.',
        },
        whyThisProfile: {
          'ru':
              'Ваш условный ментальный возраст смещён в сторону внутреннего мудрого старшего. Вы склонны взвешивать решения, смотреть на ситуации с высоты прожитого опыта (своего или чужого), ценить стабильность и качество связей. Вас может меньше тянуть в драму и спонтанные скачки, больше — в осмысленность и простоту.\n\nИногда при таком профиле появляется ощущение усталости от мира или цинизма: «я всё это уже видел(а)». Есть риск слишком быстро отказываться от нового, даже если оно могло бы принести радость. Вы можете казаться более «старшим», чем ваш паспортный возраст.',
          'en':
              'Your metaphorical mental age leans toward the inner wise elder. You tend to weigh decisions, look at situations from the height of lived experience (your own or others\'), and value stability and the quality of your connections. You may be less drawn to drama and abrupt changes, and more to meaning and simplicity.\n\nSometimes this profile comes with a sense of being tired of the world or slightly cynical: \'I\'ve seen it all before.\' There\'s a risk of saying no to new things too quickly, even if they could bring joy. You may appear \'older\' than your passport age.',
        },
        strengths: {
          'ru': [
            '✨ **Мудрость**: Вы видите картину шире, чем другие',
            '✨ **Спокойствие**: Меньше драмы, больше осмысленности',
            '✨ **Долгосрочное мышление**: Учитываете последствия решений',
            '✨ **Глубокие связи**: Цените качество отношений',
          ],
          'en': [
            '✨ **Wisdom**: You see the bigger picture than others',
            '✨ **Calm**: Less drama, more meaning',
            '✨ **Long-term thinking**: You consider consequences of decisions',
            '✨ **Deep connections**: You value quality of relationships',
          ],
        },
        vulnerabilities: {
          'ru': [
            '⚠️ **Усталость от мира**: Ощущение «я всё видел(а)»',
            '⚠️ **Цинизм**: Слишком быстро отказываетесь от нового',
            '⚠️ **Упущенные возможности**: Осторожность может мешать пробовать',
            '⚠️ **Кажетесь старше возраста**: Окружающие могут не понимать вашу серьёзность',
          ],
          'en': [
            '⚠️ **Tired of the world**: Feeling \'I\'ve seen it all\'',
            '⚠️ **Cynicism**: You say no to new things too quickly',
            '⚠️ **Missed opportunities**: Caution can stop you from trying',
            '⚠️ **Seem older than your age**: Others may not understand your seriousness',
          ],
        },
        recommendations: {
          'ru': [
            '💡 Осознанно добавляйте небольшие эксперименты: новые места, форматы отдыха',
            '💡 Общайтесь с людьми из других возрастных групп',
            '💡 Замечайте, когда осторожность бережёт, а когда мешает попробовать важное',
          ],
          'en': [
            '💡 Consciously add small experiments: new places, new leisure formats',
            '💡 Spend time with people from different age groups',
            '💡 Notice when your caution protects you and when it stops you from trying something meaningful',
          ],
        },
        tryToday: {
          'ru':
              '🎯 **Попробуйте сегодня**: Сделайте что-то новое и «неопытное» — попробуйте новую еду, послушайте незнакомую музыку, зайдите в необычное место. Позвольте себе быть начинающим.',
          'en':
              '🎯 **Try today**: Do something new and \'inexperienced\' – try new food, listen to unfamiliar music, visit an unusual place. Allow yourself to be a beginner.',
        },
        inspiringConclusion: {
          'ru':
              '🌟 **Помните**: Ваша мудрость — это дар. Опирайтесь на неё, но разрешайте себе удивляться, пробовать и иногда быть неопытным — не только тем, кто знает ответы, но и тем, кто снова учится.',
          'en':
              '🌟 **Remember**: Your wisdom is a gift. Rely on it, but also allow yourself to be surprised, to experiment, and to be inexperienced at times – not only the one who knows answers, but also the one who is willing to learn again.',
        },
      ),
    };

    return profiles[profileId];
  }
}
