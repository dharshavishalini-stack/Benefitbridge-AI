import 'package:flutter/material.dart';

import '../../config/routes/route_names.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import 'widgets/auth_divider.dart';
import 'widgets/auth_layout.dart';
import 'widgets/auth_logo.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/auth_validators.dart';

/// Login screen for returning BenefitBridge AI users.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const String _welcomeTitle = 'Welcome Back';
  static const String _welcomeSubtitle = 'Sign in to continue';
  static const String _rememberMeLabel = 'Remember Me';
  static const String _dividerLabel = 'OR';
  static const String _guestButtonLabel = 'Continue as Guest';
  static const String _noAccountPrompt = "Don't have an account?";
  static const String _registerLinkLabel = 'Register Now';

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _handleLogin() {
  if (!_formKey.currentState!.validate()) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${AppStrings.btnLogin} successful'),
      behavior: SnackBarBehavior.floating,
    ),
  );

  Future.delayed(const Duration(milliseconds: 500), () {
    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      RouteNames.home,
    );
  });
}

  void _navigateToRegister() {
    Navigator.pushNamed(context, RouteNames.register);
  }

  void _navigateToForgotPassword() {
    Navigator.pushNamed(context, RouteNames.forgotPassword);
  }

  void _continueAsGuest() {
    Navigator.pushReplacementNamed(context, RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AuthLayout(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: AuthLogo()),
            const SizedBox(height: 28),
            Text(
              _welcomeTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _welcomeSubtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 28),
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
              controller: _passwordController,
              label: AppStrings.password,
              hint: 'Enter your password',
              textInputAction: TextInputAction.done,
              obscureText: _obscurePassword,
              validator: AuthValidators.password,
              onFieldSubmitted: (_) => _handleLogin(),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: _togglePasswordVisibility,
                tooltip: _obscurePassword ? 'Show password' : 'Hide password',
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _rememberMe,
                    activeColor: AppColors.primaryBlue,
                    onChanged: (value) {
                      setState(() => _rememberMe = value ?? false);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _rememberMeLabel,
                  style: theme.textTheme.bodyMedium,
                ),
                const Spacer(),
                TextButton(
                  onPressed: _navigateToForgotPassword,
                  child: Text(AppStrings.btnForgotPassword),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _handleLogin,
                child: Text(AppStrings.btnLogin),
              ),
            ),
            const SizedBox(height: 24),
            const AuthDivider(label: _dividerLabel),
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              child: OutlinedButton(
                onPressed: _continueAsGuest,
                child: Text(_guestButtonLabel),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _noAccountPrompt,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                TextButton(
                  onPressed: _navigateToRegister,
                  child: Text(
                    _registerLinkLabel,
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
