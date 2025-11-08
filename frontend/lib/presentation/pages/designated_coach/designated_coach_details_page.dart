import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/presentation/providers/designated_coach/designated_coach_details_provider.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart'; // ✅ 1. IMPORTAR O PROFILE PROVIDER
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class DesignatedCoachDetailsPage extends ConsumerWidget {
  const DesignatedCoachDetailsPage({super.key, required this.designationId});
  final int designationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsState = ref.watch(designatedCoachDetailsProvider(designationId));
    // ✅ 2. OBSERVAR O ESTADO DO PERFIL DO UTILIZADOR LOGADO
    final profileState = ref.watch(profileProvider);

    return AppScaffold(
      title: 'Detalhes da Vaga',
      actions: [
        // O botão de editar só aparece se os dados estiverem carregados
        if (detailsState.hasValue)
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Editar Designação',
            onPressed: () => context.pushNamed(
              AppRoutes.editDesignatedCoach,
              pathParameters: {'id': designationId.toString()},
            ),
          ),
      ],
      body: detailsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(designatedCoachDetailsProvider(designationId)),
        ),
        data: (details) {
          // Extrai o ID do atleta logado de forma segura.
          final currentAthleteId = profileState.value?.athleteDetails?.id;
          // Verifica se o utilizador logado é o técnico desta designação.
          final isCurrentUserTheCoach = currentAthleteId != null && currentAthleteId == details.coach.id;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildInfoCard('Competição', details.competition.name, Icons.emoji_events_outlined),
              _buildInfoCard('Desporto', details.sport.name, Icons.sports_soccer_outlined),
              _buildInfoCard('Curso', details.course.name, Icons.school_outlined),
              _buildInfoCard('Técnico Designado', details.coach.fullName, Icons.person_pin_outlined),
              const SizedBox(height: 32),

              // ✅ 3. RENDERIZAÇÃO CONDICIONAL DO BOTÃO DE INSCRIÇÃO
              if (isCurrentUserTheCoach)
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.group_add_outlined),
                    label: const Text('Inscrever Minha Equipa'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () async {
                      // ✅ CORREÇÃO: Aguardamos o resultado da navegação.
                      final bool? success = await context.pushNamed<bool>(
                        AppRoutes.teamCreate,
                        extra: {
                          'competitionId': details.competition.id,
                          'sportId': details.sport.id,
                          'courseId': details.course.id,
                        },
                      );

                      // Se a página do formulário retornar 'true', invalidamos o estado atual
                      // para buscar os novos dados (que agora incluem a equipa criada).
                      if (success == true) {
                        ref.invalidate(designatedCoachDetailsProvider(designationId));
                      }
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInfoCard(String title, String subtitle, IconData icon) => Card(
    margin: const EdgeInsets.only(bottom: 16),
    child: ListTile(
      leading: Icon(icon, size: 40),
      title: Text(title),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ),
  );
}