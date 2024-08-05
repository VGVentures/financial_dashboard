import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsTable extends StatelessWidget {
  const TransactionsTable({
    super.key,
    this.titleStyle,
  });

  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final transactions = context.select(
      (FinancialDataBloc bloc) => bloc.state.transactions,
    );

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
            for (final transaction in transactions)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(transaction.title),
                subtitle: DefaultTextStyle(
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onSurfaceVariant.withOpacity(0.8),
                  ),
                  child: transaction.amount > 0
                      ? Text(l10n.incomeTransactionLabel)
                      : Text(l10n.expenseTransactionLabel),
                ),
                trailing: Text(
                  transaction.amount.toCurrencyWithoutDecimal(),
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
