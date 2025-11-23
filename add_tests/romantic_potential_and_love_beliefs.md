{
  "metadata": {
    "test_id": "romantic_potential_and_love_beliefs_v1",
    "title": "Романтические представления и потенциал",
    "description": "Тест оценивает три ключевых аспекта романтической сферы: ваш личный романтический потенциал (готовность к отношениям, способность создавать эмоциональную связь), отношение к любви (какие убеждения формируют вашу модель близости) и ваши индивидуальные романтические сценарии — представления о том, как должна выглядеть любовь. Эти аспекты помогают лучше понять, какие партнёрские отношения будут наиболее гармоничными, какие потребности вы несёте в любовь и какие стили поведения преобладают.",
    "version": "1.0",
    "author": "AI-ассистент (адаптация под мобильное приложение)",
    "theoretical_basis": [
      "Теория романтических убеждений и представлений (адаптировано)",
      "Модели романтических сценариев",
      "Психология привязанности (нативная переработка без прямого копирования)",
      "Эмоционально-коммуникационные модели в отношениях"
    ],
    "target_audience": "Взрослые от 18 лет, интересующиеся своими моделями любви и готовностью к отношениям.",
    "estimated_time_minutes": 10,
    "question_count": 36,
    "scales": [
      {
        "id": "romantic_potential",
        "name": "Романтический потенциал",
        "description": "Оценивает эмоциональную зрелость, способность к близости, открытость чувствам и готовность строить отношения.",
        "question_ids": [1,2,3,4,5,6,7,8,9,10,11,12],
        "scoring_method": "sum",
        "normalization": "linear",
        "min_score": 12,
        "max_score": 60
      },
      {
        "id": "love_attitudes",
        "name": "Отношение к любви (AALS)",
        "description": "Выявляет, какие убеждения определяют ваши ожидания от любви: рациональные, идеализированные, эмоциональные или динамичные.",
        "question_ids": [13,14,15,16,17,18,19,20,21,22,23,24],
        "scoring_method": "sum",
        "normalization": "linear",
        "min_score": 12,
        "max_score": 60
      },
      {
        "id": "love_stories",
        "name": "Романтические сценарии (LSS)",
        "description": "Показывает, какие внутренние истории о любви вы носите: партнёрство, страсть, забота, драматизм, развитие, независимость.",
        "question_ids": [25,26,27,28,29,30,31,32,33,34,35,36],
        "scoring_method": "sum",
        "normalization": "linear",
        "min_score": 12,
        "max_score": 60
      }
    ]
  },

  "questions": [
    /* ============================
       1) РОМАНТИЧЕСКИЙ ПОТЕНЦИАЛ (RPT)
       ============================ */

    {
      "id": 1,
      "text": "Мне легко выражать чувства человеку, который мне нравится.",
      "scale": "romantic_potential",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 2,
      "text": "Я умею устанавливать эмоциональную близость без страха быть отвергнутым.",
      "scale": "romantic_potential",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 3,
      "text": "Мне сложно доверять партнёру полностью.",
      "scale": "romantic_potential",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 4,
      "text": "Я открыт к новым отношениям и эмоциональному опыту.",
      "scale": "romantic_potential",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 5,
      "text": "Я умею спокойно обсуждать свои потребности в отношениях.",
      "scale": "romantic_potential",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 6,
      "text": "Я часто избегаю разговоров о чувствах.",
      "scale": "romantic_potential",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 7,
      "text": "Я способен поддерживать эмоциональную стабильность даже в сложные периоды.",
      "scale": "romantic_potential",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 8,
      "text": "Мне трудно начать отношения, даже если человек мне нравится.",
      "scale": "romantic_potential",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 9,
      "text": "Я умею проявлять заботу и внимательность по отношению к партнёру.",
      "scale": "romantic_potential",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 10,
      "text": "Я чувствую уверенность, когда строю отношения.",
      "scale": "romantic_potential",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 11,
      "text": "Иногда я закрываюсь, когда отношения становятся слишком близкими.",
      "scale": "romantic_potential",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 12,
      "text": "Мне нравится идея стабильных, долгосрочных отношений.",
      "scale": "romantic_potential",
      "reverse": false,
      "response_type": "likert_5"
    },


    /* ============================
       2) ATTITUDES TOWARD LOVE (AALS)
       ============================ */

    {
      "id": 13,
      "text": "Любовь — это прежде всего доверие и партнёрство.",
      "scale": "love_attitudes",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 14,
      "text": "Я верю, что истинная любовь всегда иррациональна.",
      "scale": "love_attitudes",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 15,
      "text": "Любовь должна быть страстной, иначе это не любовь.",
      "scale": "love_attitudes",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 16,
      "text": "Любовь — это ежедневный выбор и работа.",
      "scale": "love_attitudes",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 17,
      "text": "Я считаю, что любовь должна происходить естественно, без усилий.",
      "scale": "love_attitudes",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 18,
      "text": "Чем сильнее чувства, тем лучше отношения.",
      "scale": "love_attitudes",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 19,
      "text": "Настоящая любовь исключает идеализацию партнёра.",
      "scale": "love_attitudes",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 20,
      "text": "Любовь — это гармония между эмоциями и разумом.",
      "scale": "love_attitudes",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 21,
      "text": "Настоящая любовь всегда драматична.",
      "scale": "love_attitudes",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 22,
      "text": "Любовь — это пространство, где оба могут быть собой.",
      "scale": "love_attitudes",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 23,
      "text": "Любовь требует полной эмоциональной зависимости.",
      "scale": "love_attitudes",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 24,
      "text": "Любовь — это свобода и взаимное уважение.",
      "scale": "love_attitudes",
      "reverse": false,
      "response_type": "likert_5"
    },


    /* ============================
       3) LOVE STORIES SCALE (LSS)
       ============================ */

    {
      "id": 25,
      "text": "Мне близка идея любви как партнёрства, где двое идут одной дорогой.",
      "scale": "love_stories",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 26,
      "text": "Для меня любовь — это история страсти и эмоциональной интенсивности.",
      "scale": "love_stories",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 27,
      "text": "Я воспринимаю любовь как заботу и постоянную поддержку.",
      "scale": "love_stories",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 28,
      "text": "Любовь — это история личностного роста, где партнёры помогают друг другу развиваться.",
      "scale": "love_stories",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 29,
      "text": "Любовь — это борьба, преодоление и драматичные повороты.",
      "scale": "love_stories",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 30,
      "text": "Мне важно сохранять чувство свободы и автономии даже в любви.",
      "scale": "love_stories",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 31,
      "text": "Любовь — это когда партнёры полностью принадлежат друг другу.",
      "scale": "love_stories",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 32,
      "text": "Любовь должна приносить ощущение спокойствия и надёжности.",
      "scale": "love_stories",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 33,
      "text": "Любовь — это поиск ярких переживаний и эмоциональных всплесков.",
      "scale": "love_stories",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 34,
      "text": "В здоровой любви партнёры могут оставаться самостоятельными.",
      "scale": "love_stories",
      "reverse": false,
      "response_type": "likert_5"
    },
    {
      "id": 35,
      "text": "Для меня любовь связана с глубокой эмоциональной зависимостью.",
      "scale": "love_stories",
      "reverse": true,
      "response_type": "likert_5"
    },
    {
      "id": 36,
      "text": "Любовь — это поддержка, развитие и уважение к индивидуальности партнёра.",
      "scale": "love_stories",
      "reverse": false,
      "response_type": "likert_5"
    }
  ],

  "scoring_rules": {
    "reverse_scoring": { "likert_5": "6 - score" },

    "scale_calculations": {
      "romantic_potential": {
        "method": "sum",
        "reverse_items": [3,6,8,11],
        "normalization": { "type": "linear", "formula": "((raw - 12)/48)*100" }
      },
      "love_attitudes": {
        "method": "sum",
        "reverse_items": [17,18,21,23],
        "normalization": { "type": "linear", "formula": "((raw - 12)/48)*100" }
      },
      "love_stories": {
        "method": "sum",
        "reverse_items": [29,31,33,35],
        "normalization": { "type": "linear", "formula": "((raw - 12)/48)*100" }
      }
    },

    "composite_scores": {
      "romantic_profile_global": {
        "method": "mean",
        "scales": [
          "romantic_potential",
          "love_attitudes",
          "love_stories"
        ],
        "description": "Средний индекс, который отражает общие романтические модели, убеждения и готовность к здоровым отношениям."
      }
    }
  },

  "interpretation_guide": {
    "profiles": [
      {
        "id": "profile_secure_romantic",
        "name": "Зрелый романтический стиль",
        "criteria": {
          "romantic_profile_global": { "min": 75, "max": 100 }
        },
        "description": "У вас сформирован стабильный и зрелый взгляд на отношения. Вы способны к глубокой близости, открыты чувствам, умеете вести диалог и при этом сохраняете уважение к границам. Ваши романтические сценарии поддерживают здоровую динамику.",
        "characteristics": [
          "Высокая готовность к отношениям",
          "Гармоничный баланс эмоций и разума",
          "Здоровые ожидания и реалистичные убеждения",
          "Партнёрский сценарий любви"
        ],
        "recommendations": [
          "Продолжайте развивать эмоциональный интеллект.",
          "Поддерживайте честный диалог.",
          "Укрепляйте ритуалы близости."
        ]
      },
      {
        "id": "profile_mixed_romantic",
        "name": "Смешанный романтический стиль",
        "criteria": {
          "romantic_profile_global": { "min": 45, "max": 74 }
        },
        "description": "Ваши взгляды на любовь разнообразны: вы стремитесь к близости, но временами сомневаетесь; цените партнёрство, но иногда поддаётесь драматичным моделям или идеализации. Это естественно — вы на этапе формирования собственных здоровых подходов.",
        "characteristics": [
          "Комбинация зрелых и идеализированных ожиданий",
          "Иногда сложность в выражении чувств",
          "Потребность в эмоциональной предсказуемости",
          "Сценарии любви варьируются от партнёрства до романтизации"
        ],
        "recommendations": [
          "Отслеживайте автоматические сценарии.",
          "Учитесь выражать эмоции конструктивно.",
          "Фокусируйтесь на взаимности, а не на идеалах."
        ]
      },
      {
        "id": "profile_romantic_challenges",
        "name": "Романтические трудности",
        "criteria": {
          "romantic_profile_global": { "min": 0, "max": 44 }
        },
        "description": "У вас могут существовать сложности с близостью, доверием, реалистичными ожиданиями или эмоциональной регуляцией. Ваши романтические сценарии могут быть драматичными или завязанными на зависимость. Это не диагноз — это понимание того, где можно расти.",
        "characteristics": [
          "Стиль избегания или эмоциональной зависимости",
          "Идеализация или драматизация любви",
          "Сложности с уязвимостью",
          "Непоследовательные ожидания от партнёра"
        ],
        "recommendations": [
          "Исследуйте свои убеждения о любви.",
          "Учитесь безопасной коммуникации.",
          "Работайте над доверием и эмоциональной открытостью."
        ]
      }
    ]
  },

  "result_structure": {
    "description": "Стандартная структура итогового результата для пользователя.",
    "sections": [
      { "id": "profile_overview", "title": "Ваш романтический профиль" },
      { "id": "why_this_profile", "title": "Почему выбран этот стиль" },
      { "id": "strengths", "title": "Ваши сильные стороны" },
      { "id": "suitable_roles", "title": "Как вы строите любовь" },
      { "id": "development_recommendations", "title": "Как развить здоровую любовную модель" },
      { "id": "try_today", "title": "Что можно попробовать уже сегодня" },
      { "id": "inspiring_conclusion", "title": "Вдохновляющее напутствие" }
    ]
  }
}
