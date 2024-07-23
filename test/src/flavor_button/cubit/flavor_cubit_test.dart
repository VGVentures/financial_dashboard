import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/flavor_button/cubit/flavor_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlavorCubit', () {
    blocTest<FlavorCubit, AppFlavor>(
      'initial state is AppFlavor.one',
      build: FlavorCubit.new,
      verify: (cubit) => expect(cubit.state, AppFlavor.one),
    );

    blocTest<FlavorCubit, AppFlavor>(
      'select method changes AppFlavor',
      build: FlavorCubit.new,
      act: (cubit) => cubit.select(AppFlavor.two),
      expect: () => [AppFlavor.two],
    );
  });
}
