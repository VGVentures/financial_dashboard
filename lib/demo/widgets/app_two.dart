import 'package:financial_dashboard/demo/demo.dart';
import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTwo extends StatelessWidget {
  const AppTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    const spacing = AppSpacing.xxlg * 2;

    return AppScaffold(
      onRefresh: () async {
        context.read<FinancialDataBloc>().add(const FinancialDataRequested());
      },
      extendBodyBehindAppBar: true,
      titlePadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xlg,
      ),
      predictionChart: SizedBox(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: AppSpacing.xlg,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSpacing.xlg),
                      topRight: Radius.circular(AppSpacing.xlg),
                    ),
                  ),
                ),
                Container(
                  color: colorScheme.surface,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xlg,
                  ),
                  child: RetirementPredictionChart(),
                ),
                Container(
                  height: spacing,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(AppSpacing.xlg),
                      bottomRight: Radius.circular(AppSpacing.xlg),
                    ),
                  ),
                ),
                Container(
                  height: spacing / 1.5,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: AppSpacing.xlg,
              right: AppSpacing.xlg,
              child: Material(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(AppSpacing.xlg),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.lg,
                  ),
                  child: const CurrentSavings(),
                ),
              ),
            ),
          ],
        ),
      ),
      transactions: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xlg,
        ).copyWith(
          top: AppSpacing.lg,
        ),
        child: Card(
          elevation: 0,
          color: colorScheme.tertiaryContainer.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.md,
            ),
            child: TransactionsTable(
              titleStyle: textTheme.headlineLarge,
            ),
          ),
        ),
      ),
    );
  }
}
