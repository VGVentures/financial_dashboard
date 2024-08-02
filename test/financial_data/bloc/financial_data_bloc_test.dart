import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinancialDataBloc', () {
    testBloc<FinancialDataBloc, FinancialDataState>(
      build: FinancialDataBloc.new,
      act: (bloc) => bloc.add(FinancialDataRequested()),
      expect: () => [
        FinancialDataState(
          currentSavings: 234567.91,
          savingsDataPoints: createSampleData(),
          monthlySpendingGoal: 3210.55,
          transactions: [
            const Transaction(name: 'Paycheck', amount: 3000),
            const Transaction(name: 'Rent', amount: 1050.20),
            const Transaction(name: 'Food', amount: 670.50),
          ],
        ),
      ],
    );
  });
}
