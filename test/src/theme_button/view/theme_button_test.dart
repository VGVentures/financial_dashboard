import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helpers.dart';

class MockThemeModeCubit extends MockCubit<ThemeMode>
    implements ThemeModeCubit {}

void main() {
  group('ThemeButton', () {
    Widget buildSubject() => const Scaffold(body: ThemeButton());

    late ThemeModeCubit themeModeCubit;

    setUp(() {
      themeModeCubit = MockThemeModeCubit();
      when(() => themeModeCubit.state).thenReturn(lightThemeMode);
    });

    testWidgets('sets the new ThemeMode on tap', (tester) async {
      await tester.pumpExperience(
        BlocProvider.value(
          value: themeModeCubit,
          child: buildSubject(),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      verify(themeModeCubit.toggle).called(1);
    });
  });
}
