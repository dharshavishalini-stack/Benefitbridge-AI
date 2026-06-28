import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

/// Responsive scrollable layout wrapper for authentication screens.
///
/// Centers content inside a rounded Material 3 card on tablet and web.
class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.child,
    this.showBackButton = false,
  });

  final Widget child;
  final bool showBackButton;

  Color _backgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AppColors.darkBackground : AppColors.lightBackground;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor(context),
      appBar: showBackButton
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
            )
          : null,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
