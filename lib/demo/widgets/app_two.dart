import 'package:financial_dashboard/demo/demo.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';

class AppTwo extends StatelessWidget {
  const AppTwo({super.key});

  static final _currentSavings = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    const spacing = AppSpacing.xxlg * 2;

    return AppScaffold(
      extendBodyBehindAppBar: true,
      titlePadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xlg,
      ),
      predictionChart: ColoredBox(
        color: colorScheme.onPrimary,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: colorScheme.surface,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xlg,
                  ),
                  child: RetirementPredictionChart(
                    onCurrentSavings: (value) => _currentSavings.value = value,
                  ),
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
                  color: colorScheme.onPrimary,
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
                  child: CurrentSavings(savings: _currentSavings),
                ),
              ),
            ),
          ],
        ),
      ),
      transactions: Container(
        color: colorScheme.onPrimary,
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
