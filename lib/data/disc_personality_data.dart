import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data access class for DISC Personality Test
/// Legacy Dart implementation (no JSON dependency)
///
/// Based on William Marston's DISC Theory (1928)
/// Measures 4 behavioral factors: Dominance, Influence, Steadiness, Conscientiousness
class DISCPersonalityData {
  /// Get the complete DISC Personality test
  static TestModel getDISCPersonalityTest() {
    return TestModel(
      id: 'disc_personality_v1',
      title: {
        'ru': 'DISC: Профиль поведения',
        'en': 'DISC Personality Test',
      },
      description: {
        'ru':
            'DISC - это один из наиболее популярных и валидных инструментов оценки поведения, используемый миллионами людей по всему миру. Модель основана на теории эмоций Уильяма Марстона (1928) и измеряет четыре базовых поведенческих фактора:\n\n• Dominance (Доминирование) - как вы подходите к проблемам и вызовам. Высокий D = прямолинейность, решительность, результативность. Низкий D = осторожность, дипломатичность.\n\n• Influence (Влияние) - как вы взаимодействуете с людьми и влияете на них. Высокий I = энтузиазм, общительность, оптимизм. Низкий I = сдержанность, логичность, скептицизм.\n\n• Steadiness (Стабильность) - как вы реагируете на темп и изменения. Высокий S = терпение, лояльность, командная работа. Низкий S = динамичность, многозадачность, гибкость.\n\n• Conscientiousness (Сознательность) - как вы подходите к правилам и процедурам. Высокий C = точность, системность, качество. Низкий C = независимость, творчество, гибкость.\n\nВаш DISC профиль показывает уникальную комбинацию этих факторов, определяя ваш естественный стиль поведения, мотивацию, страхи и предпочтения. Понимание своего профиля помогает в карьере, лидерстве, командной работе и личных отношениях.\n\nТест особенно полезен для профессионального развития, подбора карьеры, улучшения коммуникации в команде и самопознания.',
        'en':
            'DISC is one of the most popular and valid behavioral assessment tools, used by millions of people worldwide. The model is based on William Marston\'s theory of emotions (1928) and measures four basic behavioral factors:\n\n• Dominance - how you approach problems and challenges. High D = directness, decisiveness, results orientation. Low D = caution, diplomacy.\n\n• Influence - how you interact with and influence people. High I = enthusiasm, sociability, optimism. Low I = reserve, logic, skepticism.\n\n• Steadiness - how you respond to pace and change. High S = patience, loyalty, teamwork. Low S = dynamism, multitasking, flexibility.\n\n• Conscientiousness - how you approach rules and procedures. High C = precision, systematicity, quality. Low C = independence, creativity, flexibility.\n\nYour DISC profile shows a unique combination of these factors, defining your natural behavioral style, motivation, fears, and preferences. Understanding your profile helps in career, leadership, teamwork, and personal relationships.\n\nThe test is especially useful for professional development, career selection, improving team communication, and self-awareness.',
      },
      category: {
        'ru': 'Типология личности',
        'en': 'Personality Typology',
      },
      categoryId: 'personality',
      disclaimer: {
        'ru':
            'Этот тест основан на классической модели DISC Уильяма Марстона. Он предназначен для самооценки и профессионального развития, не является медицинской диагностикой. Отвечайте честно, думая о своём естественном, привычном поведении, а не о том, как вы думаете, что должны себя вести.',
        'en':
            'This test is based on William Marston\'s classic DISC model. It is designed for self-assessment and professional development, and is not a medical diagnosis. Answer honestly, thinking about your natural, habitual behavior, not how you think you should behave.',
      },
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: [
        'dominance',
        'influence',
        'steadiness',
        'conscientiousness'
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'dominance': {
        'ru': 'Доминирование (D)',
        'en': 'Dominance (D)',
      },
      'influence': {
        'ru': 'Влияние (I)',
        'en': 'Influence (I)',
      },
      'steadiness': {
        'ru': 'Стабильность (S)',
        'en': 'Steadiness (S)',
      },
      'conscientiousness': {
        'ru': 'Сознательность (C)',
        'en': 'Conscientiousness (C)',
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

    // Determine range: 0-40 (low), 41-59 (medium), 60-100 (high)
    final String level;
    if (percentage < 40) {
      level = 'low';
    } else if (percentage < 60) {
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

  /// Get all 56 questions (14 per factor, alternating D-I-S-C)
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1 - Dominance
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я прямо говорю людям, что думаю, даже если это может их обидеть',
          'en': 'I speak directly to people about what I think, even if it might hurt their feelings',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q2 - Influence
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Я легко завожу новые знакомства и люблю быть в центре внимания',
          'en': 'I easily make new acquaintances and love being the center of attention',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q3 - Steadiness
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я предпочитаю работать в стабильной, предсказуемой среде',
          'en': 'I prefer to work in a stable, predictable environment',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q4 - Conscientiousness
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я обращаю большое внимание на детали и точность в работе',
          'en': 'I pay great attention to details and accuracy in my work',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q5 - Dominance
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Я люблю конкуренцию и стремлюсь побеждать',
          'en': 'I love competition and strive to win',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q6 - Influence
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Я энтузиаст и легко вдохновляю других людей',
          'en': 'I am an enthusiast and easily inspire other people',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q7 - Steadiness
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я терпеливый(ая) слушатель и готов(а) помогать другим',
          'en': 'I am a patient listener and ready to help others',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q8 - Conscientiousness
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я следую правилам и процедурам очень тщательно',
          'en': 'I follow rules and procedures very carefully',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q9 - Dominance
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я быстро принимаю решения и действую решительно',
          'en': 'I make quick decisions and act decisively',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q10 - Influence
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я оптимист и вижу лучшее в людях и ситуациях',
          'en': 'I am an optimist and see the best in people and situations',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q11 - Steadiness
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я не люблю конфликты и стремлюсь к гармонии',
          'en': 'I don\'t like conflicts and strive for harmony',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q12 - Conscientiousness
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Я аналитичен(на) и опираюсь на факты и данные',
          'en': 'I am analytical and rely on facts and data',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q13 - Dominance
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я предпочитаю брать на себя ответственность и контроль',
          'en': 'I prefer to take responsibility and control',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q14 - Influence
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я общительный(ая) и легко налаживаю контакт с незнакомцами',
          'en': 'I am sociable and easily establish contact with strangers',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q15 - Steadiness
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я лоялен(льна) и ценю долгосрочные отношения',
          'en': 'I am loyal and value long-term relationships',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q16 - Conscientiousness
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я систематичен(на) и предпочитаю всё планировать заранее',
          'en': 'I am systematic and prefer to plan everything in advance',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q17 - Dominance
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я фокусируюсь на результатах, а не на процессе',
          'en': 'I focus on results rather than the process',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q18 - Influence
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Я люблю работать с людьми и в команде',
          'en': 'I love working with people and in a team',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q19 - Steadiness
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Мне нужно время, чтобы привыкнуть к изменениям',
          'en': 'I need time to get used to changes',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q20 - Conscientiousness
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я перфекционист и стремлюсь к высокому качеству',
          'en': 'I am a perfectionist and strive for high quality',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q21 - Dominance
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я предпочитаю действовать, а не обсуждать',
          'en': 'I prefer to act rather than discuss',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q22 - Influence
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я убедителен(льна) и легко продаю свои идеи',
          'en': 'I am persuasive and easily sell my ideas',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q23 - Steadiness
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я предпочитаю работать в размеренном темпе, без спешки',
          'en': 'I prefer to work at a measured pace, without haste',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q24 - Conscientiousness
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я осторожен(жна) и избегаю рисков',
          'en': 'I am cautious and avoid risks',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q25 - Dominance
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я не боюсь вызовов и люблю сложные задачи',
          'en': 'I am not afraid of challenges and love complex tasks',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q26 - Influence
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Я выразителен(льна) и эмоционален(льна) в общении',
          'en': 'I am expressive and emotional in communication',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q27 - Steadiness
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Я ценю безопасность и стабильность выше риска и новизны',
          'en': 'I value security and stability over risk and novelty',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q28 - Conscientiousness
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Я задаю много вопросов и проверяю информацию',
          'en': 'I ask many questions and verify information',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q29 - Dominance
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я предпочитаю быстрый темп работы и люблю многозадачность',
          'en': 'I prefer a fast pace of work and love multitasking',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q30 - Influence
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я дружелюбен(на) и легко создаю позитивную атмосферу',
          'en': 'I am friendly and easily create a positive atmosphere',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q31 - Steadiness
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Я надёжный(ая) и люди могут на меня положиться',
          'en': 'I am reliable and people can count on me',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q32 - Conscientiousness
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Я дипломатичен(на) и тактичен(на) в общении',
          'en': 'I am diplomatic and tactful in communication',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q33 - Dominance
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Я не против идти против течения и оспаривать статус-кво',
          'en': 'I don\'t mind going against the flow and challenging the status quo',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q34 - Influence
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Я спонтанный(ая) и люблю импровизацию',
          'en': 'I am spontaneous and love improvisation',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q35 - Steadiness
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Я предсказуем(а) и последователен(льна) в своём поведении',
          'en': 'I am predictable and consistent in my behavior',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q36 - Conscientiousness
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Я объективен(на) и отделяю эмоции от фактов',
          'en': 'I am objective and separate emotions from facts',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q37 - Dominance
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я напорист(а) и настойчив(а) в достижении целей',
          'en': 'I am assertive and persistent in achieving goals',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q38 - Influence
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Я вдохновляю других и создаю энтузиазм',
          'en': 'I inspire others and create enthusiasm',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q39 - Steadiness
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Я поддерживаю(ю) других и создаю комфортную среду',
          'en': 'I support others and create a comfortable environment',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q40 - Conscientiousness
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'Я скептичен(на) и критически оцениваю информацию',
          'en': 'I am skeptical and critically evaluate information',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q41 - Dominance
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Я независим(а) и предпочитаю работать автономно',
          'en': 'I am independent and prefer to work autonomously',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q42 - Influence
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Я разговорчив(а) и люблю общаться',
          'en': 'I am talkative and love to communicate',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q43 - Steadiness
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Я хороший(ая) командный(ая) игрок(ша) и кооперативен(на)',
          'en': 'I am a good team player and cooperative',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q44 - Conscientiousness
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Я организован(на) и структурирован(на)',
          'en': 'I am organized and structured',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q45 - Dominance
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Я уверен(а) в себе и решителен(льна)',
          'en': 'I am confident and decisive',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q46 - Influence
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Я люблю веселиться и не принимаю всё слишком серьёзно',
          'en': 'I love to have fun and don\'t take everything too seriously',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q47 - Steadiness
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Я спокоен(йна) и эмоционально стабилен(льна)',
          'en': 'I am calm and emotionally stable',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q48 - Conscientiousness
      QuestionModel(
        id: 'q48',
        text: {
          'ru':
              'Я предпочитаю работать с проверенными методами, а не экспериментировать',
          'en': 'I prefer to work with proven methods rather than experiment',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q49 - Dominance
      QuestionModel(
        id: 'q49',
        text: {
          'ru': 'Я люблю власть и влияние на решения',
          'en': 'I love power and influence over decisions',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q50 - Influence
      QuestionModel(
        id: 'q50',
        text: {
          'ru': 'Я доверяю людям и ожидаю лучшего от них',
          'en': 'I trust people and expect the best from them',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q51 - Steadiness
      QuestionModel(
        id: 'q51',
        text: {
          'ru':
              'Я приспосабливаюсь к нуждам других и ставлю их выше своих',
          'en': 'I adapt to the needs of others and put them above my own',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q52 - Conscientiousness
      QuestionModel(
        id: 'q52',
        text: {
          'ru': 'Я ориентирован(а) на качество и стандарты',
          'en': 'I am focused on quality and standards',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q53 - Dominance
      QuestionModel(
        id: 'q53',
        text: {
          'ru': 'Я конфронтационен(на) и не боюсь споров',
          'en': 'I am confrontational and not afraid of arguments',
        },
        factorId: 'dominance',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q54 - Influence
      QuestionModel(
        id: 'q54',
        text: {
          'ru': 'Я эмоционально выразителен(льна) и показываю свои чувства',
          'en': 'I am emotionally expressive and show my feelings',
        },
        factorId: 'influence',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q55 - Steadiness
      QuestionModel(
        id: 'q55',
        text: {
          'ru': 'Я консервативен(на) и осторожен(жна) с изменениями',
          'en': 'I am conservative and cautious with changes',
        },
        factorId: 'steadiness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q56 - Conscientiousness
      QuestionModel(
        id: 'q56',
        text: {
          'ru': 'Я методичен(на) и люблю следовать процессам',
          'en': 'I am methodical and love to follow processes',
        },
        factorId: 'conscientiousness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
    ];
  }

  /// Standard Likert-5 answer scale (scores 0-4)
  /// IMPORTANT: Scores are 0-4 (NOT 1-5) to ensure 0% minimum score (RULE #1)
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: 'strongly_disagree',
        text: {
          'ru': 'Совершенно не согласен',
          'en': 'Strongly disagree',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'disagree',
        text: {
          'ru': 'Скорее не согласен',
          'en': 'Disagree',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'neutral',
        text: {
          'ru': 'Нейтрально',
          'en': 'Neutral',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'agree',
        text: {
          'ru': 'Скорее согласен',
          'en': 'Agree',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'strongly_agree',
        text: {
          'ru': 'Полностью согласен',
          'en': 'Strongly agree',
        },
        score: 4,
      ),
    ];
  }

  /// Factor interpretations for all levels
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'dominance': {
        'low': {
          'title_ru': 'Низкий уровень доминирования',
          'title_en': 'Low Dominance',
          'description_ru':
              'Вы осторожны, дипломатичны и предпочитаете сотрудничество конкуренции. Вы взвешенно принимаете решения и избегаете конфликтов. Ваши сильные стороны: тактичность в общении, командная работа, способность к компромиссам.',
          'description_en':
              'You are cautious, diplomatic, and prefer cooperation to competition. You make measured decisions and avoid conflicts. Your strengths: tactfulness in communication, teamwork, ability to compromise.',
        },
        'medium': {
          'title_ru': 'Средний уровень доминирования',
          'title_en': 'Medium Dominance',
          'description_ru':
              'Вы балансируете между решительностью и дипломатичностью. Вы можете быть прямым и взять контроль, когда это необходимо, но также способны быть гибким и учитывать мнения других.',
          'description_en':
              'You balance between decisiveness and diplomacy. You can be direct and take control when needed, but are also flexible and consider others\' opinions.',
        },
        'high': {
          'title_ru': 'Высокий уровень доминирования',
          'title_en': 'High Dominance',
          'description_ru':
              'Вы прямолинейны, решительны и ориентированы на результаты. Вы берёте на себя ответственность, быстро принимаете решения и не боитесь вызовов. Ваши сильные стороны: лидерство, уверенность в себе, результативность. Области для развития: терпение, эмпатия, делегирование.',
          'description_en':
              'You are direct, decisive, and results-oriented. You take charge, make quick decisions, and are not afraid of challenges. Your strengths: leadership, self-confidence, productivity. Areas for development: patience, empathy, delegation.',
        },
      },
      'influence': {
        'low': {
          'title_ru': 'Низкий уровень влияния',
          'title_en': 'Low Influence',
          'description_ru':
              'Вы сдержанны, логичны и скептичны. Вы предпочитаете факты эмоциям и имеете небольшой круг близких людей. Ваши сильные стороны: объективность в оценках, фокус на задачах, реалистичность.',
          'description_en':
              'You are reserved, logical, and skeptical. You prefer facts to emotions and have a small circle of close people. Your strengths: objectivity in assessments, focus on tasks, realism.',
        },
        'medium': {
          'title_ru': 'Средний уровень влияния',
          'title_en': 'Medium Influence',
          'description_ru':
              'Вы балансируете между общительностью и сдержанностью. Вы можете быть выразительным и энергичным в социальных ситуациях, но также цените время наедине и логический подход.',
          'description_en':
              'You balance between sociability and reserve. You can be expressive and energetic in social situations, but also value alone time and a logical approach.',
        },
        'high': {
          'title_ru': 'Высокий уровень влияния',
          'title_en': 'High Influence',
          'description_ru':
              'Вы общительны, энтузиастичны и легко вдохновляете других. Вы оптимистичны, любите быть в центре внимания и создаёте позитивную атмосферу. Ваши сильные стороны: коммуникация, мотивация, креативность. Области для развития: внимание к деталям, реалистичность, организованность.',
          'description_en':
              'You are sociable, enthusiastic, and easily inspire others. You are optimistic, love being the center of attention, and create a positive atmosphere. Your strengths: communication, motivation, creativity. Areas for development: attention to detail, realism, organization.',
        },
      },
      'steadiness': {
        'low': {
          'title_ru': 'Низкий уровень стабильности',
          'title_en': 'Low Steadiness',
          'description_ru':
              'Вы динамичны, гибки и комфортно себя чувствуете с изменениями. Вы предпочитаете разнообразие рутине и быстро адаптируетесь. Ваши сильные стороны: быстрая реакция, способность работать в хаосе, инициативность.',
          'description_en':
              'You are dynamic, flexible, and comfortable with change. You prefer variety to routine and adapt quickly. Your strengths: quick reaction, ability to work in chaos, initiative.',
        },
        'medium': {
          'title_ru': 'Средний уровень стабильности',
          'title_en': 'Medium Steadiness',
          'description_ru':
              'Вы балансируете между стабильностью и гибкостью. Вы цените предсказуемость, но также можете адаптироваться к изменениям при необходимости.',
          'description_en':
              'You balance between stability and flexibility. You value predictability but can also adapt to changes when necessary.',
        },
        'high': {
          'title_ru': 'Высокий уровень стабильности',
          'title_en': 'High Steadiness',
          'description_ru':
              'Вы терпеливы, лояльны и надёжны. Вы цените стабильность, гармонию и поддерживаете других. Вы отличный слушатель и создаёте комфортную среду. Ваши сильные стороны: надёжность, лояльность, терпение. Области для развития: комфорт с изменениями, ассертивность, быстрое принятие решений.',
          'description_en':
              'You are patient, loyal, and reliable. You value stability, harmony, and support others. You are an excellent listener and create a comfortable environment. Your strengths: reliability, loyalty, patience. Areas for development: comfort with change, assertiveness, quick decision-making.',
        },
      },
      'conscientiousness': {
        'low': {
          'title_ru': 'Низкий уровень сознательности',
          'title_en': 'Low Conscientiousness',
          'description_ru':
              'Вы независимы, спонтанны и комфортно себя чувствуете с неопределённостью. Вы предпочитаете креативность процедурам и интуитивный подход. Ваши сильные стороны: гибкость, креативное мышление, быстрые решения.',
          'description_en':
              'You are independent, spontaneous, and comfortable with uncertainty. You prefer creativity to procedures and an intuitive approach. Your strengths: flexibility, creative thinking, quick decisions.',
        },
        'medium': {
          'title_ru': 'Средний уровень сознательности',
          'title_en': 'Medium Conscientiousness',
          'description_ru':
              'Вы балансируете между вниманием к деталям и гибкостью. Вы можете быть точным и систематичным, когда это важно, но также способны быть креативным и гибким.',
          'description_en':
              'You balance between attention to detail and flexibility. You can be precise and systematic when important, but can also be creative and flexible.',
        },
        'high': {
          'title_ru': 'Высокий уровень сознательности',
          'title_en': 'High Conscientiousness',
          'description_ru':
              'Вы точны, аналитичны и обращаете большое внимание на детали. Вы систематичны, организованы и следуете правилам. Вы стремитесь к высокому качеству. Ваши сильные стороны: тщательность, организованность, объективность. Области для развития: комфорт с неопределённостью, гибкость, эмоциональная выразительность.',
          'description_en':
              'You are precise, analytical, and pay great attention to detail. You are systematic, organized, and follow rules. You strive for high quality. Your strengths: thoroughness, organization, objectivity. Areas for development: comfort with uncertainty, flexibility, emotional expressiveness.',
        },
      },
    };
  }

  /// Определить профиль на основе процентов по шкалам DISC
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_balanced';

    final d = percentages['dominance'] ?? 0;
    final i = percentages['influence'] ?? 0;
    final s = percentages['steadiness'] ?? 0;
    final c = percentages['conscientiousness'] ?? 0;

    // Определяем доминирующий и вторичный факторы
    final scores = {'D': d, 'I': i, 'S': s, 'C': c};
    final sorted = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final primary = sorted[0].key;
    final secondary = sorted[1].key;
    final primaryScore = sorted[0].value;
    final secondaryScore = sorted[1].value;

    // Если все показатели близки — balanced
    final range = sorted[0].value - sorted[3].value;
    if (range < 20) {
      return 'profile_balanced';
    }

    // Если один явно доминирует (разница > 15 с вторичным)
    if (primaryScore - secondaryScore > 15) {
      switch (primary) {
        case 'D':
          return 'profile_d_dominant';
        case 'I':
          return 'profile_i_dominant';
        case 'S':
          return 'profile_s_dominant';
        case 'C':
          return 'profile_c_dominant';
      }
    }

    // Комбинированные профили
    final combo = '$primary$secondary';
    switch (combo) {
      case 'DI':
      case 'ID':
        return 'profile_di_inspirational';
      case 'DC':
      case 'CD':
        return 'profile_dc_challenger';
      case 'DS':
      case 'SD':
        return 'profile_ds_driver';
      case 'IS':
      case 'SI':
        return 'profile_is_supporter';
      case 'IC':
      case 'CI':
        return 'profile_ic_assessor';
      case 'SC':
      case 'CS':
        return 'profile_sc_coordinator';
      default:
        return 'profile_balanced';
    }
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Все доступные профили DISC
  static const Map<String, TestProfile> _profiles = {
    'profile_d_dominant': TestProfile(
      id: 'profile_d_dominant',
      name: {
        'ru': 'Лидер (высокий D)',
        'en': 'Leader (High D)',
      },
      description: {
        'ru': 'Вы прямолинейны, решительны и ориентированы на результат. Вы естественный лидер, который берёт на себя ответственность.',
        'en': 'You are direct, decisive, and results-oriented. You are a natural leader who takes charge.',
      },
      whyThisProfile: {
        'ru': 'Ваш показатель Доминирования значительно выше других факторов DISC.',
        'en': 'Your Dominance score is significantly higher than other DISC factors.',
      },
      strengths: {
        'ru': [
          'Быстрое принятие решений',
          'Способность брать на себя ответственность',
          'Ориентация на достижение целей',
          'Умение преодолевать препятствия',
          'Эффективность под давлением',
        ],
        'en': [
          'Quick decision making',
          'Ability to take charge',
          'Goal achievement orientation',
          'Ability to overcome obstacles',
          'Effectiveness under pressure',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Нетерпимость к медлительности',
          'Риск авторитарности',
          'Недостаточное внимание к чувствам других',
          'Склонность к конфликтам',
        ],
        'en': [
          'Impatience with slowness',
          'Risk of being authoritarian',
          'Insufficient attention to others\' feelings',
          'Tendency towards conflicts',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте активное слушание',
          'Давайте другим время на размышление',
          'Развивайте эмпатию',
          'Учитесь делегировать',
          'Цените вклад команды',
        ],
        'en': [
          'Practice active listening',
          'Give others time to think',
          'Develop empathy',
          'Learn to delegate',
          'Value team contributions',
        ],
      },
      tryToday: {
        'ru': 'Спросите мнение коллеги перед принятием решения и выслушайте до конца.',
        'en': 'Ask a colleague\'s opinion before making a decision and listen completely.',
      },
      inspiringConclusion: {
        'ru': 'Ваша решительность — это сила! Направьте её на вдохновение команды, а не только на достижение целей.',
        'en': 'Your decisiveness is a strength! Channel it to inspire the team, not just achieve goals.',
      },
    ),

    'profile_i_dominant': TestProfile(
      id: 'profile_i_dominant',
      name: {
        'ru': 'Вдохновитель (высокий I)',
        'en': 'Inspirer (High I)',
      },
      description: {
        'ru': 'Вы общительны, оптимистичны и умеете влиять на людей. Вы создаёте позитивную атмосферу вокруг себя.',
        'en': 'You are sociable, optimistic, and know how to influence people. You create a positive atmosphere around you.',
      },
      whyThisProfile: {
        'ru': 'Ваш показатель Влияния значительно выше других факторов DISC.',
        'en': 'Your Influence score is significantly higher than other DISC factors.',
      },
      strengths: {
        'ru': [
          'Коммуникативные навыки',
          'Способность мотивировать других',
          'Позитивное мышление',
          'Креативность',
          'Умение налаживать связи',
        ],
        'en': [
          'Communication skills',
          'Ability to motivate others',
          'Positive thinking',
          'Creativity',
          'Networking ability',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Недостаточное внимание к деталям',
          'Трудности с дисциплиной',
          'Избегание конфликтов',
          'Потребность в одобрении',
        ],
        'en': [
          'Insufficient attention to details',
          'Difficulty with discipline',
          'Conflict avoidance',
          'Need for approval',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте навыки планирования',
          'Уделяйте внимание деталям',
          'Учитесь говорить "нет"',
          'Практикуйте завершение начатого',
          'Балансируйте энтузиазм с реализмом',
        ],
        'en': [
          'Develop planning skills',
          'Pay attention to details',
          'Learn to say "no"',
          'Practice completing what you start',
          'Balance enthusiasm with realism',
        ],
      },
      tryToday: {
        'ru': 'Доведите до конца одну задачу, прежде чем начинать новую.',
        'en': 'Complete one task before starting a new one.',
      },
      inspiringConclusion: {
        'ru': 'Ваша энергия заразительна! Используйте её для вдохновения, но не забывайте о последовательности.',
        'en': 'Your energy is contagious! Use it for inspiration, but don\'t forget about consistency.',
      },
    ),

    'profile_s_dominant': TestProfile(
      id: 'profile_s_dominant',
      name: {
        'ru': 'Стабилизатор (высокий S)',
        'en': 'Stabilizer (High S)',
      },
      description: {
        'ru': 'Вы терпеливы, лояльны и ориентированы на команду. Вы создаёте стабильность и гармонию.',
        'en': 'You are patient, loyal, and team-oriented. You create stability and harmony.',
      },
      whyThisProfile: {
        'ru': 'Ваш показатель Стабильности значительно выше других факторов DISC.',
        'en': 'Your Steadiness score is significantly higher than other DISC factors.',
      },
      strengths: {
        'ru': [
          'Надёжность и последовательность',
          'Умение слушать',
          'Терпение',
          'Командная работа',
          'Поддержка других',
        ],
        'en': [
          'Reliability and consistency',
          'Listening skills',
          'Patience',
          'Teamwork',
          'Supporting others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сопротивление изменениям',
          'Трудности с инициативой',
          'Избегание конфронтации',
          'Чрезмерная уступчивость',
        ],
        'en': [
          'Resistance to change',
          'Difficulty with initiative',
          'Confrontation avoidance',
          'Excessive accommodation',
        ],
      },
      recommendations: {
        'ru': [
          'Учитесь выражать своё мнение',
          'Практикуйте адаптацию к изменениям',
          'Берите на себя инициативу в маленьких вещах',
          'Устанавливайте личные границы',
          'Принимайте здоровые риски',
        ],
        'en': [
          'Learn to express your opinion',
          'Practice adapting to change',
          'Take initiative in small things',
          'Set personal boundaries',
          'Take healthy risks',
        ],
      },
      tryToday: {
        'ru': 'Выскажите своё мнение по рабочему вопросу, даже если оно отличается от мнения группы.',
        'en': 'Express your opinion on a work issue, even if it differs from the group\'s.',
      },
      inspiringConclusion: {
        'ru': 'Ваша стабильность — фундамент команды! Добавьте немного гибкости для ещё большего роста.',
        'en': 'Your stability is the team\'s foundation! Add some flexibility for even more growth.',
      },
    ),

    'profile_c_dominant': TestProfile(
      id: 'profile_c_dominant',
      name: {
        'ru': 'Аналитик (высокий C)',
        'en': 'Analyst (High C)',
      },
      description: {
        'ru': 'Вы точны, систематичны и ориентированы на качество. Вы обеспечиваете точность и надёжность.',
        'en': 'You are precise, systematic, and quality-oriented. You ensure accuracy and reliability.',
      },
      whyThisProfile: {
        'ru': 'Ваш показатель Сознательности значительно выше других факторов DISC.',
        'en': 'Your Conscientiousness score is significantly higher than other DISC factors.',
      },
      strengths: {
        'ru': [
          'Внимание к деталям',
          'Аналитическое мышление',
          'Высокие стандарты качества',
          'Организованность',
          'Объективность',
        ],
        'en': [
          'Attention to detail',
          'Analytical thinking',
          'High quality standards',
          'Organization',
          'Objectivity',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Перфекционизм',
          'Медленное принятие решений',
          'Критичность к себе и другим',
          'Трудности с неопределённостью',
        ],
        'en': [
          'Perfectionism',
          'Slow decision making',
          'Critical of self and others',
          'Difficulty with uncertainty',
        ],
      },
      recommendations: {
        'ru': [
          'Учитесь принимать "достаточно хорошо"',
          'Практикуйте быстрые решения',
          'Развивайте толерантность к ошибкам',
          'Доверяйте интуиции иногда',
          'Выражайте чувства открыто',
        ],
        'en': [
          'Learn to accept "good enough"',
          'Practice quick decisions',
          'Develop tolerance for mistakes',
          'Trust intuition sometimes',
          'Express feelings openly',
        ],
      },
      tryToday: {
        'ru': 'Примите одно решение за 60 секунд без дополнительного анализа.',
        'en': 'Make one decision in 60 seconds without additional analysis.',
      },
      inspiringConclusion: {
        'ru': 'Ваша точность бесценна! Помните, что иногда прогресс важнее совершенства.',
        'en': 'Your precision is priceless! Remember that sometimes progress is more important than perfection.',
      },
    ),

    'profile_di_inspirational': TestProfile(
      id: 'profile_di_inspirational',
      name: {
        'ru': 'Вдохновляющий лидер (DI)',
        'en': 'Inspirational Leader (DI)',
      },
      description: {
        'ru': 'Вы сочетаете решительность с обаянием. Вы ведёте людей к целям, вдохновляя их.',
        'en': 'You combine decisiveness with charisma. You lead people to goals by inspiring them.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Доминирования и Влияния.',
        'en': 'You have high Dominance and Influence scores.',
      },
      strengths: {
        'ru': [
          'Харизматичное лидерство',
          'Способность убеждать',
          'Энергичность',
          'Умение создавать видение',
          'Эффективная коммуникация',
        ],
        'en': [
          'Charismatic leadership',
          'Persuasion ability',
          'Energy',
          'Vision creation',
          'Effective communication',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Нетерпение к медленным процессам',
          'Риск переоценки возможностей',
          'Недостаточное внимание к деталям',
        ],
        'en': [
          'Impatience with slow processes',
          'Risk of overestimating capabilities',
          'Insufficient attention to details',
        ],
      },
      recommendations: {
        'ru': [
          'Окружайте себя людьми с высоким C и S',
          'Проверяйте идеи на реалистичность',
          'Слушайте критику конструктивно',
        ],
        'en': [
          'Surround yourself with high C and S people',
          'Check ideas for realism',
          'Listen to criticism constructively',
        ],
      },
      tryToday: {
        'ru': 'Попросите кого-то из команды проверить вашу идею на практичность.',
        'en': 'Ask someone on the team to check your idea for practicality.',
      },
      inspiringConclusion: {
        'ru': 'Вы создаёте будущее! Добавьте терпения — и станете ещё эффективнее.',
        'en': 'You create the future! Add patience and become even more effective.',
      },
    ),

    'profile_dc_challenger': TestProfile(
      id: 'profile_dc_challenger',
      name: {
        'ru': 'Бросающий вызов (DC)',
        'en': 'Challenger (DC)',
      },
      description: {
        'ru': 'Вы сочетаете решительность с точностью. Вы достигаете результатов через систематичность.',
        'en': 'You combine decisiveness with precision. You achieve results through systematic approach.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Доминирования и Сознательности.',
        'en': 'You have high Dominance and Conscientiousness scores.',
      },
      strengths: {
        'ru': [
          'Стратегическое мышление',
          'Высокие стандарты',
          'Эффективность',
          'Способность решать сложные проблемы',
          'Независимость',
        ],
        'en': [
          'Strategic thinking',
          'High standards',
          'Efficiency',
          'Ability to solve complex problems',
          'Independence',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Критичность к другим',
          'Перфекционизм',
          'Трудности с делегированием',
        ],
        'en': [
          'Critical of others',
          'Perfectionism',
          'Difficulty delegating',
        ],
      },
      recommendations: {
        'ru': [
          'Развивайте терпимость к ошибкам других',
          'Учитесь хвалить',
          'Делегируйте больше',
        ],
        'en': [
          'Develop tolerance for others\' mistakes',
          'Learn to praise',
          'Delegate more',
        ],
      },
      tryToday: {
        'ru': 'Похвалите коллегу за хорошую работу без указания на недостатки.',
        'en': 'Praise a colleague for good work without pointing out flaws.',
      },
      inspiringConclusion: {
        'ru': 'Ваша требовательность ведёт к совершенству! Смягчите её добротой.',
        'en': 'Your demanding nature leads to excellence! Soften it with kindness.',
      },
    ),

    'profile_ds_driver': TestProfile(
      id: 'profile_ds_driver',
      name: {
        'ru': 'Драйвер (DS)',
        'en': 'Driver (DS)',
      },
      description: {
        'ru': 'Вы сочетаете решительность со стабильностью. Вы достигаете целей методично.',
        'en': 'You combine decisiveness with stability. You achieve goals methodically.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Доминирования и Стабильности.',
        'en': 'You have high Dominance and Steadiness scores.',
      },
      strengths: {
        'ru': [
          'Надёжное лидерство',
          'Методичный подход к целям',
          'Стабильность под давлением',
          'Умение завершать начатое',
        ],
        'en': [
          'Reliable leadership',
          'Methodical approach to goals',
          'Stability under pressure',
          'Ability to complete what you start',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Упрямство',
          'Сопротивление новым методам',
          'Трудности с изменением курса',
        ],
        'en': [
          'Stubbornness',
          'Resistance to new methods',
          'Difficulty changing course',
        ],
      },
      recommendations: {
        'ru': [
          'Оставайтесь открытыми новым подходам',
          'Иногда позволяйте другим вести',
          'Практикуйте гибкость',
        ],
        'en': [
          'Stay open to new approaches',
          'Sometimes let others lead',
          'Practice flexibility',
        ],
      },
      tryToday: {
        'ru': 'Попробуйте новый способ выполнить привычную задачу.',
        'en': 'Try a new way to complete a familiar task.',
      },
      inspiringConclusion: {
        'ru': 'Вы — надёжный капитан! Добавьте немного гибкости в ваш курс.',
        'en': 'You are a reliable captain! Add some flexibility to your course.',
      },
    ),

    'profile_is_supporter': TestProfile(
      id: 'profile_is_supporter',
      name: {
        'ru': 'Поддерживающий (IS)',
        'en': 'Supporter (IS)',
      },
      description: {
        'ru': 'Вы сочетаете общительность с заботой. Вы создаёте тёплую атмосферу в команде.',
        'en': 'You combine sociability with care. You create a warm atmosphere in the team.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Влияния и Стабильности.',
        'en': 'You have high Influence and Steadiness scores.',
      },
      strengths: {
        'ru': [
          'Отличные навыки взаимоотношений',
          'Умение создавать гармонию',
          'Лояльность',
          'Эмпатия',
          'Командная работа',
        ],
        'en': [
          'Excellent relationship skills',
          'Harmony creation',
          'Loyalty',
          'Empathy',
          'Teamwork',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Трудности с принятием непопулярных решений',
          'Избегание конфликтов',
          'Чрезмерная уступчивость',
        ],
        'en': [
          'Difficulty making unpopular decisions',
          'Conflict avoidance',
          'Excessive accommodation',
        ],
      },
      recommendations: {
        'ru': [
          'Учитесь отстаивать своё мнение',
          'Практикуйте конструктивную конфронтацию',
          'Устанавливайте границы',
        ],
        'en': [
          'Learn to defend your opinion',
          'Practice constructive confrontation',
          'Set boundaries',
        ],
      },
      tryToday: {
        'ru': 'Скажите "нет" одной просьбе, которая не соответствует вашим приоритетам.',
        'en': 'Say "no" to one request that doesn\'t align with your priorities.',
      },
      inspiringConclusion: {
        'ru': 'Ваша забота объединяет людей! Добавьте твёрдости для баланса.',
        'en': 'Your care unites people! Add firmness for balance.',
      },
    ),

    'profile_ic_assessor': TestProfile(
      id: 'profile_ic_assessor',
      name: {
        'ru': 'Оценщик (IC)',
        'en': 'Assessor (IC)',
      },
      description: {
        'ru': 'Вы сочетаете обаяние с точностью. Вы убеждаете людей с помощью фактов.',
        'en': 'You combine charm with precision. You persuade people with facts.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Влияния и Сознательности.',
        'en': 'You have high Influence and Conscientiousness scores.',
      },
      strengths: {
        'ru': [
          'Убедительная аргументация',
          'Внимание к деталям при общении',
          'Способность объяснять сложное просто',
          'Качественные презентации',
        ],
        'en': [
          'Persuasive argumentation',
          'Attention to detail in communication',
          'Ability to explain complex simply',
          'Quality presentations',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможное противоречие между желанием нравиться и быть точным',
          'Чрезмерная самокритика',
        ],
        'en': [
          'Possible conflict between wanting to please and being accurate',
          'Excessive self-criticism',
        ],
      },
      recommendations: {
        'ru': [
          'Балансируйте между энтузиазмом и точностью',
          'Принимайте несовершенство',
          'Доверяйте интуиции',
        ],
        'en': [
          'Balance enthusiasm and precision',
          'Accept imperfection',
          'Trust intuition',
        ],
      },
      tryToday: {
        'ru': 'Поделитесь идеей, не проверяя её дважды.',
        'en': 'Share an idea without double-checking it.',
      },
      inspiringConclusion: {
        'ru': 'Вы умеете убеждать с точностью! Доверяйте себе больше.',
        'en': 'You know how to persuade with precision! Trust yourself more.',
      },
    ),

    'profile_sc_coordinator': TestProfile(
      id: 'profile_sc_coordinator',
      name: {
        'ru': 'Координатор (SC)',
        'en': 'Coordinator (SC)',
      },
      description: {
        'ru': 'Вы сочетаете стабильность с точностью. Вы обеспечиваете надёжную работу систем.',
        'en': 'You combine stability with precision. You ensure reliable system operation.',
      },
      whyThisProfile: {
        'ru': 'У вас высокие показатели Стабильности и Сознательности.',
        'en': 'You have high Steadiness and Conscientiousness scores.',
      },
      strengths: {
        'ru': [
          'Надёжность и последовательность',
          'Внимание к процессам',
          'Качественная работа',
          'Умение поддерживать системы',
          'Терпение с деталями',
        ],
        'en': [
          'Reliability and consistency',
          'Process attention',
          'Quality work',
          'Ability to maintain systems',
          'Patience with details',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сопротивление изменениям',
          'Медлительность в новых ситуациях',
          'Трудности с лидерством',
        ],
        'en': [
          'Resistance to change',
          'Slowness in new situations',
          'Leadership difficulties',
        ],
      },
      recommendations: {
        'ru': [
          'Практикуйте адаптацию к изменениям',
          'Берите инициативу в знакомых областях',
          'Выражайте мнение активнее',
        ],
        'en': [
          'Practice adapting to change',
          'Take initiative in familiar areas',
          'Express opinions more actively',
        ],
      },
      tryToday: {
        'ru': 'Предложите улучшение знакомого процесса.',
        'en': 'Suggest an improvement to a familiar process.',
      },
      inspiringConclusion: {
        'ru': 'Вы — фундамент надёжности! Добавьте инициативы для роста.',
        'en': 'You are the foundation of reliability! Add initiative for growth.',
      },
    ),

    'profile_balanced': TestProfile(
      id: 'profile_balanced',
      name: {
        'ru': 'Сбалансированный профиль',
        'en': 'Balanced Profile',
      },
      description: {
        'ru': 'У вас гармоничное сочетание всех четырёх факторов DISC. Вы адаптивны в разных ситуациях.',
        'en': 'You have a harmonious combination of all four DISC factors. You are adaptive in different situations.',
      },
      whyThisProfile: {
        'ru': 'Ваши показатели по всем четырём факторам DISC близки друг к другу.',
        'en': 'Your scores across all four DISC factors are close to each other.',
      },
      strengths: {
        'ru': [
          'Высокая адаптивность',
          'Понимание разных стилей',
          'Гибкость в общении',
          'Способность работать с разными людьми',
          'Универсальность',
        ],
        'en': [
          'High adaptability',
          'Understanding different styles',
          'Communication flexibility',
          'Ability to work with different people',
          'Versatility',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможные трудности с самоидентификацией',
          'Риск размытия сильных сторон',
          'Сложность в определении предпочтений',
        ],
        'en': [
          'Possible self-identification difficulties',
          'Risk of diluting strengths',
          'Difficulty determining preferences',
        ],
      },
      recommendations: {
        'ru': [
          'Определите свои ключевые ценности',
          'Развивайте осознанность своих предпочтений',
          'Используйте адаптивность стратегически',
          'Найдите роли, требующие универсальности',
        ],
        'en': [
          'Define your key values',
          'Develop awareness of your preferences',
          'Use adaptability strategically',
          'Find roles requiring versatility',
        ],
      },
      tryToday: {
        'ru': 'Отметьте, в каких ситуациях вы чувствуете себя наиболее естественно.',
        'en': 'Note in which situations you feel most natural.',
      },
      inspiringConclusion: {
        'ru': 'Ваша универсальность — редкий дар! Используйте её для создания мостов между людьми.',
        'en': 'Your versatility is a rare gift! Use it to build bridges between people.',
      },
    ),
  };
}
