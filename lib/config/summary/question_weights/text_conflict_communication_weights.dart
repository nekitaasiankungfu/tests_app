import 'question_weight_models.dart';

/// Weights для Text Conflict Communication Test
///
/// Связывает 4 шкалы теста с 195 психологическими шкалами:
/// - avoidance (избегание конфликтов)
/// - aggression (агрессия)
/// - passive_revenge (пассивная месть)
/// - assertiveness (ассертивность)
///
/// @version: 1.0.0

class TextConflictCommunicationWeights {
  static final Map<String, QuestionWeight> weights = {
    // Avoidance scale (избегание конфликтов)
    'text_conflict_communication:avoidance': QuestionWeight(
      testId: 'text_conflict_communication',
      questionId: 'avoidance',
      axisWeights: {
        // Высокое избегание связано с:
        'anxiety': 0.8, // Тревожность (избегают из-за страха)
        'self_consciousness': 0.7, // Застенчивость
        'conflict_avoidance': 0.9, // Избегание конфликтов (прямая связь)
        'assertiveness': -0.9, // Низкая ассертивность (обратная)
        'communication_openness': -0.7, // Низкая открытость в общении
        'trust': -0.6, // Недоверие к конструктивному исходу
        'self_esteem': -0.5, // Низкая самооценка
        'fear_of_conflict': 0.9, // Страх конфликта
        'social_courage': -0.7, // Низкая социальная смелость
        'emotional_expression': -0.6, // Подавление эмоций
      },
    ),

    // Aggression scale (агрессия в переписке)
    'text_conflict_communication:aggression': QuestionWeight(
      testId: 'text_conflict_communication',
      questionId: 'aggression',
      axisWeights: {
        // Высокая агрессия связана с:
        'anger': 0.9, // Гневливость (прямая связь)
        'hostility': 0.8, // Враждебность
        'impulsiveness': 0.7, // Импульсивность (быстрые реакции)
        'aggression': 0.9, // Агрессивность (прямая)
        'irritability': 0.8, // Раздражительность
        'emotional_control': -0.8, // Низкий эмоциональный контроль
        'frustration_tolerance': -0.7, // Низкая толерантность к фрустрации
        'empathy': -0.6, // Низкая эмпатия
        'conflict_resolution': -0.7, // Плохие навыки разрешения конфликтов
        'thinking': 0.6, // Thinking (логика) vs Feeling - при гневе логика доминирует над эмпатией
      },
    ),

    // Passive Revenge scale (пассивная месть)
    'text_conflict_communication:passive_revenge': QuestionWeight(
      testId: 'text_conflict_communication',
      questionId: 'passive_revenge',
      axisWeights: {
        // Высокая пассивная агрессия связана с:
        'passive_aggressiveness': 0.9, // Пассивная агрессивность (прямая)
        'resentment': 0.8, // Обида/затаенная злость
        'manipulation': 0.7, // Манипулятивность
        'indirect_communication': 0.8, // Непрямая коммуникация
        'assertiveness': -0.8, // Низкая ассертивность
        'emotional_honesty': -0.7, // Низкая эмоциональная честность
        'communication_openness': -0.8, // Закрытость в общении
        'conflict_resolution': -0.6, // Плохие навыки разрешения
        'anger': 0.6, // Подавленный гнев
        'trust': -0.5, // Недоверие
      },
    ),

    // Assertiveness scale (ассертивность)
    'text_conflict_communication:assertiveness': QuestionWeight(
      testId: 'text_conflict_communication',
      questionId: 'assertiveness',
      axisWeights: {
        // Высокая ассертивность связана с:
        'assertiveness': 0.9, // Ассертивность (прямая связь)
        'communication_openness': 0.8, // Открытость в общении
        'emotional_expression': 0.8, // Выражение эмоций
        'emotional_honesty': 0.8, // Эмоциональная честность
        'conflict_resolution': 0.9, // Навыки разрешения конфликтов
        'self_esteem': 0.7, // Самооценка
        'emotional_control': 0.7, // Эмоциональный контроль
        'empathy': 0.6, // Эмпатия
        'social_courage': 0.7, // Социальная смелость
        'boundary_setting': 0.9, // Способность устанавливать границы
        'feeling': 0.6, // Feeling (чувства) - внимание к эмоциям своим и других
        'anxiety': -0.5, // Низкая тревожность (обратная)
        'conflict_avoidance': -0.9, // Низкое избегание конфликтов
        'passive_aggressiveness': -0.8, // Низкая пассивная агрессивность
      },
    ),
  };
}
