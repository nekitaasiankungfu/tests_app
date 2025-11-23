import '../models/test_model.dart';

/// Data access class for Depression Symptoms Inventory
/// Legacy Dart implementation (no JSON dependency)
class DepressionSymptomsInventoryData {
  /// Get the complete Depression Symptoms Inventory test
  static TestModel getDepressionSymptomsInventoryTest() {
    return TestModel(
      id: 'depression_symptoms_inventory_v1',
      title: {
        'ru': 'Опросник симптомов депрессии',
        'en': 'Depression Symptoms Inventory',
      },
      description: {
        'ru':
            'Депрессия — это не просто плохое настроение или временная грусть. '
            'Это состояние, которое затрагивает мысли, чувства, тело и поведение, '
            'значительно снижая качество жизни и способность справляться с повседневными задачами.\n\n'
            'Данный опросник оценивает выраженность симптомов депрессии за последние две недели '
            'по пяти ключевым компонентам: эмоциональные переживания, когнитивные симптомы, '
            'мотивационные нарушения, соматические проявления и социальное функционирование.\n\n'
            'Важно: этот тест является инструментом самооценки и НЕ заменяет консультацию специалиста. '
            'Депрессия — это состояние, которое хорошо поддаётся лечению при правильном подходе.',
        'en':
            'Depression is not just a bad mood or temporary sadness. '
            'It is a condition that affects thoughts, feelings, body and behavior, '
            'significantly reducing quality of life and ability to cope with daily tasks.\n\n'
            'This inventory assesses the severity of depression symptoms over the past two weeks '
            'across five key components: emotional experiences, cognitive symptoms, '
            'motivational disturbances, somatic manifestations and social functioning.\n\n'
            'Important: this test is a self-assessment tool and does NOT replace professional consultation. '
            'Depression is a condition that responds well to treatment with the right approach.',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      disclaimer: {
        'ru':
            'Данный опросник является инструментом самооценки и скрининга. '
            'Он НЕ предназначен для постановки диагноза и НЕ заменяет консультацию '
            'квалифицированного специалиста (психиатра, психотерапевта, клинического психолога).\n\n'
            'Высокий балл не означает наличие депрессивного расстройства — для диагностики '
            'необходима профессиональная оценка.\n\n'
            '⚠️ ЕСЛИ У ВАС ЕСТЬ МЫСЛИ О СУИЦИДЕ ИЛИ САМОПОВРЕЖДЕНИИ:\n'
            'Позвоните прямо сейчас: 8-800-2000-122 (бесплатно, круглосуточно)\n'
            'Или вызовите скорую помощь: 103\n'
            'Вы не одиноки. Помощь доступна.',
        'en':
            'This inventory is a self-assessment and screening tool. '
            'It is NOT intended for diagnosis and does NOT replace consultation '
            'with a qualified specialist (psychiatrist, psychotherapist, clinical psychologist).\n\n'
            'A high score does not indicate a depressive disorder — professional '
            'evaluation is required for diagnosis.\n\n'
            '⚠️ IF YOU HAVE THOUGHTS OF SUICIDE OR SELF-HARM:\n'
            'Please seek help immediately. You are not alone. Help is available.',
      },
      estimatedTime: 7,
      type: TestType.multiFactor,
      factorIds: [
        'emotional',
        'cognitive',
        'motivational',
        'somatic',
        'social',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'emotional': {
        'ru': 'Эмоциональные симптомы',
        'en': 'Emotional Symptoms',
      },
      'cognitive': {
        'ru': 'Когнитивные симптомы',
        'en': 'Cognitive Symptoms',
      },
      'motivational': {
        'ru': 'Мотивационные симптомы',
        'en': 'Motivational Symptoms',
      },
      'somatic': {
        'ru': 'Соматические симптомы',
        'en': 'Somatic Symptoms',
      },
      'social': {
        'ru': 'Социальные симптомы',
        'en': 'Social Symptoms',
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
    // minimal: 0-16%, mild: 17-35%, moderate: 36-58%, severe: 59-78%, very_severe: 79-100%
    final String level;
    if (percentage <= 16) {
      level = 'minimal';
    } else if (percentage <= 35) {
      level = 'mild';
    } else if (percentage <= 58) {
      level = 'moderate';
    } else if (percentage <= 78) {
      level = 'severe';
    } else {
      level = 'very_severe';
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

  /// Get all 27 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // ============================================
      // EMOTIONAL (Q1, Q6, Q11, Q16, Q21, Q26)
      // ============================================

      // Q1: depressed_mood (DSM-5 A1)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Чувство грусти, подавленности или тоски',
          'en': 'Feeling sad, down, or depressed',
        },
        factorId: 'emotional',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q6: emptiness
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Ощущение внутренней пустоты или эмоционального онемения',
          'en': 'Feeling of inner emptiness or emotional numbness',
        },
        factorId: 'emotional',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q11: tearfulness
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Плаксивость или желание плакать без видимой причины',
          'en': 'Tearfulness or wanting to cry without apparent reason',
        },
        factorId: 'emotional',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q16: irritability
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Раздражительность или вспышки гнева',
          'en': 'Irritability or outbursts of anger',
        },
        factorId: 'emotional',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q21: emotional_numbness
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Ощущение, что хочется плакать, но слёзы не идут',
          'en': 'Feeling like wanting to cry but unable to',
        },
        factorId: 'emotional',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q26: worthlessness_deep (DSM-5 A7)
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Ощущение, что вы не заслуживаете хорошего или счастья',
          'en': 'Feeling that you don\'t deserve good things or happiness',
        },
        factorId: 'emotional',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // ============================================
      // COGNITIVE (Q2, Q7, Q12, Q17, Q22, Q27)
      // ============================================

      // Q2: worthlessness (DSM-5 A7)
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Негативные мысли о себе (ощущение себя неудачником, разочарование в себе)',
          'en': 'Negative thoughts about yourself (feeling like a failure, disappointment in yourself)',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q7: concentration (DSM-5 A8)
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Трудности с концентрацией внимания, принятием решений или запоминанием',
          'en': 'Difficulty concentrating, making decisions, or remembering',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q12: hopelessness
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Пессимистичный взгляд на будущее, ощущение безнадёжности',
          'en': 'Pessimistic view of the future, feeling of hopelessness',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q17: guilt (DSM-5 A7)
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Чрезмерное чувство вины или самообвинение',
          'en': 'Excessive feelings of guilt or self-blame',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q22: excessive_guilt
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Мысли о том, что вы сделали что-то непоправимо плохое',
          'en': 'Thoughts that you have done something irreparably wrong',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q27: suicidal_ideation (DSM-5 A9) - CRITICAL ITEM
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Мысли о том, что лучше бы вас не было, или о причинении себе вреда',
          'en': 'Thoughts that you would be better off dead or of hurting yourself',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // ============================================
      // MOTIVATIONAL (Q3, Q8, Q13, Q18, Q23)
      // ============================================

      // Q3: anhedonia (DSM-5 A2)
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Потеря интереса к занятиям, которые раньше приносили удовольствие',
          'en': 'Loss of interest in activities that used to bring pleasure',
        },
        factorId: 'motivational',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q8: fatigue (DSM-5 A6)
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Отсутствие энергии, ощущение истощённости или усталости',
          'en': 'Lack of energy, feeling exhausted or fatigued',
        },
        factorId: 'motivational',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q13: amotivation
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Трудности заставить себя что-то делать, даже необходимые вещи',
          'en': 'Difficulty making yourself do things, even necessary ones',
        },
        factorId: 'motivational',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q18: anhedonia_deep (DSM-5 A2)
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Ощущение, что ничто не радует и не приносит удовлетворения',
          'en': 'Feeling that nothing brings joy or satisfaction',
        },
        factorId: 'motivational',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q23: apathy
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Безразличие к вещам, которые раньше были важны',
          'en': 'Indifference to things that used to be important',
        },
        factorId: 'motivational',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // ============================================
      // SOMATIC (Q4, Q9, Q14, Q19, Q24)
      // ============================================

      // Q4: insomnia (DSM-5 A4)
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Проблемы со сном: трудности с засыпанием, частые пробуждения или слишком ранний подъём',
          'en': 'Sleep problems: difficulty falling asleep, frequent awakenings, or waking up too early',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q9: appetite (DSM-5 A3)
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Изменения аппетита: значительное снижение или повышение',
          'en': 'Changes in appetite: significant decrease or increase',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q14: psychomotor_retardation (DSM-5 A5)
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Физическая тяжесть в теле, ощущение «свинцовых» рук или ног',
          'en': 'Physical heaviness in the body, feeling of "leaden" arms or legs',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q19: hypersomnia (DSM-5 A4)
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Чрезмерная сонливость или потребность спать больше обычного',
          'en': 'Excessive sleepiness or need to sleep more than usual',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q24: psychomotor_changes (DSM-5 A5)
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Беспокойство, неспособность усидеть на месте, или наоборот — заторможенность движений',
          'en': 'Restlessness, inability to sit still, or conversely — slowed movements',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),

      // ============================================
      // SOCIAL (Q5, Q10, Q15, Q20, Q25)
      // ============================================

      // Q5: social_withdrawal
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Желание избегать общения с людьми, стремление к уединению',
          'en': 'Desire to avoid socializing with people, tendency toward isolation',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q10: functioning
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Трудности с выполнением рабочих или домашних обязанностей',
          'en': 'Difficulty performing work or household responsibilities',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q15: burden
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Ощущение себя обузой для близких или окружающих',
          'en': 'Feeling like a burden to loved ones or others',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q20: loneliness
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Чувство одиночества, даже когда есть люди рядом',
          'en': 'Feeling of loneliness, even when people are around',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q25: disconnection
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Отдаление от близких людей, ощущение стены между собой и другими',
          'en': 'Distancing from loved ones, feeling a wall between yourself and others',
        },
        factorId: 'social',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
    ];
  }

  /// Frequency answers (4-point scale: 0-3) - RULE #1: scores 0-3!
  /// Based on PHQ-9 / DSM-5 2-week time frame
  static List<AnswerModel> _getFrequencyAnswers() {
    return [
      AnswerModel(
        id: 'f1',
        text: {
          'ru': 'Совсем нет',
          'en': 'Not at all',
        },
        score: 0, // RULE #1: Start from 0!
      ),
      AnswerModel(
        id: 'f2',
        text: {
          'ru': 'Несколько дней',
          'en': 'Several days',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'f3',
        text: {
          'ru': 'Более половины дней',
          'en': 'More than half the days',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'f4',
        text: {
          'ru': 'Почти каждый день',
          'en': 'Nearly every day',
        },
        score: 3, // RULE #1: End at 3 for 4-point scale!
      ),
    ];
  }

  /// Get factor interpretations by level
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'emotional': {
        'minimal': {
          'title_ru': 'Минимальные эмоциональные симптомы',
          'title_en': 'Minimal Emotional Symptoms',
          'description_ru':
              'Ваше эмоциональное состояние в целом стабильно. '
              'Периодическая грусть нормальна и не является поводом для беспокойства.',
          'description_en':
              'Your emotional state is generally stable. '
              'Occasional sadness is normal and not a cause for concern.',
        },
        'mild': {
          'title_ru': 'Лёгкие эмоциональные симптомы',
          'title_en': 'Mild Emotional Symptoms',
          'description_ru':
              'Вы испытываете заметное снижение настроения. '
              'Грусть и тоска присутствуют регулярно, но не постоянно.',
          'description_en':
              'You are experiencing noticeable mood decline. '
              'Sadness and melancholy are present regularly but not constantly.',
        },
        'moderate': {
          'title_ru': 'Умеренные эмоциональные симптомы',
          'title_en': 'Moderate Emotional Symptoms',
          'description_ru':
              'Присутствуют заметные эмоциональные нарушения. '
              'Рекомендуется обратить внимание на возможные триггеры и практиковать '
              'техники эмоциональной регуляции.',
          'description_en':
              'Notable emotional disturbances are present. '
              'It is recommended to pay attention to possible triggers and practice '
              'emotional regulation techniques.',
        },
        'severe': {
          'title_ru': 'Выраженные эмоциональные симптомы',
          'title_en': 'Severe Emotional Symptoms',
          'description_ru':
              'Выраженное снижение настроения. Глубокая грусть, ощущение пустоты '
              'или эмоционального онемения. Рекомендуется консультация специалиста.',
          'description_en':
              'Pronounced mood decline. Deep sadness, feeling of emptiness '
              'or emotional numbness. Specialist consultation is recommended.',
        },
        'very_severe': {
          'title_ru': 'Тяжёлые эмоциональные симптомы',
          'title_en': 'Very Severe Emotional Symptoms',
          'description_ru':
              'Очень выраженные эмоциональные симптомы. '
              'Необходима срочная консультация специалиста.',
          'description_en':
              'Very pronounced emotional symptoms. '
              'Urgent specialist consultation is necessary.',
        },
      },
      'cognitive': {
        'minimal': {
          'title_ru': 'Минимальные когнитивные симптомы',
          'title_en': 'Minimal Cognitive Symptoms',
          'description_ru':
              'Ваше мышление в целом реалистично. '
              'Вы способны видеть позитивное и легко концентрируетесь.',
          'description_en':
              'Your thinking is generally realistic. '
              'You are able to see the positive and concentrate easily.',
        },
        'mild': {
          'title_ru': 'Лёгкие когнитивные симптомы',
          'title_en': 'Mild Cognitive Symptoms',
          'description_ru':
              'Присутствует негативное мышление. '
              'Самокритика, пессимизм и чувство вины беспокоят вас периодически.',
          'description_en':
              'Negative thinking is present. '
              'Self-criticism, pessimism, and guilt bother you periodically.',
        },
        'moderate': {
          'title_ru': 'Умеренные когнитивные симптомы',
          'title_en': 'Moderate Cognitive Symptoms',
          'description_ru':
              'Заметные когнитивные искажения. Рекомендуется ведение дневника мыслей '
              'и практика когнитивной реструктуризации.',
          'description_en':
              'Notable cognitive distortions. Keeping a thought journal '
              'and practicing cognitive restructuring is recommended.',
        },
        'severe': {
          'title_ru': 'Выраженные когнитивные симптомы',
          'title_en': 'Severe Cognitive Symptoms',
          'description_ru':
              'Выраженное негативное мышление. Глубокая самокритика, безнадёжность. '
              'Когнитивно-поведенческая терапия (КПТ) может быть очень эффективна.',
          'description_en':
              'Pronounced negative thinking. Deep self-criticism, hopelessness. '
              'Cognitive behavioral therapy (CBT) can be very effective.',
        },
        'very_severe': {
          'title_ru': 'Тяжёлые когнитивные симптомы',
          'title_en': 'Very Severe Cognitive Symptoms',
          'description_ru':
              'Очень выраженные негативные мысли. Возможны мысли о суициде. '
              'Необходима срочная консультация специалиста.',
          'description_en':
              'Very pronounced negative thoughts. Suicidal thoughts may be present. '
              'Urgent specialist consultation is necessary.',
        },
      },
      'motivational': {
        'minimal': {
          'title_ru': 'Минимальные мотивационные симптомы',
          'title_en': 'Minimal Motivational Symptoms',
          'description_ru':
              'Вы сохраняете интерес к жизни и способность получать удовольствие. '
              'Уровень энергии в норме.',
          'description_en':
              'You maintain interest in life and ability to experience pleasure. '
              'Energy level is normal.',
        },
        'mild': {
          'title_ru': 'Лёгкие мотивационные симптомы',
          'title_en': 'Mild Motivational Symptoms',
          'description_ru':
              'Заметное снижение интереса и энергии. '
              'Вам труднее мотивировать себя, но вы справляетесь.',
          'description_en':
              'Noticeable decrease in interest and energy. '
              'It is harder to motivate yourself, but you manage.',
        },
        'moderate': {
          'title_ru': 'Умеренные мотивационные симптомы',
          'title_en': 'Moderate Motivational Symptoms',
          'description_ru':
              'Заметная потеря интереса. Рекомендуется поведенческая активация: '
              'планирование маленьких приятных занятий каждый день.',
          'description_en':
              'Notable loss of interest. Behavioral activation is recommended: '
              'planning small pleasant activities every day.',
        },
        'severe': {
          'title_ru': 'Выраженные мотивационные симптомы',
          'title_en': 'Severe Motivational Symptoms',
          'description_ru':
              'Выраженная потеря интереса и удовольствия. Апатия и истощение. '
              'Начинайте с очень маленьких шагов и обратитесь к специалисту.',
          'description_en':
              'Pronounced loss of interest and pleasure. Apathy and exhaustion. '
              'Start with very small steps and consult a specialist.',
        },
        'very_severe': {
          'title_ru': 'Тяжёлые мотивационные симптомы',
          'title_en': 'Very Severe Motivational Symptoms',
          'description_ru':
              'Полная потеря интереса и мотивации. '
              'Необходима срочная профессиональная помощь.',
          'description_en':
              'Complete loss of interest and motivation. '
              'Urgent professional help is necessary.',
        },
      },
      'somatic': {
        'minimal': {
          'title_ru': 'Минимальные соматические симптомы',
          'title_en': 'Minimal Somatic Symptoms',
          'description_ru':
              'Физические функции в норме. '
              'Сон и аппетит стабильны, уровень энергии достаточный.',
          'description_en':
              'Physical functions are normal. '
              'Sleep and appetite are stable, energy level is adequate.',
        },
        'mild': {
          'title_ru': 'Лёгкие соматические симптомы',
          'title_en': 'Mild Somatic Symptoms',
          'description_ru':
              'Заметные нарушения сна или аппетита. '
              'Физическая усталость, но не выраженная.',
          'description_en':
              'Noticeable sleep or appetite disturbances. '
              'Physical fatigue, but not pronounced.',
        },
        'moderate': {
          'title_ru': 'Умеренные соматические симптомы',
          'title_en': 'Moderate Somatic Symptoms',
          'description_ru':
              'Заметные физические симптомы. Соблюдайте гигиену сна, '
              'старайтесь есть регулярно и включите физическую активность.',
          'description_en':
              'Notable physical symptoms. Follow sleep hygiene, '
              'try to eat regularly, and include physical activity.',
        },
        'severe': {
          'title_ru': 'Выраженные соматические симптомы',
          'title_en': 'Severe Somatic Symptoms',
          'description_ru':
              'Выраженные соматические симптомы. Серьёзные проблемы со сном, '
              'аппетитом, энергией. Исключите соматические заболевания у терапевта.',
          'description_en':
              'Pronounced somatic symptoms. Serious problems with sleep, '
              'appetite, energy. Rule out medical conditions with a doctor.',
        },
        'very_severe': {
          'title_ru': 'Тяжёлые соматические симптомы',
          'title_en': 'Very Severe Somatic Symptoms',
          'description_ru':
              'Очень выраженные физические симптомы. '
              'Необходима консультация врача и психиатра.',
          'description_en':
              'Very pronounced physical symptoms. '
              'Consultation with a doctor and psychiatrist is necessary.',
        },
      },
      'social': {
        'minimal': {
          'title_ru': 'Минимальные социальные симптомы',
          'title_en': 'Minimal Social Symptoms',
          'description_ru':
              'Вы поддерживаете социальные связи и справляетесь с обязанностями. '
              'Социальное функционирование не нарушено.',
          'description_en':
              'You maintain social connections and handle responsibilities. '
              'Social functioning is not impaired.',
        },
        'mild': {
          'title_ru': 'Лёгкие социальные симптомы',
          'title_en': 'Mild Social Symptoms',
          'description_ru':
              'Заметное снижение социальной активности. '
              'Вам труднее общаться и выполнять обязанности.',
          'description_en':
              'Noticeable decrease in social activity. '
              'It is harder for you to socialize and fulfill responsibilities.',
        },
        'moderate': {
          'title_ru': 'Умеренные социальные симптомы',
          'title_en': 'Moderate Social Symptoms',
          'description_ru':
              'Заметная социальная изоляция. Не изолируйтесь полностью — '
              'поддерживайте хотя бы минимальный контакт с близкими.',
          'description_en':
              'Notable social isolation. Don\'t isolate completely — '
              'maintain at least minimal contact with loved ones.',
        },
        'severe': {
          'title_ru': 'Выраженные социальные симптомы',
          'title_en': 'Severe Social Symptoms',
          'description_ru':
              'Выраженная социальная изоляция и снижение функционирования. '
              'Расскажите хотя бы одному человеку о том, что вы переживаете.',
          'description_en':
              'Pronounced social isolation and reduced functioning. '
              'Tell at least one person about what you are going through.',
        },
        'very_severe': {
          'title_ru': 'Тяжёлые социальные симптомы',
          'title_en': 'Very Severe Social Symptoms',
          'description_ru':
              'Полная социальная изоляция. Вы не одиноки, помощь доступна. '
              'Телефон доверия: 8-800-2000-122.',
          'description_en':
              'Complete social isolation. You are not alone, help is available. '
              'Please reach out to a crisis helpline.',
        },
      },
    };
  }
}
