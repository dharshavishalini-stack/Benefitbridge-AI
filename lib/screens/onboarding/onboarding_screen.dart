import 'package:flutter/material.dart';

import '../../config/routes/route_names.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import 'widgets/onboarding_page_content.dart';
import 'widgets/smooth_page_indicator.dart';

/// Premium three-page onboarding experience for BenefitBridge AI.
///
/// Guides users through app value propositions before navigating
/// to the authentication flow via [RouteNames.authentication].
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const Duration _pageTransitionDuration = Duration(milliseconds: 400);
  static const Curve _pageTransitionCurve = Curves.easeInOut;

  late final PageController _pageController;
  int _currentPage = 0;

  /// Onboarding content for all three pages.
  static const List<OnboardingPageData> _pages = [
    OnboardingPageData(
      icon: Icons.account_balance,
      title: 'Welcome to BenefitBridge AI',
      description:
          'Find every government scheme you are eligible for in one place.',
      iconColor: AppColors.primaryBlue,
    ),
    OnboardingPageData(
      icon: Icons.psychology,
      title: 'Smart AI Eligibility Check',
      description:
          'Answer a few simple questions and instantly discover schemes matching your profile.',
      iconColor: AppColors.emeraldGreen,
    ),
    OnboardingPageData(
      icon: Icons.security,
      title: 'Secure & Trusted',
      description:
          'Your personal information stays protected while helping you access government benefits.',
      iconColor: AppColors.info,
    ),
  ];

  bool get _isFirstPage => _currentPage == 0;
  bool get _isLastPage => _currentPage == _pages.length - 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_onPageScroll);
  }

  /// Rebuilds fade transitions while the user swipes between pages.
  void _onPageScroll() {
    setState(() {});
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
  }

  Future<void> _goToPreviousPage() async {
    if (_isFirstPage) return;

    await _pageController.previousPage(
      duration: _pageTransitionDuration,
      curve: _pageTransitionCurve,
    );
  }

  Future<void> _goToNextPage() async {
    if (_isLastPage) {
      _navigateToAuthentication();
      return;
    }

    await _pageController.nextPage(
      duration: _pageTransitionDuration,
      curve: _pageTransitionCurve,
    );
  }

  /// Replaces onboarding with the authentication entry route.
  void _navigateToAuthentication() {
    Navigator.pushReplacementNamed(context, RouteNames.authentication);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageScroll);
    _pageController.dispose();
    super.dispose();
  }

  /// Resolves theme-aware scaffold background from [AppColors].
  Color _backgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AppColors.darkBackground : AppColors.lightBackground;
  }

  /// Builds a page with fade opacity based on scroll position.
  Widget _buildFadePage(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        var opacity = 1.0;

        if (_pageController.position.haveDimensions) {
          final pageOffset =
              (_pageController.page ?? _currentPage.toDouble()) - index;
          opacity = (1 - pageOffset.abs()).clamp(0.0, 1.0);
        } else {
          opacity = index == _currentPage ? 1.0 : 0.0;
        }

        return Opacity(opacity: opacity, child: child);
      },
      child: OnboardingPageContent(data: _pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor(context),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: _pages.length,
                    itemBuilder: (context, index) => _buildFadePage(index),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                  child: Column(
                    children: [
                      SmoothPageIndicator(
                        count: _pages.length,
                        currentIndex: _currentPage,
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          _PreviousButton(
                            visible: !_isFirstPage,
                            onPressed: _goToPreviousPage,
                          ),
                          const Spacer(),
                          _PrimaryActionButton(
                            label: _isLastPage
                                ? AppStrings.btnGetStarted
                                : AppStrings.btnNext,
                            onPressed: _goToNextPage,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Outlined previous button — hidden on the first onboarding page.
class _PreviousButton extends StatelessWidget {
  const _PreviousButton({
    required this.visible,
    required this.onPressed,
  });

  final bool visible;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: IgnorePointer(
        ignoring: !visible,
        child: SizedBox(
          height: 48,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryBlue,
              side: const BorderSide(color: AppColors.primaryBlue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
            ),
            child: Text(AppStrings.btnBack),
          ),
        ),
      ),
    );
  }
}

/// Rounded primary action button for Next and Get Started actions.
class _PrimaryActionButton extends StatelessWidget {
  const _PrimaryActionButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32),
        ),
        child: Text(label),
      ),
    );
  }
}
