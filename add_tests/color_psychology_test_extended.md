# ТЕСТ "ЦВЕТОВАЯ ПСИХОЛОГИЯ: РАСШИРЕННАЯ ДИАГНОСТИКА ЭМОЦИОНАЛЬНОГО СОСТОЯНИЯ"

## ПОЛНАЯ СПЕЦИФИКАЦИЯ РАСШИРЕННОГО ТЕСТА ДЛЯ МОБИЛЬНОГО ПРИЛОЖЕНИЯ

---

## ОПИСАНИЕ ПРОЕКТА

Это полная спецификация расширенного оригинального теста цветовой психологии для глубокой диагностики текущего эмоционального состояния, стресса, потребностей, психологических установок и личностных особенностей через выбор, ранжирование и ассоциации цветов. Тест использует научно доказанную связь между цветовыми предпочтениями и психологическим состоянием человека. Тест предназначен для мобильного приложения на Android (Kotlin + Jetpack Compose).

**ВАЖНО: Это оригинальный расширенный тест, разработанный на основе общих принципов цветовой психологии, но отличающийся от классического теста Люшера методологией, набором цветов, интерпретацией и системой подсчета. Авторские права не нарушаются.**

**Что включено:**
- Полная методология и научная база
- **6 этапов тестирования** (быстрый выбор, ранжирование, парные сравнения, эмоциональные ассоциации, жизненные сферы, временная перспектива)
- **25+ вопросов/заданий** для глубокой диагностики
- 10 цветов + оттенки для расширенного анализа
- **12 психологических шкал** (расширено с 8)
- Анализ текущего состояния, потребностей и перспектив
- Детальная интерпретация результатов
- Рекомендации по управлению состоянием
- Отслеживание динамики состояния

---

## МЕТАДАННЫЕ ТЕСТА

```json
{
  "test_id": "color_psychology_extended_v1",
  "title": "Цветовая психология: Расширенная диагностика эмоционального состояния",
  "description": "Цветовая психология — это научная область, изучающая влияние цветов на эмоциональное состояние, психофизиологические реакции и поведение человека. Исследования показывают, что наш выбор цветов не случаен — он отражает текущее психологическое состояние, неосознанные потребности и внутренние конфликты.\n\nЭтот расширенный тест использует комплексную проективную методику с 6 этапами для глубокого анализа вашего состояния:\n\n**Что измеряет тест:**\n• Текущее эмоциональное состояние и настроение\n• Уровень стресса, тревоги и энергии\n• Энергетические ресурсы и витальность\n• Неосознанные потребности и желания\n• Психологические защиты и копинг-стратегии\n• Области напряжения и конфликтов\n• Удовлетворённость различными сферами жизни\n• Отношение к прошлому, настоящему и будущему\n• Скрытые страхи и блокировки\n• Потенциал для изменений\n\n**Как это работает:**\nКаждый цвет связан с определёнными психологическими качествами, эмоциями и физиологическими реакциями:\n- **Красный**: энергия, активность, агрессия, страсть, сила воли\n- **Синий**: спокойствие, контроль, рациональность, дистанция, глубина\n- **Жёлтый**: оптимизм, общение, лёгкость, тревожность, изменчивость\n- **Зелёный**: баланс, стабильность, рост, упрямство, самоутверждение\n- **Фиолетовый**: трансформация, духовность, креативность, внутренний поиск\n- **Коричневый**: безопасность, комфорт, усталость, потребность в отдыхе\n- **Чёрный**: отрицание, протест, защита, тайна, капитуляция\n- **Серый**: нейтральность, дистанция, защита, эмоциональное истощение\n- **Оранжевый**: общительность, энтузиазм, тепло, социальная активность\n- **Розовый**: нежность, потребность в заботе, уязвимость, мягкость\n\n**Тест состоит из 6 этапов:**\n1. **Быстрый выбор** (интуитивные предпочтения) - 30 сек\n2. **Полное ранжирование** (детальная оценка) - 60 сек\n3. **Парные сравнения** (принудительный выбор) - 10 пар\n4. **Эмоциональные ассоциации** (связь цветов с эмоциями) - 8 вопросов\n5. **Жизненные сферы** (оценка разных областей жизни) - 10 вопросов\n6. **Временная перспектива** (прошлое, настоящее, будущее) - 6 вопросов\n\n**Всего: 34+ взаимодействия для максимально точной диагностики**\n\nВыбирая цвета разными способами, вы неосознанно выражаете своё состояние на разных уровнях. Интеграция всех этапов даёт комплексную картину вашего психологического состояния.\n\nВажно: Тест измеряет ТЕКУЩЕЕ состояние (здесь и сейчас), а не постоянные черты личности. Рекомендуется проходить повторно для отслеживания динамики.\n\nВ 2025 году цветовая психология активно используется в:\n• Клинической практике (диагностика состояния)\n• HR и рекрутинге (оценка стресса сотрудников)\n• Спортивной психологии (мониторинг состояния атлетов)\n• Коучинге и личном развитии (self-awareness)\n• Арт-терапии и психотерапии",
  "version": "2.0 Extended",
  "author": "Color Psychology Research Institute",
  "theoretical_basis": [
    "Color Psychology Research (Max Lüscher, Angela Wright, Faber Birren)",
    "Projective Testing Methodology",
    "Psychophysiology of Color Perception",
    "Emotional Semiotics",
    "Gestalt Psychology",
    "Temporal Perspective Psychology",
    "Forced-Choice Methodology"
  ],
  "target_audience": "Взрослые 16+ лет, заинтересованные в глубоком понимании своего эмоционального состояния",
  "estimated_time_minutes": 12,
  "question_count": 34,
  "test_stages": 6,
  "scales": [
    {
      "id": "energy_level",
      "name": "Энергетический уровень",
      "description": "Активация, витальность, готовность к действию",
      "range": [0, 100],
      "interpretation": "low|moderate|high"
    },
    {
      "id": "stress_level",
      "name": "Уровень стресса",
      "description": "Напряжение, тревога, психологическое давление",
      "range": [0, 100],
      "interpretation": "low|moderate|high|critical"
    },
    {
      "id": "emotional_balance",
      "name": "Эмоциональный баланс",
      "description": "Гармония, стабильность эмоционального состояния",
      "range": [0, 100],
      "interpretation": "low|moderate|high"
    },
    {
      "id": "openness",
      "name": "Открытость",
      "description": "Готовность к контакту, общению, новому опыту",
      "range": [0, 100],
      "interpretation": "low|moderate|high"
    },
    {
      "id": "control_need",
      "name": "Потребность в контроле",
      "description": "Стремление к порядку, рациональности, структуре",
      "range": [0, 100],
      "interpretation": "low|moderate|high"
    },
    {
      "id": "satisfaction",
      "name": "Удовлетворённость",
      "description": "Чувство удовлетворения жизнью, самореализация",
      "range": [0, 100],
      "interpretation": "low|moderate|high"
    },
    {
      "id": "defensiveness",
      "name": "Защитные механизмы",
      "description": "Активация психологических защит",
      "range": [0, 100],
      "interpretation": "low|moderate|high"
    },
    {
      "id": "need_for_change",
      "name": "Потребность в изменениях",
      "description": "Желание перемен, неудовлетворённость текущим",
      "range": [0, 100],
      "interpretation": "low|moderate|high"
    },
    {
      "id": "optimism",
      "name": "Оптимизм/Пессимизм",
      "description": "Позитивный vs негативный взгляд на жизнь",
      "range": [0, 100],
      "interpretation": "pessimistic|neutral|optimistic"
    },
    {
      "id": "social_connection",
      "name": "Социальная связанность",
      "description": "Качество социальных связей и отношений",
      "range": [0, 100],
      "interpretation": "isolated|moderate|connected"
    },
    {
      "id": "self_esteem",
      "name": "Самооценка",
      "description": "Отношение к себе, самоценность",
      "range": [0, 100],
      "interpretation": "low|moderate|high"
    },
    {
      "id": "future_orientation",
      "name": "Ориентация на будущее",
      "description": "Позитивность взгляда в будущее, надежда",
      "range": [0, 100],
      "interpretation": "pessimistic|neutral|optimistic"
    }
  ],
  "colors": [
    {
      "id": "red",
      "name": "Красный",
      "hex": "#D32F2F",
      "psychological_meaning": "Энергия, активность, агрессия, страсть, сила воли",
      "positive_associations": "витальность, уверенность, лидерство, страсть",
      "negative_associations": "агрессия, импульсивность, стресс, гнев"
    },
    {
      "id": "blue",
      "name": "Синий",
      "hex": "#1976D2",
      "psychological_meaning": "Спокойствие, контроль, рациональность, дистанция, стабильность",
      "positive_associations": "мир, контроль, глубина, надёжность",
      "negative_associations": "холодность, отстранённость, депрессия, ригидность"
    },
    {
      "id": "green",
      "name": "Зелёный",
      "hex": "#388E3C",
      "psychological_meaning": "Баланс, рост, стабильность, упрямство, самоутверждение",
      "positive_associations": "гармония, природа, рост, безопасность",
      "negative_associations": "упрямство, застой, жёсткость, сопротивление"
    },
    {
      "id": "yellow",
      "name": "Жёлтый",
      "hex": "#FBC02D",
      "psychological_meaning": "Оптимизм, лёгкость, общительность, тревожность, нестабильность",
      "positive_associations": "радость, оптимизм, креативность, лёгкость",
      "negative_associations": "поверхностность, тревога, нестабильность, избегание"
    },
    {
      "id": "violet",
      "name": "Фиолетовый",
      "hex": "#7B1FA2",
      "psychological_meaning": "Трансформация, духовность, уникальность, внутренний конфликт",
      "positive_associations": "интуиция, креативность, глубина, мистика",
      "negative_associations": "нереалистичность, эскапизм, нестабильность, конфликт"
    },
    {
      "id": "brown",
      "name": "Коричневый",
      "hex": "#5D4037",
      "psychological_meaning": "Безопасность, комфорт, материальность, истощение, потребность в отдыхе",
      "positive_associations": "надёжность, стабильность, заземлённость, комфорт",
      "negative_associations": "усталость, истощение, депрессия, регрессия"
    },
    {
      "id": "black",
      "name": "Чёрный",
      "hex": "#212121",
      "psychological_meaning": "Отрицание, протест, защита, тайна, сила или капитуляция",
      "positive_associations": "элегантность, тайна, глубина, защита",
      "negative_associations": "отрицание, протест, депрессия, капитуляция"
    },
    {
      "id": "gray",
      "name": "Серый",
      "hex": "#757575",
      "psychological_meaning": "Нейтральность, дистанция, защита от стимулов, эмоциональное истощение",
      "positive_associations": "нейтральность, баланс, дипломатичность",
      "negative_associations": "апатия, отстранённость, эмоциональная пустота, истощение"
    },
    {
      "id": "orange",
      "name": "Оранжевый",
      "hex": "#F57C00",
      "psychological_meaning": "Общительность, энтузиазм, тепло, поверхностная активность",
      "positive_associations": "дружелюбие, тепло, энтузиазм, общительность",
      "negative_associations": "поверхностность, навязчивость, гиперактивность"
    },
    {
      "id": "pink",
      "name": "Розовый",
      "hex": "#E91E63",
      "psychological_meaning": "Нежность, потребность в заботе, инфантильность, уязвимость",
      "positive_associations": "нежность, забота, мягкость, романтика",
      "negative_associations": "инфантильность, зависимость, слабость, уязвимость"
    },
    {
      "id": "white",
      "name": "Белый",
      "hex": "#FFFFFF",
      "psychological_meaning": "Чистота, пустота, новое начало, стерильность",
      "positive_associations": "чистота, свежесть, новое начало, ясность",
      "negative_associations": "пустота, холодность, стерильность, отстранённость",
      "note": "Используется в некоторых вопросах"
    }
  ]
}
```

---

## ЭТАПЫ ТЕСТА (6 ЭТАПОВ, 34+ ВЗАИМОДЕЙСТВИЯ)

### ЭТАП 1: БЫСТРЫЙ ВЫБОР (ИНТУИТИВНЫЕ ПРЕДПОЧТЕНИЯ)

```json
{
  "stage": 1,
  "id": "quick_choice",
  "name": "Быстрый выбор",
  "instruction": "Посмотрите на все 10 цветов. НЕ ДУМАЙТЕ ДОЛГО.\n\n1. Выберите 3 цвета, которые вам БОЛЬШЕ ВСЕГО нравятся СЕЙЧАС\n2. Затем выберите 3 цвета, которые вам МЕНЬШЕ ВСЕГО нравятся СЕЙЧАС\n\nВыбирайте интуитивно, по первому ощущению.",
  "time_limit_seconds": 30,
  "response_type": "color_selection",
  "task_count": 1,
  "response_config": {
    "colors_displayed": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"],
    "colors_to_select_liked": 3,
    "colors_to_select_disliked": 3,
    "display_type": "simultaneous_grid",
    "color_size": "large_squares",
    "instruction_liked": "Выберите 3 цвета, которые нравятся",
    "instruction_disliked": "Выберите 3 цвета, которые не нравятся"
  },
  "scoring": {
    "liked_colors_weight": 3,
    "disliked_colors_weight": -3
  }
}
```

### ЭТАП 2: ПОЛНОЕ РАНЖИРОВАНИЕ

```json
{
  "stage": 2,
  "id": "full_ranking",
  "name": "Ранжирование цветов",
  "instruction": "Теперь расставьте ВСЕ 10 цветов в порядке от наиболее приятного (1 место) к наименее приятному (10 место).\n\nВыбирайте по ощущениям СЕЙЧАС, в этот момент:\n• Какой цвет вас привлекает больше всего? → 1 место\n• Какой меньше всего? → 10 место",
  "time_limit_seconds": 60,
  "response_type": "ranking",
  "task_count": 1,
  "response_config": {
    "colors_to_rank": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"],
    "positions": 10,
    "display_type": "drag_and_drop",
    "instruction": "Перетащите цвета в нужном порядке",
    "allow_reorder": true
  },
  "scoring": {
    "position_1_weight": 10,
    "position_2_weight": 9,
    "position_3_weight": 8,
    "position_4_weight": 7,
    "position_5_weight": 6,
    "position_6_weight": 5,
    "position_7_weight": 4,
    "position_8_weight": 3,
    "position_9_weight": 2,
    "position_10_weight": 1
  }
}
```

### ЭТАП 3: ПАРНЫЕ СРАВНЕНИЯ (ПРИНУДИТЕЛЬНЫЙ ВЫБОР)

```json
{
  "stage": 3,
  "id": "paired_comparisons",
  "name": "Парные сравнения",
  "instruction": "Вам будут показаны 10 пар цветов. В каждой паре выберите цвет, который вам БОЛЬШЕ подходит СЕЙЧАС.\n\nВыбирайте быстро, по первому ощущению. Здесь нет правильных ответов.",
  "time_limit_seconds": null,
  "response_type": "forced_choice_pairs",
  "task_count": 10,
  "pairs": [
    {
      "id": 1,
      "pair": ["red", "blue"],
      "dimension": "Активность vs Контроль",
      "scoring": {
        "red": {"energy_level": 5, "control_need": -3},
        "blue": {"control_need": 5, "energy_level": -2}
      }
    },
    {
      "id": 2,
      "pair": ["yellow", "green"],
      "dimension": "Изменчивость vs Стабильность",
      "scoring": {
        "yellow": {"need_for_change": 4, "openness": 3},
        "green": {"emotional_balance": 5, "satisfaction": 3}
      }
    },
    {
      "id": 3,
      "pair": ["violet", "brown"],
      "dimension": "Трансформация vs Комфорт",
      "scoring": {
        "violet": {"need_for_change": 5, "defensiveness": -2},
        "brown": {"satisfaction": 3, "energy_level": -3}
      }
    },
    {
      "id": 4,
      "pair": ["orange", "gray"],
      "dimension": "Социальность vs Отстранённость",
      "scoring": {
        "orange": {"openness": 5, "social_connection": 4},
        "gray": {"defensiveness": 5, "social_connection": -4}
      }
    },
    {
      "id": 5,
      "pair": ["pink", "black"],
      "dimension": "Уязвимость vs Защита",
      "scoring": {
        "pink": {"openness": 4, "defensiveness": -3},
        "black": {"defensiveness": 5, "openness": -3}
      }
    },
    {
      "id": 6,
      "pair": ["red", "green"],
      "dimension": "Импульсивность vs Упорство",
      "scoring": {
        "red": {"energy_level": 4, "stress_level": 2},
        "green": {"emotional_balance": 4, "control_need": 3}
      }
    },
    {
      "id": 7,
      "pair": ["yellow", "violet"],
      "dimension": "Поверхностная лёгкость vs Глубина",
      "scoring": {
        "yellow": {"optimism": 4, "stress_level": -2},
        "violet": {"need_for_change": 4, "stress_level": 2}
      }
    },
    {
      "id": 8,
      "pair": ["blue", "brown"],
      "dimension": "Рациональность vs Усталость",
      "scoring": {
        "blue": {"control_need": 4, "emotional_balance": 2},
        "brown": {"energy_level": -4, "satisfaction": -2}
      }
    },
    {
      "id": 9,
      "pair": ["orange", "pink"],
      "dimension": "Активная социальность vs Потребность в заботе",
      "scoring": {
        "orange": {"social_connection": 4, "energy_level": 3},
        "pink": {"openness": 3, "self_esteem": -2}
      }
    },
    {
      "id": 10,
      "pair": ["black", "gray"],
      "dimension": "Протест vs Апатия",
      "scoring": {
        "black": {"defensiveness": 4, "energy_level": -2},
        "gray": {"defensiveness": 5, "emotional_balance": -3}
      }
    }
  ]
}
```

### ЭТАП 4: ЭМОЦИОНАЛЬНЫЕ АССОЦИАЦИИ

```json
{
  "stage": 4,
  "id": "emotional_associations",
  "name": "Эмоциональные ассоциации",
  "instruction": "Выберите цвет, который ЛУЧШЕ ВСЕГО ассоциируется с каждой эмоцией или состоянием для ВАС ЛИЧНО СЕЙЧАС.",
  "time_limit_seconds": null,
  "response_type": "color_choice",
  "task_count": 8,
  "questions": [
    {
      "id": 1,
      "text": "Какой цвет ассоциируется с РАДОСТЬЮ для вас?",
      "emotion": "joy",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "yellow": "Классическая ассоциация, оптимизм",
        "orange": "Социальная радость, тепло",
        "red": "Интенсивная, страстная радость",
        "pink": "Нежная, романтическая радость",
        "green": "Спокойная, гармоничная радость",
        "violet": "Духовная, креативная радость",
        "blue": "Необычная ассоциация, возможна эмоциональная дистанция",
        "brown": "Радость комфорта и безопасности",
        "black": "Отсутствие радости, депрессивная ассоциация",
        "gray": "Притуплённая радость, эмоциональное уплощение"
      }
    },
    {
      "id": 2,
      "text": "Какой цвет ассоциируется с ТРЕВОГОЙ для вас?",
      "emotion": "anxiety",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "red": "Тревога как возбуждение, паника",
        "yellow": "Классическая ассоциация с тревогой",
        "black": "Тревога как страх, угроза",
        "gray": "Тревога как неопределённость",
        "violet": "Экзистенциальная тревога",
        "blue": "Тревога под контролем",
        "brown": "Тревога истощения"
      }
    },
    {
      "id": 3,
      "text": "Какой цвет ассоциируется со СПОКОЙСТВИЕМ для вас?",
      "emotion": "calm",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "blue": "Классическое спокойствие, контроль",
        "green": "Гармоничное спокойствие, баланс",
        "gray": "Спокойствие отстранённости",
        "brown": "Спокойствие комфорта",
        "white": "Чистое спокойствие"
      }
    },
    {
      "id": 4,
      "text": "Какой цвет ассоциируется с ГНЕВОМ для вас?",
      "emotion": "anger",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "red": "Классический гнев, ярость",
        "black": "Тёмный, подавленный гнев",
        "violet": "Гнев трансформации",
        "gray": "Холодный гнев",
        "yellow": "Раздражение, нервозность"
      }
    },
    {
      "id": 5,
      "text": "Какой цвет ассоциируется с ГРУСТЬЮ для вас?",
      "emotion": "sadness",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "blue": "Классическая грусть, меланхолия",
        "gray": "Апатичная грусть",
        "black": "Глубокая грусть, депрессия",
        "violet": "Романтичная, духовная грусть",
        "brown": "Грусть усталости"
      }
    },
    {
      "id": 6,
      "text": "Какой цвет ассоциируется с ЭНЕРГИЕЙ для вас?",
      "emotion": "energy",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "red": "Интенсивная, страстная энергия",
        "yellow": "Лёгкая, оптимистичная энергия",
        "orange": "Социальная, тёплая энергия",
        "green": "Стабильная, растущая энергия",
        "violet": "Креативная энергия"
      }
    },
    {
      "id": 7,
      "text": "Какой цвет ассоциируется с УСТАЛОСТЬЮ для вас?",
      "emotion": "fatigue",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "brown": "Классическая усталость, истощение",
        "gray": "Эмоциональная усталость",
        "black": "Глубокое истощение",
        "blue": "Усталость от контроля"
      }
    },
    {
      "id": 8,
      "text": "Какой цвет ассоциируется с НАДЕЖДОЙ для вас?",
      "emotion": "hope",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "yellow": "Оптимистичная надежда",
        "green": "Надежда роста и обновления",
        "blue": "Надежда стабильности",
        "violet": "Духовная надежда",
        "orange": "Тёплая, социальная надежда",
        "pink": "Нежная надежда",
        "white": "Чистая, светлая надежда"
      }
    }
  ]
}
```

### ЭТАП 5: ЖИЗНЕННЫЕ СФЕРЫ

```json
{
  "stage": 5,
  "id": "life_domains",
  "name": "Жизненные сферы",
  "instruction": "Выберите цвет, который ЛУЧШЕ ВСЕГО описывает каждую область вашей жизни СЕЙЧАС.",
  "time_limit_seconds": null,
  "response_type": "color_choice",
  "task_count": 10,
  "questions": [
    {
      "id": 1,
      "text": "Какой цвет описывает ваше ТЕКУЩЕЕ настроение?",
      "domain": "current_mood",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      }
    },
    {
      "id": 2,
      "text": "Какой цвет описывает вашу РАБОТУ/УЧЁБУ сейчас?",
      "domain": "work",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "red": "Интенсивная, стрессовая или страстная работа",
        "blue": "Контролируемая, рациональная работа",
        "green": "Стабильная, растущая работа",
        "yellow": "Креативная, но возможно хаотичная",
        "brown": "Истощающая работа",
        "black": "Негативное отношение к работе",
        "gray": "Скучная, рутинная работа",
        "orange": "Социальная, командная работа"
      }
    },
    {
      "id": 3,
      "text": "Какой цвет описывает ваши РОМАНТИЧЕСКИЕ ОТНОШЕНИЯ (или их отсутствие)?",
      "domain": "romantic_relationships",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "red": "Страстные, интенсивные отношения",
        "pink": "Нежные, романтичные отношения",
        "green": "Стабильные, растущие отношения",
        "blue": "Рациональные, дистанцированные отношения",
        "yellow": "Лёгкие, поверхностные отношения",
        "brown": "Отношения истощают",
        "black": "Негативные отношения или их отсутствие",
        "gray": "Безразличие, эмоциональная пустота"
      }
    },
    {
      "id": 4,
      "text": "Какой цвет описывает ваши ДРУЖЕСКИЕ отношения и социальные связи?",
      "domain": "friendships",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "orange": "Тёплые, активные дружеские связи",
        "yellow": "Лёгкие, весёлые дружеские связи",
        "green": "Стабильные, поддерживающие дружеские связи",
        "blue": "Рациональные, дистанцированные связи",
        "gray": "Изоляция, отстранённость",
        "black": "Негативный опыт или отсутствие связей"
      }
    },
    {
      "id": 5,
      "text": "Какой цвет описывает ваше ФИЗИЧЕСКОЕ здоровье и самочувствие?",
      "domain": "physical_health",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "green": "Хорошее здоровье, баланс",
        "red": "Высокая энергия или напряжение",
        "yellow": "Нормальное, но нестабильное",
        "brown": "Усталость, истощение",
        "gray": "Низкая энергия, апатия",
        "black": "Плохое самочувствие"
      }
    },
    {
      "id": 6,
      "text": "Какой цвет описывает ваше ФИНАНСОВОЕ положение и отношение к деньгам?",
      "domain": "finances",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "green": "Стабильные финансы, рост",
        "blue": "Контролируемые финансы",
        "brown": "Потребность в безопасности",
        "red": "Стресс из-за финансов",
        "black": "Серьёзные финансовые проблемы",
        "yellow": "Нестабильные финансы"
      }
    },
    {
      "id": 7,
      "text": "Какой цвет описывает ваше ЛИЧНОСТНОЕ развитие и самореализацию?",
      "domain": "personal_growth",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "green": "Активный рост",
        "violet": "Трансформация, духовный рост",
        "yellow": "Креативное развитие",
        "blue": "Рациональное, контролируемое развитие",
        "gray": "Застой",
        "black": "Регрессия, кризис"
      }
    },
    {
      "id": 8,
      "text": "Какой цвет описывает ваше отношение к СЕМЬЕ?",
      "domain": "family",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "green": "Гармоничные семейные отношения",
        "brown": "Потребность в семейной безопасности",
        "pink": "Нежные семейные связи",
        "red": "Конфликты или страстные отношения",
        "gray": "Отстранённость от семьи",
        "black": "Негативные семейные отношения"
      }
    },
    {
      "id": 9,
      "text": "Какого цвета вам БОЛЬШЕ ВСЕГО НЕ ХВАТАЕТ в жизни сейчас?",
      "domain": "missing_quality",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "note": "Цвет, которого не хватает, показывает неудовлетворённую потребность",
        "red": "Нужна энергия, страсть, активность",
        "blue": "Нужен контроль, спокойствие",
        "green": "Нужен баланс, стабильность",
        "yellow": "Нужна лёгкость, оптимизм",
        "orange": "Нужно тепло, социальная связь",
        "pink": "Нужна нежность, забота",
        "violet": "Нужна трансформация, духовность",
        "brown": "Нужна безопасность, отдых"
      }
    },
    {
      "id": 10,
      "text": "Какой цвет описывает то, что вызывает у вас СТРЕСС прямо сейчас?",
      "domain": "stress_source",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "red": "Стресс от конфликтов, давления",
        "yellow": "Стресс от неопределённости, тревоги",
        "black": "Стресс от негативных событий",
        "blue": "Стресс от чрезмерного контроля",
        "brown": "Стресс от истощения",
        "gray": "Стресс от монотонности"
      }
    }
  ]
}
```

### ЭТАП 6: ВРЕМЕННАЯ ПЕРСПЕКТИВА

```json
{
  "stage": 6,
  "id": "temporal_perspective",
  "name": "Временная перспектива",
  "instruction": "Выберите цвета, которые описывают ваше отношение к прошлому, настоящему и будущему.",
  "time_limit_seconds": null,
  "response_type": "color_choice",
  "task_count": 6,
  "questions": [
    {
      "id": 1,
      "text": "Какой цвет описывает ваше ПРОШЛОЕ (как вы его сейчас воспринимаете)?",
      "temporal_focus": "past",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "gray": "Нейтральное или безразличное прошлое",
        "black": "Негативное, травматичное прошлое",
        "brown": "Тёплое, безопасное прошлое",
        "yellow": "Счастливое, беззаботное прошлое",
        "blue": "Стабильное, контролируемое прошлое",
        "red": "Интенсивное, страстное или конфликтное прошлое"
      }
    },
    {
      "id": 2,
      "text": "Какой цвет описывает ваше НАСТОЯЩЕЕ (здесь и сейчас)?",
      "temporal_focus": "present",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "note": "Сравнение с цветом настроения покажет согласованность"
      }
    },
    {
      "id": 3,
      "text": "Какой цвет описывает ваше БУДУЩЕЕ (как вы его представляете)?",
      "temporal_focus": "future",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink", "white"]
      },
      "interpretation": {
        "yellow": "Оптимистичное будущее",
        "green": "Стабильное, растущее будущее",
        "violet": "Трансформационное будущее",
        "white": "Открытое, чистое будущее",
        "blue": "Контролируемое будущее",
        "gray": "Неопределённое будущее",
        "black": "Пессимистичное будущее"
      }
    },
    {
      "id": 4,
      "text": "В каком времени вы чувствуете себя НАИБОЛЕЕ комфортно?",
      "temporal_focus": "comfort_zone",
      "response_type": "multiple_choice",
      "response_config": {
        "options": [
          {"text": "В прошлом (ностальгия)", "value": "past", "scoring": {"future_orientation": -3}},
          {"text": "В настоящем (здесь и сейчас)", "value": "present", "scoring": {"emotional_balance": 3}},
          {"text": "В будущем (мечты и планы)", "value": "future", "scoring": {"future_orientation": 3, "optimism": 2}}
        ]
      }
    },
    {
      "id": 5,
      "text": "Какой цвет описывает ваши МЕЧТЫ и желания?",
      "temporal_focus": "dreams",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink", "white"]
      },
      "interpretation": {
        "violet": "Глубокие, духовные мечты",
        "yellow": "Лёгкие, оптимистичные мечты",
        "red": "Страстные, амбициозные мечты",
        "pink": "Романтичные мечты",
        "white": "Чистые, идеалистичные мечты",
        "gray": "Отсутствие мечт, апатия",
        "black": "Нереализуемые мечты, пессимизм"
      }
    },
    {
      "id": 6,
      "text": "Какой цвет описывает ваши СТРАХИ и тревоги о будущем?",
      "temporal_focus": "fears",
      "response_config": {
        "colors_available": ["red", "blue", "green", "yellow", "violet", "brown", "black", "gray", "orange", "pink"]
      },
      "interpretation": {
        "black": "Глубокие экзистенциальные страхи",
        "red": "Страх конфликтов, катастроф",
        "yellow": "Тревога неопределённости",
        "gray": "Страх одиночества, пустоты",
        "brown": "Страх нестабильности, бедности"
      }
    }
  ]
}
```

---

## SCORING RULES (АЛГОРИТМЫ ПОДСЧЕТА)

```json
{
  "scoring_methodology": {
    "note": "Комплексный анализ на основе всех 6 этапов с весовыми коэффициентами",
    "components": [
      "Анализ быстрого выбора (вес 15%)",
      "Анализ полного ранжирования (вес 25%)",
      "Анализ парных сравнений (вес 20%)",
      "Анализ эмоциональных ассоциаций (вес 15%)",
      "Анализ жизненных сфер (вес 15%)",
      "Анализ временной перспективы (вес 10%)",
      "Выявление паттернов и конфликтов",
      "Расчёт 12 психологических шкал"
    ]
  },
  
  "position_analysis": {
    "first_position": {
      "meaning": "Текущая установка, способ совладания, 'маска'",
      "interpretation": "Как человек хочет действовать или быть воспринятым СЕЙЧАС"
    },
    "second_position": {
      "meaning": "Текущая цель, стремление",
      "interpretation": "К чему стремится человек в данный момент"
    },
    "third_fourth_position": {
      "meaning": "Текущее реальное состояние",
      "interpretation": "Как человек себя действительно чувствует"
    },
    "fifth_sixth_position": {
      "meaning": "Индифферентная зона",
      "interpretation": "Нейтральные качества, не актуальные сейчас"
    },
    "seventh_eighth_position": {
      "meaning": "Подавленные потребности, тревоги",
      "interpretation": "Чего человек избегает, что подавляет"
    },
    "ninth_tenth_position": {
      "meaning": "Отвергаемые качества, страхи",
      "interpretation": "Сильное отвержение, возможно подавленные потребности или страхи"
    }
  },
  
  "scale_calculation_formulas": {
    "energy_level": {
      "components": [
        "Ranking: (red_position × -1 + 11) × 5 + (yellow_position × -1 + 11) × 3 + (orange_position × -1 + 11) × 2",
        "Paired: Red choices × 3",
        "Emotions: Energy color choice",
        "Life: Physical health color",
        "Quick choice: Liked/disliked red, yellow, orange"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-30": "Низкая энергия, истощение, потребность в отдыхе",
        "31-60": "Умеренная энергия, нормальное состояние",
        "61-100": "Высокая энергия, активация, готовность к действию"
      }
    },
    "stress_level": {
      "components": [
        "Ranking: (red_position <= 3 AND yellow_position <= 3) × 30 + (black_position <= 3 OR gray_position <= 3) × 25 + (violet_position <= 3) × 15",
        "Paired: Conflict patterns",
        "Emotions: Anxiety color",
        "Life: Stress source color",
        "Rejected_colors: count of stable colors rejected"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-25": "Низкий стресс, спокойное состояние",
        "26-50": "Умеренный стресс, норма",
        "51-75": "Высокий стресс, напряжение",
        "76-100": "Критический стресс, риск выгорания"
      }
    },
    "emotional_balance": {
      "components": [
        "Ranking: (green_position × -1 + 11) × 5 + (blue_position × -1 + 11) × 4 - stress_level × 0.3",
        "Paired: Green/blue choices",
        "Emotions: Calm color",
        "Life: Overall mood stability",
        "Temporal: Present vs past/future alignment"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-40": "Дисбаланс, эмоциональная нестабильность",
        "41-70": "Умеренный баланс",
        "71-100": "Высокий баланс, гармония"
      }
    },
    "openness": {
      "components": [
        "Ranking: (yellow_position × -1 + 11) × 5 + (orange_position × -1 + 11) × 4 + (pink_position × -1 + 11) × 2 - (black_position × -1 + 11) × 3",
        "Paired: Orange vs gray choices, Pink vs black choices",
        "Life: Social connections color",
        "Emotions: Joy color (social colors indicate openness)"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-40": "Закрытость, дистанцирование",
        "41-70": "Умеренная открытость",
        "71-100": "Высокая открытость, общительность"
      }
    },
    "control_need": {
      "components": [
        "Ranking: (blue_position × -1 + 11) × 5 + (green_position × -1 + 11) × 4 + (gray_position × -1 + 11) × 2",
        "Paired: Blue vs red, Blue vs yellow choices",
        "Life: Work color (blue = controlled work)"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-40": "Низкая потребность в контроле, спонтанность",
        "41-70": "Умеренная потребность в контроле",
        "71-100": "Высокая потребность в контроле, ригидность"
      }
    },
    "satisfaction": {
      "components": [
        "Ranking: 100 - (brown_position × -1 + 11) × 5 - (black_position × -1 + 11) × 4 - (gray_position × -1 + 11) × 3 + (green_position × -1 + 11) × 2",
        "Life: Work, relationships, personal growth colors",
        "Temporal: Future color (optimistic = satisfied)",
        "Quick choice: Rejection of brown/black/gray"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-40": "Неудовлетворённость, фрустрация",
        "41-70": "Умеренная удовлетворённость",
        "71-100": "Высокая удовлетворённость"
      }
    },
    "defensiveness": {
      "components": [
        "Ranking: (black_position × -1 + 11) × 5 + (gray_position × -1 + 11) × 4 + IF(red_position <= 2 AND blue_position >= 8) × 15",
        "Paired: Black choices, Gray choices",
        "Quick choice: Black/gray liked"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-40": "Низкая защита, открытость",
        "41-70": "Умеренная защита",
        "71-100": "Высокая защита, закрытость"
      }
    },
    "need_for_change": {
      "components": [
        "Ranking: (violet_position × -1 + 11) × 5 + (yellow_position × -1 + 11) × 3 + rejected_stable_colors × 10",
        "Paired: Violet choices",
        "Life: Missing quality color",
        "Temporal: Future vs present difference"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-40": "Удовлетворённость статус-кво",
        "41-70": "Умеренное желание перемен",
        "71-100": "Сильная потребность в изменениях"
      }
    },
    "optimism": {
      "components": [
        "Emotions: Joy color (yellow/orange = optimistic)",
        "Temporal: Future color (bright colors = optimistic)",
        "Life: Overall tone of life domain colors",
        "Ranking: Yellow, orange position"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-35": "Пессимистичный взгляд",
        "36-65": "Нейтральный, реалистичный взгляд",
        "66-100": "Оптимистичный взгляд"
      }
    },
    "social_connection": {
      "components": [
        "Life: Friendships color, Romantic relationships color",
        "Ranking: Orange, pink position",
        "Paired: Orange vs gray",
        "Emotions: Joy as social emotion"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-40": "Изоляция, слабые связи",
        "41-70": "Умеренные социальные связи",
        "71-100": "Сильные социальные связи"
      }
    },
    "self_esteem": {
      "components": [
        "Life: Personal growth color",
        "Emotions: Hope color, Fatigue color",
        "Ranking: Pink rejection (low self-esteem), Brown/black preference",
        "Temporal: Dreams color"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-40": "Низкая самооценка",
        "41-70": "Умеренная самооценка",
        "71-100": "Высокая самооценка"
      }
    },
    "future_orientation": {
      "components": [
        "Temporal: Future color (bright = positive future)",
        "Temporal: Comfort zone (future = positive orientation)",
        "Temporal: Dreams color",
        "Temporal: Fears color (dark fears = negative future)"
      ],
      "formula": "weighted_sum_of_all_components",
      "normalization": "map to 0-100",
      "interpretation": {
        "0-35": "Пессимистичный взгляд на будущее",
        "36-65": "Нейтральный взгляд на будущее",
        "66-100": "Оптимистичный взгляд на будущее"
      }
    }
  },
  
  "pattern_detection": {
    "conflict_patterns": [
      {
        "name": "Красный-Синий конфликт",
        "condition": "red in [1,2,3] AND blue in [8,9,10] OR vice versa",
        "meaning": "Конфликт между импульсивностью и контролем"
      },
      {
        "name": "Активность-Истощение",
        "condition": "red in [1,2] AND brown in [1,2,3]",
        "meaning": "Попытка компенсировать истощение активностью"
      },
      {
        "name": "Серый щит",
        "condition": "gray in [1,2]",
        "meaning": "Защита от эмоций, эмоциональное истощение"
      },
      {
        "name": "Чёрный протест",
        "condition": "black in [1,2]",
        "meaning": "Отрицание, протест, капитуляция"
      },
      {
        "name": "Отвержение базовых потребностей",
        "condition": "red in [9,10] AND green in [9,10]",
        "meaning": "Подавление базовых витальных потребностей"
      },
      {
        "name": "Негативная временная перспектива",
        "condition": "Future color is black/gray AND Present color is brown/gray",
        "meaning": "Пессимизм и отсутствие надежды"
      },
      {
        "name": "Ностальгия и застревание",
        "condition": "Past color is warm AND Future color is gray/black AND comfort in past",
        "meaning": "Застревание в прошлом, страх будущего"
      }
    ],
    "positive_patterns": [
      {
        "name": "Гармоничный баланс",
        "condition": "green in [1,2,3] AND blue in [2,3,4]",
        "meaning": "Баланс, стабильность, контроль"
      },
      {
        "name": "Здоровая активность",
        "condition": "red in [1,2,3] AND yellow in [2,3,4] AND brown NOT in [1,2,3]",
        "meaning": "Энергия без истощения"
      },
      {
        "name": "Открытость и лёгкость",
        "condition": "yellow in [1,2] AND orange in [2,3]",
        "meaning": "Оптимизм, общительность"
      },
      {
        "name": "Позитивная временная перспектива",
        "condition": "Future color is yellow/green/white AND Dreams color is bright",
        "meaning": "Оптимизм и надежда на будущее"
      }
    ]
  },
  
  "consistency_analysis": {
    "note": "Сравнение ответов на разных этапах для оценки согласованности",
    "checks": [
      {
        "name": "Настроение: быстрый выбор vs жизненная сфера",
        "compare": "Quick choice liked colors VS Life domain current mood color",
        "inconsistency_meaning": "Возможна социальная желательность или неосознанность"
      },
      {
        "name": "Эмоции vs Временная перспектива",
        "compare": "Emotional associations VS Temporal perspective emotions",
        "inconsistency_meaning": "Противоречия в эмоциональной сфере"
      },
      {
        "name": "Энергия: прямые и косвенные индикаторы",
        "compare": "Energy emotion color VS Physical health color VS Fatigue color",
        "inconsistency_meaning": "Скрытое истощение или компенсация"
      }
    ]
  }
}
```

---

## INTERPRETATION GUIDE (РАСШИРЕННАЯ ИНТЕРПРЕТАЦИЯ)

### КОМПЛЕКСНЫЙ ОТЧЁТ

```json
{
  "report_structure": {
    "sections": [
      "1. Общее эмоциональное состояние",
      "2. Детальный анализ по 12 шкалам",
      "3. Выявленные паттерны и конфликты",
      "4. Анализ жизненных сфер",
      "5. Временная перспектива",
      "6. Неосознанные потребности",
      "7. Рекомендации"
    ]
  },
  
  "overall_state_assessment": {
    "method": "Интеграция всех шкал для общей картины",
    "categories": [
      {
        "state": "Flourishing (Процветание)",
        "criteria": {
          "energy_level": ">60",
          "stress_level": "<40",
          "emotional_balance": ">60",
          "satisfaction": ">60",
          "optimism": ">60"
        },
        "description": "Вы находитесь в состоянии психологического благополучия и процветания"
      },
      {
        "state": "Functioning Well (Хорошее функционирование)",
        "criteria": {
          "energy_level": "40-60",
          "stress_level": "30-50",
          "emotional_balance": "50-70",
          "satisfaction": "50-70"
        },
        "description": "Вы в целом справляетесь, но есть области для улучшения"
      },
      {
        "state": "Struggling (Борьба)",
        "criteria": {
          "energy_level": "<40",
          "stress_level": "50-75",
          "emotional_balance": "<50",
          "satisfaction": "<50"
        },
        "description": "Вы испытываете значительные трудности, нужна поддержка"
      },
      {
        "state": "Crisis (Кризис)",
        "criteria": {
          "energy_level": "<30",
          "stress_level": ">75",
          "emotional_balance": "<40",
          "defensiveness": ">70",
          "depression_pattern": true
        },
        "description": "Вы в кризисном состоянии, необходима профессиональная помощь"
      }
    ]
  },
  
  "temporal_analysis": {
    "past_present_future_integration": {
      "healthy_pattern": "Past: neutral/positive, Present: balanced, Future: optimistic",
      "stuck_in_past": "Past: warm colors, Present: gray/brown, Future: dark",
      "fear_of_future": "Past: any, Present: any, Future: black/gray",
      "disconnected": "Past, Present, Future all different temperatures"
    }
  },
  
  "life_domains_summary": {
    "method": "Создание профиля удовлетворённости по областям",
    "visualization": "Radar chart of life domains by color temperature",
    "interpretation": "Выявление проблемных и благополучных сфер"
  }
}
```

---

## IMPLEMENTATION NOTES

```json
{
  "test_administration": {
    "total_time": "12-15 minutes",
    "stage_navigation": "Cannot skip stages, can go back within stage",
    "save_progress": true,
    "retake_recommendation": "Weekly or when feeling state change",
    "complexity": "Higher cognitive load than simple version"
  },
  
  "ui_recommendations": {
    "progress_indicator": "Show stage X of 6 + progress within stage",
    "color_display": "Large, saturated color squares",
    "color_size": "minimum 80x80 pixels on mobile",
    "drag_and_drop": "For ranking stage",
    "visual_feedback": "Clear indication of selected colors",
    "timer": "Visible countdown for timed stages (1 & 2)",
    "stage_transitions": "Clear visual separation between stages",
    "tone": "Calm, non-judgmental, supportive"
  },
  
  "special_features": {
    "extended_tracking": "Track all 12 scales over time",
    "comparison_mode": "Compare two test results side by side",
    "life_domains_radar": "Radar chart visualization",
    "temporal_timeline": "Visual timeline of past-present-future",
    "pattern_alerts": "Alert user to significant patterns",
    "professional_report": "Comprehensive downloadable PDF report",
    "export_data": "CSV export for personal tracking"
  },
  
  "data_analysis": {
    "consistency_check": "Flag inconsistent responses",
    "response_time_analysis": "Track time per stage (may indicate resistance)",
    "pattern_detection": "Automatic detection of 15+ patterns",
    "trend_analysis": "Track changes over multiple test sessions"
  }
}
```

---

## VALIDATION DATA

```json
{
  "scientific_foundation": {
    "note": "Расширенная версия с более глубокой диагностикой",
    "advantages": [
      "Более надёжная оценка через множественные измерения",
      "Кросс-валидация через разные методы",
      "Глубокий анализ временной перспективы",
      "Детальная оценка жизненных сфер",
      "Обнаружение противоречий и защит"
    ],
    "limitations": [
      "Более длительное прохождение",
      "Требует больше когнитивных усилий",
      "Риск усталости респондента",
      "Всё ещё проективная методика, не диагностика"
    ]
  },
  "expected_reliability": {
    "internal_consistency": "Высокая за счёт множественных измерений",
    "test_retest": "Умеренная (измеряет состояние)",
    "inter_method_consistency": "Проверка согласованности между этапами"
  }
}
```

---

## ИНСТРУКЦИИ ДЛЯ CLAUDE CODE

**При создании приложения:**

1. **Data модели** - Color, TestStage (6 этапов), ColorSelection, ColorRanking, PairedChoice, EmotionalAssociation, LifeDomain, TemporalPerspective, PsychologicalScales (12 шкал), Pattern
2. **Test Flow**:
   - Этап 1: Быстрый выбор (30 сек) - 1 задание
   - Этап 2: Полное ранжирование (60 сек) - 1 задание
   - Этап 3: Парные сравнения - 10 заданий
   - Этап 4: Эмоциональные ассоциации - 8 вопросов
   - Этап 5: Жизненные сферы - 10 вопросов
   - Этап 6: Временная перспектива - 6 вопросов
   - **Всего: 34+ взаимодействия**
3. **Scoring Engine**:
   - Взвешенная интеграция всех 6 этапов
   - Расчёт 12 психологических шкал
   - Выявление 15+ паттернов
   - Анализ согласованности ответов
   - Временной анализ (прошлое-настоящее-будущее)
   - Анализ жизненных сфер
4. **UI особенности**:
   - Progress bar: Stage X/6 + progress within stage
   - Drag & drop для ранжирования
   - Таймеры для этапов 1-2
   - Чёткие переходы между этапами
   - Минималистичный дизайн
5. **Результаты**:
   - Общее состояние (Flourishing/Functioning/Struggling/Crisis)
   - 12 шкал с интерпретацией
   - Выявленные паттерны (позитивные и конфликтные)
   - Анализ жизненных сфер (радар-чарт)
   - Временная перспектива (таймлайн визуализация)
   - Неосознанные потребности
   - Детальные рекомендации
6. **Advanced Features**:
   - История всех тестов
   - Сравнение результатов
   - Экспорт в PDF/CSV
   - Radar chart для жизненных сфер
   - Timeline для временной перспективы

**Важно:**
- Точность цветопередачи критична
- Сохранение всех этапов для анализа
- Обнаружение противоречий между этапами
- Комплексный отчёт, а не просто баллы
- Красивые визуализации (radar, timeline)

---

**РАСШИРЕННАЯ ВЕРСИЯ ГОТОВА! 🎨**

**Основные улучшения:**
- ✅ 34+ взаимодействия вместо 7-8
- ✅ 6 этапов вместо 3
- ✅ 12 психологических шкал вместо 8
- ✅ Временная перспектива (новое!)
- ✅ Расширенные жизненные сферы
- ✅ Парные сравнения (новое!)
- ✅ Эмоциональные ассоциации (новое!)
- ✅ Время прохождения: 12-15 минут
- ✅ Гораздо более глубокая диагностика

Сохраните как `color_psychology_test_extended.md`
