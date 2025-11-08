import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/domain/entities/competition/competition_input.dart';
// NOVO: Importar entidade de desporto
import 'package:playifs_frontend/presentation/providers/competition/competition_details_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_form_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_form_state.dart';
import 'package:playifs_frontend/presentation/providers/config/app_config_provider.dart';
import 'package:playifs_frontend/presentation/providers/sport/sports_provider.dart'; // NOVO: Importar provider de desportos
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart'; // NOVO: Importar ErrorDisplay

class CompetitionFormPage extends ConsumerStatefulWidget {
  const CompetitionFormPage({super.key, this.competitionId});
  final int? competitionId;

  @override
  ConsumerState<CompetitionFormPage> createState() =>
      _CompetitionFormPageState();
}

class _CompetitionFormPageState extends ConsumerState<CompetitionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String? _selectedLevel;
  // NOVO: Estado para guardar os desportos selecionados.
  final Set<int> _selectedSportIds = {};

  Map<String, String> _fieldErrors = {};
  bool get _isEditMode => widget.competitionId != null;

  @override
  void initState() {
    super.initState();
    if (_isEditMode) {
      final details =
      ref.read(competitionDetailsProvider(widget.competitionId!));
      details.whenData((competition) {
        _nameController.text = competition.name;
        setState(() {
          _selectedLevel = competition.level;
          // NOVO: Inicializar os desportos já associados no modo de edição.
          _selectedSportIds.addAll(
              competition.associatedSports.map((sport) => sport.id));
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
    setState(() {
      _fieldErrors = {};
    });

    if (_formKey.currentState?.validate() ?? false) {
      final input = CompetitionInput(
        name: _nameController.text,
        level: _selectedLevel!,
        // NOVO: Passar a lista de IDs de desportos.
        sportIds: _selectedSportIds.toList(),
      );

      final notifier = ref.read(competitionFormProvider.notifier);
      if (_isEditMode) {
        await notifier.update(widget.competitionId!, input);
      } else {
        await notifier.create(input);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<CompetitionFormState>(competitionFormProvider,
            (previous, next) {
          next.whenOrNull(
            success: (competition) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Competição guardada com sucesso!')),
              );
              context.pop();
            },
            failure: (error) {
              if (error is ValidationException) {
                final errors = <String, String>{};
                for (var fieldError in error.errorDetails.errors) {
                  errors[fieldError.fieldName] = fieldError.message;
                }
                setState(() {
                  _fieldErrors = errors;
                });
                // NOVO: Valida o formulário novamente para mostrar o erro no campo de desportos
                _formKey.currentState?.validate();
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Erro ao Guardar'),
                    content: Text(error.toString()),
                    actions: [
                      TextButton(
                          onPressed: () => context.pop(), child: const Text('OK'))
                    ],
                  ),
                );
              }
            },
          );
        });

    final formState = ref.watch(competitionFormProvider);
    final levelsState = ref.watch(appConfigProvider);
    // NOVO: Observar o provider de desportos.
    final sportsState = ref.watch(sportsProvider);

    return AppScaffold(
      title: _isEditMode ? 'Editar Competição' : 'Nova Competição',
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome da Competição',
                errorText: _fieldErrors['name'],
              ),
              validator: (value) =>
              (value?.isEmpty ?? true) ? 'Campo obrigatório' : null,
            ),
            const SizedBox(height: 16),
            levelsState.when(
              loading: () =>
              const Center(child: CircularProgressIndicator()),
              error: (e, s) =>
              const Text('Erro ao carregar níveis de curso'),
              data: (config) => DropdownButtonFormField<String>(
                initialValue: _selectedLevel,
                decoration: InputDecoration(
                  labelText: 'Nível dos Cursos',
                  errorText: _fieldErrors['level'],
                ),
                hint: const Text('Selecione um nível'),
                items: config.courseLevels
                    .map((level) =>
                    DropdownMenuItem(value: level, child: Text(level)))
                    .toList(),
                onChanged: (value) => setState(() => _selectedLevel = value),
                validator: (value) =>
                value == null ? 'Campo obrigatório' : null,
              ),
            ),
            const SizedBox(height: 24),
            Text('Desportos', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),

            // NOVO: Widget para seleção de desportos.
            FormField<Set<int>>(
              initialValue: _selectedSportIds,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Selecione pelo menos um desporto';
                }
                return null;
              },
              builder: (formFieldState) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sportsState.when(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, s) => ErrorDisplay(
                        error: e,
                        onRetry: () => ref.invalidate(sportsProvider)),
                    data: (sportsPage) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: formFieldState.hasError
                                ? Theme.of(context).colorScheme.error
                                : Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 200),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: sportsPage.content.length,
                          itemBuilder: (context, index) {
                            final sport = sportsPage.content[index];
                            return CheckboxListTile(
                              title: Text(sport.name),
                              value: _selectedSportIds.contains(sport.id),
                              onChanged: (bool? selected) {
                                setState(() {
                                  if (selected == true) {
                                    _selectedSportIds.add(sport.id);
                                  } else {
                                    _selectedSportIds.remove(sport.id);
                                  }
                                  // Notifica o FormField da mudança.
                                  formFieldState.didChange(_selectedSportIds);
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  if (formFieldState.hasError)
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 8),
                      child: Text(
                        formFieldState.errorText!,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            formState.maybeWhen(
              loading: () =>
              const Center(child: CircularProgressIndicator()),
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