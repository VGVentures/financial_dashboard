import 'package:financial_dashboard/flavor_button/flavor_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('FlavorButton', () {
    Widget buildSubject(AppFlavor flavor) => Scaffold(
          body: FlavorButton(
            flavor: flavor,
          ),
        );

    late FlavorCubit flavorCubit;

    setUp(() {
      flavorCubit = MockFlavorCubit();
    });

    testWidgets(
      'renders solid icon when it is current flavor',
      (tester) async {
        when(() => flavorCubit.state).thenReturn(AppFlavor.one);
        await tester.pumpExperience(
          BlocProvider.value(
            value: flavorCubit,
            child: buildSubject(AppFlavor.one),
          ),
        );

        expect(find.byIcon(Icons.looks_one), findsOneWidget);
      },
    );

    testWidgets(
      'renders outlined icon when it is not current flavor',
      (tester) async {
        when(() => flavorCubit.state).thenReturn(AppFlavor.two);
        await tester.pumpExperience(
          BlocProvider.value(
            value: flavorCubit,
            child: buildSubject(AppFlavor.one),
          ),
        );

        expect(find.byIcon(Icons.looks_one_outlined), findsOneWidget);
      },
    );

    testWidgets(
      'sets the new AppFlavor on tap',
      (tester) async {
        when(() => flavorCubit.state).thenReturn(AppFlavor.two);
        await tester.pumpExperience(
          BlocProvider.value(
            value: flavorCubit,
            child: buildSubject(AppFlavor.one),
          ),
        );

        await tester.tap(find.byType(InkWell));
        verify(() => flavorCubit.select(AppFlavor.one)).called(1);
      },
    );
  });
}
