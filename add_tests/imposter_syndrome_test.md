{
  "test_metadata": {
    "test_id": "imposter_syndrome",
    "version": "1.0.0",
    "title": {
      "ru": "Тест «Синдром самозванца»",
      "en": "Imposter Syndrome Test"
    },
    "description": {
      "ru": "Синдром самозванца — это психологический феномен, при котором человек не может приписать свои достижения собственным усилиям и способностям. Люди с этим синдромом постоянно сомневаются в себе, боятся быть «разоблаченными» как некомпетентные, несмотря на объективные доказательства их успешности. Это состояние затрагивает до 70% людей хотя бы раз в жизни, особенно при карьерном росте или освоении новых навыков.\n\nЭтот тест основан на исследованиях Полин Кланс и Сюзанны Аймс (1978), а также современных работах по психологии самооценки и атрибуции успеха. Тест измеряет шесть ключевых компонентов синдрома самозванца: страх разоблачения, обесценивание достижений, перфекционизм, избегание вызовов, внешняя атрибуция успеха и компенсаторное поведение.\n\nПонимание своего уровня синдрома самозванца поможет вам объективнее оценивать свои способности, снизить тревогу и разработать стратегии для здоровой самооценки.",
      "en": "Imposter syndrome is a psychological phenomenon where a person cannot attribute their achievements to their own efforts and abilities. People with this syndrome constantly doubt themselves and fear being 'exposed' as incompetent, despite objective evidence of their success. This condition affects up to 70% of people at least once in their lives, especially during career advancement or learning new skills.\n\nThis test is based on research by Pauline Clance and Suzanne Imes (1978), as well as modern work in self-esteem psychology and success attribution. The test measures six key components of imposter syndrome: fear of exposure, devaluing achievements, perfectionism, avoiding challenges, external attribution of success, and compensatory behavior.\n\nUnderstanding your level of imposter syndrome will help you more objectively assess your abilities, reduce anxiety, and develop strategies for healthy self-esteem."
    },
    "author": "Based on Clance & Imes (1978) research",
    "theoretical_basis": [
      "Clance & Imes (1978) - Imposter Phenomenon",
      "Leary et al. (2000) - Self-Presentation Theory",
      "Weiner (1985) - Attribution Theory",
      "Hewitt & Flett (1991) - Perfectionism Theory",
      "Bandura (1997) - Self-Efficacy Theory"
    ],
    "target_audience": {
      "ru": "Взрослые от 18 лет, особенно студенты, специалисты и лидеры",
      "en": "Adults 18+, especially students, professionals, and leaders"
    },
    "estimated_time_minutes": 10,
    "question_count": 42,
    "response_type": "likert_5",
    "category": "emotional"
  },

  "response_config": {
    "type": "likert_5",
    "options": {
      "ru": ["Совершенно не согласен", "Скорее не согласен", "Нейтрально", "Скорее согласен", "Полностью согласен"],
      "en": ["Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"]
    },
    "scoring": [0, 1, 2, 3, 4],
    "reverse_formula": "4 - score"
  },

  "scales": [
    {
      "id": "fear_of_exposure",
      "name": {"ru": "Страх разоблачения", "en": "Fear of Exposure"},
      "description": {"ru": "Постоянная тревога о том, что другие узнают о вашей «мнимой» некомпетентности", "en": "Constant anxiety that others will discover your 'alleged' incompetence"},
      "question_ids": [1, 2, 3, 4, 5, 6, 7],
      "scoring_method": "sum",
      "normalization": "linear",
      "min_score": 0,
      "max_score": 28
    },
    {
      "id": "achievement_devaluation",
      "name": {"ru": "Обесценивание достижений", "en": "Achievement Devaluation"},
      "description": {"ru": "Систематическое отрицание собственных заслуг", "en": "Systematic denial of merits"},
      "question_ids": [8, 9, 10, 11, 12, 13, 14],
      "scoring_method": "sum",
      "normalization": "linear",
      "min_score": 0,
      "max_score": 28
    },
    {
      "id": "perfectionism",
      "name": {"ru": "Перфекционизм", "en": "Perfectionism"},
      "description": {"ru": "Нереалистично высокие стандарты", "en": "Unrealistically high standards"},
      "question_ids": [15, 16, 17, 18, 19, 20, 21],
      "scoring_method": "sum",
      "normalization": "linear",
      "min_score": 0,
      "max_score": 28
    },
    {
      "id": "challenge_avoidance",
      "name": {"ru": "Избегание вызовов", "en": "Challenge Avoidance"},
      "description": {"ru": "Уклонение от новых возможностей", "en": "Avoiding new opportunities"},
      "question_ids": [22, 23, 24, 25, 26, 27, 28],
      "scoring_method": "sum",
      "normalization": "linear",
      "min_score": 0,
      "max_score": 28
    },
    {
      "id": "external_attribution",
      "name": {"ru": "Внешняя атрибуция успеха", "en": "External Success Attribution"},
      "description": {"ru": "Приписывание достижений везению", "en": "Attributing achievements to luck"},
      "question_ids": [29, 30, 31, 32, 33, 34, 35],
      "scoring_method": "sum",
      "normalization": "linear",
      "min_score": 0,
      "max_score": 28
    },
    {
      "id": "overcompensation",
      "name": {"ru": "Гиперкомпенсация", "en": "Overcompensation"},
      "description": {"ru": "Чрезмерные усилия как компенсация", "en": "Excessive effort as compensation"},
      "question_ids": [36, 37, 38, 39, 40, 41, 42],
      "scoring_method": "sum",
      "normalization": "linear",
      "min_score": 0,
      "max_score": 28
    }
  ],

  "questions": [
    {"id": 1, "text": {"ru": "Я боюсь, что люди узнают, насколько я на самом деле некомпетентен", "en": "I fear that people will find out how incompetent I really am"}, "scale": "fear_of_exposure", "reverse": false},
    {"id": 2, "text": {"ru": "Я часто думаю, что меня вот-вот «раскусят» и поймут, что я обманщик", "en": "I often think I'm about to be 'found out' as a fraud"}, "scale": "fear_of_exposure", "reverse": false},
    {"id": 3, "text": {"ru": "Когда меня хвалят, я тревожусь, что не смогу оправдать ожидания в будущем", "en": "When praised, I worry I won't meet future expectations"}, "scale": "fear_of_exposure", "reverse": false},
    {"id": 4, "text": {"ru": "Я уверен(а) в своих способностях и не боюсь, что другие усомнятся в моей компетентности", "en": "I am confident and not afraid others will doubt my competence"}, "scale": "fear_of_exposure", "reverse": true},
    {"id": 5, "text": {"ru": "Мне кажется, что я постоянно притворяюсь более способным, чем есть на самом деле", "en": "I feel I'm constantly pretending to be more capable than I am"}, "scale": "fear_of_exposure", "reverse": false},
    {"id": 6, "text": {"ru": "Я боюсь задавать вопросы, чтобы не показаться глупым", "en": "I'm afraid to ask questions so I won't appear stupid"}, "scale": "fear_of_exposure", "reverse": false},
    {"id": 7, "text": {"ru": "Я избегаю ситуаций, где мои знания могут быть проверены", "en": "I avoid situations where my knowledge might be tested"}, "scale": "fear_of_exposure", "reverse": false},
    {"id": 8, "text": {"ru": "Я редко чувствую удовлетворение от своих достижений", "en": "I rarely feel satisfaction from my achievements"}, "scale": "achievement_devaluation", "reverse": false},
    {"id": 9, "text": {"ru": "Когда я добиваюсь успеха, я думаю: «Это не считается» или «Это было слишком просто»", "en": "When I succeed, I think: 'This doesn't count' or 'It was too easy'"}, "scale": "achievement_devaluation", "reverse": false},
    {"id": 10, "text": {"ru": "Я горжусь своими достижениями и признаю свою роль в них", "en": "I am proud of my achievements and acknowledge my role"}, "scale": "achievement_devaluation", "reverse": true},
    {"id": 11, "text": {"ru": "Я думаю, что мои успехи не отражают мои истинные способности", "en": "I think my successes don't reflect my true abilities"}, "scale": "achievement_devaluation", "reverse": false},
    {"id": 12, "text": {"ru": "Когда меня хвалят за работу, я чувствую себя неловко и незаслуженно", "en": "When praised for work, I feel awkward and undeserving"}, "scale": "achievement_devaluation", "reverse": false},
    {"id": 13, "text": {"ru": "Я минимизирую значимость своих достижений в разговорах с другими", "en": "I minimize the significance of my achievements with others"}, "scale": "achievement_devaluation", "reverse": false},
    {"id": 14, "text": {"ru": "Мне трудно принимать комплименты — я сразу начинаю их обесценивать", "en": "I find it hard to accept compliments—I immediately devalue them"}, "scale": "achievement_devaluation", "reverse": false},
    {"id": 15, "text": {"ru": "Я устанавливаю для себя нереалистично высокие стандарты", "en": "I set unrealistically high standards for myself"}, "scale": "perfectionism", "reverse": false},
    {"id": 16, "text": {"ru": "Если я не могу сделать что-то идеально, я чувствую себя полным неудачником", "en": "If I can't do something perfectly, I feel like a complete failure"}, "scale": "perfectionism", "reverse": false},
    {"id": 17, "text": {"ru": "Я могу признать свои ошибки и рассматриваю их как часть обучения", "en": "I can acknowledge mistakes and view them as part of learning"}, "scale": "perfectionism", "reverse": true},
    {"id": 18, "text": {"ru": "Даже небольшая ошибка заставляет меня сомневаться во всех своих способностях", "en": "Even a small mistake makes me doubt all my abilities"}, "scale": "perfectionism", "reverse": false},
    {"id": 19, "text": {"ru": "Я трачу непропорционально много времени на мелкие детали, чтобы всё было безупречно", "en": "I spend disproportionate time on small details for perfection"}, "scale": "perfectionism", "reverse": false},
    {"id": 20, "text": {"ru": "Мне трудно начать проект, если я не уверен, что смогу выполнить его идеально", "en": "I find it hard to start a project if unsure I can do it perfectly"}, "scale": "perfectionism", "reverse": false},
    {"id": 21, "text": {"ru": "Я постоянно сравниваю себя с другими и чувствую, что недотягиваю", "en": "I constantly compare myself to others and feel I fall short"}, "scale": "perfectionism", "reverse": false},
    {"id": 22, "text": {"ru": "Я избегаю новых возможностей из-за страха неудачи", "en": "I avoid new opportunities due to fear of failure"}, "scale": "challenge_avoidance", "reverse": false},
    {"id": 23, "text": {"ru": "Я отказываюсь от повышений или новых проектов, думая, что не справлюсь", "en": "I turn down promotions or new projects, thinking I can't handle them"}, "scale": "challenge_avoidance", "reverse": false},
    {"id": 24, "text": {"ru": "Я с энтузиазмом принимаю новые вызовы и возможности для роста", "en": "I enthusiastically embrace new challenges and growth opportunities"}, "scale": "challenge_avoidance", "reverse": true},
    {"id": 25, "text": {"ru": "Я предпочитаю оставаться в зоне комфорта, чтобы не рисковать провалом", "en": "I prefer staying in my comfort zone to avoid risking failure"}, "scale": "challenge_avoidance", "reverse": false},
    {"id": 26, "text": {"ru": "Мысль о новых обязанностях вызывает у меня панику", "en": "The thought of new responsibilities makes me panic"}, "scale": "challenge_avoidance", "reverse": false},
    {"id": 27, "text": {"ru": "Я откладываю важные задачи из-за страха не справиться с ними", "en": "I procrastinate on important tasks due to fear of not handling them"}, "scale": "challenge_avoidance", "reverse": false},
    {"id": 28, "text": {"ru": "Я саботирую собственные возможности, потому что боюсь ожиданий", "en": "I sabotage my own opportunities because I fear expectations"}, "scale": "challenge_avoidance", "reverse": false},
    {"id": 29, "text": {"ru": "Когда я добиваюсь успеха, я думаю, что мне просто повезло", "en": "When I succeed, I think I was just lucky"}, "scale": "external_attribution", "reverse": false},
    {"id": 30, "text": {"ru": "Я считаю, что мои достижения — результат моих усилий и способностей", "en": "I believe my achievements are the result of my efforts and abilities"}, "scale": "external_attribution", "reverse": true},
    {"id": 31, "text": {"ru": "Я думаю, что успех случился благодаря помощи других, а не мне", "en": "I think success happened thanks to others' help, not me"}, "scale": "external_attribution", "reverse": false},
    {"id": 32, "text": {"ru": "Мне кажется, что я оказался на своей позиции случайно", "en": "I feel I ended up in my position by accident"}, "scale": "external_attribution", "reverse": false},
    {"id": 33, "text": {"ru": "Когда задача оказывается легче ожидаемого, я чувствую, что не заслужил успеха", "en": "When a task is easier than expected, I feel I didn't deserve success"}, "scale": "external_attribution", "reverse": false},
    {"id": 34, "text": {"ru": "Я приписываю свои неудачи недостатку способностей, а успехи — внешним обстоятельствам", "en": "I attribute failures to lack of ability, successes to external factors"}, "scale": "external_attribution", "reverse": false},
    {"id": 35, "text": {"ru": "Мне трудно признать, что я действительно заслужил свои достижения", "en": "I find it hard to admit I truly earned my achievements"}, "scale": "external_attribution", "reverse": false},
    {"id": 36, "text": {"ru": "Я работаю намного больше других, чтобы «компенсировать» свою недостаточность", "en": "I work much harder than others to 'compensate' for my inadequacy"}, "scale": "overcompensation", "reverse": false},
    {"id": 37, "text": {"ru": "Я чувствую постоянное давление доказывать свою ценность через работу", "en": "I feel constant pressure to prove my worth through work"}, "scale": "overcompensation", "reverse": false},
    {"id": 38, "text": {"ru": "Я могу расслабиться и не чувствую необходимости постоянно что-то доказывать", "en": "I can relax and don't feel the need to constantly prove something"}, "scale": "overcompensation", "reverse": true},
    {"id": 39, "text": {"ru": "Я перегружаю себя работой, потому что боюсь выглядеть ленивым", "en": "I overload myself with work because I fear appearing lazy"}, "scale": "overcompensation", "reverse": false},
    {"id": 40, "text": {"ru": "Даже после успешного проекта я сразу берусь за новый, не давая себе отдохнуть", "en": "Even after a successful project, I immediately take on a new one without rest"}, "scale": "overcompensation", "reverse": false},
    {"id": 41, "text": {"ru": "Мне трудно делегировать задачи — я думаю, что должен делать всё сам", "en": "I find it hard to delegate tasks—I think I should do everything myself"}, "scale": "overcompensation", "reverse": false},
    {"id": 42, "text": {"ru": "Я жертвую личным временем и здоровьем ради работы", "en": "I sacrifice personal time and health for work"}, "scale": "overcompensation", "reverse": false}
  ],

  "scoring_rules": {
    "reverse_scoring": {"formula": "4 - score"},
    "scale_calculations": {
      "fear_of_exposure": {"method": "sum", "reverse_items": [4], "normalization": {"type": "linear", "formula": "((raw - 0) / 28) * 100"}},
      "achievement_devaluation": {"method": "sum", "reverse_items": [10], "normalization": {"type": "linear", "formula": "((raw - 0) / 28) * 100"}},
      "perfectionism": {"method": "sum", "reverse_items": [17], "normalization": {"type": "linear", "formula": "((raw - 0) / 28) * 100"}},
      "challenge_avoidance": {"method": "sum", "reverse_items": [24], "normalization": {"type": "linear", "formula": "((raw - 0) / 28) * 100"}},
      "external_attribution": {"method": "sum", "reverse_items": [30], "normalization": {"type": "linear", "formula": "((raw - 0) / 28) * 100"}},
      "overcompensation": {"method": "sum", "reverse_items": [38], "normalization": {"type": "linear", "formula": "((raw - 0) / 28) * 100"}}
    },
    "composite_scores": {
      "overall_imposter_syndrome": {"method": "mean", "scales": ["fear_of_exposure", "achievement_devaluation", "perfectionism", "challenge_avoidance", "external_attribution", "overcompensation"]}
    }
  },

  "interpretation_guide": {
    "overall_levels": [
      {"level": "minimal", "range": [0, 20], "label": {"ru": "Минимальный", "en": "Minimal"}, "description": {"ru": "У вас здоровая самооценка и адекватное восприятие достижений.", "en": "You have healthy self-esteem and adequate perception of achievements."}},
      {"level": "mild", "range": [21, 40], "label": {"ru": "Лёгкий", "en": "Mild"}, "description": {"ru": "Вы иногда сомневаетесь в себе, но это не мешает жизни.", "en": "You sometimes doubt yourself, but it doesn't interfere with life."}},
      {"level": "moderate", "range": [41, 60], "label": {"ru": "Умеренный", "en": "Moderate"}, "description": {"ru": "Синдром заметно влияет на жизнь. Рекомендуется работа над самооценкой.", "en": "The syndrome noticeably affects life. Working on self-esteem is recommended."}},
      {"level": "high", "range": [61, 80], "label": {"ru": "Высокий", "en": "High"}, "description": {"ru": "Синдром существенно ограничивает. Рекомендуется работа с психологом.", "en": "The syndrome significantly limits. Working with a psychologist is recommended."}},
      {"level": "severe", "range": [81, 100], "label": {"ru": "Интенсивный", "en": "Severe"}, "description": {"ru": "Очень выраженный синдром. Необходима профессиональная помощь.", "en": "Very pronounced syndrome. Professional help is needed."}}
    ]
  }
}
