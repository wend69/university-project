import 'package:flutter/material.dart';
import 'dart:math';

class GlowCircularProgress extends StatelessWidget {
  final double percentage;

  const GlowCircularProgress({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: CustomPaint(
        painter: _GlowPainter(percentage),
        child: Center(
          child: Text(
            '${percentage.toStringAsFixed(1)}%',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _GlowPainter extends CustomPainter {
  final double percentage;

  _GlowPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 12.0;
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - strokeWidth;

    final rect = Rect.fromCircle(center: center, radius: radius);

    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * (percentage / 100);

    // Background circle
    final bgPaint = Paint()
      // ignore: deprecated_member_use
      ..color = Colors.green.withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, bgPaint);

    // ✅ Sweep gradient (follows the circle correctly)
    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi,
      colors: const [Color(0xFF00FFAA), Color(0xFF00FF88)],
      transform: const GradientRotation(-pi / 2),
    );

    // Glow paint
    final glowPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 4
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    // Progress paint
    final progressPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw arc
    canvas.drawArc(rect, startAngle, sweepAngle, false, glowPaint);
    canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
