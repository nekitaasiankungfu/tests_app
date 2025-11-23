import '../../models/test_model.dart';
import 'test_stub.dart';

/// Test stub для цветового психологического теста
///
/// Специальный тест с нестандартным интерфейсом
/// Использует отдельный экран ColorPsychologyTestScreen
/// вместо стандартного TestScreen
///
/// @author: Color Psychology Research Institute
/// @version: 1.0.0

class ColorPsychologyTest extends TestStub {
  @override
  String get id => 'color_psychology_v1';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
    'ru': 'Цветовая психология',
    'en': 'Color Psychology',
  };

  @override
  Map<String, String> get description => {
    'ru': 'Диагностика эмоционального состояния через цветовые предпочтения',
    'en': 'Diagnosis of emotional state through color preferences',
  };

  @override
  int get questionCount => 6; // 6 этапов

  @override
  int get estimatedMinutes => 15; // 12-15 минут

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => ['emotional', 'quick', 'projective', 'color', 'visual'];

  @override
  String get assetPath => ''; // Legacy Dart

  static TestModel getColorPsychologyTest() {
    return TestModel(
      id: 'color_psychology_v1',
      title: {
        'ru': 'Цветовая психология',
        'en': 'Color Psychology',
      },
      description: {
        'ru': 'Расширенная диагностика эмоционального состояния и личностных особенностей через цветовые предпочтения. '
            'Тест включает 6 этапов (12-15 минут): '
            '1. Быстрый выбор любимых и нелюбимых цветов (30 сек). '
            '2. Ранжирование всех цветов по предпочтению (60 сек). '
            '3. Парные сравнения цветов (2 мин). '
            '4. Ассоциации цветов с эмоциями. '
            '5. Выбор цветов для жизненных сфер и ситуаций. '
            '6. Цветовая временная перспектива (прошлое-настоящее-будущее). '
            'Отвечайте интуитивно, выбирая то, что откликается СЕЙЧАС.',
        'en': 'Extended diagnosis of emotional state and personality traits through color preferences. '
            'The test includes 6 stages (12-15 minutes): '
            '1. Quick selection of liked and disliked colors (30 sec). '
            '2. Ranking all colors by preference (60 sec). '
            '3. Paired color comparisons (2 min). '
            '4. Color associations with emotions. '
            '5. Color choices for life domains and situations. '
            '6. Color temporal perspective (past-present-future). '
            'Answer intuitively, choosing what resonates NOW.',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      factorIds: [
        'energy_level',
        'stress_level',
        'emotional_balance',
        'openness',
        'control_need',
        'satisfaction',
        'defensiveness',
        'need_for_change',
        'optimism',
        'social_connection',
        'self_esteem',
        'future_orientation',
      ],
      questions: [], // Пустой список - тест использует специальный интерфейс
      estimatedTime: 15, // 12-15 минут
      type: TestType.multiFactor,
      disclaimer: {
        'ru': 'Этот тест измеряет ваше ТЕКУЩЕЕ эмоциональное состояние, а не постоянные черты личности. '
            'Результаты не являются клиническим диагнозом. '
            'При выявлении тревожных паттернов рекомендуется консультация со специалистом.',
        'en': 'This test measures your CURRENT emotional state, not permanent personality traits. '
            'Results are not a clinical diagnosis. '
            'If concerning patterns are detected, consultation with a specialist is recommended.',
      },
    );
  }
}