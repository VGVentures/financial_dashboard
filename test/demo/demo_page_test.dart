import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/demo/demo.dart';
import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/flavor_button/flavor_button.dart';
import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/helpers.dart';

class _MockFinancialDataBloc
    extends MockBloc<FinancialDataEvent, FinancialDataState>
    implements FinancialDataBloc {}

void main() {
  group('DemoPage', () {
    testWidgets('renders DemoView', (tester) async {
      await tester.pumpExperience(const DemoPage());
      expect(find.byType(DemoView), findsOneWidget);
    });
  });

  group('DemoView', () {
    late FlavorCubit flavorCubit;
    late ThemeModeCubit themeModeCubit;
    late FinancialDataBloc financialDataBloc;

    setUp(() {
      flavorCubit = MockFlavorCubit();
      themeModeCubit = MockThemeModeCubit();
      financialDataBloc = _MockFinancialDataBloc();

      when(() => themeModeCubit.state).thenReturn(ThemeMode.light);
      when(() => financialDataBloc.state)
          .thenReturn(const FinancialDataState());
    });

    testWidgets('renders AppOne when AppFlavor is one', (tester) async {
      when(() => flavorCubit.state).thenReturn(AppFlavor.one);
      await tester.pumpExperience(
        const DemoView(),
        flavorCubit: flavorCubit,
        themeModeCubit: themeModeCubit,
        financialDataBloc: financialDataBloc,
      );
      expect(find.byType(AppOne), findsOneWidget);
    });

    testWidgets('renders AppTwo when AppFlavor is two', (tester) async {
      when(() => flavorCubit.state).thenReturn(AppFlavor.two);
      await tester.pumpExperience(
        const DemoView(),
        flavorCubit: flavorCubit,
        themeModeCubit: themeModeCubit,
        financialDataBloc: financialDataBloc,
      );
      expect(find.byType(AppTwo), findsOneWidget);
    });

    testWidgets('renders AppThree when AppFlavor is three', (tester) async {
      when(() => flavorCubit.state).thenReturn(AppFlavor.three);
      await tester.pumpExperience(
        const DemoView(),
        flavorCubit: flavorCubit,
        themeModeCubit: themeModeCubit,
        financialDataBloc: financialDataBloc,
      );
      expect(find.byType(AppThree), findsOneWidget);
    });
  });
}
