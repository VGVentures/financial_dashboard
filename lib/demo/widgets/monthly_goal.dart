import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';

class MonthlyGoal extends StatelessWidget {
  const MonthlyGoal({
    required this.amount,
    super.key,
  });

  final String amount;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

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
                child: Text(amount),
              ),
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              l10n.monthlyGoalLabel,
              style: textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
