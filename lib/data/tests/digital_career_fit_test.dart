import 'test_stub.dart';

/// Тест «Какая цифровая профессия вам подходит?» (Digital Career Fit)
///
/// Помогает определить предрасположенность к различным направлениям
/// в сфере цифровых профессий на основе устойчивых интересов и предпочтений.
///
/// Измеряет 6 направлений:
/// - Продуктовое мышление (product_thinking)
/// - Аналитика данных (data_analytics)
/// - Дизайн и UX (design_ux)
/// - Контент и маркетинг (content_marketing)
/// - Управление и коммуникация (management_communication)
/// - Технологии и разработка (tech_development)
///
/// Содержит 18 вопросов с выбором 1 из 6 вариантов.
/// Каждый вариант соответствует одному из направлений.
///
/// Версия: 1.0
/// Время прохождения: ~8 минут
/// Категория: Карьера
class DigitalCareerFitTest extends TestStub {
  @override
  String get id => 'digital_career_fit_v1';

  @override
  String get category => 'career';

  @override
  Map<String, String> get name => {
        'ru': 'Какая цифровая профессия вам подходит?',
        'en': 'Digital Career Fit Test',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Определите, к каким направлениям в сфере цифровых профессий вы наиболее предрасположены. '
            'Тест фокусируется на устойчивых интересах и предпочтениях, а не на уровне знаний.',
        'en':
            'Discover which digital career paths suit you best. '
            'The test focuses on stable interests and preferences, not skill levels.',
      };

  @override
  int get questionCount => 18;

  @override
  int get estimatedMinutes => 8;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'career',
        'digital',
        'profession',
        'interests',
        'product',
        'analytics',
        'design',
        'marketing',
        'management',
        'development',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'AI-assistant (adapted for mobile app)',
        'year': 2025,
        'category_display': 'Карьера',
        'theoretical_basis': [
          'Holland RIASEC model (adapted)',
          'Digital competency models (DigComp)',
          'Schein career anchors (adapted for digital)',
        ],
        'factors': [
          'product_thinking',
          'data_analytics',
          'design_ux',
          'content_marketing',
          'management_communication',
          'tech_development',
        ],
        'reversed_questions': [],
        'response_types': ['single_choice_6'],
        'disclaimer': {
          'ru':
              'Данный тест помогает определить предрасположенность к различным цифровым профессиям. '
              'Результаты носят рекомендательный характер и не заменяют профессиональную консультацию.',
          'en':
              'This test helps identify aptitude for various digital professions. '
              'Results are advisory and do not replace professional consultation.',
        },
        'interpretation_ranges': {
          'low': '0-33%',
          'medium': '34-66%',
          'high': '67-100%',
        },
        'profiles': [
          'product_manager',
          'data_analyst',
          'ux_designer',
          'content_marketer',
          'project_manager',
          'developer',
          'mixed',
        ],
        'tags': ['career', 'digital', 'profession', 'interests'],
      };
}
