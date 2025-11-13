import '../models/test_model.dart';

/// Data access class for Temperament Profile Test
/// Legacy Dart implementation (no JSON dependency)
class TemperamentProfileTestData {
  /// Get the complete Temperament Profile test
  static TestModel getTemperamentProfileTest() {
    // Standard 5-point Likert scale answers
    final answers = _getLikertAnswers();

    return TestModel(
      id: 'temperament_profile_test',
      title: {
        'ru': 'Профиль темперамента',
        'en': 'Temperament Profile',
      },
      description: {
        'ru':
            'Комплексная оценка темперамента: энергичность, эмоциональная устойчивость, импульсивность, социальная открытость, темп и гибкость',
        'en':
            'Comprehensive temperament assessment: energy, emotional stability, impulsivity, social openness, tempo and flexibility',
      },
      category: {
        'ru': 'Темперамент',
        'en': 'Temperament',
      },
      categoryId: 'temperament',
      disclaimer: {
        'ru':
            'Этот тест предназначен для самопознания и личностного развития. Он не является медицинской диагностикой и не заменяет консультацию специалиста. Отвечайте интуитивно, не раздумывая долго. Нет правильных и неправильных ответов.',
        'en':
            'This test is intended for self-awareness and personal development. It is not a medical diagnosis and does not replace professional consultation. Answer intuitively without overthinking. There are no right or wrong answers.',
      },
      estimatedTime: 12,
      type: TestType.multiFactor,
      factorIds: ['ea', 'eu', 'is', 'so', 'tr', 'ga'],
      questions: _getQuestions(answers),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'ea': {
        'ru': 'Энергичность и активность',
        'en': 'Energy and Activity',
      },
      'eu': {
        'ru': 'Эмоциональная устойчивость',
        'en': 'Emotional Stability',
      },
      'is': {
        'ru': 'Импульсивность и самоконтроль',
        'en': 'Impulsivity and Self-Control',
      },
      'so': {
        'ru': 'Социальная открытость',
        'en': 'Social Openness',
      },
      'tr': {
        'ru': 'Темп и ритм',
        'en': 'Tempo and Rhythm',
      },
      'ga': {
        'ru': 'Гибкость и адаптивность',
        'en': 'Flexibility and Adaptability',
      },
    };
  }

  /// Get factor interpretation based on percentage score
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Determine range: 0-32 (low), 33-66 (medium), 67-100 (high)
    final String level;
    if (percentage <= 32) {
      level = 'low';
    } else if (percentage <= 66) {
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

  /// Standard 5-point Likert scale answers
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совсем не согласен(на)',
          'en': 'Strongly Disagree',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не согласен(на)',
          'en': 'Disagree',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Нейтрально',
          'en': 'Neutral',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Скорее согласен(на)',
          'en': 'Agree',
        },
        score: 4,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью согласен(на)',
          'en': 'Strongly Agree',
        },
        score: 5,
      ),
    ];
  }

  /// Get all 60 questions
  static List<QuestionModel> _getQuestions(List<AnswerModel> answers) {
    return [
      // EA - Energy and Activity (10 questions: q1-q10)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Мне трудно сидеть без дела',
          'en': 'I find it hard to sit idle',
        },
        factorId: 'ea',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Я быстро включаюсь в новые дела',
          'en': 'I quickly engage in new activities',
        },
        factorId: 'ea',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я часто чувствую прилив энергии и энтузиазма',
          'en': 'I often feel a surge of energy and enthusiasm',
        },
        factorId: 'ea',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Мне нравится быть постоянно в движении',
          'en': 'I like to be constantly on the move',
        },
        factorId: 'ea',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Я устаю быстрее, чем другие',
          'en': 'I get tired faster than others',
        },
        factorId: 'ea',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Мне сложно поддерживать высокий уровень активности долгое время',
          'en': 'I find it difficult to maintain high activity levels for long',
        },
        factorId: 'ea',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я предпочитаю активный отдых пассивному',
          'en': 'I prefer active recreation to passive',
        },
        factorId: 'ea',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'У меня часто возникает желание что-то делать',
          'en': 'I often feel the urge to do something',
        },
        factorId: 'ea',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я могу долго заниматься энергозатратными делами',
          'en': 'I can engage in energy-consuming activities for a long time',
        },
        factorId: 'ea',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Мне нужно много времени для восстановления сил',
          'en': 'I need a lot of time to recover my energy',
        },
        factorId: 'ea',
        isReversed: true,
        answers: answers,
      ),

      // EU - Emotional Stability (10 questions: q11-q20)
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я легко выхожу из себя',
          'en': 'I easily lose my temper',
        },
        factorId: 'eu',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Я хорошо справляюсь со стрессом',
          'en': 'I handle stress well',
        },
        factorId: 'eu',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Мои эмоции часто меняются в течение дня',
          'en': 'My emotions change frequently throughout the day',
        },
        factorId: 'eu',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я спокойно отношусь к критике',
          'en': 'I take criticism calmly',
        },
        factorId: 'eu',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я часто переживаю по пустякам',
          'en': 'I often worry about trivial things',
        },
        factorId: 'eu',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я быстро восстанавливаюсь после неприятностей',
          'en': 'I recover quickly from setbacks',
        },
        factorId: 'eu',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Меня легко вывести из равновесия',
          'en': 'I am easily thrown off balance',
        },
        factorId: 'eu',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Я сохраняю самообладание в трудных ситуациях',
          'en': 'I maintain composure in difficult situations',
        },
        factorId: 'eu',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Мне трудно контролировать свои эмоции',
          'en': 'I have difficulty controlling my emotions',
        },
        factorId: 'eu',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я редко испытываю сильное беспокойство',
          'en': 'I rarely experience strong anxiety',
        },
        factorId: 'eu',
        isReversed: false,
        answers: answers,
      ),

      // IS - Impulsivity and Self-Control (10 questions: q21-q30)
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я часто действую, не подумав',
          'en': 'I often act without thinking',
        },
        factorId: 'is',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я тщательно обдумываю свои решения',
          'en': 'I carefully consider my decisions',
        },
        factorId: 'is',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Мне трудно устоять перед соблазнами',
          'en': 'I find it hard to resist temptations',
        },
        factorId: 'is',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я хорошо контролирую свои импульсы',
          'en': 'I control my impulses well',
        },
        factorId: 'is',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я склонен к спонтанным поступкам',
          'en': 'I am prone to spontaneous actions',
        },
        factorId: 'is',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Я всегда взвешиваю «за» и «против» перед действием',
          'en': 'I always weigh pros and cons before acting',
        },
        factorId: 'is',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Я легко отвлекаюсь на внешние раздражители',
          'en': 'I am easily distracted by external stimuli',
        },
        factorId: 'is',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Я способен долго концентрироваться на одной задаче',
          'en': 'I can concentrate on one task for a long time',
        },
        factorId: 'is',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я часто принимаю решения под влиянием эмоций',
          'en': 'I often make decisions influenced by emotions',
        },
        factorId: 'is',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я планирую свои действия заранее',
          'en': 'I plan my actions in advance',
        },
        factorId: 'is',
        isReversed: false,
        answers: answers,
      ),

      // SO - Social Openness (10 questions: q31-q40)
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Я легко знакомлюсь с новыми людьми',
          'en': 'I easily meet new people',
        },
        factorId: 'so',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Мне комфортно в больших компаниях',
          'en': 'I feel comfortable in large groups',
        },
        factorId: 'so',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Я предпочитаю одиночество общению',
          'en': 'I prefer solitude to socializing',
        },
        factorId: 'so',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Я получаю энергию от общения с людьми',
          'en': 'I get energy from interacting with people',
        },
        factorId: 'so',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Мне трудно начать разговор с незнакомцами',
          'en': 'I find it difficult to start conversations with strangers',
        },
        factorId: 'so',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Я активно участвую в социальных мероприятиях',
          'en': 'I actively participate in social events',
        },
        factorId: 'so',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я чувствую себя некомфортно, когда нахожусь в центре внимания',
          'en': 'I feel uncomfortable when I am the center of attention',
        },
        factorId: 'so',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Я открыт для общения с разными людьми',
          'en': 'I am open to communicating with different people',
        },
        factorId: 'so',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Я избегаю шумных вечеринок',
          'en': 'I avoid noisy parties',
        },
        factorId: 'so',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'Мне нравится быть частью группы',
          'en': 'I enjoy being part of a group',
        },
        factorId: 'so',
        isReversed: false,
        answers: answers,
      ),

      // TR - Tempo and Rhythm (10 questions: q41-q50)
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Я быстро принимаю решения',
          'en': 'I make decisions quickly',
        },
        factorId: 'tr',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Я работаю в быстром темпе',
          'en': 'I work at a fast pace',
        },
        factorId: 'tr',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Мне нужно много времени, чтобы что-то сделать',
          'en': 'I need a lot of time to get things done',
        },
        factorId: 'tr',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Я быстро реагирую на изменения ситуации',
          'en': 'I react quickly to changes in the situation',
        },
        factorId: 'tr',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Я предпочитаю размеренный, спокойный темп жизни',
          'en': 'I prefer a measured, calm pace of life',
        },
        factorId: 'tr',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Я легко переключаюсь между разными задачами',
          'en': 'I easily switch between different tasks',
        },
        factorId: 'tr',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Мне трудно работать в условиях дедлайнов',
          'en': 'I find it difficult to work under deadlines',
        },
        factorId: 'tr',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Я быстро думаю и быстро говорю',
          'en': 'I think and speak quickly',
        },
        factorId: 'tr',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q49',
        text: {
          'ru': 'Я часто опаздываю из-за своей медлительности',
          'en': 'I am often late due to my slowness',
        },
        factorId: 'tr',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q50',
        text: {
          'ru': 'Я эффективен в условиях цейтнота',
          'en': 'I am efficient under time pressure',
        },
        factorId: 'tr',
        isReversed: false,
        answers: answers,
      ),

      // GA - Flexibility and Adaptability (10 questions: q51-q60)
      QuestionModel(
        id: 'q51',
        text: {
          'ru': 'Я легко адаптируюсь к новым условиям',
          'en': 'I easily adapt to new conditions',
        },
        factorId: 'ga',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q52',
        text: {
          'ru': 'Мне сложно менять привычный образ действий',
          'en': 'I find it difficult to change my usual way of doing things',
        },
        factorId: 'ga',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q53',
        text: {
          'ru': 'Я хорошо справляюсь с неожиданностями',
          'en': 'I handle unexpected situations well',
        },
        factorId: 'ga',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q54',
        text: {
          'ru': 'Перемены вызывают у меня стресс',
          'en': 'Changes cause me stress',
        },
        factorId: 'ga',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q55',
        text: {
          'ru': 'Я открыт новому опыту',
          'en': 'I am open to new experiences',
        },
        factorId: 'ga',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q56',
        text: {
          'ru': 'Я предпочитаю стабильность и предсказуемость',
          'en': 'I prefer stability and predictability',
        },
        factorId: 'ga',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q57',
        text: {
          'ru': 'Я быстро перестраиваюсь при изменении планов',
          'en': 'I quickly adjust when plans change',
        },
        factorId: 'ga',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q58',
        text: {
          'ru': 'Мне нужно много времени, чтобы привыкнуть к новому',
          'en': 'I need a lot of time to get used to new things',
        },
        factorId: 'ga',
        isReversed: true,
        answers: answers,
      ),
      QuestionModel(
        id: 'q59',
        text: {
          'ru': 'Я гибко подхожу к решению проблем',
          'en': 'I approach problem-solving flexibly',
        },
        factorId: 'ga',
        isReversed: false,
        answers: answers,
      ),
      QuestionModel(
        id: 'q60',
        text: {
          'ru': 'Мне трудно принять изменения в жизни',
          'en': 'I find it hard to accept changes in life',
        },
        factorId: 'ga',
        isReversed: true,
        answers: answers,
      ),
    ];
  }

  /// Get all interpretations for all factors and levels
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'ea': {
        'low': {
          'title_ru': 'Низкая энергичность',
          'title_en': 'Low Energy',
          'description_ru':
              'Вы склонны предпочитать спокойный темп жизни, ценя стабильность и привычный распорядок. Рекомендуется включать в свой день короткие активные привычки для повышения жизненного тонуса.',
          'description_en':
              'You tend to prefer a calm pace of life, favoring stability and routine. Consider incorporating short active habits to boost your vitality.',
        },
        'medium': {
          'title_ru': 'Средняя энергичность',
          'title_en': 'Medium Energy',
          'description_ru':
              'У вас сбалансированный уровень активности. Вы умеете чередовать периоды активности и отдыха, что является оптимальным для поддержания продуктивности.',
          'description_en':
              'You have a balanced activity level. You can alternate between periods of activity and rest, which is optimal for maintaining productivity.',
        },
        'high': {
          'title_ru': 'Высокая энергичность',
          'title_en': 'High Energy',
          'description_ru':
              'Вы полны энергии и инициативы, любите быть в движении. Важно научиться балансировать активность с полноценным отдыхом для предотвращения выгорания.',
          'description_en':
              'You are full of energy and initiative, enjoying constant movement. It\'s important to balance activity with adequate rest to prevent burnout.',
        },
      },
      'eu': {
        'low': {
          'title_ru': 'Низкая эмоциональная устойчивость',
          'title_en': 'Low Emotional Stability',
          'description_ru':
              'Вы чувствительны к стрессу и склонны к эмоциональным реакциям. Рекомендуются дыхательные практики, ведение дневника эмоций и техники релаксации.',
          'description_en':
              'You are sensitive to stress and prone to emotional reactions. Breathing practices, emotion journaling, and relaxation techniques are recommended.',
        },
        'medium': {
          'title_ru': 'Средняя эмоциональная устойчивость',
          'title_en': 'Medium Emotional Stability',
          'description_ru':
              'Вы обычно справляетесь со стрессом, но иногда эмоции берут верх. Продолжайте развивать навыки саморегуляции для укрепления стабильности.',
          'description_en':
              'You usually cope with stress, but emotions sometimes take over. Continue developing self-regulation skills to strengthen stability.',
        },
        'high': {
          'title_ru': 'Высокая эмоциональная устойчивость',
          'title_en': 'High Emotional Stability',
          'description_ru':
              'Вы эмоционально стабильны, хорошо управляете своими реакциями и быстро восстанавливаетесь после стресса. Это ценное качество для успешной жизни.',
          'description_en':
              'You are emotionally stable, manage your reactions well, and recover quickly from stress. This is a valuable quality for a successful life.',
        },
      },
      'is': {
        'low': {
          'title_ru': 'Высокая импульсивность',
          'title_en': 'High Impulsivity',
          'description_ru':
              'Вы склонны действовать спонтанно, что может приводить к непродуманным решениям. Практикуйте «паузы перед действием» и медитацию для развития самоконтроля.',
          'description_en':
              'You tend to act spontaneously, which can lead to hasty decisions. Practice \'pausing before acting\' and meditation to develop self-control.',
        },
        'medium': {
          'title_ru': 'Сбалансированный самоконтроль',
          'title_en': 'Balanced Self-Control',
          'description_ru':
              'Вы умеете находить баланс между спонтанностью и обдуманностью действий. Это помогает вам быть гибким и эффективным в разных ситуациях.',
          'description_en':
              'You can balance spontaneity with thoughtful action. This helps you be flexible and effective in different situations.',
        },
        'high': {
          'title_ru': 'Высокий самоконтроль',
          'title_en': 'High Self-Control',
          'description_ru':
              'Вы тщательно обдумываете свои решения и редко действуете импульсивно. Это защищает вас от ошибок, но иногда полезно проявлять большую спонтанность.',
          'description_en':
              'You carefully consider your decisions and rarely act impulsively. This protects you from mistakes, though sometimes greater spontaneity can be beneficial.',
        },
      },
      'so': {
        'low': {
          'title_ru': 'Интроверсия',
          'title_en': 'Introversion',
          'description_ru':
              'Вы предпочитаете одиночество или общение в узком кругу. Это нормально, но для расширения социальных навыков попробуйте делать малые шаги в общении.',
          'description_en':
              'You prefer solitude or communication in small circles. This is normal, but to expand social skills, try taking small steps in communication.',
        },
        'medium': {
          'title_ru': 'Амбиверсия',
          'title_en': 'Ambiversion',
          'description_ru':
              'Вы сочетаете черты интроверта и экстраверта, комфортно чувствуете себя как в одиночестве, так и в компании. Это универсальное качество.',
          'description_en':
              'You combine introvert and extravert traits, feeling comfortable both alone and in company. This is a versatile quality.',
        },
        'high': {
          'title_ru': 'Экстраверсия',
          'title_en': 'Extraversion',
          'description_ru':
              'Вы общительны, легко заводите знакомства и получаете энергию от взаимодействия с людьми. Важно также находить время для уединения и восстановления.',
          'description_en':
              'You are sociable, easily make acquaintances, and gain energy from interacting with people. It\'s also important to find time for solitude and recovery.',
        },
      },
      'tr': {
        'low': {
          'title_ru': 'Медлительный темп',
          'title_en': 'Slow Tempo',
          'description_ru':
              'Вы работаете в размеренном темпе и вам требуется больше времени для адаптации. Техника Pomodoro и планирование могут помочь повысить скорость работы.',
          'description_en':
              'You work at a measured pace and need more time to adapt. The Pomodoro technique and planning can help increase work speed.',
        },
        'medium': {
          'title_ru': 'Средний темп',
          'title_en': 'Medium Tempo',
          'description_ru':
              'Вы работаете со стабильной скоростью, умеете адаптировать темп к ситуации. Это оптимальный баланс для продуктивной деятельности.',
          'description_en':
              'You work at a stable speed, able to adapt pace to the situation. This is an optimal balance for productive activity.',
        },
        'high': {
          'title_ru': 'Быстрый темп',
          'title_en': 'Fast Tempo',
          'description_ru':
              'Вы быстро думаете, реагируете и переключаетесь между задачами. Это преимущество в динамичной среде, но важно не упускать детали.',
          'description_en':
              'You think, react, and switch between tasks quickly. This is an advantage in a dynamic environment, but it\'s important not to miss details.',
        },
      },
      'ga': {
        'low': {
          'title_ru': 'Ригидность',
          'title_en': 'Rigidity',
          'description_ru':
              'Вам сложно адаптироваться к переменам и менять привычки. Рекомендуются задания «выйти из зоны комфорта» хотя бы раз в неделю для развития гибкости.',
          'description_en':
              'You find it difficult to adapt to changes and change habits. Tasks to \'step out of your comfort zone\' at least once a week are recommended to develop flexibility.',
        },
        'medium': {
          'title_ru': 'Средняя гибкость',
          'title_en': 'Medium Flexibility',
          'description_ru':
              'Вы способны адаптироваться к изменениям, хотя иногда это требует усилий. Продолжайте развивать открытость к новому опыту.',
          'description_en':
              'You can adapt to changes, though it sometimes requires effort. Continue developing openness to new experiences.',
        },
        'high': {
          'title_ru': 'Высокая гибкость',
          'title_en': 'High Flexibility',
          'description_ru':
              'Вы легко адаптируетесь к новым обстоятельствам, быстро перестраиваетесь и воспринимаете перемены как возможности. Это ценное качество в современном мире.',
          'description_en':
              'You easily adapt to new circumstances, quickly adjust, and perceive changes as opportunities. This is a valuable quality in the modern world.',
        },
      },
    };
  }
}
