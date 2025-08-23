// Ficheiro: lib/presentation/pages/competition/competition_form_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/network/exceptions.dart'; // ✅ Importar exceções
import 'package:playifs_frontend/domain/entities/competition/competition_input.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_details_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_form_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_form_state.dart';
import 'package:playifs_frontend/presentation/providers/config/app_config_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';

class CompetitionFormPage extends ConsumerStatefulWidget {
  const CompetitionFormPage({super.key, this.competitionId});
  final int? competitionId;

  @override
  ConsumerState<CompetitionFormPage> createState() => _CompetitionFormPageState();
}

class _CompetitionFormPageState extends ConsumerState<CompetitionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String? _selectedLevel;

  // ✅ 1. ESTADO LOCAL PARA ARMAZENAR OS ERROS DE CAMPO
  Map<String, String> _fieldErrors = {};

  bool get _isEditMode => widget.competitionId != null;

  @override
  void initState() {
    super.initState();
    if (_isEditMode) {
      final details = ref.read(competitionDetailsNotifierProvider(widget.competitionId!));
      details.whenData((competition) {
        _nameController.text = competition.name;
        setState(() {
          _selectedLevel = competition.level;
        });
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    // Limpa os erros antigos antes de uma nova submissão.
    setState(() {
      _fieldErrors = {};
    });

    if (_formKey.currentState?.validate() ?? false) {
      final input = CompetitionInput(
        name: _nameController.text,
        level: _selectedLevel!,
      );

      final notifier = ref.read(competitionFormNotifierProvider.notifier);
      if (_isEditMode) {
        await notifier.update(widget.competitionId!, input);
      } else {
        await notifier.create(input);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<CompetitionFormState>(competitionFormNotifierProvider, (previous, next) {
      next.whenOrNull(
        success: (competition) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Competição guardada com sucesso!')),
          );
          context.pop();
        },
        failure: (error) {
          // ✅ 2. LÓGICA PARA TRATAR A VALIDATIONEXCEPTION
          if (error is ValidationException) {
            // Se o erro for de validação, extrai os erros de campo.
            final errors = <String, String>{};
            for (var fieldError in error.errorDetails.errors) {
              errors[fieldError.fieldName] = fieldError.message;
            }
            setState(() {
              _fieldErrors = errors;
            });
          } else {
            // Para outros erros, mostra um dialog genérico.
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Erro ao Guardar'),
                content: Text(error.toString()),
                actions: [TextButton(onPressed: () => context.pop(), child: const Text('OK'))],
              ),
            );
          }
        },
      );
    });

    final formState = ref.watch(competitionFormNotifierProvider);
    final levelsState = ref.watch(appConfigNotifierProvider);

    return AppScaffold(
      title: _isEditMode ? 'Editar Competição' : 'Nova Competição',
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              // ✅ 3. EXIBIR O ERRO DE VALIDAÇÃO NO CAMPO CORRETO
              decoration: InputDecoration(
                labelText: 'Nome da Competição',
                errorText: _fieldErrors['name'],
              ),
              validator: (value) => (value?.isEmpty ?? true) ? 'Campo obrigatório' : null,
            ),
            const SizedBox(height: 16),
            levelsState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => const Text('Erro ao carregar níveis de curso'),
              data: (config) => DropdownButtonFormField<String>(
                initialValue: _selectedLevel,
                decoration: InputDecoration(
                  labelText: 'Nível dos Cursos',
                  errorText: _fieldErrors['level'],
                ),
                hint: const Text('Selecione um nível'),
                items: config.courseLevels
                    .map((level) => DropdownMenuItem(value: level, child: Text(level)))
                    .toList(),
                onChanged: (value) => setState(() => _selectedLevel = value),
                validator: (value) => value == null ? 'Campo obrigatório' : null,
              ),
            ),
            const SizedBox(height: 24),
            formState.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}