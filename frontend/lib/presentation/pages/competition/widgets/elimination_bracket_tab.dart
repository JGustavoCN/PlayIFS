import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/network/exceptions.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/domain/entities/competition/elimination_bracket.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/generate_stage_button.dart';
import 'package:playifs_frontend/presentation/providers/competition/elimination_bracket_provider.dart';
import 'package:playifs_frontend/presentation/providers/competition/stage_providers_params.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class EliminationBracketTab extends ConsumerStatefulWidget {
  const EliminationBracketTab({super.key, required this.params});

  final StageProvidersParams params;

  @override
  ConsumerState<EliminationBracketTab> createState() =>
      _EliminationBracketTabState();
}

class _EliminationBracketTabState extends ConsumerState<EliminationBracketTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final profileState = ref.watch(profileProvider);
    final isCoordinator =
        profileState.value?.roles.contains('ROLE_COORDINATOR') ?? false;

    final asyncBracket = ref.watch(eliminationBracketProvider(widget.params));

    return asyncBracket.when(
      loading: () {
        final previous = ref.read(eliminationBracketProvider(widget.params));
        if (previous.hasValue && previous.value != null) {
          return _EliminationBracketView(
            bracket: previous.value!,
            tournamentFinished: false,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
      error: (error, _) {
        if (error is ApiException && error.statusCode == 404) {
          if (isCoordinator) {
            return Center(
              child: GenerateStageButton.elimination(params: widget.params),
            );
          }
          return const Center(
            child: Text('O mata-mata ainda não foi gerado pelo coordenador.'),
          );
        }

        return ErrorDisplay(
          error: error,
          onRetry: () =>
              ref.invalidate(eliminationBracketProvider(widget.params)),
        );
      },
      data: (bracket) {
        if (bracket.rounds.isEmpty) {
          if (isCoordinator) {
            return Center(
              child: GenerateStageButton.elimination(params: widget.params),
            );
          }
          return const Center(
            child: Text('O chaveamento ainda não foi gerado.'),
          );
        }

        final finalGames = bracket.rounds[GamePhase.FINAL] ?? [];
        GameDetails? finalGame;
        bool finished = false;

        if (finalGames.isNotEmpty) {
          finalGame = finalGames.first;
          finished = finalGame.status == 'FINISHED';
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _EliminationBracketView(
              bracket: bracket,
              finalGame: finalGame,
              tournamentFinished: finished,
            ),
            if (isCoordinator && !finished)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GenerateStageButton.elimination(params: widget.params),
              ),
          ],
        );
      },
    );
  }
}

// ----------------------
// VISUALIZAÇÃO
// ----------------------

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
            ...sortedPhases.map(
                  (phase) => _BracketRoundColumn(
                phase: phase,
                games: bracket.rounds[phase]!,
              ),
            ),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: textTheme.titleMedium),
          const SizedBox(height: 16),
          Column(
            children: games
                .map((g) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: _BracketGameCard(game: g),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _BracketGameCard extends StatelessWidget {
  const _BracketGameCard({required this.game});

  final GameDetails game;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isBye = game.teamB == null;

    Widget teamRow(String? name, int? score, {bool bye = false}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            bye ? 'BYE' : (name ?? 'A definir'),
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontStyle: bye ? FontStyle.italic : FontStyle.normal,
              color: bye
                  ? colorScheme.onSurfaceVariant
                  : colorScheme.onSurface,
            ),
          ),
        ),
        Text(
          isBye ? (bye ? '0' : 'W') : (score?.toString() ?? '-'),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      child: InkWell(
        onTap: () => context.pushNamed(
          AppRoutes.gameDetails,
          pathParameters: {'id': game.id.toString()},
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              teamRow(game.teamA?.name, game.scoreTeamA),
              const Divider(height: 16),
              teamRow(game.teamB?.name, game.scoreTeamB, bye: isBye),
            ],
          ),
        ),
      ),
    );
  }
}

class _WinnerColumn extends StatelessWidget {
  const _WinnerColumn({required this.winnerName});

  final String winnerName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('VENCEDOR', style: theme.textTheme.titleMedium),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            color: colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: colorScheme.primary, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.emoji_events, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      winnerName,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
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

extension StringX on String {
  String capitalize() =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}
