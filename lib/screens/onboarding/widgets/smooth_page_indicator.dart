import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

/// Animated smooth page indicator with expanding active dot.
///
/// Mimics the pill-style indicators used in modern government
/// and fintech apps such as DigiLocker and Google Pay.
class SmoothPageIndicator extends StatelessWidget {
  const SmoothPageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  static const double _dotHeight = 8;
  static const double _inactiveDotWidth = 8;
  static const double _activeDotWidth = 28;
  static const Duration _animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final inactiveColor = isDark
        ? AppColors.darkOutline
        : AppColors.lightOutline;
    final activeColor = AppColors.primaryBlue;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;

        return AnimatedContainer(
          duration: _animationDuration,
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? _activeDotWidth : _inactiveDotWidth,
          height: _dotHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_dotHeight / 2),
            color: isActive ? activeColor : inactiveColor,
          ),
        );
      }),
    );
  }
}
