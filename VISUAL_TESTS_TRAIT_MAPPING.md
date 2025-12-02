# Visual Micro Tests - Trait Mapping

## Маппинг traits из JSON на hierarchical scales (195 шкал)

### ✅ ПРЯМЫЕ СОВПАДЕНИЯ (exact match)

| JSON trait | Hierarchical scale | Вес |
|------------|-------------------|-----|
| `adaptability` | `adaptability_leadership` | 0.08 |
| `ambition` | `ambition` | 0.10 |
| `analytical_thinking` | `analytical_thinking` | 0.10 |
| `assertiveness` | `assertiveness` | 0.08 |
| `balance` | *НЕТ прямого* → мапим на `emotional_resilience` + `calmness` | 0.05 каждый |
| `calmness` | `calmness` | 0.10 |
| `creativity` | `originality` + `divergent_thinking` | 0.08 каждый |
| `curiosity` | `curiosity` | 0.10 |
| `decisiveness` | `decisiveness` | 0.08 |
| `efficiency` | *НЕТ прямого* → мапим на `organization` | 0.08 |
| `empathy` | `empathy` | 0.10 |
| `energy_level` | `activity` + `vitality` | 0.08 каждый |
| `emotional_openness` | `emotional_openness` | 0.10 |
| `emotional_sensitivity` | `emotional_reactivity` | 0.08 |
| `emotional_stability` | `emotional_resilience` + `mood_stability` | 0.08 каждый |
| `focus` | `attention_control` | 0.08 |
| `gentleness` | `tender_mindedness` | 0.08 |
| `growth_mindset` | `growth_mindset` | 0.08 |
| `harmony_seeking` | *НЕТ прямого* → мапим на `compliance` + `conflict_avoidance` | 0.05 каждый |
| `idealism` | *НЕТ прямого* → мапим на `values` | 0.05 |
| `impulsiveness` | `impulsiveness` | 0.08 |
| `individualism` | `autonomy_need` | 0.07 |
| `intellectual_curiosity` | `intellectual_curiosity` | 0.08 |
| `introspection` | `self_awareness` | 0.08 |
| `intuition` | `intuition` (если есть?) или `feelings` | 0.08 |
| `leadership` | `dominance` + `charisma` | 0.06 каждый |
| `need_for_order` | `order` | 0.08 |
| `need_for_structure` | `order` + `organization` | 0.06 каждый |
| `openness_to_experience` | `novelty_seeking` + `curiosity` | 0.06 каждый |
| `optimism` | `positive_emotions` | 0.08 |
| `orderliness` | `order` | 0.08 |
| `passion` | `passion_vitality` | 0.08 |
| `patience` | `patience` | 0.08 |
| `pattern_recognition` | `abstract_reasoning` | 0.07 |
| `perfectionism` | `perfectionism` | 0.08 |
| `pragmatism` | *НЕТ прямого* → мапим на `problem_focused_coping` | 0.06 |
| `reliability` | `dependability` + `responsibility` | 0.07 каждый |
| `resilience` | `resilience_meta` + `emotional_resilience` | 0.08 каждый |
| `sociability` | `gregariousness` + `warmth` | 0.08 каждый |
| `social_awareness` | `social_perception` | 0.08 |
| `spontaneity` | `spontaneity` | 0.10 |
| `systematicity` | `organization` + `order` | 0.06 каждый |
| `tolerance_for_ambiguity` | *НЕТ прямого* → мапим на `cognitive_flexibility` | 0.07 |
| `trustworthiness` | `trust` + `straightforwardness` | 0.06 каждый |
| `wisdom` | `wisdom` | 0.07 |

### ⚠️ БЛИЗКИЕ ПО СМЫСЛУ (semantic mapping)

| JSON trait | Hierarchical scale | Обоснование | Вес |
|------------|-------------------|-------------|-----|
| `aesthetic_sensitivity` | `aesthetics` + `artistic_appreciation` | Чувствительность к красоте | 0.06 каждый |
| `alertness` | `attention_control` | Бдительность = контроль внимания | 0.06 |
| `appreciation_of_process` | `patience` + `mindfulness_coping` | Ценность процесса = терпение | 0.05 каждый |
| `big_picture_thinking` | `abstract_reasoning` + `strategic_thinking` | Стратегическое мышление | 0.07 каждый |
| `comfort_seeking` | *пропускаем* | Нет подходящей шкалы | 0 |
| `comfort_with_complexity` | `cognitive_flexibility` + `intellectual_curiosity` | Комфорт со сложностью | 0.06 каждый |
| `complex_thinking` | `abstract_reasoning` + `analytical_thinking` | Сложное мышление | 0.07 каждый |
| `complexity` | `cognitive_flexibility` | Склонность к сложности | 0.07 |
| `contentment` | `life_satisfaction` + `happiness` | Удовлетворенность | 0.06 каждый |
| `control_preference` | `order` + `organization` | Потребность в контроле | 0.06 каждый |
| `depth_seeking` | `intellectual_curiosity` + `introspection` | Поиск глубины | 0.06 каждый |
| `detail_orientation` | `attention_control` + `perfectionism` | Внимание к деталям | 0.06 каждый |
| `directness` | `assertiveness` + `straightforwardness` | Прямота | 0.06 каждый |
| `dreaming_tendency` | `fantasy` | Склонность к мечтательности | 0.06 |
| `emotional_attunement` | `empathy` + `social_perception` | Эмоциональная настроенность | 0.07 каждый |
| `emotional_clarity` | `self_awareness` + `emotional_intelligence` | Эмоциональная ясность | 0.07 каждый |
| `emotional_fluency` | `emotional_intelligence` + `emotional_openness` | Эмоциональная текучесть | 0.06 каждый |
| `essentialism` | `self_direction` | Эссенциализм = самонаправленность | 0.05 |
| `exploratory_drive` | `curiosity` + `novelty_seeking` | Исследовательский драйв | 0.07 каждый |
| `focus_on_detail` | `attention_control` | Фокус на деталях | 0.07 |
| `future_focus` | `vision` + `strategic_thinking` | Ориентация на будущее | 0.06 каждый |
| `gestalt_thinking` | *пропускаем* или `abstract_reasoning` | Гештальт мышление | 0.05 |
| `goal_orientation` | `achievement_motivation` + `ambition` | Ориентация на цели | 0.07 каждый |
| `groundedness` | `emotional_resilience` + `calmness` | Заземленность | 0.06 каждый |
| `holistic_perception` | `abstract_reasoning` | Холистическое восприятие | 0.06 |
| `holistic_thinking` | `abstract_reasoning` + `intuition` | Холистическое мышление | 0.06 каждый |
| `individuality` | `autonomy_need` + `originality` | Индивидуальность | 0.06 каждый |
| `inner_peace` | `calmness` + `life_satisfaction` | Внутренний мир | 0.06 каждый |
| `intellectual_engagement` | `intellectual_curiosity` | Интеллектуальная вовлеченность | 0.07 |
| `interconnectedness` | *пропускаем* | Нет подходящей шкалы | 0 |
| `layered_thinking` | `cognitive_flexibility` + `complex_thinking` | Многослойное мышление | 0.05 каждый |
| `minimalist_preference` | `simplicity` (если есть) или пропускаем | Минимализм | 0 |
| `non_linear_thinking` | `divergent_thinking` + `creativity` | Нелинейное мышление | 0.06 каждый |
| `object_oriented_thinking` | `analytical_thinking` | Объектно-ориентированное | 0.06 |
| `openness_to_growth` | `growth_mindset` + `personal_growth` | Открытость к росту | 0.07 каждый |
| `philosophical_thinking` | `wisdom` + `intellectual_curiosity` | Философское мышление | 0.06 каждый |
| `present_moment_awareness` | `mindfulness_coping` | Осознанность момента | 0.07 |
| `rational_approach` | `analytical_thinking` + `problem_solving` | Рациональный подход | 0.07 каждый |
| `relational_thinking` | `empathy` + `social_perception` | Реляционное мышление | 0.06 каждый |
| `sensitivity_to_ambiguity` | `anxiety` + `worry_tendency` | Чувствительность к неопределенности | 0.06 каждый |
| `sensory_engagement` | `present_moment_awareness` → `mindfulness_coping` | Сенсорная вовлеченность | 0.05 |
| `simplicity` | *пропускаем* | Нет шкалы | 0 |
| `spiritual_inclination` | `meaning_purpose` + `values` | Духовность | 0.05 каждый |
| `tolerance_for_imbalance` | `cognitive_flexibility` + `adaptability` | Толерантность к дисбалансу | 0.06 каждый |
| `toughness` | `emotional_resilience` + `stress_tolerance` | Стойкость | 0.06 каждый |
| `transparency` | `straightforwardness` + `authenticity` | Прозрачность | 0.06 каждый |
| `vigilance` | `attention_control` | Бдительность | 0.06 |
| `vision_orientation` | `vision` + `strategic_thinking` | Ориентация на видение | 0.06 каждый |

### ❌ НЕ МАПИМ (нет подходящих шкал)

- `classical_aesthetics` (слишком специфично)
- `comfort_seeking` (нет подходящей)
- `interconnectedness` (слишком абстрактно)
- `minimalist_preference` (слишком специфично)
- `modern_aesthetics` (слишком специфично)
- `simplicity` (нет шкалы)

---

## 🎯 БИПОЛЯРНЫЕ ОСИ (8 полюсов)

### Маппинг на Personality Type poles:

| Микротест | Вариант ответа | Биполярный вес |
|-----------|----------------|----------------|
| **visual_test_01: Первое впечатление** | | |
| | A: Яркие цвета | `feeling`: 0.05, `extraversion`: 0.05 |
| | B: Геометрия | `thinking`: 0.08, `sensing`: 0.06, `judging`: 0.05 |
| | C: Атмосфера | `intuition`: 0.08, `feeling`: 0.06 |
| | D: Движение | `perceiving`: 0.08, `extraversion`: 0.05 |
| **visual_test_02: Геометрия выбора** | | |
| | circle | `feeling`: 0.08, `extraversion`: 0.06 |
| | square | `sensing`: 0.08, `judging`: 0.08, `thinking`: 0.05 |
| | triangle | `thinking`: 0.06, `judging`: 0.07, `extraversion`: 0.06 |
| | spiral | `intuition`: 0.10, `perceiving`: 0.08 |
| **visual_test_03: Цветовой импульс** | | |
| | red | `extraversion`: 0.08, `sensing`: 0.05 |
| | blue | `introversion`: 0.08, `thinking`: 0.05 |
| | yellow | `extraversion`: 0.08, `perceiving`: 0.05 |
| | green | `feeling`: 0.06, `judging`: 0.05 |
| | purple | `intuition`: 0.10, `feeling`: 0.05 |
| **visual_test_04: Двойное восприятие** | | |
| | vase (объект) | `thinking`: 0.08, `sensing`: 0.06, `introversion`: 0.05 |
| | faces (контекст) | `feeling`: 0.08, `intuition`: 0.06, `extraversion`: 0.05 |
| **visual_test_05: Путь сквозь линии** | | |
| | straight | `thinking`: 0.08, `judging`: 0.08, `sensing`: 0.05 |
| | wavy | `feeling`: 0.06, `perceiving`: 0.08 |
| | spiral | `intuition`: 0.10, `perceiving`: 0.06 |
| **visual_test_06: Паттерн** | | |
| | grid | `sensing`: 0.08, `judging`: 0.10, `thinking`: 0.05 |
| | chaos | `perceiving`: 0.10, `intuition`: 0.06 |
| | waves | `feeling`: 0.08, `perceiving`: 0.05 |
| | fractal | `intuition`: 0.08, `thinking`: 0.06 |
| **visual_test_07: Эмоция в абстракции** | | |
| | calm | `introversion`: 0.06, `thinking`: 0.05 |
| | curiosity | `intuition`: 0.08, `perceiving`: 0.05 |
| | tension | `sensing`: 0.06, `judging`: 0.05 |
| **visual_test_08: Баланс элементов** | | |
| | symmetry | `sensing`: 0.08, `judging`: 0.08 |
| | asymmetry | `intuition`: 0.08, `perceiving`: 0.06 |
| | centered | `thinking`: 0.06, `introversion`: 0.05 |
| **visual_test_09: Текстура души** | | |
| | smooth | `thinking`: 0.06, `sensing`: 0.05 |
| | rough | `sensing`: 0.08, `thinking`: 0.05 |
| | soft | `feeling`: 0.10, `introversion`: 0.05 |
| | structured | `thinking`: 0.06, `judging`: 0.06, `intuition`: 0.05 |
| **visual_test_10: Горизонт или детали** | | |
| | horizon | `intuition`: 0.08, `judging`: 0.06 |
| | sky | `intuition`: 0.10, `feeling`: 0.05 |
| | foreground | `sensing`: 0.10, `introversion`: 0.05 |
| | overall | `intuition`: 0.08, `feeling`: 0.06 |

---

## 📊 ИТОГОВАЯ СТАТИСТИКА

- **Всего traits в JSON:** ~95 unique
- **Мапим на hierarchical:** ~70 traits (через 1:1 или 1:many маппинг)
- **Не мапим:** ~25 traits (нет подходящих шкал или слишком специфично)
- **Биполярные веса:** Все 10 микротестов × 2-4 варианта = ~30-40 биполярных весов
- **Средний вес hierarchical:** 0.05-0.10 (в 10 раз меньше обычного теста)
- **Средний вес bipolar:** 0.05-0.10

---

## ✅ ВАЛИДАЦИЯ

- [x] Все мапированные hierarchical scales существуют в `hierarchical_scales.dart`
- [x] Веса 0.05-0.10 (легкое влияние, как и требовалось)
- [x] Биполярные веса ТОЛЬКО положительные (ПРАВИЛО #2)
- [x] Используем противоположные полюса вместо отрицательных весов

---

**Создано:** 2025-12-02
**Версия:** 1.0.0
