import '../models/test_model.dart';

/// Data access class for Attachment Style Test
/// ⚠️ IMPORTANT: Class name is AttachmentStyleData (WITHOUT "Test" suffix)
class AttachmentStyleData {
  /// Get the complete Attachment Style test
  static TestModel getAttachmentStyleTest() {
    return TestModel(
      id: 'attachment_style_v1',
      title: {
        'ru': 'Стили привязанности: Ваши паттерны в отношениях',
        'en': 'Attachment Style: Your Relationship Patterns',
      },
      description: {
        'ru':
            'Стиль привязанности — это глубинный паттерн того, как вы формируете эмоциональные связи с другими людьми. Тест измеряет 4 стиля: Безопасная, Тревожная, Избегающая и Тревожно-избегающая привязанность.',
        'en':
            'Attachment style is a deep-rooted pattern of how you form emotional bonds with others. The test measures 4 styles: Secure, Anxious, Avoidant, and Fearful-Avoidant attachment.',
      },
      category: {
        'ru': 'Отношения',
        'en': 'Relationships',
      },
      categoryId: 'relationships',
      questions: _getQuestions(),
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: [
        'secure',
        'anxious',
        'avoidant',
        'fearful_avoidant',
      ],
      disclaimer: {
        'ru':
            'Этот тест предназначен для самопознания и понимания паттернов отношений. Не является клиническим диагнозом. Стили привязанности можно изменить через терапию и здоровые отношения.',
        'en':
            'This test is for self-awareness and understanding relationship patterns. Not a clinical diagnosis. Attachment styles can be changed through therapy and healthy relationships.',
      },
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'secure': {
        'ru': 'Безопасная привязанность (Secure)',
        'en': 'Secure Attachment',
      },
      'anxious': {
        'ru': 'Тревожная привязанность (Anxious-Preoccupied)',
        'en': 'Anxious-Preoccupied Attachment',
      },
      'avoidant': {
        'ru': 'Избегающая привязанность (Dismissive-Avoidant)',
        'en': 'Dismissive-Avoidant Attachment',
      },
      'fearful_avoidant': {
        'ru': 'Тревожно-избегающая привязанность (Fearful-Avoidant)',
        'en': 'Fearful-Avoidant Attachment',
      },
    };
  }

  /// Get factor interpretation based on percentage (0-100)
  /// ⚠️ CRITICAL: NaN protection (RULE #5)
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // NaN protection
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    switch (factorId) {
      case 'secure':
        if (percentage <= 40) {
          return {
            'ru':
                'Низкая безопасная привязанность\n\nВы можете испытывать трудности с доверием и близостью. Рассмотрите работу с терапевтом для развития более безопасного стиля привязанности.',
            'en':
                'Low Secure Attachment\n\nYou may experience difficulties with trust and intimacy. Consider working with a therapist to develop a more secure attachment style.',
          };
        } else if (percentage <= 70) {
          return {
            'ru':
                'Умеренная безопасная привязанность\n\nУ вас есть признаки безопасной привязанности, но могут быть области для роста. Продолжайте работу над доверием и открытостью.',
            'en':
                'Moderate Secure Attachment\n\nYou have signs of secure attachment but there may be areas for growth. Continue working on trust and openness.',
          };
        } else {
          return {
            'ru':
                'Высокая безопасная привязанность 🟢\n\nВы комфортно чувствуете себя с близостью и автономией. У вас здоровое доверие и способность к уязвимости. Продолжайте развивать эмоциональный интеллект и помогайте партнёру расти.',
            'en':
                'High Secure Attachment 🟢\n\nYou feel comfortable with both intimacy and autonomy. You have healthy trust and capacity for vulnerability. Continue developing emotional intelligence and help your partner grow.',
          };
        }

      case 'anxious':
        if (percentage <= 40) {
          return {
            'ru':
                'Низкая тревожная привязанность\n\nВы не склонны к постоянному беспокойству о том, что вас покинут. Это здоровый признак безопасной привязанности.',
            'en':
                'Low Anxious Attachment\n\nYou\'re not prone to constant worry about being abandoned. This is a healthy sign of secure attachment.',
          };
        } else if (percentage <= 70) {
          return {
            'ru':
                'Умеренная тревожная привязанность\n\nВы иногда беспокоитесь о любви партнёра. Работайте над самооценкой и развитием независимости вне отношений. Практикуйте mindfulness для управления тревогой.',
            'en':
                'Moderate Anxious Attachment\n\nYou sometimes worry about your partner\'s love. Work on self-esteem and developing independence outside relationships. Practice mindfulness for anxiety management.',
          };
        } else {
          return {
            'ru':
                'Высокая тревожная привязанность 🟡\n\nВы жаждете близости, но постоянно беспокоитесь о том, что вас бросят. Рекомендации: терапия (КПТ), работа над самооценкой, развитие идентичности вне отношений, выбор безопасных партнёров. Избегайте избегающих партнёров!',
            'en':
                'High Anxious Attachment 🟡\n\nYou crave closeness but constantly worry about being abandoned. Recommendations: therapy (CBT), work on self-esteem, develop identity outside relationships, choose secure partners. Avoid avoidant partners!',
          };
        }

      case 'avoidant':
        if (percentage <= 40) {
          return {
            'ru':
                'Низкая избегающая привязанность\n\nВы не избегаете эмоциональной близости. Это здоровый признак способности к уязвимости и доверию.',
            'en':
                'Low Avoidant Attachment\n\nYou don\'t avoid emotional closeness. This is a healthy sign of capacity for vulnerability and trust.',
          };
        } else if (percentage <= 70) {
          return {
            'ru':
                'Умеренная избегающая привязанность\n\nВы иногда дистанцируетесь в отношениях. Практикуйте уязвимость в безопасной среде. Осознавайте и выражайте эмоции. Не обесценивайте важность отношений.',
            'en':
                'Moderate Avoidant Attachment\n\nYou sometimes distance yourself in relationships. Practice vulnerability in safe environments. Recognize and express emotions. Don\'t devalue importance of relationships.',
          };
        } else {
          return {
            'ru':
                'Высокая избегающая привязанность 🔵\n\nВы цените независимость и испытываете дискомфорт с эмоциональной близостью. Рекомендации: терапия (работа с детскими ранами), практика уязвимости, осознание эмоций, выбор терпеливого партнёра. Помните: близость — не слабость.',
            'en':
                'High Avoidant Attachment 🔵\n\nYou value independence and feel uncomfortable with emotional closeness. Recommendations: therapy (childhood wound work), practice vulnerability, recognize emotions, choose patient partner. Remember: intimacy is not weakness.',
          };
        }

      case 'fearful_avoidant':
        if (percentage <= 40) {
          return {
            'ru':
                'Низкая тревожно-избегающая привязанность\n\nВы не испытываете одновременного страха близости и одиночества. Это здоровый признак стабильной привязанности.',
            'en':
                'Low Fearful-Avoidant Attachment\n\nYou don\'t experience simultaneous fear of intimacy and loneliness. This is a healthy sign of stable attachment.',
          };
        } else if (percentage <= 70) {
          return {
            'ru':
                'Умеренная тревожно-избегающая привязанность\n\nВы иногда испытываете противоречивые чувства в отношениях. Рекомендуется работа с терапевтом для понимания и исцеления этих паттернов.',
            'en':
                'Moderate Fearful-Avoidant Attachment\n\nYou sometimes experience contradictory feelings in relationships. Working with a therapist is recommended to understand and heal these patterns.',
          };
        } else {
          return {
            'ru':
                'Высокая тревожно-избегающая привязанность 🔴\n\nВы одновременно жаждете близости и боитесь её. ОБЯЗАТЕЛЬНА профессиональная терапия! Рекомендации: trauma-focused CBT, EMDR, DBT (регуляция эмоций), работа с детской травмой. Без терапии паттерны будут повторяться. Исцеление возможно!',
            'en':
                'High Fearful-Avoidant Attachment 🔴\n\nYou simultaneously crave and fear intimacy. PROFESSIONAL THERAPY IS ESSENTIAL! Recommendations: trauma-focused CBT, EMDR, DBT (emotion regulation), childhood trauma work. Without therapy, patterns will repeat. Healing is possible!',
          };
        }

      default:
        return {
          'ru': 'Неизвестный фактор',
          'en': 'Unknown factor',
        };
    }
  }

  /// Private method to get all 40 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // SECURE (questions 1, 5, 9, 13, 17, 21, 25, 29, 33, 37)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я чувствую себя комфортно, открываясь партнёру эмоционально',
          'en': 'I feel comfortable opening up to my partner emotionally',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'secure',
      ),
      // ANXIOUS (questions 2, 6, 10, 14, 18, 22, 26, 30, 34, 38)
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Я часто беспокоюсь, что партнёр на самом деле меня не любит',
          'en': 'I often worry that my partner doesn\'t really love me',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'anxious',
      ),
      // AVOIDANT (questions 3, 7, 11, 15, 19, 23, 27, 31, 35, 39)
      QuestionModel(
        id: 'q3',
        text: {
          'ru':
              'Мне некомфортно, когда партнёр хочет быть слишком близким эмоционально',
          'en':
              'I feel uncomfortable when my partner wants to be too emotionally close',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'avoidant',
      ),
      // FEARFUL_AVOIDANT (questions 4, 8, 12, 16, 20, 24, 28, 32, 36, 40)
      QuestionModel(
        id: 'q4',
        text: {
          'ru':
              'Я хочу быть близким с партнёром, но боюсь, что меня снова ранят',
          'en':
              'I want to be close to my partner but fear being hurt again',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'fearful_avoidant',
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru':
              'Я могу быть независимым, но при этом чувствовать себя близким с партнёром',
          'en':
              'I can be independent while still feeling close to my partner',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'secure',
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru':
              'Если партнёр не отвечает на сообщения быстро, я начинаю переживать',
          'en':
              'If my partner doesn\'t respond to messages quickly, I start to worry',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'anxious',
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Я предпочитаю держать эмоциональную дистанцию в отношениях',
          'en': 'I prefer to maintain emotional distance in relationships',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'avoidant',
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я одновременно жажду близости и боюсь её',
          'en': 'I simultaneously crave and fear closeness',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'fearful_avoidant',
      ),
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я легко доверяю партнёру и не беспокоюсь о предательстве',
          'en': 'I easily trust my partner and don\'t worry about betrayal',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'secure',
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Мне нужно постоянное подтверждение любви от партнёра',
          'en': 'I need constant reassurance of love from my partner',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'anxious',
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'Я чувствую себя лучше, когда сохраняю эмоциональную независимость',
          'en': 'I feel better when I maintain emotional independence',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'avoidant',
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Я часто сомневаюсь, стоит ли мне вообще быть в отношениях',
          'en': 'I often doubt whether I should even be in a relationship',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'fearful_avoidant',
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru':
              'Я могу открыто обсуждать свои чувства и потребности с партнёром',
          'en':
              'I can openly discuss my feelings and needs with my partner',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'secure',
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru':
              'Я очень расстраиваюсь, когда партнёр проводит время без меня',
          'en': 'I get very upset when my partner spends time without me',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'anxious',
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru':
              'Разговоры о чувствах кажутся мне неудобными и ненужными',
          'en':
              'Talking about feelings seems uncomfortable and unnecessary to me',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'avoidant',
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Я часто притягиваюсь к людям, а затем отталкиваю их',
          'en': 'I often attract people and then push them away',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'fearful_avoidant',
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я не боюсь, что партнёр меня бросит',
          'en': 'I\'m not afraid that my partner will leave me',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'secure',
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru':
              'Я склонен переживать о том, что партнёр не так сильно вовлечён в отношения',
          'en':
              'I tend to worry that my partner isn\'t as invested in the relationship',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'anxious',
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru':
              'Я стараюсь не слишком полагаться на партнёра эмоционально',
          'en': 'I try not to rely too much on my partner emotionally',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'avoidant',
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru':
              'Доверие другим даётся мне очень тяжело из-за прошлого опыта',
          'en':
              'Trusting others is very difficult for me due to past experiences',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'fearful_avoidant',
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru':
              'Я комфортно себя чувствую как в близости, так и в одиночестве',
          'en': 'I feel comfortable both in closeness and in solitude',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'secure',
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Я часто чувствую себя недооценённым в отношениях',
          'en': 'I often feel undervalued in relationships',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'anxious',
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru':
              'Мне важнее личная свобода, чем эмоциональная близость',
          'en':
              'Personal freedom is more important to me than emotional closeness',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'avoidant',
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru':
              'Когда кто-то становится слишком близким, я чувствую желание дистанцироваться',
          'en':
              'When someone gets too close, I feel the urge to distance myself',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'fearful_avoidant',
      ),
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я могу спокойно разрешать конфликты в отношениях',
          'en': 'I can calmly resolve conflicts in relationships',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'secure',
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru':
              'Малейший конфликт заставляет меня бояться расставания',
          'en':
              'The slightest conflict makes me fear a breakup',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'anxious',
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru':
              'Когда партнёр хочет поговорить о чувствах, я стремлюсь уйти от разговора',
          'en':
              'When my partner wants to talk about feelings, I try to avoid the conversation',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'avoidant',
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru':
              'Мне трудно понять, чего я на самом деле хочу от отношений',
          'en':
              'It\'s difficult for me to understand what I really want from relationships',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'fearful_avoidant',
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я чувствую себя в безопасности, полагаясь на партнёра',
          'en': 'I feel safe relying on my partner',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'secure',
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru':
              'Я постоянно ищу признаки того, что партнёр теряет интерес',
          'en':
              'I constantly look for signs that my partner is losing interest',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'anxious',
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru':
              'Я считаю, что слишком большая близость делает меня уязвимым',
          'en': 'I believe too much closeness makes me vulnerable',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'avoidant',
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru':
              'У меня есть глубокий страх быть покинутым, но я также боюсь слишком сильной зависимости',
          'en':
              'I have a deep fear of being abandoned, but I also fear too much dependency',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'fearful_avoidant',
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Мне легко быть уязвимым с партнёром',
          'en': 'It\'s easy for me to be vulnerable with my partner',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'secure',
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru':
              'Я становлюсь очень эмоциональным, когда чувствую дистанцию от партнёра',
          'en':
              'I become very emotional when I feel distance from my partner',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'anxious',
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru':
              'Я чувствую себя комфортно без глубокой эмоциональной вовлечённости',
          'en':
              'I feel comfortable without deep emotional involvement',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'avoidant',
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru':
              'Мои отношения часто характеризуются драматическими взлётами и падениями',
          'en':
              'My relationships are often characterized by dramatic ups and downs',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'fearful_avoidant',
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru':
              'Я верю, что могу рассчитывать на партнёра в трудные времена',
          'en': 'I believe I can count on my partner in difficult times',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'secure',
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru':
              'Я часто чувствую, что люблю сильнее, чем меня любят',
          'en': 'I often feel I love more than I\'m loved',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'anxious',
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru':
              'Я предпочитаю не раскрываться полностью даже близким людям',
          'en':
              'I prefer not to open up completely even to close people',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'avoidant',
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru':
              'Я чувствую себя недостойным любви, но отчаянно нуждаюсь в ней',
          'en': 'I feel unworthy of love but desperately need it',
        },
        answers: _get5PointLikertAnswers(),
        factorId: 'fearful_avoidant',
      ),
    ];
  }

  /// Standard 5-point Likert scale answers (scores 0-4)
  /// ⚠️ CRITICAL: Scores MUST be 0-4 (RULE #1)
  static List<AnswerModel> _get5PointLikertAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совсем не про меня',
          'en': 'Not at all like me',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Редко про меня',
          'en': 'Rarely like me',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Иногда про меня',
          'en': 'Sometimes like me',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Часто про меня',
          'en': 'Often like me',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью про меня',
          'en': 'Completely like me',
        },
        score: 4,
      ),
    ];
  }
}
