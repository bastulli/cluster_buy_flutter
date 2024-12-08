import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedFinanceBackground extends StatefulWidget {
  final Color lineColor;
  final bool isDarkMode;

  const AnimatedFinanceBackground({
    super.key,
    required this.lineColor,
    this.isDarkMode = false,
  });

  @override
  State<AnimatedFinanceBackground> createState() =>
      _AnimatedFinanceBackgroundState();
}

class _AnimatedFinanceBackgroundState extends State<AnimatedFinanceBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Slower overall movement to observe changes over time,
    // but still dynamic. Increase if you want even slower movement.
    _controller = AnimationController(
      duration: const Duration(seconds: 90),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return RepaintBoundary(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                painter: FinanceBackgroundPainter(
                  lineColor: widget.lineColor,
                  isDarkMode: widget.isDarkMode,
                  animation: _controller,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class FinanceBackgroundPainter extends CustomPainter {
  final Color lineColor;
  final bool isDarkMode;
  final Animation<double> animation;
  static const int lineCount = 16;

  FinanceBackgroundPainter({
    required this.lineColor,
    required this.animation,
    this.isDarkMode = false,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final random = math.Random(42);
    final vpX = size.width * 1.5;
    final vpY = size.height * 0.5;

    for (var i = 0; i < lineCount; i++) {
      final depthFactor = math.pow(1.0 - (i / lineCount), 2.0).toDouble();

      // Closer lines are thicker and more opaque
      final strokeWidth = 1.0 * depthFactor;
      final opacity = math.max(0.35 * depthFactor, 0.08);

      final paint = Paint()
        ..color = lineColor.withOpacity(opacity)
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      final path = Path();
      final points = <Offset>[];
      final signals = <Offset>[];

      // Increase range to allow going far above and below
      final startX = -size.width;
      final endX = size.width * 2.0;

      // Dramatic vertical range:
      // For the closest line (depthFactor ~1), range is huge, nearly full screen height.
      // For far lines (depthFactor ~0), less range.
      final baseRange = size.height * (0.8 * depthFactor + 0.1);
      final minY = 0 - baseRange; // allow going above top
      final maxY = size.height + baseRange; // allow going below bottom

      double currentY = size.height * 0.5; // start near center
      double momentum = 2.0;
      double trend = 3.0;

      // Larger random swings for a stock-market feel
      for (double x = startX; x <= endX; x += 12) {
        trend = trend * 0.95 + (random.nextDouble() - 0.5) * 0.1 * depthFactor;
        momentum = momentum * 0.9 +
            (random.nextDouble() - 0.5) * 30 * depthFactor +
            trend * 10;

        currentY = (currentY + momentum).clamp(minY, maxY);

        // Apply perspective shift:
        final perspectiveT = (x / vpX).clamp(0.0, 1.0);
        final px = x;
        final py = _lerpDouble(currentY, vpY, perspectiveT * 0.3)!;
        points.add(Offset(px, py));

        // Add a few random "buy signals" if momentum is large
        // Using the same lineColor, just fully opaque or slightly more visible
        if ((momentum.abs() > 10 * depthFactor) &&
            random.nextDouble() < 0.006 * depthFactor) {
          signals.add(Offset(px, py));
        }
      }

      path.moveTo(points[0].dx, points[0].dy);
      // Use smoother lines, but volatility should suggest "market action"
      for (var j = 0; j < points.length - 3; j += 3) {
        final p1 = points[j];
        final p2 = points[math.min(j + 1, points.length - 1)];
        final p3 = points[math.min(j + 2, points.length - 1)];

        // cubicTo for smoother curves
        path.cubicTo(
          (p1.dx + p2.dx) / 2,
          p1.dy,
          (p2.dx + p3.dx) / 2,
          p2.dy,
          p3.dx,
          p3.dy,
        );
      }

      // Closer lines move faster horizontally
      final speedFactor = 0.4 + depthFactor * 0.6;
      final dx = -animation.value * size.width * speedFactor;
      canvas.save();
      canvas.translate(dx, 0);
      canvas.drawPath(path, paint);

      // Draw signals as small vertical ticks to mimic markers on a chart.
      // No color difference: just use lineColor at higher opacity.
      final signalPaint = Paint()
        ..color = lineColor.withOpacity(math.min(opacity + 0.5, 1.0))
        ..strokeWidth = strokeWidth * 0.8 // slightly thinner ticks
        ..strokeCap = StrokeCap.round;

      for (final signal in signals) {
        // Small vertical line tick
        // Height of the tick depends on depthFactor
        final tickHeight = 10.0 * depthFactor;
        canvas.drawLine(
          Offset(signal.dx, signal.dy - tickHeight / 2),
          Offset(signal.dx, signal.dy + tickHeight / 2),
          signalPaint,
        );
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant FinanceBackgroundPainter oldDelegate) {
    return true;
  }
}

double? _lerpDouble(num a, num b, double t) {
  return a + (b - a) * t;
}
