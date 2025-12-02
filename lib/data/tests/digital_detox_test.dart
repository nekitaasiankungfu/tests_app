import 'test_stub.dart';

/// Digital Detox Test: Technology Addiction Diagnostic
///
/// Comprehensive assessment of digital dependency and technology burnout
/// across 7 key dimensions. Evaluates how excessive device usage impacts
/// different life areas.
///
/// Based on Digital Wellbeing Framework, Nomophobia research (Yildirim & Correia),
/// FOMO Theory (Przybylski et al.), Cognitive Load Theory, Behavioral Addiction Model,
/// and Screen Time Impact Research.
///
/// Measures 7 scales:
/// - Dependency Level - physical and psychological device dependency
/// - Attention Control - ability to focus without digital distractions
/// - Social Impact - how technology affects real-world relationships
/// - Physical Health - screen-related physical symptoms
/// - Productivity Loss - impact on work, study, and task completion
/// - Emotional State - FOMO, anxiety, and emotional reactions to technology
/// - Usage Patterns - objective usage metrics and habits
///
/// Not a medical diagnosis.
class DigitalDetoxTest extends TestStub {
  @override
  String get id => 'digital_detox_test';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Цифровой детокс: Диагностика технологической зависимости',
        'en': 'Digital Detox: Technology Addiction Diagnostic',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Оцените степень цифровой зависимости и её влияние на физическое здоровье, продуктивность, отношения и эмоциональное состояние',
        'en':
            'Assess your level of digital dependency and its impact on physical health, productivity, relationships, and emotional well-being',
      };

  @override
  int get questionCount => 50;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'digital_wellbeing',
        'technology',
        'addiction',
        'comprehensive',
        'modern',
        'screen_time',
      ];

  @override
  String get assetPath => '';

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Digital Wellbeing Institute',
        'category_display': {
          'ru': 'Эмоциональное состояние',
          'en': 'Emotional State',
        },
        'factors': [
          'dependency_level', // Уровень зависимости
          'attention_control', // Контроль внимания
          'social_impact', // Социальное влияние
          'physical_health', // Физическое здоровье
          'productivity_loss', // Потеря продуктивности
          'emotional_state', // Эмоциональное состояние
          'usage_patterns', // Паттерны использования
        ],
        'factor_names': {
          'ru': {
            'dependency_level': 'Уровень зависимости',
            'attention_control': 'Контроль внимания',
            'social_impact': 'Социальное влияние',
            'physical_health': 'Физическое здоровье',
            'productivity_loss': 'Потеря продуктивности',
            'emotional_state': 'Эмоциональное состояние',
            'usage_patterns': 'Паттерны использования',
          },
          'en': {
            'dependency_level': 'Dependency Level',
            'attention_control': 'Attention Control',
            'social_impact': 'Social Impact',
            'physical_health': 'Physical Health',
            'productivity_loss': 'Productivity Loss',
            'emotional_state': 'Emotional State',
            'usage_patterns': 'Usage Patterns',
          },
        },
        'scientific_basis': [
          'Digital Wellbeing Framework (Google)',
          'Nomophobia Research - Yildirim & Correia',
          'FOMO Theory - Przybylski, Murayama, DeHaan & Gladwell',
          'Cognitive Load Theory - Sweller',
          'Behavioral Addiction Model - Griffiths',
          'Screen Time Impact Research - Twenge & Campbell',
        ],
      };
}
