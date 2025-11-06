import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_wo_input.freezed.dart';

/// Entidade de input para registar um W.O. (PATCH /games/{id}/wo).
@freezed
abstract class GameWoInput with _$GameWoInput {
  /// Construtor de fábrica.
  const factory GameWoInput({
    required int winnerTeamId,
  }) = _GameWoInput;
}