// Ficheiro: lib/presentation/pages/competition/competition_details_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_details_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_form_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/competition_form_state.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class CompetitionDetailsPage extends ConsumerWidget {
  const CompetitionDetailsPage({super.key, required this.competitionId});
  final int competitionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ouve o provider do formulário para reagir ao sucesso da exclusão.
    ref.listen<CompetitionFormState>(competitionFormNotifierProvider, (previous, next) {
      next.whenOrNull(
        deleteSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Competição apagada com sucesso!')),
          );
          // Volta para a lista de competições.
          context.goNamed(AppRoutes.competitions);
        },
      );
    });

    final detailsState = ref.watch(competitionDetailsNotifierProvider(competitionId));

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
        data: (competition) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(competition.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Nível: ${competition.level}'),
            const Divider(height: 32),

            // ✅ ADICIONADO: Ponto de entrada para a gestão de técnicos.
            ListTile(
              leading: const Icon(Icons.person_pin_outlined),
              title: const Text('Gerir Técnicos Designados'),
              subtitle: const Text('Definir quem pode inscrever equipas'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.pushNamed(
                AppRoutes.designatedCoaches,
                pathParameters: {'id': competitionId.toString()},
              ),
            ),

            // TODO: Adicionar botões de ação (ex: Gerir Equipas) e outras informações.
            ListTile(
              leading: const Icon(Icons.groups_outlined),
              title: const Text('Ver Equipas Inscritas'),
              subtitle: const Text('Acompanhe os participantes'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navega para a lista de equipas, passando o ID da competição
                // como um query parameter para que a lista já venha filtrada.
                // (Isto requer que a TeamsListPage saiba ler este parâmetro)
                debugPrint('------------- ID da competição: $competitionId');
                context.push('${AppRoutes.teams}?competitionId=$competitionId');

              },
            ),
          ],
        ),
      ),
    );
  }
}