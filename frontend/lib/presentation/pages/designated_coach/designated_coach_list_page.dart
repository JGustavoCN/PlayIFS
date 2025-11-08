import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/domain/entities/designated_coach/designated_coach_summary.dart';
import 'package:playifs_frontend/presentation/providers/designated_coach/designated_coach_form_provider.dart';
import 'package:playifs_frontend/presentation/providers/designated_coach/designated_coach_form_state.dart';
import 'package:playifs_frontend/presentation/providers/designated_coach/designated_coaches_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

import 'widgets/designated_coach_form.dart';

class DesignatedCoachListPage extends ConsumerWidget {
  const DesignatedCoachListPage({super.key, required this.competitionId});
  final int competitionId;

  // As suas funções de helper estão perfeitas e foram mantidas.
  void _showDesignateCoachForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (_) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: DesignatedCoachForm(competitionId: competitionId),
      ),
    );
  }

  Future<void> _showDeleteConfirmation(
      BuildContext context,
      WidgetRef ref,
      DesignatedCoachSummary coach,
      ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirmar Remoção'),
        content: Text('Tem a certeza que deseja remover ${coach.athleteName}?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Cancelar')),
          FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('Remover')),
        ],
      ),
    );

    if (confirm ?? false) {
      // Usar 'ref.read' dentro de callbacks assíncronos
      final notifier = ref.read(designatedCoachFormProvider.notifier);
      await notifier.removeById(coach.id, competitionId);

      // Ler o estado final após a operação para mostrar o feedback correto.
      final state = ref.read(designatedCoachFormProvider);
      if (context.mounted) {
        state.whenOrNull(
          success: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Designação removida com sucesso!')),
          ),
          failure: (error) {
            if (error is ApiException && error.statusCode == 422) {
              _showReplacementDialog(context, coach, error.message);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Erro ao remover: $error'),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            }
          },
        );
      }
    }
  }

  void _showReplacementDialog(BuildContext context, DesignatedCoachSummary coach, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Ação Requerida'),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancelar')),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.pushNamed(
                AppRoutes.editDesignatedCoach,
                pathParameters: {'id': coach.id.toString()},
              );
            },
            child: const Text('Substituir Técnico'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final designatedCoachesState = ref.watch(designatedCoachesProvider(competitionId));

    return AppScaffold(
      title: 'Técnicos Designados',
      // ✅ ESTRUTURA CORRIGIDA: O body agora é uma Column.
      body: Column(
        children: [
          // ✅ BARRA DE PESQUISA: Agora está no topo da tela, fora da lista.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar por nome do técnico',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(designatedCoachesProvider(competitionId).notifier).searchByName(value);
              },
            ),
          ),
          // ✅ A lista agora ocupa o espaço restante.
          Expanded(
            child: designatedCoachesState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => ErrorDisplay(
                error: error,
                onRetry: () => ref.invalidate(designatedCoachesProvider(competitionId)),
              ),
              data: (page) {
                final coaches = page.content;
                if (coaches.isEmpty) {
                  return const Center(child: Text('Nenhum técnico encontrado.'));
                }
                return ListView.builder(
                  // Adiciona padding à lista para consistência
                  padding: const EdgeInsets.only(bottom: 80), // Espaço para o FAB
                  itemCount: coaches.length,
                  itemBuilder: (context, index) {
                    final designatedCoach = coaches[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ListTile(
                        title: Text(designatedCoach.athleteName),
                        subtitle: Text('${designatedCoach.sportName} - ${designatedCoach.courseName}'),
                        // ✅ O trailing agora está mais limpo, sem o TextField.
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit_outlined),
                              tooltip: 'Editar Designação',
                              onPressed: () => context.pushNamed(
                                AppRoutes.editDesignatedCoach,
                                pathParameters: {'id': designatedCoach.id.toString()},
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
                              tooltip: 'Remover Designação',
                              onPressed: () => _showDeleteConfirmation(context, ref, designatedCoach),
                            ),
                          ],
                        ),
                        onTap: () => context.pushNamed(
                          AppRoutes.designatedCoachDetails,
                          pathParameters: {'id': designatedCoach.id.toString()},
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      fab: FloatingActionButton(
        onPressed: () => _showDesignateCoachForm(context),
        tooltip: 'Designar Novo Técnico',
        child: const Icon(Icons.add),
      ),
    );
  }
}