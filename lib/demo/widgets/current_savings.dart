import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrentSavings extends StatelessWidget {
  const CurrentSavings({
    required this.savings,
    super.key,
  });

  final ValueListenable<String?> savings;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: savings,
          builder: (context, value, child) {
            return Text(
              '\$${value ?? ''}',
              style: textTheme.displayMedium,
            );
          },
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
