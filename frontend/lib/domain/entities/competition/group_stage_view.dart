// Ficheiro: lib/domain/entities/competition/group_stage_view.dart
// (Validação contra analysis_options.yaml: OK)

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/competition/group_standings_report.dart';
// NOVO: Importar a entidade de jogo
import 'package:playifs_frontend/domain/entities/game/game_summary.dart';

part 'group_stage_view.freezed.dart';

/// Entidade de domínio para a visualização da fase de grupos.
@freezed
abstract class GroupStageView with _$GroupStageView {
  /// Construtor de fábrica.
  const factory GroupStageView({
    /// A lista de classificações de cada grupo.
    required List<GroupStandingsReport> groups,

    /// ✅ NOVO: A lista de todos os jogos desta fase.
    required List<GameSummary> games,
  }) = _GroupStageView;
}