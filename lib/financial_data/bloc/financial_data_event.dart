part of 'financial_data_bloc.dart';

sealed class FinancialDataEvent extends Equatable {
  const FinancialDataEvent();

  @override
  List<Object> get props => [];
}

class FinancialDataRequested extends FinancialDataEvent {
  const FinancialDataRequested();
}
