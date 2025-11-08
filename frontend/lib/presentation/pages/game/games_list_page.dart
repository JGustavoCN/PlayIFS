import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/presentation/pages/game/widgets/game_search_bar.dart';
import 'package:playifs_frontend/presentation/pages/game/widgets/games_list_view.dart';
import 'package:playifs_frontend/presentation/providers/game/games_list_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';

class GamesListPage extends ConsumerStatefulWidget {
  const GamesListPage({
    super.key,
    this.competitionId,
    this.teamId,
    this.sportId,
  });

  final int? competitionId;
  final int? teamId;
  final int? sportId;

  @override
  ConsumerState<GamesListPage> createState() => _GamesListPageState();
}

class _GamesListPageState extends ConsumerState<GamesListPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gamesListProvider.notifier).setFilters(
        competitionId: widget.competitionId,
        teamId: widget.teamId,
        sportId: widget.sportId,
      );
    });
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
      title: 'Listagem de Jogos',
      body: Column(
        children: [
          GameSearchBar(
            competitionId: widget.competitionId,
            teamId: widget.teamId,
            sportId: widget.sportId,
          ),
          const Expanded(
            child: GamesListView(),
          ),
        ],
      ),
      // ✅ 4. CORREÇÃO:
      // Trocado de 'persistentFooterButtons' para 'bottomNavigationBar'
      // para corresponder ao seu AppScaffold.
      bottomNavigationBar: Padding(
        // Adicionado padding vertical para descolar da barra de navegação do sistema
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                context.push(AppRoutes.gameBatchResults);
              },
              child: const Text('Resultados em Lote'),
            ),
            FilledButton.tonal(
              onPressed: () {
                context.push(AppRoutes.gameBatchReschedule);
              },
              child: const Text('Reagendar em Lote'),
            ),
          ],
        ),
      ),
    );
}