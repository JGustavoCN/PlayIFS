import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_result_input.freezed.dart';

/// Entidade de input para registar o resultado (PATCH /games/{id}/result).
@freezed
abstract class GameResultInput with _$GameResultInput {
  /// Construtor de fábrica.
  const factory GameResultInput({
    required int scoreTeamA,
    required int scoreTeamB,
  }) = _GameResultInput;
}