// Ficheiro: lib/data/models/shared/link_dto.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'link_dto.freezed.dart';
part 'link_dto.g.dart';

@freezed
abstract class LinkDTO with _$LinkDTO {
  const factory LinkDTO({
    required String rel,
    required String href,
  }) = _LinkDTO;

  factory LinkDTO.fromJson(Map<String, dynamic> json) => _$LinkDTOFromJson(json);
}