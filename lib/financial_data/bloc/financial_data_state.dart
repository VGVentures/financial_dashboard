part of 'financial_data_bloc.dart';

class FinancialDataState extends Equatable {
  const FinancialDataState({
    this.currentSavings = 0,
    this.savingsDataPoints = const [],
    this.monthlySpendingLimitGoal = 0,
    this.transactions = const [],
  });

  final double currentSavings;
  final List<SavingsDataPoint> savingsDataPoints;
  final double monthlySpendingLimitGoal;
  final List<Transaction> transactions;

  FinancialDataState copyWith({
    double? currentSavings,
    List<SavingsDataPoint>? savingsDataPoints,
    double? monthlySpendingLimitGoal,
    List<Transaction>? transactions,
  }) {
    return FinancialDataState(
      currentSavings: currentSavings ?? this.currentSavings,
      savingsDataPoints: savingsDataPoints ?? this.savingsDataPoints,
      monthlySpendingLimitGoal:
          monthlySpendingLimitGoal ?? this.monthlySpendingLimitGoal,
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  List<Object> get props => [
        currentSavings,
        savingsDataPoints,
        monthlySpendingLimitGoal,
        transactions,
      ];
}

class SavingsDataPoint extends Equatable {
  const SavingsDataPoint({
    required this.age,
    required this.value,
  });

  final int age;
  final double value;

  @override
  List<Object?> get props => [age, value];
}

class Transaction extends Equatable {
  const Transaction({
    required this.name,
    required this.amount,
  });

  final String name;
  final double amount;

  @override
  List<Object?> get props => [name, amount];
}

extension TransactionListX on List<Transaction> {
  List<Transaction> get expenses =>
      where((element) => element.amount < 0).toList();

  double get spent =>
      expenses.fold(0, (value, element) => value + element.amount);
}
