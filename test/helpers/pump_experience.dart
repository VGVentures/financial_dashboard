import 'package:bloc_test/bloc_test.dart';
import 'package:financial_dashboard/flavor_button/cubit/flavor_cubit.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockThemeModeCubit extends MockCubit<ThemeMode>
    implements ThemeModeCubit {}

class MockFlavorCubit extends MockCubit<AppFlavor> implements FlavorCubit {}

extension PumpExperience on WidgetTester {
  Future<void> pumpExperience(
    Widget widget, {
    ThemeModeCubit? themeModeCubit,
    FlavorCubit? flavorCubit,
  }) {
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => themeModeCubit ?? MockThemeModeCubit()),
          BlocProvider(create: (_) => flavorCubit ?? MockFlavorCubit()),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: MediaQuery(
            data: const MediaQueryData(),
            child: widget,
          ),
        ),
      ),
    );
  }
}
