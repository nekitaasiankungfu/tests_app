import '../models/test_model.dart';

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
}
