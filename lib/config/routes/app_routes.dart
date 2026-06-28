import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../screens/authentication/forgot_password_screen.dart';
import '../../screens/authentication/login_screen.dart';
import '../../screens/authentication/register_screen.dart';
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
        RouteNames.authentication: (_) => const LoginScreen(),
        RouteNames.login: (_) => const LoginScreen(),
        RouteNames.register: (_) => const RegisterScreen(),
        RouteNames.forgotPassword: (_) => const ForgotPasswordScreen(),
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
