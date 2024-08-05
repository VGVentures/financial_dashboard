part of 'financial_data_bloc.dart';

class FinancialDataState extends Equatable {
  const FinancialDataState({
    this.currentSavings = 0,
    this.savingsDataPoints = const [],
    this.monthlySpendingGoal = 0,
    this.transactions = const [],
  });

  final double currentSavings;
  final List<SavingsDataPoint> savingsDataPoints;
  final double monthlySpendingGoal;
  final List<Transaction> transactions;

  FinancialDataState copyWith({
    double? currentSavings,
    List<SavingsDataPoint>? savingsDataPoints,
    double? monthlySpendingGoal,
    List<Transaction>? transactions,
  }) {
    return FinancialDataState(
      currentSavings: currentSavings ?? this.currentSavings,
      savingsDataPoints: savingsDataPoints ?? this.savingsDataPoints,
      monthlySpendingGoal: monthlySpendingGoal ?? this.monthlySpendingGoal,
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  List<Object> get props => [
        currentSavings,
        savingsDataPoints,
        monthlySpendingGoal,
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
