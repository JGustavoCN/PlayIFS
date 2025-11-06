import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_result_item.freezed.dart';

/// Sub-entidade para um item na atualização de resultados em lote.
@freezed
abstract class GameResultItem with _$GameResultItem {
  /// Construtor de fábrica.
  const factory GameResultItem({
    required int gameId,
    required int scoreTeamA,
    required int scoreTeamB,
  }) = _GameResultItem;
}