import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_input_dto.freezed.dart';
part 'team_input_dto.g.dart';

@freezed
abstract class TeamInputDTO with _$TeamInputDTO {
  /// Data Transfer Object for creating a new team.
  const factory TeamInputDTO({
    required String name,
    required int competitionId,
    required int sportId,
    required int courseId,
    required int coachId,
    // ✅ ADICIONADO: Campo para o elenco inicial.
    required List<int> athleteIds,
  }) = _TeamInputDTO;

  factory TeamInputDTO.fromJson(Map<String, dynamic> json) =>
      _$TeamInputDTOFromJson(json);
}