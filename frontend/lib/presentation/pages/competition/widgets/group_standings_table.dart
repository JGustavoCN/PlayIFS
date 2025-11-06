// Ficheiro: lib/presentation/pages/competition/widgets/group_standings_table.dart
// (Validação contra analysis_options.yaml: OK)

import 'package:flutter/material.dart';
import 'package:playifs_frontend/domain/entities/competition/group_standings_report.dart';

/// Exibe a tabela de classificação de um único grupo.
class GroupStandingsTable extends StatelessWidget {
  /// Construtor padrão.
  const GroupStandingsTable({super.key, required this.group});

  /// O relatório de classificação do grupo.
  final GroupStandingsReport group;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(group.groupName, style: textTheme.titleMedium),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 12,
            // ✅ CORREÇÃO: Menos colunas para melhor foco no telemóvel
            //    Baseado no JSON do Postman
            columns: const [
              DataColumn(label: Text('Equipa')),
              DataColumn(label: Text('P'), numeric: true), // Pontos
              DataColumn(label: Text('V'), numeric: true), // Vitórias
              DataColumn(label: Text('SG'), numeric: true), // Saldo de Gols
            ],
            // ✅ CORREÇÃO: Células alinhadas com os dados reais
            rows: group.standings
                .map((standing) => DataRow(cells: [
              DataCell(Text(standing.teamName)),
              DataCell(Text(standing.points.toString())),
              DataCell(Text(standing.wins.toString())),
              DataCell(Text(standing.goalDifference.toString())),
            ]))
                .toList(),
          ),
        ),
      ],
    );
  }
}