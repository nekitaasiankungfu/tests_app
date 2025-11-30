import '../models/test_model.dart';
import '../models/test_profile_model.dart';

class SelfEsteemTestData {
  static TestModel getSelfEsteemTest() {
    return TestModel(
      id: 'self_esteem_test',
      title: {
        'ru': 'Тест на самооценку',
        'en': 'Self-Esteem Test',
      },
      description: {
        'ru': 'Оцените уровень вашей самооценки',
        'en': 'Assess your level of self-esteem',
      },
      category: {
        'ru': 'Личность',
        'en': 'Personality',
      },
      categoryId: 'emotional',
      estimatedTime: 4,
      type: TestType.simple,
      questions: [
        QuestionModel(
          id: 'q1',
          text: {
            'ru': 'Как вы оцениваете свои способности?',
            'en': 'How do you rate your abilities?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Очень высоко', 'en': 'Very high'}, score: 4),
            AnswerModel(id: 'a2', text: {'ru': 'Высоко', 'en': 'High'}, score: 3),
            AnswerModel(id: 'a3', text: {'ru': 'Средне', 'en': 'Average'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Низко', 'en': 'Low'}, score: 1),
            AnswerModel(id: 'a5', text: {'ru': 'Очень низко', 'en': 'Very low'}, score: 0),
          ],
        ),
        QuestionModel(
          id: 'q2',
          text: {
            'ru': 'Насколько вы уверены в себе в социальных ситуациях?',
            'en': 'How confident are you in social situations?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Очень уверен', 'en': 'Very confident'}, score: 4),
            AnswerModel(id: 'a2', text: {'ru': 'Уверен', 'en': 'Confident'}, score: 3),
            AnswerModel(id: 'a3', text: {'ru': 'Средне', 'en': 'Average'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Неуверен', 'en': 'Not confident'}, score: 1),
            AnswerModel(id: 'a5', text: {'ru': 'Очень неуверен', 'en': 'Very unconfident'}, score: 0),
          ],
        ),
        QuestionModel(
          id: 'q3',
          text: {
            'ru': 'Как часто вы критикуете себя?',
            'en': 'How often do you criticize yourself?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Никогда', 'en': 'Never'}, score: 4),
            AnswerModel(id: 'a2', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 3),
            AnswerModel(id: 'a3', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Часто', 'en': 'Often'}, score: 1),
            AnswerModel(id: 'a5', text: {'ru': 'Постоянно', 'en': 'Constantly'}, score: 0),
          ],
        ),
        QuestionModel(
          id: 'q4',
          text: {
            'ru': 'Насколько вы довольны своей внешностью?',
            'en': 'How satisfied are you with your appearance?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Полностью доволен', 'en': 'Completely satisfied'}, score: 4),
            AnswerModel(id: 'a2', text: {'ru': 'В основном доволен', 'en': 'Mostly satisfied'}, score: 3),
            AnswerModel(id: 'a3', text: {'ru': 'Нейтрально', 'en': 'Neutral'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'В основном недоволен', 'en': 'Mostly dissatisfied'}, score: 1),
            AnswerModel(id: 'a5', text: {'ru': 'Полностью недоволен', 'en': 'Completely dissatisfied'}, score: 0),
          ],
        ),
        QuestionModel(
          id: 'q5',
          text: {
            'ru': 'Как часто вы сравниваете себя с другими?',
            'en': 'How often do you compare yourself to others?',
          },
          answers: [
            AnswerModel(id: 'a1', text: {'ru': 'Никогда', 'en': 'Never'}, score: 4),
            AnswerModel(id: 'a2', text: {'ru': 'Редко', 'en': 'Rarely'}, score: 3),
            AnswerModel(id: 'a3', text: {'ru': 'Иногда', 'en': 'Sometimes'}, score: 2),
            AnswerModel(id: 'a4', text: {'ru': 'Часто', 'en': 'Often'}, score: 1),
            AnswerModel(id: 'a5', text: {'ru': 'Постоянно', 'en': 'Constantly'}, score: 0),
          ],
        ),
      ],
    );
  }

  /// Определение профиля на основе процентов (высокий % = высокая самооценка)
  static String determineProfile(Map<String, double> percentages) {
    double avgPercentage = 0;
    if (percentages.isNotEmpty) {
      avgPercentage = percentages.values.reduce((a, b) => a + b) / percentages.length;
    }

    // 5 вопросов × 4 балла макс = 20 баллов = 100%
    // Профили по уровню самооценки (высокий балл = высокая самооценка)
    if (avgPercentage >= 85) {
      return 'profile_confident_leader';
    } else if (avgPercentage >= 70) {
      return 'profile_healthy_esteem';
    } else if (avgPercentage >= 50) {
      return 'profile_moderate_esteem';
    } else if (avgPercentage >= 30) {
      return 'profile_low_esteem';
    } else {
      return 'profile_very_low_esteem';
    }
  }

  /// Получение профиля по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  static const Map<String, TestProfile> _profiles = {
    'profile_confident_leader': TestProfile(
      id: 'profile_confident_leader',
      name: {
        'ru': 'Уверенный лидер',
        'en': 'Confident Leader',
      },
      description: {
        'ru': 'У вас очень высокая самооценка. Вы уверены в своих способностях, комфортно чувствуете себя в социальных ситуациях и принимаете себя таким, какой вы есть.',
        'en': 'You have very high self-esteem. You are confident in your abilities, comfortable in social situations, and accept yourself as you are.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали высокую оценку своих способностей, уверенность в себе и принятие своей внешности.',
        'en': 'Your answers showed high assessment of your abilities, self-confidence, and acceptance of your appearance.',
      },
      strengths: {
        'ru': [
          'Высокая самоуверенность',
          'Комфорт в социальных ситуациях',
          'Принятие себя',
          'Способность вести за собой',
          'Устойчивость к критике',
        ],
        'en': [
          'High self-confidence',
          'Comfort in social situations',
          'Self-acceptance',
          'Leadership ability',
          'Resilience to criticism',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск переоценки своих возможностей',
          'Возможная нечувствительность к обратной связи',
        ],
        'en': [
          'Risk of overestimating abilities',
          'Possible insensitivity to feedback',
        ],
      },
      recommendations: {
        'ru': [
          'Оставайтесь открытыми к конструктивной критике',
          'Помогайте другим развивать уверенность в себе',
          'Продолжайте практики, которые поддерживают ваше состояние',
        ],
        'en': [
          'Stay open to constructive criticism',
          'Help others develop confidence',
          'Continue practices that maintain your state',
        ],
      },
      tryToday: {
        'ru': 'Поделитесь своей уверенностью с кем-то, кто в этом нуждается.',
        'en': 'Share your confidence with someone who needs it.',
      },
      inspiringConclusion: {
        'ru': 'Ваша уверенность — это дар. Используйте её для вдохновения других!',
        'en': 'Your confidence is a gift. Use it to inspire others!',
      },
    ),

    'profile_healthy_esteem': TestProfile(
      id: 'profile_healthy_esteem',
      name: {
        'ru': 'Здоровая самооценка',
        'en': 'Healthy Self-Esteem',
      },
      description: {
        'ru': 'У вас здоровая, сбалансированная самооценка. Вы адекватно оцениваете свои достоинства и недостатки.',
        'en': 'You have healthy, balanced self-esteem. You adequately assess your strengths and weaknesses.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы указывают на хорошую самооценку с реалистичным взглядом на себя.',
        'en': 'Your answers indicate good self-esteem with a realistic view of yourself.',
      },
      strengths: {
        'ru': [
          'Реалистичная самооценка',
          'Баланс уверенности и скромности',
          'Способность признавать ошибки',
          'Открытость к развитию',
        ],
        'en': [
          'Realistic self-assessment',
          'Balance of confidence and humility',
          'Ability to acknowledge mistakes',
          'Openness to growth',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Временные сомнения в себе возможны',
        ],
        'en': [
          'Occasional self-doubt is possible',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте развивать свои сильные стороны',
          'Отмечайте свои достижения',
          'Поддерживайте здоровые отношения',
        ],
        'en': [
          'Continue developing your strengths',
          'Acknowledge your achievements',
          'Maintain healthy relationships',
        ],
      },
      tryToday: {
        'ru': 'Запишите три свои сильные стороны.',
        'en': 'Write down three of your strengths.',
      },
      inspiringConclusion: {
        'ru': 'Ваш баланс самооценки — основа для гармоничной жизни!',
        'en': 'Your balanced self-esteem is the foundation for a harmonious life!',
      },
    ),

    'profile_moderate_esteem': TestProfile(
      id: 'profile_moderate_esteem',
      name: {
        'ru': 'Умеренная самооценка',
        'en': 'Moderate Self-Esteem',
      },
      description: {
        'ru': 'У вас умеренная самооценка. Вы видите свои достоинства, но также склонны к самокритике и сравнению с другими.',
        'en': 'You have moderate self-esteem. You see your strengths but also tend toward self-criticism and comparison with others.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показали смешанную картину: частичную уверенность в себе наряду с сомнениями.',
        'en': 'Your answers showed a mixed picture: partial confidence alongside doubts.',
      },
      strengths: {
        'ru': [
          'Осознание областей для развития',
          'Потенциал для роста',
          'Открытость к изменениям',
        ],
        'en': [
          'Awareness of growth areas',
          'Potential for improvement',
          'Openness to change',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Частая самокритика',
          'Сравнение с другими',
          'Неуверенность в социальных ситуациях',
        ],
        'en': [
          'Frequent self-criticism',
          'Comparison with others',
          'Uncertainty in social situations',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте позитивные аффирмации',
          'Ведите дневник достижений',
          'Ограничьте сравнение с другими',
          'Окружайте себя поддерживающими людьми',
        ],
        'en': [
          'Practice positive affirmations',
          'Keep an achievement journal',
          'Limit comparison with others',
          'Surround yourself with supportive people',
        ],
      },
      tryToday: {
        'ru': 'Замените одну самокритичную мысль на позитивную.',
        'en': 'Replace one self-critical thought with a positive one.',
      },
      inspiringConclusion: {
        'ru': 'Каждый шаг к принятию себя — это победа. Вы достойны любви и уважения!',
        'en': 'Every step toward self-acceptance is a victory. You are worthy of love and respect!',
      },
    ),

    'profile_low_esteem': TestProfile(
      id: 'profile_low_esteem',
      name: {
        'ru': 'Низкая самооценка',
        'en': 'Low Self-Esteem',
      },
      description: {
        'ru': 'У вас сниженная самооценка. Вы склонны недооценивать свои способности и часто критикуете себя.',
        'en': 'You have low self-esteem. You tend to underestimate your abilities and often criticize yourself.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы указывают на частую самокритику, неуверенность и недовольство собой.',
        'en': 'Your answers indicate frequent self-criticism, uncertainty, and dissatisfaction with yourself.',
      },
      strengths: {
        'ru': [
          'Честность в самооценке',
          'Осознание проблемы',
          'Потенциал для трансформации',
        ],
        'en': [
          'Honesty in self-assessment',
          'Problem awareness',
          'Potential for transformation',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Постоянная самокритика',
          'Недовольство внешностью и способностями',
          'Неуверенность в социальных ситуациях',
          'Постоянное сравнение с другими',
        ],
        'en': [
          'Constant self-criticism',
          'Dissatisfaction with appearance and abilities',
          'Uncertainty in social situations',
          'Constant comparison with others',
        ],
      },
      recommendations: {
        'ru': [
          'Рассмотрите работу с психологом',
          'Начните вести дневник благодарности',
          'Практикуйте самосострадание',
          'Отмечайте даже маленькие достижения',
          'Ограничьте социальные сети',
        ],
        'en': [
          'Consider working with a psychologist',
          'Start keeping a gratitude journal',
          'Practice self-compassion',
          'Acknowledge even small achievements',
          'Limit social media',
        ],
      },
      tryToday: {
        'ru': 'Напишите себе письмо с добрыми словами, как будто пишете близкому другу.',
        'en': 'Write yourself a letter with kind words as if writing to a close friend.',
      },
      inspiringConclusion: {
        'ru': 'Ваша ценность не зависит от достижений или внешности. Вы заслуживаете любви просто потому, что вы есть.',
        'en': 'Your worth doesn\'t depend on achievements or appearance. You deserve love simply because you exist.',
      },
    ),

    'profile_very_low_esteem': TestProfile(
      id: 'profile_very_low_esteem',
      name: {
        'ru': 'Очень низкая самооценка',
        'en': 'Very Low Self-Esteem',
      },
      description: {
        'ru': 'У вас очень низкая самооценка, которая серьёзно влияет на качество жизни. Это состояние можно изменить с правильной поддержкой.',
        'en': 'You have very low self-esteem that seriously affects quality of life. This condition can be changed with proper support.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы указывают на глубокое недовольство собой, постоянную самокритику и неуверенность.',
        'en': 'Your answers indicate deep dissatisfaction with yourself, constant self-criticism, and uncertainty.',
      },
      strengths: {
        'ru': [
          'Вы прошли этот тест — это первый шаг',
          'Способность к изменениям',
          'Осознание ситуации',
        ],
        'en': [
          'You took this test — it\'s the first step',
          'Capacity for change',
          'Situation awareness',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Глубокая неуверенность в себе',
          'Возможное влияние на ментальное здоровье',
          'Трудности в отношениях',
          'Риск избегания социальных ситуаций',
        ],
        'en': [
          'Deep self-doubt',
          'Possible impact on mental health',
          'Relationship difficulties',
          'Risk of avoiding social situations',
        ],
      },
      recommendations: {
        'ru': [
          'Обратитесь к психологу или психотерапевту',
          'Низкая самооценка поддаётся терапии',
          'Найдите группу поддержки',
          'Практикуйте техники самосострадания',
          'Помните: это не ваша вина, и это можно изменить',
        ],
        'en': [
          'Consult a psychologist or therapist',
          'Low self-esteem is treatable',
          'Find a support group',
          'Practice self-compassion techniques',
          'Remember: it\'s not your fault, and it can be changed',
        ],
      },
      tryToday: {
        'ru': 'Позвоните близкому человеку и поговорите о своих чувствах.',
        'en': 'Call someone close and talk about your feelings.',
      },
      inspiringConclusion: {
        'ru': 'Ваша низкая самооценка — это не приговор. С правильной поддержкой вы можете полюбить себя. Первый шаг уже сделан.',
        'en': 'Your low self-esteem is not a sentence. With proper support, you can learn to love yourself. The first step has already been taken.',
      },
    ),
  };
}
