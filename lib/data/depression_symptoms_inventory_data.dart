import '../models/test_model.dart';
import '../models/test_profile_model.dart';

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

  /// Определить профиль на основе процентов по шкалам
  static String determineProfile(Map<String, double> percentages) {
    // Вычисляем средний уровень депрессии
    final factors = ['emotional', 'cognitive', 'motivational', 'somatic', 'social'];

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
    if (averageLevel <= 16) {
      return 'profile_minimal';
    } else if (averageLevel <= 35) {
      return 'profile_mild';
    } else if (averageLevel <= 58) {
      // Умеренная депрессия - определяем доминирующий фактор
      String? dominantFactor;
      double maxValue = 0;
      for (final factor in factors) {
        final value = percentages[factor] ?? 0;
        if (value > maxValue) {
          maxValue = value;
          dominantFactor = factor;
        }
      }

      switch (dominantFactor) {
        case 'emotional':
          return 'profile_emotional_focus';
        case 'cognitive':
          return 'profile_cognitive_focus';
        case 'motivational':
          return 'profile_motivational_focus';
        case 'somatic':
          return 'profile_somatic_focus';
        case 'social':
          return 'profile_social_focus';
        default:
          return 'profile_moderate';
      }
    } else if (averageLevel <= 78) {
      return 'profile_severe';
    } else {
      return 'profile_very_severe';
    }
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Все профили для теста депрессии
  static final Map<String, TestProfile> _profiles = {
    'profile_minimal': TestProfile(
      id: 'profile_minimal',
      name: {
        'ru': 'Минимальные симптомы',
        'en': 'Minimal Symptoms',
      },
      description: {
        'ru': 'Ваши результаты показывают минимальные или отсутствующие признаки депрессии. Это хороший показатель эмоционального благополучия.',
        'en': 'Your results show minimal or no signs of depression. This is a good indicator of emotional well-being.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают низкий уровень по всем компонентам: эмоциональным, когнитивным, мотивационным, соматическим и социальным симптомам.',
        'en': 'Your answers show low levels across all components: emotional, cognitive, motivational, somatic, and social symptoms.',
      },
      strengths: {
        'ru': [
          'Стабильное эмоциональное состояние',
          'Позитивное мышление и самооценка',
          'Сохранная мотивация и энергия',
          'Хорошее физическое самочувствие',
          'Активные социальные связи',
        ],
        'en': [
          'Stable emotional state',
          'Positive thinking and self-esteem',
          'Preserved motivation and energy',
          'Good physical well-being',
          'Active social connections',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Важно поддерживать профилактику',
          'Стресс может влиять на настроение',
        ],
        'en': [
          'Important to maintain prevention',
          'Stress can affect mood',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте практики, которые поддерживают ваше благополучие',
          'Поддерживайте режим сна и физическую активность',
          'Сохраняйте социальные связи',
          'Проходите самооценку периодически (раз в 3-6 месяцев)',
        ],
        'en': [
          'Continue practices that support your well-being',
          'Maintain sleep routine and physical activity',
          'Preserve social connections',
          'Do self-assessment periodically (every 3-6 months)',
        ],
      },
      tryToday: {
        'ru': 'Подумайте о том, что помогает вам чувствовать себя хорошо, и запланируйте одно такое занятие на эту неделю.',
        'en': 'Think about what helps you feel good and schedule one such activity for this week.',
      },
      inspiringConclusion: {
        'ru': 'Ваше эмоциональное здоровье — это ценный ресурс. Продолжайте заботиться о себе и помните: профилактика важнее лечения.',
        'en': 'Your emotional health is a valuable resource. Continue caring for yourself and remember: prevention is better than cure.',
      },
    ),

    'profile_mild': TestProfile(
      id: 'profile_mild',
      name: {
        'ru': 'Лёгкие симптомы',
        'en': 'Mild Symptoms',
      },
      description: {
        'ru': 'У вас есть лёгкие признаки депрессивного состояния. Это нормальная реакция на стресс, но стоит обратить внимание на своё состояние.',
        'en': 'You have mild signs of depressive state. This is a normal response to stress, but you should pay attention to your condition.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают небольшое повышение некоторых показателей, но общий уровень остаётся управляемым.',
        'en': 'Your answers show a slight increase in some indicators, but the overall level remains manageable.',
      },
      strengths: {
        'ru': [
          'Сохранение базовой функциональности',
          'Способность распознавать своё состояние',
          'Ресурсы для самопомощи доступны',
        ],
        'en': [
          'Preserved basic functionality',
          'Ability to recognize your condition',
          'Self-help resources available',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Периодическое снижение настроения',
          'Возможное нарушение сна или аппетита',
          'Временное снижение интереса к деятельности',
        ],
        'en': [
          'Periodic mood decline',
          'Possible sleep or appetite disturbance',
          'Temporary decreased interest in activities',
        ],
      },
      recommendations: {
        'ru': [
          'Улучшите гигиену сна: 7-9 часов, регулярный режим',
          'Физическая активность: 30 минут 5 раз в неделю улучшает настроение',
          'Практикуйте техники релаксации или медитацию',
          'Поддерживайте социальные контакты, даже когда не хочется',
          'Ограничьте алкоголь — он усиливает депрессию',
          'Если симптомы не проходят 2+ недели — обратитесь к специалисту',
        ],
        'en': [
          'Improve sleep hygiene: 7-9 hours, regular schedule',
          'Physical activity: 30 minutes 5 times a week improves mood',
          'Practice relaxation techniques or meditation',
          'Maintain social contacts, even when you don\'t feel like it',
          'Limit alcohol — it worsens depression',
          'If symptoms persist 2+ weeks — consult a specialist',
        ],
      },
      tryToday: {
        'ru': 'Совершите 15-минутную прогулку на свежем воздухе. Физическая активность и свет помогают улучшить настроение.',
        'en': 'Take a 15-minute walk outside. Physical activity and light help improve mood.',
      },
      inspiringConclusion: {
        'ru': 'Лёгкие симптомы — это сигнал обратить внимание на себя. Небольшие изменения в образе жизни могут значительно улучшить ваше состояние.',
        'en': 'Mild symptoms are a signal to pay attention to yourself. Small lifestyle changes can significantly improve your condition.',
      },
    ),

    'profile_emotional_focus': TestProfile(
      id: 'profile_emotional_focus',
      name: {
        'ru': 'Эмоциональный фокус',
        'en': 'Emotional Focus',
      },
      description: {
        'ru': 'Ваш основной симптом — эмоциональные переживания: грусть, тоска, чувство пустоты. Эмоции сейчас в центре вашего опыта депрессии.',
        'en': 'Your main symptom is emotional experiences: sadness, melancholy, feeling of emptiness. Emotions are currently at the center of your depression experience.',
      },
      whyThisProfile: {
        'ru': 'Среди всех компонентов депрессии у вас доминируют эмоциональные симптомы: подавленность, тоска, плаксивость.',
        'en': 'Among all depression components, emotional symptoms dominate: low mood, melancholy, tearfulness.',
      },
      strengths: {
        'ru': [
          'Способность чувствовать и осознавать эмоции',
          'Сохранение когнитивных функций',
          'Возможность получить облегчение через эмоциональную работу',
        ],
        'en': [
          'Ability to feel and recognize emotions',
          'Preserved cognitive functions',
          'Possibility of relief through emotional work',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Глубокая грусть или подавленность',
          'Чувство пустоты или эмоциональное онемение',
          'Плаксивость или раздражительность',
        ],
        'en': [
          'Deep sadness or low mood',
          'Feeling of emptiness or emotional numbness',
          'Tearfulness or irritability',
        ],
      },
      recommendations: {
        'ru': [
          'Ведите дневник эмоций — это помогает осознать и принять чувства',
          'Практикуйте самосострадание: относитесь к себе как к хорошему другу',
          'Разрешите себе грустить — подавление эмоций усиливает депрессию',
          'Психотерапия (особенно эмоционально-фокусированная) очень эффективна',
          'Найдите безопасного человека, с которым можно поделиться чувствами',
          'Творческое самовыражение: музыка, рисование, письмо',
        ],
        'en': [
          'Keep an emotion journal — it helps recognize and accept feelings',
          'Practice self-compassion: treat yourself like a good friend',
          'Allow yourself to be sad — suppressing emotions worsens depression',
          'Psychotherapy (especially emotion-focused) is very effective',
          'Find a safe person to share your feelings with',
          'Creative expression: music, drawing, writing',
        ],
      },
      tryToday: {
        'ru': 'Напишите письмо к себе с позиции сострадательного друга. Что бы вы сказали себе, если бы видели свою боль со стороны?',
        'en': 'Write a letter to yourself from the position of a compassionate friend. What would you say to yourself if you saw your pain from the outside?',
      },
      inspiringConclusion: {
        'ru': 'Эмоции — это не враги, а посланники. Они говорят вам о важном. Научившись слушать их, вы найдёте путь к исцелению.',
        'en': 'Emotions are not enemies, but messengers. They tell you something important. Learning to listen to them, you will find the path to healing.',
      },
    ),

    'profile_cognitive_focus': TestProfile(
      id: 'profile_cognitive_focus',
      name: {
        'ru': 'Когнитивный фокус',
        'en': 'Cognitive Focus',
      },
      description: {
        'ru': 'Ваш основной симптом — когнитивные нарушения: негативное мышление, самокритика, трудности с концентрацией и памятью.',
        'en': 'Your main symptom is cognitive impairment: negative thinking, self-criticism, difficulty with concentration and memory.',
      },
      whyThisProfile: {
        'ru': 'Среди всех компонентов депрессии у вас доминируют когнитивные симптомы: негативные мысли, самокритика, проблемы с вниманием.',
        'en': 'Among all depression components, cognitive symptoms dominate: negative thoughts, self-criticism, attention problems.',
      },
      strengths: {
        'ru': [
          'Способность к анализу и самонаблюдению',
          'Понимание связи мыслей и настроения',
          'Хороший ответ на когнитивную терапию',
        ],
        'en': [
          'Ability for analysis and self-observation',
          'Understanding the connection between thoughts and mood',
          'Good response to cognitive therapy',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Негативное мышление и руминации',
          'Самокритика и чувство вины',
          'Трудности с концентрацией',
          'Проблемы с принятием решений',
        ],
        'en': [
          'Negative thinking and rumination',
          'Self-criticism and guilt',
          'Difficulty concentrating',
          'Problems with decision-making',
        ],
      },
      recommendations: {
        'ru': [
          'Когнитивно-поведенческая терапия (КПТ) — золотой стандарт при когнитивных симптомах',
          'Практикуйте "ловлю" автоматических негативных мыслей',
          'Ведите дневник мыслей: ситуация → мысль → эмоция → альтернативная мысль',
          'Ограничьте руминации: поставьте "время для беспокойства" (15 минут в день)',
          'Снизьте многозадачность — одна задача за раз',
          'Медитация осознанности помогает прервать цикл негативных мыслей',
        ],
        'en': [
          'Cognitive behavioral therapy (CBT) — gold standard for cognitive symptoms',
          'Practice "catching" automatic negative thoughts',
          'Keep thought diary: situation → thought → emotion → alternative thought',
          'Limit rumination: set "worry time" (15 minutes a day)',
          'Reduce multitasking — one task at a time',
          'Mindfulness meditation helps break the cycle of negative thoughts',
        ],
      },
      tryToday: {
        'ru': 'Запишите одну негативную мысль о себе. Теперь спросите: какие факты её поддерживают? Какие факты ей противоречат? Это первый шаг к когнитивной перестройке.',
        'en': 'Write down one negative thought about yourself. Now ask: what facts support it? What facts contradict it? This is the first step to cognitive restructuring.',
      },
      inspiringConclusion: {
        'ru': 'Мысли — это не факты. Научившись различать их, вы обретёте свободу от тирании негативного мышления.',
        'en': 'Thoughts are not facts. Learning to distinguish them, you will gain freedom from the tyranny of negative thinking.',
      },
    ),

    'profile_motivational_focus': TestProfile(
      id: 'profile_motivational_focus',
      name: {
        'ru': 'Мотивационный фокус',
        'en': 'Motivational Focus',
      },
      description: {
        'ru': 'Ваш основной симптом — потеря мотивации и энергии. Апатия, усталость, потеря интереса к тому, что раньше радовало.',
        'en': 'Your main symptom is loss of motivation and energy. Apathy, fatigue, loss of interest in what used to bring joy.',
      },
      whyThisProfile: {
        'ru': 'Среди всех компонентов депрессии у вас доминируют мотивационные симптомы: апатия, усталость, ангедония.',
        'en': 'Among all depression components, motivational symptoms dominate: apathy, fatigue, anhedonia.',
      },
      strengths: {
        'ru': [
          'Понимание, что это симптом, а не лень',
          'Сохранение базовых когнитивных функций',
          'Возможность улучшения через поведенческую активацию',
        ],
        'en': [
          'Understanding that this is a symptom, not laziness',
          'Preserved basic cognitive functions',
          'Possibility of improvement through behavioral activation',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Апатия и потеря интереса к жизни',
          'Хроническая усталость без физической причины',
          'Ангедония — неспособность получать удовольствие',
          'Прокрастинация и избегание',
        ],
        'en': [
          'Apathy and loss of interest in life',
          'Chronic fatigue without physical cause',
          'Anhedonia — inability to experience pleasure',
          'Procrastination and avoidance',
        ],
      },
      recommendations: {
        'ru': [
          'Поведенческая активация: планируйте маленькие приятные действия каждый день',
          'Начинайте с очень маленьких шагов — 5 минут любой активности',
          'Не ждите мотивации — действие создаёт мотивацию, не наоборот',
          'Составьте список того, что раньше приносило радость, и попробуйте одно',
          'Физическая активность — мощный антидепрессант (даже 10 минут)',
          'Структурируйте день — режим помогает при апатии',
        ],
        'en': [
          'Behavioral activation: plan small pleasant activities every day',
          'Start with very small steps — 5 minutes of any activity',
          'Don\'t wait for motivation — action creates motivation, not vice versa',
          'Make a list of what used to bring joy and try one thing',
          'Physical activity — powerful antidepressant (even 10 minutes)',
          'Structure your day — routine helps with apathy',
        ],
      },
      tryToday: {
        'ru': 'Выберите одно действие, которое раньше приносило радость (пусть даже маленькое), и сделайте его в течение 5 минут. Не ждите, что почувствуете удовольствие — просто сделайте.',
        'en': 'Choose one action that used to bring joy (even small) and do it for 5 minutes. Don\'t expect to feel pleasure — just do it.',
      },
      inspiringConclusion: {
        'ru': 'Апатия обманывает вас, говоря "это не поможет". Но каждое маленькое действие — это победа над депрессией. Мотивация вернётся, когда вы начнёте двигаться.',
        'en': 'Apathy deceives you by saying "this won\'t help". But every small action is a victory over depression. Motivation will return when you start moving.',
      },
    ),

    'profile_somatic_focus': TestProfile(
      id: 'profile_somatic_focus',
      name: {
        'ru': 'Соматический фокус',
        'en': 'Somatic Focus',
      },
      description: {
        'ru': 'Ваш основной симптом — физические проявления депрессии. Нарушения сна, аппетита, боли, усталость — тело говорит о депрессии.',
        'en': 'Your main symptom is physical manifestations of depression. Sleep disturbances, appetite changes, pain, fatigue — body speaks about depression.',
      },
      whyThisProfile: {
        'ru': 'Среди всех компонентов депрессии у вас доминируют соматические симптомы: нарушения сна, аппетита, физическая усталость.',
        'en': 'Among all depression components, somatic symptoms dominate: sleep disturbances, appetite changes, physical fatigue.',
      },
      strengths: {
        'ru': [
          'Связь с телесными ощущениями',
          'Возможность улучшения через физические практики',
          'Конкретные симптомы, которые можно отслеживать',
        ],
        'en': [
          'Connection with bodily sensations',
          'Possibility of improvement through physical practices',
          'Concrete symptoms that can be tracked',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Нарушения сна: бессонница или гиперсомния',
          'Изменения аппетита и веса',
          'Физическая усталость и слабость',
          'Необъяснимые боли',
        ],
        'en': [
          'Sleep disturbances: insomnia or hypersomnia',
          'Appetite and weight changes',
          'Physical fatigue and weakness',
          'Unexplained pain',
        ],
      },
      recommendations: {
        'ru': [
          'Обязательно: исключите физические заболевания (анализы, осмотр)',
          'Гигиена сна: режим, темнота, прохлада, никаких экранов за час до сна',
          'Регулярное питание, даже без аппетита — маленькие порции',
          'Физическая активность — но мягкая: прогулки, йога, растяжка',
          'Техники релаксации для тела: прогрессивная мышечная релаксация',
          'Возможно рассмотрение антидепрессантов с седативным эффектом',
        ],
        'en': [
          'Mandatory: rule out physical illness (tests, examination)',
          'Sleep hygiene: routine, darkness, coolness, no screens an hour before bed',
          'Regular meals, even without appetite — small portions',
          'Physical activity — but gentle: walks, yoga, stretching',
          'Body relaxation techniques: progressive muscle relaxation',
          'Consider antidepressants with sedative effect',
        ],
      },
      tryToday: {
        'ru': 'Установите один элемент гигиены сна: ложитесь и вставайте в одно время. Даже если не спите — оставайтесь в постели только для сна.',
        'en': 'Establish one element of sleep hygiene: go to bed and wake up at the same time. Even if you don\'t sleep — stay in bed only for sleep.',
      },
      inspiringConclusion: {
        'ru': 'Тело и психика неразрывно связаны. Забота о физическом здоровье — это забота о душевном. Маленькие шаги к здоровому телу приведут к здоровому духу.',
        'en': 'Body and psyche are inseparably connected. Caring for physical health is caring for mental health. Small steps toward a healthy body will lead to a healthy spirit.',
      },
    ),

    'profile_social_focus': TestProfile(
      id: 'profile_social_focus',
      name: {
        'ru': 'Социальный фокус',
        'en': 'Social Focus',
      },
      description: {
        'ru': 'Ваш основной симптом — социальная изоляция. Вы избегаете общения, чувствуете себя одиноким, отношения страдают.',
        'en': 'Your main symptom is social isolation. You avoid communication, feel lonely, relationships suffer.',
      },
      whyThisProfile: {
        'ru': 'Среди всех компонентов депрессии у вас доминируют социальные симптомы: изоляция, избегание общения, одиночество.',
        'en': 'Among all depression components, social symptoms dominate: isolation, avoiding communication, loneliness.',
      },
      strengths: {
        'ru': [
          'Осознание важности социальных связей',
          'Понимание, что изоляция — симптом, а не выбор',
          'Возможность улучшения через маленькие социальные контакты',
        ],
        'en': [
          'Awareness of the importance of social connections',
          'Understanding that isolation is a symptom, not a choice',
          'Possibility of improvement through small social contacts',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Избегание социальных контактов',
          'Чувство одиночества и непонимания',
          'Ухудшение отношений',
          'Усиление депрессии от изоляции',
        ],
        'en': [
          'Avoiding social contacts',
          'Feeling of loneliness and misunderstanding',
          'Deterioration of relationships',
          'Worsening depression from isolation',
        ],
      },
      recommendations: {
        'ru': [
          'Начните с малого: один короткий контакт в день (сообщение, звонок)',
          'Не ждите, пока захочется общаться — депрессия этого не позволит',
          'Расскажите хотя бы одному человеку о своём состоянии',
          'Групповая терапия особенно эффективна при социальных симптомах',
          'Онлайн-сообщества поддержки, если реальные контакты слишком сложны',
          'Структурированная социальная активность: клуб, класс, волонтёрство',
        ],
        'en': [
          'Start small: one short contact per day (message, call)',
          'Don\'t wait until you want to communicate — depression won\'t allow it',
          'Tell at least one person about your condition',
          'Group therapy is especially effective for social symptoms',
          'Online support communities if real contacts are too difficult',
          'Structured social activity: club, class, volunteering',
        ],
      },
      tryToday: {
        'ru': 'Напишите одно сообщение кому-то, о ком вы думали. Не нужно объяснять своё состояние — просто "привет, как дела?" уже контакт.',
        'en': 'Send one message to someone you\'ve been thinking about. No need to explain your condition — just "hi, how are you?" is already contact.',
      },
      inspiringConclusion: {
        'ru': 'Депрессия хочет изолировать вас. Но люди — лучшее лекарство. Каждый маленький контакт — это победа над изоляцией и шаг к выздоровлению.',
        'en': 'Depression wants to isolate you. But people are the best medicine. Every small contact is a victory over isolation and a step toward recovery.',
      },
    ),

    'profile_moderate': TestProfile(
      id: 'profile_moderate',
      name: {
        'ru': 'Умеренная депрессия',
        'en': 'Moderate Depression',
      },
      description: {
        'ru': 'У вас умеренно выраженные симптомы депрессии по нескольким компонентам. Это состояние требует внимания и, возможно, профессиональной помощи.',
        'en': 'You have moderately pronounced depression symptoms across several components. This condition requires attention and possibly professional help.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают умеренное повышение по нескольким компонентам депрессии без явного доминирования одного.',
        'en': 'Your answers show moderate elevation across several depression components without clear dominance of any one.',
      },
      strengths: {
        'ru': [
          'Сохранение базовой функциональности',
          'Способность распознать проблему',
          'Мотивация искать помощь',
        ],
        'en': [
          'Preserved basic functionality',
          'Ability to recognize the problem',
          'Motivation to seek help',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Множественные симптомы депрессии',
          'Снижение качества жизни',
          'Риск ухудшения без лечения',
        ],
        'en': [
          'Multiple depression symptoms',
          'Reduced quality of life',
          'Risk of worsening without treatment',
        ],
      },
      recommendations: {
        'ru': [
          'Рекомендуется консультация психолога или психотерапевта',
          'КПТ (когнитивно-поведенческая терапия) — эффективный метод',
          'Возможно обсуждение антидепрессантов с врачом',
          'Поддержка образа жизни: сон, питание, физическая активность',
          'Расскажите близким о своём состоянии',
          'Не откладывайте обращение за помощью',
        ],
        'en': [
          'Consultation with psychologist or psychotherapist recommended',
          'CBT (cognitive behavioral therapy) — effective method',
          'Possible discussion of antidepressants with doctor',
          'Lifestyle support: sleep, nutrition, physical activity',
          'Tell loved ones about your condition',
          'Do not delay seeking help',
        ],
      },
      tryToday: {
        'ru': 'Запишитесь на консультацию к психологу или психотерапевту. Первый шаг — самый важный.',
        'en': 'Schedule a consultation with a psychologist or psychotherapist. The first step is the most important.',
      },
      inspiringConclusion: {
        'ru': 'Умеренная депрессия хорошо поддаётся лечению. С правильной помощью большинство людей выздоравливают. Вы не должны справляться в одиночку.',
        'en': 'Moderate depression responds well to treatment. With proper help, most people recover. You don\'t have to cope alone.',
      },
    ),

    'profile_severe': TestProfile(
      id: 'profile_severe',
      name: {
        'ru': 'Выраженная депрессия',
        'en': 'Severe Depression',
      },
      description: {
        'ru': 'У вас выраженные симптомы депрессии. Это серьёзное состояние, которое требует профессиональной помощи. Вы не должны справляться с этим в одиночку.',
        'en': 'You have pronounced depression symptoms. This is a serious condition that requires professional help. You should not cope with this alone.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают высокий уровень по большинству компонентов депрессии. Это хроническое состояние, влияющее на все сферы жизни.',
        'en': 'Your answers show high levels across most depression components. This is a chronic condition affecting all areas of life.',
      },
      strengths: {
        'ru': [
          'Вы прошли этот тест — значит, ищете помощь',
          'Осознание серьёзности ситуации',
          'Депрессия лечится, даже выраженная',
        ],
        'en': [
          'You took this test — meaning you seek help',
          'Awareness of the seriousness of the situation',
          'Depression is treatable, even severe',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Выраженные эмоциональные, когнитивные и физические симптомы',
          'Значительное снижение функционирования',
          'Социальная изоляция',
          'Возможные мысли о бессмысленности жизни',
        ],
        'en': [
          'Pronounced emotional, cognitive and physical symptoms',
          'Significant reduction in functioning',
          'Social isolation',
          'Possible thoughts about meaninglessness of life',
        ],
      },
      recommendations: {
        'ru': [
          'ОБЯЗАТЕЛЬНО: обратитесь к психиатру или психотерапевту',
          'Антидепрессанты + психотерапия — наиболее эффективная комбинация',
          'Возможен больничный лист — здоровье важнее работы',
          'Расскажите близким — вам нужна поддержка',
          'Не оставайтесь одни, особенно если есть мысли о смерти',
          'Если есть мысли о самоповреждении — обратитесь за срочной помощью',
        ],
        'en': [
          'MANDATORY: see a psychiatrist or psychotherapist',
          'Antidepressants + psychotherapy — most effective combination',
          'Sick leave possible — health is more important than work',
          'Tell loved ones — you need support',
          'Don\'t stay alone, especially if you have thoughts about death',
          'If you have thoughts of self-harm — seek urgent help',
        ],
      },
      tryToday: {
        'ru': 'Позвоните близкому человеку и честно скажите: "Мне сейчас очень плохо, мне нужна поддержка". Вы заслуживаете помощи.',
        'en': 'Call a loved one and honestly say: "I\'m feeling very bad right now, I need support." You deserve help.',
      },
      inspiringConclusion: {
        'ru': 'Депрессия — это болезнь, а не слабость характера. Она лечится. Миллионы людей прошли через это и выздоровели. Вы тоже сможете — с правильной помощью.',
        'en': 'Depression is an illness, not a character weakness. It is treatable. Millions of people have gone through this and recovered. You can too — with proper help.',
      },
    ),

    'profile_very_severe': TestProfile(
      id: 'profile_very_severe',
      name: {
        'ru': 'Тяжёлая депрессия',
        'en': 'Very Severe Depression',
      },
      description: {
        'ru': 'У вас тяжёлые симптомы депрессии. Это кризисное состояние, требующее немедленной профессиональной помощи. Пожалуйста, обратитесь за помощью сейчас.',
        'en': 'You have severe depression symptoms. This is a crisis state requiring immediate professional help. Please seek help now.',
      },
      whyThisProfile: {
        'ru': 'Ваши ответы показывают критически высокий уровень по большинству или всем компонентам депрессии.',
        'en': 'Your answers show critically high levels across most or all depression components.',
      },
      strengths: {
        'ru': [
          'Вы прошли этот тест — это акт самосохранения',
          'Даже тяжёлая депрессия поддаётся лечению',
          'Помощь доступна прямо сейчас',
        ],
        'en': [
          'You took this test — this is an act of self-preservation',
          'Even severe depression responds to treatment',
          'Help is available right now',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Критически высокий уровень всех симптомов',
          'Серьёзное нарушение функционирования',
          'Риск суицидальных мыслей',
          'Необходимость срочной помощи',
        ],
        'en': [
          'Critically high level of all symptoms',
          'Serious functional impairment',
          'Risk of suicidal thoughts',
          'Need for urgent help',
        ],
      },
      recommendations: {
        'ru': [
          'НЕМЕДЛЕННО: обратитесь к психиатру или в скорую помощь',
          'Если есть мысли о самоповреждении: 8-800-2000-122 (бесплатно, круглосуточно)',
          'Не оставайтесь одни — попросите кого-то быть рядом',
          'Госпитализация может быть необходима и это нормально',
          'Антидепрессанты + психотерапия + поддержка близких',
          'Это временное состояние, которое пройдёт с лечением',
        ],
        'en': [
          'IMMEDIATELY: see a psychiatrist or call emergency services',
          'If you have thoughts of self-harm: please call a crisis helpline',
          'Don\'t stay alone — ask someone to be with you',
          'Hospitalization may be necessary and that is okay',
          'Antidepressants + psychotherapy + support from loved ones',
          'This is a temporary condition that will pass with treatment',
        ],
      },
      tryToday: {
        'ru': 'Прямо сейчас: позвоните на горячую линию 8-800-2000-122 или попросите кого-то отвезти вас к врачу. Это самое важное, что вы можете сделать.',
        'en': 'Right now: call a crisis helpline or ask someone to take you to a doctor. This is the most important thing you can do.',
      },
      inspiringConclusion: {
        'ru': 'Вы в очень тёмном месте сейчас. Но тьма — это не навсегда. Тысячи людей выходили из такой же глубокой депрессии. С помощью — выйдете и вы. Ваша жизнь имеет значение.',
        'en': 'You are in a very dark place right now. But darkness is not forever. Thousands of people have emerged from similarly deep depression. With help — so will you. Your life matters.',
      },
    ),
  };
}
