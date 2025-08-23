// Ficheiro: lib/data/models/designated_coach/designated_coach_input_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'designated_coach_input_dto.freezed.dart';
part 'designated_coach_input_dto.g.dart';

@freezed
abstract class DesignatedCoachInputDTO with _$DesignatedCoachInputDTO {
  const factory DesignatedCoachInputDTO({
    required int competitionId,
    required int sportId,
    required int courseId,
    @JsonKey(name: 'athleteId') required int coachId,
  }) = _DesignatedCoachInputDTO;

  factory DesignatedCoachInputDTO.fromJson(Map<String, dynamic> json) =>
      _$DesignatedCoachInputDTOFromJson(json);
}