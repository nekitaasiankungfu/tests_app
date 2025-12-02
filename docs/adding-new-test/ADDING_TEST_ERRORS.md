# 🔴 ADDING TEST - 17 типичных ошибок и их решения

> **Эти ошибки были обнаружены при добавлении реальных тестов (DISC, Burnout, Digital Detox, Holland Code, Love Languages, Wellbeing Happiness Inventory, Motivational Strategies, Conflict Communication Style)**
> Используйте этот документ для быстрой диагностики проблем
>
> **🆕 Ошибка #17:** Неправильная структура weights для multi-choice тестов (Conflict Communication Style)

---

## Ошибка #1: Использование устаревшего FactorModel API

### 🔍 Симптомы
- Ошибка компиляции: `Undefined class: 'FactorModel'`
- Код содержит `static List<FactorModel> get _factors => [...]`

### ❌ Неправильно
```dart
static List<FactorModel> get _factors => [
  FactorModel(id: 'dominance', ...),
];
```

### ✅ Решение
Используйте методы `getFactorNames()` и `getFactorInterpretation()`:
```dart
static Map<String, Map<String, String>> getFactorNames() {
  return {
    'dominance': {'ru': 'Доминантность', 'en': 'Dominance'},
  };
}
```

### 📍 Где искать проблему
- Data файл: `lib/data/your_test_data.dart`

---

## Ошибка #2: Отсутствие NaN protection

### 🔍 Симптомы
- Crash при открытии результатов: "Converting object to an encodable object failed: NaN"
- Пустой экран результатов
- Логи показывают NaN значения

### ❌ Неправильно
```dart
static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
  // Сразу используем percentage без проверки
  if (percentage < 33) { ... }
}
```

### ✅ Решение
Добавьте защиту в начале метода:
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

### 📍 Где искать проблему
- Data файл: метод `getFactorInterpretation()`

---

## Ошибка #3: Scores 1-5 вместо 0-4 (минимум 20% вместо 0%)

### 🔍 Симптомы
- Минимальный ответ показывает 20% вместо 0%
- Диапазон результатов: 20-100% вместо 0-100%

### ❌ Неправильно
```dart
AnswerModel(id: 'a1', score: 1, text: {'ru': 'Никогда'}),  // 20%
AnswerModel(id: 'a5', score: 5, text: {'ru': 'Всегда'}),   // 100%
```

### ✅ Решение
Используйте scores 0-4:
```dart
AnswerModel(id: 'a1', score: 0, text: {'ru': 'Никогда'}),  // 0%
AnswerModel(id: 'a5', score: 4, text: {'ru': 'Всегда'}),   // 100%
```

### 📍 Где искать проблему
- Data файл: все методы создания AnswerModel
- Поиск: `score: [1-5]`

---

## Ошибка #4: Дублирующиеся ключи в weights Map

### 🔍 Симптомы
- Ошибка компиляции: "Duplicate key in map literal"
- Flutter analyze показывает ошибки в weights файле

### ❌ Неправильно
```dart
static final Map<String, QuestionWeight> weights = {
  'test_id:q1': QuestionWeight(...),
  'test_id:q1': QuestionWeight(...),  // Дубликат!
};
```

### ✅ Решение
- Проверьте уникальность всех ключей
- Используйте последовательную нумерацию: q1, q2, q3...

### 📍 Где искать проблему
- Weights файл: `lib/config/summary/question_weights/your_test_weights.dart`
- Поиск дубликатов: сортируйте ключи и ищите повторы

---

## Ошибка #5: Несуществующие шкалы в weights

### 🔍 Симптомы
- Тест показывает "91 шкала" в результатах
- Но в Summary Screen влияет только на "45 шкал"
- Некоторые шкалы не появляются в Summary

### ❌ Неправильно
```dart
'test_id:q1': QuestionWeight(
  axisWeights: {
    'social_energy_depletion': 1.0,  // НЕ существует!
    'digital_addiction': 0.9,         // НЕ существует!
  },
),
```

### ✅ Решение
Используйте ТОЛЬКО существующие 195 шкал из `hierarchical_scales.dart`:
```dart
'test_id:q1': QuestionWeight(
  axisWeights: {
    'vitality': -0.9,          // ✅ существует
    'self_control': -0.7,      // ✅ существует
  },
),
```

### 📍 Где искать проблему
- Проверьте каждую шкалу в `lib/config/summary/hierarchical_scales.dart`
- Используйте: `bash tools/validate_test.sh your_test_id`

---

## Ошибка #6: Неправильное имя класса в data файле

### 🔍 Симптомы
- Ошибки компиляции в 5+ файлах
- "The getter 'YourTestData' isn't defined for the type..."

### ❌ Неправильно
```dart
// Файл: emotional_intelligence_data.dart
class EmotionalIntelligenceTestData {  // "Test" лишнее!
```

### ✅ Решение
```dart
// Файл: emotional_intelligence_data.dart
class EmotionalIntelligenceData {  // Без "Test"!
```

### 📍 Где искать проблему
- Data файл: объявление класса (строки 5-10)

---

## Ошибка #7: Отрицательные веса на биполярных полюсах

### 🔍 Симптомы
- validate_test.sh показывает ошибку в CHECK D
- Странные результаты в Personality Type шкалах

### ❌ Неправильно
```dart
'test_id:q1': QuestionWeight(
  axisWeights: {
    'extraversion': -0.3,  // Биполярный полюс!
    'thinking': -0.5,      // Биполярный полюс!
  },
),
```

### ✅ Решение
Используйте противоположный полюс:
```dart
'test_id:q1': QuestionWeight(
  axisWeights: {
    'introversion': 0.3,   // Противоположный полюс
    'feeling': 0.5,        // Противоположный полюс
  },
),
```

### 📍 Где искать проблему
- Weights файл: ищите 8 биполярных полюсов
- Проверка: `grep "'\(extra\|intro\)version': -" your_weights.dart`

---

## Ошибка #8: maxQuestionScore неправильный (80% вместо 100%)

### 🔍 Симптомы
- Максимальные ответы показывают 80% или 83% вместо 100%
- Проценты кажутся "сдвинутыми вниз"

### ❌ Проблема
Тест использует scores 0-4, но maxQuestionScore = 5 (по умолчанию)

### ✅ Решение
В `lib/services/test_service.dart` (~строка 92):
```dart
final int maxQuestionScore = test.id == 'fisher_temperament'
    ? 3
    : test.id == 'your_test_id'  // Добавить!
        ? 4  // Если scores 0-4
        : 5; // Default
```

### 📍 Где искать проблему
- `lib/services/test_service.dart`: метод `calculateResult()`

---

## Ошибка #9: Тест не появляется на главном экране

### 🔍 Симптомы
- После добавления теста его нет в списке
- Hot reload не помогает

### ✅ Решение (проверить ВСЕ пункты)

1. **test_registry.dart**
   ```dart
   import 'tests/your_test_test.dart';
   // ...
   static final List<TestStub> allTests = [
     YourTestTest(),  // Добавлено?
   ];
   ```

2. **Категория существует?**
   - Проверьте `lib/models/test_category.dart`
   - Если новая категория - сначала добавьте её

3. **FULL RESTART** (не hot reload!)
   ```bash
   flutter clean
   flutter run
   ```

### 📍 Где искать проблему
- `lib/data/test_registry.dart`
- `lib/data/tests/your_test_test.dart` (проверьте category)

---

## Ошибка #10: "Неизвестный фактор" в результатах

### 🔍 Симптомы
- Вместо названий факторов показывает "Неизвестный фактор"
- Результаты теста выглядят сломанными

### ✅ Решение
В `lib/services/test_service.dart` (~строка 222):
```dart
} else if (test.id == 'your_test_id') {
  factorNames = YourTestData.getFactorNames();
  factorInterpretations = {};
}
```

### 📍 Где искать проблему
- `lib/services/test_service.dart`: БЛОК 2 (factor names)

---

## Ошибка #11: Summary не показывает влияние теста

### 🔍 Симптомы
- Тест пройден, но в Summary Screen не влияет на шкалы
- Personality Type шкалы не показывают новый тест

### ✅ Решение (ДВА места!)

1. **summary_service.dart** (~строка 125)
   ```dart
   import '../config/summary/question_weights/your_test_weights.dart';

   final allWeights = <String, QuestionWeight>{
     ...YourTestWeights.weights,  // Место 1
   };
   ```

2. **summary_service.dart** (~строка 500)
   ```dart
   final allWeights = <String, QuestionWeight>{
     ...YourTestWeights.weights,  // Место 2
   };
   ```

### 📍 Где искать проблему
- `lib/services/summary_service.dart`: метод `getQuestionsWithPersonalityTypeWeights()`

---

## Ошибка #12: Нет текста вопросов/ответов в Summary

### 🔍 Симптомы
- При развёртывании шкалы показывает "Вопрос q1" вместо текста
- Показывает только цифру "2" вместо "2/4 (Иногда)"

### ✅ Решение (ДВА switch в summary_screen.dart)

1. **SWITCH 1** (~строка 69):
   ```dart
   case 'your_test_id':
     testModel = YourTestData.getYourTestTest();
     break;
   ```

2. **SWITCH 2** (~строка 2569):
   ```dart
   case 'your_test_id':
     testModel = YourTestData.getYourTestTest();
     break;
   ```

### 📍 Где искать проблему
- `lib/screens/summary_screen.dart`: методы `_getAnswerText()` и `_getQuestionText()`

---

## 🚨 Быстрая диагностика

### Используйте автоматическую проверку:
```bash
bash tools/validate_test.sh your_test_id
```

### Проверки скрипта:
- CHECK A: Файлы существуют
- CHECK B: Валидность шкал
- CHECK C: Дубликаты ключей
- CHECK D: Отрицательные веса на биполярных полюсах
- CHECK E-J: Регистрация во всех точках интеграции

### Если скрипт показывает ошибку:
1. Найдите номер CHECK (A-J)
2. Откройте соответствующую ошибку в этом документе
3. Следуйте инструкциям решения

---

## Ошибка #13: Weights не добавлены в summary_config._weights

### 🔍 Симптомы
- В результатах теста не показываются "Затронутые шкалы"
- Секция "Влияние на психологические шкалы" пустая или отсутствует
- В Summary не отображаются шкалы от нового теста

### ❌ Неправильно
```dart
// summary_config.dart - забыли добавить веса нового теста
static final Map<String, QuestionWeight> _weights = {
  ...IPIPBigFiveWeights.weights,
  ...DISCPersonalityWeights.weights,
  // Holland Code weights НЕ ДОБАВЛЕНЫ!
};
```

### ✅ Решение
Добавьте веса вашего теста в `_weights` map в `summary_config.dart`:
```dart
static final Map<String, QuestionWeight> _weights = {
  ...IPIPBigFiveWeights.weights,
  ...DISCPersonalityWeights.weights,
  ...HollandCodeWeights.weights,  // ← ДОБАВЛЕНО
};
```

### 📍 Где искать проблему
- Файл: `lib/config/summary_config.dart`
- Строка: ~2293 (ищите `static final Map<String, QuestionWeight> _weights`)

### ⚠️ Важно
Это ДОПОЛНИТЕЛЬНАЯ точка интеграции, которая легко забывается, так как находится отдельно от основного списка в summary_service.dart

---

## Ошибка #14: Использование неправильной переменной в test_service.dart

### 🔍 Симптомы
- Ошибка компиляции: `The getter 'testResult' isn't defined for the type 'TestService'`
- Build failed на этапе компиляции
- Сообщение: "Try correcting the name to the name of an existing getter"

### ❌ Неправильно
```dart
// BLOCK 3: Интерпретации (строка ~292)
} else if (testResult.testId == 'love_languages_v1') {
  final percentage = (score / maxFactorScore) * 100;
  interpretation = LoveLanguagesData.getFactorInterpretation(factorId, percentage);
}
```

### ✅ Решение
Используйте `test.id` вместо `testResult.testId`:
```dart
} else if (test.id == 'love_languages_v1') {
  final percentage = (score / maxFactorScore) * 100;
  interpretation = LoveLanguagesData.getFactorInterpretation(factorId, percentage);
}
```

### 📍 Где искать проблему
- Файл: `lib/services/test_service.dart`
- Метод: `getTestResult()` → BLOCK 3 (интерпретации)
- Строка: ~292

### ⚠️ Важно
В методе `getTestResult()` доступна переменная `test` (тип `TestModel`), а не `testResult`. Проверяйте условия как `test.id == 'your_test_id'`, следуя паттерну других тестов:
- ✅ `test.id == 'holland_code_v1'`
- ✅ `test.id == 'disc_personality_v1'`
- ❌ `testResult.testId == 'your_test_id'` (переменная не существует в этом контексте)

---

## Ошибка #15: Проценты >100% из-за неправильных scores

### 🔍 Симптомы
- В Summary/биполярных шкалах показывает 120%, 150% или другие значения >100%
- Максимальный ответ даёт больше 100%
- Формула: `answerScore / maxQuestionScore > 1.0`

### ❌ Неправильно
```dart
// Документация к тесту говорит "6-point Likert 1-6"
// Разработчик скопировал scores как есть:
final answers = [
  AnswerModel(..., score: 1),  // ❌
  AnswerModel(..., score: 2),
  AnswerModel(..., score: 3),
  AnswerModel(..., score: 4),
  AnswerModel(..., score: 5),
  AnswerModel(..., score: 6),  // ❌ 6/5 = 120%!
];
```

### ✅ Решение
**Всегда конвертируйте scores в 0-based:**
```dart
// Исходная документация: 1-6 → Конвертируем в: 0-5
final answers = [
  AnswerModel(text: {'ru': 'Совершенно не согласен', ...}, score: 0),  // было 1
  AnswerModel(text: {'ru': 'Не согласен', ...}, score: 1),              // было 2
  AnswerModel(text: {'ru': 'Скорее не согласен', ...}, score: 2),       // было 3
  AnswerModel(text: {'ru': 'Скорее согласен', ...}, score: 3),          // было 4
  AnswerModel(text: {'ru': 'Согласен', ...}, score: 4),                 // было 5
  AnswerModel(text: {'ru': 'Полностью согласен', ...}, score: 5),       // было 6
];
```

### 📍 Где искать проблему
- Data файл: `lib/data/your_test_data.dart`
- Массив `answers` в методе `_getQuestions()`

### ⚠️ Формула конвертации
```
Новый score = Исходный score - 1

Примеры:
- Документация 1-5 → Scores 0-4, maxQuestionScore = 4
- Документация 1-6 → Scores 0-5, maxQuestionScore = 5
- Документация 1-7 → Scores 0-6, maxQuestionScore = 6
```

### 🔗 См. также
- ПРАВИЛО #1: Scores ДОЛЖНЫ начинаться с 0
- ПРАВИЛО #8: maxQuestionScore = максимальный score

---

## Ошибка #15: Дубликаты ключей в bipolarWeights ⭐ NEW

### 🔍 Симптомы
- **Ошибка компиляции:** `Two keys in a constant map literal can't be equal. Change or remove the duplicate key.`
- Flutter analyze показывает: `equal_keys_in_const_map`
- Один вопрос указан несколько раз в `bipolarWeights`

### ❌ Неправильно
```dart
static const Map<String, Map<String, double>> bipolarWeights = {
  // E/I секция
  'motivational_strategies_v1:q2': {
    'extraversion': 0.6, // Altruist - social
  },

  // T/F секция
  'motivational_strategies_v1:q2': {  // ❌ ДУБЛИКАТ!
    'feeling': 0.8, // Altruist - helping
  },

  // J/P секция
  'motivational_strategies_v1:q7': {
    'perceiving': 0.6, // Optimist - spontaneity
  },

  'motivational_strategies_v1:q7': {  // ❌ ДУБЛИКАТ!
    'extraversion': 0.7, // Optimist - seeking experiences
  },
};
```

### ✅ Решение
**Объедините все веса для одного вопроса в ОДНОЙ записи:**
```dart
static const Map<String, Map<String, double>> bipolarWeights = {
  'motivational_strategies_v1:q2': {
    'extraversion': 0.6, // Altruist - social (E/I)
    'feeling': 0.8,      // Altruist - helping (T/F)
  },

  'motivational_strategies_v1:q7': {
    'extraversion': 0.7, // Optimist - seeking experiences (E/I)
    'perceiving': 0.6,   // Optimist - spontaneity (J/P)
  },
};
```

### 📍 Где искать проблему
- Weights файл: `lib/config/summary/question_weights/your_test_weights.dart`
- Секция `bipolarWeights`
- Поиск дубликатов: `grep "'your_test:q" weights_file.dart | sort | uniq -d`

### ⚠️ Важно
- Один вопрос МОЖЕТ влиять на несколько биполярных измерений
- Но все эти веса должны быть в ОДНОЙ записи Map
- Каждый ключ (`test_id:question_id`) должен встречаться РОВНО ОДИН РАЗ

### 💡 Как избежать
1. При планировании весов создайте таблицу:
   ```
   Question | E/I | S/N | T/F | J/P
   ---------|-----|-----|-----|----
   q1       |     | S:7 |     | J:7
   q2       | E:6 |     | F:8 |
   q7       | E:7 |     |     | P:6
   ```
2. Переносите в код построчно (один вопрос = одна запись)

### 🔗 См. также
- Ошибка #16: Несбалансированные биполярные веса

---

## Ошибка #16: Несбалансированное покрытие биполярных шкал (T/F и J/P) ⭐ NEW

### 🔍 Симптомы
- Тест влияет на E/I и S/N, но **НЕ влияет** на T/F и J/P
- Summary screen показывает 0% или неизменные значения для Thinking/Feeling и Judging/Perceiving
- Пользователи жалуются: "тест не показывает мой тип личности полностью"

### ❌ Неправильно
```dart
static const Map<String, Map<String, double>> bipolarWeights = {
  // Только E/I и S/N (8 вопросов)
  'test_v1:q2': {'extraversion': 0.6},
  'test_v1:q7': {'extraversion': 0.7},
  'test_v1:q23': {'introversion': 0.9},
  'test_v1:q32': {'introversion': 1.0},

  'test_v1:q1': {'sensing': 0.7},
  'test_v1:q4': {'intuition': 0.8},
  'test_v1:q22': {'intuition': 0.9},
  'test_v1:q55': {'sensing': 0.8},

  // ❌ T/F и J/P полностью отсутствуют!
};
```

### ✅ Решение
**Обеспечьте СБАЛАНСИРОВАННОЕ покрытие всех 4 измерений:**

```dart
static const Map<String, Map<String, double>> bipolarWeights = {
  // E/I - 8 вопросов ✅
  'test_v1:q2': {'extraversion': 0.6},
  'test_v1:q7': {'extraversion': 0.7},
  'test_v1:q8': {'extraversion': 0.7},
  'test_v1:q26': {'extraversion': 0.8},
  'test_v1:q47': {'extraversion': 0.5},
  'test_v1:q23': {'introversion': 0.9},
  'test_v1:q32': {'introversion': 1.0},
  'test_v1:q77': {'introversion': 0.9},

  // S/N - 7 вопросов ✅
  'test_v1:q1': {'sensing': 0.7},
  'test_v1:q6': {'sensing': 0.6},
  'test_v1:q55': {'sensing': 0.8},
  'test_v1:q4': {'intuition': 0.8},
  'test_v1:q22': {'intuition': 0.9},
  'test_v1:q31': {'intuition': 0.7},
  'test_v1:q52': {'intuition': 0.8},

  // T/F - минимум 10-12 вопросов ✅ NEW!
  'test_v1:q5': {'thinking': 0.8},   // Analyst - need understanding
  'test_v1:q14': {'thinking': 0.7},  // Analyst - observe and analyze
  'test_v1:q41': {'thinking': 0.6},  // Analyst - collect information
  'test_v1:q59': {'thinking': 1.0},  // Analyst - not emotional
  'test_v1:q68': {'thinking': 0.9},  // Analyst - detach emotions
  'test_v1:q44': {'thinking': 0.6},  // Leader - speak directly

  'test_v1:q10': {'feeling': 0.7},   // Idealist - upset by unethical
  'test_v1:q11': {'feeling': 0.8},   // Altruist - forget own needs
  'test_v1:q13': {'feeling': 0.6},   // Creator - deeply experience emotions
  'test_v1:q20': {'feeling': 0.7},   // Altruist - hard to ask for help
  'test_v1:q29': {'feeling': 0.8},   // Altruist - feel valuable when needed
  'test_v1:q35': {'feeling': 0.7},   // Leader - defend weak
  'test_v1:q38': {'feeling': 0.9},   // Altruist - sense emotions

  // J/P - минимум 15-20 вопросов ✅ NEW!
  'test_v1:q1': {'judging': 0.7},    // Idealist - correctly (с sensing)
  'test_v1:q15': {'judging': 0.8},   // Guardian - uncertainty anxiety
  'test_v1:q24': {'judging': 0.7},   // Guardian - value reliability
  'test_v1:q28': {'judging': 0.7},   // Idealist - criticize mistakes
  'test_v1:q33': {'judging': 0.6},   // Guardian - doubt decisions
  'test_v1:q37': {'judging': 0.8},   // Idealist - clear right/wrong
  'test_v1:q42': {'judging': 0.7},   // Guardian - loyal to trust
  'test_v1:q46': {'judging': 0.6},   // Idealist - always better way
  'test_v1:q51': {'judging': 0.8},   // Guardian - assess risks
  'test_v1:q60': {'judging': 0.9},   // Guardian - need order
  'test_v1:q78': {'judging': 0.7},   // Guardian - follow rules
  'test_v1:q87': {'judging': 0.9},   // Guardian - structured

  'test_v1:q7': {'perceiving': 0.6}, // Optimist - spontaneity (с extraversion)
  'test_v1:q16': {'perceiving': 0.8},// Optimist - difficulty boredom
  'test_v1:q18': {'perceiving': 0.5},// Harmonizer - adapt easily
  'test_v1:q25': {'perceiving': 0.9},// Optimist - keep options open
  'test_v1:q27': {'perceiving': 0.6},// Harmonizer - easier to agree
  'test_v1:q34': {'perceiving': 0.7},// Optimist - make tasks interesting
  'test_v1:q36': {'perceiving': 0.6},// Harmonizer - postpone decisions
  'test_v1:q43': {'perceiving': 0.7},// Optimist - impatient
  'test_v1:q45': {'perceiving': 0.5},// Harmonizer - hard to say no
  'test_v1:q52': {'perceiving': 0.6},// Optimist - possibilities (с intuition)
  'test_v1:q61': {'perceiving': 0.8},// Optimist - live in moment
  'test_v1:q70': {'perceiving': 0.7},// Optimist - spontaneous
  'test_v1:q79': {'perceiving': 0.6},// Optimist - avoid commitments
};
```

### 📊 Рекомендуемое минимальное покрытие

| Измерение | Минимум вопросов | Оптимально | Пример из теста |
|-----------|------------------|------------|-----------------|
| **E/I** | 6-8 | 10-12 | 8 вопросов (5E + 3I) |
| **S/N** | 6-8 | 10-12 | 7 вопросов (3S + 4N) |
| **T/F** | 10-12 | 14-16 | 13 вопросов (7T + 6F) ⭐ |
| **J/P** | 15-20 | 22-26 | 22 вопроса (11J + 11P) ⭐ |

### ⚠️ Почему J/P требует больше вопросов?

**J/P - самое сложное измерение** для определения, потому что:
1. Проявляется в поведении, а не в предпочтениях
2. Контекстно-зависимое (работа vs личная жизнь)
3. Легко спутать с другими чертами (тревожность ≠ judging)
4. Требует больше данных для точности

### 📍 Где искать проблему
- Weights файл: секция `bipolarWeights`
- Подсчет: `grep -c "'thinking'" weights_file.dart`
- Проверка баланса:
  ```bash
  echo "E/I: $(grep -E "'(extraversion|introversion)'" file.dart | wc -l)"
  echo "S/N: $(grep -E "'(sensing|intuition)'" file.dart | wc -l)"
  echo "T/F: $(grep -E "'(thinking|feeling)'" file.dart | wc -l)"
  echo "J/P: $(grep -E "'(judging|perceiving)'" file.dart | wc -l)"
  ```

### 💡 Какие вопросы выбирать для T/F и J/P?

**Thinking vs Feeling:**
- ✅ Эмоциональные vs логические решения
- ✅ Эмпатия и забота vs анализ и объективность
- ✅ Гармония отношений vs честность и правда
- ✅ Чувствительность к критике vs рациональное восприятие

**Judging vs Perceiving:**
- ✅ Планирование vs спонтанность
- ✅ Порядок и структура vs гибкость и адаптация
- ✅ Завершенность vs открытые варианты
- ✅ Дедлайны и обязательства vs свобода и исследование
- ✅ Определенность vs неопределенность

### 🔗 См. также
- Ошибка #15: Дубликаты ключей в bipolarWeights
- ПРАВИЛО #9: Биполярные веса для типа личности (ADDING_TEST_RULES.md)

---

## 📝 Чеклист отладки

При возникновении проблемы проверьте по порядку:

### Фаза 1: Компиляция
1. □ `flutter analyze` - нет ошибок компиляции?
2. □ Нет дубликатов ключей в `bipolarWeights`? (Ошибка #15)
3. □ `bash tools/validate_test.sh` - все CHECK пройдены?

### Фаза 2: Данные теста
4. □ Scores начинаются с 0 (не с 1)? (Ошибка #3)
5. □ Проценты не превышают 100%? (Ошибка #14)
6. □ maxQuestionScore правильный? (ПРАВИЛО #8)
7. □ NaN protection в getFactorInterpretation? (Ошибка #2)

### Фаза 3: Веса (Weights)
8. □ Все шкалы существуют в hierarchical_scales.dart?
9. □ Биполярные полюса без отрицательных весов? (ПРАВИЛО #4)
10. □ Weights добавлены в summary_config._weights?
11. □ **Биполярные веса сбалансированы?** ⭐ NEW
    - E/I: минимум 6-8 вопросов
    - S/N: минимум 6-8 вопросов
    - **T/F: минимум 10-12 вопросов** (Ошибка #16)
    - **J/P: минимум 15-20 вопросов** (Ошибка #16)

### Фаза 4: Интеграция
12. □ Правильное имя класса (без "Test")? (Ошибка #11)
13. □ Все 7 точек интеграции выполнены?
14. □ В test_service.dart используется `test.id` (не `testResult.testId`)? (Ошибка #14)
15. □ ProfileService обновлен (если есть профили)?

### Фаза 5: Запуск
16. □ Full restart (не hot reload)?
17. □ Пройден полный тест (все вопросы отвечены)?

---

### 🔍 Быстрая проверка баланса биполярных весов

```bash
# В папке с проектом:
cd lib/config/summary/question_weights/

# Подсчет весов для вашего теста:
TEST_ID="your_test_v1"  # замените на ваш test_id

echo "=== Баланс биполярных весов для $TEST_ID ==="
echo "E/I: $(grep -E "'(extraversion|introversion)'" ${TEST_ID//_v/_}_weights.dart | grep "$TEST_ID" | wc -l)"
echo "S/N: $(grep -E "'(sensing|intuition)'" ${TEST_ID//_v/_}_weights.dart | grep "$TEST_ID" | wc -l)"
echo "T/F: $(grep -E "'(thinking|feeling)'" ${TEST_ID//_v/_}_weights.dart | grep "$TEST_ID" | wc -l)"
echo "J/P: $(grep -E "'(judging|perceiving)'" ${TEST_ID//_v/_}_weights.dart | grep "$TEST_ID" | wc -l)"
echo ""
echo "Минимальные требования: E/I(6-8), S/N(6-8), T/F(10-12), J/P(15-20)"
```

---

## Ошибка #17: Неправильная структура weights для multi-choice тестов 🆕

### 🔍 Симптомы
- ✅ Тест компилируется и запускается
- ❌ НО: Нет влияния на шкалы summary screen
- ❌ НО: Профиль не отображается в результатах (даже если ProfileService настроен)
- ❌ НО: Нет описаний факторов в результатах теста

### ❓ Что это такое?
**Multi-choice тесты** — это ситуационные тесты, где каждый вопрос имеет несколько вариантов ответа, и **каждый вариант влияет на РАЗНЫЙ фактор** (не на один общий).

**Примеры:**
- Conflict Communication Style: 5 вариантов → 5 стилей (избегание, приспособление, соперничество, компромисс, сотрудничество)
- Digital Career Fit: 6 вариантов → 6 карьерных направлений

### ❌ Неправильно (weights per question)
```dart
// ОШИБКА: Веса привязаны к ВОПРОСАМ, но каждый вариант ответа влияет на разные шкалы!
class ConflictCommunicationStyleWeights {
  static const Map<String, QuestionWeight> weights = {
    'conflict_communication_style_v1:q1': QuestionWeight(
      testId: 'conflict_communication_style_v1',
      questionId: 'q1',
      axisWeights: {
        'cooperativeness': 1.0,  // ← Но какой вариант выбран?!
        'assertiveness': 0.9,
      },
    ),
    'conflict_communication_style_v1:q2': ...
  };
}
```

**Почему не работает:**
- Веса ищутся по ключу `testId:questionId` (например, `conflict_communication_style_v1:q1`)
- Но в multi-choice тестах каждый **ответ** (a/b/c/d/e) влияет на **разные факторы**!
- Результат: `summary_service` не находит веса, шкалы не обновляются

### ✅ Решение (weights per STYLE/FACTOR)
```dart
// ПРАВИЛЬНО: Веса привязаны к СТИЛЯМ, не к вопросам
class ConflictCommunicationStyleWeights {
  static const Map<String, QuestionWeight> weights = {
    // Каждый стиль имеет свои веса
    'conflict_communication_style_v1:avoiding': QuestionWeight(
      testId: 'conflict_communication_style_v1',
      questionId: 'avoiding',  // ← Используем название стиля как questionId
      axisWeights: {
        'conflict_avoidance': 1.0,
        'passivity': 0.9,
        'assertiveness': -0.8,
      },
    ),
    'conflict_communication_style_v1:accommodating': QuestionWeight(...),
    'conflict_communication_style_v1:competing': QuestionWeight(...),
    'conflict_communication_style_v1:compromising': QuestionWeight(...),
    'conflict_communication_style_v1:collaborating': QuestionWeight(...),
  };
}
```

**Почему работает:**
- У нас только 5 entries вместо 45
- Каждый стиль применяется независимо от того, какой вопрос его вызвал
- `summary_service` находит веса по ключу `testId:styleName`

### 📝 Дополнительно: Исправить summary_service.dart

Добавьте специальную логику для multi-choice тестов:

```dart
// В summary_service.dart, метод _calculateUnipolarScores
testResult.userAnswers!.forEach((questionId, answerScore) {
  String weightKey;

  // Special handling for multi-choice tests
  if (testId == 'conflict_communication_style_v1') {
    // Map answer score to factor using factorOrder
    final factorOrder = ['avoiding', 'accommodating', 'competing', 'compromising', 'collaborating'];
    if (answerScore >= 0 && answerScore < factorOrder.length) {
      final selectedFactor = factorOrder[answerScore];
      weightKey = '$testId:$selectedFactor';  // ← Ключ по фактору!
    } else {
      return; // Invalid score
    }
  } else {
    weightKey = '$testId:$questionId';  // ← Обычные тесты
  }

  final questionWeight = allWeights[weightKey];
  // ... rest of the logic
});
```

### 🔧 Как исправить существующий тест

**ШАГ 1:** Удалите старые веса per-question (45+ entries)

**ШАГ 2:** Создайте новые веса per-style/factor (5-6 entries)

**ШАГ 3:** Добавьте специальную логику в `summary_service.dart` (см. выше)

**ШАГ 4:** Убедитесь, что `factorOrder` в data-файле совпадает с порядком в weights

```dart
// В data-файле:
static const List<String> factorOrder = [
  'avoiding',      // score 0
  'accommodating', // score 1
  'competing',     // score 2
  'compromising',  // score 3
  'collaborating', // score 4
];
```

### 📍 Где искать проблему
- **Weights файл:** `lib/config/summary/question_weights/your_test_weights.dart` (должен быть ~200 строк, не 1000+)
- **Summary service:** `lib/services/summary_service.dart` (добавьте multi-choice логику)
- **Data файл:** `lib/data/your_test_data.dart` (проверьте factorOrder)

### ✅ Проверка
После исправления:
1. ✅ Тест компилируется
2. ✅ Влияет на шкалы summary screen
3. ✅ Профиль отображается в результатах
4. ✅ Описания факторов есть в результатах

### 📚 Связанные документы
- Ошибка #14: Использование test.id вместо testResult.testId
- `ADDING_SPECIAL_TESTS.md` - руководство по специальным тестам
- `ADDING_TEST_EXAMPLES.md` - примеры multi-choice тестов

---

> **💡 Совет:** Большинство ошибок ловится автоматической проверкой `validate_test.sh`!
>
> **⚠️ Новое:** Для multi-choice тестов используйте style-based weights, не question-based!