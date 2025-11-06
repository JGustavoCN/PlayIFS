import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/domain/entities/competition/group_stage_view.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/generate_stage_button.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/group_details_card.dart';
import 'package:playifs_frontend/presentation/providers/competition/group_stage_view_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class GroupStageTab extends ConsumerWidget {
  const GroupStageTab({super.key, required this.params});

  final StageProvidersParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);
    final isCoordinator =
        profileState.value?.roles.contains('ROLE_COORDINATOR') ?? false;

    final groupStageState = ref.watch(groupStageViewNotifierProvider(params));

    return groupStageState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) {
        if (error is ApiException && error.statusCode == 404) {
          if (isCoordinator) {
            return Center(
              child: GenerateStageButton(
                label: 'Gerar Fase de Grupos',
                onPressed: () => _confirmAndGenerateGroups(context, ref),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'A fase de grupos ainda não foi gerada pelo coordenador.',
              ),
            );
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

  Future<void> _confirmAndGenerateGroups(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Ação'),
        content: const Text(
          'Tem a certeza de que deseja gerar a fase de grupos? Esta ação não pode ser desfeita.',
        ),
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

class _GroupStageView extends StatelessWidget {
  const _GroupStageView({required this.groupStage});

  final GroupStageView groupStage;

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
    itemCount: groupStage.groups.length,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final groupReport = groupStage.groups[index];

      final teamNamesInGroup = groupReport.standings
          .map((s) => s.teamName)
          .toSet();

      final gamesForGroup = groupStage.games
          .where(
            (game) =>
                teamNamesInGroup.contains(game.teamAName) ||
                teamNamesInGroup.contains(game.teamBName),
          )
          .toList();

      gamesForGroup.sort((a, b) {
        if (a.dateTime == null && b.dateTime == null) return 0;
        if (a.dateTime == null) return 1;
        if (b.dateTime == null) return -1;
        return a.dateTime!.compareTo(b.dateTime!);
      });

      return GroupDetailsCard(groupReport: groupReport, games: gamesForGroup);
    },
  );
}
