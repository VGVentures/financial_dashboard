import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThemeModeCubit', () {
    test('initial state is lightTheme', () {
      expect(ThemeModeCubit().state, lightThemeMode);
    });

    group('toggle', () {
      blocTest<ThemeModeCubit, ThemeMode>(
        'sets ThemeMode correctly',
        build: ThemeModeCubit.new,
        act: (cubit) => cubit.toggle(),
        expect: () => [darkThemeMode],
      );
    });
  });
}
