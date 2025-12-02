# 🎨 ADDING SPECIAL TESTS - Тесты с нестандартным UI

> **Специальная архитектура для тестов с уникальным интерфейсом**
>
> Этот документ описывает, как создавать тесты, которые не используют стандартный вопрос-ответ формат.

**Версия:** 1.1.0
**Дата:** 2025-01-18
**Примеры:** Color Psychology Test (6 этапов, 34+ взаимодействия, полный экран результатов)
**Обновлено:** Добавлен ЭТАП 9 с подробным описанием создания экрана результатов

---

## 🎯 Когда использовать специальную архитектуру?

### ✅ Используйте для тестов с:
- Нестандартным UI (drag-and-drop, сетки, карточки)
- Множественными этапами с разными типами взаимодействий
- Визуальными элементами (цвета, изображения, формы)
- Проективными методиками
- Сложной логикой взаимодействия (парные сравнения, ранжирование)
- Временными ограничениями на этапах
- Специфическим расчетом результатов

### ❌ НЕ используйте для:
- Обычных опросников (используйте стандартную архитектуру)
- Тестов с простыми вопросами и вариантами ответов
- Шкал Likert/Frequency/Intensity

---

## 📋 Общая архитектура специального теста

```
┌─────────────────────────────────────────┐
│ Test Stub (TestStub)                    │
│ - questionCount = количество этапов     │
│ - questions: []  (ПУСТОЙ список!)       │
│ - Специальный флаг в home_screen.dart  │
└─────────────────────────────────────────┘
           ↓
┌─────────────────────────────────────────┐
│ Data Models (custom)                    │
│ - Модели для каждого этапа             │
│ - Общая модель результата               │
│ - Конфигурация (таймеры, лимиты)       │
└─────────────────────────────────────────┘
           ↓
┌─────────────────────────────────────────┐
│ Widgets (по одному на этап)             │
│ - Stage 1 Widget                        │
│ - Stage 2 Widget                        │
│ - Stage N Widget                        │
└─────────────────────────────────────────┘
           ↓
┌─────────────────────────────────────────┐
│ Main Test Screen                        │
│ - Управление этапами                    │
│ - Сохранение промежуточных результатов  │
│ - Таймеры (опционально)                 │
└─────────────────────────────────────────┘
           ↓
┌─────────────────────────────────────────┐
│ Service Layer (scoring)                 │
│ - Специальная логика расчета            │
│ - Метрики согласованности               │
│ - Паттерны на основе всех этапов        │
└─────────────────────────────────────────┘
           ↓
┌─────────────────────────────────────────┐
│ Results Screen (custom)                 │
│ - Отображение всех результатов          │
│ - Визуализация данных                   │
└─────────────────────────────────────────┘
```

---

## 🚀 Пошаговое руководство (на примере Color Psychology Test)

### ЭТАП 1: Планирование теста

#### 1.1. Определите структуру этапов

**Пример:**
```
Тест: Цветовая психология (6 этапов, 12-15 минут)

Этап 1: Быстрый выбор (30 сек)
  - Выбор 3 любимых и 3 нелюбимых цветов
  - Сетка 2×5 с цветными карточками
  - Таймер с автопереходом

Этап 2: Ранжирование (60 сек)
  - Drag-and-drop сортировка 10 цветов
  - ReorderableListView
  - Таймер с автопереходом

Этап 3: Парные сравнения (2 мин)
  - 20 пар из 45 возможных
  - Выбор предпочитаемого цвета
  - Отслеживание времени реакции

Этап 4: Эмоциональные ассоциации
  - 8 эмоций → выбор цвета для каждой
  - Без таймера
  - Иконки для эмоций

Этап 5: Жизненные сферы
  - 6 сфер жизни + 4 ситуации → выбор цветов
  - Навигация вперед/назад
  - Без таймера

Этап 6: Временная перспектива
  - 5 вопросов (прошлое, настоящее, будущее, идеал, страх)
  - Выбор цвета для каждого
  - Без таймера
```

#### 1.2. Определите модели данных

**Необходимые классы:**
- Модель для каждого этапа результата
- Общая модель результата теста
- Конфигурационный класс
- Специфические данные (цвета, вопросы, эмоции и т.д.)

---

### ЭТАП 2: Создание моделей данных

#### 2.1. Создайте файл `/lib/models/your_test_model.dart`

**Шаблон:**
```dart
/// Модель данных для [название теста]
///
/// Содержит структуры данных для:
/// - Информации об элементах теста
/// - Результатов каждого этапа
/// - Общего результата
///
/// @version: 1.0.0

// Результат этапа 1
class Stage1Result {
  final List<String> selectedItems;
  final DateTime timestamp;

  Stage1Result({
    required this.selectedItems,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'selectedItems': selectedItems,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

// Результат этапа 2
class Stage2Result {
  // ... аналогично
}

// Общий результат теста
class YourTestResult {
  final String testId;
  final Stage1Result? stage1;
  final Stage2Result? stage2;
  // ... остальные этапы
  final Map<String, double> scaleScores;
  final Map<String, String> interpretations;
  final List<String> patterns;
  final Map<String, double> consistencyMetrics; // опционально
  final DateTime completedAt;

  YourTestResult({
    required this.testId,
    this.stage1,
    this.stage2,
    // ... остальные этапы
    required this.scaleScores,
    required this.interpretations,
    required this.patterns,
    Map<String, double>? consistencyMetrics,
    DateTime? completedAt,
  }) : consistencyMetrics = consistencyMetrics ?? {},
        completedAt = completedAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'testId': testId,
      'stage1': stage1?.toJson(),
      'stage2': stage2?.toJson(),
      // ... остальные этапы
      'scaleScores': scaleScores,
      'interpretations': interpretations,
      'patterns': patterns,
      'consistencyMetrics': consistencyMetrics,
      'completedAt': completedAt.toIso8601String(),
    };
  }
}

// Конфигурация теста
class YourTestConfig {
  // Временные лимиты
  static const int stage1TimeLimit = 30;
  static const int stage2TimeLimit = 60;
  static const int stage3TimeLimit = 0; // без лимита

  // Количества взаимодействий
  static const int stage1ItemsCount = 6;
  static const int stage2ItemsCount = 10;

  // Другие константы
  static const double consistencyThreshold = 0.7;
}
```

**Реальный пример (Color Psychology):**
```dart
class QuickChoiceResult {
  final List<String> likedColors;
  final List<String> dislikedColors;
  final DateTime timestamp;
  // ... toJson()
}

class PairedComparison {
  final String color1;
  final String color2;
  final String chosen;
  final int responseTimeMs;
  // ... toJson()
}

class PairedComparisonResult {
  final List<PairedComparison> comparisons;
  final Map<String, int> wins;
  final DateTime timestamp;
  // ... toJson()
}
```

---

### ЭТАП 3: Создание данных теста

#### 3.1. Создайте файл `/lib/data/your_test_data.dart`

**Шаблон:**
```dart
import '../models/your_test_model.dart';

class YourTestData {
  /// Основные элементы теста
  static const List<TestItem> items = [
    // Ваши элементы с билингвальными названиями
  ];

  /// Вопросы для этапа N (если нужны)
  static const List<Map<String, dynamic>> stageNQuestions = [
    {
      'id': 'question_1',
      'ru': 'Текст вопроса на русском',
      'en': 'Question text in English',
      'type': 'domain', // если есть типы
    },
    // ...
  ];

  /// Шкалы теста (опционально, если используете свои)
  static const List<YourTestScale> scales = [
    YourTestScale(
      id: 'scale_1',
      name: {'ru': 'Название', 'en': 'Name'},
      description: {'ru': 'Описание', 'en': 'Description'},
    ),
    // ...
  ];

  /// Получить элемент по ID
  static TestItem? getItemById(String id) {
    try {
      return items.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }
}
```

**Реальный пример (Color Psychology):**
```dart
class ColorPsychologyData {
  static const List<ColorInfo> colors = [
    ColorInfo(
      id: 'red',
      name: {'ru': 'Красный', 'en': 'Red'},
      hex: '#D32F2F',
      psychologicalMeaning: {
        'ru': 'Энергия, активность, агрессия',
        'en': 'Energy, activity, aggression',
      },
    ),
    // ... 9 остальных цветов
  ];

  static const List<Map<String, String>> emotionalAssociations = [
    {'id': 'joy', 'ru': 'Радость', 'en': 'Joy'},
    {'id': 'fear', 'ru': 'Страх', 'en': 'Fear'},
    // ... 6 остальных эмоций
  ];

  static const List<Map<String, String>> temporalPerspectives = [
    {'id': 'past', 'ru': 'Ваше прошлое', 'en': 'Your past'},
    // ...
  ];
}
```

---

### ЭТАП 4: Создание UI виджетов для каждого этапа

#### 4.1. Создайте виджет для каждого этапа

**Файловая структура:**
```
/lib/widgets/
  your_test_stage1_widget.dart
  your_test_stage2_widget.dart
  your_test_stage3_widget.dart
  ...
```

**Шаблон виджета:**
```dart
import 'package:flutter/material.dart';
import '../models/your_test_model.dart';
import '../data/your_test_data.dart';

/// Виджет для этапа N теста
///
/// Описание: что делает пользователь на этом этапе
/// Таймер: есть/нет
/// Взаимодействий: количество
///
/// @version: 1.0.0

class YourTestStageNWidget extends StatefulWidget {
  final Function(StageNResult) onComplete;
  final String locale; // 'ru' или 'en'

  const YourTestStageNWidget({
    Key? key,
    required this.onComplete,
    required this.locale,
  }) : super(key: key);

  @override
  State<YourTestStageNWidget> createState() => _YourTestStageNWidgetState();
}

class _YourTestStageNWidgetState extends State<YourTestStageNWidget> {
  // Состояние
  int _currentItemIndex = 0;
  final Map<String, String> _selections = {};
  DateTime? _startTime;

  // Таймер (если нужен)
  Timer? _timer;
  int _secondsRemaining = YourTestConfig.stageNTimeLimit;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    if (YourTestConfig.stageNTimeLimit > 0) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsRemaining--;
        if (_secondsRemaining <= 0) {
          _completeStage();
        }
      });
    });
  }

  void _onItemSelected(String itemId) {
    // Логика выбора
    setState(() {
      _selections['key'] = itemId;
      _currentItemIndex++;
      if (_currentItemIndex >= YourTestData.stageNItems.length) {
        _completeStage();
      }
    });
  }

  void _completeStage() {
    _timer?.cancel();
    widget.onComplete(StageNResult(
      selections: _selections,
    ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Заголовок и прогресс
        _buildHeader(context),

        // Основной контент
        Expanded(child: _buildContent(context)),

        // Подсказка/инструкция
        _buildHint(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            widget.locale == 'en'
                ? 'Stage N: Title'
                : 'Этап N: Название',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            widget.locale == 'en'
                ? 'Instruction text'
                : 'Текст инструкции',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          // Прогресс
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_currentItemIndex + 1} / ${YourTestData.stageNItems.length}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (_secondsRemaining > 0) ...[
                const SizedBox(width: 20),
                _buildTimer(context),
              ],
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: (_currentItemIndex + 1) / YourTestData.stageNItems.length,
            backgroundColor: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  Widget _buildTimer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _secondsRemaining <= 10
            ? Colors.red.withOpacity(0.1)
            : Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            Icons.timer,
            size: 16,
            color: _secondsRemaining <= 10 ? Colors.red : Colors.blue,
          ),
          const SizedBox(width: 4),
          Text(
            '${_secondsRemaining ~/ 60}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}',
            style: TextStyle(
              color: _secondsRemaining <= 10 ? Colors.red : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    // Ваш специфичный UI
    return Container(); // Замените на реальный контент
  }

  Widget _buildHint(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        widget.locale == 'en'
            ? 'Hint text'
            : 'Текст подсказки',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.grey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
```

#### 4.2. Типы UI компонентов для специальных тестов

**Сетка с выбором:**
```dart
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
    childAspectRatio: 1.5,
  ),
  itemCount: items.length,
  itemBuilder: (context, index) {
    final item = items[index];
    final isSelected = _selectedItems.contains(item.id);

    return GestureDetector(
      onTap: () => _onItemSelected(item.id),
      child: Container(
        decoration: BoxDecoration(
          color: Color(int.parse(item.color.replaceFirst('#', '0xFF'))),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: Colors.green, width: 3)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            item.name[widget.locale]!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  },
)
```

**Drag-and-drop ранжирование:**
```dart
ReorderableListView.builder(
  itemCount: items.length,
  onReorder: (oldIndex, newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex--;
      }
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  },
  itemBuilder: (context, index) {
    final item = items[index];
    return Card(
      key: ValueKey(item.id),
      color: _getCardColor(index),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(int.parse(item.color.replaceFirst('#', '0xFF'))),
        ),
        title: Text(item.name[widget.locale]!),
        trailing: const Icon(Icons.drag_handle),
      ),
    );
  },
)
```

**Парные сравнения:**
```dart
Row(
  children: [
    // Левый элемент
    Expanded(
      child: GestureDetector(
        onTap: () => _selectItem(item1.id),
        child: Container(
          // ... стилизация
          child: Center(child: Text(item1.name)),
        ),
      ),
    ),

    // Разделитель VS
    Container(
      padding: const EdgeInsets.all(12),
      child: Text('VS', style: TextStyle(fontWeight: FontWeight.bold)),
    ),

    // Правый элемент
    Expanded(
      child: GestureDetector(
        onTap: () => _selectItem(item2.id),
        child: Container(
          // ... стилизация
          child: Center(child: Text(item2.name)),
        ),
      ),
    ),
  ],
)
```

---

### ЭТАП 5: Создание главного экрана теста

#### 5.1. Создайте файл `/lib/screens/your_test_screen.dart`

**Шаблон:**
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../models/your_test_model.dart';
import '../data/your_test_data.dart';
import '../providers/locale_provider.dart';
import '../widgets/your_test_stage1_widget.dart';
import '../widgets/your_test_stage2_widget.dart';
import '../widgets/your_test_stage3_widget.dart';
import '../services/your_test_service.dart';
import 'your_test_result_screen.dart';

/// Экран теста [название] (специальная версия)
///
/// Реализует N этапов:
/// 1. Описание этапа 1
/// 2. Описание этапа 2
/// ...
///
/// @version: 1.0.0

class YourTestScreen extends StatefulWidget {
  const YourTestScreen({super.key});

  @override
  State<YourTestScreen> createState() => _YourTestScreenState();
}

class _YourTestScreenState extends State<YourTestScreen> {
  // Текущий этап
  int _currentStage = 0; // 0 - введение, 1-N - этапы теста

  // Результаты этапов
  Stage1Result? _stage1Result;
  Stage2Result? _stage2Result;
  Stage3Result? _stage3Result;
  // ... остальные этапы

  // Сервис для обработки результатов
  late final YourTestService _service;

  @override
  void initState() {
    super.initState();
    _service = YourTestService();
  }

  /// Переход к следующему этапу
  void _nextStage() {
    setState(() {
      _currentStage++;
    });

    if (_currentStage == N + 1) {
      // Все этапы завершены
      _processResults();
    }
  }

  /// Обработка результатов теста
  void _processResults() {
    final result = _service.calculateResult(
      stage1: _stage1Result!,
      stage2: _stage2Result!,
      stage3: _stage3Result!,
      // ... остальные этапы
    );

    // Сохранить результат (TODO)
    // _saveResult(result);

    // Перейти к экрану результатов
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => YourTestResultScreen(
          result: result,
        ),
      ),
    );
  }

  /// Обработчики для каждого этапа
  void _onStage1Complete(Stage1Result result) {
    setState(() {
      _stage1Result = result;
    });
    _nextStage();
  }

  void _onStage2Complete(Stage2Result result) {
    setState(() {
      _stage2Result = result;
    });
    _nextStage();
  }

  // ... остальные обработчики

  @override
  Widget build(BuildContext context) {
    final isRussian = context.watch<LocaleProvider>().isRussian;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isRussian ? 'Название теста' : 'Test Name',
        ),
      ),
      body: _buildBody(context, isRussian),
    );
  }

  Widget _buildBody(BuildContext context, bool isRussian) {
    final locale = isRussian ? 'ru' : 'en';

    switch (_currentStage) {
      case 0:
        return _buildIntroduction(context, isRussian);
      case 1:
        return YourTestStage1Widget(
          onComplete: _onStage1Complete,
          locale: locale,
        );
      case 2:
        return YourTestStage2Widget(
          onComplete: _onStage2Complete,
          locale: locale,
        );
      case 3:
        return YourTestStage3Widget(
          onComplete: _onStage3Complete,
          locale: locale,
        );
      // ... остальные этапы
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }

  Widget _buildIntroduction(BuildContext context, bool isRussian) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // О тесте
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isRussian ? 'О тесте' : 'About the Test',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isRussian
                        ? '''Описание теста на русском.

Что измеряет, методология, научная основа.'''
                        : '''Test description in English.

What it measures, methodology, scientific basis.''',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Этапы теста
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isRussian ? 'Как проходит тест' : 'How the Test Works',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  _buildStageInfo(
                    context,
                    '1',
                    isRussian ? 'Название этапа 1' : 'Stage 1 Name',
                    isRussian
                        ? 'Описание этапа 1 (время)'
                        : 'Stage 1 description (time)',
                    Icons.palette,
                  ),
                  const SizedBox(height: 12),
                  _buildStageInfo(
                    context,
                    '2',
                    isRussian ? 'Название этапа 2' : 'Stage 2 Name',
                    isRussian
                        ? 'Описание этапа 2 (время)'
                        : 'Stage 2 description (time)',
                    Icons.sort,
                  ),
                  // ... остальные этапы
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Важная информация
          Card(
            color: Colors.amber.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.amber),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      isRussian
                          ? 'Важно: Текст важного замечания.'
                          : 'Important: Important note text.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Кнопка начать
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _nextStage,
              icon: const Icon(Icons.play_arrow),
              label: Text(
                isRussian ? 'Начать тест' : 'Start Test',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStageInfo(
    BuildContext context,
    String number,
    String title,
    String description,
    IconData icon,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
```

---

### ЭТАП 6: Создание сервиса расчета результатов

#### 6.1. Создайте файл `/lib/services/your_test_service.dart`

**Шаблон:**
```dart
import 'dart:math' as math;
import '../models/your_test_model.dart';
import '../data/your_test_data.dart';

/// Сервис для обработки результатов теста [название]
///
/// Вычисляет психологические шкалы на основе:
/// - Этап 1
/// - Этап 2
/// - Этап N
///
/// @version: 1.0.0

class YourTestService {
  /// Рассчитать результат теста
  YourTestResult calculateResult({
    required Stage1Result stage1,
    required Stage2Result stage2,
    // ... остальные этапы
  }) {
    // Рассчитать баллы для каждой шкалы
    final scaleScores = _calculateScaleScores(
      stage1,
      stage2,
      // ...
    );

    // Получить интерпретации
    final interpretations = _getInterpretations(scaleScores);

    // Определить паттерны
    final patterns = _detectPatterns(
      stage1,
      stage2,
      // ...
      scaleScores,
    );

    // Расчет метрик согласованности (опционально)
    final consistencyMetrics = _calculateConsistencyMetrics(
      stage1,
      stage2,
      // ...
    );

    return YourTestResult(
      testId: 'your_test_v1',
      stage1: stage1,
      stage2: stage2,
      // ... остальные этапы
      scaleScores: scaleScores,
      interpretations: interpretations,
      patterns: patterns,
      consistencyMetrics: consistencyMetrics,
    );
  }

  /// Рассчитать баллы шкал
  Map<String, double> _calculateScaleScores(
    Stage1Result stage1,
    Stage2Result stage2,
    // ...
  ) {
    final scores = <String, double>{};

    // Логика расчета каждой шкалы
    scores['scale_1'] = _calculateScale1(stage1, stage2);
    scores['scale_2'] = _calculateScale2(stage1, stage2);
    // ...

    return scores;
  }

  /// Пример расчета шкалы
  double _calculateScale1(
    Stage1Result stage1,
    Stage2Result stage2,
  ) {
    double score = 0;

    // Анализ результатов этапа 1
    for (final item in stage1.selectedItems) {
      if (['item1', 'item2'].contains(item)) {
        score += 10;
      }
    }

    // Анализ результатов этапа 2
    // ... ваша логика

    // Нормализовать до 0-100
    return _normalize(score, 0, 100);
  }

  /// Нормализовать значение
  double _normalize(double value, double min, double max) {
    if (value.isNaN || value.isInfinite) return 0.0;
    value = value.clamp(min, max);
    return ((value - min) / (max - min)) * 100;
  }

  /// Получить интерпретации
  Map<String, String> _getInterpretations(Map<String, double> scores) {
    final interpretations = <String, String>{};

    for (final entry in scores.entries) {
      // Ваша логика интерпретации
      if (entry.value <= 40) {
        interpretations[entry.key] = 'Низкий уровень';
      } else if (entry.value <= 70) {
        interpretations[entry.key] = 'Средний уровень';
      } else {
        interpretations[entry.key] = 'Высокий уровень';
      }
    }

    return interpretations;
  }

  /// Выявить паттерны
  List<String> _detectPatterns(
    Stage1Result stage1,
    Stage2Result stage2,
    // ...
    Map<String, double> scores,
  ) {
    final patterns = <String>[];

    // Ваша логика выявления паттернов
    if (scores['scale_1']! > 80 && scores['scale_2']! > 80) {
      patterns.add('pattern_1');
    }

    // ...

    return patterns;
  }

  /// Расчет метрик согласованности (опционально)
  Map<String, double> _calculateConsistencyMetrics(
    Stage1Result stage1,
    Stage2Result stage2,
    // ...
  ) {
    final metrics = <String, double>{};

    // Согласованность между этапами
    int matches = 0;
    int total = 0;

    // Ваша логика
    // ...

    metrics['stage1_vs_stage2'] = (matches / total) * 100;
    metrics['overall'] = 75.0; // пример

    return metrics;
  }
}
```

---

### ЭТАП 7: Создание Test Stub

#### 7.1. Создайте файл `/lib/data/tests/your_test.dart`

**ВАЖНО:** Специальный тест имеет **пустой список вопросов**!

```dart
import '../../models/test_model.dart';
import 'test_stub.dart';

/// Test stub для [название теста]
///
/// Специальный тест с нестандартным интерфейсом
/// Использует отдельный экран YourTestScreen
/// вместо стандартного TestScreen
///
/// @version: 1.0.0

class YourTest extends TestStub {
  @override
  String get id => 'your_test_v1';

  @override
  String get category => 'emotional'; // или другая категория

  @override
  Map<String, String> get name => {
    'ru': 'Название теста',
    'en': 'Test Name',
  };

  @override
  Map<String, String> get description => {
    'ru': 'Краткое описание теста',
    'en': 'Brief test description',
  };

  @override
  int get questionCount => 6; // Количество ЭТАПОВ, не вопросов!

  @override
  int get estimatedMinutes => 15;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => ['emotional', 'projective', 'visual', 'quick'];

  @override
  String get assetPath => ''; // Legacy Dart - пустая строка

  static TestModel getYourTest() {
    return TestModel(
      id: 'your_test_v1',
      title: {
        'ru': 'Название теста',
        'en': 'Test Name',
      },
      description: {
        'ru': 'Полное описание теста. '
            'Тест состоит из N этапов: '
            '1. Описание этапа 1. '
            '2. Описание этапа 2. '
            '... '
            'Отвечайте интуитивно.',
        'en': 'Full test description. '
            'The test consists of N stages: '
            '1. Stage 1 description. '
            '2. Stage 2 description. '
            '... '
            'Answer intuitively.',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      factorIds: [
        'scale_1',
        'scale_2',
        // ... все ваши шкалы
      ],
      questions: [], // ⚠️ ВАЖНО: Пустой список для специальных тестов!
      estimatedTime: 15,
      type: TestType.multiFactor,
      disclaimer: {
        'ru': 'Текст дисклеймера на русском.',
        'en': 'Disclaimer text in English.',
      },
    );
  }
}
```

---

### ЭТАП 8: Интеграция в приложение

#### 8.1. Добавьте в test_registry.dart

```dart
import 'tests/your_test.dart';

static final List<TestStub> allTests = [
  // ... другие тесты

  // Ваш специальный тест
  YourTest(), // Special test with custom UI
];
```

#### 8.2. Добавьте в test_loader_service.dart

```dart
import '../data/tests/your_test.dart';

// В методе _loadLegacyTest:
case 'your_test_v1':
  test = YourTest.getYourTest();
  break;
```

#### 8.3. ⚠️ КРИТИЧНО: Добавьте специальную навигацию в home_screen.dart

**Это ключевой шаг для специальных тестов!**

```dart
import 'your_test_screen.dart';

// В методе onTap (где NavigatoronTap):
onTap: () async {
  // ... существующий код

  // ⚠️ СПЕЦИАЛЬНАЯ ПРОВЕРКА ДЛЯ НЕСТАНДАРТНЫХ ТЕСТОВ
  if (test.id == 'your_test_v1') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const YourTestScreen(),
      ),
    );
    return; // ⚠️ ВАЖНО: выйти из функции
  }

  // Стандартная навигация для обычных тестов
  final testModel = await testProvider.loadTest(test);
  // ...
}
```

**Реальный пример (Color Psychology):**
```dart
if (test.id == 'color_psychology_v1') {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ColorPsychologyTestScreen(),
    ),
  );
  return;
}
```

---

### ЭТАП 9: Создание экрана результатов (рекомендуется)

> **⚠️ ВАЖНО:** Для специальных тестов рекомендуется создать кастомный экран результатов,
> чтобы корректно отобразить данные всех этапов.

#### 9.1. Планирование структуры экрана результатов

**Определите, что нужно показать:**
1. Психологические шкалы (обязательно)
2. Выявленные паттерны (обязательно)
3. Результаты каждого этапа (специфично для теста)
4. Метрики согласованности (если есть)
5. Рекомендации (обязательно)

**Пример структуры для Color Psychology Test:**
```
📊 Заголовок + дата прохождения
📈 12 психологических шкал (с прогресс-барами)
🧩 Выявленные паттерны (с иконками и описаниями)
🎨 Цветовые предпочтения (топ-3 любимых, топ-3 нелюбимых)
⚖️ Парные сравнения (топ-5 цветов по победам)
😊 Эмоциональные ассоциации (8 эмоций → цвета)
🌳 Жизненные сферы (6 сфер + 4 ситуации → цвета)
⏳ Временная перспектива (5 измерений → цвета)
📊 Метрики согласованности (3 метрики с прогресс-барами)
💡 Рекомендации
```

#### 9.2. Создание файла экрана результатов

**Полный шаблон:**
```dart
// /lib/screens/your_test_result_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/your_test_model.dart';
import '../data/your_test_data.dart';
import '../providers/locale_provider.dart';

/// Экран результатов [название теста] (расширенная версия)
///
/// Отображает:
/// - N психологических шкал
/// - Выявленные паттерны
/// - Результаты всех этапов:
///   1. [Описание этапа 1]
///   2. [Описание этапа 2]
///   ...
/// - Метрики согласованности (опционально)
/// - Рекомендации
///
/// @version: 1.0.0

class YourTestResultScreen extends StatelessWidget {
  final YourTestResult result;

  const YourTestResultScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final isRussian = context.watch<LocaleProvider>().isRussian;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isRussian ? 'Результаты теста' : 'Test Results',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO: Implement sharing
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            _buildHeader(context, isRussian),
            const SizedBox(height: 24),

            // Психологические шкалы
            _buildScalesSection(context, isRussian),
            const SizedBox(height: 24),

            // Выявленные паттерны
            if (result.patterns.isNotEmpty) ...[
              _buildPatternsSection(context, isRussian),
              const SizedBox(height: 24),
            ],

            // Результаты этапа 1
            if (result.stage1 != null) ...[
              _buildStage1Section(context, isRussian),
              const SizedBox(height: 24),
            ],

            // Результаты этапа 2
            if (result.stage2 != null) ...[
              _buildStage2Section(context, isRussian),
              const SizedBox(height: 24),
            ],

            // ... секции для остальных этапов ...

            // Метрики согласованности
            if (result.consistencyMetrics.isNotEmpty) ...[
              _buildConsistencyMetricsSection(context, isRussian),
              const SizedBox(height: 24),
            ],

            // Рекомендации
            _buildRecommendationsSection(context, isRussian),
            const SizedBox(height: 24),

            // Кнопка завершения
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text(
                  isRussian ? 'Завершить' : 'Finish',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ... методы для построения секций (см. ниже)
}
```

#### 9.3. Методы для построения секций

**Пример: Секция психологических шкал**
```dart
Widget _buildScalesSection(BuildContext context, bool isRussian) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.assessment, color: Theme.of(context).primaryColor),
              const SizedBox(width: 12),
              Text(
                isRussian ? 'Психологические шкалы' : 'Psychological Scales',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...result.scaleScores.entries.map((entry) {
            return _buildScaleItem(
              context,
              entry.key,
              entry.value,
              isRussian,
            );
          }),
        ],
      ),
    ),
  );
}

Widget _buildScaleItem(
  BuildContext context,
  String scaleId,
  double value,
  bool isRussian,
) {
  final scaleName = _getScaleName(scaleId, isRussian);
  final color = _getScaleColor(scaleId, value);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              scaleName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${value.toStringAsFixed(0)}%',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: value / 100,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 8,
        ),
      ],
    ),
  );
}
```

**Пример: Секция результатов этапа (Color Psychology - Парные сравнения)**
```dart
Widget _buildPairedComparisonsSection(BuildContext context, bool isRussian) {
  final pairedComparisons = result.pairedComparisons!;

  // Сортируем по количеству побед
  final sortedWins = pairedComparisons.wins.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.compare, color: Theme.of(context).primaryColor),
              const SizedBox(width: 12),
              Text(
                isRussian ? 'Парные сравнения' : 'Paired Comparisons',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            isRussian
                ? 'Результаты выбора предпочитаемого цвета из 20 пар:'
                : 'Results of choosing preferred color from 20 pairs:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          ...sortedWins.take(5).map((entry) {
            return _buildWinItem(context, entry, isRussian);
          }),
        ],
      ),
    ),
  );
}
```

**Пример: Секция метрик согласованности**
```dart
Widget _buildConsistencyMetricsSection(BuildContext context, bool isRussian) {
  return Card(
    color: Colors.purple.withOpacity(0.05),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.analytics, color: Colors.purple),
              const SizedBox(width: 12),
              Text(
                isRussian ? 'Согласованность выборов' : 'Choice Consistency',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...result.consistencyMetrics.entries.map((entry) {
            return _buildConsistencyItem(
              context,
              entry.key,
              entry.value,
              isRussian,
            );
          }),
        ],
      ),
    ),
  );
}

Widget _buildConsistencyItem(
  BuildContext context,
  String metricId,
  double value,
  bool isRussian,
) {
  final color = value >= 0.7
      ? Colors.green
      : value >= 0.5
          ? Colors.amber
          : Colors.orange;

  final interpretation = value >= 0.7
      ? (isRussian ? 'Высокая' : 'High')
      : value >= 0.5
          ? (isRussian ? 'Средняя' : 'Medium')
          : (isRussian ? 'Низкая' : 'Low');

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                _getConsistencyLabel(metricId, isRussian),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Text(
              '${(value * 100).toStringAsFixed(0)}% ($interpretation)',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: value,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 6,
        ),
      ],
    ),
  );
}
```

#### 9.4. Вспомогательные методы

```dart
String _getScaleName(String scaleId, bool isRussian) {
  final scale = YourTestData.getScaleById(scaleId);
  return scale?.name[isRussian ? 'ru' : 'en'] ?? scaleId;
}

Color _getScaleColor(String scaleId, double value) {
  // Логика определения цвета в зависимости от значения
  // Например: низкие значения = красный, высокие = зеленый
  if (value <= 40) return Colors.red;
  if (value <= 70) return Colors.amber;
  return Colors.green;
}

IconData _getEmotionIcon(String emotionId) {
  switch (emotionId) {
    case 'joy': return Icons.sentiment_very_satisfied;
    case 'sadness': return Icons.sentiment_very_dissatisfied;
    case 'anger': return Icons.local_fire_department;
    // ... и т.д.
    default: return Icons.circle;
  }
}
```

#### 9.5. Полный пример для изучения

**Референсный файл:** `/lib/screens/color_psychology_result_screen.dart`

**Содержит реализацию:**
- ✅ Отображение 12 психологических шкал
- ✅ Визуализация результатов всех 6 этапов:
  - Быстрый выбор (любимые/нелюбимые цвета)
  - Ранжирование (полная последовательность)
  - Парные сравнения (топ-5 по победам)
  - Эмоциональные ассоциации (8 эмоций → цвета с иконками)
  - Жизненные сферы (6 сфер + 4 ситуации → цвета)
  - Временная перспектива (5 измерений с цветовым кодированием)
- ✅ Метрики согласованности (3 метрики с интерпретацией)
- ✅ Выявленные паттерны (с иконками и описаниями)
- ✅ Рекомендации
- ✅ Полная поддержка i18n (русский/английский)
- ✅ Адаптивный дизайн с прокруткой

**Строк кода:** ~1150 строк

---

## ⚠️ Критически важные моменты

### 1. ПУСТОЙ список вопросов
```dart
questions: [], // ⚠️ Обязательно пустой для специальных тестов!
```

### 2. Специальная навигация в home_screen.dart
```dart
if (test.id == 'your_test_v1') {
  Navigator.push(context, MaterialPageRoute(...));
  return; // ⚠️ ВАЖНО!
}
```

### 3. questionCount = количество этапов
```dart
@override
int get questionCount => 6; // Не количество вопросов, а этапов!
```

### 4. Управление состоянием
- Сохраняйте результаты каждого этапа отдельно
- Переходите к следующему этапу только после завершения текущего
- Обрабатывайте таймеры правильно (отменяйте в dispose)

### 5. Обработка ошибок
```dart
@override
void dispose() {
  _timer?.cancel(); // ⚠️ Всегда отменяйте таймеры!
  super.dispose();
}
```

---

## ✅ Чеклист для специального теста

### Подготовка
- [ ] Спланирована структура этапов
- [ ] Определены модели данных
- [ ] Определены UI компоненты для каждого этапа
- [ ] Определена логика расчета результатов
- [ ] Спланирована структура экрана результатов (что показывать)

### Создание файлов
- [ ] `/lib/models/your_test_model.dart` - модели данных
- [ ] `/lib/data/your_test_data.dart` - данные теста
- [ ] `/lib/widgets/your_test_stageN_widget.dart` - виджеты этапов (N файлов)
- [ ] `/lib/screens/your_test_screen.dart` - главный экран
- [ ] `/lib/services/your_test_service.dart` - сервис расчета
- [ ] `/lib/data/tests/your_test.dart` - test stub
- [ ] `/lib/screens/your_test_result_screen.dart` - экран результатов (рекомендуется)

### Интеграция
- [ ] Добавлен в `test_registry.dart`
- [ ] Добавлен в `test_loader_service.dart`
- [ ] ⚠️ Добавлена специальная навигация в `home_screen.dart`
- [ ] Убедились, что `questions: []` (пустой список)
- [ ] Убедились, что `questionCount` = количество этапов

### Тестирование
- [ ] Все этапы работают корректно
- [ ] Таймеры работают правильно (если есть)
- [ ] Навигация между этапами работает
- [ ] Расчет результатов корректен
- [ ] Экран результатов отображает данные всех этапов
- [ ] Все секции результатов корректно визуализируются
- [ ] Нет утечек памяти (таймеры отменяются)
- [ ] Приложение не крашится при быстром переключении
- [ ] Локализация (ru/en) работает везде (включая результаты)

---

## 📚 Примеры для изучения

### Референсный тест
**Color Psychology Test** (`color_psychology_v1`)
- 6 этапов
- 34+ взаимодействия
- 12 психологических шкал
- Метрики согласованности
- Drag-and-drop, парные сравнения, ассоциации

**Файлы для изучения:**
```
/lib/models/color_psychology_model.dart                      # Модели данных (6 result типов)
/lib/data/color_psychology_data.dart                         # Данные теста (цвета, эмоции, вопросы)
/lib/widgets/color_selection_widget.dart                     # Этап 1: Быстрый выбор
/lib/widgets/color_ranking_widget.dart                       # Этап 2: Ранжирование (drag-and-drop)
/lib/widgets/color_paired_comparisons_widget.dart            # Этап 3: Парные сравнения
/lib/widgets/color_emotional_associations_widget.dart        # Этап 4: Эмоции
/lib/widgets/color_life_domains_widget.dart                  # Этап 5: Жизненные сферы
/lib/widgets/color_temporal_perspective_widget.dart          # Этап 6: Временная перспектива
/lib/screens/color_psychology_test_screen.dart               # Главный экран (управление этапами)
/lib/screens/color_psychology_result_screen.dart             # ⭐ Экран результатов (1150 строк, все 6 этапов)
/lib/services/color_psychology_service.dart                  # Сервис расчета (12 шкал + метрики)
/lib/data/tests/color_psychology_test.dart                   # Test stub (пустой questions)
```

---

## 🚨 Типичные ошибки

### Ошибка #1: Забыли добавить специальную навигацию
**Симптом:** Приложение пытается открыть стандартный TestScreen и крашится

**Решение:**
```dart
// В home_screen.dart ПЕРЕД стандартной навигацией:
if (test.id == 'your_test_v1') {
  Navigator.push(context, MaterialPageRoute(...));
  return;
}
```

### Ошибка #2: Не пустой список вопросов
**Симптом:** TestScreen показывает пустой экран или крашится

**Решение:**
```dart
questions: [], // ВСЕГДА пустой для специальных тестов
```

### Ошибка #3: Не отменяются таймеры
**Симптом:** Утечки памяти, крашсчетчики продолжают работать после выхода

**Решение:**
```dart
@override
void dispose() {
  _timer?.cancel();
  super.dispose();
}
```

### Ошибка #4: questionCount = количество вопросов
**Симптом:** Неправильное отображение прогресса

**Решение:**
```dart
@override
int get questionCount => 6; // Количество ЭТАПОВ!
```

---

## 📊 Сравнение архитектур

| Аспект | Стандартная | Специальная |
|--------|------------|-------------|
| **UI** | Вопрос + варианты ответов | Кастомный UI для каждого этапа |
| **Навигация** | Автоматическая через TestScreen | Ручная в home_screen.dart |
| **questions** | Массив QuestionModel | Пустой массив [] |
| **Этапы** | Один (прохождение вопросов) | Множественные с разными UI |
| **Виджеты** | 1 (TestScreen) | N+1 (главный + виджет на этап) |
| **Сложность** | Низкая | Высокая |
| **Гибкость** | Ограниченная | Полная |

---

## 💡 Когда стоит использовать специальную архитектуру?

### ✅ Используйте, если:
1. Тест требует визуального взаимодействия (цвета, изображения, формы)
2. Нужны проективные методики (ассоциации, ранжирование)
3. Требуется drag-and-drop или сложные жесты
4. Множественные этапы с разной логикой
5. Нужны таймеры на этапах
6. Специфические метрики (согласованность, время реакции)

### ❌ НЕ используйте, если:
1. Обычный опросник с вопросами и ответами
2. Likert/Frequency/Intensity шкалы
3. Простая логика подсчета баллов
4. Один тип взаимодействия на весь тест

---

## 🎯 Пример 2: Forced Choice тест (Career Compass)

> **Career Compass** — тест с парными сравнениями (forced_choice), где пользователь выбирает один из двух вариантов в каждом вопросе.

### Характеристики Forced Choice тестов:

| Параметр | Значение |
|----------|----------|
| **Тип вопросов** | Парные сравнения (A vs B) |
| **Скоринг** | Ипсативный (очки распределяются между шкалами) |
| **UI** | Две карточки с "VS" разделителем |
| **Максимум на шкалу** | = количество появлений шкалы в вопросах |

### Структура файлов Career Compass:

```
lib/
├── models/
│   └── career_compass_model.dart      # Модели данных
├── data/
│   ├── career_compass_data.dart       # 56 вопросов, 8 шкал
│   └── tests/
│       └── career_compass_test.dart   # Test stub
├── widgets/
│   └── career_compass_question_widget.dart  # UI вопроса
├── services/
│   └── career_compass_service.dart    # Расчёт результатов
└── screens/
    ├── career_compass_test_screen.dart    # Главный экран
    └── career_compass_result_screen.dart  # Результаты
```

### ЭТАП 1: Модели данных

```dart
// lib/models/career_compass_model.dart

/// Вариант ответа в парном сравнении
class ForcedChoiceOption {
  final String text;
  final String scaleId;

  const ForcedChoiceOption({
    required this.text,
    required this.scaleId,
  });
}

/// Вопрос forced_choice
class ForcedChoiceQuestion {
  final int id;
  final Map<String, String> instruction;
  final ForcedChoiceOption optionA;
  final ForcedChoiceOption optionB;

  const ForcedChoiceQuestion({
    required this.id,
    required this.instruction,
    required this.optionA,
    required this.optionB,
  });
}

/// Ответ пользователя
class ForcedChoiceAnswer {
  final int questionId;
  final String chosenScaleId;  // ID выбранной шкалы
  final int responseTimeMs;
  final DateTime timestamp;

  ForcedChoiceAnswer({
    required this.questionId,
    required this.chosenScaleId,
    required this.responseTimeMs,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

/// Конфигурация теста
class CareerCompassConfig {
  static const int questionCount = 56;
  static const int scaleCount = 8;

  // ⚠️ КРИТИЧНО: maxScaleScore = количество появлений шкалы в вопросах!
  // Считается так: (questionCount * 2) / scaleCount
  // Для 56 вопросов и 8 шкал: (56 * 2) / 8 = 14
  static const int maxScaleScore = 14;

  static const String testId = 'career_compass_v1';
}
```

### ЭТАП 2: Данные теста

```dart
// lib/data/career_compass_data.dart

class CareerCompassData {
  /// Шкалы
  static const List<CareerScale> scales = [
    CareerScale(
      id: 'people',
      name: {'ru': 'Работа с людьми', 'en': 'Working with People'},
      icon: '👥',
      color: '#FF6B6B',
    ),
    // ... остальные шкалы
  ];

  /// Вопросы forced_choice
  static const List<ForcedChoiceQuestion> questions = [
    ForcedChoiceQuestion(
      id: 1,
      instruction: {'ru': 'Что вам ближе?', 'en': 'Which is closer to you?'},
      optionA: ForcedChoiceOption(
        text: 'Объяснять сложные вещи простым языком',
        scaleId: 'people',
      ),
      optionB: ForcedChoiceOption(
        text: 'Разбираться в сложных механизмах',
        scaleId: 'technology',
      ),
    ),
    // ... остальные 55 вопросов
  ];

  /// Интерпретации
  static Map<String, String> getScaleInterpretation(
    String scaleId,
    int score,
    bool isRussian,
  ) {
    // ⚠️ Пороги должны соответствовать maxScaleScore!
    // Для maxScaleScore = 14:
    // low: 0-4 (0-29%), medium: 5-9 (36-64%), high: 10-14 (71-100%)
    final level = score <= 4 ? 'low' : (score <= 9 ? 'medium' : 'high');
    // ...
  }
}
```

### ЭТАП 3: Виджет вопроса

```dart
// lib/widgets/career_compass_question_widget.dart

class CareerCompassQuestionWidget extends StatefulWidget {
  final ForcedChoiceQuestion question;
  final int questionNumber;
  final int totalQuestions;
  final Function(String scaleId, int responseTimeMs) onAnswer;
  final bool isRussian;

  // ...
}

class _CareerCompassQuestionWidgetState extends State<CareerCompassQuestionWidget> {
  DateTime? _questionStartTime;
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _questionStartTime = DateTime.now();
  }

  void _handleOptionSelected(String scaleId) {
    if (_selectedOption != null) return; // Предотвращаем двойное нажатие

    setState(() => _selectedOption = scaleId);

    final responseTime = DateTime.now()
        .difference(_questionStartTime!)
        .inMilliseconds;

    Future.delayed(const Duration(milliseconds: 200), () {
      widget.onAnswer(scaleId, responseTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Прогресс
        _buildProgressHeader(context),

        // Инструкция
        Text(widget.question.instruction[widget.isRussian ? 'ru' : 'en']!),

        // Вариант A
        _buildOptionCard(widget.question.optionA, 'A', Colors.blue),

        // VS разделитель
        Text('VS'),

        // Вариант B
        _buildOptionCard(widget.question.optionB, 'B', Colors.orange),
      ],
    );
  }

  Widget _buildOptionCard(ForcedChoiceOption option, String label, Color color) {
    final isSelected = _selectedOption == option.scaleId;

    return InkWell(
      onTap: _selectedOption == null
          ? () => _handleOptionSelected(option.scaleId)
          : null,
      child: Card(
        color: isSelected ? color.withOpacity(0.15) : Colors.white,
        child: Row(
          children: [
            // Буква (A или B)
            CircleAvatar(child: Text(label)),
            // Текст варианта
            Expanded(child: Text(option.text)),
            // Галочка при выборе
            if (isSelected) Icon(Icons.check_circle),
          ],
        ),
      ),
    );
  }
}
```

### ЭТАП 4: Сервис расчёта

```dart
// lib/services/career_compass_service.dart

class CareerCompassService {
  CareerCompassResult calculateResult({
    required List<ForcedChoiceAnswer> answers,
  }) {
    // 1. Подсчёт сырых баллов
    final scaleScores = _calculateScaleScores(answers);

    // 2. Нормализация к процентам
    final scalePercentages = _calculatePercentages(scaleScores);

    // 3. Топ-N шкал
    final topScales = _getTopScales(scaleScores, 3);

    // 4. Определение профиля
    final profileId = _matchProfile(topScales);

    return CareerCompassResult(
      scaleScores: scaleScores,
      scalePercentages: scalePercentages,
      topScales: topScales,
      profileId: profileId,
      // ...
    );
  }

  /// Подсчёт баллов (ипсативный скоринг)
  Map<String, int> _calculateScaleScores(List<ForcedChoiceAnswer> answers) {
    final scores = <String, int>{
      'people': 0,
      'analysis': 0,
      // ... все шкалы инициализируем нулём
    };

    for (final answer in answers) {
      // +1 балл выбранной шкале
      if (scores.containsKey(answer.chosenScaleId)) {
        scores[answer.chosenScaleId] = scores[answer.chosenScaleId]! + 1;
      }
    }

    return scores;
  }

  /// Нормализация к процентам
  Map<String, double> _calculatePercentages(Map<String, int> scores) {
    final percentages = <String, double>{};

    for (final entry in scores.entries) {
      // ⚠️ КРИТИЧНО: делим на maxScaleScore (14), а не на 7!
      final percentage = (entry.value / CareerCompassConfig.maxScaleScore) * 100;
      percentages[entry.key] = percentage.clamp(0.0, 100.0);
    }

    return percentages;
  }
}
```

### ⚠️ Критическая ошибка: Неправильный maxScaleScore

**Проблема:** Все шкалы показывают 100%

**Причина:** `maxScaleScore` установлен неправильно.

**Как рассчитать правильно:**

```dart
// Формула:
maxScaleScore = (количество_вопросов × 2) / количество_шкал

// Примеры:
// 56 вопросов, 8 шкал: (56 × 2) / 8 = 14
// 30 вопросов, 5 шкал: (30 × 2) / 5 = 12
// 28 вопросов, 7 шкал: (28 × 2) / 7 = 8
```

**Проверка через grep:**
```bash
# Подсчитать сколько раз каждая шкала появляется
grep -o "scaleId: '[^']*'" lib/data/career_compass_data.dart | sort | uniq -c

# Ожидаемый результат для 56 вопросов, 8 шкал:
#     14 scaleId: 'analysis'
#     14 scaleId: 'business'
#     ... (≈14 для каждой шкалы)
```

### ЭТАП 5: Интеграция в приложение

```dart
// 1. lib/data/test_registry.dart
import 'tests/career_compass_test.dart';

static final List<TestStub> allTests = [
  // ...
  CareerCompassTest(), // Добавить в нужную категорию
];

// 2. lib/services/test_loader_service.dart
import '../data/tests/career_compass_test.dart';

case 'career_compass_v1':
  test = CareerCompassTest.getCareerCompassTest();
  break;

// 3. lib/screens/home_screen.dart - КРИТИЧНО!
import 'career_compass_test_screen.dart';

// В методе _buildTestCard:
if (test.id == 'career_compass_v1') {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const CareerCompassTestScreen(),
    ),
  );
} else if (test.id == 'color_psychology_v1') {
  // ...
}
```

### Чеклист для Forced Choice теста

- [ ] Модели: `ForcedChoiceOption`, `ForcedChoiceQuestion`, `ForcedChoiceAnswer`
- [ ] Конфиг: `maxScaleScore` рассчитан правильно
- [ ] Данные: все вопросы с двумя вариантами (optionA, optionB)
- [ ] Виджет: защита от двойного нажатия, время ответа
- [ ] Сервис: ипсативный скоринг (+1 выбранной шкале)
- [ ] Сервис: нормализация делит на `maxScaleScore`
- [ ] Пороги интерпретаций соответствуют `maxScaleScore`
- [ ] Test stub: `questions: []` (пустой список!)
- [ ] home_screen.dart: специальная навигация добавлена
- [ ] Экран результатов: показывает "X из {maxScaleScore}"

---

## 🎓 Резюме

Специальные тесты дают полную свободу в создании UI и логики, но требуют:
1. Больше времени на разработку
2. Больше файлов и кода
3. Ручной контроль навигации
4. Тщательного тестирования

**Используйте специальную архитектуру только когда стандартная не подходит!**

---

**Последнее обновление:** 2025-01-23
**Версия документа:** 1.2.0 (добавлен Forced Choice тест - Career Compass)
**Примеры тестов:**
- Color Psychology Test (color_psychology_v1) - визуальный тест с 6 этапами
- Career Compass (career_compass_v1) - forced_choice с 56 вопросами
