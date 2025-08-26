// Ficheiro: lib/data/mappers/page_mappers.dart
import 'package:playifs_frontend/data/models/shared/page_dto.dart';
import 'package:playifs_frontend/domain/entities/shared/page.dart';

/// Extension method genérico para converter um [PageDTO] em uma entidade [Page].
extension PageDtoToEntityExtension<DTO> on PageDTO<DTO> {
  /// Converte o DTO de página na entidade de página, especificando o tipo da Entidade.
  Page<T> toEntity<T>(T Function(DTO dto) mapper) => Page(
      content: content.map(mapper).toList(),
      totalPages: totalPages,
      totalElements: totalElements,
      // O nome da propriedade no PageDTO é 'pageNumber' e na Entidade é 'number'.
      pageNumber: pageNumber,
    );
}