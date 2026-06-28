import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';
import 'config/routes/route_names.dart';
import 'core/constants/app_strings.dart';
import 'core/theme/app_theme.dart';

/// Root widget for the BenefitBridge AI application.
///
/// Configures [MaterialApp] with Material 3 theming, named routes,
/// and the initial navigation entry point.
class BenefitBridgeApp extends StatelessWidget {
  const BenefitBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: RouteNames.splash,
      routes: AppRoutes.routes,
    );
  }
}
