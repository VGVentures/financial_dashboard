import 'package:financial_dashboard/demo/demo.dart';
import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppOne extends StatelessWidget {
  const AppOne({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return AppScaffold(
      onRefresh: () async {
        context.read<FinancialDataBloc>().add(const FinancialDataRequested());
      },
      predictionChart: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CurrentSavings(),
              const SizedBox(height: AppSpacing.md),
              RetirementPredictionChart(
                showAnnotations: true,
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
                child: GoalProgressIndicator(),
              ),
            ),
            const SizedBox(width: AppSpacing.xlg),
            const Expanded(
              child: MonthlyGoal(),
            ),
          ],
        ),
      ),
      transactions: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.md,
          ),
          child: TransactionsTable(
            titleStyle: textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
