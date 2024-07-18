import 'package:equatable/equatable.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';

enum TransactionType { income, spendings }

class Transaction extends Equatable {
  const Transaction({
    required this.type,
    required this.title,
    required this.amount,
  });

  final TransactionType type;
  final String title;
  final String amount;

  @override
  List<Object> get props => [type, title, amount];
}

class TransactionsTable extends StatelessWidget {
  const TransactionsTable({
    super.key,
    this.titleStyle,
  });

  final TextStyle? titleStyle;

  static const _transactions = <Transaction>[
    Transaction(
      type: TransactionType.income,
      title: 'Paycheck',
      amount: r'+$3,000',
    ),
    Transaction(
      type: TransactionType.spendings,
      title: 'Rent',
      amount: r'-$1,000',
    ),
    Transaction(
      type: TransactionType.spendings,
      title: 'Food',
      amount: r'-$800',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.transactionsTitle,
          style: titleStyle,
        ),
        const SizedBox(height: AppSpacing.xs),
        ...ListTile.divideTiles(
          context: context,
          color: colorScheme.surfaceContainerHighest,
          tiles: [
            for (final transaction in _transactions)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(transaction.title),
                subtitle: DefaultTextStyle(
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onSurfaceVariant.withOpacity(0.8),
                  ),
                  child: transaction.type == TransactionType.income
                      ? Text(l10n.incomeTransactionLabel)
                      : Text(l10n.spendingsTransactionLabel),
                ),
                trailing: Text(
                  transaction.amount,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
