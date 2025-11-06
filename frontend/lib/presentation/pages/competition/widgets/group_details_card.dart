import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playifs_frontend/core/routing/app_routes.dart';
import 'package:playifs_frontend/domain/entities/competition/group_standings_report.dart';
import 'package:playifs_frontend/domain/entities/game/game_status.dart';
import 'package:playifs_frontend/domain/entities/game/game_summary.dart';
import 'package:playifs_frontend/presentation/pages/competition/widgets/group_standings_table.dart';

class GroupDetailsCard extends StatelessWidget {
  const GroupDetailsCard({
    super.key,
    required this.groupReport,
    required this.games,
  });

  final GroupStandingsReport groupReport;
  final List<GameSummary> games;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GroupStandingsTable(group: groupReport),
            if (games.isNotEmpty) ...[
              const SizedBox(height: 12.0),
              const Divider(),
              const SizedBox(height: 12.0),
              Text(
                'Jogos do Grupo',
                style: textTheme.titleMedium
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
              const SizedBox(height: 8.0),
              Column(
                children: games
                    .map((game) => _buildGameTile(context, game))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildGameTile(BuildContext context, GameSummary game) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final bool isFinished = game.status == GameStatus.FINISHED;
    final bool isScheduled = game.status == GameStatus.SCHEDULED;

    final TextStyle teamStyle = textTheme.bodyMedium!;

    final String scoreDisplay = isFinished
        ? 'Finalizado'
        : (isScheduled ? 'vs' : 'Pendente');

    final String dateDisplay = game.dateTime != null
        ? game.dateTime.toString()
        : 'Data a definir';

    return ListTile(
      onTap: () => context.pushNamed(
        AppRoutes.gameDetails,
        pathParameters: {'id': game.id.toString()},
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              game.teamAName ?? 'A definir',
              style: teamStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              scoreDisplay,
              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              game.teamBName ?? 'A definir',
              style: teamStyle,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Text(
        dateDisplay,
        style: textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}