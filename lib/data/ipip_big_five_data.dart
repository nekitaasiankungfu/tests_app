import '../models/test_model.dart';

class IPIPBigFiveData {
  // Общие варианты ответов для всех вопросов IPIP теста
  static List<AnswerModel> getIPIPAnswers() {
    return [
      AnswerModel(
        id: 'very_inaccurate',
        text: {
          'ru': 'Совершенно неточно',
          'en': 'Very Inaccurate',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'moderately_inaccurate',
        text: {
          'ru': 'Скорее неточно',
          'en': 'Moderately Inaccurate',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'neither',
        text: {
          'ru': 'Ни точно, ни неточно',
          'en': 'Neither Accurate Nor Inaccurate',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'moderately_accurate',
        text: {
          'ru': 'Скорее точно',
          'en': 'Moderately Accurate',
        },
        score: 4,
      ),
      AnswerModel(
        id: 'very_accurate',
        text: {
          'ru': 'Совершенно точно',
          'en': 'Very Accurate',
        },
        score: 5,
      ),
    ];
  }

  static TestModel getIPIPBigFiveTest() {
    final answers = getIPIPAnswers();

    return TestModel(
      id: 'ipip_big_five',
      title: {
        'ru': 'Тест Большой Пятёрки (IPIP)',
        'en': 'Big Five Personality Test (IPIP)',
      },
      description: {
        'ru': 'Оцените себя по пяти основным факторам личности: Экстраверсия, Доброжелательность, Добросовестность, Эмоциональная стабильность и Интеллект. Ответьте честно, как вы обычно ведете себя.',
        'en': 'Assess yourself on five major personality factors: Extraversion, Agreeableness, Conscientiousness, Emotional Stability, and Intellect. Answer honestly, as you generally are.',
      },
      category: {
        'ru': 'Личность',
        'en': 'Personality',
      },
      categoryId: 'personality',
      disclaimer: {
        'ru': '''**Тест Большой Пятёрки**

Этот опросник измеряет пять основных черт личности, используя IPIP Big-Five Factor Markers.

**Предыстория**
Большая Пятёрка - самая принятая и широко используемая модель личности в академической психологии. Используя факторный анализ, исследователи определили, что пять факторов выделяются при объяснении личности: экстраверсия, нейротизм, доброжелательность, добросовестность и открытость опыту.

**Процедура**
Тест состоит из 50 утверждений, которые вы должны оценить по пятибалльной шкале: 1=Неточно, 3=Нейтрально, 5=Точно. Прохождение занимает 3-8 минут.

**Участие**
Используйте этот инструмент только в образовательных или развлекательных целях. Результаты не являются психологической или психиатрической консультацией и не гарантируют точности. Ваши ответы будут записаны анонимно и могут быть использованы для исследований.''',
        'en': '''**Big Five Personality Test**

This self-report inventory measures the big five personality traits using the IPIP Big-Five Factor Markers.

**Background**
The big five personality traits are the best accepted and most commonly used model of personality in academic psychology. Using factor analysis, researchers determined that five factors stand out in explaining personality: extraversion, neuroticism, agreeableness, conscientiousness and openness to experience.

**Procedure**
The test consists of fifty items that you must rate on a five point scale: 1=Disagree, 3=Neutral, 5=Agree. It takes 3-8 minutes to complete.

**Participation**
Your use of this tool should be for educational or entertainment purposes only. The results are not psychological or psychiatric advice and come with no guarantee of accuracy. Your responses will be recorded anonymously and may be used for research.''',
      },
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: ['extraversion', 'agreeableness', 'conscientiousness', 'emotional_stability', 'intellect'],
      questions: [
        // Extraversion (Экстраверсия) - вопросы 1, 6, 11, 16, 21, 26, 31, 36, 41, 46
        QuestionModel(
          id: 'q1',
          text: {
            'ru': 'Я - душа компании.',
            'en': 'Am the life of the party.',
          },
          answers: answers,
          factorId: 'extraversion',
          isReversed: false,
        ),
        // Agreeableness (Доброжелательность) - вопрос 2
        QuestionModel(
          id: 'q2',
          text: {
            'ru': 'Я мало беспокоюсь о других.',
            'en': 'Feel little concern for others.',
          },
          answers: answers,
          factorId: 'agreeableness',
          isReversed: true,
        ),
        // Conscientiousness (Добросовестность) - вопрос 3
        QuestionModel(
          id: 'q3',
          text: {
            'ru': 'Я всегда готов(а) к делам.',
            'en': 'Am always prepared.',
          },
          answers: answers,
          factorId: 'conscientiousness',
          isReversed: false,
        ),
        // Emotional Stability (Эмоциональная стабильность) - вопрос 4
        QuestionModel(
          id: 'q4',
          text: {
            'ru': 'Я легко впадаю в стресс.',
            'en': 'Get stressed out easily.',
          },
          answers: answers,
          factorId: 'emotional_stability',
          isReversed: true,
        ),
        // Intellect (Интеллект/Воображение) - вопрос 5
        QuestionModel(
          id: 'q5',
          text: {
            'ru': 'У меня богатый словарный запас.',
            'en': 'Have a rich vocabulary.',
          },
          answers: answers,
          factorId: 'intellect',
          isReversed: false,
        ),
        // Extraversion - вопрос 6
        QuestionModel(
          id: 'q6',
          text: {
            'ru': 'Я мало разговариваю.',
            'en': 'Don\'t talk a lot.',
          },
          answers: answers,
          factorId: 'extraversion',
          isReversed: true,
        ),
        // Agreeableness - вопрос 7
        QuestionModel(
          id: 'q7',
          text: {
            'ru': 'Я интересуюсь людьми.',
            'en': 'Am interested in people.',
          },
          answers: answers,
          factorId: 'agreeableness',
          isReversed: false,
        ),
        // Conscientiousness - вопрос 8
        QuestionModel(
          id: 'q8',
          text: {
            'ru': 'Я оставляю свои вещи где попало.',
            'en': 'Leave my belongings around.',
          },
          answers: answers,
          factorId: 'conscientiousness',
          isReversed: true,
        ),
        // Emotional Stability - вопрос 9
        QuestionModel(
          id: 'q9',
          text: {
            'ru': 'Я расслаблен(а) большую часть времени.',
            'en': 'Am relaxed most of the time.',
          },
          answers: answers,
          factorId: 'emotional_stability',
          isReversed: false,
        ),
        // Intellect - вопрос 10
        QuestionModel(
          id: 'q10',
          text: {
            'ru': 'Мне трудно понимать абстрактные идеи.',
            'en': 'Have difficulty understanding abstract ideas.',
          },
          answers: answers,
          factorId: 'intellect',
          isReversed: true,
        ),
        // Extraversion - вопрос 11
        QuestionModel(
          id: 'q11',
          text: {
            'ru': 'Я чувствую себя комфортно среди людей.',
            'en': 'Feel comfortable around people.',
          },
          answers: answers,
          factorId: 'extraversion',
          isReversed: false,
        ),
        // Agreeableness - вопрос 12
        QuestionModel(
          id: 'q12',
          text: {
            'ru': 'Я оскорбляю людей.',
            'en': 'Insult people.',
          },
          answers: answers,
          factorId: 'agreeableness',
          isReversed: true,
        ),
        // Conscientiousness - вопрос 13
        QuestionModel(
          id: 'q13',
          text: {
            'ru': 'Я обращаю внимание на детали.',
            'en': 'Pay attention to details.',
          },
          answers: answers,
          factorId: 'conscientiousness',
          isReversed: false,
        ),
        // Emotional Stability - вопрос 14
        QuestionModel(
          id: 'q14',
          text: {
            'ru': 'Я беспокоюсь о разных вещах.',
            'en': 'Worry about things.',
          },
          answers: answers,
          factorId: 'emotional_stability',
          isReversed: true,
        ),
        // Intellect - вопрос 15
        QuestionModel(
          id: 'q15',
          text: {
            'ru': 'У меня яркое воображение.',
            'en': 'Have a vivid imagination.',
          },
          answers: answers,
          factorId: 'intellect',
          isReversed: false,
        ),
        // Extraversion - вопрос 16
        QuestionModel(
          id: 'q16',
          text: {
            'ru': 'Я держусь в тени.',
            'en': 'Keep in the background.',
          },
          answers: answers,
          factorId: 'extraversion',
          isReversed: true,
        ),
        // Agreeableness - вопрос 17
        QuestionModel(
          id: 'q17',
          text: {
            'ru': 'Я сочувствую чувствам других.',
            'en': 'Sympathize with others\' feelings.',
          },
          answers: answers,
          factorId: 'agreeableness',
          isReversed: false,
        ),
        // Conscientiousness - вопрос 18
        QuestionModel(
          id: 'q18',
          text: {
            'ru': 'Я создаю беспорядок из вещей.',
            'en': 'Make a mess of things.',
          },
          answers: answers,
          factorId: 'conscientiousness',
          isReversed: true,
        ),
        // Emotional Stability - вопрос 19
        QuestionModel(
          id: 'q19',
          text: {
            'ru': 'Я редко чувствую грусть.',
            'en': 'Seldom feel blue.',
          },
          answers: answers,
          factorId: 'emotional_stability',
          isReversed: false,
        ),
        // Intellect - вопрос 20
        QuestionModel(
          id: 'q20',
          text: {
            'ru': 'Мне неинтересны абстрактные идеи.',
            'en': 'Am not interested in abstract ideas.',
          },
          answers: answers,
          factorId: 'intellect',
          isReversed: true,
        ),
        // Extraversion - вопрос 21
        QuestionModel(
          id: 'q21',
          text: {
            'ru': 'Я начинаю разговоры.',
            'en': 'Start conversations.',
          },
          answers: answers,
          factorId: 'extraversion',
          isReversed: false,
        ),
        // Agreeableness - вопрос 22
        QuestionModel(
          id: 'q22',
          text: {
            'ru': 'Меня не интересуют проблемы других людей.',
            'en': 'Am not interested in other people\'s problems.',
          },
          answers: answers,
          factorId: 'agreeableness',
          isReversed: true,
        ),
        // Conscientiousness - вопрос 23
        QuestionModel(
          id: 'q23',
          text: {
            'ru': 'Я сразу же выполняю дела по дому.',
            'en': 'Get chores done right away.',
          },
          answers: answers,
          factorId: 'conscientiousness',
          isReversed: false,
        ),
        // Emotional Stability - вопрос 24
        QuestionModel(
          id: 'q24',
          text: {
            'ru': 'Меня легко вывести из равновесия.',
            'en': 'Am easily disturbed.',
          },
          answers: answers,
          factorId: 'emotional_stability',
          isReversed: true,
        ),
        // Intellect - вопрос 25
        QuestionModel(
          id: 'q25',
          text: {
            'ru': 'У меня превосходные идеи.',
            'en': 'Have excellent ideas.',
          },
          answers: answers,
          factorId: 'intellect',
          isReversed: false,
        ),
        // Extraversion - вопрос 26
        QuestionModel(
          id: 'q26',
          text: {
            'ru': 'Мне мало что сказать.',
            'en': 'Have little to say.',
          },
          answers: answers,
          factorId: 'extraversion',
          isReversed: true,
        ),
        // Agreeableness - вопрос 27
        QuestionModel(
          id: 'q27',
          text: {
            'ru': 'У меня мягкое сердце.',
            'en': 'Have a soft heart.',
          },
          answers: answers,
          factorId: 'agreeableness',
          isReversed: false,
        ),
        // Conscientiousness - вопрос 28
        QuestionModel(
          id: 'q28',
          text: {
            'ru': 'Я часто забываю положить вещи на свои места.',
            'en': 'Often forget to put things back in their proper place.',
          },
          answers: answers,
          factorId: 'conscientiousness',
          isReversed: true,
        ),
        // Emotional Stability - вопрос 29
        QuestionModel(
          id: 'q29',
          text: {
            'ru': 'Я легко расстраиваюсь.',
            'en': 'Get upset easily.',
          },
          answers: answers,
          factorId: 'emotional_stability',
          isReversed: true,
        ),
        // Intellect - вопрос 30
        QuestionModel(
          id: 'q30',
          text: {
            'ru': 'У меня плохое воображение.',
            'en': 'Do not have a good imagination.',
          },
          answers: answers,
          factorId: 'intellect',
          isReversed: true,
        ),
        // Extraversion - вопрос 31
        QuestionModel(
          id: 'q31',
          text: {
            'ru': 'Я разговариваю с разными людьми на вечеринках.',
            'en': 'Talk to a lot of different people at parties.',
          },
          answers: answers,
          factorId: 'extraversion',
          isReversed: false,
        ),
        // Agreeableness - вопрос 32
        QuestionModel(
          id: 'q32',
          text: {
            'ru': 'Мне неинтересны другие люди.',
            'en': 'Am not really interested in others.',
          },
          answers: answers,
          factorId: 'agreeableness',
          isReversed: true,
        ),
        // Conscientiousness - вопрос 33
        QuestionModel(
          id: 'q33',
          text: {
            'ru': 'Я люблю порядок.',
            'en': 'Like order.',
          },
          answers: answers,
          factorId: 'conscientiousness',
          isReversed: false,
        ),
        // Emotional Stability - вопрос 34
        QuestionModel(
          id: 'q34',
          text: {
            'ru': 'Моё настроение часто меняется.',
            'en': 'Change my mood a lot.',
          },
          answers: answers,
          factorId: 'emotional_stability',
          isReversed: true,
        ),
        // Intellect - вопрос 35
        QuestionModel(
          id: 'q35',
          text: {
            'ru': 'Я быстро понимаю вещи.',
            'en': 'Am quick to understand things.',
          },
          answers: answers,
          factorId: 'intellect',
          isReversed: false,
        ),
        // Extraversion - вопрос 36
        QuestionModel(
          id: 'q36',
          text: {
            'ru': 'Мне не нравится привлекать к себе внимание.',
            'en': 'Don\'t like to draw attention to myself.',
          },
          answers: answers,
          factorId: 'extraversion',
          isReversed: true,
        ),
        // Agreeableness - вопрос 37
        QuestionModel(
          id: 'q37',
          text: {
            'ru': 'Я выделяю время для других.',
            'en': 'Take time out for others.',
          },
          answers: answers,
          factorId: 'agreeableness',
          isReversed: false,
        ),
        // Conscientiousness - вопрос 38
        QuestionModel(
          id: 'q38',
          text: {
            'ru': 'Я уклоняюсь от своих обязанностей.',
            'en': 'Shirk my duties.',
          },
          answers: answers,
          factorId: 'conscientiousness',
          isReversed: true,
        ),
        // Emotional Stability - вопрос 39
        QuestionModel(
          id: 'q39',
          text: {
            'ru': 'У меня частые перепады настроения.',
            'en': 'Have frequent mood swings.',
          },
          answers: answers,
          factorId: 'emotional_stability',
          isReversed: true,
        ),
        // Intellect - вопрос 40
        QuestionModel(
          id: 'q40',
          text: {
            'ru': 'Я использую сложные слова.',
            'en': 'Use difficult words.',
          },
          answers: answers,
          factorId: 'intellect',
          isReversed: false,
        ),
        // Extraversion - вопрос 41
        QuestionModel(
          id: 'q41',
          text: {
            'ru': 'Мне не против быть в центре внимания.',
            'en': 'Don\'t mind being the center of attention.',
          },
          answers: answers,
          factorId: 'extraversion',
          isReversed: false,
        ),
        // Agreeableness - вопрос 42
        QuestionModel(
          id: 'q42',
          text: {
            'ru': 'Я чувствую эмоции других людей.',
            'en': 'Feel others\' emotions.',
          },
          answers: answers,
          factorId: 'agreeableness',
          isReversed: false,
        ),
        // Conscientiousness - вопрос 43
        QuestionModel(
          id: 'q43',
          text: {
            'ru': 'Я следую расписанию.',
            'en': 'Follow a schedule.',
          },
          answers: answers,
          factorId: 'conscientiousness',
          isReversed: false,
        ),
        // Emotional Stability - вопрос 44
        QuestionModel(
          id: 'q44',
          text: {
            'ru': 'Меня легко раздражить.',
            'en': 'Get irritated easily.',
          },
          answers: answers,
          factorId: 'emotional_stability',
          isReversed: true,
        ),
        // Intellect - вопрос 45
        QuestionModel(
          id: 'q45',
          text: {
            'ru': 'Я трачу время на размышления о вещах.',
            'en': 'Spend time reflecting on things.',
          },
          answers: answers,
          factorId: 'intellect',
          isReversed: false,
        ),
        // Extraversion - вопрос 46
        QuestionModel(
          id: 'q46',
          text: {
            'ru': 'Я молчалив(а) рядом с незнакомцами.',
            'en': 'Am quiet around strangers.',
          },
          answers: answers,
          factorId: 'extraversion',
          isReversed: true,
        ),
        // Agreeableness - вопрос 47
        QuestionModel(
          id: 'q47',
          text: {
            'ru': 'Я помогаю людям чувствовать себя комфортно.',
            'en': 'Make people feel at ease.',
          },
          answers: answers,
          factorId: 'agreeableness',
          isReversed: false,
        ),
        // Conscientiousness - вопрос 48
        QuestionModel(
          id: 'q48',
          text: {
            'ru': 'Я требователен(а) в своей работе.',
            'en': 'Am exacting in my work.',
          },
          answers: answers,
          factorId: 'conscientiousness',
          isReversed: false,
        ),
        // Emotional Stability - вопрос 49
        QuestionModel(
          id: 'q49',
          text: {
            'ru': 'Я часто чувствую грусть.',
            'en': 'Often feel blue.',
          },
          answers: answers,
          factorId: 'emotional_stability',
          isReversed: true,
        ),
        // Intellect - вопрос 50
        QuestionModel(
          id: 'q50',
          text: {
            'ru': 'Я полон(а) идей.',
            'en': 'Am full of ideas.',
          },
          answers: answers,
          factorId: 'intellect',
          isReversed: false,
        ),
      ],
    );
  }

  // Получение интерпретации для каждого фактора
  static Map<String, String> getFactorInterpretation(String factorId, int score) {
    switch (factorId) {
      case 'extraversion':
        return _getExtraversionInterpretation(score);
      case 'agreeableness':
        return _getAgreeablenessInterpretation(score);
      case 'conscientiousness':
        return _getConscientiousnessInterpretation(score);
      case 'emotional_stability':
        return _getEmotionalStabilityInterpretation(score);
      case 'intellect':
        return _getIntellectInterpretation(score);
      default:
        return {'ru': 'Нет интерпретации', 'en': 'No interpretation'};
    }
  }

  static Map<String, String> _getExtraversionInterpretation(int score) {
    if (score >= 40) {
      return {
        'ru': 'Высокая экстраверсия. Вы общительный, энергичный, активный человек. Вы любите быть среди людей, легко заводите новые знакомства и чувствуете себя комфортно в центре внимания.',
        'en': 'High Extraversion. You are sociable, energetic, and active. You enjoy being around people, easily make new acquaintances, and feel comfortable in the spotlight.',
      };
    } else if (score >= 30) {
      return {
        'ru': 'Умеренно высокая экстраверсия. Вы достаточно общительны и активны в социальных ситуациях, но также цените личное время.',
        'en': 'Moderately High Extraversion. You are fairly sociable and active in social situations, but also value personal time.',
      };
    } else if (score >= 20) {
      return {
        'ru': 'Умеренно низкая экстраверсия. Вы предпочитаете более спокойную обстановку, но можете быть общительным когда это необходимо.',
        'en': 'Moderately Low Extraversion. You prefer quieter settings but can be sociable when needed.',
      };
    } else {
      return {
        'ru': 'Низкая экстраверсия (интроверсия). Вы предпочитаете одиночество или компанию небольшого круга близких людей. Вы обдумываете слова прежде чем говорить и цените спокойную обстановку.',
        'en': 'Low Extraversion (Introversion). You prefer solitude or the company of a small circle of close people. You think before speaking and value calm environments.',
      };
    }
  }

  static Map<String, String> _getAgreeablenessInterpretation(int score) {
    if (score >= 40) {
      return {
        'ru': 'Высокая доброжелательность. Вы сострадательный, отзывчивый и заботливый человек. Вы легко доверяете людям и стремитесь помогать другим.',
        'en': 'High Agreeableness. You are compassionate, responsive, and caring. You trust people easily and strive to help others.',
      };
    } else if (score >= 30) {
      return {
        'ru': 'Умеренно высокая доброжелательность. Вы внимательны к другим, но также умеете защищать свои интересы.',
        'en': 'Moderately High Agreeableness. You are considerate of others but also know how to protect your interests.',
      };
    } else if (score >= 20) {
      return {
        'ru': 'Умеренно низкая доброжелательность. Вы довольно независимы в суждениях и не всегда ставите интересы других выше своих.',
        'en': 'Moderately Low Agreeableness. You are fairly independent in judgment and don\'t always put others\' interests above your own.',
      };
    } else {
      return {
        'ru': 'Низкая доброжелательность. Вы скептичны, критичны и ставите свои интересы на первое место. Вы прямолинейны и не боитесь конфликтов.',
        'en': 'Low Agreeableness. You are skeptical, critical, and put your interests first. You are straightforward and not afraid of conflicts.',
      };
    }
  }

  static Map<String, String> _getConscientiousnessInterpretation(int score) {
    if (score >= 40) {
      return {
        'ru': 'Высокая добросовестность. Вы организованный, дисциплинированный и ответственный человек. Вы планируете заранее и доводите дела до конца.',
        'en': 'High Conscientiousness. You are organized, disciplined, and responsible. You plan ahead and see things through.',
      };
    } else if (score >= 30) {
      return {
        'ru': 'Умеренно высокая добросовестность. Вы достаточно организованы и надежны, но допускаете некоторую спонтанность.',
        'en': 'Moderately High Conscientiousness. You are fairly organized and reliable but allow some spontaneity.',
      };
    } else if (score >= 20) {
      return {
        'ru': 'Умеренно низкая добросовестность. Вы более спонтанны и гибки, иногда можете откладывать дела.',
        'en': 'Moderately Low Conscientiousness. You are more spontaneous and flexible, sometimes procrastinating.',
      };
    } else {
      return {
        'ru': 'Низкая добросовестность. Вы спонтанный, гибкий человек, который предпочитает действовать по обстоятельствам. Вам может быть сложно следовать строгим планам и расписаниям.',
        'en': 'Low Conscientiousness. You are spontaneous and flexible, preferring to act according to circumstances. You may find it difficult to follow strict plans and schedules.',
      };
    }
  }

  static Map<String, String> _getEmotionalStabilityInterpretation(int score) {
    if (score >= 40) {
      return {
        'ru': 'Высокая эмоциональная стабильность. Вы спокойный, уравновешенный человек. Вы редко испытываете стресс и быстро справляетесь с негативными эмоциями.',
        'en': 'High Emotional Stability. You are calm and balanced. You rarely experience stress and quickly cope with negative emotions.',
      };
    } else if (score >= 30) {
      return {
        'ru': 'Умеренно высокая эмоциональная стабильность. Вы в целом спокойны, но иногда можете переживать стресс.',
        'en': 'Moderately High Emotional Stability. You are generally calm but can sometimes experience stress.',
      };
    } else if (score >= 20) {
      return {
        'ru': 'Умеренно низкая эмоциональная стабильность. Вы довольно чувствительны к стрессу и эмоциональным ситуациям.',
        'en': 'Moderately Low Emotional Stability. You are fairly sensitive to stress and emotional situations.',
      };
    } else {
      return {
        'ru': 'Низкая эмоциональная стабильность. Вы чувствительный, эмоциональный человек. Вы склонны переживать стресс, тревогу и перепады настроения.',
        'en': 'Low Emotional Stability. You are sensitive and emotional. You are prone to experiencing stress, anxiety, and mood swings.',
      };
    }
  }

  static Map<String, String> _getIntellectInterpretation(int score) {
    if (score >= 40) {
      return {
        'ru': 'Высокий интеллект/воображение. Вы любознательный, творческий человек с богатым воображением. Вы интересуетесь абстрактными идеями и любите учиться новому.',
        'en': 'High Intellect/Imagination. You are curious and creative with a rich imagination. You are interested in abstract ideas and love learning new things.',
      };
    } else if (score >= 30) {
      return {
        'ru': 'Умеренно высокий интеллект/воображение. Вы открыты к новым идеям и имеете развитое воображение.',
        'en': 'Moderately High Intellect/Imagination. You are open to new ideas and have a developed imagination.',
      };
    } else if (score >= 20) {
      return {
        'ru': 'Умеренно низкий интеллект/воображение. Вы предпочитаете практичные, конкретные вещи абстрактным идеям.',
        'en': 'Moderately Low Intellect/Imagination. You prefer practical, concrete things to abstract ideas.',
      };
    } else {
      return {
        'ru': 'Низкий интеллект/воображение. Вы практичный, прямолинейный человек. Вы предпочитаете знакомые вещи и традиционные подходы.',
        'en': 'Low Intellect/Imagination. You are practical and straightforward. You prefer familiar things and traditional approaches.',
      };
    }
  }

  // Названия факторов
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'extraversion': {
        'ru': 'Экстраверсия',
        'en': 'Extraversion',
      },
      'agreeableness': {
        'ru': 'Доброжелательность',
        'en': 'Agreeableness',
      },
      'conscientiousness': {
        'ru': 'Добросовестность',
        'en': 'Conscientiousness',
      },
      'emotional_stability': {
        'ru': 'Эмоциональная стабильность',
        'en': 'Emotional Stability',
      },
      'intellect': {
        'ru': 'Интеллект/Воображение',
        'en': 'Intellect/Imagination',
      },
    };
  }

  // Детальное описание факторов
  static Map<String, String> getFactorDetailedDescription(String factorId) {
    switch (factorId) {
      case 'extraversion':
        return {
          'ru': '''Экстраверсия (также называемая Напористость или Позитивная Эмоциональность) характеризуется склонностью человека искать социальное взаимодействие и стимуляцию, а также уровнем энтузиазма и напористости в социальных ситуациях.

Люди с высокой экстраверсией обычно общительны, разговорчивы и открыты. Они получают удовольствие от общения с другими людьми и стремятся к социальным ситуациям. Их часто описывают как энергичных, полных энтузиазма и напористых. Они также могут быть более склонны к рискованному поведению, такому как вечеринки, или другим формам поиска острых ощущений.

Напротив, люди с низкой экстраверсией более интровертны и сдержанны. Они могут предпочитать проводить время в одиночестве или в небольших группах и чувствовать себя некомфортно на больших социальных собраниях. Они также могут быть менее напористыми и более осторожными во взаимодействии с другими.

Исследования показали, что экстраверсия связана с различными результатами, включая эффективность работы, социальную поддержку и благополучие. Например, люди с высокой экстраверсией, как правило, более успешны в карьере, связанной с социальным взаимодействием и коммуникацией. У них также может быть больше сетей социальной поддержки, и они испытывают более высокий уровень субъективного благополучия.''',
          'en': '''Extraversion (also called Surgency or Positive Emotionality) is typically characterized by an individual's tendency to seek out social interaction and stimulation, as well as their level of enthusiasm and assertiveness in social situations.

Individuals who score high on this dimension tend to be outgoing, sociable, and talkative. They enjoy being around others and seek out social situations. They are often described as having a high level of energy, enthusiasm, and assertiveness. They may also be more likely to engage in risk-taking behaviors, such as partying, drinking, or other forms of excitement-seeking.

In contrast, individuals who score low on extraversion are more introverted and reserved. They may prefer to spend time alone or in small groups, and may feel uncomfortable in large social gatherings. They may also be less assertive and more cautious in their interactions with others.

Research has shown that extraversion is linked to a range of outcomes, including job performance, social support, and well-being. For example, individuals who score high on extraversion tend to be more successful in careers that involve social interaction and communication. They may also have more social support networks and experience higher levels of subjective well-being.''',
        };
      case 'emotional_stability':
        return {
          'ru': '''Эмоциональная стабильность (противоположность которой часто называют Нейротизмом) отражает эмоциональную устойчивость и способность справляться со стрессом.

Люди с высокой эмоциональной стабильностью характеризуются как эмоционально устойчивые, спокойные и уравновешенные. Они, как правило, испытывают меньше негативных эмоций и лучше справляются со стрессом и невзгодами. Они также с большей вероятностью проявляют положительные эмоции, такие как счастье, удовлетворенность и энтузиазм.

Напротив, люди с низкой эмоциональной стабильностью более склонны к негативным эмоциям, таким как тревога, депрессия и гнев. Они могут более остро реагировать на стресс и могут испытывать трудности в преодолении сложных ситуаций. Они также могут демонстрировать ряд дезадаптивных форм поведения, таких как злоупотребление психоактивными веществами или самоповреждение.

Исследования показали, что эмоциональная стабильность связана с различными результатами, включая психическое здоровье, физическое здоровье и межличностные отношения. Например, люди с высокой эмоциональной стабильностью, как правило, имеют лучшие показатели психического здоровья, такие как более низкие уровни депрессии и тревоги. У них также могут быть лучшие показатели физического здоровья, такие как более низкие показатели сердечно-сосудистых заболеваний. Кроме того, у них, как правило, более стабильные и поддерживающие отношения с другими.''',
          'en': '''Emotional Stability (often referred to by its low end, Neuroticism) reflects emotional resilience and ability to cope with stress.

Individuals who score high on emotional stability are characterized as being emotionally resilient, calm, and even-tempered. They tend to experience fewer negative emotions and are better able to cope with stress and adversity. They are also more likely to exhibit positive emotions, such as happiness, contentment, and enthusiasm.

In contrast, individuals who score low on emotional stability tend to be more prone to negative emotions, such as anxiety, depression, and anger. They may be more reactive to stress and may find it difficult to cope with challenging situations. They may also exhibit a range of maladaptive behaviors, such as substance abuse or self-harm.

Research has shown that emotional stability is linked to a range of outcomes, including mental health, physical health, and interpersonal relationships. For example, individuals who score high on emotional stability tend to have better mental health outcomes, such as lower rates of depression and anxiety. They may also have better physical health outcomes, such as lower rates of cardiovascular disease. Additionally, they tend to have more stable and supportive relationships with others.''',
        };
      case 'agreeableness':
        return {
          'ru': '''Доброжелательность отражает склонность человека к кооперации, эмпатии и поддержанию гармоничных социальных отношений.

Люди с высокой доброжелательностью характеризуются как теплые, добрые и внимательные. Они склонны к сотрудничеству и мотивированы поддерживать гармоничные социальные отношения. Они также могут иметь сильное чувство эмпатии и заботы о благополучии других.

Напротив, люди с низкой доброжелательностью, как правило, более конкурентны и скептичны. Они могут быть менее мотивированы поддерживать социальную гармонию и могут более решительно выражать свое мнение, даже если оно противоречит мнению других.

Исследования показали, что доброжелательность связана с различными результатами, включая межличностные отношения, эффективность работы и психическое здоровье. Например, люди с высокой доброжелательностью, как правило, имеют более позитивные и поддерживающие отношения с другими. Они также могут быть более успешными в карьере, требующей командной работы и сотрудничества. Кроме того, у них обычно лучшие показатели психического здоровья, такие как более низкие уровни депрессии и тревоги. Однако важно отметить, что чрезмерно высокий уровень доброжелательности также может иметь негативные последствия, такие как чрезмерная податливость или отсутствие напористости.''',
          'en': '''Agreeableness reflects an individual's tendency toward cooperation, empathy, and maintaining harmonious social relationships.

Individuals who score high on agreeableness are characterized as being warm, kind, and considerate. They tend to be cooperative and are motivated to maintain harmonious social relationships. They may also have a strong sense of empathy and concern for the welfare of others.

In contrast, individuals who score low on agreeableness tend to be more competitive and skeptical. They may be less motivated to maintain social harmony and may be more likely to express their opinions forcefully, even if they may conflict with others.

Research has shown that agreeableness is linked to a range of outcomes, including interpersonal relationships, job performance, and mental health. For example, individuals who score high on agreeableness tend to have more positive and supportive relationships with others. They may also be more successful in careers that require teamwork and collaboration. Additionally, they tend to have better mental health outcomes, such as lower rates of depression and anxiety. However, it is important to note that excessively high levels of agreeableness can also have negative consequences, such as being overly compliant or lacking assertiveness.''',
        };
      case 'conscientiousness':
        return {
          'ru': '''Добросовестность отражает склонность человека к организованности, ответственности и целеустремленности.

Люди с высокой добросовестностью характеризуются как надежные, трудолюбивые и эффективные. Они, как правило, хорошо организованы и ответственны, и мотивированы на достижение своих целей. Они также могут проявлять сильное чувство самодисциплины и настойчивости.

Напротив, люди с низкой добросовестностью, как правило, более импульсивны и дезорганизованы. Им может быть трудно ставить и достигать целей, и они могут быть более склонны к поведению, которое не в их лучших интересах.

Исследования показали, что добросовестность связана с различными результатами, включая академическую и профессиональную эффективность, здоровое поведение и долголетие. Например, люди с высокой добросовестностью, как правило, имеют лучшую академическую и профессиональную эффективность, а также более низкие показатели прогулов и текучести кадров. Они также могут быть более склонны к здоровому поведению, такому как регулярные физические упражнения и поддержание здорового питания. Кроме того, они, как правило, живут дольше, чем люди с низкой добросовестностью.

Однако важно отметить, что чрезмерно высокий уровень добросовестности также может иметь негативные последствия, такие как чрезмерный перфекционизм или ригидность.''',
          'en': '''Conscientiousness reflects an individual's tendency toward organization, responsibility, and goal-directed behavior.

Individuals who score high on conscientiousness are characterized as being reliable, hardworking, and efficient. They tend to be well-organized and responsible, and are motivated to achieve their goals. They may also exhibit a strong sense of self-discipline and perseverance.

In contrast, individuals who score low on conscientiousness tend to be more impulsive and disorganized. They may have difficulty setting and achieving goals, and may be more likely to engage in behaviors that are not in their best interest.

Research has shown that conscientiousness is linked to a range of outcomes, including academic and job performance, health behaviors, and longevity. For example, individuals who score high on conscientiousness tend to have better academic and job performance, as well as lower rates of absenteeism and turnover. They may also be more likely to engage in health-promoting behaviors, such as exercising regularly and maintaining a healthy diet. Additionally, they tend to live longer than individuals who score low on conscientiousness.

However, it is important to note that excessively high levels of conscientiousness can also have negative consequences, such as being overly perfectionistic or rigid.''',
        };
      case 'intellect':
        return {
          'ru': '''Интеллект/Воображение (также наиболее известный в литературе как Открытость опыту) отражает любознательность, творчество и открытость новым идеям.

Люди с высокой открытостью опыту характеризуются как обладающие богатым воображением, любознательные и открытые для новых идей и переживаний. Они, как правило, интеллектуально любопытны и наслаждаются исследованием новых концепций и идей. Они также могут проявлять предпочтение к творчеству и эстетике.

Напротив, люди с низкой открытостью опыту, как правило, более традиционны и консервативны. Они могут предпочитать знакомые и предсказуемые переживания и могут быть менее склонны искать новый опыт.

Исследования показали, что открытость опыту связана с различными результатами, включая креативность, инновации и культурную компетентность. Например, люди с высокой открытостью опыту, как правило, более креативны и инновационны, и могут быть более успешными в карьере, требующей этих навыков. Кроме того, они, как правило, более открыты и восприимчивы к различным культурам и перспективам.

Однако важно отметить, что чрезмерно высокий уровень открытости опыту также может иметь негативные последствия, такие как чрезмерная импульсивность или трудности с рутинными задачами.''',
          'en': '''Intellect/Imagination (also most commonly known in the literature as Openness to Experience) reflects curiosity, creativity, and openness to new ideas.

Individuals who score high on openness to experience are characterized as being imaginative, curious, and open to new ideas and experiences. They tend to be intellectually curious and enjoy exploring new concepts and ideas. They may also exhibit a preference for creativity and aesthetics.

In contrast, individuals who score low on openness to experience tend to be more traditional and conservative. They may have a preference for familiar and predictable experiences, and may be less likely to seek out novel experiences.

Research has shown that openness to experience is linked to a range of outcomes, including creativity, innovation, and cultural competence. For example, individuals who score high on openness to experience tend to be more creative and innovative, and may be more successful in careers that require these skills. Additionally, they tend to be more open-minded and accepting of diverse cultures and perspectives.

However, it is important to note that excessively high levels of openness to experience can also have negative consequences, such as being overly impulsive or having difficulty with routine tasks.''',
        };
      default:
        return {'ru': 'Описание недоступно', 'en': 'Description not available'};
    }
  }
}

