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
  String get id => 'attachment_style_v1';

  @override
  String get category => 'relationships';

  @override
  Map<String, String> get name => {
        'ru': 'Стили привязанности: Ваши паттерны в отношениях',
        'en': 'Attachment Style: Your Relationship Patterns',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Стиль привязанности — это глубинный паттерн того, как вы формируете эмоциональные связи с другими людьми. Он формируется в детстве (0-3 года) в отношениях с основными опекунами и влияет на все ваши близкие отношения во взрослой жизни.\n\nТеория привязанности, разработанная психологом Джоном Боулби в 1950-х годах и расширенная Мэри Эйнсворт, показывает, что наш опыт ранних отношений создаёт "рабочую модель" отношений, которую мы неосознанно воспроизводим.\n\nЧетыре стиля привязанности: Безопасная (Secure) 🟢 ~50%, Тревожная (Anxious) 🟡 ~20%, Избегающая (Avoidant) 🔵 ~25%, Тревожно-избегающая (Fearful-Avoidant) 🔴 ~5%.\n\nВаш стиль привязанности НЕ приговор — это паттерн, который можно изменить через осознанность, терапию и здоровые отношения.',
        'en':
            'Attachment style is a deep-rooted pattern of how you form emotional bonds with others. It forms in childhood (0-3 years) in relationships with primary caregivers and affects all your close relationships in adulthood.\n\nAttachment theory, developed by psychologist John Bowlby in the 1950s and expanded by Mary Ainsworth, shows that our early relationship experiences create a "working model" of relationships that we unconsciously reproduce.\n\nFour attachment styles: Secure 🟢 ~50%, Anxious 🟡 ~20%, Avoidant 🔵 ~25%, Fearful-Avoidant 🔴 ~5%.\n\nYour attachment style is NOT a life sentence — it\'s a pattern that can be changed through awareness, therapy, and healthy relationships.',
      };

  @override
  int get questionCount => 40;

  @override
  int get estimatedMinutes => 10;

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
        'author': 'Attachment Research Institute',
        'year': '2025',
        'category_display': {
          'ru': 'Отношения',
          'en': 'Relationships',
        },
        'factors': [
          'secure',
          'anxious',
          'avoidant',
          'fearful_avoidant',
        ],
        'factor_names': {
          'ru': {
            'secure': 'Безопасная привязанность (Secure)',
            'anxious': 'Тревожная привязанность (Anxious-Preoccupied)',
            'avoidant': 'Избегающая привязанность (Dismissive-Avoidant)',
            'fearful_avoidant':
                'Тревожно-избегающая привязанность (Fearful-Avoidant)',
          },
          'en': {
            'secure': 'Secure Attachment',
            'anxious': 'Anxious-Preoccupied Attachment',
            'avoidant': 'Dismissive-Avoidant Attachment',
            'fearful_avoidant': 'Fearful-Avoidant Attachment',
          },
        },
        'response_type': 'likert_5',
        'scientific_basis': [
          'Bowlby\'s Attachment Theory (1969)',
          'Ainsworth\'s Strange Situation (1970)',
          'Bartholomew & Horowitz Four-Category Model (1991)',
          'Adult Attachment Research',
          'Relationship Patterns in Clinical Psychology',
        ],
      };
}
