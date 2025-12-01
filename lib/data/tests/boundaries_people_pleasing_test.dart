import 'test_stub.dart';

/// Тест на личные границы и People-Pleasing
///
/// Помогает выявить паттерны нарушения личных границ, склонность к угождению
/// другим в ущерб себе (people-pleasing) и страх отвержения. Оценивает
/// способность отстаивать свои интересы, говорить «нет», устанавливать
/// здоровые границы в отношениях.
///
/// Измеряет 6 ключевых аспектов:
/// - Ассертивность (assertiveness)
/// - Приоритет своих потребностей (self_prioritization)
/// - Эмоциональная автономия (emotional_autonomy)
/// - Угождение другим (people_pleasing)
/// - Страх отвержения (fear_of_rejection)
/// - Ясность границ (boundary_clarity)
///
/// Содержит 48 вопросов с 5-балльной частотной шкалой
/// (Никогда - Редко - Иногда - Часто - Всегда)
///
/// Версия: 1.0.0
/// Время прохождения: ~10 минут
/// Категория: Эмоциональное состояние
class BoundariesPeoplePleasingTest extends TestStub {
  @override
  String get id => 'boundaries_people_pleasing';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Личные границы и People-Pleasing',
        'en': 'Personal Boundaries and People-Pleasing',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Тест помогает выявить паттерны нарушения личных границ, склонность к угождению другим в ущерб себе '
            '(people-pleasing) и страх отвержения. Вы узнаете, насколько легко вам отстаивать свои интересы, '
            'говорить «нет», устанавливать здоровые границы в отношениях.\\n\\n'
            'Результат показывает ваш профиль границ (от человека-угодника до мастера границ), уровень общего '
            'здоровья границ и детальную оценку по шести аспектам: ассертивность, приоритет своих потребностей, '
            'эмоциональная автономия, склонность к угождению, страх отвержения и ясность границ.\\n\\n'
            'Тест не является клинической диагностикой, а инструментом саморефлексии и развития навыков установления '
            'здоровых границ в отношениях.',
        'en':
            'This test helps identify patterns of boundary violations, people-pleasing tendencies, and fear of rejection. '
            'You will learn how easily you can assert your interests, say "no", and establish healthy boundaries in relationships.\\n\\n'
            'The result shows your boundary profile (from people-pleaser to boundary master), overall boundary health level, '
            'and detailed assessment across six aspects: assertiveness, self-prioritization, emotional autonomy, '
            'people-pleasing, fear of rejection, and boundary clarity.\\n\\n'
            'This is not a clinical diagnostic tool but a self-reflection instrument for developing healthy boundary-setting skills.',
      };

  @override
  int get questionCount => 48;

  @override
  int get estimatedMinutes => 10;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'boundaries',
        'people_pleasing',
        'assertiveness',
        'self_care',
        'emotional_autonomy',
        'fear_of_rejection',
        'relationships',
        'self_prioritization',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': '4Marketing / Nikita & ChatGPT (draft)',
        'year': 2025,
        'category_display': 'Эмоциональное состояние',
        'theoretical_basis': [
          'Assertiveness training theory',
          'Boundary work (Pia Mellody, Anne Katherine)',
          'Attachment theory and interpersonal boundaries',
          'Codependency research',
        ],
        'scales': [
          'assertiveness',
          'self_prioritization',
          'emotional_autonomy',
          'people_pleasing',
          'fear_of_rejection',
          'boundary_clarity',
        ],
        'reversed_questions': [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 42, 44, 46, 48],
        'response_type': 'frequency',
        'response_options': {
          'ru': ['Никогда', 'Редко', 'Иногда', 'Часто', 'Всегда'],
          'en': ['Never', 'Rarely', 'Sometimes', 'Often', 'Always'],
        },
        'scoring': [0, 1, 2, 3, 4],
        'target_audience': {
          'ru':
              'Взрослые 18–55 лет, заинтересованные в развитии навыков установления здоровых границ в отношениях.',
          'en':
              'Adults 18–55 interested in developing healthy boundary-setting skills in relationships.',
        },
        'interpretation_levels': {
          'critical': '0-24%',
          'weak': '25-44%',
          'developing': '45-64%',
          'strong': '65-84%',
          'excellent': '85-100%',
        },
        'profiles': [
          'people_pleaser',
          'boundary_builder',
          'boundary_master',
        ],
      };
}
