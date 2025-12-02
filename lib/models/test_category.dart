/// Test category model for organizing tests into groups
class TestCategory {
  final String id;
  final Map<String, String> name;
  final Map<String, String> description;
  final String icon;
  final int order; // For sorting categories

  const TestCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.order,
  });

  /// Get localized category name
  String getName(String languageCode) =>
      name[languageCode] ?? name['ru'] ?? id;

  /// Get localized category description
  String getDescription(String languageCode) =>
      description[languageCode] ?? description['ru'] ?? '';
}

/// Predefined test categories
class TestCategories {
  static const personality = TestCategory(
    id: 'personality',
    name: {
      'ru': 'Типология личности',
      'en': 'Personality Typology',
    },
    description: {
      'ru': 'Тесты для определения типа личности и характера',
      'en': 'Tests to determine personality type and character',
    },
    icon: '🎭',
    order: 1,
  );

  static const temperament = TestCategory(
    id: 'temperament',
    name: {
      'ru': 'Темперамент',
      'en': 'Temperament',
    },
    description: {
      'ru': 'Биологические особенности нервной системы',
      'en': 'Biological characteristics of nervous system',
    },
    icon: '🧠',
    order: 2,
  );

  static const relationships = TestCategory(
    id: 'relationships',
    name: {
      'ru': 'Отношения',
      'en': 'Relationships',
    },
    description: {
      'ru': 'Тесты о любви, партнёрстве и коммуникации',
      'en': 'Tests about love, partnership and communication',
    },
    icon: '❤️',
    order: 3,
  );

  static const emotional = TestCategory(
    id: 'emotional',
    name: {
      'ru': 'Эмоциональное состояние',
      'en': 'Emotional State',
    },
    description: {
      'ru': 'Оценка стресса, самооценки и эмоционального благополучия',
      'en': 'Assessment of stress, self-esteem and emotional well-being',
    },
    icon: '🌟',
    order: 4,
  );

  static const career = TestCategory(
    id: 'career',
    name: {
      'ru': 'Карьера и профориентация',
      'en': 'Career and Vocational Guidance',
    },
    description: {
      'ru': 'Тесты для выбора карьеры и профессиональной ориентации',
      'en': 'Tests for career choice and professional orientation',
    },
    icon: '💼',
    order: 5,
  );

  static const intelligence = TestCategory(
    id: 'intelligence',
    name: {
      'ru': 'Интеллект и способности',
      'en': 'Intelligence and Abilities',
    },
    description: {
      'ru': 'Тесты эмоционального и когнитивного интеллекта',
      'en': 'Emotional and cognitive intelligence tests',
    },
    icon: '🧩',
    order: 6,
  );

  static const creativity = TestCategory(
    id: 'creativity',
    name: {
      'ru': 'Креативность',
      'en': 'Creativity',
    },
    description: {
      'ru': 'Тесты творческого мышления и креативного потенциала',
      'en': 'Tests of creative thinking and creative potential',
    },
    icon: '🎨',
    order: 7,
  );

  static const visual = TestCategory(
    id: 'visual',
    name: {
      'ru': 'Визуальные инсайты',
      'en': 'Visual Insights',
    },
    description: {
      'ru': 'Проективные тесты на основе визуального восприятия',
      'en': 'Projective tests based on visual perception',
    },
    icon: '👁️',
    order: 8,
  );

  /// Get all categories in order
  static List<TestCategory> getAll() {
    final categories = [personality, temperament, relationships, emotional, career, intelligence, creativity, visual];
    categories.sort((a, b) => a.order.compareTo(b.order));
    return categories;
  }

  /// Get category by ID
  static TestCategory? getById(String id) {
    switch (id) {
      case 'personality':
        return personality;
      case 'temperament':
        return temperament;
      case 'relationships':
        return relationships;
      case 'emotional':
        return emotional;
      case 'career':
        return career;
      case 'intelligence':
        return intelligence;
      case 'creativity':
        return creativity;
      case 'visual':
        return visual;
      default:
        return null;
    }
  }

  /// Get category IDs in order
  static List<String> getAllIds() {
    return getAll().map((c) => c.id).toList();
  }
}
