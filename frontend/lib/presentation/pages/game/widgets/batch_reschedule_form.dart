import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/domain/entities/game/game_reschedule_item.dart';
import 'package:playifs_frontend/domain/entities/game/game_summary.dart';
import 'package:playifs_frontend/presentation/pages/game/game_batch_reschedule_page.dart';

class BatchRescheduleForm extends ConsumerWidget {
  const BatchRescheduleForm({
    super.key,
    required this.scheduledGames,
    required this.batchItems,
  });

  final List<GameSummary> scheduledGames;
  final List<GameRescheduleItem> batchItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16.0),
      itemCount: scheduledGames.length,
      itemBuilder: (context, index) {
        final game = scheduledGames[index];
        final initialItem = batchItems.firstWhere(
              (item) => item.gameId == game.id,
          orElse: () => GameRescheduleItem(gameId: game.id, dateTime: game.dateTime ?? DateTime.now()),
        );

        return _RescheduleItemTile(
          game: game,
          initialDateTime: initialItem.dateTime,
          onUpdate: (dateTime) {
            _updateBatch(ref, game.id, dateTime);
          },
        );
      },
    );
  }

  void _updateBatch(WidgetRef ref, int gameId, DateTime? dateTime) {
    final notifier = ref.read(batchRescheduleItemsProvider.notifier);
    final currentList = notifier.state.toList();

    if (dateTime != null) {
      final newItem = GameRescheduleItem(gameId: gameId, dateTime: dateTime);

      final existingIndex = currentList.indexWhere((i) => i.gameId == gameId);
      if (existingIndex != -1) {
        currentList[existingIndex] = newItem;
      } else {
        currentList.add(newItem);
      }
    } else {
      // Se a data for removida, remove o item do lote
      currentList.removeWhere((i) => i.gameId == gameId);
    }
    notifier.state = currentList;
  }
}

class _RescheduleItemTile extends StatefulWidget {
  const _RescheduleItemTile({
    required this.game,
    required this.initialDateTime,
    required this.onUpdate,
  });

  final GameSummary game;
  final DateTime? initialDateTime;
  final Function(DateTime?) onUpdate;

  @override
  State<_RescheduleItemTile> createState() => __RescheduleItemTileState();
}

class __RescheduleItemTileState extends State<_RescheduleItemTile> {
  DateTime? _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.initialDateTime;
  }

  // Helper para mostrar a data de forma concisa
  String get _dateDisplay => _selectedDateTime != null
      ? 'NOVO: ${_selectedDateTime!.toLocal().toString().substring(0, 16)}'
      : 'Selecionar Data e Hora';

  bool get _isActive => _selectedDateTime != null && _selectedDateTime != widget.game.dateTime;


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isActiveColor = _isActive ? colorScheme.tertiary.withOpacity(0.1) : colorScheme.surface;

    return Card(
      color: isActiveColor,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        title: Text('${widget.game.teamAName ?? '-'} vs ${widget.game.teamBName ?? '-'}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Atual: ${widget.game.dateTime?.toLocal().toString().substring(0, 16) ?? 'Data não definida'}', style: Theme.of(context).textTheme.bodySmall),
            Text(_dateDisplay, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: _isActive ? colorScheme.tertiary : colorScheme.onSurface)),
          ],
        ),
        trailing: const Icon(Icons.calendar_month),
        onTap: _pickDateTime,
        // Adicionar um botão de limpar, se ativo
        leading: _isActive
            ? IconButton(
          icon: const Icon(Icons.clear),
          color: colorScheme.error,
          onPressed: _clearDateTime,
        )
            : null,
      ),
    );
  }

  Future<void> _pickDateTime() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      // Verificar mounted antes de showTimePicker
      if (!mounted) return;

      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime ?? DateTime.now()),
      );

      if (time != null) {
        final newDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        setState(() {
          _selectedDateTime = newDateTime.toUtc();
        });
        widget.onUpdate(_selectedDateTime);
      }
    }
  }

  void _clearDateTime() {
    setState(() {
      _selectedDateTime = null;
    });
    widget.onUpdate(null);
  }
}