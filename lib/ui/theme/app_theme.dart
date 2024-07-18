import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      canvasColor: colorScheme.surface,
      colorScheme: colorScheme,
      textTheme: textTheme,
      cardTheme: cardTheme,
    );
  }

  ColorScheme get colorScheme;

  String get fontFamily;

  TextTheme get textTheme {
    return GoogleFonts.getTextTheme(fontFamily).apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
      decorationColor: colorScheme.onSurface,
    );
  }

  CardTheme get cardTheme {
    return const CardTheme(
      margin: EdgeInsets.zero,
    );
  }
}
