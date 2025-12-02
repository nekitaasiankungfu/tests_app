import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Данные теста "Стили привязанности в отношениях"
///
/// Комплексная оценка стилей привязанности по 4 измерениям:
/// - Secure (Безопасный): комфорт с близостью и независимостью
/// - Anxious (Тревожный): страх отвержения, потребность в подтверждении
/// - Avoidant (Избегающий): дискомфорт с близостью, фокус на независимости
/// - Fearful (Дезорганизованный): противоречивые чувства о близости
///
/// Основан на:
/// - Теории привязанности Джона Боулби
/// - Исследованиях Мэри Эйнсворт о паттернах привязанности
/// - Современных моделях привязанности у взрослых (Хазан и Шейвер)
/// - Двухмерной модели привязанности (тревожность и избегание)
///
/// 60 вопросов, 4 фактора, 5-балльная шкала Лайкерта
class AttachmentStyleData {
  /// Получить тест как TestModel
  static TestModel getAttachmentStylesTest() {
    return TestModel(
      id: 'attachment_styles_v1',
      title: {
        'ru': 'Тест стилей привязанности в отношениях',
        'en': 'Attachment Styles in Relationships Test',
      },
      description: {
        'ru':
            'Этот тест поможет вам понять ваш стиль привязанности — уникальный паттерн того, как вы формируете и поддерживаете близкие отношения. Стиль привязанности формируется в раннем детстве и влияет на то, как вы взаимодействуете с партнерами, друзьями и близкими людьми во взрослой жизни.',
        'en':
            'This test will help you understand your attachment style — a unique pattern of how you form and maintain close relationships. Attachment style is formed in early childhood and affects how you interact with partners, friends and loved ones in adulthood.',
      },
      category: {'ru': 'Отношения', 'en': 'Relationships'},
      categoryId: 'relationships',
      estimatedTime: 12,
      factorIds: [
        'secure',
        'anxious',
        'avoidant',
        'fearful',
      ],
      questions: _getQuestions(),
      type: TestType.multiFactor,
    );
  }

  /// Вспомогательная функция для создания стандартных ответов Likert-5
  /// ПРАВИЛО #1: scores MUST be 0-4 for 5-point Likert scale
  static List<AnswerModel> _getLikert5Answers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {'ru': 'Совершенно не согласен', 'en': 'Strongly disagree'},
        score: 0, // было 1 в JSON → 0
      ),
      AnswerModel(
        id: 'a2',
        text: {'ru': 'Скорее не согласен', 'en': 'Disagree'},
        score: 1, // было 2 в JSON → 1
      ),
      AnswerModel(
        id: 'a3',
        text: {'ru': 'Нейтрально', 'en': 'Neutral'},
        score: 2, // было 3 в JSON → 2
      ),
      AnswerModel(
        id: 'a4',
        text: {'ru': 'Скорее согласен', 'en': 'Agree'},
        score: 3, // было 4 в JSON → 3
      ),
      AnswerModel(
        id: 'a5',
        text: {'ru': 'Полностью согласен', 'en': 'Strongly agree'},
        score: 4, // было 5 в JSON → 4
      ),
    ];
  }

  /// Список всех вопросов (60 вопросов)
  static List<QuestionModel> _getQuestions() {
    final answers = _getLikert5Answers();

    return [
      // ===== SECURE (Q1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57) =====
      QuestionModel(
        id: 'q1',
        text: {
          'ru':
              'Мне легко открываться близким людям и делиться своими чувствами',
          'en':
              'It is easy for me to open up to loved ones and share my feelings',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Я чувствую себя комфортно, когда люди зависят от меня',
          'en': 'I feel comfortable when people depend on me',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q9',
        text: {
          'ru':
              'Я спокойно отношусь к тому, что партнер проводит время отдельно от меня',
          'en': 'I am calm about my partner spending time apart from me',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я могу легко попросить о помощи, когда мне это нужно',
          'en': 'I can easily ask for help when I need it',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я не боюсь быть уязвимым в отношениях',
          'en': 'I am not afraid to be vulnerable in relationships',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Я уверен, что люди, которые мне дороги, не оставят меня',
          'en': 'I am confident that people who are dear to me will not leave me',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q25',
        text: {
          'ru':
              'Я могу быть близким с людьми, сохраняя при этом свою индивидуальность',
          'en': 'I can be close to people while maintaining my individuality',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Я верю, что отношения могут быть источником радости, а не стресса',
          'en': 'I believe relationships can be a source of joy, not stress',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Мне комфортно как в одиночестве, так и в компании близких людей',
          'en': 'I am comfortable both alone and in the company of loved ones',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'Я могу открыто говорить о своих потребностях в отношениях',
          'en': 'I can openly talk about my needs in relationships',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q41',
        text: {
          'ru':
              'Я доверяю своему партнеру, даже если временами возникают сложности',
          'en': 'I trust my partner even when difficulties arise at times',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Я могу эффективно решать конфликты в отношениях',
          'en': 'I can effectively resolve conflicts in relationships',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q49',
        text: {
          'ru': 'Я чувствую себя уверенно в отношениях',
          'en': 'I feel confident in relationships',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q53',
        text: {
          'ru': 'Я принимаю партнера таким, какой он есть, со всеми недостатками',
          'en': 'I accept my partner as they are, with all their flaws',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q57',
        text: {
          'ru': 'Я чувствую баланс между близостью и личным пространством',
          'en': 'I feel a balance between closeness and personal space',
        },
        answers: answers,
        factorId: 'secure',
        isReversed: false,
      ),

      // ===== ANXIOUS (Q2, 6, 10, 14, 18, 22, 26, 30, 34, 38, 42, 46, 50, 54, 58) =====
      QuestionModel(
        id: 'q2',
        text: {
          'ru':
              'Я часто переживаю, что мой партнер не любит меня так сильно, как я его/её',
          'en': 'I often worry that my partner does not love me as much as I love them',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru':
              'Когда партнер не отвечает на сообщения сразу, я начинаю беспокоиться',
          'en':
              'When my partner does not reply to messages immediately, I start worrying',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru':
              'Мне нужно постоянное подтверждение того, что я важен для своего партнера',
          'en': 'I need constant confirmation that I am important to my partner',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я переживаю, что меня бросят или оставят одного',
          'en': 'I worry that I will be abandoned or left alone',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Я часто чувствую, что люблю сильнее, чем меня любят',
          'en': 'I often feel that I love more than I am loved',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Малейший признак отдаления партнера вызывает у меня тревогу',
          'en': 'The slightest sign of my partner distancing causes me anxiety',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru':
              'Я стремлюсь слиться с партнером полностью, что иногда пугает его/её',
          'en':
              'I strive to merge completely with my partner, which sometimes scares them',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я анализирую каждое слово партнера в поисках скрытого смысла',
          'en': 'I analyze every word of my partner looking for hidden meaning',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru':
              'Я часто провоцирую ссоры, чтобы проверить, действительно ли партнер меня любит',
          'en':
              'I often provoke arguments to test whether my partner really loves me',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Когда партнер занят, я чувствую себя брошенным и ненужным',
          'en': 'When my partner is busy, I feel abandoned and unwanted',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q42',
        text: {
          'ru':
              'Мне сложно справляться с периодами, когда партнер эмоционально недоступен',
          'en':
              'I find it difficult to cope with periods when my partner is emotionally unavailable',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Я часто думаю о том, не собирается ли партнер меня покинуть',
          'en': 'I often think about whether my partner is going to leave me',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q50',
        text: {
          'ru':
              'Когда я не получаю достаточно внимания, я делаю что-то, чтобы привлечь его',
          'en': 'When I do not get enough attention, I do something to attract it',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q54',
        text: {
          'ru': 'Меня пугает возможность остаться одному на всю жизнь',
          'en': 'I am scared of the possibility of being alone for life',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q58',
        text: {
          'ru': 'Я испытываю сильную ревность, даже когда для этого нет причин',
          'en': 'I experience strong jealousy even when there is no reason for it',
        },
        answers: answers,
        factorId: 'anxious',
        isReversed: false,
      ),

      // ===== AVOIDANT (Q3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47, 51, 55, 59) =====
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я предпочитаю не слишком сближаться с людьми эмоционально',
          'en': 'I prefer not to get too emotionally close to people',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Мне сложно полностью доверять другим людям',
          'en': 'It is difficult for me to fully trust other people',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'Я чувствую себя некомфортно, когда отношения становятся слишком близкими',
          'en': 'I feel uncomfortable when relationships become too close',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я предпочитаю не зависеть от других людей',
          'en': 'I prefer not to depend on other people',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Мне важно сохранять свою независимость в отношениях',
          'en': 'It is important for me to maintain my independence in relationships',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Я предпочитаю держать свои проблемы при себе',
          'en': 'I prefer to keep my problems to myself',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Выражение эмоций дается мне с трудом',
          'en': 'Expressing emotions is difficult for me',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Я редко обсуждаю свои глубокие переживания даже с близкими',
          'en': 'I rarely discuss my deep feelings even with loved ones',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru':
              'Романтические отношения кажутся мне не столь важными, как другие сферы жизни',
          'en':
              'Romantic relationships seem to me less important than other areas of life',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Я чувствую себя более комфортно, когда держу людей на расстоянии',
          'en': 'I feel more comfortable when I keep people at a distance',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q43',
        text: {
          'ru':
              'Мне неприятно, когда кто-то пытается сблизиться со мной эмоционально',
          'en':
              'It is unpleasant for me when someone tries to get emotionally close to me',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Я считаю, что полагаться на других — это проявление слабости',
          'en': 'I believe that relying on others is a sign of weakness',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q51',
        text: {
          'ru': 'Я ценю свободу больше, чем эмоциональную близость',
          'en': 'I value freedom more than emotional closeness',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q55',
        text: {
          'ru':
              'Я чувствую себя подавленным, когда партнер становится слишком требовательным эмоционально',
          'en':
              'I feel overwhelmed when my partner becomes too emotionally demanding',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q59',
        text: {
          'ru':
              'Мне проще справляться с проблемами в одиночку, чем просить о поддержке',
          'en': 'It is easier for me to deal with problems alone than to ask for support',
        },
        answers: answers,
        factorId: 'avoidant',
        isReversed: false,
      ),

      // ===== FEARFUL (Q4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60) =====
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Я хочу быть близким с людьми, но боюсь, что меня снова ранят',
          'en': 'I want to be close to people but I am afraid of being hurt again',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Я стремлюсь к близости, но когда получаю её, чувствую дискомфорт',
          'en': 'I strive for closeness but when I get it, I feel uncomfortable',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Я одновременно жажду близости и боюсь её',
          'en': 'I simultaneously crave closeness and fear it',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Мне трудно доверять людям, но я чувствую себя одиноким без близости',
          'en': 'It is hard for me to trust people but I feel lonely without closeness',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru':
              'Когда кто-то становится ближе, я инстинктивно отстраняюсь, хотя и хочу близости',
          'en':
              'When someone gets closer, I instinctively distance myself, although I want closeness',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я не уверен, что заслуживаю любви, но жажду её больше всего',
          'en': 'I am not sure I deserve love but I crave it most of all',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Я боюсь, что никогда не найду человека, который полюбит меня по-настоящему',
          'en': 'I am afraid that I will never find someone who will truly love me',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru':
              'Я чувствую внутренний конфликт между желанием быть любимым и страхом предательства',
          'en':
              'I feel an inner conflict between the desire to be loved and the fear of betrayal',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Меня пугает мысль о том, что кто-то узнает меня по-настоящему',
          'en': 'The thought of someone really knowing me scares me',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru':
              'У меня есть противоречивые чувства: я хочу близости, но не доверяю людям',
          'en':
              'I have conflicting feelings: I want closeness but I do not trust people',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q44',
        text: {
          'ru':
              'Прошлый негативный опыт в отношениях делает меня очень осторожным',
          'en': 'Past negative relationship experiences make me very cautious',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Я хочу доверять людям, но боюсь быть преданным',
          'en': 'I want to trust people but I am afraid of being betrayed',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q52',
        text: {
          'ru': 'Я избегаю близости, потому что боюсь повторения прошлых ошибок',
          'en': 'I avoid closeness because I fear repeating past mistakes',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q56',
        text: {
          'ru':
              'Я колеблюсь между желанием быть близким и желанием убежать от отношений',
          'en':
              'I fluctuate between wanting to be close and wanting to run away from relationships',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
      QuestionModel(
        id: 'q60',
        text: {
          'ru': 'Я считаю себя недостойным любви, но отчаянно в ней нуждаюсь',
          'en': 'I consider myself unworthy of love but desperately need it',
        },
        answers: answers,
        factorId: 'fearful',
        isReversed: false,
      ),
    ];
  }

  /// Названия факторов
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'secure': {
        'ru': 'Безопасный стиль привязанности',
        'en': 'Secure Attachment Style',
      },
      'anxious': {
        'ru': 'Тревожный стиль привязанности',
        'en': 'Anxious Attachment Style',
      },
      'avoidant': {
        'ru': 'Избегающий стиль привязанности',
        'en': 'Avoidant Attachment Style',
      },
      'fearful': {
        'ru': 'Дезорганизованный (тревожно-избегающий) стиль',
        'en': 'Fearful (Anxious-Avoidant) Attachment Style',
      },
    };
  }

  /// Интерпретация результатов по фактору
  ///
  /// Уровни интерпретации:
  /// - low (0-33%): низкий уровень данного стиля
  /// - medium (33-67%): средний уровень
  /// - high (67-100%): высокий уровень
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Защита от NaN (ПРАВИЛО #5)
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    // Определяем уровень
    String level;
    if (percentage < 33) {
      level = 'low';
    } else if (percentage < 67) {
      level = 'medium';
    } else {
      level = 'high';
    }

    // Интерпретации для каждого фактора
    final interpretations = {
      'secure': {
        'low': {
          'ru':
              'Низкий уровень безопасного стиля. Вам может быть сложно открываться и доверять другим. Рассмотрите работу над построением более безопасных отношений.',
          'en':
              'Low secure attachment. You may find it difficult to open up and trust others. Consider working on building more secure relationships.',
        },
        'medium': {
          'ru':
              'Средний уровень безопасного стиля. У вас есть способность к близости и доверию, но они проявляются не всегда последовательно.',
          'en':
              'Medium secure attachment. You have the capacity for closeness and trust, but they do not always manifest consistently.',
        },
        'high': {
          'ru':
              'Высокий уровень безопасного стиля. Вы комфортно чувствуете себя как в близости, так и в независимости. Вы доверяете людям и способны строить здоровые отношения.',
          'en':
              'High secure attachment. You feel comfortable with both closeness and independence. You trust people and are able to build healthy relationships.',
        },
      },
      'anxious': {
        'low': {
          'ru':
              'Низкий уровень тревожного стиля. Вы не склонны переживать о том, что вас бросят или отвергнут. Вы чувствуете себя уверенно в отношениях.',
          'en':
              'Low anxious attachment. You do not tend to worry about being abandoned or rejected. You feel confident in relationships.',
        },
        'medium': {
          'ru':
              'Средний уровень тревожного стиля. Иногда вы переживаете о надежности партнера, но в целом способны справляться с этими чувствами.',
          'en':
              'Medium anxious attachment. Sometimes you worry about your partner\'s reliability, but generally you can manage these feelings.',
        },
        'high': {
          'ru':
              'Высокий уровень тревожного стиля. Вы сильно нуждаетесь в близости и боитесь быть отвергнутым. Вам часто требуется подтверждение любви партнера. Работа с психологом может помочь развить более безопасный стиль.',
          'en':
              'High anxious attachment. You strongly need closeness and fear rejection. You often need confirmation of your partner\'s love. Working with a therapist can help develop a more secure style.',
        },
      },
      'avoidant': {
        'low': {
          'ru':
              'Низкий уровень избегающего стиля. Вам комфортно с эмоциональной близостью и зависимостью от других. Вы не боитесь открываться.',
          'en':
              'Low avoidant attachment. You are comfortable with emotional closeness and dependence on others. You are not afraid to open up.',
        },
        'medium': {
          'ru':
              'Средний уровень избегающего стиля. Вы цените независимость, но способны к близости, когда чувствуете себя в безопасности.',
          'en':
              'Medium avoidant attachment. You value independence but are capable of closeness when you feel safe.',
        },
        'high': {
          'ru':
              'Высокий уровень избегающего стиля. Вы цените независимость и чувствуете дискомфорт от слишком большой эмоциональной близости. Вам сложно открываться. Рассмотрите возможность работы над уязвимостью в безопасной среде.',
          'en':
              'High avoidant attachment. You value independence and feel uncomfortable with too much emotional closeness. It is difficult for you to open up. Consider working on vulnerability in a safe environment.',
        },
      },
      'fearful': {
        'low': {
          'ru':
              'Низкий уровень дезорганизованного стиля. У вас нет сильного внутреннего конфликта между желанием близости и страхом перед ней.',
          'en':
              'Low fearful attachment. You do not have a strong internal conflict between the desire for closeness and the fear of it.',
        },
        'medium': {
          'ru':
              'Средний уровень дезорганизованного стиля. Иногда вы испытываете противоречивые чувства о близости, но в целом способны справляться с ними.',
          'en':
              'Medium fearful attachment. Sometimes you experience conflicting feelings about closeness, but generally you can manage them.',
        },
        'high': {
          'ru':
              'Высокий уровень дезорганизованного стиля. Вы одновременно жаждете близости и боитесь её. Вы испытываете противоречивые чувства в отношениях. КРИТИЧЕСКИ ВАЖНО: обратитесь к квалифицированному психотерапевту, специализирующемуся на травме и теории привязанности.',
          'en':
              'High fearful attachment. You simultaneously crave closeness and fear it. You experience conflicting feelings in relationships. CRITICALLY IMPORTANT: seek out a qualified therapist specializing in trauma and attachment theory.',
        },
      },
    };

    return interpretations[factorId]?[level] ??
        {'ru': 'Интерпретация не найдена', 'en': 'Interpretation not found'};
  }

  /// Определяет профиль на основе процентов по шкалам
  ///
  /// Профили:
  /// - secure: высокий secure (>70%), низкие anxious/avoidant/fearful (<30%)
  /// - anxious: высокий anxious (>60%), остальные ниже
  /// - avoidant: высокий avoidant (>60%), остальные ниже
  /// - fearful: высокий fearful (>60%) ИЛИ высокие anxious+avoidant (оба >50%)
  /// - mixed: нет доминирующего паттерна
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'mixed';

    final secure = percentages['secure'] ?? 0;
    final anxious = percentages['anxious'] ?? 0;
    final avoidant = percentages['avoidant'] ?? 0;
    final fearful = percentages['fearful'] ?? 0;

    // 1. Secure profile
    if (secure > 70 && anxious < 30 && avoidant < 30 && fearful < 30) {
      return 'secure';
    }

    // 2. Anxious profile
    if (anxious > 60 && anxious > avoidant && anxious > fearful) {
      return 'anxious';
    }

    // 3. Avoidant profile
    if (avoidant > 60 && avoidant > anxious && avoidant > fearful) {
      return 'avoidant';
    }

    // 4. Fearful profile (two criteria)
    // Criterion 1: high fearful score
    if (fearful > 60) {
      return 'fearful';
    }
    // Criterion 2: high anxious AND high avoidant (characteristic of fearful style)
    if (anxious > 50 && avoidant > 50) {
      return 'fearful';
    }

    // 5. Default: Mixed
    return 'mixed';
  }

  /// Возвращает профиль по ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// Все профили (5 профилей)
  static final Map<String, TestProfile> _profiles = {
    'secure': TestProfile(
      id: 'secure',
      name: {
        'ru': 'Безопасный стиль привязанности',
        'en': 'Secure Attachment Style',
      },
      description: {
        'ru':
            'Вы комфортно чувствуете себя как в близости, так и в независимости. Вы доверяете людям и способны строить здоровые, стабильные отношения.',
        'en':
            'You feel comfortable with both closeness and independence. You trust people and are able to build healthy, stable relationships.',
      },
      whyThisProfile: {
        'ru':
            'Высокий уровень безопасной привязанности (>70%) при низких уровнях тревожности, избегания и дезорганизации (<30% каждый).',
        'en':
            'High secure attachment (>70%) with low levels of anxiety, avoidance and disorganization (<30% each).',
      },
      strengths: {
        'ru': [
          'Легкость в выражении чувств и потребностей',
          'Баланс между близостью и личным пространством',
          'Доверие к партнеру и уверенность в отношениях',
          'Конструктивное разрешение конфликтов',
          'Способность быть уязвимым без страха отвержения',
          'Поддержка независимости партнера',
          'Позитивный взгляд на себя и других',
        ],
        'en': [
          'Ease in expressing feelings and needs',
          'Balance between closeness and personal space',
          'Trust in partner and confidence in relationships',
          'Constructive conflict resolution',
          'Ability to be vulnerable without fear of rejection',
          'Support of partner\'s independence',
          'Positive view of self and others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Риск самодовольства и остановки в развитии',
          'Возможна жёсткость к тем, кто живёт иначе',
          'Может быть сложно понять людей с другими стилями привязанности',
        ],
        'en': [
          'Risk of complacency and stagnation',
          'Possible rigidity toward those who live differently',
          'May be difficult to understand people with other attachment styles',
        ],
      },
      recommendations: {
        'ru': [
          'Продолжайте развивать навыки коммуникации — это ваша сильная сторона',
          'Будьте терпеливы с партнерами других стилей привязанности',
          'Используйте свою способность к близости для углубления связи',
          'Не забывайте о балансе — даже в безопасных отношениях важно сохранять собственные интересы',
          'Делитесь своим опытом здоровых отношений с друзьями',
          'Практикуйте осознанность в отношениях',
        ],
        'en': [
          'Continue developing communication skills — this is your strength',
          'Be patient with partners of other attachment styles',
          'Use your ability for closeness to deepen connection',
          'Do not forget about balance — even in secure relationships it is important to maintain your own interests',
          'Share your experience of healthy relationships with friends',
          'Practice mindfulness in relationships',
        ],
      },
      tryToday: {
        'ru':
            'Запишите свои топ-3 качества, которые помогают вам строить здоровые отношения. Поблагодарите себя за них.',
        'en':
            'Write down your top 3 qualities that help you build healthy relationships. Thank yourself for them.',
      },
      inspiringConclusion: {
        'ru':
            'Вы живёте осмысленно. Ваша способность к безопасной привязанности — это редкий дар. Продолжайте этот путь!',
        'en':
            'You live meaningfully. Your capacity for secure attachment is a rare gift. Continue this path!',
      },
    ),
    'anxious': TestProfile(
      id: 'anxious',
      name: {
        'ru': 'Тревожный стиль привязанности',
        'en': 'Anxious Attachment Style',
      },
      description: {
        'ru':
            'Вы сильно нуждаетесь в близости и боитесь быть отвергнутым. Вам часто требуется подтверждение любви партнера.',
        'en':
            'You strongly need closeness and fear rejection. You often need confirmation of your partner\'s love.',
      },
      whyThisProfile: {
        'ru':
            'Высокий уровень тревожной привязанности (>60%) — доминирующий стиль по сравнению с другими.',
        'en':
            'High anxious attachment (>60%) — dominant style compared to others.',
      },
      strengths: {
        'ru': [
          'Способность к глубокой эмоциональной близости',
          'Высокая чувствительность к потребностям партнера',
          'Готовность вкладываться в отношения',
          'Сильное желание работать над отношениями',
          'Осознанность своих эмоций',
        ],
        'en': [
          'Capacity for deep emotional closeness',
          'High sensitivity to partner\'s needs',
          'Willingness to invest in relationships',
          'Strong desire to work on relationships',
          'Awareness of your emotions',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Страх быть покинутым или отвергнутым',
          'Потребность в постоянном подтверждении любви',
          'Склонность к ревности и тревоге',
          'Чрезмерный анализ слов и действий партнера',
          'Сложность с установлением границ',
          'Риск эмоционального выгорания',
        ],
        'en': [
          'Fear of being abandoned or rejected',
          'Need for constant confirmation of love',
          'Tendency to jealousy and anxiety',
          'Over-analysis of partner\'s words and actions',
          'Difficulty setting boundaries',
          'Risk of emotional burnout',
        ],
      },
      recommendations: {
        'ru': [
          'Работайте над самооценкой — научитесь ценить себя независимо от отношений',
          'Развивайте навыки саморегуляции эмоций: дыхательные техники, медитация',
          'Учитесь различать реальные признаки проблем от тревожных фантазий',
          'Создайте систему поддержки за пределами романтических отношений',
          'Практикуйте техники осознанности',
          'Работайте с психотерапевтом, специализирующимся на теории привязанности',
          'Изучайте паттерны из детства',
          'Учитесь давать партнеру пространство',
        ],
        'en': [
          'Work on self-esteem — learn to value yourself regardless of relationships',
          'Develop emotional self-regulation skills: breathing techniques, meditation',
          'Learn to distinguish real signs of problems from anxious fantasies',
          'Create a support system outside of romantic relationships',
          'Practice mindfulness techniques',
          'Work with a therapist specializing in attachment theory',
          'Study patterns from childhood',
          'Learn to give your partner space',
        ],
      },
      tryToday: {
        'ru':
            'Практикуйте упражнение: когда возникает тревога, подождите 24 часа, прежде чем действовать на её основе.',
        'en':
            'Practice exercise: when anxiety arises, wait 24 hours before acting on it.',
      },
      inspiringConclusion: {
        'ru':
            'Разрыв между ценностями и действиями — это не приговор, а карта к более осознанной жизни. Вы можете развить более безопасный стиль.',
        'en':
            'The gap between values and actions is not a verdict, but a map to a more conscious life. You can develop a more secure style.',
      },
    ),
    'avoidant': TestProfile(
      id: 'avoidant',
      name: {
        'ru': 'Избегающий стиль привязанности',
        'en': 'Avoidant Attachment Style',
      },
      description: {
        'ru':
            'Вы цените независимость и чувствуете дискомфорт от слишком большой эмоциональной близости. Вам сложно открываться.',
        'en':
            'You value independence and feel uncomfortable with too much emotional closeness. It is difficult for you to open up.',
      },
      whyThisProfile: {
        'ru':
            'Высокий уровень избегающей привязанности (>60%) — доминирующий стиль по сравнению с другими.',
        'en':
            'High avoidant attachment (>60%) — dominant style compared to others.',
      },
      strengths: {
        'ru': [
          'Высокая независимость и самодостаточность',
          'Способность справляться с проблемами самостоятельно',
          'Уважение личных границ',
          'Рациональность в принятии решений',
          'Низкая зависимость от других',
        ],
        'en': [
          'High independence and self-sufficiency',
          'Ability to cope with problems independently',
          'Respect for personal boundaries',
          'Rationality in decision-making',
          'Low dependence on others',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Дискомфорт с эмоциональной близостью',
          'Сложности с выражением чувств',
          'Склонность минимизировать важность отношений',
          'Держите людей на эмоциональной дистанции',
          'Восприятие зависимости от других как слабости',
          'Риск одиночества',
        ],
        'en': [
          'Discomfort with emotional closeness',
          'Difficulty expressing feelings',
          'Tendency to minimize importance of relationships',
          'Keep people at emotional distance',
          'Perception of dependence on others as weakness',
          'Risk of loneliness',
        ],
      },
      recommendations: {
        'ru': [
          'Осознайте свои защитные механизмы и паттерны избегания',
          'Практикуйте постепенное раскрытие: начните с малого',
          'Работайте над идентификацией и выражением эмоций',
          'Изучайте, как ваше детство повлияло на страх близости',
          'Учитесь видеть уязвимость как силу, а не слабость',
          'Практикуйте присутствие в моменты дискомфорта',
          'Работайте с терапевтом над построением безопасности в близости',
          'Бросайте вызов убеждению, что независимость = дистанция',
        ],
        'en': [
          'Recognize your defense mechanisms and avoidance patterns',
          'Practice gradual disclosure: start small',
          'Work on identifying and expressing emotions',
          'Study how your childhood influenced your fear of closeness',
          'Learn to see vulnerability as strength, not weakness',
          'Practice presence in moments of discomfort',
          'Work with a therapist on building safety in closeness',
          'Challenge the belief that independence = distance',
        ],
      },
      tryToday: {
        'ru':
            'Практикуйте упражнение: сегодня поделитесь одним чувством с близким человеком.',
        'en': 'Practice exercise: today share one feeling with a loved one.',
      },
      inspiringConclusion: {
        'ru':
            'Ваша независимость — это сила. Но помните: уязвимость делает вас человечными и способными к глубокой связи.',
        'en':
            'Your independence is strength. But remember: vulnerability makes you human and capable of deep connection.',
      },
    ),
    'fearful': TestProfile(
      id: 'fearful',
      name: {
        'ru': 'Дезорганизованный (тревожно-избегающий) стиль',
        'en': 'Fearful (Anxious-Avoidant) Attachment Style',
      },
      description: {
        'ru':
            'Вы одновременно жаждете близости и боитесь её. Вы испытываете противоречивые чувства в отношениях.',
        'en':
            'You simultaneously crave closeness and fear it. You experience conflicting feelings in relationships.',
      },
      whyThisProfile: {
        'ru':
            'Высокий уровень дезорганизованной привязанности (>60%) ИЛИ сочетание высоких уровней тревожности и избегания (оба >50%).',
        'en':
            'High fearful attachment (>60%) OR combination of high anxiety and avoidance (both >50%).',
      },
      strengths: {
        'ru': [
          'Высокая чувствительность к эмоциям',
          'Способность к глубокой рефлексии',
          'Потенциал для трансформации',
          'Осознание своих сложностей',
        ],
        'en': [
          'High sensitivity to emotions',
          'Capacity for deep reflection',
          'Potential for transformation',
          'Awareness of your difficulties',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Сильное желание близости при одновременном страхе её',
          'Непредсказуемое поведение в отношениях',
          'Низкая самооценка и недоверие к другим',
          'Интенсивный страх предательства',
          'Саботаж отношений в моменты близости',
          'Сложности с регуляцией эмоций',
          'Цикл сближения и отдаления',
        ],
        'en': [
          'Strong desire for closeness with simultaneous fear of it',
          'Unpredictable behavior in relationships',
          'Low self-esteem and distrust of others',
          'Intense fear of betrayal',
          'Sabotage of relationships in moments of closeness',
          'Difficulty regulating emotions',
          'Cycle of approach and withdrawal',
        ],
      },
      recommendations: {
        'ru': [
          'КРИТИЧЕСКИ ВАЖНО: обратитесь к квалифицированному психотерапевту, специализирующемуся на травме и теории привязанности',
          'Изучайте свою историю привязанности с профессионалом. EMDR, схема-терапия, DBT могут быть полезны',
          'Работайте над развитием эмоциональной регуляции. Техники DBT: TIPP',
          'Учитесь различать прошлое и настоящее',
          'Практикуйте техники заземления (grounding)',
          'Развивайте безопасные отношения постепенно',
          'Коммуницируйте с партнером о своих триггерах',
          'Создайте "аварийный план" для моментов сильного возбуждения',
          'Работайте над самосостраданием',
          'Изучайте здоровые границы',
        ],
        'en': [
          'CRITICALLY IMPORTANT: seek out a qualified therapist specializing in trauma and attachment theory',
          'Study your attachment history with a professional. EMDR, schema therapy, DBT can be helpful',
          'Work on developing emotional regulation. DBT techniques: TIPP',
          'Learn to distinguish past from present',
          'Practice grounding techniques',
          'Develop safe relationships gradually',
          'Communicate with your partner about your triggers',
          'Create an "emergency plan" for moments of strong arousal',
          'Work on self-compassion',
          'Study healthy boundaries',
        ],
      },
      tryToday: {
        'ru':
            'Найдите терапевта, специализирующегося на травме и привязанности. Это первый и самый важный шаг.',
        'en':
            'Find a therapist specializing in trauma and attachment. This is the first and most important step.',
      },
      inspiringConclusion: {
        'ru':
            'Помните: вы можете развить более безопасный стиль привязанности, но это путешествие, требующее профессиональной поддержки и времени. Вы заслуживаете любви и безопасности.',
        'en':
            'Remember: you can develop a more secure attachment style, but this is a journey requiring professional support and time. You deserve love and safety.',
      },
    ),
    'mixed': TestProfile(
      id: 'mixed',
      name: {
        'ru': 'Смешанный стиль привязанности',
        'en': 'Mixed Attachment Style',
      },
      description: {
        'ru':
            'Вы демонстрируете комбинацию разных стилей привязанности без явного доминирования одного паттерна.',
        'en':
            'You demonstrate a combination of different attachment styles without clear dominance of one pattern.',
      },
      whyThisProfile: {
        'ru':
            'Нет явно доминирующего стиля привязанности. Разные стили проявляются в зависимости от контекста и партнера.',
        'en':
            'No clearly dominant attachment style. Different styles manifest depending on context and partner.',
      },
      strengths: {
        'ru': [
          'Гибкость в разных контекстах отношений',
          'Способность адаптироваться к разным партнерам',
          'Понимание разных аспектов близости',
          'Потенциал для интеграции лучших качеств стилей',
        ],
        'en': [
          'Flexibility in different relationship contexts',
          'Ability to adapt to different partners',
          'Understanding of different aspects of closeness',
          'Potential to integrate best qualities of styles',
        ],
      },
      vulnerabilities: {
        'ru': [
          'Возможное отсутствие чёткого направления',
          'Непредсказуемость реакций в отношениях',
          'Сложность с самопознанием',
          'Разные паттерны могут конфликтовать друг с другом',
        ],
        'en': [
          'Possible lack of clear direction',
          'Unpredictability of reactions in relationships',
          'Difficulty with self-knowledge',
          'Different patterns may conflict with each other',
        ],
      },
      recommendations: {
        'ru': [
          'Ведите дневник отношений: отслеживайте, какие паттерны проявляются в разных ситуациях',
          'Изучайте теорию привязанности глубже',
          'Работайте с психотерапевтом для интеграции разных аспектов',
          'Экспериментируйте с практиками безопасной привязанности',
          'Будьте терпеливы с собой — понимание придёт со временем',
        ],
        'en': [
          'Keep a relationship journal: track which patterns manifest in different situations',
          'Study attachment theory more deeply',
          'Work with a therapist to integrate different aspects',
          'Experiment with secure attachment practices',
          'Be patient with yourself — understanding will come with time',
        ],
      },
      tryToday: {
        'ru':
            'Начните вести дневник: запишите, как вы себя чувствуете в отношениях сегодня. Какой стиль проявляется?',
        'en':
            'Start keeping a journal: write down how you feel in relationships today. Which style manifests?',
      },
      inspiringConclusion: {
        'ru':
            'Ваша сложность — это не недостаток. Это приглашение к глубокому самопознанию и росту.',
        'en':
            'Your complexity is not a flaw. It is an invitation to deep self-knowledge and growth.',
      },
    ),
  };
}
