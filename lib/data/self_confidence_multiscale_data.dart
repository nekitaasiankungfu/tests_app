import '../models/test_model.dart';

/// Data access class for Self-Confidence Multiscale Test
/// Legacy Dart implementation (no JSON dependency)
class SelfConfidenceMultiscaleData {
  /// Get the complete Self-Confidence Multiscale test
  static TestModel getSelfConfidenceMultiscaleTest() {
    return TestModel(
      id: 'self_confidence_multiscale_v1',
      title: {
        'ru': 'Многофакторный тест уверенности в себе',
        'en': 'Self-Confidence Multiscale Test',
      },
      description: {
        'ru':
            'Этот тест предназначен для оценки разных аспектов уверенности в себе: '
            'веры в собственные способности, уверенности в социальных ситуациях, '
            'отношения к себе и устойчивости к неудачам. '
            'Он отражает современное понимание уверенности в себе как сложного конструкта, '
            'включающего как внутренние убеждения, так и поведенческие проявления.\n\n'
            'Результаты помогут лучше понять ваши сильные стороны и зоны роста, '
            'связанные с самооценкой, инициативностью и умением поддерживать себя '
            'в сложных ситуациях.',
        'en':
            'This test is designed to assess different aspects of self-confidence: '
            'belief in your own abilities, confidence in social situations, '
            'self-attitude and resilience to failures. '
            'It reflects the modern understanding of self-confidence as a complex construct, '
            'including both internal beliefs and behavioral manifestations.\n\n'
            'The results will help you better understand your strengths and growth areas '
            'related to self-esteem, initiative and the ability to support yourself '
            'in difficult situations.',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      disclaimer: {
        'ru':
            'Этот тест предназначен только для самопознания и личного развития. '
            'Он не является медицинским диагнозом и не заменяет консультацию специалиста.\n\n'
            'Если вы испытываете значительные трудности с уверенностью в себе, '
            'рекомендуется обратиться к психологу или психотерапевту.',
        'en':
            'This test is intended for self-knowledge and personal development only. '
            'It is not a medical diagnosis and does not replace consultation with a specialist.\n\n'
            'If you experience significant difficulties with self-confidence, '
            'consulting a psychologist or psychotherapist is recommended.',
      },
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: [
        'general_self_belief',
        'social_assertiveness',
        'self_acceptance',
        'initiative_resilience',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'general_self_belief': {
        'ru': 'Общая вера в себя',
        'en': 'General Self-Belief',
      },
      'social_assertiveness': {
        'ru': 'Социальная уверенность',
        'en': 'Social Assertiveness',
      },
      'self_acceptance': {
        'ru': 'Самопринятие',
        'en': 'Self-Acceptance',
      },
      'initiative_resilience': {
        'ru': 'Инициативность и устойчивость',
        'en': 'Initiative and Resilience',
      },
    };
  }

  /// Get factor interpretation based on percentage score
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Handle NaN or invalid percentage (RULE #5)
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }

    // Clamp percentage to 0-100 range
    percentage = percentage.clamp(0.0, 100.0);

    // Determine level based on interpretation ranges
    // very_low: 0-20%, low: 21-40%, medium: 41-60%, high: 61-80%, very_high: 81-100%
    final String level;
    if (percentage <= 20) {
      level = 'very_low';
    } else if (percentage <= 40) {
      level = 'low';
    } else if (percentage <= 60) {
      level = 'medium';
    } else if (percentage <= 80) {
      level = 'high';
    } else {
      level = 'very_high';
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

  /// Get all 32 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1 - general_self_belief
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'В целом я считаю себя человеком, который справляется с большинством жизненных задач.',
          'en': 'Overall, I consider myself a person who copes with most life tasks.',
        },
        factorId: 'general_self_belief',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q2 - social_assertiveness
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Мне легко заговорить с незнакомым человеком, если это необходимо.',
          'en': 'It is easy for me to talk to a stranger when necessary.',
        },
        factorId: 'social_assertiveness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q3 - self_acceptance
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я принимаю свои недостатки и не обесцениваю себя из-за них.',
          'en': 'I accept my flaws and don\'t put myself down because of them.',
        },
        factorId: 'self_acceptance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q4 - initiative_resilience
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я лучше действую, чем долго сомневаюсь и откладываю решения.',
          'en': 'I prefer to act rather than hesitate and postpone decisions for a long time.',
        },
        factorId: 'initiative_resilience',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q5 - general_self_belief
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Когда передо мной стоит сложная задача, я обычно уверен(а), что найду способ с ней справиться.',
          'en': 'When faced with a difficult task, I usually believe I will find a way to handle it.',
        },
        factorId: 'general_self_belief',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q6 - social_assertiveness (reversed)
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Мне трудно отстоять свою точку зрения, если собеседник ведёт себя уверенно.',
          'en': 'It is difficult for me to defend my point of view if the other person acts confidently.',
        },
        factorId: 'social_assertiveness',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q7 - self_acceptance (reversed)
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я часто ругаю себя за промахи дольше, чем это действительно нужно.',
          'en': 'I often blame myself for mistakes longer than necessary.',
        },
        factorId: 'self_acceptance',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q8 - initiative_resilience (reversed)
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'После неудачи мне требуется много времени, чтобы снова решиться действовать.',
          'en': 'After a failure, it takes me a long time to take action again.',
        },
        factorId: 'initiative_resilience',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q9 - general_self_belief
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я доверяю своим решениям, даже если вокруг есть люди с другим мнением.',
          'en': 'I trust my decisions even when others have different opinions.',
        },
        factorId: 'general_self_belief',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q10 - social_assertiveness (reversed)
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'В группе людей я обычно чувствую себя зажатым(ой) и неловким(ой).',
          'en': 'In a group of people, I usually feel constrained and awkward.',
        },
        factorId: 'social_assertiveness',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q11 - self_acceptance (reversed)
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Мне сложно сказать о себе что-то хорошее, не чувствуя неловкости.',
          'en': 'It is difficult for me to say something good about myself without feeling awkward.',
        },
        factorId: 'self_acceptance',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q12 - initiative_resilience
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Столкнувшись с трудностями, я скорее продолжаю пробовать, чем сдаюсь.',
          'en': 'When facing difficulties, I tend to keep trying rather than give up.',
        },
        factorId: 'initiative_resilience',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q13 - general_self_belief
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Если я взял(а) на себя ответственность, я уверен(а), что доведу дело до конца.',
          'en': 'If I take on responsibility, I am confident I will see it through.',
        },
        factorId: 'general_self_belief',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q14 - social_assertiveness
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я без особого напряжения прошу о помощи или поддержке, когда она мне нужна.',
          'en': 'I can ask for help or support without much tension when I need it.',
        },
        factorId: 'social_assertiveness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q15 - self_acceptance
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я считаю, что имею право на ошибки и не обязан(а) быть идеальным(ой).',
          'en': 'I believe I have the right to make mistakes and don\'t have to be perfect.',
        },
        factorId: 'self_acceptance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q16 - initiative_resilience (reversed)
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Когда появляется возможность чего-то нового, я часто отказываюсь из-за страха не справиться.',
          'en': 'When a new opportunity arises, I often decline due to fear of not coping.',
        },
        factorId: 'initiative_resilience',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q17 - general_self_belief
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'В неожиданных ситуациях я обычно сохраняю способность действовать и принимать решения.',
          'en': 'In unexpected situations, I usually maintain the ability to act and make decisions.',
        },
        factorId: 'general_self_belief',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q18 - social_assertiveness (reversed)
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Мне трудно сказать «нет», даже когда просьба мне неудобна.',
          'en': 'It is difficult for me to say "no" even when a request is inconvenient.',
        },
        factorId: 'social_assertiveness',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q19 - self_acceptance (reversed)
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Даже небольшие недостатки во внешности или характере сильно снижают мою самооценку.',
          'en': 'Even small flaws in appearance or character significantly lower my self-esteem.',
        },
        factorId: 'self_acceptance',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q20 - initiative_resilience
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Если что-то не получилось с первого раза, я воспринимаю это как полезный опыт.',
          'en': 'If something doesn\'t work out the first time, I see it as useful experience.',
        },
        factorId: 'initiative_resilience',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q21 - general_self_belief
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я верю, что в долгосрочной перспективе могу реализовать свои цели.',
          'en': 'I believe I can achieve my goals in the long run.',
        },
        factorId: 'general_self_belief',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q22 - social_assertiveness
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я спокойно высказываю своё мнение, даже если оно отличается от мнения большинства.',
          'en': 'I calmly express my opinion even if it differs from the majority.',
        },
        factorId: 'social_assertiveness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q23 - self_acceptance
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Когда меня критикуют, я не обесцениваю себя целиком как личность.',
          'en': 'When criticized, I don\'t devalue myself as a person.',
        },
        factorId: 'self_acceptance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q24 - initiative_resilience (reversed)
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я часто отказываюсь от инициативы, потому что боюсь выглядеть глупо.',
          'en': 'I often refuse to take initiative because I fear looking foolish.',
        },
        factorId: 'initiative_resilience',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q25 - general_self_belief
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'В сложных обстоятельствах я могу опереться на себя и свои ресурсы.',
          'en': 'In difficult circumstances, I can rely on myself and my resources.',
        },
        factorId: 'general_self_belief',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q26 - social_assertiveness
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Мне комфортно быть в центре внимания, когда я выступаю или делюсь своими идеями.',
          'en': 'I feel comfortable being the center of attention when presenting or sharing my ideas.',
        },
        factorId: 'social_assertiveness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q27 - self_acceptance
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Я отношусь к себе скорее с пониманием и поддержкой, чем с критикой.',
          'en': 'I treat myself with understanding and support rather than criticism.',
        },
        factorId: 'self_acceptance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q28 - initiative_resilience (reversed)
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Если меня подводит результат, я надолго застреваю в мыслях о своём поражении.',
          'en': 'If the result disappoints me, I dwell on my defeat for a long time.',
        },
        factorId: 'initiative_resilience',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q29 - general_self_belief
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я ощущаю, что в большинстве ситуаций способен(на) влиять на ход событий.',
          'en': 'I feel that in most situations I can influence the course of events.',
        },
        factorId: 'general_self_belief',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q30 - social_assertiveness (reversed)
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'В спорной ситуации я предпочитаю промолчать, даже если считаю себя правым(ой).',
          'en': 'In a controversial situation, I prefer to remain silent even if I believe I am right.',
        },
        factorId: 'social_assertiveness',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q31 - self_acceptance
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Мне удаётся сохранять уважение к себе, даже сталкиваясь с критикой или ошибками.',
          'en': 'I manage to maintain self-respect even when facing criticism or mistakes.',
        },
        factorId: 'self_acceptance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q32 - initiative_resilience
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Если план А не срабатывает, я способен(на) перейти к плану Б или придумать новый подход.',
          'en': 'If Plan A doesn\'t work, I can move to Plan B or come up with a new approach.',
        },
        factorId: 'initiative_resilience',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
    ];
  }

  /// Likert scale answers (5-point: 0-4) - RULE #1: scores 0-4!
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совершенно не согласен(на)',
          'en': 'Strongly Disagree',
        },
        score: 0, // RULE #1: Start from 0!
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не согласен(на)',
          'en': 'Disagree',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Нейтрально',
          'en': 'Neutral',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Скорее согласен(на)',
          'en': 'Agree',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью согласен(на)',
          'en': 'Strongly Agree',
        },
        score: 4, // RULE #1: End at 4 for 5-point scale!
      ),
    ];
  }

  /// Get factor interpretations by level
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'general_self_belief': {
        'very_low': {
          'title_ru': 'Очень низкий уровень веры в себя',
          'title_en': 'Very Low Self-Belief',
          'description_ru':
              'Вы часто сомневаетесь в себе и своих возможностях, даже в привычных ситуациях. '
              'Это может ограничивать профессиональный и личностный рост. '
              'Важно помнить, что ощущение неуверенности не является постоянным: '
              'его можно постепенно менять через малые успехи и работу с убеждениями.\n\n'
              'Рекомендации:\n'
              '• Начните с маленьких достижимых целей и фиксируйте каждый успех\n'
              '• Отслеживайте самокритичные мысли и задавайте вопрос: «На чём это основано?»\n'
              '• Рассмотрите возможность работы с психологом',
          'description_en':
              'You often doubt yourself and your abilities, even in familiar situations. '
              'This can limit professional and personal growth. '
              'Remember that feelings of insecurity are not permanent: '
              'they can be gradually changed through small successes and working with beliefs.\n\n'
              'Recommendations:\n'
              '• Start with small achievable goals and record each success\n'
              '• Track self-critical thoughts and ask: "What is this based on?"\n'
              '• Consider working with a psychologist',
        },
        'low': {
          'title_ru': 'Низкий уровень веры в себя',
          'title_en': 'Low Self-Belief',
          'description_ru':
              'Вы нередко сомневаетесь в себе и нуждаетесь во внешнем подтверждении своих решений. '
              'Вы можете успешно справляться с задачами, но часто не замечаете своих достижений.\n\n'
              'Рекомендации:\n'
              '• Ведите дневник успехов, записывая даже небольшие достижения\n'
              '• Замечайте ситуации, когда вы справились, несмотря на сомнения\n'
              '• Тренируйте внутреннюю поддержку',
          'description_en':
              'You often doubt yourself and need external validation for your decisions. '
              'You may successfully handle tasks but often don\'t notice your achievements.\n\n'
              'Recommendations:\n'
              '• Keep a success journal, recording even small achievements\n'
              '• Notice situations where you succeeded despite doubts\n'
              '• Practice inner support',
        },
        'medium': {
          'title_ru': 'Умеренный уровень веры в себя',
          'title_en': 'Moderate Self-Belief',
          'description_ru':
              'В целом вы верите в свои силы, но в сложных ситуациях уверенность может снижаться. '
              'Это нормальный, рабочий уровень, который можно укрепить.\n\n'
              'Рекомендации:\n'
              '• Планируйте задачи для постепенного выхода из зоны комфорта\n'
              '• Напоминайте себе о похожих ситуациях, с которыми справлялись\n'
              '• Фокусируйтесь не только на ошибках, но и на том, что получилось',
          'description_en':
              'Overall, you believe in yourself, but confidence may decrease in difficult situations. '
              'This is a normal, working level that can be strengthened.\n\n'
              'Recommendations:\n'
              '• Plan tasks to gradually step out of your comfort zone\n'
              '• Remind yourself of similar situations you\'ve handled\n'
              '• Focus not only on mistakes but also on what went well',
        },
        'high': {
          'title_ru': 'Высокий уровень веры в себя',
          'title_en': 'High Self-Belief',
          'description_ru':
              'Вы, как правило, доверяете своим возможностям и готовы брать на себя ответственность. '
              'Иногда могут возникать периоды сомнений, но они не становятся доминирующими.\n\n'
              'Рекомендации:\n'
              '• Продолжайте опираться на свой опыт и развивать новые навыки\n'
              '• Следите, чтобы уверенность оставалась реалистичной\n'
              '• Используйте ресурс уверенности для поддержки других',
          'description_en':
              'You generally trust your abilities and are ready to take responsibility. '
              'Periods of doubt may arise sometimes, but they don\'t become dominant.\n\n'
              'Recommendations:\n'
              '• Continue relying on your experience and developing new skills\n'
              '• Make sure your confidence remains realistic\n'
              '• Use your confidence resource to support others',
        },
        'very_high': {
          'title_ru': 'Очень высокий уровень веры в себя',
          'title_en': 'Very High Self-Belief',
          'description_ru':
              'Вы очень уверены в себе и своих возможностях, редко сомневаетесь в правильности решений. '
              'Это может быть мощным ресурсом, но важно помнить о рисках чрезмерной уверенности.\n\n'
              'Рекомендации:\n'
              '• Иногда проверяйте решения через обратную связь от компетентных людей\n'
              '• Отмечайте случаи, когда полезно признать ограничения\n'
              '• Используйте уверенность для долгосрочных целей',
          'description_en':
              'You are very confident in yourself and your abilities, rarely doubting your decisions. '
              'This can be a powerful resource, but be aware of the risks of overconfidence.\n\n'
              'Recommendations:\n'
              '• Occasionally verify decisions through feedback from competent people\n'
              '• Note cases where it\'s useful to acknowledge limitations\n'
              '• Use your confidence for long-term goals',
        },
      },
      'social_assertiveness': {
        'very_low': {
          'title_ru': 'Очень низкий уровень социальной уверенности',
          'title_en': 'Very Low Social Assertiveness',
          'description_ru':
              'Общение и отстаивание своей позиции даются вам с большим трудом. '
              'Это может приводить к накоплению обид и сложности в построении здоровых отношений.\n\n'
              'Рекомендации:\n'
              '• Тренируйте простые фразы отказа в безопасных ситуациях\n'
              '• Изучите базовые навыки ассертивного поведения\n'
              '• Рассмотрите тренинги по коммуникативным навыкам',
          'description_en':
              'Communication and defending your position are very difficult for you. '
              'This can lead to accumulated resentments and difficulties in building healthy relationships.\n\n'
              'Recommendations:\n'
              '• Practice simple refusal phrases in safe situations\n'
              '• Learn basic assertive behavior skills\n'
              '• Consider communication skills training',
        },
        'low': {
          'title_ru': 'Низкий уровень социальной уверенности',
          'title_en': 'Low Social Assertiveness',
          'description_ru':
              'Вы нередко испытываете застенчивость и трудности с выражением своих потребностей. '
              'В знакомых условиях вы можете нормально общаться, но в новых ситуациях склонны замолкать.\n\n'
              'Рекомендации:\n'
              '• Практикуйте выражение мнения сначала в безопасном кругу\n'
              '• Перед сложным разговором заранее запишите, что хотите сказать\n'
              '• Обращайте внимание на положительный опыт',
          'description_en':
              'You often experience shyness and difficulty expressing your needs. '
              'You can communicate normally in familiar conditions, but tend to fall silent in new situations.\n\n'
              'Recommendations:\n'
              '• Practice expressing opinions first in a safe circle\n'
              '• Before a difficult conversation, write down what you want to say\n'
              '• Pay attention to positive experiences',
        },
        'medium': {
          'title_ru': 'Умеренный уровень социальной уверенности',
          'title_en': 'Moderate Social Assertiveness',
          'description_ru':
              'В большинстве ситуаций вы общаетесь уверенно, но иногда вам сложно отстаивать себя. '
              'Это распространённый вариант с хорошей базой для развития.\n\n'
              'Рекомендации:\n'
              '• Тренируйте навыки конструктивного выражения несогласия\n'
              '• Отслеживайте ситуации, где уступаете по привычке\n'
              '• Пробуйте маленькие шаги: говорить громче и чётче',
          'description_en':
              'In most situations, you communicate confidently, but sometimes it\'s hard to stand up for yourself. '
              'This is a common variant with a good foundation for development.\n\n'
              'Recommendations:\n'
              '• Practice constructive disagreement skills\n'
              '• Track situations where you give in out of habit\n'
              '• Try small steps: speak louder and clearer',
        },
        'high': {
          'title_ru': 'Высокий уровень социальной уверенности',
          'title_en': 'High Social Assertiveness',
          'description_ru':
              'Вы чувствуете себя достаточно уверенно в общении и умеете отстаивать свои границы. '
              'Иногда вы всё же можете испытывать волнение, но оно не мешает вам действовать.\n\n'
              'Рекомендации:\n'
              '• Продолжайте развивать навыки активного слушания и эмпатии\n'
              '• Используйте уверенность для конструктивного разрешения конфликтов\n'
              '• Следите, чтобы напористость не превращалась в доминирование',
          'description_en':
              'You feel quite confident in communication and know how to defend your boundaries. '
              'You may still experience excitement sometimes, but it doesn\'t prevent you from acting.\n\n'
              'Recommendations:\n'
              '• Continue developing active listening and empathy skills\n'
              '• Use your confidence for constructive conflict resolution\n'
              '• Make sure assertiveness doesn\'t turn into dominance',
        },
        'very_high': {
          'title_ru': 'Очень высокий уровень социальной уверенности',
          'title_en': 'Very High Social Assertiveness',
          'description_ru':
              'Вы очень уверенно чувствуете себя среди людей и легко проявляете инициативу в общении. '
              'Важно, чтобы высокая уверенность сочеталась с уважением к чувствам других людей.\n\n'
              'Рекомендации:\n'
              '• Сохраняйте чувствительность к реакциям других людей\n'
              '• Используйте уверенность для поддержки более застенчивых людей\n'
              '• Проверяйте: все ли участники разговора могут высказаться',
          'description_en':
              'You feel very confident among people and easily take initiative in communication. '
              'It\'s important that high confidence is combined with respect for others\' feelings.\n\n'
              'Recommendations:\n'
              '• Stay sensitive to others\' reactions\n'
              '• Use your confidence to support more shy people\n'
              '• Check: can all participants in the conversation speak up',
        },
      },
      'self_acceptance': {
        'very_low': {
          'title_ru': 'Очень низкий уровень самопринятия',
          'title_en': 'Very Low Self-Acceptance',
          'description_ru':
              'Вы часто недовольны собой и склонны к жёсткой самокритике. '
              'Это повышает риск эмоционального выгорания, чувства вины и стыда.\n\n'
              'Рекомендации:\n'
              '• После самокритичной мысли формулируйте более мягкий вариант\n'
              '• Осознанно замечайте свои сильные стороны и записывайте их\n'
              '• Рассмотрите возможность психотерапии',
          'description_en':
              'You are often dissatisfied with yourself and prone to harsh self-criticism. '
              'This increases the risk of emotional burnout, guilt and shame.\n\n'
              'Recommendations:\n'
              '• After a self-critical thought, formulate a gentler version\n'
              '• Consciously notice your strengths and write them down\n'
              '• Consider psychotherapy',
        },
        'low': {
          'title_ru': 'Низкий уровень самопринятия',
          'title_en': 'Low Self-Acceptance',
          'description_ru':
              'Вы нередко недовольны собой и с трудом принимаете свои слабые стороны. '
              'В стрессовых ситуациях самокритика становится сильнее поддержки.\n\n'
              'Рекомендации:\n'
              '• Задавайте вопрос: «Как бы я отнёсся к другу в похожей ситуации?»\n'
              '• Составьте список своих сильных сторон\n'
              '• Тренируйте умение признавать ошибки без обесценивания себя',
          'description_en':
              'You are often dissatisfied with yourself and have difficulty accepting your weaknesses. '
              'In stressful situations, self-criticism becomes stronger than support.\n\n'
              'Recommendations:\n'
              '• Ask yourself: "How would I treat a friend in a similar situation?"\n'
              '• Make a list of your strengths\n'
              '• Practice acknowledging mistakes without devaluing yourself',
        },
        'medium': {
          'title_ru': 'Умеренный уровень самопринятия',
          'title_en': 'Moderate Self-Acceptance',
          'description_ru':
              'Вы в целом принимаете себя, но иногда становитесь излишне самокритичны. '
              'Небольшой сдвиг к большей поддержке существенно улучшит эмоциональное состояние.\n\n'
              'Рекомендации:\n'
              '• Отмечайте моменты, когда вы были к себе справедливы и поддерживающи\n'
              '• Учитесь видеть в ошибках источник опыта\n'
              '• Используйте практики самосострадания',
          'description_en':
              'Overall, you accept yourself, but sometimes become overly self-critical. '
              'A small shift toward more support will significantly improve your emotional state.\n\n'
              'Recommendations:\n'
              '• Note moments when you were fair and supportive to yourself\n'
              '• Learn to see mistakes as a source of experience\n'
              '• Use self-compassion practices',
        },
        'high': {
          'title_ru': 'Высокий уровень самопринятия',
          'title_en': 'High Self-Acceptance',
          'description_ru':
              'Вы обычно относитесь к себе с уважением и понимаете свои ограничения. '
              'Вы способны заботиться о себе и поддерживать себя.\n\n'
              'Рекомендации:\n'
              '• Сохраняйте практику уважительного отношения к себе в стрессе\n'
              '• Продолжайте развивать здоровые привычки заботы о себе\n'
              '• Делитесь опытом с людьми, которые более самокритичны',
          'description_en':
              'You usually treat yourself with respect and understand your limitations. '
              'You are able to take care of yourself and support yourself.\n\n'
              'Recommendations:\n'
              '• Maintain the practice of self-respect during stress\n'
              '• Continue developing healthy self-care habits\n'
              '• Share experience with people who are more self-critical',
        },
        'very_high': {
          'title_ru': 'Очень высокий уровень самопринятия',
          'title_en': 'Very High Self-Acceptance',
          'description_ru':
              'Вы хорошо принимаете себя и сохраняете устойчивое чувство собственного достоинства. '
              'Важно следить, чтобы самопринятие не превращалось в отрицание конструктивной обратной связи.\n\n'
              'Рекомендации:\n'
              '• Продолжайте сохранять баланс между принятием себя и готовностью развиваться\n'
              '• Используйте ресурс для экологичной самокритики\n'
              '• Помните, что уважение к себе и к другим связаны',
          'description_en':
              'You accept yourself well and maintain a stable sense of self-worth. '
              'Make sure self-acceptance doesn\'t turn into denial of constructive feedback.\n\n'
              'Recommendations:\n'
              '• Continue to maintain balance between self-acceptance and readiness to develop\n'
              '• Use your resource for eco-friendly self-criticism\n'
              '• Remember that self-respect and respect for others are connected',
        },
      },
      'initiative_resilience': {
        'very_low': {
          'title_ru': 'Очень низкий уровень инициативности и устойчивости',
          'title_en': 'Very Low Initiative and Resilience',
          'description_ru':
              'Вы часто избегаете инициативы и тяжело переживаете неудачи. '
              'Это ограничивает ваш опыт и снижает ощущение влияния на свою жизнь.\n\n'
              'Рекомендации:\n'
              '• Ставьте очень небольшие экспериментальные задачи\n'
              '• После неудачи выписывайте, чему она вас научила\n'
              '• Изучите истории людей, достигших успеха через многие попытки',
          'description_en':
              'You often avoid initiative and struggle with failures. '
              'This limits your experience and reduces the sense of influence over your life.\n\n'
              'Recommendations:\n'
              '• Set very small experimental tasks\n'
              '• After a failure, write down what it taught you\n'
              '• Study stories of people who achieved success through many attempts',
        },
        'low': {
          'title_ru': 'Низкий уровень инициативности и устойчивости',
          'title_en': 'Low Initiative and Resilience',
          'description_ru':
              'Вы берёте на себя инициативу нечасто и ощутимо расстраиваетесь из-за промахов. '
              'При риске ошибки предпочитаете отступить.\n\n'
              'Рекомендации:\n'
              '• Делите большие задачи на маленькие шаги\n'
              '• После неудачи задавайте вопрос: «Что можно сделать по-другому?»\n'
              '• Празднуйте не только успехи, но и сам факт попытки',
          'description_en':
              'You take initiative infrequently and get noticeably upset about mistakes. '
              'When there\'s a risk of error, you prefer to back off.\n\n'
              'Recommendations:\n'
              '• Break big tasks into small steps\n'
              '• After a failure, ask: "What can be done differently?"\n'
              '• Celebrate not only successes but also the fact of trying',
        },
        'medium': {
          'title_ru': 'Умеренный уровень инициативности и устойчивости',
          'title_en': 'Moderate Initiative and Resilience',
          'description_ru':
              'Вы готовы проявлять инициативу, но иногда вас останавливает страх ошибки. '
              'Неудачи вы переживаете болезненно, но со временем восстанавливаетесь.\n\n'
              'Рекомендации:\n'
              '• Формулируйте не только желаемый результат, но и чему можно научиться\n'
              '• Ведите список «смелых шагов», на которые решились\n'
              '• Используйте техники стресс-менеджмента для восстановления',
          'description_en':
              'You are ready to take initiative, but sometimes fear of error stops you. '
              'You experience failures painfully, but recover over time.\n\n'
              'Recommendations:\n'
              '• Formulate not only the desired result but also what you can learn\n'
              '• Keep a list of "brave steps" you took\n'
              '• Use stress management techniques for recovery',
        },
        'high': {
          'title_ru': 'Высокий уровень инициативности и устойчивости',
          'title_en': 'High Initiative and Resilience',
          'description_ru':
              'Вы готовы пробовать новое и в целом устойчиво переживаете неудачи. '
              'Ошибки вы воспринимаете как часть пути.\n\n'
              'Рекомендации:\n'
              '• Продолжайте использовать неудачи как источник информации\n'
              '• Поддерживайте баланс между активностью и отдыхом\n'
              '• Делитесь опытом преодоления трудностей с другими',
          'description_en':
              'You are ready to try new things and generally handle failures stably. '
              'You perceive mistakes as part of the journey.\n\n'
              'Recommendations:\n'
              '• Continue using failures as a source of information\n'
              '• Maintain balance between activity and rest\n'
              '• Share your experience of overcoming difficulties with others',
        },
        'very_high': {
          'title_ru': 'Очень высокий уровень инициативности и устойчивости',
          'title_en': 'Very High Initiative and Resilience',
          'description_ru':
              'Вы очень инициативны и обычно быстро восстанавливаетесь после неудач. '
              'Важно следить, чтобы высокая активность не приводила к переутомлению.\n\n'
              'Рекомендации:\n'
              '• Периодически оценивайте нагрузку и планируйте восстановление\n'
              '• Сохраняйте готовность корректировать планы\n'
              '• Используйте устойчивость для долгосрочных проектов',
          'description_en':
              'You are very proactive and usually recover quickly from failures. '
              'It\'s important to ensure high activity doesn\'t lead to burnout.\n\n'
              'Recommendations:\n'
              '• Periodically assess the load and plan recovery\n'
              '• Stay ready to adjust plans\n'
              '• Use your resilience for long-term projects',
        },
      },
    };
  }
}
