import 'package:flutter/material.dart';
import '../models/color_psychology_model.dart';

/// Виджет первого этапа - быстрый выбор цветов
///
/// Позволяет выбрать 3 любимых и 3 нелюбимых цвета
/// Ограничение по времени: 30 секунд
///
/// @author: Color Psychology Research Institute
/// @version: 1.0.0

class ColorSelectionWidget extends StatefulWidget {
  final List<ColorInfo> colors;
  final Function(List<String>, List<String>) onComplete;
  final VoidCallback? onBack; // Callback to go back to previous stage
  final bool isRussian;

  const ColorSelectionWidget({
    super.key,
    required this.colors,
    required this.onComplete,
    this.onBack,
    required this.isRussian,
  });

  @override
  State<ColorSelectionWidget> createState() => _ColorSelectionWidgetState();
}

class _ColorSelectionWidgetState extends State<ColorSelectionWidget> {
  final Set<String> _likedColors = {};
  final Set<String> _dislikedColors = {};

  // Режим выбора: true - выбираем любимые, false - нелюбимые
  bool _selectingLiked = true;

  void _onColorTap(String colorId) {
    setState(() {
      if (_selectingLiked) {
        // Выбираем любимые цвета
        if (_likedColors.contains(colorId)) {
          _likedColors.remove(colorId);
        } else if (_likedColors.length < ColorPsychologyTestConfig.quickChoiceLikedCount) {
          // Убрать из нелюбимых если там есть
          _dislikedColors.remove(colorId);
          _likedColors.add(colorId);
        }
      } else {
        // Выбираем нелюбимые цвета
        if (_dislikedColors.contains(colorId)) {
          _dislikedColors.remove(colorId);
        } else if (_dislikedColors.length < ColorPsychologyTestConfig.quickChoiceDislikedCount) {
          // Убрать из любимых если там есть
          _likedColors.remove(colorId);
          _dislikedColors.add(colorId);
        }
      }

      // Автоматически переключить режим если выбрано достаточно
      if (_selectingLiked &&
          _likedColors.length == ColorPsychologyTestConfig.quickChoiceLikedCount) {
        _selectingLiked = false;
      }
    });
  }

  bool _canComplete() {
    return _likedColors.length == ColorPsychologyTestConfig.quickChoiceLikedCount &&
           _dislikedColors.length == ColorPsychologyTestConfig.quickChoiceDislikedCount;
  }

  void _complete() {
    if (_canComplete()) {
      widget.onComplete(_likedColors.toList(), _dislikedColors.toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Инструкция
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isRussian
                        ? (_selectingLiked
                            ? 'Выберите 3 цвета, которые вам НРАВЯТСЯ'
                            : 'Выберите 3 цвета, которые вам НЕ НРАВЯТСЯ')
                        : (_selectingLiked
                            ? 'Choose 3 colors you LIKE'
                            : 'Choose 3 colors you DISLIKE'),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.isRussian
                        ? 'Выбирайте интуитивно, не думайте долго'
                        : 'Choose intuitively, don\'t think too long',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Прогресс
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildProgress(
                context,
                widget.isRussian ? 'Нравятся' : 'Like',
                _likedColors.length,
                ColorPsychologyTestConfig.quickChoiceLikedCount,
                Colors.green,
                _selectingLiked,
              ),
              _buildProgress(
                context,
                widget.isRussian ? 'Не нравятся' : 'Dislike',
                _dislikedColors.length,
                ColorPsychologyTestConfig.quickChoiceDislikedCount,
                Colors.red,
                !_selectingLiked,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Сетка цветов
          Center(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: widget.colors.map((color) {
                return _buildColorCard(color);
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Кнопки переключения режима
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _likedColors.length < ColorPsychologyTestConfig.quickChoiceLikedCount
                      ? () {
                          setState(() {
                            _selectingLiked = true;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.favorite),
                  label: Text(widget.isRussian ? 'Выбрать любимые' : 'Select Liked'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    side: BorderSide(
                      color: _selectingLiked ? Colors.green : Colors.grey,
                      width: _selectingLiked ? 2 : 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _dislikedColors.length < ColorPsychologyTestConfig.quickChoiceDislikedCount
                      ? () {
                          setState(() {
                            _selectingLiked = false;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.heart_broken),
                  label: Text(widget.isRussian ? 'Выбрать нелюбимые' : 'Select Disliked'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: BorderSide(
                      color: !_selectingLiked ? Colors.red : Colors.grey,
                      width: !_selectingLiked ? 2 : 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Кнопки навигации
          Row(
            children: [
              // Back button (only if callback is provided)
              if (widget.onBack != null)
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: OutlinedButton.icon(
                      onPressed: widget.onBack,
                      icon: const Icon(Icons.arrow_back),
                      label: Text(
                        widget.isRussian ? 'Назад' : 'Back',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              if (widget.onBack != null) const SizedBox(width: 16),
              // Continue button
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _canComplete() ? _complete : null,
                    child: Text(
                      widget.isRussian ? 'Продолжить' : 'Continue',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgress(
    BuildContext context,
    String label,
    int current,
    int total,
    Color color,
    bool isActive,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? color : null,
              ),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(total, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index < current ? color : Colors.grey.withOpacity(0.3),
                  border: Border.all(
                    color: isActive ? color : Colors.grey,
                    width: isActive ? 2 : 1,
                  ),
                ),
                child: index < current
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : null,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildColorCard(ColorInfo color) {
    final isLiked = _likedColors.contains(color.id);
    final isDisliked = _dislikedColors.contains(color.id);
    final isSelected = isLiked || isDisliked;

    return GestureDetector(
      onTap: () => _onColorTap(color.id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 100,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isLiked
                ? Colors.green
                : isDisliked
                    ? Colors.red
                    : Colors.grey.withOpacity(0.3),
            width: isSelected ? 3 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: (isLiked ? Colors.green : Colors.red).withOpacity(0.3),
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
              height: 80,
              decoration: BoxDecoration(
                color: Color(int.parse(color.hex.replaceFirst('#', '0xFF'))),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(11),
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        child: Icon(
                          isLiked ? Icons.favorite : Icons.heart_broken,
                          color: isLiked ? Colors.green : Colors.red,
                          size: 24,
                        ),
                      ),
                    )
                  : null,
            ),
            // Название цвета
            Container(
              height: 48,
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
}