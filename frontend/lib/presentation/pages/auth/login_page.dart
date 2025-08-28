// lib/presentation/pages/auth/login_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';

import '../../providers/auth/auth_provider.dart';
import '../../providers/auth/auth_state.dart';
import '../../widgets/theme_toggle_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _registrationController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _registrationController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(authProvider.notifier).login(
        _registrationController.text,
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final formErrors = ref.watch(loginFormErrorsProvider);

    ref.listen<AsyncValue<AuthState>>(authProvider, (previous, next) {
      next.whenData((actualState) {
        actualState.whenOrNull(
          failure: (message) {
            if (formErrors.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            }
          },
        );
      });
    });

    final isLoading = authState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - PlayIFS'),
        actions: const [
          ThemeToggleButton(),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Bem-vindo!',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      // ✅ CHAVE ADICIONADA PARA O TESTE
                      key: const ValueKey('login_username_field'),
                      controller: _registrationController,
                      enabled: !isLoading,
                      decoration: InputDecoration(
                        labelText: 'Matrícula',
                        border: const OutlineInputBorder(),
                        errorText: formErrors['registration'],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a sua matrícula.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      // ✅ CHAVE ADICIONADA PARA O TESTE
                      key: const ValueKey('login_password_field'),
                      controller: _passwordController,
                      enabled: !isLoading,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: const OutlineInputBorder(),
                        errorText: formErrors['password'],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a sua senha.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      // ✅ CHAVE ADICIONADA PARA O TESTE
                      key: const ValueKey('login_button'),
                      onPressed: isLoading ? null : _login,
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Entrar'),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => context.pushNamed(AppRoutes.register),
                      child: const Text('Não tem uma conta? Registe-se'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}