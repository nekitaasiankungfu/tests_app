import 'test_stub.dart';

/// Опросник симптомов депрессии (Depression Symptoms Inventory)
///
/// Оценка выраженности симптомов депрессии за последние две недели
/// по пяти ключевым компонентам:
/// - Эмоциональные симптомы (emotional) - сниженное настроение, грусть, пустота
/// - Когнитивные симптомы (cognitive) - негативное мышление, самокритика, безнадёжность
/// - Мотивационные симптомы (motivational) - потеря интереса, апатия, истощение
/// - Соматические симптомы (somatic) - нарушения сна, аппетита, усталость
/// - Социальные симптомы (social) - изоляция, снижение функционирования
///
/// Основан на когнитивной триаде депрессии (Beck), критериях DSM-5 и МКБ-11,
/// биопсихосоциальной и поведенческой моделях депрессии.
///
/// Содержит 27 вопросов с 4-балльной шкалой частоты (0-3).
/// Время прохождения: ~7 минут.
/// Категория: Эмоциональное состояние
///
/// ВАЖНО: Q27 - критический пункт (суицидальные мысли)
class DepressionSymptomsInventoryTest extends TestStub {
  @override
  String get id => 'depression_symptoms_inventory_v1';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Опросник симптомов депрессии',
        'en': 'Depression Symptoms Inventory',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Оценка выраженности эмоциональных, когнитивных, мотивационных, соматических '
            'и социальных симптомов депрессии за последние две недели. Помогает отслеживать '
            'динамику состояния и осознавать, как депрессия проявляется именно у вас.',
        'en':
            'Assessment of emotional, cognitive, motivational, somatic and social depression '
            'symptoms over the past two weeks. Helps track changes in your condition and '
            'understand how depression manifests specifically for you.',
      };

  @override
  int get questionCount => 27;

  @override
  int get estimatedMinutes => 7;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'depression',
        'mood',
        'mental_health',
        'emotional',
        'self_assessment',
        'screening',
      ];

  @override
  String get assetPath => ''; // Legacy Dart architecture

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': 'Mental Health Assessment Lab',
        'year': 2025,
        'category_display': {
          'ru': 'Эмоциональное состояние',
          'en': 'Emotional State',
        },
        'factors': [
          'emotional',
          'cognitive',
          'motivational',
          'somatic',
          'social',
        ],
        'response_type': 'frequency_2weeks',
        'time_frame': 'last_14_days',
        'theoretical_basis': [
          'Когнитивная триада депрессии (Beck)',
          'Критерии большого депрессивного эпизода DSM-5',
          'Критерии депрессивного эпизода МКБ-11',
          'Биопсихосоциальная модель депрессии',
          'Поведенческая модель депрессии (Lewinsohn)',
        ],
        'disclaimer': {
          'ru':
              'Этот тест является инструментом самооценки и НЕ заменяет профессиональную '
              'диагностику. Высокие баллы не означают наличие депрессивного расстройства. '
              'Депрессия хорошо поддаётся лечению при правильном подходе. '
              'При значительном дискомфорте или мыслях о суициде обратитесь к специалисту. '
              'Телефон доверия: 8-800-2000-122 (бесплатно, круглосуточно)',
          'en':
              'This test is a self-assessment tool and does NOT replace professional '
              'diagnosis. High scores do not indicate a depressive disorder. '
              'Depression responds well to treatment with the right approach. '
              'If you experience significant distress or suicidal thoughts, consult a specialist.',
        },
        'interpretation_ranges': {
          'minimal': '0-16%',
          'mild': '17-35%',
          'moderate': '36-58%',
          'severe': '59-78%',
          'very_severe': '79-100%',
        },
        'critical_items': [27], // Q27 - suicidal ideation
      };
}
