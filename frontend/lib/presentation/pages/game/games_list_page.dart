import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/presentation/pages/game/widgets/game_search_bar.dart';
import 'package:playifs_frontend/presentation/pages/game/widgets/games_list_view.dart';
import 'package:playifs_frontend/presentation/providers/game/games_list_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';

class GamesListPage extends ConsumerStatefulWidget {
  const GamesListPage({
    super.key,
    this.competitionId,
    this.teamId,
  });

  final int? competitionId;
  final int? teamId;

  @override
  ConsumerState<GamesListPage> createState() => _GamesListPageState();
}

class _GamesListPageState extends ConsumerState<GamesListPage> {
  @override
  void initState() {
    super.initState();

    // ✅ Implementação do TODO: Setar os filtros iniciais uma única vez
    // Usamos addPostFrameCallback para garantir que o ref está disponível e a UI está inicializada
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gamesListNotifierProvider.notifier).setFilters(
        competitionId: widget.competitionId,
        teamId: widget.teamId,
      );
    });
  }

  @override
  // ✅ CORREÇÃO DE LINT: Usando sintaxe curta '=>' para o build
  Widget build(BuildContext context) => const AppScaffold(
    title: 'Listagem de Jogos',
    body: Column(
      children: [
        // Barra de filtros (o GameSearchBar deve ser modificado
        // para usar os mesmos IDs se precisar de controles na barra)
        GameSearchBar(),
        Expanded(
          child: GamesListView(),
        ),
      ],
    ),
  );
}