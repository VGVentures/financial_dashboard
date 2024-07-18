import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeModeCubit>().state;
    final isLightTheme = themeMode == ThemeMode.light;
    final icon =
        isLightTheme ? Icons.light_mode_outlined : Icons.dark_mode_outlined;

    return Align(
      child: InkWell(
        onTap: () => context.read<ThemeModeCubit>().toggle(),
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Icon(icon),
        ),
      ),
    );
  }
}
