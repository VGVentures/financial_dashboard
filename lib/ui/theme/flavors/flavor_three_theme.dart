import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';

class FlavorThreeTheme extends AppTheme {
  const FlavorThreeTheme();

  @override
  ColorScheme get colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF2B4CE3),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFDEE0FF),
      onPrimaryContainer: Color(0xFF00115A),
      secondary: Color(0xFF4A58A9),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFDEE0FF),
      onSecondaryContainer: Color(0xFF00105C),
      tertiary: Color(0xFF8D4380),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFFFD7F1),
      onTertiaryContainer: Color(0xFF390034),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      surface: Color(0xFFFEFBFF),
      onSurface: Color(0xFF001849),
      surfaceContainerHighest: Color(0xFFE3E1EC),
      onSurfaceVariant: Color(0xFF46464F),
      outline: Color(0xFF767680),
      onInverseSurface: Color(0xFFEEF0FF),
      inverseSurface: Color(0xFF002B75),
      inversePrimary: Color(0xFFBAC3FF),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF2B4CE3),
    );
  }

  @override
  String get fontFamily => 'Source Code Pro';
}

class FlavorThreeDarkTheme extends FlavorThreeTheme {
  const FlavorThreeDarkTheme();

  @override
  ColorScheme get colorScheme {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFBAC3FF),
      onPrimary: Color(0xFF00208F),
      primaryContainer: Color(0xFF0030C7),
      onPrimaryContainer: Color(0xFFDEE0FF),
      secondary: Color(0xFFBAC3FF),
      onSecondary: Color(0xFF172778),
      secondaryContainer: Color(0xFF313F90),
      onSecondaryContainer: Color(0xFFDEE0FF),
      tertiary: Color(0xFFFFACEA),
      onTertiary: Color(0xFF57124E),
      tertiaryContainer: Color(0xFF712B66),
      onTertiaryContainer: Color(0xFFFFD7F1),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: Color(0xFF001849),
      onSurface: Color(0xFFDBE1FF),
      surfaceContainerHighest: Color(0xFF46464F),
      onSurfaceVariant: Color(0xFFC6C5D0),
      outline: Color(0xFF90909A),
      onInverseSurface: Color(0xFF001849),
      inverseSurface: Color(0xFFDBE1FF),
      inversePrimary: Color(0xFF2B4CE3),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFFBAC3FF),
    );
  }
}
