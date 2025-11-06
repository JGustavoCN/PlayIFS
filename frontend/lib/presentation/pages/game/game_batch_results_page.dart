import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_item.dart';
import 'package:playifs_frontend/presentation/pages/game/widgets/batch_result_form.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_provider.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_state.dart';
import 'package:playifs_frontend/presentation/providers/game/games_list_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

import '../../../domain/entities/game/game_result_batch_input.dart';

// Provider temporário para armazenar os itens de resultado (estado local)
final batchResultItemsProvider = StateProvider.autoDispose<List<GameResultItem>>((ref) => []);

class GameBatchResultsPage extends ConsumerWidget {
  const GameBatchResultsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionState = ref.watch(gameActionNotifierProvider);
    final gamesListState = ref.watch(gamesListNotifierProvider);

    final batchItems = ref.watch(batchResultItemsProvider);

    ref.listen<GameActionState>(gameActionNotifierProvider, (previous, next) {
      next.whenOrNull(
        success: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Resultados atualizados com sucesso!')),
          );
          // Redireciona de volta após sucesso
          context.pop();
        },
        failure: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao atualizar lote: ${error.toString()}'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          ref.read(gameActionNotifierProvider.notifier).reset();
        },
      );
    });

    final isProcessing = actionState.maybeWhen(loading: () => true, orElse: () => false);

    return AppScaffold(
      title: 'Atualizar Resultados em Lote',
      body: gamesListState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(gamesListNotifierProvider),
        ),
        data: (page) {
          final scheduledGames = page.content.where((g) => g.status.name == 'SCHEDULED').toList();

          if (scheduledGames.isEmpty) {
            return const Center(child: Text('Nenhum jogo agendado disponível para pontuar.'));
          }

          return Column(
            children: [
              Expanded(
                child: BatchResultForm(
                  scheduledGames: scheduledGames,
                  batchItems: batchItems,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FilledButton.icon(
                  icon: isProcessing ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.send),
                  label: Text(isProcessing ? 'Processando...' : 'Aplicar ${batchItems.length} Resultados'),
                  onPressed: batchItems.isNotEmpty && !isProcessing ? () => _submit(ref, batchItems) : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _submit(WidgetRef ref, List<GameResultItem> batchItems) {
    final input = GameResultBatchInput(results: batchItems);
    ref.read(gameActionNotifierProvider.notifier).batchUpdateResults(input);
  }
}