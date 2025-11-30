import 'package:flutter/material.dart';
import '../models/color_psychology_model.dart';
import '../data/color_psychology_data.dart';

/// Виджет для этапа жизненных сфер (stage 5)
///
/// Показывает 6 сфер жизни и 4 ситуации.
/// Пользователь выбирает цвет для каждой сферы/ситуации.
///
/// @author: Color Psychology Research Institute
/// @version: 2.0.0

class ColorLifeDomainsWidget extends StatefulWidget {
  final Function(LifeDomainResult) onComplete;
  final VoidCallback? onBack; // Callback to go back to previous stage
  final String locale;

  const ColorLifeDomainsWidget({
    Key? key,
    required this.onComplete,
    this.onBack,
    required this.locale,
  }) : super(key: key);

  @override
  State<ColorLifeDomainsWidget> createState() => _ColorLifeDomainsWidgetState();
}

class _ColorLifeDomainsWidgetState extends State<ColorLifeDomainsWidget> {
  final Map<String, String> _domains = {};
  final Map<String, String> _situations = {};

  int _currentQuestionIndex = 0;

  void _selectColor(String colorId) {
    final question = ColorPsychologyData.lifeDomainQuestions[_currentQuestionIndex];
    final questionId = question['id'] as String;
    final questionType = question['type'] as String;

    // Записываем выбор
    if (questionType == 'domain') {
      _domains[questionId] = colorId;
    } else {
      _situations[questionId] = colorId;
    }

    // Переходим к следующему вопросу
    setState(() {
      _currentQuestionIndex++;
      if (_currentQuestionIndex >= ColorPsychologyData.lifeDomainQuestions.length) {
        _completeStage();
      }
    });
  }

  void _goBack() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        // Удаляем предыдущий ответ
        final question = ColorPsychologyData.lifeDomainQuestions[_currentQuestionIndex];
        final questionId = question['id'] as String;
        final questionType = question['type'] as String;
        if (questionType == 'domain') {
          _domains.remove(questionId);
        } else {
          _situations.remove(questionId);
        }
      });
    }
  }

  void _completeStage() {
    widget.onComplete(LifeDomainResult(
      domains: _domains,
      situations: _situations,
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= ColorPsychologyData.lifeDomainQuestions.length) {
      return const Center(child: CircularProgressIndicator());
    }

    final question = ColorPsychologyData.lifeDomainQuestions[_currentQuestionIndex];
    final questionText = question[widget.locale] as String? ?? question['ru'] as String;
    final questionType = question['type'] as String;

    return Column(
      children: [
        // Заголовок и прогресс
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widget.locale == 'en'
                    ? 'Stage 5: Life Domains'
                    : 'Этап 5: Жизненные сферы',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                widget.locale == 'en'
                    ? 'Choose a color for each life domain'
                    : 'Выберите цвет для каждой сферы жизни',
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
                    '${_currentQuestionIndex + 1} / ${ColorPsychologyData.lifeDomainQuestions.length}',
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
                    ColorPsychologyData.lifeDomainQuestions.length,
                backgroundColor: Colors.grey.withOpacity(0.2),
              ),
            ],
          ),
        ),

        // Текущий вопрос
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.1),
                  Theme.of(context).primaryColor.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  _getQuestionIcon(question['id'] as String, questionType),
                  size: 48,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 16),
                Text(
                  questionText,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: questionType == 'domain'
                        ? Colors.blue.withOpacity(0.1)
                        : Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    questionType == 'domain'
                        ? (widget.locale == 'en' ? 'Life Domain' : 'Сфера жизни')
                        : (widget.locale == 'en' ? 'Situation' : 'Ситуация'),
                    style: TextStyle(
                      fontSize: 12,
                      color: questionType == 'domain' ? Colors.blue : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                ? 'Choose the color that best represents this area'
                : 'Выберите цвет, который лучше всего представляет эту область',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  IconData _getQuestionIcon(String questionId, String questionType) {
    if (questionType == 'domain') {
      switch (questionId) {
        case 'family':
          return Icons.family_restroom;
        case 'career':
          return Icons.work;
        case 'health':
          return Icons.favorite;
        case 'leisure':
          return Icons.sports_esports;
        case 'personal_growth':
          return Icons.school;
        case 'finances':
          return Icons.account_balance_wallet;
        default:
          return Icons.circle;
      }
    } else {
      switch (questionId) {
        case 'success':
          return Icons.emoji_events;
        case 'conflict':
          return Icons.warning;
        case 'rest':
          return Icons.bed;
        case 'decision':
          return Icons.lightbulb;
        default:
          return Icons.circle;
      }
    }
  }

  Color _getContrastColor(String hexColor) {
    final color = Color(int.parse(hexColor.replaceFirst('#', '0xFF')));
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
