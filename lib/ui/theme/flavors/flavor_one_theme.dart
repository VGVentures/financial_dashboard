import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';

class FlavorOneTheme extends AppTheme {
  const FlavorOneTheme();

  @override
  ColorScheme get colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF85468C),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFFFD6FD),
      onPrimaryContainer: Color(0xFF36003E),
      secondary: Color(0xFF6C586B),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFF4DBF1),
      onSecondaryContainer: Color(0xFF251626),
      tertiary: Color(0xFF82524A),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFFFDAD4),
      onTertiaryContainer: Color(0xFF33110C),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      surface: Color(0xFFFFFBFF),
      onSurface: Color(0xFF1E1A1D),
      surfaceContainerHighest: Color(0xFFEDDFE8),
      onSurfaceVariant: Color(0xFF4D444C),
      outline: Color(0xFF7F747C),
      onInverseSurface: Color(0xFFF7EEF2),
      inverseSurface: Color(0xFF332F32),
      inversePrimary: Color(0xFFF8ADFB),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF85468C),
    );
  }

  @override
  String get fontFamily => 'Outfit';
}

class FlavorOneDarkTheme extends FlavorOneTheme {
  const FlavorOneDarkTheme();

  @override
  ColorScheme get colorScheme {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFF8ADFB),
      onPrimary: Color(0xFF51145A),
      primaryContainer: Color(0xFF6B2D72),
      onPrimaryContainer: Color(0xFFFFD6FD),
      secondary: Color(0xFFD8BFD5),
      onSecondary: Color(0xFF3B2B3B),
      secondaryContainer: Color(0xFF534152),
      onSecondaryContainer: Color(0xFFF4DBF1),
      tertiary: Color(0xFFF6B8AD),
      onTertiary: Color(0xFF4C251F),
      tertiaryContainer: Color(0xFF673B34),
      onTertiaryContainer: Color(0xFFFFDAD4),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: Color(0xFF1E1A1D),
      onSurface: Color(0xFFE9E0E4),
      surfaceContainerHighest: Color(0xFF4D444C),
      onSurfaceVariant: Color(0xFFD0C3CC),
      outline: Color(0xFF998D96),
      onInverseSurface: Color(0xFF1E1A1D),
      inverseSurface: Color(0xFFE9E0E4),
      inversePrimary: Color(0xFF85468C),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFFF8ADFB),
    );
  }
}
