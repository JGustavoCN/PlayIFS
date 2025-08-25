// lib/data/models/team/team_update_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_update_dto.freezed.dart';
part 'team_update_dto.g.dart';

@freezed
abstract class TeamUpdateDTO with _$TeamUpdateDTO {
  /// Data Transfer Object for updating a team's name.
  const factory TeamUpdateDTO({
    required String name,
  }) = _TeamUpdateDTO;

  factory TeamUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$TeamUpdateDTOFromJson(json);
}