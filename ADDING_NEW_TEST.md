# Руководство по добавлению нового психологического теста

**Версия:** 2.3.0
**Дата:** 2025-01-09
**Архитектура:** Legacy Dart (оптимизировано для масштабирования до 100-200 тестов)
**Целевая аудитория:** Claude Code Assistant
**Статус:** ✅ ПРОВЕРЕНО - Burnout Diagnostic Test успешно добавлен (v2.3.0)
**Обновления:** Добавлены критические исправления scores (0-4) и MBTI весов

---

## ⚠️ КРИТИЧЕСКИЕ ПРАВИЛА - ОБЯЗАТЕЛЬНО К ПРОЧТЕНИЮ

**Прочитайте эту секцию перед добавлением любого теста! Эти правила предотвратят 80% возможных ошибок.**

### 🔴 ПРАВИЛО #1: Scores ДОЛЖНЫ быть 0-4 (НЕ 1-5!)

**Проблема:**
Если использовать scores от 1 до 5, минимальный балл будет 20% вместо 0%, а максимальный останется 100%.

**Пример ошибки:**
```dart
// ❌ НЕПРАВИЛЬНО:
AnswerModel(text: {'ru': 'Никогда'}, score: 1),  // минимум = 20%
AnswerModel(text: {'ru': 'Редко'}, score: 2),
AnswerModel(text: {'ru': 'Иногда'}, score: 3),
AnswerModel(text: {'ru': 'Часто'}, score: 4),
AnswerModel(text: {'ru': 'Всегда'}, score: 5),   // максимум = 100%
```

**Правильно:**
```dart
// ✅ ПРАВИЛЬНО:
AnswerModel(text: {'ru': 'Никогда'}, score: 0),  // минимум = 0%
AnswerModel(text: {'ru': 'Редко'}, score: 1),
AnswerModel(text: {'ru': 'Иногда'}, score: 2),
AnswerModel(text: {'ru': 'Часто'}, score: 3),
AnswerModel(text: {'ru': 'Всегда'}, score: 4),   // максимум = 100%
```

**Математика:**
- Минимальный балл теста из 54 вопросов:
  - Scores 1-5: `54 × 1 = 54` → `54/270 = 20%` ❌
  - Scores 0-4: `54 × 0 = 0` → `0/216 = 0%` ✅

**Где применяется:** Все answer methods во ВСЕХ тестах (Likert, frequency, intensity, etc.)

---

### 🔴 ПРАВИЛО #2: MBTI биполярные шкалы НЕ МОГУТ иметь отрицательные веса

**Проблема:**
MBTI шкалы - это биполярные оси (extraversion ↔ introversion). Отрицательный вес для extraversion не имеет смысла - это должен быть положительный вес для introversion.

**8 MBTI шкал (биполярные):**
- `extraversion` ↔ `introversion`
- `sensing` ↔ `intuition`
- `thinking` ↔ `feeling`
- `judging` ↔ `perceiving`

**Пример ошибки:**
```dart
// ❌ НЕПРАВИЛЬНО:
'burnout_diagnostic_v1:q1': QuestionWeight(
  axisWeights: {
    'anxiety': 1.2,
    'extraversion': -0.3,  // ❌ Отрицательный вес для биполярной шкалы!
  },
),
```

**Правильно:**
```dart
// ✅ ПРАВИЛЬНО:
'burnout_diagnostic_v1:q1': QuestionWeight(
  axisWeights: {
    'anxiety': 1.2,
    'introversion': 0.3,   // ✅ Положительный вес на противоположном полюсе
  },
),
```

**Правило инверсии биполярных весов:**
- `'extraversion': -0.3` → `'introversion': 0.3`
- `'sensing': -0.4` → `'intuition': 0.4`
- `'thinking': -0.5` → `'feeling': 0.5`
- `'judging': -0.3` → `'perceiving': 0.3`

**❗ ВАЖНО:** Другие шкалы (anxiety, vitality, stress_tolerance) МОГУТ иметь отрицательные веса - это показывает обратную связь (высокий burnout = низкая vitality).

---

### 🔴 ПРАВИЛО #3: summary_service.dart ДОЛЖЕН импортировать веса ВСЕХ тестов

**Проблема:**
Если веса теста не импортированы в `summary_service.dart`, биполярные MBTI шкалы на Summary экране не будут показывать влияние этого теста.

**Где находится:**
`lib/services/summary_service.dart` → метод `getQuestionsWithMBTIWeights()`

**Пример:**
```dart
// В summary_service.dart:
import '../config/summary/question_weights/burnout_diagnostic_weights.dart';  // ← ОБЯЗАТЕЛЬНО

Map<String, Map<String, List<Map<String, dynamic>>>> getQuestionsWithMBTIWeights(...) {
  final allWeights = <String, QuestionWeight>{
    ...IPIPBigFiveWeights.weights,
    ...FisherTemperamentWeights.weights,
    ...LoveProfileWeights.weights,
    ...SimpleTestsWeights.weights,
    ...SixteenTypesWeights.weights,
    ...TemperamentProfileTestWeights.weights,
    ...DigitalDetoxWeights.weights,
    ...BurnoutDiagnosticWeights.weights,  // ← ДОБАВИТЬ
  };
  // ...
}
```

**Проверка:** После добавления теста откройте Summary экран → биполярные шкалы → убедитесь, что новый тест указан в списке влияющих тестов.

---

### 🔴 ПРАВИЛО #4: Защита от NaN в расчетах

**Проблема:**
Division by zero или некорректные вычисления могут создать NaN значения, которые невозможно сохранить в JSON (SharedPreferences).

**Где добавлять защиту:**

1. **В Data файле (`getFactorInterpretation`):**
```dart
static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
  // Защита от NaN
  if (percentage.isNaN || percentage.isInfinite) {
    percentage = 0.0;
  }
  percentage = percentage.clamp(0.0, 100.0);

  // ... остальная логика
}
```

2. **В test_service.dart (уже реализовано):**
```dart
// В ScaleScoreAccumulator.getNormalizedScores():
if (score.isNaN || score.isInfinite) {
  appLogger.w('Invalid score for scale $scaleId. Setting to 0.0');
  score = 0.0;
}
score = score.clamp(0.0, 100.0);
```

**Симптом:** Ошибка "Converting object to an encodable object failed: NaN" при сохранении результатов.

---

### 📋 Критический чеклист перед коммитом

```markdown
ПЕРЕД СОЗДАНИЕМ PULL REQUEST:
□ Все scores в answer methods используют диапазон 0-4 (НЕ 1-5)
□ MBTI веса только положительные (negative weights конвертированы в opposite pole)
□ summary_service.dart импортирует новые веса
□ getFactorInterpretation() имеет NaN protection
□ flutter analyze проходит без ошибок
□ Визуально протестирован: минимальный score = 0%, максимальный = 100%
□ Summary Screen показывает новый тест в биполярных шкалах
```

---

## Содержание

1. [⚠️ Критические правила](#️-критические-правила---обязательно-к-прочтению) ⭐ **НАЧНИТЕ ОТСЮДА**
2. [Введение](#введение)
3. [Быстрый старт: Краткий чеклист](#быстрый-старт-краткий-чеклист)
4. [Детальная инструкция: Пошаговый процесс](#детальная-инструкция-пошаговый-процесс)
5. [Справочная информация](#справочная-информация)
6. [Примеры кода](#примеры-кода)
7. [Приложения](#приложения)

---

## Введение

Это руководство описывает процесс добавления нового психологического теста в приложение **Психологические тесты (Psycho Tests)** с использованием **Legacy Dart архитектуры**.

### Почему Legacy Dart, а не JSON?

**Архитектурное решение:**
- Приложение рассчитано на **100-200 тестов**
- Один разработчик
- Тесты редко меняются (психологические методики стабильны)
- Dart код компилируется и работает быстрее JSON парсинга
- Нет необходимости в динамической загрузке контента

**Исключения (когда использовать JSON):**
- Простые тесты из 5-10 вопросов с одинаковой структурой (Stress Test, Self-Esteem Test)
- Тесты, которые могут часто обновляться

**Текущее состояние приложения:**
- ✅ **5 тестов используют Legacy Dart:** IPIP Big Five, Fisher Temperament, Love Profile, Sixteen Types, Temperament Profile
- ✅ **2 теста используют JSON:** Stress Test, Self-Esteem Test
- ✅ **Все тесты загружаются корректно**

### Что создаётся при добавлении теста

**Новые файлы (3-4):**
- `lib/data/tests/{test_id}_test.dart` - TestStub с метаданными
- `lib/data/{test_id}_data.dart` - вопросы, ответы, интерпретации, factor names
- `lib/config/summary/question_weights/{test_id}_weights.dart` - веса для маппинга на 195 шкал
- *(опционально)* `test/{test_id}_test.dart` - unit-тесты

**Модифицируемые файлы (3-4):**
- `lib/data/test_registry.dart` - регистрация теста
- `lib/services/test_loader_service.dart` - добавление в switch statement метода _loadLegacyTest() ⭐ КРИТИЧНО
- `lib/services/test_service.dart` - добавление factor names и interpretations (для multi_factor тестов)
- `lib/screens/summary_screen.dart` - добавление в ДВА switch statement (для отображения вопросов в биполярных шкалах) ⭐ КРИТИЧНО

**НЕ создаются:**
- ~~`assets/tests/{test_id}.json`~~ - JSON файлы НЕ нужны для новых тестов

### Референсные примеры

**ПРАВИЛЬНАЯ архитектура (Legacy Dart):**

**IPIP Big Five** (50 вопросов, 5 факторов):
- Stub: `lib/data/tests/ipip_big_five_test.dart`
- Data: `lib/data/ipip_big_five_data.dart` ⭐
- Weights: `lib/config/summary/question_weights/ipip_big_five_weights.dart`

**Fisher Temperament** (56 вопросов, 4 фактора):
- Stub: `lib/data/tests/fisher_temperament_test.dart`
- Data: `lib/data/fisher_temperament_data.dart` ⭐
- Weights: `lib/config/summary/question_weights/fisher_temperament_weights.dart`

**Love Profile** (60 вопросов, 5 факторов):
- Stub: `lib/data/tests/love_profile_test.dart`
- Data: `lib/data/love_profile_data.dart` ⭐
- Weights: `lib/config/summary/question_weights/love_profile_weights.dart`

---

## Быстрый старт: Краткий чеклист

```markdown
⚠️ ПЕРЕД НАЧАЛОМ:
□ Шаг 0:  Прочитать КРИТИЧЕСКИЕ ПРАВИЛА в начале документа! (5 минут)

ПОДГОТОВКА:
□ Шаг 1:  Определить параметры теста (ID, название, категория, количество вопросов)
□ Шаг 2:  Изучить референсные примеры (IPIP Big Five, Fisher Temperament)

СОЗДАНИЕ ФАЙЛОВ:
□ Шаг 3:  Создать TestStub (lib/data/tests/{test_id}_test.dart)
□ Шаг 4:  Создать Data файл (lib/data/{test_id}_data.dart)
□ Шаг 4.1: ✅ ПРОВЕРКА: Имя класса = {TestName}Data (БЕЗ "Test")
□ Шаг 5:  Заполнить вопросы, ответы, интерпретации
            ⚠️ КРИТИЧНО: Все scores должны быть 0-4 (НЕ 1-5)!
□ Шаг 6:  Создать файл весов (lib/config/summary/question_weights/{test_id}_weights.dart)
            ⚠️ КРИТИЧНО: MBTI веса ТОЛЬКО положительные!
□ Шаг 7:  Замапить вопросы на существующие 195 шкал

ИНТЕГРАЦИЯ:
□ Шаг 8:  Добавить тест в test_registry.dart
□ Шаг 9:  (Для multi_factor) Добавить в test_service.dart
□ Шаг 10: Добавить в summary_screen.dart (2 switch statements)
□ Шаг 11: ⚠️ ОБЯЗАТЕЛЬНО! Импортировать веса в summary_service.dart
□ Шаг 11.1: (Опционально) Импортировать веса в summary_config.dart

ПРОВЕРКА:
□ Шаг 12: Запустить flutter analyze
□ Шаг 13: Запустить flutter test
□ Шаг 14: Визуально протестировать в приложении
            ✅ Проверить: минимальный score = 0%, максимальный = 100%
□ Шаг 15: Проверить локализацию (русский/английский)
□ Шаг 16: Проверить интеграцию с summary
            ✅ Проверить: тест показывается в биполярных MBTI шкалах
□ Шаг 17: Финальная проверка (критический чеклист в ПРАВИЛАХ)
```

---

## Детальная инструкция: Пошаговый процесс

### ШАГ 1: Определить параметры теста

**Что нужно определить:**

1. **ID теста** (snake_case, уникальный)
   - Пример: `anxiety_test`, `emotional_intelligence_test`, `career_orientation_test`
   - Требования: только латиница, цифры, подчёркивания; без пробелов

2. **Название теста** (русский + английский)
   - RU: "Тест на уровень тревожности"
   - EN: "Anxiety Level Test"

3. **Категория**
   - Доступные: `personality`, `temperament`, `relationships`, `emotional`
   - Используется для группировки на главном экране

4. **Количество вопросов**
   - Минимум: 5 (быстрый тест)
   - Рекомендовано: 30-60 (стандартный тест)
   - Максимум: 100+ (детальный тест)

5. **Тип теста**
   - `simple` - один общий результат (Self-Esteem, Stress)
   - `multi_factor` - несколько факторов (IPIP Big Five, Fisher, Love Profile)

6. **Факторы** (для multi_factor тестов)
   - Количество: 3-6 факторов
   - ID факторов: короткие коды (ea, eu, is, so, tr, ga)
   - Пример для Big Five: `['extraversion', 'agreeableness', 'conscientiousness', 'emotional_stability', 'intellect']`

**Пример параметров:**
```yaml
ID: emotional_intelligence_test
Название RU: Тест на эмоциональный интеллект
Название EN: Emotional Intelligence Test
Категория: personality
Вопросов: 40
Тип: multi_factor
Факторы: ['self_awareness', 'self_regulation', 'motivation', 'empathy', 'social_skills']
Время: 10 минут
```

---

### ШАГ 2: Изучить референсные примеры

**Откройте и изучите следующие файлы:**

1. **IPIP Big Five** (самый чистый пример):
   - `lib/data/tests/ipip_big_five_test.dart` - структура TestStub
   - `lib/data/ipip_big_five_data.dart` - как организованы вопросы, ответы, интерпретации

2. **Fisher Temperament** (пример с процентными интерпретациями):
   - `lib/data/fisher_temperament_data.dart` - метод getFactorInterpretation()

3. **Love Profile** (пример с кастомным подсчетом баллов):
   - `lib/data/love_profile_data.dart` - особенности расчета

**Время на изучение:** 10-15 минут

---

### ШАГ 3: Создать TestStub файл

**Путь:** `lib/data/tests/{test_id}_test.dart`

**Шаблон:**

```dart
import 'test_stub.dart';

/// Emotional Intelligence Test
///
/// Comprehensive assessment of emotional intelligence across 5 key dimensions:
/// self-awareness, self-regulation, motivation, empathy, and social skills.
/// Based on Goleman's EI framework and modern research.
///
/// Not a medical diagnosis.
class EmotionalIntelligenceTest extends TestStub {
  @override
  String get id => 'emotional_intelligence_test';

  @override
  String get category => 'personality';  // personality, temperament, relationships, emotional

  @override
  Map<String, String> get name => {
        'ru': 'Тест на эмоциональный интеллект',
        'en': 'Emotional Intelligence Test',
      };

  @override
  Map<String, String> get description => {
        'ru': 'Оцените свою способность понимать эмоции, управлять ими и использовать эмоциональную информацию',
        'en': 'Assess your ability to understand emotions, manage them, and use emotional information',
      };

  @override
  int get questionCount => 40;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor'; // 'simple' или 'multi_factor'

  @override
  List<String> get tags => [
        'personality',
        'emotional_intelligence',
        'eq',
        'comprehensive',
      ];

  @override
  String get assetPath => '';  // ← Пустая строка для Legacy Dart тестов

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Psycho Tests',
        'category_display': {
          'ru': 'Личность',
          'en': 'Personality',
        },
        'factors': [
          'self_awareness',      // SA
          'self_regulation',     // SR
          'motivation',          // MO
          'empathy',             // EM
          'social_skills',       // SS
        ],
        'factor_names': {
          'ru': {
            'self_awareness': 'Самосознание',
            'self_regulation': 'Саморегуляция',
            'motivation': 'Мотивация',
            'empathy': 'Эмпатия',
            'social_skills': 'Социальные навыки',
          },
          'en': {
            'self_awareness': 'Self-Awareness',
            'self_regulation': 'Self-Regulation',
            'motivation': 'Motivation',
            'empathy': 'Empathy',
            'social_skills': 'Social Skills',
          },
        },
        'scientific_basis': [
          'Goleman Emotional Intelligence Theory',
          'Mayer-Salovey Four-Branch Model',
        ],
      };
}
```

**Важно:**
- `assetPath` должен быть **пустой строкой** `''` (не путь к JSON!)
- `metadata['factors']` - список ID факторов
- `metadata['factor_names']` - локализованные названия факторов

**Референс:** `lib/data/tests/ipip_big_five_test.dart:1`

---

### ШАГ 4: Создать Data файл

**Путь:** `lib/data/{test_id}_data.dart`

**⚠️ КРИТИЧНО: Соглашение об именовании класса**

- **Файл:** `{test_id}_data.dart` (snake_case)
- **Класс:** `{TestName}Data` (PascalCase, **БЕЗ** суффикса "Test")
- **Пример:** файл `emotional_intelligence_data.dart` → класс `EmotionalIntelligenceData`
- **❌ НЕПРАВИЛЬНО:** `EmotionalIntelligenceTestData` (вызовет ошибки компиляции!)

**Структура файла:**

```dart
import '../models/test_model.dart';

/// Data access class for Emotional Intelligence Test
class EmotionalIntelligenceData {  // ← БЕЗ суффикса "Test"!
  /// Get the complete Emotional Intelligence test
  static TestModel getEmotionalIntelligenceTest() {
    return TestModel(
      id: 'emotional_intelligence_test',
      title: {
        'ru': 'Тест на эмоциональный интеллект',
        'en': 'Emotional Intelligence Test',
      },
      description: {
        'ru': 'Оцените свою способность понимать эмоции...',
        'en': 'Assess your ability to understand emotions...',
      },
      category: {
        'ru': 'Личность',
        'en': 'Personality',
      },
      categoryId: 'personality',
      questions: _getQuestions(),
      estimatedTime: 10,
      type: TestType.multiFactor,
      factorIds: ['self_awareness', 'self_regulation', 'motivation', 'empathy', 'social_skills'],
      disclaimer: {
        'ru': 'Этот тест предназначен для самопознания...',
        'en': 'This test is intended for self-awareness...',
      },
    );
  }

  /// Get factor names (for test_service.dart)
  static Map<String, Map<String, String>> getFactorNames() {
    return {
      'self_awareness': {
        'ru': 'Самосознание',
        'en': 'Self-Awareness',
      },
      'self_regulation': {
        'ru': 'Саморегуляция',
        'en': 'Self-Regulation',
      },
      'motivation': {
        'ru': 'Мотивация',
        'en': 'Motivation',
      },
      'empathy': {
        'ru': 'Эмпатия',
        'en': 'Empathy',
      },
      'social_skills': {
        'ru': 'Социальные навыки',
        'en': 'Social Skills',
      },
    };
  }

  /// Get factor interpretation based on score
  /// For multi_factor tests, choose interpretation strategy:
  /// 1. Percentage-based (0-32%, 33-66%, 67-100%) - like Temperament Profile
  /// 2. Score-based (0-10, 11-20, 21-30) - like IPIP Big Five
  /// 3. Custom ranges
  static Map<String, String> getFactorInterpretation(String factorId, double scoreOrPercentage) {
    // Example: percentage-based (0-100)
    final percentage = scoreOrPercentage;

    switch (factorId) {
      case 'self_awareness':
        if (percentage <= 32) {
          return {
            'ru': 'Низкое самосознание\n\nВам трудно распознавать и понимать свои эмоции. Рекомендуется практика ведения дневника эмоций.',
            'en': 'Low Self-Awareness\n\nYou find it difficult to recognize and understand your emotions. Keeping an emotion journal is recommended.',
          };
        } else if (percentage <= 66) {
          return {
            'ru': 'Среднее самосознание\n\nВы иногда распознаёте свои эмоции, но это требует усилий.',
            'en': 'Medium Self-Awareness\n\nYou sometimes recognize your emotions, but it requires effort.',
          };
        } else {
          return {
            'ru': 'Высокое самосознание\n\nВы хорошо понимаете свои эмоции и их влияние на поведение.',
            'en': 'High Self-Awareness\n\nYou understand your emotions well and their impact on behavior.',
          };
        }

      case 'self_regulation':
        // ... similar structure for other factors

      default:
        return {
          'ru': 'Интерпретация недоступна',
          'en': 'Interpretation unavailable',
        };
    }
  }

  /// Private method to create all questions
  static List<QuestionModel> _getQuestions() {
    return [
      // Question 1
      QuestionModel(
        id: 'q1',
        text: {
          'ru': 'Я легко распознаю свои эмоции',
          'en': 'I easily recognize my emotions',
        },
        factorId: 'self_awareness',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // Question 2
      QuestionModel(
        id: 'q2',
        text: {
          'ru': 'Мне трудно контролировать свои эмоции',
          'en': 'I find it difficult to control my emotions',
        },
        factorId: 'self_regulation',
        isReversed: true,  // Обратный вопрос
        answers: _getLikertAnswers(),
      ),

      // Question 3
      QuestionModel(
        id: 'q3',
        text: {
          'ru': 'Я чувствую мотивацию достигать своих целей',
          'en': 'I feel motivated to achieve my goals',
        },
        factorId: 'motivation',
        isReversed: false,
        answers: _getLikertAnswers(),
      ),

      // ... остальные 37 вопросов
    ];
  }

  /// Standard 5-point Likert scale answers
  /// ⚠️ КРИТИЧНО: Scores ДОЛЖНЫ быть 0-4 (НЕ 1-5)! См. ПРАВИЛО #1 в начале документа.
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совсем не согласен(на)',
          'en': 'Strongly Disagree',
        },
        score: 0,  // ← КРИТИЧНО: начинаем с 0, не с 1!
      ),
      AnswerModel(
        id: 'a2',
        text: {
          'ru': 'Скорее не согласен(на)',
          'en': 'Disagree',
        },
        score: 1,
      ),
      AnswerModel(
        id: 'a3',
        text: {
          'ru': 'Нейтрально',
          'en': 'Neutral',
        },
        score: 2,
      ),
      AnswerModel(
        id: 'a4',
        text: {
          'ru': 'Скорее согласен(на)',
          'en': 'Agree',
        },
        score: 3,
      ),
      AnswerModel(
        id: 'a5',
        text: {
          'ru': 'Полностью согласен(на)',
          'en': 'Strongly Agree',
        },
        score: 4,  // ← КРИТИЧНО: заканчиваем на 4, не на 5!
      ),
    ];
  }
}
```

**Важные методы:**

1. **`getEmotionalIntelligenceTest()`** - возвращает TestModel
2. **`getFactorNames()`** - для test_service.dart (multi_factor тесты)
3. **`getFactorInterpretation()`** - для test_service.dart (multi_factor тесты)
4. **`_getQuestions()`** - создает список вопросов
5. **`_getLikertAnswers()`** - стандартные ответы (можно переиспользовать)

**Референс:** `lib/data/ipip_big_five_data.dart:1`, `lib/data/fisher_temperament_data.dart:1`

---

### ШАГ 4.1: ✅ ПРОВЕРКА - Верификация имени класса

**ОБЯЗАТЕЛЬНО выполните после создания data файла:**

1. Откройте созданный файл `lib/data/{test_id}_data.dart`
2. Найдите строку объявления класса (обычно строка 5-10)
3. **Проверьте имя класса:**

```dart
// ✅ ПРАВИЛЬНО:
class EmotionalIntelligenceData { ... }

// ❌ НЕПРАВИЛЬНО (вызовет ошибки компиляции):
class EmotionalIntelligenceTestData { ... }
```

**Если имя неправильное:**

**Вариант A (рекомендуется):** Переименуйте класс
- Используйте Find & Replace: `EmotionalIntelligenceTestData` → `EmotionalIntelligenceData`
- Или пересоздайте файл с правильным именем

**Вариант B:** Используйте alias при импорте (во всех 6 файлах интеграции)
```dart
// В test_service.dart, test_loader_service.dart, summary_screen.dart:
import '../data/emotional_intelligence_data.dart' as ei;

// Затем вызов:
ei.EmotionalIntelligenceTestData.getMethod();
```

⚠️ **Вариант B** требует изменений в 6 местах - лучше использовать **Вариант A**.

---

### ШАГ 5: Заполнить вопросы, ответы, интерпретации

**Рекомендации по вопросам:**

1. **Формулировка:**
   - Простые, понятные утверждения
   - От первого лица: "Я...", "Мне...", "Я чувствую..."
   - Избегайте двусмысленности

2. **Обратные вопросы (is_reversed: true):**
   - 30-40% вопросов должны быть обратными
   - Предотвращают систематическую ошибку согласия
   - Пример: "Мне ТРУДНО...", "Я НЕ люблю...", "У меня редко..."

3. **Распределение по факторам:**
   - Равномерно: 40 вопросов / 5 факторов = 8 вопросов на фактор
   - Чередуйте вопросы разных факторов (не группируйте)
   - Пример порядка: SA, SR, MO, EM, SS, SA, SR, MO, EM, SS, ...

4. **Варианты ответов:**
   - **5-балльная шкала Likert** (самая распространённая)
   - Можно создать другие шкалы: частоты, интенсивности
   - Используйте `_getLikertAnswers()` для стандартных ответов

**Пример хорошего вопроса:**
```dart
QuestionModel(
  id: 'q15',
  text: {
    'ru': 'Я способен мотивировать себя даже в сложных ситуациях',
    'en': 'I can motivate myself even in difficult situations',
  },
  factorId: 'motivation',
  isReversed: false,
  answers: _getLikertAnswers(),
),
```

**Пример обратного вопроса:**
```dart
QuestionModel(
  id: 'q16',
  text: {
    'ru': 'Мне трудно найти мотивацию для выполнения задач',
    'en': 'I find it difficult to find motivation to complete tasks',
  },
  factorId: 'motivation',
  isReversed: true,  // ← Обратный
  answers: _getLikertAnswers(),
),
```

**Интерпретации:**

Для multi_factor тестов создайте метод `getFactorInterpretation()`:

```dart
static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
  // Диапазоны: 0-32 (low), 33-66 (medium), 67-100 (high)
  // Или кастомные диапазоны на основе вашей психометрической модели
}
```

---

### ШАГ 6: Создать файл весов

**Путь:** `lib/config/summary/question_weights/{test_id}_weights.dart`

**⚠️ КРИТИЧНО:** Перед созданием весов прочитайте **ПРАВИЛО #2** (MBTI биполярные веса)!

**Шаблон:**

```dart
import 'question_weight_models.dart';

/// Question weights configuration for Emotional Intelligence test
/// Maps 40 questions to hierarchical psychological scales (195 subscales)
class EmotionalIntelligenceWeights {
  /// EMOTIONAL INTELLIGENCE TEST - 40 Questions
  ///
  /// Weight categories: Primary (0.8-1.0), Secondary (0.4-0.7), Tertiary (0.2-0.3)
  /// ⚠️ MBTI weights: ТОЛЬКО положительные (0.1-0.5)! См. ПРАВИЛО #2.
  static const Map<String, QuestionWeight> weights = {

    // Q1: "Я легко распознаю свои эмоции" (Self-awareness)
    'emotional_intelligence_test:q1': QuestionWeight(
      testId: 'emotional_intelligence_test',
      questionId: 'q1',
      axisWeights: {
        // Primary hierarchical scales (0.8-1.0)
        'emotional_awareness': 1.0,
        'introspection': 0.8,

        // Secondary scales (0.4-0.7)
        'self_knowledge': 0.7,
        'emotional_intelligence': 0.7,
        'mindfulness': 0.5,

        // MBTI personality type scales (0.1-0.5, optional)
        // ⚠️ ТОЛЬКО положительные веса для MBTI!
        'feeling': 0.3,           // Emotional awareness связана с Feeling
        'introversion': 0.2,      // Самоанализ связан с Introversion
      },
      note: 'Self-awareness: emotional recognition + introspection',
    ),

    // Q2: "Мне трудно контролировать свои эмоции" (Self-regulation, reversed)
    'emotional_intelligence_test:q2': QuestionWeight(
      testId: 'emotional_intelligence_test',
      questionId: 'q2',
      axisWeights: {
        'emotional_regulation': 1.0,
        'self_control': 0.9,
        'emotional_resilience': 0.7,
        'impulse_control': 0.7,
        'composure': 0.5,

        // Negative weights для НЕ-MBTI шкал допустимы
        'vitality': -0.6,         // ✅ OK: низкий контроль → низкая vitality
        'stress_tolerance': -0.5, // ✅ OK: низкий контроль → низкая stress_tolerance
      },
      note: 'Self-regulation deficit: poor control + impulsivity (reversed)',
    ),

    // ... остальные 38 вопросов
  };
}
```

**Ключевые принципы:**

1. **ID формат:** `'{test_id}:{question_id}'`
2. **Веса:**
   - Primary: 0.8-1.0 (прямая связь)
   - Secondary: 0.4-0.7 (умеренная связь)
   - Tertiary: 0.2-0.3 (слабая связь)
3. **MBTI веса:** 0.1-0.5 (опционально, только если релевантно) - **ТОЛЬКО положительные!** ⚠️
4. **Negative weights:** Допустимы ТОЛЬКО для НЕ-MBTI шкал (показывают обратную связь)
5. **Используйте ТОЛЬКО существующие 195 шкал** из `hierarchical_scales.dart`

**Поиск шкал:**
```bash
# Откройте hierarchical_scales.dart
# Используйте Ctrl+F для поиска
# Пример: ищем "empathy" → находим empathy, compassion, perspective_taking
```

**Референс:** `lib/config/summary/question_weights/ipip_big_five_weights.dart:1`

---

### ШАГ 7: Замапить все вопросы на шкалы

**Процесс для каждого вопроса:**

1. Определите психологический конструкт
2. Найдите 3-10 релевантных шкал из 195
3. Присвойте веса
4. Добавьте MBTI веса (если релевантно)
5. Напишите краткое примечание

**MBTI шкалы (8 шт.):**

- `extraversion` / `introversion`
- `sensing` / `intuition`
- `thinking` / `feeling`
- `judging` / `perceiving`

**Когда добавлять MBTI веса:**

- Вопросы о социальности → extraversion/introversion (0.3-0.5)
- Вопросы об абстракции/деталях → intuition/sensing (0.3-0.4)
- Вопросы об эмпатии/логике → feeling/thinking (0.3-0.4)
- Вопросы о планировании/спонтанности → judging/perceiving (0.3-0.4)

**Пример полного маппинга:**

```dart
// "Я понимаю, что чувствуют другие люди"
'emotional_intelligence_test:q4': QuestionWeight(
  testId: 'emotional_intelligence_test',
  questionId: 'q4',
  axisWeights: {
    // Hierarchical scales
    'empathy': 1.0,
    'perspective_taking': 0.9,
    'social_awareness': 0.8,
    'emotional_intelligence': 0.7,
    'compassion': 0.6,
    'interpersonal_sensitivity': 0.5,

    // MBTI scales
    'feeling': 0.4,           // Понимание эмоций = Feeling
    'extraversion': 0.2,      // Социальная осведомленность может коррелировать с E
  },
  note: 'Empathy: understanding others + perspective-taking + social awareness',
),
```

**Время:** 30-60 минут для маппинга всех вопросов

---

### ШАГ 8: Добавить тест в test_registry.dart

**Путь:** `lib/data/test_registry.dart`

**Действия:**

1. Импортировать:
```dart
import 'tests/emotional_intelligence_test.dart';
```

2. Добавить в `allTests`:
```dart
static final List<TestStub> allTests = [
  // Featured/Popular tests
  SixteenTypesTest(),
  IPIPBigFiveTest(),
  LoveProfileTest(),

  // Temperament/Personality
  FisherTemperamentTest(),
  EmotionalIntelligenceTest(),  // ← ДОБАВИТЬ СЮДА

  // Quick assessments
  StressTest(),
  SelfEsteemTest(),
];
```

**Референс:** `lib/data/test_registry.dart:36`

---

### ШАГ 9: (Для multi_factor) Добавить в test_service.dart

**Путь:** `lib/services/test_service.dart`

**Только для multi_factor тестов!**

**Действия:**

1. **Импортировать data класс:**
```dart
import '../data/emotional_intelligence_data.dart';
```

2. **Добавить в секцию factor names (около строки 199):**
```dart
// Choose data depending on test
if (test.id == 'fisher_temperament') {
  factorNames = FisherTemperamentData.getFactorNames();
  factorInterpretations = FisherTemperamentData.getFactorInterpretations();
} else if (test.id == 'love_profile') {
  factorNames = LoveProfileData.getFactorNames();
  factorInterpretations = LoveProfileData.getFactorInterpretations();
} else if (test.id == 'temperament_profile_test') {
  factorNames = TemperamentProfileTestData.getFactorNames();
  factorInterpretations = {};
} else if (test.id == 'emotional_intelligence_test') {  // ← ДОБАВИТЬ
  factorNames = EmotionalIntelligenceData.getFactorNames();
  factorInterpretations = {};
} else {
  factorNames = IPIPBigFiveData.getFactorNames();
  factorInterpretations = {};
}
```

3. **Добавить в секцию interpretations (около строки 221):**
```dart
Map<String, String> interpretation;
if (test.id == 'fisher_temperament') {
  interpretation = factorInterpretations[factorId] ??
      {'ru': 'Нет интерпретации', 'en': 'No interpretation'};
} else if (test.id == 'love_profile') {
  final percentage = (score / maxFactorScore) * 100;
  interpretation = LoveProfileData.getFactorInterpretation(factorId, percentage);
} else if (test.id == 'temperament_profile_test') {
  final percentage = (score / maxFactorScore) * 100;
  interpretation = TemperamentProfileTestData.getFactorInterpretation(factorId, percentage);
} else if (test.id == 'emotional_intelligence_test') {  // ← ДОБАВИТЬ
  final percentage = (score / maxFactorScore) * 100;
  interpretation = EmotionalIntelligenceData.getFactorInterpretation(factorId, percentage);
} else {
  interpretation = IPIPBigFiveData.getFactorInterpretation(factorId, score);
}
```

**Референс:** `lib/services/test_service.dart:199-237`

---

### ШАГ 10: Добавить в summary_screen.dart

**Путь:** `lib/screens/summary_screen.dart`

**ДЛЯ ВСЕХ ТЕСТОВ (и simple, и multi_factor)!**

**Действия:**

1. **Импортировать data класс (около строки 23):**
```dart
import '../data/emotional_intelligence_data.dart';
```

2. **Добавить в ПЕРВЫЙ switch statement (метод _getQuestionText, около строки 2468):**
```dart
switch (testId) {
  case 'ipip_big_five':
    testModel = IPIPBigFiveData.getIPIPBigFiveTest();
    break;
  // ... другие тесты
  case 'emotional_intelligence_test':  // ← ДОБАВИТЬ
    testModel = EmotionalIntelligenceData.getEmotionalIntelligenceTest();
    break;
  default:
    appLogger.w('Unknown testId: $testId');
    return widget.languageCode == 'ru'
        ? 'Неизвестный тест: $testId'
        : 'Unknown test: $testId';
}
```

3. **Добавить во ВТОРОЙ switch statement (метод _getAnswerText, около строки 2527):**
```dart
switch (testId) {
  case 'ipip_big_five':
    testModel = IPIPBigFiveData.getIPIPBigFiveTest();
    break;
  // ... другие тесты
  case 'emotional_intelligence_test':  // ← ДОБАВИТЬ
    testModel = EmotionalIntelligenceData.getEmotionalIntelligenceTest();
    break;
  default:
    appLogger.w('Unknown testId: $testId');
    return answerScore.toString();
}
```

**Зачем это нужно:**
Эти методы используются для отображения вопросов в биполярных шкалах Summary экрана.

**Референс:** `lib/screens/summary_screen.dart:2447-2540`

---

### ШАГ 11: ⚠️ ОБЯЗАТЕЛЬНО! Добавить веса в summary_service.dart

**Путь:** `lib/services/summary_service.dart`

**⚠️ КРИТИЧНО:** Без этого шага биполярные MBTI шкалы не будут показывать влияние вашего теста! См. **ПРАВИЛО #3**.

**Действия:**

1. **Импортировать weights файл (около строки 5-10):**
```dart
import '../config/summary/question_weights/emotional_intelligence_weights.dart';
```

2. **Добавить в allWeights map в методе getQuestionsWithMBTIWeights() (около строки 148):**
```dart
Map<String, Map<String, List<Map<String, dynamic>>>> getQuestionsWithMBTIWeights(
  List<TestResult> completedTests,
  List<String> scaleIds,
) {
  final allWeights = <String, QuestionWeight>{
    ...IPIPBigFiveWeights.weights,
    ...FisherTemperamentWeights.weights,
    ...LoveProfileWeights.weights,
    ...SimpleTestsWeights.weights,
    ...SixteenTypesWeights.weights,
    ...TemperamentProfileTestWeights.weights,
    ...DigitalDetoxWeights.weights,
    ...BurnoutDiagnosticWeights.weights,
    ...EmotionalIntelligenceWeights.weights,  // ← ОБЯЗАТЕЛЬНО ДОБАВИТЬ!
  };
  // ...
}
```

**Проверка правильности:**
1. Пройдите ваш тест в приложении
2. Откройте Summary Screen
3. Выберите любую биполярную шкалу (E-I, S-N, T-F, J-P)
4. Убедитесь, что ваш тест указан в списке влияющих тестов

**Референс:** `lib/services/summary_service.dart:148-163`

---

### ШАГ 11.1: (Опционально) Импортировать веса в summary_config.dart

**Путь:** `lib/config/summary_config.dart`

**Когда нужно:**
Для показа affected scales в результатах теста (expandable list).

**Действия:**

1. **Импортировать (около строки 4):**
```dart
import 'summary/question_weights/emotional_intelligence_weights.dart';
```

2. **Добавить в _weights map (около строки 2288):**
```dart
static final Map<String, QuestionWeight> _weights = {
  ...IPIPBigFiveWeights.weights,
  ...FisherTemperamentWeights.weights,
  ...LoveProfileWeights.weights,
  ...SimpleTestsWeights.weights,
  ...SixteenTypesWeights.weights,
  ...TemperamentProfileTestWeights.weights,
  ...DigitalDetoxWeights.weights,
  ...BurnoutDiagnosticWeights.weights,
  ...EmotionalIntelligenceWeights.weights,  // ← ДОБАВИТЬ
};
```

**Примечание:** Этот шаг опционален - используется только для отображения "Этот тест влияет на X шкал" в результатах теста.

**Референс:** `lib/config/summary_config.dart:2288-2310`

---

### ШАГ 12: Запустить flutter analyze

```bash
flutter analyze
```

**Ожидаемый результат:**
```
Analyzing psycho_app...
No issues found!
```

**Если есть ошибки:**
- Проверьте импорты
- Проверьте синтаксис
- Используйте `dart format lib/` для форматирования

---

### ШАГ 13: Запустить flutter test

```bash
flutter test
```

**Опционально: Создать unit-тест**

`test/emotional_intelligence_test_test.dart`:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:psycho_app/data/test_registry.dart';
import 'package:psycho_app/data/emotional_intelligence_data.dart';

void main() {
  group('Emotional Intelligence Test', () {
    test('should be registered in TestRegistry', () {
      final test = TestRegistry.getTest('emotional_intelligence_test');
      expect(test, isNotNull);
      expect(test!.id, 'emotional_intelligence_test');
      expect(test.questionCount, 40);
    });

    test('should load test model successfully', () {
      final testModel = EmotionalIntelligenceData.getEmotionalIntelligenceTest();

      expect(testModel.id, 'emotional_intelligence_test');
      expect(testModel.questions.length, 40);
      expect(testModel.type, TestType.multiFactor);
      expect(testModel.factorIds, isNotNull);
      expect(testModel.factorIds!.length, 5);
    });

    test('all questions should have valid structure', () {
      final testModel = EmotionalIntelligenceData.getEmotionalIntelligenceTest();

      for (var question in testModel.questions) {
        expect(question.id, isNotEmpty);
        expect(question.text['ru'], isNotEmpty);
        expect(question.text['en'], isNotEmpty);
        expect(question.factorId, isNotNull);
        expect(question.answers.length, greaterThan(0));
      }
    });

    test('factor names should be accessible', () {
      final factorNames = EmotionalIntelligenceData.getFactorNames();

      expect(factorNames.length, 5);
      expect(factorNames['self_awareness'], isNotNull);
      expect(factorNames['empathy'], isNotNull);
    });

    test('factor interpretations should work', () {
      final lowInterpretation = EmotionalIntelligenceData.getFactorInterpretation('empathy', 20);
      final highInterpretation = EmotionalIntelligenceData.getFactorInterpretation('empathy', 80);

      expect(lowInterpretation['ru'], isNotEmpty);
      expect(highInterpretation['en'], isNotEmpty);
      expect(lowInterpretation['ru'], isNot(equals(highInterpretation['ru'])));
    });
  });
}
```

---

### ШАГ 14: Визуально протестировать в приложении

```bash
flutter run
```

**Чеклист:**
- ✓ Тест появляется в списке в правильной категории
- ✓ Название и описание корректны
- ✓ Можно начать тест
- ✓ Вопросы отображаются на правильном языке
- ✓ Прогресс-бар работает
- ✓ Результаты корректно вычисляются
- ✓ Интерпретации правильные (для multi_factor)
- ✓ Тест сохраняется в истории

---

### ШАГ 15: Проверить локализацию

**Переключите язык на английский:**
- Настройки → Language → English

**Проверьте:**
- Название теста
- Описание теста
- Все вопросы
- Все варианты ответов
- Интерпретации результатов
- Disclaimer

**Переключитесь обратно на русский и проверьте снова.**

---

### ШАГ 16: Проверить интеграцию с summary

**Процесс:**

1. Пройдите новый тест
2. Пройдите 1-2 других теста (IPIP Big Five, Fisher)
3. Откройте Summary экран
4. Проверьте:
   - Новый тест учитывается
   - Баллы по шкалам обновились
   - Нет ошибок в консоли
   - Вопросы из нового теста показываются в биполярных шкалах

**Отладка:**
- Проверьте веса в weights файле
- Проверьте консоль на ошибки "Unknown axis"
- Проверьте, что ID вопросов совпадают

---

### ШАГ 17: Финальная проверка

```markdown
ФАЙЛЫ:
□ lib/data/tests/{test_id}_test.dart создан
□ lib/data/{test_id}_data.dart создан и заполнен
□ lib/config/summary/question_weights/{test_id}_weights.dart создан
□ lib/data/test_registry.dart обновлён
□ lib/services/test_service.dart обновлён (для multi_factor)
□ lib/screens/summary_screen.dart обновлён (2 switch statements)
□ (Опционально) lib/config/summary_config.dart обновлён

КОД:
□ flutter analyze - нет ошибок
□ flutter test - все тесты проходят
□ Код отформатирован (dart format lib/)

ФУНКЦИОНАЛЬНОСТЬ:
□ Тест появляется в списке в правильной категории
□ Можно пройти тест от начала до конца
□ Результаты корректно вычисляются
□ Интерпретации правильные
□ Тест сохраняется в истории

ЛОКАЛИЗАЦИЯ:
□ Русский язык работает
□ Английский язык работает
□ Нет пропущенных переводов

ИНТЕГРАЦИЯ:
□ Summary учитывает новый тест
□ Веса вопросов работают
□ Вопросы показываются в биполярных шкалах
□ Нет ошибок в консоли
```

**Если все пункты ✓ - тест готов!**

---

## Справочная информация

### Структура файлов проекта

```
lib/
├── data/
│   ├── test_registry.dart           # Реестр всех тестов
│   ├── tests/                       # TestStub файлы
│   │   ├── test_stub.dart
│   │   ├── ipip_big_five_test.dart
│   │   └── {test_id}_test.dart     # ← Новый stub
│   ├── ipip_big_five_data.dart     # ← Референс
│   ├── fisher_temperament_data.dart
│   ├── love_profile_data.dart
│   └── {test_id}_data.dart         # ← Новый data файл
├── config/
│   └── summary/
│       ├── hierarchical_scales.dart           # 195 шкал
│       └── question_weights/
│           ├── question_weight_models.dart
│           ├── ipip_big_five_weights.dart
│           └── {test_id}_weights.dart        # ← Новые веса
├── models/
│   └── test_model.dart              # TestModel, QuestionModel, AnswerModel
├── services/
│   ├── test_service.dart            # ← Обновить для multi_factor
│   └── summary_service.dart
└── screens/
    └── summary_screen.dart          # ← Обновить (2 switch statements)

assets/
└── tests/
    ├── stress_test.json             # Только для simple тестов
    └── self_esteem_test.json

test/
└── {test_id}_test.dart              # ← Опционально
```

---

## Примеры кода

### Пример 1: Simple тест (стресс-тест, 5 вопросов)

**TestStub:**
```dart
class StressTest extends TestStub {
  @override
  String get id => 'stress_test';

  @override
  String get type => 'simple';  // ← Простой тест

  @override
  int get questionCount => 5;

  @override
  String get assetPath => 'assets/tests/stress_test.json';  // ← JSON для simple
}
```

**Примечание:** Simple тесты могут использовать JSON (как stress_test) или Dart (на ваш выбор).

---

### Пример 2: Multi_factor тест

См. `lib/data/ipip_big_five_data.dart`, `lib/data/fisher_temperament_data.dart`

---

## Приложения

### Приложение A: Список 195 шкал

**Категории шкал:**

**1. Эмоциональная сфера (30+ шкал)**
- `emotional_stability`, `anxiety`, `stress_tolerance`, `emotional_resilience`
- `emotional_regulation`, `emotional_awareness`, `emotional_intelligence`
- `calmness`, `composure`, `vulnerability`, `emotional_reactivity`

**2. Социальная сфера (25+ шкал)**
- `extraversion`, `introversion`, `sociability`, `warmth`
- `social_confidence`, `social_skills`, `social_awareness`
- `empathy`, `compassion`, `perspective_taking`

**3. Когнитивная сфера (20+ шкал)**
- `intellectual_curiosity`, `creativity`, `imagination`
- `analytical_thinking`, `abstract_reasoning`, `problem_solving`

**4-10. Другие категории...**

**Полный список:** `lib/config/summary/hierarchical_scales.dart`

---

### Приложение B: Типичные проблемы

**1. Тест не появляется в списке**
- Проверьте test_registry.dart - добавлен ли импорт
- Перезапустите приложение (Hot Reload недостаточно)

**2. "Неизвестный тест" в биполярных шкалах**
- Проверьте summary_screen.dart - добавлены ли оба switch statements
- Проверьте импорт data файла

**3. "Неизвестный фактор" в результатах**
- Проверьте test_service.dart - добавлен ли тест в factor names/interpretations
- Проверьте data файл - реализованы ли методы getFactorNames() и getFactorInterpretation()

**4. Summary не учитывает тест**
- Проверьте weights файл - все ли вопросы замаплены
- Проверьте, что ID вопросов совпадают: `{test_id}:{question_id}`

**5. "The getter 'XxxData' isn't defined for the type..."**
- **Причина:** Неправильное имя класса в data файле
- **Симптомы:** Ошибки компиляции в test_service.dart, test_loader_service.dart, summary_screen.dart
- **Пример ошибки:** `The getter 'DigitalDetoxData' isn't defined...`
- **Решение:**
  1. Откройте `lib/data/{test_id}_data.dart`
  2. Проверьте имя класса - должно быть `{TestName}Data` (БЕЗ суффикса "Test")
  3. **Вариант A:** Переименуйте класс (`XxxTestData` → `XxxData`)
  4. **Вариант B:** Используйте alias импорт во всех 6 файлах интеграции:
     ```dart
     import '../data/xxx_data.dart' as xxx;
     xxx.XxxTestData.getMethod();
     ```
- **Профилактика:** Всегда выполняйте ШАГ 4.1 (проверка имени класса)

**6. ⚠️ КРИТИЧНО: "Converting object to an encodable object failed: NaN"**
- **Причина:** NaN значения в результатах теста (не могут быть сохранены в JSON)
- **Симптомы:** Тест проходится, но не сохраняется; ошибка в консоли
- **Решение:** Добавьте NaN protection в data файл:
  ```dart
  static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);
    // ...
  }
  ```
- **Профилактика:** См. **ПРАВИЛО #4** в начале документа

**7. ⚠️ КРИТИЧНО: Минимальный балл показывает 20% вместо 0%**
- **Причина:** Scores используют диапазон 1-5 вместо 0-4
- **Симптомы:** Даже при выборе всех минимальных ответов результат ≥20%
- **Математика:**
  - Scores 1-5: минимум = `(N × 1) / (N × 5)` = 20%
  - Scores 0-4: минимум = `(N × 0) / (N × 4)` = 0% ✅
- **Решение:** Измените все scores с 1-5 на 0-4
- **Где исправлять:** Все answer methods (_getLikertAnswers, _getFrequencyAnswers, и т.д.)
- **Количество изменений:** 5 answers × 8 methods = 40 значений
- **Профилактика:** См. **ПРАВИЛО #1** в начале документа

**8. "The method '_buildAffectedScalesSection' isn't defined"**
- **Причина:** Методы добавлены вне класса (после закрывающей скобки)
- **Симптомы:** Ошибка компиляции при обращении к методу из build()
- **Решение:** Переместите методы ВНУТРЬ класса _TestResultScreenState, перед закрывающей скобкой
- **Совет:** Всегда проверяйте правильное место вставки методов

**9. MBTI биполярные шкалы не показывают влияние нового теста**
- **Причина:** summary_service.dart не импортирует веса нового теста
- **Симптомы:** На Summary экране в биполярных шкалах отсутствует новый тест
- **Решение:**
  1. Импортируйте weights файл в summary_service.dart
  2. Добавьте в allWeights map в методе getQuestionsWithMBTIWeights()
- **Проверка:** Откройте Summary → биполярная шкала → новый тест должен быть в списке
- **Профилактика:** См. **ПРАВИЛО #3** и **ШАГ 11** (обязательный)

**10. ⚠️ КРИТИЧНО: Отрицательные MBTI веса в weights файле**
- **Причина:** Неправильное понимание биполярных шкал
- **Симптомы:** Веса типа `'extraversion': -0.3` в weights файле
- **Почему неправильно:** MBTI шкалы биполярные - extraversion и introversion противоположные полюса одной оси
- **Правильно:** `'extraversion': -0.3` → `'introversion': 0.3`
- **Важно:** Negative weights допустимы ТОЛЬКО для НЕ-MBTI шкал (anxiety, vitality, stress_tolerance)
- **Профилактика:** См. **ПРАВИЛО #2** в начале документа

**11. Low scale coverage (тест влияет на мало шкал)**
- **Причина:** Недостаточное маппирование вопросов на существующие 195 шкал
- **Симптомы:** Test result screen показывает "Влияет на 30 шкал" (должно быть 80-120)
- **Решение:**
  1. Откройте `hierarchical_scales.dart`
  2. Используйте Ctrl+F для поиска релевантных шкал
  3. Добавьте 5-10 дополнительных шкал на каждый вопрос
  4. Учитывайте эмоциональные, когнитивные, социальные, поведенческие аспекты
- **Целевое покрытие:** 50-60% от 195 шкал (100-120 шкал)

---

## Заключение

**Legacy Dart архитектура - правильный выбор для этого проекта.**

**Преимущества:**
- ✅ Быстрая компиляция
- ✅ Типобезопасность
- ✅ Лучший контроль версий (Git diff)
- ✅ Масштабируемость до 100-200 тестов
- ✅ Не требует парсинга JSON

**Следующие тесты:**
Используйте эту инструкцию как шаблон. Референсы:
- `lib/data/ipip_big_five_data.dart` - чистый пример
- `lib/data/fisher_temperament_data.dart` - процентные интерпретации
- `lib/data/love_profile_data.dart` - кастомный подсчет
- `lib/data/digital_detox_data.dart` - современный тест с 7 факторами ⭐ NEW

---

## История версий документа

### Версия 2.3.0 (2025-01-09) ⭐ ТЕКУЩАЯ
**Статус:** Burnout Diagnostic Test успешно добавлен

**🔴 КРИТИЧЕСКИЕ УЛУЧШЕНИЯ:**
- ✅ Добавлена новая секция **"⚠️ КРИТИЧЕСКИЕ ПРАВИЛА"** в начало документа
- ✅ **ПРАВИЛО #1:** Scores ДОЛЖНЫ быть 0-4 (НЕ 1-5!) - предотвращает 20% minimum score bug
- ✅ **ПРАВИЛО #2:** MBTI биполярные веса ТОЛЬКО положительные - правило инверсии для negative weights
- ✅ **ПРАВИЛО #3:** summary_service.dart ОБЯЗАТЕЛЬНО импортирует все веса
- ✅ **ПРАВИЛО #4:** NaN protection в расчетах - предотвращает JSON serialization errors
- ✅ Добавлен критический чеклист перед коммитом

**Обновления инструкций:**
- ✅ ШАГ 4: Добавлены warnings о score ranges в _getLikertAnswers() template
- ✅ ШАГ 6: Добавлены warnings о MBTI биполярных весах + примеры negative weights для НЕ-MBTI шкал
- ✅ ШАГ 11: Переименован в "ОБЯЗАТЕЛЬНО!" + добавлена проверка правильности интеграции
- ✅ ШАГ 11.1: Опциональный summary_config.dart импорт (для affected scales display)

**Типичные проблемы (расширено до 11):**
- ✅ **#6:** NaN serialization error (+ код решения)
- ✅ **#7:** 20% minimum score bug (+ математика + где исправлять: 40 значений)
- ✅ **#8:** Method not found error (+ причина: methods вне класса)
- ✅ **#9:** MBTI биполярные шкалы не показывают тест (+ проверка)
- ✅ **#10:** Negative MBTI weights conceptual error (+ правило инверсии)
- ✅ **#11:** Low scale coverage (+ целевые значения: 100-120 scales)

**Обоснование:**
При добавлении Burnout Diagnostic теста (54 вопроса, 7 факторов) были обнаружены 9 критических ошибок:
1. Import path error → fixed
2. Missing tags getter → fixed
3. NaN when saving results → added protection in 3 places
4. 20% minimum score → changed 40 score values from 1-5 to 0-4
5. Method placement error → moved inside class
6. Low scale coverage (57 → 105 scales, +84%)
7. Expandable scale list → implemented _showAllScales
8. MBTI не показывают влияние → added to summary_service.dart
9. 10 negative MBTI weights → inverted to opposite poles

Эти критические ошибки заняли ~3 часа отладки. Новые правила предотвратят их в будущем.

**Новые референсы:**
- `lib/data/burnout_diagnostic_data.dart` - 54 вопроса с NaN protection
- `lib/config/summary/question_weights/burnout_diagnostic_weights.dart` - 105 scales, positive MBTI weights
- `lib/screens/test_result_screen.dart` - expandable affected scales section

**Проверено на:** Burnout Diagnostic Test (54 вопроса, 7 факторов, 105 affected scales)

---

### Версия 2.2.0 (2025-01-09)
**Статус:** Digital Detox Test успешно добавлен

**Критические улучшения:**
- ✅ Добавлен **ШАГ 4.1**: Обязательная проверка имени класса
- ✅ Добавлена **Проблема #5** в "Типичные проблемы": "The getter 'XxxData' isn't defined"
- ✅ Документированы 2 варианта решения проблемы с именованием
- ✅ Добавлено предупреждение в начало ШАГ 4 о соглашении об именовании

**Обоснование:**
При добавлении Digital Detox теста агент создал класс `DigitalDetoxTestData` вместо `DigitalDetoxData`, что вызвало ошибки компиляции в 5 местах (test_service.dart, test_loader_service.dart, summary_screen.dart × 2). Потребовалось 15 минут на отладку и исправление через alias импорты.

**Проверено на:** Digital Detox Test (50 вопросов, 7 факторов, 1,115 строк weights)

---

### Версия 2.1.0 (2025-01-09)
**Статус:** Temperament Profile Test успешно конвертирован в Legacy Dart

**Изменения:**
- Полный переход на Legacy Dart архитектуру
- Убраны JSON-зависимости для новых тестов
- Добавлен ШАГ 10: интеграция с summary_screen.dart
- Обновлены референсные примеры
- Учтены замечания из сессии добавления Temperament Profile Test

---

### Версия 2.0.0 (2025-01-09)
**Статус:** Первая редакция Legacy Dart инструкции

**Изменения:**
- Создание руководства для Legacy Dart архитектуры
- Документирование 17 шагов добавления теста
- Создание справочной информации и примеров

---

**Автор:** Claude Code Assistant
