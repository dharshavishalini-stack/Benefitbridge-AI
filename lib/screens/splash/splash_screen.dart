import 'package:flutter/material.dart';

import '../../config/routes/route_names.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

/// Premium government-style splash screen for BenefitBridge AI.
///
/// Animates the logo on entry, displays branding, then navigates
/// to [RouteNames.onboarding] after the animation sequence completes.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  static const Duration _animationDuration = Duration(milliseconds: 1500);
  static const Duration _postAnimationDelay = Duration(milliseconds: 1500);
  static const String _splashTagline =
      'Bridging Citizens to Government Benefits';
  static const String _appVersion = '1.0.0';

  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _animationController.addStatusListener(_onAnimationStatusChanged);
    _animationController.forward();
  }

  /// Configures scale (0.6 → 1.0) and fade-in animations over 1500 ms.
  void _setupAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      curvedAnimation,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  /// Waits 1500 ms after the logo animation, then navigates to onboarding.
  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _scheduleNavigation();
    }
  }

  Future<void> _scheduleNavigation() async {
    await Future.delayed(_postAnimationDelay);
    if (!mounted) return;

    await Navigator.pushReplacementNamed(context, RouteNames.onboarding);
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_onAnimationStatusChanged);
    _animationController.dispose();
    super.dispose();
  }

  /// Resolves theme-aware background and text colors from [AppColors].
  ({Color background, Color primaryText, Color secondaryText}) _resolveColors(
    BuildContext context,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return (
      background:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      primaryText:
          isDark ? AppColors.darkOnBackground : AppColors.lightOnBackground,
      secondaryText: isDark ? AppColors.darkOnSurface : AppColors.darkGrey,
    );
  }

  /// Calculates a responsive icon size for phone, tablet, and web.
  double _iconSize(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return (screenWidth * 0.18).clamp(72.0, 120.0);
  }

  @override
  Widget build(BuildContext context) {
    final colors = _resolveColors(context);
    final iconSize = _iconSize(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _AnimatedGovernmentLogo(
                          scaleAnimation: _scaleAnimation,
                          fadeAnimation: _fadeAnimation,
                          iconSize: iconSize,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          AppStrings.appName,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: colors.primaryText,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _splashTagline,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: colors.secondaryText,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: AppColors.primaryBlue,
                            backgroundColor: AppColors.primaryBlue.withValues(
                              alpha: 0.15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  'Version $_appVersion',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.secondaryText,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Animated government institution icon with scale and fade effects.
class _AnimatedGovernmentLogo extends StatelessWidget {
  const _AnimatedGovernmentLogo({
    required this.scaleAnimation,
    required this.fadeAnimation,
    required this.iconSize,
  });

  final Animation<double> scaleAnimation;
  final Animation<double> fadeAnimation;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([scaleAnimation, fadeAnimation]),
      builder: (context, child) {
        return Opacity(
          opacity: fadeAnimation.value,
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: child,
          ),
        );
      },
      child: Container(
        width: iconSize + 48,
        height: iconSize + 48,
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
          size: iconSize,
          color: AppColors.primaryBlue,
        ),
      ),
    );
  }
}
