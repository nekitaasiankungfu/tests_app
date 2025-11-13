import '../models/test_model.dart';

/// Data access class for Burnout Diagnostic Test
/// Legacy Dart implementation (no JSON dependency)
class BurnoutDiagnosticData {
  /// Get the complete Burnout Diagnostic test
  static TestModel getBurnoutDiagnosticTest() {
    return TestModel(
      id: 'burnout_diagnostic_v1',
      title: {
        'ru': 'Диагностика эмоционального выгорания: Профессиональное истощение',
        'en': 'Burnout Diagnostic: Professional Exhaustion',
      },
      description: {
        'ru':
            'Эмоциональное выгорание — это состояние физического, эмоционального и ментального истощения, вызванное длительным воздействием профессионального стресса. По данным ВОЗ, выгорание признано профессиональным феноменом, затрагивающим миллионы работников по всему миру. Это не просто усталость — это системное нарушение, влияющее на здоровье, отношения и качество жизни.\n\nЭтот тест основан на классической модели выгорания Маслач (MBI - Maslach Burnout Inventory) и современных исследованиях профессионального стресса. Он измеряет ключевые компоненты выгорания: эмоциональное истощение, деперсонализацию (цинизм), снижение профессиональной эффективности, а также физические симптомы, когнитивные нарушения и потерю мотивации.\n\nТест особенно актуален для людей помогающих профессий (врачи, учителя, психологи, социальные работники), менеджеров, IT-специалистов и всех, кто чувствует хроническую усталость, потерю смысла в работе или эмоциональное отупение. Ранняя диагностика выгорания критична для предотвращения серьёзных последствий для здоровья.',
        'en':
            'Burnout is a state of physical, emotional and mental exhaustion caused by prolonged professional stress. According to WHO, burnout is recognized as an occupational phenomenon affecting millions of workers worldwide. It is not just fatigue - it is a systemic disorder affecting health, relationships and quality of life.\n\nThis test is based on the classic Maslach Burnout Inventory (MBI) and modern research on professional stress. It measures key components of burnout: emotional exhaustion, depersonalization (cynicism), reduced professional efficacy, as well as physical symptoms, cognitive impairment and loss of motivation.\n\nThe test is especially relevant for helping professions (doctors, teachers, psychologists, social workers), managers, IT specialists and anyone experiencing chronic fatigue, loss of meaning at work or emotional numbing. Early diagnosis of burnout is critical to prevent serious health consequences.',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      disclaimer: {
        'ru':
            'Этот тест основан на классической модели выгорания Маслач (MBI - Maslach Burnout Inventory) и современных исследованиях профессионального стресса. Он предназначен для самооценки и не является медицинской диагностикой. Выгорание - это не слабость и не вина человека, а профессиональная болезнь. Отвечайте честно для получения наиболее точных результатов.',
        'en':
            'This test is based on the classic Maslach Burnout Inventory (MBI) and modern research on professional stress. It is for self-assessment and not a medical diagnosis. Burnout is not weakness or fault, but an occupational disease. Answer honestly for the most accurate results.',
      },
      estimatedTime: 12,
      type: TestType.multiFactor,
      factorIds: [
        'emotional_exhaustion',
        'depersonalization',
        'reduced_efficacy',
        'physical_symptoms',
        'cognitive_impairment',
        'motivation_loss',
        'work_environment'
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'emotional_exhaustion': {
        'ru': 'Эмоциональное истощение',
        'en': 'Emotional Exhaustion',
      },
      'depersonalization': {
        'ru': 'Деперсонализация (Цинизм)',
        'en': 'Depersonalization (Cynicism)',
      },
      'reduced_efficacy': {
        'ru': 'Снижение профессиональной эффективности',
        'en': 'Reduced Professional Efficacy',
      },
      'physical_symptoms': {
        'ru': 'Физические симптомы',
        'en': 'Physical Symptoms',
      },
      'cognitive_impairment': {
        'ru': 'Когнитивные нарушения',
        'en': 'Cognitive Impairment',
      },
      'motivation_loss': {
        'ru': 'Потеря мотивации и смысла',
        'en': 'Loss of Motivation and Meaning',
      },
      'work_environment': {
        'ru': 'Рабочая среда и нагрузка',
        'en': 'Work Environment and Workload',
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

    // Determine range: 0-35 (low), 36-65 (medium), 66-100 (high)
    final String level;
    if (percentage <= 35) {
      level = 'low';
    } else if (percentage <= 65) {
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

  /// Get all 54 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1 - emotional_exhaustion
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я чувствую себя эмоционально опустошённым(ой) от работы',
          'en': 'I feel emotionally drained from my work',
        },
        factorId: 'emotional_exhaustion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q2 - depersonalization
      QuestionModel(
        id: 'q2',
        text: {
          'ru':
              'Я стал(а) более циничным(ой) и равнодушным(ой) к своей работе',
          'en': 'I have become more cynical and indifferent to my work',
        },
        factorId: 'depersonalization',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q3 - reduced_efficacy
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я чувствую, что моя продуктивность на работе снизилась',
          'en': 'I feel that my productivity at work has decreased',
        },
        factorId: 'reduced_efficacy',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q4 - physical_symptoms
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я чувствую постоянную физическую усталость, даже после отдыха',
          'en': 'I feel constant physical fatigue, even after rest',
        },
        factorId: 'physical_symptoms',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q5 - cognitive_impairment
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Мне трудно сосредоточиться на рабочих задачах',
          'en': 'I find it difficult to concentrate on work tasks',
        },
        factorId: 'cognitive_impairment',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q6 - motivation_loss
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Я потерял(а) интерес и энтузиазм к своей работе',
          'en': 'I have lost interest and enthusiasm for my work',
        },
        factorId: 'motivation_loss',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q7 - work_environment
      QuestionModel(
        id: 'q7',
        text: {
          'ru':
              'Сколько часов в неделю вы работаете (включая переработки)?',
          'en':
              'How many hours per week do you work (including overtime)?',
        },
        factorId: 'work_environment',
        isReversed: false,
        answers: _getWorkHoursAnswers(),
      ),
      // Q8 - emotional_exhaustion
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'К концу рабочего дня я чувствую себя полностью выжатым(ой)',
          'en': 'At the end of the workday I feel completely drained',
        },
        factorId: 'emotional_exhaustion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q9 - depersonalization
      QuestionModel(
        id: 'q9',
        text: {
          'ru':
              'Мне всё равно, что происходит с моими клиентами/коллегами/проектами',
          'en':
              'I do not care what happens to my clients/colleagues/projects',
        },
        factorId: 'depersonalization',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q10 - reduced_efficacy
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Я сомневаюсь в ценности и значимости моей работы',
          'en': 'I doubt the value and significance of my work',
        },
        factorId: 'reduced_efficacy',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q11 - physical_symptoms
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'У меня нарушился режим сна (бессонница или чрезмерная сонливость)',
          'en': 'My sleep is disturbed (insomnia or excessive sleepiness)',
        },
        factorId: 'physical_symptoms',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q12 - cognitive_impairment
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Я делаю больше ошибок в работе, чем раньше',
          'en': 'I make more mistakes at work than before',
        },
        factorId: 'cognitive_impairment',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q13 - motivation_loss
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я думаю об увольнении или смене профессии',
          'en': 'I think about quitting or changing profession',
        },
        factorId: 'motivation_loss',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q14 - work_environment
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Как часто вы работаете в выходные дни?',
          'en': 'How often do you work on weekends?',
        },
        factorId: 'work_environment',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q15 - emotional_exhaustion
      QuestionModel(
        id: 'q15',
        text: {
          'ru':
              'Мысль о предстоящем рабочем дне вызывает у меня тревогу или страх',
          'en':
              'The thought of the upcoming workday causes me anxiety or fear',
        },
        factorId: 'emotional_exhaustion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q16 - depersonalization
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я стал(а) относиться к людям как к безличным объектам',
          'en': 'I have started treating people as impersonal objects',
        },
        factorId: 'depersonalization',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q17 - reduced_efficacy
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я чувствую, что не справляюсь со своими рабочими обязанностями',
          'en': 'I feel that I am not coping with my work responsibilities',
        },
        factorId: 'reduced_efficacy',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q18 - physical_symptoms
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'У меня часто болит голова, шея или спина',
          'en': 'I often have headaches, neck or back pain',
        },
        factorId: 'physical_symptoms',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q19 - cognitive_impairment
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Мне сложно принимать решения, даже простые',
          'en': 'I find it difficult to make decisions, even simple ones',
        },
        factorId: 'cognitive_impairment',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q20 - motivation_loss
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я не вижу смысла в том, что делаю на работе',
          'en': 'I see no meaning in what I do at work',
        },
        factorId: 'motivation_loss',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q21 - work_environment (REVERSED)
      QuestionModel(
        id: 'q21',
        text: {
          'ru':
              'У вас есть возможность влиять на решения, касающиеся вашей работы?',
          'en':
              'Do you have the opportunity to influence decisions regarding your work?',
        },
        factorId: 'work_environment',
        isReversed: true,
        answers: _getControlAnswers(),
      ),
      // Q22 - emotional_exhaustion
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я чувствую себя на пределе своих эмоциональных возможностей',
          'en': 'I feel at the limit of my emotional capabilities',
        },
        factorId: 'emotional_exhaustion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q23 - depersonalization
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Меня раздражают люди, с которыми я работаю',
          'en': 'People I work with irritate me',
        },
        factorId: 'depersonalization',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q24 - reduced_efficacy (REVERSED)
      QuestionModel(
        id: 'q24',
        text: {
          'ru':
              'Я могу эффективно решать проблемы, возникающие в моей работе',
          'en': 'I can effectively solve problems arising in my work',
        },
        factorId: 'reduced_efficacy',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q25 - physical_symptoms
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я стал(а) чаще болеть простудными и другими заболеваниями',
          'en': 'I have been getting sick more often with colds and other illnesses',
        },
        factorId: 'physical_symptoms',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q26 - cognitive_impairment
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Я забываю важные детали и информацию, связанную с работой',
          'en': 'I forget important details and information related to work',
        },
        factorId: 'cognitive_impairment',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q27 - motivation_loss
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Утром я просыпаюсь с мыслью \'опять этот день\'',
          'en': 'In the morning I wake up thinking \'another day\'',
        },
        factorId: 'motivation_loss',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q28 - work_environment (REVERSED)
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Вы получаете признание и поддержку от руководства?',
          'en': 'Do you receive recognition and support from management?',
        },
        factorId: 'work_environment',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q29 - emotional_exhaustion
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я чувствую себя истощённым(ой), когда думаю о работе',
          'en': 'I feel exhausted when I think about work',
        },
        factorId: 'emotional_exhaustion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q30 - depersonalization
      QuestionModel(
        id: 'q30',
        text: {
          'ru':
              'Я стал(а) более жёстким(ой) и безразличным(ой) в общении на работе',
          'en': 'I have become harsher and more indifferent in communication at work',
        },
        factorId: 'depersonalization',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q31 - reduced_efficacy
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Я чувствую, что мои достижения на работе незначительны',
          'en': 'I feel that my achievements at work are insignificant',
        },
        factorId: 'reduced_efficacy',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q32 - physical_symptoms
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'У меня появились проблемы с желудком или пищеварением',
          'en': 'I have developed stomach or digestion problems',
        },
        factorId: 'physical_symptoms',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q33 - cognitive_impairment
      QuestionModel(
        id: 'q33',
        text: {
          'ru':
              'Мне трудно следить за разговором или читать профессиональную литературу',
          'en':
              'I find it difficult to follow conversation or read professional literature',
        },
        factorId: 'cognitive_impairment',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q34 - motivation_loss
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Мне кажется, что я выбрал(а) не ту профессию',
          'en': 'I feel like I chose the wrong profession',
        },
        factorId: 'motivation_loss',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q35 - work_environment (REVERSED)
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Ваша рабочая нагрузка соответствует вашим возможностям?',
          'en': 'Does your workload match your capabilities?',
        },
        factorId: 'work_environment',
        isReversed: true,
        answers: _getWorkloadAnswers(),
      ),
      // Q36 - emotional_exhaustion
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Работа с людьми слишком сильно напрягает меня эмоционально',
          'en': 'Working with people is too emotionally draining for me',
        },
        factorId: 'emotional_exhaustion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q37 - depersonalization
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я перестал(а) переживать за результаты своей работы',
          'en': 'I have stopped caring about the results of my work',
        },
        factorId: 'depersonalization',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q38 - reduced_efficacy (REVERSED)
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Я горжусь своей работой и профессиональными достижениями',
          'en': 'I am proud of my work and professional achievements',
        },
        factorId: 'reduced_efficacy',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q39 - physical_symptoms
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'У меня изменился аппетит (переедание или потеря аппетита)',
          'en': 'My appetite has changed (overeating or loss of appetite)',
        },
        factorId: 'physical_symptoms',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q40 - cognitive_impairment (REVERSED)
      QuestionModel(
        id: 'q40',
        text: {
          'ru':
              'Я могу ясно мыслить и анализировать сложные проблемы на работе',
          'en': 'I can think clearly and analyze complex problems at work',
        },
        factorId: 'cognitive_impairment',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q41 - motivation_loss
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'Я считаю дни до выходных или отпуска',
          'en': 'I count the days until the weekend or vacation',
        },
        factorId: 'motivation_loss',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q42 - work_environment
      QuestionModel(
        id: 'q42',
        text: {
          'ru':
              'Рабочие задачи приходят в нерабочее время (звонки, сообщения, мысли о работе)?',
          'en':
              'Do work tasks come during non-working hours (calls, messages, thoughts about work)?',
        },
        factorId: 'work_environment',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q43 - emotional_exhaustion
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Я чувствую себя разбитым(ой), даже когда хорошо выспался(лась)',
          'en': 'I feel broken even when I slept well',
        },
        factorId: 'emotional_exhaustion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q44 - depersonalization
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Мне трудно сопереживать проблемам других людей на работе',
          'en': 'I find it difficult to empathize with other people\'s problems at work',
        },
        factorId: 'depersonalization',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q45 - reduced_efficacy (REVERSED)
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Я успешно выполняю свои рабочие задачи',
          'en': 'I successfully complete my work tasks',
        },
        factorId: 'reduced_efficacy',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q46 - physical_symptoms
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'У меня повысилось давление или появились проблемы с сердцем',
          'en': 'My blood pressure has increased or I have developed heart problems',
        },
        factorId: 'physical_symptoms',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q47 - cognitive_impairment
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Мне трудно удерживать в голове несколько задач одновременно',
          'en': 'I find it difficult to keep several tasks in mind at once',
        },
        factorId: 'cognitive_impairment',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q48 - motivation_loss
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Я откладываю рабочие задачи до последнего момента',
          'en': 'I postpone work tasks until the last moment',
        },
        factorId: 'motivation_loss',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q49 - work_environment
      QuestionModel(
        id: 'q49',
        text: {
          'ru': 'Сколько дней отпуска вы взяли за последний год?',
          'en': 'How many vacation days have you taken in the last year?',
        },
        factorId: 'work_environment',
        isReversed: false,
        answers: _getVacationDaysAnswers(),
      ),
      // Q50 - emotional_exhaustion
      QuestionModel(
        id: 'q50',
        text: {
          'ru': 'Я чувствую, что работа высасывает из меня всю энергию',
          'en': 'I feel that work drains all my energy',
        },
        factorId: 'emotional_exhaustion',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q51 - depersonalization
      QuestionModel(
        id: 'q51',
        text: {
          'ru':
              'Я воспринимаю людей на работе как источник проблем, а не личностей',
          'en': 'I perceive people at work as a source of problems, not personalities',
        },
        factorId: 'depersonalization',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),
      // Q52 - reduced_efficacy (REVERSED)
      QuestionModel(
        id: 'q52',
        text: {
          'ru': 'Я чувствую себя компетентным(ой) профессионалом в своей области',
          'en': 'I feel like a competent professional in my field',
        },
        factorId: 'reduced_efficacy',
        isReversed: true,
        answers: _getLikertAnswers(),
      ),
      // Q53 - work_environment (REVERSED)
      QuestionModel(
        id: 'q53',
        text: {
          'ru':
              'У вас есть ресурсы и поддержка для выполнения работы (оборудование, коллеги, информация)?',
          'en':
              'Do you have the resources and support to do your work (equipment, colleagues, information)?',
        },
        factorId: 'work_environment',
        isReversed: true,
        answers: _getResourcesAnswers(),
      ),
      // Q54 - work_environment (REVERSED)
      QuestionModel(
        id: 'q54',
        text: {
          'ru': 'Ваша работа соответствует вашим ценностям и убеждениям?',
          'en': 'Does your work match your values and beliefs?',
        },
        factorId: 'work_environment',
        isReversed: true,
        answers: _getValuesAnswers(),
      ),
    ];
  }

  /// Standard 5-point Likert scale answers
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совершенно не согласен',
          'en': 'Strongly Disagree',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не согласен',
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
          'ru': 'Скорее согласен',
          'en': 'Agree',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью согласен',
          'en': 'Strongly Agree',
        },
        score: 4,
      ),
    ];
  }

  /// Frequency scale answers
  static List<AnswerModel> _getFrequencyAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Никогда',
          'en': 'Never',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Редко',
          'en': 'Rarely',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Иногда',
          'en': 'Sometimes',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Часто',
          'en': 'Often',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Постоянно',
          'en': 'Constantly',
        },
        score: 4,
      ),
    ];
  }

  /// Q7 - Work hours answers
  static List<AnswerModel> _getWorkHoursAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Менее 40 часов',
          'en': 'Less than 40 hours',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': '40-45 часов',
          'en': '40-45 hours',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': '45-50 часов',
          'en': '45-50 hours',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': '50-60 часов',
          'en': '50-60 hours',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Более 60 часов',
          'en': 'More than 60 hours',
        },
        score: 4,
      ),
    ];
  }

  /// Q21 - Control answers (reversed)
  static List<AnswerModel> _getControlAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совершенно нет',
          'en': 'Not at all',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее нет',
          'en': 'Mostly not',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Частично',
          'en': 'Partially',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Скорее да',
          'en': 'Mostly yes',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью да',
          'en': 'Completely yes',
        },
        score: 4,
      ),
    ];
  }

  /// Q35 - Workload answers (reversed)
  static List<AnswerModel> _getWorkloadAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Полностью не соответствует',
          'en': 'Completely does not match',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не соответствует',
          'en': 'Mostly does not match',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Частично',
          'en': 'Partially',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Скорее соответствует',
          'en': 'Mostly matches',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью соответствует',
          'en': 'Completely matches',
        },
        score: 4,
      ),
    ];
  }

  /// Q49 - Vacation days answers
  static List<AnswerModel> _getVacationDaysAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Более 20 дней',
          'en': 'More than 20 days',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': '15-20 дней',
          'en': '15-20 days',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': '10-14 дней',
          'en': '10-14 days',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': '5-9 дней',
          'en': '5-9 days',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Менее 5 дней или вообще не брал(а)',
          'en': 'Less than 5 days or did not take any',
        },
        score: 4,
      ),
    ];
  }

  /// Q53 - Resources answers (reversed)
  static List<AnswerModel> _getResourcesAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совершенно нет',
          'en': 'Not at all',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее нет',
          'en': 'Mostly not',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Частично',
          'en': 'Partially',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Скорее да',
          'en': 'Mostly yes',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью да',
          'en': 'Completely yes',
        },
        score: 4,
      ),
    ];
  }

  /// Q54 - Values answers (reversed)
  static List<AnswerModel> _getValuesAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совершенно не соответствует',
          'en': 'Completely does not match',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не соответствует',
          'en': 'Mostly does not match',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Частично',
          'en': 'Partially',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Скорее соответствует',
          'en': 'Mostly matches',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью соответствует',
          'en': 'Completely matches',
        },
        score: 4,
      ),
    ];
  }

  /// Get all interpretations for all factors and levels
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'emotional_exhaustion': {
        'low': {
          'title_ru': 'Нормальный эмоциональный резерв',
          'title_en': 'Normal Emotional Reserve',
          'description_ru':
              'Вы сохраняете эмоциональные ресурсы. Работа не вызывает чувства опустошённости. Вы способны эмоционально восстанавливаться после рабочего дня.\n\nРекомендации:\n- Продолжайте практики эмоционального восстановления\n- Поддерживайте здоровые границы между работой и личной жизнью\n- Регулярные перерывы и отпуска',
          'description_en':
              'You maintain emotional resources. Work does not cause feelings of emptiness. You are able to emotionally recover after the workday.\n\nRecommendations:\n- Continue emotional recovery practices\n- Maintain healthy work-life boundaries\n- Regular breaks and vacations',
        },
        'medium': {
          'title_ru': 'Умеренное истощение',
          'title_en': 'Moderate Exhaustion',
          'description_ru':
              'Вы периодически чувствуете эмоциональное истощение. К концу дня или недели эмоциональная энергия на нуле. Восстановление требует больше времени.\n\nРекомендации:\n- Техники эмоциональной саморегуляции (дыхательные практики, медитация)\n- Эмоциональные границы: учитесь говорить "нет"\n- Регулярное восстановление: полноценный сон, выходные без работы\n- Рассмотрите работу с психологом\n- Супервизия для помогающих профессий',
          'description_en':
              'You periodically feel emotional exhaustion. By the end of the day or week, emotional energy is at zero. Recovery takes more time.\n\nRecommendations:\n- Emotional self-regulation techniques (breathing practices, meditation)\n- Emotional boundaries: learn to say "no"\n- Regular recovery: quality sleep, weekends without work\n- Consider working with a psychologist\n- Supervision for helping professions',
        },
        'high': {
          'title_ru': 'Критическое истощение',
          'title_en': 'Critical Exhaustion',
          'description_ru':
              'Вы находитесь в состоянии хронического эмоционального истощения. Чувство опустошённости присутствует постоянно, даже после отдыха. Требуется немедленное вмешательство.\n\nРекомендации:\n- СРОЧНО: возьмите отпуск минимум 2-3 недели\n- Обязательная психотерапия (КПТ, схема-терапия)\n- Возможна медикаментозная поддержка (антидепрессанты)\n- Радикальное снижение эмоциональной нагрузки\n- Практики глубокого восстановления: ретриты, санатории\n- Если работодатель не идёт навстречу - смена работы ради здоровья',
          'description_en':
              'You are in a state of chronic emotional exhaustion. Feeling of emptiness is constant, even after rest. Immediate intervention required.\n\nRecommendations:\n- URGENT: take vacation for at least 2-3 weeks\n- Mandatory psychotherapy (CBT, schema therapy)\n- Possible medication support (antidepressants)\n- Radical reduction of emotional load\n- Deep recovery practices: retreats, sanatoriums\n- If employer does not cooperate - change jobs for health',
        },
      },
      'depersonalization': {
        'low': {
          'title_ru': 'Сохранена эмпатия',
          'title_en': 'Empathy Preserved',
          'description_ru':
              'Вы сохраняете эмпатию и человечное отношение к людям на работе. Работа не превратила вас в циника. Вы видите в людях личностей.\n\nРекомендации:\n- Продолжайте культивировать эмпатию\n- Поддерживайте связь с коллегами\n- Напоминайте себе о смысле работы',
          'description_en':
              'You maintain empathy and humane attitude towards people at work. Work has not turned you into a cynic. You see people as personalities.\n\nRecommendations:\n- Continue cultivating empathy\n- Maintain connection with colleagues\n- Remind yourself of the meaning of work',
        },
        'medium': {
          'title_ru': 'Растущий цинизм',
          'title_en': 'Growing Cynicism',
          'description_ru':
              'Вы замечаете растущий цинизм, раздражение, эмоциональную отстранённость. Люди начинают восприниматься как объекты. Это защитный механизм от эмоциональной перегрузки.\n\nРекомендации:\n- Работа над эмпатией: практики перспективы другого человека\n- Напоминания о ценности людей и вашей роли\n- Группы поддержки с коллегами\n- Супервизия для восстановления профессиональной идентичности\n- Ограничьте взаимодействие с наиболее "триггерными" людьми',
          'description_en':
              'You notice growing cynicism, irritation, emotional detachment. People begin to be perceived as objects. This is a defense mechanism against emotional overload.\n\nRecommendations:\n- Work on empathy: perspective-taking practices\n- Reminders of people\'s value and your role\n- Support groups with colleagues\n- Supervision to restore professional identity\n- Limit interaction with most "triggering" people',
        },
        'high': {
          'title_ru': 'Глубокая деперсонализация',
          'title_en': 'Deep Depersonalization',
          'description_ru':
              'Вы развили глубокую деперсонализацию и цинизм. Вы отстранены, безразличны, воспринимаете людей как объекты. Это разрушает профессиональную идентичность.\n\nРекомендации:\n- Экзистенциальная терапия для поиска смысла\n- Честная оценка: можете ли вы продолжать без вреда себе и другим?\n- Пересмотр ценностей: соответствует ли работа вашим убеждениям?\n- Возможна смена специализации внутри профессии\n- Если цинизм глубокий - серьёзно рассмотрите смену профессии\n- Работа с моральной травмой',
          'description_en':
              'You have developed deep depersonalization and cynicism. You are detached, indifferent, perceive people as objects. This destroys professional identity.\n\nRecommendations:\n- Existential therapy to find meaning\n- Honest assessment: can you continue without harm to yourself and others?\n- Review values: does work match your beliefs?\n- Possible change of specialization within profession\n- If cynicism is deep - seriously consider changing profession\n- Work with moral injury',
        },
      },
      'reduced_efficacy': {
        'low': {
          'title_ru': 'Высокая эффективность',
          'title_en': 'High Efficacy',
          'description_ru':
              'Вы чувствуете себя компетентным профессионалом. Работа приносит чувство достижения и эффективности. Вы гордитесь своими результатами.\n\nРекомендации:\n- Продолжайте развиваться профессионально\n- Празднуйте достижения\n- Делитесь опытом с коллегами',
          'description_en':
              'You feel like a competent professional. Work brings a sense of achievement and efficacy. You are proud of your results.\n\nRecommendations:\n- Continue professional development\n- Celebrate achievements\n- Share experience with colleagues',
        },
        'medium': {
          'title_ru': 'Сомнения в компетентности',
          'title_en': 'Doubts in Competence',
          'description_ru':
              'Вы сомневаетесь в своей компетентности, замечаете снижение продуктивности. Это может быть искажённым восприятием из-за истощения или реальным снижением.\n\nРекомендации:\n- КПТ для работы с убеждениями о некомпетентности\n- Фокус на успехах и достижениях\n- Объективная оценка: реальное снижение или искажённое восприятие?\n- Возможно дополнительное обучение\n- Снижение нагрузки для восстановления качества\n- Менторство или коучинг',
          'description_en':
              'You doubt your competence, notice decreased productivity. This may be distorted perception due to exhaustion or real decline.\n\nRecommendations:\n- CBT for working with incompetence beliefs\n- Focus on successes and achievements\n- Objective assessment: real decline or distorted perception?\n- Possible additional training\n- Reduce workload to restore quality\n- Mentorship or coaching',
        },
        'high': {
          'title_ru': 'Глубокое чувство несостоятельности',
          'title_en': 'Deep Feeling of Inadequacy',
          'description_ru':
              'Вы глубоко убеждены в своей профессиональной несостоятельности. Вы делаете ошибки, не справляетесь, чувствуете себя самозванцем.\n\nРекомендации:\n- КРИТИЧЕСКИ ВАЖНО: определите, это выгорание или несоответствие\n- Если выгорание: восстановление через отдых и терапию\n- Если несоответствие: честная оценка и возможная смена роли\n- Временное снижение ответственности\n- Профессиональная помощь для восстановления уверенности\n- Если ничего не помогает - смена профессии как акт самосострадания',
          'description_en':
              'You are deeply convinced of your professional inadequacy. You make mistakes, fail to cope, feel like an impostor.\n\nRecommendations:\n- CRITICALLY IMPORTANT: determine if this is burnout or mismatch\n- If burnout: recovery through rest and therapy\n- If mismatch: honest assessment and possible role change\n- Temporary reduction of responsibility\n- Professional help to restore confidence\n- If nothing helps - career change as act of self-compassion',
        },
      },
      'physical_symptoms': {
        'low': {
          'title_ru': 'Хорошее физическое здоровье',
          'title_en': 'Good Physical Health',
          'description_ru':
              'Минимальные физические проявления стресса. Здоровье в норме, сон качественный, энергия адекватная.\n\nРекомендации:\n- Продолжайте заботиться о физическом здоровье\n- Регулярная физическая активность\n- Качественный сон',
          'description_en':
              'Minimal physical manifestations of stress. Health is normal, sleep is quality, energy is adequate.\n\nRecommendations:\n- Continue caring for physical health\n- Regular physical activity\n- Quality sleep',
        },
        'medium': {
          'title_ru': 'Умеренные симптомы',
          'title_en': 'Moderate Symptoms',
          'description_ru':
              'Появляются физические симптомы: усталость, боли, нарушения сна, частые простуды. Тело сигнализирует о перегрузке.\n\nРекомендации:\n- Медицинское обследование\n- Улучшение гигиены сна: режим, темнота, отсутствие экранов\n- Физическая активность: 30 минут умеренной нагрузки 5 раз в неделю\n- Снижение рабочей нагрузки\n- Эргономика рабочего места\n- Техники релаксации',
          'description_en':
              'Physical symptoms appear: fatigue, pain, sleep disturbances, frequent colds. Body signals overload.\n\nRecommendations:\n- Medical examination\n- Improve sleep hygiene: routine, darkness, no screens\n- Physical activity: 30 minutes moderate load 5 times per week\n- Reduce workload\n- Workplace ergonomics\n- Relaxation techniques',
        },
        'high': {
          'title_ru': 'Серьёзные проблемы со здоровьем',
          'title_en': 'Serious Health Problems',
          'description_ru':
              'Серьёзные хронические симптомы: постоянная усталость, хронические боли, серьёзные нарушения сна, возможны проблемы с сердцем, давлением, ЖКТ.\n\nРекомендации:\n- ОБЯЗАТЕЛЬНО: полное медицинское обследование\n- Возможен больничный лист\n- Радикальное изменение режима работы\n- Физиотерапия, массаж, ЛФК\n- Строгий режим сна: 7-9 часов\n- Питание, витамины по назначению врача\n- Если работодатель не снижает нагрузку - увольнение ради здоровья',
          'description_en':
              'Serious chronic symptoms: constant fatigue, chronic pain, serious sleep disturbances, possible heart, blood pressure, digestive problems.\n\nRecommendations:\n- MANDATORY: complete medical examination\n- Possible sick leave\n- Radical change in work schedule\n- Physiotherapy, massage, exercise therapy\n- Strict sleep schedule: 7-9 hours\n- Nutrition, vitamins as prescribed by doctor\n- If employer does not reduce load - resign for health',
        },
      },
      'cognitive_impairment': {
        'low': {
          'title_ru': 'Нормальные когнитивные функции',
          'title_en': 'Normal Cognitive Functions',
          'description_ru':
              'Концентрация, память, принятие решений в норме. Вы ясно мыслите и эффективно обрабатываете информацию.\n\nРекомендации:\n- Продолжайте когнитивные практики\n- Защищайте время для глубокой работы\n- Качественный сон - основа когнитивного здоровья',
          'description_en':
              'Concentration, memory, decision-making are normal. You think clearly and process information effectively.\n\nRecommendations:\n- Continue cognitive practices\n- Protect time for deep work\n- Quality sleep - foundation of cognitive health',
        },
        'medium': {
          'title_ru': 'Снижение когнитивных функций',
          'title_en': 'Cognitive Function Decline',
          'description_ru':
              'Заметное снижение: забывчивость, трудности с концентрацией, ошибки, сложности с многозадачностью. Результат хронического стресса.\n\nРекомендации:\n- Когнитивные упражнения\n- КРИТИЧЕСКИ ВАЖНО: улучшение сна\n- Снижение многозадачности: одна задача за раз\n- Списки, напоминания, структурирование\n- Перерывы каждые 50 минут\n- Ограничение информационного потока\n- Если не улучшается - консультация невролога',
          'description_en':
              'Noticeable decline: forgetfulness, concentration difficulties, errors, multitasking problems. Result of chronic stress.\n\nRecommendations:\n- Cognitive exercises\n- CRITICALLY IMPORTANT: sleep improvement\n- Reduce multitasking: one task at a time\n- Lists, reminders, structuring\n- Breaks every 50 minutes\n- Limit information flow\n- If no improvement - neurologist consultation',
        },
        'high': {
          'title_ru': 'Серьёзные когнитивные нарушения',
          'title_en': 'Serious Cognitive Impairment',
          'description_ru':
              'Серьёзные проблемы с памятью, концентрацией, решениями, обработкой информации. Возможны опасные ошибки.\n\nРекомендации:\n- ОБЯЗАТЕЛЬНО: обследование у невролога и/или психиатра\n- Возможна медикаментозная поддержка (ноотропы, антидепрессанты)\n- Временное снижение ответственности\n- Длительный отдых (минимум месяц)\n- Полное исключение алкоголя\n- Когнитивная реабилитация\n- Если не проходит - возможно, это не только выгорание',
          'description_en':
              'Serious problems with memory, concentration, decisions, information processing. Possible dangerous errors.\n\nRecommendations:\n- MANDATORY: examination by neurologist and/or psychiatrist\n- Possible medication support (nootropics, antidepressants)\n- Temporary reduction of responsibility\n- Long rest (minimum one month)\n- Complete elimination of alcohol\n- Cognitive rehabilitation\n- If does not pass - possibly not just burnout',
        },
      },
      'motivation_loss': {
        'low': {
          'title_ru': 'Сохранена мотивация',
          'title_en': 'Motivation Preserved',
          'description_ru':
              'Работа имеет смысл и приносит удовлетворение. Вы понимаете ценность того, что делаете, и чувствуете вовлечённость.\n\nРекомендации:\n- Продолжайте напоминать себе о смысле работы\n- Празднуйте достижения\n- Связывайте ежедневные задачи с большой миссией',
          'description_en':
              'Work has meaning and brings satisfaction. You understand the value of what you do and feel engaged.\n\nRecommendations:\n- Continue reminding yourself of work\'s meaning\n- Celebrate achievements\n- Connect daily tasks with big mission',
        },
        'medium': {
          'title_ru': 'Снижение мотивации',
          'title_en': 'Motivation Decline',
          'description_ru':
              'Мотивация снижается, работа теряет привлекательность, мысли об увольнении. Вопрос "зачем?" всё чаще. Смысл размывается.\n\nРекомендации:\n- Поиск смысла: что изначально привлекло в профессию?\n- Пересмотр целей: возможно, нужны новые задачи\n- Возможна смена специализации внутри профессии\n- Поиск смысла вне работы (волонтёрство, хобби)\n- Экзистенциальные практики: дневник смысла\n- Связь с коллегами, которые увлечены работой',
          'description_en':
              'Motivation declines, work loses appeal, thoughts of quitting. Question "why?" more often. Meaning blurs.\n\nRecommendations:\n- Search for meaning: what initially attracted to profession?\n- Review goals: possibly need new tasks\n- Possible change of specialization within profession\n- Search for meaning outside work (volunteering, hobbies)\n- Existential practices: meaning journal\n- Connect with colleagues enthusiastic about work',
        },
        'high': {
          'title_ru': 'Полная потеря смысла',
          'title_en': 'Complete Loss of Meaning',
          'description_ru':
              'Полная потеря смысла в работе. Экзистенциальный кризис профессиональной идентичности. Не понимаете, зачем делаете то, что делаете.\n\nРекомендации:\n- Экзистенциальная терапия или логотерапия\n- Честный вопрос: хотите ли восстановить смысл в этой профессии?\n- Карьерное консультирование\n- Sabbatical (длительный отпуск) для переосмысления\n- Возможно, пришло время смены профессии - это нормально\n- Помните: уход из профессии - не поражение, а акт самопознания',
          'description_en':
              'Complete loss of meaning in work. Existential crisis of professional identity. Do not understand why you do what you do.\n\nRecommendations:\n- Existential therapy or logotherapy\n- Honest question: do you want to restore meaning in this profession?\n- Career counseling\n- Sabbatical (long leave) for rethinking\n- Perhaps time for career change - it is normal\n- Remember: leaving profession is not defeat, but act of self-knowledge',
        },
      },
      'work_environment': {
        'low': {
          'title_ru': 'Здоровая рабочая среда',
          'title_en': 'Healthy Work Environment',
          'description_ru':
              'Здоровая рабочая среда с адекватной нагрузкой, достаточными ресурсами, поддерживающим руководством, соответствием ценностей.\n\nРекомендации:\n- Продолжайте поддерживать здоровую среду\n- Цените своё рабочее место\n- Помогайте коллегам создавать здоровые границы',
          'description_en':
              'Healthy work environment with adequate workload, sufficient resources, supportive management, values alignment.\n\nRecommendations:\n- Continue maintaining healthy environment\n- Appreciate your workplace\n- Help colleagues create healthy boundaries',
        },
        'medium': {
          'title_ru': 'Проблемная среда',
          'title_en': 'Problematic Environment',
          'description_ru':
              'Проблемная среда: высокая нагрузка, недостаток ресурсов, слабая поддержка, работа в выходные, несоответствие ценностей.\n\nРекомендации:\n- Переговоры с руководством о снижении нагрузки\n- Установление границ: отказ от работы в выходные\n- Делегирование, где возможно\n- Поиск поддержки у коллег\n- Документирование проблем для HR\n- Если руководство не реагирует - подготовка к смене работы',
          'description_en':
              'Problematic environment: high workload, lack of resources, weak support, weekend work, values mismatch.\n\nRecommendations:\n- Negotiations with management about reducing workload\n- Setting boundaries: refusing weekend work\n- Delegation where possible\n- Seeking colleague support\n- Documenting problems for HR\n- If management does not respond - prepare for job change',
        },
        'high': {
          'title_ru': 'Токсичная среда',
          'title_en': 'Toxic Environment',
          'description_ru':
              'Токсичная среда: экстремальная нагрузка (60+ часов), отсутствие ресурсов, токсичное руководство, полное несоответствие ценностей. Проблема в организации.\n\nРекомендации:\n- ЧЕСТНО ОСОЗНАЙТЕ: вы не можете "перебороть" токсичную организацию\n- Активный поиск новой работы - это самосохранение\n- Если возможно - увольнение без новой работы (здоровье дороже)\n- Документирование проблем\n- Объединение с коллегами\n- Установление максимально жёстких границ до ухода\n- Помните: токсичная среда не изменится, изменитесь вы - уйдя',
          'description_en':
              'Toxic environment: extreme workload (60+ hours), lack of resources, toxic management, complete values mismatch. Problem is in organization.\n\nRecommendations:\n- HONESTLY REALIZE: you cannot "overcome" toxic organization\n- Active job search - this is self-preservation\n- If possible - resign without new job (health is more valuable)\n- Document problems\n- Unite with colleagues\n- Set maximum boundaries before leaving\n- Remember: toxic environment will not change, you will change - by leaving',
        },
      },
    };
  }
}
