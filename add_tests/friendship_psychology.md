{
  "metadata": {
    "test_id": "friendship_psychology_v1",
    "title": "Психология дружбы: глубина, стиль и потенциал",
    "description": "Этот тест исследует ключевые аспекты того, как вы строите дружбу: вашу способность формировать эмоциональную близость, стиль общения, уровень доверия, личные границы, поддерживающее поведение и ожидания от дружественных отношений. Он помогает понять, как вы создаёте и поддерживаете связи, какие сильные стороны проявляете и какие модели взаимодействия являются для вас естественными.",
    "version": "1.1",
    "author": "AI-ассистент",
    "theoretical_basis": [
      "Модель межличностной близости",
      "Психология привязанности (адаптация)",
      "Модель просоциального поведения",
      "Концепция личных границ"
    ],
    "estimated_time_minutes": 7,
    "question_count": 24
  },

  "scales": [
    {
      "id": "emotional_closeness",
      "name": "Эмоциональная близость",
      "description": "Способность открываться, делиться чувствами и создавать глубокую дружескую связь.",
      "question_ids": [1,4,7,10],
      "scoring_method": "sum",
      "normalization": "linear"
    },
    {
      "id": "communication_style",
      "name": "Стиль общения",
      "description": "Как вы взаимодействуете с друзьями: открыто, закрыто, избегающе или уверенно.",
      "question_ids": [2,5,8,11],
      "scoring_method": "sum",
      "normalization": "linear"
    },
    {
      "id": "trust_and_loyalty",
      "name": "Доверие и надёжность",
      "description": "Готовность доверять, соблюдать обещания и рассчитывать на друга.",
      "question_ids": [3,6,9,12],
      "scoring_method": "sum",
      "normalization": "linear"
    },
    {
      "id": "boundaries_and_space",
      "name": "Границы и личное пространство",
      "description": "Способность уважать границы других и отстаивать свои.",
      "question_ids": [13,14,15,16],
      "scoring_method": "sum",
      "normalization": "linear"
    },
    {
      "id": "supportive_behavior",
      "name": "Поддерживающее поведение",
      "description": "Насколько активно вы помогаете друзьям и эмоционально их поддерживаете.",
      "question_ids": [17,18,19,20],
      "scoring_method": "sum",
      "normalization": "linear"
    },
    {
      "id": "friendship_expectations",
      "name": "Ожидания от дружбы",
      "description": "Какие роли, обязанности и потребности вы связываете с дружбой.",
      "question_ids": [21,22,23,24],
      "scoring_method": "sum",
      "normalization": "linear"
    }
  ],

  "questions": [
    { "id": 1, "text": "Мне легко делиться переживаниями с близким другом.", "scale": "emotional_closeness", "reverse": false, "response_type": "likert_5" },
    { "id": 2, "text": "Мне легко говорить о том, что мне нравится или не нравится в общении.", "scale": "communication_style", "reverse": false, "response_type": "likert_5" },
    { "id": 3, "text": "Если я что-то пообещал другу, я обязательно выполню.", "scale": "trust_and_loyalty", "reverse": false, "response_type": "likert_5" },


    { "id": 4, "text": "Когда у меня проблемы, я обычно рассказываю об этом друзьям.", "scale": "emotional_closeness", "reverse": false, "response_type": "likert_5" },
    { "id": 5, "text": "В конфликте я стараюсь объяснить свою позицию спокойно.", "scale": "communication_style", "reverse": false, "response_type": "likert_5" },
    { "id": 6, "text": "Я считаю, что дружба невозможна без полного доверия.", "scale": "trust_and_loyalty", "reverse": false, "response_type": "likert_5" },


    { "id": 7, "text": "Мне сложно эмоционально сблизиться с кем-либо.", "scale": "emotional_closeness", "reverse": true, "response_type": "likert_5" },
    { "id": 8, "text": "Мне трудно говорить о том, что меня задевает.", "scale": "communication_style", "reverse": true, "response_type": "likert_5" },
    { "id": 9, "text": "Мне трудно полностью довериться даже близкому другу.", "scale": "trust_and_loyalty", "reverse": true, "response_type": "likert_5" },


    { "id": 10, "text": "Я ценю глубокие разговоры и эмоциональную поддержку в дружбе.", "scale": "emotional_closeness", "reverse": false, "response_type": "likert_5" },
    { "id": 11, "text": "Я умею слушать и понимать чувства другого человека.", "scale": "communication_style", "reverse": false, "response_type": "likert_5" },
    { "id": 12, "text": "Я могу положиться на друзей, и они — на меня.", "scale": "trust_and_loyalty", "reverse": false, "response_type": "likert_5" },


    { "id": 13, "text": "Мне важно, чтобы друзья уважали моё личное пространство.", "scale": "boundaries_and_space", "reverse": false, "response_type": "likert_5" },
    { "id": 14, "text": "Я стараюсь уважать границы других людей.", "scale": "boundaries_and_space", "reverse": false, "response_type": "likert_5" },
    { "id": 15, "text": "Когда друг слишком навязчив, мне сложно об этом сказать.", "scale": "boundaries_and_space", "reverse": true, "response_type": "likert_5" },
    { "id": 16, "text": "В дружбе важно сохранять баланс близости и автономии.", "scale": "boundaries_and_space", "reverse": false, "response_type": "likert_5" },


    { "id": 17, "text": "Я стараюсь поддерживать друзей в трудные моменты.", "scale": "supportive_behavior", "reverse": false, "response_type": "likert_5" },
    { "id": 18, "text": "Когда у друга проблемы, я стараюсь помочь, насколько могу.", "scale": "supportive_behavior", "reverse": false, "response_type": "likert_5" },
    { "id": 19, "text": "Я редко проявляю инициативу, чтобы поддержать друга.", "scale": "supportive_behavior", "reverse": true, "response_type": "likert_5" },
    { "id": 20, "text": "Я умею заметить, когда другу нужна помощь, даже если он об этом не говорит.", "scale": "supportive_behavior", "reverse": false, "response_type": "likert_5" },


    { "id": 21, "text": "Я ожидаю, что друзья будут рядом, когда мне плохо.", "scale": "friendship_expectations", "reverse": false, "response_type": "likert_5" },
    { "id": 22, "text": "Мне важно, чтобы друг уважал мои приоритеты и цели.", "scale": "friendship_expectations", "reverse": false, "response_type": "likert_5" },
    { "id": 23, "text": "Я считаю, что друзья должны общаться каждый день.", "scale": "friendship_expectations", "reverse": true, "response_type": "likert_5" },
    { "id": 24, "text": "Для меня дружба — это взаимность, а не обязанность.", "scale": "friendship_expectations", "reverse": false, "response_type": "likert_5" }
  ],

  "interpretation_guide": {
    "profiles": [
      {
        "id": "warm_empathic_friend",
        "name": "Тёплый эмпатичный друг",
        "description": "Вы создаёте атмосферу доверия и принятия.",
        "characteristics": [
          "Высокая эмпатия",
          "Поддержка",
          "Глубокая эмоциональная связь"
        ],
        "vulnerabilities": [
          "Склонность к выгоранию",
          "Перегрузка эмоциональными обязанностями"
        ],
        "recommendations": [
          "Укрепляйте личные границы",
          "Уделяйте время себе"
        ]
      },

      {
        "id": "reliable_stable_friend",
        "name": "Надёжный стабильный друг",
        "description": "Вы создаёте чувство устойчивости в отношениях.",
        "characteristics": [
          "Ответственность",
          "Предсказуемость",
          "Честность"
        ],
        "vulnerabilities": [
          "Трудности в выражении чувств"
        ],
        "recommendations": [
          "Практикуйте эмоциональную открытость"
        ]
      },

      {
        "id": "communication_bridge",
        "name": "Коммуникационный мост",
        "description": "Вы умеете договариваться и помогаете другим общаться.",
        "characteristics": [
          "Дипломатичность",
          "Активное слушание",
          "Гибкость"
        ],
        "vulnerabilities": [
          "Избегание собственных эмоций"
        ],
        "recommendations": [
          "Отражайте свои чувства, а не только чужие"
        ]
      },

      {
        "id": "motivator_inspirer",
        "name": "Заряженный вдохновитель",
        "description": "С вами дружба наполнена энергией и движением.",
        "characteristics": [
          "Креативность",
          "Энергия",
          "Мотивация"
        ],
        "vulnerabilities": [
          "Непостоянство"
        ],
        "recommendations": [
          "Тренируйте стабильность"
        ]
      },

      {
        "id": "philosophical_deep_friend",
        "name": "Глубокий философский друг",
        "description": "Вы создаёте интеллектуальную и мудрую атмосферу общения.",
        "characteristics": [
          "Рефлексия",
          "Мудрость"
        ],
        "vulnerabilities": [
          "Эмоциональная дистанция"
        ],
        "recommendations": [
          "Добавляйте лёгкость в общение"
        ]
      },

      {
        "id": "independent_free_friend",
        "name": "Свободолюбивый автономный друг",
        "description": "Вы цените свободу и уважаете границы.",
        "characteristics": [
          "Автономность",
          "Уважение к чужому пространству"
        ],
        "vulnerabilities": [
          "Дистанция, которую могут воспринимать как холод"
        ],
        "recommendations": [
          "Проявляйте участие небольшими жестами"
        ]
      },

      {
        "id": "adventure_partner",
        "name": "Друг-партнёр по приключениям",
        "description": "Ваша дружба строится на совместных активностях.",
        "characteristics": [
          "Драйв",
          "Командность"
        ],
        "vulnerabilities": [
          "Сложности с обсуждением чувств"
        ],
        "recommendations": [
          "Добавляйте эмоциональные разговоры"
        ]
      },

      {
        "id": "caring_guardian",
        "name": "Сверхзаботливый хранитель",
        "description": "Вы много отдаёте в дружбе и заботитесь о людях.",
        "characteristics": [
          "Забота",
          "Щедрость"
        ],
        "vulnerabilities": [
          "Эмоциональная зависимость"
        ],
        "recommendations": [
          "Учитывайте свои потребности"
        ]
      },

      {
        "id": "intuitive_feel_reader",
        "name": "Интуитивный читатель настроений",
        "description": "Вы чувствуете эмоции людей почти сразу.",
        "characteristics": [
          "Чувствительность",
          "Эмпатия"
        ],
        "vulnerabilities": [
          "Гиперэмпатия"
        ],
        "recommendations": [
          "Спрашивайте, а не угадывайте"
        ]
      },

      {
        "id": "social_circle_builder",
        "name": "Созидательный организатор круга",
        "description": "Вы объединяете людей вокруг себя.",
        "characteristics": [
          "Лидерство",
          "Инициативность"
        ],
        "vulnerabilities": [
          "Перегрузка ответственностью"
        ],
        "recommendations": [
          "Делегируйте организационные роли"
        ]
      },

      {
        "id": "calm_observer",
        "name": "Спокойный наблюдатель",
        "description": "Вы тихо, но устойчиво присутсвтуете в жизни друзей.",
        "characteristics": [
          "Принятие",
          "Стабильность"
        ],
        "vulnerabilities": [
          "Низкая инициативность"
        ],
        "recommendations": [
          "Иногда делайте первый шаг"
        ]
      },

      {
        "id": "emotional_dramatic_friend",
        "name": "Драматичный эмоциональный друг",
        "description": "Ваши отношения яркие и насыщенные эмоциями.",
        "characteristics": [
          "Искренность",
          "Эмоциональность"
        ],
        "vulnerabilities": [
          "Резкие перепады настроения"
        ],
        "recommendations": [
          "Тренируйте эмоциональную регуляцию"
        ]
      }
    ]
  },

  "result_structure": {
    "description": "Структура итогового результата.",
    "sections": [
      { "id": "profile_overview", "title": "Ваш тип дружбы" },
      { "id": "why_this_profile", "title": "Почему выбран этот профиль" },
      { "id": "strengths", "title": "Ваши сильные стороны" },
      { "id": "vulnerabilities", "title": "Зоны роста" },
      { "id": "recommendations", "title": "Рекомендации" },
      { "id": "try_today", "title": "Что попробовать уже сегодня" },
      { "id": "inspiring_conclusion", "title": "Вдохновляющее завершение" }
    ]
  }
}
