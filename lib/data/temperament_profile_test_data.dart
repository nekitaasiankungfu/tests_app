import '../models/test_model.dart';
import '../models/test_profile_model.dart';

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

  /// Определение профиля на основе процентов по факторам
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_balanced';

    final ea = percentages['ea'] ?? 0; // Energy and Activity
    final eu = percentages['eu'] ?? 0; // Emotional Stability
    final is_ = percentages['is'] ?? 0; // Impulsivity/Self-Control (high = controlled)
    final so = percentages['so'] ?? 0; // Social Openness
    final tr = percentages['tr'] ?? 0; // Tempo and Rhythm
    final ga = percentages['ga'] ?? 0; // Flexibility and Adaptability

    final avgPercentage = (ea + eu + is_ + so + tr + ga) / 6;

    // Находим доминирующие и слабые черты
    final scores = {
      'ea': ea, 'eu': eu, 'is': is_, 'so': so, 'tr': tr, 'ga': ga,
    };
    final sorted = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final dominant1 = sorted[0];
    final dominant2 = sorted[1];
    final weakest = sorted.last;

    // Комбо-профили на основе двух доминирующих черт
    if (dominant1.value > 60 && dominant2.value > 55) {
      // Энергичность + Высокий темп = Динамо
      if (_isPair(dominant1.key, dominant2.key, 'ea', 'tr')) {
        return 'profile_dynamo';
      }
      // Эмоциональная устойчивость + Самоконтроль = Невозмутимый
      if (_isPair(dominant1.key, dominant2.key, 'eu', 'is')) {
        return 'profile_unflappable';
      }
      // Социальная открытость + Энергичность = Душа компании
      if (_isPair(dominant1.key, dominant2.key, 'so', 'ea')) {
        return 'profile_life_of_party';
      }
      // Гибкость + Высокий темп = Хамелеон
      if (_isPair(dominant1.key, dominant2.key, 'ga', 'tr')) {
        return 'profile_chameleon';
      }
      // Самоконтроль + Гибкость = Стратег
      if (_isPair(dominant1.key, dominant2.key, 'is', 'ga')) {
        return 'profile_strategist';
      }
      // Эмоциональная устойчивость + Социальная открытость = Гармонизатор
      if (_isPair(dominant1.key, dominant2.key, 'eu', 'so')) {
        return 'profile_harmonizer';
      }
    }

    // Профили на основе одной доминирующей черты
    if (dominant1.value > 70) {
      switch (dominant1.key) {
        case 'ea':
          return 'profile_energizer';
        case 'eu':
          return 'profile_rock';
        case 'is':
          return 'profile_master_of_control';
        case 'so':
          return 'profile_connector';
        case 'tr':
          return 'profile_speedster';
        case 'ga':
          return 'profile_adaptor';
      }
    }

    // Профили на основе слабых черт
    if (weakest.value < 30 && avgPercentage > 50) {
      switch (weakest.key) {
        case 'ea':
          return 'profile_contemplative';
        case 'eu':
          return 'profile_sensitive';
        case 'is':
          return 'profile_spontaneous';
        case 'so':
          return 'profile_deep_thinker';
        case 'tr':
          return 'profile_methodical';
        case 'ga':
          return 'profile_steadfast';
      }
    }

    // Профили на основе общего уровня
    if (avgPercentage >= 70) {
      return 'profile_optimized';
    } else if (avgPercentage >= 50) {
      return 'profile_balanced';
    } else if (avgPercentage >= 30) {
      return 'profile_developing';
    } else {
      return 'profile_introspective';
    }
  }

  static bool _isPair(String a, String b, String x, String y) {
    return (a == x && b == y) || (a == y && b == x);
  }

  /// Получение профиля по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  static const Map<String, TestProfile> _profiles = {
    // ===== КОМБО-ПРОФИЛИ =====
    'profile_dynamo': TestProfile(
      id: 'profile_dynamo',
      name: {
        'ru': 'Динамо',
        'en': 'Dynamo',
      },
      description: {
        'ru': 'Вы — генератор энергии с высокой скоростью работы. Вы быстро думаете, быстро действуете и заряжаете окружающих своей активностью.',
        'en': 'You are an energy generator with high work speed. You think fast, act fast, and energize those around you with your activity.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокую энергичность в сочетании с быстрым темпом — идеальное сочетание для динамичной работы.',
        'en': 'Your answers showed high energy combined with fast tempo — an ideal combination for dynamic work.',
      },
      strengths: {
        'ru': [
          'Высокая продуктивность и энергия',
          'Быстрая реакция и адаптация',
          'Способность вдохновлять команду',
          'Эффективность в кризисных ситуациях',
        ],
        'en': [
          'High productivity and energy',
          'Quick reaction and adaptation',
          'Ability to inspire the team',
          'Effectiveness in crisis situations',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск выгорания при постоянной активности',
          'Нетерпение с медлительными людьми',
          'Склонность упускать детали',
        ],
        'en': [
          'Risk of burnout with constant activity',
          'Impatience with slow people',
          'Tendency to miss details',
        ],
      },
      recommendations: {
        'ru': [
          'Планируйте периоды восстановления',
          'Работайте с людьми, которые дополняют вас вниманием к деталям',
          'Используйте вашу энергию для важных проектов',
        ],
        'en': [
          'Plan recovery periods',
          'Work with people who complement you with attention to detail',
          'Use your energy for important projects',
        ],
      },
      tryToday: {
        'ru': 'Направьте вашу энергию на одну важную задачу вместо распыления.',
        'en': 'Direct your energy to one important task instead of scattering.',
      },
      inspiringConclusion: {
        'ru': 'Ваша энергия и скорость — мощная комбинация для достижения целей!',
        'en': 'Your energy and speed are a powerful combination for achieving goals!',
      },
    ),

    'profile_unflappable': TestProfile(
      id: 'profile_unflappable',
      name: {
        'ru': 'Невозмутимый',
        'en': 'Unflappable',
      },
      description: {
        'ru': 'Вы — скала спокойствия и самообладания. Вас сложно вывести из равновесия, и вы сохраняете контроль в любых ситуациях.',
        'en': 'You are a rock of calm and composure. It\'s hard to throw you off balance, and you maintain control in any situation.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокую эмоциональную устойчивость в сочетании с сильным самоконтролем.',
        'en': 'Your answers showed high emotional stability combined with strong self-control.',
      },
      strengths: {
        'ru': [
          'Спокойствие под давлением',
          'Надёжность в кризисах',
          'Рациональное принятие решений',
          'Способность успокаивать других',
        ],
        'en': [
          'Calm under pressure',
          'Reliability in crises',
          'Rational decision-making',
          'Ability to calm others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск казаться отстранённым',
          'Трудности с выражением эмоций',
          'Может недооценивать эмоции других',
        ],
        'en': [
          'Risk of appearing detached',
          'Difficulty expressing emotions',
          'May underestimate others\' emotions',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте эмпатию и эмоциональное выражение',
          'Показывайте людям, что вы понимаете их чувства',
          'Используйте ваше спокойствие для лидерства в кризисах',
        ],
        'en': [
          'Practice empathy and emotional expression',
          'Show people you understand their feelings',
          'Use your calm for leadership in crises',
        ],
      },
      tryToday: {
        'ru': 'Поделитесь своими чувствами с кем-то близким.',
        'en': 'Share your feelings with someone close.',
      },
      inspiringConclusion: {
        'ru': 'Ваше спокойствие — якорь для окружающих в бурном море жизни!',
        'en': 'Your calm is an anchor for others in the stormy sea of life!',
      },
    ),

    'profile_life_of_party': TestProfile(
      id: 'profile_life_of_party',
      name: {
        'ru': 'Душа компании',
        'en': 'Life of the Party',
      },
      description: {
        'ru': 'Вы — социальная звезда с неиссякаемой энергией. Вы притягиваете людей и создаёте атмосферу везде, где появляетесь.',
        'en': 'You are a social star with boundless energy. You attract people and create atmosphere everywhere you go.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокую социальную открытость в сочетании с энергичностью — классический экстраверт!',
        'en': 'Your answers showed high social openness combined with energy — a classic extrovert!',
      },
      strengths: {
        'ru': [
          'Харизма и обаяние',
          'Способность объединять людей',
          'Лёгкость в общении',
          'Создание позитивной атмосферы',
        ],
        'en': [
          'Charisma and charm',
          'Ability to unite people',
          'Ease in communication',
          'Creating positive atmosphere',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Зависимость от социального одобрения',
          'Трудности с одиночеством',
          'Риск поверхностных отношений',
        ],
        'en': [
          'Dependence on social approval',
          'Difficulty with solitude',
          'Risk of superficial relationships',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте глубокие отношения, а не только широкие',
          'Практикуйте комфортное одиночество',
          'Используйте социальные навыки для значимых целей',
        ],
        'en': [
          'Develop deep relationships, not just broad ones',
          'Practice comfortable solitude',
          'Use social skills for meaningful goals',
        ],
      },
      tryToday: {
        'ru': 'Проведите качественное время с одним близким человеком без телефона.',
        'en': 'Spend quality time with one close person without phones.',
      },
      inspiringConclusion: {
        'ru': 'Ваша способность соединять людей делает мир теплее и человечнее!',
        'en': 'Your ability to connect people makes the world warmer and more human!',
      },
    ),

    'profile_chameleon': TestProfile(
      id: 'profile_chameleon',
      name: {
        'ru': 'Хамелеон',
        'en': 'Chameleon',
      },
      description: {
        'ru': 'Вы мастер адаптации с высокой скоростью перестройки. Вы легко вписываетесь в любую среду и быстро меняете подход по ситуации.',
        'en': 'You are a master of adaptation with high speed of adjustment. You easily fit into any environment and quickly change approach based on the situation.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокую гибкость в сочетании с быстрым темпом — редкое сочетание адаптивности.',
        'en': 'Your answers showed high flexibility combined with fast tempo — a rare combination of adaptability.',
      },
      strengths: {
        'ru': [
          'Быстрая адаптация к переменам',
          'Универсальность в разных ролях',
          'Способность находить общий язык со всеми',
          'Эффективность в изменчивой среде',
        ],
        'en': [
          'Quick adaptation to changes',
          'Versatility in different roles',
          'Ability to find common ground with everyone',
          'Effectiveness in changing environments',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск потери собственной идентичности',
          'Трудности с долгосрочными обязательствами',
          'Может казаться непоследовательным',
        ],
        'en': [
          'Risk of losing own identity',
          'Difficulty with long-term commitments',
          'May seem inconsistent',
        ],
      },
      recommendations: {
        'ru': [
          'Определите свои базовые ценности и не меняйте их',
          'Выбирайте окружение, которое вам подходит',
          'Используйте адаптивность осознанно',
        ],
        'en': [
          'Define your core values and don\'t change them',
          'Choose environments that suit you',
          'Use adaptability consciously',
        ],
      },
      tryToday: {
        'ru': 'Запишите 3 вещи, которые остаются неизменными в вас независимо от обстоятельств.',
        'en': 'Write down 3 things that remain unchanged in you regardless of circumstances.',
      },
      inspiringConclusion: {
        'ru': 'Ваша адаптивность — суперсила в мире постоянных перемен!',
        'en': 'Your adaptability is a superpower in a world of constant change!',
      },
    ),

    'profile_strategist': TestProfile(
      id: 'profile_strategist',
      name: {
        'ru': 'Стратег',
        'en': 'Strategist',
      },
      description: {
        'ru': 'Вы сочетаете самоконтроль с гибкостью мышления. Вы планируете, но умеете адаптировать планы по ситуации.',
        'en': 'You combine self-control with flexible thinking. You plan but can adapt plans based on the situation.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокий самоконтроль в сочетании с адаптивностью — идеальное сочетание для стратегического мышления.',
        'en': 'Your answers showed high self-control combined with adaptability — an ideal combination for strategic thinking.',
      },
      strengths: {
        'ru': [
          'Стратегическое видение с гибкостью',
          'Способность корректировать курс без паники',
          'Баланс планирования и импровизации',
          'Эффективность в долгосрочных проектах',
        ],
        'en': [
          'Strategic vision with flexibility',
          'Ability to adjust course without panic',
          'Balance of planning and improvisation',
          'Effectiveness in long-term projects',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может слишком долго анализировать',
          'Риск застрять между планированием и действием',
        ],
        'en': [
          'May analyze for too long',
          'Risk of getting stuck between planning and action',
        ],
      },
      recommendations: {
        'ru': [
          'Установите дедлайны для принятия решений',
          'Доверяйте своей способности адаптироваться',
          'Используйте стратегическое мышление для больших целей',
        ],
        'en': [
          'Set deadlines for decision-making',
          'Trust your ability to adapt',
          'Use strategic thinking for big goals',
        ],
      },
      tryToday: {
        'ru': 'Примите одно решение быстрее, чем обычно, и посмотрите, что получится.',
        'en': 'Make one decision faster than usual and see what happens.',
      },
      inspiringConclusion: {
        'ru': 'Ваше сочетание контроля и гибкости делает вас эффективным в любых условиях!',
        'en': 'Your combination of control and flexibility makes you effective in any conditions!',
      },
    ),

    'profile_harmonizer': TestProfile(
      id: 'profile_harmonizer',
      name: {
        'ru': 'Гармонизатор',
        'en': 'Harmonizer',
      },
      description: {
        'ru': 'Вы эмоционально устойчивы и социально открыты. Вы создаёте гармонию в коллективе и помогаете людям находить общий язык.',
        'en': 'You are emotionally stable and socially open. You create harmony in teams and help people find common ground.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокую эмоциональную устойчивость в сочетании с социальной открытостью — идеально для медиации.',
        'en': 'Your answers showed high emotional stability combined with social openness — ideal for mediation.',
      },
      strengths: {
        'ru': [
          'Создание позитивной атмосферы в команде',
          'Способность разрешать конфликты',
          'Баланс рациональности и общительности',
          'Доверие и уважение окружающих',
        ],
        'en': [
          'Creating positive team atmosphere',
          'Ability to resolve conflicts',
          'Balance of rationality and sociability',
          'Trust and respect from others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск избегать необходимых конфликтов',
          'Может ставить гармонию выше правды',
        ],
        'en': [
          'Risk of avoiding necessary conflicts',
          'May put harmony above truth',
        ],
      },
      recommendations: {
        'ru': [
          'Не бойтесь конструктивных конфликтов',
          'Помните, что иногда дискомфорт ведёт к росту',
          'Используйте ваши навыки для командного лидерства',
        ],
        'en': [
          'Don\'t fear constructive conflicts',
          'Remember that sometimes discomfort leads to growth',
          'Use your skills for team leadership',
        ],
      },
      tryToday: {
        'ru': 'Выскажите своё честное мнение там, где обычно промолчали бы.',
        'en': 'Voice your honest opinion where you\'d usually stay silent.',
      },
      inspiringConclusion: {
        'ru': 'Ваша способность создавать гармонию делает вас ценным членом любой команды!',
        'en': 'Your ability to create harmony makes you a valuable member of any team!',
      },
    ),

    // ===== ДОМИНИРУЮЩИЕ ПРОФИЛИ =====
    'profile_energizer': TestProfile(
      id: 'profile_energizer',
      name: {
        'ru': 'Энерджайзер',
        'en': 'Energizer',
      },
      description: {
        'ru': 'Вы — источник энергии и активности. Вы заряжаете других своим энтузиазмом и всегда готовы к действию.',
        'en': 'You are a source of energy and activity. You energize others with your enthusiasm and are always ready for action.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали исключительно высокий уровень энергичности и активности.',
        'en': 'Your answers showed exceptionally high levels of energy and activity.',
      },
      strengths: {
        'ru': ['Высокая энергия', 'Энтузиазм', 'Активная позиция', 'Мотивация'],
        'en': ['High energy', 'Enthusiasm', 'Active stance', 'Motivation'],
      },
      vulnerabilities: {
        'ru': ['Риск истощения', 'Нетерпение'],
        'en': ['Risk of exhaustion', 'Impatience'],
      },
      recommendations: {
        'ru': ['Планируйте отдых', 'Направляйте энергию на приоритеты'],
        'en': ['Plan rest', 'Direct energy to priorities'],
      },
      tryToday: {
        'ru': 'Сделайте что-то активное, что давно откладывали.',
        'en': 'Do something active you\'ve been putting off.',
      },
      inspiringConclusion: {
        'ru': 'Ваша энергия — дар, который меняет мир вокруг вас!',
        'en': 'Your energy is a gift that changes the world around you!',
      },
    ),

    'profile_rock': TestProfile(
      id: 'profile_rock',
      name: {
        'ru': 'Скала',
        'en': 'Rock',
      },
      description: {
        'ru': 'Вы — эмоциональная опора для окружающих. Ваша стабильность и спокойствие — редкий дар.',
        'en': 'You are an emotional support for those around you. Your stability and calm are a rare gift.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали исключительно высокую эмоциональную устойчивость.',
        'en': 'Your answers showed exceptionally high emotional stability.',
      },
      strengths: {
        'ru': ['Спокойствие', 'Надёжность', 'Стрессоустойчивость', 'Рациональность'],
        'en': ['Calm', 'Reliability', 'Stress resistance', 'Rationality'],
      },
      vulnerabilities: {
        'ru': ['Может казаться холодным', 'Недооценка эмоций'],
        'en': ['May seem cold', 'Underestimating emotions'],
      },
      recommendations: {
        'ru': ['Показывайте эмпатию', 'Делитесь своими чувствами'],
        'en': ['Show empathy', 'Share your feelings'],
      },
      tryToday: {
        'ru': 'Поддержите кого-то, кто переживает трудности.',
        'en': 'Support someone going through difficulties.',
      },
      inspiringConclusion: {
        'ru': 'Ваша стабильность — якорь в бурном море жизни!',
        'en': 'Your stability is an anchor in the stormy sea of life!',
      },
    ),

    'profile_master_of_control': TestProfile(
      id: 'profile_master_of_control',
      name: {
        'ru': 'Мастер самоконтроля',
        'en': 'Master of Control',
      },
      description: {
        'ru': 'Вы обладаете исключительной способностью контролировать свои импульсы и действия.',
        'en': 'You have exceptional ability to control your impulses and actions.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали очень высокий уровень самоконтроля и дисциплины.',
        'en': 'Your answers showed very high levels of self-control and discipline.',
      },
      strengths: {
        'ru': ['Дисциплина', 'Надёжность', 'Последовательность', 'Терпение'],
        'en': ['Discipline', 'Reliability', 'Consistency', 'Patience'],
      },
      vulnerabilities: {
        'ru': ['Может быть слишком жёстким', 'Трудности со спонтанностью'],
        'en': ['May be too rigid', 'Difficulty with spontaneity'],
      },
      recommendations: {
        'ru': ['Позвольте себе спонтанность', 'Найдите баланс контроля и свободы'],
        'en': ['Allow yourself spontaneity', 'Find balance of control and freedom'],
      },
      tryToday: {
        'ru': 'Сделайте что-то спонтанное без планирования.',
        'en': 'Do something spontaneous without planning.',
      },
      inspiringConclusion: {
        'ru': 'Ваш самоконтроль — основа для великих достижений!',
        'en': 'Your self-control is the foundation for great achievements!',
      },
    ),

    'profile_connector': TestProfile(
      id: 'profile_connector',
      name: {
        'ru': 'Коннектор',
        'en': 'Connector',
      },
      description: {
        'ru': 'Вы прирождённый социальный коннектор, легко устанавливающий связи с людьми.',
        'en': 'You are a natural social connector, easily establishing connections with people.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали исключительно высокую социальную открытость.',
        'en': 'Your answers showed exceptionally high social openness.',
      },
      strengths: {
        'ru': ['Общительность', 'Харизма', 'Нетворкинг', 'Эмпатия'],
        'en': ['Sociability', 'Charisma', 'Networking', 'Empathy'],
      },
      vulnerabilities: {
        'ru': ['Зависимость от людей', 'Поверхностность связей'],
        'en': ['Dependence on people', 'Superficiality of connections'],
      },
      recommendations: {
        'ru': ['Углубляйте отношения', 'Развивайте комфорт в одиночестве'],
        'en': ['Deepen relationships', 'Develop comfort in solitude'],
      },
      tryToday: {
        'ru': 'Проведите глубокий разговор с кем-то важным.',
        'en': 'Have a deep conversation with someone important.',
      },
      inspiringConclusion: {
        'ru': 'Ваша способность соединять людей создаёт сообщества!',
        'en': 'Your ability to connect people creates communities!',
      },
    ),

    'profile_speedster': TestProfile(
      id: 'profile_speedster',
      name: {
        'ru': 'Спринтер',
        'en': 'Speedster',
      },
      description: {
        'ru': 'Вы работаете и думаете в высоком темпе, быстро переключаясь между задачами.',
        'en': 'You work and think at high speed, quickly switching between tasks.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали очень высокий темп и ритм деятельности.',
        'en': 'Your answers showed very high tempo and rhythm of activity.',
      },
      strengths: {
        'ru': ['Скорость', 'Многозадачность', 'Реактивность', 'Продуктивность'],
        'en': ['Speed', 'Multitasking', 'Reactivity', 'Productivity'],
      },
      vulnerabilities: {
        'ru': ['Упущение деталей', 'Поверхностность', 'Нетерпение'],
        'en': ['Missing details', 'Superficiality', 'Impatience'],
      },
      recommendations: {
        'ru': ['Замедляйтесь для важных задач', 'Проверяйте детали'],
        'en': ['Slow down for important tasks', 'Check details'],
      },
      tryToday: {
        'ru': 'Выполните одну задачу медленно и внимательно.',
        'en': 'Complete one task slowly and carefully.',
      },
      inspiringConclusion: {
        'ru': 'Ваша скорость — преимущество в быстро меняющемся мире!',
        'en': 'Your speed is an advantage in a fast-changing world!',
      },
    ),

    'profile_adaptor': TestProfile(
      id: 'profile_adaptor',
      name: {
        'ru': 'Адаптор',
        'en': 'Adaptor',
      },
      description: {
        'ru': 'Вы легко адаптируетесь к любым переменам и новым обстоятельствам.',
        'en': 'You easily adapt to any changes and new circumstances.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали исключительно высокую гибкость и адаптивность.',
        'en': 'Your answers showed exceptionally high flexibility and adaptability.',
      },
      strengths: {
        'ru': ['Гибкость', 'Открытость новому', 'Универсальность', 'Резильентность'],
        'en': ['Flexibility', 'Openness to new', 'Versatility', 'Resilience'],
      },
      vulnerabilities: {
        'ru': ['Непостоянство', 'Трудности с обязательствами'],
        'en': ['Inconsistency', 'Difficulty with commitments'],
      },
      recommendations: {
        'ru': ['Определите постоянные ценности', 'Завершайте начатое'],
        'en': ['Define constant values', 'Finish what you start'],
      },
      tryToday: {
        'ru': 'Запишите три вещи, которые никогда не изменятся в вас.',
        'en': 'Write down three things that will never change about you.',
      },
      inspiringConclusion: {
        'ru': 'Ваша адаптивность — ключ к выживанию и процветанию в любых условиях!',
        'en': 'Your adaptability is the key to survival and thriving in any conditions!',
      },
    ),

    // ===== ПРОФИЛИ ПО СЛАБЫМ ЧЕРТАМ =====
    'profile_contemplative': TestProfile(
      id: 'profile_contemplative',
      name: {
        'ru': 'Созерцатель',
        'en': 'Contemplative',
      },
      description: {
        'ru': 'Вы предпочитаете спокойный темп жизни и глубокое размышление активной деятельности.',
        'en': 'You prefer a calm pace of life and deep reflection over active endeavors.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали сниженную энергичность при хороших показателях в других областях.',
        'en': 'Your answers showed reduced energy while having good scores in other areas.',
      },
      strengths: {
        'ru': ['Глубина мышления', 'Внимание к деталям', 'Терпение', 'Осознанность'],
        'en': ['Depth of thinking', 'Attention to detail', 'Patience', 'Mindfulness'],
      },
      vulnerabilities: {
        'ru': ['Медлительность', 'Откладывание действий'],
        'en': ['Slowness', 'Procrastination'],
      },
      recommendations: {
        'ru': ['Находите мотивирующие задачи', 'Добавляйте физическую активность'],
        'en': ['Find motivating tasks', 'Add physical activity'],
      },
      tryToday: {
        'ru': 'Сделайте одно активное действие, не откладывая.',
        'en': 'Take one active step without delay.',
      },
      inspiringConclusion: {
        'ru': 'Ваша глубина восприятия открывает истины, скрытые от спешащих!',
        'en': 'Your depth of perception reveals truths hidden from those who rush!',
      },
    ),

    'profile_sensitive': TestProfile(
      id: 'profile_sensitive',
      name: {
        'ru': 'Чувствительный',
        'en': 'Sensitive',
      },
      description: {
        'ru': 'Вы глубоко чувствуете эмоции и внимательны к тонким нюансам.',
        'en': 'You feel emotions deeply and are attentive to subtle nuances.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали сниженную эмоциональную устойчивость при хороших других показателях.',
        'en': 'Your answers showed reduced emotional stability while having good scores elsewhere.',
      },
      strengths: {
        'ru': ['Эмпатия', 'Творчество', 'Глубина чувств', 'Интуиция'],
        'en': ['Empathy', 'Creativity', 'Depth of feelings', 'Intuition'],
      },
      vulnerabilities: {
        'ru': ['Эмоциональная уязвимость', 'Стресс'],
        'en': ['Emotional vulnerability', 'Stress'],
      },
      recommendations: {
        'ru': ['Развивайте техники саморегуляции', 'Окружайте себя поддержкой'],
        'en': ['Develop self-regulation techniques', 'Surround yourself with support'],
      },
      tryToday: {
        'ru': 'Практикуйте 5 минут глубокого дыхания.',
        'en': 'Practice 5 minutes of deep breathing.',
      },
      inspiringConclusion: {
        'ru': 'Ваша чувствительность — дар творчества и глубокой связи с миром!',
        'en': 'Your sensitivity is a gift of creativity and deep connection with the world!',
      },
    ),

    'profile_spontaneous': TestProfile(
      id: 'profile_spontaneous',
      name: {
        'ru': 'Спонтанный',
        'en': 'Spontaneous',
      },
      description: {
        'ru': 'Вы живёте моментом и действуете по вдохновению, не сдерживая импульсы.',
        'en': 'You live in the moment and act on inspiration without restraining impulses.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали низкий самоконтроль при хороших других показателях.',
        'en': 'Your answers showed low self-control while having good scores elsewhere.',
      },
      strengths: {
        'ru': ['Креативность', 'Свобода', 'Живость', 'Авантюризм'],
        'en': ['Creativity', 'Freedom', 'Liveliness', 'Adventurousness'],
      },
      vulnerabilities: {
        'ru': ['Импульсивность', 'Непоследовательность'],
        'en': ['Impulsivity', 'Inconsistency'],
      },
      recommendations: {
        'ru': ['Практикуйте паузу перед решениями', 'Развивайте терпение'],
        'en': ['Practice pausing before decisions', 'Develop patience'],
      },
      tryToday: {
        'ru': 'Перед следующим решением сделайте 3 глубоких вдоха.',
        'en': 'Before your next decision, take 3 deep breaths.',
      },
      inspiringConclusion: {
        'ru': 'Ваша спонтанность приносит радость и неожиданность в жизнь!',
        'en': 'Your spontaneity brings joy and surprise to life!',
      },
    ),

    'profile_deep_thinker': TestProfile(
      id: 'profile_deep_thinker',
      name: {
        'ru': 'Глубокий мыслитель',
        'en': 'Deep Thinker',
      },
      description: {
        'ru': 'Вы предпочитаете глубокое размышление социальному взаимодействию.',
        'en': 'You prefer deep reflection over social interaction.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали низкую социальную открытость при хороших других показателях.',
        'en': 'Your answers showed low social openness while having good scores elsewhere.',
      },
      strengths: {
        'ru': ['Глубина мысли', 'Самодостаточность', 'Концентрация', 'Независимость'],
        'en': ['Depth of thought', 'Self-sufficiency', 'Concentration', 'Independence'],
      },
      vulnerabilities: {
        'ru': ['Изоляция', 'Трудности с нетворкингом'],
        'en': ['Isolation', 'Difficulty with networking'],
      },
      recommendations: {
        'ru': ['Поддерживайте ключевые связи', 'Находите единомышленников'],
        'en': ['Maintain key connections', 'Find like-minded people'],
      },
      tryToday: {
        'ru': 'Напишите или позвоните одному важному для вас человеку.',
        'en': 'Write or call one person who is important to you.',
      },
      inspiringConclusion: {
        'ru': 'Ваша глубина мышления порождает идеи, меняющие мир!',
        'en': 'Your depth of thinking generates ideas that change the world!',
      },
    ),

    'profile_methodical': TestProfile(
      id: 'profile_methodical',
      name: {
        'ru': 'Методичный',
        'en': 'Methodical',
      },
      description: {
        'ru': 'Вы предпочитаете работать в спокойном, размеренном темпе с фокусом на качество.',
        'en': 'You prefer to work at a calm, measured pace with focus on quality.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали низкий темп при хороших других показателях.',
        'en': 'Your answers showed low tempo while having good scores elsewhere.',
      },
      strengths: {
        'ru': ['Качество', 'Внимание к деталям', 'Основательность', 'Надёжность'],
        'en': ['Quality', 'Attention to detail', 'Thoroughness', 'Reliability'],
      },
      vulnerabilities: {
        'ru': ['Медлительность', 'Упущение сроков'],
        'en': ['Slowness', 'Missing deadlines'],
      },
      recommendations: {
        'ru': ['Устанавливайте дедлайны', 'Учитесь приоритизировать'],
        'en': ['Set deadlines', 'Learn to prioritize'],
      },
      tryToday: {
        'ru': 'Установите таймер и завершите одну задачу быстрее обычного.',
        'en': 'Set a timer and complete one task faster than usual.',
      },
      inspiringConclusion: {
        'ru': 'Ваша основательность создаёт работу, которая выдерживает проверку временем!',
        'en': 'Your thoroughness creates work that stands the test of time!',
      },
    ),

    'profile_steadfast': TestProfile(
      id: 'profile_steadfast',
      name: {
        'ru': 'Стойкий',
        'en': 'Steadfast',
      },
      description: {
        'ru': 'Вы придерживаетесь своих принципов и подходов, редко меняя курс.',
        'en': 'You stick to your principles and approaches, rarely changing course.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали низкую гибкость при хороших других показателях.',
        'en': 'Your answers showed low flexibility while having good scores elsewhere.',
      },
      strengths: {
        'ru': ['Постоянство', 'Надёжность', 'Принципиальность', 'Стабильность'],
        'en': ['Constancy', 'Reliability', 'Principle', 'Stability'],
      },
      vulnerabilities: {
        'ru': ['Ригидность', 'Сопротивление переменам'],
        'en': ['Rigidity', 'Resistance to change'],
      },
      recommendations: {
        'ru': ['Практикуйте маленькие эксперименты', 'Рассматривайте перемены как возможности'],
        'en': ['Practice small experiments', 'View changes as opportunities'],
      },
      tryToday: {
        'ru': 'Сделайте что-то по-другому, чем обычно.',
        'en': 'Do something differently than usual.',
      },
      inspiringConclusion: {
        'ru': 'Ваша стойкость — фундамент, на котором можно строить великое!',
        'en': 'Your steadfastness is the foundation on which greatness can be built!',
      },
    ),

    // ===== ОБЩИЕ ПРОФИЛИ =====
    'profile_optimized': TestProfile(
      id: 'profile_optimized',
      name: {
        'ru': 'Оптимизированный',
        'en': 'Optimized',
      },
      description: {
        'ru': 'Вы показываете высокие результаты по всем аспектам темперамента — редкое достижение!',
        'en': 'You show high results across all temperament aspects — a rare achievement!',
      },
      whyThisProfile: {
        'ru': 'Ваш средний показатель по всем факторам превышает 70% — это исключительный результат.',
        'en': 'Your average score across all factors exceeds 70% — this is an exceptional result.',
      },
      strengths: {
        'ru': ['Баланс всех качеств', 'Высокая эффективность', 'Адаптивность', 'Резильентность'],
        'en': ['Balance of all qualities', 'High efficiency', 'Adaptability', 'Resilience'],
      },
      vulnerabilities: {
        'ru': ['Риск самоуспокоенности', 'Высокие ожидания от себя'],
        'en': ['Risk of complacency', 'High expectations of self'],
      },
      recommendations: {
        'ru': ['Продолжайте развиваться', 'Помогайте другим расти', 'Ставьте новые вызовы'],
        'en': ['Continue developing', 'Help others grow', 'Set new challenges'],
      },
      tryToday: {
        'ru': 'Поделитесь своим опытом с тем, кто в этом нуждается.',
        'en': 'Share your experience with someone who needs it.',
      },
      inspiringConclusion: {
        'ru': 'Ваш сбалансированный темперамент — основа для достижения любых целей!',
        'en': 'Your balanced temperament is the foundation for achieving any goals!',
      },
    ),

    'profile_balanced': TestProfile(
      id: 'profile_balanced',
      name: {
        'ru': 'Сбалансированный',
        'en': 'Balanced',
      },
      description: {
        'ru': 'Вы имеете сбалансированный темперамент с умеренными показателями по всем факторам.',
        'en': 'You have a balanced temperament with moderate scores across all factors.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали умеренные, сбалансированные результаты по всем аспектам темперамента.',
        'en': 'Your answers showed moderate, balanced results across all temperament aspects.',
      },
      strengths: {
        'ru': ['Универсальность', 'Адаптивность', 'Отсутствие крайностей', 'Гармония'],
        'en': ['Versatility', 'Adaptability', 'Absence of extremes', 'Harmony'],
      },
      vulnerabilities: {
        'ru': ['Неопределённость сильных сторон', 'Риск посредственности'],
        'en': ['Unclear strengths', 'Risk of mediocrity'],
      },
      recommendations: {
        'ru': ['Определите, какие качества развивать', 'Найдите свою уникальность'],
        'en': ['Determine which qualities to develop', 'Find your uniqueness'],
      },
      tryToday: {
        'ru': 'Выберите одно качество для целенаправленного развития.',
        'en': 'Choose one quality for targeted development.',
      },
      inspiringConclusion: {
        'ru': 'Ваш баланс — это точка, из которой можно развиваться в любом направлении!',
        'en': 'Your balance is a point from which you can develop in any direction!',
      },
    ),

    'profile_developing': TestProfile(
      id: 'profile_developing',
      name: {
        'ru': 'Развивающийся',
        'en': 'Developing',
      },
      description: {
        'ru': 'Вы находитесь на пути развития своего темперамента — перед вами большой потенциал роста.',
        'en': 'You are on the path of developing your temperament — you have great potential for growth.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали результаты ниже среднего, что указывает на области для развития.',
        'en': 'Your answers showed below-average results, indicating areas for development.',
      },
      strengths: {
        'ru': ['Потенциал роста', 'Осознанность', 'Возможность трансформации'],
        'en': ['Growth potential', 'Awareness', 'Possibility of transformation'],
      },
      vulnerabilities: {
        'ru': ['Неуверенность', 'Недоразвитость некоторых качеств'],
        'en': ['Uncertainty', 'Underdevelopment of some qualities'],
      },
      recommendations: {
        'ru': ['Выберите приоритетные области', 'Ищите поддержку и менторство', 'Начните с маленьких шагов'],
        'en': ['Choose priority areas', 'Seek support and mentorship', 'Start with small steps'],
      },
      tryToday: {
        'ru': 'Сделайте один маленький шаг к развитию выбранного качества.',
        'en': 'Take one small step toward developing a chosen quality.',
      },
      inspiringConclusion: {
        'ru': 'Каждый шаг на пути развития приближает вас к лучшей версии себя!',
        'en': 'Every step on the path of development brings you closer to a better version of yourself!',
      },
    ),

    'profile_introspective': TestProfile(
      id: 'profile_introspective',
      name: {
        'ru': 'Интроспективный',
        'en': 'Introspective',
      },
      description: {
        'ru': 'Вы склонны к глубокому самоанализу и предпочитаете внутренний мир внешней активности.',
        'en': 'You tend toward deep self-analysis and prefer inner world to external activity.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали низкие результаты по внешне-ориентированным факторам.',
        'en': 'Your answers showed low results on externally-oriented factors.',
      },
      strengths: {
        'ru': ['Глубина самопознания', 'Рефлексия', 'Внутреннее богатство'],
        'en': ['Depth of self-knowledge', 'Reflection', 'Inner richness'],
      },
      vulnerabilities: {
        'ru': ['Отстранённость от внешнего мира', 'Пассивность'],
        'en': ['Detachment from external world', 'Passivity'],
      },
      recommendations: {
        'ru': ['Найдите способы выражения внутреннего мира', 'Добавляйте небольшую активность'],
        'en': ['Find ways to express your inner world', 'Add small activities'],
      },
      tryToday: {
        'ru': 'Выйдите на короткую прогулку и обратите внимание на внешний мир.',
        'en': 'Take a short walk and pay attention to the external world.',
      },
      inspiringConclusion: {
        'ru': 'Ваш богатый внутренний мир — источник мудрости и творчества!',
        'en': 'Your rich inner world is a source of wisdom and creativity!',
      },
    ),
  };
}
