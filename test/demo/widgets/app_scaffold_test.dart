import 'package:financial_dashboard/demo/demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('$AppScaffold', () {
    Widget buildSubject() {
      return const AppScaffold(
        predictionChart: SizedBox(),
        goalStats: SizedBox(),
        transactions: ListTile(title: Text('Hello, transactions')),
      );
    }

    testWidgets('pulls to refresh', (tester) async {
      tester.view.physicalSize = const Size(2048, 2048);

      final handle = tester.ensureSemantics();

      await tester.pumpExperience(buildSubject());
      await tester.pumpAndSettle();

      expect(find.byType(AppScaffold), findsOneWidget);

      final widgetToFling = find.byType(ListTile).first;
      expect(widgetToFling, findsOneWidget);

      await tester.ensureVisible(widgetToFling);
      await tester.pumpAndSettle();

      await tester.fling(widgetToFling, const Offset(0, 500), 1000);

      await tester.pump();

      // Verify we are actually refreshing.
      // See https://guillaume.bernos.dev/properly-test-a-pull-to-refresh/
      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );

      // Finish the scroll animation
      await tester.pump(const Duration(seconds: 1));
      // Finish the indicator settle animation
      await tester.pump(const Duration(seconds: 1));
      // Finish the indicator hide animation
      await tester.pump(const Duration(seconds: 1));

      handle.dispose();
    });
  });
}
