// Ficheiro: lib/data/models/competition/group_stage_view_dto.dart
// (Validação contra analysis_options.yaml: OK)

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/competition/group_standings_report_dto.dart'; // Verifique o import
// NOVO: Importar o DTO de jogo
import 'package:playifs_frontend/data/models/game/game_summary_dto.dart';

part 'group_stage_view_dto.freezed.dart';
part 'group_stage_view_dto.g.dart';

/// DTO para a visualização da fase de grupos.
@freezed
abstract class GroupStageViewDTO with _$GroupStageViewDTO {
  /// Construtor de fábrica.
  @JsonSerializable(explicitToJson: true)
  const factory GroupStageViewDTO({
    /// A lista de classificações de cada grupo.
    required List<GroupStandingsReportDTO> groups,

    /// ✅ NOVO: A lista de todos os jogos desta fase.
    required List<GameSummaryDTO> games,
  }) = _GroupStageViewDTO;

  /// Construtor de fábrica a partir de JSON.
  factory GroupStageViewDTO.fromJson(Map<String, dynamic> json) =>
      _$GroupStageViewDTOFromJson(json);
}