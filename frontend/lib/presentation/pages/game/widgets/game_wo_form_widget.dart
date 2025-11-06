import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_wo_input.dart';
import 'package:playifs_frontend/domain/entities/team/team_summary.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_provider.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_state.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class GameWoFormWidget extends ConsumerStatefulWidget {
  const GameWoFormWidget({
    super.key,
    required this.game,
  });

  final GameDetails game;

  @override
  ConsumerState<GameWoFormWidget> createState() => _GameWoFormWidgetState();
}

class _GameWoFormWidgetState extends ConsumerState<GameWoFormWidget> {
  int? _selectedWinnerId;

  @override
  Widget build(BuildContext context) {
    final actionState = ref.watch(gameActionNotifierProvider);

    // ✅ CORREÇÃO 1: Usa maybeWhen para verificar o estado 'loading'
    final isUpdating = actionState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    final teams = [
      if (widget.game.teamA != null) widget.game.teamA!,
      if (widget.game.teamB != null) widget.game.teamB!,
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Registrar W.O.',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Text('Qual equipe venceu por W.O.?',
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 10),
          DropdownButtonFormField<int>(
            decoration: const InputDecoration(
              labelText: 'Equipe Vencedora',
              border: OutlineInputBorder(),
            ),
            initialValue: _selectedWinnerId,
            items: teams
                .map((TeamSummary team) => DropdownMenuItem(
              value: team.id,
              child: Text(team.name),
            ))
                .toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedWinnerId = newValue;
              });
            },
            // O valor aqui é usado para controlar o estado da seleção (correto para estado dinâmico)
            validator: (value) => value == null ? 'Selecione o vencedor' : null,
          ),

          // ✅ CORREÇÃO 2 & 3: Substitui o hasError e o error!
          actionState.maybeWhen(
            failure: (error) => ErrorDisplay(
              error: error,
              onRetry: () => ref.read(gameActionNotifierProvider.notifier).reset(),
            ),
            orElse: () => const SizedBox.shrink(),
          ),

          const SizedBox(height: 20),
          FilledButton(
            onPressed: _selectedWinnerId != null && !isUpdating ? _submit : null,
            child: isUpdating
                ? const Center(
                child: SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(strokeWidth: 2)))
                : const Text('Registrar W.O.'),
          ),
        ],
      ),
    );
  }

  void _submit() {
    if (_selectedWinnerId != null) {
      final input = GameWoInput(winnerTeamId: _selectedWinnerId!);
      ref
          .read(gameActionNotifierProvider.notifier)
          .registerWo(widget.game.id, input);
      Navigator.of(context).pop();
    }
  }
}