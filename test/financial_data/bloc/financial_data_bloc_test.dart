import 'dart:math' show Random;

import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRandom extends Mock implements Random {}

void main() {
  group('FinancialDataBloc', () {
    late Random random;

    setUp(() {
      random = _MockRandom();

      when(() => random.nextInt(any())).thenReturn(0);
      when(() => random.nextDouble()).thenReturn(0);
    });

    blocTest<FinancialDataBloc, FinancialDataState>(
      'loads financial data when $FinancialDataRequested is added',
      build: () => FinancialDataBloc(random: random),
      act: (bloc) => bloc.add(FinancialDataRequested()),
      expect: () => [
        FinancialDataState(
          currentSavings: 100000,
          savingsDataPoints: createSampleData(random: random),
          monthlySpendingLimitGoal: 3000,
          transactions: createSampleTransactions(random: random),
        ),
      ],
    );
  });
}
