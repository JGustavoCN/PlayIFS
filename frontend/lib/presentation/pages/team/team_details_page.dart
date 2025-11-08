import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/presentation/providers/team/team_details_provider.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

import '../../widgets/app_scaffold.dart';

// ✅ PASSO 1: Convertido para ConsumerStatefulWidget para gerir o estado da UI.
class TeamDetailsPage extends ConsumerStatefulWidget {
  const TeamDetailsPage({super.key, required this.teamId});
  final int teamId;

  @override
  ConsumerState<TeamDetailsPage> createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends ConsumerState<TeamDetailsPage> {
  // ✅ PASSO 2: Adicionado estado local para o modo de seleção do elenco.
  bool _isAthleteSelectionMode = false;
  final Set<int> _selectedAthleteIds = {};

  void _toggleAthleteSelection(int athleteId) {
    setState(() {
      if (_selectedAthleteIds.contains(athleteId)) {
        _selectedAthleteIds.remove(athleteId);
      } else {
        _selectedAthleteIds.add(athleteId);
      }
    });
  }

  void _enterAthleteSelectionMode() {
    setState(() {
      _isAthleteSelectionMode = true;
    });
  }

  void _exitAthleteSelectionMode() {
    setState(() {
      _isAthleteSelectionMode = false;
      _selectedAthleteIds.clear();
    });
  }

  Future<void> _removeSelectedAthletes() async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Remover ${_selectedAthleteIds.length} atletas?'),
        content: const Text('Esta ação não pode ser desfeita.'),
        actions: [
          TextButton(onPressed: () => context.pop(false), child: const Text('Cancelar')),
          TextButton(onPressed: () => context.pop(true), style: TextButton.styleFrom(foregroundColor: Colors.red), child: const Text('Remover')),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(teamDetailsProvider(widget.teamId).notifier).removeAthletes(_selectedAthleteIds.toList());
      _exitAthleteSelectionMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    final teamDetailsAsync = ref.watch(teamDetailsProvider(widget.teamId));

    return AppScaffold(
      title: 'Detalhes da Equipa',
      actions: [
        if (teamDetailsAsync.hasValue && !_isAthleteSelectionMode)
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'delete') {
                final bool? confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirmar Exclusão'),
                    content: const Text('Tem a certeza de que deseja apagar esta equipa? Esta ação não pode ser desfeita.'),
                    actions: [
                      TextButton(onPressed: () => context.pop(false), child: const Text('Cancelar')),
                      TextButton(
                        onPressed: () => context.pop(true),
                        style: TextButton.styleFrom(foregroundColor: Colors.red),
                        child: const Text('Apagar'),
                      ),
                    ],
                  ),
                );

                if (confirmed == true && context.mounted) {
                  await ref.read(teamDetailsProvider(widget.teamId).notifier).deleteTeam();
                  if (context.mounted) context.goNamed(AppRoutes.teams);
                }
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(value: 'delete', child: Text('Apagar Equipa')),
            ],
          ),
      ],
      // ✅ PASSO 5: Barra inferior contextual para as ações do elenco.
      bottomNavigationBar: _isAthleteSelectionMode
          ? BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _exitAthleteSelectionMode,
              tooltip: 'Cancelar Seleção',
            ),
            Text('${_selectedAthleteIds.length} selecionados'),
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Remover Selecionados',
              color: Theme.of(context).colorScheme.error,
              onPressed: _selectedAthleteIds.isNotEmpty ? _removeSelectedAthletes : null,
            ),
          ],
        ),
      )
          : null,
      body: teamDetailsAsync.when(
        data: (team) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(team.name, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text('Técnico: ${team.coachName}'),
              Text('Competição: ${team.competitionName}'),
              Text('Desporto: ${team.sportName}'),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Elenco', style: Theme.of(context).textTheme.titleLarge),
                  // ✅ PASSO 3: Botão para entrar no modo de seleção.
                  if (!_isAthleteSelectionMode && team.athletes.isNotEmpty)
                    TextButton.icon(
                      icon: const Icon(Icons.edit_note),
                      label: const Text('Gerir'),
                      onPressed: _enterAthleteSelectionMode,
                    ),
                ],
              ),
              const Divider(),
              if (team.athletes.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(child: Text('Nenhum atleta na equipa.')),
                )
              else
                ...team.athletes.map((athlete) {
                  final isSelected = _selectedAthleteIds.contains(athlete.id);
                  // ✅ PASSO 4: ListTile adaptável ao modo de seleção.
                  return ListTile(
                    onTap: _isAthleteSelectionMode ? () => _toggleAthleteSelection(athlete.id) : null,
                    leading: _isAthleteSelectionMode
                        ? Checkbox(
                      value: isSelected,
                      onChanged: (_) => _toggleAthleteSelection(athlete.id),
                    )
                        : const Icon(Icons.person_outline),
                    title: Text(athlete.fullName),
                    subtitle: Text(athlete.registration),
                    trailing: !_isAthleteSelectionMode
                        ? IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () async {
                        // A remoção individual continua a funcionar.
                        await ref.read(teamDetailsProvider(widget.teamId).notifier).removeSingleAthlete(athlete.id);
                      },
                    )
                        : null,
                  );
                }),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      // ✅ CORREÇÃO: Usando a nova rota genérica, sem parâmetros de URL.
                      final List<int>? selectedIds = await context.pushNamed<List<int>>(
                        AppRoutes.athleteSelection,
                      );
                      if (selectedIds != null && selectedIds.isNotEmpty && context.mounted) {
                        await ref.read(teamDetailsProvider(widget.teamId).notifier).addAthletes(selectedIds);
                      }
                    },
                    child: const Text('Adicionar Atletas'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      context.goNamed(
                        AppRoutes.teamEdit,
                        pathParameters: {'teamId': team.id.toString()},
                        extra: team,
                      );
                    },
                    child: const Text('Editar Nome'),
                  ),
                ],
              ),
              // Adiciona espaço extra para não ser coberto pela BottomAppBar
              if (_isAthleteSelectionMode) const SizedBox(height: 60),
            ],
          ),
        ),
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(teamDetailsProvider(widget.teamId)),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}