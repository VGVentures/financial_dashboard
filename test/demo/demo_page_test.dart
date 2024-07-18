import 'package:financial_dashboard/demo/demo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('DemoPage', () {
    testWidgets('renders three DeviceFrames', (tester) async {
      await tester.pumpExperience(const DemoPage());
      expect(find.byType(DeviceFrame), findsNWidgets(3));
    });
  });
}
