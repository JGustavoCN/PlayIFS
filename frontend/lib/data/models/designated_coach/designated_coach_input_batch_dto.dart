// Ficheiro: lib/data/models/designated_coach/designated_coach_input_batch_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playifs_frontend/data/models/designated_coach/designated_coach_input_dto.dart';

part 'designated_coach_input_batch_dto.freezed.dart';
part 'designated_coach_input_batch_dto.g.dart';

@freezed
abstract class DesignatedCoachInputBatchDTO with _$DesignatedCoachInputBatchDTO {
  const factory DesignatedCoachInputBatchDTO({
    // O nome no DTO do backend é 'coaches', vamos manter a consistência.
    required List<DesignatedCoachInputDTO> coaches,
  }) = _DesignatedCoachInputBatchDTO;

  factory DesignatedCoachInputBatchDTO.fromJson(Map<String, dynamic> json) =>
      _$DesignatedCoachInputBatchDTOFromJson(json);
}