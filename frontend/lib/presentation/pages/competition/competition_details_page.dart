import 'package:flutter/material.dart';
// CORREÇÃO: Adicionar o import principal do flutter_riverpod para ter acesso ao StateProvider.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/domain/entities/sport/sport_summary.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/competition_stages.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_details_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_form_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_form_state.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

// Provider para gerir o estado do desporto selecionado.
final _selectedSportIdProvider = StateProvider<int?>((ref) => null);

// A página é um ConsumerWidget, mais simples e eficiente.
class CompetitionDetailsPage extends ConsumerWidget {
  const CompetitionDetailsPage({super.key, required this.competitionId});
  final int competitionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<CompetitionFormState>(competitionFormNotifierProvider, (previous, next) {
      next.whenOrNull(
        deleteSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Competição apagada com sucesso!')),
          );
          context.goNamed(AppRoutes.competitions);
        },
      );
    });

    final detailsState = ref.watch(competitionDetailsNotifierProvider(competitionId));
    final selectedSportId = ref.watch(_selectedSportIdProvider);

    ref.listen(competitionDetailsNotifierProvider(competitionId), (previous, next) {
      next.whenData((competition) {
        if (ref.read(_selectedSportIdProvider) == null && competition.associatedSports.isNotEmpty) {
          ref.read(_selectedSportIdProvider.notifier).state = competition.associatedSports.first.id;
        }
      });
    });

    return AppScaffold(
      title: 'Detalhes da Competição',
      fab: FloatingActionButton(
        onPressed: () => context.pushNamed(
          AppRoutes.editCompetition,
          pathParameters: {'id': competitionId.toString()},
        ),
        tooltip: 'Editar Competição',
        child: const Icon(Icons.edit),
      ),
      body: detailsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(competitionDetailsNotifierProvider(competitionId)),
        ),
        data: (competition) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // CORREÇÃO: Usar o nome correto do provider: 'profileProvider'
                'DEBUG - Roles: ${ref.watch(profileNotifierProvider).value?.roles}',
                style: TextStyle(backgroundColor: Colors.yellow.shade200, color: Colors.black),
              ),
              Text(competition.name, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('Nível: ${competition.level}'),
              Text('Status: ${competition.status ?? 'Não informado'}'),
              const Divider(height: 32),
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
                onTap: () => context.push('${AppRoutes.teams}?competitionId=$competitionId'),
              ),
              const Divider(height: 32),
              Text(
                'Fases do Torneio',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              if (competition.associatedSports.isNotEmpty)
                DropdownButtonFormField<int>(
                  initialValue: selectedSportId,
                  items: competition.associatedSports
                      .map((SportSummary sport) => DropdownMenuItem<int>(
                    value: sport.id,
                    child: Text(sport.name),
                  ))
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
              if (selectedSportId != null)
                Expanded(
                  child: CompetitionStages(
                    competitionId: competitionId,
                    sportId: selectedSportId,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}