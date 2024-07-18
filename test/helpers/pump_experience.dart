import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockThemeModeCubit extends MockCubit<ThemeMode>
    implements ThemeModeCubit {}

extension PumpExperience on WidgetTester {
  Future<void> pumpExperience(
    Widget widget, {
    ThemeModeCubit? themeModeCubit,
  }) {
    return pumpWidget(
      BlocProvider(
        create: (_) => themeModeCubit ?? MockThemeModeCubit(),
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: widget,
        ),
      ),
    );
  }
}
