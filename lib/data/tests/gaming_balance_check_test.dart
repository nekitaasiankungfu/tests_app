import 'test_stub.dart';

/// Тест на диагностику баланса гейминга и игровой зависимости
///
/// Нейтральный чек-ап того, как игры влияют на сон, учёбу/работу, общение и настроение.
/// Не ставит диагнозы, а помогает честно посмотреть на текущий баланс гейминга и жизни.
///
/// Измеряет 4 ключевых аспекта:
/// - Игровое время и вторжение в другие сферы (time_intrusion)
/// - Потеря контроля и навязчивое влечение к играм (loss_of_control)
/// - Игры как способ регулировать настроение (mood_regulation)
/// - Нарушение жизненного баланса из-за гейминга (balance_disruption)
///
/// Содержит 24 вопроса с частотной шкалой (Никогда - Всегда)
/// Результат: 4 уровня риска (low_risk, moderate_risk, elevated_risk, high_risk)
///
/// Версия: 1.0
/// Время прохождения: ~7 минут
/// Категория: Эмоциональное состояние
class GamingBalanceCheckTest extends TestStub {
  @override
  String get id => 'gaming_balance_check_v1';

  @override
  String get category => 'emotional';

  @override
  Map<String, String> get name => {
        'ru': 'Игровая зависимость и баланс гейминга',
        'en': 'Gaming Addiction & Balance Check',
      };

  @override
  Map<String, String> get description => {
        'ru':
            'Нейтральный чек-ап того, как игры влияют на сон, учёбу/работу, общение и настроение. '
            'Тест исследует четыре аспекта: игровое время, контроль, эмоциональную регуляцию и жизненный баланс. '
            'Не ставит диагнозы, а помогает понять текущий баланс гейминга и других сфер жизни.',
        'en':
            'A neutral check-up of how gaming affects your sleep, study/work, relationships, and mood. '
            'The test explores four aspects: gaming time, control, emotional regulation, and life balance. '
            'Does not diagnose but helps understand your current gaming-life balance.',
      };

  @override
  int get questionCount => 24;

  @override
  int get estimatedMinutes => 7;

  @override
  String get type => 'multi_factor';

  @override
  List<String> get tags => [
        'gaming',
        'addiction',
        'balance',
        'digital_habits',
        'self_control',
        'wellbeing',
      ];

  @override
  String get assetPath => ''; // Использует Legacy Dart архитектуру

  @override
  Map<String, dynamic> get metadata => {
        'version': '1.0',
        'author': '4Marketing Psychology Team',
        'year': 2025,
        'category_display': 'Эмоциональное состояние',
        'factors': [
          'time_intrusion',
          'loss_of_control',
          'mood_regulation',
          'balance_disruption',
        ],
        'reversed_questions': [4, 9, 16, 21, 24],
        'response_type': 'frequency',
        'disclaimer': {
          'ru':
              'Этот тест предназначен для самооценки и не является клинической диагностикой игровой зависимости. '
              'Он помогает осознать текущий баланс гейминга и жизни. При серьёзных проблемах рекомендуется '
              'обратиться к специалисту по цифровым привычкам или психологу.',
          'en':
              'This test is for self-assessment and is not a clinical diagnosis of gaming addiction. '
              'It helps you become aware of your current gaming-life balance. If you experience serious problems, '
              'please consult a digital habits specialist or psychologist.',
        },
        'interpretation_ranges': {
          'low_risk': '0-24%',
          'moderate_risk': '25-49%',
          'elevated_risk': '50-74%',
          'high_risk': '75-100%',
        },
        'theoretical_basis':
            'Based on research on digital habits, behavioral addiction models, and self-regulation theories',
        'tags': [
          'gaming',
          'addiction',
          'balance',
          'digital_habits',
          'self_control'
        ],
      };
}
