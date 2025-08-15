// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_batch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IdBatchDTO _$IdBatchDTOFromJson(Map<String, dynamic> json) => _IdBatchDTO(
  ids: (json['ids'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
);

Map<String, dynamic> _$IdBatchDTOToJson(_IdBatchDTO instance) =>
    <String, dynamic>{'ids': instance.ids};
