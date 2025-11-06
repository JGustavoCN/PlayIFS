import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_item.dart';
import 'package:playifs_frontend/domain/entities/game/game_summary.dart';
import 'package:playifs_frontend/presentation/pages/game/game_batch_results_page.dart';

class BatchResultForm extends ConsumerWidget {
  const BatchResultForm({
    super.key,
    required this.scheduledGames,
    required this.batchItems,
  });

  final List<GameSummary> scheduledGames;
  final List<GameResultItem> batchItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListView.builder(
      padding: const EdgeInsets.only(bottom: 16.0),
      itemCount: scheduledGames.length,
      itemBuilder: (context, index) {
        final game = scheduledGames[index];
        return _ResultItemTile(
          game: game,
          initialItem: batchItems.firstWhere(
                (item) => item.gameId == game.id,
            orElse: () => GameResultItem(gameId: game.id, scoreTeamA: -1, scoreTeamB: -1), // Placeholder item
          ),
          onUpdate: (item) {
            _updateBatch(ref, item);
          },
        );
      },
    );

  void _updateBatch(WidgetRef ref, GameResultItem item) {
    final notifier = ref.read(batchResultItemsProvider.notifier);
    final currentList = notifier.state.toList();

    // Se as pontuações forem válidas (não -1), atualiza/adiciona.
    if (item.scoreTeamA >= 0 && item.scoreTeamB >= 0) {
      final existingIndex = currentList.indexWhere((i) => i.gameId == item.gameId);
      if (existingIndex != -1) {
        currentList[existingIndex] = item;
      } else {
        currentList.add(item);
      }
    } else {
      // Se for inválido (placar não inserido ou apagado), remove.
      currentList.removeWhere((i) => i.gameId == item.gameId);
    }
    notifier.state = currentList;
  }
}

class _ResultItemTile extends ConsumerStatefulWidget {
  const _ResultItemTile({
    required this.game,
    required this.initialItem,
    required this.onUpdate,
  });

  final GameSummary game;
  final GameResultItem initialItem;
  final Function(GameResultItem) onUpdate;

  @override
  ConsumerState<_ResultItemTile> createState() => __ResultItemTileState();
}

class __ResultItemTileState extends ConsumerState<_ResultItemTile> {
  late final TextEditingController _scoreAController;
  late final TextEditingController _scoreBController;
  final FocusNode _focusA = FocusNode();
  final FocusNode _focusB = FocusNode();

  bool _isActive = false;

  @override
  void initState() {
    super.initState();
    // Um item está ativo se tivermos placares não-placeholder
    _isActive = widget.initialItem.scoreTeamA >= 0;

    _scoreAController = TextEditingController(
      text: _isActive ? widget.initialItem.scoreTeamA.toString() : '',
    );
    _scoreBController = TextEditingController(
      text: _isActive ? widget.initialItem.scoreTeamB.toString() : '',
    );

    _scoreAController.addListener(_onScoreChanged);
    _scoreBController.addListener(_onScoreChanged);
  }

  @override
  void dispose() {
    _scoreAController.dispose();
    _scoreBController.dispose();
    _focusA.dispose();
    _focusB.dispose();
    super.dispose();
  }

  void _onScoreChanged() {
    // Se ambos os campos têm conteúdo, consideramos ativo.
    if (_scoreAController.text.isNotEmpty && _scoreBController.text.isNotEmpty) {
      if (!_isActive) {
        setState(() { _isActive = true; });
      }
      _emitUpdate();
    } else if (_isActive) {
      // Se um dos campos for limpo, desativa e remove do lote.
      setState(() { _isActive = false; });
      _emitUpdate();
    }
  }

  void _emitUpdate() {
    final scoreA = int.tryParse(_scoreAController.text);
    final scoreB = int.tryParse(_scoreBController.text);

    // Só envia a atualização se ambos forem placares válidos (>= 0)
    final newItem = GameResultItem(
      gameId: widget.game.id,
      scoreTeamA: scoreA ?? -1, // Usa -1 como indicador de 'inválido'
      scoreTeamB: scoreB ?? -1,
    );
    widget.onUpdate(newItem);
  }


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isActiveColor = _isActive ? colorScheme.primary.withOpacity(0.1) : colorScheme.surface;

    return Card(
      color: isActiveColor,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.game.phase.name.replaceAll('_', ' ').capitalize()} - ${widget.game.dateTime?.toLocal().toString().substring(0, 10) ?? 'Data a definir'}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(widget.game.teamAName ?? 'Equipa A (W.O.)', style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.ellipsis),
                ),
                Expanded(
                  flex: 1,
                  child: _ScoreInput(controller: _scoreAController, focusNode: _focusA),
                ),
                const SizedBox(width: 8),
                Text('x', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: _ScoreInput(controller: _scoreBController, focusNode: _focusB),
                ),
                Expanded(
                  flex: 5,
                  child: Text(widget.game.teamBName ?? 'Equipa B (W.O.)', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.end, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ScoreInput extends StatelessWidget {
  const _ScoreInput({
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) => TextFormField(
      controller: controller,
      focusNode: focusNode,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8),
        border: OutlineInputBorder(),
        isDense: true,
      ),
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
}

extension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}