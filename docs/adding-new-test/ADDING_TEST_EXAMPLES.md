# 📝 ADDING TEST - Примеры кода

> **Готовые шаблоны для копирования при добавлении нового теста**
> Все примеры проверены и соответствуют версии 3.4.1
> **NEW v3.4.1:** Добавлены примеры биполярных весов (E/I, S/N, T/F, J/P)
> **v3.4.0:** Добавлены примеры 7-секционной структуры результатов

---

## 📁 Файл 1: Test Stub

### Путь: `lib/data/tests/emotional_intelligence_test.dart`

```dart
import 'test_stub.dart';

/// Emotional Intelligence Test
///
/// Comprehensive assessment of emotional intelligence across 5 key dimensions:
/// self-awareness, self-regulation, motivation, empathy, and social skills.
/// Based on Goleman's EI framework.
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
    'ru': 'Оцените свою способность понимать эмоции и управлять ими',
    'en': 'Assess your ability to understand and manage emotions',
  };

  @override
  int get questionCount => 40;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor'; // или 'simple'

  @override
  List<String> get tags => [
    'personality',
    'emotional_intelligence',
    'eq',
    'comprehensive',
  ];

  @override
  String get assetPath => '';  // ← Пустая строка для Legacy Dart

  @override
  Map<String, dynamic> get metadata => {
    'version': '1.0.0',
    'author': 'Psycho Tests',
    'year': 2025,
    'category_display': {
      'ru': 'Личность',
      'en': 'Personality',
    },
    'factors': [
      'self_awareness',
      'self_regulation',
      'motivation',
      'empathy',
      'social_skills',
    ],
    'response_type': 'likert_5',
    'scientific_basis': [
      'Goleman Emotional Intelligence Theory',
      'Mayer-Salovey Four-Branch Model',
    ],
  };
}
```

---

## 📁 Файл 2: Data File (основная структура)

### Путь: `lib/data/emotional_intelligence_data.dart`

```dart
import '../models/test_model.dart';

/// Data access class for Emotional Intelligence Test
class EmotionalIntelligenceData {  // ← БЕЗ суффикса "Test"!

  /// Get the complete test
  static TestModel getEmotionalIntelligenceTest() {
    return TestModel(
      id: 'emotional_intelligence_test',
      title: {
        'ru': 'Тест на эмоциональный интеллект',
        'en': 'Emotional Intelligence Test',
      },
      description: {
        'ru': 'Этот тест оценивает вашу способность понимать свои и чужие эмоции...',
        'en': 'This test assesses your ability to understand your own and others\' emotions...',
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
        'ru': 'Этот тест предназначен только для самопознания и не является медицинским диагнозом.',
        'en': 'This test is for self-awareness only and is not a medical diagnosis.',
      },
    );
  }

  /// Get factor names for test_service.dart
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

  /// Get factor interpretation with NaN protection
  static Map<String, String> getFactorInterpretation(String factorId, double percentage) {
    // ⚠️ КРИТИЧНО: NaN protection (ПРАВИЛО #5)
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    switch (factorId) {
      case 'self_awareness':
        if (percentage < 33) {
          return {
            'ru': 'Низкое самосознание\n\nВам трудно распознавать свои эмоции. Рекомендуется практика ведения дневника эмоций.',
            'en': 'Low Self-Awareness\n\nYou find it difficult to recognize your emotions. Keeping an emotion journal is recommended.',
          };
        } else if (percentage < 67) {
          return {
            'ru': 'Среднее самосознание\n\nВы иногда распознаёте свои эмоции, но это требует усилий.',
            'en': 'Medium Self-Awareness\n\nYou sometimes recognize your emotions, but it requires effort.',
          };
        } else {
          return {
            'ru': 'Высокое самосознание\n\nВы хорошо понимаете свои эмоции и их влияние.',
            'en': 'High Self-Awareness\n\nYou understand your emotions well and their impact.',
          };
        }

      case 'self_regulation':
        // Аналогично для других факторов...

      default:
        return {
          'ru': 'Интерпретация недоступна',
          'en': 'Interpretation unavailable',
        };
    }
  }

  /// Private method to create questions
  static List<QuestionModel> _getQuestions() {
    return [
      // См. примеры вопросов ниже
    ];
  }

  /// Standard Likert scale answers (scores 0-4!)
  static List<AnswerModel> _getLikertAnswers() {
    return [
      AnswerModel(
        id: 'a1',
        text: {
          'ru': 'Совсем не согласен(на)',
          'en': 'Strongly Disagree',
        },
        score: 0,  // ← КРИТИЧНО: начинаем с 0!
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
        score: 4,  // ← КРИТИЧНО: заканчиваем на 4!
      ),
    ];
  }
}
```

---

## 📁 Примеры вопросов (для _getQuestions)

```dart
static List<QuestionModel> _getQuestions() {
  return [
    // Прямой вопрос
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

    // Обратный вопрос
    QuestionModel(
      id: 'q2',
      text: {
        'ru': 'Мне трудно контролировать свои эмоции',
        'en': 'I find it difficult to control my emotions',
      },
      factorId: 'self_regulation',
      isReversed: true,  // ← Обратный вопрос
      answers: _getLikertAnswers(),
    ),

    // Вопрос с кастомными ответами (частота)
    QuestionModel(
      id: 'q3',
      text: {
        'ru': 'Как часто вы чувствуете мотивацию?',
        'en': 'How often do you feel motivated?',
      },
      factorId: 'motivation',
      isReversed: false,
      answers: _getFrequencyAnswers(),  // Другой тип ответов
    ),

    // ... остальные вопросы
  ];
}

// Альтернативные ответы (частота)
static List<AnswerModel> _getFrequencyAnswers() {
  return [
    AnswerModel(
      id: 'f1',
      text: {'ru': 'Никогда', 'en': 'Never'},
      score: 0,
    ),
    AnswerModel(
      id: 'f2',
      text: {'ru': 'Редко', 'en': 'Rarely'},
      score: 1,
    ),
    AnswerModel(
      id: 'f3',
      text: {'ru': 'Иногда', 'en': 'Sometimes'},
      score: 2,
    ),
    AnswerModel(
      id: 'f4',
      text: {'ru': 'Часто', 'en': 'Often'},
      score: 3,
    ),
    AnswerModel(
      id: 'f5',
      text: {'ru': 'Всегда', 'en': 'Always'},
      score: 4,
    ),
  ];
}
```

---

## 📁 Файл 3: Weights File

### Путь: `lib/config/summary/question_weights/emotional_intelligence_weights.dart`

```dart
import 'question_weight_models.dart';

/// Weight mappings for Emotional Intelligence Test
class EmotionalIntelligenceWeights {

  static final Map<String, QuestionWeight> weights = {

    // Question 1: "Я легко распознаю свои эмоции"
    'emotional_intelligence_test:q1': QuestionWeight(
      testId: 'emotional_intelligence_test',
      questionId: 'q1',
      axisWeights: {
        // ✅ Используем ТОЛЬКО существующие шкалы!
        'emotional_awareness': 1.2,
        'self_awareness': 1.0,
        'mindfulness': 0.8,
        'introspection': 0.7,
        'emotional_intelligence': 1.1,
      },
    ),

    // Question 2: "Мне трудно контролировать эмоции" (обратный)
    'emotional_intelligence_test:q2': QuestionWeight(
      testId: 'emotional_intelligence_test',
      questionId: 'q2',
      axisWeights: {
        // Обратный вопрос - используем отрицательные веса
        'emotional_regulation': -1.0,    // (reversed)
        'self_control': -0.9,            // (reversed)
        'impulse_control': -0.8,         // (reversed)
        'emotional_stability': -0.7,     // (reversed)
        'neuroticism': 0.6,              // Прямая связь
      },
    ),

    // Question 3: "Как часто вы чувствуете мотивацию?"
    'emotional_intelligence_test:q3': QuestionWeight(
      testId: 'emotional_intelligence_test',
      questionId: 'q3',
      axisWeights: {
        'intrinsic_motivation': 1.0,
        'achievement_striving': 0.9,
        'persistence': 0.8,
        'goal_orientation': 0.7,
        'optimism': 0.6,
        // Для Personality Type - используем полюса
        'extraversion': 0.4,  // НЕ отрицательный!
      },
    ),

    // ... веса для остальных 37 вопросов
  };
}
```

### ⭐ ВАЖНО: Добавление весов для биполярных шкал (E/I, S/N, T/F, J/P)

**Когда добавлять биполярные веса:**
- Если вопрос измеряет экстраверсию/интроверсию → добавьте `extraversion` или `introversion`
- Если вопрос о конкретике/абстракции → добавьте `sensing` или `intuition`
- Если вопрос о логике/эмпатии → добавьте `thinking` или `feeling`
- Если вопрос о планировании/гибкости → добавьте `judging` или `perceiving`

**Пример: Values and Priorities Test**

```dart
// Q1: Важность стабильности → влияет на J (планирование)
'values_priorities_v1:q1': QuestionWeight(
  testId: 'values_priorities_v1',
  questionId: 'q1',
  axisWeights: {
    'need_for_security': 1.0,
    'stability': 0.9,
    'prudence': 0.8,
    // Bipolar: J/P
    'judging': 0.7,  // Стабильность → планирование, структура
  },
),

// Q5: Важность свободы выбора → влияет на P (гибкость)
'values_priorities_v1:q5': QuestionWeight(
  testId: 'values_priorities_v1',
  questionId: 'q5',
  axisWeights: {
    'autonomy_need': 1.0,
    'independence': 0.9,
    // Bipolar: J/P
    'perceiving': 0.8,  // Свобода выбора → гибкость, P
  },
),

// Q13: Важность творчества → влияет на N (интуиция)
'values_priorities_v1:q13': QuestionWeight(
  testId: 'values_priorities_v1',
  questionId: 'q13',
  axisWeights: {
    'creativity': 1.0,
    'artistic_interests': 0.9,
    // Bipolar: S/N
    'intuition': 0.9,  // Творчество, абстрактное мышление → N
  },
),

// Q17: Важность близких отношений → влияет на F (эмоции)
'values_priorities_v1:q17': QuestionWeight(
  testId: 'values_priorities_v1',
  questionId: 'q17',
  axisWeights: {
    'intimacy': 1.0,
    'emotional_intimacy': 1.0,
    'warmth': 0.8,
    'extraversion': 0.6,  // Социальный аспект → E
    // Bipolar: T/F
    'feeling': 0.8,  // Эмоциональная связь, ценности → F
  },
),
```

**Пример: Attachment Styles Test**

```dart
// Q1: Легко открываюсь партнёру → влияет на E и F
'attachment_styles_v1:q1': QuestionWeight(
  testId: 'attachment_styles_v1',
  questionId: 'q1',
  axisWeights: {
    'emotional_openness': 1.0,
    'vulnerability_sharing': 0.9,
    'secure_attachment': 0.9,
    // Bipolar: E/I
    'extraversion': 0.7,  // Открытость в общении → E
    // Bipolar: T/F
    'feeling': 0.8,  // Эмоциональная открытость → F
  },
),

// Q3: Предпочитаю не сближаться → влияет на I
'attachment_styles_v1:q3': QuestionWeight(
  testId: 'attachment_styles_v1',
  questionId: 'q3',
  axisWeights: {
    'emotional_distance': 1.0,
    'avoidant_attachment': 0.9,
    'intimacy_avoidance': 0.8,
    // Bipolar: E/I
    'introversion': 0.7,  // Избегание близости → I
  },
),

// Q21: Буду с партнёром даже в сложные времена → влияет на J
'attachment_styles_v1:q21': QuestionWeight(
  testId: 'attachment_styles_v1',
  questionId: 'q21',
  axisWeights: {
    'commitment': 1.0,
    'relationship_stability': 0.9,
    'loyalty': 0.8,
    // Bipolar: J/P
    'judging': 0.6,  // Стабильность, долгосрочное планирование → J
  },
),

// Q27: Сложно выражать эмоции → влияет на T
'attachment_styles_v1:q27': QuestionWeight(
  testId: 'attachment_styles_v1',
  questionId: 'q27',
  axisWeights: {
    'emotional_expression_difficulty': 1.0,
    'emotional_detachment': 0.8,
    'avoidant_attachment': 0.7,
    // Bipolar: T/F
    'thinking': 0.8,  // Логика важнее эмоций → T
  },
),
```

**📝 Примечание:** Attachment Styles test не влияет на S/N (сенсорика/интуиция), так как измеряет паттерны отношений, а не способы обработки информации.

**🔴 КРИТИЧЕСКИЕ ПРАВИЛА для биполярных весов:**

1. ✅ **НИКОГДА не используйте отрицательные веса** для биполярных полюсов
   - ❌ Неправильно: `'extraversion': -0.7`
   - ✅ Правильно: `'introversion': 0.7`

2. ✅ **Используйте только положительные веса 0.5-1.0**
   - Слабое влияние: 0.5-0.6
   - Среднее влияние: 0.7-0.8
   - Сильное влияние: 0.9-1.0

3. ✅ **8 полюсов для 4 биполярных шкал:**
   - E/I: `extraversion`, `introversion`
   - S/N: `sensing`, `intuition`
   - T/F: `thinking`, `feeling`
   - J/P: `judging`, `perceiving`

4. ✅ **Не все вопросы должны влиять на биполярные шкалы**
   - Добавляйте только когда вопрос ЯВНО измеряет эти когнитивные предпочтения
   - Например, тесты тревожности НЕ влияют на E/I, S/N, T/F, J/P

**Примеры тестов с биполярными весами:**
- ✅ Values and Priorities: 20 весов на все 4 шкалы (E/I, S/N, T/F, J/P)
- ✅ Attachment Styles: 11 весов на 3 шкалы (E/I: 6, T/F: 4, J/P: 2) - S/N не применимо
- ✅ Love Languages: веса на E/I (социальность), T/F (эмпатия)
- ✅ DISC Personality: веса на E/I, T/F
- ❌ Anxiety Symptoms: НЕ влияет на биполярные шкалы (измеряет симптоматику)

---

## 📁 Примеры интеграции

### В test_registry.dart

```dart
import 'tests/emotional_intelligence_test.dart';

class TestRegistry {
  static final List<TestStub> allTests = [
    // ... существующие тесты
    EmotionalIntelligenceTest(),  // ← Добавить
  ];
}
```

### В test_loader_service.dart

```dart
import '../data/emotional_intelligence_data.dart';

TestModel? _loadLegacyTest(String testId) {
  switch (testId) {
    // ... существующие case
    case 'emotional_intelligence_test':
      test = EmotionalIntelligenceData.getEmotionalIntelligenceTest();
      break;
  }
}
```

### В test_service.dart (для scores 0-4)

```dart
// Если тест использует scores 0-4 (5 вариантов ответа)
final int maxQuestionScore = test.id == 'fisher_temperament'
    ? 3
    : test.id == 'emotional_intelligence_test'  // ← Добавить
        ? 4  // scores 0-4
        : 5; // Default (scores 0-5)
```

### В summary_service.dart

```dart
import '../config/summary/question_weights/emotional_intelligence_weights.dart';

// В методе getQuestionsWithPersonalityTypeWeights()
final allWeights = <String, QuestionWeight>{
  ...IPIPBigFiveWeights.weights,
  ...EmotionalIntelligenceWeights.weights,  // ← Добавить
};
```

### В summary_screen.dart

```dart
import '../data/emotional_intelligence_data.dart';

// SWITCH 1: метод _getAnswerText
case 'emotional_intelligence_test':
  testModel = EmotionalIntelligenceData.getEmotionalIntelligenceTest();
  break;

// SWITCH 2: метод _getQuestionText
case 'emotional_intelligence_test':
  testModel = EmotionalIntelligenceData.getEmotionalIntelligenceTest();
  break;
```

---

## 📋 Типы ответов (готовые методы)

### Likert Scale (согласие)
```dart
static List<AnswerModel> _getLikertAnswers() {
  return [
    AnswerModel(id: 'a1', score: 0, text: {'ru': 'Совсем не согласен(на)', 'en': 'Strongly Disagree'}),
    AnswerModel(id: 'a2', score: 1, text: {'ru': 'Скорее не согласен(на)', 'en': 'Disagree'}),
    AnswerModel(id: 'a3', score: 2, text: {'ru': 'Нейтрально', 'en': 'Neutral'}),
    AnswerModel(id: 'a4', score: 3, text: {'ru': 'Скорее согласен(на)', 'en': 'Agree'}),
    AnswerModel(id: 'a5', score: 4, text: {'ru': 'Полностью согласен(на)', 'en': 'Strongly Agree'}),
  ];
}
```

### Frequency (частота)
```dart
static List<AnswerModel> _getFrequencyAnswers() {
  return [
    AnswerModel(id: 'f1', score: 0, text: {'ru': 'Никогда', 'en': 'Never'}),
    AnswerModel(id: 'f2', score: 1, text: {'ru': 'Редко', 'en': 'Rarely'}),
    AnswerModel(id: 'f3', score: 2, text: {'ru': 'Иногда', 'en': 'Sometimes'}),
    AnswerModel(id: 'f4', score: 3, text: {'ru': 'Часто', 'en': 'Often'}),
    AnswerModel(id: 'f5', score: 4, text: {'ru': 'Всегда', 'en': 'Always'}),
  ];
}
```

### Intensity (интенсивность)
```dart
static List<AnswerModel> _getIntensityAnswers() {
  return [
    AnswerModel(id: 'i1', score: 0, text: {'ru': 'Совсем не', 'en': 'Not at all'}),
    AnswerModel(id: 'i2', score: 1, text: {'ru': 'Немного', 'en': 'A little'}),
    AnswerModel(id: 'i3', score: 2, text: {'ru': 'Умеренно', 'en': 'Moderately'}),
    AnswerModel(id: 'i4', score: 3, text: {'ru': 'Сильно', 'en': 'Very'}),
    AnswerModel(id: 'i5', score: 4, text: {'ru': 'Чрезвычайно', 'en': 'Extremely'}),
  ];
}
```

### Yes/No/Maybe (3 варианта)
```dart
static List<AnswerModel> _getYesNoMaybeAnswers() {
  return [
    AnswerModel(id: 'yn1', score: 0, text: {'ru': 'Нет', 'en': 'No'}),
    AnswerModel(id: 'yn2', score: 2, text: {'ru': 'Возможно', 'en': 'Maybe'}),
    AnswerModel(id: 'yn3', score: 4, text: {'ru': 'Да', 'en': 'Yes'}),
  ];
}
```

---

## ⚠️ Критические моменты

### ✅ ВСЕГДА проверяйте:

1. **Scores 0-4** (не 1-5!)
2. **Имя класса без "Test"** в data файле
3. **NaN protection** в getFactorInterpretation
4. **Существующие шкалы** (195 психологических + 8 биполярных)
5. **Биполярные полюса** без отрицательных весов
6. **maxQuestionScore** если не 0-5

### ❌ НИКОГДА не используйте:

1. **FactorModel** - устаревший API
2. **Несуществующие шкалы** - придуманные названия
3. **Отрицательные веса** на биполярных полюсах
4. **Scores 1-5** - всегда 0-4

---

## 🔧 Полезные команды

### Проверка после добавления
```bash
# Анализ кода
flutter analyze

# Автоматическая валидация
bash tools/validate_test.sh emotional_intelligence_test

# Полный перезапуск
flutter clean && flutter run
```

### Поиск проблем
```bash
# Найти scores 1-5
grep "score: [1-5]" lib/data/emotional_intelligence_data.dart

# Найти отрицательные веса на биполярных полюсах
grep "'\\(extra\\|intro\\)version': -" lib/config/summary/question_weights/emotional_intelligence_weights.dart

# Проверить дубликаты ключей
sort lib/config/summary/question_weights/emotional_intelligence_weights.dart | uniq -d
```

---

## 📁 Файл 4: Профильная структура результатов (7 секций) ⭐ NEW

> **Для профильных тестов** (карьерные, типология личности, стили поведения)
> **Референс:** Digital Career Fit Test (`digital_career_fit_v1`)

### Модель профиля

```dart
/// Модель профиля результата теста
class TestProfile {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, List<String>> characteristics;    // Секция 3
  final Map<String, List<String>> recommendations;    // Секция 5
  final Map<String, List<String>> suitableRoles;      // Секция 4
  final Map<String, String> tryToday;                 // Секция 6
  final Map<String, String> inspiringMessage;         // Секция 7

  const TestProfile({
    required this.id,
    required this.name,
    required this.description,
    required this.characteristics,
    required this.recommendations,
    required this.suitableRoles,
    required this.tryToday,
    required this.inspiringMessage,
  });

  // Геттеры с fallback на английский
  String getName(String lang) => name[lang] ?? name['en'] ?? '';
  String getDescription(String lang) => description[lang] ?? description['en'] ?? '';
  List<String> getCharacteristics(String lang) => characteristics[lang] ?? characteristics['en'] ?? [];
  List<String> getRecommendations(String lang) => recommendations[lang] ?? recommendations['en'] ?? [];
  List<String> getSuitableRoles(String lang) => suitableRoles[lang] ?? suitableRoles['en'] ?? [];
  String getTryToday(String lang) => tryToday[lang] ?? tryToday['en'] ?? '';
  String getInspiringMessage(String lang) => inspiringMessage[lang] ?? inspiringMessage['en'] ?? '';
}
```

### Пример профиля

```dart
static final List<TestProfile> profiles = [
  TestProfile(
    id: 'profile_analyst',
    name: {
      'ru': 'Аналитик данных',
      'en': 'Data Analyst',
    },
    description: {
      'ru': 'У вас выраженный интерес к данным и закономерностям. Вы любите опираться на факты.',
      'en': 'You have a pronounced interest in data and patterns. You like to rely on facts.',
    },
    characteristics: {
      'ru': [
        'Вам нравится работать с таблицами и находить закономерности',
        'Вы предпочитаете проверять гипотезы, а не полагаться на ощущения',
        'Умеете понятно объяснять сложные вещи простым языком',
      ],
      'en': [
        'You enjoy working with tables and finding patterns',
        'You prefer to test hypotheses rather than rely on feelings',
        'You can explain complex things in simple terms',
      ],
    },
    recommendations: {
      'ru': [
        'Освойте SQL — базовый инструмент для работы с данными',
        'Изучите основы статистики: средние, распределения, A/B-тесты',
        'Попробуйте инструменты визуализации (Power BI, Tableau)',
      ],
      'en': [
        'Master SQL — the basic tool for working with data',
        'Learn statistics basics: means, distributions, A/B tests',
        'Try visualization tools (Power BI, Tableau)',
      ],
    },
    suitableRoles: {
      'ru': ['Data Analyst', 'Продуктовый аналитик', 'BI-аналитик'],
      'en': ['Data Analyst', 'Product Analyst', 'BI Analyst'],
    },
    tryToday: {
      'ru': 'Найдите открытый датасет и попробуйте построить простой график.',
      'en': 'Find an open dataset and try to build a simple chart.',
    },
    inspiringMessage: {
      'ru': 'Ваши аналитические способности — ценный актив в мире данных.',
      'en': 'Your analytical skills are a valuable asset in the world of data.',
    },
  ),

  // ⚠️ ОБЯЗАТЕЛЬНО: fallback профиль
  TestProfile(
    id: 'profile_mixed',
    name: {'ru': 'Смешанный профиль', 'en': 'Mixed Profile'},
    description: {
      'ru': 'У вас несколько сильных направлений без явного доминирования.',
      'en': 'You have several strong directions without clear dominance.',
    },
    characteristics: {
      'ru': ['Вам интересны разные области', 'Вы легко переключаетесь между задачами'],
      'en': ['You are interested in different areas', 'You easily switch between tasks'],
    },
    recommendations: {
      'ru': ['Попробуйте разные роли', 'Отслеживайте, что даёт больше энергии'],
      'en': ['Try different roles', 'Track what gives you more energy'],
    },
    suitableRoles: {
      'ru': ['Гибридные позиции', 'Кросс-функциональные роли'],
      'en': ['Hybrid positions', 'Cross-functional roles'],
    },
    tryToday: {
      'ru': 'Выберите одно направление и углубитесь в него на неделю.',
      'en': 'Choose one direction and dive into it for a week.',
    },
    inspiringMessage: {
      'ru': 'Широкий профиль — преимущество в современном мире.',
      'en': 'A broad profile is an advantage in the modern world.',
    },
  ),
];
```

### Логика определения профиля

```dart
/// Определяет профиль: доминантная шкала с разрывом >= 10%
static String determineProfile(Map<String, double> percentages) {
  if (percentages.isEmpty) return 'profile_mixed';

  // Находим доминирующую шкалу
  String? dominantScale;
  double maxPercentage = 0;
  for (final entry in percentages.entries) {
    if (entry.value > maxPercentage) {
      maxPercentage = entry.value;
      dominantScale = entry.key;
    }
  }

  // Маппинг шкал на профили
  final scaleToProfile = {
    'data_analytics': 'profile_analyst',
    'design_ux': 'profile_designer',
    'tech_development': 'profile_developer',
    // ... остальные
  };

  // Проверяем разрыв
  final sorted = percentages.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  if (sorted.length >= 2 && sorted[0].value - sorted[1].value < 10) {
    return 'profile_mixed';  // Разрыв < 10% = смешанный
  }

  return scaleToProfile[dominantScale] ?? 'profile_mixed';
}
```

### 7 секций результата

| № | Секция | Поле в TestProfile | UI метод |
|---|--------|-------------------|----------|
| 1 | Ваш профиль | `name` | `_buildProfileCard()` |
| 2 | Почему именно он | `description` | `_buildProfileCard()` |
| 3 | Сильные стороны | `characteristics` | `_buildSectionCard()` |
| 4 | Подходящие направления | `suitableRoles` | `_buildSectionCard()` |
| 5 | Рекомендации | `recommendations` | `_buildSectionCard()` |
| 6 | Что сделать сегодня | `tryToday` | `_buildTextCard()` |
| 7 | Вдохновляющий вывод | `inspiringMessage` | `_buildTextCard(highlight: true)` |

> **📖 Полная документация:** [ADDING_TEST_RESULTS.md](./ADDING_TEST_RESULTS.md)

---

> **💡 Совет:** Копируйте эти примеры и адаптируйте под свой тест. Все примеры протестированы и работают!