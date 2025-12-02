{
  "metadata": {
    "test_id": "relationship_compatibility_v1",
    "title": "Тест «Совместимость и идеальные отношения»",
    "description": "Этот тест помогает определить ваш индивидуальный стиль партнёрских отношений и выявляет ключевые аспекты совместимости с потенциальным или текущим партнёром. Он оценивает, насколько ваши эмоциональные потребности, стиль общения, ожидания, ценности и ролевые предпочтения совпадают с типичными моделями поведения в отношениях.\n\nТест не даёт универсального рецепта любви, но помогает лучше понимать себя — свои сильные стороны, уязвимости и особенности, которые влияют на качество и гармонию отношений.",
    "version": "1.0",
    "author": "AI-ассистент",
    "theoretical_basis": [
      "Теория привязанности (Боулби, Айнсворт) — адаптировано для непсиходиагностического использования",
      "Модель межличностных стилей общения (синтез современных подходов)",
      "Поведенческие маркеры совместимости в парах"
    ],
    "target_audience": "Взрослые от 18 лет, находящиеся в отношениях или ищущие их",
    "estimated_time_minutes": 7,
    "question_count": 24,
    "scales": [
      {
        "id": "emotional_connection",
        "name": "Эмоциональная близость",
        "description": "Насколько человеку важны доверие, открытость, поддержка и эмоциональная стабильность в отношениях.",
        "question_ids": [1, 4, 7, 10],
        "scoring_method": "sum",
        "normalization": "linear",
        "min_score": 4,
        "max_score": 20
      },
      {
        "id": "communication_style",
        "name": "Стиль общения и выражение потребностей",
        "description": "Как человек формулирует просьбы, реагирует на конфликты и удерживает диалог.",
        "question_ids": [2, 5, 8, 11],
        "scoring_method": "sum",
        "normalization": "linear",
        "min_score": 4,
        "max_score": 20
      },
      {
        "id": "values_alignment",
        "name": "Совпадение жизненных ценностей",
        "description": "Оценка важности ключевых ценностей: честность, ответственность, свобода, стабильность, развитие.",
        "question_ids": [3, 6, 9, 12],
        "scoring_method": "sum",
        "normalization": "linear",
        "min_score": 4,
        "max_score": 20
      },
      {
        "id": "relationship_expectations",
        "name": "Ожидания от отношений",
        "description": "Что человек ожидает от партнёра: автономность, поддержка, динамика, романтика, предсказуемость.",
        "question_ids": [13, 14, 15, 16],
        "scoring_method": "sum",
        "normalization": "linear",
        "min_score": 4,
        "max_score": 20
      },
      {
        "id": "conflict_management",
        "name": "Стиль решения конфликтов",
        "description": "Способ реагирования на напряжение: избегание, диалог, напор, компромисс.",
        "question_ids": [17, 18, 19, 20],
        "scoring_method": "sum",
        "normalization": "linear",
        "min_score": 4,
        "max_score": 20
      },
      {
        "id": "intimacy_and_romance",
        "name": "Близость и романтика",
        "description": "Потребность в тактильности, романтических жестах и чувственном взаимодействии.",
        "question_ids": [21, 22, 23, 24],
        "scoring_method": "sum",
        "normalization": "linear",
        "min_score": 4,
        "max_score": 20
      }
    ]
  },

  "questions": [
    {
      "id": 1,
      "text": "Мне важно чувствовать эмоциональную поддержку от партнёра.",
      "scale": "emotional_connection",
      "reverse": false,
      "response_type": "likert_5",
      "response_config": { "scoring": [1,2,3,4,5] }
    },
    {
      "id": 2,
      "text": "Мне легко говорить о своих потребностях партнёру.",
      "scale": "communication_style",
      "reverse": false,
      "response_type": "likert_5",
      "response_config": { "scoring": [1,2,3,4,5] }
    },
    {
      "id": 3,
      "text": "Наши ценности — ключевой элемент совместимости.",
      "scale": "values_alignment",
      "reverse": false,
      "response_type": "likert_5",
      "response_config": { "scoring": [1,2,3,4,5] }
    },
    {
      "id": 4,
      "text": "Я быстро привязываюсь к человеку, если чувствую тепло и заботу.",
      "scale": "emotional_connection",
      "reverse": false,
      "response_type": "likert_5",
      "response_config": { "scoring": [1,2,3,4,5] }
    },
    {
      "id": 5,
      "text": "В конфликте я стараюсь объяснить, что чувствую и почему.",
      "scale": "communication_style",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 6,
      "text": "Для гармонии важно совпадать во взглядах на семью, работу и будущее.",
      "scale": "values_alignment",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 7,
      "text": "Я чувствую себя ближе к человеку, когда он делится со мной переживаниями.",
      "scale": "emotional_connection",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 8,
      "text": "Мне сложно открыто говорить, что меня тревожит.",
      "scale": "communication_style",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 9,
      "text": "Мне важно, чтобы партнёр разделял мои жизненные приоритеты.",
      "scale": "values_alignment",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 10,
      "text": "Я стремлюсь поддерживать партнёра эмоционально даже в мелочах.",
      "scale": "emotional_connection",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 11,
      "text": "Я умею слушать и не перебивать, даже если эмоции сильные.",
      "scale": "communication_style",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 12,
      "text": "Ценности оказывают влияние на то, насколько я сближаюсь с человеком.",
      "scale": "values_alignment",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 13,
      "text": "Я ожидаю, что партнёр будет инициативным в развитии отношений.",
      "scale": "relationship_expectations",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 14,
      "text": "Я предпочитаю отношения, где каждый сохраняет личное пространство.",
      "scale": "relationship_expectations",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 15,
      "text": "Мне важно, чтобы отношения развивались равномерно и предсказуемо.",
      "scale": "relationship_expectations",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 16,
      "text": "Я ожидаю много романтики и эмоциональных жестов в отношениях.",
      "scale": "relationship_expectations",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 17,
      "text": "В конфликте я стараюсь искать компромисс и спокойное обсуждение.",
      "scale": "conflict_management",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 18,
      "text": "Когда конфликт становится сильным, я предпочитаю отдалиться.",
      "scale": "conflict_management",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 19,
      "text": "Во время разногласий мне важно быть услышанным.",
      "scale": "conflict_management",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 20,
      "text": "Я могу резко реагировать, если чувствую несправедливость.",
      "scale": "conflict_management",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 21,
      "text": "Мне важна тактильность в отношениях (объятия, прикосновения, жесты).",
      "scale": "intimacy_and_romance",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 22,
      "text": "Романтические жесты помогают мне чувствовать связь с партнёром.",
      "scale": "intimacy_and_romance",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 23,
      "text": "Я воспринимаю романтику как важную часть отношений.",
      "scale": "intimacy_and_romance",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 24,
      "text": "Я чувствую себя ближе к партнёру через совместные тёплые жесты.",
      "scale": "intimacy_and_romance",
      "reverse": false,
      "response_type": "likert_5"
    }
  ],

  "scoring_rules": {
    "reverse_scoring": {
      "likert_5": "6 - score"
    },
    "scale_calculations": {
      "emotional_connection": {
        "method": "sum",
        "reverse_items": [],
        "normalization": { "type": "linear", "formula": "((raw - 4) / 16) * 100" }
      },
      "communication_style": {
        "method": "sum",
        "reverse_items": [8],
        "normalization": { "type": "linear", "formula": "((raw - 4) / 16) * 100" }
      },
      "values_alignment": {
        "method": "sum",
        "reverse_items": [],
        "normalization": { "type": "linear", "formula": "((raw - 4) / 16) * 100" }
      },
      "relationship_expectations": {
        "method": "sum",
        "reverse_items": [],
        "normalization": { "type": "linear", "formula": "((raw - 4) / 16) * 100" }
      },
      "conflict_management": {
        "method": "sum",
        "reverse_items": [18, 20],
        "normalization": { "type": "linear", "formula": "((raw - 4) / 16) * 100" }
      },
      "intimacy_and_romance": {
        "method": "sum",
        "reverse_items": [],
        "normalization": { "type": "linear", "formula": "((raw - 4) / 16) * 100" }
      }
    },
    "composite_scores": {
      "overall_compatibility": {
        "method": "mean",
        "scales": [
          "emotional_connection",
          "communication_style",
          "values_alignment",
          "relationship_expectations",
          "conflict_management",
          "intimacy_and_romance"
        ],
        "description": "Средний показатель по шкалам, отражающий общую модель отношения к партнёрству."
      }
    }
  },

  "interpretation_guide": {
    "profiles": [
      {
        "id": "profile_perfect_match",
        "name": "Высокая совместимость",
        "criteria": {
          "overall_compatibility": { "min": 75, "max": 100 }
        },
        "description": "Ваши потребности, стиль общения, ценности и ожидания в отношениях формируют основу для гармоничной, зрелой и насыщенной связи. Вы умеете создавать эмоциональную близость, поддерживать диалог и вкладываться в отношения. Такой тип совместимости позволяет строить устойчивые отношения, где оба партнёра чувствуют себя в безопасности.",
        "characteristics": [
          "Гармоничный баланс чувств и логики",
          "Высокая эмоциональная осознанность",
          "Умение поддерживать и принимать поддержку",
          "Зрелый стиль решения конфликтов"
        ],
        "recommendations": [
          "Продолжайте развивать открытый диалог.",
          "Укрепляйте совместные ритуалы и привычки.",
          "Не забывайте про личные границы и взаимное уважение."
        ],
        "suitable_roles": ["Отношения с высоким уровнем доверия и взаимного вклада"]
      },
      {
        "id": "profile_good_potential",
        "name": "Средний уровень совместимости",
        "criteria": {
          "overall_compatibility": { "min": 45, "max": 74 }
        },
        "description": "У вас есть сильные стороны в построении отношений, но некоторые области могут требовать дополнительного внимания. Иногда ваши потребности могут расходиться, но при желании обеих сторон отношения способны стать глубокими и гармоничными.",
        "characteristics": [
          "Готовность работать над отношениями",
          "Умение договариваться",
          "Желание понимать партнёра"
        ],
        "recommendations": [
          "Чаще проговаривайте ожидания.",
          "Учитесь регулировать эмоции в конфликте.",
          "Проводите больше качественного времени вместе."
        ],
        "suitable_roles": ["Партнёрства с открытой коммуникацией и взаимным желанием развиваться"]
      },
      {
        "id": "profile_needs_alignment",
        "name": "Низкий уровень совместимости",
        "criteria": {
          "overall_compatibility": { "min": 0, "max": 44 }
        },
        "description": "Ваши стили общения, ожидания или потребности в эмоциональной близости могут заметно отличаться. Это не значит, что отношения невозможны — но для стабильности потребуется много осознанности, терпения и готовности к изменениям.",
        "characteristics": [
          "Различия в скорости эмоционального сближения",
          "Сложности в диалоге или выражении чувств",
          "Разное видение будущего"
        ],
        "recommendations": [
          "Уточняйте ожидания друг друга регулярно, а не только в кризис.",
          "Работайте над навыками ненасильственного общения.",
          "Учитесь уважать индивидуальные различия."
        ],
        "suitable_roles": ["Отношения, где партнёры готовы к серьёзной работе над взаимодействием"]
      }
    ]
  },

  "result_structure": {
    "description": "Структура итогового результата, которую должен формировать тест после подсчёта баллов.",
    "sections": [
      { "id": "profile_overview", "title": "Ваш тип совместимости" },
      { "id": "why_this_profile", "title": "Почему именно он" },
      { "id": "strengths", "title": "Ваши сильные стороны" },
      { "id": "suitable_roles", "title": "Какой формат отношений подходит вам больше всего" },
      { "id": "development_recommendations", "title": "Как укрепить отношения" },
      { "id": "try_today", "title": "Небольшой шаг, который можно сделать уже сегодня" },
      { "id": "inspiring_conclusion", "title": "Вдохновляющее напутствие" }
    ]
  }
}
