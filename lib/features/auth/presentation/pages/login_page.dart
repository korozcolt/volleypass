/// Página de inicio de sesión.
///
/// Pantalla que muestra el formulario de login.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_providers.dart';
import '../state/auth_state.dart';
import '../widgets/login_form.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchar cambios de estado para navegar
    ref.listen<AuthState>(authStateProvider, (previous, next) {
      next.whenOrNull(
        authenticated: (user) {
          // Navegar a Dashboard
          Navigator.of(context).pushReplacementNamed('/dashboard');
        },
      );
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}
