import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/demo/demo.dart';
import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:financial_dashboard/thumbnail/thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/helpers.dart';

class MockThemeModeCubit extends MockCubit<ThemeMode>
    implements ThemeModeCubit {}

void main() {
  group('ThemePotentialThumbnail', () {
    testWidgets('renders AppFlavorView', (tester) async {
      await tester.pumpExperience(const ThemePotentialThumbnail());
      expect(find.byType(AppFlavorView), findsOneWidget);
    });
  });

  group('AppFlavorView', () {
    late ThemeModeCubit themeModeCubit;
    late AnimationController controller;

    setUp(() {
      themeModeCubit = MockThemeModeCubit();
      controller = AnimationController(
        vsync: const TestVSync(),
        duration: const Duration(milliseconds: 3500),
      );
      when(() => themeModeCubit.state).thenReturn(ThemeMode.light);
    });

    testWidgets('renders correct widgets on animation', (tester) async {
      await tester.pumpExperience(
        AppFlavorView(
          animationController: controller,
        ),
        themeModeCubit: themeModeCubit,
      );

      controller
        ..value = 1
        ..stop();
      await tester.pumpAndSettle();

      expect(find.byType(AppOne), findsOneWidget);

      final appWidgets = [AppTwo, AppThree, AppOne];

      for (final widget in appWidgets) {
        controller
          ..value = 0
          ..stop();
        await tester.pumpAndSettle();

        expect(find.byType(widget), findsOneWidget);
      }
    });
  });
}
