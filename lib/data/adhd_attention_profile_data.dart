import '../models/test_model.dart';

/// Data access class for ADHD Attention Profile Test
/// Legacy Dart implementation (no JSON dependency)
class ADHDAttentionProfileData {
  /// Get the complete ADHD Attention Profile test
  static TestModel getADHDAttentionProfileTest() {
    return TestModel(
      id: 'adhd_attention_profile_v2',
      title: {
        'ru': 'Профиль внимания и саморегуляции (расширенный)',
        'en': 'Attention & Self-Regulation Profile (Extended)',
      },
      description: {
        'ru':
            'Этот опросник помогает оценить, как устроены ваше внимание и саморегуляция в повседневной жизни. Тест не ставит диагноз и не заменяет консультацию специалиста — он показывает выраженность черт, которые часто встречаются у людей с особенностями внимания, в том числе похожими на проявления СДВГ у взрослых.\n\nРасширенная версия включает 50 вопросов и даёт более детализированный профиль по пяти областям: невнимательность и рассеянность, гиперактивность и внутреннее беспокойство, импульсивность, организация и планирование, эмоциональная саморегуляция. Результаты могут стать отправной точкой для самопомощи, разговоров с близкими или обсуждения с психотерапевтом/психиатром.',
        'en':
            'This questionnaire helps assess how your attention and self-regulation work in everyday life. The test does not diagnose and does not replace professional consultation — it shows the expression of traits often found in people with attention characteristics, including those similar to adult ADHD manifestations.\n\nThe extended version includes 50 questions and provides a more detailed profile across five areas: inattention and distractibility, hyperactivity and internal restlessness, impulsivity, organization and planning, emotional self-regulation. Results can be a starting point for self-help, conversations with loved ones, or discussion with a psychotherapist/psychiatrist.',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      disclaimer: {
        'ru':
            'Этот тест основан на клинических моделях СДВГ у взрослых и исследованиях исполнительных функций. Он предназначен для самопознания и не является медицинским диагнозом. СДВГ — это не слабость и не вина человека, а особенность нервной системы. Отвечайте честно для получения наиболее точных результатов.',
        'en':
            'This test is based on clinical models of adult ADHD and research on executive functions. It is for self-awareness and is not a medical diagnosis. ADHD is not weakness or fault, but a nervous system characteristic. Answer honestly for the most accurate results.',
      },
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: [
        'inattention',
        'hyperactivity_restlessness',
        'impulsivity',
        'organization_planning',
        'emotional_regulation',
      ],
      questions: _getQuestions(),
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'inattention': {
        'ru': 'Невнимательность и рассеянность',
        'en': 'Inattention & Distractibility',
      },
      'hyperactivity_restlessness': {
        'ru': 'Гиперактивность и внутреннее беспокойство',
        'en': 'Hyperactivity & Restlessness',
      },
      'impulsivity': {
        'ru': 'Импульсивность',
        'en': 'Impulsivity',
      },
      'organization_planning': {
        'ru': 'Организация и планирование',
        'en': 'Organization & Planning',
      },
      'emotional_regulation': {
        'ru': 'Эмоциональная саморегуляция',
        'en': 'Emotional Self-Regulation',
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

    // Determine range: 0-33 (low), 34-66 (medium), 67-100 (high)
    final String level;
    if (percentage <= 33) {
      level = 'low';
    } else if (percentage <= 66) {
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

  /// Get all interpretations
  static Map<String, Map<String, Map<String, String>>> _getInterpretations() {
    return {
      'inattention': {
        'low': {
          'title_ru': 'Низкая выраженность невнимательности',
          'title_en': 'Low Inattention',
          'description_ru':
              'Серьёзных трудностей с концентрацией и рассеянностью, судя по ответам, нет. Ваши ответы говорят о том, что вы в целом хорошо управляете вниманием: можете удерживать фокус на задачах, замечаете важные детали и редко «выпадаете» из разговоров или работы. Отвлечения, конечно, бывают у всех, но они вряд ли системно мешают вам в учёбе, работе или отношениях.\n\nРекомендации:\n• Продолжайте использовать рабочие стратегии, которые уже помогают вам концентрироваться\n• Обращайте внимание на ситуации, где внимание всё-таки проваливается — это может быть сигналом усталости\n• Поддерживайте здоровый режим сна, отдыха и цифровой гигиены',
          'description_en':
              'Based on your answers, there are no serious difficulties with concentration and distractibility. Your responses indicate that you generally manage attention well: you can focus on tasks, notice important details, and rarely "zone out" of conversations or work. Distractions happen to everyone, but they are unlikely to systematically interfere with your studies, work, or relationships.\n\nRecommendations:\n• Continue using working strategies that already help you concentrate\n• Pay attention to situations where your attention does fail — this may signal fatigue\n• Maintain a healthy sleep, rest, and digital hygiene routine',
        },
        'medium': {
          'title_ru': 'Умеренная невнимательность',
          'title_en': 'Moderate Inattention',
          'description_ru':
              'Иногда концентрация даётся с трудом, но вы часто можете компенсировать это усилиями и организацией. Похоже, что ваше внимание в целом работает достаточно хорошо, но в условиях усталости, стресса или скуки вы можете чаще отвлекаться, упускать детали или терять нить разговора. Такие особенности нередко встречаются у людей с высоким уровнем стресса или большим количеством стимулов (соцсети, уведомления).\n\nРекомендации:\n• Используйте внешние опоры: списки дел, таймеры, заметки, напоминания\n• Разбивайте большие задачи на небольшие, с понятными шагами\n• Планируйте сложные задания на то время суток, когда вы чувствуете максимум энергии',
          'description_en':
              'Sometimes concentration is difficult, but you can often compensate with effort and organization. It seems that your attention generally works well enough, but under fatigue, stress, or boredom, you may get distracted more often, miss details, or lose the thread of conversation. Such characteristics are often found in people with high stress levels or lots of stimuli (social media, notifications).\n\nRecommendations:\n• Use external supports: to-do lists, timers, notes, reminders\n• Break large tasks into small ones with clear steps\n• Schedule difficult tasks for the time of day when you feel most energetic',
        },
        'high': {
          'title_ru': 'Высокая невнимательность',
          'title_en': 'High Inattention',
          'description_ru':
              'Концентрация и удержание внимания, вероятно, являются одной из ваших ключевых сложностей. Ваши ответы указывают на выраженные трудности с концентрацией: мысли легко ускакивают, детали теряются, сложно долго удерживать фокус на задачах, особенно если они кажутся скучными или слишком объёмными. Такие проявления могут заметно мешать учёбе, работе и повседневной жизни.\n\nРекомендации:\n• Попробуйте формат работы короткими отрезками (15–25 минут) с небольшими перерывами\n• Используйте минимум отвлекающих стимулов во время важной задачи: отключите уведомления\n• Если трудности с вниманием давно и сильно мешают жизни, обсудите это со специалистом',
          'description_en':
              'Concentration and attention maintenance are probably one of your key challenges. Your answers indicate pronounced difficulties with concentration: thoughts easily wander, details are lost, it\'s hard to maintain focus on tasks for long, especially if they seem boring or too extensive. Such manifestations can noticeably interfere with studies, work, and daily life.\n\nRecommendations:\n• Try working in short intervals (15–25 minutes) with small breaks\n• Minimize distracting stimuli during important tasks: turn off notifications\n• If attention difficulties have been significantly interfering with life for a long time, discuss this with a specialist',
        },
      },
      'hyperactivity_restlessness': {
        'low': {
          'title_ru': 'Низкая гиперактивность и беспокойство',
          'title_en': 'Low Hyperactivity & Restlessness',
          'description_ru':
              'Вы, как правило, можете спокойно сидеть, отдыхать и не чувствуете постоянного внутреннего «двигателя». Ваши ответы показывают, что вы достаточно комфортно переносите периоды покоя, ожидания и отдыха. Скорее всего, вам удаётся переключаться из режима действий в режим восстановления, что полезно и для нервной системы, и для концентрации.\n\nРекомендации:\n• Поддерживайте существующий баланс активности и отдыха\n• Обращайте внимание на первые признаки перегруза, чтобы вовремя замедляться\n• Используйте спокойный отдых (сон, прогулки, тишина) как часть привычного режима',
          'description_en':
              'You can generally sit calmly, rest, and don\'t feel a constant internal "engine." Your answers show that you comfortably tolerate periods of rest, waiting, and relaxation. You likely manage to switch from action mode to recovery mode, which is beneficial for both the nervous system and concentration.\n\nRecommendations:\n• Maintain your existing balance of activity and rest\n• Pay attention to the first signs of overload to slow down in time\n• Use calm rest (sleep, walks, quiet) as part of your regular routine',
        },
        'medium': {
          'title_ru': 'Умеренная гиперактивность и беспокойство',
          'title_en': 'Moderate Hyperactivity & Restlessness',
          'description_ru':
              'Внутреннее беспокойство и моторная активность появляются иногда, но вы часто можете их контролировать. Похоже, вы довольно активны и подвижны, а иногда можете ощущать внутреннее напряжение или «двигатель внутри». В большинстве ситуаций вам, вероятно, удаётся держать это под контролем, хотя в длительных ожиданиях или на скучных встречах можно испытывать заметный дискомфорт.\n\nРекомендации:\n• Используйте короткие двигательные паузы в течение дня\n• Старайтесь планировать дела так, чтобы чередовать активность и отдых\n• В ситуациях вынужденного ожидания держите под рукой что-то для занятости',
          'description_en':
              'Internal restlessness and motor activity appear sometimes, but you can often control them. You seem quite active and mobile, and sometimes you may feel internal tension or an "engine inside." In most situations, you probably manage to keep this under control, although you may experience noticeable discomfort during long waits or boring meetings.\n\nRecommendations:\n• Use short movement breaks throughout the day\n• Try to plan activities to alternate between activity and rest\n• In forced waiting situations, keep something handy to stay occupied',
        },
        'high': {
          'title_ru': 'Высокая гиперактивность и внутреннее беспокойство',
          'title_en': 'High Hyperactivity & Restlessness',
          'description_ru':
              'Вам может быть очень трудно просто сидеть спокойно и «ничего не делать», тело и мысли как будто всегда в движении. Ваши ответы указывают на выраженное внутреннее беспокойство и/или физическую гиперактивность. Длительное сидение, ожидание, необходимость сохранять неподвижность могут вызывать сильный дискомфорт. Такой стиль может помогать быть энергичным, но одновременно выматывает и затрудняет отдых.\n\nРекомендации:\n• Планируйте регулярные, но короткие двигательные разрядки\n• Осваивайте практики мягкого замедления: дыхательные упражнения, релаксация\n• Если беспокойство мешает спать, отдыхать и работать, стоит обсудить это со специалистом',
          'description_en':
              'It may be very difficult for you to just sit still and "do nothing," your body and mind seem to always be in motion. Your answers indicate pronounced internal restlessness and/or physical hyperactivity. Prolonged sitting, waiting, needing to stay still can cause significant discomfort. This style may help you be energetic, but it also exhausts and makes rest difficult.\n\nRecommendations:\n• Plan regular but short movement breaks\n• Practice gentle slowing down: breathing exercises, relaxation\n• If restlessness interferes with sleep, rest, and work, discuss this with a specialist',
        },
      },
      'impulsivity': {
        'low': {
          'title_ru': 'Низкая импульсивность',
          'title_en': 'Low Impulsivity',
          'description_ru':
              'Вы, как правило, успеваете подумать, прежде чем сказать или сделать что-то важное. Вы, скорее всего, умеете выдерживать паузу между импульсом и действием, взвешивать последствия и отслеживать своё состояние. Это помогает избегать конфликтов, необдуманных решений и сожалений о сказанном.\n\nРекомендации:\n• Сохраняйте привычку делать короткую паузу перед важными решениями\n• Принимайте во внимание усталость: в такие периоды импульсивность может усиливаться\n• Используйте своё умение сдерживаться как ресурс в сложных ситуациях',
          'description_en':
              'You generally manage to think before saying or doing something important. You likely know how to pause between impulse and action, weigh consequences, and track your state. This helps avoid conflicts, hasty decisions, and regrets about what was said.\n\nRecommendations:\n• Maintain the habit of taking a short pause before important decisions\n• Consider fatigue: during such periods impulsivity may increase\n• Use your self-restraint ability as a resource in difficult situations',
        },
        'medium': {
          'title_ru': 'Умеренная импульсивность',
          'title_en': 'Moderate Impulsivity',
          'description_ru':
              'Иногда вы действуете спонтанно, но в целом можете контролировать импульсы, когда это важно. Похоже, вам свойственна определённая спонтанность: иногда вы говорите или делаете что-то быстро, а потом оцениваете последствия. Чаще всего это не приводит к серьёзным проблемам, но в состоянии сильных эмоций или усталости импульсивность может усиливаться.\n\nРекомендации:\n• Замечайте типичные триггеры импульсивных реакций (усталость, голод, конфликты)\n• Практикуйте правило «пауза 10 секунд» перед ответом в напряжённых разговорах\n• Если импульсивные решения касаются денег или работы, делайте «вторую проверку»',
          'description_en':
              'Sometimes you act spontaneously, but generally can control impulses when it matters. You seem to have a certain spontaneity: sometimes you say or do something quickly, then evaluate the consequences. Most often this doesn\'t lead to serious problems, but in strong emotional states or fatigue, impulsivity may increase.\n\nRecommendations:\n• Notice typical triggers of impulsive reactions (fatigue, hunger, conflicts)\n• Practice the "10-second pause" rule before responding in tense conversations\n• If impulsive decisions concern money or work, do a "second check"',
        },
        'high': {
          'title_ru': 'Высокая импульсивность',
          'title_en': 'High Impulsivity',
          'description_ru':
              'Импульсивные слова и действия могут регулярно приводить к напряжению, конфликтам или сожалениям. Ваши ответы говорят о том, что вы часто действуете или реагируете прежде, чем успеваете спокойно всё обдумать. Это может проявляться в резких словах, импульсивных покупках, спонтанных решениях, из-за которых позже появляется чувство вины.\n\nРекомендации:\n• Отрабатывайте короткие микротрюки самоконтроля: вдох-выдох, сосчитать до 10\n• Обсудите с близкими, как вам могут мягко напоминать о паузе, если вы «заводитесь»\n• Если импульсивность приводит к серьёзным последствиям, обсудите это со специалистом',
          'description_en':
              'Impulsive words and actions may regularly lead to tension, conflicts, or regrets. Your answers suggest that you often act or react before you have time to calmly think things through. This may manifest in sharp words, impulsive purchases, spontaneous decisions that later cause guilt.\n\nRecommendations:\n• Practice short self-control micro-tricks: inhale-exhale, count to 10\n• Discuss with loved ones how they can gently remind you to pause when you "get worked up"\n• If impulsivity leads to serious consequences, discuss this with a specialist',
        },
      },
      'organization_planning': {
        'low': {
          'title_ru': 'Низкие трудности с организацией и планированием',
          'title_en': 'Low Organization & Planning Difficulties',
          'description_ru':
              'Вы, как правило, умеете планировать дела, соблюдать сроки и поддерживать базовый порядок. Ваши ответы показывают, что организация дел и времени в целом даётся вам довольно естественно. Вы, вероятно, умеете рассчитывать ресурсы, пользоваться списками дел, вовремя находить нужные вещи и доводить начатое до конца.\n\nРекомендации:\n• Поддерживайте существующие системы планирования и организационные привычки\n• Избегайте перегрузки календаря: даже при хорошей организованности ресурсы ограничены\n• Периодически пересматривайте свои инструменты и оставляйте только полезные',
          'description_en':
              'You generally know how to plan things, meet deadlines, and maintain basic order. Your answers show that organizing tasks and time comes fairly naturally to you. You probably know how to estimate resources, use to-do lists, find things on time, and finish what you start.\n\nRecommendations:\n• Maintain your existing planning systems and organizational habits\n• Avoid calendar overload: even with good organization, resources are limited\n• Periodically review your tools and keep only the useful ones',
        },
        'medium': {
          'title_ru': 'Умеренные трудности с организацией и планированием',
          'title_en': 'Moderate Organization & Planning Difficulties',
          'description_ru':
              'Иногда вы успешно организуете дела, но периодически сроки и порядок всё же выходят из-под контроля. Похоже, у вас есть базовые навыки планирования, но в периоды нагрузки или при большом количестве задач могут появляться опоздания, забытые дела, беспорядок в пространстве и голове. Это типичная картина для людей с насыщённой жизнью и недостатком отдыха.\n\nРекомендации:\n• Сократите количество параллельных задач, сосредоточьтесь на 1–3 приоритетах в день\n• Используйте один «центр управления» (одно приложение/ежедневник)\n• Выделяйте короткое ежедневное время на приведение дел в порядок',
          'description_en':
              'Sometimes you successfully organize things, but periodically deadlines and order still get out of control. It seems you have basic planning skills, but during periods of load or with many tasks, delays, forgotten tasks, and disorder in space and mind may appear. This is typical for people with busy lives and lack of rest.\n\nRecommendations:\n• Reduce the number of parallel tasks, focus on 1–3 priorities per day\n• Use one "control center" (one app/planner)\n• Allocate a short daily time to put things in order',
        },
        'high': {
          'title_ru': 'Высокие трудности с организацией и планированием',
          'title_en': 'High Organization & Planning Difficulties',
          'description_ru':
              'Планы, сроки и порядок, вероятно, являются одной из самых сложных сфер вашей повседневной жизни. Ваши ответы указывают на то, что вы часто сталкиваетесь с опозданиями, несоблюдением сроков, потерянными вещами, беспорядком в рабочем пространстве и трудностями в планировании. Это может вызывать стресс, чувство вины и ощущение вечного хаоса.\n\nРекомендации:\n• Начните с очень простых и конкретных систем: один календарь, один список дел на день\n• Выносите «организацию» в отдельную задачу: 10–15 минут в день на планирование\n• При выраженных трудностях стоит обсудить с психологом способы поддержки',
          'description_en':
              'Plans, deadlines, and order are probably one of the most difficult areas of your daily life. Your answers indicate that you often face delays, missed deadlines, lost items, workspace clutter, and planning difficulties. This can cause stress, guilt, and a feeling of eternal chaos.\n\nRecommendations:\n• Start with very simple and specific systems: one calendar, one daily to-do list\n• Make "organization" a separate task: 10–15 minutes daily for planning\n• For pronounced difficulties, discuss support methods with a psychologist',
        },
      },
      'emotional_regulation': {
        'low': {
          'title_ru': 'Низкие трудности с эмоциональной саморегуляцией',
          'title_en': 'Low Emotional Self-Regulation Difficulties',
          'description_ru':
              'Вы обычно неплохо управляете эмоциями и относительно быстро восстанавливаетесь после стресса. Ваши ответы показывают, что эмоциональные реакции, хотя и бывают яркими, в основном остаются управляемыми. Вы, вероятно, умеете замечать своё состояние, не срываться на близких и со временем отпускать неприятные ситуации.\n\nРекомендации:\n• Поддерживайте уже работающие стратегии самоподдержки\n• Обращайте внимание на редкие моменты «срывов», чтобы вовремя восстанавливать ресурс\n• Используйте своё умение регулировать эмоции как опору для других сфер жизни',
          'description_en':
              'You usually manage emotions well and recover relatively quickly from stress. Your answers show that emotional reactions, although they can be vivid, generally remain manageable. You probably know how to notice your state, not lash out at loved ones, and eventually let go of unpleasant situations.\n\nRecommendations:\n• Maintain your already working self-support strategies\n• Pay attention to rare "breakdown" moments to restore resources in time\n• Use your ability to regulate emotions as support for other areas of life',
        },
        'medium': {
          'title_ru': 'Умеренные трудности с эмоциональной саморегуляцией',
          'title_en': 'Moderate Emotional Self-Regulation Difficulties',
          'description_ru':
              'Иногда эмоции берут верх, но чаще всего вам удаётся восстановить баланс. Похоже, что вы достаточно чувствительны к стрессу и перегрузке: в такие периоды вы можете срываться, долго прокручивать неприятные ситуации в голове или испытывать чувство вины. При этом у вас, вероятно, есть и работающие стратегии самопомощи.\n\nРекомендации:\n• Замечайте ранние признаки эмоционального перегруза (раздражительность, усталость)\n• Планируйте регулярные «окна восстановления» — где вы можете отдохнуть\n• Осваивайте мягкие техники саморегуляции: дыхательные практики, осознанность',
          'description_en':
              'Sometimes emotions take over, but most often you manage to restore balance. It seems you are quite sensitive to stress and overload: during such periods you may lash out, replay unpleasant situations in your mind for a long time, or feel guilty. At the same time, you probably have working self-help strategies.\n\nRecommendations:\n• Notice early signs of emotional overload (irritability, fatigue)\n• Plan regular "recovery windows" — where you can rest\n• Master gentle self-regulation techniques: breathing practices, mindfulness',
        },
        'high': {
          'title_ru': 'Высокие трудности с эмоциональной саморегуляцией',
          'title_en': 'High Emotional Self-Regulation Difficulties',
          'description_ru':
              'Эмоции могут быстро выходить из-под контроля и серьёзно влиять на ваше поведение и отношения. Ваши ответы указывают на то, что вы часто остро переживаете стрессовые ситуации, можете срываться на людях или надолго застревать в чувстве вины и самокритике. Такая эмоциональная чувствительность нередко связана с усталостью или особенностями нервной системы и может быть очень изматывающей.\n\nРекомендации:\n• Постарайтесь относиться к сильным эмоциям как к сигналу о перегрузе\n• Ищите безопасные способы выражать эмоции: разговор с близким, письмо, творчество\n• Если эмоции часто выходят из-под контроля, стоит обсудить это с психотерапевтом',
          'description_en':
              'Emotions can quickly get out of control and seriously affect your behavior and relationships. Your answers indicate that you often experience stressful situations acutely, may lash out at people, or get stuck in guilt and self-criticism for a long time. Such emotional sensitivity is often related to fatigue or nervous system characteristics and can be very exhausting.\n\nRecommendations:\n• Try to treat strong emotions as a signal of overload\n• Look for safe ways to express emotions: talking to a loved one, writing, creativity\n• If emotions often get out of control, discuss this with a psychotherapist',
        },
      },
    };
  }

  /// Get all 50 questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Q1 - inattention
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Мне трудно сосредоточиться на задаче, если она требует длительного умственного усилия.',
          'en': 'I find it hard to concentrate on a task if it requires prolonged mental effort.',
        },
        factorId: 'inattention',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q2 - hyperactivity_restlessness
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Мне сложно спокойно сидеть, я часто ерзаю или двигаю руками и ногами.',
          'en': 'I find it hard to sit still; I often fidget or move my hands and feet.',
        },
        factorId: 'hyperactivity_restlessness',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q3 - impulsivity
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я часто говорю или действую, не успев толком подумать, а потом жалею об этом.',
          'en': 'I often speak or act without really thinking, and then regret it.',
        },
        factorId: 'impulsivity',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q4 - organization_planning
      QuestionModel(
        id: 'q4',
        text: {
          'ru': 'Мне трудно планировать свои дела так, чтобы всё успевать вовремя.',
          'en': 'I find it hard to plan my tasks so that I get everything done on time.',
        },
        factorId: 'organization_planning',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q5 - emotional_regulation
      QuestionModel(
        id: 'q5',
        text: {
          'ru': 'Моё настроение может резко меняться из-за, казалось бы, мелких событий.',
          'en': 'My mood can change dramatically due to seemingly minor events.',
        },
        factorId: 'emotional_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q6 - inattention
      QuestionModel(
        id: 'q6',
        text: {
          'ru': 'Во время чтения или работы я замечаю, что пропускаю важные детали.',
          'en': 'While reading or working, I notice that I miss important details.',
        },
        factorId: 'inattention',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q7 - hyperactivity_restlessness
      QuestionModel(
        id: 'q7',
        text: {
          'ru': 'Даже когда вокруг тихо, внутри я чувствую себя так, будто у меня не выключается «двигатель».',
          'en': 'Even when it\'s quiet around me, inside I feel like I have an engine that won\'t turn off.',
        },
        factorId: 'hyperactivity_restlessness',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q8 - impulsivity
      QuestionModel(
        id: 'q8',
        text: {
          'ru': 'Мне трудно дождаться своей очереди или спокойно ждать, пока говорят другие.',
          'en': 'I find it hard to wait my turn or patiently wait while others are speaking.',
        },
        factorId: 'impulsivity',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q9 - organization_planning
      QuestionModel(
        id: 'q9',
        text: {
          'ru': 'В моём рабочем пространстве или дома часто бывает беспорядок, который мешает мне собраться.',
          'en': 'My workspace or home often has clutter that interferes with me getting organized.',
        },
        factorId: 'organization_planning',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q10 - emotional_regulation
      QuestionModel(
        id: 'q10',
        text: {
          'ru': 'Из-за усталости или перегруза я легко срываюсь на окружающих.',
          'en': 'Due to fatigue or overload, I easily snap at others.',
        },
        factorId: 'emotional_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q11 - inattention
      QuestionModel(
        id: 'q11',
        text: {
          'ru': 'Я часто ловлю себя на том, что слушаю человека, но теряю нить разговора.',
          'en': 'I often catch myself listening to someone but losing the thread of the conversation.',
        },
        factorId: 'inattention',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q12 - hyperactivity_restlessness (REVERSED)
      QuestionModel(
        id: 'q12',
        text: {
          'ru': 'Мне легко расслабиться и просто ничего не делать, когда это нужно.',
          'en': 'I find it easy to relax and just do nothing when needed.',
        },
        factorId: 'hyperactivity_restlessness',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q13 - impulsivity
      QuestionModel(
        id: 'q13',
        text: {
          'ru': 'Я легко принимаю спонтанные решения, даже если не продумал(а) все возможные последствия.',
          'en': 'I easily make spontaneous decisions even without thinking through all possible consequences.',
        },
        factorId: 'impulsivity',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q14 - organization_planning (REVERSED)
      QuestionModel(
        id: 'q14',
        text: {
          'ru': 'Я без особых усилий разбиваю большую задачу на маленькие шаги и следую этому плану.',
          'en': 'I easily break a large task into small steps and follow this plan.',
        },
        factorId: 'organization_planning',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q15 - emotional_regulation (REVERSED)
      QuestionModel(
        id: 'q15',
        text: {
          'ru': 'Даже когда меня что-то сильно раздражает, я обычно сохраняю внешнее спокойствие.',
          'en': 'Even when something really annoys me, I usually maintain outward calm.',
        },
        factorId: 'emotional_regulation',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q16 - inattention (REVERSED)
      QuestionModel(
        id: 'q16',
        text: {
          'ru': 'Мне обычно удаётся сосредоточиться, даже если вокруг много отвлекающих факторов.',
          'en': 'I usually manage to concentrate even when there are many distractions around.',
        },
        factorId: 'inattention',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q17 - hyperactivity_restlessness
      QuestionModel(
        id: 'q17',
        text: {
          'ru': 'Я часто начинаю делать несколько дел одновременно, потому что чувствую внутреннее беспокойство.',
          'en': 'I often start doing several things at once because I feel inner restlessness.',
        },
        factorId: 'hyperactivity_restlessness',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q18 - impulsivity (REVERSED)
      QuestionModel(
        id: 'q18',
        text: {
          'ru': 'Перед важными решениями я обычно тщательно взвешиваю плюсы и минусы.',
          'en': 'Before important decisions, I usually carefully weigh the pros and cons.',
        },
        factorId: 'impulsivity',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q19 - organization_planning
      QuestionModel(
        id: 'q19',
        text: {
          'ru': 'Я часто опаздываю или сдаю задачи позже срока, потому что не рассчитал(а) время.',
          'en': 'I often arrive late or submit tasks past deadline because I didn\'t calculate time properly.',
        },
        factorId: 'organization_planning',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q20 - emotional_regulation
      QuestionModel(
        id: 'q20',
        text: {
          'ru': 'Мне сложно переключиться с неприятной ситуации, я долго прокручиваю её в голове.',
          'en': 'I find it hard to move on from an unpleasant situation; I replay it in my head for a long time.',
        },
        factorId: 'emotional_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q21 - inattention
      QuestionModel(
        id: 'q21',
        text: {
          'ru': 'Когда я работаю, мой мозг легко переключается на посторонние мысли или стимулы.',
          'en': 'When I work, my mind easily switches to unrelated thoughts or stimuli.',
        },
        factorId: 'inattention',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q22 - hyperactivity_restlessness
      QuestionModel(
        id: 'q22',
        text: {
          'ru': 'Мне трудно оставаться на месте, когда нужно долго ждать (например, в очереди или на собрании).',
          'en': 'I find it hard to stay in place when I need to wait a long time (e.g., in line or at a meeting).',
        },
        factorId: 'hyperactivity_restlessness',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q23 - impulsivity
      QuestionModel(
        id: 'q23',
        text: {
          'ru': 'Иногда я совершаю импульсивные покупки или действия, о которых потом жалею.',
          'en': 'Sometimes I make impulsive purchases or actions that I later regret.',
        },
        factorId: 'impulsivity',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q24 - organization_planning
      QuestionModel(
        id: 'q24',
        text: {
          'ru': 'Я часто теряю или забываю, где лежат важные вещи (ключи, документы, гаджеты).',
          'en': 'I often lose or forget where important things are (keys, documents, gadgets).',
        },
        factorId: 'organization_planning',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q25 - emotional_regulation
      QuestionModel(
        id: 'q25',
        text: {
          'ru': 'Я часто испытываю чувство вины за то, что не справляюсь с делами так, как планировал(а).',
          'en': 'I often feel guilty for not managing things as I planned.',
        },
        factorId: 'emotional_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q26 - inattention (REVERSED)
      QuestionModel(
        id: 'q26',
        text: {
          'ru': 'Если я ставлю себе цель, я обычно довожу дело до конца без частых отвлечений.',
          'en': 'When I set a goal, I usually complete it without frequent distractions.',
        },
        factorId: 'inattention',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q27 - hyperactivity_restlessness (REVERSED)
      QuestionModel(
        id: 'q27',
        text: {
          'ru': 'Во время отдыха я действительно чувствую себя спокойным(ой) и расслабленным(ой).',
          'en': 'During rest, I truly feel calm and relaxed.',
        },
        factorId: 'hyperactivity_restlessness',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q28 - impulsivity (REVERSED)
      QuestionModel(
        id: 'q28',
        text: {
          'ru': 'Если я сильно злюсь или раздражён(а), мне всё равно удаётся сдержать первые импульсы и не действовать сгоряча.',
          'en': 'If I\'m very angry or irritated, I still manage to restrain my first impulses and not act rashly.',
        },
        factorId: 'impulsivity',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q29 - organization_planning (REVERSED)
      QuestionModel(
        id: 'q29',
        text: {
          'ru': 'Список дел действительно помогает мне, и я обычно следую ему без особых проблем.',
          'en': 'A to-do list really helps me, and I usually follow it without major problems.',
        },
        factorId: 'organization_planning',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q30 - emotional_regulation (REVERSED)
      QuestionModel(
        id: 'q30',
        text: {
          'ru': 'В стрессовых ситуациях я относительно быстро прихожу в себя и начинаю действовать более рационально.',
          'en': 'In stressful situations, I relatively quickly come to my senses and start acting more rationally.',
        },
        factorId: 'emotional_regulation',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q31 - inattention
      QuestionModel(
        id: 'q31',
        text: {
          'ru': 'Я часто начинаю читать или смотреть что-то, и в итоге не помню, о чём это было.',
          'en': 'I often start reading or watching something and end up not remembering what it was about.',
        },
        factorId: 'inattention',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q32 - hyperactivity_restlessness
      QuestionModel(
        id: 'q32',
        text: {
          'ru': 'Мне сложно сидеть спокойно, даже если ситуация формально этого требует (совещание, лекция, встреча).',
          'en': 'I find it hard to sit still even when the situation formally requires it (meeting, lecture, appointment).',
        },
        factorId: 'hyperactivity_restlessness',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q33 - impulsivity
      QuestionModel(
        id: 'q33',
        text: {
          'ru': 'Я нередко перебиваю людей, потому что мне трудно дождаться, пока они договорят.',
          'en': 'I often interrupt people because it\'s hard for me to wait until they finish speaking.',
        },
        factorId: 'impulsivity',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q34 - organization_planning
      QuestionModel(
        id: 'q34',
        text: {
          'ru': 'Мне сложно организовать свой день так, чтобы оставалось время и на дела, и на отдых.',
          'en': 'I find it hard to organize my day so there\'s time for both work and rest.',
        },
        factorId: 'organization_planning',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q35 - emotional_regulation
      QuestionModel(
        id: 'q35',
        text: {
          'ru': 'Небольшие трудности или задержки могут сильно испортить мне настроение на весь день.',
          'en': 'Small difficulties or delays can significantly spoil my mood for the entire day.',
        },
        factorId: 'emotional_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q36 - inattention (REVERSED)
      QuestionModel(
        id: 'q36',
        text: {
          'ru': 'Когда задача для меня важна, я могу довольно долго удерживать устойчивый фокус.',
          'en': 'When a task is important to me, I can maintain steady focus for quite a long time.',
        },
        factorId: 'inattention',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q37 - hyperactivity_restlessness (REVERSED)
      QuestionModel(
        id: 'q37',
        text: {
          'ru': 'В ситуациях, где нужно сидеть спокойно, я обычно чувствую себя достаточно комфортно.',
          'en': 'In situations where I need to sit still, I usually feel quite comfortable.',
        },
        factorId: 'hyperactivity_restlessness',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q38 - impulsivity (REVERSED)
      QuestionModel(
        id: 'q38',
        text: {
          'ru': 'Даже когда я испытываю сильные эмоции, мне удаётся не реагировать моментально и даю себе время подумать.',
          'en': 'Even when I experience strong emotions, I manage not to react instantly and give myself time to think.',
        },
        factorId: 'impulsivity',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q39 - organization_planning (REVERSED)
      QuestionModel(
        id: 'q39',
        text: {
          'ru': 'У меня есть рабочие привычки и ритуалы, которые помогают держать дела и пространство в порядке.',
          'en': 'I have working habits and rituals that help keep my tasks and space in order.',
        },
        factorId: 'organization_planning',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q40 - emotional_regulation (REVERSED)
      QuestionModel(
        id: 'q40',
        text: {
          'ru': 'После стрессовых событий я обычно достаточно быстро нахожу способы восстановиться.',
          'en': 'After stressful events, I usually find ways to recover fairly quickly.',
        },
        factorId: 'emotional_regulation',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q41 - inattention
      QuestionModel(
        id: 'q41',
        text: {
          'ru': 'При работе за компьютером я постоянно перескакиваю между окнами и приложениями, хотя понимаю, что это мешает делу.',
          'en': 'When working on a computer, I constantly jump between windows and apps, even though I know it interferes with work.',
        },
        factorId: 'inattention',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q42 - hyperactivity_restlessness
      QuestionModel(
        id: 'q42',
        text: {
          'ru': 'Когда я сильно взволнован(а), мне трудно сидеть спокойно: хочется ходить, что-то делать, двигаться.',
          'en': 'When I\'m very excited, it\'s hard for me to sit still: I want to walk, do something, move.',
        },
        factorId: 'hyperactivity_restlessness',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q43 - impulsivity
      QuestionModel(
        id: 'q43',
        text: {
          'ru': 'Я иногда отправляю сообщения или комментарии, о которых позже жалею.',
          'en': 'I sometimes send messages or comments that I later regret.',
        },
        factorId: 'impulsivity',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q44 - organization_planning
      QuestionModel(
        id: 'q44',
        text: {
          'ru': 'Я часто берусь сразу за несколько проектов и потом с трудом их координирую.',
          'en': 'I often take on several projects at once and then struggle to coordinate them.',
        },
        factorId: 'organization_planning',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q45 - emotional_regulation
      QuestionModel(
        id: 'q45',
        text: {
          'ru': 'Когда что-то идёт не по плану, я могу надолго застревать в раздражении или разочаровании.',
          'en': 'When things don\'t go as planned, I can get stuck in irritation or disappointment for a long time.',
        },
        factorId: 'emotional_regulation',
        isReversed: false,
        answers: _getFrequencyAnswers(),
      ),
      // Q46 - inattention (REVERSED)
      QuestionModel(
        id: 'q46',
        text: {
          'ru': 'Если мне нужно внимательно кого-то выслушать, я способен(на) это сделать без сильных отвлечений.',
          'en': 'When I need to listen carefully to someone, I\'m able to do it without major distractions.',
        },
        factorId: 'inattention',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q47 - hyperactivity_restlessness (REVERSED)
      QuestionModel(
        id: 'q47',
        text: {
          'ru': 'Когда у меня появляется возможность спокойно полежать или посидеть, я действительно могу этим наслаждаться.',
          'en': 'When I have the opportunity to lie down or sit quietly, I can truly enjoy it.',
        },
        factorId: 'hyperactivity_restlessness',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q48 - impulsivity (REVERSED)
      QuestionModel(
        id: 'q48',
        text: {
          'ru': 'Даже в эмоционально зарядной ситуации я часто успеваю подумать, прежде чем что-то сказать или сделать.',
          'en': 'Even in an emotionally charged situation, I often manage to think before saying or doing something.',
        },
        factorId: 'impulsivity',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q49 - organization_planning (REVERSED)
      QuestionModel(
        id: 'q49',
        text: {
          'ru': 'Я обычно заранее думаю, как организовать пространство (стол, сумка, файлы), чтобы потом не искать вещи.',
          'en': 'I usually think ahead about how to organize space (desk, bag, files) so I don\'t have to search for things later.',
        },
        factorId: 'organization_planning',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
      // Q50 - emotional_regulation (REVERSED)
      QuestionModel(
        id: 'q50',
        text: {
          'ru': 'Когда я переживаю сильные эмоции, у меня есть способы успокоиться и поддержать себя.',
          'en': 'When I experience strong emotions, I have ways to calm down and support myself.',
        },
        factorId: 'emotional_regulation',
        isReversed: true,
        answers: _getFrequencyAnswers(),
      ),
    ];
  }

  /// Standard frequency answers (scores 0-4!)
  /// КРИТИЧНО: Scores ДОЛЖНЫ быть 0-4 (НЕ 1-5!)
  static List<AnswerModel> _getFrequencyAnswers() {
    return [
      AnswerModel(
        id: 'f1',
        text: {
          'ru': 'Никогда',
          'en': 'Never',
        },
        score: 0,
      ),
      AnswerModel(
        id: 'f2',
        text: {
          'ru': 'Редко',
          'en': 'Rarely',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'f3',
        text: {
          'ru': 'Иногда',
          'en': 'Sometimes',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'f4',
        text: {
          'ru': 'Часто',
          'en': 'Often',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'f5',
        text: {
          'ru': 'Всегда',
          'en': 'Always',
        },
        score: 4,
      ),
    ];
  }

  // ===============================================
  // PROFILE DETERMINATION LOGIC (7-section results)
  // ===============================================

  /// Determines profile based on factor percentages
  /// Uses profile criteria from test specification
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) return 'mixed_profile';

    final inattention = percentages['inattention'] ?? 0;
    final hyperactivity = percentages['hyperactivity_restlessness'] ?? 0;
    final impulsivity = percentages['impulsivity'] ?? 0;
    final organization = percentages['organization_planning'] ?? 0;
    final emotional = percentages['emotional_regulation'] ?? 0;

    // Check for balanced profile (all <= 50%)
    if (inattention <= 50 &&
        hyperactivity <= 50 &&
        impulsivity <= 50 &&
        organization <= 50 &&
        emotional <= 50) {
      return 'balanced_attention';
    }

    // Check for inattentive profile
    if (inattention >= 60 && organization >= 60 && hyperactivity <= 80) {
      return 'inattentive_profile';
    }

    // Check for hyperactive-impulsive profile
    if (hyperactivity >= 60 && impulsivity >= 60) {
      return 'hyperactive_impulsive_profile';
    }

    // Check for mixed profile (all three high)
    if (inattention >= 60 && hyperactivity >= 60 && impulsivity >= 60) {
      return 'mixed_profile';
    }

    // Default to mixed profile
    return 'mixed_profile';
  }

  /// Get profile data by profile ID
  static Map<String, dynamic>? getProfile(String profileId) {
    final profiles = _getProfiles();
    return profiles[profileId];
  }

  /// Get all profile definitions
  static Map<String, Map<String, dynamic>> _getProfiles() {
    return {
      'balanced_attention': {
        'name': {
          'ru': 'Сбалансированный профиль внимания',
          'en': 'Balanced Attention Profile',
        },
        'description': {
          'ru':
              'Ваш профиль показывает относительно сбалансированное внимание и саморегуляцию. Какие-то сложности, конечно, бывают, но они вряд ли системно мешают вашей жизни.',
          'en':
              'Your profile shows relatively balanced attention and self-regulation. Some difficulties do occur, but they are unlikely to systematically interfere with your life.',
        },
        'characteristics': {
          'ru': [
            'В целом стабильная концентрация и способность удерживать внимание',
            'Умеренная или низкая импульсивность',
            'Базовые рабочие навыки организации и планирования',
            'Достаточная эмоциональная устойчивость в большинстве повседневных ситуаций',
          ],
          'en': [
            'Generally stable concentration and ability to maintain attention',
            'Moderate or low impulsivity',
            'Basic working skills in organization and planning',
            'Sufficient emotional stability in most everyday situations',
          ],
        },
        'recommendations': {
          'ru': [
            'Поддерживайте текущие привычки сна, отдыха и организации дел',
            'Следите за уровнем стресса: при перегрузе даже сбалансированный профиль может временно «сыпаться»',
            'При желании используйте результаты как базовую точку для развития продуктивности',
          ],
          'en': [
            'Maintain current sleep, rest, and organization habits',
            'Monitor stress levels: even a balanced profile can temporarily "fall apart" under overload',
            'If desired, use results as a baseline for developing productivity',
          ],
        },
        'suitableRoles': {
          'ru': [
            'Большинство офисных и удалённых форматов работы',
            'Задачи, требующие устойчивого внимания и планирования',
            'Роли, где ценятся надёжность и предсказуемость',
          ],
          'en': [
            'Most office and remote work formats',
            'Tasks requiring sustained attention and planning',
            'Roles where reliability and predictability are valued',
          ],
        },
        'tryToday': {
          'ru':
              'Отметьте одну привычку, которая помогает вам сохранять концентрацию, и осознанно используйте её сегодня.',
          'en':
              'Note one habit that helps you maintain concentration and consciously use it today.',
        },
        'inspiringMessage': {
          'ru':
              'Ваш сбалансированный профиль — это надёжный фундамент для личного и профессионального развития.',
          'en':
              'Your balanced profile is a solid foundation for personal and professional development.',
        },
      },
      'inattentive_profile': {
        'name': {
          'ru': 'Невнимательный и дезорганизованный профиль',
          'en': 'Inattentive & Disorganized Profile',
        },
        'description': {
          'ru':
              'В этом профиле главные трудности связаны с концентрацией и организацией: внимание легко рассеивается, планы разваливаются, а порядок даётся ценой значительных усилий.',
          'en':
              'In this profile, the main difficulties are related to concentration and organization: attention is easily scattered, plans fall apart, and order is achieved at significant effort.',
        },
        'characteristics': {
          'ru': [
            'Сложность удерживать внимание на однообразных или длительных задачах',
            'Частые забывания, потеря вещей, пропуск деталей',
            'Ощущение хаоса в планировании и дедлайнах',
            'Возможное чувство вины и самокритики за «недостаточную собранность»',
          ],
          'en': [
            'Difficulty maintaining attention on monotonous or prolonged tasks',
            'Frequent forgetting, losing things, missing details',
            'Feeling of chaos in planning and deadlines',
            'Possible guilt and self-criticism for "not being organized enough"',
          ],
        },
        'recommendations': {
          'ru': [
            'Выстраивайте максимально простые и наглядные системы напоминаний и планирования',
            'Разбивайте задачи на маленькие шаги и фиксируйте их письменно',
            'При длительных и заметных трудностях рассмотрите консультацию со специалистом',
          ],
          'en': [
            'Build the simplest and most visual reminder and planning systems',
            'Break tasks into small steps and write them down',
            'For prolonged and noticeable difficulties, consider consultation with a specialist',
          ],
        },
        'suitableRoles': {
          'ru': [
            'Работа с вариативными задачами и возможностью часто переключаться',
            'Проекты, где важна креативность, а не идеальный порядок',
            'Форматы, в которых можно делегировать часть рутины',
          ],
          'en': [
            'Work with variable tasks and frequent switching opportunities',
            'Projects where creativity matters more than perfect order',
            'Formats where routine can be partially delegated',
          ],
        },
        'tryToday': {
          'ru':
              'Выберите одну важную задачу на сегодня и разбейте её на 3 конкретных шага. Запишите их.',
          'en':
              'Choose one important task for today and break it into 3 specific steps. Write them down.',
        },
        'inspiringMessage': {
          'ru':
              'Ваша способность замечать детали, когда вы увлечены — это скрытая суперсила. Найдите то, что захватывает ваше внимание естественно.',
          'en':
              'Your ability to notice details when engaged is a hidden superpower. Find what naturally captures your attention.',
        },
      },
      'hyperactive_impulsive_profile': {
        'name': {
          'ru': 'Гиперактивно-импульсивный профиль',
          'en': 'Hyperactive-Impulsive Profile',
        },
        'description': {
          'ru':
              'Главная особенность этого профиля — высокий уровень внутреннего и внешнего движения, который сочетается с импульсивными решениями и реакциями.',
          'en':
              'The main feature of this profile is a high level of internal and external movement combined with impulsive decisions and reactions.',
        },
        'characteristics': {
          'ru': [
            'Трудности долго сидеть на месте и спокойно ждать',
            'Склонность говорить или действовать, не дожидаясь полной информации',
            'Высокая энергичность, которая может быть ресурсом, но и источником конфликтов',
            'Возможные вспышки раздражения и сожаления о сказанном или сделанном',
          ],
          'en': [
            'Difficulty sitting still for long and waiting patiently',
            'Tendency to speak or act without waiting for complete information',
            'High energy that can be a resource but also a source of conflict',
            'Possible outbursts of irritation and regret about what was said or done',
          ],
        },
        'recommendations': {
          'ru': [
            'Ищите форматы деятельности, где энергия и быстрота реакции являются плюсом',
            'Тренируйте навыки микропауз: дыхание, счёт, короткое переключение внимания',
            'При выраженных трудностях в отношениях обсудите стратегии с психотерапевтом',
          ],
          'en': [
            'Look for activity formats where energy and quick reactions are an advantage',
            'Practice micro-pause skills: breathing, counting, brief attention switching',
            'For significant relationship difficulties, discuss strategies with a psychotherapist',
          ],
        },
        'suitableRoles': {
          'ru': [
            'Динамичная работа с высоким уровнем активности и взаимодействия',
            'Проекты, где ценятся быстрота реакции и способность действовать в неопределённости',
            'Роли, позволяющие много двигаться и не сидеть весь день',
          ],
          'en': [
            'Dynamic work with high activity and interaction levels',
            'Projects that value quick reactions and ability to act in uncertainty',
            'Roles that allow lots of movement and not sitting all day',
          ],
        },
        'tryToday': {
          'ru':
              'Перед следующим важным разговором сделайте 3 глубоких вдоха-выдоха и сосчитайте до 5 про себя.',
          'en':
              'Before your next important conversation, take 3 deep breaths and count to 5 silently.',
        },
        'inspiringMessage': {
          'ru':
              'Ваша энергия и способность быстро действовать — это ценный ресурс. Направьте его в то, что вас по-настоящему вдохновляет.',
          'en':
              'Your energy and ability to act quickly are valuable resources. Channel them into what truly inspires you.',
        },
      },
      'mixed_profile': {
        'name': {
          'ru': 'Смешанный профиль внимания и саморегуляции',
          'en': 'Mixed Attention & Self-Regulation Profile',
        },
        'description': {
          'ru':
              'В смешанном профиле внимание и саморегуляция затронуты сразу в нескольких областях: есть и рассеянность, и внутреннее беспокойство, и импульсивность.',
          'en':
              'In a mixed profile, attention and self-regulation are affected in several areas: there is both distractibility, internal restlessness, and impulsivity.',
        },
        'characteristics': {
          'ru': [
            'Трудности удержания внимания и завершения задач',
            'Ощущение внутреннего хаоса и постоянного «перегрева мозга»',
            'Импульсивные решения и реакции, о которых позже можно сожалеть',
            'Высокий риск усталости, выгорания и самокритики',
          ],
          'en': [
            'Difficulties maintaining attention and completing tasks',
            'Feeling of internal chaos and constant "brain overload"',
            'Impulsive decisions and reactions that you may later regret',
            'High risk of fatigue, burnout, and self-criticism',
          ],
        },
        'recommendations': {
          'ru': [
            'Важно относиться к этому не как к «поломке», а как к особенностям нервной системы',
            'Начните с базового: режим сна, питание, движение, уменьшение параллельных задач',
            'Серьёзно рассмотрите возможность профессиональной поддержки (психотерапия, консультация психиатра)',
          ],
          'en': [
            'It\'s important to view this not as a "breakdown" but as nervous system characteristics',
            'Start with basics: sleep schedule, nutrition, movement, reducing parallel tasks',
            'Seriously consider professional support (psychotherapy, psychiatrist consultation)',
          ],
        },
        'suitableRoles': {
          'ru': [
            'Проекты, где можно комбинировать разные виды активности',
            'Среды с понятными структурами и внешней поддержкой (наставники, чёткие регламенты)',
            'Форматы работы, где ценятся креативность, скорость и нестандартное мышление',
          ],
          'en': [
            'Projects where you can combine different types of activity',
            'Environments with clear structures and external support (mentors, clear guidelines)',
            'Work formats that value creativity, speed, and non-standard thinking',
          ],
        },
        'tryToday': {
          'ru':
              'Выберите одну область (внимание, энергия или импульсивность) и попробуйте одну маленькую технику для неё.',
          'en':
              'Choose one area (attention, energy, or impulsivity) and try one small technique for it.',
        },
        'inspiringMessage': {
          'ru':
              'Ваш уникальный мозг может быть источником креативности и нестандартных решений. Найдите среду, которая поддерживает ваши особенности.',
          'en':
              'Your unique brain can be a source of creativity and unconventional solutions. Find an environment that supports your characteristics.',
        },
      },
    };
  }
}
