import 'package:flutter/material.dart';

import '../../config/routes/route_names.dart';
import '../../core/constants/app_strings.dart';
import 'widgets/auth_layout.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/auth_validators.dart';

/// Forgot password screen for password reset requests.
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  static const String _title = 'Forgot Password';
  static const String _description =
      'Enter your email address to receive password reset instructions.';
  static const String _sendResetLabel = 'Send Reset Link';
  static const String _backToLoginLabel = 'Back to Login';

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSendResetLink() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset link sent to your email'),
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
            Icon(
              Icons.lock_reset_outlined,
              size: 56,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              _title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 28),
            AuthTextField(
              controller: _emailController,
              label: AppStrings.email,
              hint: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: AuthValidators.email,
              onFieldSubmitted: (_) => _handleSendResetLink(),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _handleSendResetLink,
                child: const Text(_sendResetLabel),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 48,
              child: OutlinedButton(
                onPressed: _navigateToLogin,
                child: const Text(_backToLoginLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
