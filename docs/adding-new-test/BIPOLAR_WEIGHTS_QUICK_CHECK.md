# 🔍 Быстрая проверка биполярных весов

> **Краткая памятка для проверки баланса T/F и J/P**
> **Версия:** 1.0.0
> **Дата:** 2025-12-01

## ⚡ Зачем это нужно?

**Ошибка #16** - самая частая проблема при добавлении новых тестов:
- Тест влияет на E/I и S/N, но **НЕ влияет** на T/F и J/P
- Пользователи видят неполный тип личности (например, только "E_" или "_N_P")
- Summary screen показывает 0% или неизменные значения для Thinking/Feeling и Judging/Perceiving

## 📊 Минимальные требования

| Измерение | Минимум | Оптимально | Почему |
|-----------|---------|------------|---------|
| **E/I** | 6-8 | 10-12 | Экстраверсия vs Интроверсия - базовое измерение |
| **S/N** | 6-8 | 10-12 | Сенсорика vs Интуиция - базовое измерение |
| **T/F** | **10-12** | **14-16** | Thinking vs Feeling - требует больше данных ⚠️ |
| **J/P** | **15-20** | **22-26** | Judging vs Perceiving - самое сложное измерение ⚠️ |

### ⚠️ Почему J/P требует больше вопросов?

**J/P - самое сложное для определения**, потому что:
1. Проявляется в **поведении**, а не в предпочтениях
2. **Контекстно-зависимое** (работа vs личная жизнь)
3. Легко спутать с другими чертами (тревожность ≠ judging)
4. Требует больше данных для точности

## 🚀 Быстрая команда проверки

```bash
# Сохраните как check_bipolar_balance.sh в корне проекта
#!/bin/bash

TEST_ID="$1"  # Например: motivational_strategies_v1

if [ -z "$TEST_ID" ]; then
  echo "Usage: bash check_bipolar_balance.sh <test_id>"
  echo "Example: bash check_bipolar_balance.sh motivational_strategies_v1"
  exit 1
fi

WEIGHTS_FILE="lib/config/summary/question_weights/${TEST_ID//_v1/}_weights.dart"

if [ ! -f "$WEIGHTS_FILE" ]; then
  echo "❌ File not found: $WEIGHTS_FILE"
  exit 1
fi

echo "╔══════════════════════════════════════════════════════════╗"
echo "║  Проверка баланса биполярных весов для $TEST_ID"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# Подсчет весов
EI_COUNT=$(grep -E "'(extraversion|introversion)'" "$WEIGHTS_FILE" | grep -c "$TEST_ID")
SN_COUNT=$(grep -E "'(sensing|intuition)'" "$WEIGHTS_FILE" | grep -c "$TEST_ID")
TF_COUNT=$(grep -E "'(thinking|feeling)'" "$WEIGHTS_FILE" | grep -c "$TEST_ID")
JP_COUNT=$(grep -E "'(judging|perceiving)'" "$WEIGHTS_FILE" | grep -c "$TEST_ID")

# Вывод результатов
echo "📊 Результаты:"
echo "─────────────────────────────────────────────────────────"

# E/I
if [ $EI_COUNT -ge 6 ]; then
  echo "✅ E/I: $EI_COUNT весов (минимум: 6-8)"
else
  echo "❌ E/I: $EI_COUNT весов (минимум: 6-8) ⚠️ МАЛО!"
fi

# S/N
if [ $SN_COUNT -ge 6 ]; then
  echo "✅ S/N: $SN_COUNT весов (минимум: 6-8)"
else
  echo "❌ S/N: $SN_COUNT весов (минимум: 6-8) ⚠️ МАЛО!"
fi

# T/F
if [ $TF_COUNT -ge 10 ]; then
  echo "✅ T/F: $TF_COUNT весов (минимум: 10-12)"
elif [ $TF_COUNT -ge 6 ]; then
  echo "⚠️  T/F: $TF_COUNT весов (минимум: 10-12) ⚠️ НЕДОСТАТОЧНО!"
else
  echo "❌ T/F: $TF_COUNT весов (минимум: 10-12) ❌ КРИТИЧНО МАЛО!"
fi

# J/P
if [ $JP_COUNT -ge 15 ]; then
  echo "✅ J/P: $JP_COUNT весов (минимум: 15-20)"
elif [ $JP_COUNT -ge 10 ]; then
  echo "⚠️  J/P: $JP_COUNT весов (минимум: 15-20) ⚠️ НЕДОСТАТОЧНО!"
else
  echo "❌ J/P: $JP_COUNT весов (минимум: 15-20) ❌ КРИТИЧНО МАЛО!"
fi

echo "─────────────────────────────────────────────────────────"

# Итоговый статус
if [ $EI_COUNT -ge 6 ] && [ $SN_COUNT -ge 6 ] && [ $TF_COUNT -ge 10 ] && [ $JP_COUNT -ge 15 ]; then
  echo ""
  echo "🎉 ВСЕ ПРОВЕРКИ ПРОЙДЕНЫ! Баланс биполярных весов соблюден."
  echo ""
  exit 0
else
  echo ""
  echo "⚠️  ВНИМАНИЕ! Баланс биполярных весов НЕ соблюден."
  echo "    См. Ошибку #16 в ADDING_TEST_ERRORS.md"
  echo ""
  exit 1
fi
```

## 💡 Какие вопросы добавлять?

### Thinking vs Feeling (T/F)

**Thinking (логика, объективность):**
- ✅ "Я предпочитаю анализировать, а не чувствовать"
- ✅ "Мне важна правда, даже если она неприятна"
- ✅ "Я могу отстраниться от эмоций при принятии решений"
- ✅ "Логические ошибки раздражают меня больше, чем грубость"

**Feeling (эмпатия, гармония):**
- ✅ "Я чувствую эмоции других людей"
- ✅ "Мне важно сохранять гармонию в отношениях"
- ✅ "Я забочусь о других, даже забывая о себе"
- ✅ "Критика воспринимается мной болезненно"

### Judging vs Perceiving (J/P)

**Judging (планирование, структура):**
- ✅ "Я предпочитаю иметь четкий план"
- ✅ "Неопределенность вызывает у меня тревогу"
- ✅ "Я всегда довожу дела до конца"
- ✅ "Мне важна пунктуальность и порядок"
- ✅ "Я критикую себя за ошибки"

**Perceiving (гибкость, спонтанность):**
- ✅ "Я держу несколько вариантов открытыми"
- ✅ "Мне сложно переносить скуку и рутину"
- ✅ "Я легко адаптируюсь к изменениям"
- ✅ "Я откладываю принятие решений"
- ✅ "Мне трудно сказать 'нет'"

## 📝 Пример из Motivational Strategies Test

**Отличный баланс биполярных весов:**
- E/I: **8 вопросов** (5 extraversion + 3 introversion) ✅
- S/N: **7 вопросов** (3 sensing + 4 intuition) ✅
- T/F: **13 вопросов** (7 thinking + 6 feeling) ✅✅
- J/P: **22 вопроса** (11 judging + 11 perceiving) ✅✅

**Итого:** 50 уникальных вопросов с биполярными весами (55% от 90 вопросов)

### Пример вопроса с несколькими биполярными весами:

```dart
'motivational_strategies_v1:q2': {
  'extraversion': 0.6, // Altruist - social interaction (E/I)
  'feeling': 0.8,      // Altruist - helping others (T/F)
},
```

## ⚠️ Типичная ошибка - дубликаты ключей

**❌ НЕПРАВИЛЬНО** (Ошибка #15):
```dart
static const Map<String, Map<String, double>> bipolarWeights = {
  'test_v1:q2': {'extraversion': 0.6},
  'test_v1:q2': {'feeling': 0.8},  // ❌ ДУБЛИКАТ!
};
```

**✅ ПРАВИЛЬНО:**
```dart
static const Map<String, Map<String, double>> bipolarWeights = {
  'test_v1:q2': {
    'extraversion': 0.6, // E/I
    'feeling': 0.8,      // T/F
  },
};
```

## 🔗 См. также

- **[ADDING_TEST_ERRORS.md](./ADDING_TEST_ERRORS.md)** - Ошибка #15 и #16
- **[ADDING_TEST_RULES.md](./ADDING_TEST_RULES.md)** - ПРАВИЛО #9 о биполярных весах
- **[ADDING_TEST_CHECKLIST.md](./ADDING_TEST_CHECKLIST.md)** - ФАЗА 3, пункты 28-30

---

**Дата создания:** 2025-12-01
**Автор:** Claude Code (на основе опыта добавления 28 тестов)
**Версия:** 1.0.0
