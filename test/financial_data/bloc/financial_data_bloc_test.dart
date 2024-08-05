import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinancialDataBloc', () {
    blocTest<FinancialDataBloc, FinancialDataState>(
      'loads financial data when $FinancialDataRequested is added',
      build: FinancialDataBloc.new,
      act: (bloc) => bloc.add(FinancialDataRequested()),
      expect: () => [
        FinancialDataState(
          currentSavings: 234567.91,
          savingsDataPoints: createSampleData(),
          monthlySpendingLimitGoal: 3210.55,
          transactions: [
            const Transaction(title: 'Paycheck', amount: 3000),
            const Transaction(title: 'Rent', amount: -1050.20),
            const Transaction(title: 'Food', amount: -670.50),
          ],
        ),
      ],
    );
  });
}
