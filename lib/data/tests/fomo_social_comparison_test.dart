import 'test_stub.dart';

/// FOMO & Social Comparison Test
///
/// Комплексный тест для оценки влияния социальных сетей на психологическое благополучие.
/// Основан на исследованиях Fear of Missing Out (FOMO), теории социального сравнения
/// (Festinger, 1954), Self-Determination Theory (Deci & Ryan) и современных исследованиях
/// зависимости от социальных сетей.
///
/// Измеряет 6 аспектов цифрового благополучия:
/// - FOMO (страх упустить что-то важное)
/// - Social Comparison (социальное сравнение)
/// - Validation Seeking (зависимость от онлайн-одобрения)
/// - Envy & Discontent (зависть к чужим успехам)
/// - Compulsive Checking (компульсивное поведение в соцсетях)
/// - Self-Worth Dependency (самооценка в соцсетях)
///
/// Содержит 48 вопросов с frequency-шкалой ответов (Никогда - Постоянно).
/// Все вопросы прямые (без реверса), измеряют проблемные паттерны поведения.
///
/// Версия: 1.0
/// Время прохождения: ~8 минут
/// Категория: Эмоциональное состояние
/// Целевая аудитория: Подростки и взрослые от 14 лет, активные пользователи соцсетей
class FomoSocialComparisonTest extends TestStub {
  @override
  String get id => 'fomo_social_comparison_v1';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Тест на FOMO и социальное сравнение',
        'en': 'FOMO & Social Comparison Test',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Насколько сильно тебя триггерят чужие сторис? Измеряет влияние соцсетей '
            'на ваше психологическое состояние: FOMO, социальное сравнение, зависимость '
            'от лайков, зависть и компульсивное поведение.',
        'en':
            'How much do others\' stories trigger you? Measures social media\'s impact '
            'on your psychological state: FOMO, social comparison, like dependency, '
            'envy and compulsive behavior.',
      };

  @override
  int get questionCount => 48;

  @override
  int get estimatedMinutes => 8;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'fomo',
        'social_media',
        'digital_wellbeing',
        'social_comparison',
        'addiction',
        'mental_health',
        'self_esteem',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Based on FOMO and social comparison research',
        'year': 2025,
        'category_display': 'Эмоциональное состояние',
        'factors': [
          'fomo',
          'social_comparison',
          'validation_seeking',
          'envy_discontent',
          'compulsive_checking',
          'self_worth_dependency',
        ],
        'reversed_questions': [], // Все вопросы прямые
        'response_types': ['frequency'], // Никогда - Постоянно
        'theoretical_basis': [
          'Fear of Missing Out Theory (Przybylski et al., 2013)',
          'Social Comparison Theory (Festinger, 1954)',
          'Self-Determination Theory (Deci & Ryan)',
          'Social Media Addiction Research',
          'Digital Well-being Framework',
        ],
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самооценки влияния социальных сетей на ваше '
              'психологическое состояние. Не является медицинской диагностикой. '
              'Если результаты показывают критическую зависимость - рекомендуется '
              'обратиться к психологу или специалисту по зависимостям.',
          'en':
              'This test is for self-assessment of social media\'s impact on your '
              'psychological state. Not a medical diagnosis. '
              'If results show critical dependency - consider consulting a psychologist '
              'or addiction specialist.',
        },
        'interpretation_ranges': {
          'excellent': '0-20%',
          'good': '21-40%',
          'warning': '41-60%',
          'critical': '61-80%',
          'danger': '81-100%',
        },
        'age_warning': {
          'ru':
              'Если тебе меньше 18 лет и результаты в критической зоне — '
              'поговори с родителями или школьным психологом',
          'en':
              'If you\'re under 18 and results are in critical zone — '
              'talk to parents or school psychologist',
        },
        'tags': [
          'fomo',
          'social_media',
          'digital_wellbeing',
          'social_comparison',
          'addiction',
        ],
      };
}
