import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

/// Branded logo placeholder for authentication screens.
class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  /// Calculates responsive logo size for phone, tablet, and web.
  double _logoSize(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return (screenWidth * 0.14).clamp(56.0, 72.0);
  }

  @override
  Widget build(BuildContext context) {
    final logoSize = _logoSize(context);

    return Column(
      children: [
        Container(
          width: logoSize + 24,
          height: logoSize + 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryBlue.withValues(alpha: 0.08),
            border: Border.all(
              color: AppColors.primaryBlue.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          child: Icon(
            Icons.account_balance,
            size: logoSize,
            color: AppColors.primaryBlue,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.appName,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
