import '../models/test_model.dart';
import '../models/test_profile_model.dart';

class StressTestData {
  static TestModel getStressTest() {
    return TestModel(
      id: 'stress_test',
      title: {
        'ru': 'Тест на уровень стресса',
        'en': 'Stress Level Test',
      },
      description: {
        'ru': 'Определите уровень вашего стресса с помощью простого теста',
        'en': 'Determine your stress level with a simple test',
      },
      category: {
        'ru': 'Стресс',
        'en': 'Stress',
      },
      categoryId: 'emotional',
      estimatedTime: 3,
      type: TestType.simple,
      questions: [
        QuestionModel(
          id: 'q1',
          text: {
            'ru': 'Как часто вы чувствуете напряжение в течение дня?',
            'en': 'How often do you feel tension during the day?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Никогда', 'en': 'Never'}, score: 0),
            AnswerModel(id: 'a2', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 1),
            AnswerModel(id: 'a3', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Часто', 'en': 'Often'}, score: 3),
            AnswerModel(id: 'a5', text: {'ru': 'Постоянно', 'en': 'Constantly'}, score: 4),
          ],
        ),
        QuestionModel(
          id: 'q2',
          text: {
            'ru': 'Насколько хорошо вы спите?',
            'en': 'How well do you sleep?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Отлично', 'en': 'Excellent'}, score: 0),
            AnswerModel(id: 'a2', text: {'ru': 'Хорошо', 'en': 'Good'}, score: 1),
            AnswerModel(id: 'a3', text: {'ru': 'Нормально', 'en': 'Normal'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Плохо', 'en': 'Bad'}, score: 3),
            AnswerModel(id: 'a5', text: {'ru': 'Очень плохо', 'en': 'Very bad'}, score: 4),
          ],
        ),
        QuestionModel(
          id: 'q3',
          text: {
            'ru': 'Как часто вы испытываете раздражительность?',
            'en': 'How often do you experience irritability?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Никогда', 'en': 'Never'}, score: 0),
            AnswerModel(id: 'a2', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 1),
            AnswerModel(id: 'a3', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Часто', 'en': 'Often'}, score: 3),
            AnswerModel(id: 'a5', text: {'ru': 'Постоянно', 'en': 'Constantly'}, score: 4),
          ],
        ),
        QuestionModel(
          id: 'q4',
          text: {
            'ru': 'Насколько легко вам сосредоточиться на задачах?',
            'en': 'How easy is it for you to focus on tasks?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Очень легко', 'en': 'Very easy'}, score: 0),
            AnswerModel(id: 'a2', text: {'ru': 'Легко', 'en': 'Easy'}, score: 1),
            AnswerModel(id: 'a3', text: {'ru': 'Нормально', 'en': 'Normal'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Сложно', 'en': 'Difficult'}, score: 3),
            AnswerModel(id: 'a5', text: {'ru': 'Очень сложно', 'en': 'Very difficult'}, score: 4),
          ],
        ),
        QuestionModel(
          id: 'q5',
          text: {
            'ru': 'Как часто вы чувствуете усталость?',
            'en': 'How often do you feel tired?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Никогда', 'en': 'Never'}, score: 0),
            AnswerModel(id: 'a2', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 1),
            AnswerModel(id: 'a3', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Часто', 'en': 'Often'}, score: 3),
            AnswerModel(id: 'a5', text: {'ru': 'Постоянно', 'en': 'Constantly'}, score: 4),
          ],
        ),
      ],
    );
  }

  /// Определение профиля на основе процентов (для простого теста используем общий процент)
  static String determineProfile(Map<String, double> percentages) {
    // Для простого теста берём среднее или первое значение
    double avgPercentage = 0;
    if (percentages.isNotEmpty) {
      avgPercentage = percentages.values.reduce((a, b) => a + b) / percentages.length;
    }

    // 5 вопросов × 4 балла макс = 20 баллов = 100%
    // Профили по уровню стресса
    if (avgPercentage <= 15) {
      return 'profile_zen_master';
    } else if (avgPercentage <= 30) {
      return 'profile_calm';
    } else if (avgPercentage <= 50) {
      return 'profile_moderate_stress';
    } else if (avgPercentage <= 70) {
      return 'profile_elevated_stress';
    } else if (avgPercentage <= 85) {
      return 'profile_high_stress';
    } else {
      return 'profile_burnout_risk';
    }
  }

  /// Получение профиля по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  static const Map<String, TestProfile> _profiles = {
    'profile_zen_master': TestProfile(
      id: 'profile_zen_master',
      name: {
        'ru': 'Мастер спокойствия',
        'en': 'Zen Master',
      },
      description: {
        'ru': 'Вы демонстрируете исключительно низкий уровень стресса. Вы умеете сохранять спокойствие и внутреннее равновесие даже в сложных ситуациях.',
        'en': 'You demonstrate exceptionally low stress levels. You know how to maintain calm and inner balance even in difficult situations.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали минимальный уровень напряжения, отличный сон, хорошую концентрацию и энергичность.',
        'en': 'Your answers showed minimal tension levels, excellent sleep, good concentration, and energy.',
      },
      strengths: {
        'ru': [
          'Эмоциональная стабильность',
          'Отличная саморегуляция',
          'Высокая резильентность',
          'Способность сохранять ясность ума',
        ],
        'en': [
          'Emotional stability',
          'Excellent self-regulation',
          'High resilience',
          'Ability to maintain mental clarity',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Может не замечать стресс у других',
          'Риск недооценки реальных угроз',
        ],
        'en': [
          'May not notice stress in others',
          'Risk of underestimating real threats',
        ],
      },
      recommendations: {
        'ru': [
          'Делитесь своими техниками с другими',
          'Продолжайте практики, которые поддерживают ваш баланс',
          'Будьте чуткими к тем, кто испытывает стресс',
        ],
        'en': [
          'Share your techniques with others',
          'Continue practices that maintain your balance',
          'Be sensitive to those experiencing stress',
        ],
      },
      tryToday: {
        'ru': 'Поблагодарите себя за заботу о своём ментальном здоровье.',
        'en': 'Thank yourself for taking care of your mental health.',
      },
      inspiringConclusion: {
        'ru': 'Ваше спокойствие — это сила. Продолжайте быть примером для окружающих!',
        'en': 'Your calm is your strength. Keep being an example for others!',
      },
    ),

    'profile_calm': TestProfile(
      id: 'profile_calm',
      name: {
        'ru': 'Спокойный',
        'en': 'Calm',
      },
      description: {
        'ru': 'У вас низкий уровень стресса. Вы хорошо справляетесь с повседневными нагрузками и умеете восстанавливаться.',
        'en': 'You have low stress levels. You handle everyday pressures well and know how to recover.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы указывают на хороший баланс между нагрузками и восстановлением.',
        'en': 'Your answers indicate a good balance between demands and recovery.',
      },
      strengths: {
        'ru': [
          'Хорошая адаптация к стрессорам',
          'Эффективное восстановление',
          'Сбалансированный образ жизни',
        ],
        'en': [
          'Good adaptation to stressors',
          'Effective recovery',
          'Balanced lifestyle',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Периодические всплески стресса возможны',
        ],
        'en': [
          'Occasional stress spikes are possible',
        ],
      },
      recommendations: {
        'ru': [
          'Поддерживайте текущие здоровые привычки',
          'Продолжайте практики релаксации',
          'Следите за балансом работы и отдыха',
        ],
        'en': [
          'Maintain current healthy habits',
          'Continue relaxation practices',
          'Watch work-life balance',
        ],
      },
      tryToday: {
        'ru': 'Уделите время любимому хобби или прогулке.',
        'en': 'Spend time on a favorite hobby or a walk.',
      },
      inspiringConclusion: {
        'ru': 'Вы на правильном пути! Продолжайте заботиться о себе.',
        'en': 'You\'re on the right track! Keep taking care of yourself.',
      },
    ),

    'profile_moderate_stress': TestProfile(
      id: 'profile_moderate_stress',
      name: {
        'ru': 'Умеренный стресс',
        'en': 'Moderate Stress',
      },
      description: {
        'ru': 'У вас умеренный уровень стресса, типичный для современного человека. Есть области для улучшения.',
        'en': 'You have moderate stress levels, typical for modern people. There are areas for improvement.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали некоторое напряжение в нескольких областях жизни.',
        'en': 'Your answers showed some tension in several life areas.',
      },
      strengths: {
        'ru': [
          'Осознание своего состояния',
          'Потенциал для улучшения',
          'Ресурсы для изменений',
        ],
        'en': [
          'Awareness of your state',
          'Potential for improvement',
          'Resources for change',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск накопления стресса',
          'Возможное влияние на сон или энергию',
          'Периодическая раздражительность',
        ],
        'en': [
          'Risk of stress accumulation',
          'Possible impact on sleep or energy',
          'Occasional irritability',
        ],
      },
      recommendations: {
        'ru': [
          'Внедрите ежедневные практики релаксации (5-10 минут)',
          'Улучшите гигиену сна',
          'Добавьте физическую активность',
          'Определите главные источники стресса',
        ],
        'en': [
          'Implement daily relaxation practices (5-10 minutes)',
          'Improve sleep hygiene',
          'Add physical activity',
          'Identify main stress sources',
        ],
      },
      tryToday: {
        'ru': 'Сделайте 5 минут глубокого дыхания перед сном.',
        'en': 'Do 5 minutes of deep breathing before bed.',
      },
      inspiringConclusion: {
        'ru': 'Небольшие изменения сегодня приведут к большим результатам завтра!',
        'en': 'Small changes today lead to big results tomorrow!',
      },
    ),

    'profile_elevated_stress': TestProfile(
      id: 'profile_elevated_stress',
      name: {
        'ru': 'Повышенный стресс',
        'en': 'Elevated Stress',
      },
      description: {
        'ru': 'У вас повышенный уровень стресса, который требует внимания. Важно принять меры для восстановления баланса.',
        'en': 'You have elevated stress levels that require attention. It\'s important to take steps to restore balance.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы указывают на частое напряжение, проблемы со сном или концентрацией.',
        'en': 'Your answers indicate frequent tension, sleep or concentration problems.',
      },
      strengths: {
        'ru': [
          'Осознание проблемы — первый шаг к решению',
          'Мотивация к изменениям',
        ],
        'en': [
          'Awareness of the problem is the first step to solution',
          'Motivation for change',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Влияние на здоровье и отношения',
          'Снижение продуктивности',
          'Риск эмоционального истощения',
          'Проблемы с концентрацией',
        ],
        'en': [
          'Impact on health and relationships',
          'Reduced productivity',
          'Risk of emotional exhaustion',
          'Concentration problems',
        ],
      },
      recommendations: {
        'ru': [
          'Приоритизируйте отдых и восстановление',
          'Ограничьте источники дополнительного стресса',
          'Обратитесь за поддержкой к близким',
          'Рассмотрите консультацию со специалистом',
          'Регулярная физическая активность обязательна',
        ],
        'en': [
          'Prioritize rest and recovery',
          'Limit sources of additional stress',
          'Seek support from loved ones',
          'Consider consulting a specialist',
          'Regular physical activity is essential',
        ],
      },
      tryToday: {
        'ru': 'Отложите одно дело, которое может подождать, и вместо этого отдохните.',
        'en': 'Postpone one task that can wait and rest instead.',
      },
      inspiringConclusion: {
        'ru': 'Вы заслуживаете заботы. Начните восстановление сегодня!',
        'en': 'You deserve care. Start recovery today!',
      },
    ),

    'profile_high_stress': TestProfile(
      id: 'profile_high_stress',
      name: {
        'ru': 'Высокий стресс',
        'en': 'High Stress',
      },
      description: {
        'ru': 'У вас высокий уровень стресса, который серьёзно влияет на качество жизни. Требуются активные меры.',
        'en': 'You have high stress levels that seriously affect quality of life. Active measures are required.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали значительные проблемы в нескольких областях: сон, энергия, концентрация, раздражительность.',
        'en': 'Your answers showed significant problems in several areas: sleep, energy, concentration, irritability.',
      },
      strengths: {
        'ru': [
          'Честность в оценке своего состояния',
          'Готовность к переменам',
        ],
        'en': [
          'Honesty in assessing your condition',
          'Readiness for change',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Серьёзное влияние на здоровье',
          'Риск хронического стресса',
          'Возможное развитие тревожности или депрессии',
          'Ухудшение отношений',
        ],
        'en': [
          'Serious impact on health',
          'Risk of chronic stress',
          'Possible development of anxiety or depression',
          'Deteriorating relationships',
        ],
      },
      recommendations: {
        'ru': [
          'Обязательно обратитесь к специалисту (психолог, врач)',
          'Пересмотрите свой образ жизни и приоритеты',
          'Делегируйте задачи где возможно',
          'Практикуйте техники управления стрессом ежедневно',
          'Не игнорируйте сигналы тела',
        ],
        'en': [
          'Be sure to consult a specialist (psychologist, doctor)',
          'Reconsider your lifestyle and priorities',
          'Delegate tasks where possible',
          'Practice stress management techniques daily',
          'Don\'t ignore body signals',
        ],
      },
      tryToday: {
        'ru': 'Позвоните близкому человеку и поговорите о том, как вы себя чувствуете.',
        'en': 'Call a loved one and talk about how you\'re feeling.',
      },
      inspiringConclusion: {
        'ru': 'Признание проблемы — храбрый шаг. Помощь доступна, и вы справитесь!',
        'en': 'Acknowledging the problem is a brave step. Help is available, and you will cope!',
      },
    ),

    'profile_burnout_risk': TestProfile(
      id: 'profile_burnout_risk',
      name: {
        'ru': 'Риск выгорания',
        'en': 'Burnout Risk',
      },
      description: {
        'ru': 'Ваш уровень стресса критически высок. Вы находитесь в зоне риска выгорания и требуете немедленного внимания к своему состоянию.',
        'en': 'Your stress level is critically high. You are in the burnout risk zone and require immediate attention to your condition.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы указывают на критические показатели по всем параметрам: постоянное напряжение, серьёзные проблемы со сном, истощение.',
        'en': 'Your answers indicate critical indicators on all parameters: constant tension, serious sleep problems, exhaustion.',
      },
      strengths: {
        'ru': [
          'Вы прошли этот тест — это шаг к осознанию',
          'Изменения возможны с правильной поддержкой',
        ],
        'en': [
          'You took this test — it\'s a step toward awareness',
          'Change is possible with proper support',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Критическое состояние здоровья',
          'Риск полного эмоционального и физического истощения',
          'Возможные соматические заболевания',
          'Серьёзное влияние на все сферы жизни',
        ],
        'en': [
          'Critical health condition',
          'Risk of complete emotional and physical exhaustion',
          'Possible somatic illnesses',
          'Serious impact on all life areas',
        ],
      },
      recommendations: {
        'ru': [
          'НЕМЕДЛЕННО обратитесь к врачу или психологу',
          'Возьмите отпуск или больничный',
          'Полностью пересмотрите нагрузки',
          'Попросите помощи у близких',
          'Не оставайтесь с этим один на один',
        ],
        'en': [
          'IMMEDIATELY consult a doctor or psychologist',
          'Take a vacation or sick leave',
          'Completely reconsider your workload',
          'Ask loved ones for help',
          'Don\'t face this alone',
        ],
      },
      tryToday: {
        'ru': 'Запишитесь на приём к специалисту. Это важнее всего.',
        'en': 'Schedule an appointment with a specialist. This is the most important thing.',
      },
      inspiringConclusion: {
        'ru': 'Вы не одиноки, и помощь существует. Первый шаг — самый важный, и вы его уже сделали, осознав проблему.',
        'en': 'You are not alone, and help exists. The first step is the most important, and you\'ve already taken it by recognizing the problem.',
      },
    ),
  };
}
