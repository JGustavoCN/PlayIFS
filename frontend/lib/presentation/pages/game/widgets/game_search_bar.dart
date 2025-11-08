import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
// import 'package:flutter_riverpod/legacy.dart'; // ✅ 1. REMOVIDO import legado
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';
import 'package:playifs_frontend/domain/entities/game/game_status.dart';
import 'package:playifs_frontend/presentation/providers/game/games_list_provider.dart';
import 'package:playifs_frontend/presentation/providers/sport/sports_provider.dart';

// Providers de estado local
final _statusFilterProvider = StateProvider.autoDispose<String?>((ref) => null);
final _phaseFilterProvider = StateProvider.autoDispose<String?>((ref) => null);
final _sportFilterProvider = StateProvider.autoDispose<int?>((ref) => null);

class GameSearchBar extends ConsumerWidget {
  const GameSearchBar({
    super.key,
    this.competitionId,
    this.teamId,
    this.sportId,
  });

  // Filtros que vêm da rota da página
  final int? competitionId;
  final int? teamId;
  final int? sportId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observa os filtros locais
    final selectedStatus = ref.watch(_statusFilterProvider);
    final selectedPhase = ref.watch(_phaseFilterProvider);
    final selectedSport = ref.watch(_sportFilterProvider);

    // Observa o provider que busca os esportes da API
    final sportsAsync = ref.watch(sportsProvider);

    final bool isLocalFilterActive = selectedStatus != null ||
        selectedPhase != null ||
        (selectedSport != null && sportId == null);

    final bool isSportFilterDisabled = sportId != null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          // Dropdown de Esporte
          DropdownButtonFormField<int>(
            decoration: const InputDecoration(
              labelText: 'Esporte',
              border: OutlineInputBorder(),
              isDense: true,
            ),
            value: isSportFilterDisabled ? sportId : selectedSport,
            disabledHint: isSportFilterDisabled
                ? (
                // ✅ 2. CORREÇÃO: Acessar .content
                sportsAsync.whenOrNull()?.content
                    .firstWhere((s) => s.id == sportId, orElse: () => null)
                    ?.name ??
                    'Filtro aplicado')
                : null,
            items: sportsAsync.when(
              // ✅ 3. CORREÇÃO: Acessar sportsPage.content
              data: (sportsPage) => sportsPage.content
                  .map((sport) => DropdownMenuItem(
                value: sport.id,
                child: Text(sport.name),
              ))
                  .toList(),
              loading: () => [
                const DropdownMenuItem(
                  value: null,
                  child: Text('Carregando esportes...'),
                )
              ],
              error: (e, s) => [
                const DropdownMenuItem(
                  value: null,
                  child: Text('Erro ao carregar'),
                )
              ],
            ),
            onChanged: isSportFilterDisabled
                ? null
                : (value) {
              ref.read(_sportFilterProvider.notifier).state = value;
              _applyFilters(ref, selectedStatus, selectedPhase, value);
            },
          ),
          const SizedBox(height: 8), // Espaçamento
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  value: selectedStatus, // 'value' está correto aqui
                  items: GameStatus.values
                      .map((status) => DropdownMenuItem(
                    value: status.name,
                    child: Text(status.name),
                  ))
                      .toList(),
                  onChanged: (value) {
                    ref.read(_statusFilterProvider.notifier).state = value;
                    _applyFilters(
                        ref,
                        value,
                        selectedPhase,
                        isSportFilterDisabled ? sportId : selectedSport);
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Fase',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  value: selectedPhase, // 'value' está correto aqui
                  items: GamePhase.values
                      .map((phase) => DropdownMenuItem(
                    value: phase.name,
                    child: Text(phase.name.replaceAll('_', ' ')),
                  ))
                      .toList(),
                  onChanged: (value) {
                    ref.read(_phaseFilterProvider.notifier).state = value;
                    _applyFilters(
                        ref,
                        selectedStatus,
                        value,
                        isSportFilterDisabled ? sportId : selectedSport);
                  },
                ),
              ),
            ],
          ),
          // Botão de Reset
          if (isLocalFilterActive)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  icon: const Icon(Icons.clear),
                  label: const Text('Limpar Filtros Locais'),
                  onPressed: () => _resetFilters(ref),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // (Lógica de _applyFilters - Está correta)
  void _applyFilters(
      WidgetRef ref, String? status, String? phase, int? localSportId) {
    ref.read(gamesListProvider.notifier).setFilters(
      competitionId: competitionId,
      teamId: teamId,
      sportId: sportId ?? localSportId,
      status: status,
      phase: phase,
    );
  }

  // (Lógica de _resetFilters - Está correta)
  void _resetFilters(WidgetRef ref) {
    ref.read(_statusFilterProvider.notifier).state = null;
    ref.read(_phaseFilterProvider.notifier).state = null;
    if (sportId == null) {
      ref.read(_sportFilterProvider.notifier).state = null;
    }

    ref.read(gamesListProvider.notifier).setFilters(
      competitionId: competitionId,
      teamId: teamId,
      sportId: sportId,
      status: null,
      phase: null,
    );
  }
}