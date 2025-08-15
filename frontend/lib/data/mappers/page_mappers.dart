// lib/data/mappers/page_mappers.dart
import '../../domain/entities/shared/page.dart';
import '../models/shared/page_dto.dart';

extension PageDTOToEntity<T, DTO> on PageDTO<DTO> {
  Page<T> toEntity(T Function(DTO dto) mapper) {
    return Page(
      content: content.map(mapper).toList(),
      totalElements: totalElements,
      totalPages: totalPages,
      number: pageNumber,
    );
  }
}