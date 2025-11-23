import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../models/career_compass_model.dart';
import '../data/career_compass_data.dart';
import '../providers/locale_provider.dart';

/// Экран результатов теста "Карьерный компас"
///
/// Отображает:
/// - Радарную диаграмму 8 шкал
/// - Топ-3 профессиональных склонностей
/// - Карьерный профиль
/// - Детальные интерпретации
/// - Рекомендации
///
/// @version: 1.0.0

class CareerCompassResultScreen extends StatelessWidget {
  final CareerCompassResult result;

  const CareerCompassResultScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final isRussian = context.watch<LocaleProvider>().isRussian;

    return Scaffold(
      appBar: AppBar(
        title: Text(isRussian ? 'Результаты теста' : 'Test Results'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            _buildHeader(context, isRussian),
            const SizedBox(height: 24),

            // Радарная диаграмма
            _buildRadarChart(context, isRussian),
            const SizedBox(height: 24),

            // Топ-3 склонности
            _buildTopScalesSection(context, isRussian),
            const SizedBox(height: 24),

            // Карьерный профиль
            if (result.profileId != null) ...[
              _buildProfileSection(context, isRussian),
              const SizedBox(height: 24),
            ],

            // Все шкалы
            _buildAllScalesSection(context, isRussian),
            const SizedBox(height: 24),

            // Рекомендации
            _buildRecommendationsSection(context, isRussian),
            const SizedBox(height: 24),

            // Статистика прохождения
            _buildStatsSection(context, isRussian),
            const SizedBox(height: 24),

            // Кнопка завершения
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                child: Text(
                  isRussian ? 'Завершить' : 'Finish',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isRussian) {
    return Card(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.explore, size: 48, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isRussian ? 'Карьерный компас' : 'Career Compass',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isRussian
                        ? 'Ваш профиль профессиональных интересов'
                        : 'Your professional interests profile',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadarChart(BuildContext context, bool isRussian) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isRussian ? 'Профиль интересов' : 'Interests Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: RadarChartPainter(
                  scores: result.scalePercentages,
                  scales: CareerCompassData.scales,
                  isRussian: isRussian,
                ),
                size: const Size(300, 300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopScalesSection(BuildContext context, bool isRussian) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 8),
                Text(
                  isRussian ? 'Ваши главные склонности' : 'Your Main Inclinations',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...result.topScales.asMap().entries.map((entry) {
              final index = entry.key;
              final scaleId = entry.value;
              final scale = CareerCompassData.getScaleById(scaleId);
              final score = result.scaleScores[scaleId] ?? 0;
              final percentage = result.scalePercentages[scaleId] ?? 0;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: _buildTopScaleItem(
                  context,
                  index + 1,
                  scale,
                  score,
                  percentage,
                  isRussian,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTopScaleItem(
    BuildContext context,
    int rank,
    CareerScale? scale,
    int score,
    double percentage,
    bool isRussian,
  ) {
    if (scale == null) return const SizedBox();

    final color = Color(int.parse(scale.color.replaceFirst('#', '0xFF')));

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
              child: Text(
                '#$rank',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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
                    Text(
                      scale.icon,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      scale.name[isRussian ? 'ru' : 'en'] ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  scale.description[isRussian ? 'ru' : 'en'] ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                '${percentage.toInt()}%',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                '$score/7',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context, bool isRussian) {
    final profile = CareerCompassData.getProfileById(result.profileId!);
    if (profile == null) return const SizedBox();

    return Card(
      color: Colors.purple.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  profile.emoji,
                  style: const TextStyle(fontSize: 40),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isRussian ? 'Ваш карьерный профиль' : 'Your Career Profile',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        profile.name[isRussian ? 'ru' : 'en'] ?? '',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              profile.description[isRussian ? 'ru' : 'en'] ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),

            // Подходящие отрасли
            _buildProfileList(
              context,
              Icons.business,
              isRussian ? 'Подходящие отрасли' : 'Suitable Industries',
              profile.suitableIndustries,
            ),
            const SizedBox(height: 12),

            // Ключевые профессии
            _buildProfileList(
              context,
              Icons.work,
              isRussian ? 'Рекомендуемые профессии' : 'Recommended Professions',
              profile.keyProfessions,
            ),
            const SizedBox(height: 12),

            // Сильные стороны
            _buildProfileList(
              context,
              Icons.star,
              isRussian ? 'Ваши сильные стороны' : 'Your Strengths',
              profile.strengths,
            ),
            const SizedBox(height: 12),

            // Области развития
            _buildProfileList(
              context,
              Icons.trending_up,
              isRussian ? 'Области для развития' : 'Development Areas',
              profile.developmentAreas,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileList(
    BuildContext context,
    IconData icon,
    String title,
    List<String> items,
  ) {
    if (items.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: Colors.purple),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items.map((item) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                item,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAllScalesSection(BuildContext context, bool isRussian) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isRussian ? 'Все шкалы' : 'All Scales',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...CareerCompassData.scales.map((scale) {
              final score = result.scaleScores[scale.id] ?? 0;
              final percentage = result.scalePercentages[scale.id] ?? 0;
              final color = Color(int.parse(scale.color.replaceFirst('#', '0xFF')));

              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(scale.icon, style: const TextStyle(fontSize: 18)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            scale.name[isRussian ? 'ru' : 'en'] ?? '',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Text(
                          '${percentage.toInt()}%',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: percentage / 100,
                        minHeight: 10,
                        backgroundColor: color.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$score из ${CareerCompassConfig.maxScaleScore}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationsSection(BuildContext context, bool isRussian) {
    return Card(
      color: Colors.green.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.lightbulb, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  isRussian ? 'Рекомендации' : 'Recommendations',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...result.recommendations.map((rec) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        rec,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, bool isRussian) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isRussian ? 'Статистика' : 'Statistics',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  Icons.timer,
                  '${(result.totalTimeMs / 1000 / 60).toStringAsFixed(1)} ${isRussian ? 'мин' : 'min'}',
                  isRussian ? 'Общее время' : 'Total Time',
                ),
                _buildStatItem(
                  context,
                  Icons.speed,
                  '${(result.averageResponseTimeMs / 1000).toStringAsFixed(1)} ${isRussian ? 'сек' : 'sec'}',
                  isRussian ? 'Среднее время' : 'Avg. Time',
                ),
                _buildStatItem(
                  context,
                  Icons.quiz,
                  '${result.answers.length}',
                  isRussian ? 'Ответов' : 'Answers',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Theme.of(context).primaryColor),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

/// Painter для радарной диаграммы
class RadarChartPainter extends CustomPainter {
  final Map<String, double> scores;
  final List<CareerScale> scales;
  final bool isRussian;

  RadarChartPainter({
    required this.scores,
    required this.scales,
    required this.isRussian,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 40;
    final angleStep = 2 * math.pi / scales.length;

    // Draw grid circles
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int i = 1; i <= 5; i++) {
      canvas.drawCircle(center, radius * i / 5, gridPaint);
    }

    // Draw axes
    for (int i = 0; i < scales.length; i++) {
      final angle = -math.pi / 2 + angleStep * i;
      final endPoint = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      canvas.drawLine(center, endPoint, gridPaint);

      // Draw labels
      final labelOffset = Offset(
        center.dx + (radius + 25) * math.cos(angle),
        center.dy + (radius + 25) * math.sin(angle),
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: scales[i].icon,
          style: const TextStyle(fontSize: 16),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        Offset(labelOffset.dx - 10, labelOffset.dy - 10),
      );
    }

    // Draw data polygon
    final dataPath = Path();
    final dataPaint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    final dataStrokePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (int i = 0; i < scales.length; i++) {
      final score = scores[scales[i].id] ?? 0;
      final normalizedScore = score / 100;
      final angle = -math.pi / 2 + angleStep * i;
      final point = Offset(
        center.dx + radius * normalizedScore * math.cos(angle),
        center.dy + radius * normalizedScore * math.sin(angle),
      );

      if (i == 0) {
        dataPath.moveTo(point.dx, point.dy);
      } else {
        dataPath.lineTo(point.dx, point.dy);
      }
    }
    dataPath.close();

    canvas.drawPath(dataPath, dataPaint);
    canvas.drawPath(dataPath, dataStrokePaint);

    // Draw data points
    final pointPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    for (int i = 0; i < scales.length; i++) {
      final score = scores[scales[i].id] ?? 0;
      final normalizedScore = score / 100;
      final angle = -math.pi / 2 + angleStep * i;
      final point = Offset(
        center.dx + radius * normalizedScore * math.cos(angle),
        center.dy + radius * normalizedScore * math.sin(angle),
      );
      canvas.drawCircle(point, 5, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
