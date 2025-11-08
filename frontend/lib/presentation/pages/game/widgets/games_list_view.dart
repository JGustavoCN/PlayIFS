import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/domain/entities/game/game_summary.dart';
import 'package:playifs_frontend/presentation/providers/game/games_list_provider.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class GamesListView extends ConsumerWidget {
  const GamesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesState = ref.watch(gamesListProvider);
    final notifier = ref.read(gamesListProvider.notifier);

    return gamesState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => ErrorDisplay(
        error: error,
        onRetry: () => ref.invalidate(gamesListProvider),
      ),
      data: (page) {
        if (page.content.isEmpty) {
          return const Center(child: Text('Nenhum jogo encontrado.'));
        }

        final isLoadMore = gamesState.isRefreshing || gamesState.isLoading && page.content.isNotEmpty;

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            // Lógica para carregamento infinito
            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && page.pageNumber < page.totalPages - 1) {
              notifier.loadNextPage();
              return true;
            }
            return false;
          },
          child: ListView.separated(
            itemCount: page.content.length + (page.pageNumber < page.totalPages - 1 ? 1 : 0),
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              if (index == page.content.length) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isLoadMore
                        ? const CircularProgressIndicator()
                        : const Text('Fim da lista.'),
                  ),
                );
              }
              final game = page.content[index];
              return _GameSummaryTile(game: game);
            },
          ),
        );
      },
    );
  }
}

class _GameSummaryTile extends StatelessWidget {
  const _GameSummaryTile({required this.game});

  final GameSummary game;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final teamAName = game.teamAName ?? 'Equipa A (Bye)';
    final teamBName = game.teamBName ?? 'Equipa B (Bye)';
    final statusName = game.status.name;
    final phaseName = game.phase.name.replaceAll('_', ' ');

    return ListTile(
      title: Text('$teamAName vs $teamBName'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Fase: $phaseName', style: theme.textTheme.bodySmall),
          Text('Status: $statusName', style: theme.textTheme.bodySmall),
        ],
      ),
      trailing: Text(game.dateTime != null
          ? game.dateTime!.toLocal().toString().substring(0, 16)
          : 'Data a definir'),
      onTap: () => context.pushNamed(
        AppRoutes.gameDetails,
        pathParameters: {'id': game.id.toString()},
      ),
    );
  }
}