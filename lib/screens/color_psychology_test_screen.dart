import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../models/color_psychology_model.dart';
import '../data/color_psychology_data.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../widgets/color_selection_widget.dart';
import '../widgets/color_ranking_widget.dart';
import '../widgets/color_paired_comparisons_widget.dart';
import '../widgets/color_emotional_associations_widget.dart';
import '../widgets/color_life_domains_widget.dart';
import '../widgets/color_temporal_perspective_widget.dart';
import '../services/color_psychology_service.dart';
import 'color_psychology_result_screen.dart';

/// Экран цветового психологического теста (расширенная версия)
///
/// Реализует 6 этапов:
/// 1. Быстрый выбор (30 сек)
/// 2. Ранжирование (60 сек)
/// 3. Парные сравнения (2 мин)
/// 4. Эмоциональные ассоциации
/// 5. Жизненные сферы
/// 6. Временная перспектива
///
/// @author: Color Psychology Research Institute
/// @version: 2.0.0

class ColorPsychologyTestScreen extends StatefulWidget {
  const ColorPsychologyTestScreen({super.key});

  @override
  State<ColorPsychologyTestScreen> createState() => _ColorPsychologyTestScreenState();
}

class _ColorPsychologyTestScreenState extends State<ColorPsychologyTestScreen> {
  // Текущий этап теста
  int _currentStage = 0; // 0 - введение, 1-6 - этапы теста

  // Результаты этапов
  QuickChoiceResult? _quickChoiceResult;
  ColorRankingResult? _rankingResult;
  PairedComparisonResult? _pairedComparisonResult;
  EmotionalAssociationResult? _emotionalAssociationResult;
  LifeDomainResult? _lifeDomainResult;
  TemporalPerspectiveResult? _temporalPerspectiveResult;

  // Таймеры
  Timer? _timer;
  int _secondsRemaining = 0;

  // Сервис для обработки результатов
  late final ColorPsychologyService _service;

  @override
  void initState() {
    super.initState();
    _service = ColorPsychologyService();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Запуск таймера для этапа
  void _startTimer(int seconds) {
    _timer?.cancel();
    if (seconds > 0) {
      setState(() {
        _secondsRemaining = seconds;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _secondsRemaining--;
        });
        if (_secondsRemaining <= 0) {
          timer.cancel();
          _onTimeUp();
        }
      });
    }
  }

  /// Обработка истечения времени
  void _onTimeUp() {
    if (_currentStage == 1 || _currentStage == 2 || _currentStage == 3) {
      // Автоматически завершить этапы с таймером
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              context.read<LocaleProvider>().isRussian
                  ? 'Время истекло! Переход к следующему этапу.'
                  : 'Time is up! Moving to the next stage.',
            ),
          ),
        );
      }
      // Виджеты сами обработают завершение
    }
  }

  /// Переход к следующему этапу
  void _nextStage() {
    _timer?.cancel();
    setState(() {
      _currentStage++;
    });

    // Этапы с таймерами управляют временем самостоятельно
    // Этапы 4-6 без таймеров
    if (_currentStage == 7) {
      // Тест завершен, обработать результаты
      _processResults();
    }
  }

  /// Обработка результатов теста
  void _processResults() {
    final result = _service.calculateResultExtended(
      quickChoice: _quickChoiceResult!,
      ranking: _rankingResult!,
      pairedComparisons: _pairedComparisonResult!,
      emotionalAssociations: _emotionalAssociationResult!,
      lifeDomains: _lifeDomainResult!,
      temporalPerspective: _temporalPerspectiveResult!,
    );

    // Сохранить результат
    _saveResult(result);

    // Перейти к экрану результатов
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ColorPsychologyResultScreen(
          result: result,
        ),
      ),
    );
  }

  /// Сохранение результата
  void _saveResult(ColorPsychologyResult result) {
    // TODO: Implement saving to SharedPreferences
    // This would integrate with existing TestProvider
  }

  /// Обработка результата быстрого выбора
  void _onQuickChoiceComplete(List<String> liked, List<String> disliked) {
    setState(() {
      _quickChoiceResult = QuickChoiceResult(
        likedColors: liked,
        dislikedColors: disliked,
      );
    });
    _nextStage();
  }

  /// Обработка результата ранжирования
  void _onRankingComplete(List<String> rankedColors) {
    setState(() {
      _rankingResult = ColorRankingResult(
        rankedColors: rankedColors,
      );
    });
    _nextStage();
  }

  /// Обработка результата парных сравнений
  void _onPairedComparisonsComplete(PairedComparisonResult result) {
    setState(() {
      _pairedComparisonResult = result;
    });
    _nextStage();
  }

  /// Обработка результата эмоциональных ассоциаций
  void _onEmotionalAssociationsComplete(EmotionalAssociationResult result) {
    setState(() {
      _emotionalAssociationResult = result;
    });
    _nextStage();
  }

  /// Обработка результата жизненных сфер
  void _onLifeDomainsComplete(LifeDomainResult result) {
    setState(() {
      _lifeDomainResult = result;
    });
    _nextStage();
  }

  /// Обработка результата временной перспективы
  void _onTemporalPerspectiveComplete(TemporalPerspectiveResult result) {
    setState(() {
      _temporalPerspectiveResult = result;
    });
    _nextStage();
  }

  @override
  Widget build(BuildContext context) {
    final isRussian = context.watch<LocaleProvider>().isRussian;
    final isDarkMode = context.watch<UserPreferencesProvider>().isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isRussian ? 'Цветовая психология' : 'Color Psychology',
        ),
        actions: [
          if (_secondsRemaining > 0)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  '${_secondsRemaining}s',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _secondsRemaining <= 10 ? Colors.red : null,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _buildBody(context, isRussian),
    );
  }

  Widget _buildBody(BuildContext context, bool isRussian) {
    final locale = isRussian ? 'ru' : 'en';

    switch (_currentStage) {
      case 0:
        return _buildIntroduction(context, isRussian);
      case 1:
        return ColorSelectionWidget(
          colors: ColorPsychologyData.colors,
          onComplete: _onQuickChoiceComplete,
          isRussian: isRussian,
        );
      case 2:
        return ColorRankingWidget(
          colors: ColorPsychologyData.colors,
          onComplete: _onRankingComplete,
          isRussian: isRussian,
        );
      case 3:
        return ColorPairedComparisonsWidget(
          onComplete: _onPairedComparisonsComplete,
          locale: locale,
        );
      case 4:
        return ColorEmotionalAssociationsWidget(
          onComplete: _onEmotionalAssociationsComplete,
          locale: locale,
        );
      case 5:
        return ColorLifeDomainsWidget(
          onComplete: _onLifeDomainsComplete,
          locale: locale,
        );
      case 6:
        return ColorTemporalPerspectiveWidget(
          onComplete: _onTemporalPerspectiveComplete,
          locale: locale,
        );
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }

  Widget _buildIntroduction(BuildContext context, bool isRussian) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isRussian ? 'О тесте' : 'About the Test',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isRussian
                        ? '''Расширенная цветовая психология — это углублённая проективная методика, использующая 6 различных техник работы с цветом для комплексной оценки вашего эмоционального и психологического состояния.

Тест анализирует 34+ взаимодействия с цветом через разные подходы: интуитивный выбор, осознанное ранжирование, парные сравнения, эмоциональные и жизненные ассоциации, временную перспективу.

Результаты включают:
• 12 психологических шкал (энергия, стресс, баланс, оптимизм и др.)
• Метрики согласованности выборов
• Выявление эмоциональных паттернов
• Анализ жизненных приоритетов
• Персонализированные рекомендации'''
                        : '''Extended color psychology is an in-depth projective technique using 6 different color work methods for comprehensive assessment of your emotional and psychological state.

The test analyzes 34+ color interactions through different approaches: intuitive choice, conscious ranking, paired comparisons, emotional and life associations, temporal perspective.

Results include:
• 12 psychological scales (energy, stress, balance, optimism, etc.)
• Choice consistency metrics
• Identification of emotional patterns
• Analysis of life priorities
• Personalized recommendations''',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isRussian ? 'Как проходит тест' : 'How the Test Works',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  _buildStageInfo(
                    context,
                    '1',
                    isRussian ? 'Быстрый выбор' : 'Quick Choice',
                    isRussian
                        ? 'Выберите 3 цвета, которые вам нравятся, и 3, которые не нравятся (30 секунд)'
                        : 'Choose 3 colors you like and 3 you dislike (30 seconds)',
                    Icons.palette,
                  ),
                  const SizedBox(height: 12),
                  _buildStageInfo(
                    context,
                    '2',
                    isRussian ? 'Ранжирование' : 'Ranking',
                    isRussian
                        ? 'Расставьте все цвета от наиболее к наименее приятному (60 секунд)'
                        : 'Rank all colors from most to least pleasant (60 seconds)',
                    Icons.sort,
                  ),
                  const SizedBox(height: 12),
                  _buildStageInfo(
                    context,
                    '3',
                    isRussian ? 'Парные сравнения' : 'Paired Comparisons',
                    isRussian
                        ? 'Выберите предпочитаемый цвет из 20 пар (2 минуты)'
                        : 'Choose preferred color from 20 pairs (2 minutes)',
                    Icons.compare,
                  ),
                  const SizedBox(height: 12),
                  _buildStageInfo(
                    context,
                    '4',
                    isRussian ? 'Эмоции' : 'Emotions',
                    isRussian
                        ? 'Сопоставьте 8 базовых эмоций с цветами'
                        : 'Match 8 basic emotions with colors',
                    Icons.sentiment_satisfied,
                  ),
                  const SizedBox(height: 12),
                  _buildStageInfo(
                    context,
                    '5',
                    isRussian ? 'Жизненные сферы' : 'Life Domains',
                    isRussian
                        ? 'Выберите цвета для 6 сфер жизни и 4 ситуаций'
                        : 'Choose colors for 6 life domains and 4 situations',
                    Icons.account_tree,
                  ),
                  const SizedBox(height: 12),
                  _buildStageInfo(
                    context,
                    '6',
                    isRussian ? 'Временная перспектива' : 'Temporal Perspective',
                    isRussian
                        ? 'Выберите цвета для прошлого, настоящего и будущего'
                        : 'Choose colors for past, present and future',
                    Icons.timeline,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.amber.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.amber),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      isRussian
                          ? 'Важно: Отвечайте интуитивно, не думайте долго. Тест измеряет ваше ТЕКУЩЕЕ состояние.'
                          : 'Important: Answer intuitively, don\'t think too long. The test measures your CURRENT state.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _nextStage,
              icon: const Icon(Icons.play_arrow),
              label: Text(
                isRussian ? 'Начать тест' : 'Start Test',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStageInfo(
    BuildContext context,
    String number,
    String title,
    String description,
    IconData icon,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}