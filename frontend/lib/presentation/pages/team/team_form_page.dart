import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/network/exceptions.dart'; // ✅ Import das suas exceções
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/domain/entities/team/team_details.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart';
import 'package:playifs_frontend/presentation/providers/team/team_form_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';

class TeamFormPage extends ConsumerStatefulWidget {

  const TeamFormPage({
    super.key,
    this.team,
    this.competitionId,
    this.sportId,
    this.courseId,
  }) : assert(
  (team != null) || (competitionId != null && sportId != null && courseId != null),
  'Em modo de criação, os IDs de contexto são obrigatórios.',
  );
  final TeamDetails? team;
  final int? competitionId;
  final int? sportId;
  final int? courseId;

  @override
  ConsumerState<TeamFormPage> createState() => _TeamFormPageState();
}

class _TeamFormPageState extends ConsumerState<TeamFormPage> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Set<int> _selectedAthleteIds = {};

  @override
  void initState() {
    super.initState();
    final team = widget.team;
    if (team != null) {
      _nameController.text = team.name;
      _selectedAthleteIds.addAll(team.athletes.map((a) => a.id));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _selectAthletes() async {
    final List<int>? result = await context.pushNamed<List<int>>(AppRoutes.athleteSelection);
    if (result != null) {
      setState(() {
        _selectedAthleteIds.clear();
        _selectedAthleteIds.addAll(result);
      });
    }
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final profile = ref.read(profileNotifierProvider).value;
    final athleteDetails = profile?.athleteDetails;
    if (athleteDetails == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro: Perfil de atleta não encontrado.')),
        );
      }
      return;
    }
    final coachId = athleteDetails.id;
    _selectedAthleteIds.add(coachId);

    if (widget.team == null && _selectedAthleteIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('É necessário selecionar pelo menos um atleta para o elenco.')),
      );
      return;
    }

    await ref.read(teamFormNotifierProvider(initialTeam: widget.team).notifier).submit(
      teamName: _nameController.text,
      initialTeam: widget.team,
      competitionId: widget.competitionId,
      sportId: widget.sportId,
      courseId: widget.courseId,
      coachId: coachId,
      athleteIds: _selectedAthleteIds.toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
      teamFormNotifierProvider(initialTeam: widget.team),
          (previous, next) {
        next.whenOrNull(
          data: (_) {
            if (previous is AsyncLoading) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Equipa salva com sucesso!')));
              // ✅ CORREÇÃO: Retornamos 'true' para a página anterior saber do sucesso.
              context.pop(true);
            }
          },
          error: (error, stack) {
            // ✅ CORREÇÃO: Verificando pelos tipos de erro corretos do seu projeto.
            String errorMessage;
            if (error is ApiException) {
              errorMessage = error.message;
            } else if (error is ValidationException) {
              errorMessage = error.toString(); // Ou uma mensagem mais detalhada
            } else {
              errorMessage = 'Ocorreu um erro inesperado.';
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          },
        );
      },
    );

    final formActionState = ref.watch(teamFormNotifierProvider(initialTeam: widget.team));
    final isEditing = widget.team != null;
    final isFormValid = (_nameController.text.trim().isNotEmpty) && (isEditing || _selectedAthleteIds.isNotEmpty);

    return AppScaffold(
      title: isEditing ? 'Editar Equipa' : 'Nova Equipa',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome da Equipa'),
                onChanged: (value) => setState(() {}),
                validator: (value) => (value == null || value.trim().isEmpty) ? 'O nome é obrigatório.' : null,
              ),
              const SizedBox(height: 16),
              if (!isEditing)
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.people_outline),
                    title: const Text('Elenco Inicial'),
                    subtitle: Text('${_selectedAthleteIds.length} atletas selecionados'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: _selectAthletes,
                  ),
                ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: isFormValid && !formActionState.isLoading ? _submit : null,
                child: formActionState.isLoading
                    ? const SizedBox.square(dimension: 24, child: CircularProgressIndicator(strokeWidth: 3, color: Colors.white))
                    : const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}