import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_dto.freezed.dart';
part 'page_dto.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PageDTO<T> with _$PageDTO<T> {
  const factory PageDTO({
    required List<T> content,
    required int pageNumber,
    required int totalPages,
    required int totalElements,
  }) = _PageDTO;

  factory PageDTO.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PageDTOFromJson(json, fromJsonT);
}