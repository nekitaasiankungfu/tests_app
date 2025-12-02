import 'test_stub.dart';

/// Тест «Тёмная сторона личности» (Dark Personality Traits Test)
///
/// Измеряет три «тёмные» черты личности, известные как Dark Triad:
/// - Макиавеллизм (склонность к стратегическим манипуляциям)
/// - Нарциссизм (завышенная самооценка и потребность в восхищении)
/// - Субклиническая психопатия (сниженная эмпатия и импульсивность)
///
/// ВАЖНО: это НЕ клиническая диагностика и НЕ говорит о том, что вы «плохой человек».
/// Все мы имеем эти черты в разной степени — они могут быть даже адаптивными
/// в определённых ситуациях.
///
/// Содержит 36 вопросов (по 12 на каждую черту) с 5-балльной шкалой Лайкерта.
/// 18 вопросов имеют обратную формулировку для контроля валидности.
///
/// Версия: 1.0
/// Время прохождения: ~7 минут
/// Категория: Личность
class DarkPersonalityTraitsTest extends TestStub {
  @override
  String get id => 'dark_personality_traits';

  @override
  String get category => 'personality';

  @override
  Map<String, String> get name => {
        'ru': 'Тест «Тёмная сторона личности»',
        'en': 'Dark Personality Traits Test',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Этот тест измеряет три «тёмные» черты личности, известные как Dark Triad: '
            'макиавеллизм, нарциссизм и субклиническую психопатию. Важно понимать: это НЕ '
            'клиническая диагностика. Все мы имеем эти черты в разной степени, и умеренные '
            'уровни могут быть адаптивными в определённых ситуациях.',
        'en':
            'This test measures three dark personality traits known as Dark Triad: '
            'Machiavellianism, narcissism, and subclinical psychopathy. Important: this is NOT '
            'clinical diagnosis. We all have these traits to varying degrees, and moderate '
            'levels can be adaptive in certain situations.',
      };

  @override
  int get questionCount => 36;

  @override
  int get estimatedMinutes => 7;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'dark_triad',
        'personality',
        'machiavellianism',
        'narcissism',
        'psychopathy',
        'self_reflection',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Based on Dark Triad research',
        'year': 2025,
        'category_display': 'Личность',
        'factors': [
          'machiavellianism',
          'narcissism',
          'psychopathy',
        ],
        'reversed_questions': [
          2,
          4,
          6,
          8,
          10,
          12,
          14,
          16,
          18,
          20,
          22,
          24,
          26,
          28,
          30,
          32,
          34,
          36
        ],
        'response_type': 'likert_5',
        'disclaimer': {
          'ru':
              '❗ ЭТО НЕ КЛИНИЧЕСКИЙ ДИАГНОЗ. Тест предназначен только для саморефлексии. '
              'Наличие тёмных черт не делает вас плохим человеком. Умеренные уровни могут быть '
              'адаптивными. При беспокойстве обратитесь к психологу.',
          'en':
              '❗ THIS IS NOT CLINICAL DIAGNOSIS. Test is for self-reflection only. '
              'Having dark traits doesn\'t make you a bad person. Moderate levels can be '
              'adaptive. If concerned, consult a psychologist.',
        },
        'interpretation_ranges': {
          'low': '0-35%',
          'moderate': '36-65%',
          'high': '66-100%',
        },
        'theoretical_basis': [
          'Dark Triad Theory (Paulhus & Williams, 2002)',
          'Machiavellianism (Christie & Geis, 1970)',
          'Narcissistic Personality Research',
          'Subclinical Psychopathy (Hare, 1985)',
        ],
        'tags': [
          'dark_triad',
          'personality',
          'machiavellianism',
          'narcissism',
          'psychopathy'
        ],
      };
}
