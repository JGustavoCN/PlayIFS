import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/elimination_bracket_tab.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/group_stage_tab.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';

/// O widget principal que organiza as visualizações da fase de grupos e do mata-mata
/// usando um TabBar.
class CompetitionStages extends ConsumerStatefulWidget {
  const CompetitionStages({
    super.key,
    required this.competitionId,
    required this.sportId,
  });

  final int competitionId;
  final int sportId;

  @override
  ConsumerState<CompetitionStages> createState() => _CompetitionStagesState();
}

class _CompetitionStagesState extends ConsumerState<CompetitionStages>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Parâmetros para os providers.
    final params = StageProvidersParams(
      competitionId: widget.competitionId,
      sportId: widget.sportId,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          controller: _tabController,
          labelStyle: textTheme.titleSmall,
          unselectedLabelColor: colorScheme.onSurfaceVariant,
          tabs: const [
            Tab(text: 'FASE DE GRUPOS'),
            Tab(text: 'MATA-MATA'),
          ],
        ),
        const SizedBox(height: 16),
        // O Expanded garante que o TabBarView ocupe o espaço vertical disponível.
        // Se este widget for colocado dentro de uma Column com outros widgets,
        // pode ser necessário ajustar o layout ou envolver com um Flexible.
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              GroupStageTab(params: params),
              EliminationBracketTab(params: params),
            ],
          ),
        ),
      ],
    );
  }
}