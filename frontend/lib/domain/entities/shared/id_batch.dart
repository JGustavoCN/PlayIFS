// lib/domain/entities/shared/id_batch.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_batch.freezed.dart';

/// Represents a batch of entity IDs for bulk operations.
/// This is a core domain entity used across different features.
@freezed
abstract class IdBatch with _$IdBatch {
  const factory IdBatch({
    required List<int> ids,
  }) = _IdBatch;
}