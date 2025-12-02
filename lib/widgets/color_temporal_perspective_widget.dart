import 'package:flutter/material.dart';
import '../models/color_psychology_model.dart';
import '../data/color_psychology_data.dart';

/// Виджет для этапа временной перспективы (stage 6)
///
/// Показывает 5 временных аспектов: прошлое, настоящее, будущее,
/// идеальное "Я" и то, чем боитесь стать.
/// Пользователь выбирает цвет для каждого аспекта.
///
/// @author: Color Psychology Research Institute
/// @version: 2.0.0

class ColorTemporalPerspectiveWidget extends StatefulWidget {
  final Function(TemporalPerspectiveResult) onComplete;
  final VoidCallback? onBack; // Callback to go back to previous stage
  final String locale;

  const ColorTemporalPerspectiveWidget({
    Key? key,
    required this.onComplete,
    this.onBack,
    required this.locale,
  }) : super(key: key);

  @override
  State<ColorTemporalPerspectiveWidget> createState() =>
      _ColorTemporalPerspectiveWidgetState();
}

class _ColorTemporalPerspectiveWidgetState
    extends State<ColorTemporalPerspectiveWidget> {
  final Map<String, String> _selections = {};
  int _currentQuestionIndex = 0;

  void _selectColor(String colorId) {
    final perspective = ColorPsychologyData.temporalPerspectives[_currentQuestionIndex];
    final perspectiveId = perspective['id']!;

    // Записываем выбор
    _selections[perspectiveId] = colorId;

    // Переходим к следующему вопросу
    setState(() {
      _currentQuestionIndex++;
      if (_currentQuestionIndex >= ColorPsychologyData.temporalPerspectives.length) {
        _completeStage();
      }
    });
  }

  void _goBack() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        // Удаляем предыдущий ответ
        final perspective =
            ColorPsychologyData.temporalPerspectives[_currentQuestionIndex];
        _selections.remove(perspective['id']);
      });
    }
  }

  void _completeStage() {
    widget.onComplete(TemporalPerspectiveResult(
      past: _selections['past'] ?? '',
      present: _selections['present'] ?? '',
      future: _selections['future'] ?? '',
      idealSelf: _selections['ideal_self'] ?? '',
      fearSelf: _selections['fear_self'] ?? '',
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= ColorPsychologyData.temporalPerspectives.length) {
      return const Center(child: CircularProgressIndicator());
    }

    final perspective = ColorPsychologyData.temporalPerspectives[_currentQuestionIndex];
    final perspectiveText = perspective[widget.locale] ?? perspective['ru']!;
    final perspectiveId = perspective['id']!;

    return Column(
      children: [
        // Заголовок и прогресс
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widget.locale == 'en'
                    ? 'Stage 6: Temporal Perspective'
                    : 'Этап 6: Временная перспектива',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                widget.locale == 'en'
                    ? 'Choose colors for different time periods'
                    : 'Выберите цвета для разных временных периодов',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              // Кнопка назад (всегда видна)
              if (_currentQuestionIndex > 0 || widget.onBack != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: OutlinedButton.icon(
                    onPressed: _currentQuestionIndex > 0 ? _goBack : widget.onBack,
                    icon: const Icon(Icons.arrow_back, size: 18),
                    label: Text(
                      _currentQuestionIndex > 0
                          ? (widget.locale == 'en' ? 'Previous question' : 'Предыдущий вопрос')
                          : (widget.locale == 'en' ? 'Previous stage' : 'Предыдущий этап'),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
              // Прогресс и индикатор времени
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_currentQuestionIndex + 1} / ${ColorPsychologyData.temporalPerspectives.length}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 20),
                  // Индикатор "без таймера"
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.all_inclusive,
                          size: 16,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.locale == 'en' ? 'No limit' : 'Без лимита',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: (_currentQuestionIndex + 1) /
                    ColorPsychologyData.temporalPerspectives.length,
                backgroundColor: Colors.grey.withOpacity(0.2),
              ),
            ],
          ),
        ),

        // Текущий вопрос
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _getPerspectiveColor(perspectiveId).withOpacity(0.2),
                  _getPerspectiveColor(perspectiveId).withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _getPerspectiveColor(perspectiveId).withOpacity(0.4),
                width: 3,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  _getPerspectiveIcon(perspectiveId),
                  size: 64,
                  color: _getPerspectiveColor(perspectiveId),
                ),
                const SizedBox(height: 20),
                Text(
                  perspectiveText,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _getPerspectiveColor(perspectiveId),
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  _getPerspectiveHint(perspectiveId),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
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
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.amber[700], size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.locale == 'en'
                        ? 'Final stage! Answer honestly and intuitively'
                        : 'Финальный этап! Отвечайте честно и интуитивно',
                    style: TextStyle(
                      color: Colors.amber[900],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  IconData _getPerspectiveIcon(String perspectiveId) {
    switch (perspectiveId) {
      case 'past':
        return Icons.history;
      case 'present':
        return Icons.today;
      case 'future':
        return Icons.trending_up;
      case 'ideal_self':
        return Icons.star;
      case 'fear_self':
        return Icons.warning_amber;
      default:
        return Icons.circle;
    }
  }

  Color _getPerspectiveColor(String perspectiveId) {
    switch (perspectiveId) {
      case 'past':
        return Colors.grey;
      case 'present':
        return Colors.blue;
      case 'future':
        return Colors.green;
      case 'ideal_self':
        return Colors.amber;
      case 'fear_self':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getPerspectiveHint(String perspectiveId) {
    switch (perspectiveId) {
      case 'past':
        return widget.locale == 'en'
            ? 'How do you see your past?'
            : 'Как вы видите своё прошлое?';
      case 'present':
        return widget.locale == 'en'
            ? 'How do you feel right now?'
            : 'Как вы себя чувствуете сейчас?';
      case 'future':
        return widget.locale == 'en'
            ? 'How do you see your future?'
            : 'Как вы видите своё будущее?';
      case 'ideal_self':
        return widget.locale == 'en'
            ? 'Who do you want to become?'
            : 'Кем вы хотите стать?';
      case 'fear_self':
        return widget.locale == 'en'
            ? 'What do you fear becoming?'
            : 'Чем вы боитесь стать?';
      default:
        return '';
    }
  }

  Color _getContrastColor(String hexColor) {
    final color = Color(int.parse(hexColor.replaceFirst('#', '0xFF')));
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
