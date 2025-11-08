import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/domain/entities/game/game_reschedule_batch_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_reschedule_item.dart';
import 'package:playifs_frontend/presentation/pages/game/widgets/batch_reschedule_form.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_provider.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_state.dart';
import 'package:playifs_frontend/presentation/providers/game/games_list_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

// Provider temporário para armazenar os itens de reagendamento (estado local)
final batchRescheduleItemsProvider = StateProvider.autoDispose<List<GameRescheduleItem>>((ref) => []);

class GameBatchReschedulePage extends ConsumerWidget {
  const GameBatchReschedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionState = ref.watch(gameActionProvider);
    final gamesListState = ref.watch(gamesListProvider);

    final batchItems = ref.watch(batchRescheduleItemsProvider);

    ref.listen<GameActionState>(gameActionProvider, (previous, next) {
      next.whenOrNull(
        success: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Jogos reagendados com sucesso!')),
          );
          // Redireciona de volta após sucesso
          context.pop();
        },
        failure: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao reagendar lote: ${error.toString()}'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          ref.read(gameActionProvider.notifier).reset();
        },
      );
    });

    final isProcessing = actionState.maybeWhen(loading: () => true, orElse: () => false);

    return AppScaffold(
      title: 'Reagendar Jogos em Lote',
      body: gamesListState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(gamesListProvider),
        ),
        data: (page) {
          // Filtramos apenas jogos AGENDADOS
          final scheduledGames = page.content.where((g) => g.status.name == 'SCHEDULED').toList();

          if (scheduledGames.isEmpty) {
            return const Center(child: Text('Nenhum jogo agendado disponível para reagendar.'));
          }

          return Column(
            children: [
              Expanded(
                child: BatchRescheduleForm(
                  scheduledGames: scheduledGames,
                  batchItems: batchItems,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FilledButton.icon(
                  icon: isProcessing ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.send),
                  label: Text(isProcessing ? 'Processando...' : 'Aplicar ${batchItems.length} Reagendamentos'),
                  onPressed: batchItems.isNotEmpty && !isProcessing ? () => _submit(ref, batchItems) : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _submit(WidgetRef ref, List<GameRescheduleItem> batchItems) {
    final input = GameRescheduleBatchInput(schedules: batchItems);
    ref.read(gameActionProvider.notifier).batchReschedule(input);
  }
}