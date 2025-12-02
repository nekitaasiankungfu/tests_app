import 'test_stub.dart';

/// Тест профессиональных интересов Holland Code (RIASEC)
///
/// Научно обоснованная методика определения профессиональных интересов
/// и типов личности на основе теории Джона Холланда.
///
/// Измеряет 6 типов профессиональных интересов:
/// - Realistic (Реалистичный) - работа с инструментами, техникой, природой
/// - Investigative (Исследовательский) - научное мышление, анализ, исследования
/// - Artistic (Артистичный) - творчество, самовыражение, эстетика
/// - Social (Социальный) - помощь людям, обучение, забота
/// - Enterprising (Предпринимательский) - лидерство, влияние, бизнес
/// - Conventional (Конвенциональный) - организация, порядок, детали
///
/// Содержит 60 вопросов (по 10 на каждый тип)
/// Результатом является код из 3-х наиболее выраженных типов (например, IAS)
///
/// Версия: 1.0
/// Время прохождения: ~12 минут
/// Категория: Карьера и профориентация
class HollandCodeTest extends TestStub {
  @override
  String get id => 'holland_code_v1';

  @override
  String get category => 'career';

  @override
  Map<String, String> get name => {
        'ru': 'Holland Code: Профессиональные интересы',
        'en': 'Holland Code: Career Interests',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Определите свой профессиональный тип личности по методике Holland Code (RIASEC). '
            'Тест поможет выбрать подходящую карьеру и понять свои профессиональные интересы.',
        'en':
            'Determine your professional personality type using the Holland Code (RIASEC) method. '
            'The test will help you choose a suitable career and understand your professional interests.',
      };

  @override
  int get questionCount => 60;

  @override
  int get estimatedMinutes => 12;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'career',
        'vocational',
        'professional',
        'holland',
        'riasec',
        'interests',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Based on John L. Holland\'s Theory',
        'year': 2025,
        'category_display': 'Карьера и профориентация',
        'factors': [
          'realistic',
          'investigative',
          'artistic',
          'social',
          'enterprising',
          'conventional',
        ],
        'factor_codes': {
          'realistic': 'R',
          'investigative': 'I',
          'artistic': 'A',
          'social': 'S',
          'enterprising': 'E',
          'conventional': 'C',
        },
        'response_type': 'likert_5',
        'disclaimer': {
          'ru':
              'Этот тест предназначен для профессиональной ориентации и самопознания. '
              'Результаты носят рекомендательный характер. Для детального карьерного '
              'консультирования рекомендуется обратиться к специалисту.',
          'en':
              'This test is designed for career guidance and self-discovery. '
              'The results are for guidance only. For detailed career counseling, '
              'please consult a specialist.',
        },
        'interpretation_ranges': {
          'low': '0-40%',
          'medium': '41-70%',
          'high': '71-100%',
        },
        'tags': ['career', 'vocational', 'holland', 'riasec', 'professional'],
      };
}