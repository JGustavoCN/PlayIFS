import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/game/game_details_dto.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';

part 'elimination_bracket_dto.freezed.dart';
part 'elimination_bracket_dto.g.dart';

/// Represents the elimination bracket view from the API.
@freezed
abstract class EliminationBracketDTO with _$EliminationBracketDTO {
  /// Default constructor
  const factory EliminationBracketDTO({
    // json_serializable handles enum keys by default, converting them to strings.
    required Map<GamePhase, List<GameDetailsDTO>> rounds,
  }) = _EliminationBracketDTO;

  /// Factory constructor for creating a new DTO instance from a map.
  factory EliminationBracketDTO.fromJson(Map<String, dynamic> json) =>
      _$EliminationBracketDTOFromJson(json);
}