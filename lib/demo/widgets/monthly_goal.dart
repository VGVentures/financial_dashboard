import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonthlyGoal extends StatefulWidget {
  const MonthlyGoal({
    super.key,
  });

  @override
  State<MonthlyGoal> createState() => _MonthlyGoalState();
}

class _MonthlyGoalState extends State<MonthlyGoal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    final state = context.read<FinancialDataBloc>().state;
    _animation = Tween<double>(
      begin: 0,
      end: state.monthlySpendingLimitGoal,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return BlocListener<FinancialDataBloc, FinancialDataState>(
      listenWhen: (previous, current) =>
          previous.monthlySpendingLimitGoal != current.monthlySpendingLimitGoal,
      listener: (context, state) {
        _animation = Tween<double>(
          begin: 0,
          end: state.monthlySpendingLimitGoal,
        ).animate(_controller);

        _controller
          ..reset()
          ..forward();
      },
      child: Card(
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
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      final value = _animation.value;
                      return Text(value.toCurrencyWithDecimals());
                    },
                  ),
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
      ),
    );
  }
}
