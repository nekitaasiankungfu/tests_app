import '../models/test_model.dart';

/// Data access class for Anxiety Symptoms Inventory
/// Legacy Dart implementation (no JSON dependency)
class AnxietySymptomsInventoryData {
  /// Get the complete Anxiety Symptoms Inventory test
  static TestModel getAnxietySymptomsInventoryTest() {
    return TestModel(
      id: 'anxiety_symptoms_inventory_v1',
      title: {
        'ru': 'Опросник симптомов тревоги',
        'en': 'Anxiety Symptoms Inventory',
      },
      description: {
        'ru':
            'Тревога — это естественная реакция организма на стресс и потенциальную угрозу. '
            'Однако когда тревога становится чрезмерной, частой или возникает без видимых '
            'причин, она может существенно снижать качество жизни и требует внимания.\n\n'
            'Данный опросник оценивает выраженность симптомов тревоги за последнюю неделю '
            'по четырём ключевым компонентам: телесные ощущения (соматика), беспокойные '
            'мысли (когнитивный компонент), эмоциональное напряжение (аффективный компонент) '
            'и поведенческие реакции избегания.\n\n'
            'Важно понимать: этот тест является инструментом самооценки и НЕ заменяет '
            'профессиональную диагностику. Высокие баллы не означают наличие тревожного '
            'расстройства, но могут быть поводом для консультации со специалистом.',
        'en':
            'Anxiety is a natural response to stress and potential threat. '
            'However, when anxiety becomes excessive, frequent, or occurs without '
            'apparent cause, it can significantly reduce quality of life and requires attention.\n\n'
            'This inventory assesses the severity of anxiety symptoms over the past week '
            'across four key components: physical sensations (somatic), worried thoughts '
            '(cognitive component), emotional tension (affective component), '
            'and avoidance behaviors.\n\n'
            'Important: this test is a self-assessment tool and does NOT replace '
            'professional diagnosis. High scores do not indicate an anxiety disorder, '
            'but may be a reason to consult a specialist.',
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
            'Высокий балл не означает наличие тревожного расстройства — для диагностики '
            'необходима профессиональная оценка.\n\n'
            'Если вы испытываете значительный дистресс или ваши симптомы влияют на '
            'повседневную жизнь, пожалуйста, обратитесь к специалисту.',
        'en':
            'This inventory is a self-assessment and screening tool. '
            'It is NOT intended for diagnosis and does NOT replace consultation '
            'with a qualified specialist (psychiatrist, psychotherapist, clinical psychologist).\n\n'
            'A high score does not indicate an anxiety disorder — professional '
            'evaluation is required for diagnosis.\n\n'
            'If you experience significant distress or your symptoms affect '
            'daily life, please consult a specialist.',
      },
      estimatedTime: 5,
      type: TestType.multiFactor,
      factorIds: [
        'somatic',
        'cognitive',
        'affective',
        'behavioral',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'somatic': {
        'ru': 'Соматические симптомы',
        'en': 'Somatic Symptoms',
      },
      'cognitive': {
        'ru': 'Когнитивные симптомы',
        'en': 'Cognitive Symptoms',
      },
      'affective': {
        'ru': 'Эмоциональные симптомы',
        'en': 'Affective Symptoms',
      },
      'behavioral': {
        'ru': 'Поведенческие симптомы',
        'en': 'Behavioral Symptoms',
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

    // Determine level based on interpretation ranges from JSON
    // minimal: 0-20%, mild: 21-42%, moderate: 43-69%, severe: 70-100%
    final String level;
    if (percentage <= 20) {
      level = 'minimal';
    } else if (percentage <= 42) {
      level = 'mild';
    } else if (percentage <= 69) {
      level = 'moderate';
    } else {
      level = 'severe';
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

  /// Get all 24 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1 - somatic (cardiovascular)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Учащённое сердцебиение или ощущение, что сердце колотится',
          'en': 'Rapid heartbeat or feeling that your heart is pounding',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q2 - cognitive (attention)
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Трудности сосредоточиться из-за беспокойных мыслей',
          'en': 'Difficulty concentrating due to worried thoughts',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q3 - affective (nervousness)
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Чувство нервозности или взвинченности',
          'en': 'Feeling nervous or on edge',
        },
        factorId: 'affective',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q4 - behavioral (sleep)
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Трудности с засыпанием из-за тревожных мыслей',
          'en': 'Difficulty falling asleep due to anxious thoughts',
        },
        factorId: 'behavioral',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q5 - somatic (muscular)
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Напряжение или скованность в мышцах (шея, плечи, спина, челюсть)',
          'en': 'Muscle tension or stiffness (neck, shoulders, back, jaw)',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q6 - cognitive (catastrophizing)
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Мысли о том, что может случиться что-то плохое',
          'en': 'Thoughts that something bad might happen',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q7 - affective (fear)
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Ощущение страха без видимой причины',
          'en': 'Feeling of fear without apparent reason',
        },
        factorId: 'affective',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q8 - behavioral (avoidance)
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Стремление избегать ситуаций, которые вызывают беспокойство',
          'en': 'Tendency to avoid situations that cause worry',
        },
        factorId: 'behavioral',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q9 - somatic (respiratory)
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Ощущение нехватки воздуха или затруднённое дыхание',
          'en': 'Feeling of shortness of breath or difficulty breathing',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q10 - cognitive (racing_thoughts)
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Ощущение, что мысли скачут или трудно их контролировать',
          'en': 'Feeling that thoughts are racing or hard to control',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q11 - affective (impending_doom)
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Чувство, что вот-вот случится что-то ужасное',
          'en': 'Feeling that something terrible is about to happen',
        },
        factorId: 'affective',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q12 - behavioral (restlessness)
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Суетливость, неспособность усидеть на месте',
          'en': 'Restlessness, inability to sit still',
        },
        factorId: 'behavioral',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q13 - somatic (sweating)
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Повышенная потливость (не связанная с жарой или физической нагрузкой)',
          'en': 'Excessive sweating (not related to heat or physical exertion)',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q14 - cognitive (worry)
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Чрезмерное беспокойство о повседневных делах',
          'en': 'Excessive worry about everyday matters',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q15 - affective (irritability)
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Раздражительность или вспыльчивость',
          'en': 'Irritability or quick temper',
        },
        factorId: 'affective',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q16 - behavioral (tension)
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Трудности с расслаблением, постоянное напряжение',
          'en': 'Difficulty relaxing, constant tension',
        },
        factorId: 'behavioral',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q17 - somatic (trembling)
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Дрожь в руках или теле',
          'en': 'Trembling in hands or body',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q18 - cognitive (rumination)
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Мысли, которые прокручиваются снова и снова',
          'en': 'Thoughts that keep repeating over and over',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q19 - affective (inner_unrest)
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Ощущение внутреннего беспокойства или тревоги',
          'en': 'Feeling of inner restlessness or anxiety',
        },
        factorId: 'affective',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q20 - behavioral (checking)
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Проверка и перепроверка вещей (закрыта ли дверь, выключен ли утюг и т.п.)',
          'en': 'Checking and rechecking things (is the door locked, is the iron off, etc.)',
        },
        factorId: 'behavioral',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q21 - somatic (gastrointestinal)
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Неприятные ощущения в животе, тошнота или расстройство желудка',
          'en': 'Unpleasant stomach sensations, nausea or upset stomach',
        },
        factorId: 'somatic',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q22 - cognitive (negative_expectation)
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Ожидание худшего исхода событий',
          'en': 'Expecting the worst outcome of events',
        },
        factorId: 'cognitive',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q23 - affective (insecurity)
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Чувство неуверенности или незащищённости',
          'en': 'Feeling of insecurity or vulnerability',
        },
        factorId: 'affective',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
      // Q24 - behavioral (procrastination)
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Откладывание дел из-за страха не справиться',
          'en': 'Putting off tasks due to fear of not coping',
        },
        factorId: 'behavioral',
        isReversed: false,
        answers: _getIntensityAnswers(),
      ),
    ];
  }

  /// Intensity answers (4-point scale: 0-3) - RULE #1: scores 0-3!
  static List<AnswerModel> _getIntensityAnswers() {
    return [
      AnswerModel(
        id: 'i1',
        text: {
          'ru': 'Совсем нет',
          'en': 'Not at all',
        },
        score: 0, // RULE #1: Start from 0!
      ),
      AnswerModel(
        id: 'i2',
        text: {
          'ru': 'Слегка',
          'en': 'Slightly',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'i3',
        text: {
          'ru': 'Умеренно',
          'en': 'Moderately',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'i4',
        text: {
          'ru': 'Сильно',
          'en': 'Severely',
        },
        score: 3, // RULE #1: End at 3 for 4-point scale!
      ),
    ];
  }

  /// Get factor interpretations by level
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'somatic': {
        'minimal': {
          'title_ru': 'Минимальные соматические симптомы',
          'title_en': 'Minimal Somatic Symptoms',
          'description_ru':
              'Телесные симптомы тревоги минимальны или отсутствуют. '
              'Ваше тело редко реагирует на стресс физическими проявлениями.',
          'description_en':
              'Physical anxiety symptoms are minimal or absent. '
              'Your body rarely responds to stress with physical manifestations.',
        },
        'mild': {
          'title_ru': 'Лёгкие соматические симптомы',
          'title_en': 'Mild Somatic Symptoms',
          'description_ru':
              'Присутствуют отдельные телесные проявления тревоги. '
              'Вы можете периодически ощущать напряжение, учащённое сердцебиение '
              'или другие физические симптомы, но они не причиняют значительного дискомфорта.',
          'description_en':
              'Some physical manifestations of anxiety are present. '
              'You may occasionally experience tension, rapid heartbeat, '
              'or other physical symptoms, but they don\'t cause significant discomfort.',
        },
        'moderate': {
          'title_ru': 'Умеренные соматические симптомы',
          'title_en': 'Moderate Somatic Symptoms',
          'description_ru':
              'Присутствуют заметные телесные проявления тревоги. '
              'Вы можете ощущать напряжение, сердцебиение или другие физические симптомы '
              'достаточно часто. Рекомендуется практиковать техники релаксации '
              'и исключить соматические заболевания у терапевта.',
          'description_en':
              'Notable physical manifestations of anxiety are present. '
              'You may feel tension, palpitations, or other physical symptoms '
              'quite often. Practicing relaxation techniques is recommended, '
              'as well as ruling out medical conditions with a doctor.',
        },
        'severe': {
          'title_ru': 'Выраженные соматические симптомы',
          'title_en': 'Severe Somatic Symptoms',
          'description_ru':
              'Выраженные соматические симптомы. Тело сильно реагирует на тревогу. '
              'Рекомендуется обратиться к специалисту и исключить соматические '
              'заболевания у терапевта. Практикуйте диафрагмальное дыхание '
              'и прогрессивную мышечную релаксацию.',
          'description_en':
              'Severe somatic symptoms. Your body strongly reacts to anxiety. '
              'Consulting a specialist is recommended, as well as ruling out '
              'medical conditions with a doctor. Practice diaphragmatic breathing '
              'and progressive muscle relaxation.',
        },
      },
      'cognitive': {
        'minimal': {
          'title_ru': 'Минимальные когнитивные симптомы',
          'title_en': 'Minimal Cognitive Symptoms',
          'description_ru':
              'Тревожные мысли редки и не мешают повседневной жизни. '
              'Вы хорошо контролируете свои мысли и легко переключаетесь.',
          'description_en':
              'Anxious thoughts are rare and don\'t interfere with daily life. '
              'You have good control over your thoughts and switch easily.',
        },
        'mild': {
          'title_ru': 'Лёгкие когнитивные симптомы',
          'title_en': 'Mild Cognitive Symptoms',
          'description_ru':
              'Беспокойные мысли появляются периодически, но вы способны '
              'с ними справляться. Иногда бывает трудно переключиться или сосредоточиться.',
          'description_en':
              'Worried thoughts appear periodically, but you are able to cope '
              'with them. Sometimes it\'s difficult to switch or concentrate.',
        },
        'moderate': {
          'title_ru': 'Умеренные когнитивные симптомы',
          'title_en': 'Moderate Cognitive Symptoms',
          'description_ru':
              'Беспокойные мысли появляются регулярно. Может быть трудно '
              'переключиться или сосредоточиться. Рекомендуется вести дневник мыслей '
              'и практиковать техники осознанности.',
          'description_en':
              'Worried thoughts appear regularly. It may be difficult '
              'to switch or concentrate. Keeping a thought journal '
              'and practicing mindfulness techniques is recommended.',
        },
        'severe': {
          'title_ru': 'Выраженные когнитивные симптомы',
          'title_en': 'Severe Cognitive Symptoms',
          'description_ru':
              'Тревожные мысли занимают значительную часть времени. '
              'Выражены катастрофизация и руминации. Рекомендуется обратиться '
              'к психологу или психотерапевту для работы с когнитивными искажениями.',
          'description_en':
              'Anxious thoughts take up a significant amount of time. '
              'Catastrophizing and rumination are pronounced. Consulting '
              'a psychologist or psychotherapist to work on cognitive distortions is recommended.',
        },
      },
      'affective': {
        'minimal': {
          'title_ru': 'Минимальные эмоциональные симптомы',
          'title_en': 'Minimal Emotional Symptoms',
          'description_ru':
              'Эмоциональное состояние стабильное, тревожные чувства редки. '
              'Вы хорошо справляетесь с эмоциональным напряжением.',
          'description_en':
              'Emotional state is stable, anxious feelings are rare. '
              'You cope well with emotional tension.',
        },
        'mild': {
          'title_ru': 'Лёгкие эмоциональные симптомы',
          'title_en': 'Mild Emotional Symptoms',
          'description_ru':
              'Периодически возникают чувства нервозности, страха или беспокойства, '
              'но они не оказывают существенного влияния на вашу жизнь.',
          'description_en':
              'Feelings of nervousness, fear, or worry arise periodically, '
              'but they don\'t significantly affect your life.',
        },
        'moderate': {
          'title_ru': 'Умеренные эмоциональные симптомы',
          'title_en': 'Moderate Emotional Symptoms',
          'description_ru':
              'Периодически возникают чувства нервозности, страха или беспокойства. '
              'Рекомендуется практиковать техники эмоциональной регуляции '
              'и не подавлять эмоции, а наблюдать за ними.',
          'description_en':
              'Feelings of nervousness, fear, or worry arise periodically. '
              'Practicing emotional regulation techniques is recommended. '
              'Don\'t suppress emotions, but observe them.',
        },
        'severe': {
          'title_ru': 'Выраженные эмоциональные симптомы',
          'title_en': 'Severe Emotional Symptoms',
          'description_ru':
              'Выраженное эмоциональное напряжение. Частые переживания страха, '
              'тревоги, ощущения надвигающейся беды. Рекомендуется обратиться '
              'к специалисту. Поделитесь переживаниями с близким человеком.',
          'description_en':
              'Pronounced emotional tension. Frequent feelings of fear, '
              'anxiety, sense of impending doom. Consulting a specialist is recommended. '
              'Share your experiences with someone close.',
        },
      },
      'behavioral': {
        'minimal': {
          'title_ru': 'Минимальные поведенческие симптомы',
          'title_en': 'Minimal Behavioral Symptoms',
          'description_ru':
              'Тревога не влияет существенно на ваше поведение. '
              'Вы сохраняете привычный образ жизни и активности.',
          'description_en':
              'Anxiety doesn\'t significantly affect your behavior. '
              'You maintain your usual lifestyle and activities.',
        },
        'mild': {
          'title_ru': 'Лёгкие поведенческие симптомы',
          'title_en': 'Mild Behavioral Symptoms',
          'description_ru':
              'Тревога может немного влиять на поведение: периодическое избегание '
              'некоторых ситуаций, небольшие трудности со сном или расслаблением.',
          'description_en':
              'Anxiety may slightly affect behavior: occasional avoidance '
              'of some situations, minor difficulties with sleep or relaxation.',
        },
        'moderate': {
          'title_ru': 'Умеренные поведенческие симптомы',
          'title_en': 'Moderate Behavioral Symptoms',
          'description_ru':
              'Тревога начинает влиять на поведение: избегание ситуаций, '
              'трудности со сном, суетливость. Рекомендуется установить здоровый '
              'режим сна и постепенно возвращаться к избегаемым ситуациям.',
          'description_en':
              'Anxiety is starting to affect behavior: avoiding situations, '
              'sleep difficulties, restlessness. Establishing a healthy sleep '
              'schedule and gradually returning to avoided situations is recommended.',
        },
        'severe': {
          'title_ru': 'Выраженные поведенческие симптомы',
          'title_en': 'Severe Behavioral Symptoms',
          'description_ru':
              'Выраженные поведенческие реакции. Значительное избегание, '
              'нарушения сна, трудности с расслаблением. Рекомендуется обратиться '
              'к специалисту для работы над поведенческими паттернами.',
          'description_en':
              'Pronounced behavioral reactions. Significant avoidance, '
              'sleep disturbances, difficulty relaxing. Consulting a specialist '
              'to work on behavioral patterns is recommended.',
        },
      },
    };
  }
}
