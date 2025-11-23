import 'test_stub.dart';

/// Тест на романтический потенциал и представления о любви
///
/// Комплексная оценка трёх ключевых аспектов романтической сферы:
/// - Романтический потенциал (готовность к отношениям, способность к близости)
/// - Отношение к любви (убеждения, формирующие модель близости)
/// - Романтические сценарии (внутренние истории о любви)
///
/// Основан на теории романтических убеждений, моделях романтических сценариев
/// и психологии привязанности.
///
/// Содержит 36 вопросов с 5-балльной шкалой Лайкерта.
///
/// Версия: 1.0
/// Время прохождения: ~10 минут
/// Категория: Отношения
class RomanticPotentialTest extends TestStub {
  @override
  String get id => 'romantic_potential_v1';

  @override
  String get category => 'relationships';

  @override
  Map<String, String> get name => {
        'ru': 'Романтические представления и потенциал',
        'en': 'Romantic Potential and Love Beliefs',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест оценивает три ключевых аспекта романтической сферы: ваш личный романтический потенциал, '
            'отношение к любви и индивидуальные романтические сценарии. Поможет лучше понять, '
            'какие партнёрские отношения будут наиболее гармоничными.',
        'en':
            'This test evaluates three key aspects of the romantic sphere: your personal romantic potential, '
            'attitudes toward love, and individual romantic scenarios. It helps you understand '
            'which partner relationships will be most harmonious.',
      };

  @override
  int get questionCount => 36;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'relationships',
        'love',
        'romantic',
        'beliefs',
        'potential',
        'comprehensive',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Based on Romantic Beliefs Theory and Love Stories Scale',
        'year': 2025,
        'category_display': {
          'ru': 'Отношения',
          'en': 'Relationships',
        },
        'factors': [
          'romantic_potential',
          'love_attitudes',
          'love_stories',
        ],
        'reversed_questions': [3, 6, 8, 11, 17, 18, 21, 23, 29, 31, 33, 35],
        'response_type': 'likert_5',
        'theoretical_basis': [
          'Romantic Beliefs Theory',
          'Love Stories Scale',
          'Attachment Psychology',
          'Emotional-Communication Models',
        ],
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самопознания и не является психологическим диагнозом. '
              'Результаты помогут лучше понять ваши романтические модели и убеждения.',
          'en':
              'This test is for self-awareness and is not a psychological diagnosis. '
              'Results will help you better understand your romantic patterns and beliefs.',
        },
        'interpretation_ranges': {
          'low': '0-44%',
          'medium': '45-74%',
          'high': '75-100%',
        },
        'profiles': [
          'profile_secure_romantic',
          'profile_mixed_romantic',
          'profile_romantic_challenges',
        ],
      };
}
