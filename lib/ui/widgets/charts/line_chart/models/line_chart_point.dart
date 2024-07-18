import 'package:equatable/equatable.dart';

class LineChartPoint extends Equatable {
  const LineChartPoint({
    required this.age,
    required this.value,
  });

  final String age;
  final double value;

  @override
  List<Object?> get props => [age, value];
}
