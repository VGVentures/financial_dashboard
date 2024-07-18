import 'package:financial_dashboard/demo/demo.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';

class AppThree extends StatelessWidget {
  const AppThree({super.key});

  static final _currentSavings = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return AppScaffold(
      showTitleInAppBar: true,
      predictionChart: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrentSavings(savings: _currentSavings),
              const SizedBox(height: AppSpacing.md),
              RetirementPredicitionChart(
                showAreaElement: true,
                selectedPointRadius: AppSpacing.xs,
                onCurrentSavings: (value) => _currentSavings.value = value,
              ),
            ],
          ),
        ),
      ),
      goalStats: SizedBox(
        height: AppSpacing.xxxlg + AppSpacing.lg,
        child: Row(
          children: [
            Card(
              color: colorScheme.primaryContainer,
              child: const Padding(
                padding: EdgeInsets.all(AppSpacing.sm),
                child: GoalProgressIndicator(isGradient: true),
              ),
            ),
            const SizedBox(width: AppSpacing.xlg),
            const Expanded(
              child: MonthlyGoal(amount: r'$1,125.00'),
            )
          ],
        ),
      ),
      transactions: Card(
        color: colorScheme.onTertiary,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.md,
          ),
          child: TransactionsTable(
            titleStyle: textTheme.titleMedium?.copyWith(
              fontWeight: AppFontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
