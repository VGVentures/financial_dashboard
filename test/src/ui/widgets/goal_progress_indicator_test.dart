import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_experience.dart';

class MockColorScheme extends Mock implements ColorScheme {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class _MockFinancialDataBloc
    extends MockBloc<FinancialDataEvent, FinancialDataState>
    implements FinancialDataBloc {}

void main() {
  group('CircleProgressPainter', () {
    late FinancialDataBloc financialDataBloc;

    setUp(() {
      financialDataBloc = _MockFinancialDataBloc();

      when(() => financialDataBloc.state).thenReturn(FinancialDataState());
    });

    group('$GoalProgressIndicator', () {
      testWidgets('renders without gradient', (tester) async {
        await tester.pumpExperience(
          GoalProgressIndicator(value: 1),
          financialDataBloc: financialDataBloc,
        );
        await tester.pumpAndSettle();

        expect(find.byType(GoalProgressIndicator), findsOneWidget);
      });

      testWidgets('renders with gradient', (tester) async {
        await tester.pumpExperience(
          GoalProgressIndicator(isGradient: true),
          financialDataBloc: financialDataBloc,
        );
        await tester.pumpAndSettle();

        expect(find.byType(GoalProgressIndicator), findsOneWidget);
      });
    });

    group('shouldRepaint', () {
      test('returns false if nothing changes', () {
        final colorScheme = MockColorScheme();
        when(() => colorScheme.primary).thenReturn(Colors.red);

        final newDelegate = CircleProgressPainter(
          colorScheme: colorScheme,
          isGradient: false,
          value: 1,
        );
        final oldDelegate = CircleProgressPainter(
          colorScheme: colorScheme,
          isGradient: false,
          value: 1,
        );

        expect(newDelegate.shouldRepaint(oldDelegate), isFalse);
      });

      test('returns true when colorScheme changes', () {
        final colorScheme = MockColorScheme();
        when(() => colorScheme.primary).thenReturn(Colors.red);

        final newDelegate = CircleProgressPainter(
          colorScheme: colorScheme,
          isGradient: false,
          value: 1,
        );

        final colorScheme2 = MockColorScheme();
        when(() => colorScheme2.primary).thenReturn(Colors.blue);
        final oldDelegate = CircleProgressPainter(
          colorScheme: colorScheme2,
          isGradient: false,
          value: 1,
        );

        expect(newDelegate.shouldRepaint(oldDelegate), isTrue);
      });

      test('returns true when isGradient changes', () {
        final colorScheme = MockColorScheme();
        when(() => colorScheme.primary).thenReturn(Colors.red);

        final newDelegate = CircleProgressPainter(
          colorScheme: colorScheme,
          isGradient: false,
          value: 1,
        );

        final oldDelegate = CircleProgressPainter(
          colorScheme: colorScheme,
          isGradient: true,
          value: 1,
        );

        expect(newDelegate.shouldRepaint(oldDelegate), isTrue);
      });
    });
  });
}
