import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinancialDataState', () {
    test('supports value equality', () {
      expect(FinancialDataState(), equals(FinancialDataState()));
    });

    group('copyWith', () {
      test('copies currentSavings', () {
        final state = FinancialDataState();
        final newState = state.copyWith(currentSavings: 123.45);

        expect(newState.currentSavings, 123.45);
      });

      test('copies savingsDataPoints', () {
        final state = FinancialDataState();
        final dataPoint = SavingsDataPoint(age: 25, value: 100);
        final newState = state.copyWith(savingsDataPoints: [dataPoint]);

        expect(newState.savingsDataPoints, equals([dataPoint]));
      });

      test('copies monthlySpendingGoal', () {
        final state = FinancialDataState();
        final newState = state.copyWith(monthlySpendingGoal: 123.45);

        expect(newState.monthlySpendingGoal, 123.45);
      });

      test('copies transactions', () {
        final state = FinancialDataState();
        final transaction = Transaction(name: 'test', amount: 123.45);
        final newState = state.copyWith(transactions: [transaction]);

        expect(newState.transactions, equals([transaction]));
      });
    });
  });

  group('SavingsDataPoint', () {
    test('supports value equality', () {
      const pointA = SavingsDataPoint(age: 25, value: 100);
      const secondPointA = SavingsDataPoint(age: 25, value: 100);
      const pointB = SavingsDataPoint(age: 52, value: 200);

      expect(pointA, equals(secondPointA));
      expect(pointA, isNot(equals(pointB)));
    });
  });

  group('Transaction', () {
    test('supports value equality', () {
      const pointA = Transaction(name: 'test', amount: 100);
      const secondPointA = Transaction(name: 'test', amount: 100);
      const pointB = Transaction(name: 'test-two', amount: 200);

      expect(pointA, equals(secondPointA));
      expect(pointA, isNot(equals(pointB)));
    });
  });
}