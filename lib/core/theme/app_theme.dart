import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Material 3 theme configuration for BenefitBridge AI.
///
/// Provides light and dark [ThemeData] with consistent styling for
/// buttons, text fields, cards, app bars, and snack bars.
abstract final class AppTheme {
  // ── Typography ──────────────────────────────────────────────────────────────

  static const String _fontFamily = 'Roboto';

  static TextTheme get _textTheme => const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      );

  // ── Color Schemes ─────────────────────────────────────────────────────────

  static ColorScheme get _lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryBlue,
        onPrimary: AppColors.lightOnPrimary,
        primaryContainer: Color(0xFFD6E4F5),
        onPrimaryContainer: AppColors.primaryBlue,
        secondary: AppColors.emeraldGreen,
        onSecondary: AppColors.lightOnSecondary,
        secondaryContainer: Color(0xFFD1FAE5),
        onSecondaryContainer: Color(0xFF065F46),
        tertiary: AppColors.accentOrange,
        onTertiary: AppColors.white,
        tertiaryContainer: Color(0xFFFFEDD5),
        onTertiaryContainer: Color(0xFF9A3412),
        error: AppColors.error,
        onError: AppColors.white,
        errorContainer: Color(0xFFFEE2E2),
        onErrorContainer: Color(0xFF991B1B),
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightOnSurface,
        onSurfaceVariant: AppColors.darkGrey,
        outline: AppColors.lightOutline,
        outlineVariant: AppColors.lightSurfaceVariant,
        shadow: AppColors.black,
        scrim: AppColors.black,
        inverseSurface: AppColors.darkSurface,
        onInverseSurface: AppColors.darkOnSurface,
        inversePrimary: Color(0xFF93C5FD),
        surfaceTint: AppColors.primaryBlue,
      );

  static ColorScheme get _darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF93C5FD),
        onPrimary: Color(0xFF0C2340),
        primaryContainer: Color(0xFF1A56A0),
        onPrimaryContainer: Color(0xFFD6E4F5),
        secondary: Color(0xFF6EE7B7),
        onSecondary: Color(0xFF064E3B),
        secondaryContainer: Color(0xFF065F46),
        onSecondaryContainer: Color(0xFFD1FAE5),
        tertiary: Color(0xFFFDBA74),
        onTertiary: Color(0xFF7C2D12),
        tertiaryContainer: Color(0xFF9A3412),
        onTertiaryContainer: Color(0xFFFFEDD5),
        error: Color(0xFFFCA5A5),
        onError: Color(0xFF7F1D1D),
        errorContainer: Color(0xFF991B1B),
        onErrorContainer: Color(0xFFFEE2E2),
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkOnSurface,
        onSurfaceVariant: Color(0xFFCBD5E1),
        outline: AppColors.darkOutline,
        outlineVariant: AppColors.darkSurfaceVariant,
        shadow: AppColors.black,
        scrim: AppColors.black,
        inverseSurface: AppColors.lightSurface,
        onInverseSurface: AppColors.lightOnSurface,
        inversePrimary: AppColors.primaryBlue,
        surfaceTint: Color(0xFF93C5FD),
      );

  // ── Shared Component Themes ───────────────────────────────────────────────

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme scheme) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          elevation: 1,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(64, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme scheme) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: scheme.outline, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(64, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
      );

  static InputDecorationTheme _inputDecorationTheme(ColorScheme scheme) =>
      InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.4),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.error, width: 2),
        ),
        labelStyle: TextStyle(color: scheme.onSurfaceVariant),
        hintStyle: TextStyle(
          color: scheme.onSurfaceVariant.withValues(alpha: 0.7),
        ),
        errorStyle: TextStyle(color: scheme.error),
      );

  static CardThemeData _cardTheme(ColorScheme scheme) => CardThemeData(
        color: scheme.surface,
        elevation: 1,
        shadowColor: scheme.shadow.withValues(alpha: 0.12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: scheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      );

  static AppBarTheme _appBarTheme(ColorScheme scheme) => AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 2,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: _fontFamily,
        ),
        iconTheme: IconThemeData(color: scheme.onSurface),
      );

  static SnackBarThemeData _snackBarTheme(ColorScheme scheme) =>
      SnackBarThemeData(
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: TextStyle(
          color: scheme.onInverseSurface,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        actionTextColor: scheme.inversePrimary,
      );

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      fontFamily: _fontFamily,
      textTheme: _textTheme,
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
      appBarTheme: _appBarTheme(colorScheme),
      snackBarTheme: _snackBarTheme(colorScheme),
    );
  }

  // ── Public Theme Accessors ──────────────────────────────────────────────────

  /// Light theme with government-style blue and green palette.
  static ThemeData get lightTheme => _buildTheme(
        colorScheme: _lightColorScheme,
        scaffoldBackgroundColor: AppColors.lightBackground,
      );

  /// Dark theme optimized for low-light usage.
  static ThemeData get darkTheme => _buildTheme(
        colorScheme: _darkColorScheme,
        scaffoldBackgroundColor: AppColors.darkBackground,
      );
}
