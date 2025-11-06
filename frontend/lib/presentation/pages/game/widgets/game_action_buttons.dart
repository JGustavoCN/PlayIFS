import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_status.dart';
import 'package:playifs_frontend/presentation/pages/game/widgets/game_result_form_widget.dart';
import 'package:playifs_frontend/presentation/pages/game/widgets/game_wo_form_widget.dart';
import 'package:playifs_frontend/presentation/pages/game/widgets/reschedule_form_widget.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_provider.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_state.dart';

class GameActionButtons extends ConsumerWidget {
  const GameActionButtons({
    super.key,
    required this.game,
  });

  final GameDetails game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionNotifier = ref.read(gameActionNotifierProvider.notifier);
    final actionState = ref.watch(gameActionNotifierProvider);

    // ✅ CORREÇÃO 1: Substitui 'isLoading' (usa maybeWhen)
    final isUpdating = actionState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    final isScheduled = game.status == GameStatus.SCHEDULED;
    // final isFinished = game.status == GameStatus.FINISHED; // Removido, variável não usada.
    final isWo = game.status == GameStatus.WO;

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        // 1. AÇÃO: Registrar Placar (Apenas Agendado)
        if (isScheduled)
          ActionChip(
            avatar: const Icon(Icons.scoreboard),
            label: const Text('Registrar Placar'),
            onPressed: isUpdating ? null : () => _showModal(context, GameResultFormWidget(game: game)),
          ),

        // 2. AÇÃO: Registrar W.O. (Apenas Agendado)
        if (isScheduled)
          ActionChip(
            avatar: const Icon(Icons.handshake),
            label: const Text('Registrar W.O.'),
            onPressed: isUpdating ? null : () => _showModal(context, GameWoFormWidget(game: game)),
          ),

        // 3. AÇÃO: Reagendar (Apenas Agendado)
        if (isScheduled)
          ActionChip(
            avatar: const Icon(Icons.calendar_month),
            label: const Text('Reagendar'),
            onPressed: isUpdating ? null : () => _showModal(
              context,
              RescheduleFormWidget(
                gameId: game.id,
                initialDateTime: game.dateTime,
              ),
            ),
          ),

        // 4. AÇÃO: Desfazer W.O. (Apenas se for W.O.)
        if (isWo)
          ActionChip(
            avatar: const Icon(Icons.undo),
            label: const Text('Desfazer W.O.'),
            onPressed: isUpdating ? null : () => _confirmAction(
              context,
              'Desfazer W.O.',
              'Tem certeza que deseja reverter este jogo para status Agendado? O placar será removido.',
                  () => actionNotifier.undoWo(game.id),
            ),
          ),

        // 5. AÇÃO: Deletar Jogo (Apenas Agendado)
        if (isScheduled)
          ActionChip(
            avatar: const Icon(Icons.delete_forever),
            label: const Text('Deletar Jogo'),
            // ✅ CORREÇÃO 2: Lógica assíncrona com pop seguro
            onPressed: isUpdating ? null : () => _confirmAction(
              context,
              'Apagar Jogo',
              'Esta ação é irreversível. O jogo será deletado permanentemente.',
                  () async {
                await actionNotifier.delete(game.id);
                // Verifica se o widget ainda está na árvore antes de navegar
                if (context.mounted) {
                  context.pop();
                }
              },
            ),
          ),
      ],
    );
  }

  void _showModal(BuildContext context, Widget content) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: content,
        ),
      ),
    );
  }

  // ✅ CORREÇÃO 3: Assinatura do onConfirm alterada para Future<void> Function()
  void _confirmAction(
      BuildContext context,
      String title,
      String content,
      Future<void> Function() onConfirm,
      ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () async { // ✅ Adiciona 'async' para chamar onConfirm
              Navigator.of(context).pop();
              await onConfirm(); // Agora pode chamar a função assíncrona
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}