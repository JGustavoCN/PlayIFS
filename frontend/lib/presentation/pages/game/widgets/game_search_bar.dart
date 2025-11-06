import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';
import 'package:playifs_frontend/domain/entities/game/game_status.dart';
import 'package:playifs_frontend/presentation/providers/game/games_list_provider.dart';

// ✅ Providers de estado local (mantidos iguais)
final _statusFilterProvider = StateProvider.autoDispose<String?>((ref) => null);
final _phaseFilterProvider = StateProvider.autoDispose<String?>((ref) => null);

class GameSearchBar extends ConsumerWidget {
  const GameSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStatus = ref.watch(_statusFilterProvider);
    final selectedPhase = ref.watch(_phaseFilterProvider);

    // Verifica se algum filtro (local ou da URL) está ativo para habilitar o reset
    final isFilterActive = selectedStatus != null || selectedPhase != null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: selectedStatus,
                  items: GameStatus.values
                      .map((e) => DropdownMenuItem(
                    value: e.name,
                    child: Text(e.name),
                  ))
                      .toList(),
                  onChanged: (newValue) {
                    ref.read(_statusFilterProvider.notifier).state = newValue;
                    _applyFilters(ref, newValue, selectedPhase);
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Fase',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: selectedPhase,
                  items: GamePhase.values
                      .map((e) => DropdownMenuItem(
                    value: e.name,
                    child: Text(e.name.replaceAll('_', ' ').toLowerCase().capitalize()),
                  ))
                      .toList(),
                  onChanged: (newValue) {
                    ref.read(_phaseFilterProvider.notifier).state = newValue;
                    _applyFilters(ref, selectedStatus, newValue);
                  },
                ),
              ),
            ],
          ),

          // ✅ NOVO: Botão de Reset
          if (isFilterActive)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  icon: const Icon(Icons.clear),
                  label: const Text('Limpar Filtros'),
                  onPressed: () => _resetFilters(ref),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _applyFilters(WidgetRef ref, String? status, String? phase) {
    // A lista de jogos já está sendo filtrada pelos IDs da URL em GamesListPage.initState
    // Aqui, apenas aplicamos os filtros de Dropdown.
    ref.read(gamesListNotifierProvider.notifier).setFilters(
      status: status,
      phase: phase,
    );
  }

  // ✅ NOVO: Lógica de Reset
  void _resetFilters(WidgetRef ref) {
    // 1. Limpa os estados locais (Dropdowns)
    ref.read(_statusFilterProvider.notifier).state = null;
    ref.read(_phaseFilterProvider.notifier).state = null;

    // 2. Chama setFilters no notifier com valores nulos,
    //    o que irá recarregar a lista com os filtros iniciais (URL IDs)
    ref.read(gamesListNotifierProvider.notifier).setFilters(
      status: null,
      phase: null,
    );
  }
}

extension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}