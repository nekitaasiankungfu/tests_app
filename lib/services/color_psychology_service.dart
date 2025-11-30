import 'dart:math' as math;
import '../models/color_psychology_model.dart';
import '../data/color_psychology_data.dart';

/// Сервис для обработки результатов цветового психологического теста
///
/// Вычисляет психологические шкалы на основе:
/// - Быстрого выбора
/// - Ранжирования
/// - Парных сравнений
/// - Эмоциональных ассоциаций
/// - Жизненных сфер
/// - Временной перспективы
///
/// @author: Color Psychology Research Institute
/// @version: 2.0.0

class ColorPsychologyService {
  /// Рассчитать результат теста (расширенная версия с 6 этапами)
  ColorPsychologyResult calculateResultExtended({
    required QuickChoiceResult quickChoice,
    required ColorRankingResult ranking,
    required PairedComparisonResult pairedComparisons,
    required EmotionalAssociationResult emotionalAssociations,
    required LifeDomainResult lifeDomains,
    required TemporalPerspectiveResult temporalPerspective,
  }) {
    // Рассчитать баллы для каждой шкалы (12 шкал)
    final scaleScores = _calculateExtendedScaleScores(
      quickChoice,
      ranking,
      pairedComparisons,
      emotionalAssociations,
      lifeDomains,
      temporalPerspective,
    );

    // Получить интерпретации для каждой шкалы
    final interpretations = _getInterpretations(scaleScores);

    // Определить психологические паттерны
    final patterns = _detectExtendedPatterns(
      quickChoice,
      ranking,
      pairedComparisons,
      emotionalAssociations,
      lifeDomains,
      temporalPerspective,
      scaleScores,
    );

    // Расчет метрик согласованности
    final consistencyMetrics = _calculateConsistencyMetrics(
      quickChoice,
      ranking,
      pairedComparisons,
    );

    return ColorPsychologyResult(
      testId: 'color_psychology_v1',
      quickChoice: quickChoice,
      ranking: ranking,
      pairedComparisons: pairedComparisons,
      emotionalAssociations: emotionalAssociations,
      lifeDomains: lifeDomains,
      temporalPerspective: temporalPerspective,
      scaleScores: scaleScores,
      interpretations: interpretations,
      patterns: patterns,
      consistencyMetrics: consistencyMetrics,
    );
  }

  /// Рассчитать результат теста (старая версия с 3 этапами - для совместимости)
  @Deprecated('Use calculateResultExtended instead')
  ColorPsychologyResult calculateResult({
    required QuickChoiceResult quickChoice,
    required ColorRankingResult ranking,
    required ColorAssociationResult associations,
  }) {
    // Рассчитать баллы для каждой шкалы
    final scaleScores = _calculateScaleScores(
      quickChoice,
      ranking,
      associations,
    );

    // Получить интерпретации для каждой шкалы
    final interpretations = _getInterpretations(scaleScores);

    // Определить психологические паттерны
    final patterns = _detectPatterns(
      quickChoice,
      ranking,
      associations,
      scaleScores,
    );

    // Старая версия - создаем результат с пустыми новыми полями
    return ColorPsychologyResult(
      testId: 'color_psychology_v1',
      quickChoice: quickChoice,
      ranking: ranking,
      pairedComparisons: null,
      emotionalAssociations: null,
      lifeDomains: null,
      temporalPerspective: null,
      scaleScores: scaleScores,
      interpretations: interpretations,
      patterns: patterns,
      consistencyMetrics: {},
    );
  }

  /// Рассчитать баллы для психологических шкал
  Map<String, double> _calculateScaleScores(
    QuickChoiceResult quickChoice,
    ColorRankingResult ranking,
    ColorAssociationResult associations,
  ) {
    final scores = <String, double>{};

    // Получить позиции цветов в ранжировании
    final colorPositions = <String, int>{};
    for (int i = 0; i < ranking.rankedColors.length; i++) {
      colorPositions[ranking.rankedColors[i]] = i + 1; // 1-10
    }

    // 1. Энергетический уровень
    scores['energy_level'] = _calculateEnergyLevel(
      colorPositions,
      quickChoice,
    );

    // 2. Уровень стресса
    scores['stress_level'] = _calculateStressLevel(
      colorPositions,
      quickChoice,
      associations,
    );

    // 3. Эмоциональный баланс
    scores['emotional_balance'] = _calculateEmotionalBalance(
      colorPositions,
      scores['stress_level']!,
    );

    // 4. Открытость
    scores['openness'] = _calculateOpenness(
      colorPositions,
      quickChoice,
    );

    // 5. Потребность в контроле
    scores['control_need'] = _calculateControlNeed(
      colorPositions,
      associations,
    );

    // 6. Удовлетворённость
    scores['satisfaction'] = _calculateSatisfaction(
      colorPositions,
      quickChoice,
    );

    // 7. Защитные механизмы
    scores['defensiveness'] = _calculateDefensiveness(
      colorPositions,
      quickChoice,
    );

    // 8. Потребность в изменениях
    scores['need_for_change'] = _calculateNeedForChange(
      colorPositions,
      quickChoice,
      associations,
    );

    return scores;
  }

  /// Рассчитать энергетический уровень
  double _calculateEnergyLevel(
    Map<String, int> positions,
    QuickChoiceResult quickChoice,
  ) {
    // Формула: позиции энергетических цветов
    final redPos = positions['red'] ?? 10;
    final yellowPos = positions['yellow'] ?? 10;
    final orangePos = positions['orange'] ?? 10;

    // Инвертировать позиции (1 -> 10, 10 -> 1)
    final redScore = (11 - redPos) * 5.0;
    final yellowScore = (11 - yellowPos) * 3.0;
    final orangeScore = (11 - orangePos) * 2.0;

    // Бонус за любимые энергетические цвета
    double quickBonus = 0;
    if (quickChoice.likedColors.contains('red')) quickBonus += 10;
    if (quickChoice.likedColors.contains('yellow')) quickBonus += 7;
    if (quickChoice.likedColors.contains('orange')) quickBonus += 5;

    // Штраф за отвергнутые энергетические цвета
    if (quickChoice.dislikedColors.contains('red')) quickBonus -= 10;
    if (quickChoice.dislikedColors.contains('yellow')) quickBonus -= 7;
    if (quickChoice.dislikedColors.contains('orange')) quickBonus -= 5;

    double score = redScore + yellowScore + orangeScore + quickBonus;

    // Нормализовать до 0-100
    return _normalize(score, 0, 120);
  }

  /// Рассчитать уровень стресса
  double _calculateStressLevel(
    Map<String, int> positions,
    QuickChoiceResult quickChoice,
    ColorAssociationResult? associations,
  ) {
    double score = 0;

    // Компенсаторные паттерны (красный и жёлтый в топ-3)
    final redPos = positions['red'] ?? 10;
    final yellowPos = positions['yellow'] ?? 10;
    if (redPos <= 3 && yellowPos <= 3) score += 30;

    // Защитные цвета в начале (чёрный, серый)
    final blackPos = positions['black'] ?? 10;
    final grayPos = positions['gray'] ?? 10;
    if (blackPos <= 3) score += 25;
    if (grayPos <= 3) score += 25;

    // Фиолетовый в начале - внутренний конфликт
    final violetPos = positions['violet'] ?? 10;
    if (violetPos <= 3) score += 15;

    // Количество отвергнутых цветов
    score += quickChoice.dislikedColors.length * 10;

    // Стресс в ассоциациях (если доступны)
    if (associations != null) {
      if (associations.associations['stress_color'] == 'red' ||
          associations.associations['stress_color'] == 'black') {
        score += 15;
      }
    }

    return _normalize(score, 0, 150);
  }

  /// Рассчитать эмоциональный баланс
  double _calculateEmotionalBalance(
    Map<String, int> positions,
    double stressLevel,
  ) {
    final greenPos = positions['green'] ?? 10;
    final bluePos = positions['blue'] ?? 10;

    // Баланс от позиций гармоничных цветов
    final greenScore = (11 - greenPos) * 5.0;
    final blueScore = (11 - bluePos) * 4.0;

    // Вычесть влияние стресса
    double score = greenScore + blueScore - (stressLevel * 0.3);

    return _normalize(score, 0, 90);
  }

  /// Рассчитать открытость
  double _calculateOpenness(
    Map<String, int> positions,
    QuickChoiceResult quickChoice,
  ) {
    final yellowPos = positions['yellow'] ?? 10;
    final orangePos = positions['orange'] ?? 10;
    final pinkPos = positions['pink'] ?? 10;
    final blackPos = positions['black'] ?? 10;

    // Позитив от открытых цветов
    double score = (11 - yellowPos) * 5.0;
    score += (11 - orangePos) * 4.0;
    score += (11 - pinkPos) * 2.0;

    // Негатив от закрытых цветов
    score -= (11 - blackPos) * 3.0;

    // Бонусы за быстрый выбор
    if (quickChoice.likedColors.contains('yellow')) score += 10;
    if (quickChoice.likedColors.contains('orange')) score += 10;
    if (quickChoice.dislikedColors.contains('black')) score += 5;

    return _normalize(score, -30, 100);
  }

  /// Рассчитать потребность в контроле
  double _calculateControlNeed(
    Map<String, int> positions,
    ColorAssociationResult? associations,
  ) {
    final bluePos = positions['blue'] ?? 10;
    final greenPos = positions['green'] ?? 10;
    final grayPos = positions['gray'] ?? 10;

    double score = (11 - bluePos) * 5.0;
    score += (11 - greenPos) * 4.0;
    score += (11 - grayPos) * 2.0;

    // Если работа описана синим - высокая потребность в контроле (если доступны)
    if (associations != null && associations.associations['work_study'] == 'blue') {
      score += 15;
    }

    return _normalize(score, 0, 110);
  }

  /// Рассчитать удовлетворённость
  double _calculateSatisfaction(
    Map<String, int> positions,
    QuickChoiceResult quickChoice,
  ) {
    final brownPos = positions['brown'] ?? 10;
    final blackPos = positions['black'] ?? 10;
    final grayPos = positions['gray'] ?? 10;
    final greenPos = positions['green'] ?? 10;

    // Начинаем со 100 и вычитаем негативные факторы
    double score = 100;
    score -= (11 - brownPos) * 5.0;
    score -= (11 - blackPos) * 4.0;
    score -= (11 - grayPos) * 3.0;
    score += (11 - greenPos) * 2.0;

    // Штрафы за отвергнутые позитивные цвета
    if (quickChoice.dislikedColors.contains('green')) score -= 10;
    if (quickChoice.dislikedColors.contains('yellow')) score -= 10;

    return _normalize(score, 0, 100);
  }

  /// Рассчитать защитные механизмы
  double _calculateDefensiveness(
    Map<String, int> positions,
    QuickChoiceResult quickChoice,
  ) {
    final blackPos = positions['black'] ?? 10;
    final grayPos = positions['gray'] ?? 10;
    final redPos = positions['red'] ?? 10;
    final bluePos = positions['blue'] ?? 10;

    double score = (11 - blackPos) * 5.0;
    score += (11 - grayPos) * 4.0;

    // Конфликт красный-синий
    if (redPos <= 2 && bluePos >= 8) score += 15;
    if (bluePos <= 2 && redPos >= 8) score += 15;

    // Много отвергнутых цветов
    score += quickChoice.dislikedColors.length * 5;

    return _normalize(score, 0, 100);
  }

  /// Рассчитать потребность в изменениях
  double _calculateNeedForChange(
    Map<String, int> positions,
    QuickChoiceResult quickChoice,
    ColorAssociationResult? associations,
  ) {
    final violetPos = positions['violet'] ?? 10;
    final yellowPos = positions['yellow'] ?? 10;

    double score = (11 - violetPos) * 5.0;
    score += (11 - yellowPos) * 3.0;

    // Отвержение стабильных цветов
    int rejectedStable = 0;
    if (quickChoice.dislikedColors.contains('green')) rejectedStable++;
    if (quickChoice.dislikedColors.contains('blue')) rejectedStable++;
    if (quickChoice.dislikedColors.contains('brown')) rejectedStable++;
    score += rejectedStable * 10;

    // Недостающий цвет указывает на потребность (если доступны)
    if (associations != null && associations.associations['missing_color'] != null) {
      score += 15;
    }

    return _normalize(score, 0, 100);
  }

  /// Нормализовать значение в диапазон 0-100
  double _normalize(double value, double min, double max) {
    if (value.isNaN || value.isInfinite) return 0.0;
    value = value.clamp(min, max);
    return ((value - min) / (max - min)) * 100;
  }

  /// Получить интерпретации для шкал
  Map<String, String> _getInterpretations(Map<String, double> scores) {
    final interpretations = <String, String>{};

    for (final entry in scores.entries) {
      final interpretation = ColorPsychologyData.getScaleInterpretation(
        entry.key,
        entry.value,
        'ru', // TODO: получать из LocaleProvider
      );
      interpretations[entry.key] = interpretation['text']!;
    }

    return interpretations;
  }

  /// Определить психологические паттерны
  List<String> _detectPatterns(
    QuickChoiceResult quickChoice,
    ColorRankingResult ranking,
    ColorAssociationResult? associations,
    Map<String, double> scores,
  ) {
    final patterns = <String>[];

    // Получить позиции цветов
    final colorPositions = <String, int>{};
    for (int i = 0; i < ranking.rankedColors.length; i++) {
      colorPositions[ranking.rankedColors[i]] = i + 1;
    }

    // Паттерн выгорания
    if (colorPositions['brown']! <= 3 &&
        colorPositions['gray']! <= 3 &&
        colorPositions['red']! >= 8) {
      patterns.add('burnout_pattern');
    }

    // Компенсаторный паттерн
    if (colorPositions['red']! <= 2 &&
        colorPositions['brown']! <= 3) {
      patterns.add('stress_compensation');
    }

    // Эмоциональное отключение
    if (colorPositions['gray']! <= 2 ||
        (colorPositions['gray']! <= 3 && colorPositions['black']! <= 3)) {
      patterns.add('emotional_shutdown');
    }

    // Тревожный паттерн
    if (colorPositions['yellow']! <= 2 &&
        colorPositions['red']! <= 3 &&
        colorPositions['blue']! >= 8) {
      patterns.add('anxiety_pattern');
    }

    // Депрессивные признаки
    if (colorPositions['gray']! <= 2 &&
        colorPositions['black']! <= 3 &&
        colorPositions['brown']! <= 3) {
      patterns.add('depression_indicators');
    }

    // Гармоничный паттерн
    if (colorPositions['green']! <= 3 &&
        colorPositions['blue']! <= 4 &&
        colorPositions['brown']! > 3 &&
        colorPositions['gray']! > 3 &&
        colorPositions['black']! > 3) {
      patterns.add('healthy_balance');
    }

    // Потребность в заботе
    if (colorPositions['pink']! <= 3 &&
        colorPositions['brown']! <= 3) {
      patterns.add('need_for_warmth');
    }

    return patterns;
  }

  /// Рассчитать расширенные шкалы (12 шкал для 6 этапов)
  Map<String, double> _calculateExtendedScaleScores(
    QuickChoiceResult quickChoice,
    ColorRankingResult ranking,
    PairedComparisonResult pairedComparisons,
    EmotionalAssociationResult emotionalAssociations,
    LifeDomainResult lifeDomains,
    TemporalPerspectiveResult temporalPerspective,
  ) {
    final scores = <String, double>{};

    // Получить позиции цветов в ранжировании
    final colorPositions = <String, int>{};
    for (int i = 0; i < ranking.rankedColors.length; i++) {
      colorPositions[ranking.rankedColors[i]] = i + 1; // 1-10
    }

    // 8 базовых шкал (используют старую логику)
    scores['energy_level'] = _calculateEnergyLevel(colorPositions, quickChoice);
    scores['stress_level'] = _calculateStressLevel(colorPositions, quickChoice, null);
    scores['emotional_balance'] = _calculateEmotionalBalance(colorPositions, scores['stress_level']!);
    scores['openness'] = _calculateOpennessExtended(colorPositions, quickChoice, emotionalAssociations);
    scores['control_need'] = _calculateControlNeedExtended(colorPositions, lifeDomains);
    scores['satisfaction'] = _calculateSatisfactionExtended(colorPositions, quickChoice, lifeDomains);
    scores['defensiveness'] = _calculateDefensiveness(colorPositions, quickChoice);
    scores['need_for_change'] = _calculateNeedForChangeExtended(colorPositions, quickChoice, temporalPerspective);

    // 4 новые шкалы
    scores['optimism'] = _calculateOptimism(colorPositions, emotionalAssociations, temporalPerspective);
    scores['social_connection'] = _calculateSocialConnection(colorPositions, emotionalAssociations, lifeDomains);
    scores['self_esteem'] = _calculateSelfEsteem(colorPositions, quickChoice, temporalPerspective);
    scores['future_orientation'] = _calculateFutureOrientation(temporalPerspective, pairedComparisons.wins);

    return scores;
  }

  /// Расширенная оценка открытости с учетом эмоциональных ассоциаций
  double _calculateOpennessExtended(
    Map<String, int> positions,
    QuickChoiceResult quickChoice,
    EmotionalAssociationResult emotionalAssociations,
  ) {
    double score = _calculateOpenness(positions, quickChoice);

    // Бонус за яркие эмоции
    int brightEmotionsCount = 0;
    for (final color in ['red', 'yellow', 'orange']) {
      if (emotionalAssociations.emotions.values.contains(color)) {
        brightEmotionsCount++;
      }
    }
    score += brightEmotionsCount * 5;

    return _normalize(score, 0, 120);
  }

  /// Расширенная потребность в контроле с учетом жизненных сфер
  double _calculateControlNeedExtended(
    Map<String, int> positions,
    LifeDomainResult lifeDomains,
  ) {
    double score = _calculateControlNeed(positions, null);

    // Анализ цветов для карьеры и финансов
    final careerColor = lifeDomains.domains['career'];
    final financesColor = lifeDomains.domains['finances'];

    if (careerColor == 'blue' || careerColor == 'green') score += 10;
    if (financesColor == 'blue' || financesColor == 'green') score += 10;

    return _normalize(score, 0, 120);
  }

  /// Расширенная удовлетворённость с учетом жизненных сфер
  double _calculateSatisfactionExtended(
    Map<String, int> positions,
    QuickChoiceResult quickChoice,
    LifeDomainResult lifeDomains,
  ) {
    double score = _calculateSatisfaction(positions, quickChoice);

    // Бонус за позитивные цвета в жизненных сферах
    int positiveDomainsCount = 0;
    for (final color in lifeDomains.domains.values) {
      if (['green', 'blue', 'yellow', 'pink'].contains(color)) {
        positiveDomainsCount++;
      }
    }
    score += positiveDomainsCount * 5;

    return _normalize(score, 0, 150);
  }

  /// Расширенная потребность в изменениях с учетом временной перспективы
  double _calculateNeedForChangeExtended(
    Map<String, int> positions,
    QuickChoiceResult quickChoice,
    TemporalPerspectiveResult temporalPerspective,
  ) {
    double score = _calculateNeedForChange(positions, quickChoice, null);

    // Сравнение прошлого и будущего
    if (temporalPerspective.past != temporalPerspective.future) {
      score += 15; // Разные цвета = желание изменений
    }

    // Яркое будущее указывает на готовность к переменам
    if (['red', 'yellow', 'orange'].contains(temporalPerspective.future)) {
      score += 10;
    }

    return _normalize(score, 0, 120);
  }

  /// Рассчитать оптимизм
  double _calculateOptimism(
    Map<String, int> positions,
    EmotionalAssociationResult emotionalAssociations,
    TemporalPerspectiveResult temporalPerspective,
  ) {
    double score = 0;

    // Позиции оптимистичных цветов
    final yellowPos = positions['yellow'] ?? 10;
    final orangePos = positions['orange'] ?? 10;
    final pinkPos = positions['pink'] ?? 10;

    score += (11 - yellowPos) * 8;
    score += (11 - orangePos) * 5;
    score += (11 - pinkPos) * 3;

    // Радость и уверенность
    if (emotionalAssociations.emotions['joy'] != null) {
      final joyColor = emotionalAssociations.emotions['joy']!;
      if (['yellow', 'orange', 'pink'].contains(joyColor)) score += 15;
    }

    // Яркое будущее
    if (['yellow', 'orange', 'green'].contains(temporalPerspective.future)) {
      score += 20;
    }

    return _normalize(score, 0, 150);
  }

  /// Рассчитать социальную связанность
  double _calculateSocialConnection(
    Map<String, int> positions,
    EmotionalAssociationResult emotionalAssociations,
    LifeDomainResult lifeDomains,
  ) {
    double score = 0;

    // Позиции социальных цветов
    final orangePos = positions['orange'] ?? 10;
    final pinkPos = positions['pink'] ?? 10;
    final yellowPos = positions['yellow'] ?? 10;

    score += (11 - orangePos) * 7;
    score += (11 - pinkPos) * 6;
    score += (11 - yellowPos) * 5;

    // Любовь и социальные эмоции
    if (emotionalAssociations.emotions['love'] != null) {
      score += 15;
    }

    // Семья и отношения
    final familyColor = lifeDomains.domains['family'];
    if (['pink', 'orange', 'red'].contains(familyColor)) score += 15;

    return _normalize(score, 0, 120);
  }

  /// Рассчитать самооценку
  double _calculateSelfEsteem(
    Map<String, int> positions,
    QuickChoiceResult quickChoice,
    TemporalPerspectiveResult temporalPerspective,
  ) {
    double score = 0;

    // Сильные цвета указывают на уверенность
    final redPos = positions['red'] ?? 10;
    final violetPos = positions['violet'] ?? 10;

    score += (11 - redPos) * 7;
    score += (11 - violetPos) * 5;

    // Отвержение слабых цветов
    if (quickChoice.dislikedColors.contains('gray')) score += 15;
    if (quickChoice.dislikedColors.contains('brown')) score += 10;

    // Идеальное Я
    if (['red', 'violet', 'blue'].contains(temporalPerspective.idealSelf)) {
      score += 20;
    }

    // Нет боязни стать слабым
    if (!['gray', 'brown', 'black'].contains(temporalPerspective.fearSelf)) {
      score += 10;
    }

    return _normalize(score, 0, 120);
  }

  /// Рассчитать ориентацию на будущее
  double _calculateFutureOrientation(
    TemporalPerspectiveResult temporalPerspective,
    Map<String, int> pairedWins,
  ) {
    double score = 0;

    // Будущее ярче прошлого
    final futureColors = ['green', 'blue', 'yellow'];
    final pastColors = ['brown', 'gray', 'black'];

    if (futureColors.contains(temporalPerspective.future)) score += 30;
    if (!pastColors.contains(temporalPerspective.future)) score += 10;

    // Различие между настоящим и будущим
    if (temporalPerspective.present != temporalPerspective.future) {
      score += 15;
    }

    // Стабильные цвета в парных сравнениях
    final blueWins = pairedWins['blue'] ?? 0;
    final greenWins = pairedWins['green'] ?? 0;

    score += (blueWins + greenWins) * 2;

    return _normalize(score, 0, 120);
  }

  /// Выявление паттернов на основе всех 6 этапов
  List<String> _detectExtendedPatterns(
    QuickChoiceResult quickChoice,
    ColorRankingResult ranking,
    PairedComparisonResult pairedComparisons,
    EmotionalAssociationResult emotionalAssociations,
    LifeDomainResult lifeDomains,
    TemporalPerspectiveResult temporalPerspective,
    Map<String, double> scores,
  ) {
    final patterns = <String>[];

    // Базовые паттерны
    patterns.addAll(_detectPatterns(quickChoice, ranking, null, scores));

    // Временной оптимизм
    if (temporalPerspective.future != temporalPerspective.past &&
        ['yellow', 'green', 'blue'].contains(temporalPerspective.future)) {
      patterns.add('temporal_optimism');
    }

    // Эмоциональная гармония
    int positiveEmotions = 0;
    for (final emotion in ['joy', 'love', 'calm', 'confidence']) {
      final color = emotionalAssociations.emotions[emotion];
      if (color != null && !['gray', 'black', 'brown'].contains(color)) {
        positiveEmotions++;
      }
    }
    if (positiveEmotions >= 3) patterns.add('emotional_harmony');

    // Жизненная удовлетворённость
    int satisfiedDomains = 0;
    for (final color in lifeDomains.domains.values) {
      if (['green', 'blue', 'yellow'].contains(color)) {
        satisfiedDomains++;
      }
    }
    if (satisfiedDomains >= 4) patterns.add('life_satisfaction');

    return patterns;
  }

  /// Расчет метрик согласованности
  Map<String, double> _calculateConsistencyMetrics(
    QuickChoiceResult quickChoice,
    ColorRankingResult ranking,
    PairedComparisonResult pairedComparisons,
  ) {
    final metrics = <String, double>{};

    // Согласованность между быстрым выбором и ранжированием
    // Проверяем, попали ли "любимые" цвета в топ-3 ранжирования
    int matchedLikes = 0;
    for (final likedColor in quickChoice.likedColors) {
      final rankPos = ranking.rankedColors.indexOf(likedColor) + 1;
      if (rankPos <= 3) matchedLikes++;
    }
    // Возвращаем значение 0.0-1.0 (UI ожидает такой формат)
    metrics['quick_vs_ranking'] = matchedLikes / 3.0;

    // Согласованность парных сравнений с ранжированием
    // Проверяем, выбирал ли пользователь цвет с лучшей позицией в ранжировании
    int consistentWins = 0;
    int totalComparisons = 0;
    for (final comparison in pairedComparisons.comparisons) {
      final pos1 = ranking.rankedColors.indexOf(comparison.color1) + 1;
      final pos2 = ranking.rankedColors.indexOf(comparison.color2) + 1;
      totalComparisons++;
      if ((pos1 < pos2 && comparison.chosen == comparison.color1) ||
          (pos2 < pos1 && comparison.chosen == comparison.color2)) {
        consistentWins++;
      }
    }
    metrics['ranking_vs_paired'] = totalComparisons > 0
        ? consistentWins / totalComparisons.toDouble()
        : 0.0;

    // Общая согласованность (среднее)
    metrics['overall_consistency'] = (metrics['quick_vs_ranking']! + metrics['ranking_vs_paired']!) / 2.0;

    return metrics;
  }
}