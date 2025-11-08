// lib/presentation/pages/competition/widgets/competition_stages.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/elimination_bracket_tab.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/group_stage_tab.dart';
import 'package:playifs_frontend/presentation/providers/competition/elimination_bracket_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/group_stage_view_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';

/// Provider interno para guardar o índice da aba selecionada.
final _selectedTabIndexProvider = StateProvider<int>((ref) => 0);

/// Widget que encapsula as duas fases de uma competição:
/// - Fase de Grupos
/// - Fase Eliminatória (Mata-mata)
///
/// Compatível com Riverpod 3.x e sem dependência do pacote "legacy".
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
    final params = StageProvidersParams(
      competitionId: widget.competitionId,
      sportId: widget.sportId,
    );

    // 🔹 Pré-carrega as duas fases (mantém em cache no Riverpod)
    ref.read(groupStageViewProvider(params).future);
    ref.read(eliminationBracketProvider(params).future);

    final selectedIndex = ref.watch(_selectedTabIndexProvider);

    // Sincroniza o TabController com o índice atual
    if (_tabController.index != selectedIndex) {
      _tabController.index = selectedIndex;
    }

    final tabs = const [
      Tab(text: 'FASE DE GRUPOS'),
      Tab(text: 'FASE ELIMINATÓRIA'),
    ];

    // ✅ Usa Flexible(fit: FlexFit.loose) para evitar erro de layout
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabBar(
          controller: _tabController,
          tabs: tabs,
          onTap: (index) {
            ref.read(_selectedTabIndexProvider.notifier).state = index;
          },
        ),
        const SizedBox(height: 16),

        Flexible(
          fit: FlexFit.loose,
          child: IndexedStack(
            index: selectedIndex,
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
