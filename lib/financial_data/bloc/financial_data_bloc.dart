import 'dart:math' show Random;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:flutter/widgets.dart';

part 'financial_data_event.dart';
part 'financial_data_state.dart';

class FinancialDataBloc extends Bloc<FinancialDataEvent, FinancialDataState> {
  FinancialDataBloc({
    Random? random,
  })  : _random = random ?? Random(),
        super(const FinancialDataState()) {
    on<FinancialDataRequested>(_onLoadFinancialData);
  }

  final Random _random;

  Future<void> _onLoadFinancialData(
    FinancialDataRequested event,
    Emitter<FinancialDataState> emit,
  ) async {
    final savingsDataPoints = createSampleData(random: _random);
    final index = _random.nextInt(savingsDataPoints.length);
    final currentSavings = savingsDataPoints[index].value;
    final monthlySpendingLimitGoal = (_random.nextDouble() * 1000) + 3000;

    emit(
      state.copyWith(
        currentSavings: currentSavings,
        savingsDataPoints: savingsDataPoints,
        monthlySpendingLimitGoal: monthlySpendingLimitGoal,
        transactions: createSampleTransactions(random: _random),
      ),
    );
  }
}

@visibleForTesting
List<SavingsDataPoint> createSampleData({Random? random}) {
  random ??= Random();

  final data = <SavingsDataPoint>[];
  var value = 100000.0;
  for (var age = 25; age <= 90; age++) {
    final toAdd = random.nextInt(12000);
    value += toAdd;
    data.add(
      SavingsDataPoint(age: age, value: value),
    );
  }
  return data;
}

@visibleForTesting
List<Transaction> createSampleTransactions({Random? random}) {
  random ??= Random();

  return TransactionType.values
      .map((type) => Transaction(type: type, amount: type.amount(random!)))
      .toList();
}
