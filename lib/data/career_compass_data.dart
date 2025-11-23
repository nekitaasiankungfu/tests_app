/// Данные для теста "Карьерный компас"
///
/// Содержит:
/// - 56 вопросов forced_choice
/// - 8 шкал карьерных интересов
/// - Интерпретации для каждой шкалы
/// - 8 карьерных профилей
///
/// @version: 1.0.0

import '../models/career_compass_model.dart';

class CareerCompassData {
  /// 8 шкал карьерных интересов
  static const List<CareerScale> scales = [
    CareerScale(
      id: 'people',
      name: {'ru': 'Работа с людьми', 'en': 'Working with People'},
      description: {
        'ru': 'Склонность к общению, помощи, обучению и взаимодействию с людьми',
        'en': 'Inclination for communication, helping, teaching and interaction with people'
      },
      icon: '👥',
      color: '#FF6B6B',
      keywords: ['общение', 'помощь', 'обучение', 'переговоры', 'команда'],
    ),
    CareerScale(
      id: 'analysis',
      name: {'ru': 'Анализ и исследование', 'en': 'Analysis and Research'},
      description: {
        'ru': 'Склонность к изучению, анализу данных, поиску закономерностей',
        'en': 'Inclination for studying, data analysis, finding patterns'
      },
      icon: '🔬',
      color: '#4ECDC4',
      keywords: ['исследование', 'анализ', 'логика', 'данные', 'закономерности'],
    ),
    CareerScale(
      id: 'creation',
      name: {'ru': 'Творчество и дизайн', 'en': 'Creativity and Design'},
      description: {
        'ru': 'Склонность к художественному самовыражению, созданию визуального контента',
        'en': 'Inclination for artistic expression, creating visual content'
      },
      icon: '🎨',
      color: '#A855F7',
      keywords: ['творчество', 'дизайн', 'искусство', 'визуал', 'эстетика'],
    ),
    CareerScale(
      id: 'technology',
      name: {'ru': 'Техника и технологии', 'en': 'Technology and Engineering'},
      description: {
        'ru': 'Склонность к работе с техникой, программированием и инженерией',
        'en': 'Inclination for working with technology, programming and engineering'
      },
      icon: '⚙️',
      color: '#3B82F6',
      keywords: ['техника', 'механизмы', 'IT', 'инженерия', 'системы'],
    ),
    CareerScale(
      id: 'business',
      name: {'ru': 'Бизнес и управление', 'en': 'Business and Management'},
      description: {
        'ru': 'Склонность к предпринимательству, управлению и лидерству',
        'en': 'Inclination for entrepreneurship, management and leadership'
      },
      icon: '📊',
      color: '#F59E0B',
      keywords: ['бизнес', 'управление', 'лидерство', 'организация', 'стратегия'],
    ),
    CareerScale(
      id: 'nature',
      name: {'ru': 'Природа и практика', 'en': 'Nature and Practice'},
      description: {
        'ru': 'Склонность к работе на природе, с растениями, животными',
        'en': 'Inclination for outdoor work, with plants, animals'
      },
      icon: '🌿',
      color: '#22C55E',
      keywords: ['природа', 'животные', 'растения', 'физический труд', 'экология'],
    ),
    CareerScale(
      id: 'order',
      name: {'ru': 'Порядок и структура', 'en': 'Order and Structure'},
      description: {
        'ru': 'Склонность к систематизации, документообороту, соблюдению правил',
        'en': 'Inclination for systematization, documentation, following rules'
      },
      icon: '📋',
      color: '#6B7280',
      keywords: ['порядок', 'документы', 'правила', 'процедуры', 'точность'],
    ),
    CareerScale(
      id: 'care',
      name: {'ru': 'Забота и защита', 'en': 'Care and Protection'},
      description: {
        'ru': 'Склонность к заботе о здоровье, безопасности и защите других',
        'en': 'Inclination for health care, safety and protection of others'
      },
      icon: '💚',
      color: '#EC4899',
      keywords: ['здоровье', 'безопасность', 'защита', 'медицина', 'помощь'],
    ),
  ];

  /// 56 вопросов forced_choice
  static const List<ForcedChoiceQuestion> questions = [
    // Вопрос 1: people vs technology
    ForcedChoiceQuestion(
      id: 1,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Объяснять сложные вещи простым языком', scaleId: 'people'),
      optionB: ForcedChoiceOption(text: 'Разбираться в сложных механизмах', scaleId: 'technology'),
    ),
    // Вопрос 2: analysis vs creation
    ForcedChoiceQuestion(
      id: 2,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Искать закономерности в данных', scaleId: 'analysis'),
      optionB: ForcedChoiceOption(text: 'Создавать визуальные образы', scaleId: 'creation'),
    ),
    // Вопрос 3: creation vs nature
    ForcedChoiceQuestion(
      id: 3,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Придумывать дизайн интерьера или одежды', scaleId: 'creation'),
      optionB: ForcedChoiceOption(text: 'Выращивать растения или ухаживать за животными', scaleId: 'nature'),
    ),
    // Вопрос 4: technology vs order
    ForcedChoiceQuestion(
      id: 4,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Программировать или настраивать оборудование', scaleId: 'technology'),
      optionB: ForcedChoiceOption(text: 'Вести учёт и работать с документами', scaleId: 'order'),
    ),
    // Вопрос 5: business vs care
    ForcedChoiceQuestion(
      id: 5,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Организовывать работу команды', scaleId: 'business'),
      optionB: ForcedChoiceOption(text: 'Помогать людям решать их проблемы', scaleId: 'care'),
    ),
    // Вопрос 6: nature vs people
    ForcedChoiceQuestion(
      id: 6,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Работать на свежем воздухе', scaleId: 'nature'),
      optionB: ForcedChoiceOption(text: 'Проводить переговоры и убеждать', scaleId: 'people'),
    ),
    // Вопрос 7: order vs analysis
    ForcedChoiceQuestion(
      id: 7,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Следить за соблюдением правил и стандартов', scaleId: 'order'),
      optionB: ForcedChoiceOption(text: 'Анализировать статистику и отчёты', scaleId: 'analysis'),
    ),
    // Вопрос 8: care vs business
    ForcedChoiceQuestion(
      id: 8,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Заботиться о здоровье и безопасности людей', scaleId: 'care'),
      optionB: ForcedChoiceOption(text: 'Развивать свой бизнес или проект', scaleId: 'business'),
    ),
    // Вопрос 9: people vs creation
    ForcedChoiceQuestion(
      id: 9,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Обучать других новым навыкам', scaleId: 'people'),
      optionB: ForcedChoiceOption(text: 'Создавать произведения искусства', scaleId: 'creation'),
    ),
    // Вопрос 10: analysis vs technology
    ForcedChoiceQuestion(
      id: 10,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Проводить исследования и эксперименты', scaleId: 'analysis'),
      optionB: ForcedChoiceOption(text: 'Строить или ремонтировать', scaleId: 'technology'),
    ),
    // Вопрос 11: creation vs business
    ForcedChoiceQuestion(
      id: 11,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Фотографировать или снимать видео', scaleId: 'creation'),
      optionB: ForcedChoiceOption(text: 'Организовывать мероприятия', scaleId: 'business'),
    ),
    // Вопрос 12: technology vs care
    ForcedChoiceQuestion(
      id: 12,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Работать с чертежами и схемами', scaleId: 'technology'),
      optionB: ForcedChoiceOption(text: 'Оказывать первую помощь', scaleId: 'care'),
    ),
    // Вопрос 13: business vs nature
    ForcedChoiceQuestion(
      id: 13,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Принимать решения и нести ответственность', scaleId: 'business'),
      optionB: ForcedChoiceOption(text: 'Работать с землёй и растениями', scaleId: 'nature'),
    ),
    // Вопрос 14: nature vs order
    ForcedChoiceQuestion(
      id: 14,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Изучать поведение животных', scaleId: 'nature'),
      optionB: ForcedChoiceOption(text: 'Архивировать и систематизировать информацию', scaleId: 'order'),
    ),
    // Вопрос 15: order vs people
    ForcedChoiceQuestion(
      id: 15,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Проверять документы на ошибки', scaleId: 'order'),
      optionB: ForcedChoiceOption(text: 'Консультировать людей', scaleId: 'people'),
    ),
    // Вопрос 16: care vs analysis
    ForcedChoiceQuestion(
      id: 16,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Следить за чьим-то выздоровлением', scaleId: 'care'),
      optionB: ForcedChoiceOption(text: 'Изучать научную литературу', scaleId: 'analysis'),
    ),
    // Вопрос 17: people vs order
    ForcedChoiceQuestion(
      id: 17,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Слушать людей и помогать им разобраться в себе', scaleId: 'people'),
      optionB: ForcedChoiceOption(text: 'Составлять графики и расписания', scaleId: 'order'),
    ),
    // Вопрос 18: analysis vs business
    ForcedChoiceQuestion(
      id: 18,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Решать логические задачи', scaleId: 'analysis'),
      optionB: ForcedChoiceOption(text: 'Управлять финансами и бюджетом', scaleId: 'business'),
    ),
    // Вопрос 19: creation vs care
    ForcedChoiceQuestion(
      id: 19,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Писать тексты или музыку', scaleId: 'creation'),
      optionB: ForcedChoiceOption(text: 'Обеспечивать безопасность людей', scaleId: 'care'),
    ),
    // Вопрос 20: technology vs nature
    ForcedChoiceQuestion(
      id: 20,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Разрабатывать новые технические решения', scaleId: 'technology'),
      optionB: ForcedChoiceOption(text: 'Путешествовать и изучать новые места', scaleId: 'nature'),
    ),
    // Вопрос 21: business vs order
    ForcedChoiceQuestion(
      id: 21,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Запускать новые проекты с нуля', scaleId: 'business'),
      optionB: ForcedChoiceOption(text: 'Оформлять документы и отчёты', scaleId: 'order'),
    ),
    // Вопрос 22: nature vs people
    ForcedChoiceQuestion(
      id: 22,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Заниматься экологией и защитой природы', scaleId: 'nature'),
      optionB: ForcedChoiceOption(text: 'Создавать обучающие материалы', scaleId: 'people'),
    ),
    // Вопрос 23: order vs analysis
    ForcedChoiceQuestion(
      id: 23,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Контролировать качество работы', scaleId: 'order'),
      optionB: ForcedChoiceOption(text: 'Собирать и анализировать факты', scaleId: 'analysis'),
    ),
    // Вопрос 24: care vs creation
    ForcedChoiceQuestion(
      id: 24,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Помогать людям в трудной жизненной ситуации', scaleId: 'care'),
      optionB: ForcedChoiceOption(text: 'Рисовать или лепить', scaleId: 'creation'),
    ),
    // Вопрос 25: people vs technology
    ForcedChoiceQuestion(
      id: 25,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Разрешать конфликты между людьми', scaleId: 'people'),
      optionB: ForcedChoiceOption(text: 'Чинить технику и устройства', scaleId: 'technology'),
    ),
    // Вопрос 26: analysis vs nature
    ForcedChoiceQuestion(
      id: 26,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Писать аналитические отчёты', scaleId: 'analysis'),
      optionB: ForcedChoiceOption(text: 'Ухаживать за садом или огородом', scaleId: 'nature'),
    ),
    // Вопрос 27: creation vs business
    ForcedChoiceQuestion(
      id: 27,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Создавать бренды и визуальную айдентику', scaleId: 'creation'),
      optionB: ForcedChoiceOption(text: 'Планировать и контролировать бюджет', scaleId: 'business'),
    ),
    // Вопрос 28: technology vs care
    ForcedChoiceQuestion(
      id: 28,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Автоматизировать рутинные процессы', scaleId: 'technology'),
      optionB: ForcedChoiceOption(text: 'Защищать права и интересы людей', scaleId: 'care'),
    ),
    // Вопрос 29: business vs order
    ForcedChoiceQuestion(
      id: 29,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Вести переговоры о сделках', scaleId: 'business'),
      optionB: ForcedChoiceOption(text: 'Вести базы данных и реестры', scaleId: 'order'),
    ),
    // Вопрос 30: nature vs people
    ForcedChoiceQuestion(
      id: 30,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Работать с животными', scaleId: 'nature'),
      optionB: ForcedChoiceOption(text: 'Выступать перед аудиторией', scaleId: 'people'),
    ),
    // Вопрос 31: order vs technology
    ForcedChoiceQuestion(
      id: 31,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Следовать инструкциям и регламентам', scaleId: 'order'),
      optionB: ForcedChoiceOption(text: 'Изобретать новые способы решения задач', scaleId: 'technology'),
    ),
    // Вопрос 32: care vs analysis
    ForcedChoiceQuestion(
      id: 32,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Работать в больнице или поликлинике', scaleId: 'care'),
      optionB: ForcedChoiceOption(text: 'Работать в исследовательской лаборатории', scaleId: 'analysis'),
    ),
    // Вопрос 33: people vs creation
    ForcedChoiceQuestion(
      id: 33,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Мотивировать и вдохновлять других', scaleId: 'people'),
      optionB: ForcedChoiceOption(text: 'Редактировать фото или видео', scaleId: 'creation'),
    ),
    // Вопрос 34: analysis vs business
    ForcedChoiceQuestion(
      id: 34,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Проверять гипотезы с помощью экспериментов', scaleId: 'analysis'),
      optionB: ForcedChoiceOption(text: 'Руководить командой', scaleId: 'business'),
    ),
    // Вопрос 35: creation vs order
    ForcedChoiceQuestion(
      id: 35,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Оформлять интерьеры или витрины', scaleId: 'creation'),
      optionB: ForcedChoiceOption(text: 'Обеспечивать чистоту и порядок в документах', scaleId: 'order'),
    ),
    // Вопрос 36: technology vs nature
    ForcedChoiceQuestion(
      id: 36,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Собирать и разбирать устройства', scaleId: 'technology'),
      optionB: ForcedChoiceOption(text: 'Заниматься спортом или фитнесом', scaleId: 'nature'),
    ),
    // Вопрос 37: business vs care
    ForcedChoiceQuestion(
      id: 37,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Открывать новые рынки и возможности', scaleId: 'business'),
      optionB: ForcedChoiceOption(text: 'Проводить медицинские процедуры', scaleId: 'care'),
    ),
    // Вопрос 38: nature vs people
    ForcedChoiceQuestion(
      id: 38,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Изучать экосистемы и биологию', scaleId: 'nature'),
      optionB: ForcedChoiceOption(text: 'Проводить презентации и обучение', scaleId: 'people'),
    ),
    // Вопрос 39: order vs analysis
    ForcedChoiceQuestion(
      id: 39,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Составлять отчёты по установленной форме', scaleId: 'order'),
      optionB: ForcedChoiceOption(text: 'Работать с большими объёмами информации', scaleId: 'analysis'),
    ),
    // Вопрос 40: care vs creation
    ForcedChoiceQuestion(
      id: 40,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Консультировать по вопросам здорового образа жизни', scaleId: 'care'),
      optionB: ForcedChoiceOption(text: 'Разрабатывать рекламные концепции', scaleId: 'creation'),
    ),
    // Вопрос 41: people vs technology
    ForcedChoiceQuestion(
      id: 41,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Проводить интервью и опросы', scaleId: 'people'),
      optionB: ForcedChoiceOption(text: 'Настраивать сети и серверы', scaleId: 'technology'),
    ),
    // Вопрос 42: analysis vs nature
    ForcedChoiceQuestion(
      id: 42,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Строить математические модели', scaleId: 'analysis'),
      optionB: ForcedChoiceOption(text: 'Работать в сфере туризма и путешествий', scaleId: 'nature'),
    ),
    // Вопрос 43: creation vs business
    ForcedChoiceQuestion(
      id: 43,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Создавать 3D-модели или анимацию', scaleId: 'creation'),
      optionB: ForcedChoiceOption(text: 'Управлять логистикой и поставками', scaleId: 'business'),
    ),
    // Вопрос 44: technology vs order
    ForcedChoiceQuestion(
      id: 44,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Разрабатывать приложения или игры', scaleId: 'technology'),
      optionB: ForcedChoiceOption(text: 'Обеспечивать соблюдение норм и законов', scaleId: 'order'),
    ),
    // Вопрос 45: business vs care
    ForcedChoiceQuestion(
      id: 45,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Привлекать инвестиции и партнёров', scaleId: 'business'),
      optionB: ForcedChoiceOption(text: 'Работать спасателем или в МЧС', scaleId: 'care'),
    ),
    // Вопрос 46: nature vs people
    ForcedChoiceQuestion(
      id: 46,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Заниматься фермерством или агрономией', scaleId: 'nature'),
      optionB: ForcedChoiceOption(text: 'Организовывать тренинги и семинары', scaleId: 'people'),
    ),
    // Вопрос 47: order vs analysis
    ForcedChoiceQuestion(
      id: 47,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Проверять бухгалтерскую отчётность', scaleId: 'order'),
      optionB: ForcedChoiceOption(text: 'Проводить социологические исследования', scaleId: 'analysis'),
    ),
    // Вопрос 48: care vs creation
    ForcedChoiceQuestion(
      id: 48,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Помогать людям с особыми потребностями', scaleId: 'care'),
      optionB: ForcedChoiceOption(text: 'Создавать украшения или handmade-изделия', scaleId: 'creation'),
    ),
    // Вопрос 49: people vs technology
    ForcedChoiceQuestion(
      id: 49,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Работать психологом или коучем', scaleId: 'people'),
      optionB: ForcedChoiceOption(text: 'Работать инженером или механиком', scaleId: 'technology'),
    ),
    // Вопрос 50: analysis vs nature
    ForcedChoiceQuestion(
      id: 50,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Изучать историю и архивные материалы', scaleId: 'analysis'),
      optionB: ForcedChoiceOption(text: 'Разводить животных или заниматься ветеринарией', scaleId: 'nature'),
    ),
    // Вопрос 51: creation vs business
    ForcedChoiceQuestion(
      id: 51,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Работать архитектором или художником', scaleId: 'creation'),
      optionB: ForcedChoiceOption(text: 'Работать директором или управленцем', scaleId: 'business'),
    ),
    // Вопрос 52: technology vs order
    ForcedChoiceQuestion(
      id: 52,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Проектировать здания или конструкции', scaleId: 'technology'),
      optionB: ForcedChoiceOption(text: 'Работать в архиве или библиотеке', scaleId: 'order'),
    ),
    // Вопрос 53: business vs care
    ForcedChoiceQuestion(
      id: 53,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Строить карьеру в продажах или маркетинге', scaleId: 'business'),
      optionB: ForcedChoiceOption(text: 'Работать в скорой помощи или реанимации', scaleId: 'care'),
    ),
    // Вопрос 54: nature vs people
    ForcedChoiceQuestion(
      id: 54,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Работать геологом или экологом', scaleId: 'nature'),
      optionB: ForcedChoiceOption(text: 'Работать HR-менеджером или рекрутером', scaleId: 'people'),
    ),
    // Вопрос 55: order vs analysis
    ForcedChoiceQuestion(
      id: 55,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Работать нотариусом или юристом-документоведом', scaleId: 'order'),
      optionB: ForcedChoiceOption(text: 'Работать учёным или исследователем', scaleId: 'analysis'),
    ),
    // Вопрос 56: care vs creation
    ForcedChoiceQuestion(
      id: 56,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(text: 'Работать медсестрой или социальным работником', scaleId: 'care'),
      optionB: ForcedChoiceOption(text: 'Работать дизайнером или иллюстратором', scaleId: 'creation'),
    ),
  ];

  /// Карьерные профили
  static const List<CareerProfile> profiles = [
    CareerProfile(
      id: 'helper',
      name: {'ru': 'Помощник', 'en': 'Helper'},
      emoji: '🤝',
      description: {
        'ru': 'Вы ориентированы на людей и заботу. Ваша сила — в эмпатии, общении и желании помогать.',
        'en': 'You are people and care oriented. Your strength is in empathy, communication and desire to help.'
      },
      topScales: ['people', 'care'],
      suitableIndustries: ['Здравоохранение', 'Образование', 'Социальная работа', 'HR', 'Психология'],
      keyProfessions: ['Психолог', 'Учитель', 'HR-менеджер', 'Социальный работник', 'Медицинский работник'],
      strengths: ['Эмпатия', 'Коммуникабельность', 'Терпение', 'Забота'],
      developmentAreas: ['Установление границ', 'Профилактика выгорания', 'Бизнес-навыки'],
    ),
    CareerProfile(
      id: 'analyst',
      name: {'ru': 'Аналитик', 'en': 'Analyst'},
      emoji: '📊',
      description: {
        'ru': 'Вы ориентированы на данные, исследования и поиск истины. Ваша сила — в логике и внимании к деталям.',
        'en': 'You are data and research oriented. Your strength is in logic and attention to detail.'
      },
      topScales: ['analysis', 'order'],
      suitableIndustries: ['Наука', 'Финансы', 'IT', 'Консалтинг', 'Право'],
      keyProfessions: ['Аналитик данных', 'Учёный', 'Финансовый аналитик', 'Аудитор', 'Исследователь'],
      strengths: ['Логическое мышление', 'Внимание к деталям', 'Объективность', 'Методичность'],
      developmentAreas: ['Коммуникация выводов', 'Презентационные навыки', 'Работа в неопределённости'],
    ),
    CareerProfile(
      id: 'creator',
      name: {'ru': 'Творец', 'en': 'Creator'},
      emoji: '🎨',
      description: {
        'ru': 'Вы ориентированы на самовыражение и создание нового. Ваша сила — в воображении и эстетике.',
        'en': 'You are oriented towards self-expression and creating new things. Your strength is in imagination and aesthetics.'
      },
      topScales: ['creation', 'people'],
      suitableIndustries: ['Дизайн', 'Медиа', 'Развлечения', 'Маркетинг', 'Реклама'],
      keyProfessions: ['Дизайнер', 'Художник', 'Фотограф', 'Копирайтер', 'Арт-директор'],
      strengths: ['Креативность', 'Оригинальность', 'Визуальное мышление', 'Чувство стиля'],
      developmentAreas: ['Бизнес-навыки', 'Работа с дедлайнами', 'Продвижение себя'],
    ),
    CareerProfile(
      id: 'engineer',
      name: {'ru': 'Инженер', 'en': 'Engineer'},
      emoji: '⚙️',
      description: {
        'ru': 'Вы ориентированы на технику и системы. Ваша сила — в понимании того, как всё работает.',
        'en': 'You are technology and systems oriented. Your strength is in understanding how things work.'
      },
      topScales: ['technology', 'analysis'],
      suitableIndustries: ['IT', 'Инженерия', 'Производство', 'Робототехника', 'Энергетика'],
      keyProfessions: ['Программист', 'Инженер', 'Системный архитектор', 'DevOps', 'Конструктор'],
      strengths: ['Системное мышление', 'Технические навыки', 'Решение проблем', 'Внимание к деталям'],
      developmentAreas: ['Soft skills', 'Презентация идей', 'Работа с нетехническими stakeholders'],
    ),
    CareerProfile(
      id: 'leader',
      name: {'ru': 'Лидер', 'en': 'Leader'},
      emoji: '👔',
      description: {
        'ru': 'Вы ориентированы на управление и результаты. Ваша сила — в организации и принятии решений.',
        'en': 'You are management and results oriented. Your strength is in organization and decision making.'
      },
      topScales: ['business', 'people'],
      suitableIndustries: ['Управление', 'Продажи', 'Консалтинг', 'Предпринимательство'],
      keyProfessions: ['Руководитель', 'Предприниматель', 'Менеджер по продажам', 'Консультант', 'Product owner'],
      strengths: ['Лидерство', 'Стратегическое мышление', 'Умение убеждать', 'Принятие решений'],
      developmentAreas: ['Делегирование', 'Эмоциональный интеллект', 'Work-life balance'],
    ),
    CareerProfile(
      id: 'practitioner',
      name: {'ru': 'Практик', 'en': 'Practitioner'},
      emoji: '🌱',
      description: {
        'ru': 'Вы ориентированы на практику и природу. Ваша сила — в физическом труде и контакте с реальным миром.',
        'en': 'You are practice and nature oriented. Your strength is in physical work and contact with the real world.'
      },
      topScales: ['nature', 'care'],
      suitableIndustries: ['Сельское хозяйство', 'Экология', 'Спорт', 'Туризм', 'Ветеринария'],
      keyProfessions: ['Ветеринар', 'Эколог', 'Агроном', 'Тренер', 'Инструктор'],
      strengths: ['Практичность', 'Выносливость', 'Любовь к природе', 'Физическая активность'],
      developmentAreas: ['Бизнес-навыки', 'Технологическая грамотность', 'Карьерное планирование'],
    ),
    CareerProfile(
      id: 'organizer',
      name: {'ru': 'Организатор', 'en': 'Organizer'},
      emoji: '📋',
      description: {
        'ru': 'Вы ориентированы на порядок и систему. Ваша сила — в организации и соблюдении правил.',
        'en': 'You are order and system oriented. Your strength is in organization and following rules.'
      },
      topScales: ['order', 'analysis'],
      suitableIndustries: ['Юриспруденция', 'Бухгалтерия', 'Администрирование', 'Логистика', 'Качество'],
      keyProfessions: ['Бухгалтер', 'Юрист', 'Аудитор', 'Логист', 'Специалист по качеству'],
      strengths: ['Организованность', 'Внимание к деталям', 'Надёжность', 'Точность'],
      developmentAreas: ['Гибкость', 'Креативность', 'Работа с изменениями'],
    ),
    CareerProfile(
      id: 'protector',
      name: {'ru': 'Защитник', 'en': 'Protector'},
      emoji: '🛡️',
      description: {
        'ru': 'Вы ориентированы на безопасность и защиту. Ваша сила — в готовности помогать в критических ситуациях.',
        'en': 'You are safety and protection oriented. Your strength is in readiness to help in critical situations.'
      },
      topScales: ['care', 'nature'],
      suitableIndustries: ['МЧС', 'Медицина скорой помощи', 'Безопасность', 'Военное дело'],
      keyProfessions: ['Спасатель', 'Врач скорой помощи', 'Полицейский', 'Пожарный', 'Охранник'],
      strengths: ['Смелость', 'Быстрая реакция', 'Физическая подготовка', 'Стрессоустойчивость'],
      developmentAreas: ['Эмоциональная регуляция', 'Профилактика ПТСР', 'Карьерный рост'],
    ),
  ];

  /// Получить шкалу по ID
  static CareerScale? getScaleById(String id) {
    try {
      return scales.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Получить профиль по ID
  static CareerProfile? getProfileById(String id) {
    try {
      return profiles.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Получить интерпретацию для шкалы
  static Map<String, String> getScaleInterpretation(String scaleId, int score, bool isRussian) {
    // Пороги для maxScaleScore = 14:
    // low: 0-4 (0-29%), medium: 5-9 (36-64%), high: 10-14 (71-100%)
    final level = score <= 4 ? 'low' : (score <= 9 ? 'medium' : 'high');
    final lang = isRussian ? 'ru' : 'en';

    final interpretations = _interpretations[scaleId];
    if (interpretations == null) {
      return {
        'level': level,
        'label': isRussian ? 'Неизвестный уровень' : 'Unknown level',
        'description': isRussian ? 'Интерпретация недоступна' : 'Interpretation unavailable',
      };
    }

    final interp = interpretations[level]!;
    return {
      'level': level,
      'label': interp['label']![lang]!,
      'shortDescription': interp['short']![lang]!,
      'detailedDescription': interp['detailed']![lang]!,
    };
  }

  /// Интерпретации для каждой шкалы
  static const Map<String, Map<String, Map<String, Map<String, String>>>> _interpretations = {
    'people': {
      'low': {
        'label': {'ru': 'Низкий интерес', 'en': 'Low interest'},
        'short': {'ru': 'Вы предпочитаете работу без интенсивного общения', 'en': 'You prefer work without intensive communication'},
        'detailed': {'ru': 'Работа с людьми не является вашим приоритетом. Вам комфортнее работать самостоятельно.', 'en': 'Working with people is not your priority. You feel more comfortable working independently.'},
      },
      'medium': {
        'label': {'ru': 'Умеренный интерес', 'en': 'Moderate interest'},
        'short': {'ru': 'Вам комфортна работа с людьми, но это не главное', 'en': 'You are comfortable with people, but it is not the main thing'},
        'detailed': {'ru': 'Вы способны эффективно работать с людьми, но не нуждаетесь в постоянном общении.', 'en': 'You can work effectively with people, but do not need constant communication.'},
      },
      'high': {
        'label': {'ru': 'Высокий интерес', 'en': 'High interest'},
        'short': {'ru': 'Работа с людьми — ваша стихия', 'en': 'Working with people is your element'},
        'detailed': {'ru': 'Вы получаете энергию от общения, помощи и взаимодействия с людьми.', 'en': 'You get energy from communication, helping and interacting with people.'},
      },
    },
    'analysis': {
      'low': {
        'label': {'ru': 'Низкий интерес', 'en': 'Low interest'},
        'short': {'ru': 'Аналитика не является вашим приоритетом', 'en': 'Analytics is not your priority'},
        'detailed': {'ru': 'Вам менее интересно погружаться в данные и искать закономерности.', 'en': 'You are less interested in diving into data and finding patterns.'},
      },
      'medium': {
        'label': {'ru': 'Умеренный интерес', 'en': 'Moderate interest'},
        'short': {'ru': 'Вы способны к анализу, но это не главная страсть', 'en': 'You are capable of analysis, but it is not your main passion'},
        'detailed': {'ru': 'Вы можете работать с данными, когда это нужно для достижения целей.', 'en': 'You can work with data when needed to achieve goals.'},
      },
      'high': {
        'label': {'ru': 'Высокий интерес', 'en': 'High interest'},
        'short': {'ru': 'Исследование и анализ — ваша стихия', 'en': 'Research and analysis is your element'},
        'detailed': {'ru': 'Вы получаете удовольствие от погружения в данные и поиска закономерностей.', 'en': 'You enjoy diving into data and finding patterns.'},
      },
    },
    'creation': {
      'low': {
        'label': {'ru': 'Низкий интерес', 'en': 'Low interest'},
        'short': {'ru': 'Творчество не является вашим приоритетом', 'en': 'Creativity is not your priority'},
        'detailed': {'ru': 'Вы предпочитаете структурированные задачи с чёткими критериями.', 'en': 'You prefer structured tasks with clear criteria.'},
      },
      'medium': {
        'label': {'ru': 'Умеренный интерес', 'en': 'Moderate interest'},
        'short': {'ru': 'Вы способны к творчеству, но это не главное', 'en': 'You are capable of creativity, but it is not the main thing'},
        'detailed': {'ru': 'Вы цените эстетику и можете создавать новое, но не нуждаетесь в этом постоянно.', 'en': 'You appreciate aesthetics and can create new things, but do not need it constantly.'},
      },
      'high': {
        'label': {'ru': 'Высокий интерес', 'en': 'High interest'},
        'short': {'ru': 'Творчество и самовыражение — ваша стихия', 'en': 'Creativity and self-expression is your element'},
        'detailed': {'ru': 'Вы получаете энергию от создания чего-то нового, красивого, уникального.', 'en': 'You get energy from creating something new, beautiful, unique.'},
      },
    },
    'technology': {
      'low': {
        'label': {'ru': 'Низкий интерес', 'en': 'Low interest'},
        'short': {'ru': 'Техника не является вашим приоритетом', 'en': 'Technology is not your priority'},
        'detailed': {'ru': 'Вам менее интересно разбираться в механизмах и программировании.', 'en': 'You are less interested in understanding mechanisms and programming.'},
      },
      'medium': {
        'label': {'ru': 'Умеренный интерес', 'en': 'Moderate interest'},
        'short': {'ru': 'Вы способны работать с техникой, но это не главное', 'en': 'You can work with technology, but it is not the main thing'},
        'detailed': {'ru': 'Техника для вас — инструмент для достижения целей, а не самоцель.', 'en': 'Technology for you is a tool to achieve goals, not an end in itself.'},
      },
      'high': {
        'label': {'ru': 'Высокий интерес', 'en': 'High interest'},
        'short': {'ru': 'Техника и технологии — ваша стихия', 'en': 'Technology and engineering is your element'},
        'detailed': {'ru': 'Вы получаете удовольствие от работы с техникой и инженерными системами.', 'en': 'You enjoy working with technology and engineering systems.'},
      },
    },
    'business': {
      'low': {
        'label': {'ru': 'Низкий интерес', 'en': 'Low interest'},
        'short': {'ru': 'Управление не является вашим приоритетом', 'en': 'Management is not your priority'},
        'detailed': {'ru': 'Вы предпочитаете экспертные роли без управленческих функций.', 'en': 'You prefer expert roles without management functions.'},
      },
      'medium': {
        'label': {'ru': 'Умеренный интерес', 'en': 'Moderate interest'},
        'short': {'ru': 'Вы способны к управлению, но это не главное', 'en': 'You are capable of management, but it is not the main thing'},
        'detailed': {'ru': 'Вы можете брать организационные функции, но не стремитесь к чисто управленческим позициям.', 'en': 'You can take on organizational functions, but do not strive for purely management positions.'},
      },
      'high': {
        'label': {'ru': 'Высокий интерес', 'en': 'High interest'},
        'short': {'ru': 'Бизнес и управление — ваша стихия', 'en': 'Business and management is your element'},
        'detailed': {'ru': 'Вы получаете энергию от организации процессов и достижения результатов.', 'en': 'You get energy from organizing processes and achieving results.'},
      },
    },
    'nature': {
      'low': {
        'label': {'ru': 'Низкий интерес', 'en': 'Low interest'},
        'short': {'ru': 'Работа с природой не является приоритетом', 'en': 'Working with nature is not a priority'},
        'detailed': {'ru': 'Вы предпочитаете офисную среду и интеллектуальную работу.', 'en': 'You prefer office environment and intellectual work.'},
      },
      'medium': {
        'label': {'ru': 'Умеренный интерес', 'en': 'Moderate interest'},
        'short': {'ru': 'Вам нравится природа, но это не основа карьеры', 'en': 'You like nature, but it is not a career basis'},
        'detailed': {'ru': 'Вы цените контакт с природой, но не видите это основой карьеры.', 'en': 'You appreciate contact with nature, but do not see it as a career basis.'},
      },
      'high': {
        'label': {'ru': 'Высокий интерес', 'en': 'High interest'},
        'short': {'ru': 'Природа и практика — ваша стихия', 'en': 'Nature and practice is your element'},
        'detailed': {'ru': 'Вы получаете энергию от работы на открытом воздухе и контакта с природой.', 'en': 'You get energy from outdoor work and contact with nature.'},
      },
    },
    'order': {
      'low': {
        'label': {'ru': 'Низкий интерес', 'en': 'Low interest'},
        'short': {'ru': 'Работа с документами не является приоритетом', 'en': 'Working with documents is not a priority'},
        'detailed': {'ru': 'Вы предпочитаете разнообразие и возможность импровизации.', 'en': 'You prefer variety and opportunity for improvisation.'},
      },
      'medium': {
        'label': {'ru': 'Умеренный интерес', 'en': 'Moderate interest'},
        'short': {'ru': 'Вы способны к систематической работе', 'en': 'You are capable of systematic work'},
        'detailed': {'ru': 'Вы можете работать с документами, но не стремитесь к работе только из этого.', 'en': 'You can work with documents, but do not aspire to work only from this.'},
      },
      'high': {
        'label': {'ru': 'Высокий интерес', 'en': 'High interest'},
        'short': {'ru': 'Порядок и структура — ваша стихия', 'en': 'Order and structure is your element'},
        'detailed': {'ru': 'Вы получаете удовлетворение от систематизации и соблюдения процедур.', 'en': 'You get satisfaction from systematization and following procedures.'},
      },
    },
    'care': {
      'low': {
        'label': {'ru': 'Низкий интерес', 'en': 'Low interest'},
        'short': {'ru': 'Профессии заботы не являются приоритетом', 'en': 'Care professions are not a priority'},
        'detailed': {'ru': 'Другие виды деятельности привлекают вас больше.', 'en': 'Other activities attract you more.'},
      },
      'medium': {
        'label': {'ru': 'Умеренный интерес', 'en': 'Moderate interest'},
        'short': {'ru': 'Вы способны к заботе, но это не главное', 'en': 'You are capable of care, but it is not the main thing'},
        'detailed': {'ru': 'Вы цените возможность помогать, но не видите это единственной основой карьеры.', 'en': 'You appreciate the opportunity to help, but do not see it as the only basis for a career.'},
      },
      'high': {
        'label': {'ru': 'Высокий интерес', 'en': 'High interest'},
        'short': {'ru': 'Забота и защита — ваша стихия', 'en': 'Care and protection is your element'},
        'detailed': {'ru': 'Вы получаете удовлетворение от помощи людям и заботы о их благополучии.', 'en': 'You get satisfaction from helping people and caring for their well-being.'},
      },
    },
  };
}
