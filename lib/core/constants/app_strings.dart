/// Centralized string constants for BenefitBridge AI.
///
/// Keeps all user-facing copy in one place for easy localization
/// and consistent messaging across the application.
abstract final class AppStrings {
  // ── App Identity ────────────────────────────────────────────────────────────

  static const String appName = 'BenefitBridge AI';
  static const String tagline =
      'Discover government welfare schemes you are eligible for';

  // ── Common Button Labels ──────────────────────────────────────────────────

  static const String btnContinue = 'Continue';
  static const String btnGetStarted = 'Get Started';
  static const String btnLogin = 'Login';
  static const String btnRegister = 'Register';
  static const String btnSubmit = 'Submit';
  static const String btnCancel = 'Cancel';
  static const String btnRetry = 'Retry';
  static const String btnSave = 'Save';
  static const String btnLogout = 'Logout';
  static const String btnForgotPassword = 'Forgot Password?';
  static const String btnBack = 'Back';
  static const String btnNext = 'Next';
  static const String btnSkip = 'Skip';
  static const String btnExploreSchemes = 'Explore Schemes';

  // ── Common Labels ───────────────────────────────────────────────────────────

  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String fullName = 'Full Name';
  static const String phoneNumber = 'Phone Number';

  // ── Error Messages ──────────────────────────────────────────────────────────

  static const String errorGeneric =
      'Something went wrong. Please try again.';
  static const String errorNetwork =
      'No internet connection. Please check your network and try again.';
  static const String errorServer =
      'Server is temporarily unavailable. Please try again later.';
  static const String errorInvalidEmail =
      'Please enter a valid email address.';
  static const String errorInvalidPassword =
      'Password must be at least 8 characters long.';
  static const String errorPasswordMismatch =
      'Passwords do not match. Please try again.';
  static const String errorRequiredField = 'This field is required.';
  static const String errorSessionExpired =
      'Your session has expired. Please login again.';
  static const String errorUnauthorized =
      'You are not authorized to perform this action.';
  static const String errorNotFound =
      'The requested resource could not be found.';

  // ── Route Placeholder Labels (Module 1A — screens not yet implemented) ─────

  static const String routeSplash = 'Splash';
  static const String routeOnboarding = 'Onboarding';
  static const String routeLogin = 'Login';
  static const String routeRegister = 'Register';
  static const String routeForgotPassword = 'Forgot Password';
  static const String routeHome = 'Home';
  static const String routeProfile = 'Profile';
  static const String routeSettings = 'Settings';
}
