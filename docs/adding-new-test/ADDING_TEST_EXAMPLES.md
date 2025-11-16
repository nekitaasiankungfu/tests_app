# 📝 ADDING TEST - Примеры кода

> **Готовые шаблоны для копирования при добавлении нового теста**
> Все примеры проверены и соответствуют версии 3.0.0

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

> **💡 Совет:** Копируйте эти примеры и адаптируйте под свой тест. Все примеры протестированы и работают!