import 'package:intl/intl.dart';

extension FinancialFormatterX on double {
  String toCurrencyWithoutDecimal() =>
      NumberFormat.currency(decimalDigits: 0, symbol: r'$').format(this);

  String toCurrencyWithDecimals() =>
      NumberFormat.currency(decimalDigits: 2, symbol: r'$').format(this);
}
