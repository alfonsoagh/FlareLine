import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTheme {
  // Font weights as per CETAM standards
  static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  // Single theme data - light mode only (CETAM standard)
  static ThemeData lightThemeData = theme(
    lightColorScheme,
    _lightFocusColor,
    lightAppBarTheme,
    GlobalColors.text,
    lightCardTheme,
  );

  // Removed dark theme - CETAM uses light mode only
  static ThemeData darkThemeData = lightThemeData;

  static ThemeData theme(
    ColorScheme colorScheme,
    Color focusColor,
    AppBarTheme appBarTheme,
    Color hintColor,
    CardThemeData cardTheme,
  ) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      focusColor: focusColor,
      appBarTheme: appBarTheme,
      textTheme: _textTheme,
      hintColor: hintColor,
      cardTheme: cardTheme,
      scaffoldBackgroundColor: GlobalColors.background,
    );
  }

  static const CardThemeData lightCardTheme = CardThemeData(
    margin: EdgeInsets.zero,
    color: Colors.white,
    surfaceTintColor: Color(0xFFF9FAFB),
    shadowColor: Color(0x11000000),
    elevation: 0,
  );

  static const AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: GlobalColors.primary,
    elevation: 0,
    centerTitle: false,
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: GlobalColors.primary,
    secondary: GlobalColors.secondary,
    tertiary: GlobalColors.tertiary,
    error: GlobalColors.danger,
    surface: Colors.white,
    background: GlobalColors.background,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onTertiary: Colors.white,
    onError: Colors.white,
    onSurface: GlobalColors.text,
    onBackground: GlobalColors.text,
    brightness: Brightness.light,
  );

  // Inter font theme (CETAM standard)
  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.inter(
      fontWeight: _semiBold,
      fontSize: 32.0,
      color: GlobalColors.text,
    ),
    displayMedium: GoogleFonts.inter(
      fontWeight: _semiBold,
      fontSize: 28.0,
      color: GlobalColors.text,
    ),
    displaySmall: GoogleFonts.inter(
      fontWeight: _medium,
      fontSize: 24.0,
      color: GlobalColors.text,
    ),
    headlineLarge: GoogleFonts.inter(
      fontWeight: _semiBold,
      fontSize: 24.0,
      color: GlobalColors.text,
    ),
    headlineMedium: GoogleFonts.inter(
      fontWeight: _semiBold,
      fontSize: 20.0,
      color: GlobalColors.text,
    ),
    headlineSmall: GoogleFonts.inter(
      fontWeight: _medium,
      fontSize: 18.0,
      color: GlobalColors.text,
    ),
    titleLarge: GoogleFonts.inter(
      fontWeight: _semiBold,
      fontSize: 18.0,
      color: GlobalColors.text,
    ),
    titleMedium: GoogleFonts.inter(
      fontWeight: _medium,
      fontSize: 16.0,
      color: GlobalColors.text,
    ),
    titleSmall: GoogleFonts.inter(
      fontWeight: _medium,
      fontSize: 14.0,
      color: GlobalColors.text,
    ),
    bodyLarge: GoogleFonts.inter(
      fontWeight: _regular,
      fontSize: 16.0,
      color: GlobalColors.text,
    ),
    bodyMedium: GoogleFonts.inter(
      fontWeight: _regular,
      fontSize: 14.0,
      color: GlobalColors.text,
    ),
    bodySmall: GoogleFonts.inter(
      fontWeight: _regular,
      fontSize: 12.0,
      color: GlobalColors.textSecondary,
    ),
    labelLarge: GoogleFonts.inter(
      fontWeight: _medium,
      fontSize: 14.0,
      color: GlobalColors.text,
    ),
    labelMedium: GoogleFonts.inter(
      fontWeight: _medium,
      fontSize: 12.0,
      color: GlobalColors.text,
    ),
    labelSmall: GoogleFonts.inter(
      fontWeight: _medium,
      fontSize: 11.0,
      color: GlobalColors.textSecondary,
    ),
  );
}
