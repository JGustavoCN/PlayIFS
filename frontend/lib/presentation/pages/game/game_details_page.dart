import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_status.dart';
import 'package:playifs_frontend/domain/entities/team/team_summary.dart';
import 'package:playifs_frontend/presentation/pages/game/widgets/game_action_buttons.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_provider.dart';
import 'package:playifs_frontend/presentation/providers/game/game_action_state.dart';
import 'package:playifs_frontend/presentation/providers/game/game_details_provider.dart';
import 'package:playifs_frontend/presentation/providers/profile/profile_provider.dart';
import 'package:playifs_frontend/presentation/widgets/app_scaffold.dart';
import 'package:playifs_frontend/presentation/widgets/error_display.dart';

class GameDetailsPage extends ConsumerWidget {
  const GameDetailsPage({super.key, required this.gameId});

  final int gameId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameDetailsState = ref.watch(gameDetailsNotifierProvider(gameId));
    final isCoordinator = ref.watch(profileNotifierProvider).value?.roles.contains('ROLE_COORDINATOR') ?? false;

    ref.listen(gameActionNotifierProvider, (previous, next) {
      next.whenOrNull(
        loading: () {
        },
        success: (game) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ação concluída com sucesso!')),
          );
        },
        failure: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro: ${error.toString()}'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        },
      );
    });

    return AppScaffold(
      title: 'Detalhes do Jogo',
      body: gameDetailsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorDisplay(
          error: error,
          onRetry: () => ref.invalidate(gameDetailsNotifierProvider(gameId)),
        ),
        data: (game) => _GameDetailsView(
          game: game,
          isCoordinator: isCoordinator,
        ),
      ),
    );
  }
}

class _GameDetailsView extends StatelessWidget {
  const _GameDetailsView({
    required this.game,
    required this.isCoordinator,
  });

  final GameDetails game;
  final bool isCoordinator;

  @override
  Widget build(BuildContext context) => ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _ScoreCardWidget(game: game),
        const SizedBox(height: 24),
        _GameInfoWidget(game: game),
        if (isCoordinator) ...[
          const Divider(height: 48),
          Text(
            'Painel do Coordenador',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          GameActionButtons(game: game),
        ],
      ],
    );
}

class _ScoreCardWidget extends StatelessWidget {
  const _ScoreCardWidget({required this.game});

  final GameDetails game;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final bool isFinished = game.status == GameStatus.FINISHED || game.status == GameStatus.WO;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _TeamDisplay(
              team: game.teamA,
              score: game.scoreTeamA,
              isWinner: isFinished && (game.scoreTeamA ?? 0) > (game.scoreTeamB ?? 0),
            ),
            Text(
              'vs',
              style: textTheme.headlineMedium?.copyWith(color: colorScheme.primary),
            ),
            _TeamDisplay(
              team: game.teamB,
              score: game.scoreTeamB,
              isWinner: isFinished && (game.scoreTeamB ?? 0) > (game.scoreTeamA ?? 0),
              isBye: game.teamB == null,
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamDisplay extends StatelessWidget {
  const _TeamDisplay({
    this.team,
    this.score,
    this.isWinner = false,
    this.isBye = false,
  });

  final TeamSummary? team;
  final int? score;
  final bool isWinner;
  final bool isBye;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    String displayName = 'A definir';
    if (isBye) {
      displayName = 'BYE (W.O.)';
    } else if (team != null) {
      displayName = team!.name;
    }

    TextStyle nameStyle = textTheme.titleMedium!;
    if (isBye) {
      nameStyle = nameStyle.copyWith(fontStyle: FontStyle.italic, color: colorScheme.onSurfaceVariant);
    } else if (isWinner) {
      nameStyle = nameStyle.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold);
    }

    return Expanded(
      child: Column(
        children: [
          Text(
            displayName,
            style: nameStyle,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Text(
            score?.toString() ?? '-',
            style: textTheme.displaySmall?.copyWith(
              color: isWinner ? colorScheme.primary : colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _GameInfoWidget extends StatelessWidget {
  const _GameInfoWidget({required this.game});

  final GameDetails game;

  @override
  Widget build(BuildContext context) => Column(
      children: [
        ListTile(
          leading: const Icon(Icons.shield_outlined),
          title: const Text('Fase'),
          subtitle: Text(game.phase.name),
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Status'),
          subtitle: Text(game.status.name),
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today_outlined),
          title: const Text('Data e Hora'),
          subtitle: Text(game.dateTime?.toLocal().toString() ?? 'A definir'),
        ),
      ],
    );
}