import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';

class FlavorTwoTheme extends AppTheme {
  const FlavorTwoTheme();

  @override
  ColorScheme get colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF006A62),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF72F8E9),
      onPrimaryContainer: Color(0xFF00201D),
      secondary: Color(0xFF4A6360),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFCCE8E3),
      onSecondaryContainer: Color(0xFF051F1D),
      tertiary: Color(0xFF47617A),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFCEE5FF),
      onTertiaryContainer: Color(0xFF001D32),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      surface: Color(0xFFFAFDFB),
      onSurface: Color(0xFF191C1C),
      surfaceContainerHighest: Color(0xFFDAE5E2),
      onSurfaceVariant: Color(0xFF3F4947),
      outline: Color(0xFF6F7977),
      onInverseSurface: Color(0xFFEFF1F0),
      inverseSurface: Color(0xFF2D3130),
      inversePrimary: Color(0xFF51DBCD),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF006A62),
    );
  }

  @override
  String get fontFamily => 'Source Serif 4';
}

class FlavorTwoDarkTheme extends FlavorTwoTheme {
  const FlavorTwoDarkTheme();

  @override
  ColorScheme get colorScheme {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF51DBCD),
      onPrimary: Color(0xFF003733),
      primaryContainer: Color(0xFF00504A),
      onPrimaryContainer: Color(0xFF72F8E9),
      secondary: Color(0xFFB1CCC7),
      onSecondary: Color(0xFF1C3532),
      secondaryContainer: Color(0xFF324B48),
      onSecondaryContainer: Color(0xFFCCE8E3),
      tertiary: Color(0xFFAEC9E6),
      onTertiary: Color(0xFF16334A),
      tertiaryContainer: Color(0xFF2F4961),
      onTertiaryContainer: Color(0xFFCEE5FF),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: Color(0xFF191C1C),
      onSurface: Color(0xFFE0E3E1),
      surfaceContainerHighest: Color(0xFF3F4947),
      onSurfaceVariant: Color(0xFFBEC9C6),
      outline: Color(0xFF899391),
      onInverseSurface: Color(0xFF191C1C),
      inverseSurface: Color(0xFFE0E3E1),
      inversePrimary: Color(0xFF006A62),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF51DBCD),
    );
  }
}
