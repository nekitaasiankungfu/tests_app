import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import '../models/color_psychology_model.dart';
import '../data/color_psychology_data.dart';

/// Виджет для этапа парных сравнений цветов (stage 3)
///
/// Показывает 20 пар цветов из 45 возможных комбинаций.
/// Пользователь выбирает предпочитаемый цвет из каждой пары.
/// Отслеживается время реакции для каждого выбора.
///
/// @author: Color Psychology Research Institute
/// @version: 2.0.0

class ColorPairedComparisonsWidget extends StatefulWidget {
  final Function(PairedComparisonResult) onComplete;
  final String locale;

  const ColorPairedComparisonsWidget({
    Key? key,
    required this.onComplete,
    required this.locale,
  }) : super(key: key);

  @override
  State<ColorPairedComparisonsWidget> createState() =>
      _ColorPairedComparisonsWidgetState();
}

class _ColorPairedComparisonsWidgetState
    extends State<ColorPairedComparisonsWidget> {
  final List<PairedComparison> _comparisons = [];
  final Map<String, int> _wins = {};
  final List<List<String>> _pairsToShow = [];

  int _currentPairIndex = 0;
  int _secondsRemaining = ColorPsychologyTestConfig.stage3TimeLimit;
  Timer? _timer;
  Timer? _responseTimer;
  DateTime? _pairStartTime;

  @override
  void initState() {
    super.initState();
    _initializePairs();
    _initializeWins();
    _startTimer();
    _startResponseTimer();
  }

  void _initializePairs() {
    // Генерируем все возможные пары (45 комбинаций из 10 цветов)
    final List<List<String>> allPairs = [];
    final colors = ColorPsychologyData.colors.map((c) => c.id).toList();

    for (int i = 0; i < colors.length - 1; i++) {
      for (int j = i + 1; j < colors.length; j++) {
        allPairs.add([colors[i], colors[j]]);
      }
    }

    // Перемешиваем и выбираем 20 пар
    final random = Random();
    allPairs.shuffle(random);
    _pairsToShow.addAll(allPairs.take(ColorPsychologyTestConfig.pairedComparisonsCount));
  }

  void _initializeWins() {
    for (final color in ColorPsychologyData.colors) {
      _wins[color.id] = 0;
    }
  }

  void _startTimer() {
    if (_secondsRemaining > 0) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _secondsRemaining--;
          if (_secondsRemaining == 0) {
            _completeStage();
          }
        });
      });
    }
  }

  void _startResponseTimer() {
    _pairStartTime = DateTime.now();
  }

  void _selectColor(String colorId) {
    if (_pairStartTime == null) return;

    final responseTime = DateTime.now().difference(_pairStartTime!).inMilliseconds;
    final pair = _pairsToShow[_currentPairIndex];

    // Записываем выбор
    _comparisons.add(PairedComparison(
      color1: pair[0],
      color2: pair[1],
      chosen: colorId,
      responseTimeMs: responseTime,
    ));

    // Увеличиваем счетчик побед
    _wins[colorId] = (_wins[colorId] ?? 0) + 1;

    // Переходим к следующей паре
    setState(() {
      _currentPairIndex++;
      if (_currentPairIndex >= _pairsToShow.length || _secondsRemaining <= 0) {
        _completeStage();
      } else {
        _startResponseTimer();
      }
    });
  }

  void _completeStage() {
    _timer?.cancel();
    _responseTimer?.cancel();

    widget.onComplete(PairedComparisonResult(
      comparisons: _comparisons,
      wins: _wins,
    ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _responseTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPairIndex >= _pairsToShow.length) {
      return const Center(child: CircularProgressIndicator());
    }

    final pair = _pairsToShow[_currentPairIndex];
    final color1 = ColorPsychologyData.getColorById(pair[0])!;
    final color2 = ColorPsychologyData.getColorById(pair[1])!;

    return Column(
      children: [
        // Заголовок и прогресс
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widget.locale == 'en'
                    ? 'Stage 3: Paired Comparisons'
                    : 'Этап 3: Парные сравнения',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                widget.locale == 'en'
                    ? 'Choose the color you prefer right now'
                    : 'Выберите цвет, который вам больше нравится сейчас',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              // Прогресс
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_currentPairIndex + 1} / ${_pairsToShow.length}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 20),
                  // Таймер
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _secondsRemaining <= 10
                          ? Colors.red.withOpacity(0.1)
                          : Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 16,
                          color: _secondsRemaining <= 10 ? Colors.red : Colors.blue,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${_secondsRemaining ~/ 60}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}',
                          style: TextStyle(
                            color: _secondsRemaining <= 10 ? Colors.red : Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Прогресс-бар
              LinearProgressIndicator(
                value: (_currentPairIndex + 1) / _pairsToShow.length,
                backgroundColor: Colors.grey.withOpacity(0.2),
              ),
            ],
          ),
        ),

        // Цвета для сравнения
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Левый цвет
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectColor(color1.id),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(int.parse(color1.hex.replaceFirst('#', '0xFF'))),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          color1.name[widget.locale] ?? color1.name['ru']!,
                          style: TextStyle(
                            color: _getContrastColor(color1.hex),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // VS разделитель
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'VS',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),

                // Правый цвет
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectColor(color2.id),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(int.parse(color2.hex.replaceFirst('#', '0xFF'))),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          color2.name[widget.locale] ?? color2.name['ru']!,
                          style: TextStyle(
                            color: _getContrastColor(color2.hex),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Подсказка
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.locale == 'en'
                ? 'Tap the color you prefer'
                : 'Нажмите на цвет, который предпочитаете',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Color _getContrastColor(String hexColor) {
    final color = Color(int.parse(hexColor.replaceFirst('#', '0xFF')));
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}