import 'test_stub.dart';

/// Тест качества сна и восстановления
///
/// Оценивает, насколько сон действительно восстанавливает: регулярность режима,
/// глубину и непрерывность сна, дневную бодрость, влияние гаджетов и стресса.
///
/// Измеряет 8 ключевых аспектов:
/// - Режим сна (sleep_rhythm)
/// - Субъективное качество сна (sleep_quality)
/// - Дневная бодрость (daytime_functioning)
/// - Гаджеты и привычки перед сном (screens_and_habits)
/// - Стресс и восстановление (stress_and_recovery)
/// - Условия в спальне (sleep_environment)
/// - Физические симптомы (physical_symptoms)
/// - Признаки нарушений сна (sleep_disorders)
///
/// Содержит 40 вопросов с 5-балльной частотной шкалой
/// (Почти никогда - Редко - Иногда - Часто - Почти всегда)
///
/// Версия: 2.0
/// Время прохождения: ~10-12 минут
/// Категория: Эмоциональное состояние
class SleepRecoveryTest extends TestStub {
  @override
  String get id => 'sleep_recovery_v1';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Качество сна и восстановления',
        'en': 'Sleep Quality and Recovery',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Этот опрос помогает оценить, насколько сон действительно восстанавливает вас: насколько стабилен ваш режим, '
            'насколько глубок и непрерывный сон, как вы чувствуете себя днём, и насколько на сон влияют стресс и использование гаджетов. '
            'Результат показывает сильные стороны вашего режима сна и зоны риска, которые снижают ресурсность и настроение.\n\n'
            'Тест не является медицинской диагностикой, но помогает заметить привычки, которые поддерживают или, наоборот, '
            'подрывают восстановление. Его удобно использовать вместе с тестами на уровень стресса и цифровой детокс, '
            'чтобы получить целостную картинку вашего эмоционального состояния и образа жизни.',
        'en':
            'This questionnaire helps you understand how restorative your sleep really is: how regular your schedule is, '
            'how deep and continuous your sleep feels, how you function during the day, and how stress and digital devices affect your rest. '
            'The result highlights both strengths and risk zones in your sleep routine.\n\n'
            'This is not a medical diagnostic tool, but it can show which habits support recovery and which undermine it. '
            'It works well together with stress and digital detox assessments to give a more complete picture of your emotional well-being and lifestyle.',
      };

  @override
  int get questionCount => 40;

  @override
  int get estimatedMinutes => 12;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'sleep',
        'recovery',
        'wellbeing',
        'lifestyle',
        'stress',
        'digital_hygiene',
        'sleep_quality',
        'daytime_functioning',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '2.0',
        'author': '4Marketing / Nikita & ChatGPT (draft)',
        'year': 2025,
        'category_display': 'Эмоциональное состояние',
        'theoretical_basis': [
          'Sleep hygiene models',
          'Two-process model of sleep regulation',
          'Subjective sleep quality assessment',
          'Daytime functioning evaluation',
          'Sleep environment optimization',
          'Sleep disorders screening',
        ],
        'factors': [
          'sleep_rhythm',
          'sleep_quality',
          'daytime_functioning',
          'screens_and_habits',
          'stress_and_recovery',
          'sleep_environment',
          'physical_symptoms',
          'sleep_disorders',
        ],
        'reversed_questions': [6, 8, 10, 12, 14, 15, 22, 24, 26, 28, 32, 36],
        'response_type': 'frequency',
        'response_options': {
          'ru': [
            'Почти никогда',
            'Редко',
            'Иногда',
            'Часто',
            'Почти всегда'
          ],
          'en': [
            'Almost never',
            'Rarely',
            'Sometimes',
            'Often',
            'Almost always'
          ],
        },
        'scoring': [0, 1, 2, 3, 4],
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самооценки качества сна и выявления привычек, влияющих на восстановление. '
              'Результаты не являются медицинским диагнозом. При выраженных проблемах со сном рекомендуется '
              'консультация с врачом или сомнологом.',
          'en':
              'This test is for self-assessment of sleep quality and identifying habits affecting recovery. '
              'Results are not a medical diagnosis. For pronounced sleep problems, consultation '
              'with a doctor or sleep specialist is recommended.',
        },
        'interpretation_levels': {
          'very_low': '0-39%',
          'low': '40-59%',
          'moderate': '60-79%',
          'high': '80-100%',
        },
        'tags': [
          'sleep',
          'recovery',
          'wellbeing',
          'lifestyle',
        ],
      };
}
