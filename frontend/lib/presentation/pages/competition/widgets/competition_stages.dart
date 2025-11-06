// Ficheiro: lib/presentation/pages/competition/widgets/competition_stages.dart
// (Validação contra analysis_options.yaml: OK)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/elimination_bracket_tab.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/group_stage_tab.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';

final _selectedTabIndexProvider = StateProvider<int>((ref) => 0);

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
    with SingleTickerProviderStateMixin { // ✅ Mixin para o vsync

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2, // Número de tabs
      vsync: this, // 'this' agora é um TickerProvider
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final params = StageProvidersParams(
      competitionId: widget.competitionId,
      sportId: widget.sportId,
    );

    final tabs = [
      const Tab(text: 'FASE DE GRUPOS'),
      const Tab(text: 'FASE ELIMINATÓRIA'),
    ];

    final selectedIndex = ref.watch(_selectedTabIndexProvider);

    // Atualiza o TabController se o provider mudar
    _tabController.index = selectedIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabBar(
          tabs: tabs,
          controller: _tabController,
          onTap: (index) {
            ref.read(_selectedTabIndexProvider.notifier).state = index;
          },
        ),
        const SizedBox(height: 16),

        // Renderização condicional (usando IndexedStack)
        IndexedStack(
          index: selectedIndex,
          children: [
            // Índice 0: Fase de Grupos
            GroupStageTab(params: params),

            // Índice 1: Fase Eliminatória
            EliminationBracketTab(params: params),
          ],
        ),
      ],
    );
  }
}