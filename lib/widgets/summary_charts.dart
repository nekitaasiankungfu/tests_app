import 'package:flutter/material.dart';
import 'dart:math';
import '../config/summary_config.dart';
import '../providers/summary_provider.dart';

/// Радар-диаграмма (паутина) для отображения баллов по шкалам
class RadarChart extends StatelessWidget {
  final List<AxisScoreData> axisScores;
  final double size;

  const RadarChart({
    super.key,
    required this.axisScores,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: RadarChartPainter(axisScores: axisScores),
      ),
    );
  }
}

class RadarChartPainter extends CustomPainter {
  final List<AxisScoreData> axisScores;

  RadarChartPainter({required this.axisScores});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 20;

    // Нарисовать концентрические круги (уровни)
    _drawGrid(canvas, center, radius);

    // Нарисовать оси
    _drawAxes(canvas, center, radius);

    // Нарисовать данные пользователя
    _drawDataShape(canvas, center, radius);

    // Нарисовать точки данных
    _drawDataPoints(canvas, center, radius);
  }

  void _drawGrid(Canvas canvas, Offset center, double radius) {
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // 3 уровня сетки (25%, 50%, 75%)
    for (int i = 1; i <= 3; i++) {
      final levelRadius = radius * (i / 3);
      canvas.drawCircle(center, levelRadius, gridPaint);
    }
  }

  void _drawAxes(Canvas canvas, Offset center, double radius) {
    final axisPaint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final axes = SummaryConfig.axes.values.toList();
    final angleStep = 2 * pi / axes.length;

    for (int i = 0; i < axes.length; i++) {
      final angle = -pi / 2 + i * angleStep; // Начать с верхней оси
      final endPoint = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      canvas.drawLine(center, endPoint, axisPaint);
    }
  }


  void _drawDataShape(Canvas canvas, Offset center, double radius) {
    if (axisScores.isEmpty) return;

    final shapePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue.withOpacity(0.2);

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 2;

    final axes = SummaryConfig.axes.values.toList();
    final angleStep = 2 * pi / axes.length;

    final path = Path();
    bool firstPoint = true;

    for (int i = 0; i < axes.length; i++) {
      final axis = axes[i];
      final score = axisScores.firstWhere(
        (data) => data.axis.id == axis.id,
        orElse: () => AxisScoreData(axis: axis),
      );

      final value = score.hasScore ? score.scoreValue / 100 : 0.0;
      final angle = -pi / 2 + i * angleStep;
      final point = Offset(
        center.dx + radius * value * cos(angle),
        center.dy + radius * value * sin(angle),
      );

      if (firstPoint) {
        path.moveTo(point.dx, point.dy);
        firstPoint = false;
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    path.close();
    canvas.drawPath(path, shapePaint);
    canvas.drawPath(path, strokePaint);
  }

  void _drawDataPoints(Canvas canvas, Offset center, double radius) {
    final axes = SummaryConfig.axes.values.toList();
    final angleStep = 2 * pi / axes.length;

    final pointPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    final pointStrokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 2;

    for (int i = 0; i < axes.length; i++) {
      final axis = axes[i];
      final score = axisScores.firstWhere(
        (data) => data.axis.id == axis.id,
        orElse: () => AxisScoreData(axis: axis),
      );

      if (!score.hasScore) continue;

      final value = score.scoreValue / 100;
      final angle = -pi / 2 + i * angleStep;
      final point = Offset(
        center.dx + radius * value * cos(angle),
        center.dy + radius * value * sin(angle),
      );

      canvas.drawCircle(point, 4, pointPaint);
      canvas.drawCircle(point, 4, pointStrokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Радар-диаграмма с иконками вокруг вместо текстовых подписей
class RadarChartWithIcons extends StatelessWidget {
  final List<AxisScoreData> axisScores;
  final double size;

  const RadarChartWithIcons({
    super.key,
    required this.axisScores,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    final axes = SummaryConfig.axes.values.toList();
    final angleStep = 2 * pi / axes.length;
    final iconPadding = 40.0; // Дополнительное пространство для иконок
    final totalSize = size + iconPadding; // Увеличенный размер контейнера
    final radius = min(size, size) / 2 - 20; // Радиус самого радара
    final center = totalSize / 2; // Центр увеличенного контейнера

    return SizedBox(
      width: totalSize,
      height: totalSize,
      child: Stack(
        children: [
          // Сам радар в центре с offset
          Positioned(
            left: iconPadding / 2,
            top: iconPadding / 2,
            child: RadarChart(
              axisScores: axisScores,
              size: size,
            ),
          ),
          // Иконки вокруг радара
          ...List.generate(axes.length, (i) {
            final angle = -pi / 2 + i * angleStep;
            final iconDistance = radius + 25; // Расстояние от центра до иконки
            final x = center + iconDistance * cos(angle) - 12; // -12 для центрирования иконки (24/2)
            final y = center + iconDistance * sin(angle) - 12;

            final axis = axes[i];

            return Positioned(
              left: x,
              top: y,
              child: Icon(
                axis.icon,
                color: axis.color,
                size: 24,
              ),
            );
          }),
        ],
      ),
    );
  }
}

/// Мини-шкала для отображения балла по одной шкале
class MiniScale extends StatelessWidget {
  final AxisScoreData axisScore;
  final String languageCode;
  final double width;
  final bool showExpandIcon;
  final bool isExpanded;

  const MiniScale({
    super.key,
    required this.axisScore,
    required this.languageCode,
    this.width = 200,
    this.showExpandIcon = false,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Верхняя строка: иконка + название + стрелка (если expandable)
          Row(
            children: [
              Icon(
                axisScore.axis.icon,
                size: 20,
                color: axisScore.axis.color,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  axisScore.axis.getName(languageCode),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showExpandIcon) ...[
                const SizedBox(width: 8),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.expand_more,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          // Нижняя строка: шкала + значение
          Row(
            children: [
              // Шкала
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      // Заполненная часть
                      Expanded(
                        flex: axisScore.hasScore ? (axisScore.scoreValue / 10).round() : 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: axisScore.hasScore ? axisScore.getScoreColor() : Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      // Пустая часть
                      Expanded(
                        flex: axisScore.hasScore ? (10 - (axisScore.scoreValue / 10).round()) : 10,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Значение или "—" если нет данных
              Container(
                width: 75,
                alignment: Alignment.centerRight,
                child: Text(
                  axisScore.hasScore ? axisScore.getDisplayText(languageCode) : '—',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: axisScore.hasScore ? axisScore.getScoreColor() : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Горизонтальная шкала с градиентом
class GradientScale extends StatelessWidget {
  final AxisScoreData axisScore;
  final double width;
  final double height;

  const GradientScale({
    super.key,
    required this.axisScore,
    this.width = 200,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height / 2),
        gradient: LinearGradient(
          colors: [
            Colors.red.withOpacity(0.3),
            Colors.amber.withOpacity(0.3),
            Colors.orange.withOpacity(0.3),
            Colors.green.withOpacity(0.3),
          ],
          stops: const [0.0, 0.25, 0.5, 1.0],
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Индикатор позиции
          Positioned(
            left: axisScore.hasScore
                ? (axisScore.scoreValue / 100) * (width - height) + height / 2 - 4
                : width / 2 - 4,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: axisScore.getScoreColor(),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
          // Значение
          Positioned(
            right: 8,
            child: Text(
              axisScore.getScoreText(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: axisScore.getScoreColor(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Сетка мини-шкал для всех осей с возможностью детального просмотра
class MiniScalesGrid extends StatelessWidget {
  final List<AxisScoreData> axisScores;
  final double scaleWidth;
  final String languageCode;

  const MiniScalesGrid({
    super.key,
    required this.axisScores,
    required this.languageCode,
    this.scaleWidth = 250,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < axisScores.length; i++) {
      children.add(
        ExpandableMiniScale(
          axisScore: axisScores[i],
          languageCode: languageCode,
          width: scaleWidth,
        ),
      );

      // Добавляем разделитель после каждого элемента, кроме последнего
      if (i < axisScores.length - 1) {
        children.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
        );
      }
    }

    return Column(children: children);
  }
}

/// Разворачиваемая мини-шкала с детальной информацией
class ExpandableMiniScale extends StatefulWidget {
  final AxisScoreData axisScore;
  final String languageCode;
  final double width;

  const ExpandableMiniScale({
    super.key,
    required this.axisScore,
    required this.languageCode,
    this.width = 250,
  });

  @override
  State<ExpandableMiniScale> createState() => _ExpandableMiniScaleState();
}

class _ExpandableMiniScaleState extends State<ExpandableMiniScale> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hasData = widget.axisScore.score != null && widget.axisScore.score!.contributions.isNotEmpty;

    return Column(
      children: [
        // Основная шкала (всегда видимая)
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: MiniScale(
            axisScore: widget.axisScore,
            languageCode: widget.languageCode,
            width: widget.width,
            showExpandIcon: true,
            isExpanded: _isExpanded,
          ),
        ),

        // Детальная информация (показывается при раскрытии)
        if (_isExpanded) ...[
          const SizedBox(height: 8),
          hasData
              ? _buildDetailView(context, widget.languageCode)
              : _buildNoDataView(context, widget.languageCode),
        ],
      ],
    );
  }

  Widget _buildDetailView(BuildContext context, String languageCode) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                widget.axisScore.axis.icon,
                size: 16,
                color: widget.axisScore.axis.color,
              ),
              const SizedBox(width: 8),
              Text(
                widget.axisScore.axis.getName(languageCode),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            languageCode == 'ru' ? 'Вклады от тестов:' : 'Test contributions:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 8),
          ...widget.axisScore.score!.contributions.map((contribution) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.05),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contribution.testName,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      Text(
                        languageCode == 'ru' ? '${contribution.scale} шкала' : '${contribution.scale} scale',
                        style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${contribution.score.round()}%',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: contribution.score >= 50 ? Colors.green : Colors.red,
                      ),
                    ),
                    Text(
                      '${contribution.direction >= 0 ? "+" : ""}${contribution.contribution.round()}',
                      style: TextStyle(
                        fontSize: 10,
                        color: contribution.contribution >= 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  languageCode == 'ru' ? 'Итоговый расчёт:' : 'Final calculation:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  '${widget.axisScore.score!.rawScore.round()} → ${widget.axisScore.scoreValue.round()}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoDataView(BuildContext context, String languageCode) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              languageCode == 'ru'
                  ? 'Для этой шкалы нужно пройти больше тестов. Но не переживайте — у вас всё получится!'
                  : 'You need to take more tests for this scale. But don\'t worry — you can do it!',
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).textTheme.bodyLarge?.color,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Комбинированный виджет с радаром и мини-шкалами
class SummaryVisualization extends StatelessWidget {
  final List<AxisScoreData> axisScores;
  final String languageCode;
  final double radarSize;

  const SummaryVisualization({
    super.key,
    required this.axisScores,
    required this.languageCode,
    this.radarSize = 200,
  });

  @override
  Widget build(BuildContext context) {
    // Разделяем оси на две категории
    final personalityAxes = <AxisScoreData>[];
    final relationshipAxes = <AxisScoreData>[];

    // Определяем оси отношений по их ID
    const relationshipAxisIds = {
      'relationship_security',
      'emotional_intimacy',
      'passion_vitality',
      'reliability_partnership',
    };

    for (final axis in axisScores) {
      if (relationshipAxisIds.contains(axis.axis.id)) {
        relationshipAxes.add(axis);
      } else {
        personalityAxes.add(axis);
      }
    }

    return Column(
      children: [
        // Секция 1: Личностные качества
        if (personalityAxes.isNotEmpty) ...[
          _buildSection(
            context,
            title: languageCode == 'ru' ? 'Личностные качества' : 'Personality Traits',
            axes: personalityAxes,
            languageCode: languageCode,
          ),
          const SizedBox(height: 20),
        ],

        // Секция 2: Качество отношений
        if (relationshipAxes.isNotEmpty) ...[
          _buildSection(
            context,
            title: languageCode == 'ru' ? 'Качество отношений' : 'Relationship Quality',
            axes: relationshipAxes,
            languageCode: languageCode,
            showNoDataHint: relationshipAxes.every((axis) => axis.scoreValue == 0),
          ),
        ],
      ],
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<AxisScoreData> axes,
    required String languageCode,
    bool showNoDataHint = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (showNoDataHint) ...[
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      languageCode == 'ru'
                          ? 'Пройдите тест "Профиль любви" для оценки качества отношений'
                          : 'Take the "Love Profile" test to assess relationship quality',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 15),
          ...axes.map((axis) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ExpandableMiniScale(
                  axisScore: axis,
                  languageCode: languageCode,
                  width: MediaQuery.of(context).size.width - 80,
                ),
              )),
        ],
      ),
    );
  }
}
