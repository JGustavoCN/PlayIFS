import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';
import 'package:playifs_frontend/domain/entities/game/game_status.dart';

part 'game_summary.freezed.dart';

@freezed
abstract class GameSummary with _$GameSummary {
  const factory GameSummary({
    required int id,
    DateTime? dateTime,
    required GameStatus status,
    required GamePhase phase,
    String? teamAName,
    String? teamBName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _GameSummary;
}