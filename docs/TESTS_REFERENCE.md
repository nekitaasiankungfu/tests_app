# Tests Reference - Полный каталог психологических тестов

> **Детальная информация о всех 24 психологических тестах приложения**
> Последнее обновление: 2025-11-30

## Содержание

1. [Обзор тестовой архитектуры](#обзор-тестовой-архитектуры)
2. [Категории тестов](#категории-тестов)
3. [Стандартные тесты (21)](#стандартные-тесты-21)
4. [Специальные тесты (2)](#специальные-тесты-2)
5. [Профильные тесты (4)](#профильные-тесты-4)

---

## Обзор тестовой архитектуры

**Всего тестов:** 24
- **Стандартные тесты:** 21 (вопрос-ответ формат с Likert шкалами)
- **Специальные тесты:** 2 (визуальные/интерактивные с кастомным UI)
- **Профильные тесты:** 4 (multi-choice с 7-секционной структурой результатов)

**Архитектура реализации:**
- 22 Legacy Dart тестов (прямая интеграция данных)
- 2 JSON теста (self_esteem_test, stress_test)

---

## Категории тестов

### 🎭 Типология личности (3 теста)
- IPIP Big Five (50 вопросов)
- 16 Personality Types (80 вопросов)
- DISC Personality (56 вопросов)

### 🧠 Темперамент (3 теста)
- Fisher Temperament (56 вопросов)
- Temperament Profile (60 вопросов)
- Social Battery (40 вопросов)

### ❤️ Отношения (5 тестов)
- Love Profile (60 вопросов)
- Love Languages (30 вопросов)
- Romantic Potential (36 вопросов) - ПРОФИЛЬНЫЙ
- Relationship Compatibility (24 вопроса) - ПРОФИЛЬНЫЙ
- Friendship Psychology (24 вопроса) - ПРОФИЛЬНЫЙ

### 🌟 Эмоциональное состояние (8 тестов)
- Stress Test (JSON)
- Self-Esteem Test (JSON)
- Digital Detox (50 вопросов)
- Burnout Diagnostic (54 вопроса)
- Color Psychology (6 этапов) - СПЕЦИАЛЬНЫЙ
- Anxiety Symptoms Inventory (24 вопроса)
- Depression Symptoms Inventory (27 вопросов)
- Self Confidence Multiscale (36 вопросов)

### 💼 Карьера (4 теста)
- Holland Code RIASEC (60 вопросов)
- Career Compass (56 forced_choice) - СПЕЦИАЛЬНЫЙ
- Digital Career Fit (18 вопросов) - ПРОФИЛЬНЫЙ
- Cognitive Ability (60 вопросов)

---

## Стандартные тесты (21)

### 1. IPIP Big Five (50 вопросов)
- **Время:** 10-12 минут
- **Факторы:** 5 (Openness, Conscientiousness, Extraversion, Agreeableness, Neuroticism)
- **Файлы:**
  - Stub: `lib/data/tests/ipip_big_five_test.dart`
  - Data: `lib/data/ipip_big_five_data.dart`
  - Weights: `lib/config/summary/question_weights/simple_tests_weights.dart`

### 2. 16 Personality Types (80 вопросов)
- **Время:** 15-20 минут
- **Факторы:** 4 биполярных (E/I, S/N, T/F, J/P)
- **Особенность:** Основной тест для определения типа личности
- **Файлы:**
  - Stub: `lib/data/tests/sixteen_types_test.dart`
  - Data: `lib/data/sixteen_types_data.dart`
  - Weights: `lib/config/summary/question_weights/sixteen_types_weights.dart`

### 3. DISC Personality (56 вопросов)
- **Время:** 12 минут
- **Факторы:** 4 (Dominance, Influence, Steadiness, Conscientiousness)
- **Файлы:**
  - Stub: `lib/data/tests/disc_personality_test.dart`
  - Data: `lib/data/disc_personality_data.dart`
  - Weights: `lib/config/summary/question_weights/disc_personality_weights.dart`

### 4. Fisher Temperament (56 вопросов)
- **Время:** 12-15 минут
- **Факторы:** 4 (Explorer, Builder, Director, Negotiator)
- **Файлы:**
  - Stub: `lib/data/tests/fisher_temperament_test.dart`
  - Data: `lib/data/fisher_temperament_data.dart`
  - Weights: `lib/config/summary/question_weights/fisher_temperament_weights.dart`

### 5. Temperament Profile (60 вопросов)
- **Время:** 10-15 минут
- **Факторы:** 6 (Energy, Emotional Stability, Self-Control, Social Openness, Tempo, Flexibility)
- **Файлы:**
  - Stub: `lib/data/tests/temperament_profile_test.dart`
  - Data: `lib/data/temperament_profile_test_data.dart`
  - Weights: `lib/config/summary/question_weights/temperament_profile_test_weights.dart`

### 6. Social Battery (40 вопросов)
- **Время:** 10 минут
- **Факторы:** 6 (Social Energy, Recharge Style, Group Dynamics, Communication Style, Social Boundaries, Energy Management)
- **Файлы:**
  - Stub: `lib/data/tests/social_battery_test.dart`
  - Data: `lib/data/social_battery_data.dart`
  - Weights: `lib/config/summary/question_weights/social_battery_weights.dart`

### 7. Love Profile (60 вопросов)
- **Время:** 15 минут
- **Факторы:** 6 (Romantic Idealism, Physical Affection, Emotional Depth, Communication Style, Trust & Loyalty, Independence vs Togetherness)
- **Файлы:**
  - Stub: `lib/data/tests/love_profile_test.dart`
  - Data: отсутствует (Legacy Dart)
  - Weights: `lib/config/summary/question_weights/love_profile_weights.dart`

### 8. Love Languages (30 вопросов)
- **Время:** 8 минут
- **Факторы:** 5 (Words of Affirmation 💬, Quality Time ⏰, Receiving Gifts 🎁, Acts of Service 🤝, Physical Touch 🤗)
- **Файлы:**
  - Stub: `lib/data/tests/love_languages_test.dart`
  - Data: `lib/data/love_languages_data.dart`
  - Weights: `lib/config/summary/question_weights/love_languages_weights.dart`

### 9. Stress Test (JSON)
- **Время:** 5 минут
- **Особенность:** Один из двух тестов в JSON формате
- **Файлы:**
  - Stub: `lib/data/tests/stress_test.dart`
  - JSON: `assets/tests/stress_test.json`

### 10. Self-Esteem Test (JSON)
- **Время:** 5 минут
- **Особенность:** Один из двух тестов в JSON формате
- **Файлы:**
  - Stub: `lib/data/tests/self_esteem_test.dart`
  - JSON: `assets/tests/self_esteem_test.json`

### 11. Digital Detox (50 вопросов)
- **Время:** 10 минут
- **Факторы:** 7 (Dependency Level, Attention Control, Social Impact, Physical Health, Productivity Loss, Emotional State, Usage Patterns)
- **Файлы:**
  - Stub: `lib/data/tests/digital_detox_test.dart`
  - Data: `lib/data/digital_detox_data.dart`
  - Weights: `lib/config/summary/question_weights/digital_detox_weights.dart`

### 12. Burnout Diagnostic (54 вопроса)
- **Время:** 12 минут
- **Факторы:** 7 (Emotional Exhaustion, Depersonalization, Reduced Efficacy, Physical Symptoms, Cognitive Impairment, Motivation Loss, Work Environment)
- **Особенность:** 10 обратных вопросов
- **Файлы:**
  - Stub: `lib/data/tests/burnout_diagnostic_test.dart`
  - Data: `lib/data/burnout_diagnostic_data.dart`
  - Weights: `lib/config/summary/question_weights/burnout_diagnostic_weights.dart`

### 13. Anxiety Symptoms Inventory (24 вопроса)
- **Время:** 5 минут
- **Факторы:** 4 (Somatic, Cognitive, Affective, Behavioral)
- **Шкала:** 4-точечная интенсивности (0-3)
- **Файлы:**
  - Stub: `lib/data/tests/anxiety_symptoms_inventory_test.dart`
  - Data: `lib/data/anxiety_symptoms_inventory_data.dart`
  - Weights: `lib/config/summary/question_weights/anxiety_symptoms_inventory_weights.dart`

### 14. Depression Symptoms Inventory (27 вопросов)
- **Время:** 7 минут
- **Факторы:** 5 (Emotional, Cognitive, Motivational, Somatic, Social)
- **Шкала:** 4-точечная частоты (0-3)
- **Файлы:**
  - Stub: `lib/data/tests/depression_symptoms_inventory_test.dart`
  - Data: `lib/data/depression_symptoms_inventory_data.dart`
  - Weights: `lib/config/summary/question_weights/depression_symptoms_inventory_weights.dart`

### 15. Self Confidence Multiscale (36 вопросов)
- **Время:** 8 минут
- **Факторы:** 6
- **Файлы:**
  - Stub: `lib/data/tests/self_confidence_multiscale_test.dart`
  - Data: `lib/data/self_confidence_multiscale_data.dart`
  - Weights: `lib/config/summary/question_weights/self_confidence_multiscale_weights.dart`

### 16. Holland Code RIASEC (60 вопросов)
- **Время:** 12-15 минут
- **Факторы:** 6 (Realistic, Investigative, Artistic, Social, Enterprising, Conventional)
- **Файлы:**
  - Stub: `lib/data/tests/holland_code_test.dart`
  - Data: `lib/data/holland_code_data.dart`
  - Weights: `lib/config/summary/question_weights/holland_code_weights.dart`

### 17. Cognitive Ability (60 вопросов)
- **Время:** 30 минут
- **Факторы:** 3 (Logical Reasoning, Numerical Ability, Verbal Ability)
- **Особенность:** Binary scoring (0/1), IQ-стиль с правильными ответами
- **Файлы:**
  - Stub: `lib/data/tests/cognitive_ability_test.dart`
  - Data: `lib/data/cognitive_ability_data.dart`
  - Weights: `lib/config/summary/question_weights/cognitive_ability_weights.dart`

---

## Специальные тесты (2)

### 1. Color Psychology Test (6 этапов)
- **Время:** 12-15 минут
- **Особенности:** Визуальный проективный тест, 34+ интеракций
- **6 Интерактивных этапов:**
  1. Быстрый выбор (30 сек, 3+3 цвета)
  2. Ранжирование (60 сек, drag-and-drop)
  3. Парные сравнения (2 мин, 20 пар из 45)
  4. Эмоциональные ассоциации (8 эмоций → цвета)
  5. Жизненные сферы (6 сфер + 4 ситуации)
  6. Временная перспектива (прошлое/настоящее/будущее)
- **12 психологических шкал**
- **Метрики консистентности между этапами**
- **Файлы:**
  - Model: `lib/models/color_psychology_model.dart`
  - Data: `lib/data/color_psychology_data.dart`
  - Service: `lib/services/color_psychology_service.dart`
  - Screen: `lib/screens/color_psychology_test_screen.dart`
  - Result: `lib/screens/color_psychology_result_screen.dart`
  - Widgets: 6 файлов в `lib/widgets/color_*`

### 2. Career Compass Test (56 вопросов)
- **Время:** 15 минут
- **Особенности:** Forced choice (парные сравнения A vs B)
- **8 карьерных шкал:** People, Analysis, Creation, Technology, Business, Nature, Order, Care
- **Ipsative scoring:** баллы распределяются между шкалами
- **Визуализация:** Радарная диаграмма
- **Файлы:**
  - Model: `lib/models/career_compass_model.dart`
  - Data: `lib/data/career_compass_data.dart`
  - Service: `lib/services/career_compass_service.dart`
  - Screen: `lib/screens/career_compass_test_screen.dart`
  - Result: `lib/screens/career_compass_result_screen.dart`
  - Widget: `lib/widgets/career_compass_question_widget.dart`

---

## Профильные тесты (4)

### 1. Digital Career Fit (18 вопросов)
- **Время:** 5 минут
- **Особенности:** Multi-choice (6 вариантов), 7-секционная структура результатов
- **6 карьерных направлений:**
  - Product Thinking
  - Data Analytics
  - Design UX
  - Content Marketing
  - Management Communication
  - Tech Development
- **7 карьерных профилей** с полной локализацией
- **7 секций результата:**
  1. Ваш цифровой профиль
  2. Почему именно он
  3. Ваши сильные стороны
  4. Подходящие направления/профессии
  5. Рекомендации по развитию
  6. Что попробовать сегодня
  7. Вдохновляющий вывод
- **Файлы:**
  - Stub: `lib/data/tests/digital_career_fit_test.dart`
  - Data: `lib/data/digital_career_fit_data.dart`
  - Weights: `lib/config/summary/question_weights/digital_career_fit_weights.dart`

### 2. Romantic Potential (36 вопросов)
- **Время:** 8 минут
- **Факторы:** 3 (Romantic Potential, Love Attitudes, Love Stories)
- **3 профиля:** Secure Romantic, Mixed Romantic, Romantic Challenges
- **12 обратных вопросов**
- **7-секционная структура результатов**
- **Файлы:**
  - Stub: `lib/data/tests/romantic_potential_test.dart`
  - Data: `lib/data/romantic_potential_data.dart`
  - Weights: `lib/config/summary/question_weights/romantic_potential_weights.dart`

### 3. Relationship Compatibility (24 вопроса)
- **Время:** 7 минут
- **Факторы:** 6 (Emotional Connection, Communication Style, Values Alignment, Relationship Expectations, Conflict Management, Intimacy & Romance)
- **3 профиля совместимости:**
  - Perfect Match (75-100%)
  - Good Potential (45-74%)
  - Needs Alignment (0-44%)
- **7-секционная структура результатов**
- **Файлы:**
  - Stub: `lib/data/tests/relationship_compatibility_test.dart`
  - Data: `lib/data/relationship_compatibility_data.dart`
  - Weights: `lib/config/summary/question_weights/relationship_compatibility_weights.dart`

### 4. Friendship Psychology (24 вопроса)
- **Время:** 7 минут
- **Факторы:** 6 (Emotional Closeness, Communication Style, Trust & Loyalty, Boundaries & Space, Supportive Behavior, Friendship Expectations)
- **13 профилей дружбы:**
  - Deep Intimate, Loyal Classic, Social Butterfly, Free Independent
  - Support Giver, Activity Partner, Mentor Guide, Equal Balance
  - Cautious Observer, Crisis Helper, Emotional Anchor, Growth Partner
  - Mixed Profile
- **7-секционная структура результатов с секцией уязвимостей**
- **Файлы:**
  - Stub: `lib/data/tests/friendship_psychology_test.dart`
  - Data: `lib/data/friendship_psychology_data.dart`
  - Weights: `lib/config/summary/question_weights/friendship_psychology_weights.dart`

---

## Статистика

- **Всего вопросов:** 1,065 (включая интерактивные элементы)
- **Всего факторов:** 118
- **Психологических шкал:** 195
- **Время прохождения всех тестов:** ~5 часов
- **Объем кода:** ~50,000+ строк
- **Языки:** Русский, Английский

---

## См. также

- [Руководство по добавлению тестов](adding-new-test/ADDING_NEW_TEST_INDEX.md)
- [Специальные тесты](adding-new-test/ADDING_SPECIAL_TESTS.md)
- [7-секционная структура](adding-new-test/ADDING_TEST_RESULTS.md)
- [Архитектура](ARCHITECTURE.md)