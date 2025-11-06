// Ficheiro: lib/presentation/pages/competition/widgets/elimination_bracket_tab.dart
// (Validação contra analysis_options.yaml: OK)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/generate_stage_button.dart';
import 'package:playifs_frontend/presentation/providers/competition/elimination_bracket_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';
import 'package:playifs_frontend/domain/entities/competition/elimination_bracket.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';

class EliminationBracketTab extends ConsumerWidget {
  const EliminationBracketTab({super.key, required this.params});

  final StageProvidersParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);
    final isCoordinator =
        profileState.value?.roles.contains('ROLE_COORDINATOR') ?? false;

    final bracketState = ref.watch(eliminationBracketNotifierProvider(params));

    return bracketState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) {
        // (Lógica de erro mantida igual)
        if (error is ApiException && error.statusCode == 404) {
          if (isCoordinator) {
            return Center(
              child: GenerateStageButton(
                label: 'Gerar/Avançar Fase Eliminatória',
                onPressed: () => _confirmAndGenerateBracket(context, ref),
              ),
            );
          } else {
            return const Center(
              child: Text('O mata-mata ainda não foi gerado pelo coordenador.'),
            );
          }
        }
        return ErrorDisplay(
          error: error,
          onRetry: () =>
              ref.invalidate(eliminationBracketNotifierProvider(params)),
        );
      },
      data: (bracket) {
        if (bracket.rounds.isEmpty) {
          // (Lógica de dados vazios mantida igual)
          if (isCoordinator) {
            return Center(
              child: GenerateStageButton(
                label: 'Gerar/Avançar Fase Eliminatória',
                onPressed: () => _confirmAndGenerateBracket(context, ref),
              ),
            );
          }
          return const Center(
            child: Text('O chaveamento ainda não foi gerado.'),
          );
        }

        // ✅ NOVO: Lógica para verificar se o torneio terminou
        // (Problema 2 e 3)
        final finalGames = bracket.rounds[GamePhase.FINAL] ?? [];
        bool tournamentFinished = false;
        GameDetails? finalGame;

        if (finalGames.isNotEmpty) {
          finalGame = finalGames.first;
          tournamentFinished = finalGame.status == 'FINISHED';
        }

        return Column(
          // ✅ CORREÇÃO DE LAYOUT: (Resolve o erro RenderFlex)
          //    Força a coluna a ter o tamanho mínimo
          //    dos seus filhos (não expandir).
          mainAxisSize: MainAxisSize.min,
          children: [
            // ❌ REMOVIDO: Expanded(child: _EliminationBracketView(...))
            _EliminationBracketView(
              bracket: bracket,
              finalGame: finalGame,
              tournamentFinished: tournamentFinished,
            ),

            // ✅ CORREÇÃO: Botão só aparece se for coordenador
            //    E o torneio AINDA NÃO terminou.
            if (isCoordinator && !tournamentFinished)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GenerateStageButton(
                  label: 'Avançar Fase',
                  onPressed: () => _confirmAndGenerateBracket(context, ref),
                ),
              ),
          ],
        );
      },
    );
  }

  // (Método _confirmAndGenerateBracket permanece idêntico)
  Future<void> _confirmAndGenerateBracket(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Ação'),
        content: const Text(
          'Isto irá gerar ou avançar para a próxima fase do mata-mata. Confirma?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref
          .read(eliminationBracketNotifierProvider(params).notifier)
          .generateEliminationStage();
    }
  }
}

// --- Widgets de Visualização ---

class _EliminationBracketView extends StatelessWidget {
  const _EliminationBracketView({
    required this.bracket,
    this.finalGame,
    required this.tournamentFinished,
  });

  final EliminationBracket bracket;
  final GameDetails? finalGame;
  final bool tournamentFinished;

  @override
  Widget build(BuildContext context) {
    final sortedPhases = bracket.rounds.keys.toList()
      ..sort((a, b) => a.index.compareTo(b.index));

    // ✅ NOVO: Lógica para encontrar o vencedor (Problema 2)
    String? winnerName;
    if (tournamentFinished && finalGame != null) {
      if ((finalGame!.scoreTeamA ?? 0) > (finalGame!.scoreTeamB ?? 0)) {
        winnerName = finalGame!.teamA?.name;
      } else {
        winnerName = finalGame!.teamB?.name;
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Mapeia as colunas de fases (Oitavas, Quartas, etc.)
            ...sortedPhases.map((phase) {
              final games = bracket.rounds[phase]!;
              return _BracketRoundColumn(phase: phase, games: games);
            }).toList(),

            // ✅ NOVO: Adiciona a coluna do Vencedor
            if (winnerName != null) _WinnerColumn(winnerName: winnerName),
          ],
        ),
      ),
    );
  }
}

class _BracketRoundColumn extends StatelessWidget {
  const _BracketRoundColumn({required this.phase, required this.games});

  final GamePhase phase;
  final List<GameDetails> games;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final title = phase.name.replaceAll('_', ' ').toLowerCase().capitalize();

    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        // ✅ CORREÇÃO DE LAYOUT: (Resolve o erro RenderFlex)
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: textTheme.titleMedium),
          const SizedBox(height: 16),

          // ❌ REMOVIDO: Expanded(child: ListView.separated(...))

          // ✅ NOVO: Substituído por um Column estático.
          Column(
            children: games
                .map(
                  (game) => Padding(
                    // Adiciona espaçamento (o antigo separator)
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: _BracketGameCard(game: game),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

// (Widget _BracketGameCard permanece 100% igual)
class _BracketGameCard extends StatelessWidget {
  const _BracketGameCard({required this.game});

  final GameDetails game; // A entidade correta (tem teamA e teamB como objetos)

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // ✅ LÓGICA DE BYE: Verifica se teamB é nulo
    final bool isBye = game.teamB == null;

    Widget buildTeamRow(
      String? teamName,
      int? score, {
      bool isByeOpponent = false,
    }) {
      final bool isWinner =
          score != null && score > 0; // Para o vencedor do "bye"

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              // Se for "bye", mostra "BYE", senão, "A definir"
              isByeOpponent ? 'BYE' : (teamName ?? 'A definir'),
              style: textTheme.bodyMedium?.copyWith(
                // Estilo para o "BYE" (ex: itálico)
                fontStyle: isByeOpponent ? FontStyle.italic : FontStyle.normal,
                color: isByeOpponent
                    ? colorScheme.onSurfaceVariant
                    : (isWinner ? colorScheme.primary : colorScheme.onSurface),
                fontWeight: isWinner ? FontWeight.bold : FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            // Se for "bye", o resultado é W.O. (W-0)
            isBye ? (isByeOpponent ? '0' : 'W') : (score?.toString() ?? '-'),
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: isWinner ? colorScheme.primary : null,
            ),
          ),
        ],
      );
    }

    return Card(
      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: InkWell(
        // Use InkWell para ter o efeito de clique
        onTap: () => context.pushNamed(
          AppRoutes.gameDetails,
          pathParameters: {'id': game.id.toString()},
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Linha Team A (Vencedor por W.O.)
              buildTeamRow(game.teamA?.name, game.scoreTeamA),

              const Divider(height: 16),

              // Linha Team B (O "BYE")
              buildTeamRow(
                game.teamB?.name,
                game.scoreTeamB,
                isByeOpponent: isBye,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ NOVO: Widget para exibir o vencedor
class _WinnerColumn extends StatelessWidget {
  const _WinnerColumn({required this.winnerName});

  final String winnerName;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('VENCEDOR', style: textTheme.titleMedium),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            color: colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: colorScheme.primary, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.emoji_events, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      winnerName,
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// (Extensão StringExtension permanece igual)
extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}
