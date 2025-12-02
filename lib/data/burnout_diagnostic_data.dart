import '../models/test_model.dart';
import '../models/test_profile_model.dart';

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

  /// Определить профиль на основе процентов по шкалам
  static String determineProfile(Map<String, double> percentages) {
    // Вычисляем средний уровень выгорания
    final factors = [
      'emotional_exhaustion',
      'depersonalization',
      'reduced_efficacy',
      'physical_symptoms',
      'cognitive_impairment',
      'motivation_loss',
      'work_environment'
    ];

    double total = 0;
    int count = 0;
    for (final factor in factors) {
      if (percentages.containsKey(factor)) {
        total += percentages[factor]!;
        count++;
      }
    }

    final averageLevel = count > 0 ? total / count : 0.0;

    // Определяем профиль на основе среднего уровня и доминирующего фактора
    if (averageLevel <= 25) {
      return 'profile_minimal';
    } else if (averageLevel <= 40) {
      return 'profile_mild';
    } else if (averageLevel <= 60) {
      // Умеренное выгорание - определяем доминирующий фактор
      String? dominantFactor;
      double maxValue = 0;
      for (final factor in factors) {
        final value = percentages[factor] ?? 0;
        if (value > maxValue) {
          maxValue = value;
          dominantFactor = factor;
        }
      }

      // Профили по доминирующему компоненту
      switch (dominantFactor) {
        case 'emotional_exhaustion':
          return 'profile_emotional_exhaustion';
        case 'depersonalization':
          return 'profile_cynicism';
        case 'reduced_efficacy':
          return 'profile_inefficacy';
        case 'physical_symptoms':
          return 'profile_somatic';
        case 'cognitive_impairment':
          return 'profile_cognitive';
        case 'motivation_loss':
          return 'profile_demotivation';
        case 'work_environment':
          return 'profile_work_overload';
        default:
          return 'profile_moderate';
      }
    } else if (averageLevel <= 75) {
      return 'profile_severe';
    } else {
      return 'profile_critical';
    }
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Все профили для теста выгорания
  static final Map<String, TestProfile> _profiles = {
    'profile_minimal': TestProfile(
      id: 'profile_minimal',
      name: {
        'ru': 'Устойчивый профессионал',
        'en': 'Resilient Professional',
      },
      description: {
        'ru': 'У вас минимальные признаки профессионального выгорания. Вы эффективно справляетесь со стрессом и сохраняете баланс между работой и личной жизнью.',
        'en': 'You show minimal signs of professional burnout. You effectively manage stress and maintain work-life balance.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают низкий уровень по всем компонентам выгорания: эмоциональное истощение, цинизм, снижение эффективности и физические симптомы находятся в норме.',
        'en': 'Your answers show low levels across all burnout components: emotional exhaustion, cynicism, reduced efficacy, and physical symptoms are within normal range.',
      },
      strengths: {
        'ru': [
          'Эффективное управление стрессом',
          'Здоровые границы между работой и личной жизнью',
          'Сохранение эмпатии и вовлечённости',
          'Хорошее физическое и ментальное здоровье',
          'Чёткое понимание профессионального смысла',
        ],
        'en': [
          'Effective stress management',
          'Healthy work-life boundaries',
          'Preserved empathy and engagement',
          'Good physical and mental health',
          'Clear understanding of professional meaning',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможна недооценка начальных признаков стресса',
          'Риск "выгорания помощника" при заботе о других',
        ],
        'en': [
          'Possible underestimation of initial stress signs',
          'Risk of "helper burnout" when caring for others',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте практики восстановления, которые работают для вас',
          'Сохраняйте здоровые границы с работой',
          'Регулярно проходите самодиагностику (раз в 3-6 месяцев)',
          'Поддерживайте коллег, которые могут испытывать выгорание',
          'Инвестируйте в профилактику: отдых, хобби, социальные связи',
        ],
        'en': [
          'Continue recovery practices that work for you',
          'Maintain healthy work boundaries',
          'Regularly self-assess (every 3-6 months)',
          'Support colleagues who may be experiencing burnout',
          'Invest in prevention: rest, hobbies, social connections',
        ],
      },
      tryToday: {
        'ru': 'Поблагодарите себя за поддержание здорового баланса и подумайте, как вы можете помочь коллегам сохранить их ресурсы.',
        'en': 'Thank yourself for maintaining healthy balance and think about how you can help colleagues preserve their resources.',
      },
      inspiringConclusion: {
        'ru': 'Ваша профессиональная устойчивость — это ценный ресурс. Продолжайте заботиться о себе, и вы сможете долго и эффективно работать в своей сфере.',
        'en': 'Your professional resilience is a valuable resource. Continue caring for yourself, and you will be able to work effectively in your field for a long time.',
      },
    ),

    'profile_mild': TestProfile(
      id: 'profile_mild',
      name: {
        'ru': 'Начальный стресс',
        'en': 'Initial Stress',
      },
      description: {
        'ru': 'У вас есть начальные признаки профессионального стресса. Это нормальная реакция на рабочие требования, но важно обратить внимание на восстановление.',
        'en': 'You have initial signs of professional stress. This is a normal response to work demands, but it is important to focus on recovery.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают умеренное повышение некоторых показателей выгорания, но в целом уровень остаётся управляемым.',
        'en': 'Your answers show moderate elevation of some burnout indicators, but overall the level remains manageable.',
      },
      strengths: {
        'ru': [
          'Сохранение профессиональной мотивации',
          'Способность распознавать стресс',
          'Ресурсы для восстановления ещё доступны',
          'Профессиональная эффективность сохранена',
        ],
        'en': [
          'Preserved professional motivation',
          'Ability to recognize stress',
          'Recovery resources still available',
          'Professional effectiveness preserved',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Периодическая усталость к концу недели',
          'Временное снижение энтузиазма',
          'Начальные нарушения сна или аппетита',
        ],
        'en': [
          'Periodic fatigue by end of week',
          'Temporary decrease in enthusiasm',
          'Initial sleep or appetite disturbances',
        ],
      },
      recommendations: {
        'ru': [
          'Уделите особое внимание качеству сна (7-9 часов)',
          'Введите регулярные перерывы в рабочий день (каждые 50 минут)',
          'Практикуйте технику "отключения" от работы после рабочего дня',
          'Увеличьте физическую активность — минимум 30 минут 5 раз в неделю',
          'Обсудите нагрузку с руководством, если она чрезмерна',
        ],
        'en': [
          'Pay special attention to sleep quality (7-9 hours)',
          'Introduce regular breaks during workday (every 50 minutes)',
          'Practice "disconnecting" from work after hours',
          'Increase physical activity — at least 30 minutes 5 times a week',
          'Discuss workload with management if excessive',
        ],
      },
      tryToday: {
        'ru': 'Сегодня вечером полностью отключитесь от рабочих коммуникаций. Посвятите время тому, что вас восстанавливает: прогулка, хобби, общение с близкими.',
        'en': 'Tonight, completely disconnect from work communications. Spend time on what restores you: a walk, a hobby, time with loved ones.',
      },
      inspiringConclusion: {
        'ru': 'Вы вовремя заметили сигналы стресса. Небольшие изменения сейчас предотвратят серьёзные проблемы в будущем. У вас есть все ресурсы для восстановления!',
        'en': 'You noticed stress signals in time. Small changes now will prevent serious problems in the future. You have all the resources for recovery!',
      },
    ),

    'profile_emotional_exhaustion': TestProfile(
      id: 'profile_emotional_exhaustion',
      name: {
        'ru': 'Эмоциональное истощение',
        'en': 'Emotional Exhaustion',
      },
      description: {
        'ru': 'Ваш основной симптом — эмоциональное истощение. Вы чувствуете себя опустошённым, эмоции "выгорели", и восстановление даётся с трудом.',
        'en': 'Your main symptom is emotional exhaustion. You feel drained, emotions are "burned out", and recovery is difficult.',
      },
      whyThisProfile: {
        'ru': 'Среди всех компонентов выгорания у вас доминирует эмоциональное истощение. Это часто бывает у людей помогающих профессий и тех, кто много работает с людьми.',
        'en': 'Among all burnout components, emotional exhaustion dominates. This is common in helping professions and those who work extensively with people.',
      },
      strengths: {
        'ru': [
          'Способность осознавать своё состояние',
          'Сохранение профессиональных навыков',
          'Понимание ценности эмоционального здоровья',
        ],
        'en': [
          'Ability to recognize your condition',
          'Preserved professional skills',
          'Understanding the value of emotional health',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Чувство опустошённости после работы',
          'Трудности с эмоциональным восстановлением',
          'Страх или тревога перед рабочим днём',
          'Ощущение "эмоционального онемения"',
        ],
        'en': [
          'Feeling of emptiness after work',
          'Difficulty with emotional recovery',
          'Fear or anxiety before workday',
          'Feeling of "emotional numbness"',
        ],
      },
      recommendations: {
        'ru': [
          'Техники эмоциональной саморегуляции: дыхательные практики, медитация осознанности',
          'Установите чёткие эмоциональные границы: научитесь говорить "нет"',
          'Снизьте эмоциональную нагрузку на работе — обсудите с руководством',
          'Обязательный отдых: выходные без работы, полноценный отпуск',
          'Рассмотрите работу с психологом или психотерапевтом',
          'Для помогающих профессий: супервизия обязательна',
        ],
        'en': [
          'Emotional self-regulation techniques: breathing practices, mindfulness meditation',
          'Set clear emotional boundaries: learn to say "no"',
          'Reduce emotional load at work — discuss with management',
          'Mandatory rest: weekends without work, proper vacation',
          'Consider working with a psychologist or psychotherapist',
          'For helping professions: supervision is mandatory',
        ],
      },
      tryToday: {
        'ru': 'Практикуйте 10-минутную медитацию или дыхательное упражнение 4-7-8 (вдох 4 секунды, задержка 7, выдох 8). Это поможет "разрядить" эмоциональное напряжение.',
        'en': 'Practice 10-minute meditation or 4-7-8 breathing exercise (inhale 4 seconds, hold 7, exhale 8). This will help "discharge" emotional tension.',
      },
      inspiringConclusion: {
        'ru': 'Эмоциональное истощение — это сигнал, что вы много отдавали другим. Теперь пришло время позаботиться о себе. Ваши эмоции восстановятся, когда вы дадите себе на это право.',
        'en': 'Emotional exhaustion is a signal that you have given a lot to others. Now it is time to take care of yourself. Your emotions will recover when you give yourself permission to do so.',
      },
    ),

    'profile_cynicism': TestProfile(
      id: 'profile_cynicism',
      name: {
        'ru': 'Деперсонализация и цинизм',
        'en': 'Depersonalization and Cynicism',
      },
      description: {
        'ru': 'Ваш основной симптом — деперсонализация и цинизм. Вы стали более отстранённым, равнодушным, люди воспринимаются как "объекты" или источники проблем.',
        'en': 'Your main symptom is depersonalization and cynicism. You have become more detached, indifferent, people are perceived as "objects" or sources of problems.',
      },
      whyThisProfile: {
        'ru': 'Деперсонализация — это защитный механизм психики от эмоциональной перегрузки. Но она разрушает профессиональные отношения и вашу идентичность.',
        'en': 'Depersonalization is a psychological defense mechanism against emotional overload. But it destroys professional relationships and your identity.',
      },
      strengths: {
        'ru': [
          'Сохранение профессиональной дистанции (в умеренной форме)',
          'Защита от эмоционального выгорания (частично)',
          'Способность видеть ситуацию со стороны',
        ],
        'en': [
          'Maintaining professional distance (in moderate form)',
          'Protection from emotional burnout (partial)',
          'Ability to see situation from outside',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Эмоциональная отстранённость от коллег и клиентов',
          'Цинизм и сарказм в общении',
          'Восприятие людей как "случаев" или "проблем"',
          'Риск профессиональных ошибок из-за равнодушия',
        ],
        'en': [
          'Emotional detachment from colleagues and clients',
          'Cynicism and sarcasm in communication',
          'Perceiving people as "cases" or "problems"',
          'Risk of professional errors due to indifference',
        ],
      },
      recommendations: {
        'ru': [
          'Практики развития эмпатии: представляйте ситуацию глазами другого человека',
          'Напоминайте себе о ценности каждого человека',
          'Группы поддержки с коллегами — вы не одиноки',
          'Профессиональная супервизия для восстановления идентичности',
          'Ограничьте контакт с наиболее сложными людьми, если возможно',
          'Честно спросите себя: может ли вы продолжать без вреда себе и другим?',
        ],
        'en': [
          'Empathy development practices: imagine situation through another person\'s eyes',
          'Remind yourself of each person\'s value',
          'Support groups with colleagues — you are not alone',
          'Professional supervision to restore identity',
          'Limit contact with most difficult people if possible',
          'Honestly ask yourself: can you continue without harm to yourself and others?',
        ],
      },
      tryToday: {
        'ru': 'Выберите одного человека на работе и попробуйте увидеть его как личность: что его волнует? какие у него мечты? чем он уникален? Это первый шаг к восстановлению эмпатии.',
        'en': 'Choose one person at work and try to see them as a person: what worries them? what are their dreams? what makes them unique? This is the first step to restoring empathy.',
      },
      inspiringConclusion: {
        'ru': 'Цинизм — это не ваша истинная природа, а защитная реакция. За этой стеной по-прежнему живёт человек, который выбрал свою профессию с добрыми намерениями. Его можно вернуть.',
        'en': 'Cynicism is not your true nature, but a defensive reaction. Behind this wall still lives a person who chose their profession with good intentions. They can be brought back.',
      },
    ),

    'profile_inefficacy': TestProfile(
      id: 'profile_inefficacy',
      name: {
        'ru': 'Снижение эффективности',
        'en': 'Reduced Efficacy',
      },
      description: {
        'ru': 'Ваш основной симптом — ощущение профессиональной несостоятельности. Вы сомневаетесь в своей компетентности, чувствуете, что не справляетесь с работой.',
        'en': 'Your main symptom is feeling of professional inadequacy. You doubt your competence, feel that you are not coping with work.',
      },
      whyThisProfile: {
        'ru': 'Снижение профессиональной эффективности может быть как результатом выгорания (искажённое восприятие), так и реальным следствием хронического стресса.',
        'en': 'Reduced professional efficacy can be either a result of burnout (distorted perception) or a real consequence of chronic stress.',
      },
      strengths: {
        'ru': [
          'Высокие стандарты качества работы',
          'Критическое мышление и самооценка',
          'Стремление к профессиональному росту',
        ],
        'en': [
          'High work quality standards',
          'Critical thinking and self-assessment',
          'Desire for professional growth',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Синдром самозванца',
          'Перфекционизм и самокритика',
          'Сомнения в ценности своей работы',
          'Увеличение количества ошибок',
        ],
        'en': [
          'Impostor syndrome',
          'Perfectionism and self-criticism',
          'Doubts about work value',
          'Increased number of errors',
        ],
      },
      recommendations: {
        'ru': [
          'КПТ для работы с убеждениями о некомпетентности',
          'Ведите дневник достижений — записывайте ежедневные успехи',
          'Объективная оценка: это реальное снижение или искажённое восприятие?',
          'Снижение нагрузки для восстановления качества работы',
          'Менторство или профессиональный коучинг',
          'Если снижение реальное — возможно дополнительное обучение',
        ],
        'en': [
          'CBT for working with incompetence beliefs',
          'Keep achievement journal — record daily successes',
          'Objective assessment: is this real decline or distorted perception?',
          'Reduce workload to restore work quality',
          'Mentorship or professional coaching',
          'If decline is real — additional training may be needed',
        ],
      },
      tryToday: {
        'ru': 'Запишите три профессиональных достижения за последний месяц. Даже маленькие победы считаются! Это поможет восстановить реалистичное восприятие себя.',
        'en': 'Write down three professional achievements from the last month. Even small wins count! This will help restore realistic self-perception.',
      },
      inspiringConclusion: {
        'ru': 'Ваше чувство несостоятельности — это не правда о вас, а симптом выгорания. За усталостью скрывается компетентный профессионал. Отдых и поддержка помогут ему снова проявиться.',
        'en': 'Your feeling of inadequacy is not the truth about you, but a symptom of burnout. Behind the fatigue hides a competent professional. Rest and support will help them reappear.',
      },
    ),

    'profile_somatic': TestProfile(
      id: 'profile_somatic',
      name: {
        'ru': 'Физические симптомы',
        'en': 'Physical Symptoms',
      },
      description: {
        'ru': 'Ваш основной симптом — физические проявления стресса. Хроническая усталость, боли, нарушения сна, проблемы с иммунитетом сигнализируют о перегрузке организма.',
        'en': 'Your main symptom is physical manifestations of stress. Chronic fatigue, pain, sleep disturbances, immune problems signal body overload.',
      },
      whyThisProfile: {
        'ru': 'Тело часто "говорит" о выгорании раньше, чем психика. Физические симптомы — это SOS-сигнал вашего организма.',
        'en': 'The body often "speaks" about burnout before the psyche. Physical symptoms are an SOS signal from your body.',
      },
      strengths: {
        'ru': [
          'Связь с телесными ощущениями',
          'Способность распознавать физические сигналы',
          'Понимание необходимости заботы о здоровье',
        ],
        'en': [
          'Connection with bodily sensations',
          'Ability to recognize physical signals',
          'Understanding the need for health care',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Хроническая усталость, не проходящая после отдыха',
          'Головные боли, боли в спине и шее',
          'Нарушения сна: бессонница или гиперсомния',
          'Частые простуды, сниженный иммунитет',
          'Проблемы с ЖКТ, изменения аппетита',
        ],
        'en': [
          'Chronic fatigue that does not go away after rest',
          'Headaches, back and neck pain',
          'Sleep disturbances: insomnia or hypersomnia',
          'Frequent colds, reduced immunity',
          'Digestive problems, appetite changes',
        ],
      },
      recommendations: {
        'ru': [
          'ОБЯЗАТЕЛЬНО: пройдите полное медицинское обследование',
          'Улучшите гигиену сна: режим, темнота, прохлада, никаких экранов',
          'Физическая активность: 30 минут умеренной нагрузки 5 раз в неделю',
          'Эргономика рабочего места: осанка, освещение, перерывы',
          'Техники телесной релаксации: прогрессивная мышечная релаксация',
          'Массаж, физиотерапия, ЛФК по назначению врача',
        ],
        'en': [
          'MANDATORY: get a complete medical examination',
          'Improve sleep hygiene: routine, darkness, coolness, no screens',
          'Physical activity: 30 minutes of moderate load 5 times a week',
          'Workplace ergonomics: posture, lighting, breaks',
          'Body relaxation techniques: progressive muscle relaxation',
          'Massage, physiotherapy, exercise therapy as prescribed by doctor',
        ],
      },
      tryToday: {
        'ru': 'Проведите сканирование тела: лягте удобно, закройте глаза и медленно "пройдитесь" вниманием от макушки до пальцев ног. Отметьте зоны напряжения и попробуйте их расслабить.',
        'en': 'Do a body scan: lie down comfortably, close your eyes, and slowly "walk" attention from crown to toes. Note tension areas and try to relax them.',
      },
      inspiringConclusion: {
        'ru': 'Ваше тело — ваш союзник. Оно честно сигнализирует о перегрузке. Слушайте его, заботьтесь о нём, и оно восстановит силы для того, что для вас действительно важно.',
        'en': 'Your body is your ally. It honestly signals overload. Listen to it, take care of it, and it will restore strength for what really matters to you.',
      },
    ),

    'profile_cognitive': TestProfile(
      id: 'profile_cognitive',
      name: {
        'ru': 'Когнитивные нарушения',
        'en': 'Cognitive Impairment',
      },
      description: {
        'ru': 'Ваш основной симптом — когнитивные нарушения. Проблемы с концентрацией, памятью, принятием решений — результат хронического стресса.',
        'en': 'Your main symptom is cognitive impairment. Problems with concentration, memory, decision-making — result of chronic stress.',
      },
      whyThisProfile: {
        'ru': 'Когнитивные функции очень чувствительны к стрессу. Хроническая перегрузка истощает ресурсы мозга для высших психических функций.',
        'en': 'Cognitive functions are very sensitive to stress. Chronic overload depletes brain resources for higher mental functions.',
      },
      strengths: {
        'ru': [
          'Осознание когнитивных изменений',
          'Сохранение базовых профессиональных навыков',
          'Понимание связи стресса и мышления',
        ],
        'en': [
          'Awareness of cognitive changes',
          'Preservation of basic professional skills',
          'Understanding stress-thinking connection',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Трудности с концентрацией и вниманием',
          'Забывчивость, проблемы с рабочей памятью',
          'Сложности с принятием решений',
          'Увеличение количества ошибок',
          'Трудности с многозадачностью',
        ],
        'en': [
          'Difficulty with concentration and attention',
          'Forgetfulness, working memory problems',
          'Decision-making difficulties',
          'Increased number of errors',
          'Difficulty with multitasking',
        ],
      },
      recommendations: {
        'ru': [
          'КРИТИЧЕСКИ ВАЖНО: улучшите качество сна — это основа когнитивного здоровья',
          'Снизьте многозадачность: одна задача за раз',
          'Используйте внешние инструменты: списки, напоминания, структурирование',
          'Перерывы каждые 50 минут работы',
          'Ограничьте информационный поток: меньше новостей, соцсетей',
          'Когнитивные упражнения после восстановления',
          'Если не улучшается — консультация невролога',
        ],
        'en': [
          'CRITICALLY IMPORTANT: improve sleep quality — this is the foundation of cognitive health',
          'Reduce multitasking: one task at a time',
          'Use external tools: lists, reminders, structuring',
          'Breaks every 50 minutes of work',
          'Limit information flow: less news, social media',
          'Cognitive exercises after recovery',
          'If no improvement — neurologist consultation',
        ],
      },
      tryToday: {
        'ru': 'Выберите одну важную задачу и посвятите ей 25 минут без отвлечений (техника Помодоро). Отключите уведомления. Это тренирует фокусировку внимания.',
        'en': 'Choose one important task and dedicate 25 minutes to it without distractions (Pomodoro technique). Turn off notifications. This trains focus.',
      },
      inspiringConclusion: {
        'ru': 'Когнитивные функции восстанавливаются! Ваш мозг обладает нейропластичностью. Дайте ему отдых, качественный сон и снижение нагрузки — и ясность мышления вернётся.',
        'en': 'Cognitive functions recover! Your brain has neuroplasticity. Give it rest, quality sleep, and reduced load — and clarity of thinking will return.',
      },
    ),

    'profile_demotivation': TestProfile(
      id: 'profile_demotivation',
      name: {
        'ru': 'Потеря мотивации и смысла',
        'en': 'Loss of Motivation and Meaning',
      },
      description: {
        'ru': 'Ваш основной симптом — потеря профессионального смысла. Вы не понимаете, зачем делаете свою работу, энтузиазм исчез, мысли об увольнении становятся навязчивыми.',
        'en': 'Your main symptom is loss of professional meaning. You do not understand why you do your work, enthusiasm is gone, thoughts of quitting become obsessive.',
      },
      whyThisProfile: {
        'ru': 'Потеря смысла — это экзистенциальный компонент выгорания. Когда работа перестаёт отвечать на вопрос "зачем?", мотивация исчезает.',
        'en': 'Loss of meaning is the existential component of burnout. When work stops answering the question "why?", motivation disappears.',
      },
      strengths: {
        'ru': [
          'Способность задавать глубокие вопросы о смысле',
          'Честность с собой о своих чувствах',
          'Готовность к изменениям',
        ],
        'en': [
          'Ability to ask deep questions about meaning',
          'Honesty with yourself about your feelings',
          'Readiness for change',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Экзистенциальный вакуум: "зачем я это делаю?"',
          'Прокрастинация и откладывание задач',
          'Мечты об увольнении или смене профессии',
          'Ощущение "хождения по кругу"',
        ],
        'en': [
          'Existential vacuum: "why am I doing this?"',
          'Procrastination and task postponement',
          'Dreams of quitting or changing profession',
          'Feeling of "going in circles"',
        ],
      },
      recommendations: {
        'ru': [
          'Вспомните, что изначально привлекло вас в профессию',
          'Пересмотрите цели: возможно, нужны новые вызовы',
          'Смена специализации внутри профессии может помочь',
          'Поиск смысла вне работы: волонтёрство, хобби, творчество',
          'Экзистенциальная терапия или логотерапия',
          'Sabbatical (длительный отпуск) для переосмысления',
          'Если ничего не помогает — смена профессии — это не поражение, а акт самопознания',
        ],
        'en': [
          'Remember what initially attracted you to the profession',
          'Review goals: perhaps new challenges are needed',
          'Changing specialization within profession may help',
          'Search for meaning outside work: volunteering, hobbies, creativity',
          'Existential therapy or logotherapy',
          'Sabbatical (long leave) for rethinking',
          'If nothing helps — career change is not defeat, but act of self-knowledge',
        ],
      },
      tryToday: {
        'ru': 'Напишите три вещи, которые вы цените в своей работе, даже если сейчас они кажутся незначительными. Это начало восстановления связи со смыслом.',
        'en': 'Write down three things you value in your work, even if they seem insignificant now. This is the beginning of reconnecting with meaning.',
      },
      inspiringConclusion: {
        'ru': 'Потеря смысла — это приглашение к трансформации. За этим кризисом может скрываться новая версия вас — более осознанная, более верная себе. Дайте себе время найти свой путь.',
        'en': 'Loss of meaning is an invitation to transformation. Behind this crisis may hide a new version of you — more conscious, more true to yourself. Give yourself time to find your way.',
      },
    ),

    'profile_work_overload': TestProfile(
      id: 'profile_work_overload',
      name: {
        'ru': 'Рабочая перегрузка',
        'en': 'Work Overload',
      },
      description: {
        'ru': 'Ваш основной симптом — токсичная рабочая среда. Чрезмерная нагрузка, недостаток ресурсов, работа в выходные, отсутствие поддержки — проблема в организации, а не в вас.',
        'en': 'Your main symptom is toxic work environment. Excessive workload, lack of resources, weekend work, lack of support — the problem is in organization, not in you.',
      },
      whyThisProfile: {
        'ru': 'Рабочая среда — один из ключевых факторов выгорания. Даже устойчивый человек выгорит в токсичной организации.',
        'en': 'Work environment is one of the key factors of burnout. Even a resilient person will burn out in a toxic organization.',
      },
      strengths: {
        'ru': [
          'Понимание, что проблема не только в вас',
          'Способность анализировать рабочую среду',
          'Готовность защищать свои границы',
        ],
        'en': [
          'Understanding that the problem is not just you',
          'Ability to analyze work environment',
          'Willingness to protect your boundaries',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Работа более 50 часов в неделю',
          'Регулярная работа в выходные',
          'Недостаток ресурсов для выполнения задач',
          'Отсутствие поддержки от руководства',
          'Несоответствие работы вашим ценностям',
        ],
        'en': [
          'Working more than 50 hours per week',
          'Regular weekend work',
          'Lack of resources to complete tasks',
          'Lack of support from management',
          'Work not matching your values',
        ],
      },
      recommendations: {
        'ru': [
          'Переговоры с руководством о снижении нагрузки — с конкретными данными',
          'Установление жёстких границ: отказ от работы в выходные',
          'Делегирование там, где возможно',
          'Документирование проблем для HR',
          'Объединение с коллегами — вы не одиноки',
          'ЧЕСТНО ОСОЗНАЙТЕ: вы не можете "перебороть" токсичную организацию',
          'Если руководство не реагирует — активный поиск новой работы',
        ],
        'en': [
          'Negotiate with management about reducing workload — with specific data',
          'Set firm boundaries: refuse weekend work',
          'Delegate where possible',
          'Document problems for HR',
          'Unite with colleagues — you are not alone',
          'HONESTLY REALIZE: you cannot "overcome" a toxic organization',
          'If management does not respond — active job search',
        ],
      },
      tryToday: {
        'ru': 'Определите одну рабочую задачу, которую вы можете делегировать или отложить. Освободите себе хотя бы один час для восстановления.',
        'en': 'Identify one work task you can delegate or postpone. Free up at least one hour for recovery.',
      },
      inspiringConclusion: {
        'ru': 'Токсичная рабочая среда — не ваша вина. Вы заслуживаете работу, где вас ценят, поддерживают и где вы можете расти. Такая работа существует — и вы её найдёте.',
        'en': 'Toxic work environment is not your fault. You deserve a job where you are valued, supported, and where you can grow. Such a job exists — and you will find it.',
      },
    ),

    'profile_moderate': TestProfile(
      id: 'profile_moderate',
      name: {
        'ru': 'Умеренное выгорание',
        'en': 'Moderate Burnout',
      },
      description: {
        'ru': 'У вас умеренный уровень выгорания со сбалансированным проявлением разных симптомов. Это серьёзный сигнал, требующий внимания.',
        'en': 'You have a moderate level of burnout with balanced manifestation of different symptoms. This is a serious signal requiring attention.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают повышение по нескольким компонентам выгорания без явного доминирования одного из них.',
        'en': 'Your answers show elevation across several burnout components without clear dominance of any one.',
      },
      strengths: {
        'ru': [
          'Ещё сохраняются ресурсы для восстановления',
          'Способность распознать проблему',
          'Готовность к изменениям',
        ],
        'en': [
          'Resources for recovery are still preserved',
          'Ability to recognize the problem',
          'Readiness for change',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Периодическое эмоциональное истощение',
          'Снижение мотивации и энтузиазма',
          'Физические симптомы стресса',
          'Трудности с концентрацией',
        ],
        'en': [
          'Periodic emotional exhaustion',
          'Decreased motivation and enthusiasm',
          'Physical symptoms of stress',
          'Difficulty concentrating',
        ],
      },
      recommendations: {
        'ru': [
          'Возьмите отпуск минимум на неделю для восстановления',
          'Пересмотрите рабочую нагрузку с руководством',
          'Введите регулярные практики восстановления: сон, спорт, хобби',
          'Установите чёткие границы рабочего времени',
          'Рассмотрите работу с психологом',
          'Определите главный источник стресса и начните с него',
        ],
        'en': [
          'Take at least a week vacation for recovery',
          'Review workload with management',
          'Introduce regular recovery practices: sleep, exercise, hobbies',
          'Set clear work hours boundaries',
          'Consider working with a psychologist',
          'Identify the main source of stress and start with it',
        ],
      },
      tryToday: {
        'ru': 'Выберите одну область восстановления (сон, движение, отдых) и сделайте один конкретный шаг к улучшению именно сегодня.',
        'en': 'Choose one area of recovery (sleep, movement, rest) and take one specific step toward improvement today.',
      },
      inspiringConclusion: {
        'ru': 'Вы поймали выгорание на той стадии, когда восстановление ещё возможно без радикальных мер. Действуйте сейчас — и через несколько месяцев вы будете благодарны себе.',
        'en': 'You caught burnout at a stage when recovery is still possible without radical measures. Act now — and in a few months you will thank yourself.',
      },
    ),

    'profile_severe': TestProfile(
      id: 'profile_severe',
      name: {
        'ru': 'Серьёзное выгорание',
        'en': 'Severe Burnout',
      },
      description: {
        'ru': 'У вас серьёзный уровень профессионального выгорания. Это состояние требует немедленного внимания и активных мер по восстановлению.',
        'en': 'You have a serious level of professional burnout. This condition requires immediate attention and active recovery measures.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают высокий уровень по большинству компонентов выгорания. Это хроническое состояние, которое влияет на здоровье.',
        'en': 'Your answers show high levels across most burnout components. This is a chronic condition affecting health.',
      },
      strengths: {
        'ru': [
          'Честность с собой о серьёзности ситуации',
          'Готовность искать помощь',
          'Сохранение минимальных ресурсов',
        ],
        'en': [
          'Honesty with yourself about the seriousness of the situation',
          'Willingness to seek help',
          'Preservation of minimal resources',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Хроническое эмоциональное и физическое истощение',
          'Серьёзные проблемы со здоровьем',
          'Глубокий цинизм и отстранённость',
          'Сомнения в профессиональной компетентности',
          'Потеря смысла работы',
        ],
        'en': [
          'Chronic emotional and physical exhaustion',
          'Serious health problems',
          'Deep cynicism and detachment',
          'Doubts about professional competence',
          'Loss of work meaning',
        ],
      },
      recommendations: {
        'ru': [
          'СРОЧНО: возьмите отпуск минимум 2-3 недели',
          'Обязательная психотерапия — КПТ или схема-терапия',
          'Полное медицинское обследование',
          'Обсуждение с врачом возможной медикаментозной поддержки',
          'Радикальное снижение рабочей нагрузки после отпуска',
          'Если работодатель не идёт навстречу — серьёзно рассмотрите смену работы',
          'Практики глубокого восстановления: ретрит, санаторий',
        ],
        'en': [
          'URGENT: take at least 2-3 weeks vacation',
          'Mandatory psychotherapy — CBT or schema therapy',
          'Complete medical examination',
          'Discuss possible medication support with doctor',
          'Radical workload reduction after vacation',
          'If employer does not cooperate — seriously consider changing jobs',
          'Deep recovery practices: retreat, sanatorium',
        ],
      },
      tryToday: {
        'ru': 'Позвоните близкому человеку и честно расскажите, как вы себя чувствуете. Вам нужна поддержка, и вы заслуживаете её получить.',
        'en': 'Call a loved one and honestly tell them how you feel. You need support, and you deserve to receive it.',
      },
      inspiringConclusion: {
        'ru': 'Выгорание — это не ваша слабость. Это сигнал, что система перегружена. Восстановление возможно, но требует времени и профессиональной помощи. Вы не одиноки в этом.',
        'en': 'Burnout is not your weakness. It is a signal that the system is overloaded. Recovery is possible but requires time and professional help. You are not alone in this.',
      },
    ),

    'profile_critical': TestProfile(
      id: 'profile_critical',
      name: {
        'ru': 'Критическое выгорание',
        'en': 'Critical Burnout',
      },
      description: {
        'ru': 'У вас критический уровень профессионального выгорания. Это состояние, угрожающее вашему физическому и психическому здоровью. Требуются немедленные меры.',
        'en': 'You have a critical level of professional burnout. This condition threatens your physical and mental health. Immediate action is required.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают экстремально высокий уровень по большинству или всем компонентам выгорания. Это кризисное состояние.',
        'en': 'Your answers show extremely high levels across most or all burnout components. This is a crisis state.',
      },
      strengths: {
        'ru': [
          'Вы прошли этот тест — значит, ищете выход',
          'Осознание критичности ситуации — первый шаг',
          'Готовность к радикальным изменениям',
        ],
        'en': [
          'You took this test — meaning you are looking for a way out',
          'Awareness of the critical situation — first step',
          'Readiness for radical changes',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Полное эмоциональное и физическое истощение',
          'Серьёзные риски для здоровья',
          'Глубокий экзистенциальный кризис',
          'Возможная депрессия или тревожное расстройство',
          'Риск необратимых последствий без вмешательства',
        ],
        'en': [
          'Complete emotional and physical exhaustion',
          'Serious health risks',
          'Deep existential crisis',
          'Possible depression or anxiety disorder',
          'Risk of irreversible consequences without intervention',
        ],
      },
      recommendations: {
        'ru': [
          'НЕМЕДЛЕННО: обратитесь к врачу — терапевту, психиатру, психотерапевту',
          'Рассмотрите возможность больничного листа',
          'Категорически противопоказано "перетерпеть"',
          'Возможна необходимость медикаментозной поддержки',
          'Длительный отпуск или sabbatical минимум месяц',
          'После восстановления: серьёзный пересмотр карьеры и образа жизни',
          'Помните: ваше здоровье важнее любой работы',
        ],
        'en': [
          'IMMEDIATELY: see a doctor — general practitioner, psychiatrist, psychotherapist',
          'Consider sick leave',
          'Categorically contraindicated to "push through"',
          'Medication support may be necessary',
          'Long vacation or sabbatical for at least a month',
          'After recovery: serious career and lifestyle review',
          'Remember: your health is more important than any job',
        ],
      },
      tryToday: {
        'ru': 'Запишитесь на приём к врачу (терапевт, психотерапевт или психиатр). Это самое важное, что вы можете сделать прямо сейчас.',
        'en': 'Make an appointment with a doctor (general practitioner, psychotherapist, or psychiatrist). This is the most important thing you can do right now.',
      },
      inspiringConclusion: {
        'ru': 'Вы дошли до точки, где продолжать без изменений невозможно. Но это не конец — это поворотная точка. Тысячи людей прошли через критическое выгорание и нашли новую, более здоровую жизнь. Вы тоже сможете.',
        'en': 'You have reached a point where continuing without change is impossible. But this is not the end — it is a turning point. Thousands of people have gone through critical burnout and found a new, healthier life. You can too.',
      },
    ),
  };
}
