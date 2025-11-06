import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/game/game_result_item_dto.dart';

part 'game_result_batch_dto.freezed.dart';
part 'game_result_batch_dto.g.dart';

@freezed
abstract class GameResultBatchDTO with _$GameResultBatchDTO {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
  const factory GameResultBatchDTO({
    required List<GameResultItemDTO> results,
  }) = _GameResultBatchDTO;

  factory GameResultBatchDTO.fromJson(Map<String, dynamic> json) =>
      _$GameResultBatchDTOFromJson(json);
}