// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompetitionDetailsDTO _$CompetitionDetailsDTOFromJson(
  Map<String, dynamic> json,
) => _CompetitionDetailsDTO(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  level: json['level'] as String,
);

Map<String, dynamic> _$CompetitionDetailsDTOToJson(
  _CompetitionDetailsDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'level': instance.level,
};
