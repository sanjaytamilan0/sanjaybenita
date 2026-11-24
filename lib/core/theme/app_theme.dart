import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'wedding_theme_palette.dart';

class AppTheme {
  static ThemeData getTheme(WeddingThemeColors colors) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.background,
      primaryColor: colors.primary,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colors.primary,
        onPrimary: Colors.white,
        secondary: colors.secondary,
        onSecondary: colors.textDark,
        error: Colors.redAccent,
        onError: Colors.white,
        surface: colors.surface,
        onSurface: colors.textDark,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.cinzelDecorative(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: colors.primary,
          letterSpacing: 2.0,
        ),
        displayMedium: GoogleFonts.cinzelDecorative(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colors.primary,
          letterSpacing: 1.5,
        ),
        displaySmall: GoogleFonts.cinzel(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: colors.secondary,
          letterSpacing: 1.2,
        ),
        headlineLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: colors.primary,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: colors.primary,
        ),
        headlineSmall: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: colors.textDark,
        ),
        titleLarge: GoogleFonts.cormorantGaramond(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: colors.textDark,
        ),
        titleMedium: GoogleFonts.cormorantGaramond(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colors.textDark,
        ),
        bodyLarge: GoogleFonts.cormorantGaramond(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: colors.textDark,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.cormorantGaramond(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colors.textDark,
          height: 1.5,
        ),
        labelLarge: GoogleFonts.cinzel(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: colors.primary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: colors.secondary, width: 1.5),
          ),
          elevation: 4,
          shadowColor: colors.secondary.withValues(alpha: 0.3),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(color: colors.secondary, width: 2),
        ),
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 6,
        shadowColor: colors.secondary.withValues(alpha: 0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: colors.border, width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.secondary, width: 2),
        ),
        labelStyle: TextStyle(color: colors.textMuted),
        hintStyle: TextStyle(color: colors.textMuted.withValues(alpha: 0.7)),
      ),
    );
  }

  static ThemeData get lightTheme => getTheme(AppColors.current);
}
