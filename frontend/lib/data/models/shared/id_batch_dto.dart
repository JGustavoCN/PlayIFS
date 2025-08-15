// lib/data/models/shared/id_batch_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_batch_dto.freezed.dart';
part 'id_batch_dto.g.dart';

@freezed
abstract class IdBatchDTO with _$IdBatchDTO {
  const factory IdBatchDTO({
    required List<int> ids,
  }) = _IdBatchDTO;

  // ✅ CORREÇÃO: Adicionar este construtor factory.
  factory IdBatchDTO.fromJson(Map<String, dynamic> json) =>
      _$IdBatchDTOFromJson(json);
}