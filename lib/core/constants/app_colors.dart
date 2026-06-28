import 'package:flutter/material.dart';

/// Centralized color palette for BenefitBridge AI.
///
/// Uses a professional government-style palette suitable for
/// citizen-facing welfare scheme discovery applications.
abstract final class AppColors {
  // ── Brand Colors ──────────────────────────────────────────────────────────

  /// Primary brand color — authoritative government blue.
  static const Color primaryBlue = Color(0xFF1A56A0);

  /// Secondary brand color — trust and growth emerald green.
  static const Color emeraldGreen = Color(0xFF059669);

  /// Accent color — call-to-action and highlights.
  static const Color accentOrange = Color(0xFFF97316);

  // ── Neutral Colors ──────────────────────────────────────────────────────────

  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF3F4F6);
  static const Color darkGrey = Color(0xFF374151);
  static const Color black = Color(0xFF111827);

  // ── Semantic Colors ───────────────────────────────────────────────────────

  static const Color error = Color(0xFFDC2626);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF2563EB);

  // ── Light Theme Surfaces ──────────────────────────────────────────────────

  static const Color lightBackground = Color(0xFFF9FAFB);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFE5E7EB);
  static const Color lightOnPrimary = white;
  static const Color lightOnSecondary = white;
  static const Color lightOnBackground = black;
  static const Color lightOnSurface = darkGrey;
  static const Color lightOutline = Color(0xFFD1D5DB);

  // ── Dark Theme Surfaces ───────────────────────────────────────────────────

  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkSurfaceVariant = Color(0xFF334155);
  static const Color darkOnPrimary = white;
  static const Color darkOnSecondary = white;
  static const Color darkOnBackground = Color(0xFFF1F5F9);
  static const Color darkOnSurface = Color(0xFFE2E8F0);
  static const Color darkOutline = Color(0xFF475569);
}
