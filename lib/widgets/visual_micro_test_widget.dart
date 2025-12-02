import 'package:flutter/material.dart';
import '../models/visual_micro_tests_model.dart';
import 'dart:math' as math;

/// Universal widget for displaying a visual micro-test
///
/// Shows visual illustration + options as cards
///
/// @version: 1.0.0
class VisualMicroTestWidget extends StatelessWidget {
  final MicroTest microTest;
  final String languageCode;
  final Function(MicroTestOption) onOptionSelected;
  final String? selectedOptionId;

  const VisualMicroTestWidget({
    super.key,
    required this.microTest,
    required this.languageCode,
    required this.onOptionSelected,
    this.selectedOptionId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          Text(
            microTest.getTitle(languageCode),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Visual illustration
          _buildVisualIllustration(context),
          const SizedBox(height: 16),

          // Instruction
          Card(
            color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                microTest.getInstruction(languageCode),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Options
          ...microTest.options.map((option) => _buildOptionCard(context, option)),
        ],
      ),
    );
  }

  Widget _buildVisualIllustration(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: _getIllustrationForTest(context),
      ),
    );
  }

  Widget _getIllustrationForTest(BuildContext context) {
    // Simple visual representations using CustomPaint
    switch (microTest.id) {
      case 'visual_test_01':
        return CustomPaint(painter: AbstractCompositionPainter());
      case 'visual_test_02':
        return CustomPaint(painter: GeometricShapesPainter());
      case 'visual_test_03':
        return CustomPaint(painter: ColorPalettePainter());
      case 'visual_test_04':
        return CustomPaint(painter: OpticalIllusionPainter());
      case 'visual_test_05':
        return CustomPaint(painter: LinePathsPainter());
      case 'visual_test_06':
        return CustomPaint(painter: PatternTypesPainter());
      case 'visual_test_07':
        return CustomPaint(painter: EmotionalAbstractionPainter());
      case 'visual_test_08':
        return CustomPaint(painter: BalanceElementsPainter());
      case 'visual_test_09':
        return CustomPaint(painter: TextureTypesPainter());
      case 'visual_test_10':
        return CustomPaint(painter: PerspectiveFocusPainter());
      default:
        return _buildFallbackIllustration(context);
    }
  }

  Widget _buildFallbackIllustration(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: 64,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context, MicroTestOption option) {
    final isSelected = selectedOptionId == option.id;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: isSelected ? 8 : 2,
        color: isSelected
            ? Theme.of(context).colorScheme.primaryContainer
            : null,
        child: InkWell(
          onTap: () => onOptionSelected(option),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Selection indicator
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).dividerColor,
                      width: 2,
                    ),
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          size: 16,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : null,
                ),
                const SizedBox(width: 16),

                // Option text
                Expanded(
                  child: Text(
                    option.getText(languageCode),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// Custom Painters for Visual Illustrations
// ============================================================================

class AbstractCompositionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Colorful spots
    paint.color = Colors.red.withOpacity(0.6);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.4), 40, paint);

    paint.color = Colors.blue.withOpacity(0.6);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.3), 50, paint);

    paint.color = Colors.yellow.withOpacity(0.6);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.7), 45, paint);

    // Geometric shapes
    paint.color = Colors.green.withOpacity(0.4);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.1, size.height * 0.6, 60, 60),
      paint,
    );

    // Lines
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    paint.color = Colors.purple;
    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.5, size.height * 0.2,
        size.width, size.height * 0.6,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GeometricShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.black87;

    // Circle
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.3), 40, paint);

    // Square
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width * 0.75, size.height * 0.3),
        width: 80,
        height: 80,
      ),
      paint,
    );

    // Triangle
    final trianglePath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.8)
      ..lineTo(size.width * 0.15, size.height * 0.6)
      ..lineTo(size.width * 0.35, size.height * 0.6)
      ..close();
    canvas.drawPath(trianglePath, paint);

    // Spiral
    paint.color = Colors.blue;
    final spiralPath = Path();
    for (double t = 0; t < 10; t += 0.1) {
      final r = t * 3;
      final x = size.width * 0.75 + r * math.cos(t);
      final y = size.height * 0.7 + r * math.sin(t);
      if (t == 0) {
        spiralPath.moveTo(x, y);
      } else {
        spiralPath.lineTo(x, y);
      }
    }
    canvas.drawPath(spiralPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ColorPalettePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.green,
      Colors.purple,
    ];

    final rectWidth = size.width / colors.length;
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < colors.length; i++) {
      paint.color = colors[i];
      canvas.drawRect(
        Rect.fromLTWH(i * rectWidth, 0, rectWidth, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OpticalIllusionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black87;

    // Vase shape in center
    final vasePath = Path()
      ..moveTo(size.width * 0.5, size.height * 0.2)
      ..cubicTo(
        size.width * 0.4, size.height * 0.3,
        size.width * 0.45, size.height * 0.5,
        size.width * 0.5, size.height * 0.8,
      )
      ..cubicTo(
        size.width * 0.55, size.height * 0.5,
        size.width * 0.6, size.height * 0.3,
        size.width * 0.5, size.height * 0.2,
      );
    canvas.drawPath(vasePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LinePathsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Straight line
    paint.color = Colors.red;
    canvas.drawLine(
      Offset(50, size.height * 0.25),
      Offset(size.width - 50, size.height * 0.25),
      paint,
    );

    // Wavy line
    paint.color = Colors.blue;
    final wavyPath = Path()..moveTo(50, size.height * 0.5);
    for (double x = 50; x < size.width - 50; x += 20) {
      wavyPath.lineTo(x, size.height * 0.5 + 20 * math.sin(x / 20));
    }
    canvas.drawPath(wavyPath, paint);

    // Spiral line
    paint.color = Colors.green;
    final spiralPath = Path();
    final centerX = size.width * 0.5;
    final centerY = size.height * 0.75;
    for (double t = 0; t < 10; t += 0.1) {
      final r = t * 3;
      final x = centerX + r * math.cos(t);
      final y = centerY + r * math.sin(t);
      if (t == 0) {
        spiralPath.moveTo(x, y);
      } else {
        spiralPath.lineTo(x, y);
      }
    }
    canvas.drawPath(spiralPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PatternTypesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black54;

    final quarterWidth = size.width / 4;

    // Grid pattern
    for (int i = 0; i < 5; i++) {
      canvas.drawLine(
        Offset(i * quarterWidth / 5, 0),
        Offset(i * quarterWidth / 5, size.height / 2),
        paint,
      );
      canvas.drawLine(
        Offset(0, i * size.height / 10),
        Offset(quarterWidth, i * size.height / 10),
        paint,
      );
    }

    // Waves pattern
    final wavePath = Path()..moveTo(quarterWidth, size.height * 0.25);
    for (double x = quarterWidth; x < quarterWidth * 2; x += 5) {
      wavePath.lineTo(x, size.height * 0.25 + 10 * math.sin(x / 5));
    }
    for (int i = 0; i < 4; i++) {
      canvas.save();
      canvas.translate(0, i * 15.0);
      canvas.drawPath(wavePath, paint);
      canvas.restore();
    }

    // Chaos pattern
    paint.style = PaintingStyle.fill;
    final random = math.Random(42);
    for (int i = 0; i < 30; i++) {
      canvas.drawCircle(
        Offset(
          quarterWidth * 2 + random.nextDouble() * quarterWidth,
          random.nextDouble() * size.height / 2,
        ),
        random.nextDouble() * 8 + 2,
        paint,
      );
    }

    // Fractal-like pattern
    paint.style = PaintingStyle.stroke;
    void drawBranch(Offset start, double length, double angle, int depth) {
      if (depth == 0 || length < 2) return;

      final end = Offset(
        start.dx + length * math.cos(angle),
        start.dy + length * math.sin(angle),
      );
      canvas.drawLine(start, end, paint);

      drawBranch(end, length * 0.7, angle - 0.5, depth - 1);
      drawBranch(end, length * 0.7, angle + 0.5, depth - 1);
    }

    drawBranch(
      Offset(quarterWidth * 3.5, size.height * 0.5),
      30,
      -math.pi / 2,
      4,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EmotionalAbstractionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Calm area (soft blues)
    paint.color = Colors.lightBlue.withOpacity(0.3);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width / 3, size.height),
        const Radius.circular(20),
      ),
      paint,
    );

    // Curious area (vibrant yellows)
    paint.color = Colors.amber.withOpacity(0.5);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), 60, paint);

    // Tension area (sharp reds)
    paint.color = Colors.red.withOpacity(0.4);
    final tensionPath = Path()
      ..moveTo(size.width * 0.8, size.height * 0.3)
      ..lineTo(size.width * 0.9, size.height * 0.4)
      ..lineTo(size.width * 0.7, size.height * 0.5)
      ..lineTo(size.width * 0.95, size.height * 0.7)
      ..close();
    canvas.drawPath(tensionPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BalanceElementsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black87;

    // Symmetry
    final rect1 = Rect.fromCenter(
      center: Offset(size.width * 0.3, size.height * 0.5),
      width: 60,
      height: 60,
    );
    final rect2 = Rect.fromCenter(
      center: Offset(size.width * 0.7, size.height * 0.5),
      width: 60,
      height: 60,
    );
    canvas.drawRect(rect1, paint);
    canvas.drawRect(rect2, paint);

    // Center line
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.grey;
    canvas.drawLine(
      Offset(size.width * 0.5, 0),
      Offset(size.width * 0.5, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TextureTypesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final quarterWidth = size.width / 4;
    final paint = Paint();

    // Smooth
    paint.color = Colors.blue.shade100;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, quarterWidth, size.height),
        const Radius.circular(20),
      ),
      paint,
    );

    // Rough
    paint.color = Colors.brown.shade300;
    final random = math.Random(42);
    for (int i = 0; i < 50; i++) {
      canvas.drawCircle(
        Offset(
          quarterWidth + random.nextDouble() * quarterWidth,
          random.nextDouble() * size.height,
        ),
        random.nextDouble() * 5 + 1,
        paint,
      );
    }

    // Soft
    for (int i = 0; i < 5; i++) {
      paint.color = Colors.pink.withOpacity(0.2 + i * 0.1);
      canvas.drawCircle(
        Offset(quarterWidth * 2.5, size.height * 0.5),
        50.0 - i * 10,
        paint,
      );
    }

    // Structured
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = Colors.black87;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        canvas.drawRect(
          Rect.fromLTWH(
            quarterWidth * 3 + i * 25,
            j * 60.0 + 20,
            20,
            50,
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PerspectiveFocusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2;

    // Horizon line
    paint.color = Colors.orange;
    canvas.drawLine(
      Offset(0, size.height * 0.3),
      Offset(size.width, size.height * 0.3),
      paint,
    );

    // Sky
    paint.style = PaintingStyle.fill;
    paint.color = Colors.blue.withOpacity(0.3);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height * 0.3),
      paint,
    );

    // Foreground details
    paint.color = Colors.green.shade700;
    for (int i = 0; i < 5; i++) {
      canvas.drawCircle(
        Offset(50.0 + i * 80, size.height * 0.8),
        20,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
