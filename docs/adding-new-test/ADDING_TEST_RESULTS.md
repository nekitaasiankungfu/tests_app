# 🎯 ADDING TEST RESULTS - Расширенная структура результатов

> **Версия:** 1.0.0
> **Дата:** 2025-01-23
> **Референс:** Digital Career Fit Test (`digital_career_fit_v1`)
> **Применение:** Профильные тесты с определением типа/профиля пользователя

---

## 📋 7-секционная структура результатов

Все профильные тесты (определяющие тип личности, карьерный профиль, стиль поведения и т.д.) должны использовать унифицированную 7-секционную структуру результатов:

| № | Секция | Описание | Пример |
|---|--------|----------|--------|
| 1 | **Ваш профиль** | Главный вывод - название определённого профиля | "Разработчик / технический специалист" |
| 2 | **Почему именно он** | Обоснование на основе доминирующих шкал | "У вас высокая шкала tech_development (85%)" |
| 3 | **Ваши сильные стороны** | Список характеристик профиля | "• Вам нравится логика и структурность" |
| 4 | **Подходящие направления** | Профессии/роли для данного профиля | "– Frontend разработчик" |
| 5 | **Рекомендации по развитию** | Как развиваться в этом направлении | "• Освойте базовый язык программирования" |
| 6 | **Что попробовать сегодня** | Конкретное действие прямо сейчас | "Напишите простую программу Hello World" |
| 7 | **Вдохновляющий вывод** | Мотивирующее завершение | "Ваши склонности создают хороший фундамент..." |

---

## 📁 Структура файлов

### Необходимые компоненты:

```
lib/
├── data/
│   └── your_test_data.dart          # Данные профилей + логика определения
├── screens/
│   └── test_result_screen.dart      # UI для отображения (модификация)
└── models/
    └── (опционально) your_test_model.dart  # Модели данных
```

---

## 📄 Файл 1: Data File с профилями

### Путь: `lib/data/your_test_data.dart`

```dart
import '../models/test_model.dart';

/// Data access class for Your Test
class YourTestData {

  // ============================================================
  // ЧАСТЬ 1: Стандартные методы теста (getTest, getFactorNames, etc.)
  // ============================================================

  static TestModel getYourTest() {
    // ... стандартная реализация
  }

  // ============================================================
  // ЧАСТЬ 2: Профили результатов (7 секций)
  // ============================================================

  /// Порядок факторов для определения профиля
  static const List<String> factorOrder = [
    'factor_1',
    'factor_2',
    'factor_3',
    // ... все факторы теста
  ];

  /// Все профили теста
  static final List<TestProfile> profiles = [
    TestProfile(
      id: 'profile_type_a',
      name: {
        'ru': 'Профиль А',
        'en': 'Profile A',
      },
      description: {
        'ru': 'Описание профиля А. Что означает этот результат для пользователя.',
        'en': 'Profile A description. What this result means for the user.',
      },
      characteristics: {
        'ru': [
          'Характеристика 1: что вам свойственно',
          'Характеристика 2: ваша особенность',
          'Характеристика 3: ваше преимущество',
          'Характеристика 4: что вас отличает',
          'Характеристика 5: ваша сильная сторона',
        ],
        'en': [
          'Characteristic 1: what is typical for you',
          'Characteristic 2: your feature',
          'Characteristic 3: your advantage',
          'Characteristic 4: what distinguishes you',
          'Characteristic 5: your strength',
        ],
      },
      recommendations: {
        'ru': [
          'Рекомендация 1: что изучить',
          'Рекомендация 2: как практиковаться',
          'Рекомендация 3: какие навыки развивать',
          'Рекомендация 4: с чего начать',
          'Рекомендация 5: куда двигаться дальше',
        ],
        'en': [
          'Recommendation 1: what to learn',
          'Recommendation 2: how to practice',
          'Recommendation 3: which skills to develop',
          'Recommendation 4: where to start',
          'Recommendation 5: where to go next',
        ],
      },
      suitableRoles: {
        'ru': [
          'Роль/профессия 1',
          'Роль/профессия 2',
          'Роль/профессия 3',
          'Роль/профессия 4',
        ],
        'en': [
          'Role/profession 1',
          'Role/profession 2',
          'Role/profession 3',
          'Role/profession 4',
        ],
      },
      tryToday: {
        'ru': 'Конкретное действие, которое можно сделать уже сегодня для развития в этом направлении.',
        'en': 'A specific action you can take today to develop in this direction.',
      },
      inspiringMessage: {
        'ru': 'Вдохновляющее сообщение о потенциале пользователя и его возможностях роста.',
        'en': 'Inspiring message about the user\'s potential and growth opportunities.',
      },
    ),

    // ... остальные профили

    // ВАЖНО: Всегда добавляйте "смешанный" профиль как fallback!
    TestProfile(
      id: 'profile_mixed',
      name: {
        'ru': 'Смешанный профиль',
        'en': 'Mixed Profile',
      },
      description: {
        'ru': 'У вас нет одной ярко выраженной области — зато есть несколько сильных направлений.',
        'en': 'You don\'t have one dominant area — but you have several strong directions.',
      },
      characteristics: {
        'ru': [
          'Вам интересны сразу несколько направлений',
          'Вы легко переключаетесь между задачами',
          'Часто выступаете связующим звеном между специалистами',
        ],
        'en': [
          'You are interested in several directions at once',
          'You easily switch between tasks',
          'Often act as a link between specialists',
        ],
      },
      recommendations: {
        'ru': [
          'Попробуйте разные роли в учебных проектах',
          'Отслеживайте, какие задачи дают больше энергии',
          'Рассмотрите гибридные роли',
        ],
        'en': [
          'Try different roles in learning projects',
          'Track which tasks give you more energy',
          'Consider hybrid roles',
        ],
      },
      suitableRoles: {
        'ru': ['Гибридные позиции', 'Кросс-функциональные роли'],
        'en': ['Hybrid positions', 'Cross-functional roles'],
      },
      tryToday: {
        'ru': 'Выберите одно направление и попробуйте углубиться в него на неделю.',
        'en': 'Choose one direction and try to dive deeper into it for a week.',
      },
      inspiringMessage: {
        'ru': 'Широкий профиль — это преимущество в современном мире.',
        'en': 'A broad profile is an advantage in the modern world.',
      },
    ),
  ];

  // ============================================================
  // ЧАСТЬ 3: Логика определения профиля
  // ============================================================

  /// Определяет профиль на основе процентов по шкалам
  ///
  /// Алгоритм: находит доминирующую шкалу. Если разрыв с 2-й >= 10%,
  /// возвращает соответствующий профиль. Иначе - "mixed".
  static String determineProfile(Map<String, double> percentages) {
    if (percentages.isEmpty) {
      return 'profile_mixed';
    }

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
      'factor_1': 'profile_type_a',
      'factor_2': 'profile_type_b',
      'factor_3': 'profile_type_c',
      // ... остальные маппинги
    };

    // Проверяем разрыв между 1-м и 2-м местом
    final sortedPercentages = percentages.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedPercentages.length >= 2) {
      final first = sortedPercentages[0].value;
      final second = sortedPercentages[1].value;

      // Если разрыв меньше 10% - это смешанный профиль
      if (first - second < 10) {
        return 'profile_mixed';
      }
    }

    return scaleToProfile[dominantScale] ?? 'profile_mixed';
  }

  /// Получить профиль по ID
  static TestProfile? getProfile(String profileId) {
    try {
      return profiles.firstWhere((p) => p.id == profileId);
    } catch (e) {
      return null;
    }
  }
}

// ============================================================
// МОДЕЛЬ ПРОФИЛЯ
// ============================================================

/// Модель профиля результата теста
class TestProfile {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final Map<String, List<String>> characteristics;
  final Map<String, List<String>> recommendations;
  final Map<String, List<String>> suitableRoles;
  final Map<String, String> tryToday;
  final Map<String, String> inspiringMessage;

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

  String getName(String languageCode) => name[languageCode] ?? name['en'] ?? '';
  String getDescription(String languageCode) => description[languageCode] ?? description['en'] ?? '';
  List<String> getCharacteristics(String languageCode) => characteristics[languageCode] ?? characteristics['en'] ?? [];
  List<String> getRecommendations(String languageCode) => recommendations[languageCode] ?? recommendations['en'] ?? [];
  List<String> getSuitableRoles(String languageCode) => suitableRoles[languageCode] ?? suitableRoles['en'] ?? [];
  String getTryToday(String languageCode) => tryToday[languageCode] ?? tryToday['en'] ?? '';
  String getInspiringMessage(String languageCode) => inspiringMessage[languageCode] ?? inspiringMessage['en'] ?? '';
}
```

---

## 📄 Файл 2: Интеграция в test_result_screen.dart

### Добавить import:

```dart
import '../data/your_test_data.dart';
```

### Добавить условие в build():

```dart
// В методе build(), в Column children:
if (widget.result.testId == 'your_test_id') ...[
  // Главная карточка профиля (секции 1-2)
  _buildYourTestProfileCard(widget.result, languageCode, themeColor, isDark),
] else
  _buildResultCard(widget.result, languageCode, themeColor, isDark),

// После факторных шкал:
if (widget.result.testId == 'your_test_id') ...[
  const SizedBox(height: 20),
  // Расширенные секции (секции 3-7)
  _buildYourTestExtendedSection(widget.result, languageCode, themeColor, isDark),
],
```

### Добавить методы отображения:

```dart
/// Главная карточка профиля (секции 1: Профиль, 2: Почему)
Widget _buildYourTestProfileCard(
  TestResult result,
  String languageCode,
  Color themeColor,
  bool isDark
) {
  // Вычисляем проценты по шкалам
  final percentages = <String, double>{};
  if (result.factorScores != null) {
    for (final entry in result.factorScores!.entries) {
      final factor = entry.value;
      final percentage = factor.maxScore > 0
          ? (factor.score / factor.maxScore) * 100
          : 0.0;
      percentages[entry.key] = percentage;
    }
  }

  // Определяем профиль
  final profileId = YourTestData.determineProfile(percentages);
  final profile = YourTestData.getProfile(profileId);

  if (profile == null) {
    return _buildResultCard(result, languageCode, themeColor, isDark);
  }

  return Container(
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: isDark ? [
          AppColors.darkCard,
          AppColors.darkSurfaceHigh,
        ] : [
          themeColor.withOpacity(0.15),
          themeColor.withOpacity(0.05),
        ],
      ),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isDark ? Colors.grey[700]! : themeColor.withOpacity(0.3),
        width: 1,
      ),
    ),
    child: Column(
      children: [
        // Иконка профиля
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: themeColor.withOpacity(isDark ? 0.3 : 0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            _getYourTestProfileIcon(profileId),
            size: 50,
            color: isDark ? Colors.white : themeColor,
          ),
        ),
        const SizedBox(height: 20),

        // Секция 1: Название профиля
        Text(
          languageCode == 'ru' ? 'Ваш профиль' : 'Your Profile',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          profile.getName(languageCode),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : themeColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        // Секция 2: Описание (почему этот профиль)
        Text(
          profile.getDescription(languageCode),
          style: TextStyle(
            fontSize: 15,
            height: 1.5,
            color: isDark ? Colors.grey[300] : Colors.grey[700],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

/// Расширенные секции (3-7)
Widget _buildYourTestExtendedSection(
  TestResult result,
  String languageCode,
  Color themeColor,
  bool isDark
) {
  final percentages = <String, double>{};
  if (result.factorScores != null) {
    for (final entry in result.factorScores!.entries) {
      final factor = entry.value;
      final percentage = factor.maxScore > 0
          ? (factor.score / factor.maxScore) * 100
          : 0.0;
      percentages[entry.key] = percentage;
    }
  }

  final profileId = YourTestData.determineProfile(percentages);
  final profile = YourTestData.getProfile(profileId);

  if (profile == null) {
    return const SizedBox.shrink();
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Секция 3: Сильные стороны
      _buildSectionCard(
        title: languageCode == 'ru' ? 'Ваши сильные стороны' : 'Your Strengths',
        icon: Icons.star_outline,
        items: profile.getCharacteristics(languageCode),
        themeColor: themeColor,
        isDark: isDark,
      ),
      const SizedBox(height: 20),

      // Секция 4: Подходящие роли
      _buildSectionCard(
        title: languageCode == 'ru' ? 'Подходящие направления' : 'Suitable Directions',
        icon: Icons.work_outline,
        items: profile.getSuitableRoles(languageCode),
        themeColor: themeColor,
        isDark: isDark,
      ),
      const SizedBox(height: 20),

      // Секция 5: Рекомендации
      _buildSectionCard(
        title: languageCode == 'ru' ? 'Как развиваться' : 'How to Develop',
        icon: Icons.trending_up,
        items: profile.getRecommendations(languageCode),
        themeColor: themeColor,
        isDark: isDark,
      ),
      const SizedBox(height: 20),

      // Секция 6: Что попробовать сегодня
      _buildTextCard(
        title: languageCode == 'ru' ? 'Что попробовать сегодня' : 'Try Today',
        icon: Icons.today,
        text: profile.getTryToday(languageCode),
        themeColor: themeColor,
        isDark: isDark,
      ),
      const SizedBox(height: 20),

      // Секция 7: Вдохновляющий вывод
      _buildTextCard(
        title: languageCode == 'ru' ? 'Итог' : 'Conclusion',
        icon: Icons.auto_awesome,
        text: profile.getInspiringMessage(languageCode),
        themeColor: themeColor,
        isDark: isDark,
        highlight: true,
      ),
    ],
  );
}

/// Карточка с текстом (для секций 6-7)
Widget _buildTextCard({
  required String title,
  required IconData icon,
  required String text,
  required Color themeColor,
  required bool isDark,
  bool highlight = false,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: highlight
          ? (isDark ? themeColor.withOpacity(0.2) : themeColor.withOpacity(0.1))
          : (isDark ? AppColors.darkCard : Colors.white),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: highlight
            ? themeColor.withOpacity(0.3)
            : (isDark ? Colors.grey[700]! : Colors.grey[200]!),
        width: 1,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: themeColor, size: 24),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.grey[800],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            height: 1.6,
            color: isDark ? Colors.grey[300] : Colors.grey[700],
          ),
        ),
      ],
    ),
  );
}

/// Иконка профиля
IconData _getYourTestProfileIcon(String profileId) {
  switch (profileId) {
    case 'profile_type_a':
      return Icons.lightbulb_outline;
    case 'profile_type_b':
      return Icons.analytics_outlined;
    case 'profile_mixed':
      return Icons.hub_outlined;
    default:
      return Icons.person_outline;
  }
}
```

---

## ✅ Чеклист для добавления расширенных результатов

### В data файле:
- [ ] Добавить `factorOrder` - порядок факторов
- [ ] Создать класс `TestProfile` (или переиспользовать существующий)
- [ ] Добавить `profiles` список со всеми профилями
- [ ] Для каждого профиля заполнить все 7 секций:
  - [ ] `name` - название профиля
  - [ ] `description` - описание (секция "Почему")
  - [ ] `characteristics` - сильные стороны
  - [ ] `suitableRoles` - подходящие направления
  - [ ] `recommendations` - как развиваться
  - [ ] `tryToday` - что сделать сегодня
  - [ ] `inspiringMessage` - вдохновляющий вывод
- [ ] Добавить профиль `profile_mixed` как fallback
- [ ] Реализовать `determineProfile()` с логикой определения
- [ ] Реализовать `getProfile()` для получения по ID

### В test_result_screen.dart:
- [ ] Добавить import data файла
- [ ] Добавить условие `if (widget.result.testId == '...')` в build()
- [ ] Добавить метод `_buildYourTestProfileCard()`
- [ ] Добавить метод `_buildYourTestExtendedSection()`
- [ ] Добавить метод `_getYourTestProfileIcon()`
- [ ] (Опционально) Добавить `_buildTextCard()` если ещё нет

---

## 🔍 Референс: Digital Career Fit Test

Полная реализация доступна в:
- `lib/data/digital_career_fit_data.dart` - профили и логика
- `lib/screens/test_result_screen.dart:841-1060` - UI отображение

**Особенности реализации:**
1. 7 профилей (6 специализированных + 1 смешанный)
2. Логика определения: доминантная шкала с разрывом >= 10%
3. Полная локализация ru/en
4. Адаптация под тёмную тему

---

> **💡 Важно:** Всегда добавляйте профиль `profile_mixed` как fallback для случаев, когда нет явного доминирования одной шкалы!
