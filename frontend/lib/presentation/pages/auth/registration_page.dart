import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_input.dart';
import 'package:playifs_frontend/presentation/providers/athlete/athlete_form_provider.dart';
import 'package:playifs_frontend/presentation/providers/auth/auth_provider.dart'; // ✅ Importar o authProvider

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _registrationController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Map<String, String> _fieldErrors = {};

  @override
  void dispose() {
    _registrationController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    setState(() => _fieldErrors = {});

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final registration = _registrationController.text;
    final password = _passwordController.text;

    final athleteInput = AthleteInput(
      registration: registration,
      fullName: _fullNameController.text,
      email: _emailController.text,
      password: password,
    );

    final success = await ref
        .read(athleteFormProvider.notifier)
        .createAthlete(athleteInput);

    if (success && mounted) {
      final currentRoute = GoRouterState.of(context).matchedLocation;

      if (currentRoute == AppRoutes.createAthlete) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Atleta registado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        _formKey.currentState?.reset();
        _registrationController.clear();
        _fullNameController.clear();
        _emailController.clear();
        _passwordController.clear();
      } else {
        // ✅ CORREÇÃO: Após o registo, faz o login para atualizar o estado da app.
        // O GoRouter irá redirecionar automaticamente para a home.
        await ref.read(authProvider.notifier).login(registration, password);
      }
    }
  }

  // ... (o resto do ficheiro permanece exatamente igual)
  @override
  Widget build(BuildContext context) {
    // Listener robusto para tratar os diferentes tipos de erro.
    ref.listen<AsyncValue<void>>(athleteFormProvider, (_, state) {
      state.whenOrNull(
        error: (err, stack) {
          setState(() {
            if (err is ValidationException) {
              _fieldErrors = {
                for (var e in err.errorDetails.errors) e.fieldName: e.message
              };
            } else if (err is ApiException) {
              if (err.message.contains('matrícula informada já existe')) {
                _fieldErrors = {'registration': err.message};
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ocorreu um erro: ${err.message}'),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              }
            }
          });
        },
      );
    });

    final formState = ref.watch(athleteFormProvider);
    final isLoading = formState.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Registar Novo Atleta')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _registrationController,
                enabled: !isLoading,
                decoration: InputDecoration(
                  labelText: 'Matrícula',
                  errorText: _fieldErrors['registration'],
                ),
                validator: (value) =>
                (value?.isEmpty ?? true) ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _fullNameController,
                enabled: !isLoading,
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                  errorText: _fieldErrors['fullName'],
                ),
                validator: (value) =>
                (value?.isEmpty ?? true) ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                enabled: !isLoading,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _fieldErrors['email'],
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                (value?.isEmpty ?? true) ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                enabled: !isLoading,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  errorText: _fieldErrors['password'],
                ),
                obscureText: true,
                validator: (value) =>
                (value?.length ?? 0) < 6 ? 'Mínimo de 6 caracteres' : null,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: isLoading ? null : _submitForm,
                child: isLoading
                    ? const SizedBox.square(
                    dimension: 24, child: CircularProgressIndicator())
                    : const Text('Registar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}