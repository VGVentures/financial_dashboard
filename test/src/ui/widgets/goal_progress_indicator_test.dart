import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockColorScheme extends Mock implements ColorScheme {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

void main() {
  group('CircleProgressPainter', () {
    group('shouldRepaint', () {
      test('returns false if nothing changes', () {
        final colorScheme = MockColorScheme();

        final newDelegate = CircleProgressPainter(
          colorScheme: colorScheme,
          isGradient: false,
        );
        final oldDelegate = CircleProgressPainter(
          colorScheme: colorScheme,
          isGradient: false,
        );

        expect(newDelegate.shouldRepaint(oldDelegate), isFalse);
      });

      test('returns true when colorScheme changes', () {
        final newDelegate = CircleProgressPainter(
          colorScheme: MockColorScheme(),
          isGradient: false,
        );
        final oldDelegate = CircleProgressPainter(
          colorScheme: MockColorScheme(),
          isGradient: false,
        );

        expect(newDelegate.shouldRepaint(oldDelegate), isTrue);
      });

      test('returns true when isGradient changes', () {
        final colorScheme = MockColorScheme();

        final newDelegate = CircleProgressPainter(
          colorScheme: colorScheme,
          isGradient: false,
        );
        final oldDelegate = CircleProgressPainter(
          colorScheme: colorScheme,
          isGradient: true,
        );

        expect(newDelegate.shouldRepaint(oldDelegate), isTrue);
      });
    });
  });
}
