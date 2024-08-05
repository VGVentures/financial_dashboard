import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RetirementPredictionChart extends StatelessWidget {
  RetirementPredictionChart({
    super.key,
    this.showAreaElement = false,
    this.showAnnotations = false,
    this.selectedPointRadius = AppSpacing.sm,
  });

  final bool showAreaElement;
  final bool showAnnotations;
  final double selectedPointRadius;

  final _showTooltip = ValueNotifier<bool>(false);
  final _selectedPoint = ValueNotifier<LineChartPoint?>(null);
  final _tooltipPosition = ValueNotifier<Offset?>(null);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final data = context
        .select((FinancialDataBloc bloc) => bloc.state.savingsDataPoints);
    final mappedData = data
        .map(
          (e) => LineChartPoint(
            age: e.age.toString(),
            value: e.value,
          ),
        )
        .toList();

    if (data.isEmpty) {
      return SizedBox(
        height: 200,
        child: Center(child: Text(l10n.noDataAvailable)),
      );
    }

    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: LineChartBody(
            data: mappedData,
            showAreaElement: showAreaElement,
            showAnnotations: showAnnotations,
            selectedPointRadius: selectedPointRadius,
            onPointSelected: (value) {
              final point = mappedData.elementAt(value);
              _selectedPoint.value = point;
            },
            onShowTooltip: ({required position, required show}) {
              _showTooltip.value = show;
              _tooltipPosition.value = position;
            },
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _showTooltip,
          builder: (context, value, child) {
            return Visibility(
              visible: value,
              child: child!,
            );
          },
          child: LayoutBuilder(
            key: const Key('chart_tooltip'),
            builder: (context, constraints) {
              return ValueListenableBuilder(
                valueListenable: _tooltipPosition,
                builder: (context, value, child) {
                  return Container(
                    alignment: Alignment.lerp(
                      Alignment.centerLeft,
                      Alignment.centerRight,
                      ((value?.dx ?? 0) / constraints.maxWidth).clamp(0, 1),
                    ),
                    child: child,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppSpacing.xs),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: _selectedPoint,
                    builder: (context, selectedPoint, child) {
                      if (selectedPoint == null) {
                        return const SizedBox.shrink();
                      }
                      return Text(
                        selectedPoint.value.toCurrencyWithoutDecimal(),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
