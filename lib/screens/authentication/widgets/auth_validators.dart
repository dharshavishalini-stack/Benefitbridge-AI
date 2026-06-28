import '../../../core/constants/app_strings.dart';

/// UI-only form validators for the authentication module.
abstract final class AuthValidators {
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Validates that a field is not empty.
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.errorRequiredField;
    }
    return null;
  }

  /// Validates email format.
  static String? email(String? value) {
    final requiredError = required(value);
    if (requiredError != null) return requiredError;

    if (!_emailRegex.hasMatch(value!.trim())) {
      return AppStrings.errorInvalidEmail;
    }
    return null;
  }

  /// Validates password minimum length of 8 characters.
  static String? password(String? value) {
    final requiredError = required(value);
    if (requiredError != null) return requiredError;

    if (value!.length < 8) {
      return AppStrings.errorInvalidPassword;
    }
    return null;
  }

  /// Validates that confirm password matches the original password.
  static String? confirmPassword(String? value, String originalPassword) {
    final requiredError = required(value);
    if (requiredError != null) return requiredError;

    if (value != originalPassword) {
      return AppStrings.errorPasswordMismatch;
    }
    return null;
  }
}
