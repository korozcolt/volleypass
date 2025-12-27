/// Formulario de inicio de sesión.
///
/// Widget que maneja el formulario de login con validaciones.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/theme/app_spacing.dart';
import '../providers/auth_providers.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      ref.read(authStateProvider.notifier).login(
            _emailController.text.trim(),
            _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);

    return Padding(
      padding: AppSpacing.paddingLG,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo
            const Icon(
              Icons.sports_volleyball,
              size: 80,
              color: AppColors.primary,
            ),
            AppSpacing.verticalSpaceXL,

            // Título
            Text(
              'Iniciar Sesión',
              style: AppTextStyles.h3,
              textAlign: TextAlign.center,
            ),
            AppSpacing.verticalSpaceSM,

            Text(
              'Ingresa tus credenciales para continuar',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.verticalSpaceXL,

            // Email Field
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'ejemplo@correo.com',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su email';
                }
                if (!AppConstants.emailRegex.hasMatch(value)) {
                  return 'Email inválido (sin acentos permitidos)';
                }
                return null;
              },
              enabled: !authState.maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
            ),
            AppSpacing.verticalSpaceMD,

            // Password Field
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _handleLogin(),
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: '••••••••',
                prefixIcon: const Icon(Icons.lock_outlined),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su contraseña';
                }
                if (value.length < AppConstants.minPasswordLength) {
                  return 'La contraseña debe tener al menos ${AppConstants.minPasswordLength} caracteres';
                }
                return null;
              },
              enabled: !authState.maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
            ),
            AppSpacing.verticalSpaceXL,

            // Login Button
            SizedBox(
              height: AppSpacing.buttonHeightMedium,
              child: ElevatedButton(
                onPressed: authState.maybeWhen(
                  loading: () => null,
                  orElse: () => _handleLogin,
                ),
                child: authState.maybeWhen(
                  loading: () => const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.textOnDark,
                      ),
                    ),
                  ),
                  orElse: () => const Text('Iniciar Sesión'),
                ),
              ),
            ),

            // Error message
            authState.whenOrNull(
              error: (message) => Padding(
                padding: AppSpacing.paddingVerticalMD,
                child: Container(
                  padding: AppSpacing.paddingMD,
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.1),
                    borderRadius: AppSpacing.borderRadiusSM,
                    border: Border.all(
                      color: AppColors.error,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                      ),
                      AppSpacing.horizontalSpaceSM,
                      Expanded(
                        child: Text(
                          message,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ) ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
