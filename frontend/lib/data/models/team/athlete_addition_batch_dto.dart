// lib/data/models/team/athlete_addition_batch_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_addition_batch_dto.freezed.dart';
part 'athlete_addition_batch_dto.g.dart';

@freezed
abstract class AthleteAdditionBatchDTO with _$AthleteAdditionBatchDTO {
  /// Data Transfer Object for batch-adding athletes to a team.
  const factory AthleteAdditionBatchDTO({
    required List<int> ids,
  }) = _AthleteAdditionBatchDTO;

  factory AthleteAdditionBatchDTO.fromJson(Map<String, dynamic> json) =>
      _$AthleteAdditionBatchDTOFromJson(json);
}