import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/domain/entities/sport/sport_summary.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/competition_stages.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_details_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_form_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_form_state.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

// Provider para armazenar o esporte selecionado no dropdown
final _selectedSportIdProvider = StateProvider<int?>((ref) => null);

/// Página de detalhes da competição — versão compatível com Riverpod 3.x
class CompetitionDetailsPage extends ConsumerWidget {
  const CompetitionDetailsPage({super.key, required this.competitionId});
  final int competitionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ Ouve sucesso na exclusão e redireciona para lista
    ref.listen<CompetitionFormState>(
      competitionFormProvider,
          (previous, next) {
        next.whenOrNull(
          deleteSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Competição apagada com sucesso!')),
            );
            context.pushNamed(AppRoutes.competitions);
          },
        );
      },
    );

    // ✅ Observa detalhes da competição
    final detailsState = ref.watch(competitionDetailsProvider(competitionId));
    final selectedSportId = ref.watch(_selectedSportIdProvider);

    // ✅ Auto-seleciona o primeiro esporte associado quando os dados chegam
    ref.listen(competitionDetailsProvider(competitionId), (previous, next) {
      next.whenData((competition) {
        final hasSportSelected = ref.read(_selectedSportIdProvider) != null;
        if (!hasSportSelected && competition.associatedSports.isNotEmpty) {
          ref.read(_selectedSportIdProvider.notifier).state =
              competition.associatedSports.first.id;
        }
      });
    });

    return AppScaffold(
      title: 'Detalhes da Competição',
      fab: FloatingActionButton(
        tooltip: 'Editar Competição',
        onPressed: () => context.pushNamed(
          AppRoutes.editCompetition,
          pathParameters: {'id': competitionId.toString()},
        ),
        child: const Icon(Icons.edit),
      ),
      body: detailsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(competitionDetailsProvider(competitionId)),
        ),
        data: (competition) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              competition.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text('Nível: ${competition.level}'),
            Text('Status: ${competition.status ?? 'Não informado'}'),
            const Divider(height: 32),

            // Ações administrativas
            ListTile(
              leading: const Icon(Icons.person_pin_outlined),
              title: const Text('Gerir Técnicos Designados'),
              onTap: () => context.pushNamed(
                AppRoutes.designatedCoaches,
                pathParameters: {'id': competitionId.toString()},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.groups_outlined),
              title: const Text('Ver Equipas Inscritas'),
              onTap: () => context.pushNamed(
                AppRoutes.teams,
                queryParameters: {'competitionId': competitionId.toString()},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.sports_soccer_outlined),
              title: const Text('Ver Lista de Jogos (Todos)'),
              onTap: () => context.pushNamed(
                AppRoutes.games,
                queryParameters: {'competitionId': competitionId.toString()},
              ),
            ),

            const Divider(height: 32),

            Text(
              'Fases do Torneio',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            // Dropdown de esportes
            if (competition.associatedSports.isNotEmpty)
              DropdownButtonFormField<int>(
                initialValue: selectedSportId,
                items: competition.associatedSports
                    .map(
                      (SportSummary sport) => DropdownMenuItem<int>(
                    value: sport.id,
                    child: Text(sport.name),
                  ),
                )
                    .toList(),
                onChanged: (int? newValue) {
                  ref.read(_selectedSportIdProvider.notifier).state = newValue;
                },
                decoration: const InputDecoration(
                  labelText: 'Selecionar Desporto',
                  border: OutlineInputBorder(),
                ),
              )
            else
              const Text('Nenhum desporto associado a esta competição.'),

            const SizedBox(height: 16),

            // Tabs de Fase de Grupos e Eliminação
            if (selectedSportId != null)
              CompetitionStages(
                competitionId: competitionId,
                sportId: selectedSportId,
              ),
          ],
        ),
      ),
    );
  }
}
