import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinancialDataRequested', () {
    test('supports value equality', () {
      final eventA = FinancialDataRequested();
      final eventB = FinancialDataRequested();

      expect(eventA, equals(eventB));
    });
  });
}
