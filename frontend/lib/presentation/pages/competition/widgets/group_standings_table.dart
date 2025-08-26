import 'package:flutter/material.dart';
import 'package:playifs_frontend/domain/entities/competition/group_standings_report.dart';

/// Exibe a tabela de classificação de um único grupo.
class GroupStandingsTable extends StatelessWidget {
  const GroupStandingsTable({super.key, required this.group});

  final GroupStandingsReport group;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(group.groupName, style: textTheme.titleMedium),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 12,
                columns: const [
                  DataColumn(label: Text('Equipa')),
                  DataColumn(label: Text('P'), numeric: true),
                  DataColumn(label: Text('J'), numeric: true),
                  DataColumn(label: Text('V'), numeric: true),
                  DataColumn(label: Text('E'), numeric: true),
                  DataColumn(label: Text('D'), numeric: true),
                  DataColumn(label: Text('SG'), numeric: true),
                ],
                rows: group.standings.map((standing) => DataRow(cells: [
                  DataCell(Text(standing.teamName)),
                  DataCell(Text(standing.points.toString())),
                  DataCell(Text(standing.gamesPlayed.toString())),
                  DataCell(Text(standing.wins.toString())),
                  DataCell(Text(standing.draws.toString())),
                  DataCell(Text(standing.losses.toString())),
                  DataCell(Text(standing.goalDifference.toString())),
                ])).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}