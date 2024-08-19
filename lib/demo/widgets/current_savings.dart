import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentSavings extends StatefulWidget {
  const CurrentSavings({
    super.key,
  });

  @override
  State<CurrentSavings> createState() => _CurrentSavingsState();
}

class _CurrentSavingsState extends State<CurrentSavings>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final currentSavings = context.select(
      (FinancialDataBloc bloc) => bloc.state.currentSavings,
    );

    _animation = Tween<double>(begin: 0, end: currentSavings).animate(
      _controller,
    );

    _controller.forward();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final value = _animation.value;
            return Text(
              value.toCurrencyWithoutDecimal(),
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
