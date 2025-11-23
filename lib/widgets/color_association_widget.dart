import 'package:flutter/material.dart';
import '../models/color_psychology_model.dart';

/// Виджет третьего этапа - цветовые ассоциации
///
/// Позволяет сопоставить цвета с различными аспектами жизни
/// Без ограничения по времени
///
/// @author: Color Psychology Research Institute
/// @version: 1.0.0

class ColorAssociationWidget extends StatefulWidget {
  final List<ColorInfo> colors;
  final List<AssociationQuestion> questions;
  final Function(Map<String, String>) onComplete;
  final bool isRussian;

  const ColorAssociationWidget({
    super.key,
    required this.colors,
    required this.questions,
    required this.onComplete,
    required this.isRussian,
  });

  @override
  State<ColorAssociationWidget> createState() => _ColorAssociationWidgetState();
}

class _ColorAssociationWidgetState extends State<ColorAssociationWidget> {
  final Map<String, String> _associations = {}; // questionId -> colorId
  int _currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _selectColor(String colorId) {
    final question = widget.questions[_currentQuestionIndex];
    setState(() {
      _associations[question.id] = colorId;
    });

    // Автоматически перейти к следующему вопросу
    Future.delayed(const Duration(milliseconds: 300), () {
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      // Все вопросы отвечены
      if (_associations.length == widget.questions.length) {
        widget.onComplete(_associations);
      }
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  bool _canComplete() {
    return _associations.length == widget.questions.length;
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_currentQuestionIndex];
    final selectedColorId = _associations[question.id];

    return Column(
      children: [
        // Прогресс
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Индикатор прогресса
              LinearProgressIndicator(
                value: (_currentQuestionIndex + 1) / widget.questions.length,
                minHeight: 8,
                backgroundColor: Colors.grey.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.isRussian
                    ? 'Вопрос ${_currentQuestionIndex + 1} из ${widget.questions.length}'
                    : 'Question ${_currentQuestionIndex + 1} of ${widget.questions.length}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),

        // Вопрос
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Icon(
                    _getQuestionIcon(question.category),
                    size: 48,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    question.text[widget.isRussian ? 'ru' : 'en']!,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.isRussian
                        ? 'Выберите цвет, который лучше всего описывает это'
                        : 'Choose the color that best describes this',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Сетка цветов
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: widget.colors.map((color) {
                  return _buildColorOption(color, selectedColorId == color.id);
                }).toList(),
              ),
            ),
          ),
        ),

        // Навигация
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Кнопка назад
              IconButton(
                onPressed: _currentQuestionIndex > 0 ? _previousQuestion : null,
                icon: const Icon(Icons.arrow_back),
                iconSize: 32,
              ),
              const SizedBox(width: 16),
              // Индикаторы вопросов
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.questions.length, (index) {
                    final isAnswered = _associations.containsKey(widget.questions[index].id);
                    final isCurrent = index == _currentQuestionIndex;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentQuestionIndex = index;
                          });
                        },
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCurrent
                                ? Theme.of(context).primaryColor
                                : isAnswered
                                    ? Theme.of(context).primaryColor.withOpacity(0.3)
                                    : Colors.grey.withOpacity(0.3),
                            border: Border.all(
                              color: isCurrent
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(width: 16),
              // Кнопка вперед/завершить
              if (_currentQuestionIndex < widget.questions.length - 1)
                IconButton(
                  onPressed: selectedColorId != null ? _nextQuestion : null,
                  icon: const Icon(Icons.arrow_forward),
                  iconSize: 32,
                )
              else
                ElevatedButton(
                  onPressed: _canComplete() ? () => widget.onComplete(_associations) : null,
                  child: Text(widget.isRussian ? 'Завершить' : 'Complete'),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorOption(ColorInfo color, bool isSelected) {
    return GestureDetector(
      onTap: () => _selectColor(color.id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 90,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(0.3),
            width: isSelected ? 3 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            // Цветной квадрат
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color(int.parse(color.hex.replaceFirst('#', '0xFF'))),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(11),
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                      ),
                    )
                  : null,
            ),
            // Название цвета
            Container(
              height: 38,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(11),
                ),
              ),
              child: Center(
                child: Text(
                  color.name[widget.isRussian ? 'ru' : 'en']!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getQuestionIcon(String category) {
    switch (category) {
      case 'mood':
        return Icons.mood;
      case 'work':
        return Icons.work;
      case 'relationships':
        return Icons.favorite;
      case 'need':
        return Icons.star;
      case 'stress':
        return Icons.warning;
      default:
        return Icons.help;
    }
  }
}