import 'package:flutter/material.dart';
import '../models/career_compass_model.dart';

/// Виджет для отображения вопроса forced_choice в тесте "Карьерный компас"
///
/// Показывает два варианта ответа, из которых нужно выбрать один.
/// Анимация при нажатии и визуальная обратная связь.
///
/// @version: 1.0.0

class CareerCompassQuestionWidget extends StatefulWidget {
  final ForcedChoiceQuestion question;
  final int questionNumber;
  final int totalQuestions;
  final Function(String scaleId, int responseTimeMs) onAnswer;
  final bool isRussian;

  const CareerCompassQuestionWidget({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
    required this.onAnswer,
    required this.isRussian,
  });

  @override
  State<CareerCompassQuestionWidget> createState() => _CareerCompassQuestionWidgetState();
}

class _CareerCompassQuestionWidgetState extends State<CareerCompassQuestionWidget>
    with SingleTickerProviderStateMixin {
  DateTime? _questionStartTime;
  String? _selectedOption;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _questionStartTime = DateTime.now();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  void didUpdateWidget(CareerCompassQuestionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question.id != widget.question.id) {
      _questionStartTime = DateTime.now();
      _selectedOption = null;
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleOptionSelected(String scaleId) {
    if (_selectedOption != null) return; // Prevent double-tap

    setState(() {
      _selectedOption = scaleId;
    });

    final responseTime = DateTime.now().difference(_questionStartTime!).inMilliseconds;

    // Short delay for visual feedback
    Future.delayed(const Duration(milliseconds: 200), () {
      widget.onAnswer(scaleId, responseTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress indicator
            _buildProgressHeader(context),
            const SizedBox(height: 24),

            // Question instruction
            Text(
              widget.question.instruction[widget.isRussian ? 'ru' : 'en'] ?? 'Что вам ближе?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Hint
            Text(
              widget.isRussian
                  ? 'Выберите вариант, который вам ближе'
                  : 'Choose the option that is closer to you',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Options
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Option A
                  _buildOptionCard(
                    context,
                    option: widget.question.optionA,
                    label: 'A',
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 16),

                  // VS divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey[300])),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'VS',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey[300])),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Option B
                  _buildOptionCard(
                    context,
                    option: widget.question.optionB,
                    label: 'B',
                    color: Colors.orange,
                  ),
                ],
              ),
            ),

            // Bottom hint
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                widget.isRussian
                    ? 'Даже если оба варианта нравятся или не нравятся — выберите тот, который всё же ближе'
                    : 'Even if you like or dislike both options — choose the one that is still closer',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[500],
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressHeader(BuildContext context) {
    final progress = widget.questionNumber / widget.totalQuestions;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.isRussian
                  ? 'Вопрос ${widget.questionNumber} из ${widget.totalQuestions}'
                  : 'Question ${widget.questionNumber} of ${widget.totalQuestions}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCard(
    BuildContext context, {
    required ForcedChoiceOption option,
    required String label,
    required Color color,
  }) {
    final isSelected = _selectedOption == option.scaleId;
    final isOtherSelected = _selectedOption != null && !isSelected;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Material(
        elevation: isSelected ? 8 : 2,
        borderRadius: BorderRadius.circular(16),
        color: isSelected
            ? color.withOpacity(0.15)
            : isOtherSelected
                ? Colors.grey[100]
                : Colors.white,
        child: InkWell(
          onTap: _selectedOption == null ? () => _handleOptionSelected(option.scaleId) : null,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? color : Colors.grey[300]!,
                width: isSelected ? 3 : 1,
              ),
            ),
            child: Row(
              children: [
                // Label circle
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? color : color.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : color,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Option text
                Expanded(
                  child: Text(
                    option.text,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isOtherSelected ? Colors.grey : Colors.black87,
                    ),
                  ),
                ),

                // Check icon when selected
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: color,
                    size: 28,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
