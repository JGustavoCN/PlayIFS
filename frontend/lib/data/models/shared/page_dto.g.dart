// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageDTO<T> _$PageDTOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PageDTO<T>(
  content: (json['content'] as List<dynamic>).map(fromJsonT).toList(),
  pageNumber: (json['pageNumber'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
);

Map<String, dynamic> _$PageDTOToJson<T>(
  _PageDTO<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'content': instance.content.map(toJsonT).toList(),
  'pageNumber': instance.pageNumber,
  'totalPages': instance.totalPages,
  'totalElements': instance.totalElements,
};
