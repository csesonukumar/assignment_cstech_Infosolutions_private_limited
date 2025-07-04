import 'package:flutter/material.dart';
import '../constants/colors.dart';

class RingChart extends StatelessWidget {
  final int pending;
  final int completed;
  final int rescheduled;

  const RingChart({
    super.key,
    required this.pending,
    required this.completed,
    required this.rescheduled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 160,
      child: CustomPaint(
        painter: _RingChartPainter(
          pending: pending,
          completed: completed,
          rescheduled: rescheduled,
        ),
        child: Center(
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class _RingChartPainter extends CustomPainter {
  final int pending;
  final int completed;
  final int rescheduled;

  _RingChartPainter({
    required this.pending,
    required this.completed,
    required this.rescheduled,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 20.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth / 2;

    final total = pending + completed + rescheduled;
    if (total == 0) return;

    final paintBackground = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, paintBackground);

    double startAngle = -3.14 / 2;

    void drawSection(double value, Color color) {
      final sweepAngle = (value / total) * 3.14 * 2;
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }

    drawSection(pending.toDouble(), AppColors.chartOrange);
    drawSection(completed.toDouble(), AppColors.chartGreen);
    drawSection(rescheduled.toDouble(), AppColors.chartPurple);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}