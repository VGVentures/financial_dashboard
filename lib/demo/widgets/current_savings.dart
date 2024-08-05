import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentSavings extends StatelessWidget {
  const CurrentSavings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final currentSavings = context.select(
      (FinancialDataBloc bloc) => bloc.state.currentSavings,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentSavings.toCurrencyWithoutDecimal(),
          style: textTheme.displayMedium,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          l10n.currentSavingsLabel,
          style: textTheme.labelMedium,
        ),
      ],
    );
  }
}
