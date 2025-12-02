import 'test_stub.dart';

/// Тест на перфекционизм и страх ошибки
///
/// Опросник помогает оценить, как вы обращаетесь со своей требовательностью к себе:
/// где перфекционизм поддерживает качество и развитие, а где превращается в источник
/// стресса, самокритики и откладывания важных дел.
///
/// Измеряет 4 ключевых показателя:
/// - Здоровый перфекционизм (healthy_perfectionism)
/// - Деструктивный перфекционизм (maladaptive_perfectionism)
/// - Страх оценки (fear_of_evaluation)
/// - Прокрастинация из-за идеала (procrastination_due_to_ideal)
///
/// Содержит 36 вопросов с 5-балльной шкалой Лайкерта
///
/// Версия: 1.0
/// Время прохождения: ~8 минут
/// Категория: Карьера и профессиональное развитие
class PerfectionismFearOfErrorTest extends TestStub {
  @override
  String get id => 'perfectionism_fear_of_error_v1';

  @override
  String get category => 'career';

  @override
  Map<String, String> get name => {
        'ru': 'Перфекционизм и страх ошибки',
        'en': 'Perfectionism and Fear of Error',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Этот опросник помогает оценить, как вы обращаетесь со своей требовательностью к себе: '
            'где перфекционизм поддерживает качество и развитие, а где превращается в источник стресса, '
            'самокритики и откладывания важных дел. Тест показывает баланс между здоровыми стандартами '
            'и деструктивными установками, связанными со страхом ошибки и оценкой окружающих.',
        'en':
            'This questionnaire helps assess how you handle your self-demands: '
            'where perfectionism supports quality and development, and where it becomes a source of stress, '
            'self-criticism and procrastination. The test shows the balance between healthy standards '
            'and destructive attitudes related to fear of error and evaluation by others.',
      };

  @override
  int get questionCount => 36;

  @override
  int get estimatedMinutes => 8;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'perfectionism',
        'fear_of_error',
        'self_criticism',
        'procrastination',
        'career',
        'performance',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Nikita & GPT-5.1 Thinking',
        'year': 2025,
        'category_display': {
          'ru': 'Карьера и профессиональное развитие',
          'en': 'Career and Professional Development',
        },
        'factors': [
          'healthy_perfectionism',
          'maladaptive_perfectionism',
          'fear_of_evaluation',
          'procrastination_due_to_ideal',
        ],
        'reversed_questions': [6, 11, 12, 13, 18, 20, 21, 23, 26, 28, 29, 31, 33, 34, 35, 36],
        'response_types': ['likert_5'],
        'theoretical_basis': [
          'Модели адаптивного и дезадаптивного перфекционизма (Frost et al.; Hewitt & Flett)',
          'Когнитивно-поведенческие модели тревоги и страха оценки',
          'Исследования связи перфекционизма с выгоранием, прокрастинацией и стрессом',
        ],
        'disclaimer': {
          'ru':
              'Опросник не является клинической диагностикой, но может служить отправной точкой '
              'для самонаблюдения, личной работы или обсуждения с психологом. Результаты помогут '
              'понять, почему вы иногда «загоняете» себя, из-за чего можете выгорать или откладывать '
              'задачи до последнего.',
          'en':
              'The questionnaire is not a clinical diagnosis, but can serve as a starting point '
              'for self-observation, personal work or discussion with a psychologist. The results will help '
              'understand why you sometimes "drive" yourself, why you may burn out or procrastinate.',
        },
        'interpretation_ranges': {
          'very_low': '0-20%',
          'low': '21-40%',
          'medium': '41-60%',
          'high': '61-80%',
          'very_high': '81-100%',
        },
        'tags': ['perfectionism', 'career', 'performance', 'self_improvement'],
      };
}
