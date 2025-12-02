import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/visual_micro_tests_model.dart';

/// Data provider for Visual Micro Tests
///
/// Loads 10 micro-tests from JSON and provides trait information
///
/// @version: 1.0.0
class VisualMicroTestsData {
  static List<MicroTest>? _cachedMicroTests;
  static Map<String, Map<String, String>>? _cachedTraitNames;
  static Map<String, Map<String, String>>? _cachedTraitDescriptions;

  /// Load all 10 micro-tests from JSON
  static Future<List<MicroTest>> loadMicroTests() async {
    if (_cachedMicroTests != null) {
      return _cachedMicroTests!;
    }

    try {
      // Load JSON from assets
      final String jsonString = await rootBundle.loadString(
        'add_tests/visual_micro_tests.json',
      );
      final dynamic jsonData = json.decode(jsonString);

      if (jsonData == null || jsonData is! Map) {
        throw Exception('Invalid JSON structure: root is not a map');
      }

      final dynamic testPackageRaw = jsonData['test_package'];
      if (testPackageRaw == null || testPackageRaw is! Map) {
        throw Exception('Invalid JSON structure: test_package is null or not a map');
      }

      final Map<String, dynamic> testPackage = testPackageRaw as Map<String, dynamic>;
      final dynamic microTestsRaw = testPackage['micro_tests'];

      if (microTestsRaw == null || microTestsRaw is! List) {
        throw Exception('Invalid JSON structure: micro_tests is null or not a list');
      }

      final List<dynamic> microTestsJson = microTestsRaw as List<dynamic>;

      // Parse micro-tests
      _cachedMicroTests = microTestsJson
          .map((testJson) => MicroTest.fromJson(testJson as Map<String, dynamic>))
          .toList();

      return _cachedMicroTests!;
    } catch (e) {
      throw Exception('Failed to load Visual Micro Tests: $e');
    }
  }

  /// Get a specific micro-test by ID
  static Future<MicroTest?> getMicroTestById(String id) async {
    final tests = await loadMicroTests();
    try {
      return tests.firstWhere((test) => test.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get test package metadata
  static Future<Map<String, dynamic>> getPackageMetadata() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'add_tests/visual_micro_tests.json',
      );
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final Map<String, dynamic> testPackage = jsonData['test_package'];

      return {
        'name': testPackage['name'],
        'description': testPackage['description'],
        'section_tagline': testPackage['section_tagline'],
        'total_time': testPackage['total_time'],
        'theoretical_basis': testPackage['theoretical_basis'],
        'target_audience': testPackage['target_audience'],
      };
    } catch (e) {
      return {};
    }
  }

  /// Get localized trait names for display
  static Map<String, Map<String, String>> getTraitNames() {
    if (_cachedTraitNames != null) {
      return _cachedTraitNames!;
    }

    _cachedTraitNames = {
      // Cognitive traits
      'analytical_thinking': {'ru': 'Аналитическое мышление', 'en': 'Analytical Thinking'},
      'creativity': {'ru': 'Креативность', 'en': 'Creativity'},
      'intuition': {'ru': 'Интуиция', 'en': 'Intuition'},
      'holistic_thinking': {'ru': 'Холистическое мышление', 'en': 'Holistic Thinking'},
      'detail_orientation': {'ru': 'Внимание к деталям', 'en': 'Detail Orientation'},
      'big_picture_thinking': {'ru': 'Стратегическое мышление', 'en': 'Big Picture Thinking'},
      'rational_approach': {'ru': 'Рациональный подход', 'en': 'Rational Approach'},
      'philosophical_thinking': {'ru': 'Философское мышление', 'en': 'Philosophical Thinking'},
      'complex_thinking': {'ru': 'Сложное мышление', 'en': 'Complex Thinking'},
      'pattern_recognition': {'ru': 'Распознавание паттернов', 'en': 'Pattern Recognition'},
      'intellectual_curiosity': {'ru': 'Интеллектуальное любопытство', 'en': 'Intellectual Curiosity'},

      // Social traits
      'sociability': {'ru': 'Общительность', 'en': 'Sociability'},
      'empathy': {'ru': 'Эмпатия', 'en': 'Empathy'},
      'social_awareness': {'ru': 'Социальная осведомлённость', 'en': 'Social Awareness'},
      'leadership': {'ru': 'Лидерство', 'en': 'Leadership'},
      'assertiveness': {'ru': 'Ассертивность', 'en': 'Assertiveness'},

      // Emotional traits
      'emotional_openness': {'ru': 'Эмоциональная открытость', 'en': 'Emotional Openness'},
      'emotional_stability': {'ru': 'Эмоциональная стабильность', 'en': 'Emotional Stability'},
      'optimism': {'ru': 'Оптимизм', 'en': 'Optimism'},
      'emotional_sensitivity': {'ru': 'Эмоциональная чувствительность', 'en': 'Emotional Sensitivity'},
      'calmness': {'ru': 'Спокойствие', 'en': 'Calmness'},
      'gentleness': {'ru': 'Мягкость', 'en': 'Gentleness'},
      'passion': {'ru': 'Страстность', 'en': 'Passion'},

      // Behavioral traits
      'spontaneity': {'ru': 'Спонтанность', 'en': 'Spontaneity'},
      'orderliness': {'ru': 'Организованность', 'en': 'Orderliness'},
      'efficiency': {'ru': 'Эффективность', 'en': 'Efficiency'},
      'adaptability': {'ru': 'Адаптивность', 'en': 'Adaptability'},
      'energy_level': {'ru': 'Уровень энергии', 'en': 'Energy Level'},
      'patience': {'ru': 'Терпеливость', 'en': 'Patience'},
      'impulsiveness': {'ru': 'Импульсивность', 'en': 'Impulsiveness'},
      'decisiveness': {'ru': 'Решительность', 'en': 'Decisiveness'},
      'perfectionism': {'ru': 'Перфекционизм', 'en': 'Perfectionism'},
      'pragmatism': {'ru': 'Прагматизм', 'en': 'Pragmatism'},

      // Perceptual traits
      'aesthetic_sensitivity': {'ru': 'Эстетическая чувствительность', 'en': 'Aesthetic Sensitivity'},
      'harmony_seeking': {'ru': 'Стремление к гармонии', 'en': 'Harmony Seeking'},
      'balance': {'ru': 'Баланс', 'en': 'Balance'},
      'idealism': {'ru': 'Идеализм', 'en': 'Idealism'},
      'curiosity': {'ru': 'Любопытство', 'en': 'Curiosity'},

      // Values & Motivation
      'ambition': {'ru': 'Амбициозность', 'en': 'Ambition'},
      'growth_mindset': {'ru': 'Установка на рост', 'en': 'Growth Mindset'},
      'openness_to_experience': {'ru': 'Открытость опыту', 'en': 'Openness to Experience'},
      'individualism': {'ru': 'Индивидуализм', 'en': 'Individualism'},
      'trustworthiness': {'ru': 'Надёжность', 'en': 'Trustworthiness'},
      'wisdom': {'ru': 'Мудрость', 'en': 'Wisdom'},
      'resilience': {'ru': 'Устойчивость', 'en': 'Resilience'},

      // Cognitive styles (extended)
      'gestalt_thinking': {'ru': 'Гештальт мышление', 'en': 'Gestalt Thinking'},
      'non_linear_thinking': {'ru': 'Нелинейное мышление', 'en': 'Non-linear Thinking'},
      'tolerance_for_ambiguity': {'ru': 'Толерантность к неопределённости', 'en': 'Tolerance for Ambiguity'},
      'need_for_structure': {'ru': 'Потребность в структуре', 'en': 'Need for Structure'},
      'systematicity': {'ru': 'Системность', 'en': 'Systematicity'},
    };

    return _cachedTraitNames!;
  }

  /// Get localized trait descriptions
  static Map<String, Map<String, String>> getTraitDescriptions() {
    if (_cachedTraitDescriptions != null) {
      return _cachedTraitDescriptions!;
    }

    _cachedTraitDescriptions = {
      // Cognitive
      'analytical_thinking': {
        'ru': 'Вы склонны к логическому анализу и систематизации информации',
        'en': 'You tend toward logical analysis and information systematization'
      },
      'creativity': {
        'ru': 'У вас развитое воображение и способность находить нестандартные решения',
        'en': 'You have developed imagination and ability to find unconventional solutions'
      },
      'intuition': {
        'ru': 'Вы доверяете своему внутреннему голосу и чувствуете скрытые закономерности',
        'en': 'You trust your inner voice and sense hidden patterns'
      },
      'holistic_thinking': {
        'ru': 'Вы видите целостную картину и взаимосвязи между элементами',
        'en': 'You see the whole picture and connections between elements'
      },
      'detail_orientation': {
        'ru': 'Вы замечаете мелкие детали и тщательно их анализируете',
        'en': 'You notice small details and analyze them carefully'
      },

      // Social
      'sociability': {
        'ru': 'Вы легко находите общий язык с людьми и чувствуете себя комфортно в социальных ситуациях',
        'en': 'You easily connect with people and feel comfortable in social situations'
      },
      'empathy': {
        'ru': 'Вы глубоко чувствуете эмоции других людей и способны понимать их переживания',
        'en': 'You deeply feel others\' emotions and can understand their experiences'
      },
      'leadership': {
        'ru': 'Вы естественно берёте на себя роль лидера и направляете других',
        'en': 'You naturally take on leadership role and guide others'
      },

      // Emotional
      'emotional_openness': {
        'ru': 'Вы не боитесь своих чувств и открыто их выражаете',
        'en': 'You are not afraid of your feelings and express them openly'
      },
      'optimism': {
        'ru': 'Вы склонны видеть позитивные стороны ситуаций и верить в лучшее',
        'en': 'You tend to see positive sides of situations and believe in the best'
      },
      'calmness': {
        'ru': 'Вы сохраняете спокойствие и уравновешенность в большинстве ситуаций',
        'en': 'You maintain calm and balance in most situations'
      },

      // Behavioral
      'spontaneity': {
        'ru': 'Вы живёте моментом и легко принимаете спонтанные решения',
        'en': 'You live in the moment and easily make spontaneous decisions'
      },
      'orderliness': {
        'ru': 'Вы цените порядок, структуру и планирование',
        'en': 'You value order, structure, and planning'
      },
      'adaptability': {
        'ru': 'Вы легко приспосабливаетесь к изменениям и новым обстоятельствам',
        'en': 'You easily adapt to changes and new circumstances'
      },

      // Perceptual
      'aesthetic_sensitivity': {
        'ru': 'Вы чувствительны к красоте и гармонии в окружающем мире',
        'en': 'You are sensitive to beauty and harmony in the world around you'
      },
      'harmony_seeking': {
        'ru': 'Вы стремитесь к балансу и избегаете крайностей',
        'en': 'You strive for balance and avoid extremes'
      },

      // Default for unmapped traits
      'default': {
        'ru': 'Эта черта отражает важный аспект вашей личности',
        'en': 'This trait reflects an important aspect of your personality'
      },
    };

    return _cachedTraitDescriptions!;
  }

  /// Get trait icon emoji
  static String getTraitIcon(String trait) {
    const Map<String, String> icons = {
      'sociability': '👥',
      'empathy': '💙',
      'creativity': '🎨',
      'analytical_thinking': '🧠',
      'emotional_openness': '❤️',
      'intuition': '🔮',
      'spontaneity': '⚡',
      'orderliness': '📋',
      'harmony_seeking': '☯️',
      'balance': '⚖️',
      'optimism': '🌟',
      'calmness': '😌',
      'leadership': '👑',
      'wisdom': '🦉',
      'adaptability': '🌊',
      'curiosity': '🔍',
      'energy_level': '🔥',
      'perfectionism': '💎',
      'resilience': '🛡️',
      'aesthetic_sensitivity': '🌸',
    };

    return icons[trait] ?? '✨';
  }

  /// Generate overall portrait based on top traits
  static Map<String, String> generateOverallPortrait(List<TraitInfo> topTraits) {
    if (topTraits.isEmpty) {
      return {
        'ru': 'Недостаточно данных для формирования портрета',
        'en': 'Insufficient data to form a portrait',
      };
    }

    final List<String> traitKeys = topTraits.map((t) => t.key).toList();

    // Pattern detection for personality combinations
    if (_hasTraits(traitKeys, ['intuition', 'emotional_openness'])) {
      return {
        'ru': 'Вы — чувствительная и интуитивная личность, которая глубоко воспринимает мир через эмоции и внутренние ощущения. Вы легко считываете атмосферу и настроения окружающих.',
        'en': 'You are a sensitive and intuitive personality who deeply perceives the world through emotions and inner sensations. You easily read the atmosphere and moods of others.',
      };
    }

    if (_hasTraits(traitKeys, ['analytical_thinking', 'orderliness'])) {
      return {
        'ru': 'Вы — рациональный и методичный человек, который ценит логику, структуру и порядок. Вы подходите к задачам систематически и принимаете решения на основе тщательного анализа.',
        'en': 'You are a rational and methodical person who values logic, structure, and order. You approach tasks systematically and make decisions based on thorough analysis.',
      };
    }

    if (_hasTraits(traitKeys, ['creativity', 'spontaneity'])) {
      return {
        'ru': 'Вы — творческая и свободолюбивая личность, которая не боится экспериментировать и действовать по вдохновению. Вы видите мир через призму возможностей.',
        'en': 'You are a creative and freedom-loving personality who is not afraid to experiment and act by inspiration. You see the world through the lens of possibilities.',
      };
    }

    if (_hasTraits(traitKeys, ['sociability', 'empathy'])) {
      return {
        'ru': 'Вы — социально ориентированный человек с развитой способностью понимать и чувствовать других. Вы легко находите контакт с людьми.',
        'en': 'You are a socially oriented person with developed ability to understand and feel others. You easily connect with people.',
      };
    }

    if (_hasTraits(traitKeys, ['harmony_seeking', 'balance'])) {
      return {
        'ru': 'Вы — гармоничная личность, которая стремится к балансу во всех сферах жизни. Вы избегаете крайностей и умеете находить золотую середину.',
        'en': 'You are a harmonious personality who strives for balance in all areas of life. You avoid extremes and know how to find the golden mean.',
      };
    }

    // Default portrait based on top trait
    final String topTrait = topTraits[0].key;
    final String topTraitName = topTraits[0].getName('ru');
    final String topTraitNameEn = topTraits[0].getName('en');

    return {
      'ru': 'Ваш профиль личности характеризуется прежде всего таким качеством как $topTraitName. '
            'Эта черта определяет ваш уникальный взгляд на мир и способ взаимодействия с ним.',
      'en': 'Your personality profile is primarily characterized by $topTraitNameEn. '
            'This trait defines your unique view of the world and way of interacting with it.',
    };
  }

  static bool _hasTraits(List<String> traitKeys, List<String> searchTraits) {
    return searchTraits.every((trait) => traitKeys.contains(trait));
  }
}
