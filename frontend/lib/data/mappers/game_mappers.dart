import 'package:playifs_frontend/data/mappers/team_mappers.dart';
import 'package:playifs_frontend/data/models/game/game_details_dto.dart';
import 'package:playifs_frontend/data/models/game/game_reschedule_batch_dto.dart';
import 'package:playifs_frontend/data/models/game/game_reschedule_item_dto.dart';
import 'package:playifs_frontend/data/models/game/game_result_batch_dto.dart';
import 'package:playifs_frontend/data/models/game/game_result_dto.dart';
import 'package:playifs_frontend/data/models/game/game_result_item_dto.dart';
import 'package:playifs_frontend/data/models/game/game_summary_dto.dart';
import 'package:playifs_frontend/data/models/game/game_update_dto.dart';
import 'package:playifs_frontend/data/models/game/game_wo_dto.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';
import 'package:playifs_frontend/domain/entities/game/game_reschedule_batch_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_reschedule_item.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_batch_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_result_item.dart';
import 'package:playifs_frontend/domain/entities/game/game_status.dart';
import 'package:playifs_frontend/domain/entities/game/game_summary.dart';
import 'package:playifs_frontend/domain/entities/game/game_update_input.dart';
import 'package:playifs_frontend/domain/entities/game/game_wo_input.dart';

extension GameSummaryMapper on GameSummaryDTO {
  GameSummary toEntity() => GameSummary(
    id: id.toInt(),
    dateTime: dateTime != null ? DateTime.tryParse(dateTime!) : null,
    status: status.toGameStatus(),
    phase: phase.toGamePhase(),
    teamAName: teamAName,
    teamBName: teamBName,
    createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
    updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
  );
}

extension GameDetailsMapper on GameDetailsDTO {
  GameDetails toEntity() => GameDetails(
    id: id.toInt(),
    dateTime: dateTime != null ? DateTime.tryParse(dateTime!) : null,
    status: status.toGameStatus(),
    phase: phase.toGamePhase(),
    teamA: teamA?.toEntity(),
    teamB: teamB?.toEntity(),
    scoreTeamA: scoreTeamA,
    scoreTeamB: scoreTeamB,
    createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
    updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
  );
}

extension GameUpdateInputMapper on GameUpdateInput {
  GameUpdateDTO toDto() => GameUpdateDTO(
    dateTime: dateTime.toIso8601String(),
  );
}

extension GameResultInputMapper on GameResultInput {
  GameResultDTO toDto() => GameResultDTO(
    scoreTeamA: scoreTeamA,
    scoreTeamB: scoreTeamB,
  );
}

extension GameWoInputMapper on GameWoInput {
  GameWoDTO toDto() => GameWoDTO(
    winnerTeamId: winnerTeamId,
  );
}

extension GameResultItemMapper on GameResultItem {
  GameResultItemDTO toDto() => GameResultItemDTO(
    gameId: gameId,
    scoreTeamA: scoreTeamA,
    scoreTeamB: scoreTeamB,
  );
}

extension GameResultBatchInputMapper on GameResultBatchInput {
  GameResultBatchDTO toDto() => GameResultBatchDTO(
    results: results.map((e) => e.toDto()).toList(),
  );
}

extension GameRescheduleItemMapper on GameRescheduleItem {
  GameRescheduleItemDTO toDto() => GameRescheduleItemDTO(
    gameId: gameId,
    dateTime: dateTime.toIso8601String(),
  );
}

extension GameRescheduleBatchInputMapper on GameRescheduleBatchInput {
  GameRescheduleBatchDTO toDto() => GameRescheduleBatchDTO(
    schedules: schedules.map((e) => e.toDto()).toList(),
  );
}

extension on String {
  GameStatus toGameStatus() {
    switch (this) {
      case 'SCHEDULED':
        return GameStatus.SCHEDULED;
      case 'FINISHED':
        return GameStatus.FINISHED;
      case 'WO':
        return GameStatus.WO;
      default:
        throw ArgumentError('Invalid GameStatus string: $this');
    }
  }

  GamePhase toGamePhase() {
    switch (this) {
      case 'GROUP_STAGE':
        return GamePhase.GROUP_STAGE;
      case 'ROUND_OF_16':
        return GamePhase.ROUND_OF_16;
      case 'QUARTER_FINALS':
        return GamePhase.QUARTER_FINALS;
      case 'SEMI_FINALS':
        return GamePhase.SEMI_FINALS;
      case 'FINAL':
        return GamePhase.FINAL;
      case 'THIRD_PLACE_DISPUTE':
        return GamePhase.THIRD_PLACE_DISPUTE;
      default:
        throw ArgumentError('Invalid GamePhase string: $this');
    }
  }
}