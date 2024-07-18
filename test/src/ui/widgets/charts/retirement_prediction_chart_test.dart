import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group('RetirementPredictionChart', () {
    Widget buildSubject({
      void Function(String)? onCurrentSavings,
    }) =>
        RetirementPredicitionChart(
          onCurrentSavings: onCurrentSavings ?? (_) {},
        );

    testWidgets('renders LineChartBody', (tester) async {
      await tester.pumpExperience(buildSubject());

      expect(find.byType(LineChartBody), findsOneWidget);
    });

    testWidgets('shows and hides tooltip on gestures', (tester) async {
      await tester.pumpExperience(buildSubject());
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
