import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/generate_stage_button.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/group_standings_table.dart';
import 'package:playifs_frontend/presentation/providers/competition/group_stage_view_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class GroupStageTab extends ConsumerWidget {
  const GroupStageTab({super.key, required this.params});

  final StageProvidersParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // NOVO: Observar o estado do perfil do utilizador.
    final profileState = ref.watch(profileNotifierProvider);
    final isCoordinator = profileState.value?.roles.contains('ROLE_COORDINATOR') ?? false;


    final groupStageState = ref.watch(groupStageViewNotifierProvider(params));

    return groupStageState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) {
        // CORREÇÃO: A lógica para mostrar o botão agora depende também da role do utilizador.
        if (error is ApiException && error.statusCode == 404) {
          if (isCoordinator) {
            return Center(
              child: GenerateStageButton(
                label: 'Gerar Fase de Grupos',
                onPressed: () => _confirmAndGenerateGroups(context, ref),
              ),
            );
          } else {
            // Mensagem para utilizadores comuns quando a fase ainda não foi criada.
            return const Center(
                child: Text('A fase de grupos ainda não foi gerada pelo coordenador.'));
          }
        }
        return ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(groupStageViewNotifierProvider(params)),
        );
      },
      data: (groupStage) {
        if (groupStage.groups.isEmpty) {
          return const Center(child: Text('Nenhum grupo para exibir.'));
        }
        return _GroupStageView(groupStage: groupStage);
      },
    );
  }

  Future<void> _confirmAndGenerateGroups(BuildContext context, WidgetRef ref) async {
    // ... (código do diálogo de confirmação permanece o mesmo) ...
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Ação'),
        content: const Text(
            'Tem a certeza de que deseja gerar a fase de grupos? Esta ação não pode ser desfeita.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Gerar'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref
          .read(groupStageViewNotifierProvider(params).notifier)
          .generateGroupStage();
    }
  }
}

// O widget _GroupStageView permanece inalterado.
class _GroupStageView extends StatelessWidget {
  const _GroupStageView({required this.groupStage});
  final dynamic groupStage; // GroupStageView

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: groupStage.groups.length,
    itemBuilder: (context, index) {
      final group = groupStage.groups[index];
      return GroupStandingsTable(group: group);
    },
  );
}