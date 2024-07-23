import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceFrame extends StatelessWidget {
  const DeviceFrame({
    required this.lightTheme,
    required this.darkTheme,
    required this.child,
    super.key,
    this.borderRadius = 0,
    this.elevation = 0,
  });

  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final Widget child;
  final double borderRadius;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeModeCubit>().state;
    final isLightTheme = themeMode == ThemeMode.light;
    final data = isLightTheme ? lightTheme : darkTheme;

    return Theme(
      data: data,
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(borderRadius),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 736,
          width: 414,
          child: child,
        ),
      ),
    );
  }
}
