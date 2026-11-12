import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ─── Core Stark Brand Palette ────────────────────────────────────────────────
  static const Color arcReactor       = Color(0xFF00D4FF);  // Tony's arc reactor cyan
  static const Color arcReactorLight  = Color(0xFF0088CC);  // Daylight HUD high-contrast cyan
  static const Color ironGold         = Color(0xFFFFB300);  // Iron Man gold accent
  static const Color ironGoldLight    = Color(0xFFC68A00);  // Daylight HUD gold
  static const Color cyberGreen       = Color(0xFF00FF94);  // Security pass green
  static const Color cyberGreenLight  = Color(0xFF009B5A);  // Daylight HUD security green
  static const Color redAlert         = Color(0xFFFF3B3B);  // Critical/danger red
  static const Color redAlertLight    = Color(0xFFD32F2F);  // Daylight HUD alert red

  // ─── Dark Mode (Night Tactical HUD) ──────────────────────────────────────────
  static const Color darkBg           = Color(0xFF050A14);  // Deep space obsidian
  static const Color darkSurface      = Color(0xFF0D1B2A);  // Console surface
  static const Color darkCard         = Color(0xFF112233);  // Holographic card
  static const Color textPrimary      = Color(0xFFE8F4FD);
  static const Color textSecondary    = Color(0xFF8BA3BB);
  static const Color glowBlue         = Color(0xFF00D4FF);
  
  // ─── Light Mode (Daylight Stark HUD / Blueprint Glass) ───────────────────────
  static const Color lightBg          = Color(0xFFF1F5F9);  // Aerospace titanium platinum
  static const Color lightSurface     = Color(0xFFFFFFFF);  // Pure frosted HUD glass
  static const Color lightCard        = Color(0xFFFFFFFF);  // Crisp white HUD plate
  static const Color lightAltBg       = Color(0xFFE8EEF5);  // Blueprint alternate section
  static const Color textPrimaryLight = Color(0xFF091426);  // Tactical midnight obsidian
  static const Color textSecondaryLight=Color(0xFF4A5D73);  // Clear blueprint slate

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
    cardTheme: CardThemeData(
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
      primary: arcReactorLight,
      secondary: ironGoldLight,
      surface: lightSurface,
      error: redAlertLight,
    ),
    textTheme: _buildTextTheme(textPrimaryLight),
    cardTheme: CardThemeData(
      color: lightSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFCBD5E1), width: 1),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.rajdhani(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textPrimaryLight,
        letterSpacing: 2,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: arcReactorLight,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.rajdhani(fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
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
