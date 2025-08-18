// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfigDTO _$AppConfigDTOFromJson(Map<String, dynamic> json) =>
    _AppConfigDTO(
      enums: (json['enums'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => EnumValueDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );

Map<String, dynamic> _$AppConfigDTOToJson(_AppConfigDTO instance) =>
    <String, dynamic>{'enums': instance.enums};
