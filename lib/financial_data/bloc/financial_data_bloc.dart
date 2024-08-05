import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'financial_data_event.dart';
part 'financial_data_state.dart';

class FinancialDataBloc extends Bloc<FinancialDataEvent, FinancialDataState> {
  FinancialDataBloc() : super(const FinancialDataState()) {
    on<FinancialDataRequested>(_onLoadFinancialData);
  }

  Future<void> _onLoadFinancialData(
    FinancialDataRequested event,
    Emitter<FinancialDataState> emit,
  ) async {
    emit(
      state.copyWith(
        currentSavings: 234567.91,
        savingsDataPoints: createSampleData(),
        monthlySpendingLimitGoal: 3210.55,
        transactions: [
          const Transaction(title: 'Paycheck', amount: 3000),
          const Transaction(title: 'Rent', amount: -1050.20),
          const Transaction(title: 'Food', amount: -670.50),
        ],
      ),
    );
  }
}

@visibleForTesting
List<SavingsDataPoint> createSampleData() {
  final data = <SavingsDataPoint>[];
  var value = 100000.0;
  for (var age = 25; age <= 90; age++) {
    const toAdd = 10000;
    value += toAdd;
    data.add(
      SavingsDataPoint(age: age, value: value),
    );
  }
  return data;
}
