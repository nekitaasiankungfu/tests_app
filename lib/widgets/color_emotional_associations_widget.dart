import 'package:flutter/material.dart';
import '../models/color_psychology_model.dart';
import '../data/color_psychology_data.dart';

/// Виджет для этапа эмоциональных ассоциаций (stage 4)
///
/// Показывает 8 эмоций, пользователь выбирает цвет для каждой.
/// Отслеживается время ответа для анализа импульсивности.
///
/// @author: Color Psychology Research Institute
/// @version: 2.0.0

class ColorEmotionalAssociationsWidget extends StatefulWidget {
  final Function(EmotionalAssociationResult) onComplete;
  final String locale;

  const ColorEmotionalAssociationsWidget({
    Key? key,
    required this.onComplete,
    required this.locale,
  }) : super(key: key);

  @override
  State<ColorEmotionalAssociationsWidget> createState() =>
      _ColorEmotionalAssociationsWidgetState();
}

class _ColorEmotionalAssociationsWidgetState
    extends State<ColorEmotionalAssociationsWidget> {
  final Map<String, String> _emotions = {};
  final Map<String, int> _responseTimesMs = {};

  int _currentEmotionIndex = 0;
  DateTime? _emotionStartTime;

  @override
  void initState() {
    super.initState();
    _startResponseTimer();
  }

  void _startResponseTimer() {
    _emotionStartTime = DateTime.now();
  }

  void _selectColor(String colorId) {
    if (_emotionStartTime == null) return;

    final responseTime = DateTime.now().difference(_emotionStartTime!).inMilliseconds;
    final emotion = ColorPsychologyData.emotionalAssociations[_currentEmotionIndex];

    // Записываем выбор
    _emotions[emotion['id']!] = colorId;
    _responseTimesMs[emotion['id']!] = responseTime;

    // Переходим к следующей эмоции
    setState(() {
      _currentEmotionIndex++;
      if (_currentEmotionIndex >= ColorPsychologyData.emotionalAssociations.length) {
        _completeStage();
      } else {
        _startResponseTimer();
      }
    });
  }

  void _completeStage() {
    widget.onComplete(EmotionalAssociationResult(
      emotions: _emotions,
      responseTimesMs: _responseTimesMs,
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (_currentEmotionIndex >= ColorPsychologyData.emotionalAssociations.length) {
      return const Center(child: CircularProgressIndicator());
    }

    final emotion = ColorPsychologyData.emotionalAssociations[_currentEmotionIndex];
    final emotionText = emotion[widget.locale] ?? emotion['ru']!;

    return Column(
      children: [
        // Заголовок и прогресс
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widget.locale == 'en'
                    ? 'Stage 4: Emotional Associations'
                    : 'Этап 4: Эмоциональные ассоциации',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                widget.locale == 'en'
                    ? 'Choose a color for each emotion'
                    : 'Выберите цвет для каждой эмоции',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              // Прогресс
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_currentEmotionIndex + 1} / ${ColorPsychologyData.emotionalAssociations.length}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: (_currentEmotionIndex + 1) /
                    ColorPsychologyData.emotionalAssociations.length,
                backgroundColor: Colors.grey.withOpacity(0.2),
              ),
            ],
          ),
        ),

        // Текущая эмоция
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Icon(
                  _getEmotionIcon(emotion['id']!),
                  size: 48,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 16),
                Text(
                  emotionText,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.locale == 'en'
                      ? 'Which color represents this emotion?'
                      : 'Какой цвет представляет эту эмоцию?',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),

        // Сетка цветов
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              itemCount: ColorPsychologyData.colors.length,
              itemBuilder: (context, index) {
                final color = ColorPsychologyData.colors[index];
                return GestureDetector(
                  onTap: () => _selectColor(color.id),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(int.parse(color.hex.replaceFirst('#', '0xFF'))),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        color.name[widget.locale] ?? color.name['ru']!,
                        style: TextStyle(
                          color: _getContrastColor(color.hex),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // Подсказка
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.locale == 'en'
                ? 'Answer intuitively, don\'t think too long'
                : 'Отвечайте интуитивно, не задумывайтесь надолго',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  IconData _getEmotionIcon(String emotionId) {
    switch (emotionId) {
      case 'joy':
        return Icons.sentiment_very_satisfied;
      case 'fear':
        return Icons.sentiment_very_dissatisfied;
      case 'anger':
        return Icons.local_fire_department;
      case 'sadness':
        return Icons.sentiment_dissatisfied;
      case 'calm':
        return Icons.self_improvement;
      case 'excitement':
        return Icons.celebration;
      case 'love':
        return Icons.favorite;
      case 'confidence':
        return Icons.thumb_up;
      default:
        return Icons.circle;
    }
  }

  Color _getContrastColor(String hexColor) {
    final color = Color(int.parse(hexColor.replaceFirst('#', '0xFF')));
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
