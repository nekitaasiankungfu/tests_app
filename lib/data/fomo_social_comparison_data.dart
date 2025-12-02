import '../models/test_model.dart';
import '../models/test_profile_model.dart';

/// Data access class for FOMO & Social Comparison Test
/// Legacy Dart implementation (no JSON dependency)
class FomoSocialComparisonData {
  /// Get the complete FOMO & Social Comparison test
  static TestModel getFomoSocialComparisonTest() {
    return TestModel(
      id: 'fomo_social_comparison_v1',
      title: {
        'ru': 'Тест на FOMO и социальное сравнение',
        'en': 'FOMO & Social Comparison Test',
      },
      description: {
        'ru':
            'FOMO (Fear of Missing Out) — это страх упустить что-то важное, который заставляет нас постоянно проверять соцсети, сравнивать свою жизнь с идеальными картинками других и чувствовать себя недостаточно хорошими. В эпоху Instagram*, TikTok и бесконечных сторис мы живём в режиме постоянного сравнения: чужие путешествия, успехи, тела, отношения — всё это может триггерить зависть, тревогу и недовольство собственной жизнью.\n\nСоциальное сравнение в соцсетях особенно опасно, потому что мы сравниваем свою реальную жизнь с чужим highlight reel — отредактированными и отфильтрованными моментами. Это приводит к снижению самооценки, депрессии, тревожности и зависимости от лайков и одобрения. Молодое поколение особенно уязвимо: исследования показывают связь между использованием соцсетей и ростом психологических проблем у подростков и молодых взрослых.\n\nЭтот тест измеряет шесть аспектов цифрового благополучия: уровень FOMO, склонность к социальному сравнению, зависимость от онлайн-валидации, зависть к чужим успехам, компульсивное поведение в соцсетях и связь самооценки с цифровым миром. Результаты помогут понять, насколько соцсети влияют на ваше психологическое состояние, и получить рекомендации по цифровому детоксу.\n\n*Meta Platforms Inc. признана экстремистской организацией на территории РФ',
        'en':
            'FOMO (Fear of Missing Out) is the fear of missing something important that makes us constantly check social media, compare our lives to others\' perfect pictures, and feel inadequate. In the era of Instagram, TikTok, and endless stories, we live in constant comparison mode: others\' travels, successes, bodies, relationships — all can trigger envy, anxiety, and dissatisfaction with our own lives.\n\nSocial comparison on social media is especially dangerous because we compare our real life to others\' highlight reel — edited and filtered moments. This leads to decreased self-esteem, depression, anxiety, and dependence on likes and approval. Young people are particularly vulnerable: research shows a link between social media use and rising psychological problems among teenagers and young adults.\n\nThis test measures six aspects of digital well-being: FOMO level, social comparison tendency, online validation dependency, envy of others\' success, compulsive social media behavior, and self-worth connection to the digital world. Results will help understand how much social media affects your psychological state and provide digital detox recommendations.',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      disclaimer: {
        'ru':
            'Этот тест основан на исследованиях FOMO (Przybylski et al., 2013), теории социального сравнения (Festinger, 1954) и современных исследованиях зависимости от социальных сетей. Предназначен для самооценки и не является медицинской диагностикой. Если результаты показывают критическую зависимость - рекомендуется обратиться к психологу.',
        'en':
            'This test is based on FOMO research (Przybylski et al., 2013), Social Comparison Theory (Festinger, 1954), and modern social media addiction research. For self-assessment only, not a medical diagnosis. If results show critical dependency - consider consulting a psychologist.',
      },
      estimatedTime: 8,
      type: TestType.multiFactor,
      factorIds: [
        'fomo',
        'social_comparison',
        'validation_seeking',
        'envy_discontent',
        'compulsive_checking',
        'self_worth_dependency',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'fomo': {
        'ru': 'FOMO (страх упустить)',
        'en': 'FOMO (Fear of Missing Out)',
      },
      'social_comparison': {
        'ru': 'Социальное сравнение',
        'en': 'Social Comparison',
      },
      'validation_seeking': {
        'ru': 'Зависимость от одобрения',
        'en': 'Validation Dependency',
      },
      'envy_discontent': {
        'ru': 'Зависть и недовольство',
        'en': 'Envy & Discontent',
      },
      'compulsive_checking': {
        'ru': 'Компульсивная проверка',
        'en': 'Compulsive Checking',
      },
      'self_worth_dependency': {
        'ru': 'Самооценка в соцсетях',
        'en': 'Social Media Self-Worth',
      },
    };
  }

  /// Get factor interpretation based on percentage score
  static Map<String, String> getFactorInterpretation(
      String factorId, double percentage) {
    // Handle NaN or invalid percentage (ПРАВИЛО #5)
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }

    // Clamp percentage to 0-100 range
    percentage = percentage.clamp(0.0, 100.0);

    // Determine range: 0-30 (low), 31-65 (medium), 66-100 (high)
    final String level;
    if (percentage <= 30) {
      level = 'low';
    } else if (percentage <= 65) {
      level = 'medium';
    } else {
      level = 'high';
    }

    // Factor-specific interpretations
    final Map<String, Map<String, Map<String, String>>> interpretations = {
      'fomo': {
        'low': {
          'ru':
              '😎 Низкий FOMO. Ты не паришься по поводу того, что делают другие. Можешь спокойно пропускать события и не чувствовать, что упускаешь жизнь.',
          'en':
              '😎 Low FOMO. You don\'t stress about what others are doing. You can calmly skip events and not feel you\'re missing out on life.',
        },
        'medium': {
          'ru':
              '😕 Умеренный FOMO. Иногда тебя триггерят чужие сторис, и ты чувствуешь, что что-то упускаешь. Важно научиться отделять онлайн от реальности. Рекомендации: ограничь время в соцсетях до 1-2 часов в день, мютни людей, которые постоянно постят о мероприятиях.',
          'en':
              '😕 Moderate FOMO. Sometimes others\' stories trigger you, and you feel you\'re missing something. It\'s important to learn to separate online from reality. Recommendations: limit social media time to 1-2 hours per day, mute people who constantly post about events.',
        },
        'high': {
          'ru':
              '😰 Высокий FOMO. У тебя серьёзный FOMO. Ты постоянно чувствуешь, что все живут круче тебя, и это вызывает тревогу. Пора делать digital detox. СРОЧНО: сделай digital detox хотя бы на неделю, удали соцсети с телефона (хотя бы на время), работай с психологом над тревожностью.',
          'en':
              '😰 High FOMO. You have serious FOMO. You constantly feel everyone lives better than you, causing anxiety. Time for digital detox. URGENT: do digital detox for at least a week, delete social media apps (at least temporarily), work with a psychologist on anxiety.',
        },
      },
      'social_comparison': {
        'low': {
          'ru':
              '✅ Минимальное сравнение. Ты не сравниваешь себя с другими в соцсетях. Понимаешь, что это нереальная картинка.',
          'en':
              '✅ Minimal comparison. You don\'t compare yourself to others on social media. You understand it\'s an unrealistic picture.',
        },
        'medium': {
          'ru':
              '😔 Среднее сравнение. Ты периодически попадаешься на сравнения и чувствуешь себя хуже после скроллинга. Нужно работать над этим. Рекомендации: отпишись от аккаунтов, которые триггерят сравнения, помни, что люди показывают только лучшее (фильтры, ракурсы).',
          'en':
              '😔 Moderate comparison. You periodically fall into comparisons and feel worse after scrolling. Need to work on this. Recommendations: unfollow accounts that trigger comparisons, remember people show only the best (filters, angles).',
        },
        'high': {
          'ru':
              '😞 Критическое сравнение. Ты живёшь в постоянном сравнении с другими. Это разрушает твою самооценку и счастье. Нужны срочные меры. КРИТИЧНО: обратись к психологу по поводу самооценки, удали Instagram/TikTok минимум на месяц, работай над body image и принятием себя.',
          'en':
              '😞 Critical comparison. You live in constant comparison with others. This destroys your self-esteem and happiness. Urgent measures needed. CRITICAL: see a psychologist about self-esteem, delete Instagram/TikTok for at least a month, work on body image and self-acceptance.',
        },
      },
      'validation_seeking': {
        'low': {
          'ru':
              '💪 Независим от одобрения. Лайки не определяют твою ценность. Ты постишь для себя, а не ради одобрения.',
          'en':
              '💪 Independent from approval. Likes don\'t define your value. You post for yourself, not for approval.',
        },
        'medium': {
          'ru':
              '📊 Умеренная зависимость. Ты обращаешь внимание на лайки и реакции, и это иногда влияет на твоё настроение. Пора снизить значимость онлайн-одобрения. Рекомендации: отключи показ лайков в настройках, не проверяй статистику постов первые 24 часа.',
          'en':
              '📊 Moderate dependency. You pay attention to likes and reactions, sometimes affecting your mood. Time to reduce online approval importance. Recommendations: turn off like counts in settings, don\'t check post stats for first 24 hours.',
        },
        'high': {
          'ru':
              '🚨 Сильная зависимость. Ты зависим от лайков и одобрения. Твоя самооценка живёт и умирает с каждым постом. Это серьёзная проблема. ВАЖНО: работай с психологом над самооценкой, попробуй не постить 2-4 недели, удали приложения, где отслеживаешь статистику.',
          'en':
              '🚨 Strong dependency. You\'re dependent on likes and approval. Your self-esteem lives and dies with each post. This is a serious problem. IMPORTANT: work with psychologist on self-esteem, try not posting for 2-4 weeks, delete apps where you track statistics.',
        },
      },
      'envy_discontent': {
        'low': {
          'ru':
              '✨ Минимальная зависть. Ты радуешься за других и не завидуешь их успехам в соцсетях.',
          'en':
              '✨ Minimal envy. You\'re happy for others and don\'t envy their social media success.',
        },
        'medium': {
          'ru':
              '😤 Средняя зависть. Чужие успехи иногда вызывают у тебя зависть и недовольство своей жизнью. Рекомендации: практикуй благодарность за то, что есть у тебя, веди дневник достижений (не для соцсетей).',
          'en':
              '😤 Moderate envy. Others\' success sometimes triggers envy and dissatisfaction with your life. Recommendations: practice gratitude for what you have, keep achievement journal (not for social media).',
        },
        'high': {
          'ru':
              '😡 Критическая зависть. Ты постоянно завидуешь другим и чувствуешь злость или горечь из-за их успеха. Это токсично для твоего ментального здоровья. КРИТИЧНО: работай с психологом над завистью и самооценкой, делай digital detox на 2+ недели, фокусируйся на своих целях.',
          'en':
              '😡 Critical envy. You constantly envy others and feel anger or bitterness about their success. This is toxic for your mental health. CRITICAL: work with psychologist on envy and self-esteem, do digital detox for 2+ weeks, focus on your own goals.',
        },
      },
      'compulsive_checking': {
        'low': {
          'ru':
              '👍 Под контролем. Ты контролируешь своё время в соцсетях. Можешь спокойно отложить телефон.',
          'en':
              '👍 Under control. You control your social media time. Can easily put phone down.',
        },
        'medium': {
          'ru':
              '📱 Привычка. У тебя сформировалась привычка постоянно проверять телефон. Это начинает мешать жить. Рекомендации: поставь экранное время не больше 2 часов в день, убери соцсети с главного экрана телефона, выключи все уведомления от соцсетей.',
          'en':
              '📱 Habit. You\'ve formed a habit of constantly checking your phone. It\'s starting to interfere with life. Recommendations: set screen time limit to max 2 hours per day, remove social media from phone home screen, turn off all social media notifications.',
        },
        'high': {
          'ru':
              '🔴 Зависимость. У тебя зависимость от соцсетей. Ты не можешь контролировать время в них и это разрушает твою жизнь. КРИТИЧНО: обратись к специалисту по зависимостям, рассмотри полный digital detox на 30 дней, замени телефон на «тупой» на время.',
          'en':
              '🔴 Addiction. You have social media addiction. You can\'t control time spent and it\'s ruining your life. CRITICAL: see addiction specialist, consider full digital detox for 30 days, replace smartphone with \'dumb phone\' temporarily.',
        },
      },
      'self_worth_dependency': {
        'low': {
          'ru':
              '💎 Независимая самооценка. Твоя самооценка не зависит от соцсетей. Ты знаешь свою ценность вне цифрового мира.',
          'en':
              '💎 Independent self-worth. Your self-esteem doesn\'t depend on social media. You know your value outside the digital world.',
        },
        'medium': {
          'ru':
              '⚠️ Средняя зависимость. Твоё настроение и самооценка частично зависят от того, что происходит в соцсетях. Рекомендации: найди источники самоценности вне соцсетей (спорт, хобби, реальные достижения), работай над внутренней валидацией.',
          'en':
              '⚠️ Moderate dependency. Your mood and self-esteem partially depend on what happens on social media. Recommendations: find sources of self-worth outside social media (sports, hobbies, real achievements), work on internal validation.',
        },
        'high': {
          'ru':
              '🆘 Критическая зависимость. Вся твоя самооценка живёт в соцсетях. Без онлайн-одобрения ты чувствуешь себя никчёмным. Это очень опасно. КРИТИЧНО: немедленно обратись к психологу, делай полный digital detox на 30+ дней, работай над самооценкой оффлайн.',
          'en':
              '🆘 Critical dependency. All your self-esteem lives on social media. Without online approval you feel worthless. This is very dangerous. CRITICAL: immediately see psychologist, do full digital detox for 30+ days, work on offline self-esteem.',
        },
      },
    };

    return interpretations[factorId]?[level] ??
        {
          'ru': 'Нет интерпретации для этого фактора',
          'en': 'No interpretation for this factor'
        };
  }

  /// Private: Generate all questions
  static List<QuestionModel> _getQuestions() {
    // Frequency response options (0-4)
    final frequencyAnswers = [
      AnswerModel(
        id: 'never',
        text: {'ru': 'Никогда', 'en': 'Never'},
        score: 0,
      ),
      AnswerModel(
        id: 'rarely',
        text: {'ru': 'Редко', 'en': 'Rarely'},
        score: 1,
      ),
      AnswerModel(
        id: 'sometimes',
        text: {'ru': 'Иногда', 'en': 'Sometimes'},
        score: 2,
      ),
      AnswerModel(
        id: 'often',
        text: {'ru': 'Часто', 'en': 'Often'},
        score: 3,
      ),
      AnswerModel(
        id: 'constantly',
        text: {'ru': 'Постоянно', 'en': 'Constantly'},
        score: 4,
      ),
    ];

    return [
      // FOMO (8 questions)
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я испытываю тревогу, когда вижу, что другие веселятся без меня',
          'en': 'I feel anxious when I see others having fun without me',
        },
        answers: frequencyAnswers,
        factorId: 'fomo',
      ),
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Мне кажется, что все вокруг живут интереснее, чем я',
          'en': 'I feel like everyone around lives more interesting lives than me',
        },
        answers: frequencyAnswers,
        factorId: 'fomo',
      ),
      QuestionModel(
        id: 'q3',
        text: {
          'ru':
              'Я боюсь пропустить что-то важное, если не буду проверять соцсети',
          'en':
              'I fear missing something important if I don\'t check social media',
        },
        answers: frequencyAnswers,
        factorId: 'fomo',
      ),
      QuestionModel(
        id: 'q4',
        text: {
          'ru':
              'Чужие сторис о событиях, на которых я не был, вызывают у меня дискомфорт',
          'en':
              'Others\' stories about events I wasn\'t at make me uncomfortable',
        },
        answers: frequencyAnswers,
        factorId: 'fomo',
      ),
      QuestionModel(
        id: 'q5',
        text: {
          'ru':
              'Я чувствую себя исключённым, когда вижу групповые фото друзей без меня',
          'en': 'I feel excluded when I see group photos of friends without me',
        },
        answers: frequencyAnswers,
        factorId: 'fomo',
      ),
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Мне кажется, что я упускаю возможности, которые есть у других',
          'en': 'I feel I\'m missing opportunities others have',
        },
        answers: frequencyAnswers,
        factorId: 'fomo',
      ),
      QuestionModel(
        id: 'q7',
        text: {
          'ru':
              'Я не могу расслабиться, потому что боюсь что-то пропустить онлайн',
          'en': 'I can\'t relax because I fear missing something online',
        },
        answers: frequencyAnswers,
        factorId: 'fomo',
      ),
      QuestionModel(
        id: 'q8',
        text: {
          'ru':
              'Сторис о путешествиях и мероприятиях других людей портят мне настроение',
          'en':
              'Others\' stories about travels and events ruin my mood',
        },
        answers: frequencyAnswers,
        factorId: 'fomo',
      ),

      // Social Comparison (8 questions)
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'Я сравниваю свою внешность с тем, что вижу в соцсетях',
          'en': 'I compare my appearance to what I see on social media',
        },
        answers: frequencyAnswers,
        factorId: 'social_comparison',
      ),
      QuestionModel(
        id: 'q10',
        text: {
          'ru':
              'Когда вижу чужие достижения, я чувствую, что сам ничего не добился',
          'en':
              'When I see others\' achievements, I feel I\'ve accomplished nothing',
        },
        answers: frequencyAnswers,
        factorId: 'social_comparison',
      ),
      QuestionModel(
        id: 'q11',
        text: {
          'ru':
              'Я постоянно сравниваю свою жизнь с идеальными картинками в лентах',
          'en': 'I constantly compare my life to perfect pictures in feeds',
        },
        answers: frequencyAnswers,
        factorId: 'social_comparison',
      ),
      QuestionModel(
        id: 'q12',
        text: {
          'ru':
              'Чужие фото из спортзала/отпуска заставляют меня чувствовать себя неудачником',
          'en': 'Others\' gym/vacation photos make me feel like a failure',
        },
        answers: frequencyAnswers,
        factorId: 'social_comparison',
      ),
      QuestionModel(
        id: 'q13',
        text: {
          'ru':
              'Я оцениваю свои успехи через призму того, что постят другие',
          'en': 'I evaluate my success through what others post',
        },
        answers: frequencyAnswers,
        factorId: 'social_comparison',
      ),
      QuestionModel(
        id: 'q14',
        text: {
          'ru':
              'Посты об отношениях других людей заставляют меня чувствовать себя одиноким',
          'en': 'Others\' relationship posts make me feel lonely',
        },
        answers: frequencyAnswers,
        factorId: 'social_comparison',
      ),
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Я сравниваю количество своих лайков с чужими',
          'en': 'I compare my number of likes with others\'',
        },
        answers: frequencyAnswers,
        factorId: 'social_comparison',
      ),
      QuestionModel(
        id: 'q16',
        text: {
          'ru':
              'Успехи ровесников в соцсетях заставляют меня чувствовать, что я отстаю',
          'en':
              'Peers\' success on social media makes me feel I\'m falling behind',
        },
        answers: frequencyAnswers,
        factorId: 'social_comparison',
      ),

      // Validation Seeking (8 questions)
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я постоянно проверяю, сколько лайков набрал мой пост',
          'en': 'I constantly check how many likes my post got',
        },
        answers: frequencyAnswers,
        factorId: 'validation_seeking',
      ),
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Малое количество лайков портит мне настроение на весь день',
          'en': 'Low number of likes ruins my mood for the whole day',
        },
        answers: frequencyAnswers,
        factorId: 'validation_seeking',
      ),
      QuestionModel(
        id: 'q19',
        text: {
          'ru':
              'Я чувствую себя ценным, только когда получаю много реакций на посты',
          'en': 'I feel valuable only when I get many reactions to posts',
        },
        answers: frequencyAnswers,
        factorId: 'validation_seeking',
      ),
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Я удаляю посты, если они набирают мало лайков',
          'en': 'I delete posts if they get few likes',
        },
        answers: frequencyAnswers,
        factorId: 'validation_seeking',
      ),
      QuestionModel(
        id: 'q21',
        text: {
          'ru':
              'Мне нужно одобрение в соцсетях, чтобы чувствовать себя хорошо',
          'en': 'I need social media approval to feel good',
        },
        answers: frequencyAnswers,
        factorId: 'validation_seeking',
      ),
      QuestionModel(
        id: 'q22',
        text: {
          'ru':
              'Я тщательно продумываю, что постить, чтобы получить максимум лайков',
          'en': 'I carefully plan what to post to get maximum likes',
        },
        answers: frequencyAnswers,
        factorId: 'validation_seeking',
      ),
      QuestionModel(
        id: 'q23',
        text: {
          'ru':
              'Я чувствую себя отвергнутым, если никто не реагирует на мои сторис',
          'en': 'I feel rejected if no one reacts to my stories',
        },
        answers: frequencyAnswers,
        factorId: 'validation_seeking',
      ),
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Количество подписчиков влияет на моё мнение о себе',
          'en': 'Follower count affects my opinion of myself',
        },
        answers: frequencyAnswers,
        factorId: 'validation_seeking',
      ),

      // Envy & Discontent (8 questions)
      QuestionModel(
        id: 'q25',
        text: {
          'ru':
              'Я завидую людям, которые выглядят лучше меня в соцсетях',
          'en': 'I envy people who look better than me on social media',
        },
        answers: frequencyAnswers,
        factorId: 'envy_discontent',
      ),
      QuestionModel(
        id: 'q26',
        text: {
          'ru':
              'Чужой успех в соцсетях вызывает у меня злость или горечь',
          'en':
              'Others\' success on social media triggers anger or bitterness in me',
        },
        answers: frequencyAnswers,
        factorId: 'envy_discontent',
      ),
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'После скроллинга ленты я чувствую себя хуже, чем до этого',
          'en': 'After scrolling the feed, I feel worse than before',
        },
        answers: frequencyAnswers,
        factorId: 'envy_discontent',
      ),
      QuestionModel(
        id: 'q28',
        text: {
          'ru':
              'Я недоволен своей жизнью после просмотра чужих фото из отпуска',
          'en':
              'I\'m dissatisfied with my life after viewing others\' vacation photos',
        },
        answers: frequencyAnswers,
        factorId: 'envy_discontent',
      ),
      QuestionModel(
        id: 'q29',
        text: {
          'ru':
              'Посты о покупках и роскошной жизни других вызывают у меня зависть',
          'en':
              'Posts about purchases and luxurious lives trigger envy in me',
        },
        answers: frequencyAnswers,
        factorId: 'envy_discontent',
      ),
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'Я думаю: \'Почему у них есть это, а у меня нет?\'',
          'en': 'I think: \'Why do they have this and I don\'t?\'',
        },
        answers: frequencyAnswers,
        factorId: 'envy_discontent',
      ),
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Идеальные тела в соцсетях заставляют меня ненавидеть своё',
          'en': 'Perfect bodies on social media make me hate mine',
        },
        answers: frequencyAnswers,
        factorId: 'envy_discontent',
      ),
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Я чувствую раздражение, когда вижу чужое счастье онлайн',
          'en': 'I feel irritated when I see others\' happiness online',
        },
        answers: frequencyAnswers,
        factorId: 'envy_discontent',
      ),

      // Compulsive Checking (8 questions)
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Первое, что я делаю утром — проверяю соцсети',
          'en': 'First thing I do in the morning is check social media',
        },
        answers: frequencyAnswers,
        factorId: 'compulsive_checking',
      ),
      QuestionModel(
        id: 'q34',
        text: {
          'ru':
              'Я не могу удержаться от проверки телефона каждые несколько минут',
          'en': 'I can\'t resist checking my phone every few minutes',
        },
        answers: frequencyAnswers,
        factorId: 'compulsive_checking',
      ),
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Я проверяю соцсети, даже когда занят важными делами',
          'en': 'I check social media even when busy with important tasks',
        },
        answers: frequencyAnswers,
        factorId: 'compulsive_checking',
      ),
      QuestionModel(
        id: 'q36',
        text: {
          'ru':
              'Я обновляю ленту снова и снова, хотя ничего не изменилось',
          'en': 'I refresh the feed again and again though nothing changed',
        },
        answers: frequencyAnswers,
        factorId: 'compulsive_checking',
      ),
      QuestionModel(
        id: 'q37',
        text: {
          'ru':
              'Я трачу на соцсети гораздо больше времени, чем планировал',
          'en': 'I spend much more time on social media than planned',
        },
        answers: frequencyAnswers,
        factorId: 'compulsive_checking',
      ),
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Я проверяю телефон во время разговора с живыми людьми',
          'en': 'I check my phone during conversations with real people',
        },
        answers: frequencyAnswers,
        factorId: 'compulsive_checking',
      ),
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'Я не могу заснуть, пока не проскроллю ленту',
          'en': 'I can\'t fall asleep until I scroll the feed',
        },
        answers: frequencyAnswers,
        factorId: 'compulsive_checking',
      ),
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'Я испытываю тревогу, когда не могу проверить уведомления',
          'en': 'I feel anxious when I can\'t check notifications',
        },
        answers: frequencyAnswers,
        factorId: 'compulsive_checking',
      ),

      // Self-Worth Dependency (8 questions)
      QuestionModel(
        id: 'q41',
        text: {
          'ru':
              'Моё настроение зависит от того, как идут дела в соцсетях',
          'en': 'My mood depends on how things go on social media',
        },
        answers: frequencyAnswers,
        factorId: 'self_worth_dependency',
      ),
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Я чувствую себя никчёмным, если мои посты игнорируют',
          'en': 'I feel worthless if my posts are ignored',
        },
        answers: frequencyAnswers,
        factorId: 'self_worth_dependency',
      ),
      QuestionModel(
        id: 'q43',
        text: {
          'ru':
              'Успех в соцсетях важнее для меня, чем успех в реальной жизни',
          'en':
              'Social media success is more important to me than real life success',
        },
        answers: frequencyAnswers,
        factorId: 'self_worth_dependency',
      ),
      QuestionModel(
        id: 'q44',
        text: {
          'ru':
              'Я оцениваю свою значимость по количеству лайков и подписчиков',
          'en': 'I judge my importance by likes and followers count',
        },
        answers: frequencyAnswers,
        factorId: 'self_worth_dependency',
      ),
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Без соцсетей я не чувствую связи с миром',
          'en': 'Without social media, I don\'t feel connected to the world',
        },
        answers: frequencyAnswers,
        factorId: 'self_worth_dependency',
      ),
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Я чувствую себя невидимым, если не постю в соцсети',
          'en': 'I feel invisible if I don\'t post on social media',
        },
        answers: frequencyAnswers,
        factorId: 'self_worth_dependency',
      ),
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Моя уверенность в себе падает после времени в соцсетях',
          'en': 'My self-confidence drops after time on social media',
        },
        answers: frequencyAnswers,
        factorId: 'self_worth_dependency',
      ),
      QuestionModel(
        id: 'q48',
        text: {
          'ru':
              'Я ощущаю свою ценность через призму онлайн-взаимодействий',
          'en': 'I perceive my value through online interactions',
        },
        answers: frequencyAnswers,
        factorId: 'self_worth_dependency',
      ),
    ];
  }

  /// Determine profile based on test results
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'profile_developing';

    // Calculate average percentage across all factors
    final avgPercentage =
        percentages.values.reduce((a, b) => a + b) / percentages.length;

    // Determine profile based on overall digital wellbeing score
    // NOTE: Higher score = worse wellbeing (more problems)
    if (avgPercentage >= 81) return 'profile_danger'; // 81-100%
    if (avgPercentage >= 61) return 'profile_critical'; // 61-80%
    if (avgPercentage >= 41) return 'profile_warning'; // 41-60%
    if (avgPercentage >= 21) return 'profile_good'; // 21-40%
    return 'profile_excellent'; // 0-20%
  }

  /// Get profile by ID
  static TestProfile? getProfile(String profileId) {
    return _profiles[profileId];
  }

  /// All available profiles
  static final Map<String, TestProfile> _profiles = {
    'profile_excellent': TestProfile(
      id: 'profile_excellent',
      name: {
        'ru': 'Цифровой Zen: Здоровые границы',
        'en': 'Digital Zen: Healthy Boundaries',
      },
      description: {
        'ru':
            'Поздравляем! У тебя здоровые отношения с соцсетями. Ты не зависишь от лайков, не триггеришься на чужие посты и контролируешь своё время онлайн. Соцсети — это инструмент, а не источник самооценки.',
        'en':
            'Congrats! You have a healthy relationship with social media. You don\'t depend on likes, aren\'t triggered by others\' posts, and control your online time. Social media is a tool, not a source of self-worth.',
      },
      whyThisProfile: {
        'ru':
            'Твои показатели по всем шести факторам находятся в здоровом диапазоне (0-20%). Ты демонстрируешь низкий FOMO, минимальное социальное сравнение, независимость от онлайн-одобрения, отсутствие зависти, контроль над компульсивным поведением и здоровую самооценку вне соцсетей.',
        'en':
            'Your scores across all six factors are in the healthy range (0-20%). You show low FOMO, minimal social comparison, independence from online approval, no envy, control over compulsive behavior, and healthy self-esteem outside social media.',
      },
      strengths: {
        'ru': [
          '🧘 Внутренняя устойчивость: твоя самооценка не зависит от лайков и чужого одобрения',
          '🎯 Фокус на реальности: ты понимаешь, что соцсети показывают highlight reel, а не реальную жизнь',
          '⏰ Контроль времени: можешь легко отложить телефон и заняться важными делами',
          '💪 Эмоциональная независимость: чужие сторис не портят тебе настроение',
          '✨ Радость за других: ты искренне рад успехам других, а не завидуешь',
        ],
        'en': [
          '🧘 Inner stability: your self-esteem doesn\'t depend on likes and others\' approval',
          '🎯 Reality focus: you understand social media shows highlight reel, not real life',
          '⏰ Time control: can easily put phone down and focus on important matters',
          '💪 Emotional independence: others\' stories don\'t ruin your mood',
          '✨ Joy for others: you\'re genuinely happy for others\' success, not envious',
        ],
      },
      vulnerabilities: {
        'ru': [
          '⚠️ Риск самоуспокоенности: не забывай периодически пересматривать свои привычки',
          '📊 Может ухудшиться: стресс и перемены в жизни могут повлиять на отношения с соцсетями',
          '👥 Окружение: если друзья зависимы от соцсетей, это может на тебя влиять',
        ],
        'en': [
          '⚠️ Risk of complacency: remember to periodically review your habits',
          '📊 May worsen: stress and life changes can affect social media relationship',
          '👥 Environment: if friends are social media dependent, it may influence you',
        ],
      },
      recommendations: {
        'ru': [
          '✅ Продолжай в том же духе: твой подход к соцсетям здоровый',
          '🎓 Будь примером: помогай друзьям с цифровым детоксом',
          '📱 Мониторинг: раз в месяц проверяй экранное время (должно быть <2 часов в день)',
          '🧠 Развивай осознанность: практикуй mindful scrolling (зачем я сейчас в соцсетях?)',
          '💡 Делись опытом: расскажи другим, как ты поддерживаешь здоровые границы',
        ],
        'en': [
          '✅ Keep it up: your approach to social media is healthy',
          '🎓 Be an example: help friends with digital detox',
          '📱 Monitor: check screen time monthly (should be <2 hours/day)',
          '🧠 Develop awareness: practice mindful scrolling (why am I on social media now?)',
          '💡 Share experience: tell others how you maintain healthy boundaries',
        ],
      },
      tryToday: {
        'ru':
            'Поделись своим секретом здоровых отношений с соцсетями с одним человеком, который в этом нуждается.',
        'en':
            'Share your secret to healthy social media relationships with one person who needs it.',
      },
      inspiringConclusion: {
        'ru':
            'Ты доказываешь, что можно жить в эпоху соцсетей и сохранять ментальное здоровье. Продолжай быть собой — онлайн и оффлайн. Твоя ценность не измеряется лайками.',
        'en':
            'You prove it\'s possible to live in the social media era and maintain mental health. Keep being yourself — online and offline. Your value isn\'t measured by likes.',
      },
    ),
    'profile_good': TestProfile(
      id: 'profile_good',
      name: {
        'ru': 'Цифровой Баланс: В целом здоровые привычки',
        'en': 'Digital Balance: Generally Healthy Habits',
      },
      description: {
        'ru':
            'В целом у тебя здоровое отношение к соцсетям, но есть моменты, требующие внимания. Периодически ты попадаешь в ловушку сравнений или зависишь от лайков. Не дай этому ухудшиться — сейчас самое время укрепить границы.',
        'en':
            'Overall you have a healthy attitude to social media, but there are points requiring attention. Occasionally you fall into comparison trap or depend on likes. Don\'t let this worsen — now is the time to strengthen boundaries.',
      },
      whyThisProfile: {
        'ru':
            'Твои показатели находятся в диапазоне 21-40% — это умеренная зона. Ты демонстрируешь некоторые признаки зависимости от соцсетей, но они пока не критичны. У тебя есть здоровые паттерны, но иногда проскальзывают нездоровые (например, проверка лайков, сравнения с другими, FOMO в определённых ситуациях).',
        'en':
            'Your scores are in the 21-40% range — moderate zone. You show some signs of social media dependency, but they\'re not critical yet. You have healthy patterns, but sometimes unhealthy ones slip through (e.g., checking likes, comparing to others, FOMO in certain situations).',
      },
      strengths: {
        'ru': [
          '👍 Базовая осознанность: ты понимаешь, когда соцсети влияют на тебя негативно',
          '⚖️ Есть баланс: у тебя есть жизнь вне соцсетей',
          '🛡️ Частичный контроль: можешь иногда отложить телефон',
          '💭 Критическое мышление: не всегда веришь идеальным картинкам в соцсетях',
          '🌱 Потенциал роста: ты на пути к здоровым отношениям с digital миром',
        ],
        'en': [
          '👍 Basic awareness: you understand when social media affects you negatively',
          '⚖️ There\'s balance: you have life outside social media',
          '🛡️ Partial control: can sometimes put phone down',
          '💭 Critical thinking: don\'t always believe perfect pictures on social media',
          '🌱 Growth potential: you\'re on the path to healthy digital world relationships',
        ],
      },
      vulnerabilities: {
        'ru': [
          '⚠️ Скользкий склон: без работы над собой может скатиться в зависимость',
          '📱 Триггеры: определённые ситуации (скука, одиночество) вызывают компульсивное поведение',
          '💔 Эмоциональная уязвимость: чужие успехи иногда портят настроение',
          '🎭 Зависимость от контекста: хорош без соцсетей, но иногда попадаешь в ловушку',
          '⏰ Тайм-менеджмент: иногда тратишь больше времени, чем планировал',
        ],
        'en': [
          '⚠️ Slippery slope: without self-work may slide into dependency',
          '📱 Triggers: certain situations (boredom, loneliness) cause compulsive behavior',
          '💔 Emotional vulnerability: others\' success sometimes ruins mood',
          '🎭 Context dependency: fine without social media, but sometimes fall into trap',
          '⏰ Time management: sometimes spend more time than planned',
        ],
      },
      recommendations: {
        'ru': [
          '📊 Отслеживай триггеры: запиши, когда и почему проверяешь соцсети компульсивно',
          '⏳ Установи лимиты: не больше 1.5 часов в день (используй Screen Time)',
          '🚫 Отпишись от токсичных аккаунтов: тех, кто вызывает зависть и сравнения',
          '🔔 Отключи уведомления: оставь только самые важные',
          '🧘 Развивай офлайн-хобби: найди то, что приносит радость вне соцсетей',
          '📅 Digital detox по выходным: один день в неделю без соцсетей',
          '💪 Работай над самооценкой: она не должна зависеть от онлайн-одобрения',
        ],
        'en': [
          '📊 Track triggers: note when and why you check social media compulsively',
          '⏳ Set limits: max 1.5 hours per day (use Screen Time)',
          '🚫 Unfollow toxic accounts: those that trigger envy and comparisons',
          '🔔 Turn off notifications: keep only most important ones',
          '🧘 Develop offline hobbies: find what brings joy outside social media',
          '📅 Weekend digital detox: one day per week without social media',
          '💪 Work on self-esteem: it shouldn\'t depend on online approval',
        ],
      },
      tryToday: {
        'ru':
            'Отключи уведомления от всех соцсетей прямо сейчас. Проверяй их только когда САМ решишь, а не когда они тебя зовут.',
        'en':
            'Turn off notifications from all social media right now. Check them only when YOU decide, not when they call you.',
      },
      inspiringConclusion: {
        'ru':
            'Ты на правильном пути! Небольшие изменения сейчас предотвратят большие проблемы в будущем. Помни: соцсети созданы, чтобы вызывать зависимость — твоя задача не попасться в эту ловушку.',
        'en':
            'You\'re on the right path! Small changes now will prevent big problems in the future. Remember: social media is designed to be addictive — your task is not to fall into this trap.',
      },
    ),
    'profile_warning': TestProfile(
      id: 'profile_warning',
      name: {
        'ru': 'Цифровая Тревога: Тревожные звоночки',
        'en': 'Digital Anxiety: Warning Signs',
      },
      description: {
        'ru':
            'Соцсети начинают негативно влиять на твою жизнь. Ты слишком много сравниваешь себя с другими, зависишь от онлайн-одобрения, испытываешь FOMO и тратишь много времени на компульсивную проверку телефона. Это ещё не критичная стадия, но нужны решительные действия прямо сейчас.',
        'en':
            'Social media is starting to negatively affect your life. You compare yourself to others too much, depend on online approval, experience FOMO, and spend lots of time compulsively checking phone. Not critical stage yet, but decisive action needed right now.',
      },
      whyThisProfile: {
        'ru':
            'Твои показатели в диапазоне 41-60% — зона риска. Ты демонстрируешь выраженные признаки нездоровых отношений с соцсетями: частое социальное сравнение, зависимость от лайков, умеренный или высокий FOMO, компульсивное поведение, зависть к чужим успехам. Соцсети влияют на твою самооценку и настроение.',
        'en':
            'Your scores are in the 41-60% range — risk zone. You show pronounced signs of unhealthy social media relationships: frequent social comparison, like dependency, moderate or high FOMO, compulsive behavior, envy of others\' success. Social media affects your self-esteem and mood.',
      },
      strengths: {
        'ru': [
          '🔔 Осознание проблемы: ты прошёл тест и готов признать, что есть проблема',
          '💡 Есть понимание: ты видишь, что соцсети влияют на тебя негативно',
          '🌟 Ещё не поздно: на этой стадии можно относительно легко исправить ситуацию',
          '💪 Есть мотивация: ты ищешь решение, а не отрицаешь проблему',
        ],
        'en': [
          '🔔 Problem awareness: you took the test and ready to admit there\'s a problem',
          '💡 Understanding exists: you see social media affects you negatively',
          '🌟 Not too late: at this stage situation can be fixed relatively easily',
          '💪 Motivation exists: you\'re seeking solution, not denying problem',
        ],
      },
      vulnerabilities: {
        'ru': [
          '😔 Сниженная самооценка: твоя ценность слишком зависит от соцсетей',
          '📉 Депрессивные симптомы: частое плохое настроение после соцсетей',
          '⏰ Потеря времени: соцсети крадут часы, которые могли бы быть продуктивными',
          '💔 Зависть и недовольство: постоянное сравнение делает тебя несчастным',
          '🔄 Компульсивное поведение: трудно контролировать время в соцсетях',
          '😰 FOMO и тревога: страх что-то пропустить мешает расслабиться',
        ],
        'en': [
          '😔 Lowered self-esteem: your value depends too much on social media',
          '📉 Depressive symptoms: frequent bad mood after social media',
          '⏰ Time loss: social media steals hours that could be productive',
          '💔 Envy and discontent: constant comparison makes you unhappy',
          '🔄 Compulsive behavior: hard to control time on social media',
          '😰 FOMO and anxiety: fear of missing out prevents relaxation',
        ],
      },
      recommendations: {
        'ru': [
          '🚨 СРОЧНО: ограничь экранное время до 1 часа в день (используй жёсткие лимиты)',
          '🗑️ Удали самые токсичные приложения: начни с Instagram или TikTok на 2 недели',
          '🔕 Полный digital detox на выходных: никаких соцсетей субботу и воскресенье',
          '👥 Отпишись от 50% аккаунтов: оставь только близких друзей и полезный контент',
          '🧠 Начни вести дневник эмоций: что чувствуешь ДО и ПОСЛЕ соцсетей',
          '💬 Поговори с психологом: тебе нужна профессиональная помощь с самооценкой',
          '🎯 Найди офлайн-хобби: спорт, творчество, что угодно БЕЗ экрана',
          '📚 Читай о digital minimalism: книга Кэла Ньюпорта «Цифровой минимализм»',
          '👫 Найди accountability partner: кто-то, кто будет поддерживать в digital detox',
        ],
        'en': [
          '🚨 URGENT: limit screen time to 1 hour per day (use strict limits)',
          '🗑️ Delete most toxic apps: start with Instagram or TikTok for 2 weeks',
          '🔕 Full weekend digital detox: no social media Saturday and Sunday',
          '👥 Unfollow 50% of accounts: keep only close friends and useful content',
          '🧠 Start emotion journal: what you feel BEFORE and AFTER social media',
          '💬 Talk to psychologist: you need professional help with self-esteem',
          '🎯 Find offline hobbies: sports, creativity, anything WITHOUT screen',
          '📚 Read about digital minimalism: Cal Newport\'s "Digital Minimalism"',
          '👫 Find accountability partner: someone to support you in digital detox',
        ],
      },
      tryToday: {
        'ru':
            'СЕГОДНЯ: удали одно соцсеть-приложение с телефона на 1 неделю. Выбери то, которое триггерит тебя больше всего. Просто удали. Сейчас.',
        'en':
            'TODAY: delete one social media app from phone for 1 week. Choose the one that triggers you most. Just delete it. Now.',
      },
      inspiringConclusion: {
        'ru':
            'Ты стоишь на развилке: можешь скатиться в полную зависимость или сделать шаг к свободе. Соцсети — это инструмент, а не твоя жизнь. Ты сильнее, чем алгоритмы, которые пытаются тебя удержать. Начни менять это прямо сейчас.',
        'en':
            'You stand at crossroads: can slide into full addiction or take step toward freedom. Social media is a tool, not your life. You\'re stronger than algorithms trying to keep you hooked. Start changing this right now.',
      },
    ),
    'profile_critical': TestProfile(
      id: 'profile_critical',
      name: {
        'ru': 'Цифровая Зависимость: Критическая зона',
        'en': 'Digital Addiction: Critical Zone',
      },
      description: {
        'ru':
            'У тебя серьёзные проблемы с соцсетями. Они разрушают твою самооценку, отнимают огромное количество времени и вызывают постоянный стресс. Ты зависим от лайков, живёшь в режиме постоянного сравнения с другими, испытываешь сильный FOMO и зависть. Компульсивная проверка телефона мешает работе, учёбе и отношениям. Тебе нужна профессиональная помощь.',
        'en':
            'You have serious problems with social media. They\'re destroying your self-esteem, taking enormous amounts of time, and causing constant stress. You\'re dependent on likes, live in constant comparison mode, experience strong FOMO and envy. Compulsive phone checking interferes with work, studies, and relationships. You need professional help.',
      },
      whyThisProfile: {
        'ru':
            'Твои показатели в диапазоне 61-80% — критическая зона. Ты демонстрируешь признаки серьёзной зависимости от соцсетей: высокий FOMO, постоянное социальное сравнение, сильную зависимость от онлайн-валидации, хроническую зависть, компульсивное поведение и самооценку, полностью привязанную к соцсетям. Это влияет на все аспекты твоей жизни.',
        'en':
            'Your scores are in the 61-80% range — critical zone. You show signs of serious social media addiction: high FOMO, constant social comparison, strong online validation dependency, chronic envy, compulsive behavior, and self-worth completely tied to social media. This affects all aspects of your life.',
      },
      strengths: {
        'ru': [
          '🆘 Ты здесь: ты прошёл тест и увидел реальность — это первый шаг',
          '💪 Готовность признать: многие на этой стадии отрицают проблему, а ты нет',
          '🔦 Есть осознание: ты понимаешь, что соцсети разрушают твою жизнь',
        ],
        'en': [
          '🆘 You\'re here: you took test and saw reality — this is first step',
          '💪 Readiness to admit: many at this stage deny problem, but you don\'t',
          '🔦 Awareness exists: you understand social media is ruining your life',
        ],
      },
      vulnerabilities: {
        'ru': [
          '💔 Разрушенная самооценка: вся твоя ценность завязана на лайках и подписчиках',
          '😞 Депрессия и тревога: соцсети — основной триггер депрессивных симптомов',
          '⏰ Огромная потеря времени: 4-6+ часов в день в соцсетях',
          '🚫 Потеря контроля: не можешь остановиться, даже когда хочешь',
          '😡 Зависть как образ жизни: постоянное сравнение и горечь',
          '💤 Нарушения сна: проверка телефона до поздней ночи',
          '👥 Проблемы в отношениях: соцсети важнее живых людей',
          '📉 Снижение продуктивности: не можешь сосредоточиться на работе/учёбе',
        ],
        'en': [
          '💔 Destroyed self-esteem: all your value tied to likes and followers',
          '😞 Depression and anxiety: social media — main trigger of depressive symptoms',
          '⏰ Huge time loss: 4-6+ hours per day on social media',
          '🚫 Loss of control: can\'t stop even when you want to',
          '😡 Envy as lifestyle: constant comparison and bitterness',
          '💤 Sleep disorders: checking phone until late at night',
          '👥 Relationship problems: social media more important than real people',
          '📉 Productivity decline: can\'t focus on work/studies',
        ],
      },
      recommendations: {
        'ru': [
          '🚨 КРИТИЧНО: обратись к психологу или психотерапевту НЕМЕДЛЕННО',
          '📵 СРОЧНЫЙ digital detox на 2-4 недели: полное удаление всех соцсетей',
          '🔒 Используй блокировщики: Freedom, Cold Turkey, AppBlock (заблокируй соцсети)',
          '💊 Рассмотри работу со специалистом по зависимостям (это зависимость!)',
          '👨‍👩‍👧‍👦 Попроси близких о поддержке: расскажи о проблеме',
          '📱 Замени смартфон на простой телефон на месяц',
          '🧠 Групповая терапия: найди группу поддержки (например, r/nosurf)',
          '📚 Изучай тему: "Непобедимый разум" (Курпатов), "Indistractable" (Nir Eyal)',
          '🎯 Создай план жизни без соцсетей: чем заполнишь освободившееся время?',
          '💪 Работа над самооценкой: она должна быть внутренней, не зависеть от лайков',
          '🏥 Проверь депрессию: возможно, нужна медикаментозная поддержка',
        ],
        'en': [
          '🚨 CRITICAL: see psychologist or psychotherapist IMMEDIATELY',
          '📵 URGENT 2-4 week digital detox: complete deletion of all social media',
          '🔒 Use blockers: Freedom, Cold Turkey, AppBlock (block social media)',
          '💊 Consider working with addiction specialist (this IS addiction!)',
          '👨‍👩‍👧‍👦 Ask loved ones for support: tell them about problem',
          '📱 Replace smartphone with basic phone for a month',
          '🧠 Group therapy: find support group (e.g., r/nosurf)',
          '📚 Study topic: "Indistractable" (Nir Eyal), "Digital Minimalism" (Newport)',
          '🎯 Create life plan without social media: how will you fill freed time?',
          '💪 Work on self-esteem: it must be internal, not dependent on likes',
          '🏥 Check for depression: medical support may be needed',
        ],
      },
      tryToday: {
        'ru':
            'СЕГОДНЯ, ПРЯМО СЕЙЧАС: 1) Запишись на приём к психологу. 2) Удали ВСЕ соцсети с телефона. 3) Скажи близкому человеку о своей проблеме.',
        'en':
            'TODAY, RIGHT NOW: 1) Schedule appointment with psychologist. 2) Delete ALL social media from phone. 3) Tell close person about your problem.',
      },
      inspiringConclusion: {
        'ru':
            'Это самое тёмное перед рассветом. Да, тебе плохо. Да, соцсети разрушили многое. Но ты можешь вернуть себе жизнь. Тысячи людей вышли из этой ямы — и ты сможешь. Первый шаг: удали соцсети. Второй: найди психолога. Третий: начни жить по-настоящему. Ты сильнее алгоритмов.',
        'en':
            'This is darkest before dawn. Yes, you feel bad. Yes, social media destroyed much. But you can reclaim your life. Thousands have climbed out of this pit — and you can too. First step: delete social media. Second: find psychologist. Third: start living for real. You\'re stronger than algorithms.',
      },
    ),
    'profile_danger': TestProfile(
      id: 'profile_danger',
      name: {
        'ru': 'Цифровая Катастрофа: Опасная зависимость',
        'en': 'Digital Catastrophe: Dangerous Addiction',
      },
      description: {
        'ru':
            'Ты в опасной зоне. Соцсети полностью контролируют твою жизнь, самооценку и эмоции. Ты живёшь для лайков, постоянно сравниваешь себя с другими и чувствуешь себя никчёмным. FOMO и зависть разъедают тебя изнутри. Ты не можешь контролировать время в соцсетях, даже когда понимаешь, что это разрушает тебя. Твоя самооценка не существует вне цифрового мира. Требуется немедленная профессиональная помощь.',
        'en':
            'You\'re in danger zone. Social media completely controls your life, self-esteem, and emotions. You live for likes, constantly compare yourself to others, and feel worthless. FOMO and envy eat you from inside. You can\'t control social media time, even when you understand it\'s destroying you. Your self-worth doesn\'t exist outside digital world. Immediate professional help required.',
      },
      whyThisProfile: {
        'ru':
            'Твои показатели в диапазоне 81-100% — опасная зависимость. Это максимально критический уровень. Ты демонстрируешь все признаки тяжёлой зависимости от соцсетей: экстремальный FOMO, тотальное социальное сравнение, абсолютную зависимость от онлайн-валидации, разрушительную зависть, полностью неконтролируемое компульсивное поведение и самооценку, которая существует ТОЛЬКО в соцсетях. Это не просто проблема — это клиническая зависимость.',
        'en':
            'Your scores are in 81-100% range — dangerous addiction. This is most critical level. You show all signs of severe social media addiction: extreme FOMO, total social comparison, absolute online validation dependency, destructive envy, completely uncontrolled compulsive behavior, and self-worth that exists ONLY on social media. This isn\'t just problem — it\'s clinical addiction.',
      },
      strengths: {
        'ru': [
          '🆘 Ты дошёл до конца теста: многие на этой стадии не могут признать проблему',
          '💡 Ты увидел цифры: отрицание стало сложнее, реальность перед глазами',
          '❤️ Ты всё ещё жив: значит, ещё не поздно начать путь к выздоровлению',
        ],
        'en': [
          '🆘 You finished the test: many at this stage can\'t admit problem',
          '💡 You saw numbers: denial became harder, reality is before eyes',
          '❤️ You\'re still alive: means it\'s not too late to start recovery path',
        ],
      },
      vulnerabilities: {
        'ru': [
          '💀 Суицидальные мысли: возможны из-за постоянного сравнения и ненависти к себе',
          '🏥 Клиническая депрессия: вероятно требуется медикаментозное лечение',
          '😰 Паническое расстройство: FOMO достиг уровня панических атак',
          '🚫 Полная потеря контроля: 8-12+ часов в день в соцсетях',
          '💔 Разрушенные отношения: соцсети полностью заменили реальную жизнь',
          '📉 Академический/профессиональный крах: не можешь учиться/работать',
          '🍔 Физическое здоровье: недосып, неправильное питание, отсутствие движения',
          '🧠 Когнитивные нарушения: не можешь сосредоточиться, забываешь всё',
          '😡 Ненависть к себе: живёшь в постоянной зависти и самобичевании',
        ],
        'en': [
          '💀 Suicidal thoughts: possible due to constant comparison and self-hatred',
          '🏥 Clinical depression: medical treatment likely needed',
          '😰 Panic disorder: FOMO reached panic attack level',
          '🚫 Complete loss of control: 8-12+ hours per day on social media',
          '💔 Destroyed relationships: social media completely replaced real life',
          '📉 Academic/professional collapse: can\'t study/work',
          '🍔 Physical health: sleep deprivation, poor diet, no movement',
          '🧠 Cognitive impairment: can\'t focus, forget everything',
          '😡 Self-hatred: live in constant envy and self-flagellation',
        ],
      },
      recommendations: {
        'ru': [
          '🚨 ЭКСТРЕННО: запишись к психиатру или психотерапевту НА СЕГОДНЯ',
          '📞 Кризисная линия: позвони на психологическую помощь (8-800-2000-122 в РФ)',
          '🏥 Рассмотри стационарное лечение: это серьёзная зависимость, нужна помощь',
          '💊 Медикаментозное лечение: возможно, нужны антидепрессанты',
          '📵 НЕМЕДЛЕННЫЙ полный detox: удали ВСЕ соцсети, смени телефон на кнопочный',
          '👨‍👩‍👧‍👦 Семейная терапия: попроси близких помочь тебе',
          '🏃 Реабилитационная программа: найди программу лечения интернет-зависимости',
          '📝 Ежедневный дневник: отслеживай эмоции и триггеры (с психологом)',
          '🧠 Когнитивно-поведенческая терапия (КПТ): специфично для зависимостей',
          '💪 12-шаговая программа: адаптированная для интернет-зависимости',
          '🏕️ Digital detox retreat: рассмотри выезд на природу без технологий (1-2 недели)',
          '⚠️ Проверь физическое здоровье: анализы крови, гормоны, витамины',
        ],
        'en': [
          '🚨 EMERGENCY: schedule psychiatrist or psychotherapist appointment TODAY',
          '📞 Crisis line: call psychological help hotline',
          '🏥 Consider inpatient treatment: this is serious addiction, help needed',
          '💊 Medical treatment: antidepressants may be needed',
          '📵 IMMEDIATE full detox: delete ALL social media, switch to basic phone',
          '👨‍👩‍👧‍👦 Family therapy: ask loved ones to help you',
          '🏃 Rehabilitation program: find internet addiction treatment program',
          '📝 Daily journal: track emotions and triggers (with psychologist)',
          '🧠 Cognitive-behavioral therapy (CBT): specific for addictions',
          '💪 12-step program: adapted for internet addiction',
          '🏕️ Digital detox retreat: consider nature getaway without technology (1-2 weeks)',
          '⚠️ Check physical health: blood tests, hormones, vitamins',
        ],
      },
      tryToday: {
        'ru':
            'ПРЯМО СЕЙЧАС: 1) Позвони на кризисную линию 8-800-2000-122. 2) Расскажи родителям/близким о проблеме. 3) Удали ВСЕ соцсети. 4) Запишись к психиатру на завтра.',
        'en':
            'RIGHT NOW: 1) Call crisis hotline. 2) Tell parents/loved ones about problem. 3) Delete ALL social media. 4) Schedule psychiatrist for tomorrow.',
      },
      inspiringConclusion: {
        'ru':
            'Ты на дне. Но знаешь что? Со дна можно только подняться. Многие до тебя были там, где ты сейчас, и смогли выбраться. Это будет тяжело. Это будет больно. Но ты сможешь. Первый шаг: признать, что тебе нужна помощь. Второй: попросить эту помощь. Третий: начать лечение. Твоя жизнь стоит того, чтобы бороться. Ты стоишь того, чтобы быть счастливым. Удали соцсети. Найди психолога. Начни жить.',
        'en':
            'You\'re at rock bottom. But know what? From bottom you can only go up. Many before you were where you are now, and managed to get out. It will be hard. It will be painful. But you can do it. First step: admit you need help. Second: ask for this help. Third: start treatment. Your life is worth fighting for. You\'re worth being happy. Delete social media. Find psychologist. Start living.',
      },
    ),
  };
}
