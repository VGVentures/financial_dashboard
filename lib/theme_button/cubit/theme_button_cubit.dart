import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const darkThemeMode = ThemeMode.dark;
const lightThemeMode = ThemeMode.light;

class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit() : super(ThemeMode.light);

  void toggle() => emit(
        state == darkThemeMode ? lightThemeMode : darkThemeMode,
      );
}
