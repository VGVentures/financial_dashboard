import 'dart:math';

import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<LineChartPoint> _createSampleData() {
  final data = <LineChartPoint>[];
  var value = 100000.0;
  for (var age = 25; age <= 90; age++) {
    final toAdd = Random().nextInt(13000);
    value += toAdd;
    data.add(
      LineChartPoint(
        age: age.toString(),
        value: value,
      ),
    );
  }
  return data;
}

class RetirementPredictionChart extends StatefulWidget {
  const RetirementPredictionChart({
    required this.onCurrentSavings,
    super.key,
    this.showAreaElement = false,
    this.showAnnotations = false,
    this.selectedPointRadius = AppSpacing.sm,
  });

  final ValueChanged<String> onCurrentSavings;
  final bool showAreaElement;
  final bool showAnnotations;
  final double selectedPointRadius;

  @override
  State<RetirementPredictionChart> createState() =>
      _RetirementPredictionChartState();
}

class _RetirementPredictionChartState extends State<RetirementPredictionChart> {
  late final List<LineChartPoint> _sampleData;

  final _showTooltip = ValueNotifier<bool>(false);
  final _selectedPoint = ValueNotifier<LineChartPoint?>(null);
  final _tooltipPosition = ValueNotifier<Offset?>(null);

  @override
  void initState() {
    super.initState();
    _sampleData = _createSampleData();

    final sampleValue = _sampleData[20].value;
    final currentSavings = NumberFormat('###,###').format(sampleValue);
    widget.onCurrentSavings(currentSavings);
  }

  String _defaultValueFormat(double value) =>
      '\$${NumberFormat('###,###').format(value)}';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: LineChartBody(
            data: _sampleData,
            showAreaElement: widget.showAreaElement,
            showAnnotations: widget.showAnnotations,
            selectedPointRadius: widget.selectedPointRadius,
            onPointSelected: (value) {
              final point = _sampleData.elementAt(value);
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
                    builder: (context, value, child) {
                      return Text(
                        _defaultValueFormat(_selectedPoint.value?.value ?? 0),
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
