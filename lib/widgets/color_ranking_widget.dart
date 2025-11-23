import 'package:flutter/material.dart';
import '../models/color_psychology_model.dart';

/// Виджет второго этапа - ранжирование цветов
///
/// Позволяет расставить все 10 цветов в порядке предпочтения
/// с помощью drag-and-drop
/// Ограничение по времени: 60 секунд
///
/// @author: Color Psychology Research Institute
/// @version: 1.0.0

class ColorRankingWidget extends StatefulWidget {
  final List<ColorInfo> colors;
  final Function(List<String>) onComplete;
  final bool isRussian;

  const ColorRankingWidget({
    super.key,
    required this.colors,
    required this.onComplete,
    required this.isRussian,
  });

  @override
  State<ColorRankingWidget> createState() => _ColorRankingWidgetState();
}

class _ColorRankingWidgetState extends State<ColorRankingWidget> {
  late List<ColorInfo> _rankedColors;
  int? _draggedIndex;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Начальный порядок - копия исходного списка
    _rankedColors = List.from(widget.colors);
    // Можно перемешать для случайного порядка
    _rankedColors.shuffle();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _complete() {
    widget.onComplete(_rankedColors.map((c) => c.id).toList());
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final ColorInfo item = _rankedColors.removeAt(oldIndex);
      _rankedColors.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Инструкция
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isRussian
                        ? 'Расставьте цвета по порядку'
                        : 'Rank the colors',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.arrow_upward, color: Colors.green),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.isRussian
                              ? 'Наверху - цвета, которые вам нравятся больше всего'
                              : 'At the top - colors you like the most',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.arrow_downward, color: Colors.red),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.isRussian
                              ? 'Внизу - цвета, которые вам нравятся меньше всего'
                              : 'At the bottom - colors you like the least',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.touch_app, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.isRussian
                              ? 'Удерживайте и перетаскивайте цвета для изменения порядка'
                              : 'Hold and drag colors to change order',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Список для ранжирования
        Expanded(
          child: ReorderableListView.builder(
            scrollController: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: _rankedColors.length,
            onReorder: _onReorder,
            proxyDecorator: (Widget child, int index, Animation<double> animation) {
              return AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget? child) {
                  return Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(12),
                    shadowColor: Colors.black.withOpacity(0.3),
                    child: child,
                  );
                },
                child: child,
              );
            },
            itemBuilder: (context, index) {
              final color = _rankedColors[index];
              return _buildColorTile(color, index);
            },
          ),
        ),

        // Кнопка продолжения
        Container(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _complete,
              child: Text(
                widget.isRussian ? 'Продолжить' : 'Continue',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColorTile(ColorInfo color, int index) {
    final position = index + 1;
    final isTop = index < 3;
    final isBottom = index >= 7;

    return Container(
      key: ValueKey(color.id),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: _draggedIndex == index ? 8 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isTop
                ? Colors.green.withOpacity(0.5)
                : isBottom
                    ? Colors.red.withOpacity(0.5)
                    : Colors.transparent,
            width: 2,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Позиция
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isTop
                      ? Colors.green.withOpacity(0.1)
                      : isBottom
                          ? Colors.red.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.1),
                  border: Border.all(
                    color: isTop
                        ? Colors.green
                        : isBottom
                            ? Colors.red
                            : Colors.grey,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$position',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isTop
                          ? Colors.green
                          : isBottom
                              ? Colors.red
                              : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Цветной квадрат
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(int.parse(color.hex.replaceFirst('#', '0xFF'))),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            color.name[widget.isRussian ? 'ru' : 'en']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            color.psychologicalMeaning[widget.isRussian ? 'ru' : 'en']!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Icon(
            Icons.drag_handle,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}