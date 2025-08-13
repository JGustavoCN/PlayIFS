// Ficheiro: lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // 1. Sua paleta de cores definida manualmente. Perfeito.
  static const Color ifsGreen = Color(0xFF318C2C);
  static const Color ifsRed = Color(0xFFDC1223);
  static const Color ifsBrown = Color(0xFF121212);
  static const Color ifsWhite = Color(0xFFFFFFFF);
  static const Color ifsBlack = Color(0xFF000000);

  // --- Esquemas de Cores com Controlo Total ---

  // 🌞 Tema Claro
  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: ifsGreen, // A semente ainda é útil para cores secundárias
    brightness: Brightness.light,
    // Overrides para garantir as cores exatas da sua marca
    primary: ifsGreen,
    onPrimary: ifsWhite,
    error: ifsRed,
    onError: ifsWhite,
    surface: ifsWhite,
    onSurface: ifsBlack,
  );

  // 🌙 Tema Escuro
  static final ColorScheme _darkScheme = ColorScheme.fromSeed(
    seedColor: ifsGreen,
    brightness: Brightness.dark,
    // Overrides para garantir as cores exatas da sua marca
    primary: ifsGreen,
    onPrimary: ifsWhite,
    error: ifsRed,
    onError: ifsWhite,
    surface: ifsBrown,
    onSurface: ifsWhite,
  );

  // --- Construção dos Temas Completos ---

  // 🌞 ThemeData para o modo Claro
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightScheme,
    // REFINAMENTO: Usando o método do google_fonts para um TextTheme completo e consistente.
    textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
    appBarTheme: AppBarTheme(
      backgroundColor: _lightScheme.primary,
      foregroundColor: _lightScheme.onPrimary,
      elevation: 2,
      titleTextStyle: GoogleFonts.roboto(
        color: _lightScheme.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightScheme.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      color: _lightScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  // 🌙 ThemeData para o modo Escuro
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkScheme,
    textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
    appBarTheme: AppBarTheme(
      backgroundColor: _darkScheme.primary,
      foregroundColor: _darkScheme.onPrimary,
      elevation: 2,
      titleTextStyle: GoogleFonts.roboto(
        color: _darkScheme.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkScheme.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      color: _darkScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}