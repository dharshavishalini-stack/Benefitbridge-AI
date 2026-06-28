import 'package:flutter/material.dart';

import '../../config/routes/route_names.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import 'widgets/auth_layout.dart';
import 'widgets/auth_logo.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/auth_validators.dart';

/// Registration screen for new BenefitBridge AI users.
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static const String _registerTitle = 'Create Account';
  static const String _registerSubtitle =
      'Join BenefitBridge AI to discover your eligible schemes';
  static const String _termsLabel = 'I agree to the Terms & Conditions';
  static const String _termsError =
      'You must agree to the Terms & Conditions to continue.';
  static const String _hasAccountPrompt = 'Already have an account?';

  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
  }

  void _handleRegister() {
    if (!_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(_termsError),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account created successfully'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.pushNamed(context, RouteNames.login);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AuthLayout(
      showBackButton: true,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: AuthLogo()),
            const SizedBox(height: 24),
            Text(
              _registerTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _registerSubtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            AuthTextField(
              controller: _fullNameController,
              label: AppStrings.fullName,
              hint: 'Enter your full name',
              textInputAction: TextInputAction.next,
              validator: AuthValidators.required,
            ),
            const SizedBox(height: 16),
            AuthTextField(
              controller: _emailController,
              label: AppStrings.email,
              hint: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: AuthValidators.email,
            ),
            const SizedBox(height: 16),
            AuthTextField(
              controller: _phoneController,
              label: AppStrings.phoneNumber,
              hint: 'Enter your phone number',
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              validator: AuthValidators.required,
            ),
            const SizedBox(height: 16),
            AuthTextField(
              controller: _passwordController,
              label: AppStrings.password,
              hint: 'Create a password',
              textInputAction: TextInputAction.next,
              obscureText: _obscurePassword,
              validator: AuthValidators.password,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            const SizedBox(height: 16),
            AuthTextField(
              controller: _confirmPasswordController,
              label: AppStrings.confirmPassword,
              hint: 'Re-enter your password',
              textInputAction: TextInputAction.done,
              obscureText: _obscureConfirmPassword,
              validator: (value) => AuthValidators.confirmPassword(
                value,
                _passwordController.text,
              ),
              onFieldSubmitted: (_) => _handleRegister(),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: _toggleConfirmPasswordVisibility,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _agreedToTerms,
                    activeColor: AppColors.primaryBlue,
                    onChanged: (value) {
                      setState(() => _agreedToTerms = value ?? false);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _agreedToTerms = !_agreedToTerms);
                    },
                    child: Text(
                      _termsLabel,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _handleRegister,
                child: const Text('Create Account'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _hasAccountPrompt,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                TextButton(
                  onPressed: _navigateToLogin,
                  child: Text(
                    AppStrings.btnLogin,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
