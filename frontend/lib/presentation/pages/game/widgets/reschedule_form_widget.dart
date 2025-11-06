import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/domain/entities/game/game_update_input.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_provider.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_state.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class RescheduleFormWidget extends ConsumerStatefulWidget {
  const RescheduleFormWidget({
    super.key,
    required this.gameId,
    this.initialDateTime,
  });

  final int gameId;
  final DateTime? initialDateTime;

  @override
  ConsumerState<RescheduleFormWidget> createState() => _RescheduleFormWidgetState();
}

class _RescheduleFormWidgetState extends ConsumerState<RescheduleFormWidget> {
  DateTime? _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.initialDateTime;
  }

  @override
  Widget build(BuildContext context) {
    final actionState = ref.watch(gameActionNotifierProvider);

    final isUpdating = actionState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Reagendar Jogo',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          ListTile(
            title: Text(_selectedDateTime == null
                ? 'Selecionar Data e Hora'
                : 'Data: ${_selectedDateTime!.toLocal().toString().substring(0, 16)}'),
            trailing: const Icon(Icons.calendar_today),
            onTap: isUpdating ? null : _pickDateTime,
          ),

          actionState.maybeWhen(
            failure: (error) => ErrorDisplay(
              error: error,
              onRetry: () => ref.read(gameActionNotifierProvider.notifier).reset(),
            ),
            orElse: () => const SizedBox.shrink(),
          ),

          const SizedBox(height: 20),
          FilledButton(
            onPressed: _selectedDateTime != null && !isUpdating
                ? _submit
                : null,
            child: isUpdating
                ? const Center(child: SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2)))
                : const Text('Reagendar'),
          ),
        ],
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
      // ✅ VERIFICAÇÃO 1: Verifica se o widget ainda está montado
      if (!mounted) return;

      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime ?? DateTime.now()),
      );

      if (time != null) {
        setState(() {
          _selectedDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  Future<void> _submit() async { // ✅ ADICIONADO 'async'
    final input = GameUpdateInput(
      // Converte para UTC (Instant Java)
      dateTime: _selectedDateTime!.toUtc(),
    );

    // Ação assíncrona
    await ref.read(gameActionNotifierProvider.notifier).reschedule(widget.gameId, input);

    // ✅ CORREÇÃO FINAL: Verifica se o widget ainda está montado antes de fechar.
    if (!mounted) return;

    // Fecha o modal após a ação ser disparada e o widget ainda existir.
    Navigator.of(context).pop();
  }
}