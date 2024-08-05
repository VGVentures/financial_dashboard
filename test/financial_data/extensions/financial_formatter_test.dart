import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinancialFormatterX', () {
    test('converts double to currency without decimals', () {
      expect(
        123456.789.toCurrencyWithoutDecimal(),
        r'$123,457',
      );
    });

    test('converts double to currency with decimals', () {
      expect(
        123456.789.toCurrencyWithDecimals(),
        r'$123,456.79',
      );
    });
  });
}
