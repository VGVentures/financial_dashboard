import 'dart:async';

import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart' hide TextDirection;

typedef ShowTooltip = void Function({
  required bool show,
  required Offset position,
});

class LineChartBody extends StatefulWidget {
  const LineChartBody({
    required this.data,
    required this.showAreaElement,
    required this.showAnnotations,
    required this.selectedPointRadius,
    super.key,
    this.onPointSelected,
    this.onShowTooltip,
  });

  final List<LineChartPoint> data;
  final bool showAreaElement;
  final bool showAnnotations;
  final double selectedPointRadius;
  final ValueChanged<int>? onPointSelected;
  final ShowTooltip? onShowTooltip;

  @override
  State<LineChartBody> createState() => _LineChartBodyState();
}

class _LineChartBodyState extends State<LineChartBody> {
  static const _touchMoveSignalName = 'touchMove';

  late final StreamController<Map<String, Set<int>>?> _selectionChannel;
  late final StreamController<GestureEvent> _gestureStream;

  @override
  void initState() {
    super.initState();
    _selectionChannel = StreamController.broadcast();
    _selectionChannel.stream.listen(_onSelectionChannelUpdate);
    _selectionChannel.add({
      _touchMoveSignalName: {0},
    });

    _gestureStream = StreamController.broadcast();
    _gestureStream.stream.listen(_onGestureStreamUpdate);
  }

  void _onSelectionChannelUpdate(Map<String, Set<int>>? selections) {
    final touchMove = selections?[_touchMoveSignalName];
    if (touchMove != null &&
        touchMove.length == 1 &&
        widget.onPointSelected != null) {
      widget.onPointSelected!(touchMove.single);
    }
  }

  void _onGestureStreamUpdate(GestureEvent signal) {
    final gesture = signal.gesture;
    final type = gesture.type;
    final position = gesture.localPosition;

    if (widget.onShowTooltip != null) {
      if (type == GestureType.scaleUpdate ||
          type == GestureType.tapDown ||
          type == GestureType.longPressMoveUpdate) {
        widget.onShowTooltip!(show: true, position: position);
      } else if (type == GestureType.scaleEnd ||
          type == GestureType.tapUp ||
          type == GestureType.longPressUp) {
        widget.onShowTooltip!(show: false, position: position);
      }
    }
  }

  @override
  void dispose() {
    _selectionChannel.close();
    _gestureStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final strokeStyle = PaintStyle(
      strokeColor: colorScheme.onSurface.withOpacity(0.1),
    );

    return Chart<LineChartPoint>(
      data: widget.data,
      gestureStream: _gestureStream,
      variables: {
        'age': Variable<LineChartPoint, String>(
          accessor: (point) => point.age,
          scale: OrdinalScale(
            ticks: ['30', '45', '60', '75', '90'],
          ),
        ),
        'value': Variable<LineChartPoint, num>(
          accessor: (point) => point.value,
          scale: LinearScale(
            min: 100000,
            ticks: [100000, 300000, 500000],
            formatter: (value) {
              final numberFormat = NumberFormat.compact();

              return '\$${numberFormat.format(value)}';
            },
          ),
        ),
      },
      marks: [
        LineMark(
          color: ColorEncode(
            value: colorScheme.primary,
          ),
          selected: {
            _touchMoveSignalName: {0},
          },
          selectionStream: _selectionChannel,
        ),
        if (widget.showAreaElement)
          AreaMark(
            gradient: GradientEncode(
              value: LinearGradient(
                begin: const Alignment(0, -5),
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.primary,
                  colorScheme.primary.withOpacity(0),
                ],
              ),
            ),
          ),
      ],
      axes: [
        AxisGuide(
          line: strokeStyle,
          label: LabelStyle(
            textStyle: textTheme.labelSmall,
            offset: const Offset(0, AppSpacing.xs + AppSpacing.xxs),
          ),
        ),
        AxisGuide(
          grid: strokeStyle,
          label: LabelStyle(
            textStyle: textTheme.labelSmall,
            offset: const Offset(-(AppSpacing.xs + AppSpacing.xxs), 0),
          ),
        ),
      ],
      annotations: [
        if (widget.showAnnotations) ...[
          TagAnnotation(
            label: Label(
              'Age',
              LabelStyle(
                textStyle: textTheme.labelSmall,
                align: Alignment.centerRight,
              ),
            ),
            anchor: (size) => Offset(
              AppSpacing.lg,
              size.height - (AppSpacing.xs + AppSpacing.xxs),
            ),
          ),
        ],
      ],
      selections: {
        _touchMoveSignalName: PointSelection(
          on: {
            GestureType.scaleUpdate,
            GestureType.tapDown,
            GestureType.longPressMoveUpdate,
          },
          dim: Dim.x,
        ),
      },
      tooltip: TooltipGuide(
        renderer: (size, anchor, __) {
          return [
            _TooltipFigure(
              anchor: anchor,
              size: size,
              radius: widget.selectedPointRadius,
              showLine: widget.showAreaElement,
              colorScheme: colorScheme,
              style: PaintStyle(),
            ),
          ];
        },
      ),
    );
  }
}

class _TooltipFigure extends MarkElement {
  _TooltipFigure({
    required this.anchor,
    required this.size,
    required this.radius,
    required this.showLine,
    required this.colorScheme,
    required super.style,
  });

  final Offset anchor;
  final Size size;
  final double radius;
  final bool showLine;
  final ColorScheme colorScheme;

  @override
  void paint(Canvas canvas) {
    if (showLine) {
      canvas.drawLine(
        Offset(anchor.dx, 0),
        Offset(anchor.dx, size.height),
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.5, 0.9],
            colors: [
              colorScheme.onSurface.withOpacity(0.01),
              colorScheme.onSurface,
              colorScheme.onSurface.withOpacity(0.01),
            ],
          ).createShader(
            Rect.fromPoints(
              Offset(anchor.dx, 0),
              Offset(anchor.dx, size.height),
            ),
          ),
      );
    }

    canvas.drawCircle(
      Offset(anchor.dx, anchor.dy),
      radius,
      Paint()..color = colorScheme.secondary,
    );
  }

  // TODO(Oscar): research why now these methods
  // are required but example is still working
  // coverage:ignore-start
  @override
  void draw(Canvas canvas) {}

  @override
  MarkElement<ElementStyle> lerpFrom(
    covariant MarkElement<ElementStyle> from,
    double t,
  ) {
    throw UnimplementedError();
  }
  // coverage:ignore-end
}
