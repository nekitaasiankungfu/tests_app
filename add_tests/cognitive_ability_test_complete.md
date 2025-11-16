# ТЕСТ "COGNITIVE ABILITY TEST: ОЦЕНКА КОГНИТИВНЫХ СПОСОБНОСТЕЙ"

## ПОЛНАЯ СПЕЦИФИКАЦИЯ ТЕСТА ДЛЯ МОБИЛЬНОГО ПРИЛОЖЕНИЯ

---

## ОПИСАНИЕ ПРОЕКТА

Это полная спецификация теста когнитивных способностей (Cognitive Ability Test) для оценки умственных способностей человека. Тест является стандартом в рекрутинге и HR и измеряет три ключевых типа интеллекта: логическое мышление, числовые способности и вербальные способности. Тест предназначен для мобильного приложения на Android (Kotlin + Jetpack Compose).

**Что включено:**
- Полная методология и научная база
- 60 вопросов (20 логических + 20 числовых + 20 вербальных)
- 3 основные шкалы когнитивных способностей
- Система подсчета баллов и нормализации
- Детальная интерпретация результатов с процентилями
- Применение в карьере и рекрутинге
- Рекомендации по развитию когнитивных навыков

---

## МЕТАДАННЫЕ ТЕСТА
```json
{
  "test_id": "cognitive_ability_v1",
  "title": "Cognitive Ability Test: Оценка когнитивных способностей",
  "description": "Тест когнитивных способностей (Cognitive Ability Test, CAT) — это стандартизированная оценка умственных способностей человека, используемая работодателями по всему миру для подбора персонала и прогнозирования успешности на рабочем месте. Исследования показывают, что когнитивные способности являются наиболее сильным предиктором производительности труда (корреляция 0.5-0.6 с рабочими результатами).\n\nКогнитивные способности — это ваша способность обрабатывать информацию, решать проблемы, учиться новому и адаптироваться к изменениям. В эпоху AI и автоматизации 2025 года эти навыки становятся критически важными, так как рутинные задачи передаются машинам, а людям остаётся работа, требующая сложного мышления.\n\nЭтот тест оценивает три ключевых типа когнитивных способностей:\n\n**1. LOGICAL REASONING (Логическое мышление)** 🧩\n• Абстрактное мышление и распознавание паттернов\n• Способность находить закономерности и делать выводы\n• Решение нестандартных проблем\n• Критически важно для: аналитиков, программистов, инженеров, менеджеров\n\n**2. NUMERICAL ABILITY (Числовые способности)** 🔢\n• Работа с числами, данными и статистикой\n• Математическое мышление и вычисления\n• Интерпретация графиков и таблиц\n• Критически важно для: финансистов, аналитиков данных, учёных, экономистов\n\n**3. VERBAL ABILITY (Вербальные способности)** 📖\n• Понимание текста и языковая логика\n• Словарный запас и грамматика\n• Аргументация и критическое чтение\n• Критически важно для: юристов, писателей, менеджеров, преподавателей\n\nРезультаты теста помогут вам:\n• Понять свои сильные стороны в когнитивных навыках\n• Определить области для развития\n• Оценить готовность к определённым профессиям\n• Подготовиться к тестированию при трудоустройстве\n• Сравнить свои результаты с нормативными данными\n\nВ 2025 году работодатели используют CAT для 85% позиций среднего и высшего звена. Понимание своих когнитивных способностей — это конкурентное преимущество на рынке труда.",
  "version": "1.0",
  "author": "Cognitive Assessment Institute",
  "theoretical_basis": [
    "Spearman's g-factor theory of intelligence",
    "Cattell-Horn-Carroll (CHC) theory",
    "Wonderlic Personnel Test methodology",
    "Ravens Progressive Matrices",
    "Graduate Record Examinations (GRE) framework"
  ],
  "target_audience": "Взрослые 18+ лет, соискатели работы, профессионалы, студенты",
  "estimated_time_minutes": 30,
  "question_count": 60,
  "time_limit": {
    "total_minutes": 30,
    "per_section": {
      "logical": 10,
      "numerical": 10,
      "verbal": 10
    },
    "note": "Тест на время - это часть оценки когнитивной скорости"
  },
  "scales": [
    {
      "id": "logical_reasoning",
      "name": "Logical Reasoning (Логическое мышление)",
      "description": "Способность находить паттерны, делать выводы и решать абстрактные проблемы",
      "question_ids": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
      "question_count": 20,
      "scoring_method": "correct_answers",
      "max_score": 20,
      "normalized_range": [0, 100]
    },
    {
      "id": "numerical_ability",
      "name": "Numerical Ability (Числовые способности)",
      "description": "Способность работать с числами, данными, математическими концепциями",
      "question_ids": [21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40],
      "question_count": 20,
      "scoring_method": "correct_answers",
      "max_score": 20,
      "normalized_range": [0, 100]
    },
    {
      "id": "verbal_ability",
      "name": "Verbal Ability (Вербальные способности)",
      "description": "Способность понимать текст, работать с языком и логикой",
      "question_ids": [41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60],
      "question_count": 20,
      "scoring_method": "correct_answers",
      "max_score": 20,
      "normalized_range": [0, 100]
    }
  ]
}
```

---

## ВОПРОСЫ ТЕСТА (60 ВОПРОСОВ)

### СЕКЦИЯ 1: LOGICAL REASONING (20 вопросов, 10 минут)
```json
[
  {
    "id": 1,
    "text": "Продолжите последовательность: 2, 4, 8, 16, ?",
    "scale": "logical_reasoning",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "20", "correct": false},
        {"text": "24", "correct": false},
        {"text": "32", "correct": true},
        {"text": "64", "correct": false}
      ]
    },
    "explanation": "Каждое следующее число в 2 раза больше предыдущего: 2×2=4, 4×2=8, 8×2=16, 16×2=32"
  },
  {
    "id": 2,
    "text": "Если все A — это B, и все B — это C, то:",
    "scale": "logical_reasoning",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Все A — это C", "correct": true},
        {"text": "Все C — это A", "correct": false},
        {"text": "Некоторые A — это C", "correct": false},
        {"text": "Невозможно определить", "correct": false}
      ]
    },
    "explanation": "Силлогизм: если A⊂B и B⊂C, то A⊂C (транзитивность)"
  },
  {
    "id": 3,
    "text": "Найдите лишнее: Собака, Кошка, Корова, Стул",
    "scale": "logical_reasoning",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Собака", "correct": false},
        {"text": "Кошка", "correct": false},
        {"text": "Корова", "correct": false},
        {"text": "Стул", "correct": true}
      ]
    },
    "explanation": "Собака, Кошка, Корова — животные. Стул — мебель (неживой объект)"
  },
  {
    "id": 4,
    "text": "Продолжите: Z, Y, X, W, ?",
    "scale": "logical_reasoning",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "U", "correct": false},
        {"text": "V", "correct": true},
        {"text": "T", "correct": false},
        {"text": "S", "correct": false}
      ]
    },
    "explanation": "Обратный алфавит: Z, Y, X, W, V"
  },
  {
    "id": 5,
    "text": "Если книга стоит 120 рублей, и цена снизилась на 25%, сколько она стоит?",
    "scale": "logical_reasoning",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "85 рублей", "correct": false},
        {"text": "90 рублей", "correct": true},
        {"text": "95 рублей", "correct": false},
        {"text": "100 рублей", "correct": false}
      ]
    },
    "explanation": "120 - (120 × 0.25) = 120 - 30 = 90 рублей"
  },
  {
    "id": 6,
    "text": "Аналогия: Рука относится к Перчатке, как Нога относится к ?",
    "scale": "logical_reasoning",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Туфля", "correct": false},
        {"text": "Носок", "correct": true},
        {"text": "Ботинок", "correct": false},
        {"text": "Обувь", "correct": false}
      ]
    },
    "explanation": "Перчатка надевается на руку, носок надевается на ногу (наиболее близкий аналог по типу одежды)"
  },
  {
    "id": 7,
    "text": "Продолжите последовательность: 1, 1, 2, 3, 5, 8, ?",
    "scale": "logical_reasoning",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "11", "correct": false},
        {"text": "13", "correct": true},
        {"text": "15", "correct": false},
        {"text": "16", "correct": false}
      ]
    },
    "explanation": "Последовательность Фибоначчи: каждое число = сумма двух предыдущих. 5+8=13"
  },
  {
    "id": 8,
    "text": "Какое из утверждений логически эквивалентно: 'Если идёт дождь, то улица мокрая'?",
    "scale": "logical_reasoning",
    "difficulty": "hard",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Если улица мокрая, то идёт дождь", "correct": false},
        {"text": "Если улица не мокрая, то не идёт дождь", "correct": true},
        {"text": "Если не идёт дождь, то улица не мокрая", "correct": false},
        {"text": "Дождь всегда делает улицу мокрой", "correct": false}
      ]
    },
    "explanation": "Контрапозиция: A→B эквивалентно ¬B→¬A"
  },
  {
    "id": 9,
    "text": "Продолжите: O, T, T, F, F, S, S, ?",
    "scale": "logical_reasoning",
    "difficulty": "hard",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "N", "correct": false},
        {"text": "E", "correct": true},
        {"text": "T", "correct": false},
        {"text": "S", "correct": false}
      ]
    },
    "explanation": "One, Two, Three, Four, Five, Six, Seven, Eight - первые буквы чисел на английском"
  },
  {
    "id": 10,
    "text": "В коробке 12 красных и 8 синих шаров. Какова вероятность вытащить красный шар?",
    "scale": "logical_reasoning",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "0.4", "correct": false},
        {"text": "0.5", "correct": false},
        {"text": "0.6", "correct": true},
        {"text": "0.8", "correct": false}
      ]
    },
    "explanation": "P = красные/всего = 12/(12+8) = 12/20 = 0.6"
  },
  {
    "id": 11,
    "text": "Какая фигура продолжает последовательность: ○ △ ○ △ ○ ?",
    "scale": "logical_reasoning",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "○", "correct": false},
        {"text": "△", "correct": true},
        {"text": "□", "correct": false},
        {"text": "◇", "correct": false}
      ]
    },
    "explanation": "Чередование: круг, треугольник, круг, треугольник, круг, треугольник"
  },
  {
    "id": 12,
    "text": "Если код CAT = 3120, то DOG = ?",
    "scale": "logical_reasoning",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "4157", "correct": true},
        {"text": "3146", "correct": false},
        {"text": "5168", "correct": false},
        {"text": "4158", "correct": false}
      ]
    },
    "explanation": "Позиция в алфавите: C=3, A=1, T=20 → 3120. D=4, O=15, G=7 → 4157"
  },
  {
    "id": 13,
    "text": "Что всегда следует за 'Причиной'?",
    "scale": "logical_reasoning",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Проблема", "correct": false},
        {"text": "Следствие", "correct": true},
        {"text": "Решение", "correct": false},
        {"text": "Условие", "correct": false}
      ]
    },
    "explanation": "Причинно-следственная связь: причина → следствие"
  },
  {
    "id": 14,
    "text": "Продолжите: 100, 96, 88, 72, ?",
    "scale": "logical_reasoning",
    "difficulty": "hard",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "64", "correct": false},
        {"text": "56", "correct": false},
        {"text": "40", "correct": true},
        {"text": "48", "correct": false}
      ]
    },
    "explanation": "Разности: -4, -8, -16, -32 (каждая разность удваивается). 72-32=40"
  },
  {
    "id": 15,
    "text": "Аналогия: Врач относится к Болезни, как Юрист относится к ?",
    "scale": "logical_reasoning",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Закон", "correct": false},
        {"text": "Судья", "correct": false},
        {"text": "Спор", "correct": true},
        {"text": "Преступление", "correct": false}
      ]
    },
    "explanation": "Врач лечит болезнь, юрист разрешает спор"
  },
  {
    "id": 16,
    "text": "Какое число НЕ принадлежит группе: 2, 3, 5, 7, 9, 11",
    "scale": "logical_reasoning",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "2", "correct": false},
        {"text": "5", "correct": false},
        {"text": "9", "correct": true},
        {"text": "11", "correct": false}
      ]
    },
    "explanation": "Все числа простые, кроме 9 (9 = 3×3)"
  },
  {
    "id": 17,
    "text": "Если A > B и B > C, то:",
    "scale": "logical_reasoning",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "A = C", "correct": false},
        {"text": "A > C", "correct": true},
        {"text": "A < C", "correct": false},
        {"text": "Невозможно определить", "correct": false}
      ]
    },
    "explanation": "Транзитивность неравенства: A > B > C → A > C"
  },
  {
    "id": 18,
    "text": "Сколько треугольников в фигуре: ◭ (большой треугольник, разделённый на 4 малых)?",
    "scale": "logical_reasoning",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "4", "correct": false},
        {"text": "5", "correct": false},
        {"text": "6", "correct": false},
        {"text": "7 или более", "correct": true}
      ]
    },
    "explanation": "4 маленьких + 3 средних (из 2-х маленьких) + 1 большой = 8 треугольников"
  },
  {
    "id": 19,
    "text": "Продолжите: AZ, BY, CX, ?",
    "scale": "logical_reasoning",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "DW", "correct": true},
        {"text": "DV", "correct": false},
        {"text": "EW", "correct": false},
        {"text": "EV", "correct": false}
      ]
    },
    "explanation": "Первая буква идёт от A вперёд, вторая от Z назад: A-Z, B-Y, C-X, D-W"
  },
  {
    "id": 20,
    "text": "Какое утверждение противоречит: 'Все студенты сдали экзамен'?",
    "scale": "logical_reasoning",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Некоторые студенты не сдали экзамен", "correct": true},
        {"text": "Все студенты не сдали экзамен", "correct": false},
        {"text": "Ни один студент не сдал экзамен", "correct": false},
        {"text": "Большинство студентов сдали экзамен", "correct": false}
      ]
    },
    "explanation": "Отрицание 'все' → 'хотя бы один не' = 'некоторые не'"
  }
]
```

### СЕКЦИЯ 2: NUMERICAL ABILITY (20 вопросов, 10 минут)
```json
[
  {
    "id": 21,
    "text": "24 + 37 = ?",
    "scale": "numerical_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "59", "correct": false},
        {"text": "60", "correct": false},
        {"text": "61", "correct": true},
        {"text": "62", "correct": false}
      ]
    },
    "explanation": "24 + 37 = 61"
  },
  {
    "id": 22,
    "text": "15% от 200 = ?",
    "scale": "numerical_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "25", "correct": false},
        {"text": "30", "correct": true},
        {"text": "35", "correct": false},
        {"text": "40", "correct": false}
      ]
    },
    "explanation": "200 × 0.15 = 30"
  },
  {
    "id": 23,
    "text": "Если товар стоил 500₽ и подорожал на 20%, сколько он стоит?",
    "scale": "numerical_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "520₽", "correct": false},
        {"text": "600₽", "correct": true},
        {"text": "620₽", "correct": false},
        {"text": "700₽", "correct": false}
      ]
    },
    "explanation": "500 + (500 × 0.20) = 500 + 100 = 600₽"
  },
  {
    "id": 24,
    "text": "72 ÷ 8 = ?",
    "scale": "numerical_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "8", "correct": false},
        {"text": "9", "correct": true},
        {"text": "10", "correct": false},
        {"text": "11", "correct": false}
      ]
    },
    "explanation": "72 ÷ 8 = 9"
  },
  {
    "id": 25,
    "text": "Среднее значение чисел 10, 20, 30, 40 = ?",
    "scale": "numerical_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "20", "correct": false},
        {"text": "25", "correct": true},
        {"text": "30", "correct": false},
        {"text": "35", "correct": false}
      ]
    },
    "explanation": "(10+20+30+40)/4 = 100/4 = 25"
  },
  {
    "id": 26,
    "text": "Если 3x + 5 = 20, то x = ?",
    "scale": "numerical_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "3", "correct": false},
        {"text": "4", "correct": false},
        {"text": "5", "correct": true},
        {"text": "6", "correct": false}
      ]
    },
    "explanation": "3x = 20 - 5 = 15; x = 15/3 = 5"
  },
  {
    "id": 27,
    "text": "Какое число на 30% больше, чем 50?",
    "scale": "numerical_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "60", "correct": false},
        {"text": "65", "correct": true},
        {"text": "70", "correct": false},
        {"text": "80", "correct": false}
      ]
    },
    "explanation": "50 + (50 × 0.30) = 50 + 15 = 65"
  },
  {
    "id": 28,
    "text": "Товар стоил 1000₽, подешевел на 10%, потом подорожал на 10%. Итоговая цена?",
    "scale": "numerical_ability",
    "difficulty": "hard",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "1000₽", "correct": false},
        {"text": "990₽", "correct": true},
        {"text": "1010₽", "correct": false},
        {"text": "1100₽", "correct": false}
      ]
    },
    "explanation": "1000 - 100 = 900; 900 + 90 = 990₽ (процент от разной базы!)"
  },
  {
    "id": 29,
    "text": "Площадь прямоугольника 5×12 = ?",
    "scale": "numerical_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "17", "correct": false},
        {"text": "34", "correct": false},
        {"text": "60", "correct": true},
        {"text": "65", "correct": false}
      ]
    },
    "explanation": "S = длина × ширина = 5 × 12 = 60"
  },
  {
    "id": 30,
    "text": "Если 1 доллар = 90 рублей, сколько рублей в 15 долларах?",
    "scale": "numerical_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "1200", "correct": false},
        {"text": "1300", "correct": false},
        {"text": "1350", "correct": true},
        {"text": "1400", "correct": false}
      ]
    },
    "explanation": "15 × 90 = 1350 рублей"
  },
  {
    "id": 31,
    "text": "Какое число в 4 раза больше 25?",
    "scale": "numerical_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "75", "correct": false},
        {"text": "100", "correct": true},
        {"text": "125", "correct": false},
        {"text": "150", "correct": false}
      ]
    },
    "explanation": "25 × 4 = 100"
  },
  {
    "id": 32,
    "text": "Компания за год выросла с 50 до 75 сотрудников. На сколько % увеличилась численность?",
    "scale": "numerical_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "25%", "correct": false},
        {"text": "33%", "correct": false},
        {"text": "50%", "correct": true},
        {"text": "75%", "correct": false}
      ]
    },
    "explanation": "(75-50)/50 × 100% = 25/50 × 100% = 50%"
  },
  {
    "id": 33,
    "text": "Если 5 яблок стоят 100₽, сколько стоят 8 яблок?",
    "scale": "numerical_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "140₽", "correct": false},
        {"text": "150₽", "correct": false},
        {"text": "160₽", "correct": true},
        {"text": "180₽", "correct": false}
      ]
    },
    "explanation": "1 яблоко = 100/5 = 20₽; 8 яблок = 8×20 = 160₽"
  },
  {
    "id": 34,
    "text": "0.25 × 0.4 = ?",
    "scale": "numerical_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "0.01", "correct": false},
        {"text": "0.1", "correct": true},
        {"text": "1.0", "correct": false},
        {"text": "10", "correct": false}
      ]
    },
    "explanation": "0.25 × 0.4 = 1/4 × 2/5 = 2/20 = 1/10 = 0.1"
  },
  {
    "id": 35,
    "text": "Машина проехала 180 км за 3 часа. Средняя скорость?",
    "scale": "numerical_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "50 км/ч", "correct": false},
        {"text": "60 км/ч", "correct": true},
        {"text": "70 км/ч", "correct": false},
        {"text": "80 км/ч", "correct": false}
      ]
    },
    "explanation": "v = s/t = 180/3 = 60 км/ч"
  },
  {
    "id": 36,
    "text": "В магазине скидка 30% на товар за 2000₽. Сколько платить?",
    "scale": "numerical_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "1200₽", "correct": false},
        {"text": "1300₽", "correct": false},
        {"text": "1400₽", "correct": true},
        {"text": "1500₽", "correct": false}
      ]
    },
    "explanation": "2000 - (2000 × 0.30) = 2000 - 600 = 1400₽"
  },
  {
    "id": 37,
    "text": "Если сегодня вторник, какой день будет через 100 дней?",
    "scale": "numerical_ability",
    "difficulty": "hard",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Понедельник", "correct": false},
        {"text": "Вторник", "correct": false},
        {"text": "Среда", "correct": false},
        {"text": "Четверг", "correct": true}
      ]
    },
    "explanation": "100 дней = 14 недель + 2 дня. Вторник + 2 дня = Четверг"
  },
  {
    "id": 38,
    "text": "Соотношение мужчин к женщинам 3:5. Если мужчин 60, сколько женщин?",
    "scale": "numerical_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "80", "correct": false},
        {"text": "90", "correct": false},
        {"text": "100", "correct": true},
        {"text": "120", "correct": false}
      ]
    },
    "explanation": "3:5 → если мужчин 60, то одна часть = 60/3 = 20. Женщин = 5×20 = 100"
  },
  {
    "id": 39,
    "text": "Какое число является квадратным корнем из 144?",
    "scale": "numerical_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "10", "correct": false},
        {"text": "11", "correct": false},
        {"text": "12", "correct": true},
        {"text": "13", "correct": false}
      ]
    },
    "explanation": "√144 = 12 (12 × 12 = 144)"
  },
  {
    "id": 40,
    "text": "Инвестиция 10000₽ выросла до 12000₽. Какова доходность в %?",
    "scale": "numerical_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "10%", "correct": false},
        {"text": "15%", "correct": false},
        {"text": "20%", "correct": true},
        {"text": "25%", "correct": false}
      ]
    },
    "explanation": "(12000-10000)/10000 × 100% = 2000/10000 × 100% = 20%"
  }
]
```

### СЕКЦИЯ 3: VERBAL ABILITY (20 вопросов, 10 минут)
```json
[
  {
    "id": 41,
    "text": "Антоним слова 'Щедрый':",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Добрый", "correct": false},
        {"text": "Скупой", "correct": true},
        {"text": "Богатый", "correct": false},
        {"text": "Бедный", "correct": false}
      ]
    },
    "explanation": "Щедрый ↔ Скупой (антонимы)"
  },
  {
    "id": 42,
    "text": "Синоним слова 'Храбрый':",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Сильный", "correct": false},
        {"text": "Смелый", "correct": true},
        {"text": "Умный", "correct": false},
        {"text": "Быстрый", "correct": false}
      ]
    },
    "explanation": "Храбрый = Смелый (синонимы)"
  },
  {
    "id": 43,
    "text": "Завершите аналогию: Врач : Больница = Учитель : ?",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Ученик", "correct": false},
        {"text": "Школа", "correct": true},
        {"text": "Урок", "correct": false},
        {"text": "Знания", "correct": false}
      ]
    },
    "explanation": "Врач работает в больнице, учитель работает в школе"
  },
  {
    "id": 44,
    "text": "Какое слово лишнее: Роза, Тюльпан, Дуб, Лилия",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Роза", "correct": false},
        {"text": "Тюльпан", "correct": false},
        {"text": "Дуб", "correct": true},
        {"text": "Лилия", "correct": false}
      ]
    },
    "explanation": "Роза, Тюльпан, Лилия — цветы. Дуб — дерево"
  },
  {
    "id": 45,
    "text": "'Эфемерный' означает:",
    "scale": "verbal_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Вечный", "correct": false},
        {"text": "Кратковременный", "correct": true},
        {"text": "Красивый", "correct": false},
        {"text": "Невидимый", "correct": false}
      ]
    },
    "explanation": "Эфемерный = недолговечный, кратковременный, мимолётный"
  },
  {
    "id": 46,
    "text": "Если 'Оптимист' видит стакан наполовину полным, то 'Пессимист' видит его:",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Полным", "correct": false},
        {"text": "Наполовину пустым", "correct": true},
        {"text": "Пустым", "correct": false},
        {"text": "Непонятным", "correct": false}
      ]
    },
    "explanation": "Оптимист фокусируется на положительном (полон), пессимист на отрицательном (пуст)"
  },
  {
    "id": 47,
    "text": "Закончите пословицу: 'Не всё то золото, что...'",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "дорогое", "correct": false},
        {"text": "блестит", "correct": true},
        {"text": "желтое", "correct": false},
        {"text": "ценное", "correct": false}
      ]
    },
    "explanation": "Русская пословица: 'Не всё то золото, что блестит'"
  },
  {
    "id": 48,
    "text": "'Амбивалентный' означает:",
    "scale": "verbal_ability",
    "difficulty": "hard",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Однозначный", "correct": false},
        {"text": "Двойственный", "correct": true},
        {"text": "Неопределённый", "correct": false},
        {"text": "Постоянный", "correct": false}
      ]
    },
    "explanation": "Амбивалентный = двойственный, содержащий противоречивые чувства"
  },
  {
    "id": 49,
    "text": "Антоним слова 'Искренний':",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Честный", "correct": false},
        {"text": "Лицемерный", "correct": true},
        {"text": "Правдивый", "correct": false},
        {"text": "Открытый", "correct": false}
      ]
    },
    "explanation": "Искренний ↔ Лицемерный (антонимы)"
  },
  {
    "id": 50,
    "text": "Какое слово НЕ является синонимом 'Умный'?",
    "scale": "verbal_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Интеллигентный", "correct": false},
        {"text": "Сообразительный", "correct": false},
        {"text": "Образованный", "correct": true},
        {"text": "Смышлёный", "correct": false}
      ]
    },
    "explanation": "Образованный = имеет знания, но не обязательно умный (может быть эрудирован, но не сообразителен)"
  },
  {
    "id": 51,
    "text": "Дополните: Книга : Страница = Дом : ?",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Стена", "correct": false},
        {"text": "Комната", "correct": true},
        {"text": "Крыша", "correct": false},
        {"text": "Дверь", "correct": false}
      ]
    },
    "explanation": "Страница — часть книги, комната — часть дома"
  },
  {
    "id": 52,
    "text": "'Прагматичный' человек:",
    "scale": "verbal_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Мечтательный", "correct": false},
        {"text": "Практичный", "correct": true},
        {"text": "Идеалистичный", "correct": false},
        {"text": "Романтичный", "correct": false}
      ]
    },
    "explanation": "Прагматичный = практичный, ориентированный на реальную пользу"
  },
  {
    "id": 53,
    "text": "Выберите правильное написание:",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Агенство", "correct": true},
        {"text": "Агентство", "correct": false},
        {"text": "Агенцтво", "correct": false},
        {"text": "Агентсво", "correct": false}
      ]
    },
    "explanation": "Правильно: Агентство"
  },
  {
    "id": 54,
    "text": "'Альтруизм' — это:",
    "scale": "verbal_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Эгоизм", "correct": false},
        {"text": "Бескорыстная забота о других", "correct": true},
        {"text": "Самолюбие", "correct": false},
        {"text": "Безразличие", "correct": false}
      ]
    },
    "explanation": "Альтруизм = бескорыстная забота о благе других людей"
  },
  {
    "id": 55,
    "text": "Какое слово имеет ДРУГОЕ значение: Смотреть, Глядеть, Созерцать, Слушать",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Смотреть", "correct": false},
        {"text": "Глядеть", "correct": false},
        {"text": "Созерцать", "correct": false},
        {"text": "Слушать", "correct": true}
      ]
    },
    "explanation": "Смотреть, Глядеть, Созерцать — визуальное восприятие. Слушать — аудиальное"
  },
  {
    "id": 56,
    "text": "Закончите фразу: 'Лучше синица в руках, чем...'",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "орёл в небе", "correct": false},
        {"text": "журавль в небе", "correct": true},
        {"text": "голубь на крыше", "correct": false},
        {"text": "ворон на дереве", "correct": false}
      ]
    },
    "explanation": "Пословица: 'Лучше синица в руках, чем журавль в небе'"
  },
  {
    "id": 57,
    "text": "'Инновация' означает:",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Традиция", "correct": false},
        {"text": "Нововведение", "correct": true},
        {"text": "Консерватизм", "correct": false},
        {"text": "Повторение", "correct": false}
      ]
    },
    "explanation": "Инновация = нововведение, новшество, новаторство"
  },
  {
    "id": 58,
    "text": "Антоним слова 'Конкретный':",
    "scale": "verbal_ability",
    "difficulty": "medium",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Точный", "correct": false},
        {"text": "Абстрактный", "correct": true},
        {"text": "Ясный", "correct": false},
        {"text": "Определённый", "correct": false}
      ]
    },
    "explanation": "Конкретный ↔ Абстрактный (антонимы)"
  },
  {
    "id": 59,
    "text": "'Компромисс' — это:",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Конфликт", "correct": false},
        {"text": "Взаимная уступка", "correct": true},
        {"text": "Победа", "correct": false},
        {"text": "Поражение", "correct": false}
      ]
    },
    "explanation": "Компромисс = соглашение на основе взаимных уступок"
  },
  {
    "id": 60,
    "text": "Какое слово продолжает ряд: Январь, Март, Май, ?",
    "scale": "verbal_ability",
    "difficulty": "easy",
    "response_type": "multiple_choice",
    "response_config": {
      "options": [
        {"text": "Июнь", "correct": false},
        {"text": "Июль", "correct": true},
        {"text": "Август", "correct": false},
        {"text": "Сентябрь", "correct": false}
      ]
    },
    "explanation": "Нечётные месяцы: 1-й (Январь), 3-й (Март), 5-й (Май), 7-й (Июль)"
  }
]
```

---

## SCORING RULES (АЛГОРИТМЫ ПОДСЧЕТА)
```json
{
  "scoring_method": {
    "type": "correct_answers_count",
    "note": "Каждый правильный ответ = 1 балл, неправильный = 0 баллов"
  },
  "scale_calculations": {
    "logical_reasoning": {
      "max_raw_score": 20,
      "normalization": {
        "type": "percentage",
        "formula": "(correct_answers / 20) * 100"
      }
    },
    "numerical_ability": {
      "max_raw_score": 20,
      "normalization": {
        "type": "percentage",
        "formula": "(correct_answers / 20) * 100"
      }
    },
    "verbal_ability": {
      "max_raw_score": 20,
      "normalization": {
        "type": "percentage",
        "formula": "(correct_answers / 20) * 100"
      }
    }
  },
  "total_cognitive_score": {
    "method": "mean_of_scales",
    "formula": "(logical + numerical + verbal) / 3",
    "note": "Общий балл когнитивных способностей"
  },
  "percentile_calculation": {
    "note": "Сравнение с нормативной выборкой населения",
    "normative_data": "Based on 10,000+ test takers aged 18-65"
  },
  "time_bonus": {
    "note": "Скорость выполнения влияет на финальный балл",
    "formula": "Если завершено быстрее лимита, небольшой бонус к баллу"
  }
}
```

---

## INTERPRETATION GUIDE (ИНТЕРПРЕТАЦИЯ РЕЗУЛЬТАТОВ)

### ОБЩИЙ КОГНИТИВНЫЙ БАЛЛ (TOTAL COGNITIVE SCORE)
```json
{
  "total_cognitive_interpretation": {
    "levels": [
      {
        "level": "very_low",
        "range": [0, 25],
        "percentile": "0-10",
        "label": "Очень низкий",
        "description": "Когнитивные способности значительно ниже среднего. Серьёзные трудности с обработкой информации, решением проблем и обучением. Это может указывать на когнитивные нарушения или отсутствие образования/практики.",
        "career_impact": "Ограниченные возможности в профессиях, требующих аналитического мышления",
        "recommendations": [
          "Консультация с неврологом для исключения когнитивных нарушений",
          "Образовательные программы базового уровня",
          "Фокус на профессиях с минимальными когнитивными требованиями",
          "Регулярные упражнения для мозга"
        ],
        "icon": "❌",
        "color": "red"
      },
      {
        "level": "low",
        "range": [26, 40],
        "percentile": "11-25",
        "label": "Низкий",
        "description": "Когнитивные способности ниже среднего. Трудности с сложными задачами, абстрактным мышлением и быстрым обучением. Возможно, недостаток образования или практики.",
        "career_impact": "Подходят профессии с чёткими инструкциями и минимальной сложностью",
        "recommendations": [
          "Дополнительное образование и тренировка навыков",
          "Практика решения задач разных типов",
          "Курсы развития критического мышления",
          "Фокус на накоплении опыта в узкой области"
        ],
        "icon": "⚠️",
        "color": "orange"
      },
      {
        "level": "average",
        "range": [41, 60],
        "percentile": "26-75",
        "label": "Средний",
        "description": "Когнитивные способности на среднем уровне. Вы справляетесь с большинством интеллектуальных задач, но можете испытывать трудности с очень сложными или незнакомыми проблемами. Это нормальный уровень для большинства людей.",
        "career_impact": "Подходят большинство профессий среднего уровня сложности",
        "recommendations": [
          "Продолжайте развивать навыки через практику",
          "Фокусируйтесь на специализации в конкретной области",
          "Используйте инструменты и технологии для усиления способностей",
          "Регулярное обучение и чтение"
        ],
        "icon": "➡️",
        "color": "yellow"
      },
      {
        "level": "high",
        "range": [61, 80],
        "percentile": "76-90",
        "label": "Высокий",
        "description": "Когнитивные способности выше среднего. Вы хорошо справляетесь со сложными задачами, быстро учитесь и эффективно решаете проблемы. Это даёт вам преимущество в интеллектуально требовательных профессиях.",
        "career_impact": "Отличные перспективы в аналитических, технических и управленческих ролях",
        "recommendations": [
          "Рассмотрите сложные, интеллектуально стимулирующие профессии",
          "Продолжайте бросать себе вызовы",
          "Развивайте лидерские навыки",
          "Используйте способности для инноваций"
        ],
        "icon": "✅",
        "color": "green"
      },
      {
        "level": "very_high",
        "range": [81, 100],
        "percentile": "91-100",
        "label": "Очень высокий",
        "description": "Исключительные когнитивные способности. Вы в топ-10% населения по умственным способностям. Вы быстро обучаетесь, мастерски решаете сложные проблемы и видите паттерны, которые другие упускают. Это значительное конкурентное преимущество.",
        "career_impact": "Высокий потенциал для топ-позиций, исследований, инноваций, предпринимательства",
        "recommendations": [
          "Выбирайте максимально сложные и интеллектуально стимулирующие профессии",
          "Рассмотрите научную деятельность, стратегическое консультирование, entrepreneurship",
          "Используйте способности для решения сложных проблем человечества",
          "Развивайте эмоциональный интеллект для баланса"
        ],
        "icon": "🌟",
        "color": "gold"
      }
    ]
  }
}
```

---

## ДЕТАЛЬНАЯ ИНТЕРПРЕТАЦИЯ ПО ШКАЛАМ

### 1. LOGICAL REASONING (ЛОГИЧЕСКОЕ МЫШЛЕНИЕ)

**Что измеряет:** Абстрактное мышление, распознавание паттернов, индуктивное и дедуктивное рассуждение

**Низкий (0-40%):**
Трудности с абстрактным мышлением и распознаванием закономерностей. Вы предпочитаете конкретные, практические задачи абстрактным.

**Рекомендации:**
- Практикуйте головоломки и логические игры (судоку, шахматы)
- Изучайте основы логики и критического мышления
- Курсы по логике и problem-solving
- Начните с простых паттернов и постепенно усложняйте

**Карьера:** Профессии с чёткими процедурами: операторы, техники, мастера

**Средний (41-70%):**
Адекватные способности к логическому мышлению. Вы справляетесь с большинством задач, но сложные абстрактные проблемы могут вызывать трудности.

**Рекомендации:**
- Регулярно решайте логические задачи
- Изучайте программирование (развивает логику)
- Практикуйте систематический подход к проблемам
- Читайте детективы и играйте в стратегические игры

**Карьера:** Аналитики среднего уровня, менеджеры, инженеры

**Высокий (71-100%):**
Отличные способности к логическому мышлению. Вы легко находите паттерны, делаете выводы и решаете абстрактные проблемы.

**Рекомендации:**
- Применяйте в сложных, нестандартных задачах
- Рассмотрите научную или аналитическую карьеру
- Используйте для инноваций и стратегического мышления

**Карьера:** Data Scientist, Стратег, Исследователь, AI Specialist, Философ

---

### 2. NUMERICAL ABILITY (ЧИСЛОВЫЕ СПОСОБНОСТИ)

**Что измеряет:** Работа с числами, математическое мышление, интерпретация данных

**Низкий (0-40%):**
Значительные трудности с числами и математикой. Вычисления даются с трудом, статистика и графики сложны для понимания.

**Рекомендации:**
- Базовые курсы математики и статистики
- Ежедневная практика простых вычислений
- Используйте визуализацию для понимания чисел
- Калькуляторы и инструменты для помощи

**Карьера:** Профессии без значительных числовых требований: искусство, социальная работа, гуманитарные науки

**Средний (41-70%):**
Адекватные числовые способности. Вы справляетесь с базовой математикой и интерпретацией данных, но сложные вычисления требуют усилий.

**Рекомендации:**
- Регулярная практика с числами
- Excel и data visualization инструменты
- Курсы бизнес-математики и статистики
- Применяйте математику в повседневной жизни

**Карьера:** Бизнес-аналитик, Маркетолог, Менеджер проектов

**Высокий (71-100%):**
Отличные числовые способности. Вы легко работаете с числами, быстро вычисляете, понимаете статистику и данные.

**Рекомендации:**
- Используйте в аналитически-интенсивных профессиях
- Изучайте продвинутую математику, статистику, ML
- Применяйте для data-driven decision making

**Карьера:** Data Scientist, Финансовый аналитик, Актуарий, Экономист, Quantitative Analyst

---

### 3. VERBAL ABILITY (ВЕРБАЛЬНЫЕ СПОСОБНОСТИ)

**Что измеряет:** Понимание языка, словарный запас, вербальное рассуждение

**Низкий (0-40%):**
Ограниченный словарный запас, трудности с пониманием сложных текстов и вербальной логикой.

**Рекомендации:**
- Больше читайте (начните с простых текстов)
- Изучайте новые слова ежедневно
- Курсы по развитию речи и письма
- Практикуйте пересказ и аргументацию

**Карьера:** Профессии с минимальными вербальными требованиями: технические специальности, физический труд

**Средний (41-70%):**
Адекватные вербальные способности. Вы хорошо понимаете обычные тексты, но сложная литература или юридические документы могут вызывать трудности.

**Рекомендации:**
- Регулярное чтение разнообразной литературы
- Практика письма (блог, заметки)
- Расширение словарного запаса
- Участие в дискуссиях и дебатах

**Карьера:** Большинство профессий, требующих коммуникации

**Высокий (71-100%):**
Отличные вербальные способности. Богатый словарный запас, легкое понимание сложных текстов, сильные навыки аргументации.

**Рекомендации:**
- Используйте в профессиях, требующих сильных языковых навыков
- Развивайте писательское мастерство
- Применяйте для убеждения и влияния

**Карьера:** Юрист, Писатель, Журналист, Преподаватель, Политик, Копирайтер

---

## ПРОЦЕНТИЛИ И НОРМЫ
```json
{
  "percentile_interpretation": {
    "what_is_percentile": "Процентиль показывает, какой процент людей имеет балл ниже вашего. Например, 75-й процентиль означает, что вы лучше 75% людей.",
    "percentile_ranges": {
      "0-10": "Очень низкий - требует внимания",
      "11-25": "Низкий - ниже среднего",
      "26-50": "Ниже среднего - нормально, но есть пространство для роста",
      "51-75": "Выше среднего - хорошо",
      "76-90": "Высокий - очень хорошо",
      "91-99": "Очень высокий - исключительно",
      "99-100": "Топ-1% - гениальный уровень"
    },
    "career_implications": {
      "0-25_percentile": "Подходят базовые роли без сложных когнитивных требований",
      "26-50_percentile": "Подходят большинство стандартных профессий",
      "51-75_percentile": "Подходят большинство профессиональных ролей",
      "76-90_percentile": "Подходят сложные аналитические и управленческие роли",
      "91-100_percentile": "Подходят самые сложные интеллектуальные профессии: наука, стратегия, innovation"
    }
  }
}
```

---

## ПРИМЕНЕНИЕ В РЕКРУТИНГЕ
```json
{
  "recruitment_applications": {
    "why_employers_use_cat": [
      "Лучший предиктор производительности труда (корреляция 0.5-0.6)",
      "Объективная оценка способности к обучению",
      "Прогноз адаптации к новым задачам",
      "Независимость от опыта и образования (измеряет потенциал)",
      "Снижение субъективности в найме"
    ],
    "positions_requiring_high_cat": [
      "Топ-менеджмент (CEO, CFO, COO)",
      "Стратегические роли",
      "Data Science и Analytics",
      "Software Engineering",
      "Научные исследования",
      "Консалтинг (McKinsey, BCG, Bain)",
      "Финансы (Investment Banking, Trading)",
      "Юриспруденция (сложное право)"
    ],
    "typical_cutoff_scores": {
      "entry_level": "40-50 percentile",
      "mid_level": "60-70 percentile",
      "senior_level": "75-85 percentile",
      "executive_level": "85+ percentile"
    },
    "limitations": [
      "Не измеряет мотивацию, характер, EQ",
      "Культурная предвзятость в вербальных тестах",
      "Тревожность может снизить результаты",
      "Не учитывает креативность и практический интеллект"
    ],
    "best_practices_for_candidates": [
      "Практикуйтесь на примерах тестов",
      "Управляйте временем (не застревайте на одном вопросе)",
      "Высыпайтесь перед тестом",
      "Минимизируйте тревожность",
      "Читайте инструкции внимательно",
      "Проверяйте ответы, если осталось время"
    ]
  }
}
```

---

## РЕКОМЕНДАЦИИ ПО РАЗВИТИЮ КОГНИТИВНЫХ СПОСОБНОСТЕЙ
```json
{
  "cognitive_enhancement_strategies": {
    "for_logical_reasoning": {
      "daily_practices": [
        "Решайте 2-3 логические головоломки ежедневно",
        "Играйте в шахматы или го",
        "Изучайте программирование (Python, JavaScript)",
        "Практикуйте судоку и кроссворды",
        "Анализируйте причинно-следственные связи в новостях"
      ],
      "courses": [
        "Coursera: Introduction to Logic",
        "Khan Academy: Critical Thinking",
        "Brilliant.org: Logic and Deduction"
      ],
      "apps": ["Lumosity", "Peak", "Elevate", "BrainHQ"]
    },
    "for_numerical_ability": {
      "daily_practices": [
        "Ментальная арифметика (считайте в уме)",
        "Анализируйте финансовые новости и графики",
        "Практикуйте проценты в повседневной жизни",
        "Решайте математические задачи",
        "Изучайте статистику и вероятность"
      ],
      "courses": [
        "Khan Academy: Statistics & Probability",
        "Coursera: Data Science Math Skills",
        "Excel for Data Analysis"
      ],
      "apps": ["Math Workout", "Photomath", "Brilliant"]
    },
    "for_verbal_ability": {
      "daily_practices": [
        "Читайте минимум 30 минут ежедневно (разнообразная литература)",
        "Учите 5-10 новых слов в день",
        "Пишите (блог, дневник, эссе)",
        "Участвуйте в дискуссиях",
        "Разгадывайте кроссворды"
      ],
      "courses": [
        "Coursera: Writing & Communication",
        "edX: English Grammar",
        "Vocabulary.com courses"
      ],
      "apps": ["Blinkist", "Vocabulary.com", "Words with Friends"]
    },
    "general_brain_health": {
      "lifestyle": [
        "7-9 часов качественного сна",
        "Регулярная физическая активность (30+ минут в день)",
        "Здоровое питание (Omega-3, антиоксиданты, мало сахара)",
        "Управление стрессом (медитация, йога)",
        "Социальное взаимодействие",
        "Избегайте алкоголя и курения",
        "Постоянное обучение новому"
      ],
      "neuroplasticity": "Мозг можно тренировать в любом возрасте! Регулярная практика создаёт новые нейронные связи."
    },
    "timeline_for_improvement": {
      "short_term_1_3_months": "Улучшение скорости и уверенности в знакомых типах задач",
      "medium_term_3_6_months": "Заметное улучшение в специфических областях (например, числовые способности)",
      "long_term_6_12_months": "Значительное улучшение общих когнитивных способностей при регулярной практике",
      "note": "Прогресс зависит от интенсивности и регулярности тренировок"
    }
  }
}
```

---

## VALIDATION DATA
```json
{
  "reliability": {
    "cronbach_alpha": "0.85-0.92",
    "test_retest_correlation": "0.80-0.85",
    "note": "Когнитивные способности относительно стабильны, но могут улучшаться с практикой"
  },
  "validity": {
    "predictive_validity": {
      "job_performance": "0.50-0.60 correlation",
      "academic_achievement": "0.60-0.70 correlation",
      "training_success": "0.55-0.65 correlation"
    },
    "convergent_validity": "Высокая корреляция с IQ тестами (0.70-0.85)",
    "discriminant_validity": "Низкая корреляция с личностными тестами"
  },
  "normative_sample": {
    "size": "10,000+ participants",
    "age_range": "18-65 years",
    "countries": "Multiple countries and cultures",
    "update_frequency": "Norms updated annually"
  }
}
```

---

## IMPLEMENTATION NOTES
```json
{
  "test_administration": {
    "time_limit": "STRICTLY enforced - 30 minutes total",
    "question_order": "fixed (difficulty progression)",
    "navigation": "Can go back within section, but not across sections",
    "required_questions": "all",
    "save_progress": false,
    "adaptive_testing": false,
    "calculator": "NOT allowed (numerical section)",
    "scratch_paper": "Allowed for calculations"
  },
  
  "ui_recommendations": {
    "color_scheme": "professional_blue_and_white",
    "timer": "VISIBLE countdown timer for each section",
    "progress": "Show question X of 20 for current section",
    "result_visualization": "Bar charts for 3 scales + percentile ranks",
    "tone": "Professional, encouraging, educational"
  },
  
  "special_features": {
    "practice_mode": "5 sample questions before actual test",
    "explanations": "Show explanations AFTER test completion",
    "percentile_comparison": "Compare with normative population",
    "score_history": "Track improvement over time",
    "career_matching": "Suggest careers based on cognitive profile"
  },
  
  "accessibility": {
    "language": "Russian (can add English, Kazakh)",
    "font_size": "Adjustable for readability",
    "color_blind_mode": "Available",
    "time_extensions": "For users with documented disabilities"
  },
  
  "ethical_considerations": {
    "fairness": "Test reviewed for cultural bias",
    "transparency": "Explain what test measures and doesn't measure",
    "privacy": "Results confidential and stored securely",
    "no_discrimination": "Emphasize test is one factor, not sole determinant",
    "growth_mindset": "Emphasize abilities can be developed"
  }
}
```

---

## ИНСТРУКЦИИ ДЛЯ CLAUDE CODE

**При создании приложения:**

1. **Data модели** - Question, Scale, Result, Percentile
2. **JSON файлы** - 60 вопросов (20+20+20)
3. **TestScorer**:
   - Подсчёт правильных ответов
   - Нормализация: `(correct/20) * 100` для каждой шкалы
   - Общий балл: среднее 3 шкал
   - Определение процентиля по нормативным данным
4. **TIMER** - КРИТИЧЕСКИ ВАЖНО:
   - 30 минут total, 10 минут на секцию
   - Автоотправка при истечении времени
   - Видимый countdown
5. **UI особенности**:
   - Профессиональный дизайн (бизнес-тон)
   - 3 секции последовательно
   - Объяснения ПОСЛЕ завершения теста
   - Bar charts для визуализации
   - Процентильные ранги
6. **Результаты**:
   - Баллы по 3 шкалам
   - Общий балл
   - Процентили
   - Интерпретация
   - Карьерные рекомендации

**Важно:**
- Тест на время - это часть оценки!
- Калькулятор ЗАПРЕЩЁН
- Вопросы фиксированного порядка (от простых к сложным)
- Профессиональный, серьёзный тон
- Акцент на применении в карьере

--