import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Данные теста "Личностные ценности и жизненные приоритеты"
///
/// Комплексная оценка жизненных ценностей по 10 измерениям.
/// Каждое измерение оценивается в двух аспектах:
/// - Importance (значимость): насколько важна ценность субъективно
/// - Energy (энергия): насколько фактически вкладываете ресурсы
///
/// Основан на:
/// - Теории базовых ценностей Шварца
/// - Гуманистической психологии (Роджерс, Маслоу)
/// - Теории самоопределения (Деси и Райан)
/// - Value-Based Living подходе в позитивной психологии
///
/// 40 вопросов, 20 шкал (10 пар), 5-балльная шкала Лайкерта
class ValuesPrioritiesData {
  /// Получить тест как TestModel
  static TestModel getValuesPrioritiesTest() {
    return TestModel(
      id: 'values_priorities_v1',
      title: {
        'ru': 'Личностные ценности и жизненные приоритеты',
        'en': 'Personal Values and Life Priorities',
      },
      description: {
        'ru':
            'Комплексная оценка жизненных ценностей и приоритетов. Тест одновременно измеряет значимость ценностей и фактическое вложение энергии.',
        'en':
            'Comprehensive assessment of life values and priorities. The test simultaneously measures value significance and actual energy investment.',
      },
      category: {'ru': 'Типология личности', 'en': 'Personality Typology'},
      categoryId: 'personality',
      estimatedTime: 10,
      factorIds: [
        'security_importance',
        'security_energy',
        'freedom_importance',
        'freedom_energy',
        'achievement_importance',
        'achievement_energy',
        'creativity_importance',
        'creativity_energy',
        'relationships_importance',
        'relationships_energy',
        'growth_importance',
        'growth_energy',
        'influence_importance',
        'influence_energy',
        'comfort_importance',
        'comfort_energy',
        'contribution_importance',
        'contribution_energy',
        'health_balance_importance',
        'health_balance_energy',
      ],
      questions: _getQuestions(),
      type: TestType.multiFactor,
    );
  }

  /// Список всех вопросов (40 вопросов)
  static List<QuestionModel> _getQuestions() {
    // Стандартные ответы Likert 5-point (scores 0-4 согласно ПРАВИЛУ #1)
    final answers = [
      AnswerModel(
          id: 'a1',
          text: {'ru': 'Совершенно не согласен', 'en': 'Strongly disagree'},
          score: 0),
      AnswerModel(
          id: 'a2',
          text: {'ru': 'Скорее не согласен', 'en': 'Disagree'},
          score: 1),
      AnswerModel(
          id: 'a3', text: {'ru': 'Нейтрально', 'en': 'Neutral'}, score: 2),
      AnswerModel(
          id: 'a4', text: {'ru': 'Скорее согласен', 'en': 'Agree'}, score: 3),
      AnswerModel(
          id: 'a5',
          text: {'ru': 'Полностью согласен', 'en': 'Strongly agree'},
          score: 4),
    ];

    return [
      // ===== SECURITY (Q1-4) =====
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Для меня важно чувствовать финансовую и бытовую стабильность.',
          'en':
              'It is important for me to feel financial and domestic stability.',
        },
        answers: answers,
        factorId: 'security_importance',
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru':
              'Я регулярно вкладываюсь во всё, что повышает мою безопасность и стабильность (страховка, накопления, устойчивый доход).',
          'en':
              'I regularly invest in everything that increases my safety and stability (insurance, savings, stable income).',
        },
        answers: answers,
        factorId: 'security_energy',
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru':
              'Мне легко рискнуть даже тогда, когда это может серьёзно ударить по моей стабильности.',
          'en':
              'I can easily take risks even when it might seriously impact my stability.',
        },
        answers: answers,
        factorId: 'security_importance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru':
              'В повседневной жизни я почти не уделяю внимания созданию «подушки безопасности» (запас денег, план Б и т.п.).',
          'en':
              'In daily life, I pay almost no attention to creating a "safety cushion" (money reserve, plan B, etc.).',
        },
        answers: answers,
        factorId: 'security_energy',
        isReversed: true,
      ),

      // ===== FREEDOM (Q5-8) =====
      QuestionModel(
        id: 'q5',
        text: {
          'ru':
              'Свобода выбора и возможность самому решать, как жить, для меня крайне важны.',
          'en':
              'Freedom of choice and the ability to decide for myself how to live are extremely important to me.',
        },
        answers: answers,
        factorId: 'freedom_importance',
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru':
              'Я сознательно устраиваю свою жизнь так, чтобы иметь как можно больше свободы и гибкости.',
          'en':
              'I consciously organize my life to have as much freedom and flexibility as possible.',
        },
        answers: answers,
        factorId: 'freedom_energy',
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru':
              'Мне комфортно, когда за меня принимают решения и чётко задают рамки.',
          'en':
              'I feel comfortable when decisions are made for me and clear boundaries are set.',
        },
        answers: answers,
        factorId: 'freedom_importance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru':
              'Сейчас мой образ жизни почти не оставляет пространства для личной свободы.',
          'en':
              'Currently my lifestyle leaves almost no space for personal freedom.',
        },
        answers: answers,
        factorId: 'freedom_energy',
        isReversed: true,
      ),

      // ===== ACHIEVEMENT (Q9-12) =====
      QuestionModel(
        id: 'q9',
        text: {
          'ru':
              'Мне важно добиваться заметных результатов и ощущать свой успех.',
          'en':
              'It is important for me to achieve visible results and feel my success.',
        },
        answers: answers,
        factorId: 'achievement_importance',
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru':
              'Я целенаправленно трачу время и силы на достижение карьерных и личных целей.',
          'en':
              'I purposefully spend time and effort on achieving career and personal goals.',
        },
        answers: answers,
        factorId: 'achievement_energy',
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'Мне не так уж и важно продвигаться вперёд, достаточно просто «не отставать».',
          'en':
              'It is not that important for me to move forward, it is enough just to "keep up".',
        },
        answers: answers,
        factorId: 'achievement_importance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru':
              'В последнее время я почти не делаю шагов, которые реально продвигают меня к амбициозным целям.',
          'en':
              'Lately I have hardly taken any steps that actually move me toward ambitious goals.',
        },
        answers: answers,
        factorId: 'achievement_energy',
        isReversed: true,
      ),

      // ===== CREATIVITY (Q13-16) =====
      QuestionModel(
        id: 'q13',
        text: {
          'ru':
              'Возможность творить и выражать себя для меня действительно значима.',
          'en':
              'The ability to create and express myself is truly significant to me.',
        },
        answers: answers,
        factorId: 'creativity_importance',
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru':
              'Я регулярно выделяю время на творчество или нестандартные проекты.',
          'en':
              'I regularly allocate time for creativity or non-standard projects.',
        },
        answers: answers,
        factorId: 'creativity_energy',
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru':
              'Мне не особенно важно проявлять креативность, главное — чтобы всё было сделано.',
          'en':
              'It is not particularly important for me to be creative, the main thing is that everything gets done.',
        },
        answers: answers,
        factorId: 'creativity_importance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru':
              'Моя повседневность почти не оставляет места для творческого самовыражения.',
          'en':
              'My daily life leaves almost no room for creative self-expression.',
        },
        answers: answers,
        factorId: 'creativity_energy',
        isReversed: true,
      ),

      // ===== RELATIONSHIPS (Q17-20) =====
      QuestionModel(
        id: 'q17',
        text: {
          'ru':
              'Близкие и поддерживающие отношения занимают важное место в моей жизни.',
          'en':
              'Close and supportive relationships occupy an important place in my life.',
        },
        answers: answers,
        factorId: 'relationships_importance',
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru':
              'Я намеренно вкладываюсь во встречи, общение и заботу о значимых для меня людях.',
          'en':
              'I intentionally invest in meetings, communication and care for people important to me.',
        },
        answers: answers,
        factorId: 'relationships_energy',
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru':
              'Эмоциональная близость с людьми не является для меня приоритетом.',
          'en': 'Emotional closeness with people is not a priority for me.',
        },
        answers: answers,
        factorId: 'relationships_importance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru':
              'Сейчас я редко нахожу время, чтобы по-настоящему быть с близкими (внимательно и без гаджетов).',
          'en':
              'I rarely find time now to truly be with loved ones (attentively and without gadgets).',
        },
        answers: answers,
        factorId: 'relationships_energy',
        isReversed: true,
      ),

      // ===== GROWTH (Q21-24) =====
      QuestionModel(
        id: 'q21',
        text: {
          'ru':
              'Личностное и профессиональное развитие — одна из моих ключевых ценностей.',
          'en':
              'Personal and professional development is one of my key values.',
        },
        answers: answers,
        factorId: 'growth_importance',
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru':
              'Я системно учусь новому: прохожу курсы, читаю, пробую новые роли и задачи.',
          'en':
              'I systematically learn new things: take courses, read, try new roles and tasks.',
        },
        answers: answers,
        factorId: 'growth_energy',
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru':
              'Мне вполне достаточно того уровня развития, которого я уже достиг(ла).',
          'en':
              'I am quite satisfied with the level of development I have already achieved.',
        },
        answers: answers,
        factorId: 'growth_importance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru':
              'В реальности я редко делаю что-то, что по-настоящему расширяет мои знания и навыки.',
          'en':
              'In reality, I rarely do things that truly expand my knowledge and skills.',
        },
        answers: answers,
        factorId: 'growth_energy',
        isReversed: true,
      ),

      // ===== INFLUENCE (Q25-28) =====
      QuestionModel(
        id: 'q25',
        text: {
          'ru':
              'Мне важно влиять на решения и процессы вокруг, а не просто следовать им.',
          'en':
              'It is important for me to influence decisions and processes around me, not just follow them.',
        },
        answers: answers,
        factorId: 'influence_importance',
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru':
              'Я беру на себя ответственность и инициативу, когда вижу возможность повлиять на ситуацию.',
          'en':
              'I take responsibility and initiative when I see an opportunity to influence the situation.',
        },
        answers: answers,
        factorId: 'influence_energy',
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru':
              'Мне комфортнее, когда я не несу ответственности и не влияю на происходящее.',
          'en':
              'I feel more comfortable when I do not bear responsibility and do not influence what is happening.',
        },
        answers: answers,
        factorId: 'influence_importance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru':
              'Сейчас я почти не проявляю инициативу, даже когда мог(ла) бы повлиять на ход событий.',
          'en':
              'Now I almost never take initiative, even when I could influence the course of events.',
        },
        answers: answers,
        factorId: 'influence_energy',
        isReversed: true,
      ),

      // ===== COMFORT (Q29-32) =====
      QuestionModel(
        id: 'q29',
        text: {
          'ru':
              'Мне важно чувствовать комфорт, удовольствие и отсутствие лишнего стресса.',
          'en':
              'It is important for me to feel comfort, pleasure and absence of unnecessary stress.',
        },
        answers: answers,
        factorId: 'comfort_importance',
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru':
              'Я охотно трачу ресурсы на отдых, развлечения и приятные мелочи жизни.',
          'en':
              'I willingly spend resources on rest, entertainment and pleasant little things in life.',
        },
        answers: answers,
        factorId: 'comfort_energy',
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru':
              'Комфорт и удовольствие для меня не так важны — можно и потерпеть.',
          'en':
              'Comfort and pleasure are not that important to me — I can endure.',
        },
        answers: answers,
        factorId: 'comfort_importance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru':
              'В моём нынешнем графике очень мало места для отдыха и простых удовольствий.',
          'en':
              'In my current schedule there is very little room for rest and simple pleasures.',
        },
        answers: answers,
        factorId: 'comfort_energy',
        isReversed: true,
      ),

      // ===== CONTRIBUTION (Q33-36) =====
      QuestionModel(
        id: 'q33',
        text: {
          'ru':
              'Мне важно ощущать, что я приношу пользу другим людям или обществу.',
          'en':
              'It is important for me to feel that I benefit other people or society.',
        },
        answers: answers,
        factorId: 'contribution_importance',
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru':
              'Я уделяю время делам, которые дают ощущение вклада (помощь, волонтёрство, поддержка).',
          'en':
              'I devote time to activities that give a sense of contribution (help, volunteering, support).',
        },
        answers: answers,
        factorId: 'contribution_energy',
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru':
              'Для меня не принципиально, насколько моя деятельность полезна другим.',
          'en':
              'It is not fundamental for me how useful my activity is to others.',
        },
        answers: answers,
        factorId: 'contribution_importance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru':
              'В повседневных делах я редко думаю о том, какой вклад вношу в жизнь других.',
          'en':
              'In daily activities, I rarely think about what contribution I make to the lives of others.',
        },
        answers: answers,
        factorId: 'contribution_energy',
        isReversed: true,
      ),

      // ===== HEALTH & BALANCE (Q37-40) =====
      QuestionModel(
        id: 'q37',
        text: {
          'ru':
              'Здоровье и баланс между работой и личной жизнью для меня очень важны.',
          'en':
              'Health and work-life balance are very important to me.',
        },
        answers: answers,
        factorId: 'health_balance_importance',
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru':
              'Я регулярно забочусь о себе: сон, питание, движение, личное время.',
          'en':
              'I regularly take care of myself: sleep, nutrition, movement, personal time.',
        },
        answers: answers,
        factorId: 'health_balance_energy',
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru':
              'Баланс и забота о здоровье могут подождать — сейчас важнее другие задачи.',
          'en':
              'Balance and health care can wait — other tasks are more important now.',
        },
        answers: answers,
        factorId: 'health_balance_importance',
        isReversed: true,
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru':
              'Мой текущий ритм жизни явно идёт в ущерб моему здоровью и восстановлению.',
          'en':
              'My current pace of life is clearly detrimental to my health and recovery.',
        },
        answers: answers,
        factorId: 'health_balance_energy',
        isReversed: true,
      ),
    ];
  }

  /// Названия факторов
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      // Security
      'security_importance': {
        'ru': 'Безопасность и стабильность — значимость',
        'en': 'Security and Stability — Importance',
      },
      'security_energy': {
        'ru': 'Безопасность и стабильность — энергия',
        'en': 'Security and Stability — Energy',
      },
      // Freedom
      'freedom_importance': {
        'ru': 'Свобода и автономия — значимость',
        'en': 'Freedom and Autonomy — Importance',
      },
      'freedom_energy': {
        'ru': 'Свобода и автономия — энергия',
        'en': 'Freedom and Autonomy — Energy',
      },
      // Achievement
      'achievement_importance': {
        'ru': 'Успех и достижения — значимость',
        'en': 'Achievement and Success — Importance',
      },
      'achievement_energy': {
        'ru': 'Успех и достижения — энергия',
        'en': 'Achievement and Success — Energy',
      },
      // Creativity
      'creativity_importance': {
        'ru': 'Творчество и самореализация — значимость',
        'en': 'Creativity and Self-Realization — Importance',
      },
      'creativity_energy': {
        'ru': 'Творчество и самореализация — энергия',
        'en': 'Creativity and Self-Realization — Energy',
      },
      // Relationships
      'relationships_importance': {
        'ru': 'Отношения и близость — значимость',
        'en': 'Relationships and Closeness — Importance',
      },
      'relationships_energy': {
        'ru': 'Отношения и близость — энергия',
        'en': 'Relationships and Closeness — Energy',
      },
      // Growth
      'growth_importance': {
        'ru': 'Развитие и обучение — значимость',
        'en': 'Growth and Learning — Importance',
      },
      'growth_energy': {
        'ru': 'Развитие и обучение — энергия',
        'en': 'Growth and Learning — Energy',
      },
      // Influence
      'influence_importance': {
        'ru': 'Влияние и лидерство — значимость',
        'en': 'Influence and Leadership — Importance',
      },
      'influence_energy': {
        'ru': 'Влияние и лидерство — энергия',
        'en': 'Influence and Leadership — Energy',
      },
      // Comfort
      'comfort_importance': {
        'ru': 'Комфорт и удовольствие — значимость',
        'en': 'Comfort and Pleasure — Importance',
      },
      'comfort_energy': {
        'ru': 'Комфорт и удовольствие — энергия',
        'en': 'Comfort and Pleasure — Energy',
      },
      // Contribution
      'contribution_importance': {
        'ru': 'Вклад и польза другим — значимость',
        'en': 'Contribution and Helping Others — Importance',
      },
      'contribution_energy': {
        'ru': 'Вклад и польза другим — энергия',
        'en': 'Contribution and Helping Others — Energy',
      },
      // Health & Balance
      'health_balance_importance': {
        'ru': 'Здоровье и жизненный баланс — значимость',
        'en': 'Health and Life Balance — Importance',
      },
      'health_balance_energy': {
        'ru': 'Здоровье и жизненный баланс — энергия',
        'en': 'Health and Life Balance — Energy',
      },
    };
  }

  /// Интерпретация результатов по фактору
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Защита от NaN (ПРАВИЛО #5)
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    // Определяем уровень
    String level;
    if (percentage < 33) {
      level = 'low';
    } else if (percentage < 67) {
      level = 'medium';
    } else {
      level = 'high';
    }

    // Разделяем факторы на importance и energy
    final isImportance = factorId.endsWith('_importance');
    final baseFactorId = factorId.replaceAll('_importance', '').replaceAll('_energy', '');

    if (isImportance) {
      return _getImportanceInterpretation(baseFactorId, level);
    } else {
      return _getEnergyInterpretation(baseFactorId, level);
    }
  }

  /// Интерпретация для importance (значимость)
  static Map<String, String> _getImportanceInterpretation(
      String baseFactorId, String level) {
    final interpretations = {
      'security': {
        'low': {
          'ru':
              'Низкая значимость безопасности. Вы готовы рисковать и не считаете стабильность приоритетом.',
          'en':
              'Low security importance. You are willing to take risks and do not consider stability a priority.',
        },
        'medium': {
          'ru':
              'Средняя значимость безопасности. Баланс между стабильностью и готовностью к изменениям.',
          'en':
              'Medium security importance. Balance between stability and readiness for change.',
        },
        'high': {
          'ru':
              'Высокая значимость безопасности. Стабильность и предсказуемость — ваши ключевые ценности.',
          'en':
              'High security importance. Stability and predictability are your key values.',
        },
      },
      'freedom': {
        'low': {
          'ru':
              'Низкая значимость свободы. Вам комфортно в структурированной среде с чёткими рамками.',
          'en':
              'Low freedom importance. You are comfortable in a structured environment with clear boundaries.',
        },
        'medium': {
          'ru':
              'Средняя значимость свободы. Баланс между автономией и следованием правилам.',
          'en':
              'Medium freedom importance. Balance between autonomy and following rules.',
        },
        'high': {
          'ru':
              'Высокая значимость свободы. Автономия и выбор — фундаментальные ценности для вас.',
          'en':
              'High freedom importance. Autonomy and choice are fundamental values for you.',
        },
      },
      'achievement': {
        'low': {
          'ru':
              'Низкая значимость достижений. Успех не является вашим главным мотиватором.',
          'en':
              'Low achievement importance. Success is not your main motivator.',
        },
        'medium': {
          'ru':
              'Средняя значимость достижений. Вы цените успех, но не ставите его во главу угла.',
          'en':
              'Medium achievement importance. You value success but do not make it paramount.',
        },
        'high': {
          'ru':
              'Высокая значимость достижений. Видимые результаты и признание важны для вашей самооценки.',
          'en':
              'High achievement importance. Visible results and recognition are important for your self-esteem.',
        },
      },
      'creativity': {
        'low': {
          'ru':
              'Низкая значимость творчества. Вы предпочитаете проверенные методы новаторству.',
          'en':
              'Low creativity importance. You prefer proven methods to innovation.',
        },
        'medium': {
          'ru':
              'Средняя значимость творчества. Креативность ценна, но не всегда необходима.',
          'en':
              'Medium creativity importance. Creativity is valued but not always necessary.',
        },
        'high': {
          'ru':
              'Высокая значимость творчества. Самовыражение и новаторство — ваши сильные мотиваторы.',
          'en':
              'High creativity importance. Self-expression and innovation are strong motivators for you.',
        },
      },
      'relationships': {
        'low': {
          'ru':
              'Низкая значимость отношений. Вы склонны к независимости и самодостаточности.',
          'en':
              'Low relationships importance. You tend toward independence and self-sufficiency.',
        },
        'medium': {
          'ru':
              'Средняя значимость отношений. Баланс между близостью и личным пространством.',
          'en':
              'Medium relationships importance. Balance between closeness and personal space.',
        },
        'high': {
          'ru':
              'Высокая значимость отношений. Близкие связи — основа вашего благополучия.',
          'en':
              'High relationships importance. Close connections are the foundation of your wellbeing.',
        },
      },
      'growth': {
        'low': {
          'ru':
              'Низкая значимость развития. Вы удовлетворены текущим уровнем компетенций.',
          'en':
              'Low growth importance. You are satisfied with your current level of competence.',
        },
        'medium': {
          'ru':
              'Средняя значимость развития. Обучение важно, но не приоритет номер один.',
          'en':
              'Medium growth importance. Learning is important but not priority number one.',
        },
        'high': {
          'ru':
              'Высокая значимость развития. Постоянное обучение — ваша жизненная позиция.',
          'en':
              'High growth importance. Continuous learning is your life stance.',
        },
      },
      'influence': {
        'low': {
          'ru':
              'Низкая значимость влияния. Вы предпочитаете быть исполнителем, а не лидером.',
          'en':
              'Low influence importance. You prefer to be an executor rather than a leader.',
        },
        'medium': {
          'ru':
              'Средняя значимость влияния. Готовы брать ответственность при необходимости.',
          'en':
              'Medium influence importance. Ready to take responsibility when necessary.',
        },
        'high': {
          'ru':
              'Высокая значимость влияния. Способность формировать события — ваша потребность.',
          'en':
              'High influence importance. The ability to shape events is your need.',
        },
      },
      'comfort': {
        'low': {
          'ru':
              'Низкая значимость комфорта. Вы готовы жертвовать удобствами ради целей.',
          'en':
              'Low comfort importance. You are willing to sacrifice conveniences for goals.',
        },
        'medium': {
          'ru':
              'Средняя значимость комфорта. Баланс между удовольствием и дисциплиной.',
          'en':
              'Medium comfort importance. Balance between pleasure and discipline.',
        },
        'high': {
          'ru':
              'Высокая значимость комфорта. Удовольствие и отсутствие стресса важны для качества жизни.',
          'en':
              'High comfort importance. Pleasure and lack of stress are important for quality of life.',
        },
      },
      'contribution': {
        'low': {
          'ru':
              'Низкая значимость вклада. Вы фокусируетесь на личных целях, а не на помощи другим.',
          'en':
              'Low contribution importance. You focus on personal goals rather than helping others.',
        },
        'medium': {
          'ru':
              'Средняя значимость вклада. Помощь другим важна, но не главная цель.',
          'en':
              'Medium contribution importance. Helping others is important but not the main goal.',
        },
        'high': {
          'ru':
              'Высокая значимость вклада. Польза обществу — источник вашего смысла жизни.',
          'en':
              'High contribution importance. Benefit to society is a source of your life meaning.',
        },
      },
      'health_balance': {
        'low': {
          'ru':
              'Низкая значимость здоровья. Вы готовы жертвовать балансом ради других приоритетов.',
          'en':
              'Low health importance. You are willing to sacrifice balance for other priorities.',
        },
        'medium': {
          'ru':
              'Средняя значимость здоровья. Баланс важен, но не всегда достижим.',
          'en':
              'Medium health importance. Balance is important but not always achievable.',
        },
        'high': {
          'ru':
              'Высокая значимость здоровья. Забота о себе — основа вашего стиля жизни.',
          'en':
              'High health importance. Self-care is the foundation of your lifestyle.',
        },
      },
    };

    return interpretations[baseFactorId]?[level] ?? {
          'ru': 'Интерпретация не найдена',
          'en': 'Interpretation not found'
        };
  }

  /// Интерпретация для energy (фактическое вложение)
  static Map<String, String> _getEnergyInterpretation(
      String baseFactorId, String level) {
    final interpretations = {
      'security': {
        'low': {
          'ru':
              'Мало энергии в безопасность. Вы редко инвестируете в стабильность и накопления.',
          'en':
              'Little energy in security. You rarely invest in stability and savings.',
        },
        'medium': {
          'ru':
              'Умеренная энергия в безопасность. Вы что-то делаете, но несистемно.',
          'en':
              'Moderate energy in security. You do something but not systematically.',
        },
        'high': {
          'ru':
              'Много энергии в безопасность. Вы активно создаёте «подушку безопасности».',
          'en':
              'High energy in security. You actively create a "safety cushion".',
        },
      },
      'freedom': {
        'low': {
          'ru':
              'Мало энергии в свободу. Ваша жизнь сейчас сильно структурирована извне.',
          'en':
              'Little energy in freedom. Your life is now highly structured from outside.',
        },
        'medium': {
          'ru':
              'Умеренная энергия в свободу. Есть автономия, но не всегда используете её.',
          'en':
              'Moderate energy in freedom. There is autonomy but you do not always use it.',
        },
        'high': {
          'ru':
              'Много энергии в свободу. Вы активно оберегаете свою независимость.',
          'en':
              'High energy in freedom. You actively protect your independence.',
        },
      },
      'achievement': {
        'low': {
          'ru':
              'Мало энергии в достижения. Вы редко двигаетесь к амбициозным целям.',
          'en':
              'Little energy in achievement. You rarely move toward ambitious goals.',
        },
        'medium': {
          'ru':
              'Умеренная энергия в достижения. Работаете над целями, но без фанатизма.',
          'en':
              'Moderate energy in achievement. You work on goals but without fanaticism.',
        },
        'high': {
          'ru':
              'Много энергии в достижения. Значительная часть жизни уходит на карьеру и успех.',
          'en':
              'High energy in achievement. A significant part of life goes to career and success.',
        },
      },
      'creativity': {
        'low': {
          'ru':
              'Мало энергии в творчество. Повседневность не оставляет места для креатива.',
          'en':
              'Little energy in creativity. Daily life leaves no room for creativity.',
        },
        'medium': {
          'ru':
              'Умеренная энергия в творчество. Иногда находите время для самовыражения.',
          'en':
              'Moderate energy in creativity. Sometimes you find time for self-expression.',
        },
        'high': {
          'ru':
              'Много энергии в творчество. Регулярно занимаетесь креативными проектами.',
          'en':
              'High energy in creativity. Regularly engage in creative projects.',
        },
      },
      'relationships': {
        'low': {
          'ru':
              'Мало энергии в отношения. Вы редко по-настоящему бываете с близкими.',
          'en':
              'Little energy in relationships. You rarely truly spend time with loved ones.',
        },
        'medium': {
          'ru':
              'Умеренная энергия в отношения. Встречи есть, но без глубокого вовлечения.',
          'en':
              'Moderate energy in relationships. Meetings happen but without deep involvement.',
        },
        'high': {
          'ru':
              'Много энергии в отношения. Вы активно инвестируете в близкие связи.',
          'en':
              'High energy in relationships. You actively invest in close connections.',
        },
      },
      'growth': {
        'low': {
          'ru':
              'Мало энергии в развитие. Вы редко учитесь чему-то новому системно.',
          'en':
              'Little energy in growth. You rarely learn something new systematically.',
        },
        'medium': {
          'ru':
              'Умеренная энергия в развитие. Обучение происходит, но нерегулярно.',
          'en':
              'Moderate energy in growth. Learning happens but irregularly.',
        },
        'high': {
          'ru':
              'Много энергии в развитие. Вы регулярно проходите курсы и читаете.',
          'en':
              'High energy in growth. You regularly take courses and read.',
        },
      },
      'influence': {
        'low': {
          'ru':
              'Мало энергии во влияние. Вы редко проявляете инициативу и лидерство.',
          'en':
              'Little energy in influence. You rarely show initiative and leadership.',
        },
        'medium': {
          'ru':
              'Умеренная энергия во влияние. Берёте ответственность избирательно.',
          'en':
              'Moderate energy in influence. You take responsibility selectively.',
        },
        'high': {
          'ru':
              'Много энергии во влияние. Вы активно формируете процессы вокруг.',
          'en':
              'High energy in influence. You actively shape processes around you.',
        },
      },
      'comfort': {
        'low': {
          'ru':
              'Мало энергии в комфорт. График почти не оставляет времени на отдых.',
          'en':
              'Little energy in comfort. Schedule leaves almost no time for rest.',
        },
        'medium': {
          'ru':
              'Умеренная энергия в комфорт. Иногда балуете себя удовольствиями.',
          'en':
              'Moderate energy in comfort. Sometimes you treat yourself to pleasures.',
        },
        'high': {
          'ru':
              'Много энергии в комфорт. Регулярно уделяете время отдыху и развлечениям.',
          'en':
              'High energy in comfort. Regularly devote time to rest and entertainment.',
        },
      },
      'contribution': {
        'low': {
          'ru':
              'Мало энергии во вклад. Вы редко думаете о пользе другим в повседневности.',
          'en':
              'Little energy in contribution. You rarely think about benefiting others in daily life.',
        },
        'medium': {
          'ru':
              'Умеренная энергия во вклад. Иногда помогаете, но без системности.',
          'en':
              'Moderate energy in contribution. Sometimes you help but without consistency.',
        },
        'high': {
          'ru':
              'Много энергии во вклад. Регулярно занимаетесь волонтёрством или поддержкой.',
          'en':
              'High energy in contribution. Regularly engage in volunteering or support.',
        },
      },
      'health_balance': {
        'low': {
          'ru':
              'Мало энергии в здоровье. Ритм жизни идёт в ущерб восстановлению.',
          'en':
              'Little energy in health. Pace of life is detrimental to recovery.',
        },
        'medium': {
          'ru':
              'Умеренная энергия в здоровье. Иногда заботитесь о себе, но нерегулярно.',
          'en':
              'Moderate energy in health. Sometimes you take care of yourself but irregularly.',
        },
        'high': {
          'ru':
              'Много энергии в здоровье. Регулярно следите за сном, питанием, движением.',
          'en':
              'High energy in health. Regularly monitor sleep, nutrition, movement.',
        },
      },
    };

    return interpretations[baseFactorId]?[level] ?? {
          'ru': 'Интерпретация не найдена',
          'en': 'Interpretation not found'
        };
  }

  /// Вычисляет composite индексы
  /// Возвращает Map с дополнительными показателями
  static Map<String, dynamic> calculateCompositeScores(
      Map<String, double> percentages) {
    // Разделяем на importance и energy
    final importanceScores = <String, double>{};
    final energyScores = <String, double>{};

    for (final entry in percentages.entries) {
      if (entry.key.endsWith('_importance')) {
        final baseKey = entry.key.replaceAll('_importance', '');
        importanceScores[baseKey] = entry.value;
      } else if (entry.key.endsWith('_energy')) {
        final baseKey = entry.key.replaceAll('_energy', '');
        energyScores[baseKey] = entry.value;
      }
    }

    // Overall Importance Index
    final overallImportance = importanceScores.values.isEmpty
        ? 0.0
        : importanceScores.values.reduce((a, b) => a + b) /
            importanceScores.length;

    // Overall Energy Index
    final overallEnergy = energyScores.values.isEmpty
        ? 0.0
        : energyScores.values.reduce((a, b) => a + b) / energyScores.length;

    // Values Alignment Index (разница между важностью и энергией)
    final gaps = <String, double>{};
    for (final key in importanceScores.keys) {
      if (energyScores.containsKey(key)) {
        gaps[key] = (importanceScores[key]! - energyScores[key]!).abs();
      }
    }
    final alignmentIndex =
        gaps.values.isEmpty ? 0.0 : gaps.values.reduce((a, b) => a + b) / gaps.length;

    // Top 5 Values by Importance
    final sortedImportance = importanceScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final top5Importance =
        sortedImportance.take(5).map((e) => e.key).toList();

    // Top 5 Values by Energy
    final sortedEnergy = energyScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final top5Energy = sortedEnergy.take(5).map((e) => e.key).toList();

    // Biggest gaps (misalignment)
    final sortedGaps = gaps.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final biggestGaps = sortedGaps.take(3).map((e) => e.key).toList();

    return {
      'overall_importance_index': overallImportance,
      'overall_energy_index': overallEnergy,
      'values_alignment_index': alignmentIndex,
      'alignment_quality': alignmentIndex < 15 ? 'high' : (alignmentIndex < 30 ? 'medium' : 'low'),
      'top5_importance': top5Importance,
      'top5_energy': top5Energy,
      'biggest_gaps': biggestGaps,
      'importance_scores': importanceScores,
      'energy_scores': energyScores,
      'gaps': gaps,
    };
  }

  /// Определяет профиль на основе процентов по шкалам
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_balanced';

    final composite = calculateCompositeScores(percentages);
    final overallImportance = composite['overall_importance_index'] as double;
    final overallEnergy = composite['overall_energy_index'] as double;
    final alignmentIndex = composite['values_alignment_index'] as double;

    // 1. Aligned profile (хорошее совпадение)
    if (alignmentIndex < 15 && overallImportance >= 50 && overallEnergy >= 50) {
      return 'profile_aligned';
    }

    // 2. Values without action (знают что важно, но не делают)
    if (overallImportance >= 60 && overallEnergy < 50) {
      return 'profile_values_without_action';
    }

    // 3. Energy misaligned (много делают, но не туда)
    if (overallEnergy >= 50 && alignmentIndex >= 25) {
      return 'profile_energy_misaligned';
    }

    // 4. Burnout risk (высокая энергия + низкий баланс здоровья)
    final healthBalanceEnergy = percentages['health_balance_energy'] ?? 50;
    if (overallEnergy >= 70 && healthBalanceEnergy < 40) {
      return 'profile_burnout_risk';
    }

    // 5. Freedom seeker (высокая свобода + низкая безопасность)
    final freedomImportance = percentages['freedom_importance'] ?? 0;
    final securityImportance = percentages['security_importance'] ?? 0;
    if (freedomImportance >= 70 && securityImportance < 40) {
      return 'profile_freedom_seeker';
    }

    // 6. Stability seeker (высокая безопасность + низкая свобода)
    if (securityImportance >= 70 && freedomImportance < 40) {
      return 'profile_stability_seeker';
    }

    // 7. Relationships focused
    final relationshipsImportance = percentages['relationships_importance'] ?? 0;
    final relationshipsEnergy = percentages['relationships_energy'] ?? 0;
    if (relationshipsImportance >= 70 && relationshipsEnergy >= 60) {
      return 'profile_relationships_focused';
    }

    // 8. Growth oriented
    final growthImportance = percentages['growth_importance'] ?? 0;
    final growthEnergy = percentages['growth_energy'] ?? 0;
    if (growthImportance >= 70 && growthEnergy >= 60) {
      return 'profile_growth_oriented';
    }

    // Default: balanced
    return 'profile_balanced';
  }

  /// Возвращает профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Все профили
  static final Map<String, TestProfile> _profiles = {
    'profile_aligned': TestProfile(
      id: 'profile_aligned',
      name: {
        'ru': 'Согласованная система ценностей',
        'en': 'Aligned Value System',
      },
      description: {
        'ru':
            'Ваши ключевые ценности в целом совпадают с теми сферами, куда вы реально вкладываете время и силы. Вы живёте в согласии с собой.',
        'en':
            'Your key values generally align with the areas where you actually invest time and effort. You live in harmony with yourself.',
      },
      whyThisProfile: {
        'ru':
            'Небольшой разрыв между значимостью ценностей и реальными действиями (индекс согласованности < 15%).',
        'en':
            'Small gap between value significance and actual actions (alignment index < 15%).',
      },
      strengths: {
        'ru': [
          'Высокая осознанность и внутренняя согласованность',
          'Меньше хронического чувства "живу не свою жизнь"',
          'Способность принимать решения на основе ценностей',
          'Устойчивый уровень удовлетворённости жизнью',
        ],
        'en': [
          'High awareness and internal consistency',
          'Less chronic feeling of "living someone else\'s life"',
          'Ability to make value-based decisions',
          'Stable level of life satisfaction',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск самодовольства и остановки в развитии',
          'Возможна жёсткость к тем, кто живёт иначе',
        ],
        'en': [
          'Risk of complacency and stagnation',
          'Possible rigidity toward those who live differently',
        ],
      },
      recommendations: {
        'ru': [
          'Поддерживайте текущий уровень осознанности',
          'Регулярно пересматривайте приоритеты (раз в 6 месяцев)',
          'Используйте знание своих ценностей при выборе проектов и работы',
          'Помогайте другим находить их ценности',
        ],
        'en': [
          'Maintain your current level of awareness',
          'Regularly review priorities (every 6 months)',
          'Use knowledge of your values when choosing projects and work',
          'Help others find their values',
        ],
      },
      tryToday: {
        'ru':
            'Запишите свои топ-3 ценности и проверьте, отражает ли ваш календарь на эту неделю эти приоритеты.',
        'en':
            'Write down your top 3 values and check if your calendar this week reflects these priorities.',
      },
      inspiringConclusion: {
        'ru':
            'Вы живёте осмысленно. Продолжайте этот путь — это редкий дар!',
        'en':
            'You live meaningfully. Continue this path — it is a rare gift!',
      },
    ),
    'profile_values_without_action': TestProfile(
      id: 'profile_values_without_action',
      name: {
        'ru': 'Высокие ценности — низкие действия',
        'en': 'High Values — Low Action',
      },
      description: {
        'ru':
            'Многие важные для вас ценности пока слабо отражены в повседневных действиях. Вы хорошо осознаёте, что важно, но трудно внедряете это в практику.',
        'en':
            'Many values important to you are weakly reflected in daily actions. You are well aware of what is important, but find it difficult to implement in practice.',
      },
      whyThisProfile: {
        'ru':
            'Высокая общая значимость ценностей (>=60%), но низкое фактическое вложение энергии (<50%).',
        'en':
            'High overall value importance (>=60%), but low actual energy investment (<50%).',
      },
      strengths: {
        'ru': [
          'Ясное понимание своих приоритетов',
          'Готовность к изменениям',
          'Потенциал для роста удовлетворённости',
          'Осознанность проблемы',
        ],
        'en': [
          'Clear understanding of your priorities',
          'Readiness for change',
          'Potential for growth in satisfaction',
          'Awareness of the problem',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Чувство фрустрации и вины',
          'Риск хронического откладывания "на потом"',
          'Возможная потеря мотивации',
          'Внешние ограничения или внутренняя неуверенность',
        ],
        'en': [
          'Feeling of frustration and guilt',
          'Risk of chronic procrastination',
          'Possible loss of motivation',
          'External constraints or internal insecurity',
        ],
      },
      recommendations: {
        'ru': [
          'Выберите 1-2 ключевые ценности для фокуса',
          'Сформулируйте один очень маленький шаг на ближайшую неделю',
          'Понизьте планку: лучше маленькая регулярность, чем большие рывки',
          'Найдите accountability partner (друга или коуча)',
          'Исследуйте барьеры: что реально мешает действовать?',
        ],
        'en': [
          'Choose 1-2 key values to focus on',
          'Formulate one very small step for the next week',
          'Lower the bar: better small regularity than big leaps',
          'Find an accountability partner (friend or coach)',
          'Explore barriers: what really prevents you from acting?',
        ],
      },
      tryToday: {
        'ru':
            'Выберите самую важную ценность и совершите одно 5-минутное действие в её направлении прямо сейчас.',
        'en':
            'Choose the most important value and take one 5-minute action toward it right now.',
      },
      inspiringConclusion: {
        'ru':
            'Разрыв между ценностями и действиями — это не приговор, а карта к более осознанной жизни.',
        'en':
            'The gap between values and actions is not a verdict, but a map to a more conscious life.',
      },
    ),
    'profile_energy_misaligned': TestProfile(
      id: 'profile_energy_misaligned',
      name: {
        'ru': 'Энергия уходит не в те ценности',
        'en': 'Energy Goes to Wrong Values',
      },
      description: {
        'ru':
            'Вы активно тратите энергию, но часть усилий уходит в сферы, которые не являются для вас по-настоящему значимыми. Загруженность делами при отсутствии ощущения внутреннего смысла.',
        'en':
            'You actively spend energy, but some efforts go to areas that are not truly significant to you. Busyness without a sense of inner meaning.',
      },
      whyThisProfile: {
        'ru':
            'Высокое вложение энергии (>=50%), но большой разрыв с ценностями (индекс рассогласования >=25%).',
        'en':
            'High energy investment (>=50%), but large gap with values (misalignment index >=25%).',
      },
      strengths: {
        'ru': [
          'Высокий уровень активности и работоспособности',
          'Дисциплина и способность доводить дела до конца',
          'Ресурс для перенаправления энергии',
          'Опыт продуктивности',
        ],
        'en': [
          'High level of activity and performance',
          'Discipline and ability to follow through',
          'Resource to redirect energy',
          'Productivity experience',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск эмоционального выгорания',
          'Ощущение "много делаю, но не туда"',
          'Внешние обязательства могут подавлять внутренние приоритеты',
          'Синдром "хомяка в колесе"',
        ],
        'en': [
          'Risk of emotional burnout',
          'Feeling of "doing a lot, but not there"',
          'External obligations may suppress internal priorities',
          '"Hamster wheel" syndrome',
        ],
      },
      recommendations: {
        'ru': [
          'Сравните свои топ-5 ценностей по важности и по энергии',
          'Определите самые большие расхождения',
          'Делегируйте или сократите задачи, не связанные с ценностями',
          'Освободите 10% времени для самых важных сфер',
          'Научитесь говорить "нет" обязательствам, не aligned с ценностями',
        ],
        'en': [
          'Compare your top 5 values by importance and energy',
          'Identify the biggest gaps',
          'Delegate or reduce tasks not related to values',
          'Free up 10% of time for the most important areas',
          'Learn to say "no" to obligations not aligned with values',
        ],
      },
      tryToday: {
        'ru':
            'Посмотрите на свои дела сегодня: от какой одной задачи вы можете отказаться или делегировать?',
        'en':
            'Look at your tasks today: which one task can you refuse or delegate?',
      },
      inspiringConclusion: {
        'ru':
            'Ваша энергия — это ресурс. Направьте её туда, где она создаёт настоящий смысл.',
        'en':
            'Your energy is a resource. Direct it where it creates true meaning.',
      },
    ),
    'profile_burnout_risk': TestProfile(
      id: 'profile_burnout_risk',
      name: {
        'ru': 'Риск выгорания',
        'en': 'Burnout Risk',
      },
      description: {
        'ru':
            'Вы вкладываете очень много энергии в различные сферы, но при этом мало заботитесь о здоровье и балансе. Это путь к истощению.',
        'en':
            'You invest a lot of energy in various areas, but take little care of health and balance. This is a path to exhaustion.',
      },
      whyThisProfile: {
        'ru':
            'Высокая общая энергия (>=70%), но низкое вложение в здоровье и баланс (<40%).',
        'en':
            'High overall energy (>=70%), but low investment in health and balance (<40%).',
      },
      strengths: {
        'ru': [
          'Высокая работоспособность',
          'Целеустремлённость',
          'Способность брать на себя много',
        ],
        'en': [
          'High performance',
          'Purposefulness',
          'Ability to take on a lot',
        ],
      },
      vulnerabilities: {
        'ru': [
          'КРИТИЧЕСКИЙ риск выгорания',
          'Хроническая усталость',
          'Проблемы со здоровьем в перспективе',
          'Снижение эффективности из-за истощения',
        ],
        'en': [
          'CRITICAL burnout risk',
          'Chronic fatigue',
          'Health problems in the future',
          'Decreased effectiveness due to exhaustion',
        ],
      },
      recommendations: {
        'ru': [
          'СРОЧНО: внесите отдых в календарь как обязательство',
          'Начните с 7-8 часов сна каждую ночь',
          'Введите правило "нет работе" в определённые часы',
          'Практикуйте физическую активность 3 раза в неделю',
          'Рассмотрите консультацию с психологом или коучем',
        ],
        'en': [
          'URGENT: put rest in calendar as commitment',
          'Start with 7-8 hours of sleep every night',
          '"No work" rule during certain hours',
          'Practice physical activity 3 times a week',
          'Consider consultation with psychologist or coach',
        ],
      },
      tryToday: {
        'ru':
            'Запланируйте 30 минут отдыха сегодня без гаджетов и работы. Прямо сейчас внесите в календарь.',
        'en':
            'Schedule 30 minutes of rest today without gadgets and work. Put it in calendar right now.',
      },
      inspiringConclusion: {
        'ru':
            'Забота о себе — это не эгоизм, а необходимость. Вы не сможете дать другим то, чего нет у вас.',
        'en':
            'Self-care is not selfishness, but necessity. You cannot give to others what you do not have.',
      },
    ),
    'profile_freedom_seeker': TestProfile(
      id: 'profile_freedom_seeker',
      name: {
        'ru': 'Искатель свободы',
        'en': 'Freedom Seeker',
      },
      description: {
        'ru':
            'Автономия и независимость — ваши главные ценности. Вы готовы жертвовать стабильностью ради свободы выбора.',
        'en':
            'Autonomy and independence are your main values. You are willing to sacrifice stability for freedom of choice.',
      },
      whyThisProfile: {
        'ru':
            'Высокая значимость свободы (>=70%) при низкой значимости безопасности (<40%).',
        'en':
            'High freedom importance (>=70%) with low security importance (<40%).',
      },
      strengths: {
        'ru': [
          'Высокая адаптивность к изменениям',
          'Способность к инновациям',
          'Смелость в принятии решений',
          'Независимое мышление',
        ],
        'en': [
          'High adaptability to change',
          'Innovation capability',
          'Courage in decision-making',
          'Independent thinking',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Недостаток финансовой подушки безопасности',
          'Риск импульсивных решений',
          'Возможные проблемы с долгосрочным планированием',
        ],
        'en': [
          'Lack of financial safety cushion',
          'Risk of impulsive decisions',
          'Possible long-term planning issues',
        ],
      },
      recommendations: {
        'ru': [
          'Создайте минимальную финансовую подушку (3 месяца)',
          'Балансируйте свободу с базовой стабильностью',
          'Ищите работу с гибким графиком, а не полный хаос',
          'Развивайте навыки самозанятости',
        ],
        'en': [
          'Create minimal financial cushion (3 months)',
          'Balance freedom with basic stability',
          'Look for work with flexible schedule, not full chaos',
          'Develop self-employment skills',
        ],
      },
      tryToday: {
        'ru':
            'Отложите 5% от дохода на "фонд свободы" — чтобы иметь ресурс для смелых решений.',
        'en':
            'Set aside 5% of income for "freedom fund" — to have resource for bold decisions.',
      },
      inspiringConclusion: {
        'ru':
            'Свобода — это ответственность за свой выбор. Продолжайте быть смелыми!',
        'en':
            'Freedom is responsibility for your choice. Continue to be brave!',
      },
    ),
    'profile_stability_seeker': TestProfile(
      id: 'profile_stability_seeker',
      name: {
        'ru': 'Искатель стабильности',
        'en': 'Stability Seeker',
      },
      description: {
        'ru':
            'Безопасность и предсказуемость — ваши ключевые ценности. Вы предпочитаете определённость неизвестности.',
        'en':
            'Security and predictability are your key values. You prefer certainty to uncertainty.',
      },
      whyThisProfile: {
        'ru':
            'Высокая значимость безопасности (>=70%) при низкой значимости свободы (<40%).',
        'en':
            'High security importance (>=70%) with low freedom importance (<40%).',
      },
      strengths: {
        'ru': [
          'Хорошее финансовое планирование',
          'Надёжность и последовательность',
          'Способность создавать долгосрочные планы',
          'Низкий уровень импульсивности',
        ],
        'en': [
          'Good financial planning',
          'Reliability and consistency',
          'Ability to create long-term plans',
          'Low impulsivity',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск упустить возможности из-за страха',
          'Возможная ригидность мышления',
          'Трудности с адаптацией к переменам',
          'Потенциальная зависимость от внешних структур',
        ],
        'en': [
          'Risk of missing opportunities due to fear',
          'Possible rigidity of thinking',
          'Difficulty adapting to change',
          'Potential dependence on external structures',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте маленькие шаги выхода из зоны комфорта',
          'Развивайте навыки принятия решений в условиях неопределённости',
          'Найдите баланс между безопасностью и гибкостью',
          'Создайте "фонд экспериментов" для безопасного риска',
        ],
        'en': [
          'Practice small steps out of comfort zone',
          'Develop decision-making skills under uncertainty',
          'Find balance between security and flexibility',
          'Create "experiment fund" for safe risk',
        ],
      },
      tryToday: {
        'ru':
            'Попробуйте одну маленькую новую вещь сегодня — новый маршрут, новое блюдо, новый подкаст.',
        'en':
            'Try one small new thing today — new route, new dish, new podcast.',
      },
      inspiringConclusion: {
        'ru':
            'Стабильность — это сила. Но помните: гибкость делает вас непобедимыми.',
        'en':
            'Stability is strength. But remember: flexibility makes you invincible.',
      },
    ),
    'profile_relationships_focused': TestProfile(
      id: 'profile_relationships_focused',
      name: {
        'ru': 'Ориентированный на отношения',
        'en': 'Relationships Focused',
      },
      description: {
        'ru':
            'Близкие связи и качественное общение — основа вашей жизни. Вы активно инвестируете в людей.',
        'en':
            'Close connections and quality communication are the foundation of your life. You actively invest in people.',
      },
      whyThisProfile: {
        'ru':
            'Высокая значимость отношений (>=70%) и высокое фактическое вложение энергии (>=60%).',
        'en':
            'High relationships importance (>=70%) and high actual energy investment (>=60%).',
      },
      strengths: {
        'ru': [
          'Сильная сеть поддержки',
          'Эмоциональный интеллект',
          'Способность строить глубокие связи',
          'Высокий уровень эмпатии',
        ],
        'en': [
          'Strong support network',
          'Emotional intelligence',
          'Ability to build deep connections',
          'High empathy level',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск созависимости',
          'Возможное пренебрежение личными целями',
          'Трудности с границами',
          'Чувствительность к конфликтам',
        ],
        'en': [
          'Codependency risk',
          'Possible neglect of personal goals',
          'Boundary difficulties',
          'Sensitivity to conflicts',
        ],
      },
      recommendations: {
        'ru': [
          'Балансируйте заботу о других с заботой о себе',
          'Развивайте здоровые границы в отношениях',
          'Убедитесь что ваши отношения взаимны',
          'Сохраняйте время для личных целей',
        ],
        'en': [
          'Balance caring for others with self-care',
          'Develop healthy boundaries in relationships',
          'Make sure your relationships are reciprocal',
          'Preserve time for personal goals',
        ],
      },
      tryToday: {
        'ru':
            'Позвоните или напишите одному близкому человеку просто чтобы сказать, что вы цените его.',
        'en':
            'Call or text one close person just to say you appreciate them.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша способность любить и быть рядом — это редкий дар. Берегите его и себя.',
        'en':
            'Your ability to love and be there is a rare gift. Cherish it and yourself.',
      },
    ),
    'profile_growth_oriented': TestProfile(
      id: 'profile_growth_oriented',
      name: {
        'ru': 'Ориентированный на рост',
        'en': 'Growth Oriented',
      },
      description: {
        'ru':
            'Постоянное развитие и обучение — ваша жизненная философия. Вы активно инвестируете в расширение компетенций.',
        'en':
            'Continuous development and learning is your life philosophy. You actively invest in expanding competencies.',
      },
      whyThisProfile: {
        'ru':
            'Высокая значимость развития (>=70%) и высокое фактическое вложение энергии (>=60%).',
        'en':
            'High growth importance (>=70%) and high actual energy investment (>=60%).',
      },
      strengths: {
        'ru': [
          'Постоянное расширение навыков',
          'Высокая адаптивность',
          'Любознательность',
          'Конкурентное преимущество на рынке труда',
        ],
        'en': [
          'Constant skill expansion',
          'High adaptability',
          'Curiosity',
          'Competitive advantage in job market',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск "вечного студента" без применения знаний',
          'Возможная информационная перегрузка',
          'Трудности с завершением проектов',
          'Синдром самозванца',
        ],
        'en': [
          'Risk of "eternal student" without applying knowledge',
          'Possible information overload',
          'Project completion difficulties',
          'Impostor syndrome',
        ],
      },
      recommendations: {
        'ru': [
          'Балансируйте обучение с применением знаний',
          'Устанавливайте критерии "достаточно хорошо"',
          'Фокусируйтесь на глубине в 1-2 областях, а не широте',
          'Делитесь знаниями с другими (преподавание закрепляет)',
        ],
        'en': [
          'Balance learning with knowledge application',
          'Set "good enough" criteria',
          'Focus on depth in 1-2 areas, not breadth',
          'Share knowledge with others (teaching reinforces)',
        ],
      },
      tryToday: {
        'ru':
            'Примените одну вещь, которую вы недавно изучили. Даже 15 минут практики лучше теории.',
        'en':
            'Apply one thing you recently learned. Even 15 minutes of practice beats theory.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша жажда знаний — это суперсила. Направьте её на создание реальной ценности.',
        'en':
            'Your thirst for knowledge is a superpower. Direct it to creating real value.',
      },
    ),
    'profile_balanced': TestProfile(
      id: 'profile_balanced',
      name: {
        'ru': 'Сбалансированный',
        'en': 'Balanced',
      },
      description: {
        'ru':
            'Вы демонстрируете сбалансированный подход к жизненным ценностям без явного доминирования одной сферы.',
        'en':
            'You demonstrate a balanced approach to life values without clear dominance of one area.',
      },
      whyThisProfile: {
        'ru':
            'Средние показатели по большинству ценностей без ярко выраженных приоритетов.',
        'en':
            'Average scores across most values without pronounced priorities.',
      },
      strengths: {
        'ru': [
          'Гибкость и адаптивность',
          'Отсутствие крайностей',
          'Способность видеть разные перспективы',
          'Готовность к экспериментам',
        ],
        'en': [
          'Flexibility and adaptability',
          'Absence of extremes',
          'Ability to see different perspectives',
          'Readiness for experiments',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможное отсутствие чёткого направления',
          'Риск распыления усилий',
          'Трудности с приоритизацией',
          'Менее выраженная идентичность',
        ],
        'en': [
          'Possible lack of clear direction',
          'Risk of effort dispersion',
          'Prioritization difficulties',
          'Less pronounced identity',
        ],
      },
      recommendations: {
        'ru': [
          'Попробуйте метод "90 дней фокуса" на одной ценности',
          'Ведите дневник решений: что вас действительно радует?',
          'Экспериментируйте с разными стилями жизни',
          'Не бойтесь временно уходить в крайности для самопознания',
        ],
        'en': [
          'Try "90-day focus" method on one value',
          'Keep decision journal: what truly brings you joy?',
          'Experiment with different lifestyles',
          'Do not fear temporarily going to extremes for self-knowledge',
        ],
      },
      tryToday: {
        'ru':
            'Выберите одну ценность для эксперимента на эту неделю. Живите так, как будто она — главная.',
        'en':
            'Choose one value for experiment this week. Live as if it is the main one.',
      },
      inspiringConclusion: {
        'ru':
            'Баланс — это не отсутствие выбора, а осознанное распределение внимания.',
        'en':
            'Balance is not lack of choice, but conscious distribution of attention.',
      },
    ),
  };
}
