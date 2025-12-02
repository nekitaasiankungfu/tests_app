import 'test_stub.dart';

/// Тест "Языки любви: Как вы даёте и получаете любовь"
///
/// Психологический тест для определения основных способов выражения
/// и восприятия любви в романтических отношениях, дружбе и семье.
///
/// Основан на концепции "5 языков любви", которая помогает:
/// - Улучшить коммуникацию в отношениях
/// - Повысить близость и удовлетворённость
/// - Понять потребности партнёра
/// - Избежать недопонимания
///
/// Измеряет 5 языков любви:
/// - Слова подтверждения (words_of_affirmation) 💬
/// - Время вместе (quality_time) ⏰
/// - Получение подарков (receiving_gifts) 🎁
/// - Акты служения (acts_of_service) 🤝
/// - Физическое прикосновение (physical_touch) 🤗
///
/// Содержит 30 вопросов (по 6 на каждый язык любви)
/// Шкала ответов: 5-балльная (Совсем не важно - Критически важно)
///
/// Версия: 1.0
/// Время прохождения: ~8 минут
/// Категория: Отношения
class LoveLanguagesTest extends TestStub {
  @override
  String get id => 'love_languages_v1';

  @override
  String get category => 'relationships';

  @override
  Map<String, String> get name => {
        'ru': 'Языки любви: Как вы даёте и получаете любовь',
        'en': 'Love Languages: How You Give and Receive Love',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест для определения вашего основного языка любви. Узнайте, как вы выражаете '
            'и воспринимаете любовь, и научитесь лучше понимать потребности партнёра. '
            '5 языков любви: слова подтверждения, время вместе, получение подарков, '
            'акты служения и физическое прикосновение.',
        'en':
            'Test to determine your primary love language. Discover how you express '
            'and perceive love, and learn to better understand your partner\'s needs. '
            '5 love languages: words of affirmation, quality time, receiving gifts, '
            'acts of service, and physical touch.',
      };

  @override
  int get questionCount => 30;

  @override
  int get estimatedMinutes => 8;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'love',
        'relationships',
        'communication',
        'romance',
        'partnership',
        'compatibility',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Based on 5 Love Languages concept',
        'year': 2025,
        'category_display': 'Отношения',
        'factors': [
          'words_of_affirmation',
          'quality_time',
          'receiving_gifts',
          'acts_of_service',
          'physical_touch',
        ],
        'reversed_questions': [], // Нет обратных вопросов
        'response_type': 'likert_5',
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самопознания и улучшения отношений. '
              'Результаты показывают ваши предпочтения, но люди могут выражать любовь '
              'всеми языками в разной степени. Языки любви могут меняться со временем.',
          'en':
              'This test is for self-discovery and relationship improvement. '
              'Results show your preferences, but people can express love '
              'in all languages to varying degrees. Love languages may change over time.',
        },
        'interpretation_ranges': {
          'low': '0-40%',
          'medium': '40-70%',
          'high': '70-100%',
        },
        'tags': [
          'love',
          'relationships',
          'communication',
          'romance',
          'partnership'
        ],
        'emoji_map': {
          'words_of_affirmation': '💬',
          'quality_time': '⏰',
          'receiving_gifts': '🎁',
          'acts_of_service': '🤝',
          'physical_touch': '🤗',
        },
      };
}
