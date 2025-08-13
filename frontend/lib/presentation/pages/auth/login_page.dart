// Ficheiro: lib/presentation/pages/auth/login_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    // A variável 'authState' agora é do tipo AsyncValue<AuthState>.
    final authState = ref.watch(authProvider);
    final formErrors = ref.watch(loginFormErrorsProvider);

    // CORREÇÃO 1: O 'listen' agora espera um AsyncValue<AuthState>.
    ref.listen<AsyncValue<AuthState>>(authProvider, (previous, next) {
      // Usamos .whenData para agir apenas quando o provider tem um valor (não está a carregar/erro).
      next.whenData((actualState) {
        // Agora, dentro do .whenData, 'actualState' é o nosso AuthState.
        // Usamos o seu .whenOrNull para o efeito colateral.
        actualState.whenOrNull(
          failure: (message) {
            // Evita mostrar o SnackBar para erros de validação que já estão nos campos
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

    // CORREÇÃO 2: A forma correta de verificar se um AsyncValue está a carregar
    // é simplesmente aceder à sua propriedade '.isLoading'.
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
                      onPressed: isLoading ? null : _login,
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Entrar'),
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