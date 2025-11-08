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

class GroupStageTab extends ConsumerStatefulWidget {
  const GroupStageTab({super.key, required this.params});

  final StageProvidersParams params;

  @override
  ConsumerState<GroupStageTab> createState() => _GroupStageTabState();
}

class _GroupStageTabState extends ConsumerState<GroupStageTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final profileState = ref.watch(profileProvider);
    final isCoordinator =
        profileState.value?.roles.contains('ROLE_COORDINATOR') ?? false;

    final asyncGroupStage = ref.watch(groupStageViewProvider(widget.params));

    return asyncGroupStage.when(
      loading: () {
        final previous = ref.read(groupStageViewProvider(widget.params));
        if (previous.hasValue && previous.value != null) {
          return _GroupStageView(groupStage: previous.value!);
        }
        return const Center(child: CircularProgressIndicator());
      },
      error: (error, _) {
        if (error is ApiException && error.statusCode == 404) {
          if (isCoordinator) {
            return Center(
              child: GenerateStageButton.group(params: widget.params),
            );
          }
          return const Center(
            child: Text('A fase de grupos ainda não foi gerada pelo coordenador.'),
          );
        }

        return ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(groupStageViewProvider(widget.params)),
        );
      },
      data: (groupStage) {
        if (groupStage.groups.isEmpty) {
          if (isCoordinator) {
            return Center(
              child: GenerateStageButton.group(params: widget.params),
            );
          }
          return const Center(child: Text('Nenhum grupo para exibir.'));
        }

        return _GroupStageView(groupStage: groupStage);
      },
    );
  }
}

class _GroupStageView extends StatelessWidget {
  const _GroupStageView({required this.groupStage});

  final GroupStageView groupStage;

  @override
  Widget build(BuildContext context) => ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      itemCount: groupStage.groups.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final groupReport = groupStage.groups[index];
        final teamNames = groupReport.standings.map((s) => s.teamName).toSet();

        final gamesForGroup = groupStage.games
            .where((g) =>
        teamNames.contains(g.teamAName) ||
            teamNames.contains(g.teamBName))
            .toList()
          ..sort((a, b) {
            if (a.dateTime == null && b.dateTime == null) return 0;
            if (a.dateTime == null) return 1;
            if (b.dateTime == null) return -1;
            return a.dateTime!.compareTo(b.dateTime!);
          });

        return GroupDetailsCard(
          groupReport: groupReport,
          games: gamesForGroup,
        );
      },
    );
}
