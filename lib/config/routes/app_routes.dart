import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/splash/splash_screen.dart';
import '../../widgets/route_placeholder.dart';
import 'route_names.dart';

/// Central route table for BenefitBridge AI.
///
/// Maps [RouteNames] to widget builders. Screen implementations
/// will replace [RoutePlaceholder] widgets in subsequent modules.
abstract final class AppRoutes {
  /// Returns the complete named route map for [MaterialApp.routes].
  static Map<String, WidgetBuilder> get routes => {
        RouteNames.splash: (_) => const SplashScreen(),
        RouteNames.onboarding: (_) => const OnboardingScreen(),
        RouteNames.authentication: (_) => const RoutePlaceholder(
              title: AppStrings.routeLogin,
            ),
        RouteNames.login: (_) => const RoutePlaceholder(
              title: AppStrings.routeLogin,
            ),
        RouteNames.register: (_) => const RoutePlaceholder(
              title: AppStrings.routeRegister,
            ),
        RouteNames.forgotPassword: (_) => const RoutePlaceholder(
              title: AppStrings.routeForgotPassword,
            ),
        RouteNames.home: (_) => const RoutePlaceholder(
              title: AppStrings.routeHome,
            ),
        RouteNames.profile: (_) => const RoutePlaceholder(
              title: AppStrings.routeProfile,
            ),
        RouteNames.settings: (_) => const RoutePlaceholder(
              title: AppStrings.routeSettings,
            ),
      };
}
