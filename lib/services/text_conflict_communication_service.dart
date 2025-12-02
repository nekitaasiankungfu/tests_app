import '../models/text_conflict_communication_model.dart';
import '../data/text_conflict_communication_data.dart';
import '../utils/app_logger.dart';

/// Сервис для обработки результатов теста коммуникации в текстовых конфликтах
///
/// Рассчитывает проценты по 4 шкалам и определяет профиль
///
/// @version: 1.0.0

class TextConflictCommunicationService {
  /// Рассчитать результаты теста
  TextConflictTestResult calculateResults(List<ScenarioAnswer> answers) {
    try {
      // Подсчитать сумму баллов по каждой шкале
      final scaleTotals = <String, int>{
        'avoidance': 0,
        'aggression': 0,
        'passive_revenge': 0,
        'assertiveness': 0,
      };

      // Максимально возможные баллы по каждой шкале
      // Каждый вопрос может дать от 0 до 4 баллов по каждой шкале
      // 20 вопросов × 4 max = 80 максимум по каждой шкале
      final maxScaleScore = answers.length * 4;

      // Суммировать баллы
      for (final answer in answers) {
        for (final entry in answer.scaleContributions.entries) {
          final scale = entry.key;
          final score = entry.value;
          scaleTotals[scale] = (scaleTotals[scale] ?? 0) + score;
        }
      }

      // Рассчитать проценты
      final scalePercentages = <String, double>{};
      for (final scale in scaleTotals.keys) {
        final total = scaleTotals[scale] ?? 0;
        final percentage = (total / maxScaleScore) * 100;
        scalePercentages[scale] = percentage.clamp(0.0, 100.0);
      }

      // Определить профиль
      final profileId = TextConflictCommunicationData.determineProfile(scalePercentages);

      appLogger.i('Text Conflict Test completed: $scalePercentages, Profile: $profileId');

      return TextConflictTestResult(
        answers: answers,
        scalePercentages: scalePercentages,
        profileId: profileId,
      );
    } catch (e, stackTrace) {
      appLogger.e('Error calculating test results', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Получить название шкалы
  Map<String, String> getScaleName(String scaleId) {
    final names = {
      'avoidance': {
        'ru': 'Избегание конфликта',
        'en': 'Conflict Avoidance',
      },
      'aggression': {
        'ru': 'Агрессия',
        'en': 'Aggression',
      },
      'passive_revenge': {
        'ru': 'Пассивная месть',
        'en': 'Passive Revenge',
      },
      'assertiveness': {
        'ru': 'Ассертивность',
        'en': 'Assertiveness',
      },
    };
    return names[scaleId] ?? {'ru': scaleId, 'en': scaleId};
  }

  /// Получить иконку для шкалы
  String getScaleIcon(String scaleId) {
    final icons = {
      'avoidance': '👻',
      'aggression': '💥',
      'passive_revenge': '😒',
      'assertiveness': '🎯',
    };
    return icons[scaleId] ?? '📊';
  }

  /// Получить цвет для шкалы
  String getScaleColorHex(String scaleId) {
    final colors = {
      'avoidance': '#9E9E9E', // Серый
      'aggression': '#F44336', // Красный
      'passive_revenge': '#FF9800', // Оранжевый
      'assertiveness': '#4CAF50', // Зелёный
    };
    return colors[scaleId] ?? '#2196F3';
  }

  /// Получить интерпретацию для уровня шкалы
  Map<String, String> getScaleInterpretation(String scaleId, double percentage) {
    // Защита от NaN
    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    percentage = percentage.clamp(0.0, 100.0);

    if (scaleId == 'avoidance') {
      if (percentage >= 70) {
        return {
          'ru': 'Очень высокий уровень избегания. Ты часто "исчезаешь" в сложных ситуациях.',
          'en': 'Very high avoidance level. You often "disappear" in difficult situations.',
        };
      } else if (percentage >= 50) {
        return {
          'ru': 'Повышенный уровень избегания. Ты склонен откладывать сложные разговоры.',
          'en': 'Elevated avoidance level. You tend to postpone difficult conversations.',
        };
      } else if (percentage >= 30) {
        return {
          'ru': 'Умеренное избегание. Иногда уходишь от конфликтов.',
          'en': 'Moderate avoidance. Sometimes you avoid conflicts.',
        };
      } else {
        return {
          'ru': 'Низкий уровень избегания. Ты готов обсуждать проблемы.',
          'en': 'Low avoidance level. You\'re ready to discuss problems.',
        };
      }
    } else if (scaleId == 'aggression') {
      if (percentage >= 70) {
        return {
          'ru': 'Очень высокая агрессия в переписке. Ты часто "взрываешься".',
          'en': 'Very high aggression in texting. You often "explode".',
        };
      } else if (percentage >= 50) {
        return {
          'ru': 'Повышенная агрессия. Ты можешь резко реагировать в переписке.',
          'en': 'Elevated aggression. You can react harshly in texting.',
        };
      } else if (percentage >= 30) {
        return {
          'ru': 'Умеренная агрессия. Иногда отвечаешь слишком резко.',
          'en': 'Moderate aggression. Sometimes you respond too harshly.',
        };
      } else {
        return {
          'ru': 'Низкий уровень агрессии. Ты сохраняешь спокойствие.',
          'en': 'Low aggression level. You maintain calmness.',
        };
      }
    } else if (scaleId == 'passive_revenge') {
      if (percentage >= 70) {
        return {
          'ru': 'Очень высокая пассивная агрессия. Ты часто используешь игнор и сарказм.',
          'en': 'Very high passive aggression. You often use ignoring and sarcasm.',
        };
      } else if (percentage >= 50) {
        return {
          'ru': 'Повышенная пассивная агрессия. Ты склонен "мстить молчанием".',
          'en': 'Elevated passive aggression. You tend to "revenge with silence".',
        };
      } else if (percentage >= 30) {
        return {
          'ru': 'Умеренная пассивная агрессия. Иногда используешь намёки.',
          'en': 'Moderate passive aggression. Sometimes you use hints.',
        };
      } else {
        return {
          'ru': 'Низкий уровень пассивной агрессии. Ты говоришь прямо.',
          'en': 'Low passive aggression level. You speak directly.',
        };
      }
    } else if (scaleId == 'assertiveness') {
      if (percentage >= 70) {
        return {
          'ru': 'Очень высокая ассертивность! Ты умеешь говорить о чувствах конструктивно.',
          'en': 'Very high assertiveness! You can talk about feelings constructively.',
        };
      } else if (percentage >= 50) {
        return {
          'ru': 'Хорошая ассертивность. Ты часто выражаешь границы спокойно.',
          'en': 'Good assertiveness. You often express boundaries calmly.',
        };
      } else if (percentage >= 30) {
        return {
          'ru': 'Умеренная ассертивность. Иногда ты можешь говорить о чувствах.',
          'en': 'Moderate assertiveness. Sometimes you can talk about feelings.',
        };
      } else {
        return {
          'ru': 'Низкая ассертивность. Тебе сложно выражать границы прямо.',
          'en': 'Low assertiveness. It\'s difficult for you to express boundaries directly.',
        };
      }
    }

    return {
      'ru': 'Оценка: ${percentage.toStringAsFixed(0)}%',
      'en': 'Score: ${percentage.toStringAsFixed(0)}%',
    };
  }
}
