import 'dart:async';
import 'dart:math';

import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';

List<LineChartPoint> _createSampleData() {
  final data = <LineChartPoint>[];
  var value = 100000.0;
  for (var age = 25; age <= 90; age++) {
    final toAdd = Random().nextInt(13000);
    value += toAdd;
    data.add(
      LineChartPoint(
        age: age.toString(),
        value: value,
      ),
    );
  }
  return data;
}

void main() {
  group('LineChartBody', () {
    final data = _createSampleData();

    Widget buildSubject({
      bool showAreaElement = false,
      bool showAnnotations = true,
      double selectedPointRadius = AppSpacing.sm,
      void Function(int)? onPointSelected,
      void Function({
        required bool show,
        required Offset position,
      })? onShowTooltip,
    }) {
      return LineChartBody(
        data: data,
        showAreaElement: showAreaElement,
        showAnnotations: showAnnotations,
        selectedPointRadius: selectedPointRadius,
        onPointSelected: onPointSelected,
        onShowTooltip: onShowTooltip,
      );
    }

    testWidgets(
      'calls onPointSelected when a point is selected',
      (tester) async {
        final completer = Completer<int>();

        await tester.pumpExperience(
          buildSubject(onPointSelected: completer.complete),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byType(LineChartBody));
        await tester.pumpAndSettle();

        expect(completer.isCompleted, isTrue);
      },
    );

    testWidgets(
      'calls onShowTooltip when a point is selected',
      (tester) async {
        var showTooltip = false;

        await tester.pumpWidget(
          buildSubject(
            onShowTooltip: ({required position, required show}) {
              showTooltip = show;
            },
          ),
        );

        final gesture = await tester.startGesture(
          tester.getCenter(
            find.byType(LineChartBody),
          ),
        );

        await gesture.moveTo(const Offset(0, 50));
        await tester.pumpAndSettle();

        expect(showTooltip, isTrue);

        await gesture.up();
        await tester.pumpAndSettle();

        expect(showTooltip, isFalse);
      },
    );
  });
}
