// lib/presentation/pages/athlete/edit_athlete_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_details.dart';
import 'package:playifs_frontend/domain/entities/athlete/athlete_update.dart';
import 'package:playifs_frontend/presentation/providers/athlete/athlete_form_provider.dart';
import 'package:playifs_frontend/presentation/providers/athlete/athlete_provider.dart';
import 'package:playifs_frontend/presentation/providers/auth/auth_provider.dart';
import 'package:playifs_frontend/presentation/providers/auth/auth_state.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart';

class EditAthletePage extends ConsumerWidget {
  const EditAthletePage({super.key, required this.athleteId});
  final int athleteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final athleteDetailsAsync = ref.watch(athleteDetailsProvider(athleteId));

    return Scaffold(
      appBar: AppBar(title: const Text('Editar Perfil de Atleta')),
      body: athleteDetailsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) =>
            Center(child: Text('Erro ao carregar dados: ${err.toString()}')),
        data: (athlete) => _EditAthleteForm(athlete: athlete),
      ),
    );
  }
}

class _EditAthleteForm extends ConsumerStatefulWidget {
  const _EditAthleteForm({required this.athlete});
  final AthleteDetails athlete;

  @override
  ConsumerState<_EditAthleteForm> createState() => __EditAthleteFormState();
}

class __EditAthleteFormState extends ConsumerState<_EditAthleteForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _registrationController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _nicknameController;
  late final TextEditingController _phoneController;

  Map<String, String> _fieldErrors = {};

  @override
  void initState() {
    super.initState();
    _registrationController =
        TextEditingController(text: widget.athlete.registration);
    _fullNameController = TextEditingController(text: widget.athlete.fullName);
    _emailController = TextEditingController(text: widget.athlete.email);
    _nicknameController = TextEditingController(text: widget.athlete.nickname);
    _phoneController = TextEditingController(text: widget.athlete.phone);
  }

  @override
  void dispose() {
    _registrationController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _nicknameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    setState(() => _fieldErrors = {});
    if (!_formKey.currentState!.validate()) return;

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = GoRouter.of(context);

    final oldRegistration = widget.athlete.registration;
    final newRegistration = _registrationController.text;

    final athleteUpdate = AthleteUpdate(
      registration: newRegistration,
      fullName: _fullNameController.text,
      email: _emailController.text,
      nickname: _nicknameController.text,
      phone: _phoneController.text,
    );

    final success = await ref
        .read(athleteFormProvider.notifier)
        .updateAthlete(widget.athlete.id, athleteUpdate);

    if (success && mounted) {
      final authState = ref.read(authProvider).value;
      final isEditingSelf = authState?.maybeWhen(
        authenticated: (profile) =>
        profile.athleteDetails?.id == widget.athlete.id,
        orElse: () => false,
      ) ??
          false;

      if (isEditingSelf && oldRegistration != newRegistration) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content:
            Text('Matrícula atualizada! Por favor, faça login novamente.'),
            backgroundColor: Colors.green,
          ),
        );
        await ref.read(authProvider.notifier).logout();
      } else {
        if (isEditingSelf) {
          final _ = await ref.refresh(profileNotifierProvider.future);
        }

        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Perfil atualizado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        navigator.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(athleteFormProvider, (_, state) {
      state.whenOrNull(
        error: (err, stack) {
          if (!mounted) return;
          setState(() {
            if (err is ValidationException) {
              _fieldErrors = {
                for (var e in err.errorDetails.errors) e.fieldName: e.message
              };
            } else if (err is ApiException) {
              if (err.statusCode == 403) {
                _fieldErrors = {
                  'form': 'Você não tem permissão para editar este perfil.'
                };
              } else if (err.message
                  .contains('matrícula informada já existe')) {
                _fieldErrors = {'registration': err.message};
              } else {
                _fieldErrors = {'form': err.message};
              }
            }
          });
        },
      );
    });

    final formState = ref.watch(athleteFormProvider);
    final isLoading = formState.isLoading;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_fieldErrors.containsKey('form')) ...[
              Text(
                _fieldErrors['form']!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(height: 16),
            ],
            TextFormField(
              controller: _registrationController,
              enabled: !isLoading,
              decoration: InputDecoration(
                labelText: 'Matrícula',
                errorText: _fieldErrors['registration'],
              ),
              validator: (v) => (v?.isEmpty ?? true) ? 'Obrigatório' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              // ✅ CHAVE ADICIONADA PARA O TESTE
              key: const ValueKey('edit_athlete_fullName_field'),
              controller: _fullNameController,
              enabled: !isLoading,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
                errorText: _fieldErrors['fullName'],
              ),
              validator: (v) => (v?.isEmpty ?? true) ? 'Obrigatório' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nicknameController,
              enabled: !isLoading,
              decoration: InputDecoration(
                labelText: 'Alcunha (Opcional)',
                errorText: _fieldErrors['nickname'],
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              enabled: !isLoading,
              decoration: InputDecoration(
                labelText: 'Telefone (Opcional)',
                errorText: _fieldErrors['phone'],
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              enabled: !isLoading,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _fieldErrors['email'],
              ),
              validator: (v) => (v?.isEmpty ?? true) ? 'Obrigatório' : null,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              // ✅ CHAVE ADICIONADA PARA O TESTE
              key: const ValueKey('edit_athlete_save_button'),
              onPressed: isLoading ? null : _submitForm,
              child: isLoading
                  ? const SizedBox.square(
                  dimension: 24, child: CircularProgressIndicator())
                  : const Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}