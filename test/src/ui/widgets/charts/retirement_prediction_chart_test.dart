import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/helpers.dart';

class _MockFinancialDataBloc
    extends MockBloc<FinancialDataEvent, FinancialDataState>
    implements FinancialDataBloc {}

void main() {
  group('RetirementPredictionChart', () {
    late FinancialDataBloc financialDataBloc;

    setUp(() {
      financialDataBloc = _MockFinancialDataBloc();

      when(() => financialDataBloc.state).thenReturn(
        FinancialDataState(
          savingsDataPoints: createSampleData(),
        ),
      );
    });

    testWidgets('renders LineChartBody', (tester) async {
      await tester.pumpExperience(
        RetirementPredictionChart(),
        financialDataBloc: financialDataBloc,
      );

      expect(find.byType(LineChartBody), findsOneWidget);
    });

    testWidgets('shows and hides tooltip on gestures', (tester) async {
      await tester.pumpExperience(
        RetirementPredictionChart(),
        financialDataBloc: financialDataBloc,
      );
      final keyFinder = find.byKey(const Key('chart_tooltip'));

      expect(keyFinder, findsNothing);

      final gesture = await tester.startGesture(
        tester.getCenter(
          find.byType(LineChartBody),
        ),
      );

      await gesture.moveTo(const Offset(0, 50));
      await tester.pumpAndSettle();

      expect(keyFinder, findsOneWidget);

      await gesture.up();
      await tester.pumpAndSettle();

      expect(keyFinder, findsNothing);
    });
  });
}
