import 'test_stub.dart';

/// Attachment Style: Your Relationship Patterns Test
///
/// Comprehensive assessment of attachment style across 4 dimensions:
/// secure, anxious, avoidant, and fearful_avoidant.
///
/// Based on Bowlby's Attachment Theory (1969), Ainsworth's Strange Situation (1970),
/// Bartholomew & Horowitz Four-Category Model (1991), and Adult Attachment Research.
///
/// Not a clinical diagnosis. For self-awareness and relationship pattern understanding.
class AttachmentStyleTest extends TestStub {
  @override
  String get id => 'attachment_styles_v1';

  @override
  String get category => 'relationships';

  @override
  Map<String, String> get name => {
        'ru': 'Тест стилей привязанности в отношениях',
        'en': 'Attachment Styles in Relationships Test',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Этот тест поможет вам понять ваш стиль привязанности — уникальный паттерн того, как вы формируете и поддерживаете близкие отношения. Стиль привязанности формируется в раннем детстве и влияет на то, как вы взаимодействуете с партнерами, друзьями и близкими людьми во взрослой жизни.\n\nТест основан на современных психологических исследованиях теории привязанности и измеряет четыре основных стиля: безопасный (комфорт с близостью и независимостью), тревожный (страх отвержения и сильная потребность в близости), избегающий (дискомфорт с близостью и акцент на независимости) и дезорганизованный (противоречивые чувства о близости).\n\nПонимание своего стиля привязанности — первый шаг к построению более здоровых и гармоничных отношений. Результаты теста помогут вам осознать свои паттерны поведения и получить практические рекомендации по их улучшению.',
        'en':
            'This test will help you understand your attachment style — a unique pattern of how you form and maintain close relationships. Attachment style forms in early childhood and influences how you interact with partners, friends, and loved ones in adulthood.\n\nBased on modern psychological research in attachment theory, the test measures four main styles: secure (comfort with intimacy and independence), anxious (fear of rejection and strong need for closeness), avoidant (discomfort with intimacy and emphasis on independence), and fearful (contradictory feelings about intimacy).\n\nUnderstanding your attachment style is the first step toward building healthier and more harmonious relationships. The test results will help you recognize your behavioral patterns and receive practical recommendations for improvement.',
      };

  @override
  int get questionCount => 60;

  @override
  int get estimatedMinutes => 12;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'relationships',
        'attachment',
        'romantic_relationships',
        'emotional_bonds',
        'comprehensive',
      ];

  @override
  String get assetPath => ''; // Legacy Dart architecture

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0.0',
        'author': 'Original Development',
        'year': '2025',
        'category_display': {
          'ru': 'Отношения',
          'en': 'Relationships',
        },
        'factors': [
          'secure',
          'anxious',
          'avoidant',
          'fearful',
        ],
        'factor_names': {
          'ru': {
            'secure': 'Безопасный стиль',
            'anxious': 'Тревожный стиль',
            'avoidant': 'Избегающий стиль',
            'fearful': 'Дезорганизованный стиль',
          },
          'en': {
            'secure': 'Secure',
            'anxious': 'Anxious',
            'avoidant': 'Avoidant',
            'fearful': 'Fearful-Avoidant',
          },
        },
        'response_type': 'likert_5',
        'scientific_basis': [
          'Теория привязанности Джона Боулби',
          'Исследования Мэри Эйнсворт о паттернах привязанности',
          'Современные модели привязанности у взрослых (Хазан и Шейвер)',
          'Двухмерная модель привязанности (тревожность и избегание)',
        ],
      };
}
