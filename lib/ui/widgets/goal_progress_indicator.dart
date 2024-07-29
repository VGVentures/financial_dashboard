import 'dart:math' as math;

import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';

class GoalProgressIndicator extends StatelessWidget {
  const GoalProgressIndicator({
    super.key,
    this.size = AppSpacing.xxxlg,
    this.value = 0,
    this.isGradient = false,
  });

  final double size;

  /// Value as a percentage between 0.0 and 1.0.
  final double value;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final coloScheme = theme.colorScheme;

    final displayValue = (value * 100).toInt();

    return SizedBox(
      height: size,
      width: size,
      child: CustomPaint(
        painter: CircleProgressPainter(
          colorScheme: coloScheme,
          isGradient: isGradient,
          value: value,
        ),
        child: Center(
          child: DefaultTextStyle(
            style: textTheme.titleMedium!,
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
            ),
            child: Text(
              '$displayValue%',
            ),
          ),
        ),
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  CircleProgressPainter({
    required this.value,
    required this.colorScheme,
    required this.isGradient,
  }) {
    colors = [
      colorScheme.primary.withOpacity(0.35),
      colorScheme.primary,
    ];
  }

  /// Value as a percentage between 0.0 and 1.0.
  final double value;
  final ColorScheme colorScheme;
  final bool isGradient;

  static const startAngle = 3 * math.pi / 2;
  late final List<Color> colors;

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

    // Calculate sweep angle as the percent of a circle's circumference.
    var sweepAngle = (2 * math.pi) * value;

    if (sweepAngle == 0) {
      // Make 0 progress visible to avoid breakage.
      sweepAngle += 0.05;
    }

    if (isGradient) {
      arcPaint.shader = SweepGradient(
        colors: colors,
        transform: const GradientRotation(startAngle - 0.15),
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
        sweepAngle,
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
