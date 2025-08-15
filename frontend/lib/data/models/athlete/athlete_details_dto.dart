// Ficheiro: lib/data/models/user/athlete_details_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../shared/link_dto.dart';

part 'athlete_details_dto.freezed.dart';
part 'athlete_details_dto.g.dart';

@freezed
abstract class AthleteDetailsDTO with _$AthleteDetailsDTO {
  const factory AthleteDetailsDTO({
    required int id,
    required String registration,
    required String fullName,
    String? nickname,
    String? phone,
    required String email,

    // CORREÇÃO APLICADA AQUI:
    // Usamos @JsonKey(name: '...') para dizer ao gerador que, no JSON,
    // este campo se chama 'coach'.
    @JsonKey(name: 'coach') required bool isCoach,

    DateTime? createdAt,
    DateTime? updatedAt,
    List<LinkDTO>? links,
  }) = _AthleteDetailsDTO;

  factory AthleteDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$AthleteDetailsDTOFromJson(json);
}