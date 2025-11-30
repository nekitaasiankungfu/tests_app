import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Данные теста "Индекс субъективного благополучия"
///
/// PERMA модель благополучия (Seligman):
/// P - Positive Emotions (Позитивные эмоции)
/// E - Engagement (Вовлечённость)
/// R - Relationships (Отношения)
/// M - Meaning (Смысл)
/// A - Accomplishment (Достижения)
/// + Life Satisfaction (Удовлетворённость жизнью)
///
/// 30 вопросов, 6 шкал, шкала ответов 1-6
class WellbeingHappinessInventoryData {
  /// Получить тест как TestModel
  static TestModel getWellbeingHappinessInventoryTest() {
    return TestModel(
      id: 'wellbeing_happiness_inventory_v1',
      title: {
        'ru': 'Индекс субъективного благополучия',
        'en': 'Wellbeing Happiness Inventory',
      },
      description: {
        'ru': 'Комплексная оценка счастья и удовлетворённости жизнью по модели PERMA.',
        'en': 'Comprehensive assessment of happiness and life satisfaction based on PERMA model.',
      },
      category: {'ru': 'Эмоциональное состояние', 'en': 'Emotional State'},
      categoryId: 'emotional',
      estimatedTime: 8,
      factorIds: [
        'positive_emotions',
        'engagement',
        'relationships',
        'meaning',
        'accomplishment',
        'life_satisfaction',
      ],
      questions: _getQuestions(),
      type: TestType.multiFactor,
    );
  }

  /// Список всех вопросов
  static List<QuestionModel> _getQuestions() {
    // Стандартные ответы для всех вопросов (Likert 6-point, scores 0-5)
    final answers = [
      AnswerModel(id: 'a1', text: {'ru': 'Совершенно не согласен', 'en': 'Strongly disagree'}, score: 0),
      AnswerModel(id: 'a2', text: {'ru': 'Не согласен', 'en': 'Disagree'}, score: 1),
      AnswerModel(id: 'a3', text: {'ru': 'Скорее не согласен', 'en': 'Slightly disagree'}, score: 2),
      AnswerModel(id: 'a4', text: {'ru': 'Скорее согласен', 'en': 'Slightly agree'}, score: 3),
      AnswerModel(id: 'a5', text: {'ru': 'Согласен', 'en': 'Agree'}, score: 4),
      AnswerModel(id: 'a6', text: {'ru': 'Полностью согласен', 'en': 'Strongly agree'}, score: 5),
    ];

    return [
      // ===== POSITIVE EMOTIONS (1, 7, 13, 19, 25) =====
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'В последнее время я часто испытываю радость и хорошее настроение',
          'en': 'Lately I often experience joy and good mood',
        },
        answers: answers,
        factorId: 'positive_emotions',
      ),

      // ===== ENGAGEMENT (2, 8, 14, 20, 26) =====
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Я легко увлекаюсь тем, чем занимаюсь, и теряю счёт времени',
          'en': 'I easily get absorbed in what I do and lose track of time',
        },
        answers: answers,
        factorId: 'engagement',
      ),

      // ===== RELATIONSHIPS (3, 9, 15, 21, 27) =====
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'В моей жизни есть люди, которые по-настоящему заботятся обо мне',
          'en': 'There are people in my life who truly care about me',
        },
        answers: answers,
        factorId: 'relationships',
      ),

      // ===== MEANING (4, 10, 16, 22, 28) =====
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я чувствую, что моя жизнь имеет смысл и направление',
          'en': 'I feel that my life has meaning and direction',
        },
        answers: answers,
        factorId: 'meaning',
      ),

      // ===== ACCOMPLISHMENT (5, 11, 17, 23, 29) =====
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Я достигаю целей, которые ставлю перед собой',
          'en': 'I achieve the goals I set for myself',
        },
        answers: answers,
        factorId: 'accomplishment',
      ),

      // ===== LIFE SATISFACTION (6, 12, 18, 24, 30) =====
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'В целом я удовлетворён(а) тем, как складывается моя жизнь',
          'en': 'Overall I am satisfied with how my life is going',
        },
        answers: answers,
        factorId: 'life_satisfaction',
      ),

      // ===== Q7: POSITIVE EMOTIONS - gratitude =====
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я часто чувствую благодарность за то, что у меня есть',
          'en': 'I often feel grateful for what I have',
        },
        answers: answers,
        factorId: 'positive_emotions',
      ),

      // ===== Q8: ENGAGEMENT - absorption =====
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'У меня есть занятия, которые полностью захватывают моё внимание',
          'en': 'I have activities that completely capture my attention',
        },
        answers: answers,
        factorId: 'engagement',
      ),

      // ===== Q9: RELATIONSHIPS - connection =====
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я чувствую близость и связь с важными для меня людьми',
          'en': 'I feel close and connected to people who are important to me',
        },
        answers: answers,
        factorId: 'relationships',
      ),

      // ===== Q10: MEANING - significance =====
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'То, чем я занимаюсь, имеет значение и ценность',
          'en': 'What I do has significance and value',
        },
        answers: answers,
        factorId: 'meaning',
      ),

      // ===== Q11: ACCOMPLISHMENT - growth =====
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я чувствую, что развиваюсь и становлюсь лучше в важных для меня областях',
          'en': 'I feel I am growing and getting better in areas important to me',
        },
        answers: answers,
        factorId: 'accomplishment',
      ),

      // ===== Q12: LIFE SATISFACTION - ideal comparison =====
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Моя жизнь близка к моему идеалу',
          'en': 'My life is close to my ideal',
        },
        answers: answers,
        factorId: 'life_satisfaction',
      ),

      // ===== Q13: POSITIVE EMOTIONS - serenity =====
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я часто испытываю чувство внутреннего спокойствия и умиротворения',
          'en': 'I often experience a sense of inner peace and serenity',
        },
        answers: answers,
        factorId: 'positive_emotions',
      ),

      // ===== Q14: ENGAGEMENT - curiosity =====
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Мне интересно изучать новое и развивать свои навыки',
          'en': 'I am interested in learning new things and developing my skills',
        },
        answers: answers,
        factorId: 'engagement',
      ),

      // ===== Q15: RELATIONSHIPS - sharing =====
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Мне есть с кем поделиться радостями и трудностями',
          'en': 'I have people to share my joys and difficulties with',
        },
        answers: answers,
        factorId: 'relationships',
      ),

      // ===== Q16: MEANING - belonging =====
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я чувствую себя частью чего-то большего, чем я сам(а)',
          'en': 'I feel part of something greater than myself',
        },
        answers: answers,
        factorId: 'meaning',
      ),

      // ===== Q17: ACCOMPLISHMENT - competence =====
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я справляюсь с большинством задач, которые передо мной стоят',
          'en': 'I handle most tasks that I face',
        },
        answers: answers,
        factorId: 'accomplishment',
      ),

      // ===== Q18: LIFE SATISFACTION - conditions =====
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Условия моей жизни хорошие',
          'en': 'The conditions of my life are good',
        },
        answers: answers,
        factorId: 'life_satisfaction',
      ),

      // ===== Q19: POSITIVE EMOTIONS - amusement =====
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Я часто смеюсь и веселюсь',
          'en': 'I often laugh and have fun',
        },
        answers: answers,
        factorId: 'positive_emotions',
      ),

      // ===== Q20: ENGAGEMENT - enthusiasm =====
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я с энтузиазмом отношусь к своей деятельности (работе, учёбе, хобби)',
          'en': 'I am enthusiastic about my activities (work, studies, hobbies)',
        },
        answers: answers,
        factorId: 'engagement',
      ),

      // ===== Q21: RELATIONSHIPS - valued =====
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я чувствую себя любимым(ой) и ценным(ой) для других людей',
          'en': 'I feel loved and valued by other people',
        },
        answers: answers,
        factorId: 'relationships',
      ),

      // ===== Q22: MEANING - values =====
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я понимаю, ради чего живу и что для меня важно',
          'en': 'I understand what I live for and what is important to me',
        },
        answers: answers,
        factorId: 'meaning',
      ),

      // ===== Q23: ACCOMPLISHMENT - pride =====
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я горжусь тем, чего достиг(ла) в жизни',
          'en': 'I am proud of what I have achieved in life',
        },
        answers: answers,
        factorId: 'accomplishment',
      ),

      // ===== Q24: LIFE SATISFACTION - no regrets =====
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Если бы я мог(ла) прожить жизнь заново, я бы почти ничего не изменил(а)',
          'en': 'If I could live my life over, I would change almost nothing',
        },
        answers: answers,
        factorId: 'life_satisfaction',
      ),

      // ===== Q25: POSITIVE EMOTIONS - optimism =====
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я с оптимизмом смотрю в будущее',
          'en': 'I look to the future with optimism',
        },
        answers: answers,
        factorId: 'positive_emotions',
      ),

      // ===== Q26: ENGAGEMENT - enjoyable activities =====
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Я нахожу время для занятий, которые мне по-настоящему нравятся',
          'en': 'I find time for activities that I truly enjoy',
        },
        answers: answers,
        factorId: 'engagement',
      ),

      // ===== Q27: RELATIONSHIPS - reliability =====
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'У меня есть люди, на которых я могу положиться в трудную минуту',
          'en': 'I have people I can rely on in difficult times',
        },
        answers: answers,
        factorId: 'relationships',
      ),

      // ===== Q28: MEANING - mission =====
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Моя жизнь служит какой-то важной цели',
          'en': 'My life serves some important purpose',
        },
        answers: answers,
        factorId: 'meaning',
      ),

      // ===== Q29: ACCOMPLISHMENT - efficacy =====
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я способен(на) добиваться того, что для меня важно',
          'en': 'I am capable of achieving what is important to me',
        },
        answers: answers,
        factorId: 'accomplishment',
      ),

      // ===== Q30: LIFE SATISFACTION - fulfillment =====
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'До сих пор я получал(а) от жизни то, что хотел(а)',
          'en': 'So far I have gotten the things I want in life',
        },
        answers: answers,
        factorId: 'life_satisfaction',
      ),
    ];
  }

  /// Названия факторов
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'positive_emotions': {
        'ru': 'Позитивные эмоции',
        'en': 'Positive Emotions',
      },
      'engagement': {
        'ru': 'Вовлечённость',
        'en': 'Engagement',
      },
      'relationships': {
        'ru': 'Отношения',
        'en': 'Relationships',
      },
      'meaning': {
        'ru': 'Смысл',
        'en': 'Meaning',
      },
      'accomplishment': {
        'ru': 'Достижения',
        'en': 'Accomplishment',
      },
      'life_satisfaction': {
        'ru': 'Удовлетворённость жизнью',
        'en': 'Life Satisfaction',
      },
    };
  }

  /// Интерпретация результатов по фактору
  static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
    // Защита от NaN
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    // Определяем уровень (5 уровней для более точной интерпретации)
    String level;
    if (percentage < 20) {
      level = 'very_low';
    } else if (percentage < 40) {
      level = 'low';
    } else if (percentage < 60) {
      level = 'moderate';
    } else if (percentage < 80) {
      level = 'high';
    } else {
      level = 'very_high';
    }

    // Интерпретации по факторам
    final interpretations = {
      'positive_emotions': {
        'very_low': {
          'ru': 'Очень низкий уровень позитивных эмоций. Вы редко испытываете радость и благодарность. Рекомендуется консультация специалиста.',
          'en': 'Very low level of positive emotions. You rarely experience joy and gratitude. Professional consultation recommended.',
        },
        'low': {
          'ru': 'Низкий уровень позитивных эмоций. Практикуйте благодарность и увеличьте количество приятных занятий.',
          'en': 'Low level of positive emotions. Practice gratitude and increase pleasant activities.',
        },
        'moderate': {
          'ru': 'Средний уровень позитивных эмоций. Есть пространство для роста через практики позитивной психологии.',
          'en': 'Moderate level of positive emotions. Room for growth through positive psychology practices.',
        },
        'high': {
          'ru': 'Высокий уровень позитивных эмоций. Вы часто чувствуете радость, благодарность и оптимизм.',
          'en': 'High level of positive emotions. You often feel joy, gratitude and optimism.',
        },
        'very_high': {
          'ru': 'Очень высокий уровень позитивных эмоций. Отличный ресурс благополучия!',
          'en': 'Very high level of positive emotions. Excellent wellbeing resource!',
        },
      },
      'engagement': {
        'very_low': {
          'ru': 'Очень низкая вовлечённость. Вам сложно увлечься чем-то. Попробуйте найти занятия по интересам.',
          'en': 'Very low engagement. Hard to get absorbed in activities. Try finding activities that interest you.',
        },
        'low': {
          'ru': 'Низкая вовлечённость. Создайте условия для потока: уберите отвлечения, ставьте чёткие цели.',
          'en': 'Low engagement. Create flow conditions: remove distractions, set clear goals.',
        },
        'moderate': {
          'ru': 'Средняя вовлечённость. Ищите больше занятий, которые по-настоящему захватывают.',
          'en': 'Moderate engagement. Look for more activities that truly captivate you.',
        },
        'high': {
          'ru': 'Высокая вовлечённость. Вы легко погружаетесь в деятельность и испытываете состояние потока.',
          'en': 'High engagement. You easily get absorbed in activities and experience flow state.',
        },
        'very_high': {
          'ru': 'Очень высокая вовлечённость. Вы живёте насыщенной, увлечённой жизнью!',
          'en': 'Very high engagement. You live a rich, engaged life!',
        },
      },
      'relationships': {
        'very_low': {
          'ru': 'Очень низкое качество отношений. Вы чувствуете одиночество. Ищите возможности для общения.',
          'en': 'Very low relationship quality. You feel lonely. Look for connection opportunities.',
        },
        'low': {
          'ru': 'Низкое качество отношений. Инвестируйте время в существующие связи.',
          'en': 'Low relationship quality. Invest time in existing connections.',
        },
        'moderate': {
          'ru': 'Среднее качество отношений. Есть потенциал для углубления связей.',
          'en': 'Moderate relationship quality. Potential for deepening connections.',
        },
        'high': {
          'ru': 'Высокое качество отношений. У вас есть близкие люди и поддержка.',
          'en': 'High relationship quality. You have close people and support.',
        },
        'very_high': {
          'ru': 'Очень высокое качество отношений. Ваши связи — мощный источник счастья!',
          'en': 'Very high relationship quality. Your connections are a powerful source of happiness!',
        },
      },
      'meaning': {
        'very_low': {
          'ru': 'Очень низкое ощущение смысла. Исследуйте свои ценности и найдите то, что важно для вас.',
          'en': 'Very low sense of meaning. Explore your values and find what matters to you.',
        },
        'low': {
          'ru': 'Низкое ощущение смысла. Связывайте повседневные дела с более широкой целью.',
          'en': 'Low sense of meaning. Connect daily activities with a broader purpose.',
        },
        'moderate': {
          'ru': 'Среднее ощущение смысла. Есть пространство для более глубокого понимания своего предназначения.',
          'en': 'Moderate sense of meaning. Room for deeper understanding of your purpose.',
        },
        'high': {
          'ru': 'Высокое ощущение смысла. Ваша жизнь имеет направление и цель.',
          'en': 'High sense of meaning. Your life has direction and purpose.',
        },
        'very_high': {
          'ru': 'Очень высокое ощущение смысла. Вы живёте осмысленной, целенаправленной жизнью!',
          'en': 'Very high sense of meaning. You live a meaningful, purposeful life!',
        },
      },
      'accomplishment': {
        'very_low': {
          'ru': 'Очень низкое ощущение достижений. Ставьте маленькие достижимые цели.',
          'en': 'Very low sense of accomplishment. Set small achievable goals.',
        },
        'low': {
          'ru': 'Низкое ощущение достижений. Разбивайте большие цели на маленькие шаги.',
          'en': 'Low sense of accomplishment. Break big goals into small steps.',
        },
        'moderate': {
          'ru': 'Среднее ощущение достижений. Отмечайте свои успехи, даже небольшие.',
          'en': 'Moderate sense of accomplishment. Acknowledge your successes, even small ones.',
        },
        'high': {
          'ru': 'Высокое ощущение достижений. Вы чувствуете прогресс и компетентность.',
          'en': 'High sense of accomplishment. You feel progress and competence.',
        },
        'very_high': {
          'ru': 'Очень высокое ощущение достижений. Вы успешно достигаете своих целей!',
          'en': 'Very high sense of accomplishment. You successfully achieve your goals!',
        },
      },
      'life_satisfaction': {
        'very_low': {
          'ru': 'Очень низкая удовлетворённость жизнью. Рассмотрите консультацию со специалистом.',
          'en': 'Very low life satisfaction. Consider consulting a specialist.',
        },
        'low': {
          'ru': 'Низкая удовлетворённость жизнью. Работайте над конкретными областями, которые вас не устраивают.',
          'en': 'Low life satisfaction. Work on specific areas that dissatisfy you.',
        },
        'moderate': {
          'ru': 'Средняя удовлетворённость жизнью. Фокусируйтесь на том, что хорошо.',
          'en': 'Moderate life satisfaction. Focus on what is good.',
        },
        'high': {
          'ru': 'Высокая удовлетворённость жизнью. Ваша жизнь соответствует вашим ожиданиям.',
          'en': 'High life satisfaction. Your life meets your expectations.',
        },
        'very_high': {
          'ru': 'Очень высокая удовлетворённость жизнью. Вы по-настоящему довольны своей жизнью!',
          'en': 'Very high life satisfaction. You are truly satisfied with your life!',
        },
      },
    };

    final factorInterpretations = interpretations[factorId];
    if (factorInterpretations == null) {
      return {
        'ru': 'Интерпретация недоступна',
        'en': 'Interpretation not available',
      };
    }

    return factorInterpretations[level] ?? {
      'ru': 'Интерпретация недоступна',
      'en': 'Interpretation not available',
    };
  }

  /// Определяет профиль на основе процентов по шкалам
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_developing';

    // Средний процент по всем факторам
    final avgPercentage = percentages.values.reduce((a, b) => a + b) / percentages.length;

    // Находим самый высокий и низкий факторы
    String? highestFactor;
    String? lowestFactor;
    double highestValue = 0;
    double lowestValue = 100;

    for (final entry in percentages.entries) {
      if (entry.value > highestValue) {
        highestValue = entry.value;
        highestFactor = entry.key;
      }
      if (entry.value < lowestValue) {
        lowestValue = entry.value;
        lowestFactor = entry.key;
      }
    }

    // Проверяем высокий уровень (>=70% по всем)
    if (avgPercentage >= 70) return 'profile_flourishing';

    // Проверяем средний уровень (>=50% по всем)
    if (avgPercentage >= 50) return 'profile_moderately_happy';

    // Проверяем низкий уровень
    if (avgPercentage >= 30) return 'profile_languishing';

    return 'profile_struggling';
  }

  /// Возвращает профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  static final Map<String, TestProfile> _profiles = {
    'profile_flourishing': TestProfile(
      id: 'profile_flourishing',
      name: {
        'ru': 'Процветающий',
        'en': 'Flourishing',
      },
      description: {
        'ru': 'Вы демонстрируете высокий уровень благополучия по всем компонентам модели PERMA. Вы испытываете много позитивных эмоций, увлечены своей жизнью, имеете крепкие отношения, живёте осмысленно и достигаете целей.',
        'en': 'You demonstrate high levels of wellbeing across all PERMA components. You experience many positive emotions, are engaged in life, have strong relationships, live meaningfully and achieve your goals.',
      },
      whyThisProfile: {
        'ru': 'Ваши показатели выше 70% по большинству факторов благополучия.',
        'en': 'Your scores are above 70% across most wellbeing factors.',
      },
      strengths: {
        'ru': [
          'Высокий уровень позитивных эмоций',
          'Способность к глубокой вовлечённости',
          'Крепкие социальные связи',
          'Ясное ощущение смысла жизни',
          'Регулярное достижение целей',
        ],
        'en': [
          'High level of positive emotions',
          'Ability for deep engagement',
          'Strong social connections',
          'Clear sense of life meaning',
          'Regular goal achievement',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск выгорания от чрезмерной активности',
          'Возможное игнорирование негативных эмоций',
        ],
        'en': [
          'Risk of burnout from excessive activity',
          'Possible ignoring of negative emotions',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте практики, поддерживающие благополучие',
          'Делитесь опытом счастья с другими',
          'Балансируйте активность с отдыхом',
          'Развивайте осознанность к своим эмоциям',
        ],
        'en': [
          'Continue practices that support wellbeing',
          'Share your happiness experience with others',
          'Balance activity with rest',
          'Develop awareness of your emotions',
        ],
      },
      tryToday: {
        'ru': 'Поблагодарите кого-то за вклад в вашу счастливую жизнь.',
        'en': 'Thank someone for their contribution to your happy life.',
      },
      inspiringConclusion: {
        'ru': 'Вы — пример того, что счастье достижимо. Продолжайте светить!',
        'en': 'You are an example that happiness is achievable. Keep shining!',
      },
    ),

    'profile_moderately_happy': TestProfile(
      id: 'profile_moderately_happy',
      name: {
        'ru': 'Умеренно счастливый',
        'en': 'Moderately Happy',
      },
      description: {
        'ru': 'У вас хороший базовый уровень благополучия с потенциалом для роста. Вы функционируете нормально, но есть области, которые можно развить.',
        'en': 'You have a good baseline level of wellbeing with growth potential. You function normally, but there are areas that can be developed.',
      },
      whyThisProfile: {
        'ru': 'Ваши показатели находятся в среднем диапазоне (50-70%).',
        'en': 'Your scores are in the middle range (50-70%).',
      },
      strengths: {
        'ru': [
          'Стабильный эмоциональный фон',
          'Базовые навыки благополучия',
          'Готовность к развитию',
          'Способность справляться с трудностями',
        ],
        'en': [
          'Stable emotional background',
          'Basic wellbeing skills',
          'Readiness for development',
          'Ability to cope with difficulties',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Недостаточная глубина в некоторых областях',
          'Возможная зона комфорта без развития',
        ],
        'en': [
          'Insufficient depth in some areas',
          'Possible comfort zone without growth',
        ],
      },
      recommendations: {
        'ru': [
          'Определите 1-2 области PERMA для целенаправленного развития',
          'Практикуйте благодарность ежедневно',
          'Ищите занятия, которые вызывают состояние потока',
          'Инвестируйте время в отношения',
        ],
        'en': [
          'Identify 1-2 PERMA areas for targeted development',
          'Practice gratitude daily',
          'Look for activities that create flow state',
          'Invest time in relationships',
        ],
      },
      tryToday: {
        'ru': 'Запишите 3 вещи, за которые вы благодарны сегодня.',
        'en': 'Write down 3 things you are grateful for today.',
      },
      inspiringConclusion: {
        'ru': 'У вас есть всё необходимое для большего счастья. Каждый маленький шаг приближает вас к процветанию.',
        'en': 'You have everything needed for greater happiness. Every small step brings you closer to flourishing.',
      },
    ),

    'profile_languishing': TestProfile(
      id: 'profile_languishing',
      name: {
        'ru': 'В поиске смысла',
        'en': 'Languishing',
      },
      description: {
        'ru': 'Вы находитесь в состоянии "ни то, ни сё" — не депрессия, но и не процветание. Жизнь кажется серой, и вам не хватает энтузиазма.',
        'en': 'You are in a "neither here nor there" state — not depression, but not flourishing either. Life seems gray, and you lack enthusiasm.',
      },
      whyThisProfile: {
        'ru': 'Ваши показатели ниже среднего (30-50%), что указывает на состояние "languishing".',
        'en': 'Your scores are below average (30-50%), indicating a "languishing" state.',
      },
      strengths: {
        'ru': [
          'Осознание необходимости изменений',
          'Стабильность (не в кризисе)',
          'Потенциал для роста',
        ],
        'en': [
          'Awareness of need for change',
          'Stability (not in crisis)',
          'Potential for growth',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск скатывания в депрессию',
          'Эмоциональное онемение',
          'Отсутствие мотивации',
          'Чувство бессмысленности',
        ],
        'en': [
          'Risk of sliding into depression',
          'Emotional numbness',
          'Lack of motivation',
          'Sense of meaninglessness',
        ],
      },
      recommendations: {
        'ru': [
          'Создайте ежедневную структуру с маленькими радостями',
          'Восстановите социальные связи',
          'Найдите одно занятие, которое по-настоящему захватывает',
          'Рассмотрите работу с психологом',
          'Практикуйте физическую активность',
        ],
        'en': [
          'Create daily structure with small pleasures',
          'Restore social connections',
          'Find one activity that truly captivates you',
          'Consider working with a therapist',
          'Practice physical activity',
        ],
      },
      tryToday: {
        'ru': 'Позвоните другу или близкому человеку просто чтобы поговорить.',
        'en': 'Call a friend or loved one just to chat.',
      },
      inspiringConclusion: {
        'ru': 'Languishing — это не конечная станция. Это сигнал, что пора начать движение к лучшей жизни.',
        'en': 'Languishing is not a final destination. It is a signal that it is time to start moving toward a better life.',
      },
    ),

    'profile_struggling': TestProfile(
      id: 'profile_struggling',
      name: {
        'ru': 'В трудный период',
        'en': 'Struggling',
      },
      description: {
        'ru': 'Сейчас вам тяжело. Низкие показатели по нескольким областям указывают на серьёзные трудности с благополучием. Это не приговор — это точка, с которой можно начать путь к восстановлению.',
        'en': 'You are going through a difficult time. Low scores in several areas indicate serious wellbeing challenges. This is not a verdict — it is a starting point for recovery.',
      },
      whyThisProfile: {
        'ru': 'Ваши показатели ниже 30%, что указывает на значительные трудности.',
        'en': 'Your scores are below 30%, indicating significant difficulties.',
      },
      strengths: {
        'ru': [
          'Честность в оценке своего состояния',
          'Готовность искать помощь (прохождение теста)',
          'Потенциал для восстановления',
        ],
        'en': [
          'Honesty in assessing your condition',
          'Willingness to seek help (taking this test)',
          'Potential for recovery',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск депрессии или тревоги',
          'Социальная изоляция',
          'Физическое истощение',
          'Потеря смысла',
        ],
        'en': [
          'Risk of depression or anxiety',
          'Social isolation',
          'Physical exhaustion',
          'Loss of meaning',
        ],
      },
      recommendations: {
        'ru': [
          'Обратитесь к специалисту (психолог, терапевт)',
          'Не оставайтесь в одиночестве — расскажите близким',
          'Фокусируйтесь на базовых потребностях: сон, еда, движение',
          'Начните с самых маленьких шагов',
          'Помните: это временное состояние',
        ],
        'en': [
          'Seek professional help (psychologist, therapist)',
          'Don\'t stay alone — tell loved ones',
          'Focus on basic needs: sleep, food, movement',
          'Start with the smallest steps',
          'Remember: this is a temporary state',
        ],
      },
      tryToday: {
        'ru': 'Сделайте одно доброе дело для себя: прогулку, тёплую ванну, любимую еду.',
        'en': 'Do one kind thing for yourself: a walk, a warm bath, favorite food.',
      },
      inspiringConclusion: {
        'ru': 'Самые тёмные ночи предшествуют рассвету. Вы уже сделали первый шаг, признав ситуацию. Помощь доступна.',
        'en': 'The darkest nights precede dawn. You have already taken the first step by acknowledging the situation. Help is available.',
      },
    ),

    'profile_developing': TestProfile(
      id: 'profile_developing',
      name: {
        'ru': 'Развивающийся',
        'en': 'Developing',
      },
      description: {
        'ru': 'Вы находитесь на пути развития благополучия. Есть области для роста и укрепления.',
        'en': 'You are on the path of developing wellbeing. There are areas for growth and strengthening.',
      },
      whyThisProfile: {
        'ru': 'Ваши результаты показывают смешанную картину благополучия.',
        'en': 'Your results show a mixed picture of wellbeing.',
      },
      strengths: {
        'ru': [
          'Осознание важности благополучия',
          'Готовность к развитию',
          'Способность к самоанализу',
        ],
        'en': [
          'Awareness of importance of wellbeing',
          'Readiness for development',
          'Capacity for self-analysis',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Неравномерное развитие разных областей',
          'Возможная неустойчивость состояния',
        ],
        'en': [
          'Uneven development across areas',
          'Possible instability of state',
        ],
      },
      recommendations: {
        'ru': [
          'Определите свои сильные и слабые области',
          'Создайте план развития благополучия',
          'Практикуйте PERMA ежедневно',
        ],
        'en': [
          'Identify your strong and weak areas',
          'Create a wellbeing development plan',
          'Practice PERMA daily',
        ],
      },
      tryToday: {
        'ru': 'Выберите одну область PERMA и сделайте один шаг для её улучшения.',
        'en': 'Choose one PERMA area and take one step to improve it.',
      },
      inspiringConclusion: {
        'ru': 'Каждый день — возможность для роста. Вы на правильном пути!',
        'en': 'Every day is an opportunity for growth. You are on the right path!',
      },
    ),
  };
}
