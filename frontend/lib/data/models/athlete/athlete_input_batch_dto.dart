// lib/data/models/athlete/athlete_input_batch_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'athlete_input_dto.dart';

part 'athlete_input_batch_dto.freezed.dart';
part 'athlete_input_batch_dto.g.dart';

@freezed
abstract class AthleteInputBatchDTO with _$AthleteInputBatchDTO {
  const factory AthleteInputBatchDTO({
    required List<AthleteInputDTO> athletes,
  }) = _AthleteInputBatchDTO;

  factory AthleteInputBatchDTO.fromJson(Map<String, dynamic> json) =>
      _$AthleteInputBatchDTOFromJson(json);
}