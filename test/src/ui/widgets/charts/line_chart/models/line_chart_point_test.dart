import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LineChartPoint', () {
    test('supports value equality', () {
      const pointA = LineChartPoint(age: '25', value: 100);
      const secondPointA = LineChartPoint(age: '25', value: 100);
      const pointB = LineChartPoint(age: '52', value: 200);

      expect(pointA, equals(secondPointA));
      expect(pointA, isNot(equals(pointB)));
    });
  });
}
