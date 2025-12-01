# Revision History - Detailed Changes

> **См. также:** [CHANGELOG.md](../CHANGELOG.md) для полной истории версий приложения

**Последнее обновление:** 2025-12-01
**Текущая версия:** 3.26.0

---

## Недавние изменения (Последние 10 версий)

### v3.26.0 (2025-12-01) - Conflict Communication Style Test

**Новый тест:** Conflict Communication Style (Стили поведения в конфликте)
- 45 вопросов, 5 стилей конфликтного поведения, ~12 минут
- **Based on:** Thomas-Kilmann Conflict Mode Instrument (TKI)
- **Теоретическая основа:** 2-мерная модель (Напористость × Кооперативность)
- **5 Conflict Styles:** Avoiding, Accommodating, Competing, Compromising, Collaborating
- **5 Profiles:** Полная структура с 7-секционными профилями для каждого стиля
- **Ситуационные вопросы:** 45 жизненных ситуаций (работа, семья, друзья, незнакомцы)
- **Multi-choice format:** Каждый вопрос с 5 вариантами, каждый соответствует одному стилю

**Технические детали:**
- Created 3 files: test stub (140 lines), data file (2,722 lines), weights file (1,031 lines → 248 lines after fix)
- **Integration:** 11 файлов изменено
- **Важное исправление:** Переработана логика multi-choice тестов - теперь показываются конкретные вопросы, а не агрегаты
- **Scale Coverage:** 32 шкалы (24 hierarchical + 8 personality type poles)
- **Codebase growth:** ~59,000 → ~63,000 lines (+6.8%)

**Критические исправления:**
1. Удалены 45 невалидных шкал (не существующих в hierarchical_scales.dart)
2. Исправлено использование биполярных полюсов (extraversion/introversion вместо personality_type_ei)
3. Переработана архитектура: отдельные вопросы вместо factor aggregates

### v3.25.0 (2025-12-01) - Attachment Styles Test

**Новый тест:** Attachment Styles in Relationships
- 60 вопросов, 4 стиля привязанности, ~12 минут
- **Теория:** Боулби (1969), Эйнсворт, Хазан и Шейвер
- **4 Styles:** Secure, Anxious, Avoidant, Fearful
- **5 Profiles:** включая Mixed attachment
- **Scale Coverage:** ~85 шкал (44% из 195)
- **Bipolar Integration:** 11 весов для personality type
- **Codebase growth:** ~56,600 → ~59,000 lines (+4.2%)

### v3.24.0 (2025-11-30) - Values and Priorities Test

**Новый тест:** Personal Values and Life Priorities
- 40 вопросов, 10 измерений ценностей, ~10 минут
- **Dual Measurement:** Importance vs Energy
- **10 Dimensions:** Security, Freedom, Achievement, Creativity, и др.
- **8 Profiles:** Aligned, Values Without Action, Energy Misaligned, и др.
- **Теория:** Schwartz Values Theory
- **Bipolar:** Все 4 шкалы (E/I, S/N, T/F, J/P) - 20 весов
- **Codebase growth:** ~54,000 → ~56,600 lines (+4.8%)

### v3.23.0 (2025-11-30) - Merge: Profile System + Color Psychology + Perfectionism

**MAJOR MERGE:**
- Объединение универсальной системы профилей
- Улучшения Color Psychology Test
- Perfectionism Fear of Error Test (40 вопросов, 5 факторов)
- **ProfileService:** 22 теста с автоматическими профилями
- **Всего тестов:** 25 (22 std + 2 special + 1 profile)

### v3.22.0 (2025-11-30) - Universal Profile System

**MAJOR INFRASTRUCTURE:**
- **ProfileService:** Централизованная система для всех тестов
- **TestProfile модель:** Стандартизированная структура
- **7 секций профиля:** название, обоснование, сильные стороны, уязвимости, рекомендации, действие, вывод
- **Автоматическое отображение:** в test_result_screen.dart без дополнительного кода
- **21 тест с профилями:** автоматическая поддержка
- **Документация v3.4.0:** 78-пунктовый чеклист + PROFILES_SUMMARY.md
- **Codebase growth:** ~50,000 → ~53,000+ lines

### v3.21.0 (2025-11-23) - Merge: 4 Tests

**Объединены 4 теста из параллельных веток:**
- Cognitive Ability (60 questions, binary scoring)
- Romantic Potential (36 questions, 7-section structure)
- Relationship Compatibility (24 questions, 3 profiles)
- Friendship Psychology (24 questions, 13 profiles)
- **Всего:** 24 теста (21 std + 2 special + 1 profile)

### v3.20.0-3.19.0 series (2025-11-23)

Параллельные ветки с добавлением 4 тестов:
- v3.20.0: Cognitive Ability Test
- v3.19.0-a: Romantic Potential Test
- v3.19.0-b: Relationship Compatibility Test
- v3.19.0-c: Friendship Psychology Test

### v3.18.0 (2025-11-23) - Merge: Career + Depression + Confidence

**Объединены:**
- Digital Career Fit (18 questions, 6 directions)
- Depression Symptoms Inventory (27 questions, 5 factors)
- Self Confidence Multiscale (36 questions from remote)
- **Documentation v3.3.0:** ADDING_TEST_RESULTS.md, 75-point checklist

### v3.17.0 (2025-11-23) - Digital Career Fit + 7-Section Results

**Первый тест с 7-секционной структурой результатов:**
- 18 вопросов, 6 карьерных направлений
- 7 Career Profiles с детальными описаниями
- **Документация:** ADDING_TEST_RESULTS.md (NEW)

### v3.16.0 (2025-11-23) - Depression Symptoms Inventory

- 27 вопросов, 5 факторов (emotional, cognitive, motivational, somatic, social)
- 4-point frequency scale (0-3)
- Integration в 7 точек приложения

---

## Статистика роста

| Версия | Дата | Строк кода | Тестов | Прирост |
|--------|------|------------|--------|---------|
| v1.0.0 | 2025-10-28 | 10,347 | 1 | - |
| v3.0.0 | 2025-11-08 | 15,000 | 6 | +45% |
| v3.10.0 | 2025-11-16 | 31,000 | 12 | +200% |
| v3.15.0 | 2025-11-23 | 38,000 | 16 | +267% |
| v3.20.0 | 2025-11-23 | 44,000 | 20 | +325% |
| v3.22.0 | 2025-11-30 | 53,000 | 24 | +412% |
| v3.26.0 | 2025-12-01 | 63,000 | 27 | +509% |

---

## Ключевые вехи

### Архитектурные решения

**v3.5.0:** Legacy Dart выбран для стандартных тестов
**v3.13.0:** Первый специальный тест - Color Psychology
**v3.14.0-career:** Второй специальный тест - Career Compass
**v3.17.0:** Первая 7-секционная структура результатов
**v3.22.0:** Универсальная система профилей (ProfileService)

### Технический долг

**v3.7.0:** Burnout test - добавлен расширенный анализ ошибок
**v3.9.0:** CRITICAL FIX биполярных шкал
**v3.10.0:** Модульная документация (ADDING_NEW_TEST)

---

**См. [CHANGELOG.md](../CHANGELOG.md) для полной истории всех изменений.**
