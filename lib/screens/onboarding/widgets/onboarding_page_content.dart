import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

/// Data model for a single onboarding page.
class OnboardingPageData {
  const OnboardingPageData({
    required this.icon,
    required this.title,
    required this.description,
    required this.iconColor,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;
}

/// Displays a single onboarding page with icon, title, and description.
class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({
    super.key,
    required this.data,
  });

  final OnboardingPageData data;

  /// Calculates responsive icon size for phone, tablet, and web.
  double _iconSize(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return (screenWidth * 0.22).clamp(88.0, 140.0);
  }

  /// Resolves theme-aware text colors from [AppColors].
  ({Color titleColor, Color descriptionColor}) _resolveTextColors(
    BuildContext context,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return (
      titleColor:
          isDark ? AppColors.darkOnBackground : AppColors.lightOnBackground,
      descriptionColor: isDark ? AppColors.darkOnSurface : AppColors.darkGrey,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = _resolveTextColors(context);
    final iconSize = _iconSize(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: iconSize + 56,
            height: iconSize + 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: data.iconColor.withValues(alpha: 0.08),
              border: Border.all(
                color: data.iconColor.withValues(alpha: 0.25),
                width: 1.5,
              ),
            ),
            child: Icon(
              data.icon,
              size: iconSize,
              color: data.iconColor,
            ),
          ),
          const SizedBox(height: 48),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: colors.titleColor,
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colors.descriptionColor,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
