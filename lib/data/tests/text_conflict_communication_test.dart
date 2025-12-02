import '../../models/test_model.dart';
import 'test_stub.dart';

/// Test stub для теста коммуникации в текстовых конфликтах
///
/// Специальный тест с нестандартным интерфейсом
/// Использует отдельный экран TextConflictCommunicationTestScreen
/// вместо стандартного TestScreen
///
/// @version: 1.0.0

class TextConflictCommunicationTest extends TestStub {
  @override
  String get id => 'text_conflict_communication';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
    'ru': 'Конфликт в переписке',
    'en': 'Text Conflict Communication',
  };

  @override
  Map<String, String> get description => {
    'ru': 'Какой ты собеседник в текстовых конфликтах',
    'en': 'What kind of texter are you in conflicts',
  };

  @override
  int get questionCount => 20; // 20 сценариев

  @override
  int get estimatedMinutes => 6; // 5-6 минут

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => ['emotional', 'communication', 'relationships', 'scenarios'];

  @override
  String get assetPath => ''; // Legacy Dart

  static TestModel getTextConflictCommunicationTest() {
    return TestModel(
      id: 'text_conflict_communication',
      title: {
        'ru': 'Тест «Конфликт в переписке: какой ты собеседник»',
        'en': 'Text Conflict Communication Test: What Kind of Texter Are You',
      },
      description: {
        'ru': 'Современное общение переместилось в мессенджеры, и конфликты теперь тоже происходят в чатах. '
            'Отмена встречи за час до неё, токсичная шутка в групповом чате, прочитанное но игнорируемое сообщение, '
            'напряжённая переписка с партнёром — всё это создаёт новые вызовы для коммуникации.\n\n'
            'В текстовом общении нет интонации, мимики и возможности мгновенно прояснить недопонимание, '
            'поэтому стиль переписки особенно важен.\n\n'
            'Этот тест измеряет твой стиль общения в конфликтах через переписку: '
            'избегаешь ли ты конфликтов (ghosting, оставление на прочитанном), '
            'реагируешь ли агрессивно (взрываешься, нападаешь), '
            'используешь ли пассивно-агрессивные методы (сарказм, молчаливое наказание) '
            'или умеешь общаться ассертивно (спокойно обозначаешь границы и чувства).\n\n'
            'Ты увидишь 20 реальных ситуаций из переписок и выберешь, как бы ты ответил. '
            'Результаты помогут понять твои паттерны общения в чатах и получить советы, '
            'как улучшить цифровую коммуникацию.',
        'en': 'Modern communication has moved to messengers, and conflicts now also occur in chats. '
            'Meeting cancellation an hour before, toxic joke in group chat, read but ignored message, '
            'tense texting with partner — all this creates new challenges for communication.\n\n'
            'In text communication there\'s no intonation, facial expressions, or ability to instantly clarify misunderstanding, '
            'so texting style is especially important.\n\n'
            'This test measures your communication style in text conflicts: '
            'do you avoid conflicts (ghosting, leaving on read), '
            'react aggressively (explode, attack), '
            'use passive-aggressive methods (sarcasm, silent treatment), '
            'or can communicate assertively (calmly state boundaries and feelings).\n\n'
            'You\'ll see 20 real texting situations and choose how you\'d respond. '
            'Results will help understand your chat communication patterns and get advice on improving digital communication.',
      },
      category: {
        'ru': 'Эмоциональное состояние',
        'en': 'Emotional State',
      },
      categoryId: 'emotional',
      factorIds: [
        'avoidance',
        'aggression',
        'passive_revenge',
        'assertiveness',
      ],
      questions: [], // Пустой список - тест использует специальный интерфейс
      estimatedTime: 6,
      type: TestType.multiFactor,
    );
  }
}
