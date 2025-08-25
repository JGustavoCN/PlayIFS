// lib/data/mappers/id_batch_mappers.dart
import 'package:playifs_frontend/data/models/shared/id_batch_dto.dart';
import 'package:playifs_frontend/domain/entities/shared/id_batch.dart';
// ... outros mappers de 'shared' podem estar aqui

/// Converts the [IdBatch] domain entity to its Data Transfer Object.
extension IdBatchToDTO on IdBatch {
  IdBatchDTO toDTO() => IdBatchDTO(ids: ids);
}