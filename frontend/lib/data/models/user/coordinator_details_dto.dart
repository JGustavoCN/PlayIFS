// ...
import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/link_dto.dart'; // Importe o novo DTO
part 'coordinator_details_dto.freezed.dart';
part 'coordinator_details_dto.g.dart';


@freezed
abstract class CoordinatorDetailsDTO with _$CoordinatorDetailsDTO {
  const factory CoordinatorDetailsDTO({
    required int id,
    required String registration,
    required String name,
    required String email,
    DateTime? createdAt,
    DateTime? updatedAt,
    // ADICIONE ESTE CAMPO
    List<LinkDTO>? links,
  }) = _CoordinatorDetailsDTO;

  factory CoordinatorDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$CoordinatorDetailsDTOFromJson(json);
}