import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ─── Brand Colors ────────────────────────────────────────────────────────────
  static const Color arcReactor = Color(0xFF00D4FF);    // Tony's arc reactor blue
  static const Color ironGold   = Color(0xFFFFB300);    // Iron Man gold accent
  static const Color darkBg     = Color(0xFF050A14);    // Deep space navy
  static const Color darkSurface= Color(0xFF0D1B2A);    // Card surface
  static const Color darkCard   = Color(0xFF112233);    // Elevated card
  static const Color cyberGreen = Color(0xFF00FF94);    // Security green
  static const Color redAlert   = Color(0xFFFF3B3B);    // Critical/danger
  static const Color textPrimary  = Color(0xFFE8F4FD);
  static const Color textSecondary= Color(0xFF8BA3BB);
  static const Color glowBlue   = Color(0xFF00D4FF);
  
  // Light theme colors
  static const Color lightBg      = Color(0xFFF0F6FF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard    = Color(0xFFE8F0F8);

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBg,
    colorScheme: const ColorScheme.dark(
      primary: arcReactor,
      secondary: ironGold,
      surface: darkSurface,
      error: redAlert,
    ),
    textTheme: _buildTextTheme(textPrimary),
    cardTheme: CardTheme(
      color: darkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.rajdhani(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        letterSpacing: 2,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: arcReactor,
        foregroundColor: darkBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.rajdhani(fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    ),
  );

  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBg,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0077B6),
      secondary: ironGold,
      surface: lightSurface,
    ),
    textTheme: _buildTextTheme(const Color(0xFF0D1B2A)),
    cardTheme: CardTheme(
      color: lightSurface,
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static TextTheme _buildTextTheme(Color baseColor) => TextTheme(
    displayLarge: GoogleFonts.rajdhani(
      fontSize: 56, fontWeight: FontWeight.w700, color: baseColor, letterSpacing: 2,
    ),
    displayMedium: GoogleFonts.rajdhani(
      fontSize: 40, fontWeight: FontWeight.w700, color: baseColor, letterSpacing: 1.5,
    ),
    displaySmall: GoogleFonts.rajdhani(
      fontSize: 32, fontWeight: FontWeight.w600, color: baseColor,
    ),
    headlineLarge: GoogleFonts.rajdhani(
      fontSize: 28, fontWeight: FontWeight.w700, color: baseColor, letterSpacing: 1,
    ),
    headlineMedium: GoogleFonts.rajdhani(
      fontSize: 22, fontWeight: FontWeight.w600, color: baseColor,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 18, fontWeight: FontWeight.w600, color: baseColor,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, color: baseColor,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14, color: baseColor,
    ),
    labelLarge: GoogleFonts.rajdhani(
      fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.5,
    ),
  );
}
