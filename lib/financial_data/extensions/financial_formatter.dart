import 'package:intl/intl.dart';

extension FinancialFormatterX on double {
  String toCurrencyWithoutDecimal() =>
      '\$${NumberFormat('###,###').format(this)}';

  String toCurrencyWithDecimals() =>
      '\$${NumberFormat('###,###.00').format(this)}';
}
