import 'test_stub.dart';

/// Опросник симптомов тревоги (Anxiety Symptoms Inventory)
///
/// Оценка выраженности симптомов тревоги за последнюю неделю
/// по четырём ключевым компонентам:
/// - Соматические симптомы (somatic) - телесные проявления тревоги
/// - Когнитивные симптомы (cognitive) - беспокойные мысли и руминации
/// - Эмоциональные симптомы (affective) - страх, нервозность, раздражительность
/// - Поведенческие симптомы (behavioral) - избегание, нарушения сна
///
/// Основан на когнитивно-поведенческой модели тревоги (Beck, Clark),
/// трёхкомпонентной модели эмоций (Lang) и интероцептивной модели тревоги.
///
/// Содержит 24 вопроса с 4-балльной шкалой интенсивности (0-3).
/// Время прохождения: ~5 минут.
/// Категория: Эмоциональное состояние
class AnxietySymptomsInventoryTest extends TestStub {
  @override
  String get id => 'anxiety_symptoms_inventory_v1';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Опросник симптомов тревоги',
        'en': 'Anxiety Symptoms Inventory',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Оценка выраженности соматических, когнитивных, эмоциональных и поведенческих '
            'симптомов тревоги за последнюю неделю. Помогает отслеживать динамику '
            'состояния и осознавать, как тревога проявляется именно у вас.',
        'en':
            'Assessment of somatic, cognitive, emotional and behavioral anxiety symptoms '
            'over the past week. Helps track changes in your condition and understand '
            'how anxiety manifests specifically for you.',
      };

  @override
  int get questionCount => 24;

  @override
  int get estimatedMinutes => 5;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'anxiety',
        'stress',
        'mental_health',
        'emotional',
        'self_assessment',
        'screening',
      ];

  @override
  String get assetPath => ''; // Используем Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Anxiety Research Lab',
        'year': 2025,
        'category_display': {
          'ru': 'Эмоциональное состояние',
          'en': 'Emotional State',
        },
        'factors': [
          'somatic',
          'cognitive',
          'affective',
          'behavioral',
        ],
        'response_type': 'intensity_4point',
        'time_frame': 'last_7_days',
        'theoretical_basis': [
          'Когнитивно-поведенческая модель тревоги (Beck, Clark)',
          'Трёхкомпонентная модель эмоций (Lang)',
          'Интероцептивная модель тревоги',
        ],
        'disclaimer': {
          'ru':
              'Этот тест является инструментом самооценки и НЕ заменяет профессиональную '
              'диагностику. Высокие баллы не означают наличие тревожного расстройства. '
              'При значительном дискомфорте рекомендуется консультация специалиста.',
          'en':
              'This test is a self-assessment tool and does NOT replace professional '
              'diagnosis. High scores do not indicate an anxiety disorder. '
              'If you experience significant distress, consult a specialist.',
        },
        'interpretation_ranges': {
          'minimal': '0-20%',
          'mild': '21-42%',
          'moderate': '43-69%',
          'severe': '70-100%',
        },
      };
}
