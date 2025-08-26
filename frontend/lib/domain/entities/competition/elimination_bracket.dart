import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/domain/entities/game/game_details.dart';
import 'package:playifs_frontend/domain/entities/game/game_phase.dart';

part 'elimination_bracket.freezed.dart';

/// Represents the elimination bracket view.
@freezed
abstract class EliminationBracket with _$EliminationBracket {
  /// Default constructor
  const factory EliminationBracket({
    required Map<GamePhase, List<GameDetails>> rounds,
  }) = _EliminationBracket;
}