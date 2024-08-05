import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonthlyGoal extends StatelessWidget {
  const MonthlyGoal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final monthlySpendingLimitGoal = context.select(
      (FinancialDataBloc bloc) => bloc.state.monthlySpendingLimitGoal,
    );

    return Card(
      elevation: 0,
      color: colorScheme.inversePrimary.withOpacity(0.6),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: DefaultTextStyle(
                style: textTheme.displaySmall!,
                child: Text(monthlySpendingLimitGoal.toCurrencyWithDecimals()),
              ),
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              l10n.monthlySpendingLimitGoal,
              style: textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
