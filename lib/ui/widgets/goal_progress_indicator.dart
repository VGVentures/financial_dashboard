import 'dart:math' as math;

import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';

class GoalProgressIndicator extends StatelessWidget {
  const GoalProgressIndicator({
    super.key,
    this.size = AppSpacing.xxxlg,
    this.value = 24,
    this.isGradient = false,
  });

  final double size;
  final double value;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final coloScheme = theme.colorScheme;

    return SizedBox(
      height: size,
      width: size,
      child: CustomPaint(
        painter: CircleProgressPainter(
          colorScheme: coloScheme,
          isGradient: isGradient,
        ),
        child: Center(
          child: DefaultTextStyle(
            style: textTheme.titleMedium!,
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
            ),
            child: Text(
              '$value%',
            ),
          ),
        ),
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  const CircleProgressPainter({
    required this.colorScheme,
    required this.isGradient,
  });

  final ColorScheme colorScheme;
  final bool isGradient;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = colorScheme.surface
      ..strokeWidth = AppSpacing.sm;

    final arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = AppSpacing.sm;

    const startAngle = math.pi / 2;
    const endAngle = 3 * math.pi / 4;

    if (isGradient) {
      arcPaint.shader = SweepGradient(
        startAngle: startAngle,
        endAngle: endAngle,
        colors: [
          colorScheme.primary.withOpacity(0.2),
          colorScheme.primary,
        ],
      ).createShader(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
      );
    } else {
      arcPaint.color = colorScheme.primary;
    }

    canvas
      ..drawCircle(
        center,
        size.height / 2,
        circlePaint,
      )
      ..drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        startAngle,
        endAngle,
        false,
        arcPaint,
      );
  }

  @override
  bool shouldRepaint(covariant CircleProgressPainter oldDelegate) {
    return colorScheme != oldDelegate.colorScheme ||
        isGradient != oldDelegate.isGradient;
  }
}
