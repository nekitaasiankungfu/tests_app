import 'test_stub.dart';

/// Тест "Дружба и красные флажки"
///
/// Тест помогает понять, какие дружеские отношения вы выбираете,
/// насколько замечаете тревожные звоночки и умеете ли ставить границы в дружбе.
///
/// Измеряет 4 ключевых показателя:
/// - Границы в дружбе: трудности (friendship_boundaries_difficulty)
/// - Слепота к тревожным звоночкам (blindness_to_red_flags)
/// - Толерантность к неуважению (tolerance_of_disrespect)
/// - Тяга к драме в дружбе (drama_attraction)
///
/// Содержит 24 вопроса с частотной шкалой (Никогда - Всегда)
///
/// Версия: 1.0
/// Время прохождения: ~7 минут
/// Категория: Межличностные отношения
class FriendshipRedFlagsTest extends TestStub {
  @override
  String get id => 'friendship_red_flags_v1';

  @override
  String get category => 'relationships';

  @override
  Map<String, String> get name => {
        'ru': 'Дружба и красные флажки',
        'en': 'Friendship and Red Flags',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест помогает понять, какие дружеские отношения вы выбираете, '
            'насколько замечаете тревожные звоночки и умеете ли ставить границы в дружбе. '
            'Результат покажет, насколько вы уязвимы к токсичным дружеским сценариям.',
        'en':
            'This test helps you understand what kinds of friendships you choose, '
            'how well you notice warning signs, and how you set boundaries with friends. '
            'Your results will show how vulnerable you are to toxic friendship dynamics.',
      };

  @override
  int get questionCount => 24;

  @override
  int get estimatedMinutes => 7;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'friendship',
        'relationships',
        'boundaries',
        'red_flags',
        'toxic_patterns',
        'self_awareness',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': '4Marketing Psychology Team',
        'year': 2025,
        'category_display': 'Межличностные отношения',
        'factors': [
          'friendship_boundaries_difficulty',
          'blindness_to_red_flags',
          'tolerance_of_disrespect',
          'drama_attraction',
        ],
        'reversed_questions': [10, 13, 16, 19, 21, 22],
        'response_types': ['frequency'],
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самопознания и не заменяет профессиональную '
              'психологическую помощь. Результаты помогают осознать паттерны в дружеских отношениях.',
          'en':
              'This test is for self-awareness and does not replace professional '
              'psychological support. Results help you recognize patterns in friendships.',
        },
        'interpretation_ranges': {
          'low_risk': '0-24%',
          'moderate_risk': '25-49%',
          'elevated_risk': '50-74%',
          'high_risk': '75-100%',
        },
        'tags': ['friendship', 'boundaries', 'red_flags', 'relationships'],
        'target_audience': {
          'ru': 'Подростки и взрослые от 14 лет',
          'en': 'Teenagers and adults aged 14+',
        },
      };
}
