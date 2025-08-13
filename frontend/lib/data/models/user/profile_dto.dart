import 'package:freezed_annotation/freezed_annotation.dart';
import '../shared/link_dto.dart';
import 'athlete_details_dto.dart';
import 'coordinator_details_dto.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
abstract class ProfileDTO with _$ProfileDTO {
  const factory ProfileDTO({
    required int userId,
    required String registration,
    required List<String> roles,
    AthleteDetailsDTO? athleteProfile,
    CoordinatorDetailsDTO? coordinatorProfile,
    // ADICIONE ESTE CAMPO
    List<LinkDTO>? links,
  }) = _ProfileDTO;

  factory ProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileDTOFromJson(json);
}