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

enum TransactionType {
  paycheck(4000, 5500),
  rent(1000, 2000),
  groceries(320, 500),
  car(350, 600),
  gym(40, 90),
  other(200, 350);

  const TransactionType(this.min, this.max);

  final int min;
  final int max;
}

extension TransactionTypeX on TransactionType {
  List<TransactionType> get incomeTypes => [TransactionType.paycheck];

  double amount(Random random) {
    final value = random.nextDouble() * (max - min) + min;

    if (incomeTypes.contains(this)) return value;
    return -value;
  }

  String title(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case TransactionType.paycheck:
        return l10n.paycheck;
      case TransactionType.groceries:
        return l10n.groceries;
      case TransactionType.rent:
        return l10n.rent;
      case TransactionType.car:
        return l10n.car;
      case TransactionType.gym:
        return l10n.gym;
      case TransactionType.other:
        return l10n.other;
    }
  }
}

class Transaction extends Equatable {
  const Transaction({
    required this.type,
    required this.amount,
  });

  final TransactionType type;
  final double amount;

  @override
  List<Object?> get props => [type, amount];
}

extension TransactionListX on List<Transaction> {
  List<Transaction> get expenses =>
      where((element) => element.amount < 0).toList();

  double get spent =>
      expenses.fold(0, (value, element) => value + element.amount);
}
